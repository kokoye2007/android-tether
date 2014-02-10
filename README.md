# Android USB tethering

## Files

* `tether` - script to start USB tethering
* `tether2` - alternate method to start tethering (pressing checkbox in UI)
* `51-android.rules` - udev rule to start tethering on device hotplug

## Usage

* Get vendor ID of your device with `lsusb` command.
* Fix `idVendor` in `51-android.rules`.
* Put `51-android.rules` to `/etc/udev/rules`.
* Put `tether` script to `/usr/local/bin`.
* Make sure first line of script points to valid shell (not symlink).
  Otherwise udev would not start a script.
* Reload udev rules:

        udevadm control --reload

* Attach your device.
* Configure network:

        ip addr add 192.168.42.130/24 dev usb0
        ip route add default via 192.168.42.129 dev usb0
        ip link set usb0 up
        echo '192.168.0.1' > /etc/resolv.conf

  You can get addresses of DNS servers with:

        adb shell getprop net.dns{1-4}

* Internet should work now.
