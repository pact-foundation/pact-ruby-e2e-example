class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
      name: "Jean-Marie de La Beaujardière"
    }.to_json
    [status, headers, [body]]
  end
end
