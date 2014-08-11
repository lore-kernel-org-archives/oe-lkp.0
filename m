Content-Type: multipart/mixed; boundary="===============0847264156780550489=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Mon, 11 Aug 2014 15:33:52 +0200
Message-ID: <20140811133352.GC9918@twins.programming.kicks-ass.net>
In-Reply-To: <20140810105413.GA29451@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============0847264156780550489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2014 at 06:54:13PM +0800, Fengguang Wu wrote:
> This view may be easier to read, by grouping the metrics by test case.
> =

> test case: brickland1/aim7/6000-page_test

OK, I have a similar system to the brickland thing (slightly different
configuration, but should be close enough).

Now; do you have a description of each test-case someplace? In
particular, it might be good to have a small annotation to show which
direction is better.

> =

>     128529 =C2=B1 1%     +17.9%     151594 =C2=B1 0%  TOTAL aim7.jobs-per=
-min

jobs per minute, + is better, so no worries there.

>     582269 =C2=B114%     -55.6%     258617 =C2=B116%  TOTAL softirqs.SCHED
>     993654 =C2=B1 2%     -19.9%     795962 =C2=B1 3%  TOTAL softirqs.RCU
>   15865125 =C2=B1 1%     -15.0%   13485882 =C2=B1 1%  TOTAL softirqs.TIMER

>   59366697 =C2=B1 3%     -46.1%   32017187 =C2=B1 7%  TOTAL cpuidle.C1-IV=
T.time
>      54543 =C2=B111%     -37.2%      34252 =C2=B116%  TOTAL cpuidle.C1-IV=
T.usage
>      19542 =C2=B1 9%     -38.3%      12057 =C2=B1 4%  TOTAL cpuidle.C1E-I=
VT.usage
>   49527464 =C2=B1 6%     -32.4%   33488833 =C2=B1 4%  TOTAL cpuidle.C1E-I=
VT.time
>      76064 =C2=B1 3%     -32.2%      51572 =C2=B1 6%  TOTAL cpuidle.C6-IV=
T.usage

Less idle time; might be good, if the work is cpubound, might be bad if
not; hard to say.

>       2.82 =C2=B1 3%     +21.9%       3.43 =C2=B1 4%  TOTAL turbostat.%pc2
>       4.40 =C2=B1 2%     +22.0%       5.37 =C2=B1 4%  TOTAL turbostat.%c6
>      15.75 =C2=B1 1%      -3.4%      15.21 =C2=B1 0%  TOTAL turbostat.RAM=
_W

>    3150464 =C2=B1 2%     -24.2%    2387551 =C2=B1 3%  TOTAL time.voluntar=
y_context_switches

Typically less ctxsw is better..

>        281 =C2=B1 1%     -15.1%        238 =C2=B1 0%  TOTAL time.elapsed_=
time
>      29294 =C2=B1 1%     -14.3%      25093 =C2=B1 0%  TOTAL time.system_t=
ime

Less time spend (on presumably the same work) is better

>    4529818 =C2=B1 1%      -8.8%    4129398 =C2=B1 1%  TOTAL time.involunt=
ary_context_switches

Less preemptions, also generally better

>      10655 =C2=B1 0%      +1.4%      10802 =C2=B1 0%  TOTAL time.percent_=
of_cpu_this_job_got

Seem an improvement; not sure.

Many more stats.. but from the above it looks like its an overall 'win';
or am I reading the thing wrong?


Now I think I see why this is; we've reduced load balancing frequency
significantly on this machine due to:


-#define SD_SIBLING_INIT (struct sched_domain) {                           =
     \
-       .min_interval           =3D 1,                                    \
-       .max_interval           =3D 2,                                    \


-#define SD_MC_INIT (struct sched_domain) {                             \
-       .min_interval           =3D 1,                                    \
-       .max_interval           =3D 4,                                    \


