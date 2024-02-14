# termux scripts
An attempt to automate the process of setting up a minimal proot xfce DE inside termux with Hardware Acceleration and Pulse Audio support.

### Usage
- Download `Termux` and `Termux:Boot` from `F-Droid`
- Open `Termux` and run following command:
  ```bash
  source <(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/scripts/1-install-proot-distro.sh) debian
  ```
- Restart the phone
- You should be able to ssh or vnc into proot-distro using localhost or DNS Server IP (192.168.1.x)
  ```bash
  ssh 192.168.1.x -p 8022
  ```
  ```bash
  vncviewer -passwd your_password 192.168.1.x:1
  ```
_Note: 192.168.1.x can be replaced with localhost_

### TODO
- [ ] figure out audio
- [x] test Hardware acceleration using glmark2
