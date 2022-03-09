Content-Type: multipart/mixed; boundary="===============7213483654461330373=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [sched/numa] 0fb3978b0a: stress-ng.fstat.ops_per_sec -18.9% regression
Date: Wed, 09 Mar 2022 11:24:04 +0000
Message-ID: <20220309112404.GH15701@techsingularity.net>
In-Reply-To: <87tuc7fp9k.fsf@yhuang6-desk2.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7213483654461330373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2022 at 05:28:55PM +0800, Huang, Ying wrote:
> Hi, All,
> =

> "Huang, Ying" <ying.huang@intel.com> writes:
> =

> > Hi, Oliver,
> >
> > Thanks for report.
> >
> > I still cannot connect the regression with the patch yet.  To double
> > check, I have run test again with "sched_verbose" kernel command line,
> > and verified that the sched_domain isn't changed at all with the patch.
> >
> > kernel test robot <oliver.sang@intel.com> writes:
> >>       0.11   6%      +0.1        0.16   4%  perf-profile.self.cycles-p=
p.update_rq_clock
> >>       0.00            +0.1        0.06   6%  perf-profile.self.cycles-=
pp.memset_erms
> >>       0.00            +0.1        0.07   5%  perf-profile.self.cycles-=
pp.get_pid_task
> >>       0.06   7%      +0.1        0.17   6%  perf-profile.self.cycles-p=
p.select_task_rq_fair
> >>       0.54   5%      +0.1        0.68        perf-profile.self.cycles-=
pp.lockref_put_return
> >>       4.26            +1.1        5.33        perf-profile.self.cycles=
-pp.common_perm_cond
> >>      15.45            +4.9       20.37        perf-profile.self.cycles=
-pp.lockref_put_or_lock
> >>      20.12            +6.7       26.82        perf-profile.self.cycles=
-pp.lockref_get_not_dead
> >
> > From the perf-profile above, the most visible change is more cycles in
> > lockref_get_not_dead(), which will loop with cmpxchg on
> > dentry->d_lockref.  So this appears to be related to the memory layout.
> > I will try to debug that.
> >
> > Because stress-ng is a weird "benchmark" although it's a very good
> > functionality test, and I cannot connect the patch with the test case
> > and performance metrics collected.  I think this regression should be a
> > low priority one which shouldn't prevent the merging etc.  But I will
> > continue to investigate the regression to try to root cause it.
> =

> Done more investigation for this.  It turns out the sched_domain has
> been changed after commit 0fb3978b0a, although it's not shown in default
> sched_verbose output.  sd->imb_numa_nr of level "NUMA" has been changed
> from 24 to 12 after the commit.  So the following debug patch restore
> the performance.
> =


If Ice Lake has multiple last level caches per socket (I didn't check)
then the sd->imb_numa_nr would have changed. I didn't dig into what
stress-ng fstat is doing as it's a stress test more than a performance
test but given that the number of threads is 10% of the total, it's
possible that the workload is being split across nodes differently.

-- =

Mel Gorman
SUSE Labs
--===============7213483654461330373==--

