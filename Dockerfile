# Using ubuntu 18.04 as base imageFROM ubuntu:18.04
RUN apt-get install python3-pip python3-dev && \
    ln -s /usr/bin/python3 /usr/local/bin/python && \
    pip3 install — upgrade pip
