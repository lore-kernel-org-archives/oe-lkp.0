Content-Type: multipart/mixed; boundary="===============8041138397105454368=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: 039f56b399 ("make rcutorture always dump ftrace"): WARNING: CPU: 1 PID: 121 at kernel/trace/trace.c:3509 trace_find_next_entry
Date: Sat, 27 Jun 2020 12:41:20 +0800
Message-ID: <20200627044120.GA14444@intel.com>
In-Reply-To: <CAJWu+op5OOC34QA=bvdibs_soAnoAb23bKtG+3aQAgj+yUJnLA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8041138397105454368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 05:12:29PM -0400, Joel Fernandes wrote:
> I have since deleted this branch. Does it take a while to catch up?
Hi Joel, it may be cached in the bot when it starts to bisect
the issue, which need extra time to complete the whole steps. We
will double check whether the commit is exists or not before sending
out report. Sorry for this noise.

Thanks

> =

> On Wed, Jun 24, 2020 at 7:56 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Greetings,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu-seg=
cb
> >
> > commit 039f56b3996656cf3a0bdc306fcd09fc02fe3fbb
> > Author:     Joel Fernandes <joelaf@google.com>
> > AuthorDate: Tue Jun 23 16:33:45 2020 -0400
> > Commit:     Joel Fernandes <joelaf@google.com>
> > CommitDate: Tue Jun 23 16:34:30 2020 -0400
> >
> >     make rcutorture always dump ftrace
> >
> >     Signed-off-by: Joel Fernandes <joelaf@google.com>
> >
> > c4b4fa5b86  Add tracing for rcu_pending
> > 039f56b399  make rcutorture always dump ftrace
> > +--------------------------------------------------------+------------+=
------------+
> > |                                                        | c4b4fa5b86 |=
 039f56b399 |
> > +--------------------------------------------------------+------------+=
------------+
> > | boot_successes                                         | 35         |=
 0          |
> > | boot_failures                                          | 1          |=
 17         |
> > | WARNING:held_lock_freed                                | 1          |=
 1          |
> > | is_freeing_memory#-#,with_a_lock_still_held_there      | 1          |=
 1          |
> > | WARNING:at_kernel/trace/trace.c:#trace_find_next_entry | 0          |=
 17         |
> > | EIP:trace_find_next_entry                              | 0          |=
 17         |
> > +--------------------------------------------------------+------------+=
------------+
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > [  122.596183] rcu_tort-124     1d.h1 71613156us : invoke_rcu_core: Rai=
sing softirq
> > [  122.596183] swapper/-1       0d.h. 71613173us : invoke_rcu_core: Rai=
sing softirq
> > [  122.596183] rcu_tort-120     1d.h2 71621302us : invoke_rcu_core: Rai=
sing softirq
> > [  122.596183] ---------------------------------
> > [  122.596183] ------------[ cut here ]------------
> > [  122.596183] WARNING: CPU: 1 PID: 121 at kernel/trace/trace.c:3509 tr=
ace_find_next_entry+0xe9/0x270
> > [  122.596183] Modules linked in:
> > [  122.596183] CPU: 1 PID: 121 Comm: rcu_torture_sta Not tainted 5.8.0-=
rc1-00179-g039f56b399665 #1
> > [  122.596183] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.12.0-1 04/01/2014
> > [  122.596183] EIP: trace_find_next_entry+0xe9/0x270
> > [  122.596183] Code: 8f 4e c4 01 83 15 0c 8f 4e c4 00 39 48 6c 73 6b 81=
 fe 00 f5 4e c4 0f 85 25 01 00 00 83 05 10 8f 4e c4 01 83 15 14 8f 4e c4 00=
 <0f> 0b 83 05 20 8f 4e c4 01 83 15 24 8f 4e c4 00 eb 3f 8d 74 26 00
