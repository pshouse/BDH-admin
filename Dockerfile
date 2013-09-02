# BDH-admin 
# Uses Chateau to administer the ReThinkDB behind members.browncoats.info
# Based on solomon hykes node.js container

FROM shykes/nodejs

MAINTAINER Patrick Shouse <shouse.patrick@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install Chateau
RUN npm install -g chateau

# Configure Chateau
RUN echo "// Config file for Chateau: https://github.com/neumino/chateau
// RethinkDB settings
exports.host = '172.17.0.1';    // RethinkDB host
exports.port = 49154;          // RethinkDB driver port
exports.authKey = '';          // Authentification key (leave an empty string if you did not set one)

// Express settings
exports.expressPort = 3000;    // Port used by express
exports.debug = true;          // Debug mode
exports.network = '127.0.0.1'  // Network the node app will run on" > config.js

ENTRYPOINT ["chateau"]

CMD ["-h"]
