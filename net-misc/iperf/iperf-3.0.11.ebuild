# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools eutils

DESCRIPTION="A TCP, UDP, and SCTP network bandwidth measurement tool"
LICENSE="BSD"
SLOT="3"
HOMEPAGE="https://github.com/esnet/iperf/"
SRC_URI="https://codeload.github.com/esnet/${PN}/tar.gz/${PV} -> ${P}.tar.gz"
KEYWORDS="amd64"
IUSE="static-libs"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-3.0.5-flags.patch
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	prune_libtool_files
}
