Content-Type: multipart/mixed; boundary="===============1810666472231780252=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 2bd8eec68f: BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c
Date: Thu, 07 Jul 2022 16:22:24 +0800
Message-ID: <YsaXwMrksMXtCh/p@xsang-OptiPlex-9020>
In-Reply-To: <20220706145241.GG27531@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1810666472231780252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mel Gorman,

On Wed, Jul 06, 2022 at 03:52:41PM +0100, Mel Gorman wrote:
> On Wed, Jul 06, 2022 at 10:21:36PM +0800, Oliver Sang wrote:
> > > I tried reproducing this on a 2-socket machine with Xeon
> > > Gold Gold 5218R CPUs. It was necessary to set timeouts in both
> > > vm/settings and kselftest/runner.sh to avoid timeouts. Testing with
> > > a standard config on my original 5.19-rc3 baseline and the baseline
> > > b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3 both passed. I tried your ke=
rnel
> > > config with i915 disabled (would not build) and necessary storage dri=
vers
> > > and network drivers enabled (for boot and access). The kernel log sho=
ws
> > > a bunch of warnings related to USBAN during boot and during some of t=
he
> > > tests but otherwise compaction_test completed successfully as well as
> > > the other VM tests.
> > > =

> > > Is this always reproducible?
> > =

> > not always but high rate.
> > we actually also observed other dmesgs stats for both 2bd8eec68f74 and =
its
> > parent
> =

> Ok, it's unclear what the "other dmesg stats" are but given that it happe=
ns
> for the parent. Does 5.19-rc2 (your baseline) have the same messages as
> 2bd8eec68f74^?

yeah, 5.19-rc2 has similar results as 2bd8eec68f74^ by multi-runs, while
2bd8eec68f74 looks quite similar to '-fix' commit which we applied it as
292baeb4c714.

take the 'BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c'
we reported as example:

       v5.19-rc2 eec0ff5df2945d19039d16841b9 2bd8eec68f740608db5ea58ecff 29=
2baeb4c7149ac2cb844137481
---------------- --------------------------- --------------------------- --=
-------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs  %=
reproduction    fail:runs
           |             |             |             |             |       =
      |             |
           :31           0%            :20          55%          11:20     =
     65%          13:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_mm/gup.c

the 'fail:runs' means we observed the issue 'fail' times while running 'run=
s'
times.

for v5.19-rc2, " :31", so we run the same jobs upon v5.19-rc2 31 times, but
never see this
  "dmesg.BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c"

for eec0ff5df2 (2bd8eec68f74^), also clean on 20 runs.

