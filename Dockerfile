FROM ubuntu:bionic

RUN apt-get update && apt-get install -y ca-certificates 

COPY ./matlab-install /matlab-install

ADD network.lic /matlab-install
