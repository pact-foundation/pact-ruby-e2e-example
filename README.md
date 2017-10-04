# Pact Ruby End to End Example

[![Build Status](https://travis-ci.org/pact-foundation/pact-ruby-e2e-example.svg?branch=master)](https://travis-ci.org/pact-foundation/pact-ruby-e2e-example)

Code base to use for demonstrating features or recreating issues in the ruby implementation of pact. Please fork it and modify to demonstrate or recreate your own code.

This code base is _not_ intended as an example of a best practice pact implementation. Its purpose is to create a running example with the simplest code possible. If you want to see an example of how you would use pact in a Ruby consumer or provider project, see the [example] dir in the pact repository.

## Usage

### Fork and clone the codebase

    # Fork the repository using the 'Fork' button on the repository home page, then:
    git clone git@github.com:YOUR_USERNAME/pact-ruby-e2e-example.git
    cd pact-ruby-e2e-example

### Set the gem versions you are using

* Open up the `Gemfile` and set the exact gem versions you are using. eg `gem "pact", "1.12.1"`

* Run `bundle update`

### Set up consumer and provider

* Modify the code in `consumer/spec/bar_spec.rb` to recreate your consumer expectations and actual requests.
* Modify the code in `provider/bar_app.rb` to recreate the response that your provider will return.
* Run `bundle exec rake` to run the consumer specs, generate the pact file, and verify the pact file.
* You will find the pact file in `consumer/spec/pacts/foo-bar.json`
* To run just the consumer specs and generate the pact: `bundle exec rake spec`
* To run just the provider verification: `bundle exec rake pact:verify:foobar`

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

[pact-foundation]: https://github.com/pact-foundation
[example]: https://github.com/realestate-com-au/pact/tree/master/example
