# Pact Ruby End to End Example
Code base to use for demonstrating features or recreating issues in the ruby implementation of pact. Please fork it and modify to demonstrate or recreate your own code.

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

* Set the exact gem versions in `pact_broker/Gemfile` and run `bundle update`.

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

## Reporting an issue

* Commit your code on a branch (so you can reuse it for other issues cleanly) and push it to your fork

      git checkout -b "foo-issue"
      git add .
      git commit -m "Modifying code to recreate my issue"
      git push --set-upstream origin foo-issue

* Open an issue in the appropriate codebase (see [pact-foundation][pact-foundation] for most of the repositories) and include a link to your branch.

[pact-foundation]:https://github.com/pact-foundation
