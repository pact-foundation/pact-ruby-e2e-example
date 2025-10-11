# frozen_string_literal: true

require "pact/v2/rspec"

RSpec.describe "Pact::V2::Consumers::Kafka", :pact do
  message_pact_provider "pact-v2-test-app", opts: {
    pact_dir:   File.expand_path('../../pacts', __dir__),
  }

  handle_message "pet message as json" do |provider_state|
    pet_id = provider_state.dig("params", "pet_id")
    with_pact_producer { |client| PetJsonProducer.new(client: client).call(pet_id) }
  end

  handle_message "pet message as proto" do |provider_state|
    pet_id = provider_state.dig("params", "pet_id")
    with_pact_producer { |client| PetProtoProducer.new(client: client).call(pet_id) }
  end
end
