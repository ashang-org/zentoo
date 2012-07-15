# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython 2.7-pypy-*"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils

DESCRIPTION="Python Cryptography Toolkit"
HOMEPAGE="http://www.dlitz.net/software/pycrypto/ http://pypi.python.org/pypi/pycrypto"
SRC_URI="http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto/${P}.tar.gz"

LICENSE="PSF-2 public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc +gmp"

RDEPEND="gmp? ( dev-libs/gmp )"
DEPEND="${RDEPEND}
	doc? ( dev-python/docutils >=dev-python/epydoc-3 )"

PYTHON_CFLAGS=("2.* + -fno-strict-aliasing")

DOCS="ACKS ChangeLog README TODO"
PYTHON_MODNAME="Crypto"

src_configure() {
	econf \
		$(use_with gmp) \
		--without-mpir
}

src_compile() {
	distutils_src_compile

	if use doc; then
		einfo "Generation of documentation"
		rst2html.py Doc/pycrypt.rst > Doc/index.html
		PYTHONPATH="$(ls -d build-$(PYTHON --ABI -f)/lib.*)" epydoc --config=Doc/epydoc-config --exclude-introspect="^Crypto\.(Random\.OSRNG\.nt|Util\.winrandom)$" || die "Generation of documentation failed"
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml Doc/apidoc/* Doc/index.html
	fi
}