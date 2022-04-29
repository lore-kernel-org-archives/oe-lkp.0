Content-Type: multipart/mixed; boundary="===============8686407310472756659=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Fri, 29 Apr 2022 19:29:19 +0800
Message-ID: <YmvMDyx05UoPFtQy@ziqianlu-desk1>
In-Reply-To: <20220420013526.GB14333@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8686407310472756659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mel,

On Wed, Apr 20, 2022 at 09:35:26AM +0800, kernel test robot wrote:
> =

> (please be noted we reported
> "[mm/page_alloc]  39907a939a:  netperf.Throughput_Mbps -18.1% regression"
> on
> https://lore.kernel.org/all/20220228155733.GF1643(a)xsang-OptiPlex-9020/
> while the commit is on branch.
> now we still observe similar regression when it's on mainline, and we also
> observe a 13.2% improvement on another netperf subtest.
> so report again for information)
> =

> Greeting,
> =

> FYI, we noticed a -18.0% regression of netperf.Throughput_Mbps due to com=
mit:
> =

> =

> commit: f26b3fa046116a7dedcaafe30083402113941451 ("mm/page_alloc: limit n=
umber of high-order pages on PCP during bulk free")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =


So what this commit did is: if a CPU is always doing free(pcp->free_factor =
> 0)
and if the being freed high-order page's order is <=3D PAGE_ALLOC_COSTLY_OR=
DER,
then do not use PCP but directly free the page directly to buddy.

The rationale as explained in the commit's changelog is:
"
Netperf running on localhost exhibits this pattern and while it does not
matter for some machines, it does matter for others with smaller caches
where cache misses cause problems due to reduced page reuse. Pages
freed directly to the buddy list may be reused quickly while still cache
hot where as storing on the PCP lists may be cold by the time
free_pcppages_bulk() is called.
"

This regression occurred on a machine that has large caches so this
optimization brings no value to it but only overhead(skipped PCP), I
guess this is the reason why there is a regression.

I have also tested this case on a small machine: a skylake desktop and
this commit shows improvement:
8b10b465d0e1: "netperf.Throughput_Mbps": 72288.76,
f26b3fa04611: "netperf.Throughput_Mbps": 90784.4,  +25.6%

So this means those directly freed pages get reused by allocator side
and that brings performance improvement for machines with smaller cache.

I wonder if we should still use PCP a little bit under the above said
condition, for the purpose of:
1 reduced overhead in the free path for machines with large cache;
2 still keeps the benefit of reused pages for machines with smaller cache.

For this reason, I tested increasing nr_pcp_high() from returning 0 to
either returning pcp->batch or (pcp->batch << 2):
machine\nr_pcp_high() ret: pcp->high   0   pcp->batch (pcp->batch << 2)
skylake desktop:             72288   90784   92219       91528
icelake 2sockets:           120956   99177   98251      116108

note nr_pcp_high() returns pcp->high is the behaviour of this commit's
parent, returns 0 is the behaviour of this commit.

The result shows, if we effectively use a PCP high as (pcp->batch << 2)
for the described condition, then this workload's performance on
small machine can remain while the regression on large machines can be
greately reduced(from -18% to -4%).

> in testcase: netperf
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU=
 @ 2.60GHz with 128G memory
> with following parameters:
> =

> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 1
> 	cluster: cs-localhost
> 	test: UDP_STREAM
> 	cpufreq_governor: performance
> 	ucode: 0xd000331
> =

> test-description: Netperf is a benchmark that can be use to measure vario=
us aspect of networking performance.
> test-url: http://www.netperf.org/netperf/
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
>

> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | netperf: netperf.Throughput_Mbps 13.2% improvement  =
                                |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358=
 CPU @ 2.60GHz with 128G memory |
> | test parameters  | cluster=3Dcs-localhost                              =
                                  |
> |                  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | ip=3Dipv4                                           =
                                  |
> |                  | nr_threads=3D25%                                    =
                                  |
> |                  | runtime=3D300s                                      =
                                  |
> |                  | send_size=3D10K                                     =
                                  |
> |                  | test=3DSCTP_STREAM_MANY                             =
                                  |
> |                  | ucode=3D0xd000331                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
>

And when nr_pcp_high() returns (pcp->batch << 2), the improvement will
drop from 13.2% to 5.7%, not great but still an improvement...

The said change looks like this:
(relevant comment will have to be adjusted)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 505d59f7d4fa..130a02af8321 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3332,18 +3332,19 @@ static int nr_pcp_high(struct per_cpu_pages *pcp, s=
truct zone *zone,
 		       bool free_high)
 {
 	int high =3D READ_ONCE(pcp->high);
+	int batch =3D READ_ONCE(pcp->batch);
 =

-	if (unlikely(!high || free_high))
+	if (unlikely(!high))
 		return 0;
 =

-	if (!test_bit(ZONE_RECLAIM_ACTIVE, &zone->flags))
-		return high;
-
 	/*
 	 * If reclaim is active, limit the number of pages that can be
 	 * stored on pcp lists
 	 */
-	return min(READ_ONCE(pcp->batch) << 2, high);
+	if (test_bit(ZONE_RECLAIM_ACTIVE, &zone->flags) || free_high)
+		return min(batch << 2, high);
+
+	return high;
 }
 =

 static void free_unref_page_commit(struct page *page, int migratetype,

Does this look sane? If so, I can prepare a formal patch with proper
comment and changelog, thanks.
--===============8686407310472756659==--

