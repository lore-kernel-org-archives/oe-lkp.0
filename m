Content-Type: multipart/mixed; boundary="===============2441172100277775228=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: [sched] 1827adb11a BUG kmalloc-128 (Not tainted): Poison overwritten
Date: Thu, 09 Mar 2017 09:45:47 +0100
Message-ID: <CACT4Y+YEeTaQp=es6MPiYDk=LweBqf5vVS7DH58hkvo8bcW_tw@mail.gmail.com>
In-Reply-To: <20170309030157.vzkijmdia77xwafv@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2441172100277775228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 9, 2017 at 4:01 AM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
> Hi Ingo,
>
> FYI this also shows up in next-20170308 and tip/master 7f27de49
> ("Merge branch 'WIP.sched/core'"). The attached reproduce-* script may
> help, however note that this bug may not show up in every boot.


This is not KASAN-detected bug, this is slub debug or something.
The crash looks like the issue that I fixed here few days ago:
https://groups.google.com/d/msg/syzkaller/dpZ6ou1WOiI/7zfgSe1QEAAJ



> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit 1827adb11ad26b2290dc9fe2aaf54976b2439865
> Merge: 7876991 5eca1c1
> Author:     Linus Torvalds <torvalds@linux-foundation.org>
> AuthorDate: Fri Mar 3 10:16:38 2017 -0800
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Fri Mar 3 10:16:38 2017 -0800
>
>      Merge branch 'WIP.sched-core-for-linus' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tip/tip
>
>      Pull sched.h split-up from Ingo Molnar:
>       "The point of these changes is to significantly reduce the
>        <linux/sched.h> header footprint, to speed up the kernel build and=
 to
>        have a cleaner header structure.
>
>        After these changes the new <linux/sched.h>'s typical preprocessed
>        size goes down from a previous ~0.68 MB (~22K lines) to ~0.45 MB (=
~15K
>        lines), which is around 40% faster to build on typical configs.
>
>        Not much changed from the last version (-v2) posted three weeks ag=
o: I
>        eliminated quirks, backmerged fixes plus I rebased it to an upstre=
am
>        SHA1 from yesterday that includes most changes queued up in -next =
plus
>        all sched.h changes that were pending from Andrew.
>
>        I've re-tested the series both on x86 and on cross-arch defconfigs,
>        and did a bisectability test at a number of random points.
>
>        I tried to test as many build configurations as possible, but some
>        build breakage is probably still left - but it should be mostly
>        limited to architectures that have no cross-compiler binaries
>        available on kernel.org, and non-default configurations"
>
>      * 'WIP.sched-core-for-linus' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/tip/tip: (146 commits)
>        sched/headers: Clean up <linux/sched.h>
>        sched/headers: Remove #ifdefs from <linux/sched.h>
>        sched/headers: Remove the <linux/topology.h> include from <linux/s=
ched.h>
>        sched/headers, hrtimer: Remove the <linux/wait.h> include from <li=
nux/hrtimer.h>
>        sched/headers, x86/apic: Remove the <linux/pm.h> header inclusion =
from <asm/apic.h>
>        sched/headers, timers: Remove the <linux/sysctl.h> include from <l=
inux/timer.h>
>        sched/headers: Remove <linux/magic.h> from <linux/sched/task_stack=
.h>
>        sched/headers: Remove <linux/sched.h> from <linux/sched/init.h>
>        sched/core: Remove unused prefetch_stack()
>        sched/headers: Remove <linux/rculist.h> from <linux/sched.h>
>        sched/headers: Remove the 'init_pid_ns' prototype from <linux/sche=
d.h>
>        sched/headers: Remove <linux/signal.h> from <linux/sched.h>
>        sched/headers: Remove <linux/rwsem.h> from <linux/sched.h>
>        sched/headers: Remove the runqueue_is_locked() prototype
>        sched/headers: Remove <linux/sched.h> from <linux/sched/hotplug.h>
>        sched/headers: Remove <linux/sched.h> from <linux/sched/debug.h>
>        sched/headers: Remove <linux/sched.h> from <linux/sched/nohz.h>
>        sched/headers: Remove <linux/sched.h> from <linux/sched/stat.h>
>        sched/headers: Remove the <linux/gfp.h> include from <linux/sched.=
h>
>        sched/headers: Remove <linux/rtmutex.h> from <linux/sched.h>
>        ...
>
> 78769912f6  Merge tag 'linux-kselftest-4.11-rc1-urgent_fix' of git://git.=
kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
> 5eca1c10cb  sched/headers: Clean up <linux/sched.h>
> 1827adb11a  Merge branch 'WIP.sched-core-for-linus' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip
> +-----------------------------------------------+------------+-----------=
-+------------+
> |                                               | 78769912f6 | 5eca1c10cb=
 | 1827adb11a |
