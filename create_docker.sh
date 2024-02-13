#!/bin/bash

#Build Proxy Server
docker build -t swift-proxy-server proxy-server
#Start Proxy Server
docker container run -d -P \
--user 1111:1111 \
-v /srv/node:/srv/node \
-v /etc/swift:/etc/swift \
-v /var/run/swift:/var/run/swift \
-v /var/cache/swift:/var/cache/swift \
-v /var/log/swift:/var/log/swift \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
--network host \
-t swift-proxy-server 

#Build Account Server
docker build -t swift-account-server account-server
#Start Account Server
docker container run -d -P \
--user 1111:1111 \
-v /srv/node:/srv/node \
-v /etc/swift:/etc/swift \
-v /var/run/swift:/var/run/swift \
-v /var/cache/swift:/var/cache/swift \
-v /var/log/swift:/var/log/swift \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
--network host \
-t swift-account-server


#Build Container Server
docker build -t swift-container-server container-server
#Start Container Server
docker container run -d -P \
--user 1111:1111 \
-v /srv/node:/srv/node \
-v /etc/swift:/etc/swift \
-v /var/run/swift:/var/run/swift \
-v /var/cache/swift:/var/cache/swift \
-v /var/log/swift:/var/log/swift \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
--network host \
-t swift-container-server


#Build Object Server
docker build -t swift-object-server object-server
#Start Container Server
docker container run -d -P \
--user 1111:1111 \
-v /srv/node:/srv/node \
-v /etc/swift:/etc/swift \
-v /var/run/swift:/var/run/swift \
-v /var/cache/swift:/var/cache/swift \
-v /var/log/swift:/var/log/swift \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
--network host \
-t swift-object-server


