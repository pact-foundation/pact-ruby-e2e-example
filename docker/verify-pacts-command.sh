#!/bin/sh

sleep 10
cd /provider
bundle exec rake pact:verify
