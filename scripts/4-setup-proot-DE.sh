# setup tigervncserver
echo '* Type vnc login password (at least 6 characters)'
vncpasswd
curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/.vnc/xstartup > .vnc/xstartup
curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/.vnc/config > .vnc/config
chmod 755 .vnc/xstartup

# adds panel stype improvements
mkdir .config/gtk-3.0
curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/.config/gtk-3.0/gtk.css > .config/gtk-3.0/gtk.css

# setup DE
mkdir Desktop Documents Pictures Videos Music Templates Public Downloads

# logs out of user
exit