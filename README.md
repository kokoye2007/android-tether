# Android USB tethering

## Files

* `tether` - script to start USB tethering
* `51-android.rules` - udev rule to start tethering on device hotplug
* `tether.service` - systemd service launched by udev

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

* Set product attribute in `51-android.rules`.
* Install script, systemd service and udev rules:

        $ sudo make install

* Configure DNS (once).

  You can get DNS servers used by your device with:

        $ adb shell getprop net.dns{1-4}

  Alternatively, use public DNS servers:

        # cat >> /etc/resolv.conf <<EOF
        # Google Public DNS
        nameserver 8.8.8.8
        nameserver 8.8.4.4
        # Яндекс.DNS
        nameserver 77.88.8.8
        nameserver 77.88.8.1
        EOF

* Re-attach device.
* Internet should work now.

## Related work

* https://github.com/dpavlin/android-adb-usb-tether
* https://github.com/ajasmin/android-linux-tethering
* https://bugzilla.mozilla.org/show_bug.cgi?id=735547#c1
