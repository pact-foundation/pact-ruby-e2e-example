class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
        thing: [1],
        array: [1, 2, 3]
    }.to_json
    [status, headers, [body]]
  end
end
