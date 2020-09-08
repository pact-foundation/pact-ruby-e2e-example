#!/bin/sh

bundle exec rake pact:bethtest:consumer
cd provider
bundle exec rake pact:verify
