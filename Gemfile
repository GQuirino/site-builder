source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'active_model_serializers'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'

gem 'bootsnap', '>= 1.4.2', require: false


group :development, :test do
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'pry-rails', '~> 0.3.9'
end

group :test do
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'simplecov', require: false
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

