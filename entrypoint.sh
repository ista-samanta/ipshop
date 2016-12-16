#!/bin/bash
set -x
IP=$(ip addr show dev 'eth0' | sed -e'0,/inet/ s/^.*inet \([^ ]*\)\/.*$/\1/;t;d')
IP6=$(ip addr show dev 'eth0' | sed -e'0,/inet6/ s/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d')
sed -e 's/IP_CONTAINER/'"$IP"'/g' sed -e 's/IP6_CONTAINER/'"$IP6"'/g' /tmp/template-index.html > /tmp/template2-index.html
sed -e 's/HOSTNAME_CONTAINER/'"$HOSTNAME"'/g' /tmp/template2-index.html > /usr/local/apache2/htdocs/index.html
echo "ServerName www.unicen-example.com:80" >> /usr/local/apache2/conf/httpd.conf
echo "#######CONTAINER IP#######"$IP"#######"
echo "#######CONTAINER IPv6#######"$IP6"#######"
httpd -D FOREGROUND
exec "$@"
