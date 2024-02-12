#!/bin/bash
docker build -t swift .
docker container run -d -P \
--user 1111:1111 \
-v /srv/node:/srv/node \
-v /etc/swift:/etc/swift \
-v /var/run/swift:/var/run/swift \
-v /var/cache/swift:/var/cache/swift \
-v /var/log/swift:/var/log/swift \
--network host \
-t swift
