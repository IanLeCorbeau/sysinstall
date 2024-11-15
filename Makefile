# Makefile for custom installs and ISOs/Releases.

include config.mk

bootstrap:
	/usr/bin/mmdebstrap --variant="${VARIANT}" \
		--components="${COMPONENTS}" \
		--include="tzdata locales usrmerge ca-certificates ${PACKAGES}" \
		--essential-hook='./settz ${TARGET} ${TIMEZONE}' \
		--customize-hook='./setlocale ${TARGET} ${LOCALE} ${CHARSET}' \
		--hook-directory=hooks/${DISTRO} \
		--skip=check/empty \
		${FLAVOUR} ${TARGET} \
		${SOURCES}

install: bootstrap

.PHONY: bootstrap
