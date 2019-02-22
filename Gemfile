source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 3.11'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker'

# Ruby implementation of GraphQL
gem 'graphql'

# A query batching executor for the graphql gem
gem 'graphql-batch'

# Rack Middleware for handling Cross-Origin Resource Sharing (CORS), which makes cross-origin AJAX possible.
gem 'rack-cors', require: 'rack/cors'


group :development do
  # Better error page for Rack apps
  gem 'better_errors'

  # Retrieve the binding of a method's caller in MRI 1.9.2+
  gem 'binding_of_caller'

  gem 'listen', '>= 3.0.5', '< 3.2'

  # Rails >= 3 pry initializer
  gem 'pry-rails'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Step-by-step debugging and stack navigation in Pry
  gem 'pry-byebug'

  # RSpec for Rails-3+
  gem 'rspec-rails', '~> 3.8'

  # A Ruby gem to load environment variables from `.env`.
  gem 'dotenv-rails'

  # Factory Bot <3 Rails
  gem 'factory_bot_rails'

  # Brings back `assigns` and `assert_template` to your Rails tests
  gem 'rails-controller-testing' # If you are using Rails 5.x

  # Simple one-liner tests for common Rails functionality
  gem 'shoulda-matchers', '4.0.0.rc1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
