# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_10 )
inherit python-single-r1

DESCRIPTION="Extension for nautilus to do administrative operations"
HOMEPAGE="https://github.com/brunonova/${PN}"
SRC_URI="https://github.com/brunonova/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	sys-devel/gettext
	$(python_gen_cond_dep '
		dev-python/nautilus-python
	')
"
RDEPEND="
	${PYTHON_DEPS}
	${DEPEND}
"
BDEPEND="
	${RDEPEND}
	dev-util/cmake
"

src_prepare() {
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	eapply_user
	S="${WORKDIR}/${P}/build"
}
