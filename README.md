# Pact Ruby Issue Recreator
Code base to use for recreating issues in the ruby implementation of pact. Please fork it and modify to recreate your own issue.

## Usage

### Clone the codebase

    git clone git@github.com:YOUR_USERNAME/pact-ruby-issue-recreator.git
    cd pact-ruby-issue-recreator

### Set the gem versions you are using

* Open up the `Gemfile` and set the exact gem versions you are using. eg `gem "pact", "1.12.1"`

* Run `bundle update`

### Set up consumer expectations and generate the pact

* Modify the code in `consumer/spec/bar_spec.rb` to recreate your consumer expectations.

* Run `bundle exec rake spec` to run the spec, and generate the pact file.

* You will find the pact file in `consumer/spec/pacts/foo-bar.json`

### Verify the pact against the provider

* Modify the code in `provider/bar_app.rb` to recreate the response that your provider will return.

* Run `bundle exec rake pact:verify:foobar` to verify the pact.

### To recreate issues with a local pact broker

* Set the correct gem versions in `pact_broker/Gemfile`.

* In another terminal, cd into the `pact_broker` directory and run `bundle exec rackup`.

* Follow the above instructions for setting up the consumer and provider code.

* In the root directory of this project, run `bundle exec rake pact:verify:foobar_using_local_broker`

### To recreate issues with a remote pact broker

* In the `Rakefile` set the `REMOTE_PACT_BROKER_BASE_URL` to the value of your pact broker.

* Follow the above instructions for setting up the consumer and provider code.

* Set the `PACT_BROKER_USERNAME` and `PACT_BROKER_PASSWORD` environment variables if you are using a broker with basic auth.

    export PACT_BROKER_USERNAME=your_username
    export PACT_BROKER_PASSWORD=your_password

* In the root directory of this project, run `bundle exec rake pact:verify:foobar_using_remote_broker`
