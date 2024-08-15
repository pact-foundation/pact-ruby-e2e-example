# For assistance debugging failures

* The pact files have been stored locally in the following temp directory:
    /Users/bethanyskurrie/workspace/pact-foundation/pact-ruby-e2e-example/tmp/pacts

* The requests and responses are logged in the following log file:
    /Users/bethanyskurrie/workspace/pact-foundation/pact-ruby-e2e-example/log/pact.log

* Add BACKTRACE=true to the `rake pact:verify` command to see the full backtrace

* If the diff output is confusing, try using another diff formatter.
  The options are :unix, :embedded and :list

    Pact.configure do | config |
      config.diff_formatter = :embedded
    end

  See https://github.com/realestate-com-au/pact/blob/master/documentation/configuration.md#diff_formatter for examples and more information.

* Check out https://github.com/realestate-com-au/pact/wiki/Troubleshooting

* Ask a question in the google users' group https://groups.google.com/forum/#!forum/pact-support


