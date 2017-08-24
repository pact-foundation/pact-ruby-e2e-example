class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
      "@odatacontext" => "bar"
    }.to_json
    [status, headers, [body]]
  end
end
