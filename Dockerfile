# DOCKER-VERSION 1.3
# AUTHOR: Minku Lee <minku@sha.kr>
# DESCRIPTION: Out-of-the-box StatsD + InfluxDB backend image for Docker

FROM gatehub/node:4.2

RUN git clone https://github.com/etsy/statsd.git
RUN cd ./statsd && npm install statsd-influxdb-backend

ADD config.js /usr/src/app/statsd/config.js

EXPOSE 8125/udp
EXPOSE 8126/tcp
CMD /usr/local/bin/node /usr/src/app/statsd/stats.js /usr/src/app/statsd/config.js
