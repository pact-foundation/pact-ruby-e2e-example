# frozen_string_literal: true

require "pact/v2/rspec"

RSpec.describe "Pact::V2::Consumers::Http", :pact do
  http_pact_provider "pact-v2-test-app", opts: {
    http_port: 3000,
    log_level:  :info,
    pact_dir:   File.expand_path('../../pacts', __dir__),
  }
end
