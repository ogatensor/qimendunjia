FROM node:22-bookworm

WORKDIR /usr/app
COPY ./ /usr/app

RUN rm -rf node_modules

RUN npm i viem --force
ENTRYPOINT ["/bin/sh"]
