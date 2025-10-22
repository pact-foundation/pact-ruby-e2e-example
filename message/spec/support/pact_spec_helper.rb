# Not sure if this is the correct way to implement a mock message producer in pact-message-ruby.

# Defines the relationship between the consumer and producer.
# Defines a mock producer for the consumer to test against.
# IRL this would live in a seperate pact_spec_helper.rb file in the repo where the consumer lives

Pact.message_consumer "Test Message Consumer" do
  has_pact_with "Test Message Producer" do
    mock_provider :test_message_producer do
      pact_specification_version '3'
    end
  end
end
