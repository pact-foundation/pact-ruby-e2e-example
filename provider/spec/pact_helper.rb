require_relative '../bar_app.rb'

Pact.configuration.reports_dir = "./provider/reports"

Pact.service_provider "Bar" do
  app { BarApp.new }
  app_version '1.2.3'
  publish_verification_results true


  honours_pacts_from_pact_broker do
    pact_broker_base_url ENV.fetch('PACT_BROKER_BASE_URL')
    consumer_version_selectors [{ tag: 'doesnotexist', fallback_tag: 'main', latest: true }, { tag: 'main', latest: true }, { tag: 'feat/foo', latest: true }]
    verbose true
  end
end
