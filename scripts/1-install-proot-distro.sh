#!/data/data/com.termux/files/usr/bin/sh
# $1 = proot-distro alias (debian, ubuntu etc) 

DISTRO=$1

if [ -z "$DISTRO" ]; then
  echo "Missing required parameter: distro "
  exit 1
fi

# upgrades packages
yes | pkg upgrade

# asks for storage permission
termux-setup-storage

# installs dependencies
pkg install -y proot-distro openssh pulseaudio x11-repo tur-repo
pkg update 
pkg install -y mesa-zink virglrenderer-mesa-zink vulkan-loader-android virglrenderer-android

# installs distro
proot-distro install $DISTRO

# enables Termux:Boot script to be called on phone boot inside termux
mkdir .termux/boot
curl -sSL -o .termux/boot/startup https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/.termux/boot/startup

proot-distro login $DISTRO -- /bin/bash -c "$(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/scripts/2-install-proot-DE.sh)" -s vikas
