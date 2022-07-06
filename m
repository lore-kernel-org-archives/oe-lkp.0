Content-Type: multipart/mixed; boundary="===============2578623829039107768=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 2bd8eec68f: BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c
Date: Wed, 06 Jul 2022 22:21:36 +0800
Message-ID: <YsWacP1k8wMgGfXx@xsang-OptiPlex-9020>
In-Reply-To: <20220706115328.GE27531@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2578623829039107768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Mel Gorman,

On Wed, Jul 06, 2022 at 12:53:29PM +0100, Mel Gorman wrote:
> On Wed, Jul 06, 2022 at 10:55:35AM +0100, Mel Gorman wrote:
> > On Tue, Jul 05, 2022 at 09:51:25PM +0800, Oliver Sang wrote:
> > > Hi Andrew Morton,
> > > =

> > > On Sun, Jul 03, 2022 at 01:22:09PM -0700, Andrew Morton wrote:
> > > > On Sun, 3 Jul 2022 17:44:30 +0800 kernel test robot <oliver.sang@=
intel.com> wrote:
> > > > =

> > > > > FYI, we noticed the following commit (built with gcc-11):
> > > > > =

> > > > > commit: 2bd8eec68f740608db5ea58ecff06965228764cb ("[PATCH 7/7] mm=
/page_alloc: Replace local_lock with normal spinlock")
> > > > > url: https://github.com/intel-lab-lkp/linux/commits/Mel-Gorman/Dr=
ain-remote-per-cpu-directly/20220613-230139
> > > > > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux=
.git b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
> > > > > patch link: https://lore.kernel.org/lkml/20220613125622.18628-8-m=
gorman(a)techsingularity.net
> > > > > =

> > > > =

> > > > Did this test include the followup patch
> > > > mm-page_alloc-replace-local_lock-with-normal-spinlock-fix.patch?
> > > =

> > > no, we just fetched original patch set and test upon it.
> > > =

> > > now we applied the patch you pointed to us upon 2bd8eec68f and found =
the issue
> > > still exist.
> > > (attached dmesg FYI)
> > > =

> > =

> > Thanks Oliver.
> > =

> > The trace is odd in that it hits in GUP when the page allocator is no
> > longer active and the context is a syscall. First, is this definitely
> > the first patch the problem occurs?
> > =

> =

> I tried reproducing this on a 2-socket machine with Xeon
> Gold Gold 5218R CPUs. It was necessary to set timeouts in both
> vm/settings and kselftest/runner.sh to avoid timeouts. Testing with
> a standard config on my original 5.19-rc3 baseline and the baseline
> b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3 both passed. I tried your kernel
> config with i915 disabled (would not build) and necessary storage drivers
> and network drivers enabled (for boot and access). The kernel log shows
> a bunch of warnings related to USBAN during boot and during some of the
> tests but otherwise compaction_test completed successfully as well as
> the other VM tests.
> =

> Is this always reproducible?

not always but high rate.
we actually also observed other dmesgs stats for both 2bd8eec68f74 and its
parent, but those dmesg.BUG:sleeping_function_called_from_invalid_context_a=
t*
seem only happen on 2bd8eec68f74 as well as the '-fix' commit.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/group/kconfig/rootfs/sc_nr_hugepages/tbox_group/testcase/ucode:
  gcc-11/vm/x86_64-rhel-8.3-kselftests/debian-11.1-x86_64-20220510.cgz/2/lk=
p-csl-2sp9/kernel-selftests/0x500320a

commit:
  eec0ff5df294 ("mm/page_alloc: Remotely drain per-cpu lists")
  2bd8eec68f74 ("mm/page_alloc: Replace local_lock with normal spinlock")
  292baeb4c714 ("mm/page_alloc: replace local_lock with normal spinlock -fi=
x")

eec0ff5df2945d19 2bd8eec68f740608db5ea58ecff 292baeb4c7149ac2cb844137481
---------------- --------------------------- ---------------------------
       fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
           |             |             |             |             |
           :20          75%          15:20          70%          14:21    d=
mesg.BUG:scheduling_while_atomic
           :20           5%           1:20           0%            :21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_fs/binfmt_elf.c
           :20           5%           1:20          10%           2:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_fs/dcache.c
           :20           5%           1:20           5%           1:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_include/linux/fre=
ezer.h
           :20          10%           2:20          25%           5:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_include/linux/mmu=
_notifier.h
           :20           5%           1:20           0%            :21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_include/linux/per=
cpu-rwsem.h
           :20          40%           8:20          40%           8:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_include/linux/sch=
ed/mm.h
           :20          10%           2:20           0%            :21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mu=
tex.c
           :20          10%           2:20          10%           2:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_lib/strncpy_from_=
user.c
           :20          55%          11:20          65%          13:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c
           :20          15%           3:20           5%           1:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_mm/memory.c
           :20          60%          12:20          55%          11:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_mm/migrate.c
           :20           5%           1:20           5%           1:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
           :20           0%            :20           5%           1:21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_mm/rmap.c
           :20          15%           3:20           0%            :21    d=
mesg.BUG:sleeping_function_called_from_invalid_context_at_mm/vmalloc.c
           :20          45%           9:20          45%           9:21    d=
mesg.BUG:workqueue_leaked_lock_or_atomic
           :20          25%           5:20          15%           3:21    d=
mesg.Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D
           :20           5%           1:20           0%            :21    d=
mesg.RIP:__clear_user
         20:20           0%          20:20           5%          21:21    d=
mesg.RIP:rcu_eqs_exit
         20:20           0%          20:20           5%          21:21    d=
mesg.RIP:sched_clock_tick
           :20           5%           1:20           0%            :21    d=
mesg.RIP:smp_call_function_many_cond
         20:20           0%          20:20           5%          21:21    d=
mesg.WARNING:at_kernel/rcu/tree.c:#rcu_eqs_exit
         20:20           0%          20:20           5%          21:21    d=
mesg.WARNING:at_kernel/sched/clock.c:#sched_clock_tick
           :20           5%           1:20           0%            :21    d=
mesg.WARNING:at_kernel/smp.c:#smp_call_function_many_cond
         20:20           0%          20:20           5%          21:21    d=
mesg.WARNING:suspicious_RCU_usage
         20:20           0%          20:20           5%          21:21    d=
mesg.boot_failures
          9:20         -15%           6:20          -5%           8:21    d=
mesg.include/linux/rcupdate.h:#rcu_read_lock()used_illegally_while_idle
          9:20         -15%           6:20          -5%           8:21    d=
mesg.include/linux/rcupdate.h:#rcu_read_unlock()used_illegally_while_idle
         20:20           0%          20:20           5%          21:21    d=
mesg.include/trace/events/error_report.h:#suspicious_rcu_dereference_check(=
)usage
         20:20           0%          20:20           5%          21:21    d=
mesg.include/trace/events/lock.h:#suspicious_rcu_dereference_check()usage


> =

> -- =

> Mel Gorman
> SUSE Labs
--===============2578623829039107768==--

