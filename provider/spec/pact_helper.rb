require_relative '../bar_app.rb'

Pact.configuration.reports_dir = "./provider/reports"

Pact.service_provider "Bar" do
  app { BarApp.new }
  app_version '1.2.3'
  app_version_tags ['master']
  publish_verification_results !!ENV['PUBLISH_VERIFICATIONS_RESULTS']

  honours_pacts_from_pact_broker do
    pact_broker_base_url ENV['PACT_BROKER_BASE_URL'], { username: ENV['PACT_BROKER_USERNAME'], password: ENV['PACT_BROKER_PASSWORD']}
    enable_pending true
    verbose true

  end
end