-#define SD_CPU_INIT (struct sched_domain) {                            \
-       .min_interval           =3D 1,                                    \
-       .max_interval           =3D 4,                                    \


        *sd =3D (struct sched_domain){
                .min_interval           =3D sd_weight,
                .max_interval           =3D 2*sd_weight,

Which both increased the min and max value significantly for all domains
involved.

That said; I think we might want to do something like the below; I can
imagine decreasing load balancing too much will negatively impact other
workloads.

Maybe slightly modified to make sure the first domain has a min_interval
of 1.

---
 kernel/sched/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1211575a2208..67ed5d854da1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6049,8 +6049,8 @@ sd_init(struct sched_domain_topology_level *tl, int c=
pu)
 		sd_flags &=3D ~TOPOLOGY_SD_FLAGS;
 =

 	*sd =3D (struct sched_domain){
-		.min_interval		=3D sd_weight,
-		.max_interval		=3D 2*sd_weight,
+		.min_interval		=3D max(1, sd_weight/2),
+		.max_interval		=3D sd_weight,
 		.busy_factor		=3D 32,
 		.imbalance_pct		=3D 125,
 =

@@ -6076,7 +6076,7 @@ sd_init(struct sched_domain_topology_level *tl, int c=
pu)
 					,
 =

 		.last_balance		=3D jiffies,
-		.balance_interval	=3D sd_weight,
+		.balance_interval	=3D max(1, sd_weight/2),
 		.smt_gain		=3D 0,
 		.max_newidle_lb_cost	=3D 0,
 		.next_decay_max_lb_cost	=3D jiffies,

--===============0847264156780550489==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDZNWkFBQW9KRUhaSDRhUkx3T1M2dkRBUC9BcU9icEJq
NWlyRXJtTU9qb1VURjQvZQpNWXRWSWZna1VmUmxtOE5WcWFxTS9pR0xFV0JUQnNST0RLZXFiTXRq
TGRPQXpyZTV5TTZ0UDlmMUVDRVpBRjZ3CkkxUXd0Nkt4L0dvU2l0ZnZCOHVkQjFjQTM4YnFiVGVB
SDIzdHE0RW1QL0dRa0dnS1RSaFBBbWZKd2FQa2lra1IKWTJnRUY5a28zVnF2MzhNN0VKWWdMQWx6
U2RKd2RQOG96Yyt4RnlkbkZHU0ZqN1FWNHVpU0tqQW5lYTdjazVYWQpWOVlxRld3R2l4aGJLY3ZE
RXRPWnJmUnFSNHhtNStqY3RMRFFpTVJhZ0VSQTZrUkFyUzJ5WFZqQWFSdzMxd2ZsCmlEdEFtV095
VFVJMk5jVVJmTHVFUFFkRHdZY0tTSTNvV0NaQjNFai94RFVhRm9rWEtxZ2J5UlVESVR1Q3Qrc1MK
amgrbmdzQ2N6RVdLNDNETTRsdE51ZXZzV041d2lOZVhDMVQzajJ5bWt3b2U3eDhOS3ZRQnFuWER6
WWNuN05lVwpucGw5SEF6UTVXWDdIMVJKMkdVTGxhQnRYc2lWdU9GbDZNc1JMOW12eEMxdGtvbWNR
M1lIdjUwSFBwcXR3OGt2CkZxVWtjN0R1WGoyZXhHU3Z4Y09vMzdJS21MWjFtdHVkSHl4QjViQnFK
a3dSLzZ3Q3hJMGh4QThuWHFGcFY0SGgKQnlwV0dLN2ZaTVc4MzdYQ05hWUUxait0VCs2aWJmWUlH
YVZUcHlIQ0FVb3B0WVYydncvSGlYVFBuREQ0L2VXegpqeVpXc1JtTzBBblNJckZteGVjZi9lSDNs
aFE3cnVQR1VYUU5za3dlQTRkMUpPandVc3BDdURJZ0hqZDlFdms5ClBLV3ZZMzZLb0ZzMThYT3Bv
ZjE2Cj1DRTNOCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0847264156780550489==--

