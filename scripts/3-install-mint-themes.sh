mkdir ~/mint-themes
cd ~/mint-themes
wget http://packages.linuxmint.com/pool/main/m/mint-x-icons/mint-x-icons_1.6.5_all.deb
wget http://packages.linuxmint.com/pool/main/m/mint-y-icons/mint-y-icons_1.7.2_all.deb
wget http://packages.linuxmint.com/pool/main/m/mint-themes/mint-themes_2.1.6_all.deb
wget http://packages.linuxmint.com/pool/main/m/mint-cursor-themes/mint-cursor-themes_1.0.2_all.deb
dpkg -i mint-x-icons_*_all.deb
dpkg -i mint-y-icons_*_all.deb
dpkg -i mint-themes_*_all.deb
dpkg -i mint-cursor-themes_*_all.deb
cd .. && sudo rm -rf mint-themes/
