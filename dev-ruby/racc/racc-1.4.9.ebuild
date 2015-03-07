# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_EXTRADOC="README.rdoc README.ja.rdoc TODO ChangeLog"

inherit multilib ruby-fakegem

DESCRIPTION="A LALR(1) parser generator for Ruby"
HOMEPAGE="http://www.loveruby.net/en/racc.html"

LICENSE="LGPL-2.1"
SLOT="0"

KEYWORDS="amd64"
IUSE="doc test"

ruby_add_bdepend "dev-ruby/rake"

all_ruby_prepare() {
	sed -i -e 's|/tmp/out|${TMPDIR:-/tmp}/out|' test/helper.rb || die "tests fix failed"

	# Avoid depending on rake-compiler since we don't use it to compile
	# the extension.
	sed -i -e '/rake-compiler/ s:^:#:' -e '/extensiontask/ s:^:#:' Rakefile
	sed -i -e '/ExtensionTask/,/^  end/ s:^:#:' Rakefile

	# Avoid isolation since dependencies are not properly declared.
	sed -i -e 's/, :isolate//' Rakefile || die
}

each_ruby_prepare() {
	${RUBY} -Cext/racc extconf.rb || die
}

each_ruby_compile() {
	emake -Cext/racc
	# Copy over the file here so that we don't have to do
	# special ruby install for JRuby and the other
	# implementations.
	cp -l ext/racc/cparse$(get_modname) lib/racc/cparse$(get_modname) || die
}

each_ruby_test() {
	${RUBY} -Ilib -S testrb test/test_*.rb || die
}

all_ruby_install() {
	all_fakegem_install

	dodoc -r rdoc

	docinto examples
	dodoc -r sample
}
