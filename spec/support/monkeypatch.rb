puts "MONKEYPATCHING!"

class PreMonkeypatchTest
  include Pact::Consumer::RackRequestHelper
end

unless PreMonkeypatchTest.new.respond_to?(:standardise_header, true)
  raise "Can't find method Pact::Consumer::RackRequestHelper.standardise_header to monkeypatch"
end

module Pact::Consumer::RackRequestHelper
  def standardise_header header
    header.gsub(/^HTTP_/, '').downcase
  end
end
