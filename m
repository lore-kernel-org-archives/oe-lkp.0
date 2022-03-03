Content-Type: multipart/mixed; boundary="===============2974826728913128632=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] 0fb3978b0a: stress-ng.fstat.ops_per_sec -18.9% regression
Date: Thu, 03 Mar 2022 16:43:20 +0800
Message-ID: <87mti7s9xz.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <20220302140220.GA32817@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2974826728913128632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Oliver,

Thanks for report.

I still cannot connect the regression with the patch yet.  To double
check, I have run test again with "sched_verbose" kernel command line,
and verified that the sched_domain isn't changed at all with the patch.

kernel test robot <oliver.sang@intel.com> writes:
>       0.11   6%      +0.1        0.16   4%  perf-profile.self.cycles-pp.u=
pdate_rq_clock
>       0.00            +0.1        0.06   6%  perf-profile.self.cycles-pp.=
memset_erms
>       0.00            +0.1        0.07   5%  perf-profile.self.cycles-pp.=
get_pid_task
>       0.06   7%      +0.1        0.17   6%  perf-profile.self.cycles-pp.s=
elect_task_rq_fair
>       0.54   5%      +0.1        0.68        perf-profile.self.cycles-pp.=
lockref_put_return
>       4.26            +1.1        5.33        perf-profile.self.cycles-pp=
.common_perm_cond
>      15.45            +4.9       20.37        perf-profile.self.cycles-pp=
.lockref_put_or_lock
>      20.12            +6.7       26.82        perf-profile.self.cycles-pp=
.lockref_get_not_dead

>From the perf-profile above, the most visible change is more cycles in
lockref_get_not_dead(), which will loop with cmpxchg on
dentry->d_lockref.  So this appears to be related to the memory layout.
I will try to debug that.

Because stress-ng is a weird "benchmark" although it's a very good
functionality test, and I cannot connect the patch with the test case
and performance metrics collected.  I think this regression should be a
low priority one which shouldn't prevent the merging etc.  But I will
continue to investigate the regression to try to root cause it.

Best Regards,
Huang, Ying
--===============2974826728913128632==--

