# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Remember: we cannot leverage autotools in this ebuild in order
#           to avoid circular deps with autotools

EAPI="2"

MY_P="${PN/-utils}-${PV/_}"
SRC_URI="http://tukaani.org/xz/${MY_P}.tar.gz"
KEYWORDS="amd64 x86"
S=${WORKDIR}/${MY_P}
EXTRA_DEPEND=

inherit eutils multilib

DESCRIPTION="utils for managing LZMA compressed files"
HOMEPAGE="http://tukaani.org/xz/"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="nls static-libs +threads"

RDEPEND="!<app-arch/lzma-4.63
	!app-arch/lzma-utils
	!<app-arch/p7zip-4.57"
DEPEND="${RDEPEND}
	${EXTRA_DEPEND}"

if [[ ${PV} == "9999" ]] ; then
src_prepare() {
	eautopoint
	eautoreconf
}
fi

src_configure() {
	econf \
		$(use_enable nls) \
		$(use_enable threads) \
		$(use_enable static-libs static)
}

src_install() {
	emake install DESTDIR="${D}" || die
	rm "${D}"/usr/share/doc/xz/COPYING* || die
	mv "${D}"/usr/share/doc/{xz,${PF}} || die
	dodoc AUTHORS ChangeLog NEWS README THANKS
}

pkg_preinst() {
	preserve_old_lib /usr/$(get_libdir)/liblzma.so.0
}

pkg_postinst() {
	preserve_old_lib_notify /usr/$(get_libdir)/liblzma.so.0
}