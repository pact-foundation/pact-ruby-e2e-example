require 'pact/consumer/rspec'
require 'pact/xml'

Pact.configuration.pact_dir = File.dirname(__FILE__) + "/pacts"

Pact.configure do | config |
  config.register_body_differ /xml/, Pact::XML::Differ
  config.register_diff_formatter /xml/, Pact::XML::DiffFormatter
end

Pact.service_consumer "Foo" do
  has_pact_with "Bar" do
    mock_service :bar_service do
      pact_specification_version "3"
      port 4638
    end
  end
end
