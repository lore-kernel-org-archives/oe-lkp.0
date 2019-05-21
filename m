Content-Type: multipart/mixed; boundary="===============5064568416784887585=="
MIME-Version: 1.0
From: Alexander Potapenko <glider@google.com>
To: lkp@lists.01.org
Subject: Re: 36b74766f2 ("mm: security: introduce init_on_alloc=1 and .."): general protection fault: 0000 [#1] PREEMPT SMP PTI
Date: Tue, 21 May 2019 15:47:16 +0200
Message-ID: <CAG_fn=XS_ghdtHe1Q2NNTic8Y==TMM4EWo9CX4Rg6OAEOLxUrA@mail.gmail.com>
In-Reply-To: <5ce0aefc.dHAWqicp3F0Qbl7X%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5064568416784887585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2019 at 3:19 AM kernel test robot <lkp@intel.com> wrote:
>
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git kspp/memin=
it/heap-v2
>
> commit 36b74766f295e0898345865a0511a443cf90aa13
> Author:     Alexander Potapenko <glider@google.com>
> AuthorDate: Tue May 14 16:35:34 2019 +0200
> Commit:     Kees Cook <keescook@chromium.org>
> CommitDate: Wed May 15 15:23:43 2019 -0700
>
>     mm: security: introduce init_on_alloc=3D1 and init_on_free=3D1 boot o=
ptions
>
>     The new options are needed to prevent possible information leaks and
>     make control-flow bugs that depend on uninitialized values more
>     deterministic.
>
>     init_on_alloc=3D1 makes the kernel initialize newly allocated pages a=
nd heap
>     objects with zeroes. Initialization is done at allocation time at the
>     places where checks for __GFP_ZERO are performed.
>
>     init_on_free=3D1 makes the kernel initialize freed pages and heap obj=
ects
>     with zeroes upon their deletion. This helps to ensure sensitive data
>     doesn't leak via use-after-free accesses.
>
>     Both init_on_alloc=3D1 and init_on_free=3D1 guarantee that the alloca=
tor
>     returns zeroed memory. The only exception is slab caches with
>     constructors. Those are never zero-initialized to preserve their sema=
ntics.
>
>     For SLOB allocator init_on_free=3D1 also implies init_on_alloc=3D1 be=
havior,
>     i.e. objects are zeroed at both allocation and deallocation time.
>     This is done because SLOB may otherwise return multiple freelist poin=
ters
>     in the allocated object. For SLAB and SLUB enabling either init_on_al=
loc
>     or init_on_free leads to one-time initialization of the object.
>
>     Both init_on_alloc and init_on_free default to zero, but those defaul=
ts
>     can be overridden with CONFIG_INIT_ON_ALLOC_DEFAULT_ON and
>     CONFIG_INIT_ON_FREE_DEFAULT_ON.
>
>     Slowdown for the new features compared to init_on_free=3D0,
>     init_on_alloc=3D0:
>
>     hackbench, init_on_free=3D1:  +7.62% sys time (st.err 0.74%)
>     hackbench, init_on_alloc=3D1: +7.75% sys time (st.err 2.14%)
>
>     Linux build with -j12, init_on_free=3D1:  +8.38% wall time (st.err 0.=
39%)
>     Linux build with -j12, init_on_free=3D1:  +24.42% sys time (st.err 0.=
52%)
>     Linux build with -j12, init_on_alloc=3D1: -0.13% wall time (st.err 0.=
42%)
>     Linux build with -j12, init_on_alloc=3D1: +0.57% sys time (st.err 0.4=
0%)
>
>     The slowdown for init_on_free=3D0, init_on_alloc=3D0 compared to the
>     baseline is within the standard error.
>
>     Signed-off-by: Alexander Potapenko <glider@google.com>
>     To: Andrew Morton <akpm@linux-foundation.org>
>     To: Christoph Lameter <cl@linux.com>
>     To: Kees Cook <keescook@chromium.org>
>     Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>     Cc: James Morris <jmorris@namei.org>
>     Cc: "Serge E. Hallyn" <serge@hallyn.com>
>     Cc: Nick Desaulniers <ndesaulniers@google.com>
>     Cc: Kostya Serebryany <kcc@google.com>
>     Cc: Dmitry Vyukov <dvyukov@google.com>
>     Cc: Sandeep Patil <sspatil@android.com>
>     Cc: Laura Abbott <labbott@redhat.com>
>     Cc: Randy Dunlap <rdunlap@infradead.org>
>     Cc: Jann Horn <jannh@google.com>
>     Cc: Mark Rutland <mark.rutland@arm.com>
>     Cc: linux-mm(a)kvack.org
>     Cc: linux-security-module(a)vger.kernel.org
>     Cc: kernel-hardening(a)lists.openwall.com
>     Signed-off-by: Kees Cook <keescook@chromium.org>
>
> 2bbacd1a92  Merge tag 'kconfig-v5.2' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/masahiroy/linux-kbuild
> 36b74766f2  mm: security: introduce init_on_alloc=3D1 and init_on_free=3D=
1 boot options
> 83e3ae9e99  mm: Introduce SLAB_NO_FREE_INIT and mark excluded caches
> +---------------------------------------------+------------+------------+=
------------+
> |                                             | 2bbacd1a92 | 36b74766f2 |=
 83e3ae9e99 |
> +---------------------------------------------+------------+------------+=
------------+
> | boot_successes                              | 33         | 0          |=
 0          |
> | boot_failures                               | 0          | 15         |=
 11         |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 4          |=
            |
> | Oops:#[##]                                  | 0          | 4          |=
            |
> | RIP:kernel_init_free_pages                  | 0          | 4          |=
            |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 15         |=
 11         |
> | general_protection_fault:#[##]              | 0          | 11         |=
 11         |
> | RIP:clear_page_orig                         | 0          | 11         |=
 11         |
> +---------------------------------------------+------------+------------+=
------------+
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
>
> [    0.088943] Built 1 zonelists, mobility grouping on.  Total pages: 129=
129
> [    0.089917] Kernel command line: root=3D/dev/ram0 hung_task_panic=3D1 =
debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D10=
0 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_w=
atchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor=
_count=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprin=
tk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw link=3D/cephfs/kbu=
ild/run-queue/yocto-vm-yocto/x86_64-randconfig-s3-05171126/linux-devel:deve=
l-hourly-2019051709:36b74766f295e0898345865a0511a443cf90aa13:bisect-linux-3=
6/.vmlinuz-36b74766f295e0898345865a0511a443cf90aa13-20190519080629-7:yocto-=
vm-yocto-107 branch=3Dlinux-devel/devel-hourly-2019051709 BOOT_IMAGE=3D/pkg=
/linux/x86_64-randconfig-s3-05171126/gcc-7/36b74766f295e0898345865a0511a443=
cf90aa13/vmlinuz-5.1.0-10910-g36b7476 drbd.minor_count=3D8 rcuperf.shutdown=
=3D0
> [    0.100683] sysrq: sysrq always enabled.
> [    0.102667] Dentry cache hash table entries: 65536 (order: 7, 524288 b=
ytes)
> [    0.103751] Inode-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
> [    0.124335] general protection fault: 0000 [#1] PREEMPT SMP PTI
> [    0.125142] CPU: 0 PID: 0 Comm: swapper Not tainted 5.1.0-10910-g36b74=
76 #1
> [    0.126049] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    0.127161] RIP: 0010:clear_page_orig+0x12/0x40
> [    0.127763] Code: 90 90 90 90 90 90 90 90 b9 00 02 00 00 31 c0 f3 48 a=
b c3 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00 00 00 00 ff c9 <=
48> 89 07 48 89 47 08 48 89 47 10 48 89 47 18 48 89 47 20 48 89 47
> [    0.130272] RSP: 0000:ffffffff83403dc0 EFLAGS: 00010016
> [    0.130953] RAX: 0000000000000000 RBX: ffff88801f2c4000 RCX: 000000000=
000003f
> [    0.131876] RDX: ffff88801fb85000 RSI: 0000000000000000 RDI: b6daf636c=
b800000
> [    0.132834] RBP: ffffffff83403df0 R08: 0000000000000000 R09: 000000000=
0000000
> [    0.133800] R10: ffffffff83427800 R11: 0000000000000000 R12: 000000000=
0000400
> [    0.134760] R13: 6db6db6db6db6db7 R14: ffff88801f2d2000 R15: 000000000=
0010400
> [    0.135721] FS:  0000000000000000(0000) GS:ffff88801ee00000(0000) knlG=
S:0000000000000000
> [    0.136814] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.137622] CR2: ffff888005401000 CR3: 0000000003420001 CR4: 000000000=
00606b0
> [    0.138598] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [    0.139561] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [    0.140523] Call Trace:
> [    0.140868]  ? kernel_init_free_pages+0xa3/0x170
> [    0.141504]  memblock_free_pages+0x87/0xda
> [    0.142066]  memblock_free_all+0x2b9/0x372
> [    0.142642]  mem_init+0x30/0xc6
> [    0.143078]  start_kernel+0x361/0xc99
> [    0.143591]  x86_64_start_reservations+0x55/0x76
> [    0.144223]  x86_64_start_kernel+0x7e/0xa1
> [    0.144776]  secondary_startup_64+0xa4/0xb0
> [    0.145328] Modules linked in:
> [    0.145759] random: get_random_bytes called from init_oops_id+0x39/0x7=
0 with crng_init=3D0
> [    0.146827] ---[ end trace 25feee6b5690789c ]---
> [    0.147480] RIP: 0010:clear_page_orig+0x12/0x40
Turns out we can't call kernel_init_free_pages() from memblock_free_pages()

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start c6a087131e35cda9ec9cc98e348ebc7136b798f4 e93c9c99a629c61=
837d5a7fc2120cd2b6c70dbdd --
> git bisect  bad b49a6b15d52eb982290433d73e0274a152ef101d  # 04:00  B     =
 0    11   26   0  Merge 'linux-de/upstream/rem_rq_load' into devel-hourly-=