> +-----------------------------------------------+------------+-----------=
-+------------+
> | boot_successes                                | 69         | 32        =
 | 166        |
> | boot_failures                                 | 0          | 0         =
 | 2          |
> | BUG_kmalloc-#(Not_tainted):Poison_overwritten | 0          | 0         =
 | 2          |
> | INFO:#-#.First_byte#instead_of                | 0          | 0         =
 | 2          |
> | INFO:Allocated_in_ida_pre_get_age=3D#cpu=3D#pid=3D  | 0          | 0   =
       | 2          |
> | INFO:Freed_in_ida_pre_get_age=3D#cpu=3D#pid=3D      | 0          | 0   =
       | 2          |
> | INFO:Slab#objects=3D#used=3D#fp=3D0x(null)flags=3D    | 0          | 0 =
         | 2          |
> | INFO:Object#@offset=3D#fp=3D                      | 0          | 0     =
     | 2          |
> +-----------------------------------------------+------------+-----------=
-+------------+
>
> [    2.792346] .................................... done.
> [    2.793824] Using IPI No-Shortcut mode
> [    2.806241] Key type trusted registered
> [    2.807779] ima: No TPM chip found, activating TPM-bypass! (rc=3D-19)
> [    2.810445] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [    2.813344] BUG kmalloc-128 (Not tainted): Poison overwritten
> [    2.813344] ----------------------------------------------------------=
-------------------
> [    2.813344]
> [    2.813344] Disabling lock debugging due to kernel taint
> [    2.813344] INFO: 0xd6ede140-0xd6ede1be. First byte 0xff instead of 0x=
6b
> [    2.813344] INFO: Allocated in ida_pre_get+0x3f/0x6a age=3D71 cpu=3D0 =
pid=3D19
> [    2.813344]  ___slab_alloc+0x4c6/0x4d8
> [    2.813344]  __slab_alloc+0x40/0x6a
> [    2.813344]  kmem_cache_alloc_trace+0x8b/0x150
> [    2.813344]  ida_pre_get+0x3f/0x6a
> [    2.813344]  ida_simple_get+0x8f/0x108
>
>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start f7f74b7bdd6cbca19825b59e7b5a126dd38d1bbd c470abd4fde40ea=
6a0846a2beab642a578c0b8cd --
> git bisect  bad 507eda8a922cef9ce495cdaa575f426363846153  # 03:51  B     =
 0     5   16   0  Merge 'davejiang/davejiang/ioatdma' into devel-spot-2017=
03041051
> git bisect  bad 6f37d50d389dd0905c0249dafeb9a2c4d6f187bd  # 04:06  B     =
 0     3   14   0  Merge 'block/for-linus' into devel-spot-201703041051
