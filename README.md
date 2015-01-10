# Android USB tethering

## Files

* `tether` - script to start USB tethering
* `49-android.rules` - udev rule to start tethering on device hotplug
* `tether.service` - systemd service launched by udev
* `usb0.link` - systemd-networkd link configuration
* `usb0.network` - systemd-networkd interface configuration

## Prerequisites

Linux machine running systemd+udev+networkd+resolved

## Usage

* Install [Android SDK](http://developer.android.com/sdk) and set path to
  `adb` binary in `tether` script.
* Attach your Android device.
* Get major and minor of your device with `lsusb` command:

        $ lsusb | grep HTC
        Bus 001 Device 088: ID 0bb4:0004 HTC (High Tech Computer Corp.)

* Get product attribute for your device:

        $ udevadm info -a -p $(udevadm info -q path -n /dev/bus/usb/001/088) | grep ATTR{product}
            ATTR{product}=="ZP900S"

* Set product attribute in `49-android.rules`.

* Configure DNS.

  You can get DNS servers used by your device with:

        $ adb shell getprop net.dns{1-4}

  Alternatively, use public DNS servers:

        $ cat >> tether.network <<EOF
        # Google Public DNS
        DNS 8.8.8.8
        DNS 8.8.4.4
        EOF

* Install script, systemd service and udev rules:

        $ sudo make install

* Use systemd-networkd DNS configuration:

        # ln -sf ../run/systemd/network/resolv.conf /etc/resolv.conf

* Re-attach device.
* Internet should work now.

## Related work

* https://github.com/dpavlin/android-adb-usb-tether
* https://github.com/ajasmin/android-linux-tethering
* https://bugzilla.mozilla.org/show_bug.cgi?id=735547#c1
