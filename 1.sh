apt update -y
#apt upgrade -fy
cat /etc/os-release
#dpkg -l > /tmp/p.txt
# delete dotnet
apt autoremove --purge -y $(dpkg -l | grep -i dotnet | awk '{print $2}' | paste -sd" ")
echo
echo
cat /tmp/p.txt
echo
echo

exit
#
