FactoryGirl.define do

  factory :message do
    sequence(:body) {|n| "Message body #{n}"}
    sequence(:from) {|n| "555-555-000#{n}"}
  end

end
