source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.3'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'active_model_serializers'

gem 'ffaker'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry'

  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'database_cleaner', '~> 1.5'
  gem 'rspec-rails'
  gem 'capybara', '~> 2.5'
  gem 'factory_girl_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
