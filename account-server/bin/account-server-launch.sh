#!/bin/sh
/usr/sbin/service rsyslog start
/usr/sbin/service rsync start
/usr/sbin/service memcached start

# set up storage
#su swift -c "/usr/local/bin/swift-init start account-server account-auditor, account-reaper, account-replicator"
/usr/local/bin/swift-init start account-server account-auditor account-reaper account-replicator
/usr/local/bin/supervisord -n -c /etc/supervisord.conf
