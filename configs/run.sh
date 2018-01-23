#!/bin/sh -e

# Loggly Token Replacement
sed -i "s/LOGGLY_AUTH_TOKEN/$LOGGLY_TOKEN/" /etc/rsyslog.conf

# Loggly Tag Replacement
sed -i "s/LOGGLY_APP_TAG/$LOGGLY_TAG/" /etc/rsyslog.conf

# Start Supervisor
exec /usr/bin/supervisord -c /usr/local/etc/supervisord.conf