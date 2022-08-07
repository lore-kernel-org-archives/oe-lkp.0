Content-Type: multipart/mixed; boundary="===============0159646813840335858=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] 9ae606bc74: WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]
Date: Sun, 07 Aug 2022 13:47:00 +0800
Message-ID: <Yu9R1NgpU5C5bcXi@xsang-OptiPlex-9020>
In-Reply-To: <YuNtuaIwGknyxJcm@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0159646813840335858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Will,

On Fri, Jul 29, 2022 at 01:18:49PM +0800, Oliver Sang wrote:
> hi Will,
> =

> On Mon, Jul 25, 2022 at 10:20:58AM +0100, Will Deacon wrote:
> > On Mon, Jul 25, 2022 at 04:12:57PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with clang-15):
> > > =

> > > commit: 9ae606bc74dd0e58d4de894e3c5cbb9d45599267 ("sched: Introduce t=
ask_cpu_possible_mask() to limit fallback rq selection")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > =

> > > in testcase: rcutorture
> > > version: =

> > > with following parameters:
> > > =

> > > 	runtime: 300s
> > > 	test: cpuhotplug
> > > 	torture_type: trivial
> > > =

> > > test-description: rcutorture is rcutorture kernel module load/unload =
test.
> > > test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> > > =

> > > =

> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp=
 2 -m 16G
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > +--------------------------------------------------------------------=
-----+------------+------------+
> > > |                                                                    =
     | 304000390f | 9ae606bc74 |
> > > +--------------------------------------------------------------------=
-----+------------+------------+
> > > | WARNING:at_kernel/rcu/rcutorture.c:#synchronize_rcu_trivial[rcutort=
ure] | 120        | 120        |
> > > | RIP:synchronize_rcu_trivial[rcutorture]                            =
     | 120        | 120        |
> > > | WARNING:at_kernel/rcu/update.c:#rcutorture_sched_setaffinity       =
     | 120        | 120        |
> > > | RIP:rcutorture_sched_setaffinity                                   =
     | 120        | 120        |
> > > | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutort=
ure] | 0          | 36         |
> > > | RIP:rcu_torture_stats_print[rcutorture]                            =
     | 0          | 36         |
> > > +--------------------------------------------------------------------=
-----+------------+------------+
> > > =

> > > =

> > > please be noted, since 9ae606bc74 is kind of old, we also tested on a=
 latest
> > > mainline commit:
> > > commit 515f71412bb73ebd7f41f90e1684fc80b8730789
> > > Merge: 301c8949322fe cf5029d5dd7cb
> > > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > > Date:   Sat Jul 23 10:22:26 2022 -0700
> > > =

> > > and confirmed the
> > >    WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutor=
ture]
> > > still exists.
> > =

> > I'm not convinced by the bisection -- that commit should't have any eff=
ect
> > on x86.


recently we updated our clang to version 16 so we rerun this case, then fou=
nd
the issue also could be reproduced on parent, though the rate seems quite
smaller than this commit.

304000390f88d049 9ae606bc74dd0e58d4de894e3c5
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          3:300         36%         112:300   dmesg.RIP:rcu_torture_stats_p=
rint[rcutorture]
        300:300         -0%         299:300   dmesg.RIP:rcutorture_sched_se=
taffinity
        300:300         -0%         299:300   dmesg.RIP:synchronize_rcu_tri=
vial[rcutorture]
          3:300         36%         112:300   dmesg.WARNING:at_kernel/rcu/r=
cutorture.c:#rcu_torture_stats_print[rcutorture]
        300:300         -0%         299:300   dmesg.WARNING:at_kernel/rcu/r=
cutorture.c:#synchronize_rcu_trivial[rcutorture]
        300:300         -0%         299:300   dmesg.WARNING:at_kernel/rcu/u=
pdate.c:#rcutorture_sched_setaffinity


we also checked the dmesg, confirmed they have same Call Trace and similar
context when the issue reproduced. so this is a false positive.

sorry if this caused any inconvenience.

> =

> Thanks a lot for your information!
> we will do some further tests to see if below part could impact x86.
> will update you next week. thanks
> =

> @@ -3124,9 +3124,7 @@ static int select_fallback_rq(int cpu, struct task_=
struct *p)
> =

>                 /* Look for allowed, online CPU in same node. */
>                 for_each_cpu(dest_cpu, nodemask) {
> -                       if (!cpu_active(dest_cpu))
> -                               continue;
> -                       if (cpumask_test_cpu(dest_cpu, p->cpus_ptr))
> +                       if (is_cpu_allowed(p, dest_cpu))
>                                 return dest_cpu;
>                 }
>         }
> =

> =

> > =

> > Will
--===============0159646813840335858==--

