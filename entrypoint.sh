#!/bin/bash
IP=$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)
IP6=$(ip addr show dev 'eth0' | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d')
sed -e 's/IP_CONTAINER/'"$IP"'/g' sed -e 's/IP6_CONTAINER/'"$IP6"'/g' /tmp/template-index.html > /tmp/template2-index.html
#sed -e 's/IP6_CONTAINER/'"$IP6"'/g' /tmp/template-index.html > /tmp/template2-index.html
sed -e 's/HOSTNAME_CONTAINER/'"$HOSTNAME"'/g' /tmp/template2-index.html > /usr/local/apache2/htdocs/index.html
echo "ServerName www.unicen-example.com:80" >> /usr/local/apache2/conf/httpd.conf 
echo "#######CONTAINER IP#######"$IP"#######"
echo "#######CONTAINER IPv6#######"$IP6"#######"
httpd -D FOREGROUND
exec "$@"
