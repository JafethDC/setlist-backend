source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bcrypt'
gem 'bootsnap', '>= 1.1.0', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'faker' # A library for generating fake data such as names, addresses, and phone numbers.
gem 'graphql' # Ruby implementation of GraphQL
gem 'graphql-batch' # A query batching executor for the graphql gem
gem 'jwt' # A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'pg', '>= 0.18', '< 2.0' # Use postgresql as the database for Active Record
gem 'puma', '~> 3.11' # Use Puma as the app server
gem 'rack-cors', require: 'rack/cors' # Rack Middleware for handling Cross-Origin Resource Sharing (CORS), which makes cross-origin AJAX possible.
gem 'rails', '~> 5.2.2' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem


group :development do
  gem 'better_errors' # Better error page for Rack apps
  gem 'binding_of_caller' # Retrieve the binding of a method's caller in MRI 1.9.2+
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails' # Rails >= 3 pry initializer
  gem 'spring' # Spring speeds up development by keeping your application running in the background.
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'dotenv-rails' # A Ruby gem to load environment variables from `.env`.
  gem 'factory_bot_rails' # Factory Bot <3 Rails
  gem 'pry-byebug' # Step-by-step debugging and stack navigation in Pry
  gem 'rails-controller-testing' # Brings back `assigns` and `assert_template` to your Rails tests
  gem 'rspec-rails', '~> 3.8' # RSpec for Rails-3+
  gem 'shoulda-matchers', '4.0.0.rc1' # Simple one-liner tests for common Rails functionality
end
