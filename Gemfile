source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'

gem 'rails', '~> 5.0.1'
gem 'bootstrap-sass', '3.3.6'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'font-awesome-sass', '~> 4.6', '>= 4.6.2'
gem 'faker', '~> 1.7', '>= 1.7.3'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'rails-erd'
gem 'cancancan'
gem 'animate-rails'
gem 'wow-rails', '~> 0.0.1'
gem 'jquery-easing-rails'
gem 'delayed_job_active_record'
gem 'delayed_job_web'
gem 'sinatra', '2.0.0.beta2'
gem 'active_model_serializers'

gem 'rails_12factor', group: :production



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
