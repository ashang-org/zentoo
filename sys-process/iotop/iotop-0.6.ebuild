# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3} pypy{1_9,2_0} )
PYTHON_REQ_USE="ncurses(+)"

inherit distutils-r1 linux-info

DESCRIPTION="Top-like UI used to show which process is using the I/O"
HOMEPAGE="http://guichaz.free.fr/iotop/"
SRC_URI="http://guichaz.free.fr/iotop//files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

CONFIG_CHECK="~TASK_IO_ACCOUNTING ~TASK_DELAY_ACCT ~TASKSTATS ~VM_EVENT_COUNTERS"
DOCS=( NEWS README THANKS ChangeLog )

PATCHES=( "${FILESDIR}"/${P}-setup.py3.patch )

pkg_setup() {
	linux-info_pkg_setup
}