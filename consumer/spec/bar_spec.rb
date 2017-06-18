require 'faraday'
require 'pact/consumer/rspec'
require_relative 'pact_helper'

describe "BarClient", :pact => true do
  it "can retrieve a thing"  do
      bar_service.
        upon_receiving("a retrieve thing request").with({
        method: :get,
        path: '/thing',
        headers: {'Accept' => Pact.term(/application\/.*json/, "application/json")}
      }).
        will_respond_with({
        status: 200,
        headers: { 'Content-Type' => 'application/json' },
        body: {
          thing: Pact.like({test: "My thing", bar: "Another thing"}),
          array: Pact.each_like(1),
          nested: {
            long: {
              path: {
                to: {
                  a: {
                    person: {
                      firstName: 'Foo',
                      lastName: 'Bar',
                      driversLicence: Pact.term(/ABC\d+/, "ABC567")
                    }
                  }
                }
              }
            }
          },
          address: {
            street: "200 Bourke St",
            suburb: "Melbourne"
          },
          phone: "0412 746 345",
          mother: "Mary",
          father: nil,
          favouriteColours: ["red"],
          favouriteMovies: ["Jaws", "The Sound of Music"],
          children: Pact.each_like(name: "Susan", age: 7),
          parents: [{name: "Adam"}, {name: "Eve"}]
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
