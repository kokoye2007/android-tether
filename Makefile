rules=51-android.rules
script=tether

install:
	install -Dm755 ${rules} /etc/udev/rules.d/
	install -Dm755 ${script} /usr/local/bin/
	udevadm control --reload
