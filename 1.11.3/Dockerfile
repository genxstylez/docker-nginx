FROM		nginx:1.11.3-alpine

RUN		apk add gettext

COPY		nginx.conf.template /etc/nginx/nginx.conf.template

COPY		docker-entrypoint.sh /

ENTRYPOINT 	["sh", "/docker-entrypoint.sh"]

CMD		["nginx"]
