FROM nginx:alpine
RUN apk add --no-cache openssl
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
COPY . /usr/share/nginx/html
RUN rm -f /usr/share/nginx/html/Dockerfile \
           /usr/share/nginx/html/docker-compose.yml \
           /usr/share/nginx/html/nginx.conf \
           /usr/share/nginx/html/docker-entrypoint.sh \
           /usr/share/nginx/html/README.md \
           /usr/share/nginx/html/.dockerignore \
           /usr/share/nginx/html/.gitignore
EXPOSE 80 443
ENTRYPOINT ["/docker-entrypoint.sh"]
