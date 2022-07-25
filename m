Content-Type: multipart/mixed; boundary="===============6939186869338972706=="
MIME-Version: 1.0
From: Will Deacon <will@kernel.org>
To: lkp@lists.01.org
Subject: Re: [sched] 9ae606bc74: WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]
Date: Mon, 25 Jul 2022 10:20:58 +0100
Message-ID: <20220725092057.GB20370@willie-the-truck>
In-Reply-To: <Yt5Qia3AwDOodKI1@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6939186869338972706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 04:12:57PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with clang-15):
> =

> commit: 9ae606bc74dd0e58d4de894e3c5cbb9d45599267 ("sched: Introduce task_=
cpu_possible_mask() to limit fallback rq selection")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: rcutorture
> version: =

> with following parameters:
> =

> 	runtime: 300s
> 	test: cpuhotplug
> 	torture_type: trivial
> =

> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
-+------------+------------+
> |                                                                        =
 | 304000390f | 9ae606bc74 |
> +------------------------------------------------------------------------=
-+------------+------------+
> | WARNING:at_kernel/rcu/rcutorture.c:#synchronize_rcu_trivial[rcutorture]=
 | 120        | 120        |
> | RIP:synchronize_rcu_trivial[rcutorture]                                =
 | 120        | 120        |
> | WARNING:at_kernel/rcu/update.c:#rcutorture_sched_setaffinity           =
 | 120        | 120        |
> | RIP:rcutorture_sched_setaffinity                                       =
 | 120        | 120        |
> | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]=
 | 0          | 36         |
> | RIP:rcu_torture_stats_print[rcutorture]                                =
 | 0          | 36         |
> +------------------------------------------------------------------------=
-+------------+------------+
> =

> =

> please be noted, since 9ae606bc74 is kind of old, we also tested on a lat=
est
> mainline commit:
> commit 515f71412bb73ebd7f41f90e1684fc80b8730789
> Merge: 301c8949322fe cf5029d5dd7cb
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Jul 23 10:22:26 2022 -0700
> =

> and confirmed the
>    WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]
> still exists.

I'm not convinced by the bisection -- that commit should't have any effect
on x86.

Will
--===============6939186869338972706==--

