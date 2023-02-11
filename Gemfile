source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'
gem 'pg'

# -----------------------------------------
# Javascript Resources
# -----------------------------------------
gem 'jquery-rails'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"


# -----------------------------------------
# Formating Utilities
# -----------------------------------------
gem 'terser'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
gem "roo", "~> 2.10.0"


# -----------------------------------------
# Authentication and Permissions
# -----------------------------------------
gem 'devise'
gem 'cancancan'


# -----------------------------------------
# Layout and Rendering
# -----------------------------------------
gem 'sass-rails', '>= 6'
gem 'bootstrap-sass', '3.4.1'
gem 'will_paginate-bootstrap', '1.0.1'
gem "administrate"


# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false


group :doc do
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.1.0'
  gem 'factory_girl_rails', '4.6.0'
  gem 'faker'
  gem 'database_cleaner', '1.5.1'
  gem 'letter_opener', '1.4.1'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'guard-rails', '0.7.2', require: false
  gem 'rubocop', '~> 1.42', require: false
  gem 'guard-rubocop'
  gem 'guard-rspec', '4.6.4', require: false
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
