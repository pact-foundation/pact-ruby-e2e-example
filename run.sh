#!/bin/sh

docker-compose up --build --abort-on-container-exit --exit-code-from verify-pacts
