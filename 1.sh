systemctl daemon-reload > /dev/null 2>&1 || : 
sleep 1
systemctl stop docker.socket > /dev/null 2>&1 || : 
systemctl stop docker.service > /dev/null 2>&1 || : 
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
systemctl start docker.service > /dev/null 2>&1 || : 
sleep 2
docker run --rm --name c7 -itd centos:7 /bin/bash
docker cp setup.sh c7:/home/setup.sh
docker exec c7 /bin/bash /home/setup.sh

exit
#
