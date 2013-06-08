# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools eutils

DESCRIPTION="Jemalloc is a general-purpose scalable concurrent allocator"
HOMEPAGE="http://www.canonware.com/jemalloc/"
SRC_URI="http://www.canonware.com/download/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="debug static-libs stats"

src_prepare() {
	epatch \
		"${FILESDIR}/${PN}-3.0.0-strip-optimization.patch" \
		"${FILESDIR}/${PN}-3.0.0-no-pprof.patch" \
		"${FILESDIR}/${PN}-3.0.0_fix_html_install.patch"

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable stats)
}

src_install() {
	default
	dohtml doc/jemalloc.html

	use static-libs || find "${ED}" -name '*.a' -delete
}