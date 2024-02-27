#!/bin/bash

prefix="disk"
fstab="/etc/fstab-test"
root_stor_dir="/srv/node/"
i=1

for drive in $(lsblk | grep 14.6T | awk '{print$1}');
do
        mkfs.xfs -b size=4096 -s size=4096 -m bigtime=1 -L ${prefix}${i} /dev/${drive}""
        mkdir -p ${root_stor_dir}${prefix}${i}
        grep -i LABEL=${prefix}${i}\  $fstab
        if [ $? -ne 0 ]
        then
          echo "LABEL=${prefix}${i} ${root_stor_dir}${prefix}${i} xfs defaults,noatime,nodiratime,nofail,logbufs=8,x-systemd.device-timeout=4 0 0" >> $fstab
        fi

        ((i++))
done
