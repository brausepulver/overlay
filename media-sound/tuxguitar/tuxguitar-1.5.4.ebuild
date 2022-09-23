# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker xdg

DESCRIPTION="Multitrack guitar tablature editor and player"
HOMEPAGE="http://www.tuxguitar.com.ar/"
SRC_URI="mirror://sourceforge/${PN}/${P}-linux-x86_64.deb"

LICENSE="LGPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	virtual/jack
	media-sound/fluidsynth
"
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
	unpack_deb "${P}-linux-x86_64.deb"
	default
}

src_install() {
	cp -R "${S}"/* "${D}/" || die "Install failed!"
}

src_postinst() {
	xdg_pkg_postinst
}

src_postrm() {
	xdg_pkg_postrm
}
