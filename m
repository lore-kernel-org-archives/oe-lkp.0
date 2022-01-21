Content-Type: multipart/mixed; boundary="===============4678489125242559669=="
MIME-Version: 1.0
From: Justin Iurman <justin.iurman@uliege.be>
To: lkp@lists.01.org
Subject: [PATCH net] selftests: net: ioam: Fixes b63c5478e9
Date: Fri, 21 Jan 2022 18:34:49 +0100
Message-ID: <20220121173449.26918-1-justin.iurman@uliege.be>
List-Id: <oe-lkp.lists.linux.dev>

--===============4678489125242559669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The IOAM queue-depth data field was added a few weeks ago, but the test unit
was not updated accordingly. Here is the fix, thanks for the report.

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Justin Iurman <justin.iurman@uliege.be>
---
 tools/testing/selftests/net/ioam6_parser.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/ioam6_parser.c b/tools/testing/sel=
ftests/net/ioam6_parser.c
index 8f6997d35816..d9d1d4190126 100644
--- a/tools/testing/selftests/net/ioam6_parser.c
+++ b/tools/testing/selftests/net/ioam6_parser.c
@@ -240,11 +240,8 @@ static int check_ioam6_data(__u8 **p, struct ioam6_tra=
ce_hdr *ioam6h,
 		*p +=3D sizeof(__u32);
 	}
 =

-	if (ioam6h->type.bit6) {
-		if (__be32_to_cpu(*((__u32 *)*p)) !=3D 0xffffffff)
-			return 1;
+	if (ioam6h->type.bit6)
 		*p +=3D sizeof(__u32);
-	}
 =

 	if (ioam6h->type.bit7) {
 		if (__be32_to_cpu(*((__u32 *)*p)) !=3D 0xffffffff)
-- =

2.25.1

--===============4678489125242559669==--

