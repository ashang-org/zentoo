# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=AUDREYT
MODULE_VERSION=1.33
inherit perl-module

DESCRIPTION="East Asian Width properties"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="virtual/perl-File-Spec"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker"

SRC_TEST="do"
