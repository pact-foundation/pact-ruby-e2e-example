require 'logger'
require 'sequel'
require 'pact_broker'

DATABASE_CREDENTIALS = {adapter: "sqlite", database: "pact_broker_database.sqlite3", :encoding => 'utf8'}

#  run via one of the following:
#  
#  $ bundle exec rackup -s thin
#  $ bundle exec rackup -s puma
#  $ bundle exec rackup -s webrick
#  
#  Note: if using thin, publishing results will fail with the rust verifier, as it requires the Accept-Charset header
#  to be set to utf-8. Use puma or webrick instead, until change proposed/merged in pact-rust

app = PactBroker::App.new do | config |
  config.log_stream = "stdout"
  # config.base_urls = "http://localhost:9292 http://127.0.0.1:9292 http://0.0.0.0:9292"
  # config.database_url = "sqlite:////tmp/pact_broker_database.sqlite3"
  config.database_connection = Sequel.connect(DATABASE_CREDENTIALS.merge(:logger => config.logger))
end

run app
