#!/data/data/com.termux/files/usr/bin/sh
proot-distro login debian --user vikas --no-kill-on-exit --shared-tmp --bind $HOME/storage:/mnt/Phone -- /bin/bash -c 'rm -rf /tmp/.X* && vncserver -autokill yes'
