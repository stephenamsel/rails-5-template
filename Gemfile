source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'sqlite3'
gem 'pg', "1.0"
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
#gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'jbuilder', '~> 2.5'

# gem 'bcrypt', '~> 3.1.7' # Use ActiveModel has_secure_password
gem 'bootsnap', '>= 1.1.0', require: false

gem "haml-rails", "~> 2.0"
gem 'rubyzip'
gem 'zip-zip'
gem 'andand' # Enable "andand" command in development
gem "aws-sdk-s3", require: false
gem 'aws-sdk-rails'
gem 'activerecord-import'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# JS tools
gem 'jquery-rails'
gem 'jquery-ui-rails'

#forms
#gem 'bootstrap', '~> 4.3.1' #- already included by Spree
gem "bootstrap_form", ">= 4.2.0"
gem 'simple_form', '~> 4.1'
gem 'country_select', '~> 4.0'
gem 'bootstrap3_autocomplete_input'

#presentation
gem 'browser', '~> 2.5.3'
gem 'time_difference', '~> 0.7' #get difference with Time objects
gem 'order_as_specified', '~> 1.6'
gem 'timezone', '~> 1.3'

gem 'paper_trail', '~> 10.3'
gem 'wicked_pdf', '~> 1.4'
gem 'wkhtmltopdf-binary', '~> 0.12.4' #https://github.com/mileszs/wicked_pdf
gem 'que', '~> 0.14'
gem 'paranoia'

#SEO
gem 'meta-tags', '~> 2.11.1'
#gem "actionpack-page_caching" #apparently now bundled into Rails - configuration already in defaults
gem 'premailer-rails', '~> 1.10.2'

# Reduces boot times through caching; required in config/boot.rb


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails', '~> 2.7.2' #building Environment Variables from a file
  gem 'rspec-rails', '~> 3.8' #test-suite, can run Selenium in it
  gem 'database_cleaner', '~> 1.7' #helper for rspec-testing  
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
