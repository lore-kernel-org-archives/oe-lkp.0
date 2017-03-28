Content-Type: multipart/mixed; boundary="===============7222957052091351674=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, page_alloc] b7ef62aa8a: BUG:kernel_hang_in_boot_stage
Date: Tue, 28 Mar 2017 14:32:29 +0200
Message-ID: <59d71b35-d556-4fc9-ee2e-1574259282fd@suse.cz>
In-Reply-To: <20170322043611.GJ26669@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7222957052091351674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/22/2017 05:36 AM, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: b7ef62aa8a7aebb156ce093e3215fb821426fc1b ("mm, page_alloc: split =
smallest stolen page in fallback")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------+-----=
-------+------------+
> |                                                                  | f7b7=
744467 | b7ef62aa8a |
> +------------------------------------------------------------------+-----=
-------+------------+
> | boot_successes                                                   | 0   =
       | 0          |
> | boot_failures                                                    | 4   =
       | 4          |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 4 =
         |            |
> | Mem-Info                                                         | 4   =
       |            |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 4   =
       |            |
> | BUG:kernel_hang_in_boot_stage                                    | 0   =
       | 4          |
> +------------------------------------------------------------------+-----=
-------+------------+
> =

> =

> =

> [    2.398650] BTRFS: selftest: Running find delalloc tests
> [    2.413373] tsc: Refined TSC clocksource calibration: 2260.994 MHz
> [    2.414891] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
09745a29ae, max_idle_ns: 440795217760 ns
> =

> Elapsed time: 460
> BUG: kernel hang in boot stage

Thanks, I was able to reproduce and debug this.
Andrew, please apply the following -fix. There will be conflicts on later
patches, but with trivial resolution (pages -> free_pages). Thanks!

----8<----
commit 20a10571d2b020a3e0dee7ff236dadf4efe23026
Author: Vlastimil Babka <vbabka@suse.cz>
Date:   Tue Mar 28 14:17:08 2017 +0200

    mm, page_alloc: split smallest stolen page in fallback-fix
    =

    The lkp-robot reported a test case stuck on boot due to the patch [1] w=
hich
    was due to endless loop in the modified __rmqueue(). It blindly expecte=
d that
    move_freepages_block() will succeed, but that can fail due to last page=
block
    pfn not belonging to the same zone as the fallback candidate page.
    =

    This fix checks the result of move_freepages_block() and steals the sin=
gle
    candidate page if it fails, which was also effectively done before [1].
    =

    [1] mmotm: mm-page_alloc-split-smallest-stolen-page-in-fallback.patch
    =

    Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index fd7f865320c5..664cf85c51a3 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1977,6 +1977,9 @@ static void steal_suitable_fallback(struct zone *zone=
, struct page *page,
 		goto single_page;
 =

 	pages =3D move_freepages_block(zone, page, start_type);
+	/* moving whole block can fail due to zone boundary conditions */
+	if (!pages)
+		goto single_page;
 =

 	/* Claim the whole block if over half of it is free */
 	if (pages >=3D (1 << (pageblock_order-1)) ||



--===============7222957052091351674==--