2019051709
> git bisect  bad d0dd933bf0bd0aff98240ee09eb7f3d05b721fff  # 04:11  B     =
 0    11   26   0  Merge 'linux-review/Thomas-Pedersen/mac80211-mesh-fix-RC=
U-warning/20190517-081950' into devel-hourly-2019051709
> git bisect good e5066b7e86afb919312ecdfc1fd897028d1b08fe  # 04:33  G     =
10     0    0   0  Merge 'linux-review/Yannick-Fertr/drm-stm-ltdc-remove-cl=
k_round_rate-comment/20190514-034940' into devel-hourly-2019051709
> git bisect  bad 166c2c2157380ec4423b077f90070db53d43d29a  # 04:58  B     =
 0    11   26   0  Merge 'linux-review/Serge-Semin/usb-cp210x-Add-cp2108-GP=
IOs-support/20190514-193210' into devel-hourly-2019051709
> git bisect good 381f62cd950e5d795a3377400160a9c089b5d9d0  # 05:20  G     =
10     0    0   0  Merge 'khilman-linux-amlogic/v5.2/fixes' into devel-hour=
ly-2019051709
> git bisect  bad c1efdb0b692eebfe39f30758055f5e6453833033  # 05:34  B     =
 0     9   24   0  Merge 'linux-review/George-G-Davis/net-sysctl-cleanup-ne=
