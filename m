Content-Type: multipart/mixed; boundary="===============7442142869603755929=="
MIME-Version: 1.0
From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
To: lkp@lists.01.org
Subject: [PATCH v1 1/2] mm: hwpoison: call shake_page() unconditionally
Date: Wed, 26 Apr 2017 18:10:40 +0900
Message-ID: <1493197841-23986-2-git-send-email-n-horiguchi@ah.jp.nec.com>
In-Reply-To: <1493197841-23986-1-git-send-email-n-horiguchi@ah.jp.nec.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7442142869603755929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

shake_page() is called before going into core error handling code in order
to ensure that the error page is flushed from lru_cache lists where pages
stay during transferring among LRU lists.
But currently it's not fully functional because when the page is linked to
lru_cache by calling activate_page(), its PageLRU flag is set and
shake_page() is skipped. The result is to fail error handling with "still
referenced by 1 users" message.
When the page is linked to lru_cache by isolate_lru_page(), its PageLRU is
clear, so that's fine.

This patch makes shake_page() unconditionally called to avoild the failure.

Link: http://lkml.kernel.org/r/20170417055948.GM31394(a)yexl-desktop
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
---
 mm/hwpoison-inject.c |  3 +--
 mm/memory-failure.c  | 27 +++++++++++----------------
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git v4.11-rc6-mmotm-2017-04-13-14-50/mm/hwpoison-inject.c v4.11-rc6-=
mmotm-2017-04-13-14-50_patched/mm/hwpoison-inject.c
index 9d26fd9..356df05 100644
--- v4.11-rc6-mmotm-2017-04-13-14-50/mm/hwpoison-inject.c
+++ v4.11-rc6-mmotm-2017-04-13-14-50_patched/mm/hwpoison-inject.c
@@ -34,8 +34,7 @@ static int hwpoison_inject(void *data, u64 val)
 	if (!hwpoison_filter_enable)
 		goto inject;
 =

-	if (!PageLRU(hpage) && !PageHuge(p))
-		shake_page(hpage, 0);
+	shake_page(hpage, 0);
 	/*
 	 * This implies unable to support non-LRU pages.
 	 */
diff --git v4.11-rc6-mmotm-2017-04-13-14-50/mm/memory-failure.c v4.11-rc6-m=
motm-2017-04-13-14-50_patched/mm/memory-failure.c
index 8c02811..77cf9c3 100644
--- v4.11-rc6-mmotm-2017-04-13-14-50/mm/memory-failure.c
+++ v4.11-rc6-mmotm-2017-04-13-14-50_patched/mm/memory-failure.c
@@ -220,6 +220,9 @@ static int kill_proc(struct task_struct *t, unsigned lo=
ng addr, int trapno,
  */
 void shake_page(struct page *p, int access)
 {
+	if (PageHuge(p))
+		return;
+
 	if (!PageSlab(p)) {
 		lru_add_drain_all();
 		if (PageLRU(p))
@@ -1140,22 +1143,14 @@ int memory_failure(unsigned long pfn, int trapno, i=
nt flags)
 	 * The check (unnecessarily) ignores LRU pages being isolated and
 	 * walked by the page reclaim code, however that's not a big loss.
 	 */
-	if (!PageHuge(p)) {
-		if (!PageLRU(p))
-			shake_page(p, 0);
-		if (!PageLRU(p)) {
-			/*
-			 * shake_page could have turned it free.
-			 */
-			if (is_free_buddy_page(p)) {
-				if (flags & MF_COUNT_INCREASED)
-					action_result(pfn, MF_MSG_BUDDY, MF_DELAYED);
-				else
-					action_result(pfn, MF_MSG_BUDDY_2ND,
-						      MF_DELAYED);
-				return 0;
-			}
-		}
+	shake_page(p, 0);
+	/* shake_page could have turned it free. */
+	if (!PageLRU(p) && is_free_buddy_page(p)) {
+		if (flags & MF_COUNT_INCREASED)
+			action_result(pfn, MF_MSG_BUDDY, MF_DELAYED);
+		else
+			action_result(pfn, MF_MSG_BUDDY_2ND, MF_DELAYED);
+		return 0;
 	}
 =

 	lock_page(hpage);
-- =

2.7.0


--===============7442142869603755929==--

