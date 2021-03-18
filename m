Content-Type: multipart/mixed; boundary="===============2720494927786303488=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] 4112549ee5: WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog_nr[rcutorture]
Date: Thu, 18 Mar 2021 20:51:42 +0800
Message-ID: <20210318125142.GA17177@xsang-OptiPlex-9020>
In-Reply-To: <CABk29NsuhxvNEcUb+xUGgvsombJQ-9gGtRaytukMcJNCczTz8w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2720494927786303488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Mon, Mar 01, 2021 at 10:50:16PM -0800, Josh Don wrote:
> On Sun, Feb 28, 2021 at 7:00 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 4112549ee56c230415ebc5bbfa15533185ceb2e6 ("[PATCH] sched: Optim=
ize __calc_delta.")
> > url: https://github.com/0day-ci/linux/commits/Josh-Don/sched-Optimize-_=
_calc_delta/20210227-035552
> > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git c5e6fc08=
feb2b88dc5dac2f3c817e1c2a4cafda4
> >
> > in testcase: rcutorture
> > version:
> > with following parameters:
> >
> >         runtime: 300s
> >         test: cpuhotplug
> >         torture_type: rcu
> >
> > test-description: rcutorture is rcutorture kernel module load/unload te=
st.
> > test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> >
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 8G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> > +----------------------------------------------------------------------=
---+------------+------------+
> > |                                                                      =
   | c5e6fc08fe | 4112549ee5 |
> > +----------------------------------------------------------------------=
---+------------+------------+
> > | INFO:rcu_sched_self-detected_stall_on_CPU                            =
   | 0          | 18         |
> > | RIP:write_comp_data                                                  =
   | 0          | 4          |
> > | RIP:rcu_scale_wait_shutdown[rcuscale]                                =
   | 0          | 6          |
> > | RIP:___might_sleep                                                   =
   | 0          | 8          |
> > | RIP:rcu_scale_reader[rcuscale]                                       =
   | 0          | 18         |
> > | BUG:kernel_hang_in_test_stage                                        =
   | 0          | 20         |
> > | RIP:to_kthread                                                       =
   | 0          | 7          |
> > | RIP:__sanitizer_cov_trace_pc                                         =
   | 0          | 8          |
> > | RIP:rcu_all_qs                                                       =
   | 0          | 3          |
> > | RIP:check_kcov_mode                                                  =
   | 0          | 11         |
> > | RIP:test_bit                                                         =
   | 0          | 4          |
> > | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog_nr[rcutortur=
e] | 0          | 8          |
> > | RIP:rcu_torture_fwd_prog_nr[rcutorture]                              =
   | 0          | 8          |
> > | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog_cr[rcutortur=
e] | 0          | 9          |
> > | RIP:rcu_torture_fwd_prog_cr[rcutorture]                              =
   | 0          | 9          |
> > | RIP:__kasan_check_read                                               =
   | 0          | 6          |
> > | INFO:rcu_sched_detected_stalls_on_CPUs/tasks                         =
   | 0          | 5          |
> > | RIP:torture_must_stop[torture]                                       =
   | 0          | 2          |
> > | RIP:check_memory_region                                              =
   | 0          | 9          |
> > | RIP:__sanitizer_cov_trace_const_cmp4                                 =
   | 0          | 1          |
> > | RIP:kthread_should_stop                                              =
   | 0          | 1          |
> > +----------------------------------------------------------------------=
---+------------+------------+
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> >
> >
> > [  487.587615] ------------[ cut here ]------------
> > [  487.588208] WARNING: CPU: 0 PID: 3527 at kernel/rcu/rcutorture.c:196=
9 rcu_torture_fwd_prog_nr+0x467/0x533 [rcutorture]
> > [  487.589407] Modules linked in: rcutorture torture
> > [  487.589953] CPU: 0 PID: 3527 Comm: rcu_torture_fwd Tainted: G       =
 W         5.11.0-00053-g4112549ee56c #6
> > [  487.591092] RIP: 0010:rcu_torture_fwd_prog_nr+0x467/0x533 [rcutortur=
e]
> > [  487.591823] Code: 80 3c 02 00 74 05 e8 13 6d 4c e1 ff 53 30 48 8b 74=
 24 20 48 89 c7 e8 97 d7 ff ff 4d 85 e4 49 89 c0 75 0a 48 83 f8 01 77 04 90=
 <0f> 0b 90 48 8b 54 24 40 4c 89 e1 48 c7 c6 00 20 02 a0 48 c7 c7 a0
> > [  487.593721] RSP: 0018:ffff88812db27d80 EFLAGS: 00010297
> > [  487.594328] RAX: 0000000000000000 RBX: ffffffffa0025820 RCX: ffff888=
14393a8c0
> > [  487.595140] RDX: ffff88814393a8c0 RSI: 000000000001480d RDI: 0000000=
00001480d
> > [  487.595942] RBP: ffff88812db27e60 R08: 0000000000000000 R09: 0000000=
000000000
> > [  487.596741] R10: ffffed10297198b1 R11: ffff88814b8cc587 R12: 0000000=
000000000
> > [  487.597488] R13: dffffc0000000000 R14: ffff88814393a8c0 R15: 0000000=
000000000
> > [  487.598286] FS:  0000000000000000(0000) GS:ffff8881e8800000(0000) kn=
lGS:0000000000000000
> > [  487.599203] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  487.599860] CR2: 000055b0091b8f68 CR3: 000000014ce44000 CR4: 0000000=
0000406f0
> > [  487.600665] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> > [  487.601458] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000=
000000400
> > [  487.602258] Call Trace:
> > [  487.602560]  ? __sanitizer_cov_trace_pc+0x1e/0x43
> > [  487.603118]  ? tick_nohz_full_enabled+0x8e/0x8e [rcutorture]
> > [  487.603777]  ? __next_timer_interrupt+0x1e2/0x1e2
> > [  487.604314]  ? rcu_torture_boost_cb+0x3f/0x3f [rcutorture]
> > [  487.604941]  ? __do_set_cpus_allowed+0x1e0/0x1e0
> > [  487.605476]  ? __kasan_check_write+0x14/0x16
> > [  487.605965]  rcu_torture_fwd_prog+0x106/0x198 [rcutorture]
> > [  487.606619]  ? rcu_torture_fwd_prog_cr+0x5c4/0x5c4 [rcutorture]
> > [  487.607325]  ? __kasan_check_read+0x11/0x13
> > [  487.607765]  ? write_comp_data+0x24/0x6f
> > [  487.608204]  ? __sanitizer_cov_trace_pc+0x1e/0x43
> > [  487.608738]  ? __kthread_parkme+0x101/0x16d
> > [  487.609226]  kthread+0x327/0x33b
> > [  487.609576]  ? _raw_spin_unlock_irq+0x9/0x13
> > [  487.610021]  ? rcu_torture_fwd_prog_cr+0x5c4/0x5c4 [rcutorture]
> > [  487.610708]  ? kthread_queue_delayed_work+0xcd/0xcd
> > [  487.611282]  ret_from_fork+0x1f/0x30
> > [  487.611713] ---[ end trace 2946c7758b8349f5 ]---
> >
> >
> >
> > To reproduce:
> >
> >         # build kernel
> >         cd linux
> >         cp config-5.11.0-00053-g4112549ee56c .config
> >         make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepa=
re modules_prepare bzImage
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> >
> >
> >
> > Thanks,
> > Oliver Sang
> >
> =

> Hey there,
> =

> Is this known to have false positives? The patch in question is
> trivial and a noop in terms of behavior; I don't see how it could
> cause this warning. Is there a way to re-run the bot to confirm that
> this is the trigger for the warning?

sorry for false positive, we will investigate further to avoid this in the =
future.

> =

> Thanks,
> Josh
--===============2720494927786303488==--

