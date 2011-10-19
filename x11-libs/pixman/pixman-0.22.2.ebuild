# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2 toolchain-funcs versionator

EGIT_REPO_URI="git://anongit.freedesktop.org/git/pixman"
DESCRIPTION="Low-level pixel manipulation routines"

KEYWORDS="amd64 x86"
IUSE="altivec mmx neon sse2"

pkg_setup() {
	xorg-2_pkg_setup

	local enable_mmx="$(use mmx && echo 1 || echo 0)"
	local enable_sse2="$(use sse2 && echo 1 || echo 0)"

	# this block fixes bug #260287
	if use x86; then
		if use sse2 && ! $(version_is_at_least "4.2" "$(gcc-version)"); then
			ewarn "SSE2 instructions require GCC 4.2 or higher."
			ewarn "pixman will be built *without* SSE2 support"
			enable_sse2="0"
		fi
	fi

	local confadd
	# this block fixes bug #236558
	case "$enable_mmx,$enable_sse2" in
	'1,1')
		confadd=(--enable-mmx --enable-sse2) ;;
	'1,0')
		confadd=(--enable-mmx --disable-sse2) ;;
	'0,1')
		ewarn "You enabled SSE2 but have MMX disabled. This is an invalid."
		ewarn "pixman will be built *without* MMX/SSE2 support."
		confadd=(--disable-mmx --disable-sse2) ;;
	'0,0')
		confadd=(--disable-mmx --disable-sse2) ;;
	esac

	XORG_CONFIGURE_OPTIONS=(
		"${confadd[@]}"
		$(use_enable altivec vmx)
		$(use_enable neon arm-neon)
		--disable-gtk
	)
}