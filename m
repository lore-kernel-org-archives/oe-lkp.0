Content-Type: multipart/mixed; boundary="===============6249366912100331307=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Fri, 06 May 2022 20:17:11 +0800
Message-ID: <YnURx04+hE0sQ3v3@ziqianlu-desk1>
In-Reply-To: <bd3db4de223a010d1e06013e93b09879fc9b36a8.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6249366912100331307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2022 at 04:40:45PM +0800, ying.huang(a)intel.com wrote:
> On Fri, 2022-04-29 at 19:29 +0800, Aaron Lu wrote:
> > Hi Mel,
> > =

> > On Wed, Apr 20, 2022 at 09:35:26AM +0800, kernel test robot wrote:
> > > =

> > > (please be noted we reported
> > > "[mm/page_alloc]  39907a939a:  netperf.Throughput_Mbps -18.1% regress=
ion"
> > > on
> > > https://lore.kernel.org/all/20220228155733.GF1643(a)xsang-OptiPlex-90=
20/
> > > while the commit is on branch.
> > > now we still observe similar regression when it's on mainline, and we=
 also
> > > observe a 13.2% improvement on another netperf subtest.
> > > so report again for information)
> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a -18.0% regression of netperf.Throughput_Mbps due to=
 commit:
> > > =

> > > =

> > > commit: f26b3fa046116a7dedcaafe30083402113941451 ("mm/page_alloc: lim=
it number of high-order pages on PCP during bulk free")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > =

> > So what this commit did is: if a CPU is always doing free(pcp->free_fac=
tor > 0)
> =

> IMHO, this means the consumer and producer are running on different
> CPUs.
>

Right.

> > and if the being freed high-order page's order is <=3D PAGE_ALLOC_COSTL=
Y_ORDER,
> > then do not use PCP but directly free the page directly to buddy.
> > =

> > The rationale as explained in the commit's changelog is:
> > "
> > Netperf running on localhost exhibits this pattern and while it does not
> > matter for some machines, it does matter for others with smaller caches
> > where cache misses cause problems due to reduced page reuse. Pages
> > freed directly to the buddy list may be reused quickly while still cache
> > hot where as storing on the PCP lists may be cold by the time
> > free_pcppages_bulk() is called.
> > "
> > =

> > This regression occurred on a machine that has large caches so this
> > optimization brings no value to it but only overhead(skipped PCP), I
> > guess this is the reason why there is a regression.
> =

> Per my understanding, not only the cache size is larger, but also the L2
> cache (1MB) is per-core on this machine.  So if the consumer and
> producer are running on different cores, the cache-hot page may cause
> more core-to-core cache transfer.  This may hurt performance too.
>

Client side allocates skb(page) and server side recvfrom() it.
recvfrom() copies the page data to server's own buffer and then releases
the page associated with the skb. Client does all the allocation and
server does all the free, page reuse happens at client side.
So I think core-2-core cache transfer due to page reuse can occur when
client task migrates.

I have modified the job to have the client and server bound to a
specific CPU of different cores on the same node, and testing it on the
same Icelake 2 sockets server, the result is

  kernel      throughput
8b10b465d0e1     125168
f26b3fa04611     102039 -18%

It's also a 18% drop. I think this means c2c is not a factor?

> > I have also tested this case on a small machine: a skylake desktop and
> > this commit shows improvement:
> > 8b10b465d0e1: "netperf.Throughput_Mbps": 72288.76,
> > f26b3fa04611: "netperf.Throughput_Mbps": 90784.4,  +25.6%
> >
> > So this means those directly freed pages get reused by allocator side
> > and that brings performance improvement for machines with smaller cache.
> =

> Per my understanding, the L2 cache on this desktop machine is shared
> among cores.
> =


The said CPU is i7-6700 and according to this wikipedia page,
L2 is per core:
https://en.wikipedia.org/wiki/Skylake_(microarchitecture)#Mainstream_deskto=
p_processors

> > I wonder if we should still use PCP a little bit under the above said
> > condition, for the purpose of:
> > 1 reduced overhead in the free path for machines with large cache;
> > 2 still keeps the benefit of reused pages for machines with smaller cac=
he.
> > =

> > For this reason, I tested increasing nr_pcp_high() from returning 0 to
> > either returning pcp->batch or (pcp->batch << 2):
> > machine\nr_pcp_high() ret: pcp->high   0   pcp->batch (pcp->batch << 2)
> > skylake desktop:             72288   90784   92219       91528
> > icelake 2sockets:           120956   99177   98251      116108
> > =

> > note nr_pcp_high() returns pcp->high is the behaviour of this commit's
> > parent, returns 0 is the behaviour of this commit.
> > =

> > The result shows, if we effectively use a PCP high as (pcp->batch << 2)
> > for the described condition, then this workload's performance on
> > small machine can remain while the regression on large machines can be
> > greately reduced(from -18% to -4%).
> > =

> =

> Can we use cache size and topology information directly?

It can be complicated by the fact that the system can have multiple
producers(cpus that are doing free) running at the same time and getting
the perfect number can be a difficult job.
--===============6249366912100331307==--

