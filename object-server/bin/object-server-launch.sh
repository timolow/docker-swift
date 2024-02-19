#!/bin/sh
/usr/sbin/service rsyslog start
/usr/sbin/service rsync start
/usr/sbin/service memcached start

# set up storage
#su swift -c "/usr/local/bin/swift-init start object-server, object-replicator, object-auditor, object-updater"
/usr/local/bin/swift-init start object-server object-replicator object-auditor object-updater
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
