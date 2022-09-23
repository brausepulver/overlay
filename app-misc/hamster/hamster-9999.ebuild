# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_10 )
inherit xdg-utils gnome2-utils git-r3 python-single-r1

DESCRIPTION="The Gnome Time Tracker"
HOMEPAGE="https://github.com/projecthamster/${PN}"
EGIT_REPO_URI="https://github.com/projecthamster/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	$(python_gen_cond_dep '
		dev-python/pygobject[${PYTHON_USEDEP}]
		dev-python/pyxdg[${PYTHON_USEDEP}]
	')
"
RDEPEND="
	${PYTHON_DEPS}
	${DEPEND}
"
BDEPEND="${RDEPEND}"

src_prepare() {
	eapply "${FILESDIR}"/${P}-destdir.patch
	eapply_user
}

src_compile() {
	./waf configure build --skip-icon-cache-update
}

src_install() {
	( umask 0022 && ./waf --destdir="${D}" install; )
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	xdg_icon_cache_update
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_icon_cache_update
	gnome2_schemas_update
}
