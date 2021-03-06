# BDH-admin 
# Uses Chateau to administer the ReThinkDB behind members.browncoats.info
# Based on toscanini node.js image: github.com/toscanini/docker-nodejs

FROM pshouse/nodejs-base

MAINTAINER Patrick Shouse <shouse.patrick@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install Chateau
RUN npm install -g chateau

# Configure Chateau
RUN echo "exports.host = '172.17.0.1'; exports.port = 28015; exports.authKey = ''; exports.expressPort = 3000;exports.debug = true; exports.network = '0.0.0.0'  // Network the node app will run on" > /usr/lib/node_modules/chateau/config.js

EXPOSE 3000

ENTRYPOINT ["chateau"]

CMD ["-h"]
