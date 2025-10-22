require 'pact/message/consumer/rspec'
require 'pact/consumer'
require 'pact/reification'
require 'support/pact_spec_helper.rb'
require_relative '../app/consumers/test_message_consumer.rb'

describe TestMessageConsumer, :pact do

  subject(:consumer) {TestMessageConsumer.new}

  # Notice that the expected message payload has fields which are different to that of the actual producer.
  # The TestMessageProducer actually sends a message with an additional 'title' field and a renamed 'surname' field.
  # See app/producers/test_message_producer.rb.

  expected_payload = {
    "email": Pact.like("jane@example.com"),
    "first_name": Pact.like("Jane"),
    # "last_name": Pact.like("Doe") # uncomment to see failure in provider code
  }

  # Notice the new pact: :message decorator/metadata 

  describe "Test Message Consumer", pact: :message do
    before do
    
      # Here we are calling test_message_producer, which is mocking the actual TestMessageProducer defined in app/producers/test_message_producer.rb.
      # In pact-message we use mocked providers in consumer side tests. These are defined in a similar way to mocked APIs/service providers in standard HTTP CDCT.
      # See spec/support/pact_spec_helper.rb.

      test_message_producer.given("A customer is created")
      .is_expected_to_send("a customer created message")
      # .with_metadata()
      # .with_content(Pact.like(expected_payload.to_json))
      .with_content(expected_payload)

      test_message_producer.send_message_string do | content_string |
        @message = consumer.consume_message(content_string)
      end

    end

    # This test is a bit redundant, it's essentially marking our own homework and will always pass.
    # However IRL the consumer would probably be doing something more complex which we could assert on.
    # See spec/pacts/test_message_consumer-test_message_producer.json for the generated contract file.
    # Note that this contract does not match what the producer outputs in app/producers/test_message_producer.rb..
    # If we were to run producer side verification on this contract, it should fail. 
    # This failure would indicate a mismatch between the consumers expectations of the message format and what the producer actually sends.

    it "Successfully consumes the message and creates a pact contract file" do
      expect(@message).to eq(Pact::Reification.from_term(expected_payload).to_json)
    end

  end

end