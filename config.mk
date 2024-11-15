# Config file. Edit to fit your needs.

DISTRO		= debian		# Can be: debian, ragnarok, ubuntu

# Where the system will be mounted at install time.
TARGET		= /mnt

# Distro version, bootstrap variant and repo components.
FLAVOUR		= bookworm
VARIANT		= minbase
COMPONENTS	= main non-free-firmware

# System config
HOSTNAME	= debian		# system hostname
TIMEZONE	= America/Montreal	# see docs/lists/tz.list
LOCALE		= en_CA.UTF-8		# see docs/lists/locales.list
CHARSET		= UTF-8			# see docs/lists/locales.list
KB_LAYOUT	= ca			# see docs/lists/xkblayout.list
KB_VARIANT	= French (Canada)	# see docs/lists/xkblayout.list

# sources.list or *.sources files for
# the system.
SOURCES		= "deb http://deb.debian.org/debian/ bookworm ${COMPONENTS}" \
		  "deb http://security.debian.org/debian-security bookworm-security ${COMPONENTS}" \
		  "deb http://deb.debian.org/debian/ bookworm-updates ${COMPONENTS}"

# Packages that should be installed along with the base system.
# Not all packages should be installed here.
PACKAGES	= 

# Packages that should be installed in the chroot after the base system.
PACKAGES_CHROOT	= 
