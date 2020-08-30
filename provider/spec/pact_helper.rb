require_relative '../bar_app.rb'

Pact.configuration.reports_dir = "./provider/reports"

Pact.service_provider "Bar" do
  app { BarApp.new }
  app_version '1.2.3'
  publish_verification_results !!ENV['PUBLISH_VERIFICATIONS_RESULTS']

  honours_pacts_from_pact_broker do
    pact_broker_base_url 'https://test.pactflow.io', { username: 'dXfltyFMgNOFZAxr8io9wJ37iUpY42M', password: 'O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1'}

    consumer_version_tags ['master', 'production']
  end
end
