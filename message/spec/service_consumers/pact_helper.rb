# Defines the relationship between the producer and consumer, specifies which contract they use.
# IRL this would live in a seperate pact_spec_helper.rb file in the repo where the producer lives.
# Notice this is very similar to the definition of service_providers (e.g. APIs) in standard HTTP CDCT.  
# The difference here is we use the keyword message_provider.
# The pact_uri points to a local file, but this contract could exist in a remote location or in a Pact Broker.

require_relative '../../app/producers/test_message_producer.rb'
require_relative '../service_consumers/provider_states_for_test_message_consumer.rb'
require 'pact/message'

Pact.message_provider "Test Message Provider" do

  # Explictly creates an instance of the producer. 
  # This might be different to how we create instances of rails/rack APIs in HTTP Pact. 
  Producer = TestMessageProducer.new

  # This matches the usage in HTTP Pact. 
  honours_pact_with "Test Message Consumer" do
    pact_uri "spec/pacts/test_message_consumer-test_message_producer.json"
  end

  # Create a hash of all the messages the producer needs to publish to meet the preconditions of the contract files it is referenced in.
  # This is the recommended approach in the pact-message-ruby documentation. See https://github.com/pact-foundation/pact-message-ruby
  MESSAGES = {
    "a customer created message" => lambda { Producer.publish_message }
  }
  
  # Builder which populates the hash.
  # Calls the lambda above, which calls the Producer.publish_message method.
  # See app/producers/test_message_producer.rb.
  # The producer publishes a message (json). 
  # The message is used in the dynamically generated RSpec tests to verify the contract provided by the consumer. 
  builder do |message_description|
    MESSAGES[message_description].call
  end

  #Execute the following to run the provider side verification on the contract files in spec/pacts: 
  # bundle exec rake pact:verify
  # The pact verification tool will do the following:
  # 1. Read the contract files (pact files) in spec/pacts.
  # 2. Setup the required pre-requiste test state (provider states) referenced in the contract files.
  # 3. Dynamically generate and execute RSpec tests based on the content of the contract files.

end