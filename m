Content-Type: multipart/mixed; boundary="===============0347328254079674543=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [sched/fair] b4d95a034c: phoronix-test-suite.tiobench.RandomWrite.64MB.8.mb_s -26.3% regression
Date: Mon, 29 Nov 2021 11:35:38 +0000
Message-ID: <20211129113538.GN3366@techsingularity.net>
In-Reply-To: <20211128150658.GC5295@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0347328254079674543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 28, 2021 at 11:06:58PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -26.3% regression of phoronix-test-suite.tiobench.Rando=
mWrite.64MB.8.mb_s due to commit:
> =

> =

> commit: b4d95a034cffb1e4424874645549d3cac2de5c02 ("[PATCH 2/2] sched/fair=
: Adjust the allowed NUMA imbalance when SD_NUMA spans multiple LLCs")
> url: https://github.com/0day-ci/linux/commits/Mel-Gorman/Adjust-NUMA-imba=
lance-for-multiple-LLCs/20211125-232336
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 8c92606ab8=
1086db00cbb73347d124b4eb169b7e
> =

> in testcase: phoronix-test-suite
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.=
10GHz with 128G memory
> with following parameters:
> =

> 	test: tiobench-1.3.1
> 	option_a: Random Write
> 	option_b: 64MB
> 	option_c: 8
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> test-description: The Phoronix Test Suite is the most comprehensive testi=
ng and benchmarking platform available that provides an extensible framewor=
k for which new tests can be easily added.
> test-url: http://www.phoronix-test-suite.com/
> =


Ok, while I'm surprised there is a difference with tiobench, there
definitely is a problem with the patch and a v3 is needed. Am queueing
up a test of v3 but the diff is

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 9adeaa89ccb4..fee2930745ab 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2244,25 +2244,21 @@ build_sched_domains(const struct cpumask *cpu_map, =
struct sched_domain_attr *att
 =

 	/* Calculate allowed NUMA imbalance */
 	for_each_cpu(i, cpu_map) {
+		int imb_numa_nr =3D 0;
+
 		for (sd =3D *per_cpu_ptr(d.sd, i); sd; sd =3D sd->parent) {
 			struct sched_domain *child =3D sd->child;
 =

-			if (!(sd->flags & SD_SHARE_PKG_RESOURCES) &&
+			if (!(sd->flags & SD_SHARE_PKG_RESOURCES) && child &&
 			    (child->flags & SD_SHARE_PKG_RESOURCES)) {
-				struct sched_domain *sd_numa =3D sd;
-				int imb_numa_nr, nr_groups;
+				int nr_groups;
 =

 				nr_groups =3D sd->span_weight / child->span_weight;
-				imb_numa_nr =3D nr_groups / num_online_nodes();
-
-				while (sd_numa) {
-					if (sd_numa->flags & SD_NUMA) {
-						sd_numa->imb_numa_nr =3D imb_numa_nr;
-						break;
-					}
-					sd_numa =3D sd_numa->parent;
-				}
+				imb_numa_nr =3D max(1U, ((child->span_weight) >> 1) /
+						(nr_groups * num_online_nodes()));
 			}
+
+			sd->imb_numa_nr =3D imb_numa_nr;
 		}
 	}
=20
--===============0347328254079674543==--

