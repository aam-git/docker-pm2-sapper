FROM keymetrics/pm2:latest-alpine
LABEL maintainer="AAMServices <info@aamservices.uk>"

WORKDIR /usr/src/app

RUN echo "cachebust 10" && apk add --no-cache git curl && \
    curl -fsSL "https://raw.githubusercontent.com/aam-git/docker-pm2-sapper/dev/ecosystem.config.js" -o ecosystem.config.js && \
    npx degit "sveltejs/sapper-template#rollup" sapper && \
    cd sapper && \
    npm config set -g production false && \
    npm install

EXPOSE 3000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
