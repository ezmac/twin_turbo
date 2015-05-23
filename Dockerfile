FROM debian:wheezy
MAINTAINER Tad Merchant <system.root@gmail.com>

# do dist upgrade to be on latest debian.
ADD config/sources.list /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y

# install incron and supervisor
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y incron
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget
RUN DEBIAN_FRONTEND=noninteractive apt-get build-dep -y nginx
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y unzip

#install nginx 1.6

#RUN mkdir /tmp/nginx && cd /tmp/nginx/ && wget --no-check-certificate https://github.com/pagespeed/ngx_pagespeed/archive/release-1.9.32.2-beta.zip && unzip release-1.9.32.2-beta.zip && cd ngx_pagespeed-release-1.9.32.2-beta &&wget --no-check-certificate https://dl.google.com/dl/page-speed/psol/1.9.32.2.tar.gz && tar -xvf 1.9.32.2.tar.gz && cd /tmp/nginx/ && wget -d http://nginx.org/download/nginx-1.6.2.tar.gz && tar -xf nginx-1.6.2.tar.gz && cd nginx-1.6.2 && ./configure --add-module=/tmp/nginx/ngx_pagespeed-release-1.9.32.2-beta --with-http_gzip_static_module --with-http_spdy_module --with-http_ssl_module --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-log-path=/var/log/nginx/access.log --prefix=/etc/nginx/ --sbin-path=/usr/sbin/nginx --user=www-data --group=www-data '--with-cc-opt=-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic' && make && make install
RUN mkdir /tmp/nginx/ && cd /tmp/nginx/ && wget -d http://nginx.org/download/nginx-1.6.2.tar.gz && tar -xf nginx-1.6.2.tar.gz && cd nginx-1.6.2 && ./configure --with-http_gzip_static_module --with-http_spdy_module --with-http_ssl_module --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-log-path=/var/log/nginx/access.log --prefix=/etc/nginx/ --sbin-path=/usr/sbin/nginx --user=www-data --group=www-data '--with-cc-opt=-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic' && make && make install

RUN mkdir -p /var/log/nginx


EXPOSE 80
RUN mkdir -p /data/www/
RUN mkdir -p /var/log/nginx /tmp/nginx/cache/
ADD nginx /etc/init.d/
VOLUME ['/data/logs','/data/config']




ADD run.sh /
CMD ["/bin/bash"]
ENTRYPOINT ["/run.sh"]
