Content-Type: multipart/mixed; boundary="===============3141374490463432651=="
MIME-Version: 1.0
From: Kirill Tkhai <ktkhai@parallels.com>
To: lkp@lists.01.org
Subject: Re: [sched] [ INFO: suspicious RCU usage. ]
Date: Wed, 29 Oct 2014 08:08:31 +0300
Message-ID: <1414559311.8574.14.camel@tkhai>
In-Reply-To: <20141028142715.GB19097@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3141374490463432651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks, Fengguang.

I've suggested this patch https://lkml.org/lkml/2014/10/28/41.

=D0=92 =D0=92=D1=82, 28/10/2014 =D0=B2 22:27 +0800, Fengguang Wu =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/urge=
nt
> commit f6a2b544517d33f6a1e428567bda96fd859ce1c9
> Author:     Kirill Tkhai <ktkhai@parallels.com>
> AuthorDate: Mon Oct 27 14:18:25 2014 +0400
> Commit:     Peter Zijlstra <peterz@infradead.org>
> CommitDate: Mon Oct 27 13:23:31 2014 +0100
> =

>     sched: Fix race between task_group and sched_task_group
>     =

>     The race may happen when somebody is changing task_group of a forking=
 task.
>     Child's cgroup is the same as parent's after dup_task_struct() (there=
 just
>     memory copying). Also, cfs_rq and rt_rq are the same as parent's.
>     =

>     But if parent changes its task_group before it's called cgroup_post_f=
ork(),
>     we do not reflect this situation on child. Child's cfs_rq and rt_rq r=
emain
>     the same, while child's task_group changes in cgroup_post_fork().
>     =

>     To fix this we introduce fork() method, which calls sched_move_task()=
 directly.
>     This function changes sched_task_group on appropriate (also its logic=
 has
>     no problem with freshly created tasks, so we shouldn't introduce some=
thing
>     special; we are able just to use it).
>     =

>     Possibly, this decides the Burke Libbey's problem: https://lkml.org/l=
kml/2014/10/24/456
>     =

>     Signed-off-by: Kirill Tkhai <ktkhai@parallels.com>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Link: http://lkml.kernel.org/r/1414405105.19914.169.camel(a)tkhai
> =

> +---------------------------+-----------+------------+------------+
> |                           | v3.18-rc2 | f6a2b54451 | 8e5859c73b |
> +---------------------------+-----------+------------+------------+
> | boot_successes            | 200       | 0          | 0          |
> | boot_failures             | 1         | 20         | 11         |
> | BUG:kernel_boot_hang      | 1         |            |            |
> | INFO:suspicious_RCU_usage | 0         | 20         | 11         |
> | backtrace:do_fork         | 0         | 20         | 11         |
> +---------------------------+-----------+------------+------------+
> =

> [    0.060187] =

> [    0.060500] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.060500] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.061307] [ INFO: suspicious RCU usage. ]
> [    0.061307] [ INFO: suspicious RCU usage. ]
> [    0.062109] 3.18.0-rc2-gf6a2b54 #404 Not tainted
> [    0.062109] 3.18.0-rc2-gf6a2b54 #404 Not tainted
> [    0.063049] -------------------------------
> =

> git bisect start 8e5859c73b9f45602222441a23eba899bb24c82e 522e980064c24d3=
dd9859e9375e17417496567cf --
> git bisect  bad 259820751fd17a4b49098429c68c2c0adfd1c9ed  # 21:11      0-=
      2  Merge branch 'sched/core'
> git bisect  bad 8c64bf8de891aa51e916b51a3f7992321ec19b63  # 21:15      0-=
      1  Merge branch 'sched/urgent'
> git bisect  bad fd457f2bafdc4e367d1814ac395035a35980783f  # 21:27      0-=
      7  sched/fair: Care divide error in update_task_scan_period()
> git bisect  bad fb5b330f079e243dcc831e9a3d65b9b9fbbed7f8  # 21:36      0-=
      1  sched/deadline: don't replenish from a !SCHED_DEADLINE entity
> git bisect  bad f6a2b544517d33f6a1e428567bda96fd859ce1c9  # 21:41      0-=
      2  sched: Fix race between task_group and sched_task_group
> # first bad commit: [f6a2b544517d33f6a1e428567bda96fd859ce1c9] sched: Fix=
 race between task_group and sched_task_group
> git bisect good cac7f2429872d3733dc3f9915857b1691da2eb2f  # 21:58     60+=
      1  Linux 3.18-rc2
> git bisect  bad 8e5859c73b9f45602222441a23eba899bb24c82e  # 22:00      0-=
     11  Merge branch 'sched/wait'
> git bisect good cac7f2429872d3733dc3f9915857b1691da2eb2f  # 22:05     60+=
      1  Linux 3.18-rc2
> git bisect good 7a891e6323e963f3301e44bdeee734028e34d390  # 22:14     60+=
      0  Add linux-next specific files for 20141027
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-cpu kvm64
> 	-enable-kvm
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 320
> 	-smp 2
> 	-net nic,vlan=3D1,model=3De1000
> 	-net user,vlan=3D1
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null =

> )
> =

> append=3D(
> 	hung_task_panic=3D1
> 	earlyprintk=3DttyS0,115200
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	root=3D/dev/ram0
> 	rw
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
> =

> Thanks,
> Fengguang
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com



--===============3141374490463432651==--

