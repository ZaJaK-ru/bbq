source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'mailjet', :git => 'https://github.com/mailjet/mailjet-gem.git'

gem 'rbnacl', '< 5.0', :require => false
gem 'rbnacl-libsodium', :require => false
gem 'bcrypt_pbkdf', '< 2.0', :require => false

group :development, :test do
  gem 'pry-rails'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
end

group :production do
  gem 'pg', '~> 1.1'
end
