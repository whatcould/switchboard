class OutgoingMessageJob
  @queue = :outgoing

  def self.perform(list_id, to, from, message_body, message_id = nil, outgoing_count = nil)
    if to.include?('@')
      send_email(to, body: message_body, from: from)
      # Not counting emails in list counts
      self.increment_message_count(message_id, outgoing_count) if message_id
    else
      begin
        response = TwilioClient.send_sms(to, message_body, from)
        if ENV['LOG_TWILIO']
          SentTwilioMessage.create(list_id: list_id, to: to, twilio_id: response.sid)
        end
        List.increment_sms_count(list_id)
        self.increment_message_count(message_id, outgoing_count) if message_id
      rescue => e
        Rollbar.error(e)
        raise
      end
    end
  end

  def self.increment_message_count(message_id, outgoing_count)
    current_count = Message.increment_outgoing_count(message_id)
    Message.find(message_id).mark_sent! if current_count == outgoing_count
  end

  # Needs work
  def self.send_email(to, opts = {})
    opts[:server]      ||= 'localhost'
    opts[:from]        ||= ''
    opts[:from_alias]  ||= 'Switchboard'
    opts[:subject]     ||= ""
    opts[:body]        ||= ""

    msg = <<END_OF_MESSAGE
From: #{opts[:from_alias]} <#{opts[:from]}>
To: <#{to}>
Subject: #{opts[:subject]}

#{opts[:body]}
END_OF_MESSAGE

    Net::SMTP.start(opts[:server]) do |smtp|
      smtp.send_message(msg, opts[:from], to)
    end
  end

end