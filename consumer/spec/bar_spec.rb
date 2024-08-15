require 'faraday'
require 'pact/consumer/rspec'
require_relative 'pact_helper'

describe "BarClient", :pact => true do
  it "can retrieve a thing"  do
    bar_service.
      upon_receiving("a retrieve thing request").with({
      method: :get,
      path: '/thing',
      headers: {'Accept' => 'application/json'}
    }).
      will_respond_with({
      status: 200,
      headers: { 'Content-Type' => 'application/json' },
      body: {
        company: Pact.like("My big company"),
        factories: Pact.each_like(location: "Sydney", capacity: 5),
        received_at: Pact.term(generate: "2017-10-23T11:50:12Z", matcher: /^\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d([+-][0-2]\d:[0-5]\d|Z)$/),
        received_at_matcher: Pact.like_datetime("2017-10-23T11:50:12Z")
      }
    })

    # This request would normally be performed some BarClient class,
    # but just use simple request for the purposes of this test
    bar_response = Faraday.get(bar_service.mock_service_base_url + "/thing", nil, {'Accept' => 'application/json'})

    # This would normally be checking the results of some deserialisation process,
    # (eg. check for an array of Factory classes )
    # but just check the response code for the purposes of this test
    expect(bar_response.status).to eql 200
  end
end
