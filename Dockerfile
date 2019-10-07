FROM 12.11.0-alpine

WORKDIR /opt/api
COPY --chown=node . .

RUN apk add --no-cache ca-certificates \
    && update-ca-certificates \
    && yarn install --production=true \
    && chown -R node /opt/api

EXPOSE 5000
CMD [ "yarn", "run", "dev"]
