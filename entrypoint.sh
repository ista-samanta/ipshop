#!/bin/bash
IP=$(ip addr show dev 'eth0' | grep ^[[:blank:]]*inet|grep global|sed -e 's@/@ @g'|awk '{print $2}')
IP6=$(ip addr show dev 'eth0' | grep ^[[:blank:]]*inet6|grep global|sed -e 's@/@ @g'|awk '{print $2}')
FileName=/tmp/template-index.html
sed -e 's/IP_CONTAINER/'"$IP"'/g' -e 's/IP6_CONTAINER/'"$IP6"'/g' -i $FileName
sed -e 's/HOSTNAME_CONTAINER/'"$HOSTNAME"'/g' $FileName > /usr/local/apache2/htdocs/index.html
echo "ServerName www.unicen-example.com:80" >> /usr/local/apache2/conf/httpd.conf
echo "#######CONTAINER IP#######"$IP"#######"
echo "#######CONTAINER IPv6#######"$IP6"#######"
httpd -D FOREGROUND
exec "$@"
