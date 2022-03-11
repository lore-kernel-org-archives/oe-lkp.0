Content-Type: multipart/mixed; boundary="===============7903124997776297416=="
MIME-Version: 1.0
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] ae107fa919: BUG:unable_to_handle_page_fault_for_address
Date: Fri, 11 Mar 2022 16:46:00 +0000
Message-ID: <20220311164600.GA1234616@odroid>
In-Reply-To: <667d594b-bdad-4082-09d5-7b0587af2ae3@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7903124997776297416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2022 at 04:36:47PM +0100, Vlastimil Babka wrote:
> On 3/11/22 15:54, Hyeonggon Yoo wrote:
> > On Wed, Mar 09, 2022 at 10:15:31AM +0800, kernel test robot wrote:
> >> =

> >> =

> >> Greeting,
> >> =

> >> FYI, we noticed the following commit (built with gcc-9):
> >> =

> >> commit: ae107fa91914f098cd54ab77e68f83dd6259e901 ("mm/slub: use stackd=
epot to save stack trace in objects")
> >> https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-sta=
ckdepot-v3r0
> >> =

> >> in testcase: boot
> >> =

> >> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp =
2 -m 16G
> >> =

> >> caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
> >>
> > =

> > [+Cc Vlastimil and linux-mm]
> =

> Thanks.
> lkp folks: it would be nice if I was CC'd automatically on this, it's a
> commit from my git tree and with by s-o-b :)
> =

> > I _strongly_ suspect that this is because we don't initialize
> > stack_table[i] =3D NULL when we allocate it from memblock_alloc().
> =

