source "http://rubygems.org"

if ENV['X_PACT_DEVELOPMENT']
  gem "pact", path: '../pact'
  gem "pact-support", path: '../pact-support'
  gem "pact-mock_service", path: '../pact-mock_service'
else
  gem "pact", "~> 1.63"
end

gem "pact_broker-client"
gem "rake", "~> 13"
gem "rspec", "~> 3"
gem "faraday", "~> 1.0", "< 3.0"
gem "pry-byebug", "~> 3"
