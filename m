Content-Type: multipart/mixed; boundary="===============6776868809189383140=="
MIME-Version: 1.0
From: Liu, Yujie <yujie.liu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, slub] 212a680451: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Fri, 18 Jun 2021 08:59:42 +0000
Message-ID: <SJ0PR11MB55983FA2B4C2992763588B82FB0D9@SJ0PR11MB5598.namprd11.prod.outlook.com>
In-Reply-To: <9facfd79-8265-a541-42bb-7f9ad3bf3c41@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6776868809189383140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On 6/15/21 4:54 PM, kernel test robot wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 212a68045198b7e882652e923283d56e423dac7c ("mm, slub: move disab=
ling/enabling irqs to ___slab_alloc()")
> > https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-loca=
l-lock-v2r2
> =

> Nice, I wonder if you found the branch because I posted a link here [1] o=
r the
> robot tries everything?
> =

> In any case this bug should be fixed by slub-local-lock-v2r3 that I linke=
d here
> [2]. Is there a way to have the bot explicitly verify it?
> =

> Thanks!
> =

> [1] https://lore.kernel.org/lkml/7be07579-d7fd-d9b7-0c86-a8bf7fc094fc(a)s=
use.cz/
> [2] https://lore.kernel.org/lkml/0edf0478-17ed-4120-22e1-b61ad9bddeec(a)s=
use.cz/
> =

 =

Hi Vlastimil,

We have verified the counterpart commit (03c72b2b6541) and head commit (f93=
38c1399c9) of slub-local-lock-v2r3, and the issue is gone on this branch.

Thanks

> > in testcase: xfstests
> > version: xfstests-x86_64-820b5e3-1_20210609
> > with following parameters:
> >
> > 	disk: 4HDD
> > 	fs: xfs
> > 	test: xfs-reflink-15
> > 	ucode: 0x28
> >
> > test-description: xfstests is a regression test suite for xfs and other=
 files ystems.
> > test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> >
> >
> > on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4790 v3 @ 3.6=
0GHz with 6G memory
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> >
> >
> > [    1.901338] BUG: sleeping function called from invalid context at mm=
/page_alloc.c:4992
> > [    1.902316] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1=
, name: swapper/0
> > [    1.903315] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5-000=
12-g212a68045198 #1
> > [    1.904314] Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A11 =
04/01/2015
> > [    1.904314] Call Trace:
> > [    1.904314] dump_stack (kbuild/src/consumer/lib/dump_stack.c:122)
> > [    1.904314] ___might_sleep.cold (kbuild/src/consumer/kernel/sched/co=
re.c:8339 kbuild/src/consumer/kernel/sched/core.c:8296)
> > [    1.904314] __alloc_pages (kbuild/src/consumer/mm/page_alloc.c:4992 =
kbuild/src/consumer/mm/page_alloc.c:5189)
> > [    1.904314] allocate_slab (kbuild/src/consumer/mm/slub.c:1625 kbuild=
/src/consumer/mm/slub.c:1765)
> > [    1.904314] ___slab_alloc (kbuild/src/consumer/mm/slub.c:2707)
> > [    1.904314] ? kprobe_add_ksym_blacklist (kbuild/src/consumer/include=
/linux/slab.h:556 kbuild/src/consumer/kernel/kprobes.c:2239)
> > [    1.904314] ? __schedule (kbuild/src/consumer/kernel/sched/core.c:51=
55)
> > [    1.904314] ? task_rq_lock (kbuild/src/consumer/include/linux/sched.=
h:1993 kbuild/src/consumer/kernel/sched/core.c:241)
> > [    1.904314] ? kallsyms_lookup_size_offset (kbuild/src/consumer/kerne=
l/kallsyms.c:298)
> > [    1.904314] ? kprobe_add_ksym_blacklist (kbuild/src/consumer/include=
/linux/slab.h:556 kbuild/src/consumer/kernel/kprobes.c:2239)
> > [    1.904314] kmem_cache_alloc_trace (kbuild/src/consumer/mm/slub.c:27=
78 kbuild/src/consumer/mm/slub.c:2861
> kbuild/src/consumer/mm/slub.c:2903 kbuild/src/consumer/mm/slub.c:2920)
> > [    1.904314] ? asm_exc_device_not_available (kbuild/src/consumer/arch=
/x86/include/asm/idtentry.h:558)
> > [    1.904314] kprobe_add_ksym_blacklist (kbuild/src/consumer/include/l=
inux/slab.h:556 kbuild/src/consumer/kernel/kprobes.c:2239)
> > [    1.904314] ? init_optprobes (kbuild/src/consumer/kernel/kprobes.c:2=
477)
> > [    1.904314] init_kprobes (kbuild/src/consumer/kernel/kprobes.c:2328 =
kbuild/src/consumer/kernel/kprobes.c:2485)
> > [    1.904314] ? init_optprobes (kbuild/src/consumer/kernel/kprobes.c:2=
477)
> > [    1.904314] do_one_initcall (kbuild/src/consumer/init/main.c:1249)
> > [    1.904314] kernel_init_freeable (kbuild/src/consumer/init/main.c:13=
66 kbuild/src/consumer/init/main.c:1549)
> > [    1.904314] ? rest_init (kbuild/src/consumer/init/main.c:1444)
> > [    1.904314] kernel_init (kbuild/src/consumer/init/main.c:1449)
> > [    1.904314] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry_=
64.S:300)
> > [    1.905783] NMI watchdog: Enabled. Permanently consumes one hw-PMU c=
ounter.
> > [    1.906371] smp: Bringing up secondary CPUs ...
> > [    1.907365] x86: Booting SMP configuration:
> > [    1.908316] .... node  #0, CPUs:      #1
> > [    0.513590] masked ExtINT on CPU#1
> > [    1.916583]  #2
> > [    0.513590] masked ExtINT on CPU#2
> > [    1.922146]  #3
> > [    0.513590] masked ExtINT on CPU#3
> > [    1.927696]  #4
> > [    0.513590] masked ExtINT on CPU#4
> > [    1.933377] MDS CPU bug present and SMT on, data leak possible. See =
https://www.kernel.org/doc/html/latest/admin-guide/hw-
> vuln/mds.html for more details.
> > [    1.934387]  #5
> > [    0.513590] masked ExtINT on CPU#5
> > [    1.940689]  #6
> > [    0.513590] masked ExtINT on CPU#6
> > [    1.946342]  #7
> > [    0.513590] masked ExtINT on CPU#7
> > [    1.951788] smp: Brought up 1 node, 8 CPUs
> > [    1.952315] smpboot: Max logical packages: 1
> > [    1.953315] smpboot: Total of 8 processors activated (57463.07 BogoM=
IPS)
> > [    1.958469] node 0 deferred pages initialised in 3ms
> > [    1.963511] devtmpfs: initialized
> > [    1.964346] x86/mm: Memory block size: 128MB
> > [    1.966400] PM: Registering ACPI NVS region [mem 0xd160c000-0xd1612f=
ff] (28672 bytes)
> > [    1.967316] PM: Registering ACPI NVS region [mem 0xda71c000-0xda7fff=
ff] (933888 bytes)
> > [    1.969316] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfff=
fffff, max_idle_ns: 1911260446275000 ns
> > [    1.970317] futex hash table entries: 2048 (order: 5, 131072 bytes, =
linear)
> > [    1.972770] pinctrl core: initialized pinctrl subsystem
> > [    1.973416] NET: Registered protocol family 16
> > [    1.974467] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic al=
locations
> > [    1.981319] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for a=
tomic allocations
> > [    1.982318] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for=
 atomic allocations

--===============6776868809189383140==--

