# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="LSB version query program"
HOMEPAGE="http://www.linuxbase.org/"
SRC_URI="mirror://sourceforge/lsb/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# Perl isn't needed at runtime, it is just used to generate the man page.
DEPEND="dev-lang/perl"
RDEPEND=""

src_install() {
	emake \
		prefix="${D}/usr" \
		mandir="${D}/usr/share/man" \
		install \
		|| die "emake install failed"

	mkdir -p "${D}/etc"
	cat > "${D}/etc/lsb-release" <<- EOF
		DISTRIB_ID="Gentoo"
	EOF
}
