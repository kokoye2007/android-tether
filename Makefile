rules=49-android.rules
service=tether.service
script=tether

install: rules service script

rules:
	install -m644 ${rules} /etc/udev/rules.d/
	udevadm control --reload

service:
	install -m644 ${service} /etc/systemd/system/
	systemctl daemon-reload

script:
	install -m755 ${script} /usr/local/bin/

uninstall:
	rm -f /etc/udev/rules.d/${rules}
	udevadm control --reload
	rm -f /etc/systemd/system/${service}
	systemctl daemon-reload
	rm -f /usr/local/bin/${script}

.PHONY: rules service script installl uninstall
