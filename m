Content-Type: multipart/mixed; boundary="===============2585829390052607825=="
MIME-Version: 1.0
From: Jakub Kicinski <kuba@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH net] selftests: net: ioam: Fixes b63c5478e9
Date: Fri, 21 Jan 2022 19:27:28 -0800
Message-ID: <20220121192728.5f9170a7@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220121173449.26918-1-justin.iurman@uliege.be>
List-Id: <oe-lkp.lists.linux.dev>

--===============2585829390052607825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Jan 2022 18:34:49 +0100 Justin Iurman wrote:
> Subject: [PATCH net] selftests: net: ioam: Fixes b63c5478e9

selftests: net: ioam: expect support for Queue depth data

> Date: Fri, 21 Jan 2022 18:34:49 +0100
> X-Mailer: git-send-email 2.25.1
> =

> The IOAM queue-depth data field was added a few weeks ago, but the test u=
nit
> was not updated accordingly. Here is the fix, thanks for the report.

s/Here.*//

> Reported-by: kernel test robot <oliver.sang@intel.com>

Fixes: b63c5478e9cb ("ipv6: ioam: Support for Queue depth data field")

> Signed-off-by: Justin Iurman <justin.iurman@uliege.be>

Applied, thanks!
--===============2585829390052607825==--

