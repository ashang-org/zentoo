# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base eutils
MY_PN="liblinear-weights"
MY_P="${MY_PN}-${PV}"

PYTHON_COMPAT=( python{2_6,2_7} )

DESCRIPTION="LIBLINEAR is a linear classifier for data with millions of instances and features."
HOMEPAGE="http://www.csie.ntu.edu.tw/~cjlin/liblinear/"
SRC_URI="http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/weights/liblinear-weights-1.94.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/mysql-python
		sci-libs/scikits_learn
		dev-python/pandas
"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${MY_P}"
INSTALL_DIR=/opt/${MY_PN}/bin

src_unpack() {
	unpack ${A}
}

src_compile() {
	pushd "${S}"
	make || die "make failed"
	popd
}

src_install() {
	dodir "${INSTALL_DIR}"
	mv "${S}"/train "${INSTALL_DIR}" || die "install failed"

	cat > 99${MY_PN} <<-EOF
		PATH=${INSTALL_DIR}
		ROOTPATH=${INSTALL_DIR}
	EOF
	doenvd 99${MY_PN} || die "doenvd failed"
}