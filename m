Content-Type: multipart/mixed; boundary="===============1423767063846406330=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm/meminit] PANIC: early exception 06 rip 10:ffffffff811bfa9a error 0 cr2 ffff88000fbff000
Date: Wed, 29 Apr 2015 14:41:31 +0100
Message-ID: <20150429134131.GR2449@suse.de>
In-Reply-To: <20150429132817.GA10479@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1423767063846406330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2015 at 09:28:17PM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/mel/linux-balancenuma mm-de=
ferred-meminit-v6r1
> =

> commit 285c36ab5b3e59865a0f4d79f4c1758455e684f7
> Author:     Mel Gorman <mgorman@suse.de>
> AuthorDate: Mon Sep 29 14:54:01 2014 +0100
> Commit:     Mel Gorman <mgorman@suse.de>
> CommitDate: Wed Apr 22 19:48:15 2015 +0100
> =

>     mm: meminit: Reduce number of times pageblocks are set during struct =
page init
>     =

>     During parallel sturct page initialisation, ranges are checked for ev=
ery
>     PFN unnecessarily which increases boot times. This patch alters when =
the
>     ranges are checked.
>     =

>     Signed-off-by: Mel Gorman <mgorman@suse.de>
> =


The series is old but I think it's still relevant. Can you try this
please?

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9c8f2a72263d..19543f708642 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4489,8 +4489,8 @@ void __meminit memmap_init_zone(unsigned long size, i=
nt nid, unsigned long zone,
 		if (!(pfn & (pageblock_nr_pages - 1))) {
 			struct page *page =3D pfn_to_page(pfn);
 =

-			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
 			__init_single_page(page, pfn, zone, nid);
+			set_pageblock_migratetype(page, MIGRATE_MOVABLE);
 		} else {
 			__init_single_pfn(pfn, zone, nid);
 		}

--===============1423767063846406330==--

