all: test verify

install:
	bundle install

verify:
	bundle exec rspec -t pact spec/pact/consumers/*_spec.rb

test:
	bundle exec rspec -t pact spec/pact/providers/**/*_spec.rb
