#!/bin/sh

# Set the timezone and locale.

set -e

_target=$1
_tz=$2
_locale=$3
_charset=$4
_area=${_tz%%/*}
_zone=${_tz##*/}

echo "tzdata tzdata/Areas select $_area" \
	| chroot "${_target}" debconf-set-selections
echo "tzdata tzdata/Zones/$_area select $_zone" \
	| chroot "${_target}" debconf-set-selections
echo 'tzdata tzdata/Zones/Etc select UTC' \
       | chroot "${_target}" debconf-set-selections
# This has to be done or else dpkg-reconfigure insists on using Etc
# as the default timezone for whatever stupid reason.
echo "${_area}/${_zone}" > "${_target}"/etc/timezone
chroot "${_target}" ln -sf /usr/share/zoneinfo/"${_area}"/"${_zone}" /etc/localtime

echo "locales locales/default_environment_locale select $_locale" \
	| chroot "${_target}" debconf-set-selections
echo "locales locales/locales_to_be_generated multiselect $_locale $_charset" \
	| chroot "${_target}" debconf-set-selections
