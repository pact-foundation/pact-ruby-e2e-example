# frozen_string_literal: true

require 'pact/v2/rspec'
require_relative '../../../bar_app'

RSpec.describe 'Verify consumers for Bar Provider', :pact do

  http_pact_provider 'Bar', opts: { 

    # rails apps should be automatically detected
    # if you need to configure your own app, you can do so here

    app: BarApp.new,
    # start rackup with a different port. Useful if you already have something
    # running on the default port *9292*
    http_port: 9393, 
    
    # Set the log level, default is :info
  
    # log_level: :debug,
    
    # fail_if_no_pacts_found: true,

    # Pact Sources

    # Local pacts from a directory
    # Default is File.expand_path('../../../spec/pacts', __dir__)
    
    pact_dir: File.expand_path('../../../../consumer/spec/pacts', __dir__),
    
    
    # Broker pacts

    # Broker credentials
  
    # broker_username: "pact_workshop", # can be set via PACT_BROKER_USERNAME env var
    # broker_password: "pact_workshop", # can be set via PACT_BROKER_PASSWORD env var
    # broker_token: "pact_workshop", # can be set via PACT_BROKER_TOKEN env var
  
    # Remote pact via a uri, traditionally triggered via webhooks
    # when a pact that requires verification is published
  
    # can be set via PACT_URL env var
    # pact_uri: "http://localhost:9292/pacts/provider/Bar/consumer/Foo/latest",
    
    # to dynamically fetch pacts from a broker
    # broker_url: "http://localhost:9292", # can be set via PACT_BROKER_URL env var

    # these are the default consumer_selectors from the broker verification endpoint
    # if you don't set them via consumer_selectors in ruby
    # consumer_selectors: [{"deployedOrReleased" => true, "mainBranch" => true, "matchingBranch" => true}],
 
    # addition dynamic selection verification options
 
    # enable_pending: true,
    # include_wip_pacts_since: "2021-01-01",
  

    # Publish verification results to the broker
  
    publish_verification_results: ENV['PACT_PUBLISH_VERIFICATION_RESULTS'] == 'true',
    provider_version: `git rev-parse HEAD`.strip,
    # provider_version: `git rev-parse HEAD`.strip,
    # provider_version_branch: `git rev-parse --abbrev-ref HEAD`.strip,
    # provider_build_uri: "YOUR CI URL HERE",
    
  }


end
