# frozen_string_literal: true

source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3.2"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft", "~> 0.8.0"

# gem 'dartsass-rails'

# Use mysql as the database for Active Record
# gem 'mysql2', '~> 0.5.6'
# Use postgresql as the database for Active Record
gem "pg", "~> 1.5.6"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.4.2"

# HTTP/2 proxy
gem "thruster", "~> 0.1.3"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", "~> 2.0.5"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", "~> 1.3.3"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.12.2"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "~> 1.18.3", require: false

gem "cssbundling-rails", "~> 1.4.0"
gem "jsbundling-rails", "~> 1.3.0"

# view component
gem "view_component", "~> 3.12.1"

# Shrine
gem "aws-sdk-s3", "~> 1.147.0"
gem "image_processing", "~> 1.12.2"
gem "shrine", "~> 3.5.0"

# i18n
gem "rails-i18n", "~> 7.0.9"

# error page handling
gem "rambulance", "~> 3.1.0"

# authentication
gem "sorcery", "~> 0.16.5"
gem "sorcery-jwt", "~> 0.1.13"

gem "googleauth", "~> 1.11.0"

# settings
gem "config", "~> 5.4.0"

# paging
gem "pagy", "~> 8.2.1"
# gem 'bootstrap5-kaminari-views'
# gem 'kaminari', '~> 1.2.2'

# tags
# gem "acts-as-taggable-on", github: "mbleigh/acts-as-taggable-on"
gem "acts-as-taggable-on", "~> 10.0.0"

# json
gem "jsonapi-serializer", "~> 2.2.0"

# Rack::Locale
gem "rack-contrib", "2.4.0"

# cors
gem "rack-cors", "~> 2.0.2"

# soft delete
gem "discard", "~> 1.3.0"

# management console
gem "rails_admin", github: "railsadminteam/rails_admin"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "debug", "~> 1.9.1", platforms: %i[mri windows]
  # Ruby style guide, linter, and formatter
  gem "rspec-rails", "~> 6.1.1"
end

group :development do
  gem "brakeman", "~> 6.1.2"
  gem "bullet", "~> 7.1.6"
  gem "pg_query", "~> 5.1.0"
  gem "prosopite", "~> 1.4.2"

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", "~> 4.2.1"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  gem "annotate", "~> 3.2.0"
  gem "rails-erd", "~> 1.7.2"

  gem "rubocop-rails-omakase", "~> 1.0.0", require: false
  # Shopify/erb-lint
  gem "erb_lint", "~> 0.5.0", require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", "~> 3.40.0"
  gem "selenium-webdriver", "~> 4.18.1"
end
