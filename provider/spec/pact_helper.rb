require_relative '../bar_app.rb'

Pact.configuration.reports_dir = "./provider/reports"

Pact.service_provider "Bar" do
  app { BarApp.new }
  app_version '1.2.3'
  publish_verification_results !!ENV['PUBLISH_VERIFICATIONS_RESULTS']

  honours_pact_with 'Foo' do
    pact_uri './consumer/spec/support/foo-bar.json'
  end
end
