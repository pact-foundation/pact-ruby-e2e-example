all: test verify

install:
	bundle install

verify:
	bundle exec rake pact:v2:verify

test:
	bundle exec rake pact:v2:spec

verify_v1:
	bundle exec rake pact:verify

test_v1:
	bundle exec rake pact:spec