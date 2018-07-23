class BarApp
  def call env
    status = 201
    headers = {'Content-Type' => 'application/xml'}
    body = '<foo><thing name="bar"/></foo>'
    [status, headers, [body]]
  end
end
