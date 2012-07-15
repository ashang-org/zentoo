# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

XORG_DOC="doc"
inherit xorg-2

DESCRIPTION="X.Org Xtst library"

KEYWORDS="amd64"
IUSE=""

RDEPEND="x11-libs/libX11
	>=x11-libs/libXext-1.0.99.4
	x11-libs/libXi
	>=x11-proto/recordproto-1.13.99.1
	>=x11-proto/xextproto-7.0.99.3
	x11-proto/inputproto"
DEPEND="${RDEPEND}"