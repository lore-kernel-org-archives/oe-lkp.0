Content-Type: multipart/mixed; boundary="===============2874011015941273043=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: efad4e475c [ 40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
Date: Mon, 18 Feb 2019 11:30:13 +0100
Message-ID: <20190218103013.GK4525@dhcp22.suse.cz>
In-Reply-To: <4c75d424-2c51-0d7d-5c28-78c15600e93c@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2874011015941273043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 18-02-19 18:01:39, Rong Chen wrote:
> =

> On 2/18/19 4:55 PM, Michal Hocko wrote:
> > [Sorry for an excessive quoting in the previous email]
> > [Cc Pavel - the full report is http://lkml.kernel.org/r/20190218052823.=
GH29177(a)shao2-debian[]
> > =

> > On Mon 18-02-19 08:08:44, Michal Hocko wrote:
> > > On Mon 18-02-19 13:28:23, kernel test robot wrote:
> > [...]
> > > > [   40.305212] PGD 0 P4D 0
> > > > [   40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
> > > > [   40.313055] CPU: 1 PID: 239 Comm: udevd Not tainted 5.0.0-rc4-00=
149-gefad4e4 #1
> > > > [   40.321348] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.10.2-1 04/01/2014
> > > > [   40.330813] RIP: 0010:page_mapping+0x12/0x80
> > > > [   40.335709] Code: 5d c3 48 89 df e8 0e ad 02 00 85 c0 75 da 89 e=
8 5b 5d c3 0f 1f 44 00 00 53 48 89 fb 48 8b 43 08 48 8d 50 ff a8 01 48 0f 4=
5 da <48> 8b 53 08 48 8d 42 ff 83 e2 01 48 0f 44 c3 48 83 38 ff 74 2f 48
> > > > [   40.356704] RSP: 0018:ffff88801fa87cd8 EFLAGS: 00010202
> > > > [   40.362714] RAX: ffffffffffffffff RBX: fffffffffffffffe RCX: 000=
000000000000a
> > > > [   40.370798] RDX: fffffffffffffffe RSI: ffffffff820b9a20 RDI: fff=
f88801e5c0000
> > > > [   40.378830] RBP: 6db6db6db6db6db7 R08: ffff88801e8bb000 R09: 000=
0000001b64d13
> > > > [   40.386902] R10: ffff88801fa87cf8 R11: 0000000000000001 R12: fff=
f88801e640000
> > > > [   40.395033] R13: ffffffff820b9a20 R14: ffff88801f145258 R15: 000=
0000000000001
> > > > [   40.403138] FS:  00007fb2079817c0(0000) GS:ffff88801dd00000(0000=
) knlGS:0000000000000000
> > > > [   40.412243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > [   40.418846] CR2: 0000000000000006 CR3: 000000001fa82000 CR4: 000=
00000000006a0
> > > > [   40.426951] Call Trace:
> > > > [   40.429843]  __dump_page+0x14/0x2c0
> > > > [   40.433947]  is_mem_section_removable+0x24c/0x2c0
> > > This looks like we are stumbling over an unitialized struct page agai=
n.
> > > Something this patch should prevent from. Could you try to apply [1]
> > > which will make __dump_page more robust so that we do not blow up the=
re
> > > and give some more details in return.
> > > =

> > > Btw. is this reproducible all the time?
> > And forgot to ask whether this is reproducible with pending mmotm
> > patches in linux-next.
> =

> =

> Do you mean the below patch? I can reproduce the problem too.

Yes, thanks for the swift response. The patch has just added a debugging
output
[    0.013697] Early memory node ranges
[    0.013701]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.013706]   node   0: [mem 0x0000000000100000-0x000000001ffdffff]
[    0.013711] zeroying 0-1

This is the first pfn.

[    0.013715] zeroying 9f-100

this is [mem 0x9f000, 0xfffff] so it fills up the whole hole between the
above two ranges. This is definitely good.

[    0.013722] zeroying 1ffe0-1ffe0

this is a single page at 0x1ffe0000 right after the zone end.

[    0.013727] Zeroed struct page in unavailable ranges: 98 pages

Hmm, so this is getting really interesting. The whole zone range should
be covered. So this is either some off-by-one or I something that I am
missing right now. Could you apply the following on top please? We
definitely need to see what pfn this is.


diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 124e794867c5..59bcfd934e37 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1232,12 +1232,14 @@ static bool is_pageblock_removable_nolock(struct pa=
ge *page)
 /* Checks if this range of memory is likely to be hot-removable. */
 bool is_mem_section_removable(unsigned long start_pfn, unsigned long nr_pa=
ges)
 {
-	struct page *page =3D pfn_to_page(start_pfn);
+	struct page *page =3D pfn_to_page(start_pfn), *first_page;
 	unsigned long end_pfn =3D min(start_pfn + nr_pages, zone_end_pfn(page_zon=
e(page)));
 	struct page *end_page =3D pfn_to_page(end_pfn);
 =

 	/* Check the starting page of each pageblock within the range */
-	for (; page < end_page; page =3D next_active_pageblock(page)) {
+	for (first_page =3D page; page < end_page; page =3D next_active_pageblock=
(page)) {
+		if (PagePoisoned(page))
+			pr_info("Unexpected poisoned page %px pfn:%lx\n", page, start_pfn + pag=
e-first_page);
 		if (!is_pageblock_removable_nolock(page))
 			return false;
 		cond_resched();
-- =

Michal Hocko
SUSE Labs

--===============2874011015941273043==--

