FROM		nginx:1.11.3-alpine

COPY		nginx.conf.template /etc/nginx/nginx.conf.template

COPY		docker-entrypoint.sh /

ENTRYPOINT 	["sh", "/docker-entrypoint.sh"]

CMD		["nginx"]
