# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_9 )
inherit python-single-r1 git-r3

DESCRIPTION="Build and document REST APIs with aiohttp and apispec"
HOMEPAGE="https://github.com/maximdanilchenko/aiohttp-apispec"
EGIT_REPO_URI="https://github.com/maximdanilchenko/aiohttp-apispec.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	${PYTHON_DEPS}
	dev-python/aiohttp
	dev-python/apispec
	dev-python/pytest
	>=dev-python/marshmallow-3.14.0"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	python_domodule aiohttp-apispec
}
