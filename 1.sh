apt update -y -qqq
#apt upgrade -fy

/bin/systemctl disable $(/bin/systemctl list-unit-files | grep -i -E 'docker|container|podman' | grep -iv 'container-getty' | awk '{print $1}' | sort -V | uniq | paste -sd" ")
/bin/systemctl stop $(/bin/systemctl list-unit-files | grep -i -E 'docker|container|podman' | grep -iv 'container-getty' | awk '{print $1}' | sort -V | uniq | paste -sd" ")

# delete firefox
apt autoremove --purge -y $(dpkg -l | grep -i -E 'firefox|firebird' | awk '{print $2}' | sort -V | uniq | paste -sd" ")

# delete microsoft
apt autoremove --purge -y $(dpkg -l | grep -i -E 'microsoft|libmono|mono-|monodoc' | awk '{print $2}' | sort -V | uniq | paste -sd" ")

# delete docker
apt autoremove --purge -y $(dpkg -l | grep -i -E 'docker|container' | awk '{print $2}' | sort -V | uniq | paste -sd" ")
/bin/rm -fr /etc/docker /usr/libexec/docker /etc/containerd /var/lib/containerd /var/lib/docker*


echo
echo
snap list

exit
#
