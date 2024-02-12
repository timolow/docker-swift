#!/bin/bash
docker build -t swift .
docker container run -P \
-v /srv/node:/srv/node \
-v /etc/swift:/etc/swift \
-v /var/run/swift:/var/run/swift \
-v /var/cache/swift:/var/cache/swift \
-v /var/log/swift:/var/log/swift \
-p 0.0.0.0:6012:6012 \
-p 0.0.0.0:6011:6011 \
-p 0.0.0.0:6010:6010 \
-p 0.0.0.0:8080:8080 \
-t swift
