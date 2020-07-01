#!/bin/bash

# read in env variables and modify the streamr-spec.json
node preprocess-spec.js

# launch parity the same way as original Dockerfile does
# see https://github.com/paritytech/parity-ethereum/blob/2662d1925ec794f3ad7c5759b2412ff5128d259b/scripts/docker/hub/Dockerfile
/bin/parity
