Content-Type: multipart/mixed; boundary="===============8808899327156356762=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: 36b74766f2 ("mm: security: introduce init_on_alloc=1 and .."): general protection fault: 0000 [#1] PREEMPT SMP PTI
Date: Tue, 21 May 2019 13:21:55 -0700
Message-ID: <201905211320.12B71F8F6C@keescook>
In-Reply-To: <CAG_fn=XS_ghdtHe1Q2NNTic8Y==TMM4EWo9CX4Rg6OAEOLxUrA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8808899327156356762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 03:47:16PM +0200, Alexander Potapenko wrote:
> On Sun, May 19, 2019 at 3:19 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Greetings,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git kspp/mem=
init/heap-v2
> >
> > commit 36b74766f295e0898345865a0511a443cf90aa13
> > Author:     Alexander Potapenko <glider@google.com>
> > AuthorDate: Tue May 14 16:35:34 2019 +0200
> > Commit:     Kees Cook <keescook@chromium.org>
> > CommitDate: Wed May 15 15:23:43 2019 -0700
> >
> >     mm: security: introduce init_on_alloc=3D1 and init_on_free=3D1 boot=
 options
> >
> >     The new options are needed to prevent possible information leaks and
> >     make control-flow bugs that depend on uninitialized values more
> >     deterministic.
> >
> >     init_on_alloc=3D1 makes the kernel initialize newly allocated pages=
 and heap
> >     objects with zeroes. Initialization is done at allocation time at t=
he
> >     places where checks for __GFP_ZERO are performed.
> >
> >     init_on_free=3D1 makes the kernel initialize freed pages and heap o=
bjects
> >     with zeroes upon their deletion. This helps to ensure sensitive data
> >     doesn't leak via use-after-free accesses.
> >
> >     Both init_on_alloc=3D1 and init_on_free=3D1 guarantee that the allo=
cator
> >     returns zeroed memory. The only exception is slab caches with
> >     constructors. Those are never zero-initialized to preserve their se=
mantics.
> >
> >     For SLOB allocator init_on_free=3D1 also implies init_on_alloc=3D1 =
behavior,
> >     i.e. objects are zeroed at both allocation and deallocation time.
> >     This is done because SLOB may otherwise return multiple freelist po=
inters
> >     in the allocated object. For SLAB and SLUB enabling either init_on_=
alloc
> >     or init_on_free leads to one-time initialization of the object.
> >
> >     Both init_on_alloc and init_on_free default to zero, but those defa=
ults
> >     can be overridden with CONFIG_INIT_ON_ALLOC_DEFAULT_ON and
> >     CONFIG_INIT_ON_FREE_DEFAULT_ON.
> >
> >     Slowdown for the new features compared to init_on_free=3D0,
> >     init_on_alloc=3D0:
> >
> >     hackbench, init_on_free=3D1:  +7.62% sys time (st.err 0.74%)
> >     hackbench, init_on_alloc=3D1: +7.75% sys time (st.err 2.14%)
> >
> >     Linux build with -j12, init_on_free=3D1:  +8.38% wall time (st.err =
0.39%)
> >     Linux build with -j12, init_on_free=3D1:  +24.42% sys time (st.err =
0.52%)
> >     Linux build with -j12, init_on_alloc=3D1: -0.13% wall time (st.err =
0.42%)
> >     Linux build with -j12, init_on_alloc=3D1: +0.57% sys time (st.err 0=
.40%)
> >
> >     The slowdown for init_on_free=3D0, init_on_alloc=3D0 compared to the
> >     baseline is within the standard error.
> >
> >     Signed-off-by: Alexander Potapenko <glider@google.com>
> >     To: Andrew Morton <akpm@linux-foundation.org>
> >     To: Christoph Lameter <cl@linux.com>
> >     To: Kees Cook <keescook@chromium.org>
> >     Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> >     Cc: James Morris <jmorris@namei.org>
> >     Cc: "Serge E. Hallyn" <serge@hallyn.com>
> >     Cc: Nick Desaulniers <ndesaulniers@google.com>
> >     Cc: Kostya Serebryany <kcc@google.com>
> >     Cc: Dmitry Vyukov <dvyukov@google.com>
> >     Cc: Sandeep Patil <sspatil@android.com>
> >     Cc: Laura Abbott <labbott@redhat.com>
> >     Cc: Randy Dunlap <rdunlap@infradead.org>
> >     Cc: Jann Horn <jannh@google.com>
> >     Cc: Mark Rutland <mark.rutland@arm.com>
> >     Cc: linux-mm(a)kvack.org
> >     Cc: linux-security-module(a)vger.kernel.org
> >     Cc: kernel-hardening(a)lists.openwall.com
> >     Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > 2bbacd1a92  Merge tag 'kconfig-v5.2' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/masahiroy/linux-kbuild
> > 36b74766f2  mm: security: introduce init_on_alloc=3D1 and init_on_free=
=3D1 boot options
> > 83e3ae9e99  mm: Introduce SLAB_NO_FREE_INIT and mark excluded caches
> > +---------------------------------------------+------------+-----------=
-+------------+
> > |                                             | 2bbacd1a92 | 36b74766f2=
 | 83e3ae9e99 |
