FROM ubuntu:18.04

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y ioquake3 ioquake3-server \
 && useradd q3server \
 && install -o q3server -g q3server -d /home/q3server /home/q3server/.q3a

COPY --chown=q3server q3/baseq3      /home/q3server/.q3a/baseq3
COPY --chown=q3server q3/missionpack /home/q3server/.q3a/missionpack
COPY --chown=q3server server.cfg     /home/q3server/.q3a/baseq3/server.cfg

USER q3server
WORKDIR /home/q3server

ENTRYPOINT ["/usr/lib/ioquake3/ioq3ded"]
CMD ["+exec", "server.cfg"]
