# Makefile for custom installs and ISOs/Releases.

include config.mk

# Full blown installation
bootstrap:
	/usr/bin/mmdebstrap --variant="${VARIANT}" \
		--components="${COMPONENTS}" \
		--include="tzdata usrmerge ca-certificates ${PACKAGES}" \
		--essential-hook='./settz ${TARGET} ${TIMEZONE}' \
		--customize-hook='./setlocale ${TARGET} ${LOCALE} ${CHARSET}' \
		--hook-directory=hooks/${DISTRO} \
		--skip=check/empty \
		${FLAVOUR} ${TARGET} \
		${SOURCES}

install: bootstrap

# Create a chroot tarball
tarball:
	/usr/bin/mmdebstrap --variant="${VARIANT}" \
		--components="${COMPONENTS}" \
		--include="usrmerge tzdata ca-certificates ${PACKAGES}" \
		--essential-hook='./settz ${TARGET} ${TIMEZONE}' \
		--customize-hook='./setlocale ${TARGET} ${LOCALE} ${CHARSET}' \
		--hook-directory=hooks/${DISTRO} \
		${FLAVOUR} ${TARGET}.tgz \
		${SOURCES}

.PHONY: bootstrap tarball
