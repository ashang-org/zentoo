# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby22"

inherit ruby-ng

DESCRIPTION="Virtual ebuild for the Ruby OpenSSL bindings"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	ruby_targets_ruby19? ( dev-lang/ruby:1.9[ssl] )
	ruby_targets_ruby20? ( dev-lang/ruby:2.0[ssl] )
	ruby_targets_ruby21? ( dev-lang/ruby:2.1[ssl] )
	ruby_targets_ruby22? ( dev-lang/ruby:2.2[ssl] )"

pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { :; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() { :; }
