# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

if [ "${PV}" = "9999" ]; then
	EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/udev-gentoo-scripts.git"
	inherit git-2
fi

DESCRIPTION="udev startup scripts for openrc"
HOMEPAGE="http://www.gentoo.org"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

if [ "${PV}" != "9999" ]; then
	SRC_URI="http://dev.gentoo.org/~williamh/dist/${P}.tar.bz2"
	KEYWORDS="amd64"
fi

RESTRICT="test"

DEPEND=""
RDEPEND=">=sys-fs/udev-180
	sys-apps/openrc
	!<sys-fs/udev-186"

pkg_postinst()
{
	# If we are building stages, add udev and udev-mount to the sysinit runlevel
	# automatically.
	if use build
	then
		if [[ -x "${ROOT}"/etc/init.d/udev \
			&& -d "${ROOT}"/etc/runlevels/sysinit ]]
		then
			ln -s /etc/init.d/udev "${ROOT}"/etc/runlevels/sysinit/udev
		fi
		if [[ -x "${ROOT}"/etc/init.d/udev-mount \
			&& -d "${ROOT}"/etc/runlevels/sysinit ]]
		then
			ln -s /etc/init.d/udev-mount \
				"${ROOT}"/etc/runlevels/sysinit/udev-mount
		fi
	fi

	# Warn the user about adding the scripts to their sysinit runlevel
	if [[ -e "${ROOT}"/etc/runlevels/sysinit ]]
	then
		if [[ ! -e "${ROOT}"/etc/runlevels/sysinit/udev ]]
		then
			ewarn
			ewarn "You need to add udev to the sysinit runlevel."
			ewarn "If you do not do this,"
			ewarn "your system will not be able to boot!"
			ewarn "Run this command:"
			ewarn "\trc-update add udev sysinit"
		fi
		if [[ ! -e "${ROOT}"/etc/runlevels/sysinit/udev-mount ]]
		then
			ewarn
			ewarn "You need to add udev-mount to the sysinit runlevel."
			ewarn "If you do not do this,"
			ewarn "your system will not be able to boot!"
			ewarn "Run this command:"
			ewarn "\trc-update add udev-mount sysinit"
		fi
	fi

	ewarn "The udev-postmount service has been removed because the reasons for"
	ewarn "its existance have been removed upstream."
	ewarn "Please remove it from your runlevels."
}
