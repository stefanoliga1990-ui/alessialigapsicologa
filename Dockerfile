FROM nginx:stable-alpine

# Railway supplies PORT at runtime; 8080 is the local default.
# Only substitute PORT, preserving Nginx variables such as $uri.
ENV PORT=8080 \
    NGINX_ENVSUBST_FILTER=^PORT$

COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY src/main/resources/static/ /usr/share/nginx/html/

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
