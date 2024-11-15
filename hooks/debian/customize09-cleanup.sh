#!/bin/sh

# Cleanup the system before reboot.
set -e

rm "$1"/etc/resolv.conf

for _file in /etc/machine-id /var/lib/dbus/machine-id; do
	if [[ -f "$1"/$_file ]]; then
		rm "$1"/"${_file}"
	fi
done

rm -r "$1/${TMP}"
