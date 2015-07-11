# twinturbo

An app acceletator based on nginx and hiphop.  Written for fun, not to be useful.  It almost works, though.  Uses hiphop and pQuery to slice out the requested portion of a page.  Pjax requests are 20x slower than normal requests because while hiphop has JIT, there's no intelligent file caching. That said, it's a start and the moving parts are set up.  Have fun with it.

## To run
```bash
#### PROD
  docker run --name nginx_front -i -t -p 80:80 -p 443:443 -v /data/logs:/data/logs:rw -v /data/containers/nginx_front/config/:/data/config/:rw --volumes-from socket_ambassador $pwd
#### DEV
  docker run --name nginx_front -i -t -p 8088:80  -v `pwd`/logs/:/data/logs/:rw --volumes-from socket_ambassador -v `pwd`/config/:/data/config/:rw $pwd
```
or just use run_container.sh.  build_and_run_container can be used for container development.


## SSL

Put ssl certificates in config/nginx/ssl/ and reference them in your config files.

## TWIN TURBO!!

twin turbo is a mod to put pjax in front of a dumb site. The turbo is based on turbo links. Twin comes from using hhvm's optimized php compiler instead of something slower.  It takes some config, but this is more of a framework.
