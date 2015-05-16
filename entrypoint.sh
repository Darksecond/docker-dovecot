#!/bin/bash

# Certificates
export CERTNAME=`hostname -f | sed 's/\./-/g'`
cp /certs/$CERTNAME.key /etc/ssl/private/dovecot.key
cp /certs/$CERTNAME.pem /etc/ssl/certs/dovecot.pem

chown -R vmail:vmail /var/vmail

exec $@
