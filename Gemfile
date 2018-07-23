source "http://rubygems.org"

if ENV['X_PACT_DEVELOPMENT']
  gem "pact", path: '../pact'
  gem "pact-support", path: '../pact-support'
  gem "pact-mock_service", path: '../pact-mock_service'
  gem "pact-xml", path: '../pact-xml'
else
  gem "pact", "~> 1.12"
  gem "pact-xml", git: "https://github.com/pact-foundation/pact-xml.git"
  gem "pact-support", git: "https://github.com/pact-foundation/pact-support.git"
end

gem "pact_broker-client"
gem "rake", "~> 12.0"
gem "rspec", "~> 3.6"
gem "faraday", "~> 0.12"
gem "pry-byebug", "~> 3.4"
