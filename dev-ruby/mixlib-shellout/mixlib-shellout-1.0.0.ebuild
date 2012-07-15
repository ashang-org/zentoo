# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Run external commands on Unix or Windows"
HOMEPAGE="http://github.com/opscode/mixlib-shellout"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""