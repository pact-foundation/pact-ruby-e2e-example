class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
      "company": "My Company",
      "factories": [
        {
          "location": "Sydney",
          "capacity": 5
        },
        {
          "location": "Sydney",
          "geographicCoords": "-0.145,1.4445",
          "capacity": 5,
        },
      ],
      "received_at": "2017-10-25T01:26:00Z",
      "received_at_matcher": "2017-10-25T01:26:00Z"

    }.to_json
    [status, headers, [body]]
  end
end
