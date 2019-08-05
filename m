Content-Type: multipart/mixed; boundary="===============4547137201857591027=="
MIME-Version: 1.0
From: Dmitry V. Levin <ldv@altlinux.org>
To: lkp@lists.01.org
Subject: Re: [ptrace] 201766a20e: kernel_selftests.seccomp.make_fail
Date: Mon, 05 Aug 2019 12:47:19 +0300
Message-ID: <20190805094719.GA1693@altlinux.org>
In-Reply-To: <20190729093530.GL22106@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4547137201857591027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2019 at 05:35:30PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 201766a20e30f982ccfe36bebfad9602c3ff574a ("ptrace: add PTRACE_GET=
_SYSCALL_INFO request")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
> =

> in testcase: kernel_selftests
> with following parameters:
> =

> 	group: kselftests-02
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt

The URL above also says: "Tests are intended to be run after building,
installing and booting a kernel".

Please build selftests with installed kernel headers corresponding to the
installed kernel.

Alternatively, tools/testing/selftests/lib.mk could be extended
to include uapi headers from the kernel tree into CPPFLAGS, e.g.

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 1c8a1963d03f..b5f4f0fb8eeb 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -10,6 +10,9 @@ ifeq (0,$(MAKELEVEL))
 endif
 selfdir =3D $(realpath $(dir $(filter %/lib.mk,$(MAKEFILE_LIST))))
 =

+uapi_dir =3D $(realpath $(selfdir)/../../../include/uapi)
+CPPFLAGS +=3D -I$(uapi_dir)
+
 # The following are built by lib.mk common compile rules.
 # TEST_CUSTOM_PROGS should be used by tests that require
 # custom build rule and prevent common build rule use.


-- =

ldv

--===============4547137201857591027==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSWNCQUVCQ0FBR0JRSmRSL3NuQUFvSkVB
VkZUK0JWbkNVSXM3c1AvalVoQVJZL1cxM2h0d2Vwc2EzZjIrY1MKb0duTE95T052Uk41cWdFSktS
Rm4xby81RnRUYUV1YzdZbTBWMnpXWkpCdFBNV3J6a1lhdWxJMjc5VFMxaVRrbQpXS1RibTZGRHlQ
RExkWFFoOXpOMXF0L1VWL2FMaVJsQk5qR1pJdUVLUTFSTVd1YW5pVG84c3lBc1MyT29vY3BwCmFo
Ri8rMFhqK1RTNjlobGhkakhNdkptbjNweFZ3Z2F2VTk2ZGRlanVmWkppK09BdC9Lc1pQUWxOVWpj
ZWZuNE0KeTlyaXF5YWpSd1c1ZVJWOEZtNVNSS2hGNDgxSlc2aTZaNGVqNHJvMzhIayszM0JiSjIx
Vy9JMXJSL2FJNXkzSgoxdUtpeStFYjA4ZG1NcERWV3RHS1ZFRUh4YnhwYmQyRXNjK21MOU9XWDJM
SitKd0tSOVpZeDBYWVc1bXhic2pMClVzc2hSb1BUbkFEVlV6YzNvbERBWlE5VzFHeTAxTEl6TllM
R0hoZmFPS0w3dkdabUFkelo5NFdsMUNvN20xNnYKT3ZJWDFzcnUrRTJBbldqeG5UYTFCSENJQTBw
dWlJbW5ZQmZidlJWNUY2a0g0MlBPZGlaTW5ZZkJLbWdCSHdvbQpQYS9XTlJDNGZTZkhtamNyZVRQ
bGgyV011RlNqN1JkTjAzMFRwYmI3eXBpZ0wxTzRGY2JETWRiendqSzVEenc5Cm1zOSswNmp4OHBF
VDJGaVBtSitpdnZwcU16S293QS9qZ2JzTjBNNmJZMEVScUlZN3VQUXY0N1lXem5INkpPSUUKTkFP
M0x2aHlET3RqNGl4STNxYUk4NXVDTXlSVnR0YlM1bVdNY25ESlhNVnhuZVd6djVaT3BtYkhnZGwx
UHBLeQo0alVNbzlTVDZWRUZ0S3pycS81Vgo9RjlyOQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0t
LS0K

--===============4547137201857591027==--

