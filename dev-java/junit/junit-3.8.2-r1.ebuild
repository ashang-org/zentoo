# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_P=${P/-/}
S=${WORKDIR}/${MY_P}
DESCRIPTION="Simple framework to write repeatable tests"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip"
HOMEPAGE="http://www.junit.org/"
LICENSE="CPL-1.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip"
RDEPEND=">=virtual/jre-1.4"

src_unpack() {
	unpack ${A}
	cd "${S}"

	unzip src.jar || die
	rm -v *.jar || die
	rm -rf javadoc ${PN}${PV} || die
	cp "${FILESDIR}/${P}-build.xml" build.xml || die
}

EANT_BUILD_TARGET="dist"

src_install() {
	use source && java-pkg_dosrc ${PN}
	cd ${MY_P}
	java-pkg_dojar ${PN}.jar
	dohtml README.html cpl-v10.html || die
	if use doc; then
		dohtml -r doc || die
		java-pkg_dojavadoc javadoc
	fi
}
