apt update -y -qqq
#apt upgrade -fy

systemctl list-unit-files | grep -i -E 'docker|container|pod'

# delete firefox
apt autoremove --purge -y $(dpkg -l | grep -i -E 'firefox|firebird' | awk '{print $2}' | sort -V | uniq | paste -sd" ")

# delete microsoft
apt autoremove --purge -y $(dpkg -l | grep -i microsoft | awk '{print $2}' | sort -V | uniq | paste -sd" ")

# delete docker
apt autoremove --purge -y $(dpkg -l | grep -i -E 'docker|container' | awk '{print $2}' | sort -V | uniq | paste -sd" ")
rm -fr /etc/docker /etc/containerd /etc/containerd /var/lib/docker*

echo
echo

exit
#
