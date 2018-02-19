rm -rf consumer/spec/pacts/foo-bar.json
PACT_REQUEST_PATH="/wrongthing" bundle exec rake || true
bundle exec rake print_pacts
rm -rf consumer/spec/pacts/foo-bar.json
PACT_REQUEST_PATH="/thing" bundle exec rake
bundle exec rake print_pacts
