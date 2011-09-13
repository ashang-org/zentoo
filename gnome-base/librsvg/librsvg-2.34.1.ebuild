# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
GNOME2_LA_PUNT="yes"
GCONF_DEBUG="no"

inherit gnome2 multilib eutils autotools

DESCRIPTION="Scalable Vector Graphics (SVG) rendering library"
HOMEPAGE="http://librsvg.sourceforge.net/"

LICENSE="LGPL-2"
SLOT="2"
KEYWORDS="amd64 x86"
IUSE="doc +gtk tools"

RDEPEND=">=media-libs/fontconfig-1.0.1
	>=media-libs/freetype-2
	>=dev-libs/glib-2.24:2
	>=x11-libs/cairo-1.2
	>=x11-libs/pango-1.10
	>=dev-libs/libxml2-2.4.7:2
	>=dev-libs/libcroco-0.6.1
	|| ( x11-libs/gdk-pixbuf:2
		x11-libs/gtk+:2 )
	gtk? ( >=x11-libs/gtk+-2.16:2 )"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.12
	doc? ( >=dev-util/gtk-doc-1.13 )
	>=dev-util/gtk-doc-am-1.13"
# >=dev-util/gtk-doc-am-1.13 needed by eautoreconf

pkg_setup() {
	# croco is forced on to respect SVG specification
	G2CONF="${G2CONF}
		--disable-static
		$(use_enable tools)
		$(use_enable gtk gtk-theme)
		--with-croco
		--enable-pixbuf-loader
		--with-gtk=2.0"
	DOCS="AUTHORS ChangeLog README NEWS TODO"
}

src_prepare() {
	gnome2_src_prepare

	# Fix automagic gtk+ dependency, bug #371290
	epatch "${FILESDIR}/${PN}-2.34.0-automagic-gtk.patch"
	eautoreconf
}

pkg_postinst() {
	gdk-pixbuf-query-loaders > "${EROOT}/usr/$(get_libdir)/gdk-pixbuf-2.0/2.10.0/loaders.cache"
}

pkg_postrm() {
	gdk-pixbuf-query-loaders > "${EROOT}/usr/$(get_libdir)/gdk-pixbuf-2.0/2.10.0/loaders.cache"
}