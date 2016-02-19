# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Fuse-filesystem utilizing the sftp service"
HOMEPAGE="https://github.com/libfuse/sshfs"
SRC_URI="https://github.com/libfuse/sshfs/releases/download/sshfs-${PV//./_}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="amd64"
SLOT="0"

CDEPEND=">=sys-fs/fuse-2.6.0_pre3
	>=dev-libs/glib-2.4.2"
RDEPEND="${CDEPEND}
	>=net-misc/openssh-4.3"
DEPEND="${CDEPEND}
	virtual/pkgconfig"

DOCS=( README NEWS ChangeLog AUTHORS FAQ.txt )

src_configure() {
	# hack not needed with >=net-misc/openssh-4.3
	econf --disable-sshnodelay
}
