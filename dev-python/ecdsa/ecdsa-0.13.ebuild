# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="ECDSA cryptographic signature library in pure Python"
HOMEPAGE="https://github.com/warner/python-ecdsa"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	esetup.py test
}
