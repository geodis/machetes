#!/bin/bash

vgchange -y

device_fs=`blkid -o value -s TYPE ${device}`

if [ "`echo -n $device_fs`" == "" ]
then
  pvcreate ${device}
  vgcreate data ${device}
  lvcreate --name volume1 -l 100%FREE data
  mkfs.ext4 /dev/data/volume1
fi

mkdir -p /data
echo '/dev/data/volume1 /data ext4 defaults 0 0' >> /etc/fstab
mount /data
