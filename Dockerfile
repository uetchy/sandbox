FROM ubuntu:18.04

RUN apt-get update && apt-get install -y curl build-essential git

WORKDIR /root
