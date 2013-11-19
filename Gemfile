source 'http://rubygems.org'

#gem 'rails', '3.1.0'
#
## Bundle edge Rails instead:
## gem 'rails',     :git => 'git://github.com/rails/rails.git'
#
#gem 'sqlite3'
#
#
## Gems used only for assets and not required
## in production environments by default.
#group :assets do
#  gem 'sass-rails', "  ~> 3.1.0"
#  gem 'coffee-rails', "~> 3.1.0"
#  gem 'uglifier'
#end
#
#gem 'jquery-rails'
#
## Use unicorn as the web server
## gem 'unicorn'
#
## Deploy with Capistrano
## gem 'capistrano'
#
## To use debugger
## gem 'ruby-debug19', :require => 'ruby-debug'
#
#group :test do
#  # Pretty printed test output
#  gem 'turn', :require => false
#end
#
#gem "watu_table_builder", :require => "table_builder"
#
#gem 'rails_12factor', group: :production




gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'pg'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
group :production do
  gem 'sqlite3'
  gem 'pg'
end

group :test do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'              
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'

gem "watu_table_builder", :require => "table_builder"

gem 'rails_12factor', group: :production
