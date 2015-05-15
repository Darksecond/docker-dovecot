#!/bin/bash

# Certificates
export CERTNAME=`hostname -f | sed 's/\./-/g'`
cp /certs/$CERTNAME.key /etc/ssl/private/dovecot.key
cp /certs/$CERTNAME.pem /etc/ssl/certs/dovecot.pem
chmod 000 /certs # Make /certs inaccessible

# (Temporary) Hack to make vmail work
usermod -u `stat -c "%u" /var/vmail` vmail
groupmod -g `stat -c "%g" /var/vmail` vmail

chown -R vmail:vmail /var/vmail

exec $@
