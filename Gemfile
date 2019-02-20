source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jwt'
gem 'figaro'
gem 'rack-cors', require: 'rack/cors'
gem 'pg', '~> 1.1', '>= 1.1.3'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'ffaker'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'annotate'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
  gem 'guard-rspec', require: false
  gem 'rails-erd'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'friendly_id', '~> 5.2.4'
gem 'cancancan', '~> 2.0'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'carrierwave', '~> 1.0'
gem 'cloudinary'
gem 'carrierwave-base64'
