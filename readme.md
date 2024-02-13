# termux scripts
An attempt to automate the process of setting up a minimal proot xfce DE inside termux with Hardware Acceleration and Pulse Audio support.

### Usage
- Download `Termux` and `Termux:Boot` from `F-Droid`
- Open `Termux` and run following command:
  ```bash
  source <(curl -sSL https://raw.githubusercontent.com/Vikasg7/termux-scripts/main/install-proot-distro.sh) debian vikas
  ```

### TODO
- [ ] figure out audio
- [ ] disable sshd
- [ ] test Hardware acceleration using glmark2