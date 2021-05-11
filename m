Content-Type: multipart/mixed; boundary="===============0437548807901423316=="
MIME-Version: 1.0
From: Alistair Popple <apopple@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [kernel/resource] 56fd94919b: BUG:KASAN:use-after-free_in__region_intersects
Date: Tue, 11 May 2021 18:28:15 +1000
Message-ID: <1620740641.H8NWFiPkCk@nvdebian>
In-Reply-To: <20210511072158.GF8539@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0437548807901423316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think I see the issue. For some reason when I split the original patch =

series up I inverted the return code for __request_region_locked() but fail=
ed =

to do so in __request_free_mem_region(). Additionally hmm_test doesn't alwa=
ys =

check the return code from dmirror_allocate_chunk() which hides the more =

obvious failure resulting in this one which I didn't see on my local setup.

Will post fixes for both of these problems.

 - Alistair

On Tuesday, 11 May 2021 5:21:58 PM AEST kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 56fd94919b8bfdbe162f78920b4ebc72b4ce2f39 ("kernel/resource: fix =

locking in request_free_mem_region")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: trinity
> version: trinity-x86_64-03f10b67-1_20210507
> with following parameters:
> =

>         number: 99999
>         group: group-01
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m =

16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/
backtrace):
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [  148.514812] BUG: KASAN: use-after-free in __region_intersects (kbuild/
src/consumer/kernel/resource.c:516)
> [  148.515030] Read of size 8 at addr ffff8881238c7258 by task swapper/0/1
> [  148.515030]
> [  148.515030] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.12.0-11529-
g56fd94919b8b #1
> [  148.515030] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S =

1.12.0-1 04/01/2014
> [  148.515030] Call Trace:
> [  148.515030] dump_stack (kbuild/src/consumer/lib/dump_stack.c:122)
> [  148.515030] print_address_description.cold+0x82/0x326
> [  148.515030] ? __region_intersects (kbuild/src/consumer/kernel/resource=
.c:
516)
> [  148.515030] kasan_report.cold (kbuild/src/consumer/mm/kasan/report.c:4=
20 =

kbuild/src/consumer/mm/kasan/report.c:436)
> [  148.515030] ? lock_contended (kbuild/src/consumer/kernel/locking/
lockdep.c:229 kbuild/src/consumer/kernel/locking/lockdep.c:5674 kbuild/src/
consumer/kernel/locking/lockdep.c:5747)
> [  148.515030] ? __region_intersects (kbuild/src/consumer/kernel/resource=
.c:
516)
> [  148.515030] __region_intersects (kbuild/src/consumer/kernel/resource.c:
516)
> [  148.515030] __request_free_mem_region+0x11b/0x300
> [  148.515030] ? test_stackinit_init (kbuild/src/consumer/lib/test_hmm.c:
1114)
> [  148.515030] dmirror_allocate_chunk (kbuild/src/consumer/lib/test_hmm.c:
468)
> [  148.515030] ? __sanitizer_cov_trace_pc (kbuild/src/consumer/kernel/
kcov.c:197)
> [  148.515030] ? kobject_get (kbuild/src/consumer/lib/kobject.c:662)
> [  148.515030] ? __sanitizer_cov_trace_pc (kbuild/src/consumer/kernel/
kcov.c:197)
> [  148.515030] ? test_stackinit_init (kbuild/src/consumer/lib/test_hmm.c:
1114)
> [  148.515030] hmm_dmirror_init (kbuild/src/consumer/lib/test_hmm.c:1123)
> [  148.515030] do_one_initcall (kbuild/src/consumer/init/main.c:1249)
> [  148.515030] ? perf_trace_initcall_level (kbuild/src/consumer/init/main=
.c:
1240)
> [  148.515030] ? rcu_read_lock_sched_held (kbuild/src/consumer/kernel/rcu/
update.c:125)
> [  148.515030] ? rcu_read_lock_bh_held (kbuild/src/consumer/kernel/rcu/
update.c:120)
> [  148.515030] ? __kasan_kmalloc (kbuild/src/consumer/mm/kasan/common.c:4=
75 =

kbuild/src/consumer/mm/kasan/common.c:516)
> [  148.515030] ? write_comp_data (kbuild/src/consumer/kernel/kcov.c:218)
> [  148.515030] ? __sanitizer_cov_trace_pc (kbuild/src/consumer/kernel/
kcov.c:197)
> [  148.515030] kernel_init_freeable (kbuild/src/consumer/init/main.c:1321 =

kbuild/src/consumer/init/main.c:1338 kbuild/src/consumer/init/main.c:1358 =

kbuild/src/consumer/init/main.c:1560)
> [  148.515030] ? console_on_rootfs (kbuild/src/consumer/init/main.c:1526)
> [  148.515030] ? tracer_hardirqs_on (kbuild/src/consumer/kernel/trace/
trace_irqsoff.c:57 kbuild/src/consumer/kernel/trace/trace_irqsoff.c:610)
> [  148.515030] ? mark_held_locks (kbuild/src/consumer/kernel/locking/
lockdep.c:4069)
> [  148.515030] ? rest_init (kbuild/src/consumer/init/main.c:1444)
> [  148.515030] kernel_init (kbuild/src/consumer/init/main.c:1449)
> [  148.515030] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry_64=
.S:
300)
> [  148.515030]
> [  148.515030] Allocated by task 1:
> [  148.515030] kasan_save_stack (kbuild/src/consumer/mm/kasan/common.c:38)
> [  148.515030] __kasan_kmalloc (kbuild/src/consumer/mm/kasan/common.c:46 =

kbuild/src/consumer/mm/kasan/common.c:428 kbuild/src/consumer/mm/kasan/
common.c:507 kbuild/src/consumer/mm/kasan/common.c:516)
> [  148.515030] kmem_cache_alloc_trace (kbuild/src/consumer/mm/slub.c:2941)
> [  148.515030] alloc_resource (kbuild/src/consumer/include/linux/slab.h:5=
56 =

kbuild/src/consumer/include/linux/slab.h:686 kbuild/src/consumer/kernel/
resource.c:178)
> [  148.515030] __request_free_mem_region+0x6a/0x300
> [  148.515030] dmirror_allocate_chunk (kbuild/src/consumer/lib/test_hmm.c:
468)
> [  148.515030] hmm_dmirror_init (kbuild/src/consumer/lib/test_hmm.c:1123)
> [  148.515030] do_one_initcall (kbuild/src/consumer/init/main.c:1249)
> [  148.515030] kernel_init_freeable (kbuild/src/consumer/init/main.c:1321 =

kbuild/src/consumer/init/main.c:1338 kbuild/src/consumer/init/main.c:1358 =

kbuild/src/consumer/init/main.c:1560)
> [  148.515030] kernel_init (kbuild/src/consumer/init/main.c:1449)
> [  148.515030] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry_64=
.S:
300)
> [  148.515030]
> [  148.515030] Freed by task 1:
> [  148.515030] kasan_save_stack (kbuild/src/consumer/mm/kasan/common.c:38)
> [  148.515030] kasan_set_track (kbuild/src/consumer/mm/kasan/common.c:46)
> [  148.515030] kasan_set_free_info (kbuild/src/consumer/mm/kasan/generic.=
c:
359)
> [  148.515030] __kasan_slab_free (kbuild/src/consumer/mm/kasan/common.c:3=
62 =

kbuild/src/consumer/mm/kasan/common.c:368)
> [  148.515030] slab_free_freelist_hook (kbuild/src/consumer/mm/slub.c:160=
6)
> [  148.515030] kfree (kbuild/src/consumer/mm/slub.c:3166 kbuild/src/
consumer/mm/slub.c:4225)
> [  148.515030] free_resource (kbuild/src/consumer/kernel/resource.c:162)
> [  148.515030] __request_free_mem_region+0x161/0x300
> [  148.515030] dmirror_allocate_chunk (kbuild/src/consumer/lib/test_hmm.c:
468)
> [  148.515030] hmm_dmirror_init (kbuild/src/consumer/lib/test_hmm.c:1123)
> [  148.515030] do_one_initcall (kbuild/src/consumer/init/main.c:1249)
> [  148.515030] kernel_init_freeable (kbuild/src/consumer/init/main.c:1321 =

kbuild/src/consumer/init/main.c:1338 kbuild/src/consumer/init/main.c:1358 =

kbuild/src/consumer/init/main.c:1560)
> [  148.515030] kernel_init (kbuild/src/consumer/init/main.c:1449)
> [  148.515030] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry_64=
.S:
300)
> [  148.515030]
> [  148.515030] The buggy address belongs to the object at ffff8881238c7240
> [  148.515030]  which belongs to the cache kmalloc-64 of size 64
> [  148.515030] The buggy address is located 24 bytes inside of
> [  148.515030]  64-byte region [ffff8881238c7240, ffff8881238c7280)
> [  148.515030] The buggy address belongs to the page:
> [  148.515030] page:(____ptrval____) refcount:1 mapcount:0 mapping:
0000000000000000 index:0xffff8881238c6440 pfn:0x1238c6
> [  148.515030] head:(____ptrval____) order:1 compound_mapcount:0
> [  148.515030] flags: 0x17ffffc0010200(slab|head|node=3D0|zone=3D2|
lastcpupid=3D0x1fffff)
> [  148.515030] raw: 0017ffffc0010200 ffff888100040d50 ffff888100040d50 =

