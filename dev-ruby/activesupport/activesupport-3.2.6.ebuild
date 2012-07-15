# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# jruby fails tests.
USE_RUBY="ruby18 ree18 ruby19"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.rdoc"

RUBY_FAKEGEM_GEMSPEC="activesupport.gemspec"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem versionator

DESCRIPTION="Utility Classes and Extension to the Standard Library"
HOMEPAGE="http://rubyforge.org/projects/activesupport/"
SRC_URI="https://github.com/rails/rails/tarball/v${PV} -> rails-${PV}.tgz"

LICENSE="MIT"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="amd64"
IUSE=""

RUBY_S="rails-rails-*/${PN}"

ruby_add_rdepend ">=dev-ruby/memcache-client-1.5.8
	>=dev-ruby/multi_json-1.0
	dev-ruby/i18n:0.6
	!!<dev-ruby/activesupport-3.0.11-r1:3.0"

# libxml-ruby, nokogiri, and builder are not strictly needed, but there
# are tests using this code.
ruby_add_bdepend "test? (
	virtual/ruby-test-unit
	>=dev-ruby/libxml-2.0.0
	dev-ruby/nokogiri
	dev-ruby/builder:0
	)"

all_ruby_prepare() {
	# don't support older mocha versions as the optional codepath
	# breaks JRuby
	epatch "${FILESDIR}"/${PN}-3.0.3-mocha-0.9.5.patch

	# Set test environment to our hand.
#	rm "${S}/../Gemfile" || die "Unable to remove Gemfile"
	sed -i -e '/load_paths/d' test/abstract_unit.rb || die "Unable to remove load paths"
}