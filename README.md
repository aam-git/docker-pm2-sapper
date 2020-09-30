Docker PM2 Sapper v0.28.0
========
powered by pm2:latest-alpine image

[Sapper][1] The next small thing in web development.



Available tags you can use: latest (default) or dev

Tag dev runs in live reload mode so you can make changes to the file and they update on the website without need to restart


## docker-compose.yml

```yaml
version: '2'
services:
  sapper:
    image: aamservices/pm2-sapper:dev
    restart: unless-stopped
    volumes:
      - sapper_data:/usr/src/app
    networks:
      - internal
    ports:
      - 3000
volumes:
  sapper_data:
    driver: local
```


[1]: https://sapper.svelte.dev
