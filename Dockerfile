FROM httpd

MAINTAINER Ista Samanta <ista.samanta@gmail.com>

# Update and install Networks tools.
RUN apt-get update && apt-get -y install net-tools

# Copy index template into place.
ADD src/index.html /tmp/template-index.html

#Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

#Exposing port
EXPOSE 80
