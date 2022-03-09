Content-Type: multipart/mixed; boundary="===============8660895421261295098=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] 0fb3978b0a: stress-ng.fstat.ops_per_sec -18.9% regression
Date: Wed, 09 Mar 2022 17:28:55 +0800
Message-ID: <87tuc7fp9k.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <87mti7s9xz.fsf@yhuang6-desk2.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8660895421261295098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, All,

"Huang, Ying" <ying.huang@intel.com> writes:

> Hi, Oliver,
>
> Thanks for report.
>
> I still cannot connect the regression with the patch yet.  To double
> check, I have run test again with "sched_verbose" kernel command line,
> and verified that the sched_domain isn't changed at all with the patch.
>
> kernel test robot <oliver.sang@intel.com> writes:
>>       0.11   6%      +0.1        0.16   4%  perf-profile.self.cycles-pp.=
update_rq_clock
>>       0.00            +0.1        0.06   6%  perf-profile.self.cycles-pp=
.memset_erms
>>       0.00            +0.1        0.07   5%  perf-profile.self.cycles-pp=
.get_pid_task
>>       0.06   7%      +0.1        0.17   6%  perf-profile.self.cycles-pp.=
select_task_rq_fair
>>       0.54   5%      +0.1        0.68        perf-profile.self.cycles-pp=
.lockref_put_return
>>       4.26            +1.1        5.33        perf-profile.self.cycles-p=
p.common_perm_cond
>>      15.45            +4.9       20.37        perf-profile.self.cycles-p=
p.lockref_put_or_lock
>>      20.12            +6.7       26.82        perf-profile.self.cycles-p=
p.lockref_get_not_dead
>
> From the perf-profile above, the most visible change is more cycles in
> lockref_get_not_dead(), which will loop with cmpxchg on
> dentry->d_lockref.  So this appears to be related to the memory layout.
> I will try to debug that.
>
> Because stress-ng is a weird "benchmark" although it's a very good
> functionality test, and I cannot connect the patch with the test case
> and performance metrics collected.  I think this regression should be a
> low priority one which shouldn't prevent the merging etc.  But I will
> continue to investigate the regression to try to root cause it.

Done more investigation for this.  It turns out the sched_domain has
been changed after commit 0fb3978b0a, although it's not shown in default
sched_verbose output.  sd->imb_numa_nr of level "NUMA" has been changed
from 24 to 12 after the commit.  So the following debug patch restore
the performance.

>From 6c79c858248196ea71da4be02a0774bb6e277581 Mon Sep 17 00:00:00 2001
From: Huang Ying <ying.huang@intel.com>
Date: Wed, 9 Mar 2022 10:45:18 +0800
Subject: [PATCH] dbg: restore sd->imb_numa_nr

---
 kernel/sched/topology.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 5e05fb7a817b..c348747e4166 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2351,6 +2351,10 @@ build_sched_domains(const struct cpumask *cpu_map, s=
truct sched_domain_attr *att
 					sd->name, imb, factor, sd->imb_numa_nr);
 #endif
 			}
+#ifdef CONFIG_SCHED_DEBUG
+			if (!strcmp(sd->name, "NUMA"))
+				sd->imb_numa_nr =3D 24;
+#endif
 		}
 	}
 =

-- =

2.30.2

I haven't researched much about the influence of sd->imb_numa_nr.  But
it seems that commit 0fb3978b0a just follows the behavior of a normal 2
sockets (2 LLCs) machine.  This is intended.  So the regression report
isn't important for the commit itself.

About the impact of sd->imb_numa_nr, we will continue work on that.

Best Regards,
Huang, Ying
--===============8660895421261295098==--

