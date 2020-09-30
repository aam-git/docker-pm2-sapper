FROM keymetrics/pm2:latest-slim
LABEL maintainer="AAMServices <info@aamservices.uk>"

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y --no-install-recommends git curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -fsSL "https://raw.githubusercontent.com/aam-git/docker-pm2-sapper/dev/ecosystem.config.js" -o ecosystem.config.js && \
    npx degit "sveltejs/sapper-template#rollup" sapperApp && \
    cd sapperApp && \
    npm install

EXPOSE 3000

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]
