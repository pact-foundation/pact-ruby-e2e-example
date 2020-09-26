# Pact Ruby End to End Example

[![Build Status](https://travis-ci.org/pact-foundation/pact-ruby-e2e-example.svg?branch=master)](https://travis-ci.org/pact-foundation/pact-ruby-e2e-example)

Code base to use for demonstrating features or recreating issues in the ruby implementation of pact. Please fork it and modify to demonstrate or recreate your own code.

This code base is _not_ intended as an example of a best practice pact implementation. Its purpose is to create a running example with the simplest code possible. If you want to see an example of how you would use pact in a Ruby consumer or provider project, see the [example] dir in the pact repository.

## Usage

### Prerequisites

Install Docker and Docker Compose.

### Fork and clone the codebase

    # Fork the repository using the 'Fork' button on the repository home page, then:
    git clone git@github.com:YOUR_USERNAME/pact-ruby-e2e-example.git
    cd pact-ruby-e2e-example
    git checkout feat/docker-compose

### Set the gem versions you are using

* Open up the `Gemfile` and set the exact gem versions you are using. eg `gem "pact", "1.12.1"`

* Run `bundle update` (requires bundler 2.1.4)

* Open docker-compose.yml and set the exact version of the Pact Broker you are using.

### Update pacts

* The pacts are published from docker/publish-pacts-command.sh. Update the pact contents and publishing so that they match your situation.

### Update verifications

* The verification configuration is in provider/spec/pact_helper.rb. Update it to to match your situation.

### Run the example

Execute:

```
./run.sh
```

## Reporting an issue

* Commit your code on a branch (so you can reuse it for other issues cleanly) and push it to your fork

      git checkout -b "foo-issue"
      git add .
      git commit -m "Modifying code to recreate my issue"
      git push --set-upstream origin foo-issue

* Open an issue in the appropriate codebase (see [pact-foundation][pact-foundation] for most of the repositories) and include a link to your branch.

[pact-foundation]: https://github.com/pact-foundation
[example]: https://github.com/realestate-com-au/pact/tree/master/example
