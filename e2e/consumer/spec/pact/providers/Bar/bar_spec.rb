require 'pact/v2/rspec'
require 'faraday'

RSpec.describe 'BarClient', :pact do
  has_http_pact_between 'Foo', 'Bar'
  let(:interaction) { new_interaction }
  let(:host) { 'http://localhost:3000' }

  context 'can retrieve a thing' do
    let(:interaction) do
      super()
        .upon_receiving('a retrieve thing request')
        .with_request(
                method: :get,
                path: '/thing',
                headers: { 'Accept' => 'application/json' }
              )
        .will_respond_with(
          status: 200,
          body: {
            company: match_type_of('My big company'),
            factories: match_each(location: 'Sydney',
                                  capacity: 5)
          }
        )
    end
    it 'executes the pact test without errors' do
      interaction.execute do |mock_server|
        mock_server_url = mock_server.url

        # This request would normally be performed some BarClient class,
        # but just use simple request for the purposes of this test
        bar_response = Faraday.get(mock_server_url + '/thing', nil,
                                   { 'Accept' => 'application/json' })

        # This would normally be checking the results of some deserialisation process,
        # (eg. check for an array of Factory classes )
        # but just check the response code for the purposes of this test
        expect(bar_response.status).to eql 200
      end
    end
  end
end
