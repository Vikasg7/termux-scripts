# termux scripts
An attempt to automate the process of setting up a minimal proot xfce DE inside termux with Hardware Acceleration and Pulse Audio support.

### Usage
- Download `Termux` and `Termux:Boot` from `F-Droid`
- Open `Termux` and run following command:
  ```bash
  curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/scripts/1-install-proot-distro.sh | bash -s debian
  ```

### TODO
- [ ] figure out audio
- [ ] disable sshd
- [ ] test Hardware acceleration using glmark2