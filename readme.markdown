# twinturbo

An app acceletator based on nginx and hiphop.  Written for fun, not to be useful.  It almost works, though.  Uses hiphop and pQuery to slice out the requested portion of a page.  Pjax requests are 20x slower than normal requests because while hiphop has JIT, there's no intelligent file caching. That said, it's a start and the moving parts are set up.  Have fun with it.

## To run
```bash
#### PROD
  docker run --name twin_turbo -i -t -p 80:80 -p 443:443 -v /data/logs:/data/logs:rw -v /data/containers/twin_turbo/config/:/data/config/:rw $pwd
#### DEV
  docker run --name twin_turbo -i -t -p 8088:80  -v `pwd`/logs/:/data/logs/:rw -v `pwd`/config/:/data/config/:rw $pwd
```
or just use run_container.sh.  build_and_run_container can be used for container development.


## SSL

Put ssl certificates in config/nginx/ssl/ and reference them in your config files.

