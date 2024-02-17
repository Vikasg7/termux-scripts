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
- termux-x11 is also supported. Disable vncserver by commenting out the following line in `.termux/boot/startup`:
  ```bash
  proot-distro login debian --user vikas --no-kill-on-exit --shared-tmp --bind $HOME/storage:/mnt/Phone -- /bin/bash -c 'rm -rf /tmp/.X* && vncserver -autokill yes'
  ```
  and uncomment following line.
  ```bash
  # proot-distro login debian --user vikas --no-kill-on-exit --shared-tmp --bind $HOME/storage:/mnt/Phone -- /bin/bash -c 'termux-x11 -xstartup "bash .vnc/xstartup" :1'
  ```
- Restart the phone and open termux-x11 app, you should see the desktop.

### Hardware Acceleration
By default opengl drivers are enabled. You can switch to zink(vulkan) by
- commenting out the following line in `.termux/boot/startup`
  ```bash
  virgl_test_server_android &
  ```
  and uncommenting the following line
  ```bash
  # MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink ZINK_DESCRIPTORS=lazy virgl_test_server --use-egl-surfaceless --use-gles &
  ```
- and commenting out the following line in `.vnc/xstartup` inside proot-distro
  ```bash
  export GALLIUM_DRIVER=virpipe
  ```
  and uncommenting the following line
  ```bash
  # export GALLIUM_DRIVER=zink
  ```

### Avoid killing background processes
- Enable USB/Wireless Debugging, Install android-tools on your PC and Connect your device to a PC with adb. 
- Persist adb config on reboot
  ```bash
  adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent"
  ```
- Disable Killing Phantom Processes. [Here](https://github.com/termux/termux-app/issues/2366#issuecomment-955149284) is the Explanation.
  ```bash
  adb shell "/system/bin/device_config put activity_manager max_phantom_processes 2147483647"
  ```

### TODO
- [x] figure out audio
- [x] test Hardware acceleration using glmark2
