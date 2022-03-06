FROM node:16

RUN apt upgrade && apt update \
  && apt install -y vim git \
  && npm install -g typescript

WORKDIR /home/Survival
