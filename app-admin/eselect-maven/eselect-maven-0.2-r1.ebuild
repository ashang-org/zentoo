# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Manages Maven symlinks"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=app-admin/eselect-1.2.8
	!<dev-java/maven-bin-2.0.10-r1:2.1"
PDEPEND="
|| (
	dev-java/maven-bin:3.0
	dev-java/maven-bin:2.2
	dev-java/maven-bin:2.1
	dev-java/maven-bin:2.0
)"

src_install() {
	insinto /usr/share/eselect/modules
	newins "${FILESDIR}/maven-${PV}.eselect" maven.eselect \
		|| die "newins failed"
}
