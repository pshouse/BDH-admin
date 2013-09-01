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

# TODO: configure Chateau

ENTRYPOINT ["chateau"]

CMD ["-h"]
