# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=RJBS
MODULE_VERSION=0.110
inherit perl-module

DESCRIPTION="Test::Deep - Extremely flexible deep comparison"

SLOT="0"
KEYWORDS="amd64"
IUSE="test"

DEPEND="
	test? ( dev-perl/Test-NoWarnings
		|| ( >=virtual/perl-Test-Simple-1.1.10 dev-perl/Test-Tester )
	)"
RDEPEND=""

SRC_TEST="do"
