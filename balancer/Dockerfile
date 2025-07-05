FROM nginx:latest

RUN rm -f /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY ./ssl/* /etc/nginx/ssl/

EXPOSE 443
