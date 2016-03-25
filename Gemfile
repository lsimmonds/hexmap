source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
gem 'mysql2', '~> 0.3.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', '~> 0.12.1', platforms: :ruby
gem 'sprockets-rails', '~> 2.3.3'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem "figaro"
gem 'warden', '~> 1.2.3'
gem 'devise', '~> 3.5.2'
#gem 'devise', '3.0.0.rc'
gem 'authority', '~> 3.1.0'
gem 'rolify'

#gem 'magiclabs-userstamp', '~> 2.1.0'
#gem 'userstamp', '~> 2.0.1'
gem 'userstamp', :git => 'https://github.com/stricte/userstamp.git', :branch => 'rails4'

gem 'hashable', '~> 0.1.2'

gem "cucumber-rails", '~> 1.4.2', :require => false, :group => [:test]
gem 'shoulda-matchers', '~> 3.0', :require => false, :group => [:test]
group :development, :test do
  # Call 'pry-byebug' anywhere in the code to stop execution and get a pry-byebug console
  gem 'pry-byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails'
  gem "factory_girl_rails"
  gem "database_cleaner", '~> 1.5.1'
  gem "email_spec"
  gem "capybara", '~> 2.5.0'
  gem "selenium-webdriver"
  gem 'capybara-json', '~> 0.4.0'
  gem "json_spec", "~> 1.1.1"
end

