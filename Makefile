rules=49-android.rules
service=tether.service
script=tether
link=usb0.link
network=usb0.network

install: rules service script link network

rules:
	install -m644 ${rules} /etc/udev/rules.d/
	udevadm control --reload

service:
	install -m644 ${service} /etc/systemd/system/
	systemctl daemon-reload

script:
	install -m755 ${script} ~/bin

link:
	install -m644 ${link} /etc/systemd/network
	systemctl restart systemd-networkd

network:
	install -m644 ${network} /etc/systemd/network
	systemctl restart systemd-networkd

uninstall:
	rm -f /etc/udev/rules.d/${rules}
	udevadm control --reload
	rm -f /etc/systemd/system/${service}
	systemctl daemon-reload
	rm -f /etc/systemd/network/{${link},${network}}
	systemctl restart systemd-networkd

.PHONY: rules service script link network install uninstall
