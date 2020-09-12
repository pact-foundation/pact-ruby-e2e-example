export PACT_BROKER_BASE_URL=https://test.pact.dius.com.au
export PACT_BROKER_USERNAME=dXfltyFMgNOFZAxr8io9wJ37iUpY42M
export PACT_BROKER_PASSWORD=O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1
export PUBLISH_VERIFICATIONS_RESULTS=true

unset PACT_BROKER_TOKEN

bundle exec rake spec
bundle exec rake pact:publish:remote
cd provider
bundle exec rake pact:verify