ffff88810004ce00
> [  148.515030] raw: ffff8881238c6440 000000000010000f 00000001ffffffff =

0000000000000000
> [  148.515030] page dumped because: kasan: bad access detected
> [  148.515030]
> [  148.515030] Memory state around the buggy address:
> [  148.515030]  ffff8881238c7100: fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc =

fc fc
> [  148.515030]  ffff8881238c7180: fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc =

fc fc
> [  148.515030] >ffff8881238c7200: fc fc fc fc fc fc fc fc fa fb fb fb fb =
fb =

fb fb
> [  148.515030]                                                     ^
> [  148.515030]  ffff8881238c7280: fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc =

fc fc
> [  148.515030]  ffff8881238c7300: fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc =

fc fc
> [  148.515030] =

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  148.515030] Disabling lock debugging due to kernel taint
> [  148.690200] HMM test module loaded. This is only for testing HMM.
> [  148.691899] test_free_pages: Testing with GFP_KERNEL
> =

> Kboot worker: lkp-worker29
> Elapsed time: 180
> =

> kvm=3D(
> qemu-system-x86_64
> -enable-kvm
> -cpu SandyBridge
> -kernel $kernel
> -initrd initrd-vm-snb-123.cgz
> -m 16384
> -smp 2
> -device e1000,netdev=3Dnet0
> =

> =

> To reproduce:
> =

>         # build kernel
>         cd linux
>         cp config-5.12.0-11529-g56fd94919b8b .config
>         make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare =

modules_prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =

this email
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology =

Center
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel =

Corporation
> =

> Thanks,
> Oliver Sang
> =





--===============0437548807901423316==--

