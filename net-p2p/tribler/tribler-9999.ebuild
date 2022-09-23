# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

DESCRIPTION="Privacy enhanced BitTorrent client with P2P content discovery"
HOMEPAGE="https://github.com/Tribler/tribler"
#SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
# The following is missing the pip module aiohttp_apispec, since there's no corresponding Gentoo package.
RDEPEND="${DEPEND}
	>=dev-python/Faker-12.0.1
	dev-python/yappi
	dev-python/matplotlib
	dev-python/scipy

	dev-python/aiohttp
	dev-python/marshmallow
	dev-python/sentry-sdk
	dev-python/configobj
	dev-python/cryptography
	dev-python/libnacl
	dev-python/lz4
	dev-python/chardet
	dev-python/netifaces
	dev-python/networkx
	dev-python/pillow
	>=dev-python/pony-0.7.10
	dev-python/psutil
	dev-python/pyasn1
	dev-python/pyqtgraph
	dev-python/PyQt5
	dev-python/pyyaml

	dev-libs/libsodium
	net-libs/libtorrent-rasterbar[python]

	dev-python/pydantic
	dev-python/anyio
	dev-python/aiohttp
	dev-python/markupsafe"
	#dev-python/aiohttp-apispec"
BDEPEND=""

src_unpack() {
	mkdir "${S}"
	cd "${S}"
}
