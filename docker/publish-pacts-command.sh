#!/bin/sh
sleep 4

/pact/entrypoint.sh broker publish /pacts/foo-bar.json --consumer-app-version 1 --tag main
/pact/entrypoint.sh broker publish /pacts/hardcoded-pact.json --consumer-app-version 2 --tag main
sleep 1000 # keep running until the verify has finished so that --abort-on-container-exit aborts on the right container
