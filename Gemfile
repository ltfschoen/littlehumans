source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# added bootstrap for SASS as described at https://github.com/twbs/bootstrap-sass
gem 'bootstrap-sass', '~> 3.1.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'underscore'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# images an partials to work on heroku. run bundle install
group :production do
  gem "rails_12factor"
end

gem 'devise'

# gem used to get twitter oauth working successfully
gem "omniauth-twitter"

# gem used to get facebook oauth working 
gem 'omniauth-facebook'

# gem used to get google oauth working 
gem 'omniauth-google-oauth2'

# gem to allow multiple authentication (i.e. both facebook and twitter)
# https://github.com/intridea/omniauth
gem 'omniauth'

# allows use env for secret keys
group :development, :test do
  gem 'dotenv-rails'
end

# testing gems 
group :test do

	gem 'rspec-rails'

	gem 'capybara'

	# for better tests
	gem 'shoulda'
	
	# mocking and stubbing
	gem 'mocha'

	# added simplecov to see how much code is covered by our tests
	gem 'simplecov', :require => false

	# testing with fake users in rspec
	gem 'factory_girl'

	gem 'pry-rails'

	# allows binding.pry in rails
	gem 'pry-debugger', '~> 0.2.2'

end

# allows access to Google Calendar
gem 'httparty'

# allows access to Twitter Feeds
gem 'twitter', '~> 5.8.0'

# allows extract URL, hashtag from tweets
gem 'twitter-text'

# gem to modify Google Calendar but requires logging in
gem 'google_calendar'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
