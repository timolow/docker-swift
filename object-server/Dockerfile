FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        attr \
        liberasurecode1 \
        liberasurecode-dev \
        memcached \
        python3-pip \
        build-essential \
        python3-dev \
        openssl \
        sqlite \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install supervisor pytz

RUN apt-get update && \
    apt-get install -y --no-install-recommends git-core && \
    git clone --branch 3.11.1 --single-branch --depth 1 https://github.com/openstack/python-swiftclient.git /usr/local/src/python-swiftclient && \
    cd /usr/local/src/python-swiftclient && pip install -U pip &&  pip3 install -r requirements.txt && python3 setup.py develop && \
    git clone --branch 10.5.0 --single-branch --depth 1 https://github.com/openstack/keystonemiddleware.git /usr/local/src/keystonemiddleware && \
    cd /usr/local/src/keystonemiddleware && pip install -U pip &&  pip3 install -r requirements.txt &&  python3 setup.py develop && \
    git clone --branch 2.32.0 --single-branch --depth 1 https://github.com/openstack/swift.git /usr/local/src/swift && \
    cd /usr/local/src/swift && pip install -U pip &&  pip3 install -r requirements.txt && pip3 install -r py36-constraints.txt && pip install -e . && python3 setup.py develop && \
    apt-get remove -y --purge git-core git && \
    apt-get autoremove -y --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#COPY ./misc/rsyncd.conf /etc/
COPY ./bin /swift/bin
#COPY ./rsyslog.d/10-swift.conf /etc/rsyslog.d/10-swift.conf
COPY ./misc/supervisord.conf /etc/supervisord.conf

RUN	mkdir /var/log/supervisor/ && \
    # create swift user and group
	sudo groupadd -g 1111 swift & \
	sudo useradd -u 1111 -g 1111 swift & 
#    /usr/sbin/useradd -U swift && \
#    sed -i 's/SLEEP_BETWEEN_AUDITS = 30/SLEEP_BETWEEN_AUDITS = 86400/' /usr/local/src/swift/swift/obj/auditor.py 

EXPOSE 8080
CMD ["/bin/bash", "/swift/bin/object-server-launch.sh"]

