#!/bin/bash



#for i in $(ls -l /data/config/nginx/sites-enabled/|awk '{print $9}'); do ln -s /data/config/nginx/sites-enabled/$i /etc/nginx/sites-enabled/
#done

rm /etc/nginx/sites-enabled -rf
ln -s /data/config/nginx/sites-enabled /etc/nginx/
rm /etc/nginx/nginx.conf
ln -s /data/config/nginx/nginx.conf /etc/nginx/

ln -s /data/config/supervisor/conf.d/user_web.conf /etc/supervisor/conf.d/
mkdir -p /data/logs/
mkdir -p /data/sockets/

# System config
mkdir -p /var/spool/incron/services/
cp /data/config/incron.root /etc/incron.d/services
echo "root">>/etc/incron.allow
service incron restart





mkdir -p /tmp/ngx_pagespeed_cache/
mkdir -p /data/logs/nginx_front/
chown www-data:www-data -R /data/sockets /tmp/ngx_pagespeed_cache/ /data/logs/nginx_front/
exec supervisord -n -c /etc/supervisor/supervisord.conf &
chmod a+rw /data/sockets/ -R

/bin/bash

