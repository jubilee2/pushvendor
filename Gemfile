source 'https://rubygems.org'

gem 'rails', '>= 5.0.0.rc2', '< 5.1'
gem 'puma', '~> 3.0'
gem 'pg'

# -----------------------------------------
# Javascript Resources
# -----------------------------------------
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'


# -----------------------------------------
# Formating Utilities
# -----------------------------------------
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'


# -----------------------------------------
# Authentication and Permissions
# -----------------------------------------
gem 'devise', '4.1.0'
gem 'cancancan', '1.13.1'


# -----------------------------------------
# Layout and Rendering
# -----------------------------------------
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '3.3.6'
gem 'will_paginate-bootstrap', '1.0.1'


group :doc do
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'spring'
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '3.1.0'
  gem 'factory_girl_rails', '4.6.0'
  gem 'faker', '1.6.3'
  gem 'database_cleaner', '1.5.1'
  gem 'letter_opener', '1.4.1'
  gem 'capybara', '2.6.2'
  gem 'sqlite3', '~> 1.3.6'
end

group :development do
  gem 'better_errors', '2.1.1'
  gem 'binding_of_caller', '0.7.2'
  gem 'web-console'
  gem 'guard-rails', '0.7.2', require: false
  gem 'rubocop', '0.37.2', require: false
  gem 'guard-rubocop', '1.2.0'
  gem 'guard-rspec', '4.6.4', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
