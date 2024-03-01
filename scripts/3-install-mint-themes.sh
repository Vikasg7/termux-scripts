tar -xzf <(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/mint/icons.tar.gz) -C /usr/share/
tar -xzf <(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/mint/themes.tar.gz) -C /usr/share/
gtk-update-icon-cache /usr/share/icons/*