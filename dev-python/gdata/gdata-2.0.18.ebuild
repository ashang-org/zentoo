# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7} pypy2_0 )
PYTHON_REQ_USE="ssl(+),xml(+)"

inherit distutils-r1

DESCRIPTION="Python client library for Google data APIs"
HOMEPAGE="http://code.google.com/p/gdata-python-client/ http://pypi.python.org/pypi/gdata"
SRC_URI="http://gdata-python-client.googlecode.com/files/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="examples"

python_test() {
	# run_service_tests.py requires interaction (and a valid Google account), so skip it.
	"${PYTHON}" tests/run_data_tests.py -v || die "Test failed under ${EPYTHON}"
}

python_install_all() {
	use examples && local EXAMPLES=( samples/. )
	distutils-r1_python_install_all
}