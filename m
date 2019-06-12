Content-Type: multipart/mixed; boundary="===============3804986299102063322=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [tcp] 8b27dae5a2: netperf.Throughput_Mbps -25.7% regression
Date: Wed, 12 Jun 2019 11:52:29 +0800
Message-ID: <20190612035133.GA18313@shbuild999.sh.intel.com>
In-Reply-To: <20190604100735.s2g3tc35ofybimek@shbuild888>
List-Id: <oe-lkp.lists.linux.dev>

--===============3804986299102063322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 06:07:35PM +0800, Feng Tang wrote:
> On Thu, May 30, 2019 at 11:23:14PM +0800, Feng Tang wrote:
> > Hi Eric,
> > =

> > On Thu, May 30, 2019 at 05:21:40AM -0700, Eric Dumazet wrote:
> > > On Thu, May 30, 2019 at 3:31 AM Feng Tang <feng.tang@intel.com> wro=
te:
> > > >
> > > > On Wed, Apr 03, 2019 at 02:34:36PM +0800, kernel test robot wrote:
> > > > > Greeting,
> > > > >
> > > > > FYI, we noticed a -25.7% regression of netperf.Throughput_Mbps du=
e to commit:
> > > > >
> > > > >
> > > > > commit: 8b27dae5a2e89a61c46c6dbc76c040c0e6d0ed4c ("tcp: add one s=
kb cache for rx")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git =
master
> > > >
> > > > Hi Eric,
> > > >
> > > > Could you help to check this? thanks,
> > > >
> > > =

> > > Hmmm... patch is old and had some bugs that have been fixed.
> > > =

> > > What numbers do you have with more recent kernels ?
> > =

> > =

> > I just run the test  with 5.2-rc2, and the regression is still there.
> =

> Hi Eric,
> =

> Any hint on this?
> =

> >From the perf data, the spinlock contention has an obvious increase:
> =

> 9.28            +7.6       16.91        perf-profile.calltrace.cycles-pp.=
native_queued_spin_lock_slowpath._raw_spin_lock.free_one_page.__free_pages_=
ok.___pskb_trim
> 18.55           +8.6       27.14        perf-profile.calltrace.cycles-pp.=
native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_page_from_freel=
ist.__alloc_pages_nodemask.skb_page_frag_refill

Hi Eric,

Any thoughts?

Actually I did some further check. The increased lock contention
comes from the mm zone lock for page alloc/free. I did an =

experiment by changing the SKB_FRAG_PAGE_ORDER from 32K to 64K,
the lock contention is dramatically reduced, and the throughput
got some recovery (10% ~ 15% gain) depending on HW platform, but
can't fully recover the -25.7% loss. Hope this info helps.

Thanks,
Feng

> =

> And for commit 8b27dae5a2 ("tcp: add one skb cache for rx"), IIUC, it
> is not a real cache like the "tx skb cache" patch, and kind of a
> delayed freeing.
> =

> Thanks,
> Feng
> =

> =20

--===============3804986299102063322==--

