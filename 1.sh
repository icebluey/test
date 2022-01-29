#!/bin/bash
apt update -y
apt upgrade -fy
systemctl list-unit-files
systemctl status -l docker
docker --version
ls -la /etc/docker/
cat /etc/docker/daemon.json
exit
