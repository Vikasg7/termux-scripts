# termux scripts
An attempt to automate the process of setting up a minimal proot xfce DE inside termux with Hardware Acceleration and Pulse Audio support.

### Usage
- Download `Termux` and `Termux:Boot` from `F-Droid`
- Open `Termux` and run following command:
  ```bash
  source <(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/scripts/1-install-proot-distro.sh) debian
  source <(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/scripts/2-install-proot-DE.sh) vikas
  ```

### TODO
- [ ] figure out audio
- [ ] disable sshd
- [ ] test Hardware acceleration using glmark2