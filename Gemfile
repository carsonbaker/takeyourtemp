source 'https://rubygems.org'
ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',             '~> 6.0.2.1'
# Use Puma as the app server
gem 'puma',              '~> 3.12.0'
# Use SCSS for stylesheets
gem 'sass-rails',        '~> 5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',          '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'

# Memcaching
gem 'dalli',             '~> 2.7'

# Browser
gem 'browser'

# Stop bots
gem "recaptcha"

group :staging, :production do
  gem "bugsnag",           '~> 6.8'
end

group :development, :test do
  gem 'pry'
  gem 'dotenv-rails' # enables importing of .env variables
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Haml templating
gem 'hamlit'

# Postgres
gem 'pg'

# Email delivery
gem 'aws-sdk-ses',         '~> 1.17.0'
gem 'aws-sdk-s3',          '~> 1.34.0'
gem 'aws-sdk-rails',       '~> 2.1.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
