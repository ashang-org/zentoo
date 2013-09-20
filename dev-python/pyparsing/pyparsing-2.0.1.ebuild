# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0 )

inherit distutils-r1

DESCRIPTION="pyparsing is an easy-to-use Python module for text parsing"
HOMEPAGE="http://pyparsing.wikispaces.com/ http://pypi.python.org/pypi/pyparsing"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc examples"

RDEPEND="!dev-python/pyparsing:py2 !dev-python/pyparsing:py3"

python_install_all() {
	local HTML_DOCS=( HowToUsePyparsing.html )
	use doc && HTML_DOCS+=( htmldoc/ )

	distutils-r1_python_install_all

	use doc && dodoc docs/*.pdf
	use examples && dodoc -r examples
}
