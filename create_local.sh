#!/bin/bash
sudo groupadd -g 1111 swift & \
sudo useradd -u 1111 -g 1111 swift & \

sudo mkdir /etc/swift; chown -R swift.swift /etc/swift;  \
sudo mkdir -p /srv/node; chown -R swift.swift /srv/node;  \
sudo mkdir -p /var/log/swift/hourly; chown -R syslog.adm /var/log/swift; chmod -R g+w /var/log/swift; \
sudo mkdir -p /var/run/swift; sudo mkdir -p /var/cache/swift; \
sudo chown -R swift:swift /etc/swift /var/run/swift /var/cache/swift

exit $?