> git bisect good e3970327faad76348bb43b15501d2469e9599bcf  # 04:19  G     =
10     0    0   0  Merge 'rcar/drm/du/vsp-race-v2.1' into devel-spot-201703=
041051
> git bisect good c98d6d458fed6cb67187f95c33ba1c9a0599f60d  # 04:31  G     =
11     0    0   0  Merge 'linux-review/Tuomo-Rinne/staging-speakup-Fixed-co=
ding-style-errors-and-aligned-indents/20170304-061810' into devel-spot-2017=
03041051
> git bisect good 96e410f081d62b36da02fe71417f8266b05f6e34  # 04:42  G     =
11     0    0   0  Merge 'arm-integrator/apq8060-dragonboard-wm8903' into d=
evel-spot-201703041051
> git bisect good b4226ea1775995a06d8ee2d05e4b1294b8d2c9f9  # 04:56  G     =
11     0    0   0  Merge 'arm-integrator/apq8060-dragonboard-sdc5' into dev=
el-spot-201703041051
> git bisect good 3f80dd67c367878aaad16e458eebc3c8980bb841  # 04:56  G     =
11     0    0   0  Merge tag 'acpi-extra-4.11-rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/rafael/linux-pm
> git bisect good 5a2d6880f461faa416c0d329d46a128cf342c1eb  # 04:56  G     =
11     0    0   0  sched/headers: Remove <linux/sched.h> from <linux/sched/=
loadavg.h>
> git bisect good 78769912f680fc0a79a67e798a0ae76f07e63a7b  # 04:56  G     =
11     0    0   0  Merge tag 'linux-kselftest-4.11-rc1-urgent_fix' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
> git bisect  bad 1827adb11ad26b2290dc9fe2aaf54976b2439865  # 04:56  B     =
11     2    0   0  Merge branch 'WIP.sched-core-for-linus' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good 4f079e98a0db5f067c0981a526ff8938e21c52e2  # 05:13  G     =
11     0    0   0  sched/headers: Remove <linux/sched.h> from <linux/sched/=
debug.h>
> git bisect good 5c0d0f36414f9f8a292b42e797f9284b127d79c2  # 05:26  G     =
11     0    0   0  sched/headers: Remove <linux/sched.h> from <linux/sched/=
init.h>
> git bisect good 283cb90305cf1686594ed537c7a8cb188eba1a4d  # 05:38  G     =
11     0    0   0  sched/headers, hrtimer: Remove the <linux/wait.h> includ=
e from <linux/hrtimer.h>
> git bisect good 7f5f8e8d97d77edf33f2836259d1f19c6f4d94f5  # 05:48  G     =
11     0    0   0  sched/headers: Remove #ifdefs from <linux/sched.h>
> git bisect good 5eca1c10cbaa9c366c18ca79f81f21c731e3dcc7  # 05:59  G     =
11     0    0   0  sched/headers: Clean up <linux/sched.h>
> # first bad commit: [1827adb11ad26b2290dc9fe2aaf54976b2439865] Merge bran=
ch 'WIP.sched-core-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/=
git/tip/tip
> git bisect good 78769912f680fc0a79a67e798a0ae76f07e63a7b  # 06:02  G     =
31     0    0   0  Merge tag 'linux-kselftest-4.11-rc1-urgent_fix' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
> git bisect good 5eca1c10cbaa9c366c18ca79f81f21c731e3dcc7  # 06:06  G     =
30     0    0   0  sched/headers: Clean up <linux/sched.h>
> # extra tests on HEAD of linux-devel/devel-spot-201703041051
> git bisect  bad f7f74b7bdd6cbca19825b59e7b5a126dd38d1bbd  # 06:06  B     =
 0    39   53   0  0day head guard for 'devel-spot-201703041051'
> # extra tests on tree/branch linus/master
> git bisect  bad c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201  # 06:16  B     =
 0    11   22   0  Linux 4.11-rc1
> # extra tests on tree/branch linux-next/master
> git bisect good c0b7b2b33bd17f7155956d0338ce92615da686c9  # 06:16  G     =
11     0    0   0  Add linux-next specific files for 20170303
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
>
> --
> You received this message because you are subscribed to the Google Groups=
 "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kasan-dev+unsubscribe(a)googlegroups.com.
> To post to this group, send email to kasan-dev(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kasan-dev/20170309030157.vzkijmdia77xwafv%40wfg-t540p.sh.intel.com.
> For more options, visit https://groups.google.com/d/optout.

--===============2441172100277775228==--

