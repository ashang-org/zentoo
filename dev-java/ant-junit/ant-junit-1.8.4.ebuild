# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit ant-tasks

KEYWORDS="amd64"
IUSE=""

DEPEND="dev-java/junit:0"
RDEPEND="${DEPEND}"

src_compile() {
	eant jar-junit
}