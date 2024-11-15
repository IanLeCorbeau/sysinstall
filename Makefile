# Makefile for custom installs and ISOs/Releases.

include config.mk

bootstrap:
	/usr/bin/mmdebstrap --variant="${VARIANT}" \
		--components="${COMPONENTS}" \
		--include="${PACKAGES}" \
		--hook-directory=hooks/${DISTRO} \
		${FLAVOUR} ${TARGET} \
		${SOURCES}

install: bootstrap

.PHONY: bootstrap