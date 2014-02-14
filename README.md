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
* Configure DNS (once)

  You can get addresses of DNS servers on your device with:

        adb shell getprop net.dns{1-4}

  Alternatively, use public DNS servers:

        cat >> /etc/resolv.conf <<EOF
        # Google Public DNS
        nameserver 8.8.8.8
        nameserver 8.8.4.4
        # Яндекс.DNS
        nameserver 77.88.8.8
        nameserver 77.88.8.1
        EOF

* Internet should work now.
