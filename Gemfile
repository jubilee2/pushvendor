source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.7'
gem 'puma', '~> 3.7'
gem 'pg'

# -----------------------------------------
# Javascript Resources
# -----------------------------------------
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'


# -----------------------------------------
# Formating Utilities
# -----------------------------------------
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'


# -----------------------------------------
# Authentication and Permissions
# -----------------------------------------
gem 'devise'
gem 'cancancan'


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
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '3.1.0'
  gem 'factory_girl_rails', '4.6.0'
  gem 'faker'
  gem 'database_cleaner', '1.5.1'
  gem 'letter_opener', '1.4.1'
  gem 'capybara', '>= 2.15'
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
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
