class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
      number: 999999999999999999
    }.to_json
    [status, headers, [body]]
  end
end
