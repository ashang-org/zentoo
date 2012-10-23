# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit base

MY_PN=${PN/headers/driver}
MY_P="${MY_PN}-${PV/_rc/rc}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Header files for Advanced Linux Sound Architecture kernel modules"
HOMEPAGE="http://www.alsa-project.org/"
SRC_URI="mirror://alsaproject/driver/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="binchecks strip"

PATCHES=(
	"${FILESDIR}/${PN}-1.0.6a-user.patch"
)

# Remove the sound symlink workaround...
pkg_setup() {
	if [[ -L ${EROOT}usr/include/sound ]]; then
		rm	"${EROOT}usr/include/sound"
	fi
}

src_configure() { :; }

src_compile() { :; }

src_install() {
	cd "${S}/alsa-kernel/include"
	insinto /usr/include/sound
	doins *.h || die "include failed"
}
