# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ETYPE="sources"
CKV="3.0.7"

K_USEPV=1
K_NOSETEXTRAVERSION=1

inherit kernel-2
detect_version

KEYWORDS="amd64 x86"
IUSE=""

DESCRIPTION="Full sources including Linux-VServer patchsets for the ${KV_MAJOR}.${KV_MINOR} kernel tree."
HOMEPAGE="http://www.gentoo.org/proj/en/vps/"
SRC_URI="${KERNEL_URI} ${ARCH_URI}
	http://vserver.13thfloor.at/Experimental/patch-${CKV}-vs${PV}.diff"

UNIPATCH_LIST="${DISTDIR}/patch-${CKV}-vs${PV}.diff"
UNIPATCH_STRICTORDER=1
