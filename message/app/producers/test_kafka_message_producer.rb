require_relative 'test_message_producer'
class TestKafkaMessageProducer < Sbmt::KafkaProducer::BaseProducer
  option :topic, default: -> { "json-topic" }

def publish_message()
  message = TestMessageProducer.new.publish_message()
  sync_publish(message)
end

end