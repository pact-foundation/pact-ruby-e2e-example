class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
      score: 2.0
    }.to_json
    [status, headers, [body]]
  end
end
