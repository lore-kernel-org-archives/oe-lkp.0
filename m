Content-Type: multipart/mixed; boundary="===============1367727370581436360=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] aefd950b83: divide_error:#[##]
Date: Wed, 31 May 2017 13:52:26 -0700
Message-ID: <20170531135226.0a1b403a7a4e3f76f8f9d6bc@linux-foundation.org>
In-Reply-To: <20170531063116.GD1795@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1367727370581436360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 31 May 2017 14:31:16 +0800 kernel test robot <xiaolong.ye@intel.c=
om> wrote:

> =

> FYI, we noticed the following commit:
> =

> commit: aefd950b83d2d8cf4d3c270546c8725f866da191 ("mm: make kswapd try ha=
rder to keep active pages in cache")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> ...
>
> [  160.541829] divide error: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
>
> ...
>
> [  160.587334] RIP: shrink_node+0x47f/0x5a0 RSP: ffffc900001bbd78
>
> ...


hm.  This?

--- a/mm/vmscan.c~mm-make-kswapd-try-harder-to-keep-active-pages-in-cache-f=
ix-2
+++ a/mm/vmscan.c
@@ -2724,7 +2724,7 @@ static bool shrink_node(pg_data_t *pgdat
 		if (sc->nr_reclaimed - nr_reclaimed) {
 			reclaimable =3D true;
 		} else if (sc->inactive_only && !skip_slab) {
-			unsigned long percent;
+			unsigned long percent =3D 100;
 =

 			/*
 			 * We didn't reclaim anything this go around, so the
@@ -2735,7 +2735,8 @@ static bool shrink_node(pg_data_t *pgdat
 			 * hoping that eventually we'll start freeing enough
 			 * objects to reclaim space.
 			 */
-			percent =3D (slab_reclaimed * 100 / slab_scanned);
+			if (slab_scanned)
+				percent =3D (slab_reclaimed * 100 / slab_scanned);
 			if (percent < 50)
 				sc->inactive_only =3D 0;
 			else

Or this?

--- a/mm/vmscan.c~mm-make-kswapd-try-harder-to-keep-active-pages-in-cache-f=
ix-3
+++ a/mm/vmscan.c
@@ -2628,7 +2628,7 @@ static bool shrink_node(pg_data_t *pgdat
 		};
 		unsigned long node_lru_pages =3D 0;
 		unsigned long slab_reclaimed =3D 0;
-		unsigned long slab_scanned =3D 0;
+		unsigned long slab_scanned =3D 1;		/* Avoid div-by-zero */
 		struct mem_cgroup *memcg;
 =

 		nr_reclaimed =3D sc->nr_reclaimed;
_


--===============1367727370581436360==--

