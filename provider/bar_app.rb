class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
      "results": [
        {
          "name": "Games",
          "sort_name": "Games",
          "id": 11,
          "shortname": "Games"
        },
        {
          "name": "Book Clubs",
          "sort_name": "Book Clubs",
          "id": 18,
          "shortname": "Book Clubs"
        }
      ]
    }.to_json
    [status, headers, [body]]
  end
end
