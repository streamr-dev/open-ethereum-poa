# For parity/parity Dockerfile, see https://github.com/paritytech/parity-ethereum/blob/2662d1925ec794f3ad7c5759b2412ff5128d259b/scripts/docker/hub/Dockerfile
FROM parity/parity:v2.7.2-stable
USER root
WORKDIR /home/parity
COPY ./ ./
RUN apt-get update && apt-get install -y gettext-base
# read in env variables and modify via envsubst
ENTRYPOINT ["./entrypoint.sh"]
