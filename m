Content-Type: multipart/mixed; boundary="===============6427053224211454873=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 2bd8eec68f: BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c
Date: Sun, 03 Jul 2022 13:22:09 -0700
Message-ID: <20220703132209.875b823d1cb7169a8d51d56d@linux-foundation.org>
In-Reply-To: <YsFk/qU+QtWun04h@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6427053224211454873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 3 Jul 2022 17:44:30 +0800 kernel test robot <oliver.sang@intel.co=
m> wrote:

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 2bd8eec68f740608db5ea58ecff06965228764cb ("[PATCH 7/7] mm/page_al=
loc: Replace local_lock with normal spinlock")
> url: https://github.com/intel-lab-lkp/linux/commits/Mel-Gorman/Drain-remo=
te-per-cpu-directly/20220613-230139
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git b13=
baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
> patch link: https://lore.kernel.org/lkml/20220613125622.18628-8-mgorman(a=
)techsingularity.net
> =


Did this test include the followup patch
mm-page_alloc-replace-local_lock-with-normal-spinlock-fix.patch?


From: Mel Gorman <mgorman@techsingularity.net>
Subject: mm/page_alloc: replace local_lock with normal spinlock -fix
Date: Mon, 27 Jun 2022 09:46:45 +0100

As noted by Yu Zhao, use pcp_spin_trylock_irqsave instead of
pcpu_spin_trylock_irqsave.  This is a fix to the mm-unstable patch
mm-page_alloc-replace-local_lock-with-normal-spinlock.patch

Link: https://lkml.kernel.org/r/20220627084645.GA27531(a)techsingularity.net
Signed-off-by: Mel Gorman <mgorman@techsingularity.net>
Reported-by: Yu Zhao <yuzhao@google.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/page_alloc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/mm/page_alloc.c~mm-page_alloc-replace-local_lock-with-normal-spinlock=
-fix
+++ a/mm/page_alloc.c
@@ -3497,7 +3497,7 @@ void free_unref_page(struct page *page,
 =

 	zone =3D page_zone(page);
 	pcp_trylock_prepare(UP_flags);
-	pcp =3D pcpu_spin_trylock_irqsave(struct per_cpu_pages, lock, zone->per_c=
pu_pageset, flags);
+	pcp =3D pcp_spin_trylock_irqsave(zone->per_cpu_pageset, flags);
 	if (pcp) {
 		free_unref_page_commit(zone, pcp, page, migratetype, order);
 		pcp_spin_unlock_irqrestore(pcp, flags);
_

--===============6427053224211454873==--