> No, Mike (CC'd) suggested to drop the array init cycle, because
> memblock_alloc would zero the area anyway.

Ah, you are right. My mistake.

> There has to be a different
> reason. Wondering if dmesg contains the stack depot initialization message
> at all...

I think I found the reason.
This is because of CONFIG_SLUB_DEBUG_ON.
It can enable debugging without passing boot parameter.

if CONFIG_SLUB_DEBUG_ON=3Dy && slub_debug is not passed, we do not call
stack_depot_want_early_init(), but the debugging flags are set.

And we only call stack_depot_init() later in kmem_cache_create_usercopy().

so it crashed while creating boot cache.

> =

> > It was done before this series, not done after this series.
> > Why does it still work on my test... weird.
> > =

> > I'm trying to reproduce it.
> > =

> >> =

> >> +---------------------------------------------+------------+----------=
--+
> >> |                                             | 2b303a7249 | ae107fa91=
9 |
> >> +---------------------------------------------+------------+----------=
--+
> >> | boot_successes                              | 10         | 0        =
  |
> >> | boot_failures                               | 0          | 10       =
  |
> >> | BUG:unable_to_handle_page_fault_for_address | 0          | 10       =
  |
> >> | Oops:#[##]                                  | 0          | 10       =
  |
> >> | EIP:__stack_depot_save                      | 0          | 10       =
  |
> >> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 10       =
  |
> >> +---------------------------------------------+------------+----------=
--+
> >> =

> >> =

> >> If you fix the issue, kindly add following tag
> >> Reported-by: kernel test robot <oliver.sang@intel.com>
> >> =

> >> =

> >> [    7.940529][    T0] BUG: unable to handle page fault for address: 0=
03b2aa0
> >> [    7.941169][    T0] #PF: supervisor read access in kernel mode
> >> [    7.941688][    T0] #PF: error_code(0x0000) - not-present page
> >> [    7.942204][    T0] *pdpt =3D 0000000000000000 *pde =3D f000ff53f00=
0e2c3
> >> [    7.943638][    T0] Oops: 0000 [#1] PTI
> >> [    7.943935][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.17.0-=
rc1-00003-gae107fa91914 #1 5f73b26000dc0e5442a0589d1a3fdb9ee3bc2185
> >> [    7.944854][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX,=
 1996), BIOS 1.12.0-1 04/01/2014
> >> [ 7.945567][ T0] EIP: __stack_depot_save (lib/stackdepot.c:396) =

> >> [ 7.946736][ T0] Code: 0f 84 e0 00 00 00 83 fb 03 0f 84 d2 00 00 00 4b=
 90 0f 84 d4 00 00 00 a1 c0 a2 13 c3 89 f2 81 e2 ff ff 0f 00 8d 04 90 89 45=
 dc <8b> 18 85 db 0f 84 fd 00 00 00 8b 55 ec eb 12 8d b4 26 00 00 00 00
> >> All code
> >> =3D=3D=3D=3D=3D=3D=3D=3D
> >>    0:	0f 84 e0 00 00 00    	je     0xe6
> >>    6:	83 fb 03             	cmp    $0x3,%ebx
> >>    9:	0f 84 d2 00 00 00    	je     0xe1
> >>    f:	4b 90                	rex.WXB xchg %rax,%r8
> >>   11:	0f 84 d4 00 00 00    	je     0xeb
> >>   17:	a1 c0 a2 13 c3 89 f2 	movabs 0xe281f289c313a2c0,%eax
> >>   1e:	81 e2 =

> >>   20:	ff                   	(bad)  =

> >>   21:	ff 0f                	decl   (%rdi)
> >>   23:*	00 8d 04 90 89 45    	add    %cl,0x45899004(%rbp)		<-- trapping=
 instruction
> >>   29:	dc 8b 18 85 db 0f    	fmull  0xfdb8518(%rbx)
> >>   2f:	84 fd                	test   %bh,%ch
> >>   31:	00 00                	add    %al,(%rax)
> >>   33:	00 8b 55 ec eb 12    	add    %cl,0x12ebec55(%rbx)
> >>   39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
> >> =

> >> Code starting with the faulting instruction
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>    0:	8b 18                	mov    (%rax),%ebx
> >>    2:	85 db                	test   %ebx,%ebx
> >>    4:	0f 84 fd 00 00 00    	je     0x107
> >>    a:	8b 55 ec             	mov    -0x14(%rbp),%edx
> >>    d:	eb 12                	jmp    0x21
> >>    f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
> >> [    7.948207][    T0] EAX: 003b2aa0 EBX: c294c1f7 ECX: dccd1bb1 EDX: =
000ecaa8
> >> [    7.948774][    T0] ESI: 634ecaa8 EDI: c10001d1 EBP: c2449ddc ESP: =
c2449dac
> >> [    7.949279][    T0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EF=
LAGS: 00210002
> >> [    7.949823][    T0] CR0: 80050033 CR2: 003b2aa0 CR3: 029de000 CR4: =
000406b0
> >> [    7.950328][    T0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: =
00000000
> >> [    7.950833][    T0] DR6: fffe0ff0 DR7: 00000400
> >> [    7.951161][    T0] Call Trace:
> >> [ 7.951389][ T0] stack_depot_save (lib/stackdepot.c:476) =

> >> [ 7.951719][ T0] set_track (mm/slub.c:742) =

> >> [ 7.952006][ T0] ? __slab_alloc+0x17/0x30 =

> >> [ 7.952459][ T0] ? kmem_cache_alloc (mm/slub.c:3195 mm/slub.c:3237 mm/=
slub.c:3242) =

> >> [ 7.952814][ T0] ? __kmem_cache_create (mm/slub.c:3991 mm/slub.c:4231 =
mm/slub.c:4900) =

> >> [ 7.953180][ T0] ? create_boot_cache (mm/slab_common.c:656) =

> >> [ 7.953532][ T0] ? kmem_cache_init (mm/slub.c:4847) =

> >> [ 7.953869][ T0] ? start_kernel (init/main.c:845 init/main.c:985) =

> >> [ 7.954197][ T0] ? i386_start_kernel (arch/x86/kernel/head32.c:57) =

> >> [ 7.954545][ T0] ? startup_32_smp (arch/x86/kernel/head_32.S:328) =

> >> [ 7.954889][ T0] alloc_debug_processing (mm/slub.c:1315) =

> >> [ 7.955260][ T0] ? __kmem_cache_create (mm/slub.c:3991 mm/slub.c:4231 =
mm/slub.c:4900) =

> >> [ 7.955625][ T0] ? __kmem_cache_create (mm/slub.c:3991 mm/slub.c:4231 =
mm/slub.c:4900) =

> >> [ 7.955988][ T0] ___slab_alloc+0x838/0xc60 =

> >> [ 7.956404][ T0] ? __kmem_cache_create (mm/slub.c:3991 mm/slub.c:4231 =
mm/slub.c:4900) =

> >> [ 7.956771][ T0] ? __mutex_unlock_slowpath (arch/x86/include/asm/atomi=
c.h:29 include/linux/atomic/atomic-long.h:523 include/linux/atomic/atomic-i=
nstrumented.h:1266 kernel/locking/mutex.c:902) =

> >> [ 7.957162][ T0] ? __kmem_cache_create (mm/slub.c:3991 mm/slub.c:4231 =
mm/slub.c:4900) =

> >> [ 7.957535][ T0] ? rcu_read_lock_sched_held (kernel/rcu/update.c:104 k=
ernel/rcu/update.c:123) =

> >> [ 7.957970][ T0] ? pcpu_alloc (mm/percpu.c:1917) =

> >> [ 7.958291][ T0] __slab_alloc+0x17/0x30 =

> >> [ 7.958716][ T0] kmem_cache_alloc (mm/slub.c:3195 mm/slub.c:3237 mm/sl=
ub.c:3242) =

> >> [ 7.959060][ T0] ? calculate_sizes+0x98/0x4b0 =

> >> [ 7.959477][ T0] ? __kmem_cache_create (mm/slub.c:3991 mm/slub.c:4231 =
mm/slub.c:4900) =

> >> [ 7.959880][ T0] __kmem_cache_create (mm/slub.c:3991 mm/slub.c:4231 mm=
/slub.c:4900) =

> >> [ 7.960283][ T0] ? __kmem_cache_create (mm/slub.c:4905) =

> >> [ 7.960699][ T0] create_boot_cache (mm/slab_common.c:656) =

> >> [ 7.961081][ T0] kmem_cache_init (mm/slub.c:4847) =

> >> [ 7.961413][ T0] start_kernel (init/main.c:845 init/main.c:985) =

> >> [ 7.961727][ T0] ? early_idt_handler_common (arch/x86/kernel/head_32.S=
:417) =

> >> [ 7.962115][ T0] i386_start_kernel (arch/x86/kernel/head32.c:57) =

> >> [ 7.962463][ T0] startup_32_smp (arch/x86/kernel/head_32.S:328) =

> >> [    7.962790][    T0] Modules linked in:
> >> [    7.963063][    T0] CR2: 00000000003b2aa0
> >> [    7.964125][    T0] ---[ end trace 0000000000000000 ]---
> >> [ 7.964536][ T0] EIP: __stack_depot_save (lib/stackdepot.c:396) =

> >> [ 7.964917][ T0] Code: 0f 84 e0 00 00 00 83 fb 03 0f 84 d2 00 00 00 4b=
 90 0f 84 d4 00 00 00 a1 c0 a2 13 c3 89 f2 81 e2 ff ff 0f 00 8d 04 90 89 45=
 dc <8b> 18 85 db 0f 84 fd 00 00 00 8b 55 ec eb 12 8d b4 26 00 00 00 00
> >> All code
> >> =3D=3D=3D=3D=3D=3D=3D=3D
> >>    0:	0f 84 e0 00 00 00    	je     0xe6
> >>    6:	83 fb 03             	cmp    $0x3,%ebx
> >>    9:	0f 84 d2 00 00 00    	je     0xe1
> >>    f:	4b 90                	rex.WXB xchg %rax,%r8
> >>   11:	0f 84 d4 00 00 00    	je     0xeb
> >>   17:	a1 c0 a2 13 c3 89 f2 	movabs 0xe281f289c313a2c0,%eax
> >>   1e:	81 e2 =

> >>   20:	ff                   	(bad)  =

> >>   21:	ff 0f                	decl   (%rdi)
> >>   23:*	00 8d 04 90 89 45    	add    %cl,0x45899004(%rbp)		<-- trapping=
 instruction
> >>   29:	dc 8b 18 85 db 0f    	fmull  0xfdb8518(%rbx)
> >>   2f:	84 fd                	test   %bh,%ch
> >>   31:	00 00                	add    %al,(%rax)
> >>   33:	00 8b 55 ec eb 12    	add    %cl,0x12ebec55(%rbx)
> >>   39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
> >> =

> >> Code starting with the faulting instruction
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>    0:	8b 18                	mov    (%rax),%ebx
> >>    2:	85 db                	test   %ebx,%ebx
> >>    4:	0f 84 fd 00 00 00    	je     0x107
> >>    a:	8b 55 ec             	mov    -0x14(%rbp),%edx
> >>    d:	eb 12                	jmp    0x21
> >>    f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
> >> =

> >> =

> >> To reproduce:
> >> =

> >>         # build kernel
> >> 	cd linux
> >> 	cp config-5.17.0-rc1-00003-gae107fa91914 .config
> >> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modul=
es_prepare bzImage modules
> >> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-in=
stall-dir> modules_install
> >> 	cd <mod-install-dir>
> >> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> >> =

> >> =

> >>         git clone https://github.com/intel/lkp-tests.git
> >>         cd lkp-tests
> >>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-scri=
pt is attached in this email
> >> =

> >>         # if come across any failure that blocks the test,
> >>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> >> =

> >> =

> >> =

> >> ---
> >> 0DAY/LKP+ Test Infrastructure                   Open Source Technology=
 Center
> >> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Co=
rporation
> >> =

> >> Thanks,
> >> Oliver Sang
> >> =

> > =

> >> #
> >> # Automatically generated file; DO NOT EDIT.
> >> # Linux/i386 5.17.0-rc1 Kernel Configuration
> >> #
> >> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> >> CONFIG_CC_IS_GCC=3Dy
> >> CONFIG_GCC_VERSION=3D90300
> >> CONFIG_CLANG_VERSION=3D0
> >> CONFIG_AS_IS_GNU=3Dy
> >> CONFIG_AS_VERSION=3D23502
> >> CONFIG_LD_IS_BFD=3Dy
> >> CONFIG_LD_VERSION=3D23502
> >> CONFIG_LLD_VERSION=3D0
> >> CONFIG_CC_CAN_LINK=3Dy
> >> CONFIG_CC_CAN_LINK_STATIC=3Dy
> >> CONFIG_CC_HAS_ASM_GOTO=3Dy
> >> CONFIG_CC_HAS_ASM_INLINE=3Dy
> >> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
> >> CONFIG_IRQ_WORK=3Dy
> >> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> >> CONFIG_THREAD_INFO_IN_TASK=3Dy
> >> =

> >> #
> >> # General setup
> >> #
> >> CONFIG_BROKEN_ON_SMP=3Dy
> >> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> >> # CONFIG_COMPILE_TEST is not set
> >> # CONFIG_WERROR is not set
> >> CONFIG_LOCALVERSION=3D""
> >> CONFIG_LOCALVERSION_AUTO=3Dy
> >> CONFIG_BUILD_SALT=3D""
> >> CONFIG_HAVE_KERNEL_GZIP=3Dy
> >> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> >> CONFIG_HAVE_KERNEL_LZMA=3Dy
> >> CONFIG_HAVE_KERNEL_XZ=3Dy
> >> CONFIG_HAVE_KERNEL_LZO=3Dy
> >> CONFIG_HAVE_KERNEL_LZ4=3Dy
> >> CONFIG_HAVE_KERNEL_ZSTD=3Dy
> >> CONFIG_KERNEL_GZIP=3Dy
> >> # CONFIG_KERNEL_BZIP2 is not set
> >> # CONFIG_KERNEL_LZMA is not set
> >> # CONFIG_KERNEL_XZ is not set
> >> # CONFIG_KERNEL_LZO is not set
> >> # CONFIG_KERNEL_LZ4 is not set
> >> # CONFIG_KERNEL_ZSTD is not set
> >> CONFIG_DEFAULT_INIT=3D""
> >> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> >> CONFIG_SWAP=3Dy
> >> CONFIG_SYSVIPC=3Dy
> >> CONFIG_SYSVIPC_SYSCTL=3Dy
> >> # CONFIG_POSIX_MQUEUE is not set
> >> # CONFIG_WATCH_QUEUE is not set
> >> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> >> # CONFIG_USELIB is not set
> >> # CONFIG_AUDIT is not set
> >> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> >> =

> >> #
> >> # IRQ subsystem
> >> #
> >> CONFIG_GENERIC_IRQ_PROBE=3Dy
> >> CONFIG_GENERIC_IRQ_SHOW=3Dy
> >> CONFIG_HARDIRQS_SW_RESEND=3Dy
> >> CONFIG_GENERIC_IRQ_CHIP=3Dy
> >> CONFIG_IRQ_DOMAIN=3Dy
> >> CONFIG_IRQ_SIM=3Dy
> >> CONFIG_IRQ_MSI_IOMMU=3Dy
> >> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> >> CONFIG_IRQ_FORCED_THREADING=3Dy
> >> CONFIG_SPARSE_IRQ=3Dy
> >> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> >> # end of IRQ subsystem
> >> =

> >> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> >> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> >> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> >> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> >> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> >> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> >> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> >> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> >> CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> >> =

> >> #
> >> # Timers subsystem
> >> #
> >> CONFIG_TICK_ONESHOT=3Dy
> >> CONFIG_HZ_PERIODIC=3Dy
> >> # CONFIG_NO_HZ_IDLE is not set
> >> # CONFIG_NO_HZ is not set
> >> CONFIG_HIGH_RES_TIMERS=3Dy
> >> # end of Timers subsystem
> >> =

> >> CONFIG_BPF=3Dy
> >> CONFIG_HAVE_EBPF_JIT=3Dy
> >> =

> >> #
> >> # BPF subsystem
> >> #
> >> # CONFIG_BPF_SYSCALL is not set
> >> # CONFIG_BPF_JIT is not set
> >> # end of BPF subsystem
> >> =

> >> CONFIG_PREEMPT_VOLUNTARY_BUILD=3Dy
> >> # CONFIG_PREEMPT_NONE is not set
> >> CONFIG_PREEMPT_VOLUNTARY=3Dy
> >> # CONFIG_PREEMPT is not set
> >> CONFIG_PREEMPT_COUNT=3Dy
> >> # CONFIG_PREEMPT_DYNAMIC is not set
> >> =

> >> #
> >> # CPU/Task time and stats accounting
> >> #
> >> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> >> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> >> # CONFIG_BSD_PROCESS_ACCT is not set
> >> # CONFIG_TASKSTATS is not set
> >> CONFIG_PSI=3Dy
> >> CONFIG_PSI_DEFAULT_DISABLED=3Dy
> >> # end of CPU/Task time and stats accounting
> >> =

> >> #
> >> # RCU Subsystem
> >> #
> >> CONFIG_TINY_RCU=3Dy
> >> # CONFIG_RCU_EXPERT is not set
> >> CONFIG_SRCU=3Dy
> >> CONFIG_TINY_SRCU=3Dy
> >> CONFIG_TASKS_RCU_GENERIC=3Dy
> >> CONFIG_TASKS_RCU=3Dy
> >> CONFIG_TASKS_RUDE_RCU=3Dy
> >> CONFIG_TASKS_TRACE_RCU=3Dy
> >> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> >> # end of RCU Subsystem
> >> =

> >> CONFIG_IKCONFIG=3Dy
> >> CONFIG_IKCONFIG_PROC=3Dy
> >> CONFIG_IKHEADERS=3Dy
> >> CONFIG_LOG_BUF_SHIFT=3D20
> >> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> >> CONFIG_PRINTK_INDEX=3Dy
> >> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> >> =

> >> #
> >> # Scheduler features
> >> #
> >> # end of Scheduler features
> >> =

> >> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> >> CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
> >> CONFIG_CGROUPS=3Dy
> >> CONFIG_PAGE_COUNTER=3Dy
> >> CONFIG_MEMCG=3Dy
> >> CONFIG_MEMCG_SWAP=3Dy
> >> CONFIG_MEMCG_KMEM=3Dy
> >> CONFIG_BLK_CGROUP=3Dy
> >> CONFIG_CGROUP_WRITEBACK=3Dy
> >> CONFIG_CGROUP_SCHED=3Dy
> >> CONFIG_FAIR_GROUP_SCHED=3Dy
> >> CONFIG_CFS_BANDWIDTH=3Dy
> >> # CONFIG_RT_GROUP_SCHED is not set
> >> # CONFIG_CGROUP_PIDS is not set
> >> CONFIG_CGROUP_RDMA=3Dy
> >> # CONFIG_CGROUP_FREEZER is not set
> >> CONFIG_CGROUP_DEVICE=3Dy
> >> CONFIG_CGROUP_CPUACCT=3Dy
> >> CONFIG_CGROUP_PERF=3Dy
> >> CONFIG_CGROUP_MISC=3Dy
> >> CONFIG_CGROUP_DEBUG=3Dy
> >> CONFIG_NAMESPACES=3Dy
> >> CONFIG_UTS_NS=3Dy
> >> CONFIG_TIME_NS=3Dy
> >> # CONFIG_IPC_NS is not set
> >> CONFIG_USER_NS=3Dy
> >> CONFIG_PID_NS=3Dy
> >> CONFIG_NET_NS=3Dy
> >> CONFIG_CHECKPOINT_RESTORE=3Dy
> >> CONFIG_SCHED_AUTOGROUP=3Dy
> >> # CONFIG_SYSFS_DEPRECATED is not set
> >> CONFIG_RELAY=3Dy
> >> CONFIG_BLK_DEV_INITRD=3Dy
> >> CONFIG_INITRAMFS_SOURCE=3D""
> >> CONFIG_RD_GZIP=3Dy
> >> CONFIG_RD_BZIP2=3Dy
> >> CONFIG_RD_LZMA=3Dy
> >> # CONFIG_RD_XZ is not set
> >> CONFIG_RD_LZO=3Dy
> >> CONFIG_RD_LZ4=3Dy
> >> CONFIG_RD_ZSTD=3Dy
> >> CONFIG_BOOT_CONFIG=3Dy
> >> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> >> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> >> CONFIG_LD_ORPHAN_WARN=3Dy
> >> CONFIG_SYSCTL=3Dy
> >> CONFIG_HAVE_UID16=3Dy
> >> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> >> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> >> # CONFIG_EXPERT is not set
> >> CONFIG_UID16=3Dy
> >> CONFIG_MULTIUSER=3Dy
> >> CONFIG_SGETMASK_SYSCALL=3Dy
> >> CONFIG_SYSFS_SYSCALL=3Dy
> >> CONFIG_FHANDLE=3Dy
> >> CONFIG_POSIX_TIMERS=3Dy
> >> CONFIG_PRINTK=3Dy
> >> CONFIG_BUG=3Dy
> >> CONFIG_ELF_CORE=3Dy
> >> CONFIG_PCSPKR_PLATFORM=3Dy
> >> CONFIG_BASE_FULL=3Dy
> >> CONFIG_FUTEX=3Dy
> >> CONFIG_FUTEX_PI=3Dy
> >> CONFIG_EPOLL=3Dy
> >> CONFIG_SIGNALFD=3Dy
> >> CONFIG_TIMERFD=3Dy
> >> CONFIG_EVENTFD=3Dy
> >> CONFIG_SHMEM=3Dy
> >> CONFIG_AIO=3Dy
> >> CONFIG_IO_URING=3Dy
> >> CONFIG_ADVISE_SYSCALLS=3Dy
> >> CONFIG_MEMBARRIER=3Dy
> >> CONFIG_KALLSYMS=3Dy
> >> CONFIG_KALLSYMS_ALL=3Dy
> >> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> >> CONFIG_USERFAULTFD=3Dy
> >> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> >> CONFIG_KCMP=3Dy
> >> CONFIG_RSEQ=3Dy
> >> # CONFIG_EMBEDDED is not set
> >> CONFIG_HAVE_PERF_EVENTS=3Dy
> >> CONFIG_PERF_USE_VMALLOC=3Dy
> >> =

> >> #
> >> # Kernel Performance Events And Counters
> >> #
> >> CONFIG_PERF_EVENTS=3Dy
> >> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> >> # end of Kernel Performance Events And Counters
> >> =

> >> CONFIG_VM_EVENT_COUNTERS=3Dy
> >> CONFIG_SLUB_DEBUG=3Dy
> >> CONFIG_COMPAT_BRK=3Dy
> >> # CONFIG_SLAB is not set
> >> CONFIG_SLUB=3Dy
> >> # CONFIG_SLAB_MERGE_DEFAULT is not set
> >> # CONFIG_SLAB_FREELIST_RANDOM is not set
> >> # CONFIG_SLAB_FREELIST_HARDENED is not set
> >> CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
> >> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> >> CONFIG_PROFILING=3Dy
> >> CONFIG_TRACEPOINTS=3Dy
> >> # end of General setup
> >> =

> >> CONFIG_X86_32=3Dy
> >> CONFIG_X86=3Dy
> >> CONFIG_INSTRUCTION_DECODER=3Dy
> >> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> >> CONFIG_LOCKDEP_SUPPORT=3Dy
> >> CONFIG_STACKTRACE_SUPPORT=3Dy
> >> CONFIG_MMU=3Dy
> >> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
> >> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
> >> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> >> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> >> CONFIG_GENERIC_ISA_DMA=3Dy
> >> CONFIG_GENERIC_BUG=3Dy
> >> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> >> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> >> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> >> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> >> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> >> CONFIG_ARCH_NR_GPIO=3D512
> >> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> >> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> >> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> >> CONFIG_FIX_EARLYCON_MEM=3Dy
> >> CONFIG_PGTABLE_LEVELS=3D3
> >> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> >> =

> >> #
> >> # Processor type and features
> >> #
> >> # CONFIG_SMP is not set
> >> CONFIG_X86_FEATURE_NAMES=3Dy
> >> CONFIG_GOLDFISH=3Dy
> >> # CONFIG_RETPOLINE is not set
> >> # CONFIG_X86_CPU_RESCTRL is not set
> >> # CONFIG_X86_EXTENDED_PLATFORM is not set
> >> # CONFIG_X86_INTEL_LPSS is not set
> >> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> >> CONFIG_IOSF_MBI=3Dy
> >> CONFIG_IOSF_MBI_DEBUG=3Dy
> >> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> >> # CONFIG_X86_32_IRIS is not set
> >> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> >> CONFIG_HYPERVISOR_GUEST=3Dy
> >> CONFIG_PARAVIRT=3Dy
> >> CONFIG_PARAVIRT_DEBUG=3Dy
> >> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> >> CONFIG_KVM_GUEST=3Dy
> >> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> >> CONFIG_PVH=3Dy
> >> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> >> CONFIG_PARAVIRT_CLOCK=3Dy
> >> # CONFIG_M486SX is not set
> >> # CONFIG_M486 is not set
> >> # CONFIG_M586 is not set
> >> # CONFIG_M586TSC is not set
> >> # CONFIG_M586MMX is not set
> >> # CONFIG_M686 is not set
> >> # CONFIG_MPENTIUMII is not set
> >> # CONFIG_MPENTIUMIII is not set
> >> # CONFIG_MPENTIUMM is not set
> >> # CONFIG_MPENTIUM4 is not set
> >> # CONFIG_MK6 is not set
> >> # CONFIG_MK7 is not set
> >> # CONFIG_MK8 is not set
> >> # CONFIG_MCRUSOE is not set
> >> # CONFIG_MEFFICEON is not set
> >> # CONFIG_MWINCHIPC6 is not set
> >> # CONFIG_MWINCHIP3D is not set
> >> # CONFIG_MELAN is not set
> >> # CONFIG_MGEODEGX1 is not set
> >> # CONFIG_MGEODE_LX is not set
> >> # CONFIG_MCYRIXIII is not set
> >> # CONFIG_MVIAC3_2 is not set
> >> CONFIG_MVIAC7=3Dy
> >> # CONFIG_MCORE2 is not set
> >> # CONFIG_MATOM is not set
> >> # CONFIG_X86_GENERIC is not set
> >> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> >> CONFIG_X86_L1_CACHE_SHIFT=3D6
> >> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> >> CONFIG_X86_TSC=3Dy
> >> CONFIG_X86_CMPXCHG64=3Dy
> >> CONFIG_X86_CMOV=3Dy
> >> CONFIG_X86_MINIMUM_CPU_FAMILY=3D6
> >> CONFIG_X86_DEBUGCTLMSR=3Dy
> >> CONFIG_IA32_FEAT_CTL=3Dy
> >> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> >> CONFIG_CPU_SUP_INTEL=3Dy
> >> CONFIG_CPU_SUP_AMD=3Dy
> >> CONFIG_CPU_SUP_HYGON=3Dy
> >> CONFIG_CPU_SUP_CENTAUR=3Dy
> >> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> >> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> >> CONFIG_CPU_SUP_VORTEX_32=3Dy
> >> CONFIG_HPET_TIMER=3Dy
> >> CONFIG_DMI=3Dy
> >> CONFIG_NR_CPUS_RANGE_BEGIN=3D1
> >> CONFIG_NR_CPUS_RANGE_END=3D1
> >> CONFIG_NR_CPUS_DEFAULT=3D1
> >> CONFIG_NR_CPUS=3D1
> >> # CONFIG_X86_UP_APIC is not set
> >> CONFIG_X86_MCE=3Dy
> >> # CONFIG_X86_MCELOG_LEGACY is not set
> >> # CONFIG_X86_ANCIENT_MCE is not set
> >> =

> >> #
> >> # Performance monitoring
> >> #
> >> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> >> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
> >> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> >> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> >> # CONFIG_PERF_EVENTS_AMD_UNCORE is not set
> >> # end of Performance monitoring
> >> =

> >> # CONFIG_X86_LEGACY_VM86 is not set
> >> CONFIG_X86_16BIT=3Dy
> >> CONFIG_X86_ESPFIX32=3Dy
> >> CONFIG_X86_IOPL_IOPERM=3Dy
> >> CONFIG_TOSHIBA=3Dy
> >> CONFIG_I8K=3Dm
> >> CONFIG_X86_REBOOTFIXUPS=3Dy
> >> CONFIG_MICROCODE=3Dy
> >> CONFIG_MICROCODE_INTEL=3Dy
> >> # CONFIG_MICROCODE_AMD is not set
> >> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> >> # CONFIG_X86_MSR is not set
> >> # CONFIG_X86_CPUID is not set
> >> # CONFIG_NOHIGHMEM is not set
> >> # CONFIG_HIGHMEM4G is not set
> >> CONFIG_HIGHMEM64G=3Dy
> >> CONFIG_PAGE_OFFSET=3D0xC0000000
> >> CONFIG_HIGHMEM=3Dy
> >> CONFIG_X86_PAE=3Dy
> >> CONFIG_X86_CPA_STATISTICS=3Dy
> >> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> >> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> >> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> >> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> >> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> >> CONFIG_X86_PMEM_LEGACY=3Dy
> >> CONFIG_HIGHPTE=3Dy
> >> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> >> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> >> CONFIG_MTRR=3Dy
> >> CONFIG_MTRR_SANITIZER=3Dy
> >> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> >> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> >> CONFIG_X86_PAT=3Dy
> >> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> >> CONFIG_ARCH_RANDOM=3Dy
> >> CONFIG_X86_SMAP=3Dy
> >> CONFIG_X86_UMIP=3Dy
> >> CONFIG_X86_INTEL_TSX_MODE_OFF=3Dy
> >> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> >> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> >> # CONFIG_EFI is not set
> >> # CONFIG_HZ_100 is not set
> >> # CONFIG_HZ_250 is not set
> >> # CONFIG_HZ_300 is not set
> >> CONFIG_HZ_1000=3Dy
> >> CONFIG_HZ=3D1000
> >> CONFIG_SCHED_HRTICK=3Dy
> >> CONFIG_KEXEC=3Dy
> >> CONFIG_CRASH_DUMP=3Dy
> >> CONFIG_PHYSICAL_START=3D0x1000000
> >> # CONFIG_RELOCATABLE is not set
> >> CONFIG_PHYSICAL_ALIGN=3D0x200000
> >> CONFIG_COMPAT_VDSO=3Dy
> >> # CONFIG_CMDLINE_BOOL is not set
> >> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> >> CONFIG_STRICT_SIGALTSTACK_SIZE=3Dy
> >> # end of Processor type and features
> >> =

> >> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> >> =

> >> #
> >> # Power management and ACPI options
> >> #
> >> # CONFIG_SUSPEND is not set
> >> # CONFIG_HIBERNATION is not set
> >> CONFIG_PM=3Dy
> >> CONFIG_PM_DEBUG=3Dy
> >> CONFIG_PM_ADVANCED_DEBUG=3Dy
> >> CONFIG_PM_CLK=3Dy
> >> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> >> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> >> CONFIG_ACPI=3Dy
> >> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> >> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> >> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> >> # CONFIG_ACPI_DEBUGGER is not set
> >> CONFIG_ACPI_SPCR_TABLE=3Dy
> >> # CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
> >> CONFIG_ACPI_EC_DEBUGFS=3Dy
> >> CONFIG_ACPI_AC=3Dm
> >> # CONFIG_ACPI_BATTERY is not set
> >> CONFIG_ACPI_BUTTON=3Dy
> >> CONFIG_ACPI_VIDEO=3Dy
> >> CONFIG_ACPI_FAN=3Dm
> >> CONFIG_ACPI_DOCK=3Dy
> >> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> >> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> >> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> >> CONFIG_ACPI_PROCESSOR=3Dm
> >> # CONFIG_ACPI_IPMI is not set
> >> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
> >> CONFIG_ACPI_THERMAL=3Dm
> >> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> >> # CONFIG_ACPI_TABLE_UPGRADE is not set
> >> CONFIG_ACPI_DEBUG=3Dy
> >> CONFIG_ACPI_PCI_SLOT=3Dy
> >> CONFIG_ACPI_CONTAINER=3Dy
> >> CONFIG_ACPI_SBS=3Dm
> >> CONFIG_ACPI_HED=3Dy
> >> CONFIG_ACPI_CUSTOM_METHOD=3Dy
> >> CONFIG_HAVE_ACPI_APEI=3Dy
> >> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> >> # CONFIG_ACPI_APEI is not set
> >> CONFIG_ACPI_DPTF=3Dy
> >> CONFIG_DPTF_POWER=3Dy
> >> CONFIG_DPTF_PCH_FIVR=3Dm
> >> CONFIG_ACPI_WATCHDOG=3Dy
> >> # CONFIG_ACPI_CONFIGFS is not set
> >> # CONFIG_ACPI_PCC is not set
> >> # CONFIG_PMIC_OPREGION is not set
> >> CONFIG_ACPI_VIOT=3Dy
> >> CONFIG_X86_PM_TIMER=3Dy
> >> =

> >> #
> >> # CPU Frequency scaling
> >> #
> >> CONFIG_CPU_FREQ=3Dy
> >> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> >> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> >> CONFIG_CPU_FREQ_STAT=3Dy
> >> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> >> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> >> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> >> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> >> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> >> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> >> # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> >> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dm
> >> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> >> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm
> >> =

> >> #
> >> # CPU frequency scaling drivers
> >> #
> >> # CONFIG_X86_INTEL_PSTATE is not set
> >> CONFIG_X86_PCC_CPUFREQ=3Dm
> >> # CONFIG_X86_AMD_PSTATE is not set
> >> CONFIG_X86_ACPI_CPUFREQ=3Dm
> >> # CONFIG_X86_ACPI_CPUFREQ_CPB is not set
> >> CONFIG_X86_POWERNOW_K6=3Dy
> >> CONFIG_X86_POWERNOW_K7=3Dm
> >> CONFIG_X86_POWERNOW_K7_ACPI=3Dy
> >> CONFIG_X86_POWERNOW_K8=3Dm
> >> # CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
> >> # CONFIG_X86_GX_SUSPMOD is not set
> >> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
> >> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> >> CONFIG_X86_SPEEDSTEP_ICH=3Dy
> >> CONFIG_X86_SPEEDSTEP_SMI=3Dm
> >> CONFIG_X86_P4_CLOCKMOD=3Dm
> >> CONFIG_X86_CPUFREQ_NFORCE2=3Dy
> >> # CONFIG_X86_LONGRUN is not set
> >> CONFIG_X86_LONGHAUL=3Dm
> >> # CONFIG_X86_E_POWERSAVER is not set
> >> =

> >> #
> >> # shared options
> >> #
> >> CONFIG_X86_SPEEDSTEP_LIB=3Dy
> >> CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=3Dy
> >> # end of CPU Frequency scaling
> >> =

> >> #
> >> # CPU Idle
> >> #
> >> CONFIG_CPU_IDLE=3Dy
> >> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> >> # CONFIG_CPU_IDLE_GOV_MENU is not set
> >> # CONFIG_CPU_IDLE_GOV_TEO is not set
> >> CONFIG_CPU_IDLE_GOV_HALTPOLL=3Dy
> >> # CONFIG_HALTPOLL_CPUIDLE is not set
> >> # end of CPU Idle
> >> =

> >> CONFIG_INTEL_IDLE=3Dy
> >> # end of Power management and ACPI options
> >> =

> >> #
> >> # Bus options (PCI etc.)
> >> #
> >> CONFIG_PCI_GOBIOS=3Dy
> >> # CONFIG_PCI_GOMMCONFIG is not set
> >> # CONFIG_PCI_GODIRECT is not set
> >> # CONFIG_PCI_GOANY is not set
> >> CONFIG_PCI_BIOS=3Dy
> >> CONFIG_ISA_DMA_API=3Dy
> >> # CONFIG_ISA is not set
> >> # CONFIG_SCx200 is not set
> >> # CONFIG_ALIX is not set
> >> CONFIG_NET5501=3Dy
> >> # CONFIG_GEOS is not set
> >> CONFIG_AMD_NB=3Dy
> >> # end of Bus options (PCI etc.)
> >> =

> >> #
> >> # Binary Emulations
> >> #
> >> CONFIG_COMPAT_32=3Dy
> >> # end of Binary Emulations
> >> =

> >> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> >> CONFIG_HAVE_KVM=3Dy
> >> CONFIG_VIRTUALIZATION=3Dy
> >> CONFIG_AS_AVX512=3Dy
> >> CONFIG_AS_SHA1_NI=3Dy
> >> CONFIG_AS_SHA256_NI=3Dy
> >> CONFIG_AS_TPAUSE=3Dy
> >> =

> >> #
> >> # General architecture-dependent options
> >> #
> >> CONFIG_CRASH_CORE=3Dy
> >> CONFIG_KEXEC_CORE=3Dy
> >> CONFIG_GENERIC_ENTRY=3Dy
> >> CONFIG_KPROBES=3Dy
> >> CONFIG_JUMP_LABEL=3Dy
> >> # CONFIG_STATIC_KEYS_SELFTEST is not set
> >> # CONFIG_STATIC_CALL_SELFTEST is not set
> >> CONFIG_OPTPROBES=3Dy
> >> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> >> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> >> CONFIG_KRETPROBES=3Dy
> >> CONFIG_HAVE_IOREMAP_PROT=3Dy
> >> CONFIG_HAVE_KPROBES=3Dy
> >> CONFIG_HAVE_KRETPROBES=3Dy
> >> CONFIG_HAVE_OPTPROBES=3Dy
> >> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> >> CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=3Dy
> >> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> >> CONFIG_HAVE_NMI=3Dy
> >> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> >> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> >> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> >> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> >> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> >> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> >> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> >> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> >> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> >> CONFIG_ARCH_WANTS_NO_INSTR=3Dy
> >> CONFIG_ARCH_32BIT_OFF_T=3Dy
> >> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> >> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> >> CONFIG_HAVE_RSEQ=3Dy
> >> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> >> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> >> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> >> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> >> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> >> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> >> CONFIG_HAVE_PERF_REGS=3Dy
> >> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> >> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> >> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> >> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> >> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> >> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> >> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> >> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> >> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> >> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> >> CONFIG_HAVE_ARCH_SECCOMP=3Dy
> >> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> >> CONFIG_SECCOMP=3Dy
> >> CONFIG_SECCOMP_FILTER=3Dy
> >> # CONFIG_SECCOMP_CACHE_DEBUG is not set
> >> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> >> CONFIG_HAVE_STACKPROTECTOR=3Dy
> >> # CONFIG_STACKPROTECTOR is not set
> >> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> >> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> >> CONFIG_LTO_NONE=3Dy
> >> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> >> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> >> CONFIG_HAVE_MOVE_PUD=3Dy
> >> CONFIG_HAVE_MOVE_PMD=3Dy
> >> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> >> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> >> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> >> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> >> CONFIG_MODULES_USE_ELF_REL=3Dy
> >> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> >> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> >> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> >> CONFIG_HAVE_EXIT_THREAD=3Dy
> >> CONFIG_ARCH_MMAP_RND_BITS=3D8
> >> CONFIG_PAGE_SIZE_LESS_THAN_64KB=3Dy
> >> CONFIG_PAGE_SIZE_LESS_THAN_256KB=3Dy
> >> CONFIG_ISA_BUS_API=3Dy
> >> CONFIG_CLONE_BACKWARDS=3Dy
> >> CONFIG_OLD_SIGSUSPEND3=3Dy
> >> CONFIG_OLD_SIGACTION=3Dy
> >> CONFIG_COMPAT_32BIT_TIME=3Dy
> >> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> >> CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=3Dy
> >> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> >> CONFIG_STRICT_KERNEL_RWX=3Dy
> >> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> >> CONFIG_STRICT_MODULE_RWX=3Dy
> >> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> >> # CONFIG_LOCK_EVENT_COUNTS is not set
> >> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> >> CONFIG_HAVE_STATIC_CALL=3Dy
> >> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> >> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> >> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> >> CONFIG_ARCH_SPLIT_ARG64=3Dy
> >> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
> >> CONFIG_DYNAMIC_SIGFRAME=3Dy
> >> =

> >> #
> >> # GCOV-based kernel profiling
> >> #
> >> # CONFIG_GCOV_KERNEL is not set
> >> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> >> # end of GCOV-based kernel profiling
> >> =

> >> CONFIG_HAVE_GCC_PLUGINS=3Dy
> >> # end of General architecture-dependent options
> >> =

> >> CONFIG_RT_MUTEXES=3Dy
> >> CONFIG_BASE_SMALL=3D0
> >> CONFIG_MODULE_SIG_FORMAT=3Dy
> >> CONFIG_MODULES=3Dy
> >> # CONFIG_MODULE_FORCE_LOAD is not set
> >> CONFIG_MODULE_UNLOAD=3Dy
> >> # CONFIG_MODULE_FORCE_UNLOAD is not set
> >> # CONFIG_MODVERSIONS is not set
> >> # CONFIG_MODULE_SRCVERSION_ALL is not set
> >> CONFIG_MODULE_SIG=3Dy
> >> # CONFIG_MODULE_SIG_FORCE is not set
> >> # CONFIG_MODULE_SIG_ALL is not set
> >> # CONFIG_MODULE_SIG_SHA1 is not set
> >> # CONFIG_MODULE_SIG_SHA224 is not set
> >> CONFIG_MODULE_SIG_SHA256=3Dy
> >> # CONFIG_MODULE_SIG_SHA384 is not set
> >> # CONFIG_MODULE_SIG_SHA512 is not set
> >> CONFIG_MODULE_SIG_HASH=3D"sha256"
> >> CONFIG_MODULE_COMPRESS_NONE=3Dy
> >> # CONFIG_MODULE_COMPRESS_GZIP is not set
> >> # CONFIG_MODULE_COMPRESS_XZ is not set
> >> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> >> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> >> CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> >> CONFIG_MODULES_TREE_LOOKUP=3Dy
> >> CONFIG_BLOCK=3Dy
> >> CONFIG_BLK_RQ_ALLOC_TIME=3Dy
> >> CONFIG_BLK_CGROUP_RWSTAT=3Dy
> >> CONFIG_BLK_ICQ=3Dy
> >> # CONFIG_BLK_DEV_BSGLIB is not set
> >> CONFIG_BLK_DEV_INTEGRITY=3Dy
> >> CONFIG_BLK_DEV_INTEGRITY_T10=3Dm
> >> CONFIG_BLK_DEV_ZONED=3Dy
> >> CONFIG_BLK_DEV_THROTTLING=3Dy
> >> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> >> # CONFIG_BLK_WBT is not set
> >> # CONFIG_BLK_CGROUP_IOLATENCY is not set
> >> # CONFIG_BLK_CGROUP_FC_APPID is not set
> >> CONFIG_BLK_CGROUP_IOCOST=3Dy
> >> CONFIG_BLK_CGROUP_IOPRIO=3Dy
> >> CONFIG_BLK_DEBUG_FS=3Dy
> >> CONFIG_BLK_DEBUG_FS_ZONED=3Dy
> >> CONFIG_BLK_SED_OPAL=3Dy
> >> CONFIG_BLK_INLINE_ENCRYPTION=3Dy
> >> CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=3Dy
> >> =

> >> #
> >> # Partition Types
> >> #
> >> # CONFIG_PARTITION_ADVANCED is not set
> >> CONFIG_AMIGA_PARTITION=3Dy
> >> CONFIG_MSDOS_PARTITION=3Dy
> >> CONFIG_EFI_PARTITION=3Dy
> >> # end of Partition Types
> >> =

> >> CONFIG_BLK_MQ_PCI=3Dy
> >> CONFIG_BLK_MQ_VIRTIO=3Dy
> >> CONFIG_BLK_PM=3Dy
> >> =

> >> #
> >> # IO Schedulers
> >> #
> >> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> >> CONFIG_MQ_IOSCHED_KYBER=3Dy
> >> CONFIG_IOSCHED_BFQ=3Dm
> >> # CONFIG_BFQ_GROUP_IOSCHED is not set
> >> # end of IO Schedulers
> >> =

> >> CONFIG_ASN1=3Dy
> >> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> >> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> >> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> >> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> >> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> >> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> >> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> >> =

> >> #
> >> # Executable file formats
> >> #
> >> CONFIG_BINFMT_ELF=3Dy
> >> CONFIG_ELFCORE=3Dy
> >> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> >> CONFIG_BINFMT_SCRIPT=3Dy
> >> CONFIG_BINFMT_MISC=3Dm
> >> CONFIG_COREDUMP=3Dy
> >> # end of Executable file formats
> >> =

> >> #
> >> # Memory Management options
> >> #
> >> CONFIG_SELECT_MEMORY_MODEL=3Dy
> >> CONFIG_FLATMEM_MANUAL=3Dy
> >> # CONFIG_SPARSEMEM_MANUAL is not set
> >> CONFIG_FLATMEM=3Dy
> >> CONFIG_SPARSEMEM_STATIC=3Dy
> >> CONFIG_HAVE_FAST_GUP=3Dy
> >> CONFIG_MEMORY_ISOLATION=3Dy
> >> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> >> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> >> # CONFIG_COMPACTION is not set
> >> # CONFIG_PAGE_REPORTING is not set
> >> CONFIG_MIGRATION=3Dy
> >> CONFIG_CONTIG_ALLOC=3Dy
> >> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> >> # CONFIG_BOUNCE is not set
> >> CONFIG_VIRT_TO_BUS=3Dy
> >> CONFIG_MMU_NOTIFIER=3Dy
> >> # CONFIG_KSM is not set
> >> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> >> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> >> CONFIG_MEMORY_FAILURE=3Dy
> >> CONFIG_HWPOISON_INJECT=3Dm
> >> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> >> CONFIG_NEED_PER_CPU_KM=3Dy
> >> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> >> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> >> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> >> CONFIG_FRONTSWAP=3Dy
> >> CONFIG_CMA=3Dy
> >> CONFIG_CMA_DEBUG=3Dy
> >> CONFIG_CMA_DEBUGFS=3Dy
> >> # CONFIG_CMA_SYSFS is not set
> >> CONFIG_CMA_AREAS=3D7
> >> CONFIG_ZSWAP=3Dy
> >> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
> >> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO is not set
> >> CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842=3Dy
> >> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
> >> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
> >> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
> >> CONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"842"
> >> # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD is not set
> >> CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD=3Dy
> >> # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
> >> CONFIG_ZSWAP_ZPOOL_DEFAULT=3D"z3fold"
> >> # CONFIG_ZSWAP_DEFAULT_ON is not set
> >> CONFIG_ZPOOL=3Dy
> >> CONFIG_ZBUD=3Dy
> >> CONFIG_Z3FOLD=3Dy
> >> CONFIG_ZSMALLOC=3Dy
> >> # CONFIG_ZSMALLOC_STAT is not set
> >> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> >> CONFIG_PAGE_IDLE_FLAG=3Dy
> >> CONFIG_IDLE_PAGE_TRACKING=3Dy
> >> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> >> CONFIG_ZONE_DMA=3Dy
> >> CONFIG_VMAP_PFN=3Dy
> >> # CONFIG_PERCPU_STATS is not set
> >> # CONFIG_GUP_TEST is not set
> >> CONFIG_GUP_GET_PTE_LOW_HIGH=3Dy
> >> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> >> CONFIG_KMAP_LOCAL=3Dy
> >> CONFIG_SECRETMEM=3Dy
> >> CONFIG_ANON_VMA_NAME=3Dy
> >> =

> >> #
> >> # Data Access Monitoring
> >> #
> >> # CONFIG_DAMON is not set
> >> # end of Data Access Monitoring
> >> # end of Memory Management options
> >> =

> >> CONFIG_NET=3Dy
> >> =

> >> #
> >> # Networking options
> >> #
> >> CONFIG_PACKET=3Dy
> >> # CONFIG_PACKET_DIAG is not set
> >> CONFIG_UNIX=3Dy
> >> CONFIG_UNIX_SCM=3Dy
> >> CONFIG_AF_UNIX_OOB=3Dy
> >> # CONFIG_UNIX_DIAG is not set
> >> # CONFIG_TLS is not set
> >> # CONFIG_XFRM_USER is not set
> >> # CONFIG_NET_KEY is not set
> >> CONFIG_INET=3Dy
> >> # CONFIG_IP_MULTICAST is not set
> >> # CONFIG_IP_ADVANCED_ROUTER is not set
> >> CONFIG_IP_PNP=3Dy
> >> CONFIG_IP_PNP_DHCP=3Dy
> >> # CONFIG_IP_PNP_BOOTP is not set
> >> # CONFIG_IP_PNP_RARP is not set
> >> # CONFIG_NET_IPIP is not set
> >> # CONFIG_NET_IPGRE_DEMUX is not set
> >> CONFIG_NET_IP_TUNNEL=3Dy
> >> # CONFIG_SYN_COOKIES is not set
> >> # CONFIG_NET_IPVTI is not set
> >> # CONFIG_NET_FOU is not set
> >> # CONFIG_NET_FOU_IP_TUNNELS is not set
> >> # CONFIG_INET_AH is not set
> >> # CONFIG_INET_ESP is not set
> >> # CONFIG_INET_IPCOMP is not set
> >> CONFIG_INET_TUNNEL=3Dy
> >> CONFIG_INET_DIAG=3Dy
> >> CONFIG_INET_TCP_DIAG=3Dy
> >> # CONFIG_INET_UDP_DIAG is not set
> >> # CONFIG_INET_RAW_DIAG is not set
> >> # CONFIG_INET_DIAG_DESTROY is not set
> >> # CONFIG_TCP_CONG_ADVANCED is not set
> >> CONFIG_TCP_CONG_CUBIC=3Dy
> >> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> >> # CONFIG_TCP_MD5SIG is not set
> >> CONFIG_IPV6=3Dy
> >> # CONFIG_IPV6_ROUTER_PREF is not set
> >> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> >> # CONFIG_INET6_AH is not set
> >> # CONFIG_INET6_ESP is not set
> >> # CONFIG_INET6_IPCOMP is not set
> >> # CONFIG_IPV6_MIP6 is not set
> >> # CONFIG_IPV6_VTI is not set
> >> CONFIG_IPV6_SIT=3Dy
> >> # CONFIG_IPV6_SIT_6RD is not set
> >> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> >> # CONFIG_IPV6_TUNNEL is not set
> >> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> >> # CONFIG_IPV6_MROUTE is not set
> >> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> >> # CONFIG_IPV6_SEG6_HMAC is not set
> >> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> >> # CONFIG_IPV6_IOAM6_LWTUNNEL is not set
> >> # CONFIG_NETLABEL is not set
> >> # CONFIG_MPTCP is not set
> >> # CONFIG_NETWORK_SECMARK is not set
> >> CONFIG_NET_PTP_CLASSIFY=3Dy
> >> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> >> # CONFIG_NETFILTER is not set
> >> # CONFIG_BPFILTER is not set
> >> # CONFIG_IP_DCCP is not set
> >> # CONFIG_IP_SCTP is not set
> >> # CONFIG_RDS is not set
> >> # CONFIG_TIPC is not set
> >> # CONFIG_ATM is not set
> >> # CONFIG_L2TP is not set
> >> # CONFIG_BRIDGE is not set
> >> # CONFIG_NET_DSA is not set
> >> # CONFIG_VLAN_8021Q is not set
> >> # CONFIG_DECNET is not set
> >> # CONFIG_LLC2 is not set
> >> # CONFIG_ATALK is not set
> >> # CONFIG_X25 is not set
> >> # CONFIG_LAPB is not set
> >> # CONFIG_PHONET is not set
> >> # CONFIG_6LOWPAN is not set
> >> # CONFIG_IEEE802154 is not set
> >> # CONFIG_NET_SCHED is not set
> >> # CONFIG_DCB is not set
> >> CONFIG_DNS_RESOLVER=3Dm
> >> # CONFIG_BATMAN_ADV is not set
> >> # CONFIG_OPENVSWITCH is not set
> >> # CONFIG_VSOCKETS is not set
> >> # CONFIG_NETLINK_DIAG is not set
> >> # CONFIG_MPLS is not set
> >> # CONFIG_NET_NSH is not set
> >> # CONFIG_HSR is not set
> >> # CONFIG_NET_SWITCHDEV is not set
> >> # CONFIG_NET_L3_MASTER_DEV is not set
> >> # CONFIG_QRTR is not set
> >> # CONFIG_NET_NCSI is not set
> >> # CONFIG_CGROUP_NET_PRIO is not set
> >> # CONFIG_CGROUP_NET_CLASSID is not set
> >> CONFIG_NET_RX_BUSY_POLL=3Dy
> >> CONFIG_BQL=3Dy
> >> =

> >> #
> >> # Network testing
> >> #
> >> # CONFIG_NET_PKTGEN is not set
> >> # CONFIG_NET_DROP_MONITOR is not set
> >> # end of Network testing
> >> # end of Networking options
> >> =

> >> # CONFIG_HAMRADIO is not set
> >> # CONFIG_CAN is not set
> >> # CONFIG_BT is not set
> >> # CONFIG_AF_RXRPC is not set
> >> # CONFIG_AF_KCM is not set
> >> # CONFIG_MCTP is not set
> >> CONFIG_WIRELESS=3Dy
> >> # CONFIG_CFG80211 is not set
> >> =

> >> #
> >> # CFG80211 needs to be enabled for MAC80211
> >> #
> >> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> >> # CONFIG_RFKILL is not set
> >> CONFIG_NET_9P=3Dy
> >> CONFIG_NET_9P_FD=3Dy
> >> CONFIG_NET_9P_VIRTIO=3Dy
> >> # CONFIG_NET_9P_DEBUG is not set
> >> # CONFIG_CAIF is not set
> >> # CONFIG_CEPH_LIB is not set
> >> # CONFIG_NFC is not set
> >> # CONFIG_PSAMPLE is not set
> >> # CONFIG_NET_IFE is not set
> >> # CONFIG_LWTUNNEL is not set
> >> CONFIG_DST_CACHE=3Dy
> >> CONFIG_GRO_CELLS=3Dy
> >> CONFIG_FAILOVER=3Dm
> >> CONFIG_ETHTOOL_NETLINK=3Dy
> >> =

> >> #
> >> # Device Drivers
> >> #
> >> CONFIG_HAVE_EISA=3Dy
> >> # CONFIG_EISA is not set
> >> CONFIG_HAVE_PCI=3Dy
> >> CONFIG_PCI=3Dy
> >> CONFIG_PCI_DOMAINS=3Dy
> >> CONFIG_PCIEPORTBUS=3Dy
> >> # CONFIG_PCIEAER is not set
> >> CONFIG_PCIEASPM=3Dy
> >> # CONFIG_PCIEASPM_DEFAULT is not set
> >> # CONFIG_PCIEASPM_POWERSAVE is not set
> >> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> >> CONFIG_PCIEASPM_PERFORMANCE=3Dy
> >> CONFIG_PCIE_PME=3Dy
> >> # CONFIG_PCIE_PTM is not set
> >> # CONFIG_PCI_MSI is not set
> >> CONFIG_PCI_QUIRKS=3Dy
> >> # CONFIG_PCI_DEBUG is not set
> >> # CONFIG_PCI_STUB is not set
> >> CONFIG_PCI_ATS=3Dy
> >> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> >> # CONFIG_PCI_IOV is not set
> >> # CONFIG_PCI_PRI is not set
> >> CONFIG_PCI_PASID=3Dy
> >> CONFIG_PCI_LABEL=3Dy
> >> # CONFIG_HOTPLUG_PCI is not set
> >> =

> >> #
> >> # PCI controller drivers
> >> #
> >> =

> >> #
> >> # DesignWare PCI Core Support
> >> #
> >> # end of DesignWare PCI Core Support
> >> =

> >> #
> >> # Mobiveil PCIe Core Support
> >> #
> >> # end of Mobiveil PCIe Core Support
> >> =

> >> #
> >> # Cadence PCIe controllers support
> >> #
> >> # end of Cadence PCIe controllers support
> >> # end of PCI controller drivers
> >> =

> >> #
> >> # PCI Endpoint
> >> #
> >> CONFIG_PCI_ENDPOINT=3Dy
> >> # CONFIG_PCI_ENDPOINT_CONFIGFS is not set
> >> # CONFIG_PCI_EPF_TEST is not set
> >> # CONFIG_PCI_EPF_NTB is not set
> >> # end of PCI Endpoint
> >> =

> >> #
> >> # PCI switch controller drivers
> >> #
> >> CONFIG_PCI_SW_SWITCHTEC=3Dy
> >> # end of PCI switch controller drivers
> >> =

> >> CONFIG_CXL_BUS=3Dy
> >> CONFIG_CXL_MEM=3Dm
> >> # CONFIG_CXL_MEM_RAW_COMMANDS is not set
> >> # CONFIG_CXL_ACPI is not set
> >> # CONFIG_CXL_PMEM is not set
> >> CONFIG_PCCARD=3Dy
> >> CONFIG_PCMCIA=3Dm
> >> CONFIG_PCMCIA_LOAD_CIS=3Dy
> >> CONFIG_CARDBUS=3Dy
> >> =

> >> #
> >> # PC-card bridges
> >> #
> >> CONFIG_YENTA=3Dm
> >> CONFIG_YENTA_O2=3Dy
> >> CONFIG_YENTA_RICOH=3Dy
> >> CONFIG_YENTA_TI=3Dy
> >> CONFIG_YENTA_ENE_TUNE=3Dy
> >> CONFIG_YENTA_TOSHIBA=3Dy
> >> CONFIG_PD6729=3Dm
> >> # CONFIG_I82092 is not set
> >> CONFIG_PCCARD_NONSTATIC=3Dy
> >> # CONFIG_RAPIDIO is not set
> >> =

> >> #
> >> # Generic Driver Options
> >> #
> >> CONFIG_AUXILIARY_BUS=3Dy
> >> CONFIG_UEVENT_HELPER=3Dy
> >> CONFIG_UEVENT_HELPER_PATH=3D""
> >> CONFIG_DEVTMPFS=3Dy
> >> # CONFIG_DEVTMPFS_MOUNT is not set
> >> # CONFIG_DEVTMPFS_SAFE is not set
> >> CONFIG_STANDALONE=3Dy
> >> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> >> =

> >> #
> >> # Firmware loader
> >> #
> >> CONFIG_FW_LOADER=3Dy
> >> CONFIG_EXTRA_FIRMWARE=3D""
> >> # CONFIG_FW_LOADER_USER_HELPER is not set
> >> # CONFIG_FW_LOADER_COMPRESS is not set
> >> # end of Firmware loader
> >> =

> >> CONFIG_WANT_DEV_COREDUMP=3Dy
> >> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> >> CONFIG_DEV_COREDUMP=3Dy
> >> # CONFIG_DEBUG_DRIVER is not set
> >> CONFIG_DEBUG_DEVRES=3Dy
> >> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> >> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> >> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> >> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> >> CONFIG_REGMAP=3Dy
> >> CONFIG_REGMAP_I2C=3Dy
> >> CONFIG_REGMAP_SLIMBUS=3Dm
> >> CONFIG_REGMAP_SPI=3Dy
> >> CONFIG_REGMAP_W1=3Dy
> >> CONFIG_REGMAP_MMIO=3Dy
> >> CONFIG_REGMAP_IRQ=3Dy
> >> CONFIG_REGMAP_SCCB=3Dm
> >> CONFIG_REGMAP_I3C=3Dm
> >> CONFIG_DMA_SHARED_BUFFER=3Dy
> >> # CONFIG_DMA_FENCE_TRACE is not set
> >> # end of Generic Driver Options
> >> =

> >> #
> >> # Bus devices
> >> #
> >> CONFIG_MHI_BUS=3Dm
> >> CONFIG_MHI_BUS_DEBUG=3Dy
> >> # CONFIG_MHI_BUS_PCI_GENERIC is not set
> >> # end of Bus devices
> >> =

> >> # CONFIG_CONNECTOR is not set
> >> =

> >> #
> >> # Firmware Drivers
> >> #
> >> =

> >> #
> >> # ARM System Control and Management Interface Protocol
> >> #
> >> # end of ARM System Control and Management Interface Protocol
> >> =

> >> # CONFIG_EDD is not set
> >> CONFIG_FIRMWARE_MEMMAP=3Dy
> >> CONFIG_DMIID=3Dy
> >> CONFIG_DMI_SYSFS=3Dm
> >> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> >> CONFIG_FW_CFG_SYSFS=3Dm
> >> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
> >> CONFIG_SYSFB=3Dy
> >> CONFIG_SYSFB_SIMPLEFB=3Dy
> >> CONFIG_GOOGLE_FIRMWARE=3Dy
> >> CONFIG_GOOGLE_SMI=3Dy
> >> CONFIG_GOOGLE_COREBOOT_TABLE=3Dm
> >> CONFIG_GOOGLE_MEMCONSOLE=3Dm
> >> CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY=3Dm
> >> CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=3Dm
> >> # CONFIG_GOOGLE_VPD is not set
> >> =

> >> #
> >> # Tegra firmware driver
> >> #
> >> # end of Tegra firmware driver
> >> # end of Firmware Drivers
> >> =

> >> CONFIG_GNSS=3Dy
> >> CONFIG_GNSS_SERIAL=3Dm
> >> CONFIG_GNSS_MTK_SERIAL=3Dm
> >> CONFIG_GNSS_SIRF_SERIAL=3Dm
> >> # CONFIG_GNSS_UBX_SERIAL is not set
> >> CONFIG_MTD=3Dm
> >> # CONFIG_MTD_TESTS is not set
> >> =

> >> #
> >> # Partition parsers
> >> #
> >> CONFIG_MTD_AR7_PARTS=3Dm
> >> CONFIG_MTD_CMDLINE_PARTS=3Dm
> >> # CONFIG_MTD_REDBOOT_PARTS is not set
> >> # end of Partition parsers
> >> =

> >> #
> >> # User Modules And Translation Layers
> >> #
> >> CONFIG_MTD_BLKDEVS=3Dm
> >> # CONFIG_MTD_BLOCK is not set
> >> CONFIG_MTD_BLOCK_RO=3Dm
> >> =

> >> #
> >> # Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
> >> #
> >> CONFIG_FTL=3Dm
> >> # CONFIG_NFTL is not set
> >> CONFIG_INFTL=3Dm
> >> CONFIG_RFD_FTL=3Dm
> >> CONFIG_SSFDC=3Dm
> >> CONFIG_SM_FTL=3Dm
> >> # CONFIG_MTD_OOPS is not set
> >> CONFIG_MTD_SWAP=3Dm
> >> CONFIG_MTD_PARTITIONED_MASTER=3Dy
> >> =

> >> #
> >> # RAM/ROM/Flash chip drivers
> >> #
> >> CONFIG_MTD_CFI=3Dm
> >> CONFIG_MTD_JEDECPROBE=3Dm
> >> CONFIG_MTD_GEN_PROBE=3Dm
> >> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> >> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> >> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> >> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> >> CONFIG_MTD_CFI_I1=3Dy
> >> CONFIG_MTD_CFI_I2=3Dy
> >> CONFIG_MTD_CFI_INTELEXT=3Dm
> >> CONFIG_MTD_CFI_AMDSTD=3Dm
> >> CONFIG_MTD_CFI_STAA=3Dm
> >> CONFIG_MTD_CFI_UTIL=3Dm
> >> CONFIG_MTD_RAM=3Dm
> >> # CONFIG_MTD_ROM is not set
> >> CONFIG_MTD_ABSENT=3Dm
> >> # end of RAM/ROM/Flash chip drivers
> >> =

> >> #
> >> # Mapping drivers for chip access
> >> #
> >> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> >> # CONFIG_MTD_PHYSMAP is not set
> >> # CONFIG_MTD_SBC_GXX is not set
> >> CONFIG_MTD_AMD76XROM=3Dm
> >> # CONFIG_MTD_ICHXROM is not set
> >> # CONFIG_MTD_ESB2ROM is not set
> >> # CONFIG_MTD_CK804XROM is not set
> >> CONFIG_MTD_SCB2_FLASH=3Dm
> >> CONFIG_MTD_NETtel=3Dm
> >> # CONFIG_MTD_L440GX is not set
> >> CONFIG_MTD_PCI=3Dm
> >> CONFIG_MTD_PCMCIA=3Dm
> >> # CONFIG_MTD_PCMCIA_ANONYMOUS is not set
> >> CONFIG_MTD_INTEL_VR_NOR=3Dm
> >> # CONFIG_MTD_PLATRAM is not set
> >> # end of Mapping drivers for chip access
> >> =

> >> #
> >> # Self-contained MTD device drivers
> >> #
> >> # CONFIG_MTD_PMC551 is not set
> >> CONFIG_MTD_DATAFLASH=3Dm
> >> # CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
> >> CONFIG_MTD_DATAFLASH_OTP=3Dy
> >> CONFIG_MTD_MCHP23K256=3Dm
> >> CONFIG_MTD_MCHP48L640=3Dm
> >> # CONFIG_MTD_SST25L is not set
> >> # CONFIG_MTD_SLRAM is not set
> >> CONFIG_MTD_PHRAM=3Dm
> >> # CONFIG_MTD_MTDRAM is not set
> >> CONFIG_MTD_BLOCK2MTD=3Dm
> >> =

> >> #
> >> # Disk-On-Chip Device Drivers
> >> #
> >> CONFIG_MTD_DOCG3=3Dm
> >> CONFIG_BCH_CONST_M=3D14
> >> CONFIG_BCH_CONST_T=3D4
> >> # end of Self-contained MTD device drivers
> >> =

> >> #
> >> # NAND
> >> #
> >> CONFIG_MTD_NAND_CORE=3Dm
> >> CONFIG_MTD_ONENAND=3Dm
> >> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> >> # CONFIG_MTD_ONENAND_GENERIC is not set
> >> CONFIG_MTD_ONENAND_OTP=3Dy
> >> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> >> CONFIG_MTD_RAW_NAND=3Dm
> >> =

> >> #
> >> # Raw/parallel NAND flash controllers
> >> #
> >> CONFIG_MTD_NAND_DENALI=3Dm
> >> CONFIG_MTD_NAND_DENALI_PCI=3Dm
> >> CONFIG_MTD_NAND_CAFE=3Dm
> >> CONFIG_MTD_NAND_CS553X=3Dm
> >> # CONFIG_MTD_NAND_MXIC is not set
> >> CONFIG_MTD_NAND_GPIO=3Dm
> >> CONFIG_MTD_NAND_PLATFORM=3Dm
> >> # CONFIG_MTD_NAND_ARASAN is not set
> >> =

> >> #
> >> # Misc
> >> #
> >> # CONFIG_MTD_NAND_NANDSIM is not set
> >> # CONFIG_MTD_NAND_RICOH is not set
> >> CONFIG_MTD_NAND_DISKONCHIP=3Dm
> >> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> >> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> >> CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=3Dy
> >> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> >> CONFIG_MTD_SPI_NAND=3Dm
> >> =

> >> #
> >> # ECC engine support
> >> #
> >> CONFIG_MTD_NAND_ECC=3Dy
> >> CONFIG_MTD_NAND_ECC_SW_HAMMING=3Dy
> >> CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=3Dy
> >> CONFIG_MTD_NAND_ECC_SW_BCH=3Dy
> >> # end of ECC engine support
> >> # end of NAND
> >> =

> >> #
> >> # LPDDR & LPDDR2 PCM memory drivers
> >> #
> >> # CONFIG_MTD_LPDDR is not set
> >> # end of LPDDR & LPDDR2 PCM memory drivers
> >> =

> >> CONFIG_MTD_SPI_NOR=3Dm
> >> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> >> # CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
> >> CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=3Dy
> >> # CONFIG_MTD_SPI_NOR_SWP_KEEP is not set
> >> CONFIG_SPI_INTEL_SPI=3Dm
> >> CONFIG_SPI_INTEL_SPI_PCI=3Dm
> >> CONFIG_SPI_INTEL_SPI_PLATFORM=3Dm
> >> CONFIG_MTD_UBI=3Dm
> >> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> >> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> >> CONFIG_MTD_UBI_FASTMAP=3Dy
> >> CONFIG_MTD_UBI_GLUEBI=3Dm
> >> CONFIG_MTD_UBI_BLOCK=3Dy
> >> CONFIG_MTD_HYPERBUS=3Dm
> >> # CONFIG_OF is not set
> >> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> >> CONFIG_PARPORT=3Dm
> >> # CONFIG_PARPORT_PC is not set
> >> CONFIG_PARPORT_AX88796=3Dm
> >> # CONFIG_PARPORT_1284 is not set
> >> CONFIG_PARPORT_NOT_PC=3Dy
> >> CONFIG_PNP=3Dy
> >> # CONFIG_PNP_DEBUG_MESSAGES is not set
> >> =

> >> #
> >> # Protocols
> >> #
> >> CONFIG_PNPACPI=3Dy
> >> CONFIG_BLK_DEV=3Dy
> >> CONFIG_BLK_DEV_NULL_BLK=3Dy
> >> CONFIG_BLK_DEV_FD=3Dy
> >> CONFIG_BLK_DEV_PCIESSD_MTIP32XX=3Dm
> >> CONFIG_ZRAM=3Dy
> >> CONFIG_ZRAM_DEF_COMP_LZORLE=3Dy
> >> # CONFIG_ZRAM_DEF_COMP_LZ4 is not set
> >> # CONFIG_ZRAM_DEF_COMP_LZO is not set
> >> # CONFIG_ZRAM_DEF_COMP_842 is not set
> >> CONFIG_ZRAM_DEF_COMP=3D"lzo-rle"
> >> # CONFIG_ZRAM_WRITEBACK is not set
> >> # CONFIG_ZRAM_MEMORY_TRACKING is not set
> >> CONFIG_BLK_DEV_LOOP=3Dy
> >> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> >> # CONFIG_BLK_DEV_DRBD is not set
> >> # CONFIG_BLK_DEV_NBD is not set
> >> # CONFIG_BLK_DEV_SX8 is not set
> >> # CONFIG_BLK_DEV_RAM is not set
> >> # CONFIG_ATA_OVER_ETH is not set
> >> # CONFIG_VIRTIO_BLK is not set
> >> # CONFIG_BLK_DEV_RBD is not set
> >> =

> >> #
> >> # NVME Support
> >> #
> >> CONFIG_NVME_CORE=3Dm
> >> # CONFIG_BLK_DEV_NVME is not set
> >> CONFIG_NVME_MULTIPATH=3Dy
> >> CONFIG_NVME_HWMON=3Dy
> >> CONFIG_NVME_FABRICS=3Dm
> >> CONFIG_NVME_FC=3Dm
> >> # CONFIG_NVME_TCP is not set
> >> CONFIG_NVME_TARGET=3Dm
> >> CONFIG_NVME_TARGET_PASSTHRU=3Dy
> >> CONFIG_NVME_TARGET_LOOP=3Dm
> >> CONFIG_NVME_TARGET_FC=3Dm
> >> # CONFIG_NVME_TARGET_FCLOOP is not set
> >> # CONFIG_NVME_TARGET_TCP is not set
> >> # end of NVME Support
> >> =

> >> #
> >> # Misc devices
> >> #
> >> CONFIG_SENSORS_LIS3LV02D=3Dy
> >> CONFIG_AD525X_DPOT=3Dy
> >> CONFIG_AD525X_DPOT_I2C=3Dy
> >> # CONFIG_AD525X_DPOT_SPI is not set
> >> CONFIG_DUMMY_IRQ=3Dm
> >> CONFIG_IBM_ASM=3Dm
> >> CONFIG_PHANTOM=3Dy
> >> CONFIG_TIFM_CORE=3Dm
> >> # CONFIG_TIFM_7XX1 is not set
> >> # CONFIG_ICS932S401 is not set
> >> # CONFIG_ENCLOSURE_SERVICES is not set
> >> CONFIG_CS5535_MFGPT=3Dm
> >> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
> >> # CONFIG_CS5535_CLOCK_EVENT_SRC is not set
> >> # CONFIG_HP_ILO is not set
> >> CONFIG_APDS9802ALS=3Dy
> >> CONFIG_ISL29003=3Dm
> >> CONFIG_ISL29020=3Dm
> >> CONFIG_SENSORS_TSL2550=3Dy
> >> CONFIG_SENSORS_BH1770=3Dy
> >> CONFIG_SENSORS_APDS990X=3Dy
> >> # CONFIG_HMC6352 is not set
> >> # CONFIG_DS1682 is not set
> >> # CONFIG_PCH_PHUB is not set
> >> # CONFIG_LATTICE_ECP3_CONFIG is not set
> >> CONFIG_SRAM=3Dy
> >> # CONFIG_DW_XDATA_PCIE is not set
> >> # CONFIG_PCI_ENDPOINT_TEST is not set
> >> CONFIG_XILINX_SDFEC=3Dm
> >> CONFIG_C2PORT=3Dm
> >> CONFIG_C2PORT_DURAMAR_2150=3Dm
> >> =

> >> #
> >> # EEPROM support
> >> #
> >> # CONFIG_EEPROM_AT24 is not set
> >> CONFIG_EEPROM_AT25=3Dm
> >> CONFIG_EEPROM_LEGACY=3Dy
> >> # CONFIG_EEPROM_MAX6875 is not set
> >> CONFIG_EEPROM_93CX6=3Dy
> >> CONFIG_EEPROM_93XX46=3Dm
> >> # CONFIG_EEPROM_IDT_89HPESX is not set
> >> CONFIG_EEPROM_EE1004=3Dy
> >> # end of EEPROM support
> >> =

> >> CONFIG_CB710_CORE=3Dy
> >> # CONFIG_CB710_DEBUG is not set
> >> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> >> =

> >> #
> >> # Texas Instruments shared transport line discipline
> >> #
> >> # CONFIG_TI_ST is not set
> >> # end of Texas Instruments shared transport line discipline
> >> =

> >> CONFIG_SENSORS_LIS3_I2C=3Dy
> >> CONFIG_ALTERA_STAPL=3Dm
> >> CONFIG_INTEL_MEI=3Dy
> >> CONFIG_INTEL_MEI_ME=3Dm
> >> CONFIG_INTEL_MEI_TXE=3Dy
> >> CONFIG_INTEL_MEI_HDCP=3Dm
> >> # CONFIG_INTEL_MEI_PXP is not set
> >> # CONFIG_VMWARE_VMCI is not set
> >> CONFIG_ECHO=3Dy
> >> CONFIG_MISC_ALCOR_PCI=3Dy
> >> # CONFIG_MISC_RTSX_PCI is not set
> >> # CONFIG_HABANA_AI is not set
> >> CONFIG_UACCE=3Dy
> >> # CONFIG_PVPANIC is not set
> >> # end of Misc devices
> >> =

> >> #
> >> # SCSI device support
> >> #
> >> CONFIG_SCSI_MOD=3Dy
> >> # CONFIG_RAID_ATTRS is not set
> >> CONFIG_SCSI_COMMON=3Dm
> >> # CONFIG_SCSI is not set
> >> # end of SCSI device support
> >> =

> >> # CONFIG_ATA is not set
> >> # CONFIG_MD is not set
> >> CONFIG_TARGET_CORE=3Dm
> >> CONFIG_TCM_IBLOCK=3Dm
> >> CONFIG_TCM_FILEIO=3Dm
> >> # CONFIG_TCM_USER2 is not set
> >> # CONFIG_ISCSI_TARGET is not set
> >> CONFIG_SBP_TARGET=3Dm
> >> # CONFIG_FUSION is not set
> >> =

> >> #
> >> # IEEE 1394 (FireWire) support
> >> #
> >> CONFIG_FIREWIRE=3Dm
> >> CONFIG_FIREWIRE_OHCI=3Dm
> >> # CONFIG_FIREWIRE_NET is not set
> >> CONFIG_FIREWIRE_NOSY=3Dm
> >> # end of IEEE 1394 (FireWire) support
> >> =

> >> CONFIG_MACINTOSH_DRIVERS=3Dy
> >> CONFIG_MAC_EMUMOUSEBTN=3Dy
> >> CONFIG_NETDEVICES=3Dy
> >> CONFIG_NET_CORE=3Dy
> >> # CONFIG_BONDING is not set
> >> # CONFIG_DUMMY is not set
> >> # CONFIG_WIREGUARD is not set
> >> # CONFIG_EQUALIZER is not set
> >> # CONFIG_NET_TEAM is not set
> >> # CONFIG_MACVLAN is not set
> >> # CONFIG_IPVLAN is not set
> >> # CONFIG_VXLAN is not set
> >> # CONFIG_GENEVE is not set
> >> # CONFIG_BAREUDP is not set
> >> # CONFIG_GTP is not set
> >> # CONFIG_MACSEC is not set
> >> # CONFIG_NETCONSOLE is not set
> >> # CONFIG_TUN is not set
> >> # CONFIG_TUN_VNET_CROSS_LE is not set
> >> # CONFIG_VETH is not set
> >> CONFIG_VIRTIO_NET=3Dm
> >> # CONFIG_NLMON is not set
> >> # CONFIG_MHI_NET is not set
> >> # CONFIG_ARCNET is not set
> >> CONFIG_ETHERNET=3Dy
> >> CONFIG_NET_VENDOR_3COM=3Dy
> >> # CONFIG_PCMCIA_3C574 is not set
> >> # CONFIG_PCMCIA_3C589 is not set
> >> # CONFIG_VORTEX is not set
> >> # CONFIG_TYPHOON is not set
> >> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> >> # CONFIG_ADAPTEC_STARFIRE is not set
> >> CONFIG_NET_VENDOR_AGERE=3Dy
> >> # CONFIG_ET131X is not set
> >> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> >> # CONFIG_SLICOSS is not set
> >> CONFIG_NET_VENDOR_ALTEON=3Dy
> >> # CONFIG_ACENIC is not set
> >> # CONFIG_ALTERA_TSE is not set
> >> CONFIG_NET_VENDOR_AMAZON=3Dy
> >> # CONFIG_NET_VENDOR_AMD is not set
> >> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> >> # CONFIG_AQTION is not set
> >> CONFIG_NET_VENDOR_ARC=3Dy
> >> CONFIG_NET_VENDOR_ASIX=3Dy
> >> # CONFIG_SPI_AX88796C is not set
> >> CONFIG_NET_VENDOR_ATHEROS=3Dy
> >> # CONFIG_ATL2 is not set
> >> # CONFIG_ATL1 is not set
> >> # CONFIG_ATL1E is not set
> >> # CONFIG_ATL1C is not set
> >> # CONFIG_ALX is not set
> >> CONFIG_NET_VENDOR_BROADCOM=3Dy
> >> # CONFIG_B44 is not set
> >> # CONFIG_BCMGENET is not set
> >> # CONFIG_BNX2 is not set
> >> # CONFIG_CNIC is not set
> >> # CONFIG_TIGON3 is not set
> >> # CONFIG_BNX2X is not set
> >> # CONFIG_SYSTEMPORT is not set
> >> # CONFIG_BNXT is not set
> >> CONFIG_NET_VENDOR_BROCADE=3Dy
> >> # CONFIG_BNA is not set
> >> CONFIG_NET_VENDOR_CADENCE=3Dy
> >> # CONFIG_MACB is not set
> >> CONFIG_NET_VENDOR_CAVIUM=3Dy
> >> CONFIG_NET_VENDOR_CHELSIO=3Dy
> >> # CONFIG_CHELSIO_T1 is not set
> >> # CONFIG_CHELSIO_T3 is not set
> >> # CONFIG_CHELSIO_T4 is not set
> >> # CONFIG_CHELSIO_T4VF is not set
> >> CONFIG_NET_VENDOR_CISCO=3Dy
> >> # CONFIG_ENIC is not set
> >> CONFIG_NET_VENDOR_CORTINA=3Dy
> >> # CONFIG_CX_ECAT is not set
> >> # CONFIG_DNET is not set
> >> CONFIG_NET_VENDOR_DEC=3Dy
> >> # CONFIG_NET_TULIP is not set
> >> CONFIG_NET_VENDOR_DLINK=3Dy
> >> # CONFIG_DL2K is not set
> >> # CONFIG_SUNDANCE is not set
> >> CONFIG_NET_VENDOR_EMULEX=3Dy
> >> # CONFIG_BE2NET is not set
> >> CONFIG_NET_VENDOR_ENGLEDER=3Dy
> >> # CONFIG_TSNEP is not set
> >> CONFIG_NET_VENDOR_EZCHIP=3Dy
> >> CONFIG_NET_VENDOR_FUJITSU=3Dy
> >> # CONFIG_PCMCIA_FMVJ18X is not set
> >> CONFIG_NET_VENDOR_GOOGLE=3Dy
> >> CONFIG_NET_VENDOR_HUAWEI=3Dy
> >> CONFIG_NET_VENDOR_I825XX=3Dy
> >> CONFIG_NET_VENDOR_INTEL=3Dy
> >> # CONFIG_E100 is not set
> >> CONFIG_E1000=3Dy
> >> # CONFIG_E1000E is not set
> >> # CONFIG_IGB is not set
> >> # CONFIG_IGBVF is not set
> >> # CONFIG_IXGB is not set
> >> # CONFIG_IXGBE is not set
> >> # CONFIG_I40E is not set
> >> # CONFIG_IGC is not set
> >> CONFIG_NET_VENDOR_MICROSOFT=3Dy
> >> # CONFIG_JME is not set
> >> CONFIG_NET_VENDOR_LITEX=3Dy
> >> CONFIG_NET_VENDOR_MARVELL=3Dy
> >> # CONFIG_MVMDIO is not set
> >> # CONFIG_SKGE is not set
> >> # CONFIG_SKY2 is not set
> >> CONFIG_NET_VENDOR_MELLANOX=3Dy
> >> # CONFIG_MLX4_EN is not set
> >> # CONFIG_MLX5_CORE is not set
> >> # CONFIG_MLXSW_CORE is not set
> >> # CONFIG_MLXFW is not set
> >> CONFIG_NET_VENDOR_MICREL=3Dy
> >> # CONFIG_KS8842 is not set
> >> # CONFIG_KS8851 is not set
> >> # CONFIG_KS8851_MLL is not set
> >> # CONFIG_KSZ884X_PCI is not set
> >> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> >> # CONFIG_ENC28J60 is not set
> >> # CONFIG_ENCX24J600 is not set
> >> # CONFIG_LAN743X is not set
> >> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> >> CONFIG_NET_VENDOR_MYRI=3Dy
> >> # CONFIG_MYRI10GE is not set
> >> # CONFIG_FEALNX is not set
> >> CONFIG_NET_VENDOR_NATSEMI=3Dy
> >> # CONFIG_NATSEMI is not set
> >> # CONFIG_NS83820 is not set
> >> CONFIG_NET_VENDOR_NETERION=3Dy
> >> # CONFIG_S2IO is not set
> >> # CONFIG_VXGE is not set
> >> CONFIG_NET_VENDOR_NETRONOME=3Dy
> >> CONFIG_NET_VENDOR_NI=3Dy
> >> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> >> CONFIG_NET_VENDOR_8390=3Dy
> >> # CONFIG_PCMCIA_AXNET is not set
> >> # CONFIG_NE2K_PCI is not set
> >> # CONFIG_PCMCIA_PCNET is not set
> >> CONFIG_NET_VENDOR_NVIDIA=3Dy
> >> # CONFIG_FORCEDETH is not set
> >> CONFIG_NET_VENDOR_OKI=3Dy
> >> # CONFIG_PCH_GBE is not set
> >> # CONFIG_ETHOC is not set
> >> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> >> # CONFIG_HAMACHI is not set
> >> # CONFIG_YELLOWFIN is not set
> >> CONFIG_NET_VENDOR_PENSANDO=3Dy
> >> CONFIG_NET_VENDOR_QLOGIC=3Dy
> >> # CONFIG_QLA3XXX is not set
> >> # CONFIG_QLCNIC is not set
> >> # CONFIG_NETXEN_NIC is not set
> >> # CONFIG_QED is not set
> >> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> >> # CONFIG_QCOM_EMAC is not set
> >> # CONFIG_RMNET is not set
> >> CONFIG_NET_VENDOR_RDC=3Dy
> >> # CONFIG_R6040 is not set
> >> CONFIG_NET_VENDOR_REALTEK=3Dy
> >> # CONFIG_ATP is not set
> >> # CONFIG_8139CP is not set
> >> # CONFIG_8139TOO is not set
> >> # CONFIG_R8169 is not set
> >> CONFIG_NET_VENDOR_RENESAS=3Dy
> >> CONFIG_NET_VENDOR_ROCKER=3Dy
> >> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> >> # CONFIG_SXGBE_ETH is not set
> >> CONFIG_NET_VENDOR_SEEQ=3Dy
> >> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> >> # CONFIG_SFC is not set
> >> # CONFIG_SFC_FALCON is not set
> >> CONFIG_NET_VENDOR_SILAN=3Dy
> >> # CONFIG_SC92031 is not set
> >> CONFIG_NET_VENDOR_SIS=3Dy
> >> # CONFIG_SIS900 is not set
> >> # CONFIG_SIS190 is not set
> >> CONFIG_NET_VENDOR_SMSC=3Dy
> >> # CONFIG_PCMCIA_SMC91C92 is not set
> >> # CONFIG_EPIC100 is not set
> >> # CONFIG_SMSC911X is not set
> >> # CONFIG_SMSC9420 is not set
> >> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> >> CONFIG_NET_VENDOR_STMICRO=3Dy
> >> # CONFIG_STMMAC_ETH is not set
> >> CONFIG_NET_VENDOR_SUN=3Dy
> >> # CONFIG_HAPPYMEAL is not set
> >> # CONFIG_SUNGEM is not set
> >> # CONFIG_CASSINI is not set
> >> # CONFIG_NIU is not set
> >> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> >> # CONFIG_DWC_XLGMAC is not set
> >> CONFIG_NET_VENDOR_TEHUTI=3Dy
> >> # CONFIG_TEHUTI is not set
> >> CONFIG_NET_VENDOR_TI=3Dy
> >> # CONFIG_TI_CPSW_PHY_SEL is not set
> >> # CONFIG_TLAN is not set
> >> CONFIG_NET_VENDOR_VERTEXCOM=3Dy
> >> # CONFIG_MSE102X is not set
> >> CONFIG_NET_VENDOR_VIA=3Dy
> >> # CONFIG_VIA_RHINE is not set
> >> # CONFIG_VIA_VELOCITY is not set
> >> CONFIG_NET_VENDOR_WIZNET=3Dy
> >> # CONFIG_WIZNET_W5100 is not set
> >> # CONFIG_WIZNET_W5300 is not set
> >> CONFIG_NET_VENDOR_XILINX=3Dy
> >> # CONFIG_XILINX_EMACLITE is not set
> >> # CONFIG_XILINX_AXI_EMAC is not set
> >> # CONFIG_XILINX_LL_TEMAC is not set
> >> CONFIG_NET_VENDOR_XIRCOM=3Dy
> >> # CONFIG_PCMCIA_XIRC2PS is not set
> >> # CONFIG_FDDI is not set
> >> # CONFIG_HIPPI is not set
> >> # CONFIG_NET_SB1000 is not set
> >> # CONFIG_PHYLIB is not set
> >> # CONFIG_MICREL_KS8995MA is not set
> >> # CONFIG_MDIO_DEVICE is not set
> >> =

> >> #
> >> # PCS device drivers
> >> #
> >> # end of PCS device drivers
> >> =

> >> # CONFIG_PLIP is not set
> >> # CONFIG_PPP is not set
> >> # CONFIG_SLIP is not set
> >> =

> >> #
> >> # Host-side USB support is needed for USB Network Adapter support
> >> #
> >> CONFIG_WLAN=3Dy
> >> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> >> CONFIG_WLAN_VENDOR_ATH=3Dy
> >> # CONFIG_ATH_DEBUG is not set
> >> # CONFIG_ATH5K_PCI is not set
> >> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> >> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> >> CONFIG_WLAN_VENDOR_CISCO=3Dy
> >> CONFIG_WLAN_VENDOR_INTEL=3Dy
> >> # CONFIG_IWLMEI is not set
> >> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> >> # CONFIG_HOSTAP is not set
> >> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> >> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> >> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> >> CONFIG_WLAN_VENDOR_RALINK=3Dy
> >> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> >> CONFIG_WLAN_VENDOR_RSI=3Dy
> >> CONFIG_WLAN_VENDOR_ST=3Dy
> >> CONFIG_WLAN_VENDOR_TI=3Dy
> >> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> >> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> >> # CONFIG_PCMCIA_RAYCS is not set
> >> # CONFIG_WAN is not set
> >> =

> >> #
> >> # Wireless WAN
> >> #
> >> # CONFIG_WWAN is not set
> >> # end of Wireless WAN
> >> =

> >> # CONFIG_VMXNET3 is not set
> >> # CONFIG_FUJITSU_ES is not set
> >> # CONFIG_USB4_NET is not set
> >> # CONFIG_NETDEVSIM is not set
> >> CONFIG_NET_FAILOVER=3Dm
> >> # CONFIG_ISDN is not set
> >> =

> >> #
> >> # Input device support
> >> #
> >> CONFIG_INPUT=3Dy
> >> CONFIG_INPUT_LEDS=3Dy
> >> CONFIG_INPUT_FF_MEMLESS=3Dy
> >> CONFIG_INPUT_SPARSEKMAP=3Dy
> >> # CONFIG_INPUT_MATRIXKMAP is not set
> >> =

> >> #
> >> # Userland interfaces
> >> #
> >> CONFIG_INPUT_MOUSEDEV=3Dy
> >> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> >> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> >> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> >> CONFIG_INPUT_JOYDEV=3Dy
> >> CONFIG_INPUT_EVDEV=3Dy
> >> CONFIG_INPUT_EVBUG=3Dy
> >> =

> >> #
> >> # Input Device Drivers
> >> #
> >> CONFIG_INPUT_KEYBOARD=3Dy
> >> # CONFIG_KEYBOARD_ADC is not set
> >> # CONFIG_KEYBOARD_ADP5588 is not set
> >> # CONFIG_KEYBOARD_ADP5589 is not set
> >> CONFIG_KEYBOARD_ATKBD=3Dy
> >> # CONFIG_KEYBOARD_QT1050 is not set
> >> # CONFIG_KEYBOARD_QT1070 is not set
> >> # CONFIG_KEYBOARD_QT2160 is not set
> >> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> >> # CONFIG_KEYBOARD_LKKBD is not set
> >> # CONFIG_KEYBOARD_GPIO is not set
> >> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> >> # CONFIG_KEYBOARD_TCA6416 is not set
> >> # CONFIG_KEYBOARD_TCA8418 is not set
> >> # CONFIG_KEYBOARD_MATRIX is not set
> >> # CONFIG_KEYBOARD_LM8323 is not set
> >> # CONFIG_KEYBOARD_LM8333 is not set
> >> # CONFIG_KEYBOARD_MAX7359 is not set
> >> # CONFIG_KEYBOARD_MCS is not set
> >> # CONFIG_KEYBOARD_MPR121 is not set
> >> # CONFIG_KEYBOARD_NEWTON is not set
> >> # CONFIG_KEYBOARD_OPENCORES is not set
> >> # CONFIG_KEYBOARD_SAMSUNG is not set
> >> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> >> # CONFIG_KEYBOARD_STOWAWAY is not set
> >> # CONFIG_KEYBOARD_SUNKBD is not set
> >> # CONFIG_KEYBOARD_IQS62X is not set
> >> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> >> # CONFIG_KEYBOARD_XTKBD is not set
> >> # CONFIG_KEYBOARD_CROS_EC is not set
> >> # CONFIG_KEYBOARD_MTK_PMIC is not set
> >> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> >> CONFIG_INPUT_MOUSE=3Dy
> >> CONFIG_MOUSE_PS2=3Dm
> >> CONFIG_MOUSE_PS2_ALPS=3Dy
> >> CONFIG_MOUSE_PS2_BYD=3Dy
> >> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> >> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> >> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> >> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> >> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> >> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> >> CONFIG_MOUSE_PS2_ELANTECH=3Dy
> >> CONFIG_MOUSE_PS2_ELANTECH_SMBUS=3Dy
> >> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> >> CONFIG_MOUSE_PS2_TOUCHKIT=3Dy
> >> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> >> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> >> CONFIG_MOUSE_PS2_SMBUS=3Dy
> >> # CONFIG_MOUSE_SERIAL is not set
> >> # CONFIG_MOUSE_APPLETOUCH is not set
> >> # CONFIG_MOUSE_BCM5974 is not set
> >> # CONFIG_MOUSE_CYAPA is not set
> >> CONFIG_MOUSE_ELAN_I2C=3Dm
> >> # CONFIG_MOUSE_ELAN_I2C_I2C is not set
> >> # CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
> >> # CONFIG_MOUSE_VSXXXAA is not set
> >> CONFIG_MOUSE_GPIO=3Dy
> >> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> >> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> >> # CONFIG_INPUT_JOYSTICK is not set
> >> CONFIG_INPUT_TABLET=3Dy
> >> # CONFIG_TABLET_USB_ACECAD is not set
> >> # CONFIG_TABLET_USB_AIPTEK is not set
> >> # CONFIG_TABLET_USB_HANWANG is not set
> >> # CONFIG_TABLET_USB_KBTAB is not set
> >> # CONFIG_TABLET_USB_PEGASUS is not set
> >> CONFIG_TABLET_SERIAL_WACOM4=3Dy
> >> # CONFIG_INPUT_TOUCHSCREEN is not set
> >> CONFIG_INPUT_MISC=3Dy
> >> CONFIG_INPUT_88PM860X_ONKEY=3Dm
> >> CONFIG_INPUT_AD714X=3Dm
> >> CONFIG_INPUT_AD714X_I2C=3Dm
> >> CONFIG_INPUT_AD714X_SPI=3Dm
> >> CONFIG_INPUT_BMA150=3Dm
> >> # CONFIG_INPUT_E3X0_BUTTON is not set
> >> # CONFIG_INPUT_PCSPKR is not set
> >> CONFIG_INPUT_MC13783_PWRBUTTON=3Dy
> >> CONFIG_INPUT_MMA8450=3Dm
> >> CONFIG_INPUT_APANEL=3Dy
> >> CONFIG_INPUT_GPIO_BEEPER=3Dm
> >> CONFIG_INPUT_GPIO_DECODER=3Dm
> >> CONFIG_INPUT_GPIO_VIBRA=3Dy
> >> CONFIG_INPUT_WISTRON_BTNS=3Dm
> >> # CONFIG_INPUT_ATLAS_BTNS is not set
> >> # CONFIG_INPUT_ATI_REMOTE2 is not set
> >> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> >> # CONFIG_INPUT_KXTJ9 is not set
> >> # CONFIG_INPUT_POWERMATE is not set
> >> # CONFIG_INPUT_YEALINK is not set
> >> # CONFIG_INPUT_CM109 is not set
> >> # CONFIG_INPUT_REGULATOR_HAPTIC is not set
> >> # CONFIG_INPUT_AXP20X_PEK is not set
> >> CONFIG_INPUT_UINPUT=3Dy
> >> # CONFIG_INPUT_PCF50633_PMU is not set
> >> # CONFIG_INPUT_PCF8574 is not set
> >> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dm
> >> CONFIG_INPUT_DA7280_HAPTICS=3Dy
> >> CONFIG_INPUT_DA9052_ONKEY=3Dm
> >> # CONFIG_INPUT_DA9063_ONKEY is not set
> >> CONFIG_INPUT_WM831X_ON=3Dy
> >> # CONFIG_INPUT_ADXL34X is not set
> >> # CONFIG_INPUT_IQS269A is not set
> >> CONFIG_INPUT_IQS626A=3Dy
> >> CONFIG_INPUT_CMA3000=3Dm
> >> CONFIG_INPUT_CMA3000_I2C=3Dm
> >> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dm
> >> CONFIG_INPUT_DRV260X_HAPTICS=3Dm
> >> CONFIG_INPUT_DRV2665_HAPTICS=3Dy
> >> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
> >> CONFIG_INPUT_RAVE_SP_PWRBUTTON=3Dm
> >> CONFIG_RMI4_CORE=3Dy
> >> # CONFIG_RMI4_I2C is not set
> >> # CONFIG_RMI4_SPI is not set
> >> CONFIG_RMI4_SMB=3Dy
> >> CONFIG_RMI4_F03=3Dy
> >> CONFIG_RMI4_F03_SERIO=3Dy
> >> CONFIG_RMI4_2D_SENSOR=3Dy
> >> CONFIG_RMI4_F11=3Dy
> >> CONFIG_RMI4_F12=3Dy
> >> CONFIG_RMI4_F30=3Dy
> >> CONFIG_RMI4_F34=3Dy
> >> CONFIG_RMI4_F3A=3Dy
> >> # CONFIG_RMI4_F55 is not set
> >> =

> >> #
> >> # Hardware I/O ports
> >> #
> >> CONFIG_SERIO=3Dy
> >> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> >> CONFIG_SERIO_I8042=3Dy
> >> CONFIG_SERIO_SERPORT=3Dy
> >> # CONFIG_SERIO_CT82C710 is not set
> >> CONFIG_SERIO_PARKBD=3Dm
> >> CONFIG_SERIO_PCIPS2=3Dm
> >> CONFIG_SERIO_LIBPS2=3Dy
> >> # CONFIG_SERIO_RAW is not set
> >> CONFIG_SERIO_ALTERA_PS2=3Dm
> >> # CONFIG_SERIO_PS2MULT is not set
> >> CONFIG_SERIO_ARC_PS2=3Dy
> >> CONFIG_SERIO_GPIO_PS2=3Dy
> >> CONFIG_USERIO=3Dy
> >> # CONFIG_GAMEPORT is not set
> >> # end of Hardware I/O ports
> >> # end of Input device support
> >> =

> >> #
> >> # Character devices
> >> #
> >> CONFIG_TTY=3Dy
> >> CONFIG_VT=3Dy
> >> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> >> CONFIG_VT_CONSOLE=3Dy
> >> CONFIG_HW_CONSOLE=3Dy
> >> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> >> CONFIG_UNIX98_PTYS=3Dy
> >> CONFIG_LEGACY_PTYS=3Dy
> >> CONFIG_LEGACY_PTY_COUNT=3D256
> >> # CONFIG_LDISC_AUTOLOAD is not set
> >> =

> >> #
> >> # Serial drivers
> >> #
> >> CONFIG_SERIAL_EARLYCON=3Dy
> >> CONFIG_SERIAL_8250=3Dy
> >> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> >> CONFIG_SERIAL_8250_PNP=3Dy
> >> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> >> # CONFIG_SERIAL_8250_FINTEK is not set
> >> CONFIG_SERIAL_8250_CONSOLE=3Dy
> >> CONFIG_SERIAL_8250_DMA=3Dy
> >> CONFIG_SERIAL_8250_PCI=3Dy
> >> CONFIG_SERIAL_8250_EXAR=3Dy
> >> CONFIG_SERIAL_8250_CS=3Dm
> >> CONFIG_SERIAL_8250_MEN_MCB=3Dm
> >> CONFIG_SERIAL_8250_NR_UARTS=3D4
> >> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> >> CONFIG_SERIAL_8250_EXTENDED=3Dy
> >> # CONFIG_SERIAL_8250_MANY_PORTS is not set
> >> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> >> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> >> # CONFIG_SERIAL_8250_RSA is not set
> >> CONFIG_SERIAL_8250_DWLIB=3Dy
> >> CONFIG_SERIAL_8250_DW=3Dm
> >> # CONFIG_SERIAL_8250_RT288X is not set
> >> # CONFIG_SERIAL_8250_LPSS is not set
> >> CONFIG_SERIAL_8250_MID=3Dy
> >> # CONFIG_SERIAL_8250_PERICOM is not set
> >> =

> >> #
> >> # Non-8250 serial port support
> >> #
> >> CONFIG_SERIAL_MAX3100=3Dm
> >> CONFIG_SERIAL_MAX310X=3Dm
> >> CONFIG_SERIAL_UARTLITE=3Dy
> >> CONFIG_SERIAL_UARTLITE_CONSOLE=3Dy
> >> CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
> >> CONFIG_SERIAL_CORE=3Dy
> >> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> >> # CONFIG_SERIAL_JSM is not set
> >> CONFIG_SERIAL_LANTIQ=3Dm
> >> CONFIG_SERIAL_SCCNXP=3Dy
> >> CONFIG_SERIAL_SCCNXP_CONSOLE=3Dy
> >> CONFIG_SERIAL_SC16IS7XX_CORE=3Dm
> >> CONFIG_SERIAL_SC16IS7XX=3Dm
> >> # CONFIG_SERIAL_SC16IS7XX_I2C is not set
> >> CONFIG_SERIAL_SC16IS7XX_SPI=3Dy
> >> CONFIG_SERIAL_TIMBERDALE=3Dy
> >> # CONFIG_SERIAL_BCM63XX is not set
> >> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> >> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> >> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=3Dy
> >> # CONFIG_SERIAL_ALTERA_UART is not set
> >> CONFIG_SERIAL_PCH_UART=3Dm
> >> CONFIG_SERIAL_ARC=3Dy
> >> CONFIG_SERIAL_ARC_CONSOLE=3Dy
> >> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> >> # CONFIG_SERIAL_RP2 is not set
> >> # CONFIG_SERIAL_FSL_LPUART is not set
> >> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> >> CONFIG_SERIAL_MEN_Z135=3Dy
> >> # CONFIG_SERIAL_SPRD is not set
> >> # end of Serial drivers
> >> =

> >> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> >> # CONFIG_SERIAL_NONSTANDARD is not set
> >> CONFIG_GOLDFISH_TTY=3Dy
> >> CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=3Dy
> >> # CONFIG_N_GSM is not set
> >> CONFIG_NOZOMI=3Dy
> >> # CONFIG_NULL_TTY is not set
> >> CONFIG_RPMSG_TTY=3Dy
> >> CONFIG_SERIAL_DEV_BUS=3Dy
> >> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> >> # CONFIG_PRINTER is not set
> >> CONFIG_PPDEV=3Dm
> >> # CONFIG_VIRTIO_CONSOLE is not set
> >> CONFIG_IPMI_HANDLER=3Dy
> >> CONFIG_IPMI_DMI_DECODE=3Dy
> >> CONFIG_IPMI_PLAT_DATA=3Dy
> >> # CONFIG_IPMI_PANIC_EVENT is not set
> >> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> >> CONFIG_IPMI_SI=3Dy
> >> CONFIG_IPMI_SSIF=3Dy
> >> CONFIG_IPMI_IPMB=3Dy
> >> # CONFIG_IPMI_WATCHDOG is not set
> >> CONFIG_IPMI_POWEROFF=3Dm
> >> CONFIG_IPMB_DEVICE_INTERFACE=3Dm
> >> # CONFIG_HW_RANDOM is not set
> >> # CONFIG_APPLICOM is not set
> >> CONFIG_SONYPI=3Dy
> >> =

> >> #
> >> # PCMCIA character devices
> >> #
> >> CONFIG_SYNCLINK_CS=3Dm
> >> # CONFIG_CARDMAN_4000 is not set
> >> CONFIG_CARDMAN_4040=3Dm
> >> # CONFIG_SCR24X is not set
> >> # CONFIG_IPWIRELESS is not set
> >> # end of PCMCIA character devices
> >> =

> >> CONFIG_MWAVE=3Dy
> >> # CONFIG_PC8736x_GPIO is not set
> >> # CONFIG_NSC_GPIO is not set
> >> CONFIG_DEVMEM=3Dy
> >> CONFIG_NVRAM=3Dy
> >> CONFIG_DEVPORT=3Dy
> >> # CONFIG_HPET is not set
> >> CONFIG_HANGCHECK_TIMER=3Dm
> >> CONFIG_TCG_TPM=3Dy
> >> CONFIG_TCG_TIS_CORE=3Dm
> >> # CONFIG_TCG_TIS is not set
> >> CONFIG_TCG_TIS_SPI=3Dm
> >> # CONFIG_TCG_TIS_SPI_CR50 is not set
> >> CONFIG_TCG_TIS_I2C_CR50=3Dm
> >> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> >> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> >> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> >> # CONFIG_TCG_NSC is not set
> >> CONFIG_TCG_ATMEL=3Dy
> >> CONFIG_TCG_INFINEON=3Dm
> >> # CONFIG_TCG_CRB is not set
> >> CONFIG_TCG_VTPM_PROXY=3Dy
> >> CONFIG_TCG_TIS_ST33ZP24=3Dm
> >> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> >> # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> >> CONFIG_TELCLOCK=3Dy
> >> # CONFIG_XILLYBUS is not set
> >> CONFIG_RANDOM_TRUST_CPU=3Dy
> >> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> >> # end of Character devices
> >> =

> >> #
> >> # I2C support
> >> #
> >> CONFIG_I2C=3Dy
> >> CONFIG_ACPI_I2C_OPREGION=3Dy
> >> CONFIG_I2C_BOARDINFO=3Dy
> >> # CONFIG_I2C_COMPAT is not set
> >> CONFIG_I2C_CHARDEV=3Dm
> >> CONFIG_I2C_MUX=3Dm
> >> =

> >> #
> >> # Multiplexer I2C Chip support
> >> #
> >> # CONFIG_I2C_MUX_GPIO is not set
> >> # CONFIG_I2C_MUX_LTC4306 is not set
> >> CONFIG_I2C_MUX_PCA9541=3Dm
> >> CONFIG_I2C_MUX_PCA954x=3Dm
> >> # CONFIG_I2C_MUX_REG is not set
> >> CONFIG_I2C_MUX_MLXCPLD=3Dm
> >> # end of Multiplexer I2C Chip support
> >> =

> >> CONFIG_I2C_HELPER_AUTO=3Dy
> >> CONFIG_I2C_SMBUS=3Dm
> >> CONFIG_I2C_ALGOBIT=3Dy
> >> CONFIG_I2C_ALGOPCA=3Dy
> >> =

> >> #
> >> # I2C Hardware Bus support
> >> #
> >> =

> >> #
> >> # PC SMBus host controller drivers
> >> #
> >> # CONFIG_I2C_ALI1535 is not set
> >> CONFIG_I2C_ALI1563=3Dm
> >> CONFIG_I2C_ALI15X3=3Dy
> >> # CONFIG_I2C_AMD756 is not set
> >> # CONFIG_I2C_AMD8111 is not set
> >> # CONFIG_I2C_AMD_MP2 is not set
> >> # CONFIG_I2C_I801 is not set
> >> CONFIG_I2C_ISCH=3Dm
> >> # CONFIG_I2C_ISMT is not set
> >> CONFIG_I2C_PIIX4=3Dm
> >> CONFIG_I2C_NFORCE2=3Dm
> >> CONFIG_I2C_NFORCE2_S4985=3Dm
> >> # CONFIG_I2C_NVIDIA_GPU is not set
> >> # CONFIG_I2C_SIS5595 is not set
> >> CONFIG_I2C_SIS630=3Dm
> >> # CONFIG_I2C_SIS96X is not set
> >> CONFIG_I2C_VIA=3Dm
> >> CONFIG_I2C_VIAPRO=3Dy
> >> =

> >> #
> >> # ACPI drivers
> >> #
> >> CONFIG_I2C_SCMI=3Dm
> >> =

> >> #
> >> # I2C system bus drivers (mostly embedded / system-on-chip)
> >> #
> >> CONFIG_I2C_CBUS_GPIO=3Dy
> >> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> >> CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
> >> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> >> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
> >> # CONFIG_I2C_DESIGNWARE_PCI is not set
> >> CONFIG_I2C_EG20T=3Dm
> >> CONFIG_I2C_EMEV2=3Dy
> >> # CONFIG_I2C_GPIO is not set
> >> # CONFIG_I2C_KEMPLD is not set
> >> # CONFIG_I2C_OCORES is not set
> >> CONFIG_I2C_PCA_PLATFORM=3Dy
> >> # CONFIG_I2C_SIMTEC is not set
> >> CONFIG_I2C_XILINX=3Dm
> >> =

> >> #
> >> # External I2C/SMBus adapter drivers
> >> #
> >> CONFIG_I2C_PARPORT=3Dm
> >> CONFIG_I2C_TAOS_EVM=3Dy
> >> =

> >> #
> >> # Other I2C/SMBus bus drivers
> >> #
> >> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> >> # CONFIG_SCx200_ACB is not set
> >> # CONFIG_I2C_VIRTIO is not set
> >> # end of I2C Hardware Bus support
> >> =

> >> CONFIG_I2C_STUB=3Dm
> >> CONFIG_I2C_SLAVE=3Dy
> >> # CONFIG_I2C_SLAVE_EEPROM is not set
> >> CONFIG_I2C_SLAVE_TESTUNIT=3Dy
> >> # CONFIG_I2C_DEBUG_CORE is not set
> >> # CONFIG_I2C_DEBUG_ALGO is not set
> >> # CONFIG_I2C_DEBUG_BUS is not set
> >> # end of I2C support
> >> =

> >> CONFIG_I3C=3Dy
> >> CONFIG_CDNS_I3C_MASTER=3Dm
> >> CONFIG_DW_I3C_MASTER=3Dy
> >> CONFIG_SVC_I3C_MASTER=3Dy
> >> CONFIG_MIPI_I3C_HCI=3Dm
> >> CONFIG_SPI=3Dy
> >> CONFIG_SPI_DEBUG=3Dy
> >> CONFIG_SPI_MASTER=3Dy
> >> CONFIG_SPI_MEM=3Dy
> >> =

> >> #
> >> # SPI Master Controller Drivers
> >> #
> >> CONFIG_SPI_ALTERA=3Dm
> >> CONFIG_SPI_ALTERA_CORE=3Dm
> >> CONFIG_SPI_ALTERA_DFL=3Dm
> >> CONFIG_SPI_AXI_SPI_ENGINE=3Dm
> >> CONFIG_SPI_BITBANG=3Dy
> >> CONFIG_SPI_BUTTERFLY=3Dm
> >> # CONFIG_SPI_CADENCE is not set
> >> # CONFIG_SPI_DESIGNWARE is not set
> >> CONFIG_SPI_NXP_FLEXSPI=3Dy
> >> CONFIG_SPI_GPIO=3Dy
> >> CONFIG_SPI_LM70_LLP=3Dm
> >> CONFIG_SPI_LANTIQ_SSC=3Dy
> >> # CONFIG_SPI_OC_TINY is not set
> >> # CONFIG_SPI_PXA2XX is not set
> >> CONFIG_SPI_ROCKCHIP=3Dy
> >> # CONFIG_SPI_SC18IS602 is not set
> >> CONFIG_SPI_SIFIVE=3Dy
> >> # CONFIG_SPI_MXIC is not set
> >> # CONFIG_SPI_TOPCLIFF_PCH is not set
> >> # CONFIG_SPI_XCOMM is not set
> >> # CONFIG_SPI_XILINX is not set
> >> # CONFIG_SPI_ZYNQMP_GQSPI is not set
> >> # CONFIG_SPI_AMD is not set
> >> =

> >> #
> >> # SPI Multiplexer support
> >> #
> >> CONFIG_SPI_MUX=3Dm
> >> =

> >> #
> >> # SPI Protocol Masters
> >> #
> >> # CONFIG_SPI_SPIDEV is not set
> >> # CONFIG_SPI_LOOPBACK_TEST is not set
> >> # CONFIG_SPI_TLE62X0 is not set
> >> # CONFIG_SPI_SLAVE is not set
> >> CONFIG_SPI_DYNAMIC=3Dy
> >> # CONFIG_SPMI is not set
> >> # CONFIG_HSI is not set
> >> CONFIG_PPS=3Dy
> >> # CONFIG_PPS_DEBUG is not set
> >> # CONFIG_NTP_PPS is not set
> >> =

> >> #
> >> # PPS clients support
> >> #
> >> CONFIG_PPS_CLIENT_KTIMER=3Dm
> >> CONFIG_PPS_CLIENT_LDISC=3Dy
> >> CONFIG_PPS_CLIENT_PARPORT=3Dm
> >> CONFIG_PPS_CLIENT_GPIO=3Dy
> >> =

> >> #
> >> # PPS generators support
> >> #
> >> =

> >> #
> >> # PTP clock support
> >> #
> >> CONFIG_PTP_1588_CLOCK=3Dy
> >> CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> >> =

> >> #
> >> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clo=
cks.
> >> #
> >> # CONFIG_PTP_1588_CLOCK_PCH is not set
> >> CONFIG_PTP_1588_CLOCK_KVM=3Dy
> >> # CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
> >> # CONFIG_PTP_1588_CLOCK_IDTCM is not set
> >> # CONFIG_PTP_1588_CLOCK_VMW is not set
> >> # CONFIG_PTP_1588_CLOCK_OCP is not set
> >> # end of PTP clock support
> >> =

> >> CONFIG_PINCTRL=3Dy
> >> CONFIG_PINMUX=3Dy
> >> CONFIG_PINCONF=3Dy
> >> CONFIG_GENERIC_PINCONF=3Dy
> >> CONFIG_DEBUG_PINCTRL=3Dy
> >> # CONFIG_PINCTRL_AMD is not set
> >> CONFIG_PINCTRL_DA9062=3Dy
> >> # CONFIG_PINCTRL_MCP23S08 is not set
> >> # CONFIG_PINCTRL_SX150X is not set
> >> CONFIG_PINCTRL_MADERA=3Dm
> >> CONFIG_PINCTRL_CS47L15=3Dy
> >> CONFIG_PINCTRL_CS47L35=3Dy
> >> CONFIG_PINCTRL_CS47L85=3Dy
> >> CONFIG_PINCTRL_CS47L90=3Dy
> >> CONFIG_PINCTRL_CS47L92=3Dy
> >> =

> >> #
> >> # Intel pinctrl drivers
> >> #
> >> # CONFIG_PINCTRL_BAYTRAIL is not set
> >> CONFIG_PINCTRL_CHERRYVIEW=3Dm
> >> CONFIG_PINCTRL_LYNXPOINT=3Dm
> >> CONFIG_PINCTRL_INTEL=3Dy
> >> CONFIG_PINCTRL_ALDERLAKE=3Dm
> >> # CONFIG_PINCTRL_BROXTON is not set
> >> CONFIG_PINCTRL_CANNONLAKE=3Dy
> >> CONFIG_PINCTRL_CEDARFORK=3Dy
> >> # CONFIG_PINCTRL_DENVERTON is not set
> >> CONFIG_PINCTRL_ELKHARTLAKE=3Dm
> >> # CONFIG_PINCTRL_EMMITSBURG is not set
> >> CONFIG_PINCTRL_GEMINILAKE=3Dm
> >> # CONFIG_PINCTRL_ICELAKE is not set
> >> CONFIG_PINCTRL_JASPERLAKE=3Dy
> >> # CONFIG_PINCTRL_LAKEFIELD is not set
> >> CONFIG_PINCTRL_LEWISBURG=3Dm
> >> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> >> CONFIG_PINCTRL_TIGERLAKE=3Dm
> >> # end of Intel pinctrl drivers
> >> =

> >> #
> >> # Renesas pinctrl drivers
> >> #
> >> # end of Renesas pinctrl drivers
> >> =

> >> CONFIG_GPIOLIB=3Dy
> >> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> >> CONFIG_GPIO_ACPI=3Dy
> >> CONFIG_GPIOLIB_IRQCHIP=3Dy
> >> CONFIG_DEBUG_GPIO=3Dy
> >> CONFIG_GPIO_CDEV=3Dy
> >> # CONFIG_GPIO_CDEV_V1 is not set
> >> CONFIG_GPIO_GENERIC=3Dm
> >> CONFIG_GPIO_MAX730X=3Dy
> >> =

> >> #
> >> # Memory mapped GPIO drivers
> >> #
> >> # CONFIG_GPIO_AMDPT is not set
> >> CONFIG_GPIO_DWAPB=3Dm
> >> CONFIG_GPIO_EXAR=3Dm
> >> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> >> # CONFIG_GPIO_ICH is not set
> >> CONFIG_GPIO_MB86S7X=3Dy
> >> CONFIG_GPIO_MENZ127=3Dm
> >> # CONFIG_GPIO_VX855 is not set
> >> CONFIG_GPIO_AMD_FCH=3Dy
> >> # end of Memory mapped GPIO drivers
> >> =

> >> #
> >> # Port-mapped I/O GPIO drivers
> >> #
> >> # CONFIG_GPIO_F7188X is not set
> >> # CONFIG_GPIO_IT87 is not set
> >> CONFIG_GPIO_SCH=3Dm
> >> CONFIG_GPIO_SCH311X=3Dy
> >> CONFIG_GPIO_WINBOND=3Dy
> >> CONFIG_GPIO_WS16C48=3Dm
> >> # end of Port-mapped I/O GPIO drivers
> >> =

> >> #
> >> # I2C GPIO expanders
> >> #
> >> CONFIG_GPIO_ADP5588=3Dm
> >> CONFIG_GPIO_MAX7300=3Dy
> >> CONFIG_GPIO_MAX732X=3Dm
> >> CONFIG_GPIO_PCA953X=3Dm
> >> # CONFIG_GPIO_PCA953X_IRQ is not set
> >> CONFIG_GPIO_PCA9570=3Dy
> >> CONFIG_GPIO_PCF857X=3Dy
> >> CONFIG_GPIO_TPIC2810=3Dy
> >> # end of I2C GPIO expanders
> >> =

> >> #
> >> # MFD GPIO expanders
> >> #
> >> CONFIG_GPIO_ARIZONA=3Dy
> >> CONFIG_GPIO_CRYSTAL_COVE=3Dm
> >> # CONFIG_GPIO_CS5535 is not set
> >> # CONFIG_GPIO_DA9052 is not set
> >> CONFIG_GPIO_JANZ_TTL=3Dy
> >> CONFIG_GPIO_KEMPLD=3Dm
> >> # CONFIG_GPIO_MADERA is not set
> >> CONFIG_GPIO_TIMBERDALE=3Dy
> >> CONFIG_GPIO_TPS6586X=3Dy
> >> CONFIG_GPIO_TPS65912=3Dy
> >> # CONFIG_GPIO_TQMX86 is not set
> >> CONFIG_GPIO_WM831X=3Dy
> >> # CONFIG_GPIO_WM8994 is not set
> >> # end of MFD GPIO expanders
> >> =

> >> #
> >> # PCI GPIO expanders
> >> #
> >> CONFIG_GPIO_AMD8111=3Dm
> >> CONFIG_GPIO_BT8XX=3Dm
> >> # CONFIG_GPIO_ML_IOH is not set
> >> CONFIG_GPIO_PCH=3Dy
> >> CONFIG_GPIO_PCI_IDIO_16=3Dm
> >> CONFIG_GPIO_PCIE_IDIO_24=3Dy
> >> CONFIG_GPIO_RDC321X=3Dm
> >> # end of PCI GPIO expanders
> >> =

> >> #
> >> # SPI GPIO expanders
> >> #
> >> CONFIG_GPIO_MAX3191X=3Dy
> >> # CONFIG_GPIO_MAX7301 is not set
> >> CONFIG_GPIO_MC33880=3Dy
> >> CONFIG_GPIO_PISOSR=3Dy
> >> CONFIG_GPIO_XRA1403=3Dm
> >> # end of SPI GPIO expanders
> >> =

> >> #
> >> # Virtual GPIO drivers
> >> #
> >> # CONFIG_GPIO_AGGREGATOR is not set
> >> CONFIG_GPIO_MOCKUP=3Dm
> >> CONFIG_GPIO_VIRTIO=3Dy
> >> CONFIG_GPIO_SIM=3Dm
> >> # end of Virtual GPIO drivers
> >> =

> >> CONFIG_W1=3Dy
> >> =

> >> #
> >> # 1-wire Bus Masters
> >> #
> >> CONFIG_W1_MASTER_MATROX=3Dy
> >> # CONFIG_W1_MASTER_DS2482 is not set
> >> # CONFIG_W1_MASTER_DS1WM is not set
> >> CONFIG_W1_MASTER_GPIO=3Dy
> >> # CONFIG_W1_MASTER_SGI is not set
> >> # end of 1-wire Bus Masters
> >> =

> >> #
> >> # 1-wire Slaves
> >> #
> >> # CONFIG_W1_SLAVE_THERM is not set
> >> CONFIG_W1_SLAVE_SMEM=3Dy
> >> # CONFIG_W1_SLAVE_DS2405 is not set
> >> CONFIG_W1_SLAVE_DS2408=3Dy
> >> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> >> CONFIG_W1_SLAVE_DS2413=3Dm
> >> # CONFIG_W1_SLAVE_DS2406 is not set
> >> CONFIG_W1_SLAVE_DS2423=3Dm
> >> CONFIG_W1_SLAVE_DS2805=3Dy
> >> # CONFIG_W1_SLAVE_DS2430 is not set
> >> CONFIG_W1_SLAVE_DS2431=3Dm
> >> CONFIG_W1_SLAVE_DS2433=3Dy
> >> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> >> # CONFIG_W1_SLAVE_DS2438 is not set
> >> CONFIG_W1_SLAVE_DS250X=3Dy
> >> CONFIG_W1_SLAVE_DS2780=3Dm
> >> CONFIG_W1_SLAVE_DS2781=3Dm
> >> # CONFIG_W1_SLAVE_DS28E04 is not set
> >> CONFIG_W1_SLAVE_DS28E17=3Dm
> >> # end of 1-wire Slaves
> >> =

> >> CONFIG_POWER_RESET=3Dy
> >> # CONFIG_POWER_RESET_MT6323 is not set
> >> CONFIG_POWER_RESET_RESTART=3Dy
> >> CONFIG_POWER_SUPPLY=3Dy
> >> # CONFIG_POWER_SUPPLY_DEBUG is not set
> >> # CONFIG_POWER_SUPPLY_HWMON is not set
> >> CONFIG_PDA_POWER=3Dy
> >> # CONFIG_GENERIC_ADC_BATTERY is not set
> >> CONFIG_WM831X_BACKUP=3Dy
> >> CONFIG_WM831X_POWER=3Dy
> >> # CONFIG_TEST_POWER is not set
> >> # CONFIG_BATTERY_88PM860X is not set
> >> CONFIG_CHARGER_ADP5061=3Dy
> >> CONFIG_BATTERY_CW2015=3Dy
> >> CONFIG_BATTERY_DS2760=3Dm
> >> # CONFIG_BATTERY_DS2780 is not set
> >> CONFIG_BATTERY_DS2781=3Dm
> >> CONFIG_BATTERY_DS2782=3Dm
> >> CONFIG_BATTERY_SBS=3Dm
> >> CONFIG_CHARGER_SBS=3Dy
> >> CONFIG_MANAGER_SBS=3Dm
> >> CONFIG_BATTERY_BQ27XXX=3Dm
> >> # CONFIG_BATTERY_BQ27XXX_I2C is not set
> >> CONFIG_BATTERY_BQ27XXX_HDQ=3Dm
> >> CONFIG_BATTERY_DA9052=3Dm
> >> # CONFIG_BATTERY_DA9150 is not set
> >> # CONFIG_CHARGER_AXP20X is not set
> >> CONFIG_BATTERY_AXP20X=3Dm
> >> # CONFIG_AXP20X_POWER is not set
> >> CONFIG_AXP288_FUEL_GAUGE=3Dm
> >> CONFIG_BATTERY_MAX17040=3Dy
> >> CONFIG_BATTERY_MAX17042=3Dm
> >> CONFIG_BATTERY_MAX1721X=3Dy
> >> CONFIG_CHARGER_PCF50633=3Dm
> >> CONFIG_CHARGER_MAX8903=3Dm
> >> CONFIG_CHARGER_LP8727=3Dy
> >> CONFIG_CHARGER_GPIO=3Dm
> >> CONFIG_CHARGER_MANAGER=3Dy
> >> CONFIG_CHARGER_LT3651=3Dy
> >> CONFIG_CHARGER_LTC4162L=3Dy
> >> CONFIG_CHARGER_MAX14577=3Dm
> >> CONFIG_CHARGER_MAX77693=3Dm
> >> # CONFIG_CHARGER_MAX77976 is not set
> >> CONFIG_CHARGER_MAX8998=3Dy
> >> CONFIG_CHARGER_MP2629=3Dm
> >> # CONFIG_CHARGER_BQ2415X is not set
> >> CONFIG_CHARGER_BQ24190=3Dy
> >> CONFIG_CHARGER_BQ24257=3Dm
> >> # CONFIG_CHARGER_BQ24735 is not set
> >> CONFIG_CHARGER_BQ2515X=3Dm
> >> # CONFIG_CHARGER_BQ25890 is not set
> >> # CONFIG_CHARGER_BQ25980 is not set
> >> CONFIG_CHARGER_BQ256XX=3Dy
> >> CONFIG_CHARGER_SMB347=3Dy
> >> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> >> # CONFIG_BATTERY_GOLDFISH is not set
> >> # CONFIG_BATTERY_RT5033 is not set
> >> CONFIG_CHARGER_RT9455=3Dm
> >> CONFIG_CHARGER_BD99954=3Dm
> >> CONFIG_HWMON=3Dy
> >> CONFIG_HWMON_VID=3Dy
> >> # CONFIG_HWMON_DEBUG_CHIP is not set
> >> =

> >> #
> >> # Native drivers
> >> #
> >> CONFIG_SENSORS_ABITUGURU=3Dm
> >> CONFIG_SENSORS_ABITUGURU3=3Dy
> >> CONFIG_SENSORS_AD7314=3Dm
> >> CONFIG_SENSORS_AD7414=3Dm
> >> CONFIG_SENSORS_AD7418=3Dm
> >> CONFIG_SENSORS_ADM1021=3Dy
> >> # CONFIG_SENSORS_ADM1025 is not set
> >> CONFIG_SENSORS_ADM1026=3Dm
> >> CONFIG_SENSORS_ADM1029=3Dm
> >> CONFIG_SENSORS_ADM1031=3Dy
> >> CONFIG_SENSORS_ADM1177=3Dm
> >> CONFIG_SENSORS_ADM9240=3Dm
> >> # CONFIG_SENSORS_ADT7310 is not set
> >> # CONFIG_SENSORS_ADT7410 is not set
> >> # CONFIG_SENSORS_ADT7411 is not set
> >> CONFIG_SENSORS_ADT7462=3Dm
> >> CONFIG_SENSORS_ADT7470=3Dm
> >> # CONFIG_SENSORS_ADT7475 is not set
> >> # CONFIG_SENSORS_AHT10 is not set
> >> # CONFIG_SENSORS_AS370 is not set
> >> # CONFIG_SENSORS_ASC7621 is not set
> >> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> >> CONFIG_SENSORS_K8TEMP=3Dm
> >> CONFIG_SENSORS_K10TEMP=3Dy
> >> # CONFIG_SENSORS_FAM15H_POWER is not set
> >> CONFIG_SENSORS_APPLESMC=3Dy
> >> # CONFIG_SENSORS_ASB100 is not set
> >> CONFIG_SENSORS_ASPEED=3Dy
> >> CONFIG_SENSORS_ATXP1=3Dy
> >> CONFIG_SENSORS_CORSAIR_CPRO=3Dy
> >> CONFIG_SENSORS_CORSAIR_PSU=3Dy
> >> # CONFIG_SENSORS_DS620 is not set
> >> CONFIG_SENSORS_DS1621=3Dy
> >> CONFIG_SENSORS_DELL_SMM=3Dm
> >> CONFIG_SENSORS_DA9052_ADC=3Dm
> >> CONFIG_SENSORS_I5K_AMB=3Dy
> >> # CONFIG_SENSORS_F71805F is not set
> >> CONFIG_SENSORS_F71882FG=3Dy
> >> CONFIG_SENSORS_F75375S=3Dy
> >> # CONFIG_SENSORS_MC13783_ADC is not set
> >> CONFIG_SENSORS_FSCHMD=3Dy
> >> CONFIG_SENSORS_FTSTEUTATES=3Dy
> >> # CONFIG_SENSORS_GL518SM is not set
> >> # CONFIG_SENSORS_GL520SM is not set
> >> CONFIG_SENSORS_G760A=3Dm
> >> CONFIG_SENSORS_G762=3Dm
> >> CONFIG_SENSORS_HIH6130=3Dm
> >> CONFIG_SENSORS_IBMAEM=3Dm
> >> CONFIG_SENSORS_IBMPEX=3Dy
> >> CONFIG_SENSORS_IIO_HWMON=3Dm
> >> # CONFIG_SENSORS_I5500 is not set
> >> CONFIG_SENSORS_CORETEMP=3Dm
> >> CONFIG_SENSORS_IT87=3Dy
> >> CONFIG_SENSORS_JC42=3Dy
> >> CONFIG_SENSORS_POWR1220=3Dy
> >> # CONFIG_SENSORS_LINEAGE is not set
> >> CONFIG_SENSORS_LTC2945=3Dy
> >> CONFIG_SENSORS_LTC2947=3Dy
> >> CONFIG_SENSORS_LTC2947_I2C=3Dy
> >> # CONFIG_SENSORS_LTC2947_SPI is not set
> >> CONFIG_SENSORS_LTC2990=3Dm
> >> CONFIG_SENSORS_LTC2992=3Dy
> >> CONFIG_SENSORS_LTC4151=3Dm
> >> CONFIG_SENSORS_LTC4215=3Dm
> >> CONFIG_SENSORS_LTC4222=3Dy
> >> CONFIG_SENSORS_LTC4245=3Dm
> >> CONFIG_SENSORS_LTC4260=3Dy
> >> CONFIG_SENSORS_LTC4261=3Dy
> >> CONFIG_SENSORS_MAX1111=3Dm
> >> CONFIG_SENSORS_MAX127=3Dm
> >> # CONFIG_SENSORS_MAX16065 is not set
> >> # CONFIG_SENSORS_MAX1619 is not set
> >> CONFIG_SENSORS_MAX1668=3Dm
> >> CONFIG_SENSORS_MAX197=3Dy
> >> # CONFIG_SENSORS_MAX31722 is not set
> >> CONFIG_SENSORS_MAX31730=3Dm
> >> # CONFIG_SENSORS_MAX6620 is not set
> >> CONFIG_SENSORS_MAX6621=3Dy
> >> CONFIG_SENSORS_MAX6639=3Dy
> >> CONFIG_SENSORS_MAX6642=3Dy
> >> CONFIG_SENSORS_MAX6650=3Dy
> >> # CONFIG_SENSORS_MAX6697 is not set
> >> CONFIG_SENSORS_MAX31790=3Dy
> >> CONFIG_SENSORS_MCP3021=3Dm
> >> CONFIG_SENSORS_MLXREG_FAN=3Dm
> >> # CONFIG_SENSORS_TC654 is not set
> >> # CONFIG_SENSORS_TPS23861 is not set
> >> CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
> >> CONFIG_SENSORS_MR75203=3Dm
> >> CONFIG_SENSORS_ADCXX=3Dy
> >> CONFIG_SENSORS_LM63=3Dm
> >> # CONFIG_SENSORS_LM70 is not set
> >> # CONFIG_SENSORS_LM73 is not set
> >> CONFIG_SENSORS_LM75=3Dm
> >> CONFIG_SENSORS_LM77=3Dm
> >> CONFIG_SENSORS_LM78=3Dm
> >> CONFIG_SENSORS_LM80=3Dm
> >> CONFIG_SENSORS_LM83=3Dy
> >> CONFIG_SENSORS_LM85=3Dy
> >> # CONFIG_SENSORS_LM87 is not set
> >> CONFIG_SENSORS_LM90=3Dm
> >> CONFIG_SENSORS_LM92=3Dm
> >> CONFIG_SENSORS_LM93=3Dm
> >> CONFIG_SENSORS_LM95234=3Dy
> >> # CONFIG_SENSORS_LM95241 is not set
> >> CONFIG_SENSORS_LM95245=3Dm
> >> # CONFIG_SENSORS_PC87360 is not set
> >> CONFIG_SENSORS_PC87427=3Dy
> >> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> >> # CONFIG_SENSORS_NCT6683 is not set
> >> CONFIG_SENSORS_NCT6775=3Dm
> >> CONFIG_SENSORS_NCT7802=3Dy
> >> CONFIG_SENSORS_NCT7904=3Dy
> >> CONFIG_SENSORS_NPCM7XX=3Dm
> >> CONFIG_SENSORS_PCF8591=3Dm
> >> CONFIG_PMBUS=3Dm
> >> # CONFIG_SENSORS_PMBUS is not set
> >> CONFIG_SENSORS_ADM1266=3Dm
> >> CONFIG_SENSORS_ADM1275=3Dm
> >> CONFIG_SENSORS_BEL_PFE=3Dm
> >> # CONFIG_SENSORS_BPA_RS600 is not set
> >> CONFIG_SENSORS_DELTA_AHE50DC_FAN=3Dm
> >> CONFIG_SENSORS_FSP_3Y=3Dm
> >> CONFIG_SENSORS_IBM_CFFPS=3Dm
> >> CONFIG_SENSORS_DPS920AB=3Dm
> >> CONFIG_SENSORS_INSPUR_IPSPS=3Dm
> >> CONFIG_SENSORS_IR35221=3Dm
> >> CONFIG_SENSORS_IR36021=3Dm
> >> CONFIG_SENSORS_IR38064=3Dm
> >> CONFIG_SENSORS_IR38064_REGULATOR=3Dy
> >> CONFIG_SENSORS_IRPS5401=3Dm
> >> CONFIG_SENSORS_ISL68137=3Dm
> >> # CONFIG_SENSORS_LM25066 is not set
> >> # CONFIG_SENSORS_LTC2978 is not set
> >> # CONFIG_SENSORS_LTC3815 is not set
> >> CONFIG_SENSORS_MAX15301=3Dm
> >> CONFIG_SENSORS_MAX16064=3Dm
> >> # CONFIG_SENSORS_MAX16601 is not set
> >> CONFIG_SENSORS_MAX20730=3Dm
> >> CONFIG_SENSORS_MAX20751=3Dm
> >> CONFIG_SENSORS_MAX31785=3Dm
> >> CONFIG_SENSORS_MAX34440=3Dm
> >> # CONFIG_SENSORS_MAX8688 is not set
> >> CONFIG_SENSORS_MP2888=3Dm
> >> CONFIG_SENSORS_MP2975=3Dm
> >> # CONFIG_SENSORS_MP5023 is not set
> >> CONFIG_SENSORS_PIM4328=3Dm
> >> # CONFIG_SENSORS_PM6764TR is not set
> >> # CONFIG_SENSORS_PXE1610 is not set
> >> CONFIG_SENSORS_Q54SJ108A2=3Dm
> >> CONFIG_SENSORS_STPDDC60=3Dm
> >> CONFIG_SENSORS_TPS40422=3Dm
> >> # CONFIG_SENSORS_TPS53679 is not set
> >> CONFIG_SENSORS_UCD9000=3Dm
> >> CONFIG_SENSORS_UCD9200=3Dm
> >> # CONFIG_SENSORS_XDPE122 is not set
> >> CONFIG_SENSORS_ZL6100=3Dm
> >> CONFIG_SENSORS_SBTSI=3Dy
> >> # CONFIG_SENSORS_SBRMI is not set
> >> # CONFIG_SENSORS_SHT15 is not set
> >> CONFIG_SENSORS_SHT21=3Dm
> >> CONFIG_SENSORS_SHT3x=3Dm
> >> CONFIG_SENSORS_SHT4x=3Dy
> >> CONFIG_SENSORS_SHTC1=3Dm
> >> CONFIG_SENSORS_SIS5595=3Dm
> >> CONFIG_SENSORS_DME1737=3Dm
> >> # CONFIG_SENSORS_EMC1403 is not set
> >> CONFIG_SENSORS_EMC2103=3Dm
> >> CONFIG_SENSORS_EMC6W201=3Dy
> >> # CONFIG_SENSORS_SMSC47M1 is not set
> >> # CONFIG_SENSORS_SMSC47M192 is not set
> >> CONFIG_SENSORS_SMSC47B397=3Dm
> >> CONFIG_SENSORS_SCH56XX_COMMON=3Dm
> >> CONFIG_SENSORS_SCH5627=3Dm
> >> # CONFIG_SENSORS_SCH5636 is not set
> >> # CONFIG_SENSORS_STTS751 is not set
> >> CONFIG_SENSORS_SMM665=3Dy
> >> CONFIG_SENSORS_ADC128D818=3Dy
> >> CONFIG_SENSORS_ADS7828=3Dy
> >> CONFIG_SENSORS_ADS7871=3Dy
> >> CONFIG_SENSORS_AMC6821=3Dy
> >> # CONFIG_SENSORS_INA209 is not set
> >> CONFIG_SENSORS_INA2XX=3Dm
> >> CONFIG_SENSORS_INA238=3Dy
> >> # CONFIG_SENSORS_INA3221 is not set
> >> # CONFIG_SENSORS_TC74 is not set
> >> CONFIG_SENSORS_THMC50=3Dm
> >> CONFIG_SENSORS_TMP102=3Dy
> >> CONFIG_SENSORS_TMP103=3Dy
> >> # CONFIG_SENSORS_TMP108 is not set
> >> # CONFIG_SENSORS_TMP401 is not set
> >> CONFIG_SENSORS_TMP421=3Dy
> >> # CONFIG_SENSORS_TMP513 is not set
> >> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> >> CONFIG_SENSORS_VIA686A=3Dm
> >> CONFIG_SENSORS_VT1211=3Dy
> >> CONFIG_SENSORS_VT8231=3Dm
> >> # CONFIG_SENSORS_W83773G is not set
> >> # CONFIG_SENSORS_W83781D is not set
> >> CONFIG_SENSORS_W83791D=3Dy
> >> CONFIG_SENSORS_W83792D=3Dy
> >> CONFIG_SENSORS_W83793=3Dy
> >> CONFIG_SENSORS_W83795=3Dm
> >> CONFIG_SENSORS_W83795_FANCTRL=3Dy
> >> CONFIG_SENSORS_W83L785TS=3Dm
> >> CONFIG_SENSORS_W83L786NG=3Dy
> >> CONFIG_SENSORS_W83627HF=3Dm
> >> CONFIG_SENSORS_W83627EHF=3Dm
> >> CONFIG_SENSORS_WM831X=3Dy
> >> # CONFIG_SENSORS_XGENE is not set
> >> =

> >> #
> >> # ACPI drivers
> >> #
> >> CONFIG_SENSORS_ACPI_POWER=3Dm
> >> CONFIG_SENSORS_ATK0110=3Dm
> >> CONFIG_THERMAL=3Dy
> >> # CONFIG_THERMAL_NETLINK is not set
> >> # CONFIG_THERMAL_STATISTICS is not set
> >> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> >> # CONFIG_THERMAL_HWMON is not set
> >> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> >> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> >> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> >> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> >> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> >> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> >> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> >> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> >> CONFIG_DEVFREQ_THERMAL=3Dy
> >> # CONFIG_THERMAL_EMULATION is not set
> >> =

> >> #
> >> # Intel thermal drivers
> >> #
> >> CONFIG_INTEL_POWERCLAMP=3Dm
> >> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> >> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> >> =

> >> #
> >> # ACPI INT340X thermal drivers
> >> #
> >> # end of ACPI INT340X thermal drivers
> >> =

> >> CONFIG_INTEL_PCH_THERMAL=3Dy
> >> # CONFIG_INTEL_TCC_COOLING is not set
> >> CONFIG_INTEL_MENLOW=3Dm
> >> # end of Intel thermal drivers
> >> =

> >> CONFIG_GENERIC_ADC_THERMAL=3Dm
> >> CONFIG_WATCHDOG=3Dy
> >> CONFIG_WATCHDOG_CORE=3Dy
> >> # CONFIG_WATCHDOG_NOWAYOUT is not set
> >> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
> >> CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> >> # CONFIG_WATCHDOG_SYSFS is not set
> >> CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=3Dy
> >> =

> >> #
> >> # Watchdog Pretimeout Governors
> >> #
> >> CONFIG_WATCHDOG_PRETIMEOUT_GOV=3Dy
> >> CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=3Dm
> >> # CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
> >> CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dm
> >> CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=3Dy
> >> =

> >> #
> >> # Watchdog Device Drivers
> >> #
> >> CONFIG_SOFT_WATCHDOG=3Dm
> >> # CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
> >> CONFIG_DA9052_WATCHDOG=3Dm
> >> # CONFIG_DA9062_WATCHDOG is not set
> >> # CONFIG_MENF21BMC_WATCHDOG is not set
> >> CONFIG_MENZ069_WATCHDOG=3Dm
> >> CONFIG_WDAT_WDT=3Dm
> >> # CONFIG_WM831X_WATCHDOG is not set
> >> CONFIG_XILINX_WATCHDOG=3Dm
> >> # CONFIG_ZIIRAVE_WATCHDOG is not set
> >> # CONFIG_RAVE_SP_WATCHDOG is not set
> >> CONFIG_MLX_WDT=3Dm
> >> # CONFIG_CADENCE_WATCHDOG is not set
> >> CONFIG_DW_WATCHDOG=3Dm
> >> CONFIG_MAX63XX_WATCHDOG=3Dm
> >> CONFIG_ACQUIRE_WDT=3Dm
> >> # CONFIG_ADVANTECH_WDT is not set
> >> CONFIG_ALIM1535_WDT=3Dm
> >> CONFIG_ALIM7101_WDT=3Dy
> >> CONFIG_EBC_C384_WDT=3Dy
> >> # CONFIG_F71808E_WDT is not set
> >> CONFIG_SP5100_TCO=3Dy
> >> CONFIG_GEODE_WDT=3Dm
> >> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> >> # CONFIG_EUROTECH_WDT is not set
> >> CONFIG_IB700_WDT=3Dy
> >> CONFIG_IBMASR=3Dm
> >> CONFIG_WAFER_WDT=3Dy
> >> CONFIG_I6300ESB_WDT=3Dy
> >> CONFIG_IE6XX_WDT=3Dy
> >> # CONFIG_ITCO_WDT is not set
> >> CONFIG_IT8712F_WDT=3Dy
> >> CONFIG_IT87_WDT=3Dm
> >> CONFIG_HP_WATCHDOG=3Dy
> >> CONFIG_HPWDT_NMI_DECODING=3Dy
> >> CONFIG_KEMPLD_WDT=3Dm
> >> CONFIG_SC1200_WDT=3Dm
> >> # CONFIG_PC87413_WDT is not set
> >> CONFIG_NV_TCO=3Dm
> >> # CONFIG_60XX_WDT is not set
> >> # CONFIG_SBC8360_WDT is not set
> >> CONFIG_SBC7240_WDT=3Dm
> >> # CONFIG_CPU5_WDT is not set
> >> CONFIG_SMSC_SCH311X_WDT=3Dy
> >> CONFIG_SMSC37B787_WDT=3Dm
> >> CONFIG_TQMX86_WDT=3Dy
> >> # CONFIG_VIA_WDT is not set
> >> CONFIG_W83627HF_WDT=3Dm
> >> CONFIG_W83877F_WDT=3Dm
> >> CONFIG_W83977F_WDT=3Dm
> >> CONFIG_MACHZ_WDT=3Dm
> >> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> >> CONFIG_INTEL_MEI_WDT=3Dy
> >> CONFIG_NI903X_WDT=3Dy
> >> CONFIG_NIC7018_WDT=3Dm
> >> # CONFIG_SIEMENS_SIMATIC_IPC_WDT is not set
> >> # CONFIG_MEN_A21_WDT is not set
> >> =

> >> #
> >> # PCI-based Watchdog Cards
> >> #
> >> # CONFIG_PCIPCWATCHDOG is not set
> >> CONFIG_WDTPCI=3Dy
> >> CONFIG_SSB_POSSIBLE=3Dy
> >> CONFIG_SSB=3Dy
> >> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> >> # CONFIG_SSB_PCIHOST is not set
> >> CONFIG_SSB_DRIVER_GPIO=3Dy
> >> CONFIG_BCMA_POSSIBLE=3Dy
> >> CONFIG_BCMA=3Dm
> >> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> >> # CONFIG_BCMA_HOST_PCI is not set
> >> # CONFIG_BCMA_HOST_SOC is not set
> >> # CONFIG_BCMA_DRIVER_PCI is not set
> >> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> >> CONFIG_BCMA_DRIVER_GPIO=3Dy
> >> CONFIG_BCMA_DEBUG=3Dy
> >> =

> >> #
> >> # Multifunction device drivers
> >> #
> >> CONFIG_MFD_CORE=3Dy
> >> CONFIG_MFD_CS5535=3Dm
> >> CONFIG_MFD_AS3711=3Dy
> >> # CONFIG_PMIC_ADP5520 is not set
> >> CONFIG_MFD_AAT2870_CORE=3Dy
> >> # CONFIG_MFD_BCM590XX is not set
> >> # CONFIG_MFD_BD9571MWV is not set
> >> CONFIG_MFD_AXP20X=3Dm
> >> CONFIG_MFD_AXP20X_I2C=3Dm
> >> # CONFIG_MFD_CROS_EC_DEV is not set
> >> CONFIG_MFD_MADERA=3Dm
> >> # CONFIG_MFD_MADERA_I2C is not set
> >> CONFIG_MFD_MADERA_SPI=3Dm
> >> CONFIG_MFD_CS47L15=3Dy
> >> CONFIG_MFD_CS47L35=3Dy
> >> CONFIG_MFD_CS47L85=3Dy
> >> CONFIG_MFD_CS47L90=3Dy
> >> CONFIG_MFD_CS47L92=3Dy
> >> # CONFIG_PMIC_DA903X is not set
> >> CONFIG_PMIC_DA9052=3Dy
> >> CONFIG_MFD_DA9052_SPI=3Dy
> >> CONFIG_MFD_DA9052_I2C=3Dy
> >> # CONFIG_MFD_DA9055 is not set
> >> CONFIG_MFD_DA9062=3Dy
> >> # CONFIG_MFD_DA9063 is not set
> >> CONFIG_MFD_DA9150=3Dm
> >> CONFIG_MFD_MC13XXX=3Dy
> >> CONFIG_MFD_MC13XXX_SPI=3Dy
> >> # CONFIG_MFD_MC13XXX_I2C is not set
> >> CONFIG_MFD_MP2629=3Dy
> >> CONFIG_HTC_PASIC3=3Dy
> >> CONFIG_HTC_I2CPLD=3Dy
> >> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dm
> >> CONFIG_LPC_ICH=3Dm
> >> CONFIG_LPC_SCH=3Dy
> >> CONFIG_INTEL_SOC_PMIC=3Dy
> >> # CONFIG_INTEL_SOC_PMIC_BXTWC is not set
> >> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> >> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> >> CONFIG_MFD_INTEL_LPSS=3Dy
> >> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> >> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> >> CONFIG_MFD_INTEL_PMC_BXT=3Dy
> >> CONFIG_MFD_IQS62X=3Dm
> >> CONFIG_MFD_JANZ_CMODIO=3Dy
> >> CONFIG_MFD_KEMPLD=3Dm
> >> # CONFIG_MFD_88PM800 is not set
> >> # CONFIG_MFD_88PM805 is not set
> >> CONFIG_MFD_88PM860X=3Dy
> >> CONFIG_MFD_MAX14577=3Dm
> >> CONFIG_MFD_MAX77693=3Dy
> >> # CONFIG_MFD_MAX77843 is not set
> >> # CONFIG_MFD_MAX8907 is not set
> >> # CONFIG_MFD_MAX8925 is not set
> >> # CONFIG_MFD_MAX8997 is not set
> >> CONFIG_MFD_MAX8998=3Dy
> >> # CONFIG_MFD_MT6360 is not set
> >> CONFIG_MFD_MT6397=3Dm
> >> CONFIG_MFD_MENF21BMC=3Dy
> >> # CONFIG_EZX_PCAP is not set
> >> # CONFIG_MFD_RETU is not set
> >> CONFIG_MFD_PCF50633=3Dy
> >> CONFIG_PCF50633_ADC=3Dy
> >> # CONFIG_PCF50633_GPIO is not set
> >> CONFIG_MFD_RDC321X=3Dy
> >> CONFIG_MFD_RT4831=3Dy
> >> # CONFIG_MFD_RT5033 is not set
> >> # CONFIG_MFD_RC5T583 is not set
> >> CONFIG_MFD_SI476X_CORE=3Dy
> >> # CONFIG_MFD_SM501 is not set
> >> CONFIG_MFD_SKY81452=3Dm
> >> CONFIG_MFD_SYSCON=3Dy
> >> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> >> # CONFIG_MFD_LP3943 is not set
> >> CONFIG_MFD_LP8788=3Dy
> >> # CONFIG_MFD_TI_LMU is not set
> >> # CONFIG_MFD_PALMAS is not set
> >> CONFIG_TPS6105X=3Dm
> >> # CONFIG_TPS65010 is not set
> >> CONFIG_TPS6507X=3Dm
> >> # CONFIG_MFD_TPS65086 is not set
> >> # CONFIG_MFD_TPS65090 is not set
> >> # CONFIG_MFD_TI_LP873X is not set
> >> CONFIG_MFD_TPS6586X=3Dy
> >> # CONFIG_MFD_TPS65910 is not set
> >> CONFIG_MFD_TPS65912=3Dy
> >> CONFIG_MFD_TPS65912_I2C=3Dy
> >> CONFIG_MFD_TPS65912_SPI=3Dm
> >> # CONFIG_TWL4030_CORE is not set
> >> # CONFIG_TWL6040_CORE is not set
> >> CONFIG_MFD_WL1273_CORE=3Dm
> >> # CONFIG_MFD_LM3533 is not set
> >> CONFIG_MFD_TIMBERDALE=3Dy
> >> CONFIG_MFD_TQMX86=3Dm
> >> CONFIG_MFD_VX855=3Dm
> >> CONFIG_MFD_ARIZONA=3Dy
> >> CONFIG_MFD_ARIZONA_I2C=3Dy
> >> CONFIG_MFD_ARIZONA_SPI=3Dy
> >> # CONFIG_MFD_CS47L24 is not set
> >> # CONFIG_MFD_WM5102 is not set
> >> CONFIG_MFD_WM5110=3Dy
> >> CONFIG_MFD_WM8997=3Dy
> >> CONFIG_MFD_WM8998=3Dy
> >> CONFIG_MFD_WM8400=3Dy
> >> CONFIG_MFD_WM831X=3Dy
> >> CONFIG_MFD_WM831X_I2C=3Dy
> >> # CONFIG_MFD_WM831X_SPI is not set
> >> # CONFIG_MFD_WM8350_I2C is not set
> >> CONFIG_MFD_WM8994=3Dy
> >> CONFIG_MFD_WCD934X=3Dm
> >> # CONFIG_MFD_ATC260X_I2C is not set
> >> CONFIG_RAVE_SP_CORE=3Dy
> >> # CONFIG_MFD_INTEL_M10_BMC is not set
> >> # end of Multifunction device drivers
> >> =

> >> CONFIG_REGULATOR=3Dy
> >> # CONFIG_REGULATOR_DEBUG is not set
> >> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dm
> >> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> >> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dm
> >> CONFIG_REGULATOR_88PG86X=3Dy
> >> CONFIG_REGULATOR_88PM8607=3Dm
> >> # CONFIG_REGULATOR_ACT8865 is not set
> >> CONFIG_REGULATOR_AD5398=3Dm
> >> CONFIG_REGULATOR_AAT2870=3Dy
> >> CONFIG_REGULATOR_AS3711=3Dy
> >> CONFIG_REGULATOR_AXP20X=3Dm
> >> # CONFIG_REGULATOR_DA9052 is not set
> >> # CONFIG_REGULATOR_DA9062 is not set
> >> # CONFIG_REGULATOR_DA9210 is not set
> >> # CONFIG_REGULATOR_DA9211 is not set
> >> CONFIG_REGULATOR_FAN53555=3Dy
> >> CONFIG_REGULATOR_GPIO=3Dm
> >> CONFIG_REGULATOR_ISL9305=3Dy
> >> # CONFIG_REGULATOR_ISL6271A is not set
> >> CONFIG_REGULATOR_LP3971=3Dm
> >> CONFIG_REGULATOR_LP3972=3Dy
> >> CONFIG_REGULATOR_LP872X=3Dy
> >> CONFIG_REGULATOR_LP8755=3Dm
> >> # CONFIG_REGULATOR_LP8788 is not set
> >> CONFIG_REGULATOR_LTC3589=3Dy
> >> # CONFIG_REGULATOR_LTC3676 is not set
> >> CONFIG_REGULATOR_MAX14577=3Dm
> >> CONFIG_REGULATOR_MAX1586=3Dm
> >> # CONFIG_REGULATOR_MAX8649 is not set
> >> CONFIG_REGULATOR_MAX8660=3Dy
> >> CONFIG_REGULATOR_MAX8893=3Dm
> >> CONFIG_REGULATOR_MAX8952=3Dy
> >> CONFIG_REGULATOR_MAX8998=3Dy
> >> # CONFIG_REGULATOR_MAX20086 is not set
> >> CONFIG_REGULATOR_MAX77693=3Dm
> >> # CONFIG_REGULATOR_MAX77826 is not set
> >> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> >> CONFIG_REGULATOR_MC13783=3Dy
> >> # CONFIG_REGULATOR_MC13892 is not set
> >> # CONFIG_REGULATOR_MP8859 is not set
> >> # CONFIG_REGULATOR_MT6311 is not set
> >> CONFIG_REGULATOR_MT6323=3Dm
> >> # CONFIG_REGULATOR_MT6358 is not set
> >> CONFIG_REGULATOR_MT6359=3Dm
> >> CONFIG_REGULATOR_MT6397=3Dm
> >> CONFIG_REGULATOR_PCA9450=3Dm
> >> CONFIG_REGULATOR_PCF50633=3Dm
> >> CONFIG_REGULATOR_PV88060=3Dm
> >> CONFIG_REGULATOR_PV88080=3Dy
> >> CONFIG_REGULATOR_PV88090=3Dm
> >> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=3Dy
> >> # CONFIG_REGULATOR_RT4801 is not set
> >> CONFIG_REGULATOR_RT4831=3Dy
> >> CONFIG_REGULATOR_RT6160=3Dm
> >> CONFIG_REGULATOR_RT6245=3Dy
> >> # CONFIG_REGULATOR_RTQ2134 is not set
> >> CONFIG_REGULATOR_RTMV20=3Dy
> >> CONFIG_REGULATOR_RTQ6752=3Dy
> >> # CONFIG_REGULATOR_SKY81452 is not set
> >> CONFIG_REGULATOR_SLG51000=3Dm
> >> CONFIG_REGULATOR_TPS51632=3Dm
> >> # CONFIG_REGULATOR_TPS6105X is not set
> >> # CONFIG_REGULATOR_TPS62360 is not set
> >> # CONFIG_REGULATOR_TPS65023 is not set
> >> CONFIG_REGULATOR_TPS6507X=3Dy
> >> # CONFIG_REGULATOR_TPS65132 is not set
> >> CONFIG_REGULATOR_TPS6524X=3Dm
> >> CONFIG_REGULATOR_TPS6586X=3Dm
> >> CONFIG_REGULATOR_TPS65912=3Dy
> >> # CONFIG_REGULATOR_WM831X is not set
> >> # CONFIG_REGULATOR_WM8400 is not set
> >> CONFIG_REGULATOR_WM8994=3Dy
> >> CONFIG_RC_CORE=3Dy
> >> CONFIG_RC_MAP=3Dm
> >> CONFIG_LIRC=3Dy
> >> CONFIG_RC_DECODERS=3Dy
> >> CONFIG_IR_NEC_DECODER=3Dm
> >> # CONFIG_IR_RC5_DECODER is not set
> >> # CONFIG_IR_RC6_DECODER is not set
> >> # CONFIG_IR_JVC_DECODER is not set
> >> # CONFIG_IR_SONY_DECODER is not set
> >> CONFIG_IR_SANYO_DECODER=3Dy
> >> CONFIG_IR_SHARP_DECODER=3Dy
> >> CONFIG_IR_MCE_KBD_DECODER=3Dy
> >> CONFIG_IR_XMP_DECODER=3Dy
> >> CONFIG_IR_IMON_DECODER=3Dy
> >> # CONFIG_IR_RCMM_DECODER is not set
> >> # CONFIG_RC_DEVICES is not set
> >> =

> >> #
> >> # CEC support
> >> #
> >> # CONFIG_MEDIA_CEC_SUPPORT is not set
> >> # end of CEC support
> >> =

> >> CONFIG_MEDIA_SUPPORT=3Dm
> >> # CONFIG_MEDIA_SUPPORT_FILTER is not set
> >> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> >> =

> >> #
> >> # Media device types
> >> #
> >> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> >> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> >> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> >> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> >> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> >> CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
> >> CONFIG_MEDIA_TEST_SUPPORT=3Dy
> >> # end of Media device types
> >> =

> >> #
> >> # Media core support
> >> #
> >> CONFIG_VIDEO_DEV=3Dm
> >> CONFIG_MEDIA_CONTROLLER=3Dy
> >> CONFIG_DVB_CORE=3Dm
> >> # end of Media core support
> >> =

> >> #
> >> # Video4Linux options
> >> #
> >> CONFIG_VIDEO_V4L2=3Dm
> >> CONFIG_VIDEO_V4L2_I2C=3Dy
> >> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> >> # CONFIG_VIDEO_ADV_DEBUG is not set
> >> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> >> CONFIG_VIDEO_TUNER=3Dm
> >> CONFIG_V4L2_MEM2MEM_DEV=3Dm
> >> CONFIG_V4L2_FWNODE=3Dm
> >> CONFIG_V4L2_ASYNC=3Dm
> >> CONFIG_VIDEOBUF_GEN=3Dm
> >> CONFIG_VIDEOBUF_DMA_SG=3Dm
> >> # end of Video4Linux options
> >> =

> >> #
> >> # Media controller options
> >> #
> >> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> >> # end of Media controller options
> >> =

> >> #
> >> # Digital TV options
> >> #
> >> CONFIG_DVB_MMAP=3Dy
> >> CONFIG_DVB_NET=3Dy
> >> CONFIG_DVB_MAX_ADAPTERS=3D16
> >> # CONFIG_DVB_DYNAMIC_MINORS is not set
> >> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> >> # CONFIG_DVB_ULE_DEBUG is not set
> >> # end of Digital TV options
> >> =

> >> #
> >> # Media drivers
> >> #
> >> CONFIG_MEDIA_PCI_SUPPORT=3Dy
> >> =

> >> #
> >> # Media capture support
> >> #
> >> # CONFIG_VIDEO_TW5864 is not set
> >> CONFIG_VIDEO_TW68=3Dm
> >> =

> >> #
> >> # Media capture/analog TV support
> >> #
> >> CONFIG_VIDEO_IVTV=3Dm
> >> CONFIG_VIDEO_FB_IVTV=3Dm
> >> CONFIG_VIDEO_FB_IVTV_FORCE_PAT=3Dy
> >> CONFIG_VIDEO_HEXIUM_GEMINI=3Dm
> >> CONFIG_VIDEO_HEXIUM_ORION=3Dm
> >> # CONFIG_VIDEO_MXB is not set
> >> CONFIG_VIDEO_DT3155=3Dm
> >> =

> >> #
> >> # Media capture/analog/hybrid TV support
> >> #
> >> # CONFIG_VIDEO_CX18 is not set
> >> CONFIG_VIDEO_CX25821=3Dm
> >> # CONFIG_VIDEO_CX88 is not set
> >> # CONFIG_VIDEO_BT848 is not set
> >> CONFIG_VIDEO_SAA7134=3Dm
> >> CONFIG_VIDEO_SAA7134_RC=3Dy
> >> # CONFIG_VIDEO_SAA7134_DVB is not set
> >> CONFIG_VIDEO_SAA7164=3Dm
> >> =

> >> #
> >> # Media digital TV PCI Adapters
> >> #
> >> # CONFIG_DVB_BUDGET_CORE is not set
> >> # CONFIG_DVB_B2C2_FLEXCOP_PCI is not set
> >> # CONFIG_DVB_PLUTO2 is not set
> >> # CONFIG_DVB_DM1105 is not set
> >> # CONFIG_DVB_PT1 is not set
> >> # CONFIG_DVB_PT3 is not set
> >> CONFIG_MANTIS_CORE=3Dm
> >> CONFIG_DVB_MANTIS=3Dm
> >> # CONFIG_DVB_HOPPER is not set
> >> CONFIG_DVB_NGENE=3Dm
> >> CONFIG_DVB_DDBRIDGE=3Dm
> >> CONFIG_DVB_SMIPCIE=3Dm
> >> CONFIG_DVB_NETUP_UNIDVB=3Dm
> >> CONFIG_VIDEO_IPU3_CIO2=3Dm
> >> CONFIG_CIO2_BRIDGE=3Dy
> >> # CONFIG_VIDEO_PCI_SKELETON is not set
> >> CONFIG_RADIO_ADAPTERS=3Dy
> >> CONFIG_RADIO_TEA575X=3Dm
> >> # CONFIG_RADIO_SI470X is not set
> >> # CONFIG_RADIO_SI4713 is not set
> >> CONFIG_RADIO_MAXIRADIO=3Dm
> >> CONFIG_RADIO_TEA5764=3Dm
> >> CONFIG_RADIO_SAA7706H=3Dm
> >> CONFIG_RADIO_TEF6862=3Dm
> >> CONFIG_RADIO_TIMBERDALE=3Dm
> >> CONFIG_RADIO_WL1273=3Dm
> >> CONFIG_VIDEO_CX2341X=3Dm
> >> CONFIG_VIDEO_TVEEPROM=3Dm
> >> CONFIG_TTPCI_EEPROM=3Dm
> >> CONFIG_VIDEOBUF2_CORE=3Dm
> >> CONFIG_VIDEOBUF2_V4L2=3Dm
> >> CONFIG_VIDEOBUF2_MEMOPS=3Dm
> >> CONFIG_VIDEOBUF2_DMA_CONTIG=3Dm
> >> CONFIG_VIDEOBUF2_VMALLOC=3Dm
> >> CONFIG_VIDEOBUF2_DMA_SG=3Dm
> >> CONFIG_VIDEOBUF2_DVB=3Dm
> >> CONFIG_VIDEO_SAA7146=3Dm
> >> CONFIG_VIDEO_SAA7146_VV=3Dm
> >> CONFIG_V4L_PLATFORM_DRIVERS=3Dy
> >> # CONFIG_VIDEO_CAFE_CCIC is not set
> >> CONFIG_VIDEO_VIA_CAMERA=3Dm
> >> CONFIG_VIDEO_CADENCE=3Dy
> >> CONFIG_VIDEO_CADENCE_CSI2RX=3Dm
> >> CONFIG_VIDEO_CADENCE_CSI2TX=3Dm
> >> CONFIG_VIDEO_ASPEED=3Dm
> >> CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> >> CONFIG_VIDEO_MEM2MEM_DEINTERLACE=3Dm
> >> CONFIG_DVB_PLATFORM_DRIVERS=3Dy
> >> # CONFIG_SDR_PLATFORM_DRIVERS is not set
> >> # CONFIG_V4L_TEST_DRIVERS is not set
> >> # CONFIG_DVB_TEST_DRIVERS is not set
> >> =

> >> #
> >> # FireWire (IEEE 1394) Adapters
> >> #
> >> CONFIG_DVB_FIREDTV=3Dm
> >> CONFIG_DVB_FIREDTV_INPUT=3Dy
> >> # end of Media drivers
> >> =

> >> CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=3Dy
> >> =

> >> #
> >> # Media ancillary drivers
> >> #
> >> CONFIG_MEDIA_ATTACH=3Dy
> >> =

> >> #
> >> # IR I2C driver auto-selected by 'Autoselect ancillary drivers'
> >> #
> >> CONFIG_VIDEO_IR_I2C=3Dm
> >> =

> >> #
> >> # audio, video and radio I2C drivers auto-selected by 'Autoselect anci=
llary drivers'
> >> #
> >> CONFIG_VIDEO_MSP3400=3Dm
> >> CONFIG_VIDEO_CS53L32A=3Dm
> >> CONFIG_VIDEO_WM8775=3Dm
> >> CONFIG_VIDEO_WM8739=3Dm
> >> CONFIG_VIDEO_VP27SMPX=3Dm
> >> CONFIG_VIDEO_SAA6588=3Dm
> >> CONFIG_VIDEO_BT819=3Dm
> >> CONFIG_VIDEO_BT856=3Dm
> >> CONFIG_VIDEO_SAA7110=3Dm
> >> CONFIG_VIDEO_SAA711X=3Dm
> >> CONFIG_VIDEO_VPX3220=3Dm
> >> =

> >> #
> >> # Video and audio decoders
> >> #
> >> CONFIG_VIDEO_SAA717X=3Dm
> >> CONFIG_VIDEO_CX25840=3Dm
> >> CONFIG_VIDEO_SAA7127=3Dm
> >> CONFIG_VIDEO_ADV7175=3Dm
> >> CONFIG_VIDEO_UPD64031A=3Dm
> >> CONFIG_VIDEO_UPD64083=3Dm
> >> CONFIG_VIDEO_SAA6752HS=3Dm
> >> CONFIG_VIDEO_M52790=3Dm
> >> =

> >> #
> >> # Camera sensor devices
> >> #
> >> CONFIG_VIDEO_APTINA_PLL=3Dm
> >> CONFIG_VIDEO_CCS_PLL=3Dm
> >> CONFIG_VIDEO_HI556=3Dm
> >> CONFIG_VIDEO_HI846=3Dm
> >> # CONFIG_VIDEO_IMX208 is not set
> >> # CONFIG_VIDEO_IMX214 is not set
> >> # CONFIG_VIDEO_IMX219 is not set
> >> CONFIG_VIDEO_IMX258=3Dm
> >> # CONFIG_VIDEO_IMX274 is not set
> >> CONFIG_VIDEO_IMX290=3Dm
> >> CONFIG_VIDEO_IMX319=3Dm
> >> CONFIG_VIDEO_IMX355=3Dm
> >> CONFIG_VIDEO_OV02A10=3Dm
> >> # CONFIG_VIDEO_OV2640 is not set
> >> CONFIG_VIDEO_OV2659=3Dm
> >> CONFIG_VIDEO_OV2680=3Dm
> >> # CONFIG_VIDEO_OV2685 is not set
> >> CONFIG_VIDEO_OV2740=3Dm
> >> CONFIG_VIDEO_OV5647=3Dm
> >> CONFIG_VIDEO_OV5648=3Dm
> >> # CONFIG_VIDEO_OV6650 is not set
> >> # CONFIG_VIDEO_OV5670 is not set
> >> # CONFIG_VIDEO_OV5675 is not set
> >> CONFIG_VIDEO_OV5693=3Dm
> >> # CONFIG_VIDEO_OV5695 is not set
> >> CONFIG_VIDEO_OV7251=3Dm
> >> CONFIG_VIDEO_OV772X=3Dm
> >> CONFIG_VIDEO_OV7640=3Dm
> >> CONFIG_VIDEO_OV7670=3Dm
> >> CONFIG_VIDEO_OV7740=3Dm
> >> # CONFIG_VIDEO_OV8856 is not set
> >> CONFIG_VIDEO_OV8865=3Dm
> >> # CONFIG_VIDEO_OV9640 is not set
> >> # CONFIG_VIDEO_OV9650 is not set
> >> CONFIG_VIDEO_OV9734=3Dm
> >> CONFIG_VIDEO_OV13858=3Dm
> >> # CONFIG_VIDEO_OV13B10 is not set
> >> # CONFIG_VIDEO_VS6624 is not set
> >> # CONFIG_VIDEO_MT9M001 is not set
> >> CONFIG_VIDEO_MT9M032=3Dm
> >> CONFIG_VIDEO_MT9M111=3Dm
> >> # CONFIG_VIDEO_MT9P031 is not set
> >> # CONFIG_VIDEO_MT9T001 is not set
> >> # CONFIG_VIDEO_MT9T112 is not set
> >> CONFIG_VIDEO_MT9V011=3Dm
> >> # CONFIG_VIDEO_MT9V032 is not set
> >> # CONFIG_VIDEO_MT9V111 is not set
> >> CONFIG_VIDEO_SR030PC30=3Dm
> >> CONFIG_VIDEO_NOON010PC30=3Dm
> >> CONFIG_VIDEO_M5MOLS=3Dm
> >> CONFIG_VIDEO_MAX9271_LIB=3Dm
> >> CONFIG_VIDEO_RDACM20=3Dm
> >> # CONFIG_VIDEO_RDACM21 is not set
> >> CONFIG_VIDEO_RJ54N1=3Dm
> >> CONFIG_VIDEO_S5K6AA=3Dm
> >> CONFIG_VIDEO_S5K6A3=3Dm
> >> CONFIG_VIDEO_S5K4ECGX=3Dm
> >> CONFIG_VIDEO_S5K5BAF=3Dm
> >> CONFIG_VIDEO_CCS=3Dm
> >> # CONFIG_VIDEO_ET8EK8 is not set
> >> # CONFIG_VIDEO_S5C73M3 is not set
> >> # end of Camera sensor devices
> >> =

> >> #
> >> # Lens drivers
> >> #
> >> CONFIG_VIDEO_AD5820=3Dm
> >> CONFIG_VIDEO_AK7375=3Dm
> >> # CONFIG_VIDEO_DW9714 is not set
> >> CONFIG_VIDEO_DW9768=3Dm
> >> # CONFIG_VIDEO_DW9807_VCM is not set
> >> # end of Lens drivers
> >> =

> >> #
> >> # Flash devices
> >> #
> >> # CONFIG_VIDEO_ADP1653 is not set
> >> # CONFIG_VIDEO_LM3560 is not set
> >> CONFIG_VIDEO_LM3646=3Dm
> >> # end of Flash devices
> >> =

> >> #
> >> # SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'
> >> #
> >> =

> >> #
> >> # Media SPI Adapters
> >> #
> >> CONFIG_CXD2880_SPI_DRV=3Dm
> >> # end of Media SPI Adapters
> >> =

> >> CONFIG_MEDIA_TUNER=3Dm
> >> =

> >> #
> >> # Tuner drivers auto-selected by 'Autoselect ancillary drivers'
> >> #
> >> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> >> CONFIG_MEDIA_TUNER_TDA8290=3Dm
> >> CONFIG_MEDIA_TUNER_TDA827X=3Dm
> >> CONFIG_MEDIA_TUNER_TDA18271=3Dm
> >> CONFIG_MEDIA_TUNER_TDA9887=3Dm
> >> CONFIG_MEDIA_TUNER_TEA5761=3Dm
> >> CONFIG_MEDIA_TUNER_TEA5767=3Dm
> >> CONFIG_MEDIA_TUNER_MT20XX=3Dm
> >> CONFIG_MEDIA_TUNER_MT2131=3Dm
> >> CONFIG_MEDIA_TUNER_XC2028=3Dm
> >> CONFIG_MEDIA_TUNER_XC5000=3Dm
> >> CONFIG_MEDIA_TUNER_XC4000=3Dm
> >> CONFIG_MEDIA_TUNER_MC44S803=3Dm
> >> CONFIG_MEDIA_TUNER_TDA18212=3Dm
> >> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> >> CONFIG_MEDIA_TUNER_SI2157=3Dm
> >> =

> >> #
> >> # DVB Frontend drivers auto-selected by 'Autoselect ancillary drivers'
> >> #
> >> =

> >> #
> >> # Multistandard (satellite) frontends
> >> #
> >> CONFIG_DVB_STB0899=3Dm
> >> CONFIG_DVB_STB6100=3Dm
> >> CONFIG_DVB_STV090x=3Dm
> >> CONFIG_DVB_STV0910=3Dm
> >> CONFIG_DVB_STV6110x=3Dm
> >> CONFIG_DVB_STV6111=3Dm
> >> CONFIG_DVB_MXL5XX=3Dm
> >> CONFIG_DVB_M88DS3103=3Dm
> >> =

> >> #
> >> # Multistandard (cable + terrestrial) frontends
> >> #
> >> CONFIG_DVB_DRXK=3Dm
> >> CONFIG_DVB_TDA18271C2DD=3Dm
> >> =

> >> #
> >> # DVB-S (satellite) frontends
> >> #
> >> CONFIG_DVB_STV0299=3Dm
> >> CONFIG_DVB_TDA8083=3Dm
> >> CONFIG_DVB_VES1X93=3Dm
> >> CONFIG_DVB_TS2020=3Dm
> >> CONFIG_DVB_MB86A16=3Dm
> >> =

> >> #
> >> # DVB-T (terrestrial) frontends
> >> #
> >> CONFIG_DVB_L64781=3Dm
> >> CONFIG_DVB_ZL10353=3Dm
> >> CONFIG_DVB_TDA10048=3Dm
> >> CONFIG_DVB_STV0367=3Dm
> >> CONFIG_DVB_CXD2841ER=3Dm
> >> CONFIG_DVB_SI2168=3Dm
> >> =

> >> #
> >> # DVB-C (cable) frontends
> >> #
> >> CONFIG_DVB_VES1820=3Dm
> >> CONFIG_DVB_TDA10021=3Dm
> >> CONFIG_DVB_TDA10023=3Dm
> >> CONFIG_DVB_STV0297=3Dm
> >> =

> >> #
> >> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> >> #
> >> CONFIG_DVB_LGDT330X=3Dm
> >> CONFIG_DVB_S5H1411=3Dm
> >> =

> >> #
> >> # ISDB-T (terrestrial) frontends
> >> #
> >> =

> >> #
> >> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> >> #
> >> =

> >> #
> >> # Digital terrestrial only tuners/PLL
> >> #
> >> CONFIG_DVB_PLL=3Dm
> >> =

> >> #
> >> # SEC control devices for DVB-S
> >> #
> >> CONFIG_DVB_LNBH25=3Dm
> >> CONFIG_DVB_LNBP21=3Dm
> >> CONFIG_DVB_TDA665x=3Dm
> >> CONFIG_DVB_HORUS3A=3Dm
> >> CONFIG_DVB_ASCOT2E=3Dm
> >> CONFIG_DVB_HELENE=3Dm
> >> =

> >> #
> >> # Common Interface (EN50221) controller drivers
> >> #
> >> CONFIG_DVB_CXD2099=3Dm
> >> =

> >> #
> >> # Tools to develop new frontends
> >> #
> >> CONFIG_DVB_DUMMY_FE=3Dm
> >> # end of Media ancillary drivers
> >> =

> >> #
> >> # Graphics support
> >> #
> >> # CONFIG_AGP is not set
> >> CONFIG_INTEL_GTT=3Dm
> >> CONFIG_VGA_ARB=3Dy
> >> CONFIG_VGA_ARB_MAX_GPUS=3D16
> >> # CONFIG_VGA_SWITCHEROO is not set
> >> CONFIG_DRM=3Dy
> >> CONFIG_DRM_MIPI_DBI=3Dy
> >> CONFIG_DRM_MIPI_DSI=3Dy
> >> # CONFIG_DRM_DP_AUX_CHARDEV is not set
> >> CONFIG_DRM_DEBUG_MM=3Dy
> >> # CONFIG_DRM_DEBUG_SELFTEST is not set
> >> CONFIG_DRM_KMS_HELPER=3Dy
> >> # CONFIG_DRM_FBDEV_EMULATION is not set
> >> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> >> # CONFIG_DRM_DP_CEC is not set
> >> CONFIG_DRM_TTM=3Dy
> >> CONFIG_DRM_VRAM_HELPER=3Dy
> >> CONFIG_DRM_TTM_HELPER=3Dy
> >> CONFIG_DRM_GEM_CMA_HELPER=3Dy
> >> CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
> >> CONFIG_DRM_SCHED=3Dy
> >> =

> >> #
> >> # I2C encoder or helper chips
> >> #
> >> # CONFIG_DRM_I2C_CH7006 is not set
> >> CONFIG_DRM_I2C_SIL164=3Dy
> >> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> >> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> >> # end of I2C encoder or helper chips
> >> =

> >> #
> >> # ARM devices
> >> #
> >> # end of ARM devices
> >> =

> >> # CONFIG_DRM_RADEON is not set
> >> # CONFIG_DRM_AMDGPU is not set
> >> # CONFIG_DRM_NOUVEAU is not set
> >> CONFIG_DRM_I915=3Dm
> >> CONFIG_DRM_I915_FORCE_PROBE=3D""
> >> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> >> CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
> >> CONFIG_DRM_I915_USERPTR=3Dy
> >> CONFIG_DRM_I915_REQUEST_TIMEOUT=3D20000
> >> CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
> >> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
> >> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
> >> CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D640
> >> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
> >> CONFIG_DRM_I915_STOP_TIMEOUT=3D100
> >> CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
> >> CONFIG_DRM_VGEM=3Dm
> >> CONFIG_DRM_VKMS=3Dm
> >> # CONFIG_DRM_VMWGFX is not set
> >> CONFIG_DRM_GMA500=3Dy
> >> CONFIG_DRM_AST=3Dy
> >> CONFIG_DRM_MGAG200=3Dy
> >> CONFIG_DRM_QXL=3Dy
> >> CONFIG_DRM_PANEL=3Dy
> >> =

> >> #
> >> # Display Panels
> >> #
> >> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> >> # CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
> >> # end of Display Panels
> >> =

> >> CONFIG_DRM_BRIDGE=3Dy
> >> CONFIG_DRM_PANEL_BRIDGE=3Dy
> >> =

> >> #
> >> # Display Interface Bridges
> >> #
> >> CONFIG_DRM_ANALOGIX_ANX78XX=3Dm
> >> CONFIG_DRM_ANALOGIX_DP=3Dm
> >> # end of Display Interface Bridges
> >> =

> >> CONFIG_DRM_ETNAVIV=3Dy
> >> CONFIG_DRM_ETNAVIV_THERMAL=3Dy
> >> CONFIG_DRM_BOCHS=3Dy
> >> CONFIG_DRM_CIRRUS_QEMU=3Dy
> >> CONFIG_DRM_SIMPLEDRM=3Dy
> >> CONFIG_TINYDRM_HX8357D=3Dy
> >> # CONFIG_TINYDRM_ILI9163 is not set
> >> # CONFIG_TINYDRM_ILI9225 is not set
> >> CONFIG_TINYDRM_ILI9341=3Dm
> >> # CONFIG_TINYDRM_ILI9486 is not set
> >> CONFIG_TINYDRM_MI0283QT=3Dy
> >> CONFIG_TINYDRM_REPAPER=3Dy
> >> CONFIG_TINYDRM_ST7586=3Dy
> >> CONFIG_TINYDRM_ST7735R=3Dm
> >> # CONFIG_DRM_VBOXVIDEO is not set
> >> # CONFIG_DRM_LEGACY is not set
> >> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> >> CONFIG_DRM_NOMODESET=3Dy
> >> =

> >> #
> >> # Frame buffer Devices
> >> #
> >> CONFIG_FB_CMDLINE=3Dy
> >> CONFIG_FB_NOTIFY=3Dy
> >> CONFIG_FB=3Dy
> >> CONFIG_FIRMWARE_EDID=3Dy
> >> CONFIG_FB_DDC=3Dy
> >> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> >> CONFIG_FB_CFB_FILLRECT=3Dy
> >> CONFIG_FB_CFB_COPYAREA=3Dy
> >> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> >> CONFIG_FB_SYS_FILLRECT=3Dy
> >> CONFIG_FB_SYS_COPYAREA=3Dy
> >> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> >> # CONFIG_FB_FOREIGN_ENDIAN is not set
> >> CONFIG_FB_SYS_FOPS=3Dy
> >> CONFIG_FB_DEFERRED_IO=3Dy
> >> CONFIG_FB_HECUBA=3Dm
> >> CONFIG_FB_SVGALIB=3Dm
> >> CONFIG_FB_BACKLIGHT=3Dy
> >> CONFIG_FB_MODE_HELPERS=3Dy
> >> CONFIG_FB_TILEBLITTING=3Dy
> >> =

> >> #
> >> # Frame buffer hardware drivers
> >> #
> >> CONFIG_FB_CIRRUS=3Dy
> >> CONFIG_FB_PM2=3Dm
> >> # CONFIG_FB_PM2_FIFO_DISCONNECT is not set
> >> CONFIG_FB_CYBER2000=3Dy
> >> # CONFIG_FB_CYBER2000_DDC is not set
> >> # CONFIG_FB_ARC is not set
> >> CONFIG_FB_ASILIANT=3Dy
> >> CONFIG_FB_IMSTT=3Dy
> >> # CONFIG_FB_VGA16 is not set
> >> CONFIG_FB_VESA=3Dy
> >> CONFIG_FB_N411=3Dm
> >> CONFIG_FB_HGA=3Dy
> >> CONFIG_FB_OPENCORES=3Dy
> >> CONFIG_FB_S1D13XXX=3Dy
> >> CONFIG_FB_NVIDIA=3Dy
> >> # CONFIG_FB_NVIDIA_I2C is not set
> >> # CONFIG_FB_NVIDIA_DEBUG is not set
> >> CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
> >> CONFIG_FB_RIVA=3Dm
> >> CONFIG_FB_RIVA_I2C=3Dy
> >> # CONFIG_FB_RIVA_DEBUG is not set
> >> CONFIG_FB_RIVA_BACKLIGHT=3Dy
> >> # CONFIG_FB_I740 is not set
> >> CONFIG_FB_LE80578=3Dy
> >> CONFIG_FB_CARILLO_RANCH=3Dy
> >> # CONFIG_FB_MATROX is not set
> >> CONFIG_FB_RADEON=3Dm
> >> CONFIG_FB_RADEON_I2C=3Dy
> >> # CONFIG_FB_RADEON_BACKLIGHT is not set
> >> CONFIG_FB_RADEON_DEBUG=3Dy
> >> CONFIG_FB_ATY128=3Dy
> >> CONFIG_FB_ATY128_BACKLIGHT=3Dy
> >> # CONFIG_FB_ATY is not set
> >> # CONFIG_FB_S3 is not set
> >> # CONFIG_FB_SAVAGE is not set
> >> # CONFIG_FB_SIS is not set
> >> CONFIG_FB_VIA=3Dm
> >> CONFIG_FB_VIA_DIRECT_PROCFS=3Dy
> >> # CONFIG_FB_VIA_X_COMPATIBILITY is not set
> >> CONFIG_FB_NEOMAGIC=3Dm
> >> CONFIG_FB_KYRO=3Dy
> >> CONFIG_FB_3DFX=3Dm
> >> CONFIG_FB_3DFX_ACCEL=3Dy
> >> CONFIG_FB_3DFX_I2C=3Dy
> >> # CONFIG_FB_VOODOO1 is not set
> >> # CONFIG_FB_VT8623 is not set
> >> CONFIG_FB_TRIDENT=3Dy
> >> CONFIG_FB_ARK=3Dm
> >> CONFIG_FB_PM3=3Dy
> >> CONFIG_FB_CARMINE=3Dy
> >> # CONFIG_FB_CARMINE_DRAM_EVAL is not set
> >> CONFIG_CARMINE_DRAM_CUSTOM=3Dy
> >> # CONFIG_FB_GEODE is not set
> >> # CONFIG_FB_IBM_GXT4500 is not set
> >> # CONFIG_FB_GOLDFISH is not set
> >> # CONFIG_FB_VIRTUAL is not set
> >> CONFIG_FB_METRONOME=3Dy
> >> CONFIG_FB_MB862XX=3Dy
> >> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> >> # CONFIG_FB_MB862XX_I2C is not set
> >> # CONFIG_FB_SSD1307 is not set
> >> # CONFIG_FB_SM712 is not set
> >> # end of Frame buffer Devices
> >> =

> >> #
> >> # Backlight & LCD device support
> >> #
> >> CONFIG_LCD_CLASS_DEVICE=3Dm
> >> CONFIG_LCD_L4F00242T03=3Dm
> >> # CONFIG_LCD_LMS283GF05 is not set
> >> CONFIG_LCD_LTV350QV=3Dm
> >> CONFIG_LCD_ILI922X=3Dm
> >> CONFIG_LCD_ILI9320=3Dm
> >> CONFIG_LCD_TDO24M=3Dm
> >> CONFIG_LCD_VGG2432A4=3Dm
> >> CONFIG_LCD_PLATFORM=3Dm
> >> CONFIG_LCD_AMS369FG06=3Dm
> >> # CONFIG_LCD_LMS501KF03 is not set
> >> CONFIG_LCD_HX8357=3Dm
> >> # CONFIG_LCD_OTM3225A is not set
> >> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> >> CONFIG_BACKLIGHT_KTD253=3Dm
> >> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dm
> >> CONFIG_BACKLIGHT_DA9052=3Dm
> >> CONFIG_BACKLIGHT_APPLE=3Dy
> >> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> >> CONFIG_BACKLIGHT_RT4831=3Dy
> >> CONFIG_BACKLIGHT_SAHARA=3Dy
> >> # CONFIG_BACKLIGHT_WM831X is not set
> >> CONFIG_BACKLIGHT_ADP8860=3Dm
> >> CONFIG_BACKLIGHT_ADP8870=3Dm
> >> CONFIG_BACKLIGHT_88PM860X=3Dy
> >> CONFIG_BACKLIGHT_PCF50633=3Dy
> >> # CONFIG_BACKLIGHT_AAT2870 is not set
> >> # CONFIG_BACKLIGHT_LM3639 is not set
> >> CONFIG_BACKLIGHT_SKY81452=3Dm
> >> CONFIG_BACKLIGHT_AS3711=3Dy
> >> CONFIG_BACKLIGHT_GPIO=3Dm
> >> # CONFIG_BACKLIGHT_LV5207LP is not set
> >> # CONFIG_BACKLIGHT_BD6107 is not set
> >> # CONFIG_BACKLIGHT_ARCXCNN is not set
> >> CONFIG_BACKLIGHT_RAVE_SP=3Dy
> >> # end of Backlight & LCD device support
> >> =

> >> CONFIG_VGASTATE=3Dy
> >> CONFIG_HDMI=3Dy
> >> =

> >> #
> >> # Console display driver support
> >> #
> >> CONFIG_VGA_CONSOLE=3Dy
> >> CONFIG_DUMMY_CONSOLE=3Dy
> >> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> >> CONFIG_DUMMY_CONSOLE_ROWS=3D25
> >> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> >> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> >> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> >> # CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
> >> # end of Console display driver support
> >> =

> >> CONFIG_LOGO=3Dy
> >> CONFIG_LOGO_LINUX_MONO=3Dy
> >> # CONFIG_LOGO_LINUX_VGA16 is not set
> >> # CONFIG_LOGO_LINUX_CLUT224 is not set
> >> # end of Graphics support
> >> =

> >> # CONFIG_SOUND is not set
> >> =

> >> #
> >> # HID support
> >> #
> >> CONFIG_HID=3Dy
> >> CONFIG_HID_BATTERY_STRENGTH=3Dy
> >> # CONFIG_HIDRAW is not set
> >> CONFIG_UHID=3Dy
> >> CONFIG_HID_GENERIC=3Dy
> >> =

> >> #
> >> # Special HID drivers
> >> #
> >> CONFIG_HID_A4TECH=3Dm
> >> CONFIG_HID_ACRUX=3Dy
> >> CONFIG_HID_ACRUX_FF=3Dy
> >> CONFIG_HID_APPLE=3Dm
> >> CONFIG_HID_AUREAL=3Dm
> >> CONFIG_HID_BELKIN=3Dm
> >> CONFIG_HID_CHERRY=3Dm
> >> CONFIG_HID_COUGAR=3Dy
> >> CONFIG_HID_MACALLY=3Dm
> >> CONFIG_HID_CMEDIA=3Dy
> >> # CONFIG_HID_CYPRESS is not set
> >> # CONFIG_HID_DRAGONRISE is not set
> >> CONFIG_HID_EMS_FF=3Dm
> >> CONFIG_HID_ELECOM=3Dy
> >> # CONFIG_HID_EZKEY is not set
> >> CONFIG_HID_GEMBIRD=3Dy
> >> # CONFIG_HID_GFRM is not set
> >> CONFIG_HID_GLORIOUS=3Dy
> >> CONFIG_HID_VIVALDI=3Dm
> >> CONFIG_HID_KEYTOUCH=3Dm
> >> CONFIG_HID_KYE=3Dy
> >> CONFIG_HID_WALTOP=3Dm
> >> CONFIG_HID_VIEWSONIC=3Dm
> >> # CONFIG_HID_XIAOMI is not set
> >> CONFIG_HID_GYRATION=3Dy
> >> # CONFIG_HID_ICADE is not set
> >> CONFIG_HID_ITE=3Dy
> >> CONFIG_HID_JABRA=3Dm
> >> # CONFIG_HID_TWINHAN is not set
> >> CONFIG_HID_KENSINGTON=3Dm
> >> CONFIG_HID_LCPOWER=3Dy
> >> CONFIG_HID_LED=3Dy
> >> CONFIG_HID_LENOVO=3Dy
> >> # CONFIG_HID_MAGICMOUSE is not set
> >> # CONFIG_HID_MALTRON is not set
> >> CONFIG_HID_MAYFLASH=3Dm
> >> CONFIG_HID_REDRAGON=3Dy
> >> # CONFIG_HID_MICROSOFT is not set
> >> # CONFIG_HID_MONTEREY is not set
> >> # CONFIG_HID_MULTITOUCH is not set
> >> # CONFIG_HID_NINTENDO is not set
> >> # CONFIG_HID_NTI is not set
> >> CONFIG_HID_ORTEK=3Dy
> >> # CONFIG_HID_PANTHERLORD is not set
> >> CONFIG_HID_PETALYNX=3Dm
> >> # CONFIG_HID_PICOLCD is not set
> >> CONFIG_HID_PLANTRONICS=3Dy
> >> CONFIG_HID_PRIMAX=3Dm
> >> # CONFIG_HID_SAITEK is not set
> >> CONFIG_HID_SEMITEK=3Dy
> >> CONFIG_HID_SPEEDLINK=3Dm
> >> CONFIG_HID_STEAM=3Dm
> >> # CONFIG_HID_STEELSERIES is not set
> >> CONFIG_HID_SUNPLUS=3Dy
> >> CONFIG_HID_RMI=3Dm
> >> CONFIG_HID_GREENASIA=3Dy
> >> CONFIG_GREENASIA_FF=3Dy
> >> CONFIG_HID_SMARTJOYPLUS=3Dy
> >> CONFIG_SMARTJOYPLUS_FF=3Dy
> >> # CONFIG_HID_TIVO is not set
> >> CONFIG_HID_TOPSEED=3Dm
> >> CONFIG_HID_THINGM=3Dy
> >> # CONFIG_HID_UDRAW_PS3 is not set
> >> CONFIG_HID_WIIMOTE=3Dm
> >> CONFIG_HID_XINMO=3Dy
> >> # CONFIG_HID_ZEROPLUS is not set
> >> CONFIG_HID_ZYDACRON=3Dy
> >> CONFIG_HID_SENSOR_HUB=3Dy
> >> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dy
> >> # CONFIG_HID_ALPS is not set
> >> # end of Special HID drivers
> >> =

> >> #
> >> # I2C HID support
> >> #
> >> CONFIG_I2C_HID_ACPI=3Dy
> >> # end of I2C HID support
> >> =

> >> CONFIG_I2C_HID_CORE=3Dy
> >> # end of HID support
> >> =

> >> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> >> CONFIG_USB_SUPPORT=3Dy
> >> # CONFIG_USB_ULPI_BUS is not set
> >> # CONFIG_USB_CONN_GPIO is not set
> >> CONFIG_USB_ARCH_HAS_HCD=3Dy
> >> # CONFIG_USB is not set
> >> CONFIG_USB_PCI=3Dy
> >> =

> >> #
> >> # USB port drivers
> >> #
> >> =

> >> #
> >> # USB Physical Layer drivers
> >> #
> >> # CONFIG_NOP_USB_XCEIV is not set
> >> # CONFIG_USB_GPIO_VBUS is not set
> >> # end of USB Physical Layer drivers
> >> =

> >> # CONFIG_USB_GADGET is not set
> >> # CONFIG_TYPEC is not set
> >> # CONFIG_USB_ROLE_SWITCH is not set
> >> # CONFIG_MMC is not set
> >> CONFIG_MEMSTICK=3Dy
> >> CONFIG_MEMSTICK_DEBUG=3Dy
> >> =

> >> #
> >> # MemoryStick drivers
> >> #
> >> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> >> CONFIG_MSPRO_BLOCK=3Dy
> >> CONFIG_MS_BLOCK=3Dm
> >> =

> >> #
> >> # MemoryStick Host Controller Drivers
> >> #
> >> CONFIG_MEMSTICK_TIFM_MS=3Dm
> >> CONFIG_MEMSTICK_JMICRON_38X=3Dy
> >> CONFIG_MEMSTICK_R592=3Dy
> >> CONFIG_NEW_LEDS=3Dy
> >> CONFIG_LEDS_CLASS=3Dy
> >> # CONFIG_LEDS_CLASS_FLASH is not set
> >> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> >> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> >> =

> >> #
> >> # LED drivers
> >> #
> >> CONFIG_LEDS_88PM860X=3Dy
> >> # CONFIG_LEDS_APU is not set
> >> CONFIG_LEDS_LM3530=3Dm
> >> # CONFIG_LEDS_LM3532 is not set
> >> CONFIG_LEDS_LM3642=3Dy
> >> # CONFIG_LEDS_MT6323 is not set
> >> CONFIG_LEDS_PCA9532=3Dy
> >> # CONFIG_LEDS_PCA9532_GPIO is not set
> >> CONFIG_LEDS_GPIO=3Dm
> >> CONFIG_LEDS_LP3944=3Dy
> >> CONFIG_LEDS_LP3952=3Dm
> >> CONFIG_LEDS_LP50XX=3Dy
> >> CONFIG_LEDS_LP8788=3Dy
> >> CONFIG_LEDS_CLEVO_MAIL=3Dm
> >> CONFIG_LEDS_PCA955X=3Dy
> >> # CONFIG_LEDS_PCA955X_GPIO is not set
> >> # CONFIG_LEDS_PCA963X is not set
> >> # CONFIG_LEDS_WM831X_STATUS is not set
> >> # CONFIG_LEDS_DA9052 is not set
> >> CONFIG_LEDS_DAC124S085=3Dm
> >> CONFIG_LEDS_REGULATOR=3Dy
> >> CONFIG_LEDS_BD2802=3Dy
> >> CONFIG_LEDS_INTEL_SS4200=3Dy
> >> CONFIG_LEDS_LT3593=3Dm
> >> CONFIG_LEDS_MC13783=3Dy
> >> CONFIG_LEDS_TCA6507=3Dm
> >> # CONFIG_LEDS_TLC591XX is not set
> >> CONFIG_LEDS_LM355x=3Dm
> >> CONFIG_LEDS_OT200=3Dm
> >> CONFIG_LEDS_MENF21BMC=3Dy
> >> =

> >> #
> >> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HI=
D_THINGM)
> >> #
> >> CONFIG_LEDS_BLINKM=3Dm
> >> CONFIG_LEDS_MLXCPLD=3Dm
> >> # CONFIG_LEDS_MLXREG is not set
> >> CONFIG_LEDS_USER=3Dm
> >> # CONFIG_LEDS_NIC78BX is not set
> >> CONFIG_LEDS_TI_LMU_COMMON=3Dy
> >> # CONFIG_LEDS_TPS6105X is not set
> >> =

> >> #
> >> # Flash and Torch LED drivers
> >> #
> >> =

> >> #
> >> # LED Triggers
> >> #
> >> CONFIG_LEDS_TRIGGERS=3Dy
> >> # CONFIG_LEDS_TRIGGER_TIMER is not set
> >> CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> >> # CONFIG_LEDS_TRIGGER_MTD is not set
> >> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> >> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> >> CONFIG_LEDS_TRIGGER_CPU=3Dy
> >> CONFIG_LEDS_TRIGGER_ACTIVITY=3Dy
> >> # CONFIG_LEDS_TRIGGER_GPIO is not set
> >> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> >> =

> >> #
> >> # iptables trigger is under Netfilter config (LED target)
> >> #
> >> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> >> # CONFIG_LEDS_TRIGGER_CAMERA is not set
> >> # CONFIG_LEDS_TRIGGER_PANIC is not set
> >> # CONFIG_LEDS_TRIGGER_NETDEV is not set
> >> CONFIG_LEDS_TRIGGER_PATTERN=3Dy
> >> CONFIG_LEDS_TRIGGER_AUDIO=3Dm
> >> CONFIG_LEDS_TRIGGER_TTY=3Dy
> >> =

> >> #
> >> # Simple LED drivers
> >> #
> >> CONFIG_LEDS_SIEMENS_SIMATIC_IPC=3Dm
> >> # CONFIG_ACCESSIBILITY is not set
> >> # CONFIG_INFINIBAND is not set
> >> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> >> CONFIG_EDAC_SUPPORT=3Dy
> >> CONFIG_EDAC=3Dm
> >> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> >> # CONFIG_EDAC_DEBUG is not set
> >> # CONFIG_EDAC_AMD76X is not set
> >> CONFIG_EDAC_E7XXX=3Dm
> >> # CONFIG_EDAC_E752X is not set
> >> CONFIG_EDAC_I82875P=3Dm
> >> # CONFIG_EDAC_I82975X is not set
> >> # CONFIG_EDAC_I3000 is not set
> >> CONFIG_EDAC_I3200=3Dm
> >> CONFIG_EDAC_IE31200=3Dm
> >> # CONFIG_EDAC_X38 is not set
> >> CONFIG_EDAC_I5400=3Dm
> >> CONFIG_EDAC_I82860=3Dm
> >> CONFIG_EDAC_R82600=3Dm
> >> CONFIG_EDAC_I5000=3Dm
> >> CONFIG_EDAC_I5100=3Dm
> >> CONFIG_EDAC_I7300=3Dm
> >> CONFIG_RTC_LIB=3Dy
> >> CONFIG_RTC_MC146818_LIB=3Dy
> >> # CONFIG_RTC_CLASS is not set
> >> CONFIG_DMADEVICES=3Dy
> >> CONFIG_DMADEVICES_DEBUG=3Dy
> >> # CONFIG_DMADEVICES_VDEBUG is not set
> >> =

> >> #
> >> # DMA Devices
> >> #
> >> CONFIG_DMA_ENGINE=3Dy
> >> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> >> CONFIG_DMA_ACPI=3Dy
> >> # CONFIG_ALTERA_MSGDMA is not set
> >> CONFIG_INTEL_IDMA64=3Dm
> >> # CONFIG_PCH_DMA is not set
> >> # CONFIG_PLX_DMA is not set
> >> # CONFIG_TIMB_DMA is not set
> >> CONFIG_QCOM_HIDMA_MGMT=3Dy
> >> CONFIG_QCOM_HIDMA=3Dm
> >> CONFIG_DW_DMAC_CORE=3Dy
> >> CONFIG_DW_DMAC=3Dy
> >> CONFIG_DW_DMAC_PCI=3Dm
> >> CONFIG_HSU_DMA=3Dy
> >> CONFIG_SF_PDMA=3Dm
> >> # CONFIG_INTEL_LDMA is not set
> >> =

> >> #
> >> # DMA Clients
> >> #
> >> CONFIG_ASYNC_TX_DMA=3Dy
> >> CONFIG_DMATEST=3Dy
> >> CONFIG_DMA_ENGINE_RAID=3Dy
> >> =

> >> #
> >> # DMABUF options
> >> #
> >> CONFIG_SYNC_FILE=3Dy
> >> CONFIG_SW_SYNC=3Dy
> >> CONFIG_UDMABUF=3Dy
> >> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> >> CONFIG_DMABUF_DEBUG=3Dy
> >> # CONFIG_DMABUF_SELFTESTS is not set
> >> CONFIG_DMABUF_HEAPS=3Dy
> >> CONFIG_DMABUF_SYSFS_STATS=3Dy
> >> CONFIG_DMABUF_HEAPS_SYSTEM=3Dy
> >> CONFIG_DMABUF_HEAPS_CMA=3Dy
> >> # end of DMABUF options
> >> =

> >> # CONFIG_AUXDISPLAY is not set
> >> # CONFIG_PANEL is not set
> >> CONFIG_UIO=3Dy
> >> # CONFIG_UIO_CIF is not set
> >> CONFIG_UIO_PDRV_GENIRQ=3Dy
> >> CONFIG_UIO_DMEM_GENIRQ=3Dy
> >> CONFIG_UIO_AEC=3Dy
> >> CONFIG_UIO_SERCOS3=3Dy
> >> CONFIG_UIO_PCI_GENERIC=3Dm
> >> CONFIG_UIO_NETX=3Dm
> >> CONFIG_UIO_PRUSS=3Dy
> >> # CONFIG_UIO_MF624 is not set
> >> CONFIG_UIO_DFL=3Dm
> >> CONFIG_VFIO=3Dm
> >> CONFIG_VFIO_IOMMU_TYPE1=3Dm
> >> CONFIG_VFIO_NOIOMMU=3Dy
> >> CONFIG_VFIO_PCI_MMAP=3Dy
> >> CONFIG_VFIO_PCI_INTX=3Dy
> >> # CONFIG_VFIO_PCI is not set
> >> CONFIG_VFIO_MDEV=3Dm
> >> # CONFIG_VIRT_DRIVERS is not set
> >> CONFIG_VIRTIO=3Dy
> >> # CONFIG_VIRTIO_MENU is not set
> >> # CONFIG_VDPA is not set
> >> CONFIG_VHOST_IOTLB=3Dm
> >> CONFIG_VHOST=3Dm
> >> CONFIG_VHOST_MENU=3Dy
> >> # CONFIG_VHOST_NET is not set
> >> CONFIG_VHOST_SCSI=3Dm
> >> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> >> =

> >> #
> >> # Microsoft Hyper-V guest support
> >> #
> >> # end of Microsoft Hyper-V guest support
> >> =

> >> CONFIG_GREYBUS=3Dm
> >> # CONFIG_COMEDI is not set
> >> CONFIG_STAGING=3Dy
> >> # CONFIG_RTLLIB is not set
> >> =

> >> #
> >> # IIO staging drivers
> >> #
> >> =

> >> #
> >> # Accelerometers
> >> #
> >> CONFIG_ADIS16203=3Dm
> >> CONFIG_ADIS16240=3Dm
> >> # end of Accelerometers
> >> =

> >> #
> >> # Analog to digital converters
> >> #
> >> CONFIG_AD7816=3Dm
> >> CONFIG_AD7280=3Dm
> >> # end of Analog to digital converters
> >> =

> >> #
> >> # Analog digital bi-direction converters
> >> #
> >> CONFIG_ADT7316=3Dm
> >> # CONFIG_ADT7316_SPI is not set
> >> # CONFIG_ADT7316_I2C is not set
> >> # end of Analog digital bi-direction converters
> >> =

> >> #
> >> # Capacitance to digital converters
> >> #
> >> CONFIG_AD7746=3Dm
> >> # end of Capacitance to digital converters
> >> =

> >> #
> >> # Direct Digital Synthesis
> >> #
> >> CONFIG_AD9832=3Dm
> >> # CONFIG_AD9834 is not set
> >> # end of Direct Digital Synthesis
> >> =

> >> #
> >> # Network Analyzer, Impedance Converters
> >> #
> >> CONFIG_AD5933=3Dm
> >> # end of Network Analyzer, Impedance Converters
> >> =

> >> #
> >> # Active energy metering IC
> >> #
> >> CONFIG_ADE7854=3Dm
> >> # CONFIG_ADE7854_I2C is not set
> >> # CONFIG_ADE7854_SPI is not set
> >> # end of Active energy metering IC
> >> =

> >> #
> >> # Resolver to digital converters
> >> #
> >> # CONFIG_AD2S1210 is not set
> >> # end of Resolver to digital converters
> >> # end of IIO staging drivers
> >> =

> >> # CONFIG_FB_SM750 is not set
> >> CONFIG_STAGING_MEDIA=3Dy
> >> CONFIG_VIDEO_ZORAN=3Dm
> >> CONFIG_VIDEO_ZORAN_DC30=3Dm
> >> CONFIG_VIDEO_ZORAN_ZR36060=3Dm
> >> # CONFIG_VIDEO_ZORAN_BUZ is not set
> >> CONFIG_VIDEO_ZORAN_DC10=3Dm
> >> CONFIG_VIDEO_ZORAN_LML33=3Dm
> >> # CONFIG_VIDEO_ZORAN_LML33R10 is not set
> >> # CONFIG_VIDEO_ZORAN_AVS6EYES is not set
> >> CONFIG_VIDEO_IPU3_IMGU=3Dm
> >> CONFIG_DVB_AV7110_IR=3Dy
> >> CONFIG_DVB_AV7110=3Dm
> >> # CONFIG_DVB_AV7110_OSD is not set
> >> CONFIG_DVB_SP8870=3Dm
> >> =

> >> #
> >> # Android
> >> #
> >> CONFIG_ASHMEM=3Dy
> >> # end of Android
> >> =

> >> # CONFIG_FIREWIRE_SERIAL is not set
> >> # CONFIG_GS_FPGABOOT is not set
> >> # CONFIG_UNISYSSPAR is not set
> >> # CONFIG_FB_TFT is not set
> >> CONFIG_MOST_COMPONENTS=3Dy
> >> # CONFIG_MOST_NET is not set
> >> CONFIG_MOST_VIDEO=3Dm
> >> CONFIG_MOST_I2C=3Dy
> >> # CONFIG_GREYBUS_BOOTROM is not set
> >> # CONFIG_GREYBUS_FIRMWARE is not set
> >> # CONFIG_GREYBUS_HID is not set
> >> CONFIG_GREYBUS_LIGHT=3Dm
> >> CONFIG_GREYBUS_LOG=3Dm
> >> CONFIG_GREYBUS_LOOPBACK=3Dm
> >> CONFIG_GREYBUS_POWER=3Dm
> >> # CONFIG_GREYBUS_RAW is not set
> >> CONFIG_GREYBUS_VIBRATOR=3Dm
> >> CONFIG_GREYBUS_BRIDGED_PHY=3Dm
> >> CONFIG_GREYBUS_GPIO=3Dm
> >> # CONFIG_GREYBUS_I2C is not set
> >> CONFIG_GREYBUS_SPI=3Dm
> >> CONFIG_GREYBUS_UART=3Dm
> >> CONFIG_PI433=3Dm
> >> CONFIG_FIELDBUS_DEV=3Dm
> >> # CONFIG_QLGE is not set
> >> CONFIG_X86_PLATFORM_DEVICES=3Dy
> >> # CONFIG_ACPI_WMI is not set
> >> # CONFIG_ACERHDF is not set
> >> # CONFIG_ACER_WIRELESS is not set
> >> CONFIG_ADV_SWBUTTON=3Dy
> >> CONFIG_APPLE_GMUX=3Dy
> >> # CONFIG_ASUS_LAPTOP is not set
> >> CONFIG_ASUS_WIRELESS=3Dy
> >> CONFIG_ASUS_TF103C_DOCK=3Dy
> >> # CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
> >> # CONFIG_FUJITSU_LAPTOP is not set
> >> CONFIG_FUJITSU_TABLET=3Dm
> >> # CONFIG_GPD_POCKET_FAN is not set
> >> CONFIG_HP_ACCEL=3Dm
> >> CONFIG_WIRELESS_HOTKEY=3Dm
> >> CONFIG_IBM_RTL=3Dy
> >> # CONFIG_SENSORS_HDAPS is not set
> >> CONFIG_INTEL_ATOMISP2_PDX86=3Dy
> >> CONFIG_INTEL_ATOMISP2_LED=3Dm
> >> CONFIG_INTEL_ATOMISP2_PM=3Dy
> >> # CONFIG_INTEL_SAR_INT1092 is not set
> >> # CONFIG_INTEL_SKL_INT3472 is not set
> >> # CONFIG_INTEL_PMC_CORE is not set
> >> CONFIG_INTEL_PMT_CLASS=3Dm
> >> CONFIG_INTEL_PMT_TELEMETRY=3Dm
> >> CONFIG_INTEL_PMT_CRASHLOG=3Dm
> >> # CONFIG_INTEL_HID_EVENT is not set
> >> CONFIG_INTEL_VBTN=3Dy
> >> CONFIG_INTEL_PUNIT_IPC=3Dm
> >> # CONFIG_INTEL_RST is not set
> >> # CONFIG_INTEL_SMARTCONNECT is not set
> >> CONFIG_INTEL_VSEC=3Dm
> >> # CONFIG_PCENGINES_APU2 is not set
> >> CONFIG_BARCO_P50_GPIO=3Dm
> >> CONFIG_SAMSUNG_LAPTOP=3Dm
> >> CONFIG_SAMSUNG_Q10=3Dy
> >> CONFIG_TOSHIBA_BT_RFKILL=3Dy
> >> # CONFIG_TOSHIBA_HAPS is not set
> >> # CONFIG_ACPI_CMPC is not set
> >> CONFIG_PANASONIC_LAPTOP=3Dy
> >> CONFIG_TOPSTAR_LAPTOP=3Dy
> >> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> >> CONFIG_MLX_PLATFORM=3Dm
> >> CONFIG_X86_ANDROID_TABLETS=3Dy
> >> # CONFIG_INTEL_IPS is not set
> >> CONFIG_INTEL_SCU_IPC=3Dy
> >> # CONFIG_INTEL_SCU_PCI is not set
> >> # CONFIG_INTEL_SCU_PLATFORM is not set
> >> CONFIG_SIEMENS_SIMATIC_IPC=3Dy
> >> CONFIG_PMC_ATOM=3Dy
> >> # CONFIG_GOLDFISH_PIPE is not set
> >> CONFIG_CHROME_PLATFORMS=3Dy
> >> # CONFIG_CHROMEOS_LAPTOP is not set
> >> CONFIG_CHROMEOS_PSTORE=3Dm
> >> CONFIG_CHROMEOS_TBMC=3Dy
> >> CONFIG_CROS_EC=3Dm
> >> CONFIG_CROS_EC_I2C=3Dm
> >> CONFIG_CROS_EC_SPI=3Dm
> >> # CONFIG_CROS_EC_LPC is not set
> >> CONFIG_CROS_EC_PROTO=3Dy
> >> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> >> CONFIG_MELLANOX_PLATFORM=3Dy
> >> CONFIG_MLXREG_HOTPLUG=3Dm
> >> CONFIG_MLXREG_IO=3Dm
> >> CONFIG_MLXREG_LC=3Dy
> >> CONFIG_SURFACE_PLATFORMS=3Dy
> >> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> >> # CONFIG_SURFACE_GPE is not set
> >> # CONFIG_SURFACE_HOTPLUG is not set
> >> CONFIG_SURFACE_PRO3_BUTTON=3Dm
> >> # CONFIG_SURFACE_AGGREGATOR is not set
> >> CONFIG_HAVE_CLK=3Dy
> >> CONFIG_HAVE_CLK_PREPARE=3Dy
> >> CONFIG_COMMON_CLK=3Dy
> >> # CONFIG_COMMON_CLK_WM831X is not set
> >> CONFIG_LMK04832=3Dm
> >> CONFIG_COMMON_CLK_MAX9485=3Dy
> >> CONFIG_COMMON_CLK_SI5341=3Dy
> >> # CONFIG_COMMON_CLK_SI5351 is not set
> >> CONFIG_COMMON_CLK_SI544=3Dy
> >> CONFIG_COMMON_CLK_CDCE706=3Dm
> >> CONFIG_COMMON_CLK_CS2000_CP=3Dm
> >> # CONFIG_COMMON_CLK_LAN966X is not set
> >> # CONFIG_XILINX_VCU is not set
> >> # CONFIG_HWSPINLOCK is not set
> >> =

> >> #
> >> # Clock Source drivers
> >> #
> >> CONFIG_CLKSRC_I8253=3Dy
> >> CONFIG_CLKEVT_I8253=3Dy
> >> CONFIG_I8253_LOCK=3Dy
> >> CONFIG_CLKBLD_I8253=3Dy
> >> # end of Clock Source drivers
> >> =

> >> CONFIG_MAILBOX=3Dy
> >> CONFIG_PCC=3Dy
> >> CONFIG_ALTERA_MBOX=3Dm
> >> CONFIG_IOMMU_IOVA=3Dy
> >> CONFIG_IOMMU_API=3Dy
> >> CONFIG_IOMMU_SUPPORT=3Dy
> >> =

> >> #
> >> # Generic IOMMU Pagetable Support
> >> #
> >> # end of Generic IOMMU Pagetable Support
> >> =

> >> CONFIG_IOMMU_DEBUGFS=3Dy
> >> # CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
> >> # CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
> >> CONFIG_IOMMU_DEFAULT_PASSTHROUGH=3Dy
> >> CONFIG_IOMMU_DMA=3Dy
> >> CONFIG_VIRTIO_IOMMU=3Dm
> >> =

> >> #
> >> # Remoteproc drivers
> >> #
> >> # CONFIG_REMOTEPROC is not set
> >> # end of Remoteproc drivers
> >> =

> >> #
> >> # Rpmsg drivers
> >> #
> >> CONFIG_RPMSG=3Dy
> >> # CONFIG_RPMSG_CHAR is not set
> >> CONFIG_RPMSG_NS=3Dy
> >> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> >> CONFIG_RPMSG_VIRTIO=3Dy
> >> # end of Rpmsg drivers
> >> =

> >> CONFIG_SOUNDWIRE=3Dy
> >> =

> >> #
> >> # SoundWire Devices
> >> #
> >> =

> >> #
> >> # SOC (System On Chip) specific Drivers
> >> #
> >> =

> >> #
> >> # Amlogic SoC drivers
> >> #
> >> # end of Amlogic SoC drivers
> >> =

> >> #
> >> # Broadcom SoC drivers
> >> #
> >> # end of Broadcom SoC drivers
> >> =

> >> #
> >> # NXP/Freescale QorIQ SoC drivers
> >> #
> >> # end of NXP/Freescale QorIQ SoC drivers
> >> =

> >> #
> >> # i.MX SoC drivers
> >> #
> >> # end of i.MX SoC drivers
> >> =

> >> #
> >> # Enable LiteX SoC Builder specific drivers
> >> #
> >> # end of Enable LiteX SoC Builder specific drivers
> >> =

> >> #
> >> # Qualcomm SoC drivers
> >> #
> >> # end of Qualcomm SoC drivers
> >> =

> >> # CONFIG_SOC_TI is not set
> >> =

> >> #
> >> # Xilinx SoC drivers
> >> #
> >> # end of Xilinx SoC drivers
> >> # end of SOC (System On Chip) specific Drivers
> >> =

> >> CONFIG_PM_DEVFREQ=3Dy
> >> =

> >> #
> >> # DEVFREQ Governors
> >> #
> >> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> >> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> >> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> >> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> >> CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
> >> =

> >> #
> >> # DEVFREQ Drivers
> >> #
> >> CONFIG_PM_DEVFREQ_EVENT=3Dy
> >> CONFIG_EXTCON=3Dy
> >> =

> >> #
> >> # Extcon Device Drivers
> >> #
> >> # CONFIG_EXTCON_ADC_JACK is not set
> >> # CONFIG_EXTCON_AXP288 is not set
> >> # CONFIG_EXTCON_FSA9480 is not set
> >> CONFIG_EXTCON_GPIO=3Dy
> >> CONFIG_EXTCON_INTEL_INT3496=3Dy
> >> CONFIG_EXTCON_MAX14577=3Dm
> >> # CONFIG_EXTCON_MAX3355 is not set
> >> CONFIG_EXTCON_MAX77693=3Dm
> >> CONFIG_EXTCON_PTN5150=3Dm
> >> CONFIG_EXTCON_RT8973A=3Dy
> >> # CONFIG_EXTCON_SM5502 is not set
> >> # CONFIG_EXTCON_USB_GPIO is not set
> >> # CONFIG_EXTCON_USBC_CROS_EC is not set
> >> CONFIG_EXTCON_USBC_TUSB320=3Dy
> >> CONFIG_MEMORY=3Dy
> >> # CONFIG_FPGA_DFL_EMIF is not set
> >> CONFIG_IIO=3Dm
> >> CONFIG_IIO_BUFFER=3Dy
> >> # CONFIG_IIO_BUFFER_CB is not set
> >> CONFIG_IIO_BUFFER_DMA=3Dm
> >> # CONFIG_IIO_BUFFER_DMAENGINE is not set
> >> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dm
> >> CONFIG_IIO_KFIFO_BUF=3Dm
> >> CONFIG_IIO_TRIGGERED_BUFFER=3Dm
> >> CONFIG_IIO_CONFIGFS=3Dm
> >> CONFIG_IIO_TRIGGER=3Dy
> >> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> >> # CONFIG_IIO_SW_DEVICE is not set
> >> # CONFIG_IIO_SW_TRIGGER is not set
> >> CONFIG_IIO_TRIGGERED_EVENT=3Dm
> >> =

> >> #
> >> # Accelerometers
> >> #
> >> # CONFIG_ADIS16201 is not set
> >> CONFIG_ADIS16209=3Dm
> >> CONFIG_ADXL313=3Dm
> >> CONFIG_ADXL313_I2C=3Dm
> >> CONFIG_ADXL313_SPI=3Dm
> >> CONFIG_ADXL345=3Dm
> >> CONFIG_ADXL345_I2C=3Dm
> >> CONFIG_ADXL345_SPI=3Dm
> >> CONFIG_ADXL355=3Dm
> >> # CONFIG_ADXL355_I2C is not set
> >> CONFIG_ADXL355_SPI=3Dm
> >> CONFIG_ADXL372=3Dm
> >> # CONFIG_ADXL372_SPI is not set
> >> CONFIG_ADXL372_I2C=3Dm
> >> CONFIG_BMA220=3Dm
> >> CONFIG_BMA400=3Dm
> >> CONFIG_BMA400_I2C=3Dm
> >> CONFIG_BMA400_SPI=3Dm
> >> CONFIG_BMC150_ACCEL=3Dm
> >> CONFIG_BMC150_ACCEL_I2C=3Dm
> >> CONFIG_BMC150_ACCEL_SPI=3Dm
> >> # CONFIG_BMI088_ACCEL is not set
> >> CONFIG_DA280=3Dm
> >> CONFIG_DA311=3Dm
> >> CONFIG_DMARD09=3Dm
> >> CONFIG_DMARD10=3Dm
> >> CONFIG_FXLS8962AF=3Dm
> >> # CONFIG_FXLS8962AF_I2C is not set
> >> CONFIG_FXLS8962AF_SPI=3Dm
> >> # CONFIG_HID_SENSOR_ACCEL_3D is not set
> >> # CONFIG_KXSD9 is not set
> >> # CONFIG_KXCJK1013 is not set
> >> # CONFIG_MC3230 is not set
> >> CONFIG_MMA7455=3Dm
> >> CONFIG_MMA7455_I2C=3Dm
> >> # CONFIG_MMA7455_SPI is not set
> >> CONFIG_MMA7660=3Dm
> >> CONFIG_MMA8452=3Dm
> >> CONFIG_MMA9551_CORE=3Dm
> >> CONFIG_MMA9551=3Dm
> >> CONFIG_MMA9553=3Dm
> >> # CONFIG_MXC4005 is not set
> >> CONFIG_MXC6255=3Dm
> >> CONFIG_SCA3000=3Dm
> >> CONFIG_SCA3300=3Dm
> >> CONFIG_STK8312=3Dm
> >> # CONFIG_STK8BA50 is not set
> >> # end of Accelerometers
> >> =

> >> #
> >> # Analog to digital converters
> >> #
> >> CONFIG_AD_SIGMA_DELTA=3Dm
> >> CONFIG_AD7091R5=3Dm
> >> CONFIG_AD7124=3Dm
> >> # CONFIG_AD7192 is not set
> >> # CONFIG_AD7266 is not set
> >> CONFIG_AD7291=3Dm
> >> CONFIG_AD7292=3Dm
> >> CONFIG_AD7298=3Dm
> >> CONFIG_AD7476=3Dm
> >> CONFIG_AD7606=3Dm
> >> # CONFIG_AD7606_IFACE_PARALLEL is not set
> >> CONFIG_AD7606_IFACE_SPI=3Dm
> >> CONFIG_AD7766=3Dm
> >> # CONFIG_AD7768_1 is not set
> >> CONFIG_AD7780=3Dm
> >> # CONFIG_AD7791 is not set
> >> CONFIG_AD7793=3Dm
> >> CONFIG_AD7887=3Dm
> >> CONFIG_AD7923=3Dm
> >> CONFIG_AD7949=3Dm
> >> CONFIG_AD799X=3Dm
> >> CONFIG_AXP20X_ADC=3Dm
> >> CONFIG_AXP288_ADC=3Dm
> >> # CONFIG_CC10001_ADC is not set
> >> # CONFIG_DA9150_GPADC is not set
> >> CONFIG_HI8435=3Dm
> >> # CONFIG_HX711 is not set
> >> CONFIG_INA2XX_ADC=3Dm
> >> # CONFIG_LP8788_ADC is not set
> >> CONFIG_LTC2471=3Dm
> >> # CONFIG_LTC2485 is not set
> >> # CONFIG_LTC2496 is not set
> >> # CONFIG_LTC2497 is not set
> >> CONFIG_MAX1027=3Dm
> >> CONFIG_MAX11100=3Dm
> >> # CONFIG_MAX1118 is not set
> >> CONFIG_MAX1241=3Dm
> >> # CONFIG_MAX1363 is not set
> >> # CONFIG_MAX9611 is not set
> >> CONFIG_MCP320X=3Dm
> >> CONFIG_MCP3422=3Dm
> >> # CONFIG_MCP3911 is not set
> >> CONFIG_MEN_Z188_ADC=3Dm
> >> CONFIG_MP2629_ADC=3Dm
> >> # CONFIG_NAU7802 is not set
> >> CONFIG_TI_ADC081C=3Dm
> >> CONFIG_TI_ADC0832=3Dm
> >> CONFIG_TI_ADC084S021=3Dm
> >> CONFIG_TI_ADC12138=3Dm
> >> CONFIG_TI_ADC108S102=3Dm
> >> CONFIG_TI_ADC128S052=3Dm
> >> CONFIG_TI_ADC161S626=3Dm
> >> CONFIG_TI_ADS1015=3Dm
> >> CONFIG_TI_ADS7950=3Dm
> >> CONFIG_TI_ADS8344=3Dm
> >> # CONFIG_TI_ADS8688 is not set
> >> CONFIG_TI_ADS124S08=3Dm
> >> CONFIG_TI_ADS131E08=3Dm
> >> CONFIG_TI_TLC4541=3Dm
> >> CONFIG_TI_TSC2046=3Dm
> >> CONFIG_XILINX_XADC=3Dm
> >> # end of Analog to digital converters
> >> =

> >> #
> >> # Analog to digital and digital to analog converters
> >> #
> >> CONFIG_AD74413R=3Dm
> >> # end of Analog to digital and digital to analog converters
> >> =

> >> #
> >> # Analog Front Ends
> >> #
> >> # end of Analog Front Ends
> >> =

> >> #
> >> # Amplifiers
> >> #
> >> CONFIG_AD8366=3Dm
> >> CONFIG_HMC425=3Dm
> >> # end of Amplifiers
> >> =

> >> #
> >> # Capacitance to digital converters
> >> #
> >> CONFIG_AD7150=3Dm
> >> # end of Capacitance to digital converters
> >> =

> >> #
> >> # Chemical Sensors
> >> #
> >> # CONFIG_ATLAS_PH_SENSOR is not set
> >> CONFIG_ATLAS_EZO_SENSOR=3Dm
> >> CONFIG_BME680=3Dm
> >> CONFIG_BME680_I2C=3Dm
> >> CONFIG_BME680_SPI=3Dm
> >> # CONFIG_CCS811 is not set
> >> CONFIG_IAQCORE=3Dm
> >> # CONFIG_PMS7003 is not set
> >> # CONFIG_SCD30_CORE is not set
> >> CONFIG_SCD4X=3Dm
> >> CONFIG_SENSIRION_SGP30=3Dm
> >> # CONFIG_SENSIRION_SGP40 is not set
> >> CONFIG_SPS30=3Dm
> >> CONFIG_SPS30_I2C=3Dm
> >> # CONFIG_SPS30_SERIAL is not set
> >> # CONFIG_SENSEAIR_SUNRISE_CO2 is not set
> >> CONFIG_VZ89X=3Dm
> >> # end of Chemical Sensors
> >> =

> >> #
> >> # Hid Sensor IIO Common
> >> #
> >> CONFIG_HID_SENSOR_IIO_COMMON=3Dm
> >> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dm
> >> # end of Hid Sensor IIO Common
> >> =

> >> CONFIG_IIO_MS_SENSORS_I2C=3Dm
> >> =

> >> #
> >> # IIO SCMI Sensors
> >> #
> >> # end of IIO SCMI Sensors
> >> =

> >> #
> >> # SSP Sensor Common
> >> #
> >> CONFIG_IIO_SSP_SENSORS_COMMONS=3Dm
> >> CONFIG_IIO_SSP_SENSORHUB=3Dm
> >> # end of SSP Sensor Common
> >> =

> >> CONFIG_IIO_ST_SENSORS_I2C=3Dm
> >> CONFIG_IIO_ST_SENSORS_SPI=3Dm
> >> CONFIG_IIO_ST_SENSORS_CORE=3Dm
> >> =

> >> #
> >> # Digital to analog converters
> >> #
> >> CONFIG_AD3552R=3Dm
> >> CONFIG_AD5064=3Dm
> >> CONFIG_AD5360=3Dm
> >> CONFIG_AD5380=3Dm
> >> CONFIG_AD5421=3Dm
> >> CONFIG_AD5446=3Dm
> >> CONFIG_AD5449=3Dm
> >> CONFIG_AD5592R_BASE=3Dm
> >> CONFIG_AD5592R=3Dm
> >> CONFIG_AD5593R=3Dm
> >> CONFIG_AD5504=3Dm
> >> # CONFIG_AD5624R_SPI is not set
> >> CONFIG_AD5686=3Dm
> >> # CONFIG_AD5686_SPI is not set
> >> CONFIG_AD5696_I2C=3Dm
> >> CONFIG_AD5755=3Dm
> >> # CONFIG_AD5758 is not set
> >> CONFIG_AD5761=3Dm
> >> CONFIG_AD5764=3Dm
> >> CONFIG_AD5766=3Dm
> >> CONFIG_AD5770R=3Dm
> >> # CONFIG_AD5791 is not set
> >> # CONFIG_AD7293 is not set
> >> CONFIG_AD7303=3Dm
> >> CONFIG_AD8801=3Dm
> >> CONFIG_DS4424=3Dm
> >> CONFIG_LTC1660=3Dm
> >> CONFIG_LTC2632=3Dm
> >> # CONFIG_M62332 is not set
> >> CONFIG_MAX517=3Dm
> >> CONFIG_MAX5821=3Dm
> >> CONFIG_MCP4725=3Dm
> >> # CONFIG_MCP4922 is not set
> >> CONFIG_TI_DAC082S085=3Dm
> >> # CONFIG_TI_DAC5571 is not set
> >> CONFIG_TI_DAC7311=3Dm
> >> CONFIG_TI_DAC7612=3Dm
> >> # end of Digital to analog converters
> >> =

> >> #
> >> # IIO dummy driver
> >> #
> >> # end of IIO dummy driver
> >> =

> >> #
> >> # Filters
> >> #
> >> # end of Filters
> >> =

> >> #
> >> # Frequency Synthesizers DDS/PLL
> >> #
> >> =

> >> #
> >> # Clock Generator/Distribution
> >> #
> >> CONFIG_AD9523=3Dm
> >> # end of Clock Generator/Distribution
> >> =

> >> #
> >> # Phase-Locked Loop (PLL) frequency synthesizers
> >> #
> >> CONFIG_ADF4350=3Dm
> >> CONFIG_ADF4371=3Dm
> >> # CONFIG_ADMV1013 is not set
> >> CONFIG_ADRF6780=3Dm
> >> # end of Phase-Locked Loop (PLL) frequency synthesizers
> >> # end of Frequency Synthesizers DDS/PLL
> >> =

> >> #
> >> # Digital gyroscope sensors
> >> #
> >> CONFIG_ADIS16080=3Dm
> >> # CONFIG_ADIS16130 is not set
> >> # CONFIG_ADIS16136 is not set
> >> # CONFIG_ADIS16260 is not set
> >> # CONFIG_ADXRS290 is not set
> >> # CONFIG_ADXRS450 is not set
> >> CONFIG_BMG160=3Dm
> >> CONFIG_BMG160_I2C=3Dm
> >> CONFIG_BMG160_SPI=3Dm
> >> CONFIG_FXAS21002C=3Dm
> >> CONFIG_FXAS21002C_I2C=3Dm
> >> CONFIG_FXAS21002C_SPI=3Dm
> >> CONFIG_HID_SENSOR_GYRO_3D=3Dm
> >> CONFIG_MPU3050=3Dm
> >> CONFIG_MPU3050_I2C=3Dm
> >> CONFIG_IIO_ST_GYRO_3AXIS=3Dm
> >> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dm
> >> CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dm
> >> # CONFIG_ITG3200 is not set
> >> # end of Digital gyroscope sensors
> >> =

> >> #
> >> # Health Sensors
> >> #
> >> =

> >> #
> >> # Heart Rate Monitors
> >> #
> >> # CONFIG_AFE4403 is not set
> >> CONFIG_AFE4404=3Dm
> >> # CONFIG_MAX30100 is not set
> >> CONFIG_MAX30102=3Dm
> >> # end of Heart Rate Monitors
> >> # end of Health Sensors
> >> =

> >> #
> >> # Humidity sensors
> >> #
> >> CONFIG_AM2315=3Dm
> >> CONFIG_DHT11=3Dm
> >> CONFIG_HDC100X=3Dm
> >> CONFIG_HDC2010=3Dm
> >> # CONFIG_HID_SENSOR_HUMIDITY is not set
> >> CONFIG_HTS221=3Dm
> >> CONFIG_HTS221_I2C=3Dm
> >> CONFIG_HTS221_SPI=3Dm
> >> # CONFIG_HTU21 is not set
> >> CONFIG_SI7005=3Dm
> >> CONFIG_SI7020=3Dm
> >> # end of Humidity sensors
> >> =

> >> #
> >> # Inertial measurement units
> >> #
> >> CONFIG_ADIS16400=3Dm
> >> # CONFIG_ADIS16460 is not set
> >> CONFIG_ADIS16475=3Dm
> >> CONFIG_ADIS16480=3Dm
> >> CONFIG_BMI160=3Dm
> >> CONFIG_BMI160_I2C=3Dm
> >> CONFIG_BMI160_SPI=3Dm
> >> CONFIG_FXOS8700=3Dm
> >> CONFIG_FXOS8700_I2C=3Dm
> >> CONFIG_FXOS8700_SPI=3Dm
> >> # CONFIG_KMX61 is not set
> >> # CONFIG_INV_ICM42600_I2C is not set
> >> # CONFIG_INV_ICM42600_SPI is not set
> >> CONFIG_INV_MPU6050_IIO=3Dm
> >> # CONFIG_INV_MPU6050_I2C is not set
> >> CONFIG_INV_MPU6050_SPI=3Dm
> >> CONFIG_IIO_ST_LSM6DSX=3Dm
> >> CONFIG_IIO_ST_LSM6DSX_I2C=3Dm
> >> CONFIG_IIO_ST_LSM6DSX_SPI=3Dm
> >> CONFIG_IIO_ST_LSM6DSX_I3C=3Dm
> >> # end of Inertial measurement units
> >> =

> >> CONFIG_IIO_ADIS_LIB=3Dm
> >> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> >> =

> >> #
> >> # Light sensors
> >> #
> >> CONFIG_ACPI_ALS=3Dm
> >> # CONFIG_ADJD_S311 is not set
> >> CONFIG_ADUX1020=3Dm
> >> CONFIG_AL3010=3Dm
> >> CONFIG_AL3320A=3Dm
> >> CONFIG_APDS9300=3Dm
> >> CONFIG_APDS9960=3Dm
> >> CONFIG_AS73211=3Dm
> >> CONFIG_BH1750=3Dm
> >> # CONFIG_BH1780 is not set
> >> CONFIG_CM32181=3Dm
> >> CONFIG_CM3232=3Dm
> >> # CONFIG_CM3323 is not set
> >> CONFIG_CM36651=3Dm
> >> # CONFIG_GP2AP002 is not set
> >> # CONFIG_GP2AP020A00F is not set
> >> # CONFIG_IQS621_ALS is not set
> >> CONFIG_SENSORS_ISL29018=3Dm
> >> # CONFIG_SENSORS_ISL29028 is not set
> >> # CONFIG_ISL29125 is not set
> >> CONFIG_HID_SENSOR_ALS=3Dm
> >> CONFIG_HID_SENSOR_PROX=3Dm
> >> # CONFIG_JSA1212 is not set
> >> # CONFIG_RPR0521 is not set
> >> # CONFIG_LTR501 is not set
> >> # CONFIG_LV0104CS is not set
> >> CONFIG_MAX44000=3Dm
> >> CONFIG_MAX44009=3Dm
> >> CONFIG_NOA1305=3Dm
> >> CONFIG_OPT3001=3Dm
> >> CONFIG_PA12203001=3Dm
> >> CONFIG_SI1133=3Dm
> >> CONFIG_SI1145=3Dm
> >> CONFIG_STK3310=3Dm
> >> CONFIG_ST_UVIS25=3Dm
> >> CONFIG_ST_UVIS25_I2C=3Dm
> >> CONFIG_ST_UVIS25_SPI=3Dm
> >> # CONFIG_TCS3414 is not set
> >> # CONFIG_TCS3472 is not set
> >> CONFIG_SENSORS_TSL2563=3Dm
> >> CONFIG_TSL2583=3Dm
> >> CONFIG_TSL2591=3Dm
> >> CONFIG_TSL2772=3Dm
> >> CONFIG_TSL4531=3Dm
> >> CONFIG_US5182D=3Dm
> >> CONFIG_VCNL4000=3Dm
> >> CONFIG_VCNL4035=3Dm
> >> # CONFIG_VEML6030 is not set
> >> CONFIG_VEML6070=3Dm
> >> # CONFIG_VL6180 is not set
> >> CONFIG_ZOPT2201=3Dm
> >> # end of Light sensors
> >> =

> >> #
> >> # Magnetometer sensors
> >> #
> >> CONFIG_AK8975=3Dm
> >> CONFIG_AK09911=3Dm
> >> CONFIG_BMC150_MAGN=3Dm
> >> # CONFIG_BMC150_MAGN_I2C is not set
> >> CONFIG_BMC150_MAGN_SPI=3Dm
> >> CONFIG_MAG3110=3Dm
> >> # CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
> >> CONFIG_MMC35240=3Dm
> >> # CONFIG_IIO_ST_MAGN_3AXIS is not set
> >> CONFIG_SENSORS_HMC5843=3Dm
> >> CONFIG_SENSORS_HMC5843_I2C=3Dm
> >> CONFIG_SENSORS_HMC5843_SPI=3Dm
> >> CONFIG_SENSORS_RM3100=3Dm
> >> CONFIG_SENSORS_RM3100_I2C=3Dm
> >> CONFIG_SENSORS_RM3100_SPI=3Dm
> >> # CONFIG_YAMAHA_YAS530 is not set
> >> # end of Magnetometer sensors
> >> =

> >> #
> >> # Multiplexers
> >> #
> >> # end of Multiplexers
> >> =

> >> #
> >> # Inclinometer sensors
> >> #
> >> CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dm
> >> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dm
> >> # end of Inclinometer sensors
> >> =

> >> #
> >> # Triggers - standalone
> >> #
> >> CONFIG_IIO_INTERRUPT_TRIGGER=3Dm
> >> CONFIG_IIO_SYSFS_TRIGGER=3Dm
> >> # end of Triggers - standalone
> >> =

> >> #
> >> # Linear and angular position sensors
> >> #
> >> CONFIG_IQS624_POS=3Dm
> >> CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=3Dm
> >> # end of Linear and angular position sensors
> >> =

> >> #
> >> # Digital potentiometers
> >> #
> >> # CONFIG_AD5110 is not set
> >> # CONFIG_AD5272 is not set
> >> CONFIG_DS1803=3Dm
> >> CONFIG_MAX5432=3Dm
> >> CONFIG_MAX5481=3Dm
> >> CONFIG_MAX5487=3Dm
> >> # CONFIG_MCP4018 is not set
> >> # CONFIG_MCP4131 is not set
> >> CONFIG_MCP4531=3Dm
> >> CONFIG_MCP41010=3Dm
> >> # CONFIG_TPL0102 is not set
> >> # end of Digital potentiometers
> >> =

> >> #
> >> # Digital potentiostats
> >> #
> >> # CONFIG_LMP91000 is not set
> >> # end of Digital potentiostats
> >> =

> >> #
> >> # Pressure sensors
> >> #
> >> # CONFIG_ABP060MG is not set
> >> # CONFIG_BMP280 is not set
> >> CONFIG_DLHL60D=3Dm
> >> # CONFIG_DPS310 is not set
> >> CONFIG_HID_SENSOR_PRESS=3Dm
> >> # CONFIG_HP03 is not set
> >> CONFIG_ICP10100=3Dm
> >> CONFIG_MPL115=3Dm
> >> CONFIG_MPL115_I2C=3Dm
> >> # CONFIG_MPL115_SPI is not set
> >> CONFIG_MPL3115=3Dm
> >> CONFIG_MS5611=3Dm
> >> CONFIG_MS5611_I2C=3Dm
> >> CONFIG_MS5611_SPI=3Dm
> >> CONFIG_MS5637=3Dm
> >> CONFIG_IIO_ST_PRESS=3Dm
> >> CONFIG_IIO_ST_PRESS_I2C=3Dm
> >> CONFIG_IIO_ST_PRESS_SPI=3Dm
> >> CONFIG_T5403=3Dm
> >> # CONFIG_HP206C is not set
> >> CONFIG_ZPA2326=3Dm
> >> CONFIG_ZPA2326_I2C=3Dm
> >> CONFIG_ZPA2326_SPI=3Dm
> >> # end of Pressure sensors
> >> =

> >> #
> >> # Lightning sensors
> >> #
> >> CONFIG_AS3935=3Dm
> >> # end of Lightning sensors
> >> =

> >> #
> >> # Proximity and distance sensors
> >> #
> >> # CONFIG_CROS_EC_MKBP_PROXIMITY is not set
> >> # CONFIG_ISL29501 is not set
> >> CONFIG_LIDAR_LITE_V2=3Dm
> >> CONFIG_MB1232=3Dm
> >> # CONFIG_PING is not set
> >> CONFIG_RFD77402=3Dm
> >> CONFIG_SRF04=3Dm
> >> CONFIG_SX9310=3Dm
> >> CONFIG_SX9500=3Dm
> >> CONFIG_SRF08=3Dm
> >> CONFIG_VCNL3020=3Dm
> >> CONFIG_VL53L0X_I2C=3Dm
> >> # end of Proximity and distance sensors
> >> =

> >> #
> >> # Resolver to digital converters
> >> #
> >> CONFIG_AD2S90=3Dm
> >> CONFIG_AD2S1200=3Dm
> >> # end of Resolver to digital converters
> >> =

> >> #
> >> # Temperature sensors
> >> #
> >> CONFIG_IQS620AT_TEMP=3Dm
> >> # CONFIG_LTC2983 is not set
> >> CONFIG_MAXIM_THERMOCOUPLE=3Dm
> >> # CONFIG_HID_SENSOR_TEMP is not set
> >> CONFIG_MLX90614=3Dm
> >> CONFIG_MLX90632=3Dm
> >> CONFIG_TMP006=3Dm
> >> CONFIG_TMP007=3Dm
> >> CONFIG_TMP117=3Dm
> >> CONFIG_TSYS01=3Dm
> >> CONFIG_TSYS02D=3Dm
> >> CONFIG_MAX31856=3Dm
> >> CONFIG_MAX31865=3Dm
> >> # end of Temperature sensors
> >> =

> >> # CONFIG_NTB is not set
> >> # CONFIG_VME_BUS is not set
> >> # CONFIG_PWM is not set
> >> =

> >> #
> >> # IRQ chip support
> >> #
> >> CONFIG_MADERA_IRQ=3Dm
> >> # end of IRQ chip support
> >> =

> >> CONFIG_IPACK_BUS=3Dy
> >> CONFIG_BOARD_TPCI200=3Dm
> >> CONFIG_SERIAL_IPOCTAL=3Dm
> >> CONFIG_RESET_CONTROLLER=3Dy
> >> CONFIG_RESET_TI_SYSCON=3Dy
> >> =

> >> #
> >> # PHY Subsystem
> >> #
> >> CONFIG_GENERIC_PHY=3Dy
> >> # CONFIG_USB_LGM_PHY is not set
> >> CONFIG_PHY_CAN_TRANSCEIVER=3Dy
> >> =

> >> #
> >> # PHY drivers for Broadcom platforms
> >> #
> >> CONFIG_BCM_KONA_USB2_PHY=3Dy
> >> # end of PHY drivers for Broadcom platforms
> >> =

> >> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> >> CONFIG_PHY_PXA_28NM_USB2=3Dy
> >> # CONFIG_PHY_CPCAP_USB is not set
> >> CONFIG_PHY_INTEL_LGM_EMMC=3Dy
> >> # end of PHY Subsystem
> >> =

> >> CONFIG_POWERCAP=3Dy
> >> CONFIG_INTEL_RAPL_CORE=3Dy
> >> CONFIG_INTEL_RAPL=3Dy
> >> # CONFIG_IDLE_INJECT is not set
> >> # CONFIG_DTPM is not set
> >> CONFIG_MCB=3Dy
> >> CONFIG_MCB_PCI=3Dy
> >> # CONFIG_MCB_LPC is not set
> >> =

> >> #
> >> # Performance monitor support
> >> #
> >> # end of Performance monitor support
> >> =

> >> CONFIG_RAS=3Dy
> >> CONFIG_RAS_CEC=3Dy
> >> CONFIG_RAS_CEC_DEBUG=3Dy
> >> CONFIG_USB4=3Dy
> >> # CONFIG_USB4_DEBUGFS_WRITE is not set
> >> # CONFIG_USB4_DMA_TEST is not set
> >> =

> >> #
> >> # Android
> >> #
> >> CONFIG_ANDROID=3Dy
> >> # CONFIG_ANDROID_BINDER_IPC is not set
> >> # end of Android
> >> =

> >> CONFIG_LIBNVDIMM=3Dy
> >> CONFIG_BLK_DEV_PMEM=3Dm
> >> # CONFIG_ND_BLK is not set
> >> CONFIG_ND_CLAIM=3Dy
> >> CONFIG_ND_BTT=3Dm
> >> CONFIG_BTT=3Dy
> >> CONFIG_NVDIMM_KEYS=3Dy
> >> CONFIG_DAX=3Dy
> >> CONFIG_NVMEM=3Dy
> >> CONFIG_NVMEM_SYSFS=3Dy
> >> CONFIG_RAVE_SP_EEPROM=3Dm
> >> # CONFIG_NVMEM_RMEM is not set
> >> =

> >> #
> >> # HW tracing support
> >> #
> >> CONFIG_STM=3Dm
> >> CONFIG_STM_PROTO_BASIC=3Dm
> >> CONFIG_STM_PROTO_SYS_T=3Dm
> >> CONFIG_STM_DUMMY=3Dm
> >> # CONFIG_STM_SOURCE_CONSOLE is not set
> >> CONFIG_STM_SOURCE_HEARTBEAT=3Dm
> >> # CONFIG_STM_SOURCE_FTRACE is not set
> >> # CONFIG_INTEL_TH is not set
> >> # end of HW tracing support
> >> =

> >> CONFIG_FPGA=3Dy
> >> CONFIG_ALTERA_PR_IP_CORE=3Dy
> >> # CONFIG_FPGA_MGR_ALTERA_PS_SPI is not set
> >> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> >> # CONFIG_FPGA_MGR_XILINX_SPI is not set
> >> CONFIG_FPGA_MGR_MACHXO2_SPI=3Dy
> >> CONFIG_FPGA_BRIDGE=3Dm
> >> CONFIG_ALTERA_FREEZE_BRIDGE=3Dm
> >> CONFIG_XILINX_PR_DECOUPLER=3Dm
> >> CONFIG_FPGA_REGION=3Dm
> >> CONFIG_FPGA_DFL=3Dm
> >> CONFIG_FPGA_DFL_FME=3Dm
> >> CONFIG_FPGA_DFL_FME_MGR=3Dm
> >> CONFIG_FPGA_DFL_FME_BRIDGE=3Dm
> >> CONFIG_FPGA_DFL_FME_REGION=3Dm
> >> CONFIG_FPGA_DFL_AFU=3Dm
> >> # CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000 is not set
> >> # CONFIG_FPGA_DFL_PCI is not set
> >> CONFIG_TEE=3Dm
> >> =

> >> #
> >> # TEE drivers
> >> #
> >> # end of TEE drivers
> >> =

> >> CONFIG_MULTIPLEXER=3Dm
> >> =

> >> #
> >> # Multiplexer drivers
> >> #
> >> # CONFIG_MUX_ADG792A is not set
> >> # CONFIG_MUX_ADGS1408 is not set
> >> CONFIG_MUX_GPIO=3Dm
> >> # end of Multiplexer drivers
> >> =

> >> CONFIG_PM_OPP=3Dy
> >> # CONFIG_SIOX is not set
> >> CONFIG_SLIMBUS=3Dy
> >> CONFIG_SLIM_QCOM_CTRL=3Dm
> >> CONFIG_INTERCONNECT=3Dy
> >> CONFIG_COUNTER=3Dm
> >> CONFIG_INTERRUPT_CNT=3Dm
> >> # CONFIG_INTEL_QEP is not set
> >> CONFIG_MOST=3Dy
> >> CONFIG_MOST_CDEV=3Dy
> >> # end of Device Drivers
> >> =

> >> #
> >> # File systems
> >> #
> >> CONFIG_DCACHE_WORD_ACCESS=3Dy
> >> # CONFIG_VALIDATE_FS_PARSER is not set
> >> CONFIG_FS_IOMAP=3Dy
> >> CONFIG_EXT2_FS=3Dm
> >> # CONFIG_EXT2_FS_XATTR is not set
> >> # CONFIG_EXT3_FS is not set
> >> CONFIG_EXT4_FS=3Dy
> >> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> >> # CONFIG_EXT4_FS_SECURITY is not set
> >> # CONFIG_EXT4_DEBUG is not set
> >> CONFIG_JBD2=3Dy
> >> CONFIG_JBD2_DEBUG=3Dy
> >> CONFIG_FS_MBCACHE=3Dy
> >> CONFIG_REISERFS_FS=3Dm
> >> # CONFIG_REISERFS_CHECK is not set
> >> CONFIG_REISERFS_PROC_INFO=3Dy
> >> CONFIG_REISERFS_FS_XATTR=3Dy
> >> # CONFIG_REISERFS_FS_POSIX_ACL is not set
> >> # CONFIG_REISERFS_FS_SECURITY is not set
> >> # CONFIG_JFS_FS is not set
> >> # CONFIG_XFS_FS is not set
> >> CONFIG_GFS2_FS=3Dy
> >> # CONFIG_OCFS2_FS is not set
> >> # CONFIG_BTRFS_FS is not set
> >> CONFIG_NILFS2_FS=3Dm
> >> # CONFIG_F2FS_FS is not set
> >> CONFIG_ZONEFS_FS=3Dy
> >> CONFIG_FS_DAX=3Dy
> >> CONFIG_FS_POSIX_ACL=3Dy
> >> CONFIG_EXPORTFS=3Dy
> >> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> >> CONFIG_FILE_LOCKING=3Dy
> >> CONFIG_FS_ENCRYPTION=3Dy
> >> CONFIG_FS_ENCRYPTION_ALGS=3Dy
> >> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=3Dy
> >> CONFIG_FS_VERITY=3Dy
> >> CONFIG_FS_VERITY_DEBUG=3Dy
> >> CONFIG_FS_VERITY_BUILTIN_SIGNATURES=3Dy
> >> CONFIG_FSNOTIFY=3Dy
> >> # CONFIG_DNOTIFY is not set
> >> CONFIG_INOTIFY_USER=3Dy
> >> CONFIG_FANOTIFY=3Dy
> >> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> >> # CONFIG_QUOTA is not set
> >> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> >> CONFIG_QUOTACTL=3Dy
> >> # CONFIG_AUTOFS4_FS is not set
> >> # CONFIG_AUTOFS_FS is not set
> >> CONFIG_FUSE_FS=3Dm
> >> CONFIG_CUSE=3Dm
> >> CONFIG_VIRTIO_FS=3Dm
> >> CONFIG_FUSE_DAX=3Dy
> >> # CONFIG_OVERLAY_FS is not set
> >> =

> >> #
> >> # Caches
> >> #
> >> # CONFIG_FSCACHE is not set
> >> # end of Caches
> >> =

> >> #
> >> # CD-ROM/DVD Filesystems
> >> #
> >> # CONFIG_ISO9660_FS is not set
> >> CONFIG_UDF_FS=3Dy
> >> # end of CD-ROM/DVD Filesystems
> >> =

> >> #
> >> # DOS/FAT/EXFAT/NT Filesystems
> >> #
> >> CONFIG_FAT_FS=3Dy
> >> # CONFIG_MSDOS_FS is not set
> >> CONFIG_VFAT_FS=3Dy
> >> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> >> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> >> # CONFIG_FAT_DEFAULT_UTF8 is not set
> >> CONFIG_EXFAT_FS=3Dy
> >> CONFIG_EXFAT_DEFAULT_IOCHARSET=3D"utf8"
> >> CONFIG_NTFS_FS=3Dy
> >> # CONFIG_NTFS_DEBUG is not set
> >> CONFIG_NTFS_RW=3Dy
> >> CONFIG_NTFS3_FS=3Dm
> >> CONFIG_NTFS3_LZX_XPRESS=3Dy
> >> CONFIG_NTFS3_FS_POSIX_ACL=3Dy
> >> # end of DOS/FAT/EXFAT/NT Filesystems
> >> =

> >> #
> >> # Pseudo filesystems
> >> #
> >> CONFIG_PROC_FS=3Dy
> >> CONFIG_PROC_KCORE=3Dy
> >> # CONFIG_PROC_VMCORE is not set
> >> CONFIG_PROC_SYSCTL=3Dy
> >> CONFIG_PROC_PAGE_MONITOR=3Dy
> >> CONFIG_PROC_CHILDREN=3Dy
> >> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> >> CONFIG_KERNFS=3Dy
> >> CONFIG_SYSFS=3Dy
> >> CONFIG_TMPFS=3Dy
> >> # CONFIG_TMPFS_POSIX_ACL is not set
> >> CONFIG_TMPFS_XATTR=3Dy
> >> # CONFIG_HUGETLBFS is not set
> >> CONFIG_MEMFD_CREATE=3Dy
> >> CONFIG_CONFIGFS_FS=3Dy
> >> # end of Pseudo filesystems
> >> =

> >> CONFIG_MISC_FILESYSTEMS=3Dy
> >> CONFIG_ORANGEFS_FS=3Dy
> >> CONFIG_ADFS_FS=3Dy
> >> # CONFIG_ADFS_FS_RW is not set
> >> CONFIG_AFFS_FS=3Dy
> >> CONFIG_ECRYPT_FS=3Dm
> >> CONFIG_ECRYPT_FS_MESSAGING=3Dy
> >> CONFIG_HFS_FS=3Dy
> >> CONFIG_HFSPLUS_FS=3Dy
> >> CONFIG_BEFS_FS=3Dm
> >> CONFIG_BEFS_DEBUG=3Dy
> >> CONFIG_BFS_FS=3Dm
> >> # CONFIG_EFS_FS is not set
> >> # CONFIG_JFFS2_FS is not set
> >> # CONFIG_UBIFS_FS is not set
> >> CONFIG_CRAMFS=3Dy
> >> CONFIG_CRAMFS_BLOCKDEV=3Dy
> >> CONFIG_SQUASHFS=3Dm
> >> # CONFIG_SQUASHFS_FILE_CACHE is not set
> >> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> >> CONFIG_SQUASHFS_DECOMP_SINGLE=3Dy
> >> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> >> # CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
> >> CONFIG_SQUASHFS_XATTR=3Dy
> >> # CONFIG_SQUASHFS_ZLIB is not set
> >> # CONFIG_SQUASHFS_LZ4 is not set
> >> # CONFIG_SQUASHFS_LZO is not set
> >> CONFIG_SQUASHFS_XZ=3Dy
> >> # CONFIG_SQUASHFS_ZSTD is not set
> >> CONFIG_SQUASHFS_4K_DEVBLK_SIZE=3Dy
> >> # CONFIG_SQUASHFS_EMBEDDED is not set
> >> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> >> CONFIG_VXFS_FS=3Dm
> >> CONFIG_MINIX_FS=3Dy
> >> CONFIG_OMFS_FS=3Dy
> >> # CONFIG_HPFS_FS is not set
> >> CONFIG_QNX4FS_FS=3Dy
> >> CONFIG_QNX6FS_FS=3Dy
> >> CONFIG_QNX6FS_DEBUG=3Dy
> >> # CONFIG_ROMFS_FS is not set
> >> # CONFIG_PSTORE is not set
> >> CONFIG_SYSV_FS=3Dm
> >> CONFIG_UFS_FS=3Dm
> >> CONFIG_UFS_FS_WRITE=3Dy
> >> # CONFIG_UFS_DEBUG is not set
> >> CONFIG_EROFS_FS=3Dy
> >> CONFIG_EROFS_FS_DEBUG=3Dy
> >> CONFIG_EROFS_FS_XATTR=3Dy
> >> CONFIG_EROFS_FS_POSIX_ACL=3Dy
> >> # CONFIG_EROFS_FS_SECURITY is not set
> >> CONFIG_EROFS_FS_ZIP=3Dy
> >> CONFIG_EROFS_FS_ZIP_LZMA=3Dy
> >> CONFIG_NETWORK_FILESYSTEMS=3Dy
> >> CONFIG_NFS_FS=3Dy
> >> CONFIG_NFS_V2=3Dy
> >> CONFIG_NFS_V3=3Dy
> >> # CONFIG_NFS_V3_ACL is not set
> >> CONFIG_NFS_V4=3Dm
> >> # CONFIG_NFS_SWAP is not set
> >> # CONFIG_NFS_V4_1 is not set
> >> # CONFIG_ROOT_NFS is not set
> >> # CONFIG_NFS_USE_LEGACY_DNS is not set
> >> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> >> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> >> # CONFIG_NFSD is not set
> >> CONFIG_GRACE_PERIOD=3Dy
> >> CONFIG_LOCKD=3Dy
> >> CONFIG_LOCKD_V4=3Dy
> >> CONFIG_NFS_COMMON=3Dy
> >> CONFIG_SUNRPC=3Dy
> >> CONFIG_SUNRPC_GSS=3Dm
> >> # CONFIG_SUNRPC_DEBUG is not set
> >> # CONFIG_CEPH_FS is not set
> >> CONFIG_CIFS=3Dm
> >> CONFIG_CIFS_STATS2=3Dy
> >> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> >> # CONFIG_CIFS_UPCALL is not set
> >> # CONFIG_CIFS_XATTR is not set
> >> CONFIG_CIFS_DEBUG=3Dy
> >> # CONFIG_CIFS_DEBUG2 is not set
> >> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> >> # CONFIG_CIFS_DFS_UPCALL is not set
> >> # CONFIG_CIFS_SWN_UPCALL is not set
> >> # CONFIG_SMB_SERVER is not set
> >> CONFIG_SMBFS_COMMON=3Dm
> >> # CONFIG_CODA_FS is not set
> >> # CONFIG_AFS_FS is not set
> >> # CONFIG_9P_FS is not set
> >> CONFIG_NLS=3Dy
> >> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> >> # CONFIG_NLS_CODEPAGE_437 is not set
> >> # CONFIG_NLS_CODEPAGE_737 is not set
> >> CONFIG_NLS_CODEPAGE_775=3Dm
> >> CONFIG_NLS_CODEPAGE_850=3Dm
> >> # CONFIG_NLS_CODEPAGE_852 is not set
> >> # CONFIG_NLS_CODEPAGE_855 is not set
> >> CONFIG_NLS_CODEPAGE_857=3Dy
> >> CONFIG_NLS_CODEPAGE_860=3Dm
> >> CONFIG_NLS_CODEPAGE_861=3Dy
> >> # CONFIG_NLS_CODEPAGE_862 is not set
> >> # CONFIG_NLS_CODEPAGE_863 is not set
> >> # CONFIG_NLS_CODEPAGE_864 is not set
> >> CONFIG_NLS_CODEPAGE_865=3Dm
> >> CONFIG_NLS_CODEPAGE_866=3Dm
> >> # CONFIG_NLS_CODEPAGE_869 is not set
> >> CONFIG_NLS_CODEPAGE_936=3Dm
> >> CONFIG_NLS_CODEPAGE_950=3Dm
> >> CONFIG_NLS_CODEPAGE_932=3Dy
> >> # CONFIG_NLS_CODEPAGE_949 is not set
> >> # CONFIG_NLS_CODEPAGE_874 is not set
> >> CONFIG_NLS_ISO8859_8=3Dm
> >> # CONFIG_NLS_CODEPAGE_1250 is not set
> >> CONFIG_NLS_CODEPAGE_1251=3Dy
> >> # CONFIG_NLS_ASCII is not set
> >> # CONFIG_NLS_ISO8859_1 is not set
> >> # CONFIG_NLS_ISO8859_2 is not set
> >> # CONFIG_NLS_ISO8859_3 is not set
> >> # CONFIG_NLS_ISO8859_4 is not set
> >> # CONFIG_NLS_ISO8859_5 is not set
> >> CONFIG_NLS_ISO8859_6=3Dy
> >> CONFIG_NLS_ISO8859_7=3Dy
> >> # CONFIG_NLS_ISO8859_9 is not set
> >> CONFIG_NLS_ISO8859_13=3Dy
> >> CONFIG_NLS_ISO8859_14=3Dm
> >> # CONFIG_NLS_ISO8859_15 is not set
> >> # CONFIG_NLS_KOI8_R is not set
> >> CONFIG_NLS_KOI8_U=3Dy
> >> CONFIG_NLS_MAC_ROMAN=3Dy
> >> CONFIG_NLS_MAC_CELTIC=3Dm
> >> CONFIG_NLS_MAC_CENTEURO=3Dy
> >> CONFIG_NLS_MAC_CROATIAN=3Dy
> >> CONFIG_NLS_MAC_CYRILLIC=3Dy
> >> CONFIG_NLS_MAC_GAELIC=3Dy
> >> # CONFIG_NLS_MAC_GREEK is not set
> >> CONFIG_NLS_MAC_ICELAND=3Dy
> >> # CONFIG_NLS_MAC_INUIT is not set
> >> CONFIG_NLS_MAC_ROMANIAN=3Dm
> >> CONFIG_NLS_MAC_TURKISH=3Dy
> >> CONFIG_NLS_UTF8=3Dy
> >> # CONFIG_DLM is not set
> >> CONFIG_UNICODE=3Dy
> >> CONFIG_UNICODE_UTF8_DATA=3Dy
> >> # CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
> >> CONFIG_IO_WQ=3Dy
> >> # end of File systems
> >> =

> >> #
> >> # Security options
> >> #
> >> CONFIG_KEYS=3Dy
> >> # CONFIG_KEYS_REQUEST_CACHE is not set
> >> CONFIG_PERSISTENT_KEYRINGS=3Dy
> >> CONFIG_BIG_KEYS=3Dy
> >> # CONFIG_TRUSTED_KEYS is not set
> >> CONFIG_ENCRYPTED_KEYS=3Dy
> >> # CONFIG_KEY_DH_OPERATIONS is not set
> >> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> >> CONFIG_SECURITY=3Dy
> >> CONFIG_SECURITYFS=3Dy
> >> CONFIG_SECURITY_NETWORK=3Dy
> >> CONFIG_PAGE_TABLE_ISOLATION=3Dy
> >> # CONFIG_SECURITY_PATH is not set
> >> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> >> CONFIG_HARDENED_USERCOPY=3Dy
> >> CONFIG_FORTIFY_SOURCE=3Dy
> >> CONFIG_STATIC_USERMODEHELPER=3Dy
> >> CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
> >> # CONFIG_SECURITY_SMACK is not set
> >> # CONFIG_SECURITY_TOMOYO is not set
> >> # CONFIG_SECURITY_APPARMOR is not set
> >> # CONFIG_SECURITY_LOADPIN is not set
> >> CONFIG_SECURITY_YAMA=3Dy
> >> # CONFIG_SECURITY_SAFESETID is not set
> >> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> >> # CONFIG_SECURITY_LANDLOCK is not set
> >> CONFIG_INTEGRITY=3Dy
> >> CONFIG_INTEGRITY_SIGNATURE=3Dy
> >> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> >> # CONFIG_INTEGRITY_TRUSTED_KEYRING is not set
> >> # CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
> >> # CONFIG_IMA is not set
> >> # CONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY is not set
> >> # CONFIG_EVM is not set
> >> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> >> CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
> >> =

> >> #
> >> # Kernel hardening options
> >> #
> >> =

> >> #
> >> # Memory initialization
> >> #
> >> CONFIG_INIT_STACK_NONE=3Dy
> >> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> >> CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy
> >> # end of Memory initialization
> >> # end of Kernel hardening options
> >> # end of Security options
> >> =

> >> CONFIG_XOR_BLOCKS=3Dy
> >> CONFIG_CRYPTO=3Dy
> >> =

> >> #
> >> # Crypto core or helper
> >> #
> >> CONFIG_CRYPTO_ALGAPI=3Dy
> >> CONFIG_CRYPTO_ALGAPI2=3Dy
> >> CONFIG_CRYPTO_AEAD=3Dy
> >> CONFIG_CRYPTO_AEAD2=3Dy
> >> CONFIG_CRYPTO_SKCIPHER=3Dy
> >> CONFIG_CRYPTO_SKCIPHER2=3Dy
> >> CONFIG_CRYPTO_HASH=3Dy
> >> CONFIG_CRYPTO_HASH2=3Dy
> >> CONFIG_CRYPTO_RNG=3Dy
> >> CONFIG_CRYPTO_RNG2=3Dy
> >> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> >> CONFIG_CRYPTO_AKCIPHER2=3Dy
> >> CONFIG_CRYPTO_AKCIPHER=3Dy
> >> CONFIG_CRYPTO_KPP2=3Dy
> >> CONFIG_CRYPTO_ACOMP2=3Dy
> >> CONFIG_CRYPTO_MANAGER=3Dy
> >> CONFIG_CRYPTO_MANAGER2=3Dy
> >> # CONFIG_CRYPTO_USER is not set
> >> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> >> CONFIG_CRYPTO_GF128MUL=3Dy
> >> CONFIG_CRYPTO_NULL=3Dy
> >> CONFIG_CRYPTO_NULL2=3Dy
> >> CONFIG_CRYPTO_CRYPTD=3Dy
> >> CONFIG_CRYPTO_AUTHENC=3Dy
> >> # CONFIG_CRYPTO_TEST is not set
> >> CONFIG_CRYPTO_SIMD=3Dy
> >> =

> >> #
> >> # Public-key cryptography
> >> #
> >> CONFIG_CRYPTO_RSA=3Dy
> >> # CONFIG_CRYPTO_DH is not set
> >> CONFIG_CRYPTO_ECC=3Dy
> >> # CONFIG_CRYPTO_ECDH is not set
> >> CONFIG_CRYPTO_ECDSA=3Dy
> >> # CONFIG_CRYPTO_ECRDSA is not set
> >> # CONFIG_CRYPTO_SM2 is not set
> >> # CONFIG_CRYPTO_CURVE25519 is not set
> >> =

> >> #
> >> # Authenticated Encryption with Associated Data
> >> #
> >> CONFIG_CRYPTO_CCM=3Dm
> >> CONFIG_CRYPTO_GCM=3Dy
> >> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
> >> CONFIG_CRYPTO_AEGIS128=3Dy
> >> # CONFIG_CRYPTO_SEQIV is not set
> >> # CONFIG_CRYPTO_ECHAINIV is not set
> >> =

> >> #
> >> # Block modes
> >> #
> >> CONFIG_CRYPTO_CBC=3Dy
> >> CONFIG_CRYPTO_CFB=3Dy
> >> CONFIG_CRYPTO_CTR=3Dy
> >> # CONFIG_CRYPTO_CTS is not set
> >> CONFIG_CRYPTO_ECB=3Dm
> >> CONFIG_CRYPTO_LRW=3Dm
> >> CONFIG_CRYPTO_OFB=3Dy
> >> CONFIG_CRYPTO_PCBC=3Dm
> >> # CONFIG_CRYPTO_XTS is not set
> >> # CONFIG_CRYPTO_KEYWRAP is not set
> >> CONFIG_CRYPTO_NHPOLY1305=3Dy
> >> CONFIG_CRYPTO_ADIANTUM=3Dy
> >> CONFIG_CRYPTO_ESSIV=3Dy
> >> =

> >> #
> >> # Hash modes
> >> #
> >> CONFIG_CRYPTO_CMAC=3Dy
> >> CONFIG_CRYPTO_HMAC=3Dy
> >> CONFIG_CRYPTO_XCBC=3Dm
> >> # CONFIG_CRYPTO_VMAC is not set
> >> =

> >> #
> >> # Digest
> >> #
> >> CONFIG_CRYPTO_CRC32C=3Dy
> >> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> >> CONFIG_CRYPTO_CRC32=3Dm
> >> CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> >> # CONFIG_CRYPTO_XXHASH is not set
> >> # CONFIG_CRYPTO_BLAKE2B is not set
> >> # CONFIG_CRYPTO_BLAKE2S is not set
> >> CONFIG_CRYPTO_CRCT10DIF=3Dm
> >> CONFIG_CRYPTO_GHASH=3Dy
> >> CONFIG_CRYPTO_POLY1305=3Dm
> >> CONFIG_CRYPTO_MD4=3Dm
> >> CONFIG_CRYPTO_MD5=3Dy
> >> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> >> CONFIG_CRYPTO_RMD160=3Dm
> >> CONFIG_CRYPTO_SHA1=3Dy
> >> CONFIG_CRYPTO_SHA256=3Dy
> >> CONFIG_CRYPTO_SHA512=3Dy
> >> # CONFIG_CRYPTO_SHA3 is not set
> >> CONFIG_CRYPTO_SM3=3Dm
> >> CONFIG_CRYPTO_STREEBOG=3Dy
> >> # CONFIG_CRYPTO_WP512 is not set
> >> =

> >> #
> >> # Ciphers
> >> #
> >> CONFIG_CRYPTO_AES=3Dy
> >> CONFIG_CRYPTO_AES_TI=3Dm
> >> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> >> CONFIG_CRYPTO_BLOWFISH=3Dm
> >> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> >> # CONFIG_CRYPTO_CAMELLIA is not set
> >> CONFIG_CRYPTO_CAST_COMMON=3Dy
> >> CONFIG_CRYPTO_CAST5=3Dm
> >> CONFIG_CRYPTO_CAST6=3Dy
> >> CONFIG_CRYPTO_DES=3Dy
> >> CONFIG_CRYPTO_FCRYPT=3Dy
> >> CONFIG_CRYPTO_CHACHA20=3Dy
> >> # CONFIG_CRYPTO_SERPENT is not set
> >> # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
> >> # CONFIG_CRYPTO_SM4 is not set
> >> CONFIG_CRYPTO_TWOFISH=3Dy
> >> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> >> CONFIG_CRYPTO_TWOFISH_586=3Dy
> >> =

> >> #
> >> # Compression
> >> #
> >> CONFIG_CRYPTO_DEFLATE=3Dm
> >> CONFIG_CRYPTO_LZO=3Dy
> >> CONFIG_CRYPTO_842=3Dy
> >> CONFIG_CRYPTO_LZ4=3Dy
> >> # CONFIG_CRYPTO_LZ4HC is not set
> >> # CONFIG_CRYPTO_ZSTD is not set
> >> =

> >> #
> >> # Random Number Generation
> >> #
> >> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> >> CONFIG_CRYPTO_DRBG_MENU=3Dy
> >> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> >> CONFIG_CRYPTO_DRBG_HASH=3Dy
> >> # CONFIG_CRYPTO_DRBG_CTR is not set
> >> CONFIG_CRYPTO_DRBG=3Dy
> >> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> >> # CONFIG_CRYPTO_USER_API_HASH is not set
> >> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> >> # CONFIG_CRYPTO_USER_API_RNG is not set
> >> # CONFIG_CRYPTO_USER_API_AEAD is not set
> >> CONFIG_CRYPTO_HASH_INFO=3Dy
> >> # CONFIG_CRYPTO_HW is not set
> >> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> >> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> >> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> >> # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> >> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> >> # CONFIG_PKCS7_TEST_KEY is not set
> >> # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
> >> =

> >> #
> >> # Certificates for signature checking
> >> #
> >> CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
> >> CONFIG_MODULE_SIG_KEY_TYPE_RSA=3Dy
> >> # CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
> >> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> >> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> >> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> >> CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
> >> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> >> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> >> CONFIG_SYSTEM_REVOCATION_LIST=3Dy
> >> CONFIG_SYSTEM_REVOCATION_KEYS=3D""
> >> # end of Certificates for signature checking
> >> =

> >> CONFIG_BINARY_PRINTF=3Dy
> >> =

> >> #
> >> # Library routines
> >> #
> >> CONFIG_LINEAR_RANGES=3Dy
> >> # CONFIG_PACKING is not set
> >> CONFIG_BITREVERSE=3Dy
> >> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> >> CONFIG_GENERIC_STRNLEN_USER=3Dy
> >> CONFIG_GENERIC_NET_UTILS=3Dy
> >> CONFIG_CORDIC=3Dy
> >> CONFIG_PRIME_NUMBERS=3Dy
> >> CONFIG_RATIONAL=3Dy
> >> CONFIG_GENERIC_PCI_IOMAP=3Dy
> >> CONFIG_GENERIC_IOMAP=3Dy
> >> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> >> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> >> =

> >> #
> >> # Crypto library routines
> >> #
> >> CONFIG_CRYPTO_LIB_AES=3Dy
> >> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
> >> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> >> CONFIG_CRYPTO_LIB_CHACHA=3Dy
> >> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3Dm
> >> CONFIG_CRYPTO_LIB_CURVE25519=3Dm
> >> CONFIG_CRYPTO_LIB_DES=3Dy
> >> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D1
> >> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> >> CONFIG_CRYPTO_LIB_POLY1305=3Dy
> >> CONFIG_CRYPTO_LIB_CHACHA20POLY1305=3Dy
> >> CONFIG_CRYPTO_LIB_SHA256=3Dy
> >> # end of Crypto library routines
> >> =

> >> CONFIG_CRC_CCITT=3Dy
> >> CONFIG_CRC16=3Dy
> >> CONFIG_CRC_T10DIF=3Dm
> >> CONFIG_CRC_ITU_T=3Dy
> >> CONFIG_CRC32=3Dy
> >> # CONFIG_CRC32_SELFTEST is not set
> >> # CONFIG_CRC32_SLICEBY8 is not set
> >> CONFIG_CRC32_SLICEBY4=3Dy
> >> # CONFIG_CRC32_SARWATE is not set
> >> # CONFIG_CRC32_BIT is not set
> >> # CONFIG_CRC64 is not set
> >> CONFIG_CRC4=3Dm
> >> # CONFIG_CRC7 is not set
> >> CONFIG_LIBCRC32C=3Dy
> >> CONFIG_CRC8=3Dy
> >> CONFIG_XXHASH=3Dy
> >> # CONFIG_RANDOM32_SELFTEST is not set
> >> CONFIG_842_COMPRESS=3Dy
> >> CONFIG_842_DECOMPRESS=3Dy
> >> CONFIG_ZLIB_INFLATE=3Dy
> >> CONFIG_ZLIB_DEFLATE=3Dy
> >> CONFIG_LZO_COMPRESS=3Dy
> >> CONFIG_LZO_DECOMPRESS=3Dy
> >> CONFIG_LZ4_COMPRESS=3Dy
> >> CONFIG_LZ4_DECOMPRESS=3Dy
> >> CONFIG_ZSTD_DECOMPRESS=3Dy
> >> CONFIG_XZ_DEC=3Dy
> >> CONFIG_XZ_DEC_X86=3Dy
> >> CONFIG_XZ_DEC_POWERPC=3Dy
> >> CONFIG_XZ_DEC_IA64=3Dy
> >> CONFIG_XZ_DEC_ARM=3Dy
> >> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> >> CONFIG_XZ_DEC_SPARC=3Dy
> >> CONFIG_XZ_DEC_MICROLZMA=3Dy
> >> CONFIG_XZ_DEC_BCJ=3Dy
> >> # CONFIG_XZ_DEC_TEST is not set
> >> CONFIG_DECOMPRESS_GZIP=3Dy
> >> CONFIG_DECOMPRESS_BZIP2=3Dy
> >> CONFIG_DECOMPRESS_LZMA=3Dy
> >> CONFIG_DECOMPRESS_LZO=3Dy
> >> CONFIG_DECOMPRESS_LZ4=3Dy
> >> CONFIG_DECOMPRESS_ZSTD=3Dy
> >> CONFIG_GENERIC_ALLOCATOR=3Dy
> >> CONFIG_REED_SOLOMON=3Dm
> >> CONFIG_REED_SOLOMON_DEC16=3Dy
> >> CONFIG_BCH=3Dm
> >> CONFIG_INTERVAL_TREE=3Dy
> >> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> >> CONFIG_HAS_IOMEM=3Dy
> >> CONFIG_HAS_IOPORT_MAP=3Dy
> >> CONFIG_HAS_DMA=3Dy
> >> CONFIG_DMA_OPS=3Dy
> >> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> >> CONFIG_NEED_DMA_MAP_STATE=3Dy
> >> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> >> CONFIG_SWIOTLB=3Dy
> >> CONFIG_DMA_CMA=3Dy
> >> CONFIG_DMA_PERNUMA_CMA=3Dy
> >> =

> >> #
> >> # Default contiguous memory area size:
> >> #
> >> CONFIG_CMA_SIZE_MBYTES=3D0
> >> CONFIG_CMA_SIZE_PERCENTAGE=3D0
> >> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> >> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> >> # CONFIG_CMA_SIZE_SEL_MIN is not set
> >> CONFIG_CMA_SIZE_SEL_MAX=3Dy
> >> CONFIG_CMA_ALIGNMENT=3D8
> >> # CONFIG_DMA_API_DEBUG is not set
> >> CONFIG_DMA_MAP_BENCHMARK=3Dy
> >> CONFIG_SGL_ALLOC=3Dy
> >> CONFIG_CHECK_SIGNATURE=3Dy
> >> CONFIG_DQL=3Dy
> >> CONFIG_GLOB=3Dy
> >> # CONFIG_GLOB_SELFTEST is not set
> >> CONFIG_NLATTR=3Dy
> >> CONFIG_CLZ_TAB=3Dy
> >> # CONFIG_IRQ_POLL is not set
> >> CONFIG_MPILIB=3Dy
> >> CONFIG_SIGNATURE=3Dy
> >> CONFIG_OID_REGISTRY=3Dy
> >> CONFIG_HAVE_GENERIC_VDSO=3Dy
> >> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> >> CONFIG_GENERIC_VDSO_32=3Dy
> >> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> >> CONFIG_FONT_SUPPORT=3Dy
> >> CONFIG_FONTS=3Dy
> >> # CONFIG_FONT_8x8 is not set
> >> CONFIG_FONT_8x16=3Dy
> >> # CONFIG_FONT_6x11 is not set
> >> # CONFIG_FONT_7x14 is not set
> >> # CONFIG_FONT_PEARL_8x8 is not set
> >> # CONFIG_FONT_ACORN_8x8 is not set
> >> # CONFIG_FONT_MINI_4x6 is not set
> >> # CONFIG_FONT_6x10 is not set
> >> # CONFIG_FONT_10x18 is not set
> >> CONFIG_FONT_SUN8x16=3Dy
> >> CONFIG_FONT_SUN12x22=3Dy
> >> CONFIG_FONT_TER16x32=3Dy
> >> CONFIG_FONT_6x8=3Dy
> >> CONFIG_SG_POOL=3Dy
> >> CONFIG_MEMREGION=3Dy
> >> CONFIG_ARCH_STACKWALK=3Dy
> >> CONFIG_STACKDEPOT=3Dy
> >> CONFIG_STACK_HASH_ORDER=3D20
> >> CONFIG_SBITMAP=3Dy
> >> # end of Library routines
> >> =

> >> #
> >> # Kernel hacking
> >> #
> >> =

> >> #
> >> # printk and dmesg options
> >> #
> >> CONFIG_PRINTK_TIME=3Dy
> >> CONFIG_PRINTK_CALLER=3Dy
> >> CONFIG_STACKTRACE_BUILD_ID=3Dy
> >> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> >> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> >> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> >> CONFIG_BOOT_PRINTK_DELAY=3Dy
> >> # CONFIG_DYNAMIC_DEBUG is not set
> >> # CONFIG_DYNAMIC_DEBUG_CORE is not set
> >> CONFIG_SYMBOLIC_ERRNAME=3Dy
> >> CONFIG_DEBUG_BUGVERBOSE=3Dy
> >> # end of printk and dmesg options
> >> =

> >> #
> >> # Compile-time checks and compiler options
> >> #
> >> CONFIG_DEBUG_INFO=3Dy
> >> CONFIG_DEBUG_INFO_REDUCED=3Dy
> >> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> >> # CONFIG_DEBUG_INFO_SPLIT is not set
> >> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> >> # CONFIG_DEBUG_INFO_DWARF4 is not set
> >> # CONFIG_DEBUG_INFO_DWARF5 is not set
> >> CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> >> # CONFIG_GDB_SCRIPTS is not set
> >> CONFIG_FRAME_WARN=3D1024
> >> CONFIG_STRIP_ASM_SYMS=3Dy
> >> CONFIG_READABLE_ASM=3Dy
> >> # CONFIG_HEADERS_INSTALL is not set
> >> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> >> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> >> CONFIG_FRAME_POINTER=3Dy
> >> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> >> # end of Compile-time checks and compiler options
> >> =

> >> #
> >> # Generic Kernel Debugging Instruments
> >> #
> >> CONFIG_MAGIC_SYSRQ=3Dy
> >> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> >> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> >> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> >> CONFIG_DEBUG_FS=3Dy
> >> # CONFIG_DEBUG_FS_ALLOW_ALL is not set
> >> CONFIG_DEBUG_FS_DISALLOW_MOUNT=3Dy
> >> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> >> CONFIG_HAVE_ARCH_KGDB=3Dy
> >> # CONFIG_KGDB is not set
> >> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> >> CONFIG_UBSAN=3Dy
> >> # CONFIG_UBSAN_TRAP is not set
> >> CONFIG_CC_HAS_UBSAN_BOUNDS=3Dy
> >> CONFIG_UBSAN_BOUNDS=3Dy
> >> CONFIG_UBSAN_ONLY_BOUNDS=3Dy
> >> CONFIG_UBSAN_SHIFT=3Dy
> >> # CONFIG_UBSAN_DIV_ZERO is not set
> >> # CONFIG_UBSAN_UNREACHABLE is not set
> >> # CONFIG_UBSAN_BOOL is not set
> >> # CONFIG_UBSAN_ENUM is not set
> >> # CONFIG_UBSAN_ALIGNMENT is not set
> >> CONFIG_UBSAN_SANITIZE_ALL=3Dy
> >> # CONFIG_TEST_UBSAN is not set
> >> # end of Generic Kernel Debugging Instruments
> >> =

> >> CONFIG_DEBUG_KERNEL=3Dy
> >> CONFIG_DEBUG_MISC=3Dy
> >> =

> >> #
> >> # Networking Debugging
> >> #
> >> # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> >> # CONFIG_NET_NS_REFCNT_TRACKER is not set
> >> # end of Networking Debugging
> >> =

> >> #
> >> # Memory Debugging
> >> #
> >> CONFIG_PAGE_EXTENSION=3Dy
> >> # CONFIG_DEBUG_PAGEALLOC is not set
> >> # CONFIG_PAGE_OWNER is not set
> >> # CONFIG_PAGE_POISONING is not set
> >> # CONFIG_DEBUG_PAGE_REF is not set
> >> # CONFIG_DEBUG_RODATA_TEST is not set
> >> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> >> # CONFIG_DEBUG_WX is not set
> >> CONFIG_GENERIC_PTDUMP=3Dy
> >> # CONFIG_PTDUMP_DEBUGFS is not set
> >> # CONFIG_DEBUG_OBJECTS is not set
> >> CONFIG_SLUB_DEBUG_ON=3Dy
> >> # CONFIG_SLUB_STATS is not set
> >> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> >> # CONFIG_DEBUG_KMEMLEAK is not set
> >> CONFIG_DEBUG_STACK_USAGE=3Dy
> >> # CONFIG_SCHED_STACK_END_CHECK is not set
> >> CONFIG_DEBUG_VM=3Dy
> >> # CONFIG_DEBUG_VM_VMACACHE is not set
> >> # CONFIG_DEBUG_VM_RB is not set
> >> # CONFIG_DEBUG_VM_PGFLAGS is not set
> >> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> >> # CONFIG_DEBUG_VIRTUAL is not set
> >> CONFIG_DEBUG_MEMORY_INIT=3Dy
> >> CONFIG_DEBUG_KMAP_LOCAL=3Dy
> >> CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=3Dy
> >> # CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
> >> # CONFIG_DEBUG_HIGHMEM is not set
> >> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> >> # CONFIG_DEBUG_STACKOVERFLOW is not set
> >> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> >> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> >> CONFIG_HAVE_ARCH_KFENCE=3Dy
> >> CONFIG_KFENCE=3Dy
> >> CONFIG_KFENCE_SAMPLE_INTERVAL=3D100
> >> CONFIG_KFENCE_NUM_OBJECTS=3D255
> >> CONFIG_KFENCE_STRESS_TEST_FAULTS=3D0
> >> # end of Memory Debugging
> >> =

> >> CONFIG_DEBUG_SHIRQ=3Dy
> >> =

> >> #
> >> # Debug Oops, Lockups and Hangs
> >> #
> >> CONFIG_PANIC_ON_OOPS=3Dy
> >> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> >> CONFIG_PANIC_TIMEOUT=3D0
> >> CONFIG_LOCKUP_DETECTOR=3Dy
> >> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> >> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> >> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> >> # CONFIG_HARDLOCKUP_DETECTOR is not set
> >> CONFIG_DETECT_HUNG_TASK=3Dy
> >> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480
> >> CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> >> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D1
> >> CONFIG_WQ_WATCHDOG=3Dy
> >> # CONFIG_TEST_LOCKUP is not set
> >> # end of Debug Oops, Lockups and Hangs
> >> =

> >> #
> >> # Scheduler Debugging
> >> #
> >> # CONFIG_SCHED_DEBUG is not set
> >> CONFIG_SCHED_INFO=3Dy
> >> CONFIG_SCHEDSTATS=3Dy
> >> # end of Scheduler Debugging
> >> =

> >> CONFIG_DEBUG_TIMEKEEPING=3Dy
> >> =

> >> #
> >> # Lock Debugging (spinlocks, mutexes, etc...)
> >> #
> >> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> >> CONFIG_PROVE_LOCKING=3Dy
> >> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> >> # CONFIG_LOCK_STAT is not set
> >> CONFIG_DEBUG_RT_MUTEXES=3Dy
> >> CONFIG_DEBUG_SPINLOCK=3Dy
> >> CONFIG_DEBUG_MUTEXES=3Dy
> >> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> >> CONFIG_DEBUG_RWSEMS=3Dy
> >> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> >> CONFIG_LOCKDEP=3Dy
> >> CONFIG_LOCKDEP_BITS=3D15
> >> CONFIG_LOCKDEP_CHAINS_BITS=3D16
> >> CONFIG_LOCKDEP_STACK_TRACE_BITS=3D19
> >> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=3D14
> >> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=3D12
> >> # CONFIG_DEBUG_LOCKDEP is not set
> >> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> >> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> >> CONFIG_LOCK_TORTURE_TEST=3Dm
> >> # CONFIG_WW_MUTEX_SELFTEST is not set
> >> # CONFIG_SCF_TORTURE_TEST is not set
> >> # end of Lock Debugging (spinlocks, mutexes, etc...)
> >> =

> >> CONFIG_TRACE_IRQFLAGS=3Dy
> >> CONFIG_TRACE_IRQFLAGS_NMI=3Dy
> >> CONFIG_DEBUG_IRQFLAGS=3Dy
> >> CONFIG_STACKTRACE=3Dy
> >> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> >> # CONFIG_DEBUG_KOBJECT is not set
> >> =

> >> #
> >> # Debug kernel data structures
> >> #
> >> CONFIG_DEBUG_LIST=3Dy
> >> # CONFIG_DEBUG_PLIST is not set
> >> CONFIG_DEBUG_SG=3Dy
> >> # CONFIG_DEBUG_NOTIFIERS is not set
> >> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> >> # end of Debug kernel data structures
> >> =

> >> CONFIG_DEBUG_CREDENTIALS=3Dy
> >> =

> >> #
> >> # RCU Debugging
> >> #
> >> CONFIG_PROVE_RCU=3Dy
> >> CONFIG_TORTURE_TEST=3Dm
> >> CONFIG_RCU_SCALE_TEST=3Dm
> >> CONFIG_RCU_TORTURE_TEST=3Dm
> >> # CONFIG_RCU_REF_SCALE_TEST is not set
> >> # CONFIG_RCU_TRACE is not set
> >> CONFIG_RCU_EQS_DEBUG=3Dy
> >> # end of RCU Debugging
> >> =

> >> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> >> CONFIG_LATENCYTOP=3Dy
> >> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> >> CONFIG_NOP_TRACER=3Dy
> >> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> >> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> >> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> >> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> >> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> >> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> >> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> >> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> >> CONFIG_BUILDTIME_MCOUNT_SORT=3Dy
> >> CONFIG_TRACE_CLOCK=3Dy
> >> CONFIG_RING_BUFFER=3Dy
> >> CONFIG_EVENT_TRACING=3Dy
> >> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> >> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> >> CONFIG_TRACING=3Dy
> >> CONFIG_TRACING_SUPPORT=3Dy
> >> # CONFIG_FTRACE is not set
> >> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> >> CONFIG_SAMPLES=3Dy
> >> CONFIG_SAMPLE_AUXDISPLAY=3Dy
> >> # CONFIG_SAMPLE_TRACE_EVENTS is not set
> >> # CONFIG_SAMPLE_TRACE_PRINTK is not set
> >> # CONFIG_SAMPLE_TRACE_ARRAY is not set
> >> # CONFIG_SAMPLE_KOBJECT is not set
> >> CONFIG_SAMPLE_KPROBES=3Dm
> >> CONFIG_SAMPLE_KRETPROBES=3Dm
> >> CONFIG_SAMPLE_HW_BREAKPOINT=3Dm
> >> # CONFIG_SAMPLE_KFIFO is not set
> >> # CONFIG_SAMPLE_RPMSG_CLIENT is not set
> >> CONFIG_SAMPLE_CONFIGFS=3Dm
> >> # CONFIG_SAMPLE_VFIO_MDEV_MTTY is not set
> >> # CONFIG_SAMPLE_VFIO_MDEV_MDPY is not set
> >> # CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
> >> CONFIG_SAMPLE_VFIO_MDEV_MBOCHS=3Dm
> >> # CONFIG_SAMPLE_WATCHDOG is not set
> >> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> >> # CONFIG_STRICT_DEVMEM is not set
> >> =

> >> #
> >> # x86 Debugging
> >> #
> >> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> >> CONFIG_EARLY_PRINTK_USB=3Dy
> >> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> >> CONFIG_EARLY_PRINTK=3Dy
> >> CONFIG_EARLY_PRINTK_DBGP=3Dy
> >> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> >> CONFIG_DEBUG_TLBFLUSH=3Dy
> >> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> >> # CONFIG_X86_DECODER_SELFTEST is not set
> >> CONFIG_IO_DELAY_0X80=3Dy
> >> # CONFIG_IO_DELAY_0XED is not set
> >> # CONFIG_IO_DELAY_UDELAY is not set
> >> # CONFIG_IO_DELAY_NONE is not set
> >> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> >> # CONFIG_CPA_DEBUG is not set
> >> CONFIG_DEBUG_ENTRY=3Dy
> >> CONFIG_X86_DEBUG_FPU=3Dy
> >> CONFIG_PUNIT_ATOM_DEBUG=3Dm
> >> CONFIG_UNWINDER_FRAME_POINTER=3Dy
> >> # end of x86 Debugging
> >> =

> >> #
> >> # Kernel Testing and Coverage
> >> #
> >> # CONFIG_KUNIT is not set
> >> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> >> # CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
> >> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
> >> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> >> # CONFIG_FAULT_INJECTION is not set
> >> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> >> # CONFIG_RUNTIME_TESTING_MENU is not set
> >> CONFIG_ARCH_USE_MEMTEST=3Dy
> >> CONFIG_MEMTEST=3Dy
> >> # end of Kernel Testing and Coverage
> >> # end of Kernel hacking
> > =

> >> #!/bin/sh
> >> =

> >> export_top_env()
> >> {
> >> 	export suite=3D'boot'
> >> 	export testcase=3D'boot'
> >> 	export category=3D'functional'
> >> 	export timeout=3D'10m'
> >> 	export job_origin=3D'boot.yaml'
> >> 	export queue_cmdline_keys=3D'branch
> >> commit'
> >> 	export queue=3D'bisect'
> >> 	export testbox=3D'vm-snb-115'
> >> 	export tbox_group=3D'vm-snb'
> >> 	export branch=3D'linux-devel/devel-hourly-20220307-175616'
> >> 	export commit=3D'ae107fa91914f098cd54ab77e68f83dd6259e901'
> >> 	export kconfig=3D'i386-randconfig-a003-20220307'
> >> 	export nr_vm=3D160
> >> 	export submit_id=3D'62275a9928b0c1b9dc62fb4e'
> >> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-115/boot-1-debian-i386-=
20191205.cgz-ae107fa91914f098cd54ab77e68f83dd6259e901-20220308-47580-1l9smx=
f-2.yaml'
> >> 	export id=3D'5828da01136d5f9f1f59f5f03d9ab388281784b7'
> >> 	export queuer_version=3D'/lkp-src'
> >> 	export model=3D'qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
> >> 	export nr_cpu=3D2
> >> 	export memory=3D'16G'
> >> 	export need_kconfig=3D\{\"KVM_GUEST\"\=3D\>\"y\"\}
> >> 	export ssh_base_port=3D23032
> >> 	export kernel_cmdline=3D'vmalloc=3D128M initramfs_async=3D0 page_owne=
r=3Don'
> >> 	export rootfs=3D'debian-i386-20191205.cgz'
> >> 	export compiler=3D'gcc-9'
> >> 	export enqueue_time=3D'2022-03-08 21:31:06 +0800'
> >> 	export _id=3D'62275e3f28b0c1b9dc62fb50'
> >> 	export _rt=3D'/result/boot/1/vm-snb/debian-i386-20191205.cgz/i386-ran=
dconfig-a003-20220307/gcc-9/ae107fa91914f098cd54ab77e68f83dd6259e901'
> >> 	export user=3D'lkp'
> >> 	export LKP_SERVER=3D'internal-lkp-server'
> >> 	export result_root=3D'/result/boot/1/vm-snb/debian-i386-20191205.cgz/=
i386-randconfig-a003-20220307/gcc-9/ae107fa91914f098cd54ab77e68f83dd6259e90=
1/3'
> >> 	export scheduler_version=3D'/lkp/lkp/.src-20220308-102049'
> >> 	export arch=3D'i386'
> >> 	export max_uptime=3D600
> >> 	export initrd=3D'/osimage/debian/debian-i386-20191205.cgz'
> >> 	export bootloader_append=3D'root=3D/dev/ram0
> >> RESULT_ROOT=3D/result/boot/1/vm-snb/debian-i386-20191205.cgz/i386-rand=
config-a003-20220307/gcc-9/ae107fa91914f098cd54ab77e68f83dd6259e901/3
> >> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a003-20220307/gcc-9/ae107fa919=
14f098cd54ab77e68f83dd6259e901/vmlinuz-5.17.0-rc1-00003-gae107fa91914
> >> branch=3Dlinux-devel/devel-hourly-20220307-175616
> >> job=3D/lkp/jobs/scheduled/vm-snb-115/boot-1-debian-i386-20191205.cgz-a=
e107fa91914f098cd54ab77e68f83dd6259e901-20220308-47580-1l9smxf-2.yaml
> >> user=3Dlkp
> >> ARCH=3Di386
> >> kconfig=3Di386-randconfig-a003-20220307
> >> commit=3Dae107fa91914f098cd54ab77e68f83dd6259e901
> >> vmalloc=3D128M initramfs_async=3D0 page_owner=3Don
> >> max_uptime=3D600
> >> LKP_SERVER=3Dinternal-lkp-server
> >> selinux=3D0
> >> debug
> >> apic=3Ddebug
> >> sysrq_always_enabled
> >> rcupdate.rcu_cpu_stall_timeout=3D100
> >> net.ifnames=3D0
> >> printk.devkmsg=3Don
> >> panic=3D-1
> >> softlockup_panic=3D1
> >> nmi_watchdog=3Dpanic
> >> oops=3Dpanic
> >> load_ramdisk=3D2
> >> prompt_ramdisk=3D0
> >> drbd.minor_count=3D8
> >> systemd.log_level=3Derr
> >> ignore_loglevel
> >> console=3Dtty0
> >> earlyprintk=3DttyS0,115200
> >> console=3DttyS0,115200
> >> vga=3Dnormal
> >> rw'
> >> 	export modules_initrd=3D'/pkg/linux/i386-randconfig-a003-20220307/gcc=
-9/ae107fa91914f098cd54ab77e68f83dd6259e901/modules.cgz'
> >> 	export bm_initrd=3D'/osimage/deps/debian-i386-20191205.cgz/lkp_202012=
03.cgz'
> >> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-i386.cgz'
> >> 	export site=3D'inn'
> >> 	export LKP_CGI_PORT=3D80
> >> 	export LKP_CIFS_PORT=3D139
> >> 	export schedule_notify_address=3D
> >> 	export kernel=3D'/pkg/linux/i386-randconfig-a003-20220307/gcc-9/ae107=
fa91914f098cd54ab77e68f83dd6259e901/vmlinuz-5.17.0-rc1-00003-gae107fa91914'
> >> 	export dequeue_time=3D'2022-03-08 21:47:36 +0800'
> >> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-115/boot-1-debian-i38=
6-20191205.cgz-ae107fa91914f098cd54ab77e68f83dd6259e901-20220308-47580-1l9s=
mxf-2.cgz'
> >> =

> >> 	[ -n "$LKP_SRC" ] ||
> >> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> >> }
> >> =

> >> run_job()
> >> {
> >> 	echo $$ > $TMP/run-job.pid
> >> =

> >> 	. $LKP_SRC/lib/http.sh
> >> 	. $LKP_SRC/lib/job.sh
> >> 	. $LKP_SRC/lib/env.sh
> >> =

> >> 	export_top_env
> >> =

> >> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
> >> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
> >> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
> >> 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
> >> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> >> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> >> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> >> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> >> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> >> =

> >> 	run_test $LKP_SRC/tests/wrapper sleep 1
> >> }
> >> =

> >> extract_stats()
> >> {
> >> 	export stats_part_begin=3D
> >> 	export stats_part_end=3D
> >> =

> >> 	$LKP_SRC/stats/wrapper boot-slabinfo
> >> 	$LKP_SRC/stats/wrapper boot-meminfo
> >> 	$LKP_SRC/stats/wrapper memmap
> >> 	$LKP_SRC/stats/wrapper boot-memory
> >> 	$LKP_SRC/stats/wrapper boot-time
> >> 	$LKP_SRC/stats/wrapper kernel-size
> >> 	$LKP_SRC/stats/wrapper kmsg
> >> 	$LKP_SRC/stats/wrapper sleep
> >> 	$LKP_SRC/stats/wrapper meminfo
> >> =

> >> 	$LKP_SRC/stats/wrapper time sleep.time
> >> 	$LKP_SRC/stats/wrapper dmesg
> >> 	$LKP_SRC/stats/wrapper kmsg
> >> 	$LKP_SRC/stats/wrapper last_state
> >> 	$LKP_SRC/stats/wrapper stderr
> >> 	$LKP_SRC/stats/wrapper time
> >> }
> >> =

> >> "$@"
> > =

> > =

>=20
--===============7903124997776297416==--

