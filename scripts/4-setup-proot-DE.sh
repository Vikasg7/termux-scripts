## setup tigervncserver
echo '* Type vnc login password (at least 6 characters)'
vncpasswd
curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/.vnc/xstartup > .vnc/xstartup
curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/.vnc/config > .vnc/config
chmod 755 .vnc/xstartup

## setup DE
mkdir Desktop Documents Pictures Videos Music Templates Public Downloads

## adds xfce configs
tar -xzf <(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/xfce/config.tar.gz) -C ~/ 

## logs out of user
exit