FROM node:8-alpine
MAINTAINER dan.turner@cba.com.au

ENV APP_DIR /home/node/app
ENV NODE_ENV "production"

# Copy application source to $APP_DIR.
WORKDIR $APP_DIR

RUN apk add --update --no-cache --virtual .build-deps git \
		&& git clone https://github.com/dan-turner/eth-net-intelligence-api . \
    && npm install --force \
    && npm cache clean --force  \
    && apk del .build-deps

# Set default docker user to node (provided by base image).
USER node

CMD [ "npm", "start" ]
