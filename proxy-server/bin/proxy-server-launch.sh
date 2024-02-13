#!/bin/sh
/usr/sbin/service rsyslog start
/usr/sbin/service memcached start

# set up storage
su swift -c "/usr/local/bin/swift-init start proxy"
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
