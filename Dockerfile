FROM httpd
 
MAINTAINER Nicolas Espejo <nicolas.espejo@globant.com>

# Update and install Networks tools.
RUN apt-get update && apt-get -y install net-tools

# Copy index template into place.
ADD src/index.html /tmp/template-index.html

#Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

#Exposing port 
EXPOSE 80
 

