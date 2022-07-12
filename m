Content-Type: multipart/mixed; boundary="===============6701249953662600432=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 2bd8eec68f: BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c
Date: Tue, 12 Jul 2022 13:04:21 +0800
Message-ID: <Ys0A1VPFpOnUSBqu@xsang-OptiPlex-9020>
In-Reply-To: <20220708105603.GI27531@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6701249953662600432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mel Gorman, Hi Vlastimil Babka,

thanks a lot for information!
normally we would discard a report if we found there is a new version for a
patch set. however, for this one, we failed to fetch v5 from mailing list.

sorry if any inconvenience.

On Fri, Jul 08, 2022 at 11:56:03AM +0100, Mel Gorman wrote:
> On Thu, Jul 07, 2022 at 11:55:35PM +0200, Vlastimil Babka wrote:
> > On 7/5/22 15:51, Oliver Sang wrote:
> > > Hi Andrew Morton,
> > > =

> > > On Sun, Jul 03, 2022 at 01:22:09PM -0700, Andrew Morton wrote:
> > >> On Sun, 3 Jul 2022 17:44:30 +0800 kernel test robot <oliver.sang@i=
ntel.com> wrote:
> > >> =

> > >> > FYI, we noticed the following commit (built with gcc-11):
> > >> > =

> > >> > commit: 2bd8eec68f740608db5ea58ecff06965228764cb ("[PATCH 7/7] mm/=
page_alloc: Replace local_lock with normal spinlock")
> > >> > url: https://github.com/intel-lab-lkp/linux/commits/Mel-Gorman/Dra=
in-remote-per-cpu-directly/20220613-230139
> > >> > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.=
git b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
> > >> > patch link: https://lore.kernel.org/lkml/20220613125622.18628-8-mg=
orman(a)techsingularity.net
> > >> > =

> > >> =

> > >> Did this test include the followup patch
> > >> mm-page_alloc-replace-local_lock-with-normal-spinlock-fix.patch?
> > > =

> > > no, we just fetched original patch set and test upon it.
> > =

> > It appears you fetched v4, not v5. I noticed it from the threading of y=
our
> > report that was threaded in the v4 thread, and also the github url: abo=
ve.
> > In v4, pcpu_spin_trylock_irqsave() was missing an unpin, and indeed it's
> > missing in the github branch you were testing:
> > =

> =

> Thanks Vlastimil! This is my fault, I failed to verify that the code in
> my tree, Andrew's tree and what Oliver tested were the same so no wonder I
> could not find where the missing unpin was. I've gone through mm-unstable
> commits be42c869b8e..4143c9b5266 and can confirm that they are now identi=
cal
> to my own tree which includes Andrew's fix for the smatch warning that
> Dan reported.
> =

> # git diff HEAD^..mm-pcpspinnoirq-v6r1-mmunstable | wc -l
> 0
> =

> The only difference between my tree and Andrew's is that there is a head
> commit for "mm/page_alloc: Do not disable IRQs for per-cpu allocations"
> which has been put on hold for now.
> =

> -- =

> Mel Gorman
> SUSE Labs
--===============6701249953662600432==--

