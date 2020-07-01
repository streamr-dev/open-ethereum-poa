# For parity/parity Dockerfile, see https://github.com/paritytech/parity-ethereum/blob/2662d1925ec794f3ad7c5759b2412ff5128d259b/scripts/docker/hub/Dockerfile
FROM parity/parity:v2.7.2-stable
USER root
WORKDIR /home/parity
COPY ./ ./

RUN curl -k https://deb.nodesource.com/setup_12.x -o setup_node_12.x && \
    chmod a+x ./setup_node_12.x && \
    ./setup_node_12.x && \
    apt-get update && \
    apt-get install -y nodejs

# read in env variables and modify the streamr-spec.json
ENTRYPOINT ["./entrypoint.sh"]
