source "https://rubygems.org"

gem "rails", "~>4"

gem "exception_notification"

gem "capistrano"
gem "sshkit"
gem "open4"
gem "syntax"
gem "version_fu"
gem "devise"
gem "devise-encryptable"
gem "rails_12factor"

group :development do
  gem "thin"

  gem "capistrano-rails"
  gem "capistrano-rbenv"
  gem "capistrano-bundler"
  gem "capistrano-passenger"
  gem "pry"
  gem "pry-rails"
end

group :test do
  gem "test-unit"
  gem "mocha", :require => false
  gem "factory_girl_rails"
  gem "database_cleaner"
end

group :development, :test do
  gem "sqlite3"
end

group :production do
  gem "mysql2"
  gem "pg"
  gem "unicorn"
  gem "puma"
end

group :assets do
  gem "jquery-rails"
  gem "turbolinks"
  gem "uglifier"
  gem 'therubyracer'
end

if File.exists?('config/Gemfile.extras')
  eval File.read('config/Gemfile.extras')
end
