class BarApp
  def call env
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
      "stringBananas" => ["apple", "orange"],
      "hashBananas" => [{
        bar: "mandarin"
      },{
        baz: "this key is wrong!"
      }]
    }.to_json
    [status, headers, [body]]
  end
end
