FROM nginx:1.27-alpine

RUN rm -rf /usr/share/nginx/html/*

COPY api/ /usr/share/nginx/html/api/
COPY component/ /usr/share/nginx/html/component/
COPY css/ /usr/share/nginx/html/css/
COPY html/ /usr/share/nginx/html/html/
COPY js/ /usr/share/nginx/html/js/
COPY public/ /usr/share/nginx/html/public/
COPY utils/ /usr/share/nginx/html/utils/

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY docker-entrypoint.d/10-generate-config-js.sh /docker-entrypoint.d/10-generate-config-js.sh
RUN chmod +x /docker-entrypoint.d/10-generate-config-js.sh

EXPOSE 80
