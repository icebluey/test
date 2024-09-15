apt update -y -qqq


df -Th
/bin/systemctl disable $(/bin/systemctl list-unit-files | grep -i -E 'docker|container|podman' | grep -iv 'container-getty' | awk '{print $1}' | sort -V | uniq | paste -sd" ")
/bin/systemctl stop $(/bin/systemctl list-unit-files | grep -i -E 'docker|container|podman' | grep -iv 'container-getty' | awk '{print $1}' | sort -V | uniq | paste -sd" ")

# delete firefox
apt autoremove --purge -y $(dpkg -l | grep -i -E 'firefox|firebird|google-chrome-stable' | awk '{print $2}' | sort -V | uniq | paste -sd" ")

# delete microsoft
apt autoremove --purge -y $(dpkg -l | grep -i -E 'microsoft|libmono|mono-|monodoc' | awk '{print $2}' | sort -V | uniq | paste -sd" ")

# delete docker
apt autoremove --purge -y $(dpkg -l | grep -i -E 'docker|container' | awk '{print $2}' | sort -V | uniq | paste -sd" ")
/bin/rm -fr /etc/docker /usr/libexec/docker /etc/containerd /var/lib/containerd /var/lib/docker*

# delete mysql postgresql php google-cloud
systemctl disable postgresql.service mysql.service
systemctl disable postgresql.service mysql.service
systemctl disable postgresql.service mysqld.service
systemctl stop postgresql.service mysql.service
systemctl stop postgresql.service mysql.service
systemctl stop postgresql.service mysqld.service
apt autoremove --purge -y $(dpkg -l | awk '$2 ~ /mysql|postgresql|google-cloud|^php[1-9]/ {print $2}' |  grep -iv libmysqlclient | sort -V | uniq | paste -sd" ")
/bin/rm -vfr /var/lib/postgresql /var/lib/mysql

snap remove --purge $(snap list | awk 'NR > 1 && $1 !~ /lxd/ && $1 !~ /snapd/ {print $1}' | sort -V | uniq | paste -sd" ")
snap remove --purge lxd
snap remove --purge snapd

systemctl disable snapd.service
systemctl disable snapd.socket
systemctl disable snapd.seeded.service

systemctl stop snapd.service
systemctl stop snapd.socket
systemctl stop snapd.seeded.service

apt autoremove --purge lxd-agent-loader snapd
rm -vrf ~/snap
rm -vrf /snap
rm -vrf /var/snap
rm -vrf /var/lib/snapd
rm -vrf /var/cache/snapd
rm -vfr /tmp/snap.lxd
rm -vfr /tmp/snap-private-tmp

df -Th