> > [  122.596183] EAX: c44ed400 EBX: c44ed400 ECX: 00000014 EDX: f1e360ec
> > [  122.596183] ESI: c44ef500 EDI: f1e360ec EBP: ee7a9e60 ESP: ee7a9e48
> > [  122.596183] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 000=
10046
> > [  122.596183] CR0: 80050033 CR2: ffffffff CR3: 04132000 CR4: 001406b0
> > [  122.596183] Call Trace:
> > [  122.596183]  trace_print_lat_context+0x47/0x620
> > [  122.596183]  ? find_next_bit+0x1d/0x30
> > [  122.596183]  ? cpumask_next+0x59/0x70
> > [  122.596183]  print_trace_line+0x928/0xb60
> > [  122.596183]  ftrace_dump+0x307/0x4b0
> > [  122.596183]  rcu_torture_stats_print+0x908/0x9d0
> > [  122.596183]  rcu_torture_stats+0x88/0x100
> > [  122.596183]  kthread+0x244/0x260
> > [  122.596183]  ? rcu_torture_stats_print+0x9d0/0x9d0
> > [  122.596183]  ? kthread_unpark+0xd0/0xd0
> > [  122.596183]  ret_from_fork+0x19/0x30
> > [  122.596183] ---[ end trace ca04e5844f44c5cc ]---
> > [  149.891205] [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 0
> >
> >                                                           # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> > git bisect start 82cf130fe4c5a6e6712f8bd07e42f6455cb9db4e 48778464bb7d3=
46b47157d21ffde2af6b2d39110 --
> > git bisect good ea343062323ab751211db6e3931c41737584891e  # 01:30  G   =
  10     0    1   1  Merge 'hid/for-next' into devel-catchup-202006242334
> > git bisect  bad d55c151aaabf8418b956d88b38864650c88a789c  # 01:44  B   =
   0     1   17   0  Merge 'tip/ras/core' into devel-catchup-202006242334
> > git bisect good 2b99151919ed84b0b4635936833d6873f81e7700  # 02:19  G   =
  11     0    2   3  Merge 'saeed/net-next' into devel-catchup-202006242334
> > git bisect  bad 8be1d8a5c01dc631735fee16545fd67b8b6c986e  # 02:39  B   =
   0     1   17   0  Merge 'hch-misc/cleanup-kernel-rw-helpers.3' into deve=
l-catchup-202006242334
> > git bisect good 53eaebe99597aa35661387ecdd53dcac64dedb01  # 03:19  G   =
  11     0    1   1  Merge 'mkp-scsi/fixes' into devel-catchup-202006242334
> > git bisect  bad 7761f825fef535e2f775c3d98bb6558639116d27  # 03:52  B   =
   0     1   17   0  Merge 'jfern/rcu-segcb' into devel-catchup-202006242334
> > git bisect good e3be8c671913af551669f244f5977fb93eea27e2  # 04:22  G   =
  10     0    0   0  Merge branches 'doc.2020.06.17a', 'fixes.2020.06.17a',=
 'rcu-tasks.2020.06.17a', 'scale.2020.06.17a', 'srcu.2020.06.17a' and 'tort=
ure.2020.06.17a' into HEAD
> > git bisect good a60a604d76885d24fcaa65dd1839046589f60766  # 04:44  G   =
  10     0    1   1  tools/memory-model: Make judgelitmus.sh handle scripte=
d Result: tag
> > git bisect good 04e5111a0192dce73b7ef58b8288e16b2855b378  # 05:07  G   =
  10     0    1   1  rcu/tree: Use static initializer for krc.lock
> > git bisect good 6f92ad84da8ba905864d5fe0e616494fb718a84e  # 05:32  G   =
  10     0    2   2  rcu: Initialize at declaration time in rcu_exp_handler=
()
> > git bisect good 1fce90226d6138c0c8fe6f4a913119d4f0c15263  # 05:48  G   =
  10     0    1   1  rcu/trace: Use rsp's gp_seq in acceleration's rcu_grac=
e_period tracepoint
> > git bisect good b4ef7c752f22afcd8fa65809c8e6f974dc27714a  # 06:25  G   =
  10     0    2   2  rcutree: Make rcu_advance also print Segcb after WAIT-=
>DONE happens
> > git bisect  bad 039f56b3996656cf3a0bdc306fcd09fc02fe3fbb  # 06:37  B   =
   0     3   22   3  make rcutorture always dump ftrace
> > git bisect good c4b4fa5b86f7aca290f6218570980b451d17010a  # 07:00  G   =
  10     0    0   0  Add tracing for rcu_pending
> > # first bad commit: [039f56b3996656cf3a0bdc306fcd09fc02fe3fbb] make rcu=
torture always dump ftrace
> > git bisect good c4b4fa5b86f7aca290f6218570980b451d17010a  # 07:06  G   =
  32     0    1   2  Add tracing for rcu_pending
> > # extra tests with debug options
> > git bisect  bad 039f56b3996656cf3a0bdc306fcd09fc02fe3fbb  # 07:17  B   =
   0     2   19   1  make rcutorture always dump ftrace
> > # extra tests on head commit of jfern/rcu-segcb
> > git bisect  bad 039f56b3996656cf3a0bdc306fcd09fc02fe3fbb  # 07:33  B   =
   0    17   33   0  make rcutorture always dump ftrace
> > # bad: [039f56b3996656cf3a0bdc306fcd09fc02fe3fbb] make rcutorture alway=
s dump ftrace
> > # extra tests on revert first bad commit
> > git bisect good a5800fbf9102456673f4fd9f2c9692dfa71392d8  # 07:55  G   =
  10     0    0   0  Revert "make rcutorture always dump ftrace"
> > # good: [a5800fbf9102456673f4fd9f2c9692dfa71392d8] Revert "make rcutort=
ure always dump ftrace"
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
--===============8041138397105454368==--

