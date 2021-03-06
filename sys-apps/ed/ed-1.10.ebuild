# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit toolchain-funcs unpacker

DESCRIPTION="Your basic line editor"
HOMEPAGE="https://www.gnu.org/software/ed/"
SRC_URI="mirror://gnu/ed/${P}.tar.lz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="$(unpacker_src_uri_depends)
	sys-apps/texinfo"
RDEPEND=""

src_configure() {
	# Upstream configure script is moronic.
	econf \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${CFLAGS} ${LDFLAGS}" \
		CPPFLAGS="${CPPFLAGS}" \
		--bindir="${EPREFIX}/bin"
}