t_sysctl_init-error-exit-paths/20190517-035042' into devel-hourly-2019051709
> git bisect  bad 1ccab7297016467f16ee8967e9229bf9a810053b  # 06:04  B     =
 0    10   25   0  Merge 'kees/kspp/meminit/heap-v2' into devel-hourly-2019=
051709
> git bisect good 7085c7ff97531f647adb2a71de3c3fb97d5c6653  # 06:52  G     =
11     0    0   0  Merge 'linux-review/Aneesh-Kumar-K-V/mm-nvdimm-Fix-kerne=
l-crash-on-devm_mremap_pages_release/20190515-010312' into devel-hourly-201=
9051709
> git bisect  bad 96a09f754689f7839134ebc186cc9d0dc0d79a67  # 07:09  B     =
 0     6   21   0  gfp: mm: introduce __GFP_NO_AUTOINIT
> git bisect  bad 708d942c1103d0811d5ca754ab4f256692f44b3a  # 07:32  B     =
 0    11   26   0  lib: introduce test_meminit module
> git bisect  bad 36b74766f295e0898345865a0511a443cf90aa13  # 08:07  B     =
 0     6   21   0  mm: security: introduce init_on_alloc=3D1 and init_on_fr=
ee=3D1 boot options
> # first bad commit: [36b74766f295e0898345865a0511a443cf90aa13] mm: securi=
ty: introduce init_on_alloc=3D1 and init_on_free=3D1 boot options
> git bisect good 2bbacd1a92788ee334c7e92b765ea16ebab68dfe  # 08:30  G     =
32     0    0   0  Merge tag 'kconfig-v5.2' of git://git.kernel.org/pub/scm=
/linux/kernel/git/masahiroy/linux-kbuild
> # extra tests with debug options
> git bisect  bad 36b74766f295e0898345865a0511a443cf90aa13  # 08:43  B     =
 0    11   26   0  mm: security: introduce init_on_alloc=3D1 and init_on_fr=
ee=3D1 boot options
> # extra tests on HEAD of linux-devel/devel-hourly-2019051709
> git bisect  bad c6a087131e35cda9ec9cc98e348ebc7136b798f4  # 08:44  B     =
 0    13   31   0  0day head guard for 'devel-hourly-2019051709'
> # extra tests on tree/branch kees/kspp/meminit/heap-v2
> git bisect  bad 83e3ae9e9987893af618ac396b027ef236efdd92  # 09:17  B     =
 0    11   26   0  mm: Introduce SLAB_NO_FREE_INIT and mark excluded caches
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

--===============5064568416784887585==--

