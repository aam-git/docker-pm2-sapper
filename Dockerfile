FROM keymetrics/pm2:latest-alpine
LABEL maintainer="AAMServices <info@aamservices.uk>"

WORKDIR /usr/src/app

ADD ecosystem.config.js /

RUN apk add --no-cache git && \
    npx degit "sveltejs/sapper-template#rollup" sapper && \
    cd sapper && \
    npm install

EXPOSE 3000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
