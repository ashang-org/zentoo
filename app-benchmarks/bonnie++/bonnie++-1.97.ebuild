# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-benchmarks/bonnie++/bonnie++-1.97.ebuild,v 1.1 2012/12/10 05:23:01 patrick Exp $

EAPI="2"

inherit eutils

DESCRIPTION="Hard drive bottleneck testing benchmark suite."
HOMEPAGE="http://www.coker.com.au/bonnie++/"
SRC_URI="http://www.coker.com.au/bonnie++/experimental/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="debug"

DEPEND=""
RDEPEND=""

# hmm?
S="${WORKDIR}/${P}.1"

src_prepare() {
	epatch "${FILESDIR}/${PN}-1.96-compile-flags.patch"
}

src_configure() {
	econf \
		$(use_with debug) \
		--disable-stripping \
		|| die
}

src_compile() {
	emake || die "emake failed"
	emake zcav || die "emake zcav failed" # see #9073
}

src_install() {
	dosbin bonnie++ zcav || die
	dobin bon_csv2html bon_csv2txt || die
	doman bon_csv2html.1 bon_csv2txt.1 bonnie++.8 zcav.8
	dohtml readme.html
	dodoc changelog.txt credits.txt
}
