Content-Type: multipart/mixed; boundary="===============3833320200682577760=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: efad4e475c [ 40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
Date: Mon, 18 Feb 2019 16:22:13 +0100
Message-ID: <20190218152213.GT4525@dhcp22.suse.cz>
In-Reply-To: <20190218152050.GS4525@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3833320200682577760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 18-02-19 16:20:50, Michal Hocko wrote:
> On Mon 18-02-19 16:05:15, Mike Rapoport wrote:
> > On Mon, Feb 18, 2019 at 11:30:13AM +0100, Michal Hocko wrote:
> > > On Mon 18-02-19 18:01:39, Rong Chen wrote:
> > > > =

> > > > On 2/18/19 4:55 PM, Michal Hocko wrote:
> > > > > [Sorry for an excessive quoting in the previous email]
> > > > > [Cc Pavel - the full report is http://lkml.kernel.org/r/201902180=
52823.GH29177(a)shao2-debian[]
> > > > > =

> > > > > On Mon 18-02-19 08:08:44, Michal Hocko wrote:
> > > > > > On Mon 18-02-19 13:28:23, kernel test robot wrote:
> > > > > [...]
> > > > > > > [   40.305212] PGD 0 P4D 0
> > > > > > > [   40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
> > > > > > > [   40.313055] CPU: 1 PID: 239 Comm: udevd Not tainted 5.0.0-=
rc4-00149-gefad4e4 #1
> > > > > > > [   40.321348] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS 1.10.2-1 04/01/2014
> > > > > > > [   40.330813] RIP: 0010:page_mapping+0x12/0x80
> > > > > > > [   40.335709] Code: 5d c3 48 89 df e8 0e ad 02 00 85 c0 75 d=
a 89 e8 5b 5d c3 0f 1f 44 00 00 53 48 89 fb 48 8b 43 08 48 8d 50 ff a8 01 4=
8 0f 45 da <48> 8b 53 08 48 8d 42 ff 83 e2 01 48 0f 44 c3 48 83 38 ff 74 2f=
 48
> > > > > > > [   40.356704] RSP: 0018:ffff88801fa87cd8 EFLAGS: 00010202
> > > > > > > [   40.362714] RAX: ffffffffffffffff RBX: fffffffffffffffe RC=
X: 000000000000000a
> > > > > > > [   40.370798] RDX: fffffffffffffffe RSI: ffffffff820b9a20 RD=
I: ffff88801e5c0000
> > > > > > > [   40.378830] RBP: 6db6db6db6db6db7 R08: ffff88801e8bb000 R0=
9: 0000000001b64d13
> > > > > > > [   40.386902] R10: ffff88801fa87cf8 R11: 0000000000000001 R1=
2: ffff88801e640000
> > > > > > > [   40.395033] R13: ffffffff820b9a20 R14: ffff88801f145258 R1=
5: 0000000000000001
> > > > > > > [   40.403138] FS:  00007fb2079817c0(0000) GS:ffff88801dd0000=
0(0000) knlGS:0000000000000000
> > > > > > > [   40.412243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> > > > > > > [   40.418846] CR2: 0000000000000006 CR3: 000000001fa82000 CR=
4: 00000000000006a0
> > > > > > > [   40.426951] Call Trace:
> > > > > > > [   40.429843]  __dump_page+0x14/0x2c0
> > > > > > > [   40.433947]  is_mem_section_removable+0x24c/0x2c0
> > > > > > This looks like we are stumbling over an unitialized struct pag=
e again.
> > > > > > Something this patch should prevent from. Could you try to appl=
y [1]
> > > > > > which will make __dump_page more robust so that we do not blow =
up there
> > > > > > and give some more details in return.
> > > > > > =

> > > > > > Btw. is this reproducible all the time?
> > > > > And forgot to ask whether this is reproducible with pending mmotm
> > > > > patches in linux-next.
> > > > =

> > > > =

> > > > Do you mean the below patch? I can reproduce the problem too.
> > > =

> > > Yes, thanks for the swift response. The patch has just added a debugg=
ing
> > > output
> > > [    0.013697] Early memory node ranges
> > > [    0.013701]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> > > [    0.013706]   node   0: [mem 0x0000000000100000-0x000000001ffdffff]
> > > [    0.013711] zeroying 0-1
> > > =

> > > This is the first pfn.
> > > =

> > > [    0.013715] zeroying 9f-100
> > > =

> > > this is [mem 0x9f000, 0xfffff] so it fills up the whole hole between =
the
> > > above two ranges. This is definitely good.
> > > =

> > > [    0.013722] zeroying 1ffe0-1ffe0
> > > =

> > > this is a single page at 0x1ffe0000 right after the zone end.
> > > =

> > > [    0.013727] Zeroed struct page in unavailable ranges: 98 pages
> > > =

> > > Hmm, so this is getting really interesting. The whole zone range shou=
ld
> > > be covered. So this is either some off-by-one or I something that I am
> > > missing right now. Could you apply the following on top please? We
> > > definitely need to see what pfn this is.
> > > =

> > > =

> > > diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> > > index 124e794867c5..59bcfd934e37 100644
> > > --- a/mm/memory_hotplug.c
> > > +++ b/mm/memory_hotplug.c
> > > @@ -1232,12 +1232,14 @@ static bool is_pageblock_removable_nolock(str=
uct page *page)
> > >  /* Checks if this range of memory is likely to be hot-removable. */
> > >  bool is_mem_section_removable(unsigned long start_pfn, unsigned long=
 nr_pages)
> > >  {
> > > -	struct page *page =3D pfn_to_page(start_pfn);
> > > +	struct page *page =3D pfn_to_page(start_pfn), *first_page;
> > >  	unsigned long end_pfn =3D min(start_pfn + nr_pages, zone_end_pfn(pa=
ge_zone(page)));
> > >  	struct page *end_page =3D pfn_to_page(end_pfn);
> > > =

> > >  	/* Check the starting page of each pageblock within the range */
> > > -	for (; page < end_page; page =3D next_active_pageblock(page)) {
> > > +	for (first_page =3D page; page < end_page; page =3D next_active_pag=
eblock(page)) {
> > > +		if (PagePoisoned(page))
> > > +			pr_info("Unexpected poisoned page %px pfn:%lx\n", page, start_pfn=
 + page-first_page);
> > >  		if (!is_pageblock_removable_nolock(page))
> > >  			return false;
> > >  		cond_resched();
> > =

> > I've added more prints and somehow end_page gets too big (in brackets is
> > the pfn):
> > =

> > [   11.183835] =3D=3D=3D> start: ffff88801e240000(0), end: ffff88801e40=
0000(8000)
> > [   11.188457] =3D=3D=3D> start: ffff88801e400000(8000), end: ffff88801=
e640000(10000)
> > [   11.193266] =3D=3D=3D> start: ffff88801e640000(10000), end: ffff8880=
1e060000(18000)
> > =

> >                                                  should be ffff88801e5c=
0000
> > =

> > [   11.197363] =3D=3D=3D> start: ffff88801e060000(18000), end: ffff8880=
1e21f900(1ffe0)
> > [   11.207547] Unexpected poisoned page ffff88801e5c0000 pfn:10000
> > =

> > =

> > With the patch below the problem seem to disappear, although I have no =
idea
> > why...
> > =

> > diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> > index 91e6fef..53d15ff 100644
> > --- a/mm/memory_hotplug.c
> > +++ b/mm/memory_hotplug.c
> > @@ -1234,7 +1234,7 @@ bool is_mem_section_removable(unsigned long start=
_pfn, unsigned long nr_pages)
> >  {
> >  	struct page *page =3D pfn_to_page(start_pfn);
> >  	unsigned long end_pfn =3D min(start_pfn + nr_pages, zone_end_pfn(page=
_zone(page)));
> > -	struct page *end_page =3D pfn_to_page(end_pfn);
> > +	struct page *end_page =3D page + (end_pfn - start_pfn);
> >  =

> >  	/* Check the starting page of each pageblock within the range */
> >  	for (; page < end_page; page =3D next_active_pageblock(page)) {
> =

> This is really interesting, because it would mean that the end_pfn is
> out of the section and so the page pointer arithmetic doesn't really
> work. But I am wondering how that could happen as nr_pages is
> PAGES_PER_SECTION. Another option is that pfn_to_page doesn't work
> properly here. It is CONFIG_SPARSEMEM. Could you print section_nr of
> both start_pfn and end_pfn please?

Thinking about it some more, is it possible that we are overflowing by 1
here?

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 124e794867c5..6618b9d3e53a 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1234,10 +1234,10 @@ bool is_mem_section_removable(unsigned long start_p=
fn, unsigned long nr_pages)
 {
 	struct page *page =3D pfn_to_page(start_pfn);
 	unsigned long end_pfn =3D min(start_pfn + nr_pages, zone_end_pfn(page_zon=
e(page)));
-	struct page *end_page =3D pfn_to_page(end_pfn);
+	struct page *end_page =3D pfn_to_page(end_pfn - 1);
 =

 	/* Check the starting page of each pageblock within the range */
-	for (; page < end_page; page =3D next_active_pageblock(page)) {
+	for (; page <=3D end_page; page =3D next_active_pageblock(page)) {
 		if (!is_pageblock_removable_nolock(page))
 			return false;
 		cond_resched();
-- =

Michal Hocko
SUSE Labs

--===============3833320200682577760==--

