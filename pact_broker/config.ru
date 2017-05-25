require 'logger'
require 'sequel'
require 'pact_broker'

DATABASE_CREDENTIALS = {adapter: "sqlite", database: "pact_broker_database.sqlite3", :encoding => 'utf8'}

app = PactBroker::App.new do | config |
  config.database_connection = Sequel.connect(DATABASE_CREDENTIALS.merge(:logger => config.logger))
end

run app
