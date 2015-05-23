# Nginx front container.

Docker based nginx install.  Builds Nginx 1.6.2 from source. Configurations loaded from /data/config/.  Changes to config files gracefully reloads nginx server.

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

