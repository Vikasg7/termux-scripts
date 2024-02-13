#!/usr/bin/env bash
if [ -z $1 ]; then
  echo "Missing required parameter: username"
fi

$USERNAME=$1

# disables install of recommends and suggest by default
echo "
  APT::Install-Suggests \"0\";
  APT::Install-Recommends \"0\";
" > /etc/apt/apt.conf

# updates apt sources to testing
# echo "
#   deb [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://deb.debian.org/debian testing main contrib
#   deb [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://security.debian.org/debian-security testing-security main contrib
# " > /etc/apt/source.list

# updates repo cache with testing repos
apt update

# installs apt deps befor `apt upgrade`
apt install -y apt-utils whiptail

# upgrades pacakges
yes | apt upgrade

# adds a sudo previleged user
adduser $USERNAME

# adds user to the sudo group
adduser $USERNAME sudo

apt install -y sudo

# adds user to the sudoers file
echo "
  $USERNAME	ALL=(ALL:ALL) ALL
" >> /etc/sudoers

# install DE 
apt install -y xfce4 xfce4-whiskermenu-plugin xfonts-base xfce4-terminal dbus-x11 tigervnc-standalone-server tigervnc-tools

# switch to user
su - vikas

# setup tigervncserver
vncserver
vncserver -kill :1
wget -o .vnc/xstartup https://github.com/Vikasg7/termux-scripts/blob/4d88a67edfd515471ff1a1b2698ea408bbfd070a/.vnc/xstartup
chmod 755 .vnc/xstartup

# setup DE
mkdir Desktop Documents Pictures Videos Music Templates Public Downloads

# logs out of user
exit 0

# logs out of sudo
exit 0