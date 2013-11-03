source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'mysql2'
gem 'thin'
gem 'haml-rails'
gem 'twilio-ruby'
gem 'coffee-filter'
gem 'rails_config'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'font-awesome-sass'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'spine-rails'
gem 'dynamic_form'
gem 'simple_form'
gem 'kaminari'
gem 'paperclip'
gem 'airbrake'
# Included by capistrano-resque but needs upgrade
gem 'resque-scheduler', git: 'https://github.com/resque/resque-scheduler.git'
gem 'resque'
gem 'aasm'

# Authorization
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem 'bcrypt-ruby'


group :development do
  gem 'sextant'
  gem "capistrano"
  gem 'capistrano-resque'
  gem "capistrano-ext"
end

group :test do
  gem 'minitest', require: 'minitest/autorun'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'mocha', require: 'mocha/setup'
  gem 'resque_unit'
  gem 'timecop'
end

group :autotest do
  gem 'autotest-standalone'
  gem 'autotest-rails-pure'
  gem 'autotest-growl'
  gem 'autotest-fsevent'
end