
# Pull base image.
FROM ubuntu:16.04

# Install and Updates
RUN \
  apt-get -y update && \
  apt-get install -y python-software-properties && \
  apt-get install -y software-properties-common && \
  LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
  apt-get -y update && \
  apt-get install -y php5.6 php5.6-redis php5.6-curl php5.6-fpm && \
  apt-get install -y nginx

# Port setting
EXPOSE 80

# Startup command 
CMD ["sh", "-c", "/usr/sbin/update-ca-certificates; /etc/init.d/php5.6-fpm start && nginx -g 'daemon off;'"]
