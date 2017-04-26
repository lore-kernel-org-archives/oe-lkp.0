Content-Type: multipart/mixed; boundary="===============2577717947850249158=="
MIME-Version: 1.0
From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
To: lkp@lists.01.org
Subject: [PATCH v1 2/2] mm: hwpoison: call shake_page() after try_to_unmap() for mlocked page
Date: Wed, 26 Apr 2017 18:10:41 +0900
Message-ID: <1493197841-23986-3-git-send-email-n-horiguchi@ah.jp.nec.com>
In-Reply-To: <1493197841-23986-1-git-send-email-n-horiguchi@ah.jp.nec.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2577717947850249158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Memory error handler calls try_to_unmap() for error pages in various
states. If the error page is a mlocked page, error handling could fail
with "still referenced by 1 users" message. This is because the page
is linked to and stays in lru cache after the following call chain.

  try_to_unmap_one
    page_remove_rmap
      clear_page_mlock
        putback_lru_page
          lru_cache_add

memory_failure() calls shake_page() to hanlde the similar issue, but
current code doesn't cover because shake_page() is called only before
try_to_unmap(). So this patches adds shake_page().

Link: http://lkml.kernel.org/r/20170417055948.GM31394(a)yexl-desktop
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
---
 mm/memory-failure.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git v4.11-rc6-mmotm-2017-04-13-14-50/mm/memory-failure.c v4.11-rc6-m=
motm-2017-04-13-14-50_patched/mm/memory-failure.c
index 77cf9c3..57f07ec 100644
--- v4.11-rc6-mmotm-2017-04-13-14-50/mm/memory-failure.c
+++ v4.11-rc6-mmotm-2017-04-13-14-50_patched/mm/memory-failure.c
@@ -919,6 +919,7 @@ static bool hwpoison_user_mappings(struct page *p, unsi=
gned long pfn,
 	bool unmap_success;
 	int kill =3D 1, forcekill;
 	struct page *hpage =3D *hpagep;
+	bool mlocked =3D PageMlocked(hpage);
 =

 	/*
 	 * Here we are interested only in user-mapped pages, so skip any
@@ -983,6 +984,13 @@ static bool hwpoison_user_mappings(struct page *p, uns=
igned long pfn,
 		       pfn, page_mapcount(hpage));
 =

 	/*
+	 * try_to_unmap() might put mlocked page in lru cache, so call
+	 * shake_page() again to ensure that it's flushed.
+	 */
+	if (mlocked)
+		shake_page(hpage, 0);
+
+	/*
 	 * Now that the dirty bit has been propagated to the
 	 * struct page and all unmaps done we can decide if
 	 * killing is needed or not.  Only kill when the page
-- =

2.7.0


--===============2577717947850249158==--

