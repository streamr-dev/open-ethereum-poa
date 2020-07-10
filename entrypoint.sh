#!/bin/bash

#default values
export CHAIN_ID=${CHAIN_ID-0x2323}

env

# substitute in env variables to all *.env_template files. NOTE: not safe for whitespace in filename
for f in $(find -name '*.env_template'); do 
    FILENAME=`echo  $f|sed -e 's/.env_template//'`
    echo "substituting the following envvars into $FILENAME:"
    envsubst -v "`cat $f`"
    envsubst < $f > $FILENAME
done

# launch parity the same way as original Dockerfile does
# see https://github.com/paritytech/parity-ethereum/blob/2662d1925ec794f3ad7c5759b2412ff5128d259b/scripts/docker/hub/Dockerfile
/bin/parity $@
