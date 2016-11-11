source "https://rubygems.org"

gem "rails", "~>4"

gem "exception_notification"

gem "capistrano", '~>2'
gem "sshkit"
gem "open4"
gem "syntax"
gem "version_fu"
gem "devise"
gem "devise-encryptable"
gem "jquery-rails"
gem "turbolinks"
gem "uglifier"
gem 'therubyracer', :platforms => :ruby

group :development do
  gem "pry"
  gem "pry-rails"
end

group :test do
  gem "mocha", :require => false
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "simplecov"
  gem "codeclimate-test-reporter", "~> 1.0.0", require: nil
end

group :development, :test do
  gem "sqlite3"
end

group :production do
  gem "mysql2"
  gem "pg"
  gem "puma"
  gem "rails_12factor"
end

if File.exists?('config/Gemfile.extras')
  eval File.read('config/Gemfile.extras')
end
