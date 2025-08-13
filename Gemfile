source "https://rubygems.org"

gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "sqlite3", ">= 1.4"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "brakeman", require: false
  gem "bullet"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "rubocop-rails-omakase", require: false
end

group :test do
  gem "faker"
  gem "rspec-rails", "~> 6.1"
end
