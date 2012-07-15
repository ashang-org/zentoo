# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils autotools

DESCRIPTION="chrpath can modify the rpath and runpath of ELF executables"
HOMEPAGE="http://directory.fsf.org/project/chrpath/"
# original upstream no longer exists (ftp://ftp.hungry.com/pub/hungry)
SRC_URI="http://ftp.tux.org/pub/X-Windows/ftp.hungry.com/chrpath/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="static-libs"

src_prepare() {
	epatch "${FILESDIR}"/${P}-multilib.patch
	epatch "${FILESDIR}"/${PN}-keepgoing.patch
	epatch "${FILESDIR}"/${P}-testsuite-1.patch
	# disable installing redundant docs in the wrong dir
	sed -i -e '/doc_DATA/d' Makefile.am || die
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static) || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ChangeLog AUTHORS NEWS README
	use static-libs || find "${D}" -name "*.la" -exec rm '{}' +
}