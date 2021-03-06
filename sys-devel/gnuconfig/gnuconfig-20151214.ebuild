# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils
if [[ ${PV} == "99999999" ]] ; then
	EGIT_REPO_URI="git://git.savannah.gnu.org/config.git
		http://git.savannah.gnu.org/r/config.git"

	inherit git-2
else
	SRC_URI="mirror://gentoo/${P}.tar.bz2"
	KEYWORDS="amd64"
fi

DESCRIPTION="Updated config.sub and config.guess file from GNU"
HOMEPAGE="http://savannah.gnu.org/projects/config"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

S=${WORKDIR}

maint_pkg_create() {
	cd "${S}"

	local ver=$(gawk '{ gsub(/-/, "", $1); print $1; exit }' ChangeLog)
	[[ ${#ver} != 8 ]] && die "invalid version '${ver}'"

	cp "${FILESDIR}"/${PV}/*.patch . || die

	local tar="${T}/gnuconfig-${ver}.tar.bz2"
	tar -jcf ${tar} ./* || die "creating tar failed"
	einfo "Packaged tar now available:"
	einfo "$(du -b ${tar})"
}

src_unpack() {
	if [[ ${PV} == "99999999" ]] ; then
		git-2_src_unpack
		maint_pkg_create
	else
		unpack ${A}
	fi
}

src_prepare() {
	epatch "${WORKDIR}"/*.patch
	use elibc_uclibc && sed -i 's:linux-gnu:linux-uclibc:' testsuite/config-guess.data #180637
}

src_compile() { :;}

src_test() {
	emake check
}

src_install() {
	insinto /usr/share/${PN}
	doins config.{sub,guess} || die
	fperms +x /usr/share/${PN}/config.{sub,guess}
	dodoc ChangeLog
}
