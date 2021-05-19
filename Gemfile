source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.3'
gem 'faker',          '1.7.3'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'carrierwave',             '1.2.2'
gem 'mini_magick',             '4.9.4'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails', '4.3.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem "bootstrap-sass", ">= 3.4.1"
gem 'ransack'
gem 'rails_admin', '~> 1.3'
gem 'cancancan', '~> 2.0'
gem 'rails-i18n'
gem 'font-awesome-rails'
gem "aws-sdk-s3", require: false
gem 'devise-i18n'
gem 'devise-i18n-views'
gem "rails_admin_import", "~> 2.1"
gem 'acts-as-taggable-on', '~> 6.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'paperclip'
  gem 'rails-controller-testing'
end

group :production do
  gem 'pg',  '0.20.0'
  gem 'fog', '1.42'
  gem 'rails_12factor'
end
