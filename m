Content-Type: multipart/mixed; boundary="===============7731133448889438697=="
MIME-Version: 1.0
From: ying.huang@intel.com
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Fri, 06 May 2022 16:40:45 +0800
Message-ID: <bd3db4de223a010d1e06013e93b09879fc9b36a8.camel@intel.com>
In-Reply-To: <YmvMDyx05UoPFtQy@ziqianlu-desk1>
List-Id: <oe-lkp.lists.linux.dev>

--===============7731133448889438697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2022-04-29 at 19:29 +0800, Aaron Lu wrote:
> Hi Mel,
> =

> On Wed, Apr 20, 2022 at 09:35:26AM +0800, kernel test robot wrote:
> > =

> > (please be noted we reported
> > "[mm/page_alloc]  39907a939a:  netperf.Throughput_Mbps -18.1% regressio=
n"
> > on
> > https://lore.kernel.org/all/20220228155733.GF1643(a)xsang-OptiPlex-9020/
> > while the commit is on branch.
> > now we still observe similar regression when it's on mainline, and we a=
lso
> > observe a 13.2% improvement on another netperf subtest.
> > so report again for information)
> > =

> > Greeting,
> > =

> > FYI, we noticed a -18.0% regression of netperf.Throughput_Mbps due to c=
ommit:
> > =

> > =

> > commit: f26b3fa046116a7dedcaafe30083402113941451 ("mm/page_alloc: limit=
 number of high-order pages on PCP during bulk free")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> =

> So what this commit did is: if a CPU is always doing free(pcp->free_facto=
r > 0)

IMHO, this means the consumer and producer are running on different
CPUs.

> and if the being freed high-order page's order is <=3D PAGE_ALLOC_COSTLY_=
ORDER,
> then do not use PCP but directly free the page directly to buddy.
> =

> The rationale as explained in the commit's changelog is:
> "
> Netperf running on localhost exhibits this pattern and while it does not
> matter for some machines, it does matter for others with smaller caches
> where cache misses cause problems due to reduced page reuse. Pages
> freed directly to the buddy list may be reused quickly while still cache
> hot where as storing on the PCP lists may be cold by the time
> free_pcppages_bulk() is called.
> "
> =

> This regression occurred on a machine that has large caches so this
> optimization brings no value to it but only overhead(skipped PCP), I
> guess this is the reason why there is a regression.

Per my understanding, not only the cache size is larger, but also the L2
cache (1MB) is per-core on this machine.  So if the consumer and
producer are running on different cores, the cache-hot page may cause
more core-to-core cache transfer.  This may hurt performance too.

> I have also tested this case on a small machine: a skylake desktop and
> this commit shows improvement:
> 8b10b465d0e1: "netperf.Throughput_Mbps": 72288.76,
> f26b3fa04611: "netperf.Throughput_Mbps": 90784.4,  +25.6%
>
> So this means those directly freed pages get reused by allocator side
> and that brings performance improvement for machines with smaller cache.

Per my understanding, the L2 cache on this desktop machine is shared
among cores.

> I wonder if we should still use PCP a little bit under the above said
> condition, for the purpose of:
> 1 reduced overhead in the free path for machines with large cache;
> 2 still keeps the benefit of reused pages for machines with smaller cache.
> =

> For this reason, I tested increasing nr_pcp_high() from returning 0 to
> either returning pcp->batch or (pcp->batch << 2):
> machine\nr_pcp_high() ret: pcp->high   0   pcp->batch (pcp->batch << 2)
> skylake desktop:             72288   90784   92219       91528
> icelake 2sockets:           120956   99177   98251      116108
> =

> note nr_pcp_high() returns pcp->high is the behaviour of this commit's
> parent, returns 0 is the behaviour of this commit.
> =

> The result shows, if we effectively use a PCP high as (pcp->batch << 2)
> for the described condition, then this workload's performance on
> small machine can remain while the regression on large machines can be
> greately reduced(from -18% to -4%).
> =


Can we use cache size and topology information directly?

> =

Best Regards,
Huang, Ying

[snip]


--===============7731133448889438697==--

