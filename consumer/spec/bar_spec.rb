require 'faraday'
require 'pact/consumer/rspec'
require_relative 'pact_helper'

describe "BarClient", :pact => true do

  let(:expected_request_body) do
    '<foo><thing name="bar"/></foo>'
  end

  let(:request_body) do
    '<foo><thing name="WIFFLE"/></foo>'
  end

  let(:expected_response_body) do
    '<foo><thing name="bar"/></foo>'
  end

  it "can create a thing"  do
    bar_service.
      upon_receiving("a retrieve thing request").with({
      method: :post,
      path: '/thing',
      headers: {'Content-Type' => 'application/xml', 'Accept' => 'application/xml'},
      body: expected_request_body
    }).
      will_respond_with({
      status: 201,
      headers: { 'Content-Type' => 'application/xml' },
      body: expected_response_body
    })

    # This request would normally be performed some BarClient class,
    # but just use simple request for the purposes of this test

    bar_response = Faraday.post(bar_service.mock_service_base_url + "/thing", request_body, {'Content-Type' => 'application/xml', 'Accept' => 'application/xml'})

    # This would normally be checking the results of some deserialisation process,
    # (eg. check for an array of Factory classes )
    # but just check the response code for the purposes of this test
    expect(bar_response.status).to eql 201
  end
end
