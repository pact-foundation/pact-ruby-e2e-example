# frozen_string_literal: true

require "pact/v2/rspec"

RSpec.describe "Pact::V2::Consumers::Grpc", :pact do
  grpc_pact_provider "pact-v2-test-app", opts: {
    grpc_port: 3009,
    pact_dir: File.expand_path('../../pacts', __dir__),
  }
end
