FROM        alpine:edge

MAINTAINER  Sam Liu <genxstylez@gmail.com>

ENV         NGINX_VERSION nginx-1.11.3

RUN         apk --update add openssl-dev pcre-dev zlib-dev wget build-base && \
            mkdir -p /tmp/src && \
            cd /tmp/src && \
            wget http://nginx.org/download/${NGINX_VERSION}.tar.gz && \
            tar -zxvf ${NGINX_VERSION}.tar.gz && \
            cd /tmp/src/${NGINX_VERSION} && \
            ./configure \
                --with-http_ssl_module \
                --with-http_gzip_static_module \
                --conf-path=/etc/nginx/nginx.conf \
                --prefix=/etc/nginx \
                --http-log-path=/var/log/nginx/access.log \
                --error-log-path=/var/log/nginx/error.log \
                --sbin-path=/usr/local/sbin/nginx && \
            make && \
            make install && \
            apk del build-base && \
            rm -rf /tmp/src && \
            rm -rf /var/cache/apk/*

# forward request and error logs to docker log collector
RUN         ln -sf /dev/stdout /var/log/nginx/access.log
RUN         ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME      ["/var/log/nginx"]

WORKDIR     /etc/nginx

COPY        nginx.conf /etc/nginx/nginx.conf

EXPOSE      80

CMD         ["nginx", "-g", "daemon off;"]
