#!/usr/bin/env bash

USERNAME=$1

if [ -z "$USERNAME" ]; then
  echo "Missing required parameter: username "
  exit 1
fi

## disables install of recommends and suggest by default
echo "
APT::Install-Suggests \"0\";
APT::Install-Recommends \"0\";
" > /etc/apt/apt.conf

## updates apt sources to testing
echo "
deb [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://deb.debian.org/debian testing main contrib
deb [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://security.debian.org/debian-security testing-security main contrib
" > /etc/apt/sources.list

## updates repo cache with testing repos
apt update

## installs apt deps befor `apt upgrade`
apt install -y apt-utils whiptail gpg sudo

## upgrades pacakges
yes | apt upgrade

## adds a sudo previleged user
adduser $USERNAME

## adds user to the sudo group
adduser $USERNAME sudo
adduser $USERNAME audio
adduser $USERNAME video

## adds user to the sudoers file
echo "
$USERNAME	ALL=(ALL:ALL) ALL
" >> /etc/sudoers

## adds vscodium gpg key
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

## adds vscodium repo
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

## install DE
apt update
apt install -y xfce4 xfce4-whiskermenu-plugin gnome-keyring audacious xfonts-base xfce4-terminal dbus-x11 file-roller \
               tigervnc-standalone-server tigervnc-tools at-spi2-core ristretto mousepad aptitude git make tumbler wget \
               thunar-archive-plugin xfce4-notifyd xfce4-screenshooter xfce4-taskmanager parole policykit-1-gnome nano \
               bash-completion librsvg2-common chromium codium
apt autoremove -y

# install themes and icons
source <(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/scripts/3-install-mint-themes.sh)

## switch to user
su -c "$(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/scripts/4-setup-proot-DE.sh)" - vikas

## logs out of root
exit