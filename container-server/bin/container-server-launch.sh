#!/bin/sh
/usr/sbin/service rsyslog start
/usr/sbin/service rsync start
/usr/sbin/service memcached start

# set up storage
#su swift -c "/usr/local/bin/swift-init start container-server, container-update, container-replicator, container-auditor"
/usr/local/bin/swift-init start container-server container-update container-replicator container-auditor
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
