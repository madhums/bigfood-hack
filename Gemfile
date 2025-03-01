source "https://rubygems.org"

ruby "3.3.0"

# Rails core
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "pg", "~> 1.1"        # Use postgresql as the database for Active Record
gem "puma", ">= 5.0"      # Use the Puma web server [https://github.com/puma/puma]

# Authentication
gem "devise", "~> 4.9"
gem "devise_invitable", "~> 2.0"

# Authorisation
gem "pundit", "~> 2.3"

# Forms
gem "bootstrap_form", "~> 5.4"

# Frontend related
gem "sprockets-rails"     # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "jsbundling-rails"    # Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "turbo-rails"         # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "stimulus-rails"      # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "cssbundling-rails"   # Bundle and process CSS [https://github.com/rails/cssbundling-rails]

# Admin
gem "administrate", "~> 0.20.1"
gem "administrate-field-jsonb", "~> 0.4.6"

# Background jobs
gem "solid_queue", "~> 1.0.0"
gem "mission_control-jobs", "~> 0.3.1"

# Misc
gem "tzinfo-data", platforms: %i[windows jruby]   # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "bootsnap", require: false                    # Reduces boot times through caching; required in config/boot.rb
gem "redis", ">= 4.0.1"                           # Use Redis adapter to run Action Cable in production
gem "jbuilder"                                    # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "rack-cors", "~> 2.0"                         # cors

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]
  gem "standard", "~> 1.35"
  gem "standard-rails", "~> 1.0"
  gem "dotenv-rails", "~> 3.1"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem "dockerfile-rails", ">= 1.6"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

gem "httparty", "~> 0.22.0"

gem "groupdate", "~> 6.5"

gem "ruby-openai", "~> 7.4"

gem "nokogiri", "~> 1.16"
gem "httpx", "~> 1.4"