> > +---------------------------------------------+------------+-----------=
-+------------+
> > | boot_successes                              | 33         | 0         =
 | 0          |
> > | boot_failures                               | 0          | 15        =
 | 11         |
> > | BUG:kernel_NULL_pointer_dereference,address | 0          | 4         =
 |            |
> > | Oops:#[##]                                  | 0          | 4         =
 |            |
> > | RIP:kernel_init_free_pages                  | 0          | 4         =
 |            |
> > | Kernel_panic-not_syncing:Fatal_exception    | 0          | 15        =
 | 11         |
> > | general_protection_fault:#[##]              | 0          | 11        =
 | 11         |
> > | RIP:clear_page_orig                         | 0          | 11        =
 | 11         |
> > +---------------------------------------------+------------+-----------=
-+------------+
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > [    0.088943] Built 1 zonelists, mobility grouping on.  Total pages: 1=
29129
> > [    0.089917] Kernel command line: root=3D/dev/ram0 hung_task_panic=3D=
1 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D=
100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi=
_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.min=
or_count=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlypr=
intk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw link=3D/cephfs/k=
build/run-queue/yocto-vm-yocto/x86_64-randconfig-s3-05171126/linux-devel:de=
vel-hourly-2019051709:36b74766f295e0898345865a0511a443cf90aa13:bisect-linux=
-36/.vmlinuz-36b74766f295e0898345865a0511a443cf90aa13-20190519080629-7:yoct=
o-vm-yocto-107 branch=3Dlinux-devel/devel-hourly-2019051709 BOOT_IMAGE=3D/p=
kg/linux/x86_64-randconfig-s3-05171126/gcc-7/36b74766f295e0898345865a0511a4=
43cf90aa13/vmlinuz-5.1.0-10910-g36b7476 drbd.minor_count=3D8 rcuperf.shutdo=
wn=3D0
> > [    0.100683] sysrq: sysrq always enabled.
> > [    0.102667] Dentry cache hash table entries: 65536 (order: 7, 524288=
 bytes)
> > [    0.103751] Inode-cache hash table entries: 32768 (order: 6, 262144 =
bytes)
> > [    0.124335] general protection fault: 0000 [#1] PREEMPT SMP PTI
> > [    0.125142] CPU: 0 PID: 0 Comm: swapper Not tainted 5.1.0-10910-g36b=
7476 #1
> > [    0.126049] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.10.2-1 04/01/2014
> > [    0.127161] RIP: 0010:clear_page_orig+0x12/0x40
> > [    0.127763] Code: 90 90 90 90 90 90 90 90 b9 00 02 00 00 31 c0 f3 48=
 ab c3 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00 00 00 00 ff c9=
 <48> 89 07 48 89 47 08 48 89 47 10 48 89 47 18 48 89 47 20 48 89 47
> > [    0.130272] RSP: 0000:ffffffff83403dc0 EFLAGS: 00010016
> > [    0.130953] RAX: 0000000000000000 RBX: ffff88801f2c4000 RCX: 0000000=
00000003f
> > [    0.131876] RDX: ffff88801fb85000 RSI: 0000000000000000 RDI: b6daf63=
6cb800000
> > [    0.132834] RBP: ffffffff83403df0 R08: 0000000000000000 R09: 0000000=
000000000
> > [    0.133800] R10: ffffffff83427800 R11: 0000000000000000 R12: 0000000=
000000400
> > [    0.134760] R13: 6db6db6db6db6db7 R14: ffff88801f2d2000 R15: 0000000=
000010400
> > [    0.135721] FS:  0000000000000000(0000) GS:ffff88801ee00000(0000) kn=
lGS:0000000000000000
> > [    0.136814] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    0.137622] CR2: ffff888005401000 CR3: 0000000003420001 CR4: 0000000=
0000606b0
> > [    0.138598] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> > [    0.139561] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000=
000000400
> > [    0.140523] Call Trace:
> > [    0.140868]  ? kernel_init_free_pages+0xa3/0x170
> > [    0.141504]  memblock_free_pages+0x87/0xda
> > [    0.142066]  memblock_free_all+0x2b9/0x372
> > [    0.142642]  mem_init+0x30/0xc6
> > [    0.143078]  start_kernel+0x361/0xc99
> > [    0.143591]  x86_64_start_reservations+0x55/0x76
> > [    0.144223]  x86_64_start_kernel+0x7e/0xa1
> > [    0.144776]  secondary_startup_64+0xa4/0xb0
> > [    0.145328] Modules linked in:
> > [    0.145759] random: get_random_bytes called from init_oops_id+0x39/0=
x70 with crng_init=3D0
> > [    0.146827] ---[ end trace 25feee6b5690789c ]---
> > [    0.147480] RIP: 0010:clear_page_orig+0x12/0x40
> Turns out we can't call kernel_init_free_pages() from memblock_free_pages=
()

That's just a "old frame" (the leading "?" means that it found a frame,
but it's not actually part of a real frame, IIUC). i.e. it was just left
over on the stack. memblock_free_pages() called clear_page_orig() and
crashed -- that's the place to be looking. It's not clear to me yet what
could cause this...

-- =

Kees Cook

--===============8808899327156356762==--

