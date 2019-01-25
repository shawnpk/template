# rails new myapp -m template.rb

gem 'devise'
gem 'active_model_serializers'
gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
end
gem_group :development do
  gem 'better_errors'
end

run 'bundle install'
generate(:scaffold, 'user', 'name')
generate('devise:install')
generate('devise', 'User')
generate(:controller, 'welcome', 'index')

environment 'config.action_mailer.default_url_options = { host: "localhost", port: 3000 }', env: 'development'
environment 'config.action_mailer.default_url_options = { host: "https://example.com", port: 3000 }', env: 'production'

after_bundle do
  rails_command('db:migrate')

  git :init
  git add: '.'
  git commit: '-m "Initialize repository"'
end

route "root to: 'welcome#index'"
