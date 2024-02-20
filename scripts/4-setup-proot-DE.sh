# setup tigervncserver
echo '* Type vnc login password (at least 6 characters)'
vncpasswd
curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/.vnc/xstartup > .vnc/xstartup
curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/.vnc/config > .vnc/config
chmod 755 .vnc/xstartup

# setup DE
mkdir Desktop Documents Pictures Videos Music Templates Public Downloads

# logs out of user
exit