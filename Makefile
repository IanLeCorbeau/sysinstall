# Makefile for custom installs and ISOs/Releases.

include config.mk

bootstrap:
	/usr/bin/mmdebstrap --variant="${VARIANT}" \
		--components="${COMPONENTS}" \
		--include="tzdata locales usrmerge ca-certificates ${PACKAGES}" \
		--essential-hook='./settzl ${TARGET} ${TIMEZONE} ${LOCALE} ${CHARSET}' \
		--hook-directory=hooks/${DISTRO} \
		${FLAVOUR} ${TARGET} \
		${SOURCES}

install: bootstrap

.PHONY: bootstrap