but for both
  2bd8eec68f74 ("mm/page_alloc: Replace local_lock with normal spinlock")
  292baeb4c714 ("mm/page_alloc: replace local_lock with normal spinlock -fi=
x")
it almost can reproduce in half of runs (11 out of 20 runs, 13 out of 31 ru=
ns
respectively)

the full comparison of these 4 commits are as [1]

generally, for those dmesg.BUG:sleeping_function_called_from_invalid***,
quite clean on v5.19-rc2 2bd8eec68f74^,
but have similar rate on 2bd8eec68f74 & 292baeb4c714

but we also obversed other issues, such like "dmesg.RIP:rcu_eqs_exit",
almost always happen on all 4 commits (this is what I said 'other dmesg
stats', sorry for confusion, and I will avoid using this kind of 'internal'
words in the future)

> Does the kselftests vm suite always pass but sometimes
> fails with 2bd8eec68f74?

below is results of kselftests vm suite, so it's really like what you said,
sometimes fails with 2bd8eec68f74 (also 292baeb4c714)
one example is
  kernel-selftests.vm.run_vmtests.sh../userfaultfd_anon_20_16
if always pass on v5.19-rc2 and 2bd8eec68f74^
but fail 6 times out of 20 runs on 2bd8eec68f74, and fail 5 times out of
21 runs on 292baeb4c714

but since this rate seems not match with above issues, so not sure if they
are related?


       v5.19-rc2 eec0ff5df2945d19039d16841b9 2bd8eec68f740608db5ea58ecff 29=
2baeb4c7149ac2cb844137481
---------------- --------------------------- --------------------------- --=
-------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs  %=
reproduction    fail:runs
           |             |             |             |             |       =
      |             |
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.madv_populate.fail
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../gup_test_a.=
pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../gup_test_ct=
_F_0x1_0_19_0x1000.pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../gup_test_u.=
pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../hugepage_mm=
ap.pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../hugepage_mr=
emap_./huge/huge_mremap.pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../hugepage_sh=
m.pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../hugepage_vm=
emmap.pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../hugetlb_mad=
vise_./huge/madvise_test.pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../map_fixed_n=
oreplace.pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.run_vmtests.sh../map_hugetlb=
.pass
         31:31         -35%          20:20         -30%          14:20     =
    -20%          16:21    kernel-selftests.vm.run_vmtests.sh../userfaultfd=
_anon_20_16.pass
         31:31         -35%          20:20         -30%          14:20     =
    -20%          16:21    kernel-selftests.vm.run_vmtests.sh../userfaultfd=
_hugetlb_256_32.pass
         29:31         -32%          19:20         -29%          13:20     =
    -34%          12:21    kernel-selftests.vm.run_vmtests.sh../userfaultfd=
_shmem_20_16.pass
         31:31         -35%          20:20         -35%          13:20     =
    -25%          15:21    kernel-selftests.vm.run_vmtests.sh.fail
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.soft-dirty.pass
         31:31         -35%          20:20           0%          20:20     =
      5%          21:21    kernel-selftests.vm.split_huge_page_test.pass
> =

> > but those dmesg.BUG:sleeping_function_called_from_invalid_context_at*
> > seem only happen on 2bd8eec68f74 as well as the '-fix' commit.
> > =

> =

> And roughly how often does it happen? I'm running it in a loop now to
> see if I can trigger it locally.

just as above, the 'BUG:sleeping_function_called_from_invalid_context_at_mm=
/gup.c'
has around 50% rate to happen upon 2bd8eec68f74 & 292baeb4c714


BTW, will test that patch you mentioned in another mail later and update you
with the results.


> =

> -- =

> Mel Gorman
> SUSE Labs


[1]
       v5.19-rc2 eec0ff5df2945d19039d16841b9 2bd8eec68f740608db5ea58ecff 29=
2baeb4c7149ac2cb844137481
---------------- --------------------------- --------------------------- --=
-------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs  %=
reproduction    fail:runs
           |             |             |             |             |       =
      |             |
           :31           0%            :20          75%          15:20     =
     70%          14:21    dmesg.BUG:scheduling_while_atomic
           :31           0%            :20           5%           1:20     =
      0%            :21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_fs/binfmt_elf.c
           :31           0%            :20           5%           1:20     =
     10%           2:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_fs/dcache.c
           :31           0%            :20           5%           1:20     =
      5%           1:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_include/linux/freezer.h
           :31           0%            :20          10%           2:20     =
     25%           5:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_include/linux/mmu_notifier.h
           :31           0%            :20           5%           1:20     =
      0%            :21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_include/linux/percpu-rwsem.h
           :31           0%            :20          40%           8:20     =
     40%           8:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_include/linux/sched/mm.h
           :31           0%            :20          10%           2:20     =
      0%            :21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_kernel/locking/mutex.c
           :31           0%            :20          10%           2:20     =
     10%           2:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_lib/strncpy_from_user.c
           :31           0%            :20          55%          11:20     =
     65%          13:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_mm/gup.c
           :31           0%            :20          15%           3:20     =
      5%           1:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_mm/memory.c
           :31           0%            :20          60%          12:20     =
     55%          11:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_mm/migrate.c
           :31           0%            :20           5%           1:20     =
      5%           1:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_mm/page_alloc.c
           :31           0%            :20           0%            :20     =
      5%           1:21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_mm/rmap.c
           :31           0%            :20          15%           3:20     =
      0%            :21    dmesg.BUG:sleeping_function_called_from_invalid_=
context_at_mm/vmalloc.c
           :31           0%            :20          45%           9:20     =
     45%           9:21    dmesg.BUG:workqueue_leaked_lock_or_atomic
           :31           0%            :20          25%           5:20     =
     15%           3:21    dmesg.Kernel_panic-not_syncing:Attempted_to_kill=
_init!exitcode=3D
           :31           0%            :20           5%           1:20     =
      0%            :21    dmesg.RIP:__clear_user
         29:31         -29%          20:20           6%          20:20     =
     11%          21:21    dmesg.RIP:rcu_eqs_exit
         29:31         -29%          20:20           6%          20:20     =
     11%          21:21    dmesg.RIP:sched_clock_tick
           :31           0%            :20           5%           1:20     =
      0%            :21    dmesg.RIP:smp_call_function_many_cond
         29:31         -29%          20:20           6%          20:20     =
     11%          21:21    dmesg.WARNING:at_kernel/rcu/tree.c:#rcu_eqs_exit
         29:31         -29%          20:20           6%          20:20     =
     11%          21:21    dmesg.WARNING:at_kernel/sched/clock.c:#sched_clo=
ck_tick
           :31           0%            :20           5%           1:20     =
      0%            :21    dmesg.WARNING:at_kernel/smp.c:#smp_call_function=
_many_cond
         29:31         -29%          20:20           6%          20:20     =
     11%          21:21    dmesg.WARNING:suspicious_RCU_usage
         29:31         -29%          20:20           6%          20:20     =
     11%          21:21    dmesg.boot_failures
         11:31          -6%           9:20          -5%           6:20     =
      5%           8:21    dmesg.include/linux/rcupdate.h:#rcu_read_lock()u=
sed_illegally_while_idle
         11:31          -6%           9:20          -5%           6:20     =
      5%           8:21    dmesg.include/linux/rcupdate.h:#rcu_read_unlock(=
)used_illegally_while_idle
         29:31         -29%          20:20           6%          20:20     =
     11%          21:21    dmesg.include/trace/events/error_report.h:#suspi=
cious_rcu_dereference_check()usage
         29:31         -29%          20:20           6%          20:20     =
     11%          21:21    dmesg.include/trace/events/lock.h:#suspicious_rc=
u_dereference_check()usage
--===============1810666472231780252==--

