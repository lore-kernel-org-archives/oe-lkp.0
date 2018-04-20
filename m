Content-Type: multipart/mixed; boundary="===============3024298810839687373=="
MIME-Version: 1.0
From: Yury Norov <ynorov@caviumnetworks.com>
To: lkp@lists.01.org
Subject: [PATCH] lib: avoid soft lockup in test_find_first_bit()
Date: Fri, 20 Apr 2018 20:19:49 +0300
Message-ID: <20180420171949.15710-1-ynorov@caviumnetworks.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3024298810839687373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

test_find_first_bit() is intentionally sub-optimal,
and may cause soft lockup due to long time of run on some systems.
So decrease length of bitmap to traverse to avoid lockup.

With the change below, time of test execution doesn't exceed 0.2
seconds on my testing system.

Signed-off-by: Yury Norov <ynorov@caviumnetworks.com>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Fixes: 4441fca0a27f5 ("lib: test module for find_*_bit() functions")
---
 lib/find_bit_benchmark.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/find_bit_benchmark.c b/lib/find_bit_benchmark.c
index 5985a25e6cbc..5367ffa5c18f 100644
--- a/lib/find_bit_benchmark.c
+++ b/lib/find_bit_benchmark.c
@@ -132,7 +132,12 @@ static int __init find_bit_test(void)
 	test_find_next_bit(bitmap, BITMAP_LEN);
 	test_find_next_zero_bit(bitmap, BITMAP_LEN);
 	test_find_last_bit(bitmap, BITMAP_LEN);
-	test_find_first_bit(bitmap, BITMAP_LEN);
+
+	/*
+	 * test_find_first_bit() may take some time, so
+	 * traverse only part of bitmap to avoid soft lockup.
+	 */
+	test_find_first_bit(bitmap, BITMAP_LEN / 10);
 	test_find_next_and_bit(bitmap, bitmap2, BITMAP_LEN);
 =

 	pr_err("\nStart testing find_bit() with sparse bitmap\n");
-- =

2.14.1


--===============3024298810839687373==--

