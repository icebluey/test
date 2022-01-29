#!/bin/bash
apt update -y
apt upgrade -fy
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
exit
