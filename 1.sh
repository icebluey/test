#!/bin/bash

systemctl daemon-reload > /dev/null 2>&1 || : 
sleep 1
systemctl stop docker.socket > /dev/null 2>&1 || : 
systemctl stop docker.service > /dev/null 2>&1 || : 
sleep 1
systemctl stop containerd.service > /dev/null 2>&1 || : 
sleep 1
ip link set docker0 down > /dev/null 2>&1 || : 
sleep 1
ip link delete docker0 > /dev/null 2>&1 || : 
sleep 1
rm -fr /run/containerd
rm -fr /run/docker.sock
rm -fr /var/run/containerd
rm -fr /var/run/docker.sock
rm -fr /var/lib/docker/*

echo '{
  "dns": [
    "8.8.8.8"
  ],
  "exec-opts": [
    "native.cgroupdriver=systemd"
  ],
  "storage-driver": "overlay2"
}' > /etc/docker/daemon.json
rm -f /etc/docker/key.json
sleep 1
systemctl start docker.service > /dev/null 2>&1 || : 

cat /etc/os-release
echo
systemctl list-unit-files | grep -i enabled
echo
systemctl status -l docker
docker --version
ls -la /etc/docker/
echo
cat /etc/docker/daemon.json
echo
docker info
echo
docker images
echo
ip addr
echo
exit
