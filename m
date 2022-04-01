Content-Type: multipart/mixed; boundary="===============0093535511003517046=="
MIME-Version: 1.0
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 555b8c8cb3: WARNING:at_lib/stackdepot.c:#stack_depot_fetch
Date: Sat, 02 Apr 2022 00:50:14 +0900
Message-ID: <YkcfNjZJSXNsAlLt@hyeyoo>
In-Reply-To: <20220324095218.GA2108184@odroid>
List-Id: <oe-lkp.lists.linux.dev>

--===============0093535511003517046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 09:52:18AM +0000, Hyeonggon Yoo wrote:
> On Wed, Mar 23, 2022 at 05:05:20PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 555b8c8cb3f335ec8fd9d1ffd25e1395790d102d ("mm/slub: use stackde=
pot to save stack trace in objects")
> > https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-stac=
kdepot-v3r1
> > =

> > in testcase: rcutorture
> > version: =

> > with following parameters:
> > =

> > 	runtime: 300s
> > 	test: cpuhotplug
> > 	torture_type: tasks
> > =

> =

> [+Cc Vlastimil, linux-mm, and people related to stackdepot]
> =

> I'm going to spend time on it.
> I have no clue why this happened yet.
>

I modified alloc/free debug processing to check if handle is valid, but
it couldn't detect something wrong. Everything was fine when allocating/fre=
eing objects.

Handles must be modified outside SLUB code.
(Or maybe SLUB code related to cpu hotplugging did cause this.)

I reproduced this problem on x86_64 with KASAN enabled, but KASAN
detects nothing.

I suspect this would be memory corruption bug, race condition, or
wrong calculation of object metadata offset. But still have no clue.

I'm going to check if KCSAN detects something.

> > test-description: rcutorture is rcutorture kernel module load/unload te=
st.
> > test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> > =

> > =

> > on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > (please be noted the issue is random, we observed it 4 times out of 32 =
runs.
> > parent keeps clean on 32 runs.)
> > =

> > [ 318.532656][ T1741] WARNING: CPU: 0 PID: 1741 at lib/stackdepot.c:326=
 stack_depot_fetch (lib/stackdepot.c:326 (discriminator 1)) =

> > [  318.534566][ T1741] Modules linked in: rcutorture(-) torture aesni_i=
ntel crypto_simd cryptd input_leds pcspkr qemu_fw_cfg tiny_power_button but=
ton
> > [  318.537087][ T1741] CPU: 0 PID: 1741 Comm: rmmod Not tainted 5.17.0-=
rc1-00003-g555b8c8cb3f3 #1 1fcfbabccf3b829d5910183510efdc3cb11ab20b
> > [  318.539366][ T1741] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS 1.12.0-1 04/01/2014
> > [ 318.541093][ T1741] EIP: stack_depot_fetch (lib/stackdepot.c:326 (dis=
criminator 1)) =

> > [ 318.542104][ T1741] Code: 66 81 e3 ff 03 85 c0 74 26 89 d6 89 c7 8b 1=
5 f0 56 3e d5 81 e7 ff ff 1f 00 39 d7 7e 16 50 52 57 68 20 37 59 d4 e8 47 f=
4 50 00 <0f> 0b 83 c4 10 31 c0 eb 2f 81 ff ff 1f 00 00 76 0c 89 fa b8 04 bd
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	66 81 e3 ff 03       	and    $0x3ff,%bx
> >    5:	85 c0                	test   %eax,%eax
> >    7:	74 26                	je     0x2f
> >    9:	89 d6                	mov    %edx,%esi
> >    b:	89 c7                	mov    %eax,%edi
> >    d:	8b 15 f0 56 3e d5    	mov    -0x2ac1a910(%rip),%edx        # 0xff=
ffffffd53e5703
> >   13:	81 e7 ff ff 1f 00    	and    $0x1fffff,%edi
> >   19:	39 d7                	cmp    %edx,%edi
> >   1b:	7e 16                	jle    0x33
> >   1d:	50                   	push   %rax
> >   1e:	52                   	push   %rdx
> >   1f:	57                   	push   %rdi
> >   20:	68 20 37 59 d4       	pushq  $0xffffffffd4593720
> >   25:	e8 47 f4 50 00       	callq  0x50f471
> >   2a:*	0f 0b                	ud2    		<-- trapping instruction
> >   2c:	83 c4 10             	add    $0x10,%esp
> >   2f:	31 c0                	xor    %eax,%eax
> >   31:	eb 2f                	jmp    0x62
> >   33:	81 ff ff 1f 00 00    	cmp    $0x1fff,%edi
> >   39:	76 0c                	jbe    0x47
> >   3b:	89 fa                	mov    %edi,%edx
> >   3d:	b8                   	.byte 0xb8
> >   3e:	04 bd                	add    $0xbd,%al
> > =

> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	0f 0b                	ud2    =

> >    2:	83 c4 10             	add    $0x10,%esp
> >    5:	31 c0                	xor    %eax,%eax
> >    7:	eb 2f                	jmp    0x38
> >    9:	81 ff ff 1f 00 00    	cmp    $0x1fff,%edi
> >    f:	76 0c                	jbe    0x1d
> >   11:	89 fa                	mov    %edi,%edx
> >   13:	b8                   	.byte 0xb8
> >   14:	04 bd                	add    $0xbd,%al
> > [  318.545357][ T1741] EAX: 0000003a EBX: 0000016d ECX: 00000027 EDX: d=
471aa3c
> > [  318.546659][ T1741] ESI: f4a31e20 EDI: 000cafae EBP: f4a31e0c ESP: f=
4a31df0
> > [  318.547930][ T1741] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFL=
AGS: 00010296
> > [  318.549302][ T1741] CR0: 80050033 CR2: b7234000 CR3: 3493c000 CR4: 0=
00406d0
> > [  318.550616][ T1741] Call Trace:
> > [ 318.551322][ T1741] kmem_obj_info (mm/slub.c:4365) =

> > [ 318.552241][ T1741] kmem_dump_obj (mm/slab_common.c:594) =

> > [ 318.553214][ T1741] mem_dump_obj (mm/util.c:1026) =

> > [ 318.554068][ T1741] rcu_torture_cleanup+0x3be/0x613 rcutorture
> > [ 318.555861][ T1741] ? rcu_read_lock_sched_held (kernel/rcu/update.c:1=
25) =

> > [ 318.557037][ T1741] ? prepare_to_wait_exclusive (kernel/sched/wait.c:=
415) =

> > [ 318.558077][ T1741] rcu_torture_cleanup (kernel/rcu/rcutorture.c:3008=
) rcutorture
> > [ 318.559763][ T1741] __ia32_sys_delete_module (kernel/module.c:969 ker=
nel/module.c:912 kernel/module.c:912) =

> > [ 318.560840][ T1741] ? lock_release (kernel/locking/lockdep.c:5315 ker=
nel/locking/lockdep.c:5659) =

> > [ 318.561769][ T1741] ? __might_fault (mm/memory.c:5272 mm/memory.c:525=
7) =

> > [ 318.562605][ T1741] __do_fast_syscall_32 (arch/x86/entry/common.c:112=
 arch/x86/entry/common.c:178) =

> > [ 318.563575][ T1741] do_fast_syscall_32 (arch/x86/entry/common.c:203) =

> > [ 318.564559][ T1741] do_SYSENTER_32 (arch/x86/entry/common.c:247) =

> > [ 318.565406][ T1741] entry_SYSENTER_32 (arch/x86/entry/entry_32.S:869) =

> > [  318.566306][ T1741] EIP: 0xb7edb549
> > [ 318.567141][ T1741] Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b=
4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 3=
4 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	03 74 c0 01          	add    0x1(%rax,%rax,8),%esi
> >    4:	10 05 03 74 b8 01    	adc    %al,0x1b87403(%rip)        # 0x1b874=
0d
> >    a:	10 06                	adc    %al,(%rsi)
> >    c:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
> >   10:	10 07                	adc    %al,(%rdi)
> >   12:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
> >   16:	10 08                	adc    %cl,(%rax)
> >   18:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
> >   1c:	00 00                	add    %al,(%rax)
> >   1e:	00 00                	add    %al,(%rax)
> >   20:	00 51 52             	add    %dl,0x52(%rcx)
> >   23:	55                   	push   %rbp
> >   24:	89 e5                	mov    %esp,%ebp
> >   26:	0f 34                	sysenter =

> >   28:	cd 80                	int    $0x80
> >   2a:*	5d                   	pop    %rbp		<-- trapping instruction
> >   2b:	5a                   	pop    %rdx
> >   2c:	59                   	pop    %rcx
> >   2d:	c3                   	retq   =

> >   2e:	90                   	nop
> >   2f:	90                   	nop
> >   30:	90                   	nop
> >   31:	90                   	nop
> >   32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
> >   39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
> > =

> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	5d                   	pop    %rbp
> >    1:	5a                   	pop    %rdx
> >    2:	59                   	pop    %rcx
> >    3:	c3                   	retq   =

> >    4:	90                   	nop
> >    5:	90                   	nop
> >    6:	90                   	nop
> >    7:	90                   	nop
> >    8:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
> >    f:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
> > [  318.570837][ T1741] EAX: ffffffda EBX: b7f2ee44 ECX: 00000800 EDX: b=
7f15949
> > [  318.572303][ T1741] ESI: b7f2ee08 EDI: b7f2ee08 EBP: bfedfe99 ESP: b=
fede158
> > [  318.573645][ T1741] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFL=
AGS: 00000202
> > [  318.575211][ T1741] irq event stamp: 4771
> > [ 318.576062][ T1741] hardirqs last enabled at (4779): __up_console_sem=
 (arch/x86/include/asm/irqflags.h:45 (discriminator 1) arch/x86/include/asm=
/irqflags.h:80 (discriminator 1) arch/x86/include/asm/irqflags.h:138 (discr=
iminator 1) kernel/printk/printk.c:256 (discriminator 1)) =

> > [ 318.578008][ T1741] hardirqs last disabled at (4788): __up_console_se=
m (kernel/printk/printk.c:254 (discriminator 3)) =

> > [ 318.579667][ T1741] softirqs last enabled at (4654): __do_softirq (ar=
ch/x86/include/asm/preempt.h:27 kernel/softirq.c:402 kernel/softirq.c:587) =

> > [ 318.581320][ T1741] softirqs last disabled at (4645): do_softirq_own_=
stack (arch/x86/kernel/irq_32.c:60 arch/x86/kernel/irq_32.c:150) =

> > [  318.583074][ T1741] ---[ end trace 0000000000000000 ]---
> > [  318.584139][ T1741] ------------[ cut here ]------------
> > [  318.585205][ T1741] slab index 568234 out of bounds (73) for stack i=
d a9a8abaa
> > =

> > =

> > To reproduce:
> > =

> >         # build kernel
> > 	cd linux
> > 	cp config-5.17.0-rc1-00003-g555b8c8cb3f3 .config
> > 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare module=
s_prepare bzImage modules
> > 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
> > 	cd <mod-install-dir>
> > 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> > =

> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-scrip=
t is attached in this email
> > =

> >         # if come across any failure that blocks the test,
> >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> > =

> > =

> > =

> > -- =

> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
> > =

> > =

> =

> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/i386 5.17.0-rc1 Kernel Configuration
> > #
> > CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
> > CONFIG_CC_IS_GCC=3Dy
> > CONFIG_GCC_VERSION=3D90400
> > CONFIG_CLANG_VERSION=3D0
> > CONFIG_AS_IS_GNU=3Dy
> > CONFIG_AS_VERSION=3D23502
> > CONFIG_LD_IS_BFD=3Dy
> > CONFIG_LD_VERSION=3D23502
> > CONFIG_LLD_VERSION=3D0
> > CONFIG_CC_CAN_LINK=3Dy
> > CONFIG_CC_CAN_LINK_STATIC=3Dy
> > CONFIG_CC_HAS_ASM_GOTO=3Dy
> > CONFIG_CC_HAS_ASM_INLINE=3Dy
> > CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
> > CONFIG_IRQ_WORK=3Dy
> > CONFIG_BUILDTIME_TABLE_SORT=3Dy
> > CONFIG_THREAD_INFO_IN_TASK=3Dy
> > =

> > #
> > # General setup
> > #
> > CONFIG_BROKEN_ON_SMP=3Dy
> > CONFIG_INIT_ENV_ARG_LIMIT=3D32
> > # CONFIG_COMPILE_TEST is not set
> > # CONFIG_WERROR is not set
> > CONFIG_LOCALVERSION=3D""
> > CONFIG_LOCALVERSION_AUTO=3Dy
> > CONFIG_BUILD_SALT=3D""
> > CONFIG_HAVE_KERNEL_GZIP=3Dy
> > CONFIG_HAVE_KERNEL_BZIP2=3Dy
> > CONFIG_HAVE_KERNEL_LZMA=3Dy
> > CONFIG_HAVE_KERNEL_XZ=3Dy
> > CONFIG_HAVE_KERNEL_LZO=3Dy
> > CONFIG_HAVE_KERNEL_LZ4=3Dy
> > CONFIG_HAVE_KERNEL_ZSTD=3Dy
> > # CONFIG_KERNEL_GZIP is not set
> > # CONFIG_KERNEL_BZIP2 is not set
> > # CONFIG_KERNEL_LZMA is not set
> > # CONFIG_KERNEL_XZ is not set
> > CONFIG_KERNEL_LZO=3Dy
> > # CONFIG_KERNEL_LZ4 is not set
> > # CONFIG_KERNEL_ZSTD is not set
> > CONFIG_DEFAULT_INIT=3D""
> > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> > CONFIG_SWAP=3Dy
> > CONFIG_SYSVIPC=3Dy
> > CONFIG_SYSVIPC_SYSCTL=3Dy
> > # CONFIG_POSIX_MQUEUE is not set
> > CONFIG_WATCH_QUEUE=3Dy
> > CONFIG_CROSS_MEMORY_ATTACH=3Dy
> > # CONFIG_USELIB is not set
> > CONFIG_AUDIT=3Dy
> > CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> > CONFIG_AUDITSYSCALL=3Dy
> > =

> > #
> > # IRQ subsystem
> > #
> > CONFIG_GENERIC_IRQ_PROBE=3Dy
> > CONFIG_GENERIC_IRQ_SHOW=3Dy
> > CONFIG_GENERIC_IRQ_INJECTION=3Dy
> > CONFIG_HARDIRQS_SW_RESEND=3Dy
> > CONFIG_IRQ_DOMAIN=3Dy
> > CONFIG_IRQ_SIM=3Dy
> > CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> > CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> > CONFIG_IRQ_FORCED_THREADING=3Dy
> > CONFIG_SPARSE_IRQ=3Dy
> > CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> > # end of IRQ subsystem
> > =

> > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> > CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> > CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> > CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> > =

> > #
> > # Timers subsystem
> > #
> > CONFIG_HZ_PERIODIC=3Dy
> > # CONFIG_NO_HZ_IDLE is not set
> > CONFIG_NO_HZ=3Dy
> > # CONFIG_HIGH_RES_TIMERS is not set
> > # end of Timers subsystem
> > =

> > CONFIG_BPF=3Dy
> > CONFIG_HAVE_EBPF_JIT=3Dy
> > =

> > #
> > # BPF subsystem
> > #
> > CONFIG_BPF_SYSCALL=3Dy
> > CONFIG_BPF_JIT=3Dy
> > # CONFIG_BPF_JIT_ALWAYS_ON is not set
> > CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dy
> > # CONFIG_BPF_PRELOAD is not set
> > # end of BPF subsystem
> > =

> > CONFIG_PREEMPT_VOLUNTARY_BUILD=3Dy
> > # CONFIG_PREEMPT_NONE is not set
> > CONFIG_PREEMPT_VOLUNTARY=3Dy
> > # CONFIG_PREEMPT is not set
> > CONFIG_PREEMPT_COUNT=3Dy
> > # CONFIG_PREEMPT_DYNAMIC is not set
> > =

> > #
> > # CPU/Task time and stats accounting
> > #
> > CONFIG_TICK_CPU_ACCOUNTING=3Dy
> > CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> > # CONFIG_BSD_PROCESS_ACCT is not set
> > # CONFIG_TASKSTATS is not set
> > CONFIG_PSI=3Dy
> > # CONFIG_PSI_DEFAULT_DISABLED is not set
> > # end of CPU/Task time and stats accounting
> > =

> > #
> > # RCU Subsystem
> > #
> > CONFIG_TINY_RCU=3Dy
> > # CONFIG_RCU_EXPERT is not set
> > CONFIG_SRCU=3Dy
> > CONFIG_TINY_SRCU=3Dy
> > CONFIG_TASKS_RCU_GENERIC=3Dy
> > CONFIG_TASKS_RCU=3Dy
> > CONFIG_TASKS_RUDE_RCU=3Dy
> > CONFIG_TASKS_TRACE_RCU=3Dy
> > CONFIG_RCU_NEED_SEGCBLIST=3Dy
> > # end of RCU Subsystem
> > =

> > CONFIG_IKCONFIG=3Dy
> > CONFIG_IKCONFIG_PROC=3Dy
> > CONFIG_IKHEADERS=3Dy
> > CONFIG_LOG_BUF_SHIFT=3D20
> > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> > # CONFIG_PRINTK_INDEX is not set
> > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> > =

> > #
> > # Scheduler features
> > #
> > # end of Scheduler features
> > =

> > CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> > CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
> > CONFIG_CGROUPS=3Dy
> > # CONFIG_MEMCG is not set
> > # CONFIG_BLK_CGROUP is not set
> > # CONFIG_CGROUP_SCHED is not set
> > # CONFIG_CGROUP_PIDS is not set
> > # CONFIG_CGROUP_RDMA is not set
> > # CONFIG_CGROUP_FREEZER is not set
> > # CONFIG_CGROUP_DEVICE is not set
> > # CONFIG_CGROUP_CPUACCT is not set
> > # CONFIG_CGROUP_PERF is not set
> > # CONFIG_CGROUP_BPF is not set
> > # CONFIG_CGROUP_MISC is not set
> > # CONFIG_CGROUP_DEBUG is not set
> > CONFIG_NAMESPACES=3Dy
> > CONFIG_UTS_NS=3Dy
> > # CONFIG_TIME_NS is not set
> > CONFIG_IPC_NS=3Dy
> > CONFIG_USER_NS=3Dy
> > CONFIG_PID_NS=3Dy
> > # CONFIG_NET_NS is not set
> > CONFIG_CHECKPOINT_RESTORE=3Dy
> > # CONFIG_SCHED_AUTOGROUP is not set
> > # CONFIG_SYSFS_DEPRECATED is not set
> > # CONFIG_RELAY is not set
> > CONFIG_BLK_DEV_INITRD=3Dy
> > CONFIG_INITRAMFS_SOURCE=3D""
> > CONFIG_RD_GZIP=3Dy
> > CONFIG_RD_BZIP2=3Dy
> > CONFIG_RD_LZMA=3Dy
> > CONFIG_RD_XZ=3Dy
> > CONFIG_RD_LZO=3Dy
> > CONFIG_RD_LZ4=3Dy
> > CONFIG_RD_ZSTD=3Dy
> > # CONFIG_BOOT_CONFIG is not set
> > # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> > CONFIG_LD_ORPHAN_WARN=3Dy
> > CONFIG_SYSCTL=3Dy
> > CONFIG_HAVE_UID16=3Dy
> > CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > # CONFIG_EXPERT is not set
> > CONFIG_UID16=3Dy
> > CONFIG_MULTIUSER=3Dy
> > CONFIG_SGETMASK_SYSCALL=3Dy
> > CONFIG_SYSFS_SYSCALL=3Dy
> > CONFIG_FHANDLE=3Dy
> > CONFIG_POSIX_TIMERS=3Dy
> > CONFIG_PRINTK=3Dy
> > CONFIG_BUG=3Dy
> > CONFIG_ELF_CORE=3Dy
> > CONFIG_PCSPKR_PLATFORM=3Dy
> > CONFIG_BASE_FULL=3Dy
> > CONFIG_FUTEX=3Dy
> > CONFIG_FUTEX_PI=3Dy
> > CONFIG_EPOLL=3Dy
> > CONFIG_SIGNALFD=3Dy
> > CONFIG_TIMERFD=3Dy
> > CONFIG_EVENTFD=3Dy
> > CONFIG_SHMEM=3Dy
> > CONFIG_AIO=3Dy
> > CONFIG_IO_URING=3Dy
> > CONFIG_ADVISE_SYSCALLS=3Dy
> > CONFIG_MEMBARRIER=3Dy
> > CONFIG_KALLSYMS=3Dy
> > CONFIG_KALLSYMS_ALL=3Dy
> > CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> > # CONFIG_USERFAULTFD is not set
> > CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> > CONFIG_KCMP=3Dy
> > CONFIG_RSEQ=3Dy
> > # CONFIG_EMBEDDED is not set
> > CONFIG_HAVE_PERF_EVENTS=3Dy
> > =

> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=3Dy
> > # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> > # end of Kernel Performance Events And Counters
> > =

> > CONFIG_VM_EVENT_COUNTERS=3Dy
> > CONFIG_SLUB_DEBUG=3Dy
> > CONFIG_COMPAT_BRK=3Dy
> > # CONFIG_SLAB is not set
> > CONFIG_SLUB=3Dy
> > # CONFIG_SLAB_MERGE_DEFAULT is not set
> > # CONFIG_SLAB_FREELIST_RANDOM is not set
> > CONFIG_SLAB_FREELIST_HARDENED=3Dy
> > # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> > CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> > CONFIG_PROFILING=3Dy
> > CONFIG_TRACEPOINTS=3Dy
> > # end of General setup
> > =

> > CONFIG_X86_32=3Dy
> > CONFIG_X86=3Dy
> > CONFIG_INSTRUCTION_DECODER=3Dy
> > CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> > CONFIG_LOCKDEP_SUPPORT=3Dy
> > CONFIG_STACKTRACE_SUPPORT=3Dy
> > CONFIG_MMU=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
> > CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> > CONFIG_GENERIC_ISA_DMA=3Dy
> > CONFIG_GENERIC_BUG=3Dy
> > CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> > CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> > CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> > CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> > CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> > CONFIG_ARCH_NR_GPIO=3D512
> > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > CONFIG_FIX_EARLYCON_MEM=3Dy
> > CONFIG_PGTABLE_LEVELS=3D2
> > CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> > =

> > #
> > # Processor type and features
> > #
> > # CONFIG_SMP is not set
> > CONFIG_X86_FEATURE_NAMES=3Dy
> > # CONFIG_GOLDFISH is not set
> > # CONFIG_RETPOLINE is not set
> > CONFIG_X86_CPU_RESCTRL=3Dy
> > # CONFIG_X86_EXTENDED_PLATFORM is not set
> > # CONFIG_X86_INTEL_LPSS is not set
> > # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> > # CONFIG_IOSF_MBI is not set
> > # CONFIG_X86_32_IRIS is not set
> > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > CONFIG_HYPERVISOR_GUEST=3Dy
> > CONFIG_PARAVIRT=3Dy
> > # CONFIG_PARAVIRT_DEBUG is not set
> > CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> > CONFIG_KVM_GUEST=3Dy
> > CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> > # CONFIG_PVH is not set
> > # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> > CONFIG_PARAVIRT_CLOCK=3Dy
> > # CONFIG_M486SX is not set
> > # CONFIG_M486 is not set
> > # CONFIG_M586 is not set
> > # CONFIG_M586TSC is not set
> > CONFIG_M586MMX=3Dy
> > # CONFIG_M686 is not set
> > # CONFIG_MPENTIUMII is not set
> > # CONFIG_MPENTIUMIII is not set
> > # CONFIG_MPENTIUMM is not set
> > # CONFIG_MPENTIUM4 is not set
> > # CONFIG_MK6 is not set
> > # CONFIG_MK7 is not set
> > # CONFIG_MK8 is not set
> > # CONFIG_MCRUSOE is not set
> > # CONFIG_MEFFICEON is not set
> > # CONFIG_MWINCHIPC6 is not set
> > # CONFIG_MWINCHIP3D is not set
> > # CONFIG_MELAN is not set
> > # CONFIG_MGEODEGX1 is not set
> > # CONFIG_MGEODE_LX is not set
> > # CONFIG_MCYRIXIII is not set
> > # CONFIG_MVIAC3_2 is not set
> > # CONFIG_MVIAC7 is not set
> > # CONFIG_MCORE2 is not set
> > # CONFIG_MATOM is not set
> > CONFIG_X86_GENERIC=3Dy
> > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> > CONFIG_X86_L1_CACHE_SHIFT=3D6
> > CONFIG_X86_F00F_BUG=3Dy
> > CONFIG_X86_ALIGNMENT_16=3Dy
> > CONFIG_X86_INTEL_USERCOPY=3Dy
> > CONFIG_X86_TSC=3Dy
> > CONFIG_X86_CMPXCHG64=3Dy
> > CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> > CONFIG_IA32_FEAT_CTL=3Dy
> > CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> > CONFIG_CPU_SUP_INTEL=3Dy
> > CONFIG_CPU_SUP_CYRIX_32=3Dy
> > CONFIG_CPU_SUP_AMD=3Dy
> > CONFIG_CPU_SUP_HYGON=3Dy
> > CONFIG_CPU_SUP_CENTAUR=3Dy
> > CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> > CONFIG_CPU_SUP_ZHAOXIN=3Dy
> > CONFIG_CPU_SUP_VORTEX_32=3Dy
> > CONFIG_HPET_TIMER=3Dy
> > CONFIG_DMI=3Dy
> > CONFIG_NR_CPUS_RANGE_BEGIN=3D1
> > CONFIG_NR_CPUS_RANGE_END=3D1
> > CONFIG_NR_CPUS_DEFAULT=3D1
> > CONFIG_NR_CPUS=3D1
> > # CONFIG_X86_UP_APIC is not set
> > CONFIG_X86_MCE=3Dy
> > CONFIG_X86_MCELOG_LEGACY=3Dy
> > CONFIG_X86_ANCIENT_MCE=3Dy
> > =

> > #
> > # Performance monitoring
> > #
> > CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> > CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> > CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> > # CONFIG_PERF_EVENTS_AMD_POWER is not set
> > # CONFIG_PERF_EVENTS_AMD_UNCORE is not set
> > # end of Performance monitoring
> > =

> > # CONFIG_X86_LEGACY_VM86 is not set
> > CONFIG_X86_16BIT=3Dy
> > CONFIG_X86_ESPFIX32=3Dy
> > CONFIG_X86_IOPL_IOPERM=3Dy
> > CONFIG_TOSHIBA=3Dy
> > # CONFIG_X86_REBOOTFIXUPS is not set
> > # CONFIG_MICROCODE is not set
> > CONFIG_X86_MSR=3Dy
> > # CONFIG_X86_CPUID is not set
> > # CONFIG_NOHIGHMEM is not set
> > CONFIG_HIGHMEM4G=3Dy
> > CONFIG_PAGE_OFFSET=3D0xC0000000
> > CONFIG_HIGHMEM=3Dy
> > CONFIG_X86_CPA_STATISTICS=3Dy
> > CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> > CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> > CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_ILLEGAL_POINTER_VALUE=3D0
> > CONFIG_HIGHPTE=3Dy
> > # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> > CONFIG_MTRR=3Dy
> > CONFIG_MTRR_SANITIZER=3Dy
> > CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> > CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> > CONFIG_X86_PAT=3Dy
> > CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> > CONFIG_ARCH_RANDOM=3Dy
> > CONFIG_X86_SMAP=3Dy
> > CONFIG_X86_UMIP=3Dy
> > # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> > CONFIG_X86_INTEL_TSX_MODE_ON=3Dy
> > # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> > CONFIG_EFI=3Dy
> > # CONFIG_EFI_STUB is not set
> > CONFIG_HZ_100=3Dy
> > # CONFIG_HZ_250 is not set
> > # CONFIG_HZ_300 is not set
> > # CONFIG_HZ_1000 is not set
> > CONFIG_HZ=3D100
> > # CONFIG_KEXEC is not set
> > CONFIG_CRASH_DUMP=3Dy
> > CONFIG_PHYSICAL_START=3D0x1000000
> > CONFIG_RELOCATABLE=3Dy
> > CONFIG_RANDOMIZE_BASE=3Dy
> > CONFIG_X86_NEED_RELOCS=3Dy
> > CONFIG_PHYSICAL_ALIGN=3D0x200000
> > # CONFIG_COMPAT_VDSO is not set
> > # CONFIG_CMDLINE_BOOL is not set
> > CONFIG_MODIFY_LDT_SYSCALL=3Dy
> > CONFIG_STRICT_SIGALTSTACK_SIZE=3Dy
> > # end of Processor type and features
> > =

> > CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> > =

> > #
> > # Power management and ACPI options
> > #
> > # CONFIG_SUSPEND is not set
> > # CONFIG_HIBERNATION is not set
> > CONFIG_PM=3Dy
> > # CONFIG_PM_DEBUG is not set
> > CONFIG_PM_CLK=3Dy
> > # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> > CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> > CONFIG_ACPI=3Dy
> > CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> > CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> > # CONFIG_ACPI_DEBUGGER is not set
> > CONFIG_ACPI_SPCR_TABLE=3Dy
> > # CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
> > # CONFIG_ACPI_EC_DEBUGFS is not set
> > # CONFIG_ACPI_AC is not set
> > # CONFIG_ACPI_BATTERY is not set
> > CONFIG_ACPI_BUTTON=3Dm
> > CONFIG_ACPI_TINY_POWER_BUTTON=3Dm
> > CONFIG_ACPI_TINY_POWER_BUTTON_SIGNAL=3D38
> > CONFIG_ACPI_VIDEO=3Dm
> > CONFIG_ACPI_FAN=3Dy
> > # CONFIG_ACPI_DOCK is not set
> > # CONFIG_ACPI_PROCESSOR is not set
> > CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> > CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> > CONFIG_ACPI_TABLE_UPGRADE=3Dy
> > CONFIG_ACPI_DEBUG=3Dy
> > # CONFIG_ACPI_PCI_SLOT is not set
> > # CONFIG_ACPI_CONTAINER is not set
> > CONFIG_ACPI_SBS=3Dy
> > CONFIG_ACPI_HED=3Dm
> > CONFIG_ACPI_CUSTOM_METHOD=3Dm
> > CONFIG_ACPI_BGRT=3Dy
> > CONFIG_HAVE_ACPI_APEI=3Dy
> > CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> > # CONFIG_ACPI_APEI is not set
> > # CONFIG_ACPI_DPTF is not set
> > CONFIG_ACPI_CONFIGFS=3Dy
> > # CONFIG_PMIC_OPREGION is not set
> > CONFIG_X86_PM_TIMER=3Dy
> > =

> > #
> > # CPU Frequency scaling
> > #
> > CONFIG_CPU_FREQ=3Dy
> > CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> > CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> > # CONFIG_CPU_FREQ_STAT is not set
> > CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> > CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> > CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> > CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> > # CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
> > CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm
> > =

> > #
> > # CPU frequency scaling drivers
> > #
> > CONFIG_CPUFREQ_DT=3Dy
> > CONFIG_CPUFREQ_DT_PLATDEV=3Dy
> > # CONFIG_X86_INTEL_PSTATE is not set
> > # CONFIG_X86_AMD_PSTATE is not set
> > CONFIG_X86_POWERNOW_K6=3Dy
> > # CONFIG_X86_POWERNOW_K7 is not set
> > # CONFIG_X86_GX_SUSPMOD is not set
> > # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> > CONFIG_X86_SPEEDSTEP_ICH=3Dm
> > # CONFIG_X86_SPEEDSTEP_SMI is not set
> > CONFIG_X86_P4_CLOCKMOD=3Dm
> > # CONFIG_X86_CPUFREQ_NFORCE2 is not set
> > # CONFIG_X86_LONGRUN is not set
> > =

> > #
> > # shared options
> > #
> > CONFIG_X86_SPEEDSTEP_LIB=3Dm
> > # CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK is not set
> > # end of CPU Frequency scaling
> > =

> > #
> > # CPU Idle
> > #
> > # CONFIG_CPU_IDLE is not set
> > # end of CPU Idle
> > # end of Power management and ACPI options
> > =

> > #
> > # Bus options (PCI etc.)
> > #
> > # CONFIG_PCI_GOBIOS is not set
> > # CONFIG_PCI_GOMMCONFIG is not set
> > # CONFIG_PCI_GODIRECT is not set
> > # CONFIG_PCI_GOOLPC is not set
> > CONFIG_PCI_GOANY=3Dy
> > CONFIG_PCI_BIOS=3Dy
> > CONFIG_PCI_DIRECT=3Dy
> > CONFIG_PCI_MMCONFIG=3Dy
> > CONFIG_PCI_OLPC=3Dy
> > CONFIG_ISA_DMA_API=3Dy
> > CONFIG_ISA=3Dy
> > CONFIG_SCx200=3Dy
> > CONFIG_SCx200HR_TIMER=3Dy
> > CONFIG_OLPC=3Dy
> > CONFIG_OLPC_XO15_SCI=3Dy
> > # CONFIG_ALIX is not set
> > CONFIG_NET5501=3Dy
> > CONFIG_GEOS=3Dy
> > CONFIG_AMD_NB=3Dy
> > # end of Bus options (PCI etc.)
> > =

> > #
> > # Binary Emulations
> > #
> > CONFIG_COMPAT_32=3Dy
> > # end of Binary Emulations
> > =

> > CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> > CONFIG_HAVE_KVM=3Dy
> > # CONFIG_VIRTUALIZATION is not set
> > CONFIG_AS_AVX512=3Dy
> > CONFIG_AS_SHA1_NI=3Dy
> > CONFIG_AS_SHA256_NI=3Dy
> > CONFIG_AS_TPAUSE=3Dy
> > =

> > #
> > # General architecture-dependent options
> > #
> > CONFIG_GENERIC_ENTRY=3Dy
> > CONFIG_KPROBES=3Dy
> > # CONFIG_JUMP_LABEL is not set
> > # CONFIG_STATIC_CALL_SELFTEST is not set
> > CONFIG_OPTPROBES=3Dy
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> > CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> > CONFIG_KRETPROBES=3Dy
> > CONFIG_HAVE_IOREMAP_PROT=3Dy
> > CONFIG_HAVE_KPROBES=3Dy
> > CONFIG_HAVE_KRETPROBES=3Dy
> > CONFIG_HAVE_OPTPROBES=3Dy
> > CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> > CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=3Dy
> > CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> > CONFIG_HAVE_NMI=3Dy
> > CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> > CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> > CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> > CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> > CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> > CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> > CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> > CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> > CONFIG_ARCH_WANTS_NO_INSTR=3Dy
> > CONFIG_ARCH_32BIT_OFF_T=3Dy
> > CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > CONFIG_HAVE_RSEQ=3Dy
> > CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> > CONFIG_HAVE_PERF_REGS=3Dy
> > CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> > CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> > CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> > CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> > CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> > CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> > CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> > CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> > CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> > CONFIG_HAVE_ARCH_SECCOMP=3Dy
> > CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> > CONFIG_SECCOMP=3Dy
> > CONFIG_SECCOMP_FILTER=3Dy
> > # CONFIG_SECCOMP_CACHE_DEBUG is not set
> > CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> > CONFIG_HAVE_STACKPROTECTOR=3Dy
> > # CONFIG_STACKPROTECTOR is not set
> > CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> > CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> > CONFIG_LTO_NONE=3Dy
> > CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> > CONFIG_HAVE_MOVE_PUD=3Dy
> > CONFIG_HAVE_MOVE_PMD=3Dy
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> > CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> > CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> > CONFIG_MODULES_USE_ELF_REL=3Dy
> > CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> > CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> > CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> > CONFIG_HAVE_EXIT_THREAD=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS=3D8
> > CONFIG_PAGE_SIZE_LESS_THAN_64KB=3Dy
> > CONFIG_PAGE_SIZE_LESS_THAN_256KB=3Dy
> > CONFIG_ISA_BUS_API=3Dy
> > CONFIG_CLONE_BACKWARDS=3Dy
> > CONFIG_OLD_SIGSUSPEND3=3Dy
> > CONFIG_OLD_SIGACTION=3Dy
> > CONFIG_COMPAT_32BIT_TIME=3Dy
> > CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> > # CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
> > CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> > CONFIG_STRICT_KERNEL_RWX=3Dy
> > CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> > CONFIG_STRICT_MODULE_RWX=3Dy
> > CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> > CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> > CONFIG_LOCK_EVENT_COUNTS=3Dy
> > CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> > CONFIG_HAVE_STATIC_CALL=3Dy
> > CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> > CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> > CONFIG_ARCH_SPLIT_ARG64=3Dy
> > CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
> > CONFIG_DYNAMIC_SIGFRAME=3Dy
> > =

> > #
> > # GCOV-based kernel profiling
> > #
> > # CONFIG_GCOV_KERNEL is not set
> > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> > # end of GCOV-based kernel profiling
> > =

> > CONFIG_HAVE_GCC_PLUGINS=3Dy
> > # end of General architecture-dependent options
> > =

> > CONFIG_RT_MUTEXES=3Dy
> > CONFIG_BASE_SMALL=3D0
> > CONFIG_MODULES=3Dy
> > CONFIG_MODULE_FORCE_LOAD=3Dy
> > CONFIG_MODULE_UNLOAD=3Dy
> > # CONFIG_MODULE_FORCE_UNLOAD is not set
> > # CONFIG_MODVERSIONS is not set
> > # CONFIG_MODULE_SRCVERSION_ALL is not set
> > # CONFIG_MODULE_SIG is not set
> > CONFIG_MODULE_COMPRESS_NONE=3Dy
> > # CONFIG_MODULE_COMPRESS_GZIP is not set
> > # CONFIG_MODULE_COMPRESS_XZ is not set
> > # CONFIG_MODULE_COMPRESS_ZSTD is not set
> > # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> > CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> > CONFIG_MODULES_TREE_LOOKUP=3Dy
> > CONFIG_BLOCK=3Dy
> > CONFIG_BLK_DEV_BSG_COMMON=3Dy
> > CONFIG_BLK_DEV_BSGLIB=3Dy
> > CONFIG_BLK_DEV_INTEGRITY=3Dy
> > CONFIG_BLK_DEV_INTEGRITY_T10=3Dy
> > # CONFIG_BLK_DEV_ZONED is not set
> > # CONFIG_BLK_WBT is not set
> > # CONFIG_BLK_DEBUG_FS is not set
> > # CONFIG_BLK_SED_OPAL is not set
> > # CONFIG_BLK_INLINE_ENCRYPTION is not set
> > =

> > #
> > # Partition Types
> > #
> > # CONFIG_PARTITION_ADVANCED is not set
> > CONFIG_MSDOS_PARTITION=3Dy
> > CONFIG_EFI_PARTITION=3Dy
> > # end of Partition Types
> > =

> > CONFIG_BLK_MQ_PCI=3Dy
> > CONFIG_BLK_MQ_VIRTIO=3Dy
> > CONFIG_BLK_PM=3Dy
> > =

> > #
> > # IO Schedulers
> > #
> > CONFIG_MQ_IOSCHED_DEADLINE=3Dm
> > CONFIG_MQ_IOSCHED_KYBER=3Dy
> > # CONFIG_IOSCHED_BFQ is not set
> > # end of IO Schedulers
> > =

> > CONFIG_ASN1=3Dy
> > CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> > CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> > CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> > CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> > CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> > =

> > #
> > # Executable file formats
> > #
> > CONFIG_BINFMT_ELF=3Dy
> > CONFIG_ELFCORE=3Dy
> > CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> > CONFIG_BINFMT_SCRIPT=3Dy
> > CONFIG_BINFMT_MISC=3Dy
> > CONFIG_COREDUMP=3Dy
> > # end of Executable file formats
> > =

> > #
> > # Memory Management options
> > #
> > CONFIG_SELECT_MEMORY_MODEL=3Dy
> > # CONFIG_FLATMEM_MANUAL is not set
> > CONFIG_SPARSEMEM_MANUAL=3Dy
> > CONFIG_SPARSEMEM=3Dy
> > CONFIG_SPARSEMEM_STATIC=3Dy
> > CONFIG_HAVE_FAST_GUP=3Dy
> > CONFIG_MEMORY_ISOLATION=3Dy
> > CONFIG_EXCLUSIVE_SYSTEM_RAM=3Dy
> > CONFIG_SPLIT_PTLOCK_CPUS=3D4
> > CONFIG_MEMORY_BALLOON=3Dy
> > # CONFIG_BALLOON_COMPACTION is not set
> > CONFIG_COMPACTION=3Dy
> > CONFIG_PAGE_REPORTING=3Dy
> > CONFIG_MIGRATION=3Dy
> > CONFIG_CONTIG_ALLOC=3Dy
> > CONFIG_BOUNCE=3Dy
> > CONFIG_VIRT_TO_BUS=3Dy
> > # CONFIG_KSM is not set
> > CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> > CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> > CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> > # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> > CONFIG_NEED_PER_CPU_KM=3Dy
> > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> > CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> > CONFIG_FRONTSWAP=3Dy
> > CONFIG_CMA=3Dy
> > # CONFIG_CMA_DEBUG is not set
> > # CONFIG_CMA_DEBUGFS is not set
> > CONFIG_CMA_SYSFS=3Dy
> > CONFIG_CMA_AREAS=3D7
> > CONFIG_ZSWAP=3Dy
> > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
> > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO is not set
> > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
> > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
> > CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC=3Dy
> > # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
> > CONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"lz4hc"
> > CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=3Dy
> > # CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
> > # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
> > CONFIG_ZSWAP_ZPOOL_DEFAULT=3D"zbud"
> > # CONFIG_ZSWAP_DEFAULT_ON is not set
> > CONFIG_ZPOOL=3Dy
> > CONFIG_ZBUD=3Dy
> > CONFIG_Z3FOLD=3Dm
> > # CONFIG_ZSMALLOC is not set
> > CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> > CONFIG_PAGE_IDLE_FLAG=3Dy
> > CONFIG_IDLE_PAGE_TRACKING=3Dy
> > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> > CONFIG_ZONE_DMA=3Dy
> > # CONFIG_PERCPU_STATS is not set
> > # CONFIG_GUP_TEST is not set
> > CONFIG_READ_ONLY_THP_FOR_FS=3Dy
> > CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> > CONFIG_KMAP_LOCAL=3Dy
> > CONFIG_SECRETMEM=3Dy
> > CONFIG_ANON_VMA_NAME=3Dy
> > =

> > #
> > # Data Access Monitoring
> > #
> > CONFIG_DAMON=3Dy
> > # CONFIG_DAMON_VADDR is not set
> > CONFIG_DAMON_PADDR=3Dy
> > CONFIG_DAMON_RECLAIM=3Dy
> > # end of Data Access Monitoring
> > # end of Memory Management options
> > =

> > CONFIG_NET=3Dy
> > CONFIG_NET_INGRESS=3Dy
> > CONFIG_NET_EGRESS=3Dy
> > =

> > #
> > # Networking options
> > #
> > CONFIG_PACKET=3Dy
> > # CONFIG_PACKET_DIAG is not set
> > CONFIG_UNIX=3Dy
> > CONFIG_UNIX_SCM=3Dy
> > CONFIG_AF_UNIX_OOB=3Dy
> > # CONFIG_UNIX_DIAG is not set
> > # CONFIG_TLS is not set
> > # CONFIG_XFRM_USER is not set
> > # CONFIG_NET_KEY is not set
> > CONFIG_XDP_SOCKETS=3Dy
> > CONFIG_XDP_SOCKETS_DIAG=3Dy
> > CONFIG_INET=3Dy
> > # CONFIG_IP_MULTICAST is not set
> > # CONFIG_IP_ADVANCED_ROUTER is not set
> > CONFIG_IP_PNP=3Dy
> > CONFIG_IP_PNP_DHCP=3Dy
> > # CONFIG_IP_PNP_BOOTP is not set
> > # CONFIG_IP_PNP_RARP is not set
> > # CONFIG_NET_IPIP is not set
> > # CONFIG_NET_IPGRE_DEMUX is not set
> > CONFIG_NET_IP_TUNNEL=3Dy
> > # CONFIG_SYN_COOKIES is not set
> > # CONFIG_NET_IPVTI is not set
> > # CONFIG_NET_FOU is not set
> > # CONFIG_NET_FOU_IP_TUNNELS is not set
> > # CONFIG_INET_AH is not set
> > # CONFIG_INET_ESP is not set
> > # CONFIG_INET_IPCOMP is not set
> > CONFIG_INET_TUNNEL=3Dy
> > CONFIG_INET_DIAG=3Dy
> > CONFIG_INET_TCP_DIAG=3Dy
> > # CONFIG_INET_UDP_DIAG is not set
> > # CONFIG_INET_RAW_DIAG is not set
> > # CONFIG_INET_DIAG_DESTROY is not set
> > # CONFIG_TCP_CONG_ADVANCED is not set
> > CONFIG_TCP_CONG_CUBIC=3Dy
> > CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> > # CONFIG_TCP_MD5SIG is not set
> > CONFIG_IPV6=3Dy
> > # CONFIG_IPV6_ROUTER_PREF is not set
> > # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> > # CONFIG_INET6_AH is not set
> > # CONFIG_INET6_ESP is not set
> > # CONFIG_INET6_IPCOMP is not set
> > # CONFIG_IPV6_MIP6 is not set
> > # CONFIG_IPV6_ILA is not set
> > # CONFIG_IPV6_VTI is not set
> > CONFIG_IPV6_SIT=3Dy
> > # CONFIG_IPV6_SIT_6RD is not set
> > CONFIG_IPV6_NDISC_NODETYPE=3Dy
> > # CONFIG_IPV6_TUNNEL is not set
> > # CONFIG_IPV6_MULTIPLE_TABLES is not set
> > # CONFIG_IPV6_MROUTE is not set
> > # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> > # CONFIG_IPV6_SEG6_HMAC is not set
> > # CONFIG_IPV6_RPL_LWTUNNEL is not set
> > # CONFIG_IPV6_IOAM6_LWTUNNEL is not set
> > # CONFIG_NETLABEL is not set
> > # CONFIG_MPTCP is not set
> > # CONFIG_NETWORK_SECMARK is not set
> > CONFIG_NET_PTP_CLASSIFY=3Dy
> > CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> > CONFIG_NETFILTER=3Dy
> > CONFIG_NETFILTER_ADVANCED=3Dy
> > =

> > #
> > # Core Netfilter Configuration
> > #
> > CONFIG_NETFILTER_INGRESS=3Dy
> > CONFIG_NETFILTER_EGRESS=3Dy
> > # CONFIG_NETFILTER_NETLINK_ACCT is not set
> > # CONFIG_NETFILTER_NETLINK_QUEUE is not set
> > # CONFIG_NETFILTER_NETLINK_LOG is not set
> > # CONFIG_NETFILTER_NETLINK_OSF is not set
> > # CONFIG_NF_CONNTRACK is not set
> > # CONFIG_NF_LOG_SYSLOG is not set
> > # CONFIG_NF_TABLES is not set
> > # CONFIG_NETFILTER_XTABLES is not set
> > # end of Core Netfilter Configuration
> > =

> > # CONFIG_IP_SET is not set
> > # CONFIG_IP_VS is not set
> > =

> > #
> > # IP: Netfilter Configuration
> > #
> > # CONFIG_NF_SOCKET_IPV4 is not set
> > # CONFIG_NF_TPROXY_IPV4 is not set
> > # CONFIG_NF_DUP_IPV4 is not set
> > # CONFIG_NF_LOG_ARP is not set
> > # CONFIG_NF_LOG_IPV4 is not set
> > # CONFIG_NF_REJECT_IPV4 is not set
> > # CONFIG_IP_NF_IPTABLES is not set
> > # CONFIG_IP_NF_ARPTABLES is not set
> > # end of IP: Netfilter Configuration
> > =

> > #
> > # IPv6: Netfilter Configuration
> > #
> > # CONFIG_NF_SOCKET_IPV6 is not set
> > # CONFIG_NF_TPROXY_IPV6 is not set
> > # CONFIG_NF_DUP_IPV6 is not set
> > # CONFIG_NF_REJECT_IPV6 is not set
> > # CONFIG_NF_LOG_IPV6 is not set
> > # CONFIG_IP6_NF_IPTABLES is not set
> > # end of IPv6: Netfilter Configuration
> > =

> > #
> > # DECnet: Netfilter Configuration
> > #
> > CONFIG_DECNET_NF_GRABULATOR=3Dm
> > # end of DECnet: Netfilter Configuration
> > =

> > # CONFIG_BPFILTER is not set
> > # CONFIG_IP_DCCP is not set
> > # CONFIG_IP_SCTP is not set
> > # CONFIG_RDS is not set
> > # CONFIG_TIPC is not set
> > CONFIG_ATM=3Dy
> > # CONFIG_ATM_CLIP is not set
> > CONFIG_ATM_LANE=3Dy
> > # CONFIG_ATM_MPOA is not set
> > # CONFIG_ATM_BR2684 is not set
> > # CONFIG_L2TP is not set
> > # CONFIG_BRIDGE is not set
> > # CONFIG_NET_DSA is not set
> > # CONFIG_VLAN_8021Q is not set
> > CONFIG_DECNET=3Dm
> > CONFIG_DECNET_ROUTER=3Dy
> > CONFIG_LLC=3Dy
> > CONFIG_LLC2=3Dy
> > CONFIG_ATALK=3Dm
> > CONFIG_DEV_APPLETALK=3Dm
> > CONFIG_LTPC=3Dm
> > # CONFIG_COPS is not set
> > # CONFIG_IPDDP is not set
> > CONFIG_X25=3Dm
> > CONFIG_LAPB=3Dy
> > # CONFIG_PHONET is not set
> > # CONFIG_6LOWPAN is not set
> > CONFIG_IEEE802154=3Dm
> > CONFIG_IEEE802154_NL802154_EXPERIMENTAL=3Dy
> > CONFIG_IEEE802154_SOCKET=3Dm
> > CONFIG_MAC802154=3Dm
> > CONFIG_NET_SCHED=3Dy
> > =

> > #
> > # Queueing/Scheduling
> > #
> > CONFIG_NET_SCH_CBQ=3Dm
> > # CONFIG_NET_SCH_HTB is not set
> > CONFIG_NET_SCH_HFSC=3Dm
> > CONFIG_NET_SCH_ATM=3Dy
> > # CONFIG_NET_SCH_PRIO is not set
> > CONFIG_NET_SCH_MULTIQ=3Dy
> > CONFIG_NET_SCH_RED=3Dy
> > CONFIG_NET_SCH_SFB=3Dm
> > # CONFIG_NET_SCH_SFQ is not set
> > # CONFIG_NET_SCH_TEQL is not set
> > CONFIG_NET_SCH_TBF=3Dy
> > # CONFIG_NET_SCH_CBS is not set
> > # CONFIG_NET_SCH_ETF is not set
> > # CONFIG_NET_SCH_TAPRIO is not set
> > # CONFIG_NET_SCH_GRED is not set
> > CONFIG_NET_SCH_DSMARK=3Dy
> > CONFIG_NET_SCH_NETEM=3Dy
> > # CONFIG_NET_SCH_DRR is not set
> > CONFIG_NET_SCH_MQPRIO=3Dy
> > # CONFIG_NET_SCH_SKBPRIO is not set
> > CONFIG_NET_SCH_CHOKE=3Dm
> > # CONFIG_NET_SCH_QFQ is not set
> > # CONFIG_NET_SCH_CODEL is not set
> > CONFIG_NET_SCH_FQ_CODEL=3Dy
> > CONFIG_NET_SCH_CAKE=3Dm
> > CONFIG_NET_SCH_FQ=3Dy
> > # CONFIG_NET_SCH_HHF is not set
> > CONFIG_NET_SCH_PIE=3Dm
> > # CONFIG_NET_SCH_FQ_PIE is not set
> > # CONFIG_NET_SCH_PLUG is not set
> > # CONFIG_NET_SCH_ETS is not set
> > # CONFIG_NET_SCH_DEFAULT is not set
> > =

> > #
> > # Classification
> > #
> > CONFIG_NET_CLS=3Dy
> > CONFIG_NET_CLS_BASIC=3Dm
> > CONFIG_NET_CLS_TCINDEX=3Dy
> > # CONFIG_NET_CLS_ROUTE4 is not set
> > # CONFIG_NET_CLS_FW is not set
> > CONFIG_NET_CLS_U32=3Dy
> > # CONFIG_CLS_U32_PERF is not set
> > # CONFIG_CLS_U32_MARK is not set
> > CONFIG_NET_CLS_RSVP=3Dm
> > CONFIG_NET_CLS_RSVP6=3Dy
> > CONFIG_NET_CLS_FLOW=3Dm
> > # CONFIG_NET_CLS_CGROUP is not set
> > # CONFIG_NET_CLS_BPF is not set
> > # CONFIG_NET_CLS_FLOWER is not set
> > CONFIG_NET_CLS_MATCHALL=3Dm
> > CONFIG_NET_EMATCH=3Dy
> > CONFIG_NET_EMATCH_STACK=3D32
> > CONFIG_NET_EMATCH_CMP=3Dm
> > # CONFIG_NET_EMATCH_NBYTE is not set
> > # CONFIG_NET_EMATCH_U32 is not set
> > CONFIG_NET_EMATCH_META=3Dy
> > CONFIG_NET_EMATCH_TEXT=3Dm
> > CONFIG_NET_EMATCH_CANID=3Dy
> > # CONFIG_NET_CLS_ACT is not set
> > CONFIG_NET_SCH_FIFO=3Dy
> > # CONFIG_DCB is not set
> > CONFIG_DNS_RESOLVER=3Dm
> > # CONFIG_BATMAN_ADV is not set
> > # CONFIG_OPENVSWITCH is not set
> > CONFIG_VSOCKETS=3Dy
> > # CONFIG_VSOCKETS_DIAG is not set
> > CONFIG_VSOCKETS_LOOPBACK=3Dy
> > CONFIG_VIRTIO_VSOCKETS=3Dy
> > CONFIG_VIRTIO_VSOCKETS_COMMON=3Dy
> > # CONFIG_NETLINK_DIAG is not set
> > CONFIG_MPLS=3Dy
> > # CONFIG_NET_MPLS_GSO is not set
> > CONFIG_MPLS_ROUTING=3Dy
> > CONFIG_NET_NSH=3Dy
> > # CONFIG_HSR is not set
> > # CONFIG_NET_SWITCHDEV is not set
> > # CONFIG_NET_L3_MASTER_DEV is not set
> > CONFIG_QRTR=3Dy
> > CONFIG_QRTR_SMD=3Dm
> > CONFIG_QRTR_TUN=3Dm
> > # CONFIG_NET_NCSI is not set
> > # CONFIG_CGROUP_NET_PRIO is not set
> > # CONFIG_CGROUP_NET_CLASSID is not set
> > CONFIG_NET_RX_BUSY_POLL=3Dy
> > CONFIG_BQL=3Dy
> > =

> > #
> > # Network testing
> > #
> > # CONFIG_NET_PKTGEN is not set
> > # CONFIG_NET_DROP_MONITOR is not set
> > # end of Network testing
> > # end of Networking options
> > =

> > # CONFIG_HAMRADIO is not set
> > CONFIG_CAN=3Dy
> > CONFIG_CAN_RAW=3Dy
> > CONFIG_CAN_BCM=3Dy
> > CONFIG_CAN_GW=3Dy
> > CONFIG_CAN_J1939=3Dm
> > CONFIG_CAN_ISOTP=3Dm
> > =

> > #
> > # CAN Device Drivers
> > #
> > CONFIG_CAN_VCAN=3Dm
> > CONFIG_CAN_VXCAN=3Dm
> > CONFIG_CAN_SLCAN=3Dm
> > # CONFIG_CAN_DEV is not set
> > # CONFIG_CAN_DEBUG_DEVICES is not set
> > # end of CAN Device Drivers
> > =

> > # CONFIG_BT is not set
> > # CONFIG_AF_RXRPC is not set
> > # CONFIG_AF_KCM is not set
> > # CONFIG_MCTP is not set
> > CONFIG_FIB_RULES=3Dy
> > CONFIG_WIRELESS=3Dy
> > CONFIG_WEXT_CORE=3Dy
> > CONFIG_WEXT_PROC=3Dy
> > CONFIG_CFG80211=3Dy
> > # CONFIG_NL80211_TESTMODE is not set
> > # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> > CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> > CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
> > CONFIG_CFG80211_DEFAULT_PS=3Dy
> > CONFIG_CFG80211_DEBUGFS=3Dy
> > CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> > CONFIG_CFG80211_WEXT=3Dy
> > CONFIG_MAC80211=3Dy
> > CONFIG_MAC80211_HAS_RC=3Dy
> > CONFIG_MAC80211_RC_MINSTREL=3Dy
> > CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
> > CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
> > CONFIG_MAC80211_MESH=3Dy
> > CONFIG_MAC80211_LEDS=3Dy
> > # CONFIG_MAC80211_DEBUGFS is not set
> > CONFIG_MAC80211_MESSAGE_TRACING=3Dy
> > # CONFIG_MAC80211_DEBUG_MENU is not set
> > CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> > CONFIG_RFKILL=3Dy
> > CONFIG_RFKILL_LEDS=3Dy
> > CONFIG_RFKILL_INPUT=3Dy
> > CONFIG_RFKILL_GPIO=3Dy
> > CONFIG_NET_9P=3Dy
> > CONFIG_NET_9P_FD=3Dy
> > CONFIG_NET_9P_VIRTIO=3Dy
> > # CONFIG_NET_9P_DEBUG is not set
> > # CONFIG_CAIF is not set
> > # CONFIG_CEPH_LIB is not set
> > # CONFIG_NFC is not set
> > # CONFIG_PSAMPLE is not set
> > # CONFIG_NET_IFE is not set
> > # CONFIG_LWTUNNEL is not set
> > CONFIG_DST_CACHE=3Dy
> > CONFIG_GRO_CELLS=3Dy
> > CONFIG_NET_SOCK_MSG=3Dy
> > CONFIG_FAILOVER=3Dm
> > CONFIG_ETHTOOL_NETLINK=3Dy
> > =

> > #
> > # Device Drivers
> > #
> > CONFIG_HAVE_EISA=3Dy
> > # CONFIG_EISA is not set
> > CONFIG_HAVE_PCI=3Dy
> > CONFIG_PCI=3Dy
> > CONFIG_PCI_DOMAINS=3Dy
> > # CONFIG_PCIEPORTBUS is not set
> > CONFIG_PCIEASPM=3Dy
> > CONFIG_PCIEASPM_DEFAULT=3Dy
> > # CONFIG_PCIEASPM_POWERSAVE is not set
> > # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> > # CONFIG_PCIEASPM_PERFORMANCE is not set
> > # CONFIG_PCIE_PTM is not set
> > # CONFIG_PCI_MSI is not set
> > CONFIG_PCI_QUIRKS=3Dy
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_STUB is not set
> > CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> > # CONFIG_PCI_IOV is not set
> > # CONFIG_PCI_PRI is not set
> > # CONFIG_PCI_PASID is not set
> > CONFIG_PCI_LABEL=3Dy
> > # CONFIG_HOTPLUG_PCI is not set
> > =

> > #
> > # PCI controller drivers
> > #
> > # CONFIG_PCI_FTPCI100 is not set
> > # CONFIG_PCI_HOST_GENERIC is not set
> > =

> > #
> > # DesignWare PCI Core Support
> > #
> > # end of DesignWare PCI Core Support
> > =

> > #
> > # Mobiveil PCIe Core Support
> > #
> > # end of Mobiveil PCIe Core Support
> > =

> > #
> > # Cadence PCIe controllers support
> > #
> > # CONFIG_PCIE_CADENCE_PLAT_HOST is not set
> > # CONFIG_PCI_J721E_HOST is not set
> > # end of Cadence PCIe controllers support
> > # end of PCI controller drivers
> > =

> > #
> > # PCI Endpoint
> > #
> > # CONFIG_PCI_ENDPOINT is not set
> > # end of PCI Endpoint
> > =

> > #
> > # PCI switch controller drivers
> > #
> > # CONFIG_PCI_SW_SWITCHTEC is not set
> > # end of PCI switch controller drivers
> > =

> > # CONFIG_CXL_BUS is not set
> > # CONFIG_PCCARD is not set
> > # CONFIG_RAPIDIO is not set
> > =

> > #
> > # Generic Driver Options
> > #
> > # CONFIG_UEVENT_HELPER is not set
> > CONFIG_DEVTMPFS=3Dy
> > # CONFIG_DEVTMPFS_MOUNT is not set
> > # CONFIG_DEVTMPFS_SAFE is not set
> > # CONFIG_STANDALONE is not set
> > CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> > =

> > #
> > # Firmware loader
> > #
> > CONFIG_FW_LOADER=3Dy
> > CONFIG_FW_LOADER_PAGED_BUF=3Dy
> > CONFIG_EXTRA_FIRMWARE=3D""
> > CONFIG_FW_LOADER_USER_HELPER=3Dy
> > CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> > CONFIG_FW_LOADER_COMPRESS=3Dy
> > # end of Firmware loader
> > =

> > CONFIG_WANT_DEV_COREDUMP=3Dy
> > CONFIG_ALLOW_DEV_COREDUMP=3Dy
> > CONFIG_DEV_COREDUMP=3Dy
> > # CONFIG_DEBUG_DRIVER is not set
> > # CONFIG_DEBUG_DEVRES is not set
> > # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> > # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> > CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> > CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> > CONFIG_REGMAP=3Dy
> > CONFIG_REGMAP_I2C=3Dy
> > CONFIG_REGMAP_SPI=3Dy
> > CONFIG_REGMAP_SPMI=3Dy
> > CONFIG_REGMAP_W1=3Dm
> > CONFIG_REGMAP_MMIO=3Dy
> > CONFIG_REGMAP_IRQ=3Dy
> > CONFIG_REGMAP_SOUNDWIRE=3Dm
> > CONFIG_REGMAP_SOUNDWIRE_MBQ=3Dm
> > CONFIG_REGMAP_SCCB=3Dm
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > # CONFIG_DMA_FENCE_TRACE is not set
> > # end of Generic Driver Options
> > =

> > #
> > # Bus devices
> > #
> > CONFIG_MOXTET=3Dy
> > # CONFIG_MHI_BUS is not set
> > # end of Bus devices
> > =

> > # CONFIG_CONNECTOR is not set
> > =

> > #
> > # Firmware Drivers
> > #
> > =

> > #
> > # ARM System Control and Management Interface Protocol
> > #
> > # end of ARM System Control and Management Interface Protocol
> > =

> > CONFIG_EDD=3Dy
> > # CONFIG_EDD_OFF is not set
> > CONFIG_FIRMWARE_MEMMAP=3Dy
> > # CONFIG_DMIID is not set
> > CONFIG_DMI_SYSFS=3Dm
> > CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> > CONFIG_FW_CFG_SYSFS=3Dm
> > # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
> > CONFIG_SYSFB=3Dy
> > CONFIG_SYSFB_SIMPLEFB=3Dy
> > CONFIG_CS_DSP=3Dm
> > CONFIG_GOOGLE_FIRMWARE=3Dy
> > CONFIG_GOOGLE_SMI=3Dm
> > CONFIG_GOOGLE_COREBOOT_TABLE=3Dy
> > CONFIG_GOOGLE_MEMCONSOLE=3Dm
> > CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY=3Dm
> > # CONFIG_GOOGLE_MEMCONSOLE_COREBOOT is not set
> > CONFIG_GOOGLE_VPD=3Dy
> > =

> > #
> > # EFI (Extensible Firmware Interface) Support
> > #
> > CONFIG_EFI_VARS=3Dm
> > CONFIG_EFI_ESRT=3Dy
> > CONFIG_EFI_FAKE_MEMMAP=3Dy
> > CONFIG_EFI_MAX_FAKE_MEM=3D8
> > CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> > CONFIG_EFI_BOOTLOADER_CONTROL=3Dm
> > CONFIG_EFI_CAPSULE_LOADER=3Dm
> > # CONFIG_EFI_CAPSULE_QUIRK_QUARK_CSH is not set
> > # CONFIG_EFI_TEST is not set
> > # CONFIG_EFI_RCI2_TABLE is not set
> > # CONFIG_EFI_DISABLE_PCI_DMA is not set
> > # end of EFI (Extensible Firmware Interface) Support
> > =

> > CONFIG_EFI_EARLYCON=3Dy
> > # CONFIG_EFI_CUSTOM_SSDT_OVERLAYS is not set
> > =

> > #
> > # Tegra firmware driver
> > #
> > # end of Tegra firmware driver
> > # end of Firmware Drivers
> > =

> > CONFIG_GNSS=3Dy
> > CONFIG_GNSS_SERIAL=3Dy
> > CONFIG_GNSS_MTK_SERIAL=3Dm
> > # CONFIG_GNSS_SIRF_SERIAL is not set
> > CONFIG_GNSS_UBX_SERIAL=3Dy
> > CONFIG_GNSS_USB=3Dm
> > CONFIG_MTD=3Dy
> > # CONFIG_MTD_TESTS is not set
> > =

> > #
> > # Partition parsers
> > #
> > CONFIG_MTD_AR7_PARTS=3Dy
> > CONFIG_MTD_CMDLINE_PARTS=3Dm
> > # CONFIG_MTD_OF_PARTS is not set
> > CONFIG_MTD_REDBOOT_PARTS=3Dy
> > CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> > # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> > # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> > # end of Partition parsers
> > =

> > #
> > # User Modules And Translation Layers
> > #
> > CONFIG_MTD_BLKDEVS=3Dy
> > CONFIG_MTD_BLOCK=3Dy
> > =

> > #
> > # Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
> > #
> > # CONFIG_FTL is not set
> > CONFIG_NFTL=3Dy
> > CONFIG_NFTL_RW=3Dy
> > # CONFIG_INFTL is not set
> > CONFIG_RFD_FTL=3Dy
> > CONFIG_SSFDC=3Dm
> > CONFIG_SM_FTL=3Dy
> > CONFIG_MTD_OOPS=3Dy
> > CONFIG_MTD_SWAP=3Dm
> > # CONFIG_MTD_PARTITIONED_MASTER is not set
> > =

> > #
> > # RAM/ROM/Flash chip drivers
> > #
> > CONFIG_MTD_CFI=3Dy
> > # CONFIG_MTD_JEDECPROBE is not set
> > CONFIG_MTD_GEN_PROBE=3Dy
> > CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> > CONFIG_MTD_CFI_NOSWAP=3Dy
> > # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> > # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> > # CONFIG_MTD_CFI_GEOMETRY is not set
> > CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> > CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> > CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> > CONFIG_MTD_CFI_I1=3Dy
> > CONFIG_MTD_CFI_I2=3Dy
> > CONFIG_MTD_OTP=3Dy
> > CONFIG_MTD_CFI_INTELEXT=3Dm
> > CONFIG_MTD_CFI_AMDSTD=3Dy
> > CONFIG_MTD_CFI_STAA=3Dm
> > CONFIG_MTD_CFI_UTIL=3Dy
> > CONFIG_MTD_RAM=3Dy
> > CONFIG_MTD_ROM=3Dy
> > CONFIG_MTD_ABSENT=3Dy
> > # end of RAM/ROM/Flash chip drivers
> > =

> > #
> > # Mapping drivers for chip access
> > #
> > CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> > # CONFIG_MTD_PHYSMAP is not set
> > # CONFIG_MTD_SBC_GXX is not set
> > # CONFIG_MTD_SCx200_DOCFLASH is not set
> > # CONFIG_MTD_PCI is not set
> > # CONFIG_MTD_INTEL_VR_NOR is not set
> > CONFIG_MTD_PLATRAM=3Dm
> > # end of Mapping drivers for chip access
> > =

> > #
> > # Self-contained MTD device drivers
> > #
> > # CONFIG_MTD_PMC551 is not set
> > CONFIG_MTD_DATAFLASH=3Dm
> > # CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
> > # CONFIG_MTD_DATAFLASH_OTP is not set
> > # CONFIG_MTD_MCHP23K256 is not set
> > CONFIG_MTD_MCHP48L640=3Dm
> > # CONFIG_MTD_SST25L is not set
> > # CONFIG_MTD_SLRAM is not set
> > CONFIG_MTD_PHRAM=3Dy
> > # CONFIG_MTD_MTDRAM is not set
> > CONFIG_MTD_BLOCK2MTD=3Dy
> > =

> > #
> > # Disk-On-Chip Device Drivers
> > #
> > CONFIG_MTD_DOCG3=3Dy
> > CONFIG_BCH_CONST_M=3D14
> > CONFIG_BCH_CONST_T=3D4
> > # end of Self-contained MTD device drivers
> > =

> > #
> > # NAND
> > #
> > CONFIG_MTD_NAND_CORE=3Dy
> > CONFIG_MTD_ONENAND=3Dy
> > CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> > # CONFIG_MTD_ONENAND_GENERIC is not set
> > # CONFIG_MTD_ONENAND_OTP is not set
> > CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> > CONFIG_MTD_RAW_NAND=3Dm
> > =

> > #
> > # Raw/parallel NAND flash controllers
> > #
> > CONFIG_MTD_NAND_DENALI=3Dm
> > # CONFIG_MTD_NAND_DENALI_PCI is not set
> > CONFIG_MTD_NAND_DENALI_DT=3Dm
> > # CONFIG_MTD_NAND_CAFE is not set
> > CONFIG_MTD_NAND_CS553X=3Dm
> > # CONFIG_MTD_NAND_MXIC is not set
> > CONFIG_MTD_NAND_GPIO=3Dm
> > CONFIG_MTD_NAND_PLATFORM=3Dm
> > CONFIG_MTD_NAND_CADENCE=3Dm
> > # CONFIG_MTD_NAND_ARASAN is not set
> > # CONFIG_MTD_NAND_INTEL_LGM is not set
> > =

> > #
> > # Misc
> > #
> > # CONFIG_MTD_NAND_NANDSIM is not set
> > # CONFIG_MTD_NAND_RICOH is not set
> > CONFIG_MTD_NAND_DISKONCHIP=3Dm
> > CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> > CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> > # CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
> > CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> > # CONFIG_MTD_SPI_NAND is not set
> > =

> > #
> > # ECC engine support
> > #
> > CONFIG_MTD_NAND_ECC=3Dy
> > CONFIG_MTD_NAND_ECC_SW_HAMMING=3Dy
> > # CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
> > CONFIG_MTD_NAND_ECC_SW_BCH=3Dy
> > # end of ECC engine support
> > # end of NAND
> > =

> > #
> > # LPDDR & LPDDR2 PCM memory drivers
> > #
> > CONFIG_MTD_LPDDR=3Dy
> > CONFIG_MTD_QINFO_PROBE=3Dy
> > # end of LPDDR & LPDDR2 PCM memory drivers
> > =

> > CONFIG_MTD_SPI_NOR=3Dm
> > CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> > # CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
> > # CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is not set
> > CONFIG_MTD_SPI_NOR_SWP_KEEP=3Dy
> > CONFIG_SPI_INTEL_SPI=3Dm
> > # CONFIG_SPI_INTEL_SPI_PCI is not set
> > CONFIG_SPI_INTEL_SPI_PLATFORM=3Dm
> > CONFIG_MTD_UBI=3Dm
> > CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> > CONFIG_MTD_UBI_BEB_LIMIT=3D20
> > CONFIG_MTD_UBI_FASTMAP=3Dy
> > CONFIG_MTD_UBI_GLUEBI=3Dm
> > # CONFIG_MTD_UBI_BLOCK is not set
> > CONFIG_MTD_HYPERBUS=3Dy
> > CONFIG_DTC=3Dy
> > CONFIG_OF=3Dy
> > # CONFIG_OF_UNITTEST is not set
> > CONFIG_OF_FLATTREE=3Dy
> > CONFIG_OF_EARLY_FLATTREE=3Dy
> > CONFIG_OF_PROMTREE=3Dy
> > CONFIG_OF_KOBJ=3Dy
> > CONFIG_OF_ADDRESS=3Dy
> > CONFIG_OF_IRQ=3Dy
> > CONFIG_OF_RESERVED_MEM=3Dy
> > # CONFIG_OF_OVERLAY is not set
> > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> > # CONFIG_PARPORT is not set
> > CONFIG_PNP=3Dy
> > CONFIG_PNP_DEBUG_MESSAGES=3Dy
> > =

> > #
> > # Protocols
> > #
> > # CONFIG_ISAPNP is not set
> > # CONFIG_PNPBIOS is not set
> > CONFIG_PNPACPI=3Dy
> > CONFIG_BLK_DEV=3Dy
> > CONFIG_BLK_DEV_NULL_BLK=3Dm
> > # CONFIG_BLK_DEV_FD is not set
> > CONFIG_CDROM=3Dm
> > # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> > CONFIG_BLK_DEV_LOOP=3Dm
> > CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> > # CONFIG_BLK_DEV_DRBD is not set
> > CONFIG_BLK_DEV_NBD=3Dy
> > # CONFIG_BLK_DEV_SX8 is not set
> > # CONFIG_BLK_DEV_RAM is not set
> > CONFIG_CDROM_PKTCDVD=3Dm
> > CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> > CONFIG_CDROM_PKTCDVD_WCACHE=3Dy
> > # CONFIG_ATA_OVER_ETH is not set
> > CONFIG_VIRTIO_BLK=3Dm
> > # CONFIG_BLK_DEV_RBD is not set
> > =

> > #
> > # NVME Support
> > #
> > CONFIG_NVME_CORE=3Dy
> > # CONFIG_BLK_DEV_NVME is not set
> > CONFIG_NVME_MULTIPATH=3Dy
> > CONFIG_NVME_FABRICS=3Dy
> > CONFIG_NVME_FC=3Dy
> > # CONFIG_NVME_TCP is not set
> > CONFIG_NVME_TARGET=3Dm
> > # CONFIG_NVME_TARGET_PASSTHRU is not set
> > # CONFIG_NVME_TARGET_LOOP is not set
> > CONFIG_NVME_TARGET_FC=3Dm
> > CONFIG_NVME_TARGET_FCLOOP=3Dm
> > # CONFIG_NVME_TARGET_TCP is not set
> > # end of NVME Support
> > =

> > #
> > # Misc devices
> > #
> > CONFIG_SENSORS_LIS3LV02D=3Dy
> > CONFIG_AD525X_DPOT=3Dm
> > CONFIG_AD525X_DPOT_I2C=3Dm
> > CONFIG_AD525X_DPOT_SPI=3Dm
> > CONFIG_DUMMY_IRQ=3Dm
> > # CONFIG_IBM_ASM is not set
> > # CONFIG_PHANTOM is not set
> > # CONFIG_TIFM_CORE is not set
> > CONFIG_ICS932S401=3Dy
> > CONFIG_ENCLOSURE_SERVICES=3Dm
> > CONFIG_HI6421V600_IRQ=3Dy
> > # CONFIG_HP_ILO is not set
> > # CONFIG_APDS9802ALS is not set
> > CONFIG_ISL29003=3Dy
> > CONFIG_ISL29020=3Dm
> > CONFIG_SENSORS_TSL2550=3Dm
> > # CONFIG_SENSORS_BH1770 is not set
> > CONFIG_SENSORS_APDS990X=3Dy
> > CONFIG_HMC6352=3Dy
> > CONFIG_DS1682=3Dm
> > # CONFIG_PCH_PHUB is not set
> > CONFIG_LATTICE_ECP3_CONFIG=3Dm
> > CONFIG_SRAM=3Dy
> > # CONFIG_DW_XDATA_PCIE is not set
> > # CONFIG_PCI_ENDPOINT_TEST is not set
> > CONFIG_XILINX_SDFEC=3Dy
> > CONFIG_HISI_HIKEY_USB=3Dm
> > # CONFIG_C2PORT is not set
> > =

> > #
> > # EEPROM support
> > #
> > CONFIG_EEPROM_AT24=3Dm
> > # CONFIG_EEPROM_AT25 is not set
> > CONFIG_EEPROM_LEGACY=3Dy
> > CONFIG_EEPROM_MAX6875=3Dy
> > CONFIG_EEPROM_93CX6=3Dy
> > CONFIG_EEPROM_93XX46=3Dm
> > CONFIG_EEPROM_IDT_89HPESX=3Dy
> > CONFIG_EEPROM_EE1004=3Dy
> > # end of EEPROM support
> > =

> > # CONFIG_CB710_CORE is not set
> > =

> > #
> > # Texas Instruments shared transport line discipline
> > #
> > # CONFIG_TI_ST is not set
> > # end of Texas Instruments shared transport line discipline
> > =

> > CONFIG_SENSORS_LIS3_I2C=3Dy
> > # CONFIG_ALTERA_STAPL is not set
> > # CONFIG_INTEL_MEI is not set
> > # CONFIG_INTEL_MEI_ME is not set
> > # CONFIG_INTEL_MEI_TXE is not set
> > # CONFIG_VMWARE_VMCI is not set
> > CONFIG_ECHO=3Dy
> > # CONFIG_MISC_ALCOR_PCI is not set
> > # CONFIG_MISC_RTSX_PCI is not set
> > # CONFIG_MISC_RTSX_USB is not set
> > # CONFIG_HABANA_AI is not set
> > # CONFIG_PVPANIC is not set
> > # end of Misc devices
> > =

> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=3Dy
> > CONFIG_RAID_ATTRS=3Dy
> > CONFIG_SCSI_COMMON=3Dy
> > CONFIG_SCSI=3Dy
> > CONFIG_SCSI_DMA=3Dy
> > CONFIG_SCSI_NETLINK=3Dy
> > CONFIG_SCSI_PROC_FS=3Dy
> > =

> > #
> > # SCSI support type (disk, tape, CD-ROM)
> > #
> > # CONFIG_BLK_DEV_SD is not set
> > CONFIG_CHR_DEV_ST=3Dy
> > CONFIG_BLK_DEV_SR=3Dm
> > CONFIG_CHR_DEV_SG=3Dy
> > # CONFIG_BLK_DEV_BSG is not set
> > # CONFIG_CHR_DEV_SCH is not set
> > # CONFIG_SCSI_ENCLOSURE is not set
> > # CONFIG_SCSI_CONSTANTS is not set
> > # CONFIG_SCSI_LOGGING is not set
> > # CONFIG_SCSI_SCAN_ASYNC is not set
> > =

> > #
> > # SCSI Transports
> > #
> > CONFIG_SCSI_SPI_ATTRS=3Dm
> > CONFIG_SCSI_FC_ATTRS=3Dm
> > # CONFIG_SCSI_ISCSI_ATTRS is not set
> > CONFIG_SCSI_SAS_ATTRS=3Dm
> > # CONFIG_SCSI_SAS_LIBSAS is not set
> > # CONFIG_SCSI_SRP_ATTRS is not set
> > # end of SCSI Transports
> > =

> > # CONFIG_SCSI_LOWLEVEL is not set
> > # CONFIG_SCSI_DH is not set
> > # end of SCSI device support
> > =

> > CONFIG_ATA=3Dy
> > CONFIG_SATA_HOST=3Dy
> > CONFIG_ATA_VERBOSE_ERROR=3Dy
> > CONFIG_ATA_FORCE=3Dy
> > # CONFIG_ATA_ACPI is not set
> > CONFIG_SATA_PMP=3Dy
> > =

> > #
> > # Controllers with non-SFF native interface
> > #
> > # CONFIG_SATA_AHCI is not set
> > CONFIG_SATA_AHCI_PLATFORM=3Dy
> > # CONFIG_AHCI_CEVA is not set
> > CONFIG_AHCI_QORIQ=3Dm
> > # CONFIG_SATA_INIC162X is not set
> > # CONFIG_SATA_ACARD_AHCI is not set
> > # CONFIG_SATA_SIL24 is not set
> > # CONFIG_ATA_SFF is not set
> > # CONFIG_MD is not set
> > # CONFIG_TARGET_CORE is not set
> > # CONFIG_FUSION is not set
> > =

> > #
> > # IEEE 1394 (FireWire) support
> > #
> > CONFIG_FIREWIRE=3Dy
> > # CONFIG_FIREWIRE_OHCI is not set
> > CONFIG_FIREWIRE_SBP2=3Dy
> > # CONFIG_FIREWIRE_NET is not set
> > # CONFIG_FIREWIRE_NOSY is not set
> > # end of IEEE 1394 (FireWire) support
> > =

> > # CONFIG_MACINTOSH_DRIVERS is not set
> > CONFIG_NETDEVICES=3Dy
> > CONFIG_NET_CORE=3Dy
> > # CONFIG_BONDING is not set
> > # CONFIG_DUMMY is not set
> > # CONFIG_WIREGUARD is not set
> > # CONFIG_EQUALIZER is not set
> > # CONFIG_NET_FC is not set
> > # CONFIG_NET_TEAM is not set
> > # CONFIG_MACVLAN is not set
> > # CONFIG_IPVLAN is not set
> > # CONFIG_VXLAN is not set
> > # CONFIG_GENEVE is not set
> > # CONFIG_BAREUDP is not set
> > # CONFIG_GTP is not set
> > # CONFIG_MACSEC is not set
> > # CONFIG_NETCONSOLE is not set
> > # CONFIG_TUN is not set
> > # CONFIG_TUN_VNET_CROSS_LE is not set
> > # CONFIG_VETH is not set
> > CONFIG_VIRTIO_NET=3Dm
> > # CONFIG_NLMON is not set
> > # CONFIG_VSOCKMON is not set
> > # CONFIG_ARCNET is not set
> > CONFIG_ATM_DRIVERS=3Dy
> > # CONFIG_ATM_DUMMY is not set
> > # CONFIG_ATM_TCP is not set
> > # CONFIG_ATM_LANAI is not set
> > # CONFIG_ATM_ENI is not set
> > # CONFIG_ATM_FIRESTREAM is not set
> > # CONFIG_ATM_ZATM is not set
> > # CONFIG_ATM_NICSTAR is not set
> > # CONFIG_ATM_IDT77252 is not set
> > # CONFIG_ATM_AMBASSADOR is not set
> > # CONFIG_ATM_HORIZON is not set
> > # CONFIG_ATM_IA is not set
> > # CONFIG_ATM_FORE200E is not set
> > # CONFIG_ATM_HE is not set
> > # CONFIG_ATM_SOLOS is not set
> > CONFIG_ETHERNET=3Dy
> > CONFIG_NET_VENDOR_3COM=3Dy
> > # CONFIG_EL3 is not set
> > # CONFIG_3C515 is not set
> > # CONFIG_VORTEX is not set
> > # CONFIG_TYPHOON is not set
> > CONFIG_NET_VENDOR_ADAPTEC=3Dy
> > # CONFIG_ADAPTEC_STARFIRE is not set
> > CONFIG_NET_VENDOR_AGERE=3Dy
> > # CONFIG_ET131X is not set
> > CONFIG_NET_VENDOR_ALACRITECH=3Dy
> > # CONFIG_SLICOSS is not set
> > CONFIG_NET_VENDOR_ALTEON=3Dy
> > # CONFIG_ACENIC is not set
> > # CONFIG_ALTERA_TSE is not set
> > CONFIG_NET_VENDOR_AMAZON=3Dy
> > # CONFIG_NET_VENDOR_AMD is not set
> > CONFIG_NET_VENDOR_AQUANTIA=3Dy
> > # CONFIG_AQTION is not set
> > CONFIG_NET_VENDOR_ARC=3Dy
> > CONFIG_NET_VENDOR_ASIX=3Dy
> > # CONFIG_SPI_AX88796C is not set
> > CONFIG_NET_VENDOR_ATHEROS=3Dy
> > # CONFIG_ATL2 is not set
> > # CONFIG_ATL1 is not set
> > # CONFIG_ATL1E is not set
> > # CONFIG_ATL1C is not set
> > # CONFIG_ALX is not set
> > CONFIG_NET_VENDOR_BROADCOM=3Dy
> > # CONFIG_B44 is not set
> > # CONFIG_BCMGENET is not set
> > # CONFIG_BNX2 is not set
> > # CONFIG_CNIC is not set
> > # CONFIG_TIGON3 is not set
> > # CONFIG_BNX2X is not set
> > # CONFIG_SYSTEMPORT is not set
> > # CONFIG_BNXT is not set
> > CONFIG_NET_VENDOR_BROCADE=3Dy
> > # CONFIG_BNA is not set
> > CONFIG_NET_VENDOR_CADENCE=3Dy
> > # CONFIG_MACB is not set
> > CONFIG_NET_VENDOR_CAVIUM=3Dy
> > CONFIG_NET_VENDOR_CHELSIO=3Dy
> > # CONFIG_CHELSIO_T1 is not set
> > # CONFIG_CHELSIO_T3 is not set
> > # CONFIG_CHELSIO_T4 is not set
> > # CONFIG_CHELSIO_T4VF is not set
> > CONFIG_NET_VENDOR_CIRRUS=3Dy
> > # CONFIG_CS89x0_ISA is not set
> > CONFIG_NET_VENDOR_CISCO=3Dy
> > # CONFIG_ENIC is not set
> > CONFIG_NET_VENDOR_CORTINA=3Dy
> > # CONFIG_GEMINI_ETHERNET is not set
> > # CONFIG_CX_ECAT is not set
> > # CONFIG_DNET is not set
> > CONFIG_NET_VENDOR_DEC=3Dy
> > # CONFIG_NET_TULIP is not set
> > CONFIG_NET_VENDOR_DLINK=3Dy
> > # CONFIG_DL2K is not set
> > # CONFIG_SUNDANCE is not set
> > CONFIG_NET_VENDOR_EMULEX=3Dy
> > # CONFIG_BE2NET is not set
> > CONFIG_NET_VENDOR_ENGLEDER=3Dy
> > # CONFIG_TSNEP is not set
> > CONFIG_NET_VENDOR_EZCHIP=3Dy
> > # CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
> > CONFIG_NET_VENDOR_GOOGLE=3Dy
> > CONFIG_NET_VENDOR_HUAWEI=3Dy
> > CONFIG_NET_VENDOR_I825XX=3Dy
> > CONFIG_NET_VENDOR_INTEL=3Dy
> > # CONFIG_E100 is not set
> > CONFIG_E1000=3Dy
> > # CONFIG_E1000E is not set
> > # CONFIG_IGB is not set
> > # CONFIG_IGBVF is not set
> > # CONFIG_IXGB is not set
> > # CONFIG_IXGBE is not set
> > # CONFIG_I40E is not set
> > # CONFIG_IGC is not set
> > CONFIG_NET_VENDOR_MICROSOFT=3Dy
> > # CONFIG_JME is not set
> > CONFIG_NET_VENDOR_LITEX=3Dy
> > # CONFIG_LITEX_LITEETH is not set
> > CONFIG_NET_VENDOR_MARVELL=3Dy
> > # CONFIG_MVMDIO is not set
> > # CONFIG_SKGE is not set
> > # CONFIG_SKY2 is not set
> > CONFIG_NET_VENDOR_MELLANOX=3Dy
> > # CONFIG_MLX4_EN is not set
> > # CONFIG_MLX5_CORE is not set
> > # CONFIG_MLXSW_CORE is not set
> > # CONFIG_MLXFW is not set
> > CONFIG_NET_VENDOR_MICREL=3Dy
> > # CONFIG_KS8851 is not set
> > # CONFIG_KS8851_MLL is not set
> > # CONFIG_KSZ884X_PCI is not set
> > CONFIG_NET_VENDOR_MICROCHIP=3Dy
> > # CONFIG_ENC28J60 is not set
> > # CONFIG_ENCX24J600 is not set
> > # CONFIG_LAN743X is not set
> > CONFIG_NET_VENDOR_MICROSEMI=3Dy
> > CONFIG_NET_VENDOR_MYRI=3Dy
> > # CONFIG_MYRI10GE is not set
> > # CONFIG_FEALNX is not set
> > CONFIG_NET_VENDOR_NATSEMI=3Dy
> > # CONFIG_NATSEMI is not set
> > # CONFIG_NS83820 is not set
> > CONFIG_NET_VENDOR_NETERION=3Dy
> > # CONFIG_S2IO is not set
> > # CONFIG_VXGE is not set
> > CONFIG_NET_VENDOR_NETRONOME=3Dy
> > CONFIG_NET_VENDOR_NI=3Dy
> > # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> > CONFIG_NET_VENDOR_8390=3Dy
> > # CONFIG_NE2000 is not set
> > # CONFIG_NE2K_PCI is not set
> > # CONFIG_ULTRA is not set
> > # CONFIG_WD80x3 is not set
> > CONFIG_NET_VENDOR_NVIDIA=3Dy
> > # CONFIG_FORCEDETH is not set
> > CONFIG_NET_VENDOR_OKI=3Dy
> > # CONFIG_ETHOC is not set
> > CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> > # CONFIG_HAMACHI is not set
> > # CONFIG_YELLOWFIN is not set
> > CONFIG_NET_VENDOR_PENSANDO=3Dy
> > CONFIG_NET_VENDOR_QLOGIC=3Dy
> > # CONFIG_QLA3XXX is not set
> > # CONFIG_QLCNIC is not set
> > # CONFIG_NETXEN_NIC is not set
> > # CONFIG_QED is not set
> > CONFIG_NET_VENDOR_QUALCOMM=3Dy
> > # CONFIG_QCA7000_SPI is not set
> > # CONFIG_QCA7000_UART is not set
> > # CONFIG_QCOM_EMAC is not set
> > # CONFIG_RMNET is not set
> > CONFIG_NET_VENDOR_RDC=3Dy
> > # CONFIG_R6040 is not set
> > CONFIG_NET_VENDOR_REALTEK=3Dy
> > # CONFIG_8139CP is not set
> > # CONFIG_8139TOO is not set
> > # CONFIG_R8169 is not set
> > CONFIG_NET_VENDOR_RENESAS=3Dy
> > CONFIG_NET_VENDOR_ROCKER=3Dy
> > CONFIG_NET_VENDOR_SAMSUNG=3Dy
> > # CONFIG_SXGBE_ETH is not set
> > CONFIG_NET_VENDOR_SEEQ=3Dy
> > CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> > # CONFIG_SFC is not set
> > # CONFIG_SFC_FALCON is not set
> > CONFIG_NET_VENDOR_SILAN=3Dy
> > # CONFIG_SC92031 is not set
> > CONFIG_NET_VENDOR_SIS=3Dy
> > # CONFIG_SIS900 is not set
> > # CONFIG_SIS190 is not set
> > CONFIG_NET_VENDOR_SMSC=3Dy
> > # CONFIG_SMC9194 is not set
> > # CONFIG_EPIC100 is not set
> > # CONFIG_SMSC911X is not set
> > # CONFIG_SMSC9420 is not set
> > CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> > CONFIG_NET_VENDOR_STMICRO=3Dy
> > # CONFIG_STMMAC_ETH is not set
> > CONFIG_NET_VENDOR_SUN=3Dy
> > # CONFIG_HAPPYMEAL is not set
> > # CONFIG_SUNGEM is not set
> > # CONFIG_CASSINI is not set
> > # CONFIG_NIU is not set
> > CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> > # CONFIG_DWC_XLGMAC is not set
> > CONFIG_NET_VENDOR_TEHUTI=3Dy
> > # CONFIG_TEHUTI is not set
> > CONFIG_NET_VENDOR_TI=3Dy
> > # CONFIG_TI_CPSW_PHY_SEL is not set
> > # CONFIG_TLAN is not set
> > CONFIG_NET_VENDOR_VERTEXCOM=3Dy
> > # CONFIG_MSE102X is not set
> > CONFIG_NET_VENDOR_VIA=3Dy
> > # CONFIG_VIA_RHINE is not set
> > # CONFIG_VIA_VELOCITY is not set
> > CONFIG_NET_VENDOR_WIZNET=3Dy
> > # CONFIG_WIZNET_W5100 is not set
> > # CONFIG_WIZNET_W5300 is not set
> > CONFIG_NET_VENDOR_XILINX=3Dy
> > # CONFIG_XILINX_EMACLITE is not set
> > # CONFIG_XILINX_AXI_EMAC is not set
> > # CONFIG_XILINX_LL_TEMAC is not set
> > # CONFIG_FDDI is not set
> > # CONFIG_HIPPI is not set
> > # CONFIG_NET_SB1000 is not set
> > # CONFIG_PHYLIB is not set
> > # CONFIG_MICREL_KS8995MA is not set
> > # CONFIG_MDIO_DEVICE is not set
> > =

> > #
> > # PCS device drivers
> > #
> > # end of PCS device drivers
> > =

> > # CONFIG_PPP is not set
> > # CONFIG_SLIP is not set
> > CONFIG_USB_NET_DRIVERS=3Dy
> > # CONFIG_USB_CATC is not set
> > # CONFIG_USB_KAWETH is not set
> > # CONFIG_USB_PEGASUS is not set
> > # CONFIG_USB_RTL8150 is not set
> > # CONFIG_USB_RTL8152 is not set
> > # CONFIG_USB_LAN78XX is not set
> > # CONFIG_USB_USBNET is not set
> > # CONFIG_USB_HSO is not set
> > # CONFIG_USB_IPHETH is not set
> > CONFIG_WLAN=3Dy
> > CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> > # CONFIG_ADM8211 is not set
> > CONFIG_WLAN_VENDOR_ATH=3Dy
> > # CONFIG_ATH_DEBUG is not set
> > # CONFIG_ATH5K is not set
> > # CONFIG_ATH5K_PCI is not set
> > # CONFIG_ATH9K is not set
> > # CONFIG_ATH9K_HTC is not set
> > # CONFIG_CARL9170 is not set
> > # CONFIG_ATH6KL is not set
> > # CONFIG_AR5523 is not set
> > # CONFIG_WIL6210 is not set
> > # CONFIG_ATH10K is not set
> > # CONFIG_WCN36XX is not set
> > CONFIG_WLAN_VENDOR_ATMEL=3Dy
> > # CONFIG_ATMEL is not set
> > # CONFIG_AT76C50X_USB is not set
> > CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> > # CONFIG_B43 is not set
> > # CONFIG_B43LEGACY is not set
> > # CONFIG_BRCMSMAC is not set
> > # CONFIG_BRCMFMAC is not set
> > CONFIG_WLAN_VENDOR_CISCO=3Dy
> > # CONFIG_AIRO is not set
> > CONFIG_WLAN_VENDOR_INTEL=3Dy
> > # CONFIG_IPW2100 is not set
> > # CONFIG_IPW2200 is not set
> > # CONFIG_IWL4965 is not set
> > # CONFIG_IWL3945 is not set
> > # CONFIG_IWLWIFI is not set
> > CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> > # CONFIG_HOSTAP is not set
> > # CONFIG_HERMES is not set
> > # CONFIG_P54_COMMON is not set
> > CONFIG_WLAN_VENDOR_MARVELL=3Dy
> > # CONFIG_LIBERTAS is not set
> > # CONFIG_LIBERTAS_THINFIRM is not set
> > # CONFIG_MWIFIEX is not set
> > # CONFIG_MWL8K is not set
> > CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> > # CONFIG_MT7601U is not set
> > # CONFIG_MT76x0U is not set
> > # CONFIG_MT76x0E is not set
> > # CONFIG_MT76x2E is not set
> > # CONFIG_MT76x2U is not set
> > # CONFIG_MT7603E is not set
> > # CONFIG_MT7615E is not set
> > # CONFIG_MT7663U is not set
> > # CONFIG_MT7663S is not set
> > # CONFIG_MT7915E is not set
> > # CONFIG_MT7921E is not set
> > # CONFIG_MT7921S is not set
> > CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> > # CONFIG_WILC1000_SDIO is not set
> > # CONFIG_WILC1000_SPI is not set
> > CONFIG_WLAN_VENDOR_RALINK=3Dy
> > # CONFIG_RT2X00 is not set
> > CONFIG_WLAN_VENDOR_REALTEK=3Dy
> > # CONFIG_RTL8180 is not set
> > # CONFIG_RTL8187 is not set
> > CONFIG_RTL_CARDS=3Dy
> > # CONFIG_RTL8192CE is not set
> > # CONFIG_RTL8192SE is not set
> > # CONFIG_RTL8192DE is not set
> > # CONFIG_RTL8723AE is not set
> > # CONFIG_RTL8723BE is not set
> > # CONFIG_RTL8188EE is not set
> > # CONFIG_RTL8192EE is not set
> > # CONFIG_RTL8821AE is not set
> > # CONFIG_RTL8192CU is not set
> > # CONFIG_RTL8XXXU is not set
> > # CONFIG_RTW88 is not set
> > # CONFIG_RTW89 is not set
> > CONFIG_WLAN_VENDOR_RSI=3Dy
> > # CONFIG_RSI_91X is not set
> > CONFIG_WLAN_VENDOR_ST=3Dy
> > # CONFIG_CW1200 is not set
> > CONFIG_WLAN_VENDOR_TI=3Dy
> > # CONFIG_WL1251 is not set
> > # CONFIG_WL12XX is not set
> > # CONFIG_WL18XX is not set
> > # CONFIG_WLCORE is not set
> > CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> > # CONFIG_USB_ZD1201 is not set
> > # CONFIG_ZD1211RW is not set
> > CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> > # CONFIG_QTNFMAC_PCIE is not set
> > # CONFIG_MAC80211_HWSIM is not set
> > # CONFIG_USB_NET_RNDIS_WLAN is not set
> > # CONFIG_VIRT_WIFI is not set
> > # CONFIG_WAN is not set
> > CONFIG_IEEE802154_DRIVERS=3Dm
> > # CONFIG_IEEE802154_FAKELB is not set
> > # CONFIG_IEEE802154_AT86RF230 is not set
> > # CONFIG_IEEE802154_MRF24J40 is not set
> > # CONFIG_IEEE802154_CC2520 is not set
> > # CONFIG_IEEE802154_ATUSB is not set
> > # CONFIG_IEEE802154_ADF7242 is not set
> > # CONFIG_IEEE802154_CA8210 is not set
> > # CONFIG_IEEE802154_MCR20A is not set
> > # CONFIG_IEEE802154_HWSIM is not set
> > =

> > #
> > # Wireless WAN
> > #
> > # CONFIG_WWAN is not set
> > # end of Wireless WAN
> > =

> > # CONFIG_VMXNET3 is not set
> > # CONFIG_FUJITSU_ES is not set
> > # CONFIG_NETDEVSIM is not set
> > CONFIG_NET_FAILOVER=3Dm
> > # CONFIG_ISDN is not set
> > =

> > #
> > # Input device support
> > #
> > CONFIG_INPUT=3Dy
> > CONFIG_INPUT_LEDS=3Dm
> > CONFIG_INPUT_FF_MEMLESS=3Dy
> > CONFIG_INPUT_SPARSEKMAP=3Dy
> > CONFIG_INPUT_MATRIXKMAP=3Dy
> > =

> > #
> > # Userland interfaces
> > #
> > # CONFIG_INPUT_MOUSEDEV is not set
> > CONFIG_INPUT_JOYDEV=3Dm
> > # CONFIG_INPUT_EVDEV is not set
> > # CONFIG_INPUT_EVBUG is not set
> > =

> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=3Dy
> > # CONFIG_KEYBOARD_ADC is not set
> > # CONFIG_KEYBOARD_ADP5588 is not set
> > # CONFIG_KEYBOARD_ADP5589 is not set
> > # CONFIG_KEYBOARD_APPLESPI is not set
> > CONFIG_KEYBOARD_ATKBD=3Dy
> > # CONFIG_KEYBOARD_QT1050 is not set
> > # CONFIG_KEYBOARD_QT1070 is not set
> > # CONFIG_KEYBOARD_QT2160 is not set
> > # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> > # CONFIG_KEYBOARD_LKKBD is not set
> > # CONFIG_KEYBOARD_GPIO is not set
> > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > # CONFIG_KEYBOARD_TCA6416 is not set
> > # CONFIG_KEYBOARD_TCA8418 is not set
> > # CONFIG_KEYBOARD_MATRIX is not set
> > # CONFIG_KEYBOARD_LM8323 is not set
> > # CONFIG_KEYBOARD_LM8333 is not set
> > # CONFIG_KEYBOARD_MAX7359 is not set
> > # CONFIG_KEYBOARD_MCS is not set
> > # CONFIG_KEYBOARD_MPR121 is not set
> > # CONFIG_KEYBOARD_NEWTON is not set
> > # CONFIG_KEYBOARD_OPENCORES is not set
> > # CONFIG_KEYBOARD_SAMSUNG is not set
> > # CONFIG_KEYBOARD_STOWAWAY is not set
> > # CONFIG_KEYBOARD_SUNKBD is not set
> > # CONFIG_KEYBOARD_STMPE is not set
> > # CONFIG_KEYBOARD_IQS62X is not set
> > # CONFIG_KEYBOARD_OMAP4 is not set
> > # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > # CONFIG_KEYBOARD_CROS_EC is not set
> > # CONFIG_KEYBOARD_CAP11XX is not set
> > # CONFIG_KEYBOARD_BCM is not set
> > # CONFIG_KEYBOARD_MTK_PMIC is not set
> > # CONFIG_KEYBOARD_CYPRESS_SF is not set
> > # CONFIG_INPUT_MOUSE is not set
> > # CONFIG_INPUT_JOYSTICK is not set
> > CONFIG_INPUT_TABLET=3Dy
> > # CONFIG_TABLET_USB_ACECAD is not set
> > # CONFIG_TABLET_USB_AIPTEK is not set
> > # CONFIG_TABLET_USB_HANWANG is not set
> > CONFIG_TABLET_USB_KBTAB=3Dy
> > CONFIG_TABLET_USB_PEGASUS=3Dy
> > # CONFIG_TABLET_SERIAL_WACOM4 is not set
> > CONFIG_INPUT_TOUCHSCREEN=3Dy
> > CONFIG_TOUCHSCREEN_ADS7846=3Dm
> > CONFIG_TOUCHSCREEN_AD7877=3Dy
> > # CONFIG_TOUCHSCREEN_AD7879 is not set
> > CONFIG_TOUCHSCREEN_ADC=3Dm
> > # CONFIG_TOUCHSCREEN_AR1021_I2C is not set
> > # CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
> > CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
> > CONFIG_TOUCHSCREEN_BU21013=3Dy
> > CONFIG_TOUCHSCREEN_BU21029=3Dy
> > CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=3Dm
> > # CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
> > CONFIG_TOUCHSCREEN_CY8CTMA140=3Dm
> > # CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
> > # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
> > # CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
> > CONFIG_TOUCHSCREEN_DA9052=3Dm
> > CONFIG_TOUCHSCREEN_DYNAPRO=3Dm
> > # CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
> > # CONFIG_TOUCHSCREEN_EETI is not set
> > CONFIG_TOUCHSCREEN_EGALAX=3Dy
> > CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
> > CONFIG_TOUCHSCREEN_EXC3000=3Dm
> > CONFIG_TOUCHSCREEN_FUJITSU=3Dm
> > # CONFIG_TOUCHSCREEN_GOODIX is not set
> > CONFIG_TOUCHSCREEN_HIDEEP=3Dy
> > CONFIG_TOUCHSCREEN_HYCON_HY46XX=3Dm
> > # CONFIG_TOUCHSCREEN_ILI210X is not set
> > CONFIG_TOUCHSCREEN_ILITEK=3Dm
> > CONFIG_TOUCHSCREEN_S6SY761=3Dy
> > CONFIG_TOUCHSCREEN_GUNZE=3Dm
> > CONFIG_TOUCHSCREEN_EKTF2127=3Dm
> > # CONFIG_TOUCHSCREEN_ELAN is not set
> > CONFIG_TOUCHSCREEN_ELO=3Dy
> > CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
> > # CONFIG_TOUCHSCREEN_WACOM_I2C is not set
> > # CONFIG_TOUCHSCREEN_MAX11801 is not set
> > CONFIG_TOUCHSCREEN_MCS5000=3Dm
> > CONFIG_TOUCHSCREEN_MMS114=3Dy
> > # CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
> > # CONFIG_TOUCHSCREEN_MSG2638 is not set
> > CONFIG_TOUCHSCREEN_MTOUCH=3Dm
> > CONFIG_TOUCHSCREEN_IMX6UL_TSC=3Dm
> > # CONFIG_TOUCHSCREEN_INEXIO is not set
> > CONFIG_TOUCHSCREEN_MK712=3Dm
> > CONFIG_TOUCHSCREEN_HTCPEN=3Dm
> > # CONFIG_TOUCHSCREEN_PENMOUNT is not set
> > # CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
> > # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> > # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> > CONFIG_TOUCHSCREEN_UCB1400=3Dm
> > # CONFIG_TOUCHSCREEN_PIXCIR is not set
> > # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
> > CONFIG_TOUCHSCREEN_WM831X=3Dy
> > CONFIG_TOUCHSCREEN_WM97XX=3Dm
> > CONFIG_TOUCHSCREEN_WM9705=3Dy
> > # CONFIG_TOUCHSCREEN_WM9712 is not set
> > # CONFIG_TOUCHSCREEN_WM9713 is not set
> > # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> > CONFIG_TOUCHSCREEN_MC13783=3Dm
> > CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> > # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
> > CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
> > # CONFIG_TOUCHSCREEN_TSC2004 is not set
> > CONFIG_TOUCHSCREEN_TSC2005=3Dy
> > # CONFIG_TOUCHSCREEN_TSC2007 is not set
> > # CONFIG_TOUCHSCREEN_PCAP is not set
> > # CONFIG_TOUCHSCREEN_RM_TS is not set
> > # CONFIG_TOUCHSCREEN_SILEAD is not set
> > CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
> > # CONFIG_TOUCHSCREEN_ST1232 is not set
> > # CONFIG_TOUCHSCREEN_STMFTS is not set
> > # CONFIG_TOUCHSCREEN_STMPE is not set
> > CONFIG_TOUCHSCREEN_SUR40=3Dm
> > # CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
> > CONFIG_TOUCHSCREEN_SX8654=3Dm
> > CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> > # CONFIG_TOUCHSCREEN_ZET6223 is not set
> > CONFIG_TOUCHSCREEN_ZFORCE=3Dy
> > # CONFIG_TOUCHSCREEN_COLIBRI_VF50 is not set
> > CONFIG_TOUCHSCREEN_ROHM_BU21023=3Dy
> > CONFIG_TOUCHSCREEN_IQS5XX=3Dy
> > CONFIG_TOUCHSCREEN_ZINITIX=3Dm
> > CONFIG_INPUT_MISC=3Dy
> > # CONFIG_INPUT_88PM80X_ONKEY is not set
> > CONFIG_INPUT_AD714X=3Dy
> > CONFIG_INPUT_AD714X_I2C=3Dy
> > CONFIG_INPUT_AD714X_SPI=3Dm
> > CONFIG_INPUT_ARIZONA_HAPTICS=3Dm
> > # CONFIG_INPUT_ATC260X_ONKEY is not set
> > # CONFIG_INPUT_ATMEL_CAPTOUCH is not set
> > CONFIG_INPUT_BMA150=3Dm
> > CONFIG_INPUT_E3X0_BUTTON=3Dy
> > CONFIG_INPUT_PCSPKR=3Dm
> > CONFIG_INPUT_MAX8925_ONKEY=3Dm
> > CONFIG_INPUT_MC13783_PWRBUTTON=3Dy
> > CONFIG_INPUT_MMA8450=3Dy
> > CONFIG_INPUT_APANEL=3Dm
> > CONFIG_INPUT_GPIO_BEEPER=3Dm
> > CONFIG_INPUT_GPIO_DECODER=3Dy
> > # CONFIG_INPUT_GPIO_VIBRA is not set
> > CONFIG_INPUT_WISTRON_BTNS=3Dy
> > CONFIG_INPUT_ATLAS_BTNS=3Dm
> > CONFIG_INPUT_ATI_REMOTE2=3Dy
> > # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> > CONFIG_INPUT_KXTJ9=3Dm
> > CONFIG_INPUT_POWERMATE=3Dm
> > CONFIG_INPUT_YEALINK=3Dm
> > CONFIG_INPUT_CM109=3Dy
> > CONFIG_INPUT_REGULATOR_HAPTIC=3Dy
> > CONFIG_INPUT_RETU_PWRBUTTON=3Dm
> > CONFIG_INPUT_TPS65218_PWRBUTTON=3Dm
> > # CONFIG_INPUT_TWL6040_VIBRA is not set
> > # CONFIG_INPUT_UINPUT is not set
> > CONFIG_INPUT_PCF50633_PMU=3Dm
> > # CONFIG_INPUT_PCF8574 is not set
> > CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dy
> > CONFIG_INPUT_DA7280_HAPTICS=3Dm
> > # CONFIG_INPUT_DA9052_ONKEY is not set
> > CONFIG_INPUT_DA9055_ONKEY=3Dm
> > CONFIG_INPUT_WM831X_ON=3Dy
> > CONFIG_INPUT_PCAP=3Dy
> > CONFIG_INPUT_ADXL34X=3Dm
> > CONFIG_INPUT_ADXL34X_I2C=3Dm
> > # CONFIG_INPUT_ADXL34X_SPI is not set
> > # CONFIG_INPUT_IMS_PCU is not set
> > CONFIG_INPUT_IQS269A=3Dy
> > # CONFIG_INPUT_IQS626A is not set
> > CONFIG_INPUT_CMA3000=3Dm
> > CONFIG_INPUT_CMA3000_I2C=3Dm
> > # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
> > CONFIG_INPUT_DRV260X_HAPTICS=3Dy
> > CONFIG_INPUT_DRV2665_HAPTICS=3Dm
> > # CONFIG_INPUT_DRV2667_HAPTICS is not set
> > # CONFIG_INPUT_RAVE_SP_PWRBUTTON is not set
> > CONFIG_INPUT_STPMIC1_ONKEY=3Dm
> > CONFIG_RMI4_CORE=3Dy
> > CONFIG_RMI4_I2C=3Dm
> > CONFIG_RMI4_SPI=3Dy
> > CONFIG_RMI4_SMB=3Dm
> > CONFIG_RMI4_F03=3Dy
> > CONFIG_RMI4_F03_SERIO=3Dy
> > CONFIG_RMI4_2D_SENSOR=3Dy
> > CONFIG_RMI4_F11=3Dy
> > CONFIG_RMI4_F12=3Dy
> > CONFIG_RMI4_F30=3Dy
> > CONFIG_RMI4_F34=3Dy
> > # CONFIG_RMI4_F3A is not set
> > CONFIG_RMI4_F55=3Dy
> > =

> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> > CONFIG_SERIO_I8042=3Dy
> > CONFIG_SERIO_SERPORT=3Dm
> > CONFIG_SERIO_CT82C710=3Dy
> > # CONFIG_SERIO_PCIPS2 is not set
> > CONFIG_SERIO_LIBPS2=3Dy
> > CONFIG_SERIO_RAW=3Dy
> > # CONFIG_SERIO_ALTERA_PS2 is not set
> > CONFIG_SERIO_PS2MULT=3Dm
> > CONFIG_SERIO_ARC_PS2=3Dy
> > # CONFIG_SERIO_APBPS2 is not set
> > CONFIG_SERIO_GPIO_PS2=3Dy
> > # CONFIG_USERIO is not set
> > CONFIG_GAMEPORT=3Dy
> > CONFIG_GAMEPORT_NS558=3Dm
> > # CONFIG_GAMEPORT_L4 is not set
> > # CONFIG_GAMEPORT_EMU10K1 is not set
> > # CONFIG_GAMEPORT_FM801 is not set
> > # end of Hardware I/O ports
> > # end of Input device support
> > =

> > #
> > # Character devices
> > #
> > CONFIG_TTY=3Dy
> > CONFIG_VT=3Dy
> > CONFIG_CONSOLE_TRANSLATIONS=3Dy
> > CONFIG_VT_CONSOLE=3Dy
> > CONFIG_HW_CONSOLE=3Dy
> > CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> > CONFIG_UNIX98_PTYS=3Dy
> > CONFIG_LEGACY_PTYS=3Dy
> > CONFIG_LEGACY_PTY_COUNT=3D256
> > CONFIG_LDISC_AUTOLOAD=3Dy
> > =

> > #
> > # Serial drivers
> > #
> > CONFIG_SERIAL_EARLYCON=3Dy
> > CONFIG_SERIAL_8250=3Dy
> > # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> > CONFIG_SERIAL_8250_PNP=3Dy
> > CONFIG_SERIAL_8250_16550A_VARIANTS=3Dy
> > # CONFIG_SERIAL_8250_FINTEK is not set
> > CONFIG_SERIAL_8250_CONSOLE=3Dy
> > CONFIG_SERIAL_8250_PCI=3Dy
> > CONFIG_SERIAL_8250_EXAR=3Dy
> > # CONFIG_SERIAL_8250_MEN_MCB is not set
> > CONFIG_SERIAL_8250_NR_UARTS=3D4
> > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > CONFIG_SERIAL_8250_EXTENDED=3Dy
> > CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> > CONFIG_SERIAL_8250_FOURPORT=3Dm
> > CONFIG_SERIAL_8250_ACCENT=3Dm
> > CONFIG_SERIAL_8250_ASPEED_VUART=3Dm
> > # CONFIG_SERIAL_8250_BOCA is not set
> > CONFIG_SERIAL_8250_EXAR_ST16C554=3Dy
> > # CONFIG_SERIAL_8250_HUB6 is not set
> > CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> > # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> > # CONFIG_SERIAL_8250_RSA is not set
> > CONFIG_SERIAL_8250_DWLIB=3Dy
> > CONFIG_SERIAL_8250_DW=3Dm
> > # CONFIG_SERIAL_8250_RT288X is not set
> > CONFIG_SERIAL_8250_LPSS=3Dy
> > CONFIG_SERIAL_8250_MID=3Dy
> > CONFIG_SERIAL_8250_PERICOM=3Dy
> > CONFIG_SERIAL_OF_PLATFORM=3Dy
> > =

> > #
> > # Non-8250 serial port support
> > #
> > # CONFIG_SERIAL_MAX3100 is not set
> > CONFIG_SERIAL_MAX310X=3Dm
> > CONFIG_SERIAL_UARTLITE=3Dy
> > # CONFIG_SERIAL_UARTLITE_CONSOLE is not set
> > CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
> > CONFIG_SERIAL_CORE=3Dy
> > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > # CONFIG_SERIAL_JSM is not set
> > CONFIG_SERIAL_SIFIVE=3Dm
> > CONFIG_SERIAL_LANTIQ=3Dm
> > # CONFIG_SERIAL_SCCNXP is not set
> > CONFIG_SERIAL_SC16IS7XX_CORE=3Dm
> > CONFIG_SERIAL_SC16IS7XX=3Dm
> > CONFIG_SERIAL_SC16IS7XX_I2C=3Dy
> > CONFIG_SERIAL_SC16IS7XX_SPI=3Dy
> > # CONFIG_SERIAL_TIMBERDALE is not set
> > # CONFIG_SERIAL_BCM63XX is not set
> > # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> > # CONFIG_SERIAL_ALTERA_UART is not set
> > # CONFIG_SERIAL_PCH_UART is not set
> > CONFIG_SERIAL_XILINX_PS_UART=3Dm
> > CONFIG_SERIAL_ARC=3Dy
> > CONFIG_SERIAL_ARC_CONSOLE=3Dy
> > CONFIG_SERIAL_ARC_NR_PORTS=3D1
> > # CONFIG_SERIAL_RP2 is not set
> > # CONFIG_SERIAL_FSL_LPUART is not set
> > # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> > CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dm
> > CONFIG_SERIAL_MEN_Z135=3Dm
> > CONFIG_SERIAL_SPRD=3Dm
> > # end of Serial drivers
> > =

> > CONFIG_SERIAL_MCTRL_GPIO=3Dy
> > CONFIG_SERIAL_NONSTANDARD=3Dy
> > # CONFIG_MOXA_INTELLIO is not set
> > # CONFIG_MOXA_SMARTIO is not set
> > # CONFIG_SYNCLINK_GT is not set
> > CONFIG_N_HDLC=3Dy
> > # CONFIG_N_GSM is not set
> > # CONFIG_NOZOMI is not set
> > CONFIG_NULL_TTY=3Dy
> > CONFIG_RPMSG_TTY=3Dm
> > CONFIG_SERIAL_DEV_BUS=3Dy
> > CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> > # CONFIG_VIRTIO_CONSOLE is not set
> > # CONFIG_IPMI_HANDLER is not set
> > CONFIG_IPMB_DEVICE_INTERFACE=3Dy
> > CONFIG_HW_RANDOM=3Dy
> > CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> > CONFIG_HW_RANDOM_INTEL=3Dy
> > # CONFIG_HW_RANDOM_AMD is not set
> > # CONFIG_HW_RANDOM_BA431 is not set
> > CONFIG_HW_RANDOM_GEODE=3Dy
> > CONFIG_HW_RANDOM_VIA=3Dy
> > CONFIG_HW_RANDOM_VIRTIO=3Dy
> > CONFIG_HW_RANDOM_CCTRNG=3Dy
> > CONFIG_HW_RANDOM_XIPHERA=3Dm
> > # CONFIG_DTLK is not set
> > # CONFIG_APPLICOM is not set
> > # CONFIG_SONYPI is not set
> > CONFIG_MWAVE=3Dy
> > CONFIG_SCx200_GPIO=3Dy
> > CONFIG_PC8736x_GPIO=3Dm
> > CONFIG_NSC_GPIO=3Dy
> > # CONFIG_DEVMEM is not set
> > CONFIG_NVRAM=3Dy
> > # CONFIG_DEVPORT is not set
> > CONFIG_HPET=3Dy
> > CONFIG_HPET_MMAP=3Dy
> > # CONFIG_HPET_MMAP_DEFAULT is not set
> > CONFIG_HANGCHECK_TIMER=3Dm
> > CONFIG_TCG_TPM=3Dy
> > # CONFIG_HW_RANDOM_TPM is not set
> > CONFIG_TCG_TIS_CORE=3Dy
> > CONFIG_TCG_TIS=3Dy
> > CONFIG_TCG_TIS_SPI=3Dm
> > CONFIG_TCG_TIS_SPI_CR50=3Dy
> > CONFIG_TCG_TIS_I2C_CR50=3Dy
> > # CONFIG_TCG_TIS_I2C_ATMEL is not set
> > CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> > # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> > CONFIG_TCG_NSC=3Dm
> > CONFIG_TCG_ATMEL=3Dm
> > CONFIG_TCG_INFINEON=3Dm
> > CONFIG_TCG_CRB=3Dy
> > CONFIG_TCG_VTPM_PROXY=3Dm
> > CONFIG_TCG_TIS_ST33ZP24=3Dy
> > # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> > CONFIG_TCG_TIS_ST33ZP24_SPI=3Dy
> > CONFIG_TELCLOCK=3Dm
> > CONFIG_XILLYBUS_CLASS=3Dm
> > CONFIG_XILLYBUS=3Dm
> > CONFIG_XILLYBUS_OF=3Dm
> > CONFIG_XILLYUSB=3Dm
> > CONFIG_RANDOM_TRUST_CPU=3Dy
> > # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> > # end of Character devices
> > =

> > #
> > # I2C support
> > #
> > CONFIG_I2C=3Dy
> > CONFIG_ACPI_I2C_OPREGION=3Dy
> > CONFIG_I2C_BOARDINFO=3Dy
> > # CONFIG_I2C_COMPAT is not set
> > CONFIG_I2C_CHARDEV=3Dy
> > CONFIG_I2C_MUX=3Dm
> > =

> > #
> > # Multiplexer I2C Chip support
> > #
> > # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> > CONFIG_I2C_MUX_GPIO=3Dm
> > # CONFIG_I2C_MUX_GPMUX is not set
> > # CONFIG_I2C_MUX_LTC4306 is not set
> > CONFIG_I2C_MUX_PCA9541=3Dm
> > CONFIG_I2C_MUX_PCA954x=3Dm
> > CONFIG_I2C_MUX_PINCTRL=3Dm
> > # CONFIG_I2C_MUX_REG is not set
> > # CONFIG_I2C_DEMUX_PINCTRL is not set
> > CONFIG_I2C_MUX_MLXCPLD=3Dm
> > # end of Multiplexer I2C Chip support
> > =

> > # CONFIG_I2C_HELPER_AUTO is not set
> > CONFIG_I2C_SMBUS=3Dy
> > =

> > #
> > # I2C Algorithms
> > #
> > CONFIG_I2C_ALGOBIT=3Dy
> > CONFIG_I2C_ALGOPCF=3Dy
> > CONFIG_I2C_ALGOPCA=3Dy
> > # end of I2C Algorithms
> > =

> > #
> > # I2C Hardware Bus support
> > #
> > =

> > #
> > # PC SMBus host controller drivers
> > #
> > # CONFIG_I2C_ALI1535 is not set
> > # CONFIG_I2C_ALI1563 is not set
> > # CONFIG_I2C_ALI15X3 is not set
> > # CONFIG_I2C_AMD756 is not set
> > # CONFIG_I2C_AMD8111 is not set
> > # CONFIG_I2C_AMD_MP2 is not set
> > # CONFIG_I2C_I801 is not set
> > # CONFIG_I2C_ISCH is not set
> > # CONFIG_I2C_ISMT is not set
> > # CONFIG_I2C_PIIX4 is not set
> > # CONFIG_I2C_NFORCE2 is not set
> > # CONFIG_I2C_NVIDIA_GPU is not set
> > # CONFIG_I2C_SIS5595 is not set
> > # CONFIG_I2C_SIS630 is not set
> > # CONFIG_I2C_SIS96X is not set
> > # CONFIG_I2C_VIA is not set
> > # CONFIG_I2C_VIAPRO is not set
> > =

> > #
> > # ACPI drivers
> > #
> > CONFIG_I2C_SCMI=3Dy
> > =

> > #
> > # I2C system bus drivers (mostly embedded / system-on-chip)
> > #
> > # CONFIG_I2C_CBUS_GPIO is not set
> > # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> > # CONFIG_I2C_DESIGNWARE_PCI is not set
> > # CONFIG_I2C_EG20T is not set
> > # CONFIG_I2C_EMEV2 is not set
> > # CONFIG_I2C_GPIO is not set
> > CONFIG_I2C_OCORES=3Dm
> > CONFIG_I2C_PCA_PLATFORM=3Dm
> > CONFIG_I2C_PXA=3Dm
> > CONFIG_I2C_PXA_PCI=3Dy
> > CONFIG_I2C_RK3X=3Dm
> > CONFIG_I2C_SIMTEC=3Dm
> > # CONFIG_I2C_XILINX is not set
> > =

> > #
> > # External I2C/SMBus adapter drivers
> > #
> > CONFIG_I2C_DIOLAN_U2C=3Dy
> > CONFIG_I2C_DLN2=3Dy
> > CONFIG_I2C_CP2615=3Dy
> > # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> > CONFIG_I2C_TAOS_EVM=3Dm
> > CONFIG_I2C_TINY_USB=3Dm
> > CONFIG_I2C_VIPERBOARD=3Dm
> > =

> > #
> > # Other I2C/SMBus bus drivers
> > #
> > CONFIG_I2C_ELEKTOR=3Dy
> > # CONFIG_I2C_PCA_ISA is not set
> > # CONFIG_I2C_CROS_EC_TUNNEL is not set
> > # CONFIG_SCx200_ACB is not set
> > CONFIG_I2C_FSI=3Dm
> > CONFIG_I2C_VIRTIO=3Dy
> > # end of I2C Hardware Bus support
> > =

> > CONFIG_I2C_STUB=3Dm
> > CONFIG_I2C_SLAVE=3Dy
> > CONFIG_I2C_SLAVE_EEPROM=3Dy
> > CONFIG_I2C_SLAVE_TESTUNIT=3Dm
> > # CONFIG_I2C_DEBUG_CORE is not set
> > # CONFIG_I2C_DEBUG_ALGO is not set
> > # CONFIG_I2C_DEBUG_BUS is not set
> > # end of I2C support
> > =

> > CONFIG_I3C=3Dy
> > # CONFIG_CDNS_I3C_MASTER is not set
> > # CONFIG_DW_I3C_MASTER is not set
> > CONFIG_SVC_I3C_MASTER=3Dy
> > CONFIG_MIPI_I3C_HCI=3Dm
> > CONFIG_SPI=3Dy
> > # CONFIG_SPI_DEBUG is not set
> > CONFIG_SPI_MASTER=3Dy
> > CONFIG_SPI_MEM=3Dy
> > =

> > #
> > # SPI Master Controller Drivers
> > #
> > CONFIG_SPI_ALTERA=3Dm
> > CONFIG_SPI_ALTERA_CORE=3Dm
> > CONFIG_SPI_ALTERA_DFL=3Dm
> > # CONFIG_SPI_AXI_SPI_ENGINE is not set
> > CONFIG_SPI_BITBANG=3Dy
> > CONFIG_SPI_CADENCE=3Dm
> > CONFIG_SPI_CADENCE_QUADSPI=3Dy
> > CONFIG_SPI_CADENCE_XSPI=3Dm
> > # CONFIG_SPI_DESIGNWARE is not set
> > CONFIG_SPI_DLN2=3Dy
> > CONFIG_SPI_FSI=3Dm
> > # CONFIG_SPI_NXP_FLEXSPI is not set
> > # CONFIG_SPI_GPIO is not set
> > CONFIG_SPI_FSL_LIB=3Dm
> > CONFIG_SPI_FSL_SPI=3Dm
> > CONFIG_SPI_LANTIQ_SSC=3Dy
> > CONFIG_SPI_OC_TINY=3Dy
> > CONFIG_SPI_PXA2XX=3Dy
> > CONFIG_SPI_PXA2XX_PCI=3Dy
> > # CONFIG_SPI_ROCKCHIP is not set
> > CONFIG_SPI_SC18IS602=3Dy
> > CONFIG_SPI_SIFIVE=3Dm
> > CONFIG_SPI_MXIC=3Dm
> > # CONFIG_SPI_TOPCLIFF_PCH is not set
> > CONFIG_SPI_XCOMM=3Dy
> > # CONFIG_SPI_XILINX is not set
> > CONFIG_SPI_ZYNQMP_GQSPI=3Dy
> > CONFIG_SPI_AMD=3Dm
> > =

> > #
> > # SPI Multiplexer support
> > #
> > CONFIG_SPI_MUX=3Dy
> > =

> > #
> > # SPI Protocol Masters
> > #
> > # CONFIG_SPI_SPIDEV is not set
> > # CONFIG_SPI_LOOPBACK_TEST is not set
> > CONFIG_SPI_TLE62X0=3Dy
> > # CONFIG_SPI_SLAVE is not set
> > CONFIG_SPI_DYNAMIC=3Dy
> > CONFIG_SPMI=3Dy
> > CONFIG_SPMI_HISI3670=3Dy
> > # CONFIG_HSI is not set
> > # CONFIG_PPS is not set
> > =

> > #
> > # PTP clock support
> > #
> > # CONFIG_PTP_1588_CLOCK is not set
> > CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> > =

> > #
> > # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional cloc=
ks.
> > #
> > # end of PTP clock support
> > =

> > CONFIG_PINCTRL=3Dy
> > CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
> > CONFIG_PINMUX=3Dy
> > CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
> > CONFIG_PINCONF=3Dy
> > CONFIG_GENERIC_PINCONF=3Dy
> > # CONFIG_DEBUG_PINCTRL is not set
> > # CONFIG_PINCTRL_AMD is not set
> > CONFIG_PINCTRL_AS3722=3Dy
> > CONFIG_PINCTRL_EQUILIBRIUM=3Dy
> > CONFIG_PINCTRL_MAX77620=3Dm
> > CONFIG_PINCTRL_MCP23S08_I2C=3Dy
> > CONFIG_PINCTRL_MCP23S08_SPI=3Dy
> > CONFIG_PINCTRL_MCP23S08=3Dy
> > CONFIG_PINCTRL_MICROCHIP_SGPIO=3Dy
> > # CONFIG_PINCTRL_OCELOT is not set
> > CONFIG_PINCTRL_SINGLE=3Dy
> > CONFIG_PINCTRL_STMFX=3Dy
> > # CONFIG_PINCTRL_SX150X is not set
> > # CONFIG_PINCTRL_LOCHNAGAR is not set
> > CONFIG_PINCTRL_MADERA=3Dm
> > CONFIG_PINCTRL_CS47L85=3Dy
> > CONFIG_PINCTRL_CS47L90=3Dy
> > CONFIG_PINCTRL_CS47L92=3Dy
> > =

> > #
> > # Intel pinctrl drivers
> > #
> > # CONFIG_PINCTRL_BAYTRAIL is not set
> > CONFIG_PINCTRL_CHERRYVIEW=3Dm
> > CONFIG_PINCTRL_LYNXPOINT=3Dm
> > CONFIG_PINCTRL_INTEL=3Dy
> > CONFIG_PINCTRL_ALDERLAKE=3Dy
> > CONFIG_PINCTRL_BROXTON=3Dm
> > # CONFIG_PINCTRL_CANNONLAKE is not set
> > CONFIG_PINCTRL_CEDARFORK=3Dm
> > # CONFIG_PINCTRL_DENVERTON is not set
> > # CONFIG_PINCTRL_ELKHARTLAKE is not set
> > CONFIG_PINCTRL_EMMITSBURG=3Dm
> > # CONFIG_PINCTRL_GEMINILAKE is not set
> > CONFIG_PINCTRL_ICELAKE=3Dm
> > CONFIG_PINCTRL_JASPERLAKE=3Dm
> > CONFIG_PINCTRL_LAKEFIELD=3Dm
> > CONFIG_PINCTRL_LEWISBURG=3Dy
> > # CONFIG_PINCTRL_SUNRISEPOINT is not set
> > CONFIG_PINCTRL_TIGERLAKE=3Dm
> > # end of Intel pinctrl drivers
> > =

> > #
> > # Renesas pinctrl drivers
> > #
> > # end of Renesas pinctrl drivers
> > =

> > CONFIG_GPIOLIB=3Dy
> > CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> > CONFIG_OF_GPIO=3Dy
> > CONFIG_GPIO_ACPI=3Dy
> > CONFIG_GPIOLIB_IRQCHIP=3Dy
> > # CONFIG_DEBUG_GPIO is not set
> > CONFIG_GPIO_CDEV=3Dy
> > # CONFIG_GPIO_CDEV_V1 is not set
> > CONFIG_GPIO_GENERIC=3Dy
> > CONFIG_GPIO_MAX730X=3Dm
> > =

> > #
> > # Memory mapped GPIO drivers
> > #
> > CONFIG_GPIO_74XX_MMIO=3Dy
> > # CONFIG_GPIO_ALTERA is not set
> > # CONFIG_GPIO_AMDPT is not set
> > CONFIG_GPIO_CADENCE=3Dy
> > CONFIG_GPIO_DWAPB=3Dy
> > # CONFIG_GPIO_EXAR is not set
> > CONFIG_GPIO_FTGPIO010=3Dy
> > CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> > CONFIG_GPIO_GRGPIO=3Dy
> > CONFIG_GPIO_HLWD=3Dm
> > # CONFIG_GPIO_LOGICVC is not set
> > # CONFIG_GPIO_MB86S7X is not set
> > CONFIG_GPIO_MENZ127=3Dm
> > # CONFIG_GPIO_SAMA5D2_PIOBU is not set
> > CONFIG_GPIO_SIFIVE=3Dy
> > CONFIG_GPIO_SIOX=3Dy
> > CONFIG_GPIO_SYSCON=3Dm
> > # CONFIG_GPIO_VX855 is not set
> > CONFIG_GPIO_XILINX=3Dy
> > # CONFIG_GPIO_AMD_FCH is not set
> > # end of Memory mapped GPIO drivers
> > =

> > #
> > # Port-mapped I/O GPIO drivers
> > #
> > CONFIG_GPIO_F7188X=3Dy
> > # CONFIG_GPIO_IT87 is not set
> > CONFIG_GPIO_SCH311X=3Dy
> > CONFIG_GPIO_WINBOND=3Dm
> > CONFIG_GPIO_WS16C48=3Dm
> > # end of Port-mapped I/O GPIO drivers
> > =

> > #
> > # I2C GPIO expanders
> > #
> > CONFIG_GPIO_ADP5588=3Dm
> > CONFIG_GPIO_ADNP=3Dm
> > # CONFIG_GPIO_GW_PLD is not set
> > CONFIG_GPIO_MAX7300=3Dm
> > CONFIG_GPIO_MAX732X=3Dy
> > CONFIG_GPIO_MAX732X_IRQ=3Dy
> > CONFIG_GPIO_PCA953X=3Dy
> > CONFIG_GPIO_PCA953X_IRQ=3Dy
> > # CONFIG_GPIO_PCA9570 is not set
> > # CONFIG_GPIO_PCF857X is not set
> > CONFIG_GPIO_TPIC2810=3Dy
> > # end of I2C GPIO expanders
> > =

> > #
> > # MFD GPIO expanders
> > #
> > CONFIG_GPIO_ARIZONA=3Dy
> > CONFIG_GPIO_DA9052=3Dm
> > CONFIG_GPIO_DA9055=3Dy
> > CONFIG_GPIO_DLN2=3Dm
> > # CONFIG_GPIO_LP3943 is not set
> > # CONFIG_GPIO_MADERA is not set
> > # CONFIG_GPIO_MAX77620 is not set
> > CONFIG_GPIO_RC5T583=3Dy
> > # CONFIG_GPIO_STMPE is not set
> > CONFIG_GPIO_TPS65218=3Dy
> > CONFIG_GPIO_TPS65910=3Dy
> > CONFIG_GPIO_TPS65912=3Dy
> > CONFIG_GPIO_TWL6040=3Dy
> > CONFIG_GPIO_UCB1400=3Dm
> > CONFIG_GPIO_WM831X=3Dm
> > # end of MFD GPIO expanders
> > =

> > #
> > # PCI GPIO expanders
> > #
> > # CONFIG_GPIO_AMD8111 is not set
> > # CONFIG_GPIO_BT8XX is not set
> > # CONFIG_GPIO_ML_IOH is not set
> > # CONFIG_GPIO_PCH is not set
> > # CONFIG_GPIO_PCI_IDIO_16 is not set
> > # CONFIG_GPIO_PCIE_IDIO_24 is not set
> > # CONFIG_GPIO_RDC321X is not set
> > # CONFIG_GPIO_SODAVILLE is not set
> > # end of PCI GPIO expanders
> > =

> > #
> > # SPI GPIO expanders
> > #
> > CONFIG_GPIO_74X164=3Dy
> > # CONFIG_GPIO_MAX3191X is not set
> > # CONFIG_GPIO_MAX7301 is not set
> > CONFIG_GPIO_MC33880=3Dy
> > CONFIG_GPIO_PISOSR=3Dm
> > CONFIG_GPIO_XRA1403=3Dm
> > CONFIG_GPIO_MOXTET=3Dy
> > # end of SPI GPIO expanders
> > =

> > #
> > # USB GPIO expanders
> > #
> > CONFIG_GPIO_VIPERBOARD=3Dm
> > # end of USB GPIO expanders
> > =

> > #
> > # Virtual GPIO drivers
> > #
> > # CONFIG_GPIO_AGGREGATOR is not set
> > # CONFIG_GPIO_MOCKUP is not set
> > CONFIG_GPIO_VIRTIO=3Dy
> > CONFIG_GPIO_SIM=3Dm
> > # end of Virtual GPIO drivers
> > =

> > CONFIG_W1=3Dy
> > =

> > #
> > # 1-wire Bus Masters
> > #
> > # CONFIG_W1_MASTER_MATROX is not set
> > # CONFIG_W1_MASTER_DS2490 is not set
> > CONFIG_W1_MASTER_DS2482=3Dm
> > # CONFIG_W1_MASTER_DS1WM is not set
> > CONFIG_W1_MASTER_GPIO=3Dm
> > CONFIG_W1_MASTER_SGI=3Dy
> > # end of 1-wire Bus Masters
> > =

> > #
> > # 1-wire Slaves
> > #
> > CONFIG_W1_SLAVE_THERM=3Dy
> > CONFIG_W1_SLAVE_SMEM=3Dm
> > CONFIG_W1_SLAVE_DS2405=3Dm
> > CONFIG_W1_SLAVE_DS2408=3Dm
> > CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> > CONFIG_W1_SLAVE_DS2413=3Dy
> > CONFIG_W1_SLAVE_DS2406=3Dy
> > CONFIG_W1_SLAVE_DS2423=3Dy
> > # CONFIG_W1_SLAVE_DS2805 is not set
> > # CONFIG_W1_SLAVE_DS2430 is not set
> > CONFIG_W1_SLAVE_DS2431=3Dm
> > CONFIG_W1_SLAVE_DS2433=3Dm
> > # CONFIG_W1_SLAVE_DS2433_CRC is not set
> > # CONFIG_W1_SLAVE_DS2438 is not set
> > CONFIG_W1_SLAVE_DS250X=3Dy
> > # CONFIG_W1_SLAVE_DS2780 is not set
> > CONFIG_W1_SLAVE_DS2781=3Dy
> > CONFIG_W1_SLAVE_DS28E04=3Dy
> > # CONFIG_W1_SLAVE_DS28E17 is not set
> > # end of 1-wire Slaves
> > =

> > # CONFIG_POWER_RESET is not set
> > CONFIG_POWER_SUPPLY=3Dy
> > # CONFIG_POWER_SUPPLY_DEBUG is not set
> > CONFIG_PDA_POWER=3Dy
> > # CONFIG_GENERIC_ADC_BATTERY is not set
> > CONFIG_MAX8925_POWER=3Dy
> > CONFIG_WM831X_BACKUP=3Dy
> > CONFIG_WM831X_POWER=3Dy
> > # CONFIG_TEST_POWER is not set
> > # CONFIG_CHARGER_ADP5061 is not set
> > CONFIG_BATTERY_CW2015=3Dy
> > CONFIG_BATTERY_DS2760=3Dm
> > # CONFIG_BATTERY_DS2780 is not set
> > # CONFIG_BATTERY_DS2781 is not set
> > # CONFIG_BATTERY_DS2782 is not set
> > # CONFIG_BATTERY_OLPC is not set
> > # CONFIG_BATTERY_SBS is not set
> > CONFIG_CHARGER_SBS=3Dm
> > # CONFIG_MANAGER_SBS is not set
> > # CONFIG_BATTERY_BQ27XXX is not set
> > CONFIG_BATTERY_DA9052=3Dy
> > # CONFIG_BATTERY_MAX17040 is not set
> > CONFIG_BATTERY_MAX17042=3Dm
> > CONFIG_BATTERY_MAX1721X=3Dm
> > # CONFIG_CHARGER_PCF50633 is not set
> > CONFIG_CHARGER_ISP1704=3Dy
> > # CONFIG_CHARGER_MAX8903 is not set
> > CONFIG_CHARGER_LP8727=3Dy
> > CONFIG_CHARGER_GPIO=3Dy
> > # CONFIG_CHARGER_MANAGER is not set
> > # CONFIG_CHARGER_LT3651 is not set
> > CONFIG_CHARGER_LTC4162L=3Dm
> > CONFIG_CHARGER_MAX14577=3Dm
> > CONFIG_CHARGER_DETECTOR_MAX14656=3Dy
> > CONFIG_CHARGER_MAX77976=3Dm
> > CONFIG_CHARGER_BQ2415X=3Dy
> > CONFIG_CHARGER_BQ24190=3Dy
> > # CONFIG_CHARGER_BQ24257 is not set
> > CONFIG_CHARGER_BQ24735=3Dy
> > CONFIG_CHARGER_BQ2515X=3Dm
> > # CONFIG_CHARGER_BQ25890 is not set
> > CONFIG_CHARGER_BQ25980=3Dm
> > CONFIG_CHARGER_BQ256XX=3Dm
> > CONFIG_CHARGER_SMB347=3Dm
> > # CONFIG_CHARGER_TPS65090 is not set
> > CONFIG_CHARGER_TPS65217=3Dm
> > CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> > CONFIG_BATTERY_GOLDFISH=3Dy
> > CONFIG_BATTERY_RT5033=3Dm
> > CONFIG_CHARGER_RT9455=3Dy
> > # CONFIG_CHARGER_CROS_PCHG is not set
> > CONFIG_CHARGER_UCS1002=3Dm
> > CONFIG_CHARGER_BD99954=3Dy
> > CONFIG_CHARGER_WILCO=3Dm
> > CONFIG_RN5T618_POWER=3Dm
> > # CONFIG_HWMON is not set
> > CONFIG_THERMAL=3Dy
> > # CONFIG_THERMAL_NETLINK is not set
> > # CONFIG_THERMAL_STATISTICS is not set
> > CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> > CONFIG_THERMAL_OF=3Dy
> > # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> > CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> > # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> > CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> > CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> > # CONFIG_THERMAL_GOV_USER_SPACE is not set
> > CONFIG_CPU_THERMAL=3Dy
> > # CONFIG_CPU_FREQ_THERMAL is not set
> > CONFIG_DEVFREQ_THERMAL=3Dy
> > # CONFIG_THERMAL_EMULATION is not set
> > CONFIG_THERMAL_MMIO=3Dm
> > CONFIG_MAX77620_THERMAL=3Dm
> > =

> > #
> > # Intel thermal drivers
> > #
> > # CONFIG_INTEL_POWERCLAMP is not set
> > # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> > =

> > #
> > # ACPI INT340X thermal drivers
> > #
> > # end of ACPI INT340X thermal drivers
> > =

> > # CONFIG_INTEL_PCH_THERMAL is not set
> > CONFIG_INTEL_TCC_COOLING=3Dm
> > # end of Intel thermal drivers
> > =

> > CONFIG_GENERIC_ADC_THERMAL=3Dy
> > # CONFIG_WATCHDOG is not set
> > CONFIG_SSB_POSSIBLE=3Dy
> > CONFIG_SSB=3Dy
> > CONFIG_SSB_SPROM=3Dy
> > CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> > CONFIG_SSB_PCIHOST=3Dy
> > CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> > # CONFIG_SSB_DRIVER_PCICORE is not set
> > # CONFIG_SSB_DRIVER_GPIO is not set
> > CONFIG_BCMA_POSSIBLE=3Dy
> > CONFIG_BCMA=3Dy
> > CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > CONFIG_BCMA_HOST_PCI=3Dy
> > CONFIG_BCMA_HOST_SOC=3Dy
> > CONFIG_BCMA_DRIVER_PCI=3Dy
> > CONFIG_BCMA_SFLASH=3Dy
> > CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> > CONFIG_BCMA_DRIVER_GPIO=3Dy
> > # CONFIG_BCMA_DEBUG is not set
> > =

> > #
> > # Multifunction device drivers
> > #
> > CONFIG_MFD_CORE=3Dy
> > # CONFIG_MFD_CS5535 is not set
> > # CONFIG_MFD_ACT8945A is not set
> > CONFIG_MFD_AS3711=3Dy
> > CONFIG_MFD_AS3722=3Dy
> > # CONFIG_PMIC_ADP5520 is not set
> > CONFIG_MFD_AAT2870_CORE=3Dy
> > CONFIG_MFD_ATMEL_FLEXCOM=3Dy
> > # CONFIG_MFD_ATMEL_HLCDC is not set
> > # CONFIG_MFD_BCM590XX is not set
> > # CONFIG_MFD_BD9571MWV is not set
> > # CONFIG_MFD_AXP20X_I2C is not set
> > CONFIG_MFD_CROS_EC_DEV=3Dm
> > CONFIG_MFD_MADERA=3Dm
> > CONFIG_MFD_MADERA_I2C=3Dm
> > # CONFIG_MFD_MADERA_SPI is not set
> > # CONFIG_MFD_CS47L15 is not set
> > # CONFIG_MFD_CS47L35 is not set
> > CONFIG_MFD_CS47L85=3Dy
> > CONFIG_MFD_CS47L90=3Dy
> > CONFIG_MFD_CS47L92=3Dy
> > # CONFIG_PMIC_DA903X is not set
> > CONFIG_PMIC_DA9052=3Dy
> > CONFIG_MFD_DA9052_SPI=3Dy
> > # CONFIG_MFD_DA9052_I2C is not set
> > CONFIG_MFD_DA9055=3Dy
> > # CONFIG_MFD_DA9062 is not set
> > # CONFIG_MFD_DA9063 is not set
> > # CONFIG_MFD_DA9150 is not set
> > CONFIG_MFD_DLN2=3Dy
> > CONFIG_MFD_GATEWORKS_GSC=3Dy
> > CONFIG_MFD_MC13XXX=3Dy
> > CONFIG_MFD_MC13XXX_SPI=3Dy
> > CONFIG_MFD_MC13XXX_I2C=3Dm
> > CONFIG_MFD_MP2629=3Dy
> > CONFIG_MFD_HI6421_PMIC=3Dy
> > CONFIG_MFD_HI6421_SPMI=3Dy
> > CONFIG_HTC_PASIC3=3Dm
> > CONFIG_HTC_I2CPLD=3Dy
> > # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> > # CONFIG_LPC_ICH is not set
> > # CONFIG_LPC_SCH is not set
> > # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> > # CONFIG_MFD_INTEL_LPSS_PCI is not set
> > CONFIG_MFD_IQS62X=3Dm
> > # CONFIG_MFD_JANZ_CMODIO is not set
> > # CONFIG_MFD_KEMPLD is not set
> > CONFIG_MFD_88PM800=3Dm
> > CONFIG_MFD_88PM805=3Dm
> > # CONFIG_MFD_88PM860X is not set
> > CONFIG_MFD_MAX14577=3Dm
> > CONFIG_MFD_MAX77620=3Dy
> > # CONFIG_MFD_MAX77650 is not set
> > CONFIG_MFD_MAX77686=3Dm
> > # CONFIG_MFD_MAX77693 is not set
> > CONFIG_MFD_MAX77843=3Dy
> > CONFIG_MFD_MAX8907=3Dm
> > CONFIG_MFD_MAX8925=3Dy
> > # CONFIG_MFD_MAX8997 is not set
> > CONFIG_MFD_MAX8998=3Dy
> > # CONFIG_MFD_MT6360 is not set
> > CONFIG_MFD_MT6397=3Dm
> > CONFIG_MFD_MENF21BMC=3Dm
> > CONFIG_EZX_PCAP=3Dy
> > # CONFIG_MFD_CPCAP is not set
> > CONFIG_MFD_VIPERBOARD=3Dm
> > CONFIG_MFD_NTXEC=3Dy
> > CONFIG_MFD_RETU=3Dy
> > CONFIG_MFD_PCF50633=3Dy
> > CONFIG_PCF50633_ADC=3Dy
> > CONFIG_PCF50633_GPIO=3Dy
> > CONFIG_UCB1400_CORE=3Dm
> > # CONFIG_MFD_RDC321X is not set
> > CONFIG_MFD_RT4831=3Dy
> > CONFIG_MFD_RT5033=3Dy
> > CONFIG_MFD_RC5T583=3Dy
> > # CONFIG_MFD_RK808 is not set
> > CONFIG_MFD_RN5T618=3Dm
> > # CONFIG_MFD_SEC_CORE is not set
> > CONFIG_MFD_SI476X_CORE=3Dy
> > CONFIG_MFD_SM501=3Dm
> > # CONFIG_MFD_SM501_GPIO is not set
> > CONFIG_MFD_SKY81452=3Dm
> > CONFIG_MFD_STMPE=3Dy
> > =

> > #
> > # STMicroelectronics STMPE Interface Drivers
> > #
> > # CONFIG_STMPE_I2C is not set
> > # CONFIG_STMPE_SPI is not set
> > # end of STMicroelectronics STMPE Interface Drivers
> > =

> > CONFIG_MFD_SYSCON=3Dy
> > # CONFIG_MFD_TI_AM335X_TSCADC is not set
> > CONFIG_MFD_LP3943=3Dy
> > # CONFIG_MFD_LP8788 is not set
> > CONFIG_MFD_TI_LMU=3Dm
> > # CONFIG_MFD_PALMAS is not set
> > # CONFIG_TPS6105X is not set
> > # CONFIG_TPS65010 is not set
> > CONFIG_TPS6507X=3Dm
> > # CONFIG_MFD_TPS65086 is not set
> > CONFIG_MFD_TPS65090=3Dy
> > CONFIG_MFD_TPS65217=3Dy
> > # CONFIG_MFD_TI_LP873X is not set
> > # CONFIG_MFD_TI_LP87565 is not set
> > CONFIG_MFD_TPS65218=3Dy
> > # CONFIG_MFD_TPS6586X is not set
> > CONFIG_MFD_TPS65910=3Dy
> > CONFIG_MFD_TPS65912=3Dy
> > # CONFIG_MFD_TPS65912_I2C is not set
> > CONFIG_MFD_TPS65912_SPI=3Dy
> > # CONFIG_TWL4030_CORE is not set
> > CONFIG_TWL6040_CORE=3Dy
> > # CONFIG_MFD_WL1273_CORE is not set
> > CONFIG_MFD_LM3533=3Dm
> > # CONFIG_MFD_TIMBERDALE is not set
> > # CONFIG_MFD_TC3589X is not set
> > # CONFIG_MFD_TQMX86 is not set
> > # CONFIG_MFD_VX855 is not set
> > CONFIG_MFD_LOCHNAGAR=3Dy
> > CONFIG_MFD_ARIZONA=3Dy
> > # CONFIG_MFD_ARIZONA_I2C is not set
> > CONFIG_MFD_ARIZONA_SPI=3Dy
> > # CONFIG_MFD_CS47L24 is not set
> > CONFIG_MFD_WM5102=3Dy
> > CONFIG_MFD_WM5110=3Dy
> > # CONFIG_MFD_WM8997 is not set
> > CONFIG_MFD_WM8998=3Dy
> > # CONFIG_MFD_WM8400 is not set
> > CONFIG_MFD_WM831X=3Dy
> > CONFIG_MFD_WM831X_I2C=3Dy
> > CONFIG_MFD_WM831X_SPI=3Dy
> > # CONFIG_MFD_WM8350_I2C is not set
> > # CONFIG_MFD_WM8994 is not set
> > # CONFIG_MFD_ROHM_BD718XX is not set
> > # CONFIG_MFD_ROHM_BD71828 is not set
> > CONFIG_MFD_ROHM_BD957XMUF=3Dy
> > CONFIG_MFD_STPMIC1=3Dm
> > CONFIG_MFD_STMFX=3Dy
> > # CONFIG_MFD_WCD934X is not set
> > CONFIG_MFD_ATC260X=3Dy
> > CONFIG_MFD_ATC260X_I2C=3Dy
> > CONFIG_MFD_QCOM_PM8008=3Dm
> > CONFIG_RAVE_SP_CORE=3Dy
> > # CONFIG_MFD_INTEL_M10_BMC is not set
> > # CONFIG_MFD_RSMU_I2C is not set
> > CONFIG_MFD_RSMU_SPI=3Dm
> > # end of Multifunction device drivers
> > =

> > CONFIG_REGULATOR=3Dy
> > CONFIG_REGULATOR_DEBUG=3Dy
> > # CONFIG_REGULATOR_FIXED_VOLTAGE is not set
> > # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> > CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dm
> > CONFIG_REGULATOR_88PG86X=3Dm
> > CONFIG_REGULATOR_88PM800=3Dm
> > # CONFIG_REGULATOR_ACT8865 is not set
> > CONFIG_REGULATOR_AD5398=3Dm
> > CONFIG_REGULATOR_AAT2870=3Dy
> > # CONFIG_REGULATOR_ARIZONA_LDO1 is not set
> > CONFIG_REGULATOR_ARIZONA_MICSUPP=3Dm
> > CONFIG_REGULATOR_AS3711=3Dm
> > CONFIG_REGULATOR_AS3722=3Dy
> > CONFIG_REGULATOR_ATC260X=3Dy
> > CONFIG_REGULATOR_BD957XMUF=3Dy
> > # CONFIG_REGULATOR_CROS_EC is not set
> > CONFIG_REGULATOR_DA9052=3Dm
> > # CONFIG_REGULATOR_DA9055 is not set
> > # CONFIG_REGULATOR_DA9121 is not set
> > CONFIG_REGULATOR_DA9210=3Dm
> > # CONFIG_REGULATOR_DA9211 is not set
> > CONFIG_REGULATOR_FAN53555=3Dy
> > CONFIG_REGULATOR_FAN53880=3Dy
> > CONFIG_REGULATOR_GPIO=3Dy
> > CONFIG_REGULATOR_HI6421=3Dy
> > CONFIG_REGULATOR_HI6421V530=3Dy
> > CONFIG_REGULATOR_HI6421V600=3Dm
> > # CONFIG_REGULATOR_ISL9305 is not set
> > CONFIG_REGULATOR_ISL6271A=3Dy
> > CONFIG_REGULATOR_LM363X=3Dm
> > CONFIG_REGULATOR_LOCHNAGAR=3Dm
> > # CONFIG_REGULATOR_LP3971 is not set
> > # CONFIG_REGULATOR_LP3972 is not set
> > CONFIG_REGULATOR_LP872X=3Dm
> > # CONFIG_REGULATOR_LP8755 is not set
> > CONFIG_REGULATOR_LTC3589=3Dy
> > # CONFIG_REGULATOR_LTC3676 is not set
> > # CONFIG_REGULATOR_MAX14577 is not set
> > CONFIG_REGULATOR_MAX1586=3Dm
> > CONFIG_REGULATOR_MAX77620=3Dy
> > # CONFIG_REGULATOR_MAX8649 is not set
> > CONFIG_REGULATOR_MAX8660=3Dm
> > # CONFIG_REGULATOR_MAX8893 is not set
> > CONFIG_REGULATOR_MAX8907=3Dm
> > CONFIG_REGULATOR_MAX8925=3Dy
> > # CONFIG_REGULATOR_MAX8952 is not set
> > CONFIG_REGULATOR_MAX8973=3Dm
> > # CONFIG_REGULATOR_MAX8998 is not set
> > CONFIG_REGULATOR_MAX20086=3Dm
> > CONFIG_REGULATOR_MAX77686=3Dm
> > # CONFIG_REGULATOR_MAX77693 is not set
> > # CONFIG_REGULATOR_MAX77802 is not set
> > CONFIG_REGULATOR_MAX77826=3Dm
> > # CONFIG_REGULATOR_MC13783 is not set
> > # CONFIG_REGULATOR_MC13892 is not set
> > # CONFIG_REGULATOR_MCP16502 is not set
> > CONFIG_REGULATOR_MP5416=3Dy
> > # CONFIG_REGULATOR_MP8859 is not set
> > # CONFIG_REGULATOR_MP886X is not set
> > CONFIG_REGULATOR_MPQ7920=3Dy
> > # CONFIG_REGULATOR_MT6311 is not set
> > CONFIG_REGULATOR_MT6315=3Dy
> > CONFIG_REGULATOR_MT6323=3Dm
> > # CONFIG_REGULATOR_MT6358 is not set
> > CONFIG_REGULATOR_MT6359=3Dm
> > CONFIG_REGULATOR_MT6397=3Dm
> > # CONFIG_REGULATOR_PCA9450 is not set
> > # CONFIG_REGULATOR_PCAP is not set
> > # CONFIG_REGULATOR_PCF50633 is not set
> > CONFIG_REGULATOR_PF8X00=3Dy
> > # CONFIG_REGULATOR_PFUZE100 is not set
> > # CONFIG_REGULATOR_PV88060 is not set
> > CONFIG_REGULATOR_PV88080=3Dy
> > CONFIG_REGULATOR_PV88090=3Dy
> > CONFIG_REGULATOR_QCOM_SPMI=3Dm
> > # CONFIG_REGULATOR_QCOM_USB_VBUS is not set
> > CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=3Dm
> > CONFIG_REGULATOR_RC5T583=3Dm
> > CONFIG_REGULATOR_RN5T618=3Dm
> > CONFIG_REGULATOR_RT4801=3Dy
> > # CONFIG_REGULATOR_RT4831 is not set
> > CONFIG_REGULATOR_RT5033=3Dm
> > # CONFIG_REGULATOR_RT6160 is not set
> > CONFIG_REGULATOR_RT6245=3Dm
> > # CONFIG_REGULATOR_RTQ2134 is not set
> > CONFIG_REGULATOR_RTMV20=3Dm
> > CONFIG_REGULATOR_RTQ6752=3Dy
> > # CONFIG_REGULATOR_SKY81452 is not set
> > CONFIG_REGULATOR_SLG51000=3Dm
> > CONFIG_REGULATOR_STPMIC1=3Dm
> > CONFIG_REGULATOR_SY8106A=3Dy
> > CONFIG_REGULATOR_SY8824X=3Dm
> > CONFIG_REGULATOR_SY8827N=3Dm
> > CONFIG_REGULATOR_TPS51632=3Dy
> > # CONFIG_REGULATOR_TPS62360 is not set
> > CONFIG_REGULATOR_TPS65023=3Dy
> > CONFIG_REGULATOR_TPS6507X=3Dy
> > CONFIG_REGULATOR_TPS65090=3Dm
> > CONFIG_REGULATOR_TPS65132=3Dm
> > CONFIG_REGULATOR_TPS65217=3Dy
> > # CONFIG_REGULATOR_TPS65218 is not set
> > # CONFIG_REGULATOR_TPS6524X is not set
> > CONFIG_REGULATOR_TPS65910=3Dm
> > CONFIG_REGULATOR_TPS65912=3Dm
> > # CONFIG_REGULATOR_VCTRL is not set
> > CONFIG_REGULATOR_WM831X=3Dy
> > CONFIG_REGULATOR_QCOM_LABIBB=3Dm
> > CONFIG_RC_CORE=3Dy
> > CONFIG_RC_MAP=3Dm
> > # CONFIG_LIRC is not set
> > # CONFIG_RC_DECODERS is not set
> > # CONFIG_RC_DEVICES is not set
> > CONFIG_CEC_CORE=3Dm
> > CONFIG_CEC_NOTIFIER=3Dy
> > =

> > #
> > # CEC support
> > #
> > CONFIG_MEDIA_CEC_RC=3Dy
> > # CONFIG_MEDIA_CEC_SUPPORT is not set
> > # end of CEC support
> > =

> > CONFIG_MEDIA_SUPPORT=3Dm
> > CONFIG_MEDIA_SUPPORT_FILTER=3Dy
> > # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> > =

> > #
> > # Media device types
> > #
> > CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> > # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> > CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> > CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> > # CONFIG_MEDIA_SDR_SUPPORT is not set
> > # CONFIG_MEDIA_PLATFORM_SUPPORT is not set
> > # CONFIG_MEDIA_TEST_SUPPORT is not set
> > # end of Media device types
> > =

> > CONFIG_VIDEO_DEV=3Dm
> > CONFIG_MEDIA_CONTROLLER=3Dy
> > CONFIG_DVB_CORE=3Dm
> > =

> > #
> > # Video4Linux options
> > #
> > CONFIG_VIDEO_V4L2=3Dm
> > CONFIG_VIDEO_V4L2_I2C=3Dy
> > CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> > CONFIG_VIDEO_ADV_DEBUG=3Dy
> > # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> > CONFIG_VIDEO_TUNER=3Dm
> > CONFIG_V4L2_FLASH_LED_CLASS=3Dm
> > CONFIG_V4L2_FWNODE=3Dm
> > CONFIG_V4L2_ASYNC=3Dm
> > CONFIG_VIDEOBUF_GEN=3Dm
> > CONFIG_VIDEOBUF_VMALLOC=3Dm
> > # end of Video4Linux options
> > =

> > #
> > # Media controller options
> > #
> > CONFIG_MEDIA_CONTROLLER_DVB=3Dy
> > # end of Media controller options
> > =

> > #
> > # Digital TV options
> > #
> > # CONFIG_DVB_MMAP is not set
> > CONFIG_DVB_NET=3Dy
> > CONFIG_DVB_MAX_ADAPTERS=3D16
> > CONFIG_DVB_DYNAMIC_MINORS=3Dy
> > # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> > # CONFIG_DVB_ULE_DEBUG is not set
> > # end of Digital TV options
> > =

> > #
> > # Media drivers
> > #
> > =

> > #
> > # Drivers filtered as selected at 'Filter media drivers'
> > #
> > CONFIG_MEDIA_USB_SUPPORT=3Dy
> > =

> > #
> > # Webcam devices
> > #
> > # CONFIG_USB_VIDEO_CLASS is not set
> > CONFIG_USB_GSPCA=3Dm
> > CONFIG_USB_M5602=3Dm
> > # CONFIG_USB_STV06XX is not set
> > CONFIG_USB_GL860=3Dm
> > # CONFIG_USB_GSPCA_BENQ is not set
> > CONFIG_USB_GSPCA_CONEX=3Dm
> > # CONFIG_USB_GSPCA_CPIA1 is not set
> > # CONFIG_USB_GSPCA_DTCS033 is not set
> > # CONFIG_USB_GSPCA_ETOMS is not set
> > CONFIG_USB_GSPCA_FINEPIX=3Dm
> > # CONFIG_USB_GSPCA_JEILINJ is not set
> > # CONFIG_USB_GSPCA_JL2005BCD is not set
> > CONFIG_USB_GSPCA_KINECT=3Dm
> > CONFIG_USB_GSPCA_KONICA=3Dm
> > # CONFIG_USB_GSPCA_MARS is not set
> > # CONFIG_USB_GSPCA_MR97310A is not set
> > # CONFIG_USB_GSPCA_NW80X is not set
> > CONFIG_USB_GSPCA_OV519=3Dm
> > CONFIG_USB_GSPCA_OV534=3Dm
> > CONFIG_USB_GSPCA_OV534_9=3Dm
> > CONFIG_USB_GSPCA_PAC207=3Dm
> > CONFIG_USB_GSPCA_PAC7302=3Dm
> > # CONFIG_USB_GSPCA_PAC7311 is not set
> > # CONFIG_USB_GSPCA_SE401 is not set
> > # CONFIG_USB_GSPCA_SN9C2028 is not set
> > CONFIG_USB_GSPCA_SN9C20X=3Dm
> > CONFIG_USB_GSPCA_SONIXB=3Dm
> > CONFIG_USB_GSPCA_SONIXJ=3Dm
> > CONFIG_USB_GSPCA_SPCA500=3Dm
> > # CONFIG_USB_GSPCA_SPCA501 is not set
> > CONFIG_USB_GSPCA_SPCA505=3Dm
> > CONFIG_USB_GSPCA_SPCA506=3Dm
> > CONFIG_USB_GSPCA_SPCA508=3Dm
> > CONFIG_USB_GSPCA_SPCA561=3Dm
> > CONFIG_USB_GSPCA_SPCA1528=3Dm
> > # CONFIG_USB_GSPCA_SQ905 is not set
> > CONFIG_USB_GSPCA_SQ905C=3Dm
> > CONFIG_USB_GSPCA_SQ930X=3Dm
> > CONFIG_USB_GSPCA_STK014=3Dm
> > CONFIG_USB_GSPCA_STK1135=3Dm
> > CONFIG_USB_GSPCA_STV0680=3Dm
> > CONFIG_USB_GSPCA_SUNPLUS=3Dm
> > # CONFIG_USB_GSPCA_T613 is not set
> > CONFIG_USB_GSPCA_TOPRO=3Dm
> > CONFIG_USB_GSPCA_TOUPTEK=3Dm
> > # CONFIG_USB_GSPCA_TV8532 is not set
> > CONFIG_USB_GSPCA_VC032X=3Dm
> > # CONFIG_USB_GSPCA_VICAM is not set
> > CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
> > # CONFIG_USB_GSPCA_ZC3XX is not set
> > CONFIG_USB_PWC=3Dm
> > CONFIG_USB_PWC_DEBUG=3Dy
> > # CONFIG_USB_PWC_INPUT_EVDEV is not set
> > # CONFIG_VIDEO_CPIA2 is not set
> > CONFIG_USB_ZR364XX=3Dm
> > # CONFIG_USB_STKWEBCAM is not set
> > # CONFIG_USB_S2255 is not set
> > CONFIG_VIDEO_USBTV=3Dm
> > =

> > #
> > # Analog/digital TV USB devices
> > #
> > CONFIG_VIDEO_AU0828=3Dm
> > CONFIG_VIDEO_AU0828_V4L2=3Dy
> > CONFIG_VIDEO_AU0828_RC=3Dy
> > CONFIG_VIDEO_CX231XX=3Dm
> > CONFIG_VIDEO_CX231XX_RC=3Dy
> > CONFIG_VIDEO_CX231XX_ALSA=3Dm
> > CONFIG_VIDEO_CX231XX_DVB=3Dm
> > CONFIG_VIDEO_TM6000=3Dm
> > # CONFIG_VIDEO_TM6000_ALSA is not set
> > CONFIG_VIDEO_TM6000_DVB=3Dm
> > =

> > #
> > # Digital TV USB devices
> > #
> > CONFIG_DVB_USB=3Dm
> > CONFIG_DVB_USB_DEBUG=3Dy
> > CONFIG_DVB_USB_DIB3000MC=3Dm
> > CONFIG_DVB_USB_A800=3Dm
> > CONFIG_DVB_USB_DIBUSB_MB=3Dm
> > CONFIG_DVB_USB_DIBUSB_MB_FAULTY=3Dy
> > CONFIG_DVB_USB_DIBUSB_MC=3Dm
> > # CONFIG_DVB_USB_DIB0700 is not set
> > CONFIG_DVB_USB_UMT_010=3Dm
> > CONFIG_DVB_USB_CXUSB=3Dm
> > # CONFIG_DVB_USB_CXUSB_ANALOG is not set
> > CONFIG_DVB_USB_M920X=3Dm
> > # CONFIG_DVB_USB_DIGITV is not set
> > # CONFIG_DVB_USB_VP7045 is not set
> > CONFIG_DVB_USB_VP702X=3Dm
> > # CONFIG_DVB_USB_GP8PSK is not set
> > CONFIG_DVB_USB_NOVA_T_USB2=3Dm
> > CONFIG_DVB_USB_TTUSB2=3Dm
> > CONFIG_DVB_USB_DTT200U=3Dm
> > # CONFIG_DVB_USB_OPERA1 is not set
> > CONFIG_DVB_USB_AF9005=3Dm
> > CONFIG_DVB_USB_AF9005_REMOTE=3Dm
> > CONFIG_DVB_USB_PCTV452E=3Dm
> > CONFIG_DVB_USB_DW2102=3Dm
> > # CONFIG_DVB_USB_CINERGY_T2 is not set
> > CONFIG_DVB_USB_DTV5100=3Dm
> > CONFIG_DVB_USB_AZ6027=3Dm
> > # CONFIG_DVB_USB_TECHNISAT_USB2 is not set
> > # CONFIG_DVB_USB_V2 is not set
> > # CONFIG_DVB_TTUSB_BUDGET is not set
> > # CONFIG_DVB_TTUSB_DEC is not set
> > CONFIG_SMS_USB_DRV=3Dm
> > CONFIG_DVB_B2C2_FLEXCOP_USB=3Dm
> > # CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
> > # CONFIG_DVB_AS102 is not set
> > =

> > #
> > # Webcam, TV (analog/digital) USB devices
> > #
> > CONFIG_VIDEO_EM28XX=3Dm
> > CONFIG_VIDEO_EM28XX_V4L2=3Dm
> > CONFIG_VIDEO_EM28XX_ALSA=3Dm
> > CONFIG_VIDEO_EM28XX_DVB=3Dm
> > CONFIG_VIDEO_EM28XX_RC=3Dm
> > # CONFIG_MEDIA_PCI_SUPPORT is not set
> > CONFIG_RADIO_ADAPTERS=3Dy
> > CONFIG_RADIO_TEA575X=3Dm
> > CONFIG_RADIO_SI470X=3Dm
> > CONFIG_USB_SI470X=3Dm
> > # CONFIG_I2C_SI470X is not set
> > # CONFIG_RADIO_SI4713 is not set
> > CONFIG_RADIO_SI476X=3Dm
> > CONFIG_USB_MR800=3Dm
> > CONFIG_USB_DSBR=3Dm
> > # CONFIG_RADIO_MAXIRADIO is not set
> > CONFIG_RADIO_SHARK=3Dm
> > CONFIG_RADIO_SHARK2=3Dm
> > # CONFIG_USB_KEENE is not set
> > CONFIG_USB_RAREMONO=3Dm
> > CONFIG_USB_MA901=3Dm
> > # CONFIG_RADIO_TEA5764 is not set
> > # CONFIG_RADIO_SAA7706H is not set
> > CONFIG_RADIO_TEF6862=3Dm
> > # CONFIG_RADIO_WL1273 is not set
> > CONFIG_V4L_RADIO_ISA_DRIVERS=3Dy
> > CONFIG_RADIO_ISA=3Dm
> > CONFIG_RADIO_CADET=3Dm
> > # CONFIG_RADIO_RTRACK is not set
> > # CONFIG_RADIO_RTRACK2 is not set
> > # CONFIG_RADIO_AZTECH is not set
> > # CONFIG_RADIO_GEMTEK is not set
> > # CONFIG_RADIO_MIROPCM20 is not set
> > CONFIG_RADIO_SF16FMI=3Dm
> > CONFIG_RADIO_SF16FMR2=3Dm
> > # CONFIG_RADIO_TERRATEC is not set
> > # CONFIG_RADIO_TRUST is not set
> > CONFIG_RADIO_TYPHOON=3Dm
> > CONFIG_RADIO_ZOLTRIX=3Dm
> > CONFIG_MEDIA_COMMON_OPTIONS=3Dy
> > =

> > #
> > # common driver options
> > #
> > CONFIG_VIDEO_CX2341X=3Dm
> > CONFIG_VIDEO_TVEEPROM=3Dm
> > CONFIG_TTPCI_EEPROM=3Dm
> > CONFIG_CYPRESS_FIRMWARE=3Dm
> > CONFIG_VIDEOBUF2_CORE=3Dm
> > CONFIG_VIDEOBUF2_V4L2=3Dm
> > CONFIG_VIDEOBUF2_MEMOPS=3Dm
> > CONFIG_VIDEOBUF2_VMALLOC=3Dm
> > CONFIG_VIDEOBUF2_DMA_SG=3Dm
> > CONFIG_DVB_B2C2_FLEXCOP=3Dm
> > CONFIG_SMS_SIANO_MDTV=3Dm
> > CONFIG_SMS_SIANO_RC=3Dy
> > =

> > #
> > # FireWire (IEEE 1394) Adapters
> > #
> > CONFIG_DVB_FIREDTV=3Dm
> > CONFIG_DVB_FIREDTV_INPUT=3Dy
> > # end of Media drivers
> > =

> > #
> > # Media ancillary drivers
> > #
> > CONFIG_MEDIA_ATTACH=3Dy
> > # CONFIG_VIDEO_IR_I2C is not set
> > =

> > #
> > # Audio decoders, processors and mixers
> > #
> > CONFIG_VIDEO_TVAUDIO=3Dm
> > CONFIG_VIDEO_TDA7432=3Dm
> > # CONFIG_VIDEO_TDA9840 is not set
> > CONFIG_VIDEO_TDA1997X=3Dm
> > CONFIG_VIDEO_TEA6415C=3Dm
> > CONFIG_VIDEO_TEA6420=3Dm
> > CONFIG_VIDEO_MSP3400=3Dm
> > CONFIG_VIDEO_CS3308=3Dm
> > # CONFIG_VIDEO_CS5345 is not set
> > CONFIG_VIDEO_CS53L32A=3Dm
> > CONFIG_VIDEO_TLV320AIC23B=3Dm
> > CONFIG_VIDEO_UDA1342=3Dm
> > # CONFIG_VIDEO_WM8775 is not set
> > CONFIG_VIDEO_WM8739=3Dm
> > # CONFIG_VIDEO_VP27SMPX is not set
> > CONFIG_VIDEO_SONY_BTF_MPX=3Dm
> > # end of Audio decoders, processors and mixers
> > =

> > #
> > # RDS decoders
> > #
> > CONFIG_VIDEO_SAA6588=3Dm
> > # end of RDS decoders
> > =

> > #
> > # Video decoders
> > #
> > CONFIG_VIDEO_ADV7180=3Dm
> > # CONFIG_VIDEO_ADV7183 is not set
> > CONFIG_VIDEO_ADV748X=3Dm
> > CONFIG_VIDEO_ADV7604=3Dm
> > # CONFIG_VIDEO_ADV7604_CEC is not set
> > CONFIG_VIDEO_ADV7842=3Dm
> > CONFIG_VIDEO_ADV7842_CEC=3Dy
> > CONFIG_VIDEO_BT819=3Dm
> > # CONFIG_VIDEO_BT856 is not set
> > CONFIG_VIDEO_BT866=3Dm
> > CONFIG_VIDEO_KS0127=3Dm
> > CONFIG_VIDEO_ML86V7667=3Dm
> > CONFIG_VIDEO_SAA7110=3Dm
> > CONFIG_VIDEO_SAA711X=3Dm
> > # CONFIG_VIDEO_TC358743 is not set
> > # CONFIG_VIDEO_TVP514X is not set
> > # CONFIG_VIDEO_TVP5150 is not set
> > # CONFIG_VIDEO_TVP7002 is not set
> > # CONFIG_VIDEO_TW2804 is not set
> > CONFIG_VIDEO_TW9903=3Dm
> > # CONFIG_VIDEO_TW9906 is not set
> > CONFIG_VIDEO_TW9910=3Dm
> > CONFIG_VIDEO_VPX3220=3Dm
> > CONFIG_VIDEO_MAX9286=3Dm
> > =

> > #
> > # Video and audio decoders
> > #
> > CONFIG_VIDEO_SAA717X=3Dm
> > CONFIG_VIDEO_CX25840=3Dm
> > # end of Video decoders
> > =

> > #
> > # Video encoders
> > #
> > CONFIG_VIDEO_SAA7127=3Dm
> > CONFIG_VIDEO_SAA7185=3Dm
> > CONFIG_VIDEO_ADV7170=3Dm
> > CONFIG_VIDEO_ADV7175=3Dm
> > CONFIG_VIDEO_ADV7343=3Dm
> > CONFIG_VIDEO_ADV7393=3Dm
> > CONFIG_VIDEO_AD9389B=3Dm
> > # CONFIG_VIDEO_AK881X is not set
> > CONFIG_VIDEO_THS8200=3Dm
> > # end of Video encoders
> > =

> > #
> > # Video improvement chips
> > #
> > CONFIG_VIDEO_UPD64031A=3Dm
> > CONFIG_VIDEO_UPD64083=3Dm
> > # end of Video improvement chips
> > =

> > #
> > # Audio/Video compression chips
> > #
> > CONFIG_VIDEO_SAA6752HS=3Dm
> > # end of Audio/Video compression chips
> > =

> > #
> > # SDR tuner chips
> > #
> > # end of SDR tuner chips
> > =

> > #
> > # Miscellaneous helper chips
> > #
> > CONFIG_VIDEO_THS7303=3Dm
> > # CONFIG_VIDEO_M52790 is not set
> > # CONFIG_VIDEO_I2C is not set
> > # CONFIG_VIDEO_ST_MIPID02 is not set
> > # end of Miscellaneous helper chips
> > =

> > #
> > # Camera sensor devices
> > #
> > CONFIG_VIDEO_APTINA_PLL=3Dm
> > CONFIG_VIDEO_CCS_PLL=3Dm
> > CONFIG_VIDEO_HI556=3Dm
> > CONFIG_VIDEO_HI846=3Dm
> > # CONFIG_VIDEO_IMX208 is not set
> > CONFIG_VIDEO_IMX214=3Dm
> > CONFIG_VIDEO_IMX219=3Dm
> > # CONFIG_VIDEO_IMX258 is not set
> > # CONFIG_VIDEO_IMX274 is not set
> > CONFIG_VIDEO_IMX290=3Dm
> > # CONFIG_VIDEO_IMX319 is not set
> > # CONFIG_VIDEO_IMX334 is not set
> > CONFIG_VIDEO_IMX335=3Dm
> > CONFIG_VIDEO_IMX355=3Dm
> > CONFIG_VIDEO_IMX412=3Dm
> > CONFIG_VIDEO_OV02A10=3Dm
> > # CONFIG_VIDEO_OV2640 is not set
> > # CONFIG_VIDEO_OV2659 is not set
> > CONFIG_VIDEO_OV2680=3Dm
> > CONFIG_VIDEO_OV2685=3Dm
> > CONFIG_VIDEO_OV2740=3Dm
> > CONFIG_VIDEO_OV5640=3Dm
> > CONFIG_VIDEO_OV5645=3Dm
> > # CONFIG_VIDEO_OV5647 is not set
> > CONFIG_VIDEO_OV5648=3Dm
> > CONFIG_VIDEO_OV6650=3Dm
> > CONFIG_VIDEO_OV5670=3Dm
> > # CONFIG_VIDEO_OV5675 is not set
> > CONFIG_VIDEO_OV5693=3Dm
> > CONFIG_VIDEO_OV5695=3Dm
> > CONFIG_VIDEO_OV7251=3Dm
> > CONFIG_VIDEO_OV772X=3Dm
> > CONFIG_VIDEO_OV7640=3Dm
> > CONFIG_VIDEO_OV7670=3Dm
> > CONFIG_VIDEO_OV7740=3Dm
> > # CONFIG_VIDEO_OV8856 is not set
> > CONFIG_VIDEO_OV8865=3Dm
> > CONFIG_VIDEO_OV9282=3Dm
> > CONFIG_VIDEO_OV9640=3Dm
> > CONFIG_VIDEO_OV9650=3Dm
> > # CONFIG_VIDEO_OV9734 is not set
> > CONFIG_VIDEO_OV13858=3Dm
> > # CONFIG_VIDEO_OV13B10 is not set
> > CONFIG_VIDEO_VS6624=3Dm
> > CONFIG_VIDEO_MT9M001=3Dm
> > # CONFIG_VIDEO_MT9M032 is not set
> > CONFIG_VIDEO_MT9M111=3Dm
> > CONFIG_VIDEO_MT9P031=3Dm
> > CONFIG_VIDEO_MT9T001=3Dm
> > CONFIG_VIDEO_MT9T112=3Dm
> > CONFIG_VIDEO_MT9V011=3Dm
> > # CONFIG_VIDEO_MT9V032 is not set
> > CONFIG_VIDEO_MT9V111=3Dm
> > CONFIG_VIDEO_SR030PC30=3Dm
> > CONFIG_VIDEO_NOON010PC30=3Dm
> > # CONFIG_VIDEO_M5MOLS is not set
> > CONFIG_VIDEO_MAX9271_LIB=3Dm
> > CONFIG_VIDEO_RDACM20=3Dm
> > CONFIG_VIDEO_RDACM21=3Dm
> > # CONFIG_VIDEO_RJ54N1 is not set
> > CONFIG_VIDEO_S5K6AA=3Dm
> > CONFIG_VIDEO_S5K6A3=3Dm
> > CONFIG_VIDEO_S5K4ECGX=3Dm
> > CONFIG_VIDEO_S5K5BAF=3Dm
> > CONFIG_VIDEO_CCS=3Dm
> > CONFIG_VIDEO_ET8EK8=3Dm
> > # CONFIG_VIDEO_S5C73M3 is not set
> > # end of Camera sensor devices
> > =

> > #
> > # Lens drivers
> > #
> > CONFIG_VIDEO_AD5820=3Dm
> > # CONFIG_VIDEO_AK7375 is not set
> > CONFIG_VIDEO_DW9714=3Dm
> > CONFIG_VIDEO_DW9768=3Dm
> > # CONFIG_VIDEO_DW9807_VCM is not set
> > # end of Lens drivers
> > =

> > #
> > # Flash devices
> > #
> > CONFIG_VIDEO_ADP1653=3Dm
> > CONFIG_VIDEO_LM3560=3Dm
> > CONFIG_VIDEO_LM3646=3Dm
> > # end of Flash devices
> > =

> > #
> > # SPI helper chips
> > #
> > CONFIG_VIDEO_GS1662=3Dm
> > # end of SPI helper chips
> > =

> > #
> > # Media SPI Adapters
> > #
> > CONFIG_CXD2880_SPI_DRV=3Dm
> > # end of Media SPI Adapters
> > =

> > CONFIG_MEDIA_TUNER=3Dm
> > =

> > #
> > # Customize TV tuners
> > #
> > # CONFIG_MEDIA_TUNER_SIMPLE is not set
> > CONFIG_MEDIA_TUNER_TDA18250=3Dm
> > CONFIG_MEDIA_TUNER_TDA8290=3Dm
> > CONFIG_MEDIA_TUNER_TDA827X=3Dm
> > CONFIG_MEDIA_TUNER_TDA18271=3Dm
> > CONFIG_MEDIA_TUNER_TDA9887=3Dm
> > CONFIG_MEDIA_TUNER_TEA5761=3Dm
> > # CONFIG_MEDIA_TUNER_TEA5767 is not set
> > CONFIG_MEDIA_TUNER_MSI001=3Dm
> > CONFIG_MEDIA_TUNER_MT20XX=3Dm
> > # CONFIG_MEDIA_TUNER_MT2060 is not set
> > CONFIG_MEDIA_TUNER_MT2063=3Dm
> > CONFIG_MEDIA_TUNER_MT2266=3Dm
> > CONFIG_MEDIA_TUNER_MT2131=3Dm
> > CONFIG_MEDIA_TUNER_QT1010=3Dm
> > CONFIG_MEDIA_TUNER_XC2028=3Dm
> > CONFIG_MEDIA_TUNER_XC5000=3Dm
> > # CONFIG_MEDIA_TUNER_XC4000 is not set
> > CONFIG_MEDIA_TUNER_MXL5005S=3Dm
> > CONFIG_MEDIA_TUNER_MXL5007T=3Dm
> > # CONFIG_MEDIA_TUNER_MC44S803 is not set
> > CONFIG_MEDIA_TUNER_MAX2165=3Dm
> > CONFIG_MEDIA_TUNER_TDA18218=3Dm
> > CONFIG_MEDIA_TUNER_FC0011=3Dm
> > # CONFIG_MEDIA_TUNER_FC0012 is not set
> > # CONFIG_MEDIA_TUNER_FC0013 is not set
> > CONFIG_MEDIA_TUNER_TDA18212=3Dm
> > # CONFIG_MEDIA_TUNER_E4000 is not set
> > CONFIG_MEDIA_TUNER_FC2580=3Dm
> > CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> > CONFIG_MEDIA_TUNER_TUA9001=3Dm
> > CONFIG_MEDIA_TUNER_SI2157=3Dm
> > CONFIG_MEDIA_TUNER_IT913X=3Dm
> > CONFIG_MEDIA_TUNER_R820T=3Dm
> > # CONFIG_MEDIA_TUNER_MXL301RF is not set
> > CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
> > # CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
> > # end of Customize TV tuners
> > =

> > #
> > # Customise DVB Frontends
> > #
> > =

> > #
> > # Multistandard (satellite) frontends
> > #
> > # CONFIG_DVB_STB0899 is not set
> > CONFIG_DVB_STB6100=3Dm
> > CONFIG_DVB_STV090x=3Dm
> > CONFIG_DVB_STV0910=3Dm
> > # CONFIG_DVB_STV6110x is not set
> > CONFIG_DVB_STV6111=3Dm
> > # CONFIG_DVB_MXL5XX is not set
> > # CONFIG_DVB_M88DS3103 is not set
> > =

> > #
> > # Multistandard (cable + terrestrial) frontends
> > #
> > CONFIG_DVB_DRXK=3Dm
> > CONFIG_DVB_TDA18271C2DD=3Dm
> > CONFIG_DVB_SI2165=3Dm
> > CONFIG_DVB_MN88472=3Dm
> > # CONFIG_DVB_MN88473 is not set
> > =

> > #
> > # DVB-S (satellite) frontends
> > #
> > CONFIG_DVB_CX24110=3Dm
> > CONFIG_DVB_CX24123=3Dm
> > # CONFIG_DVB_MT312 is not set
> > # CONFIG_DVB_ZL10036 is not set
> > # CONFIG_DVB_ZL10039 is not set
> > CONFIG_DVB_S5H1420=3Dm
> > CONFIG_DVB_STV0288=3Dm
> > CONFIG_DVB_STB6000=3Dm
> > CONFIG_DVB_STV0299=3Dm
> > # CONFIG_DVB_STV6110 is not set
> > # CONFIG_DVB_STV0900 is not set
> > CONFIG_DVB_TDA8083=3Dm
> > CONFIG_DVB_TDA10086=3Dm
> > CONFIG_DVB_TDA8261=3Dm
> > CONFIG_DVB_VES1X93=3Dm
> > CONFIG_DVB_TUNER_ITD1000=3Dm
> > # CONFIG_DVB_TUNER_CX24113 is not set
> > CONFIG_DVB_TDA826X=3Dm
> > CONFIG_DVB_TUA6100=3Dm
> > CONFIG_DVB_CX24116=3Dm
> > # CONFIG_DVB_CX24117 is not set
> > CONFIG_DVB_CX24120=3Dm
> > CONFIG_DVB_SI21XX=3Dm
> > CONFIG_DVB_TS2020=3Dm
> > CONFIG_DVB_DS3000=3Dm
> > CONFIG_DVB_MB86A16=3Dm
> > CONFIG_DVB_TDA10071=3Dm
> > =

> > #
> > # DVB-T (terrestrial) frontends
> > #
> > CONFIG_DVB_SP887X=3Dm
> > CONFIG_DVB_CX22700=3Dm
> > CONFIG_DVB_CX22702=3Dm
> > CONFIG_DVB_S5H1432=3Dm
> > # CONFIG_DVB_DRXD is not set
> > # CONFIG_DVB_L64781 is not set
> > CONFIG_DVB_TDA1004X=3Dm
> > CONFIG_DVB_NXT6000=3Dm
> > # CONFIG_DVB_MT352 is not set
> > CONFIG_DVB_ZL10353=3Dm
> > CONFIG_DVB_DIB3000MB=3Dm
> > CONFIG_DVB_DIB3000MC=3Dm
> > # CONFIG_DVB_DIB7000M is not set
> > CONFIG_DVB_DIB7000P=3Dm
> > CONFIG_DVB_DIB9000=3Dm
> > # CONFIG_DVB_TDA10048 is not set
> > # CONFIG_DVB_AF9013 is not set
> > # CONFIG_DVB_EC100 is not set
> > CONFIG_DVB_STV0367=3Dm
> > CONFIG_DVB_CXD2820R=3Dm
> > # CONFIG_DVB_CXD2841ER is not set
> > CONFIG_DVB_RTL2830=3Dm
> > CONFIG_DVB_RTL2832=3Dm
> > # CONFIG_DVB_SI2168 is not set
> > CONFIG_DVB_ZD1301_DEMOD=3Dm
> > CONFIG_DVB_CXD2880=3Dm
> > =

> > #
> > # DVB-C (cable) frontends
> > #
> > CONFIG_DVB_VES1820=3Dm
> > # CONFIG_DVB_TDA10021 is not set
> > CONFIG_DVB_TDA10023=3Dm
> > CONFIG_DVB_STV0297=3Dm
> > =

> > #
> > # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> > #
> > CONFIG_DVB_NXT200X=3Dm
> > # CONFIG_DVB_OR51211 is not set
> > CONFIG_DVB_OR51132=3Dm
> > # CONFIG_DVB_BCM3510 is not set
> > CONFIG_DVB_LGDT330X=3Dm
> > # CONFIG_DVB_LGDT3305 is not set
> > CONFIG_DVB_LGDT3306A=3Dm
> > CONFIG_DVB_LG2160=3Dm
> > CONFIG_DVB_S5H1409=3Dm
> > # CONFIG_DVB_AU8522_DTV is not set
> > # CONFIG_DVB_AU8522_V4L is not set
> > # CONFIG_DVB_S5H1411 is not set
> > # CONFIG_DVB_MXL692 is not set
> > =

> > #
> > # ISDB-T (terrestrial) frontends
> > #
> > # CONFIG_DVB_S921 is not set
> > CONFIG_DVB_DIB8000=3Dm
> > CONFIG_DVB_MB86A20S=3Dm
> > =

> > #
> > # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> > #
> > CONFIG_DVB_TC90522=3Dm
> > # CONFIG_DVB_MN88443X is not set
> > =

> > #
> > # Digital terrestrial only tuners/PLL
> > #
> > # CONFIG_DVB_PLL is not set
> > # CONFIG_DVB_TUNER_DIB0070 is not set
> > # CONFIG_DVB_TUNER_DIB0090 is not set
> > =

> > #
> > # SEC control devices for DVB-S
> > #
> > CONFIG_DVB_DRX39XYJ=3Dm
> > CONFIG_DVB_LNBH25=3Dm
> > CONFIG_DVB_LNBH29=3Dm
> > CONFIG_DVB_LNBP21=3Dm
> > CONFIG_DVB_LNBP22=3Dm
> > CONFIG_DVB_ISL6405=3Dm
> > CONFIG_DVB_ISL6421=3Dm
> > CONFIG_DVB_ISL6423=3Dm
> > CONFIG_DVB_A8293=3Dm
> > # CONFIG_DVB_LGS8GL5 is not set
> > CONFIG_DVB_LGS8GXX=3Dm
> > CONFIG_DVB_ATBM8830=3Dm
> > CONFIG_DVB_TDA665x=3Dm
> > CONFIG_DVB_IX2505V=3Dm
> > # CONFIG_DVB_M88RS2000 is not set
> > # CONFIG_DVB_AF9033 is not set
> > CONFIG_DVB_HORUS3A=3Dm
> > CONFIG_DVB_ASCOT2E=3Dm
> > CONFIG_DVB_HELENE=3Dm
> > =

> > #
> > # Common Interface (EN50221) controller drivers
> > #
> > CONFIG_DVB_CXD2099=3Dm
> > CONFIG_DVB_SP2=3Dm
> > # end of Customise DVB Frontends
> > # end of Media ancillary drivers
> > =

> > #
> > # Graphics support
> > #
> > # CONFIG_AGP is not set
> > CONFIG_VGA_ARB=3Dy
> > CONFIG_VGA_ARB_MAX_GPUS=3D16
> > # CONFIG_VGA_SWITCHEROO is not set
> > CONFIG_DRM=3Dm
> > CONFIG_DRM_MIPI_DBI=3Dm
> > CONFIG_DRM_MIPI_DSI=3Dy
> > CONFIG_DRM_DP_AUX_BUS=3Dm
> > CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> > # CONFIG_DRM_DEBUG_SELFTEST is not set
> > CONFIG_DRM_KMS_HELPER=3Dm
> > CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> > CONFIG_DRM_DP_CEC=3Dy
> > CONFIG_DRM_GEM_CMA_HELPER=3Dm
> > CONFIG_DRM_GEM_SHMEM_HELPER=3Dm
> > =

> > #
> > # I2C encoder or helper chips
> > #
> > CONFIG_DRM_I2C_CH7006=3Dm
> > CONFIG_DRM_I2C_SIL164=3Dm
> > CONFIG_DRM_I2C_NXP_TDA998X=3Dm
> > CONFIG_DRM_I2C_NXP_TDA9950=3Dm
> > # end of I2C encoder or helper chips
> > =

> > #
> > # ARM devices
> > #
> > CONFIG_DRM_KOMEDA=3Dm
> > # end of ARM devices
> > =

> > # CONFIG_DRM_RADEON is not set
> > # CONFIG_DRM_AMDGPU is not set
> > # CONFIG_DRM_NOUVEAU is not set
> > # CONFIG_DRM_I915 is not set
> > CONFIG_DRM_VGEM=3Dm
> > CONFIG_DRM_VKMS=3Dm
> > # CONFIG_DRM_VMWGFX is not set
> > # CONFIG_DRM_GMA500 is not set
> > # CONFIG_DRM_UDL is not set
> > # CONFIG_DRM_AST is not set
> > # CONFIG_DRM_MGAG200 is not set
> > CONFIG_DRM_RCAR_DW_HDMI=3Dm
> > # CONFIG_DRM_RCAR_USE_LVDS is not set
> > CONFIG_DRM_RCAR_MIPI_DSI=3Dm
> > # CONFIG_DRM_QXL is not set
> > # CONFIG_DRM_VIRTIO_GPU is not set
> > CONFIG_DRM_PANEL=3Dy
> > =

> > #
> > # Display Panels
> > #
> > CONFIG_DRM_PANEL_ABT_Y030XX067A=3Dm
> > # CONFIG_DRM_PANEL_ARM_VERSATILE is not set
> > CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596=3Dm
> > # CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0 is not set
> > CONFIG_DRM_PANEL_BOE_HIMAX8279D=3Dm
> > CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=3Dm
> > CONFIG_DRM_PANEL_DSI_CM=3Dm
> > # CONFIG_DRM_PANEL_LVDS is not set
> > CONFIG_DRM_PANEL_SIMPLE=3Dm
> > # CONFIG_DRM_PANEL_EDP is not set
> > # CONFIG_DRM_PANEL_ELIDA_KD35T133 is not set
> > CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=3Dm
> > # CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D is not set
> > # CONFIG_DRM_PANEL_ILITEK_IL9322 is not set
> > # CONFIG_DRM_PANEL_ILITEK_ILI9341 is not set
> > CONFIG_DRM_PANEL_ILITEK_ILI9881C=3Dm
> > CONFIG_DRM_PANEL_INNOLUX_EJ030NA=3Dm
> > CONFIG_DRM_PANEL_INNOLUX_P079ZCA=3Dm
> > CONFIG_DRM_PANEL_JDI_LT070ME05000=3Dm
> > CONFIG_DRM_PANEL_JDI_R63452=3Dm
> > # CONFIG_DRM_PANEL_KHADAS_TS050 is not set
> > # CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04 is not set
> > CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W=3Dm
> > # CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
> > # CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
> > CONFIG_DRM_PANEL_LG_LB035Q02=3Dm
> > CONFIG_DRM_PANEL_LG_LG4573=3Dm
> > CONFIG_DRM_PANEL_NEC_NL8048HL11=3Dm
> > CONFIG_DRM_PANEL_NOVATEK_NT35510=3Dm
> > CONFIG_DRM_PANEL_NOVATEK_NT35950=3Dm
> > CONFIG_DRM_PANEL_NOVATEK_NT36672A=3Dm
> > CONFIG_DRM_PANEL_NOVATEK_NT39016=3Dm
> > CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=3Dm
> > CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=3Dm
> > CONFIG_DRM_PANEL_ORISETECH_OTM8009A=3Dm
> > # CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS is not set
> > CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=3Dm
> > CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=3Dm
> > CONFIG_DRM_PANEL_RAYDIUM_RM67191=3Dm
> > # CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
> > # CONFIG_DRM_PANEL_RONBO_RB070D30 is not set
> > CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=3Dm
> > CONFIG_DRM_PANEL_SAMSUNG_DB7430=3Dm
> > # CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
> > CONFIG_DRM_PANEL_SAMSUNG_S6D27A1=3Dm
> > CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=3Dm
> > # CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
> > CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=3Dm
> > # CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI is not set
> > # CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI is not set
> > CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=3Dm
> > # CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
> > CONFIG_DRM_PANEL_SAMSUNG_SOFEF00=3Dm
> > # CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
> > CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=3Dm
> > CONFIG_DRM_PANEL_SHARP_LS037V7DW01=3Dm
> > CONFIG_DRM_PANEL_SHARP_LS043T1LE01=3Dm
> > CONFIG_DRM_PANEL_SHARP_LS060T1SX01=3Dm
> > CONFIG_DRM_PANEL_SITRONIX_ST7701=3Dm
> > CONFIG_DRM_PANEL_SITRONIX_ST7703=3Dm
> > # CONFIG_DRM_PANEL_SITRONIX_ST7789V is not set
> > # CONFIG_DRM_PANEL_SONY_ACX424AKP is not set
> > CONFIG_DRM_PANEL_SONY_ACX565AKM=3Dm
> > # CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521 is not set
> > # CONFIG_DRM_PANEL_TDO_TL070WSH30 is not set
> > # CONFIG_DRM_PANEL_TPO_TD028TTEC1 is not set
> > CONFIG_DRM_PANEL_TPO_TD043MTEA1=3Dm
> > CONFIG_DRM_PANEL_TPO_TPG110=3Dm
> > # CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA is not set
> > CONFIG_DRM_PANEL_VISIONOX_RM69299=3Dm
> > CONFIG_DRM_PANEL_WIDECHIPS_WS2401=3Dm
> > CONFIG_DRM_PANEL_XINPENG_XPP055C272=3Dm
> > # end of Display Panels
> > =

> > CONFIG_DRM_BRIDGE=3Dy
> > CONFIG_DRM_PANEL_BRIDGE=3Dy
> > =

> > #
> > # Display Interface Bridges
> > #
> > CONFIG_DRM_CDNS_DSI=3Dm
> > CONFIG_DRM_CHIPONE_ICN6211=3Dm
> > CONFIG_DRM_CHRONTEL_CH7033=3Dm
> > # CONFIG_DRM_DISPLAY_CONNECTOR is not set
> > CONFIG_DRM_LONTIUM_LT8912B=3Dm
> > CONFIG_DRM_LONTIUM_LT9611=3Dm
> > # CONFIG_DRM_LONTIUM_LT9611UXC is not set
> > CONFIG_DRM_ITE_IT66121=3Dm
> > CONFIG_DRM_LVDS_CODEC=3Dm
> > # CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
> > # CONFIG_DRM_NWL_MIPI_DSI is not set
> > CONFIG_DRM_NXP_PTN3460=3Dm
> > CONFIG_DRM_PARADE_PS8622=3Dm
> > CONFIG_DRM_PARADE_PS8640=3Dm
> > # CONFIG_DRM_SIL_SII8620 is not set
> > CONFIG_DRM_SII902X=3Dm
> > # CONFIG_DRM_SII9234 is not set
> > CONFIG_DRM_SIMPLE_BRIDGE=3Dm
> > # CONFIG_DRM_THINE_THC63LVD1024 is not set
> > CONFIG_DRM_TOSHIBA_TC358762=3Dm
> > CONFIG_DRM_TOSHIBA_TC358764=3Dm
> > # CONFIG_DRM_TOSHIBA_TC358767 is not set
> > CONFIG_DRM_TOSHIBA_TC358768=3Dm
> > CONFIG_DRM_TOSHIBA_TC358775=3Dm
> > # CONFIG_DRM_TI_TFP410 is not set
> > CONFIG_DRM_TI_SN65DSI83=3Dm
> > # CONFIG_DRM_TI_SN65DSI86 is not set
> > CONFIG_DRM_TI_TPD12S015=3Dm
> > CONFIG_DRM_ANALOGIX_ANX6345=3Dm
> > CONFIG_DRM_ANALOGIX_ANX78XX=3Dm
> > CONFIG_DRM_ANALOGIX_DP=3Dm
> > CONFIG_DRM_ANALOGIX_ANX7625=3Dm
> > CONFIG_DRM_I2C_ADV7511=3Dm
> > # CONFIG_DRM_I2C_ADV7511_AUDIO is not set
> > # CONFIG_DRM_I2C_ADV7511_CEC is not set
> > # CONFIG_DRM_CDNS_MHDP8546 is not set
> > CONFIG_DRM_DW_HDMI=3Dm
> > CONFIG_DRM_DW_HDMI_AHB_AUDIO=3Dm
> > CONFIG_DRM_DW_HDMI_I2S_AUDIO=3Dm
> > CONFIG_DRM_DW_HDMI_CEC=3Dm
> > # end of Display Interface Bridges
> > =

> > # CONFIG_DRM_ETNAVIV is not set
> > CONFIG_DRM_MXS=3Dy
> > CONFIG_DRM_MXSFB=3Dm
> > CONFIG_DRM_ARCPGU=3Dm
> > # CONFIG_DRM_BOCHS is not set
> > # CONFIG_DRM_CIRRUS_QEMU is not set
> > CONFIG_DRM_GM12U320=3Dm
> > # CONFIG_DRM_SIMPLEDRM is not set
> > CONFIG_TINYDRM_HX8357D=3Dm
> > CONFIG_TINYDRM_ILI9163=3Dm
> > # CONFIG_TINYDRM_ILI9225 is not set
> > CONFIG_TINYDRM_ILI9341=3Dm
> > CONFIG_TINYDRM_ILI9486=3Dm
> > CONFIG_TINYDRM_MI0283QT=3Dm
> > # CONFIG_TINYDRM_REPAPER is not set
> > # CONFIG_TINYDRM_ST7586 is not set
> > CONFIG_TINYDRM_ST7735R=3Dm
> > # CONFIG_DRM_VBOXVIDEO is not set
> > # CONFIG_DRM_GUD is not set
> > # CONFIG_DRM_LEGACY is not set
> > CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dm
> > CONFIG_DRM_NOMODESET=3Dy
> > =

> > #
> > # Frame buffer Devices
> > #
> > CONFIG_FB_CMDLINE=3Dy
> > # CONFIG_FB is not set
> > # end of Frame buffer Devices
> > =

> > #
> > # Backlight & LCD device support
> > #
> > # CONFIG_LCD_CLASS_DEVICE is not set
> > CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> > # CONFIG_BACKLIGHT_KTD253 is not set
> > # CONFIG_BACKLIGHT_LM3533 is not set
> > CONFIG_BACKLIGHT_DA9052=3Dy
> > # CONFIG_BACKLIGHT_MAX8925 is not set
> > CONFIG_BACKLIGHT_APPLE=3Dy
> > CONFIG_BACKLIGHT_QCOM_WLED=3Dy
> > CONFIG_BACKLIGHT_RT4831=3Dy
> > CONFIG_BACKLIGHT_SAHARA=3Dm
> > # CONFIG_BACKLIGHT_WM831X is not set
> > CONFIG_BACKLIGHT_ADP8860=3Dm
> > # CONFIG_BACKLIGHT_ADP8870 is not set
> > CONFIG_BACKLIGHT_PCF50633=3Dm
> > # CONFIG_BACKLIGHT_AAT2870 is not set
> > CONFIG_BACKLIGHT_LM3639=3Dm
> > CONFIG_BACKLIGHT_SKY81452=3Dm
> > # CONFIG_BACKLIGHT_TPS65217 is not set
> > CONFIG_BACKLIGHT_AS3711=3Dy
> > CONFIG_BACKLIGHT_GPIO=3Dm
> > CONFIG_BACKLIGHT_LV5207LP=3Dy
> > CONFIG_BACKLIGHT_BD6107=3Dy
> > CONFIG_BACKLIGHT_ARCXCNN=3Dm
> > CONFIG_BACKLIGHT_RAVE_SP=3Dy
> > # CONFIG_BACKLIGHT_LED is not set
> > # end of Backlight & LCD device support
> > =

> > CONFIG_VIDEOMODE_HELPERS=3Dy
> > CONFIG_HDMI=3Dy
> > =

> > #
> > # Console display driver support
> > #
> > CONFIG_VGA_CONSOLE=3Dy
> > # CONFIG_MDA_CONSOLE is not set
> > CONFIG_DUMMY_CONSOLE=3Dy
> > CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> > CONFIG_DUMMY_CONSOLE_ROWS=3D25
> > # end of Console display driver support
> > # end of Graphics support
> > =

> > CONFIG_SOUND=3Dy
> > CONFIG_SND=3Dm
> > CONFIG_SND_TIMER=3Dm
> > CONFIG_SND_PCM=3Dm
> > CONFIG_SND_PCM_ELD=3Dy
> > CONFIG_SND_PCM_IEC958=3Dy
> > CONFIG_SND_DMAENGINE_PCM=3Dm
> > CONFIG_SND_HWDEP=3Dm
> > CONFIG_SND_SEQ_DEVICE=3Dm
> > CONFIG_SND_RAWMIDI=3Dm
> > CONFIG_SND_COMPRESS_OFFLOAD=3Dm
> > CONFIG_SND_JACK=3Dy
> > CONFIG_SND_JACK_INPUT_DEV=3Dy
> > # CONFIG_SND_OSSEMUL is not set
> > CONFIG_SND_PCM_TIMER=3Dy
> > CONFIG_SND_DYNAMIC_MINORS=3Dy
> > CONFIG_SND_MAX_CARDS=3D32
> > CONFIG_SND_SUPPORT_OLD_API=3Dy
> > CONFIG_SND_PROC_FS=3Dy
> > # CONFIG_SND_VERBOSE_PROCFS is not set
> > CONFIG_SND_VERBOSE_PRINTK=3Dy
> > CONFIG_SND_DEBUG=3Dy
> > # CONFIG_SND_DEBUG_VERBOSE is not set
> > CONFIG_SND_CTL_VALIDATION=3Dy
> > CONFIG_SND_JACK_INJECTION_DEBUG=3Dy
> > CONFIG_SND_VMASTER=3Dy
> > CONFIG_SND_DMA_SGBUF=3Dy
> > CONFIG_SND_SEQUENCER=3Dm
> > CONFIG_SND_SEQ_DUMMY=3Dm
> > CONFIG_SND_SEQ_MIDI_EVENT=3Dm
> > CONFIG_SND_SEQ_MIDI=3Dm
> > CONFIG_SND_SEQ_VIRMIDI=3Dm
> > CONFIG_SND_MPU401_UART=3Dm
> > CONFIG_SND_AC97_CODEC=3Dm
> > CONFIG_SND_DRIVERS=3Dy
> > CONFIG_SND_DUMMY=3Dm
> > # CONFIG_SND_ALOOP is not set
> > CONFIG_SND_VIRMIDI=3Dm
> > CONFIG_SND_MTPAV=3Dm
> > CONFIG_SND_SERIAL_U16550=3Dm
> > CONFIG_SND_MPU401=3Dm
> > # CONFIG_SND_AC97_POWER_SAVE is not set
> > # CONFIG_SND_ISA is not set
> > CONFIG_SND_PCI=3Dy
> > # CONFIG_SND_AD1889 is not set
> > # CONFIG_SND_ALS300 is not set
> > # CONFIG_SND_ALS4000 is not set
> > # CONFIG_SND_ALI5451 is not set
> > # CONFIG_SND_ASIHPI is not set
> > # CONFIG_SND_ATIIXP is not set
> > # CONFIG_SND_ATIIXP_MODEM is not set
> > # CONFIG_SND_AU8810 is not set
> > # CONFIG_SND_AU8820 is not set
> > # CONFIG_SND_AU8830 is not set
> > # CONFIG_SND_AW2 is not set
> > # CONFIG_SND_AZT3328 is not set
> > # CONFIG_SND_BT87X is not set
> > # CONFIG_SND_CA0106 is not set
> > # CONFIG_SND_CMIPCI is not set
> > # CONFIG_SND_OXYGEN is not set
> > # CONFIG_SND_CS4281 is not set
> > # CONFIG_SND_CS46XX is not set
> > # CONFIG_SND_CS5530 is not set
> > # CONFIG_SND_CS5535AUDIO is not set
> > # CONFIG_SND_CTXFI is not set
> > # CONFIG_SND_DARLA20 is not set
> > # CONFIG_SND_GINA20 is not set
> > # CONFIG_SND_LAYLA20 is not set
> > # CONFIG_SND_DARLA24 is not set
> > # CONFIG_SND_GINA24 is not set
> > # CONFIG_SND_LAYLA24 is not set
> > # CONFIG_SND_MONA is not set
> > # CONFIG_SND_MIA is not set
> > # CONFIG_SND_ECHO3G is not set
> > # CONFIG_SND_INDIGO is not set
> > # CONFIG_SND_INDIGOIO is not set
> > # CONFIG_SND_INDIGODJ is not set
> > # CONFIG_SND_INDIGOIOX is not set
> > # CONFIG_SND_INDIGODJX is not set
> > # CONFIG_SND_EMU10K1 is not set
> > # CONFIG_SND_EMU10K1X is not set
> > # CONFIG_SND_ENS1370 is not set
> > # CONFIG_SND_ENS1371 is not set
> > # CONFIG_SND_ES1938 is not set
> > # CONFIG_SND_ES1968 is not set
> > # CONFIG_SND_FM801 is not set
> > # CONFIG_SND_HDSP is not set
> > # CONFIG_SND_HDSPM is not set
> > # CONFIG_SND_ICE1712 is not set
> > # CONFIG_SND_ICE1724 is not set
> > # CONFIG_SND_INTEL8X0 is not set
> > # CONFIG_SND_INTEL8X0M is not set
> > # CONFIG_SND_KORG1212 is not set
> > # CONFIG_SND_LOLA is not set
> > # CONFIG_SND_LX6464ES is not set
> > # CONFIG_SND_MAESTRO3 is not set
> > # CONFIG_SND_MIXART is not set
> > # CONFIG_SND_NM256 is not set
> > # CONFIG_SND_PCXHR is not set
> > # CONFIG_SND_RIPTIDE is not set
> > # CONFIG_SND_RME32 is not set
> > # CONFIG_SND_RME96 is not set
> > # CONFIG_SND_RME9652 is not set
> > # CONFIG_SND_SE6X is not set
> > # CONFIG_SND_SIS7019 is not set
> > # CONFIG_SND_SONICVIBES is not set
> > # CONFIG_SND_TRIDENT is not set
> > # CONFIG_SND_VIA82XX is not set
> > # CONFIG_SND_VIA82XX_MODEM is not set
> > # CONFIG_SND_VIRTUOSO is not set
> > # CONFIG_SND_VX222 is not set
> > # CONFIG_SND_YMFPCI is not set
> > =

> > #
> > # HD-Audio
> > #
> > # CONFIG_SND_HDA_INTEL is not set
> > # end of HD-Audio
> > =

> > CONFIG_SND_HDA_PREALLOC_SIZE=3D0
> > CONFIG_SND_SPI=3Dy
> > # CONFIG_SND_USB is not set
> > CONFIG_SND_FIREWIRE=3Dy
> > CONFIG_SND_FIREWIRE_LIB=3Dm
> > # CONFIG_SND_DICE is not set
> > CONFIG_SND_OXFW=3Dm
> > CONFIG_SND_ISIGHT=3Dm
> > # CONFIG_SND_FIREWORKS is not set
> > # CONFIG_SND_BEBOB is not set
> > # CONFIG_SND_FIREWIRE_DIGI00X is not set
> > CONFIG_SND_FIREWIRE_TASCAM=3Dm
> > # CONFIG_SND_FIREWIRE_MOTU is not set
> > # CONFIG_SND_FIREFACE is not set
> > CONFIG_SND_SOC=3Dm
> > CONFIG_SND_SOC_AC97_BUS=3Dy
> > CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> > CONFIG_SND_SOC_COMPRESS=3Dy
> > CONFIG_SND_SOC_ACPI=3Dm
> > # CONFIG_SND_SOC_ADI is not set
> > # CONFIG_SND_SOC_AMD_ACP is not set
> > # CONFIG_SND_SOC_AMD_ACP3x is not set
> > # CONFIG_SND_SOC_AMD_RENOIR is not set
> > # CONFIG_SND_SOC_AMD_ACP5x is not set
> > # CONFIG_SND_SOC_AMD_ACP6x is not set
> > CONFIG_SND_AMD_ACP_CONFIG=3Dm
> > # CONFIG_SND_SOC_AMD_ACP_COMMON is not set
> > # CONFIG_SND_ATMEL_SOC is not set
> > CONFIG_SND_BCM63XX_I2S_WHISTLER=3Dm
> > CONFIG_SND_DESIGNWARE_I2S=3Dm
> > # CONFIG_SND_DESIGNWARE_PCM is not set
> > =

> > #
> > # SoC Audio for Freescale CPUs
> > #
> > =

> > #
> > # Common SoC Audio options for Freescale CPUs:
> > #
> > CONFIG_SND_SOC_FSL_ASRC=3Dm
> > CONFIG_SND_SOC_FSL_SAI=3Dm
> > CONFIG_SND_SOC_FSL_MQS=3Dm
> > CONFIG_SND_SOC_FSL_AUDMIX=3Dm
> > # CONFIG_SND_SOC_FSL_SSI is not set
> > CONFIG_SND_SOC_FSL_SPDIF=3Dm
> > CONFIG_SND_SOC_FSL_ESAI=3Dm
> > # CONFIG_SND_SOC_FSL_MICFIL is not set
> > # CONFIG_SND_SOC_FSL_EASRC is not set
> > # CONFIG_SND_SOC_FSL_XCVR is not set
> > CONFIG_SND_SOC_FSL_RPMSG=3Dm
> > # CONFIG_SND_SOC_IMX_AUDMUX is not set
> > # end of SoC Audio for Freescale CPUs
> > =

> > # CONFIG_SND_I2S_HI6210_I2S is not set
> > CONFIG_SND_SOC_IMG=3Dy
> > CONFIG_SND_SOC_IMG_I2S_IN=3Dm
> > # CONFIG_SND_SOC_IMG_I2S_OUT is not set
> > # CONFIG_SND_SOC_IMG_PARALLEL_OUT is not set
> > CONFIG_SND_SOC_IMG_SPDIF_IN=3Dm
> > CONFIG_SND_SOC_IMG_SPDIF_OUT=3Dm
> > # CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC is not set
> > # CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
> > # CONFIG_SND_SOC_MTK_BTCVSD is not set
> > # CONFIG_SND_SOC_SOF_TOPLEVEL is not set
> > =

> > #
> > # STMicroelectronics STM32 SOC audio support
> > #
> > # end of STMicroelectronics STM32 SOC audio support
> > =

> > # CONFIG_SND_SOC_XILINX_I2S is not set
> > # CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER is not set
> > # CONFIG_SND_SOC_XILINX_SPDIF is not set
> > CONFIG_SND_SOC_XTFPGA_I2S=3Dm
> > CONFIG_SND_SOC_I2C_AND_SPI=3Dm
> > =

> > #
> > # CODEC drivers
> > #
> > CONFIG_SND_SOC_WM_ADSP=3Dm
> > CONFIG_SND_SOC_AC97_CODEC=3Dm
> > CONFIG_SND_SOC_ADAU_UTILS=3Dm
> > CONFIG_SND_SOC_ADAU1372=3Dm
> > CONFIG_SND_SOC_ADAU1372_I2C=3Dm
> > CONFIG_SND_SOC_ADAU1372_SPI=3Dm
> > CONFIG_SND_SOC_ADAU1701=3Dm
> > CONFIG_SND_SOC_ADAU17X1=3Dm
> > CONFIG_SND_SOC_ADAU1761=3Dm
> > CONFIG_SND_SOC_ADAU1761_I2C=3Dm
> > # CONFIG_SND_SOC_ADAU1761_SPI is not set
> > CONFIG_SND_SOC_ADAU7002=3Dm
> > CONFIG_SND_SOC_ADAU7118=3Dm
> > # CONFIG_SND_SOC_ADAU7118_HW is not set
> > CONFIG_SND_SOC_ADAU7118_I2C=3Dm
> > CONFIG_SND_SOC_AK4104=3Dm
> > CONFIG_SND_SOC_AK4118=3Dm
> > CONFIG_SND_SOC_AK4375=3Dm
> > CONFIG_SND_SOC_AK4458=3Dm
> > CONFIG_SND_SOC_AK4554=3Dm
> > CONFIG_SND_SOC_AK4613=3Dm
> > # CONFIG_SND_SOC_AK4642 is not set
> > # CONFIG_SND_SOC_AK5386 is not set
> > # CONFIG_SND_SOC_AK5558 is not set
> > CONFIG_SND_SOC_ALC5623=3Dm
> > CONFIG_SND_SOC_BD28623=3Dm
> > CONFIG_SND_SOC_BT_SCO=3Dm
> > CONFIG_SND_SOC_CROS_EC_CODEC=3Dm
> > # CONFIG_SND_SOC_CS35L32 is not set
> > CONFIG_SND_SOC_CS35L33=3Dm
> > # CONFIG_SND_SOC_CS35L34 is not set
> > CONFIG_SND_SOC_CS35L35=3Dm
> > CONFIG_SND_SOC_CS35L36=3Dm
> > CONFIG_SND_SOC_CS35L41_LIB=3Dm
> > CONFIG_SND_SOC_CS35L41=3Dm
> > CONFIG_SND_SOC_CS35L41_SPI=3Dm
> > # CONFIG_SND_SOC_CS35L41_I2C is not set
> > CONFIG_SND_SOC_CS42L42=3Dm
> > CONFIG_SND_SOC_CS42L51=3Dm
> > CONFIG_SND_SOC_CS42L51_I2C=3Dm
> > CONFIG_SND_SOC_CS42L52=3Dm
> > # CONFIG_SND_SOC_CS42L56 is not set
> > CONFIG_SND_SOC_CS42L73=3Dm
> > CONFIG_SND_SOC_CS4234=3Dm
> > CONFIG_SND_SOC_CS4265=3Dm
> > # CONFIG_SND_SOC_CS4270 is not set
> > # CONFIG_SND_SOC_CS4271_I2C is not set
> > # CONFIG_SND_SOC_CS4271_SPI is not set
> > CONFIG_SND_SOC_CS42XX8=3Dm
> > CONFIG_SND_SOC_CS42XX8_I2C=3Dm
> > CONFIG_SND_SOC_CS43130=3Dm
> > # CONFIG_SND_SOC_CS4341 is not set
> > # CONFIG_SND_SOC_CS4349 is not set
> > CONFIG_SND_SOC_CS53L30=3Dm
> > CONFIG_SND_SOC_CX2072X=3Dm
> > # CONFIG_SND_SOC_DA7213 is not set
> > # CONFIG_SND_SOC_DMIC is not set
> > CONFIG_SND_SOC_HDMI_CODEC=3Dm
> > CONFIG_SND_SOC_ES7134=3Dm
> > CONFIG_SND_SOC_ES7241=3Dm
> > # CONFIG_SND_SOC_ES8316 is not set
> > CONFIG_SND_SOC_ES8328=3Dm
> > CONFIG_SND_SOC_ES8328_I2C=3Dm
> > CONFIG_SND_SOC_ES8328_SPI=3Dm
> > CONFIG_SND_SOC_GTM601=3Dm
> > CONFIG_SND_SOC_ICS43432=3Dm
> > CONFIG_SND_SOC_INNO_RK3036=3Dm
> > CONFIG_SND_SOC_LOCHNAGAR_SC=3Dm
> > CONFIG_SND_SOC_MAX98088=3Dm
> > CONFIG_SND_SOC_MAX98357A=3Dm
> > CONFIG_SND_SOC_MAX98504=3Dm
> > # CONFIG_SND_SOC_MAX9867 is not set
> > CONFIG_SND_SOC_MAX98927=3Dm
> > CONFIG_SND_SOC_MAX98520=3Dm
> > CONFIG_SND_SOC_MAX98373=3Dm
> > CONFIG_SND_SOC_MAX98373_I2C=3Dm
> > # CONFIG_SND_SOC_MAX98373_SDW is not set
> > # CONFIG_SND_SOC_MAX98390 is not set
> > # CONFIG_SND_SOC_MAX9860 is not set
> > # CONFIG_SND_SOC_MSM8916_WCD_ANALOG is not set
> > CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=3Dm
> > # CONFIG_SND_SOC_PCM1681 is not set
> > CONFIG_SND_SOC_PCM1789=3Dm
> > CONFIG_SND_SOC_PCM1789_I2C=3Dm
> > CONFIG_SND_SOC_PCM179X=3Dm
> > CONFIG_SND_SOC_PCM179X_I2C=3Dm
> > CONFIG_SND_SOC_PCM179X_SPI=3Dm
> > CONFIG_SND_SOC_PCM186X=3Dm
> > CONFIG_SND_SOC_PCM186X_I2C=3Dm
> > CONFIG_SND_SOC_PCM186X_SPI=3Dm
> > CONFIG_SND_SOC_PCM3060=3Dm
> > # CONFIG_SND_SOC_PCM3060_I2C is not set
> > CONFIG_SND_SOC_PCM3060_SPI=3Dm
> > CONFIG_SND_SOC_PCM3168A=3Dm
> > CONFIG_SND_SOC_PCM3168A_I2C=3Dm
> > CONFIG_SND_SOC_PCM3168A_SPI=3Dm
> > CONFIG_SND_SOC_PCM5102A=3Dm
> > CONFIG_SND_SOC_PCM512x=3Dm
> > CONFIG_SND_SOC_PCM512x_I2C=3Dm
> > # CONFIG_SND_SOC_PCM512x_SPI is not set
> > # CONFIG_SND_SOC_RK3328 is not set
> > CONFIG_SND_SOC_RL6231=3Dm
> > CONFIG_SND_SOC_RT1308_SDW=3Dm
> > CONFIG_SND_SOC_RT1316_SDW=3Dm
> > # CONFIG_SND_SOC_RT5616 is not set
> > CONFIG_SND_SOC_RT5631=3Dm
> > CONFIG_SND_SOC_RT5640=3Dm
> > CONFIG_SND_SOC_RT5659=3Dm
> > # CONFIG_SND_SOC_RT5682_SDW is not set
> > # CONFIG_SND_SOC_RT700_SDW is not set
> > # CONFIG_SND_SOC_RT711_SDW is not set
> > CONFIG_SND_SOC_RT711_SDCA_SDW=3Dm
> > CONFIG_SND_SOC_RT715=3Dm
> > CONFIG_SND_SOC_RT715_SDW=3Dm
> > CONFIG_SND_SOC_RT715_SDCA_SDW=3Dm
> > # CONFIG_SND_SOC_RT9120 is not set
> > CONFIG_SND_SOC_SGTL5000=3Dm
> > CONFIG_SND_SOC_SI476X=3Dm
> > CONFIG_SND_SOC_SIGMADSP=3Dm
> > CONFIG_SND_SOC_SIGMADSP_I2C=3Dm
> > CONFIG_SND_SOC_SIGMADSP_REGMAP=3Dm
> > CONFIG_SND_SOC_SIMPLE_AMPLIFIER=3Dm
> > CONFIG_SND_SOC_SIMPLE_MUX=3Dm
> > CONFIG_SND_SOC_SPDIF=3Dm
> > # CONFIG_SND_SOC_SSM2305 is not set
> > # CONFIG_SND_SOC_SSM2518 is not set
> > CONFIG_SND_SOC_SSM2602=3Dm
> > # CONFIG_SND_SOC_SSM2602_SPI is not set
> > CONFIG_SND_SOC_SSM2602_I2C=3Dm
> > # CONFIG_SND_SOC_SSM4567 is not set
> > # CONFIG_SND_SOC_STA32X is not set
> > CONFIG_SND_SOC_STA350=3Dm
> > # CONFIG_SND_SOC_STI_SAS is not set
> > # CONFIG_SND_SOC_TAS2552 is not set
> > CONFIG_SND_SOC_TAS2562=3Dm
> > CONFIG_SND_SOC_TAS2764=3Dm
> > # CONFIG_SND_SOC_TAS2770 is not set
> > CONFIG_SND_SOC_TAS5086=3Dm
> > CONFIG_SND_SOC_TAS571X=3Dm
> > CONFIG_SND_SOC_TAS5720=3Dm
> > CONFIG_SND_SOC_TAS6424=3Dm
> > # CONFIG_SND_SOC_TDA7419 is not set
> > # CONFIG_SND_SOC_TFA9879 is not set
> > # CONFIG_SND_SOC_TFA989X is not set
> > CONFIG_SND_SOC_TLV320ADC3XXX=3Dm
> > CONFIG_SND_SOC_TLV320AIC23=3Dm
> > CONFIG_SND_SOC_TLV320AIC23_I2C=3Dm
> > CONFIG_SND_SOC_TLV320AIC23_SPI=3Dm
> > CONFIG_SND_SOC_TLV320AIC31XX=3Dm
> > CONFIG_SND_SOC_TLV320AIC32X4=3Dm
> > CONFIG_SND_SOC_TLV320AIC32X4_I2C=3Dm
> > CONFIG_SND_SOC_TLV320AIC32X4_SPI=3Dm
> > CONFIG_SND_SOC_TLV320AIC3X=3Dm
> > CONFIG_SND_SOC_TLV320AIC3X_I2C=3Dm
> > CONFIG_SND_SOC_TLV320AIC3X_SPI=3Dm
> > CONFIG_SND_SOC_TLV320ADCX140=3Dm
> > CONFIG_SND_SOC_TS3A227E=3Dm
> > CONFIG_SND_SOC_TSCS42XX=3Dm
> > CONFIG_SND_SOC_TSCS454=3Dm
> > CONFIG_SND_SOC_UDA1334=3Dm
> > # CONFIG_SND_SOC_WCD9335 is not set
> > CONFIG_SND_SOC_WCD_MBHC=3Dm
> > CONFIG_SND_SOC_WCD938X=3Dm
> > CONFIG_SND_SOC_WCD938X_SDW=3Dm
> > CONFIG_SND_SOC_WM8510=3Dm
> > CONFIG_SND_SOC_WM8523=3Dm
> > CONFIG_SND_SOC_WM8524=3Dm
> > CONFIG_SND_SOC_WM8580=3Dm
> > CONFIG_SND_SOC_WM8711=3Dm
> > CONFIG_SND_SOC_WM8728=3Dm
> > CONFIG_SND_SOC_WM8731=3Dm
> > CONFIG_SND_SOC_WM8737=3Dm
> > CONFIG_SND_SOC_WM8741=3Dm
> > CONFIG_SND_SOC_WM8750=3Dm
> > CONFIG_SND_SOC_WM8753=3Dm
> > # CONFIG_SND_SOC_WM8770 is not set
> > # CONFIG_SND_SOC_WM8776 is not set
> > CONFIG_SND_SOC_WM8782=3Dm
> > CONFIG_SND_SOC_WM8804=3Dm
> > CONFIG_SND_SOC_WM8804_I2C=3Dm
> > # CONFIG_SND_SOC_WM8804_SPI is not set
> > CONFIG_SND_SOC_WM8903=3Dm
> > CONFIG_SND_SOC_WM8904=3Dm
> > CONFIG_SND_SOC_WM8960=3Dm
> > CONFIG_SND_SOC_WM8962=3Dm
> > CONFIG_SND_SOC_WM8974=3Dm
> > CONFIG_SND_SOC_WM8978=3Dm
> > CONFIG_SND_SOC_WM8985=3Dm
> > CONFIG_SND_SOC_WSA881X=3Dm
> > # CONFIG_SND_SOC_ZL38060 is not set
> > CONFIG_SND_SOC_MAX9759=3Dm
> > CONFIG_SND_SOC_MT6351=3Dm
> > # CONFIG_SND_SOC_MT6358 is not set
> > CONFIG_SND_SOC_MT6660=3Dm
> > CONFIG_SND_SOC_NAU8315=3Dm
> > CONFIG_SND_SOC_NAU8540=3Dm
> > CONFIG_SND_SOC_NAU8810=3Dm
> > # CONFIG_SND_SOC_NAU8821 is not set
> > # CONFIG_SND_SOC_NAU8822 is not set
> > CONFIG_SND_SOC_NAU8824=3Dm
> > # CONFIG_SND_SOC_TPA6130A2 is not set
> > CONFIG_SND_SOC_LPASS_WSA_MACRO=3Dm
> > CONFIG_SND_SOC_LPASS_VA_MACRO=3Dm
> > CONFIG_SND_SOC_LPASS_RX_MACRO=3Dm
> > CONFIG_SND_SOC_LPASS_TX_MACRO=3Dm
> > # end of CODEC drivers
> > =

> > CONFIG_SND_SIMPLE_CARD_UTILS=3Dm
> > # CONFIG_SND_SIMPLE_CARD is not set
> > CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
> > # CONFIG_SND_AUDIO_GRAPH_CARD2 is not set
> > # CONFIG_SND_TEST_COMPONENT is not set
> > # CONFIG_SND_X86 is not set
> > CONFIG_SND_VIRTIO=3Dm
> > CONFIG_AC97_BUS=3Dm
> > =

> > #
> > # HID support
> > #
> > CONFIG_HID=3Dy
> > # CONFIG_HID_BATTERY_STRENGTH is not set
> > CONFIG_HIDRAW=3Dy
> > # CONFIG_UHID is not set
> > CONFIG_HID_GENERIC=3Dy
> > =

> > #
> > # Special HID drivers
> > #
> > # CONFIG_HID_A4TECH is not set
> > CONFIG_HID_ACCUTOUCH=3Dm
> > CONFIG_HID_ACRUX=3Dm
> > # CONFIG_HID_ACRUX_FF is not set
> > CONFIG_HID_APPLE=3Dy
> > CONFIG_HID_APPLEIR=3Dy
> > CONFIG_HID_ASUS=3Dm
> > CONFIG_HID_AUREAL=3Dy
> > CONFIG_HID_BELKIN=3Dm
> > CONFIG_HID_BETOP_FF=3Dy
> > CONFIG_HID_BIGBEN_FF=3Dm
> > CONFIG_HID_CHERRY=3Dm
> > # CONFIG_HID_CHICONY is not set
> > # CONFIG_HID_CORSAIR is not set
> > # CONFIG_HID_COUGAR is not set
> > CONFIG_HID_MACALLY=3Dm
> > CONFIG_HID_PRODIKEYS=3Dm
> > CONFIG_HID_CMEDIA=3Dm
> > # CONFIG_HID_CP2112 is not set
> > CONFIG_HID_CREATIVE_SB0540=3Dm
> > # CONFIG_HID_CYPRESS is not set
> > # CONFIG_HID_DRAGONRISE is not set
> > # CONFIG_HID_EMS_FF is not set
> > CONFIG_HID_ELAN=3Dm
> > # CONFIG_HID_ELECOM is not set
> > # CONFIG_HID_ELO is not set
> > CONFIG_HID_EZKEY=3Dm
> > CONFIG_HID_FT260=3Dm
> > CONFIG_HID_GEMBIRD=3Dy
> > # CONFIG_HID_GFRM is not set
> > CONFIG_HID_GLORIOUS=3Dy
> > # CONFIG_HID_HOLTEK is not set
> > CONFIG_HID_GOOGLE_HAMMER=3Dm
> > # CONFIG_HID_VIVALDI is not set
> > CONFIG_HID_GT683R=3Dy
> > # CONFIG_HID_KEYTOUCH is not set
> > CONFIG_HID_KYE=3Dy
> > # CONFIG_HID_UCLOGIC is not set
> > CONFIG_HID_WALTOP=3Dy
> > CONFIG_HID_VIEWSONIC=3Dm
> > CONFIG_HID_XIAOMI=3Dm
> > # CONFIG_HID_GYRATION is not set
> > # CONFIG_HID_ICADE is not set
> > CONFIG_HID_ITE=3Dy
> > # CONFIG_HID_JABRA is not set
> > # CONFIG_HID_TWINHAN is not set
> > CONFIG_HID_KENSINGTON=3Dm
> > CONFIG_HID_LCPOWER=3Dy
> > CONFIG_HID_LED=3Dy
> > # CONFIG_HID_LENOVO is not set
> > CONFIG_HID_LETSKETCH=3Dy
> > CONFIG_HID_LOGITECH=3Dm
> > CONFIG_HID_LOGITECH_DJ=3Dm
> > CONFIG_HID_LOGITECH_HIDPP=3Dm
> > # CONFIG_LOGITECH_FF is not set
> > CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> > # CONFIG_LOGIG940_FF is not set
> > CONFIG_LOGIWHEELS_FF=3Dy
> > CONFIG_HID_MAGICMOUSE=3Dm
> > # CONFIG_HID_MALTRON is not set
> > CONFIG_HID_MAYFLASH=3Dm
> > CONFIG_HID_REDRAGON=3Dm
> > CONFIG_HID_MICROSOFT=3Dm
> > CONFIG_HID_MONTEREY=3Dm
> > CONFIG_HID_MULTITOUCH=3Dm
> > CONFIG_HID_NINTENDO=3Dy
> > # CONFIG_NINTENDO_FF is not set
> > CONFIG_HID_NTI=3Dm
> > CONFIG_HID_NTRIG=3Dm
> > CONFIG_HID_ORTEK=3Dy
> > CONFIG_HID_PANTHERLORD=3Dy
> > # CONFIG_PANTHERLORD_FF is not set
> > CONFIG_HID_PENMOUNT=3Dy
> > # CONFIG_HID_PETALYNX is not set
> > CONFIG_HID_PICOLCD=3Dm
> > CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> > CONFIG_HID_PICOLCD_LEDS=3Dy
> > CONFIG_HID_PICOLCD_CIR=3Dy
> > CONFIG_HID_PLANTRONICS=3Dm
> > CONFIG_HID_PLAYSTATION=3Dy
> > CONFIG_PLAYSTATION_FF=3Dy
> > CONFIG_HID_PRIMAX=3Dm
> > # CONFIG_HID_RETRODE is not set
> > CONFIG_HID_ROCCAT=3Dy
> > CONFIG_HID_SAITEK=3Dy
> > # CONFIG_HID_SAMSUNG is not set
> > CONFIG_HID_SEMITEK=3Dm
> > CONFIG_HID_SONY=3Dy
> > # CONFIG_SONY_FF is not set
> > CONFIG_HID_SPEEDLINK=3Dy
> > CONFIG_HID_STEAM=3Dy
> > CONFIG_HID_STEELSERIES=3Dy
> > CONFIG_HID_SUNPLUS=3Dm
> > CONFIG_HID_RMI=3Dy
> > # CONFIG_HID_GREENASIA is not set
> > CONFIG_HID_SMARTJOYPLUS=3Dy
> > CONFIG_SMARTJOYPLUS_FF=3Dy
> > CONFIG_HID_TIVO=3Dm
> > CONFIG_HID_TOPSEED=3Dm
> > CONFIG_HID_THINGM=3Dy
> > CONFIG_HID_THRUSTMASTER=3Dy
> > CONFIG_THRUSTMASTER_FF=3Dy
> > CONFIG_HID_UDRAW_PS3=3Dy
> > # CONFIG_HID_U2FZERO is not set
> > CONFIG_HID_WACOM=3Dm
> > CONFIG_HID_WIIMOTE=3Dm
> > # CONFIG_HID_XINMO is not set
> > CONFIG_HID_ZEROPLUS=3Dm
> > # CONFIG_ZEROPLUS_FF is not set
> > # CONFIG_HID_ZYDACRON is not set
> > CONFIG_HID_SENSOR_HUB=3Dy
> > CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> > # CONFIG_HID_ALPS is not set
> > CONFIG_HID_MCP2221=3Dm
> > # end of Special HID drivers
> > =

> > #
> > # USB HID support
> > #
> > CONFIG_USB_HID=3Dy
> > CONFIG_HID_PID=3Dy
> > # CONFIG_USB_HIDDEV is not set
> > # end of USB HID support
> > =

> > #
> > # I2C HID support
> > #
> > CONFIG_I2C_HID_ACPI=3Dm
> > # CONFIG_I2C_HID_OF is not set
> > CONFIG_I2C_HID_OF_GOODIX=3Dm
> > # end of I2C HID support
> > =

> > CONFIG_I2C_HID_CORE=3Dm
> > # end of HID support
> > =

> > CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> > CONFIG_USB_SUPPORT=3Dy
> > CONFIG_USB_COMMON=3Dy
> > # CONFIG_USB_LED_TRIG is not set
> > CONFIG_USB_ULPI_BUS=3Dm
> > CONFIG_USB_CONN_GPIO=3Dm
> > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > CONFIG_USB=3Dy
> > CONFIG_USB_PCI=3Dy
> > # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> > =

> > #
> > # Miscellaneous USB options
> > #
> > CONFIG_USB_DEFAULT_PERSIST=3Dy
> > CONFIG_USB_FEW_INIT_RETRIES=3Dy
> > # CONFIG_USB_DYNAMIC_MINORS is not set
> > # CONFIG_USB_OTG is not set
> > # CONFIG_USB_OTG_PRODUCTLIST is not set
> > # CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
> > CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> > CONFIG_USB_MON=3Dm
> > =

> > #
> > # USB Host Controller Drivers
> > #
> > CONFIG_USB_C67X00_HCD=3Dy
> > CONFIG_USB_XHCI_HCD=3Dm
> > # CONFIG_USB_XHCI_DBGCAP is not set
> > CONFIG_USB_XHCI_PCI=3Dm
> > CONFIG_USB_XHCI_PCI_RENESAS=3Dm
> > CONFIG_USB_XHCI_PLATFORM=3Dm
> > CONFIG_USB_EHCI_HCD=3Dm
> > # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
> > # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> > CONFIG_USB_EHCI_PCI=3Dm
> > # CONFIG_USB_EHCI_FSL is not set
> > CONFIG_USB_EHCI_HCD_PLATFORM=3Dm
> > # CONFIG_USB_OXU210HP_HCD is not set
> > CONFIG_USB_ISP116X_HCD=3Dm
> > CONFIG_USB_FOTG210_HCD=3Dm
> > # CONFIG_USB_MAX3421_HCD is not set
> > CONFIG_USB_OHCI_HCD=3Dy
> > CONFIG_USB_OHCI_HCD_PCI=3Dy
> > # CONFIG_USB_OHCI_HCD_SSB is not set
> > CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> > # CONFIG_USB_UHCI_HCD is not set
> > CONFIG_USB_U132_HCD=3Dm
> > CONFIG_USB_SL811_HCD=3Dm
> > # CONFIG_USB_SL811_HCD_ISO is not set
> > # CONFIG_USB_R8A66597_HCD is not set
> > # CONFIG_USB_HCD_BCMA is not set
> > CONFIG_USB_HCD_SSB=3Dm
> > # CONFIG_USB_HCD_TEST_MODE is not set
> > =

> > #
> > # USB Device Class drivers
> > #
> > CONFIG_USB_ACM=3Dy
> > CONFIG_USB_PRINTER=3Dm
> > CONFIG_USB_WDM=3Dy
> > CONFIG_USB_TMC=3Dy
> > =

> > #
> > # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> > #
> > =

> > #
> > # also be needed; see USB_STORAGE Help for more info
> > #
> > # CONFIG_USB_STORAGE is not set
> > =

> > #
> > # USB Imaging devices
> > #
> > CONFIG_USB_MDC800=3Dy
> > CONFIG_USB_MICROTEK=3Dy
> > CONFIG_USBIP_CORE=3Dm
> > # CONFIG_USBIP_VHCI_HCD is not set
> > # CONFIG_USBIP_HOST is not set
> > CONFIG_USBIP_VUDC=3Dm
> > CONFIG_USBIP_DEBUG=3Dy
> > CONFIG_USB_CDNS_SUPPORT=3Dm
> > CONFIG_USB_CDNS3=3Dm
> > # CONFIG_USB_CDNS3_GADGET is not set
> > # CONFIG_USB_CDNS3_HOST is not set
> > CONFIG_USB_CDNS3_PCI_WRAP=3Dm
> > # CONFIG_USB_CDNSP_PCI is not set
> > CONFIG_USB_MUSB_HDRC=3Dy
> > CONFIG_USB_MUSB_HOST=3Dy
> > # CONFIG_USB_MUSB_GADGET is not set
> > # CONFIG_USB_MUSB_DUAL_ROLE is not set
> > =

> > #
> > # Platform Glue Layer
> > #
> > =

> > #
> > # MUSB DMA mode
> > #
> > CONFIG_MUSB_PIO_ONLY=3Dy
> > CONFIG_USB_DWC3=3Dm
> > # CONFIG_USB_DWC3_ULPI is not set
> > # CONFIG_USB_DWC3_HOST is not set
> > # CONFIG_USB_DWC3_GADGET is not set
> > CONFIG_USB_DWC3_DUAL_ROLE=3Dy
> > =

> > #
> > # Platform Glue Driver Support
> > #
> > CONFIG_USB_DWC3_PCI=3Dm
> > CONFIG_USB_DWC3_HAPS=3Dm
> > # CONFIG_USB_DWC3_OF_SIMPLE is not set
> > CONFIG_USB_DWC2=3Dm
> > # CONFIG_USB_DWC2_HOST is not set
> > =

> > #
> > # Gadget/Dual-role mode requires USB Gadget support to be enabled
> > #
> > CONFIG_USB_DWC2_PERIPHERAL=3Dy
> > # CONFIG_USB_DWC2_DUAL_ROLE is not set
> > # CONFIG_USB_DWC2_PCI is not set
> > # CONFIG_USB_DWC2_DEBUG is not set
> > # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> > CONFIG_USB_CHIPIDEA=3Dm
> > # CONFIG_USB_CHIPIDEA_UDC is not set
> > # CONFIG_USB_CHIPIDEA_HOST is not set
> > CONFIG_USB_CHIPIDEA_PCI=3Dm
> > CONFIG_USB_CHIPIDEA_MSM=3Dm
> > CONFIG_USB_CHIPIDEA_IMX=3Dm
> > CONFIG_USB_CHIPIDEA_GENERIC=3Dm
> > CONFIG_USB_CHIPIDEA_TEGRA=3Dm
> > CONFIG_USB_ISP1760=3Dm
> > CONFIG_USB_ISP1760_HCD=3Dy
> > CONFIG_USB_ISP1760_HOST_ROLE=3Dy
> > # CONFIG_USB_ISP1760_GADGET_ROLE is not set
> > # CONFIG_USB_ISP1760_DUAL_ROLE is not set
> > =

> > #
> > # USB port drivers
> > #
> > CONFIG_USB_SERIAL=3Dy
> > # CONFIG_USB_SERIAL_CONSOLE is not set
> > # CONFIG_USB_SERIAL_GENERIC is not set
> > CONFIG_USB_SERIAL_SIMPLE=3Dy
> > CONFIG_USB_SERIAL_AIRCABLE=3Dm
> > CONFIG_USB_SERIAL_ARK3116=3Dm
> > CONFIG_USB_SERIAL_BELKIN=3Dm
> > CONFIG_USB_SERIAL_CH341=3Dy
> > CONFIG_USB_SERIAL_WHITEHEAT=3Dy
> > CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dy
> > CONFIG_USB_SERIAL_CP210X=3Dm
> > CONFIG_USB_SERIAL_CYPRESS_M8=3Dy
> > CONFIG_USB_SERIAL_EMPEG=3Dm
> > CONFIG_USB_SERIAL_FTDI_SIO=3Dm
> > CONFIG_USB_SERIAL_VISOR=3Dy
> > # CONFIG_USB_SERIAL_IPAQ is not set
> > CONFIG_USB_SERIAL_IR=3Dy
> > # CONFIG_USB_SERIAL_EDGEPORT is not set
> > # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> > CONFIG_USB_SERIAL_F81232=3Dy
> > CONFIG_USB_SERIAL_F8153X=3Dm
> > CONFIG_USB_SERIAL_GARMIN=3Dm
> > CONFIG_USB_SERIAL_IPW=3Dm
> > # CONFIG_USB_SERIAL_IUU is not set
> > CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dy
> > CONFIG_USB_SERIAL_KEYSPAN=3Dm
> > CONFIG_USB_SERIAL_KLSI=3Dy
> > # CONFIG_USB_SERIAL_KOBIL_SCT is not set
> > CONFIG_USB_SERIAL_MCT_U232=3Dm
> > CONFIG_USB_SERIAL_METRO=3Dm
> > CONFIG_USB_SERIAL_MOS7720=3Dy
> > CONFIG_USB_SERIAL_MOS7840=3Dm
> > # CONFIG_USB_SERIAL_MXUPORT is not set
> > CONFIG_USB_SERIAL_NAVMAN=3Dy
> > # CONFIG_USB_SERIAL_PL2303 is not set
> > CONFIG_USB_SERIAL_OTI6858=3Dy
> > CONFIG_USB_SERIAL_QCAUX=3Dm
> > # CONFIG_USB_SERIAL_QUALCOMM is not set
> > CONFIG_USB_SERIAL_SPCP8X5=3Dy
> > # CONFIG_USB_SERIAL_SAFE is not set
> > # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
> > CONFIG_USB_SERIAL_SYMBOL=3Dy
> > CONFIG_USB_SERIAL_TI=3Dm
> > CONFIG_USB_SERIAL_CYBERJACK=3Dm
> > CONFIG_USB_SERIAL_WWAN=3Dy
> > CONFIG_USB_SERIAL_OPTION=3Dy
> > CONFIG_USB_SERIAL_OMNINET=3Dy
> > CONFIG_USB_SERIAL_OPTICON=3Dy
> > CONFIG_USB_SERIAL_XSENS_MT=3Dm
> > # CONFIG_USB_SERIAL_WISHBONE is not set
> > CONFIG_USB_SERIAL_SSU100=3Dm
> > # CONFIG_USB_SERIAL_QT2 is not set
> > CONFIG_USB_SERIAL_UPD78F0730=3Dy
> > # CONFIG_USB_SERIAL_XR is not set
> > CONFIG_USB_SERIAL_DEBUG=3Dy
> > =

> > #
> > # USB Miscellaneous drivers
> > #
> > CONFIG_USB_EMI62=3Dy
> > CONFIG_USB_EMI26=3Dy
> > CONFIG_USB_ADUTUX=3Dm
> > CONFIG_USB_SEVSEG=3Dm
> > CONFIG_USB_LEGOTOWER=3Dm
> > CONFIG_USB_LCD=3Dy
> > # CONFIG_USB_CYPRESS_CY7C63 is not set
> > CONFIG_USB_CYTHERM=3Dm
> > CONFIG_USB_IDMOUSE=3Dm
> > CONFIG_USB_FTDI_ELAN=3Dm
> > CONFIG_USB_APPLEDISPLAY=3Dy
> > # CONFIG_APPLE_MFI_FASTCHARGE is not set
> > # CONFIG_USB_SISUSBVGA is not set
> > CONFIG_USB_LD=3Dm
> > CONFIG_USB_TRANCEVIBRATOR=3Dy
> > CONFIG_USB_IOWARRIOR=3Dy
> > # CONFIG_USB_TEST is not set
> > # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> > CONFIG_USB_ISIGHTFW=3Dy
> > CONFIG_USB_YUREX=3Dm
> > CONFIG_USB_EZUSB_FX2=3Dy
> > CONFIG_USB_HUB_USB251XB=3Dm
> > CONFIG_USB_HSIC_USB3503=3Dm
> > # CONFIG_USB_HSIC_USB4604 is not set
> > # CONFIG_USB_LINK_LAYER_TEST is not set
> > CONFIG_USB_CHAOSKEY=3Dy
> > CONFIG_USB_ATM=3Dy
> > # CONFIG_USB_SPEEDTOUCH is not set
> > CONFIG_USB_CXACRU=3Dy
> > CONFIG_USB_UEAGLEATM=3Dy
> > CONFIG_USB_XUSBATM=3Dy
> > =

> > #
> > # USB Physical Layer drivers
> > #
> > CONFIG_USB_PHY=3Dy
> > CONFIG_NOP_USB_XCEIV=3Dm
> > CONFIG_USB_GPIO_VBUS=3Dm
> > CONFIG_TAHVO_USB=3Dm
> > # CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
> > CONFIG_USB_ISP1301=3Dm
> > # end of USB Physical Layer drivers
> > =

> > CONFIG_USB_GADGET=3Dy
> > # CONFIG_USB_GADGET_DEBUG is not set
> > CONFIG_USB_GADGET_DEBUG_FILES=3Dy
> > CONFIG_USB_GADGET_DEBUG_FS=3Dy
> > CONFIG_USB_GADGET_VBUS_DRAW=3D2
> > CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> > # CONFIG_U_SERIAL_CONSOLE is not set
> > =

> > #
> > # USB Peripheral Controller
> > #
> > CONFIG_USB_FUSB300=3Dy
> > # CONFIG_USB_FOTG210_UDC is not set
> > CONFIG_USB_GR_UDC=3Dm
> > CONFIG_USB_R8A66597=3Dm
> > CONFIG_USB_PXA27X=3Dm
> > CONFIG_USB_MV_UDC=3Dy
> > # CONFIG_USB_MV_U3D is not set
> > CONFIG_USB_SNP_CORE=3Dm
> > CONFIG_USB_SNP_UDC_PLAT=3Dm
> > # CONFIG_USB_M66592 is not set
> > # CONFIG_USB_BDC_UDC is not set
> > # CONFIG_USB_AMD5536UDC is not set
> > # CONFIG_USB_NET2272 is not set
> > # CONFIG_USB_NET2280 is not set
> > # CONFIG_USB_GOKU is not set
> > # CONFIG_USB_EG20T is not set
> > CONFIG_USB_GADGET_XILINX=3Dy
> > # CONFIG_USB_MAX3420_UDC is not set
> > CONFIG_USB_DUMMY_HCD=3Dy
> > # end of USB Peripheral Controller
> > =

> > CONFIG_USB_LIBCOMPOSITE=3Dy
> > CONFIG_USB_F_ACM=3Dy
> > CONFIG_USB_U_SERIAL=3Dy
> > CONFIG_USB_U_ETHER=3Dy
> > CONFIG_USB_F_SERIAL=3Dy
> > CONFIG_USB_F_OBEX=3Dy
> > CONFIG_USB_F_NCM=3Dy
> > CONFIG_USB_F_ECM=3Dy
> > CONFIG_USB_F_EEM=3Dy
> > CONFIG_USB_F_SUBSET=3Dy
> > CONFIG_USB_F_RNDIS=3Dm
> > CONFIG_USB_F_MASS_STORAGE=3Dm
> > CONFIG_USB_F_MIDI=3Dm
> > CONFIG_USB_F_HID=3Dy
> > CONFIG_USB_F_PRINTER=3Dm
> > # CONFIG_USB_CONFIGFS is not set
> > =

> > #
> > # USB Gadget precomposed configurations
> > #
> > # CONFIG_USB_ZERO is not set
> > # CONFIG_USB_AUDIO is not set
> > CONFIG_USB_ETH=3Dy
> > # CONFIG_USB_ETH_RNDIS is not set
> > CONFIG_USB_ETH_EEM=3Dy
> > CONFIG_USB_G_NCM=3Dy
> > CONFIG_USB_GADGETFS=3Dy
> > # CONFIG_USB_FUNCTIONFS is not set
> > # CONFIG_USB_MASS_STORAGE is not set
> > CONFIG_USB_G_SERIAL=3Dy
> > CONFIG_USB_MIDI_GADGET=3Dm
> > CONFIG_USB_G_PRINTER=3Dm
> > # CONFIG_USB_CDC_COMPOSITE is not set
> > # CONFIG_USB_G_ACM_MS is not set
> > CONFIG_USB_G_MULTI=3Dm
> > CONFIG_USB_G_MULTI_RNDIS=3Dy
> > # CONFIG_USB_G_MULTI_CDC is not set
> > CONFIG_USB_G_HID=3Dy
> > CONFIG_USB_G_DBGP=3Dm
> > # CONFIG_USB_G_DBGP_PRINTK is not set
> > CONFIG_USB_G_DBGP_SERIAL=3Dy
> > # CONFIG_USB_G_WEBCAM is not set
> > # CONFIG_USB_RAW_GADGET is not set
> > # end of USB Gadget precomposed configurations
> > =

> > CONFIG_TYPEC=3Dy
> > CONFIG_TYPEC_TCPM=3Dy
> > # CONFIG_TYPEC_TCPCI is not set
> > # CONFIG_TYPEC_FUSB302 is not set
> > CONFIG_TYPEC_UCSI=3Dy
> > CONFIG_UCSI_CCG=3Dy
> > # CONFIG_UCSI_ACPI is not set
> > # CONFIG_TYPEC_TPS6598X is not set
> > CONFIG_TYPEC_HD3SS3220=3Dm
> > CONFIG_TYPEC_STUSB160X=3Dy
> > =

> > #
> > # USB Type-C Multiplexer/DeMultiplexer Switch support
> > #
> > # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> > # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> > =

> > #
> > # USB Type-C Alternate Mode drivers
> > #
> > CONFIG_TYPEC_DP_ALTMODE=3Dm
> > # CONFIG_TYPEC_NVIDIA_ALTMODE is not set
> > # end of USB Type-C Alternate Mode drivers
> > =

> > CONFIG_USB_ROLE_SWITCH=3Dy
> > CONFIG_USB_ROLES_INTEL_XHCI=3Dy
> > CONFIG_MMC=3Dm
> > CONFIG_PWRSEQ_EMMC=3Dm
> > CONFIG_PWRSEQ_SIMPLE=3Dm
> > CONFIG_MMC_BLOCK=3Dm
> > CONFIG_MMC_BLOCK_MINORS=3D8
> > CONFIG_SDIO_UART=3Dm
> > # CONFIG_MMC_TEST is not set
> > =

> > #
> > # MMC/SD/SDIO Host Controller Drivers
> > #
> > CONFIG_MMC_DEBUG=3Dy
> > # CONFIG_MMC_SDHCI is not set
> > CONFIG_MMC_WBSD=3Dm
> > # CONFIG_MMC_TIFM_SD is not set
> > CONFIG_MMC_SPI=3Dm
> > # CONFIG_MMC_CB710 is not set
> > # CONFIG_MMC_VIA_SDMMC is not set
> > CONFIG_MMC_VUB300=3Dm
> > # CONFIG_MMC_USHC is not set
> > CONFIG_MMC_USDHI6ROL0=3Dm
> > CONFIG_MMC_CQHCI=3Dm
> > CONFIG_MMC_HSQ=3Dm
> > # CONFIG_MMC_TOSHIBA_PCI is not set
> > CONFIG_MMC_MTK=3Dm
> > CONFIG_MEMSTICK=3Dy
> > # CONFIG_MEMSTICK_DEBUG is not set
> > =

> > #
> > # MemoryStick drivers
> > #
> > # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> > CONFIG_MSPRO_BLOCK=3Dy
> > CONFIG_MS_BLOCK=3Dy
> > =

> > #
> > # MemoryStick Host Controller Drivers
> > #
> > # CONFIG_MEMSTICK_TIFM_MS is not set
> > # CONFIG_MEMSTICK_JMICRON_38X is not set
> > # CONFIG_MEMSTICK_R592 is not set
> > CONFIG_NEW_LEDS=3Dy
> > CONFIG_LEDS_CLASS=3Dy
> > CONFIG_LEDS_CLASS_FLASH=3Dy
> > CONFIG_LEDS_CLASS_MULTICOLOR=3Dy
> > # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> > =

> > #
> > # LED drivers
> > #
> > # CONFIG_LEDS_AN30259A is not set
> > CONFIG_LEDS_APU=3Dy
> > # CONFIG_LEDS_AW2013 is not set
> > # CONFIG_LEDS_BCM6328 is not set
> > CONFIG_LEDS_BCM6358=3Dm
> > # CONFIG_LEDS_CR0014114 is not set
> > CONFIG_LEDS_EL15203000=3Dy
> > CONFIG_LEDS_LM3530=3Dm
> > CONFIG_LEDS_LM3532=3Dy
> > # CONFIG_LEDS_LM3533 is not set
> > CONFIG_LEDS_LM3642=3Dm
> > CONFIG_LEDS_LM3692X=3Dm
> > CONFIG_LEDS_MT6323=3Dm
> > CONFIG_LEDS_NET48XX=3Dm
> > CONFIG_LEDS_WRAP=3Dm
> > CONFIG_LEDS_PCA9532=3Dm
> > CONFIG_LEDS_PCA9532_GPIO=3Dy
> > # CONFIG_LEDS_GPIO is not set
> > CONFIG_LEDS_LP3944=3Dy
> > CONFIG_LEDS_LP3952=3Dm
> > CONFIG_LEDS_LP50XX=3Dy
> > CONFIG_LEDS_LP55XX_COMMON=3Dm
> > CONFIG_LEDS_LP5521=3Dm
> > # CONFIG_LEDS_LP5523 is not set
> > # CONFIG_LEDS_LP5562 is not set
> > CONFIG_LEDS_LP8501=3Dm
> > CONFIG_LEDS_LP8860=3Dy
> > CONFIG_LEDS_CLEVO_MAIL=3Dm
> > CONFIG_LEDS_PCA955X=3Dy
> > # CONFIG_LEDS_PCA955X_GPIO is not set
> > # CONFIG_LEDS_PCA963X is not set
> > CONFIG_LEDS_WM831X_STATUS=3Dy
> > # CONFIG_LEDS_DA9052 is not set
> > CONFIG_LEDS_DAC124S085=3Dm
> > # CONFIG_LEDS_REGULATOR is not set
> > CONFIG_LEDS_BD2802=3Dy
> > # CONFIG_LEDS_INTEL_SS4200 is not set
> > CONFIG_LEDS_LT3593=3Dy
> > CONFIG_LEDS_MC13783=3Dy
> > CONFIG_LEDS_TCA6507=3Dy
> > # CONFIG_LEDS_TLC591XX is not set
> > CONFIG_LEDS_LM355x=3Dy
> > # CONFIG_LEDS_OT200 is not set
> > CONFIG_LEDS_MENF21BMC=3Dm
> > CONFIG_LEDS_IS31FL319X=3Dy
> > CONFIG_LEDS_IS31FL32XX=3Dm
> > =

> > #
> > # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID=
_THINGM)
> > #
> > CONFIG_LEDS_BLINKM=3Dy
> > # CONFIG_LEDS_SYSCON is not set
> > CONFIG_LEDS_MLXCPLD=3Dy
> > # CONFIG_LEDS_MLXREG is not set
> > CONFIG_LEDS_USER=3Dm
> > CONFIG_LEDS_NIC78BX=3Dm
> > CONFIG_LEDS_SPI_BYTE=3Dm
> > CONFIG_LEDS_TI_LMU_COMMON=3Dm
> > CONFIG_LEDS_LM3697=3Dm
> > CONFIG_LEDS_LM36274=3Dm
> > CONFIG_LEDS_LGM=3Dy
> > =

> > #
> > # Flash and Torch LED drivers
> > #
> > CONFIG_LEDS_AAT1290=3Dm
> > # CONFIG_LEDS_AS3645A is not set
> > CONFIG_LEDS_KTD2692=3Dm
> > CONFIG_LEDS_LM3601X=3Dm
> > CONFIG_LEDS_RT4505=3Dm
> > # CONFIG_LEDS_RT8515 is not set
> > CONFIG_LEDS_SGM3140=3Dm
> > =

> > #
> > # LED Triggers
> > #
> > CONFIG_LEDS_TRIGGERS=3Dy
> > CONFIG_LEDS_TRIGGER_TIMER=3Dm
> > CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> > CONFIG_LEDS_TRIGGER_DISK=3Dy
> > CONFIG_LEDS_TRIGGER_MTD=3Dy
> > # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
> > CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> > # CONFIG_LEDS_TRIGGER_CPU is not set
> > # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> > CONFIG_LEDS_TRIGGER_GPIO=3Dy
> > # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
> > =

> > #
> > # iptables trigger is under Netfilter config (LED target)
> > #
> > # CONFIG_LEDS_TRIGGER_TRANSIENT is not set
> > # CONFIG_LEDS_TRIGGER_CAMERA is not set
> > # CONFIG_LEDS_TRIGGER_PANIC is not set
> > CONFIG_LEDS_TRIGGER_NETDEV=3Dy
> > CONFIG_LEDS_TRIGGER_PATTERN=3Dm
> > CONFIG_LEDS_TRIGGER_AUDIO=3Dm
> > CONFIG_LEDS_TRIGGER_TTY=3Dy
> > =

> > #
> > # Simple LED drivers
> > #
> > # CONFIG_ACCESSIBILITY is not set
> > # CONFIG_INFINIBAND is not set
> > CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> > CONFIG_EDAC_SUPPORT=3Dy
> > CONFIG_EDAC=3Dm
> > CONFIG_EDAC_LEGACY_SYSFS=3Dy
> > CONFIG_EDAC_DEBUG=3Dy
> > # CONFIG_EDAC_AMD76X is not set
> > # CONFIG_EDAC_E7XXX is not set
> > # CONFIG_EDAC_E752X is not set
> > # CONFIG_EDAC_I82875P is not set
> > # CONFIG_EDAC_I82975X is not set
> > # CONFIG_EDAC_I3000 is not set
> > # CONFIG_EDAC_I3200 is not set
> > # CONFIG_EDAC_IE31200 is not set
> > # CONFIG_EDAC_X38 is not set
> > # CONFIG_EDAC_I5400 is not set
> > # CONFIG_EDAC_I82860 is not set
> > # CONFIG_EDAC_R82600 is not set
> > # CONFIG_EDAC_I5000 is not set
> > # CONFIG_EDAC_I5100 is not set
> > # CONFIG_EDAC_I7300 is not set
> > CONFIG_RTC_LIB=3Dy
> > CONFIG_RTC_MC146818_LIB=3Dy
> > # CONFIG_RTC_CLASS is not set
> > # CONFIG_DMADEVICES is not set
> > =

> > #
> > # DMABUF options
> > #
> > CONFIG_SYNC_FILE=3Dy
> > # CONFIG_SW_SYNC is not set
> > # CONFIG_UDMABUF is not set
> > # CONFIG_DMABUF_MOVE_NOTIFY is not set
> > CONFIG_DMABUF_DEBUG=3Dy
> > # CONFIG_DMABUF_SELFTESTS is not set
> > # CONFIG_DMABUF_HEAPS is not set
> > CONFIG_DMABUF_SYSFS_STATS=3Dy
> > # end of DMABUF options
> > =

> > # CONFIG_AUXDISPLAY is not set
> > CONFIG_UIO=3Dm
> > # CONFIG_UIO_CIF is not set
> > CONFIG_UIO_PDRV_GENIRQ=3Dm
> > CONFIG_UIO_DMEM_GENIRQ=3Dm
> > # CONFIG_UIO_AEC is not set
> > # CONFIG_UIO_SERCOS3 is not set
> > # CONFIG_UIO_PCI_GENERIC is not set
> > # CONFIG_UIO_NETX is not set
> > CONFIG_UIO_PRUSS=3Dm
> > # CONFIG_UIO_MF624 is not set
> > CONFIG_UIO_DFL=3Dm
> > # CONFIG_VFIO is not set
> > CONFIG_IRQ_BYPASS_MANAGER=3Dm
> > # CONFIG_VIRT_DRIVERS is not set
> > CONFIG_VIRTIO=3Dy
> > CONFIG_VIRTIO_MENU=3Dy
> > # CONFIG_VIRTIO_PCI is not set
> > CONFIG_VIRTIO_VDPA=3Dm
> > CONFIG_VIRTIO_BALLOON=3Dm
> > CONFIG_VIRTIO_INPUT=3Dm
> > CONFIG_VIRTIO_MMIO=3Dy
> > # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> > CONFIG_VDPA=3Dm
> > CONFIG_VDPA_USER=3Dm
> > CONFIG_VHOST_IOTLB=3Dy
> > CONFIG_VHOST=3Dy
> > CONFIG_VHOST_MENU=3Dy
> > CONFIG_VHOST_NET=3Dm
> > CONFIG_VHOST_VSOCK=3Dy
> > CONFIG_VHOST_VDPA=3Dm
> > CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> > =

> > #
> > # Microsoft Hyper-V guest support
> > #
> > # end of Microsoft Hyper-V guest support
> > =

> > CONFIG_GREYBUS=3Dy
> > CONFIG_GREYBUS_ES2=3Dm
> > # CONFIG_COMEDI is not set
> > # CONFIG_STAGING is not set
> > # CONFIG_X86_PLATFORM_DEVICES is not set
> > CONFIG_PMC_ATOM=3Dy
> > CONFIG_CHROME_PLATFORMS=3Dy
> > CONFIG_CHROMEOS_LAPTOP=3Dy
> > # CONFIG_CHROMEOS_PSTORE is not set
> > CONFIG_CHROMEOS_TBMC=3Dy
> > CONFIG_CROS_EC=3Dy
> > CONFIG_CROS_EC_I2C=3Dy
> > CONFIG_CROS_EC_RPMSG=3Dm
> > # CONFIG_CROS_EC_SPI is not set
> > CONFIG_CROS_EC_LPC=3Dm
> > CONFIG_CROS_EC_PROTO=3Dy
> > CONFIG_CROS_KBD_LED_BACKLIGHT=3Dm
> > # CONFIG_CROS_EC_CHARDEV is not set
> > # CONFIG_CROS_EC_LIGHTBAR is not set
> > CONFIG_CROS_EC_VBC=3Dm
> > # CONFIG_CROS_EC_DEBUGFS is not set
> > CONFIG_CROS_EC_SENSORHUB=3Dm
> > CONFIG_CROS_EC_SYSFS=3Dm
> > # CONFIG_CROS_USBPD_NOTIFY is not set
> > CONFIG_WILCO_EC=3Dm
> > # CONFIG_WILCO_EC_DEBUGFS is not set
> > CONFIG_WILCO_EC_EVENTS=3Dm
> > CONFIG_WILCO_EC_TELEMETRY=3Dm
> > # CONFIG_MELLANOX_PLATFORM is not set
> > CONFIG_OLPC_EC=3Dy
> > # CONFIG_SURFACE_PLATFORMS is not set
> > CONFIG_HAVE_CLK=3Dy
> > CONFIG_HAVE_CLK_PREPARE=3Dy
> > CONFIG_COMMON_CLK=3Dy
> > # CONFIG_COMMON_CLK_WM831X is not set
> > CONFIG_LMK04832=3Dy
> > # CONFIG_COMMON_CLK_MAX77686 is not set
> > # CONFIG_COMMON_CLK_MAX9485 is not set
> > CONFIG_COMMON_CLK_SI5341=3Dy
> > CONFIG_COMMON_CLK_SI5351=3Dm
> > CONFIG_COMMON_CLK_SI514=3Dm
> > CONFIG_COMMON_CLK_SI544=3Dm
> > CONFIG_COMMON_CLK_SI570=3Dm
> > # CONFIG_COMMON_CLK_CDCE706 is not set
> > # CONFIG_COMMON_CLK_CDCE925 is not set
> > CONFIG_COMMON_CLK_CS2000_CP=3Dy
> > # CONFIG_COMMON_CLK_LAN966X is not set
> > CONFIG_CLK_TWL6040=3Dm
> > CONFIG_COMMON_CLK_AXI_CLKGEN=3Dy
> > CONFIG_COMMON_CLK_LOCHNAGAR=3Dm
> > # CONFIG_COMMON_CLK_VC5 is not set
> > CONFIG_COMMON_CLK_FIXED_MMIO=3Dy
> > CONFIG_CLK_LGM_CGU=3Dy
> > # CONFIG_XILINX_VCU is not set
> > # CONFIG_HWSPINLOCK is not set
> > =

> > #
> > # Clock Source drivers
> > #
> > CONFIG_CLKSRC_I8253=3Dy
> > CONFIG_CLKEVT_I8253=3Dy
> > CONFIG_I8253_LOCK=3Dy
> > CONFIG_CLKBLD_I8253=3Dy
> > # CONFIG_MICROCHIP_PIT64B is not set
> > # end of Clock Source drivers
> > =

> > # CONFIG_MAILBOX is not set
> > CONFIG_IOMMU_IOVA=3Dm
> > CONFIG_IOMMU_SUPPORT=3Dy
> > =

> > #
> > # Generic IOMMU Pagetable Support
> > #
> > # end of Generic IOMMU Pagetable Support
> > =

> > # CONFIG_IOMMU_DEBUGFS is not set
> > # CONFIG_VIRTIO_IOMMU is not set
> > =

> > #
> > # Remoteproc drivers
> > #
> > CONFIG_REMOTEPROC=3Dy
> > CONFIG_REMOTEPROC_CDEV=3Dy
> > # end of Remoteproc drivers
> > =

> > #
> > # Rpmsg drivers
> > #
> > CONFIG_RPMSG=3Dm
> > CONFIG_RPMSG_CHAR=3Dm
> > CONFIG_RPMSG_NS=3Dm
> > CONFIG_RPMSG_VIRTIO=3Dm
> > # end of Rpmsg drivers
> > =

> > CONFIG_SOUNDWIRE=3Dm
> > =

> > #
> > # SoundWire Devices
> > #
> > # CONFIG_SOUNDWIRE_INTEL is not set
> > # CONFIG_SOUNDWIRE_QCOM is not set
> > =

> > #
> > # SOC (System On Chip) specific Drivers
> > #
> > =

> > #
> > # Amlogic SoC drivers
> > #
> > # end of Amlogic SoC drivers
> > =

> > #
> > # Broadcom SoC drivers
> > #
> > # end of Broadcom SoC drivers
> > =

> > #
> > # NXP/Freescale QorIQ SoC drivers
> > #
> > # end of NXP/Freescale QorIQ SoC drivers
> > =

> > #
> > # i.MX SoC drivers
> > #
> > # end of i.MX SoC drivers
> > =

> > #
> > # Enable LiteX SoC Builder specific drivers
> > #
> > # CONFIG_LITEX_SOC_CONTROLLER is not set
> > # end of Enable LiteX SoC Builder specific drivers
> > =

> > #
> > # Qualcomm SoC drivers
> > #
> > # end of Qualcomm SoC drivers
> > =

> > CONFIG_SOC_TI=3Dy
> > =

> > #
> > # Xilinx SoC drivers
> > #
> > # end of Xilinx SoC drivers
> > # end of SOC (System On Chip) specific Drivers
> > =

> > CONFIG_PM_DEVFREQ=3Dy
> > =

> > #
> > # DEVFREQ Governors
> > #
> > CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> > # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> > CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
> > # CONFIG_DEVFREQ_GOV_USERSPACE is not set
> > CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
> > =

> > #
> > # DEVFREQ Drivers
> > #
> > CONFIG_PM_DEVFREQ_EVENT=3Dy
> > CONFIG_EXTCON=3Dy
> > =

> > #
> > # Extcon Device Drivers
> > #
> > # CONFIG_EXTCON_ADC_JACK is not set
> > # CONFIG_EXTCON_FSA9480 is not set
> > CONFIG_EXTCON_GPIO=3Dy
> > CONFIG_EXTCON_INTEL_INT3496=3Dm
> > CONFIG_EXTCON_MAX14577=3Dm
> > CONFIG_EXTCON_MAX3355=3Dm
> > # CONFIG_EXTCON_MAX77843 is not set
> > # CONFIG_EXTCON_PTN5150 is not set
> > # CONFIG_EXTCON_RT8973A is not set
> > CONFIG_EXTCON_SM5502=3Dy
> > CONFIG_EXTCON_USB_GPIO=3Dy
> > # CONFIG_EXTCON_USBC_CROS_EC is not set
> > CONFIG_EXTCON_USBC_TUSB320=3Dy
> > # CONFIG_MEMORY is not set
> > CONFIG_IIO=3Dy
> > CONFIG_IIO_BUFFER=3Dy
> > CONFIG_IIO_BUFFER_CB=3Dm
> > CONFIG_IIO_BUFFER_DMA=3Dy
> > CONFIG_IIO_BUFFER_DMAENGINE=3Dy
> > CONFIG_IIO_BUFFER_HW_CONSUMER=3Dy
> > CONFIG_IIO_KFIFO_BUF=3Dy
> > CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> > CONFIG_IIO_CONFIGFS=3Dm
> > CONFIG_IIO_TRIGGER=3Dy
> > CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> > CONFIG_IIO_SW_DEVICE=3Dm
> > CONFIG_IIO_SW_TRIGGER=3Dm
> > CONFIG_IIO_TRIGGERED_EVENT=3Dm
> > =

> > #
> > # Accelerometers
> > #
> > CONFIG_ADIS16201=3Dm
> > CONFIG_ADIS16209=3Dy
> > CONFIG_ADXL313=3Dm
> > CONFIG_ADXL313_I2C=3Dm
> > CONFIG_ADXL313_SPI=3Dm
> > CONFIG_ADXL355=3Dm
> > # CONFIG_ADXL355_I2C is not set
> > CONFIG_ADXL355_SPI=3Dm
> > CONFIG_ADXL372=3Dm
> > # CONFIG_ADXL372_SPI is not set
> > CONFIG_ADXL372_I2C=3Dm
> > # CONFIG_BMA220 is not set
> > # CONFIG_BMA400 is not set
> > CONFIG_BMC150_ACCEL=3Dm
> > CONFIG_BMC150_ACCEL_I2C=3Dm
> > CONFIG_BMC150_ACCEL_SPI=3Dm
> > CONFIG_BMI088_ACCEL=3Dy
> > CONFIG_BMI088_ACCEL_SPI=3Dy
> > CONFIG_DA280=3Dm
> > CONFIG_DA311=3Dy
> > CONFIG_DMARD06=3Dm
> > CONFIG_DMARD09=3Dy
> > # CONFIG_DMARD10 is not set
> > CONFIG_FXLS8962AF=3Dm
> > # CONFIG_FXLS8962AF_I2C is not set
> > CONFIG_FXLS8962AF_SPI=3Dm
> > CONFIG_HID_SENSOR_ACCEL_3D=3Dm
> > CONFIG_KXSD9=3Dy
> > CONFIG_KXSD9_SPI=3Dm
> > CONFIG_KXSD9_I2C=3Dm
> > CONFIG_KXCJK1013=3Dm
> > CONFIG_MC3230=3Dm
> > CONFIG_MMA7455=3Dm
> > CONFIG_MMA7455_I2C=3Dm
> > CONFIG_MMA7455_SPI=3Dm
> > # CONFIG_MMA7660 is not set
> > # CONFIG_MMA8452 is not set
> > # CONFIG_MMA9551 is not set
> > # CONFIG_MMA9553 is not set
> > # CONFIG_MXC4005 is not set
> > CONFIG_MXC6255=3Dm
> > CONFIG_SCA3000=3Dm
> > CONFIG_SCA3300=3Dm
> > # CONFIG_STK8312 is not set
> > CONFIG_STK8BA50=3Dm
> > # end of Accelerometers
> > =

> > #
> > # Analog to digital converters
> > #
> > CONFIG_AD_SIGMA_DELTA=3Dy
> > CONFIG_AD7091R5=3Dy
> > CONFIG_AD7124=3Dy
> > CONFIG_AD7192=3Dm
> > CONFIG_AD7266=3Dm
> > CONFIG_AD7291=3Dm
> > CONFIG_AD7292=3Dy
> > CONFIG_AD7298=3Dy
> > CONFIG_AD7476=3Dy
> > CONFIG_AD7606=3Dy
> > CONFIG_AD7606_IFACE_PARALLEL=3Dm
> > CONFIG_AD7606_IFACE_SPI=3Dy
> > # CONFIG_AD7766 is not set
> > CONFIG_AD7768_1=3Dm
> > CONFIG_AD7780=3Dy
> > CONFIG_AD7791=3Dy
> > CONFIG_AD7793=3Dy
> > # CONFIG_AD7887 is not set
> > CONFIG_AD7923=3Dy
> > # CONFIG_AD7949 is not set
> > CONFIG_AD799X=3Dy
> > # CONFIG_ADI_AXI_ADC is not set
> > CONFIG_CC10001_ADC=3Dm
> > CONFIG_DLN2_ADC=3Dm
> > CONFIG_ENVELOPE_DETECTOR=3Dm
> > CONFIG_HI8435=3Dm
> > CONFIG_HX711=3Dy
> > CONFIG_INA2XX_ADC=3Dm
> > # CONFIG_LTC2471 is not set
> > CONFIG_LTC2485=3Dy
> > # CONFIG_LTC2496 is not set
> > # CONFIG_LTC2497 is not set
> > # CONFIG_MAX1027 is not set
> > # CONFIG_MAX11100 is not set
> > CONFIG_MAX1118=3Dm
> > # CONFIG_MAX1241 is not set
> > CONFIG_MAX1363=3Dy
> > # CONFIG_MAX9611 is not set
> > # CONFIG_MCP320X is not set
> > CONFIG_MCP3422=3Dm
> > CONFIG_MCP3911=3Dy
> > CONFIG_MEN_Z188_ADC=3Dm
> > # CONFIG_MP2629_ADC is not set
> > CONFIG_NAU7802=3Dm
> > CONFIG_QCOM_VADC_COMMON=3Dy
> > CONFIG_QCOM_SPMI_IADC=3Dy
> > CONFIG_QCOM_SPMI_VADC=3Dm
> > CONFIG_QCOM_SPMI_ADC5=3Dy
> > CONFIG_RN5T618_ADC=3Dm
> > # CONFIG_SD_ADC_MODULATOR is not set
> > CONFIG_STMPE_ADC=3Dy
> > CONFIG_TI_ADC081C=3Dy
> > # CONFIG_TI_ADC0832 is not set
> > CONFIG_TI_ADC084S021=3Dy
> > CONFIG_TI_ADC12138=3Dy
> > CONFIG_TI_ADC108S102=3Dy
> > # CONFIG_TI_ADC128S052 is not set
> > # CONFIG_TI_ADC161S626 is not set
> > # CONFIG_TI_ADS1015 is not set
> > CONFIG_TI_ADS7950=3Dm
> > CONFIG_TI_ADS8344=3Dm
> > CONFIG_TI_ADS8688=3Dm
> > CONFIG_TI_ADS124S08=3Dy
> > CONFIG_TI_ADS131E08=3Dm
> > CONFIG_TI_TLC4541=3Dy
> > CONFIG_TI_TSC2046=3Dy
> > CONFIG_VF610_ADC=3Dy
> > # CONFIG_VIPERBOARD_ADC is not set
> > CONFIG_XILINX_XADC=3Dy
> > # end of Analog to digital converters
> > =

> > #
> > # Analog to digital and digital to analog converters
> > #
> > # CONFIG_AD74413R is not set
> > # end of Analog to digital and digital to analog converters
> > =

> > #
> > # Analog Front Ends
> > #
> > CONFIG_IIO_RESCALE=3Dm
> > # end of Analog Front Ends
> > =

> > #
> > # Amplifiers
> > #
> > CONFIG_AD8366=3Dm
> > # CONFIG_HMC425 is not set
> > # end of Amplifiers
> > =

> > #
> > # Capacitance to digital converters
> > #
> > # CONFIG_AD7150 is not set
> > # end of Capacitance to digital converters
> > =

> > #
> > # Chemical Sensors
> > #
> > # CONFIG_ATLAS_PH_SENSOR is not set
> > CONFIG_ATLAS_EZO_SENSOR=3Dm
> > CONFIG_BME680=3Dy
> > CONFIG_BME680_I2C=3Dy
> > CONFIG_BME680_SPI=3Dy
> > # CONFIG_CCS811 is not set
> > CONFIG_IAQCORE=3Dy
> > # CONFIG_PMS7003 is not set
> > CONFIG_SCD30_CORE=3Dy
> > # CONFIG_SCD30_I2C is not set
> > # CONFIG_SCD30_SERIAL is not set
> > CONFIG_SCD4X=3Dy
> > CONFIG_SENSIRION_SGP30=3Dm
> > # CONFIG_SENSIRION_SGP40 is not set
> > CONFIG_SPS30=3Dy
> > CONFIG_SPS30_I2C=3Dy
> > # CONFIG_SPS30_SERIAL is not set
> > CONFIG_SENSEAIR_SUNRISE_CO2=3Dm
> > CONFIG_VZ89X=3Dy
> > # end of Chemical Sensors
> > =

> > # CONFIG_IIO_CROS_EC_SENSORS_CORE is not set
> > =

> > #
> > # Hid Sensor IIO Common
> > #
> > CONFIG_HID_SENSOR_IIO_COMMON=3Dy
> > CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
> > # end of Hid Sensor IIO Common
> > =

> > CONFIG_IIO_MS_SENSORS_I2C=3Dy
> > =

> > #
> > # IIO SCMI Sensors
> > #
> > # end of IIO SCMI Sensors
> > =

> > #
> > # SSP Sensor Common
> > #
> > # CONFIG_IIO_SSP_SENSORS_COMMONS is not set
> > CONFIG_IIO_SSP_SENSORHUB=3Dm
> > # end of SSP Sensor Common
> > =

> > CONFIG_IIO_ST_SENSORS_I2C=3Dy
> > CONFIG_IIO_ST_SENSORS_SPI=3Dy
> > CONFIG_IIO_ST_SENSORS_CORE=3Dy
> > =

> > #
> > # Digital to analog converters
> > #
> > CONFIG_AD3552R=3Dy
> > # CONFIG_AD5064 is not set
> > CONFIG_AD5360=3Dy
> > # CONFIG_AD5380 is not set
> > CONFIG_AD5421=3Dy
> > CONFIG_AD5446=3Dy
> > CONFIG_AD5449=3Dm
> > # CONFIG_AD5592R is not set
> > # CONFIG_AD5593R is not set
> > # CONFIG_AD5504 is not set
> > CONFIG_AD5624R_SPI=3Dy
> > CONFIG_AD5686=3Dm
> > CONFIG_AD5686_SPI=3Dm
> > # CONFIG_AD5696_I2C is not set
> > # CONFIG_AD5755 is not set
> > # CONFIG_AD5758 is not set
> > CONFIG_AD5761=3Dm
> > # CONFIG_AD5764 is not set
> > CONFIG_AD5766=3Dm
> > # CONFIG_AD5770R is not set
> > CONFIG_AD5791=3Dy
> > # CONFIG_AD7293 is not set
> > CONFIG_AD7303=3Dm
> > # CONFIG_AD8801 is not set
> > CONFIG_DPOT_DAC=3Dy
> > CONFIG_DS4424=3Dy
> > CONFIG_LTC1660=3Dy
> > CONFIG_LTC2632=3Dy
> > # CONFIG_M62332 is not set
> > CONFIG_MAX517=3Dy
> > CONFIG_MAX5821=3Dm
> > # CONFIG_MCP4725 is not set
> > CONFIG_MCP4922=3Dm
> > # CONFIG_TI_DAC082S085 is not set
> > CONFIG_TI_DAC5571=3Dy
> > # CONFIG_TI_DAC7311 is not set
> > CONFIG_TI_DAC7612=3Dm
> > CONFIG_VF610_DAC=3Dm
> > # end of Digital to analog converters
> > =

> > #
> > # IIO dummy driver
> > #
> > CONFIG_IIO_SIMPLE_DUMMY=3Dm
> > # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> > # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
> > # end of IIO dummy driver
> > =

> > #
> > # Filters
> > #
> > # end of Filters
> > =

> > #
> > # Frequency Synthesizers DDS/PLL
> > #
> > =

> > #
> > # Clock Generator/Distribution
> > #
> > CONFIG_AD9523=3Dm
> > # end of Clock Generator/Distribution
> > =

> > #
> > # Phase-Locked Loop (PLL) frequency synthesizers
> > #
> > CONFIG_ADF4350=3Dy
> > # CONFIG_ADF4371 is not set
> > CONFIG_ADMV1013=3Dy
> > # CONFIG_ADRF6780 is not set
> > # end of Phase-Locked Loop (PLL) frequency synthesizers
> > # end of Frequency Synthesizers DDS/PLL
> > =

> > #
> > # Digital gyroscope sensors
> > #
> > # CONFIG_ADIS16080 is not set
> > CONFIG_ADIS16130=3Dy
> > CONFIG_ADIS16136=3Dm
> > # CONFIG_ADIS16260 is not set
> > # CONFIG_ADXRS290 is not set
> > CONFIG_ADXRS450=3Dy
> > CONFIG_BMG160=3Dm
> > CONFIG_BMG160_I2C=3Dm
> > CONFIG_BMG160_SPI=3Dm
> > CONFIG_FXAS21002C=3Dm
> > CONFIG_FXAS21002C_I2C=3Dm
> > CONFIG_FXAS21002C_SPI=3Dm
> > # CONFIG_HID_SENSOR_GYRO_3D is not set
> > CONFIG_MPU3050=3Dm
> > CONFIG_MPU3050_I2C=3Dm
> > CONFIG_IIO_ST_GYRO_3AXIS=3Dm
> > CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dm
> > CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dm
> > CONFIG_ITG3200=3Dm
> > # end of Digital gyroscope sensors
> > =

> > #
> > # Health Sensors
> > #
> > =

> > #
> > # Heart Rate Monitors
> > #
> > CONFIG_AFE4403=3Dm
> > CONFIG_AFE4404=3Dm
> > # CONFIG_MAX30100 is not set
> > CONFIG_MAX30102=3Dy
> > # end of Heart Rate Monitors
> > # end of Health Sensors
> > =

> > #
> > # Humidity sensors
> > #
> > # CONFIG_AM2315 is not set
> > # CONFIG_DHT11 is not set
> > CONFIG_HDC100X=3Dy
> > # CONFIG_HDC2010 is not set
> > # CONFIG_HID_SENSOR_HUMIDITY is not set
> > CONFIG_HTS221=3Dy
> > CONFIG_HTS221_I2C=3Dy
> > CONFIG_HTS221_SPI=3Dy
> > CONFIG_HTU21=3Dy
> > # CONFIG_SI7005 is not set
> > # CONFIG_SI7020 is not set
> > # end of Humidity sensors
> > =

> > #
> > # Inertial measurement units
> > #
> > # CONFIG_ADIS16400 is not set
> > CONFIG_ADIS16460=3Dm
> > CONFIG_ADIS16475=3Dm
> > CONFIG_ADIS16480=3Dm
> > CONFIG_BMI160=3Dm
> > CONFIG_BMI160_I2C=3Dm
> > CONFIG_BMI160_SPI=3Dm
> > CONFIG_FXOS8700=3Dy
> > CONFIG_FXOS8700_I2C=3Dm
> > CONFIG_FXOS8700_SPI=3Dy
> > CONFIG_KMX61=3Dm
> > CONFIG_INV_ICM42600=3Dy
> > CONFIG_INV_ICM42600_I2C=3Dy
> > # CONFIG_INV_ICM42600_SPI is not set
> > # CONFIG_INV_MPU6050_I2C is not set
> > # CONFIG_INV_MPU6050_SPI is not set
> > # CONFIG_IIO_ST_LSM6DSX is not set
> > # end of Inertial measurement units
> > =

> > CONFIG_IIO_ADIS_LIB=3Dy
> > CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> > =

> > #
> > # Light sensors
> > #
> > CONFIG_ACPI_ALS=3Dm
> > # CONFIG_ADJD_S311 is not set
> > CONFIG_ADUX1020=3Dm
> > # CONFIG_AL3010 is not set
> > CONFIG_AL3320A=3Dy
> > CONFIG_APDS9300=3Dy
> > CONFIG_APDS9960=3Dm
> > CONFIG_AS73211=3Dm
> > CONFIG_BH1750=3Dm
> > # CONFIG_BH1780 is not set
> > CONFIG_CM32181=3Dm
> > CONFIG_CM3232=3Dm
> > CONFIG_CM3323=3Dm
> > CONFIG_CM3605=3Dy
> > # CONFIG_CM36651 is not set
> > CONFIG_GP2AP002=3Dy
> > CONFIG_GP2AP020A00F=3Dy
> > # CONFIG_IQS621_ALS is not set
> > CONFIG_SENSORS_ISL29018=3Dy
> > CONFIG_SENSORS_ISL29028=3Dm
> > # CONFIG_ISL29125 is not set
> > CONFIG_HID_SENSOR_ALS=3Dm
> > CONFIG_HID_SENSOR_PROX=3Dy
> > CONFIG_JSA1212=3Dy
> > # CONFIG_RPR0521 is not set
> > # CONFIG_SENSORS_LM3533 is not set
> > CONFIG_LTR501=3Dy
> > CONFIG_LV0104CS=3Dy
> > CONFIG_MAX44000=3Dm
> > CONFIG_MAX44009=3Dm
> > # CONFIG_NOA1305 is not set
> > # CONFIG_OPT3001 is not set
> > CONFIG_PA12203001=3Dy
> > # CONFIG_SI1133 is not set
> > CONFIG_SI1145=3Dm
> > # CONFIG_STK3310 is not set
> > CONFIG_ST_UVIS25=3Dy
> > CONFIG_ST_UVIS25_I2C=3Dy
> > CONFIG_ST_UVIS25_SPI=3Dy
> > # CONFIG_TCS3414 is not set
> > # CONFIG_TCS3472 is not set
> > CONFIG_SENSORS_TSL2563=3Dy
> > CONFIG_TSL2583=3Dy
> > CONFIG_TSL2591=3Dy
> > # CONFIG_TSL2772 is not set
> > # CONFIG_TSL4531 is not set
> > CONFIG_US5182D=3Dy
> > CONFIG_VCNL4000=3Dy
> > # CONFIG_VCNL4035 is not set
> > CONFIG_VEML6030=3Dy
> > # CONFIG_VEML6070 is not set
> > CONFIG_VL6180=3Dy
> > CONFIG_ZOPT2201=3Dy
> > # end of Light sensors
> > =

> > #
> > # Magnetometer sensors
> > #
> > # CONFIG_AK8974 is not set
> > CONFIG_AK8975=3Dy
> > CONFIG_AK09911=3Dm
> > CONFIG_BMC150_MAGN=3Dm
> > # CONFIG_BMC150_MAGN_I2C is not set
> > CONFIG_BMC150_MAGN_SPI=3Dm
> > CONFIG_MAG3110=3Dy
> > CONFIG_HID_SENSOR_MAGNETOMETER_3D=3Dy
> > # CONFIG_MMC35240 is not set
> > CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> > CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> > CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> > CONFIG_SENSORS_HMC5843=3Dy
> > CONFIG_SENSORS_HMC5843_I2C=3Dy
> > CONFIG_SENSORS_HMC5843_SPI=3Dm
> > CONFIG_SENSORS_RM3100=3Dy
> > CONFIG_SENSORS_RM3100_I2C=3Dm
> > CONFIG_SENSORS_RM3100_SPI=3Dy
> > CONFIG_YAMAHA_YAS530=3Dy
> > # end of Magnetometer sensors
> > =

> > #
> > # Multiplexers
> > #
> > # CONFIG_IIO_MUX is not set
> > # end of Multiplexers
> > =

> > #
> > # Inclinometer sensors
> > #
> > CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dy
> > CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dm
> > # end of Inclinometer sensors
> > =

> > #
> > # Triggers - standalone
> > #
> > CONFIG_IIO_HRTIMER_TRIGGER=3Dm
> > # CONFIG_IIO_INTERRUPT_TRIGGER is not set
> > CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dm
> > CONFIG_IIO_SYSFS_TRIGGER=3Dy
> > # end of Triggers - standalone
> > =

> > #
> > # Linear and angular position sensors
> > #
> > CONFIG_IQS624_POS=3Dm
> > CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=3Dy
> > # end of Linear and angular position sensors
> > =

> > #
> > # Digital potentiometers
> > #
> > # CONFIG_AD5110 is not set
> > CONFIG_AD5272=3Dm
> > # CONFIG_DS1803 is not set
> > CONFIG_MAX5432=3Dm
> > # CONFIG_MAX5481 is not set
> > CONFIG_MAX5487=3Dm
> > # CONFIG_MCP4018 is not set
> > CONFIG_MCP4131=3Dm
> > CONFIG_MCP4531=3Dy
> > # CONFIG_MCP41010 is not set
> > CONFIG_TPL0102=3Dm
> > # end of Digital potentiometers
> > =

> > #
> > # Digital potentiostats
> > #
> > # CONFIG_LMP91000 is not set
> > # end of Digital potentiostats
> > =

> > #
> > # Pressure sensors
> > #
> > # CONFIG_ABP060MG is not set
> > CONFIG_BMP280=3Dy
> > CONFIG_BMP280_I2C=3Dy
> > CONFIG_BMP280_SPI=3Dy
> > CONFIG_DLHL60D=3Dm
> > # CONFIG_DPS310 is not set
> > CONFIG_HID_SENSOR_PRESS=3Dm
> > # CONFIG_HP03 is not set
> > # CONFIG_ICP10100 is not set
> > CONFIG_MPL115=3Dm
> > # CONFIG_MPL115_I2C is not set
> > CONFIG_MPL115_SPI=3Dm
> > # CONFIG_MPL3115 is not set
> > CONFIG_MS5611=3Dy
> > CONFIG_MS5611_I2C=3Dy
> > # CONFIG_MS5611_SPI is not set
> > CONFIG_MS5637=3Dy
> > CONFIG_IIO_ST_PRESS=3Dy
> > CONFIG_IIO_ST_PRESS_I2C=3Dy
> > CONFIG_IIO_ST_PRESS_SPI=3Dy
> > # CONFIG_T5403 is not set
> > CONFIG_HP206C=3Dm
> > # CONFIG_ZPA2326 is not set
> > # end of Pressure sensors
> > =

> > #
> > # Lightning sensors
> > #
> > CONFIG_AS3935=3Dy
> > # end of Lightning sensors
> > =

> > #
> > # Proximity and distance sensors
> > #
> > # CONFIG_CROS_EC_MKBP_PROXIMITY is not set
> > CONFIG_ISL29501=3Dy
> > CONFIG_LIDAR_LITE_V2=3Dy
> > # CONFIG_MB1232 is not set
> > CONFIG_PING=3Dm
> > CONFIG_RFD77402=3Dy
> > # CONFIG_SRF04 is not set
> > CONFIG_SX9310=3Dy
> > CONFIG_SX9500=3Dy
> > CONFIG_SRF08=3Dm
> > CONFIG_VCNL3020=3Dy
> > # CONFIG_VL53L0X_I2C is not set
> > # end of Proximity and distance sensors
> > =

> > #
> > # Resolver to digital converters
> > #
> > CONFIG_AD2S90=3Dy
> > CONFIG_AD2S1200=3Dy
> > # end of Resolver to digital converters
> > =

> > #
> > # Temperature sensors
> > #
> > CONFIG_IQS620AT_TEMP=3Dm
> > CONFIG_LTC2983=3Dy
> > # CONFIG_MAXIM_THERMOCOUPLE is not set
> > # CONFIG_HID_SENSOR_TEMP is not set
> > CONFIG_MLX90614=3Dm
> > # CONFIG_MLX90632 is not set
> > # CONFIG_TMP006 is not set
> > CONFIG_TMP007=3Dy
> > CONFIG_TMP117=3Dm
> > # CONFIG_TSYS01 is not set
> > CONFIG_TSYS02D=3Dm
> > CONFIG_MAX31856=3Dy
> > CONFIG_MAX31865=3Dm
> > # end of Temperature sensors
> > =

> > # CONFIG_NTB is not set
> > # CONFIG_VME_BUS is not set
> > # CONFIG_PWM is not set
> > =

> > #
> > # IRQ chip support
> > #
> > CONFIG_IRQCHIP=3Dy
> > # CONFIG_AL_FIC is not set
> > CONFIG_MADERA_IRQ=3Dm
> > # end of IRQ chip support
> > =

> > CONFIG_IPACK_BUS=3Dy
> > # CONFIG_BOARD_TPCI200 is not set
> > CONFIG_SERIAL_IPOCTAL=3Dy
> > CONFIG_RESET_CONTROLLER=3Dy
> > CONFIG_RESET_INTEL_GW=3Dy
> > CONFIG_RESET_TI_SYSCON=3Dy
> > =

> > #
> > # PHY Subsystem
> > #
> > CONFIG_GENERIC_PHY=3Dy
> > CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
> > # CONFIG_USB_LGM_PHY is not set
> > # CONFIG_PHY_CAN_TRANSCEIVER is not set
> > =

> > #
> > # PHY drivers for Broadcom platforms
> > #
> > # CONFIG_BCM_KONA_USB2_PHY is not set
> > # end of PHY drivers for Broadcom platforms
> > =

> > # CONFIG_PHY_CADENCE_TORRENT is not set
> > CONFIG_PHY_CADENCE_DPHY=3Dy
> > # CONFIG_PHY_CADENCE_SIERRA is not set
> > CONFIG_PHY_CADENCE_SALVO=3Dm
> > # CONFIG_PHY_FSL_IMX8MQ_USB is not set
> > CONFIG_PHY_MIXEL_MIPI_DPHY=3Dm
> > CONFIG_PHY_FSL_IMX8M_PCIE=3Dy
> > CONFIG_PHY_PXA_28NM_HSIC=3Dm
> > # CONFIG_PHY_PXA_28NM_USB2 is not set
> > CONFIG_PHY_LAN966X_SERDES=3Dm
> > CONFIG_PHY_CPCAP_USB=3Dm
> > CONFIG_PHY_MAPPHONE_MDM6600=3Dm
> > # CONFIG_PHY_OCELOT_SERDES is not set
> > CONFIG_PHY_QCOM_USB_HS=3Dm
> > CONFIG_PHY_QCOM_USB_HSIC=3Dm
> > # CONFIG_PHY_SAMSUNG_USB2 is not set
> > CONFIG_PHY_TUSB1210=3Dm
> > CONFIG_PHY_INTEL_LGM_COMBO=3Dy
> > CONFIG_PHY_INTEL_LGM_EMMC=3Dy
> > # end of PHY Subsystem
> > =

> > # CONFIG_POWERCAP is not set
> > CONFIG_MCB=3Dm
> > # CONFIG_MCB_PCI is not set
> > # CONFIG_MCB_LPC is not set
> > =

> > #
> > # Performance monitor support
> > #
> > # end of Performance monitor support
> > =

> > CONFIG_RAS=3Dy
> > # CONFIG_USB4 is not set
> > =

> > #
> > # Android
> > #
> > # CONFIG_ANDROID is not set
> > # end of Android
> > =

> > # CONFIG_DAX is not set
> > CONFIG_NVMEM=3Dy
> > CONFIG_NVMEM_SYSFS=3Dy
> > # CONFIG_NVMEM_SPMI_SDAM is not set
> > CONFIG_RAVE_SP_EEPROM=3Dm
> > # CONFIG_NVMEM_RMEM is not set
> > =

> > #
> > # HW tracing support
> > #
> > # CONFIG_STM is not set
> > # CONFIG_INTEL_TH is not set
> > # end of HW tracing support
> > =

> > CONFIG_FPGA=3Dy
> > # CONFIG_ALTERA_PR_IP_CORE is not set
> > # CONFIG_FPGA_MGR_ALTERA_PS_SPI is not set
> > # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> > # CONFIG_FPGA_MGR_XILINX_SPI is not set
> > # CONFIG_FPGA_MGR_ICE40_SPI is not set
> > # CONFIG_FPGA_MGR_MACHXO2_SPI is not set
> > CONFIG_FPGA_BRIDGE=3Dm
> > CONFIG_ALTERA_FREEZE_BRIDGE=3Dm
> > CONFIG_XILINX_PR_DECOUPLER=3Dm
> > CONFIG_FPGA_REGION=3Dm
> > CONFIG_OF_FPGA_REGION=3Dm
> > CONFIG_FPGA_DFL=3Dm
> > CONFIG_FPGA_DFL_AFU=3Dm
> > CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=3Dm
> > # CONFIG_FPGA_DFL_PCI is not set
> > CONFIG_FSI=3Dm
> > # CONFIG_FSI_NEW_DEV_NODE is not set
> > CONFIG_FSI_MASTER_GPIO=3Dm
> > CONFIG_FSI_MASTER_HUB=3Dm
> > CONFIG_FSI_MASTER_ASPEED=3Dm
> > # CONFIG_FSI_SCOM is not set
> > CONFIG_FSI_SBEFIFO=3Dm
> > CONFIG_FSI_OCC=3Dm
> > CONFIG_TEE=3Dy
> > =

> > #
> > # TEE drivers
> > #
> > # end of TEE drivers
> > =

> > CONFIG_MULTIPLEXER=3Dy
> > =

> > #
> > # Multiplexer drivers
> > #
> > CONFIG_MUX_ADG792A=3Dm
> > # CONFIG_MUX_ADGS1408 is not set
> > # CONFIG_MUX_GPIO is not set
> > CONFIG_MUX_MMIO=3Dy
> > # end of Multiplexer drivers
> > =

> > CONFIG_PM_OPP=3Dy
> > CONFIG_SIOX=3Dy
> > # CONFIG_SIOX_BUS_GPIO is not set
> > CONFIG_SLIMBUS=3Dy
> > CONFIG_SLIM_QCOM_CTRL=3Dm
> > # CONFIG_INTERCONNECT is not set
> > # CONFIG_COUNTER is not set
> > CONFIG_MOST=3Dm
> > CONFIG_MOST_USB_HDM=3Dm
> > # CONFIG_MOST_CDEV is not set
> > # CONFIG_MOST_SND is not set
> > # end of Device Drivers
> > =

> > #
> > # File systems
> > #
> > CONFIG_DCACHE_WORD_ACCESS=3Dy
> > # CONFIG_VALIDATE_FS_PARSER is not set
> > CONFIG_FS_IOMAP=3Dy
> > CONFIG_EXT2_FS=3Dy
> > CONFIG_EXT2_FS_XATTR=3Dy
> > CONFIG_EXT2_FS_POSIX_ACL=3Dy
> > CONFIG_EXT2_FS_SECURITY=3Dy
> > # CONFIG_EXT3_FS is not set
> > CONFIG_EXT4_FS=3Dy
> > CONFIG_EXT4_FS_POSIX_ACL=3Dy
> > # CONFIG_EXT4_FS_SECURITY is not set
> > # CONFIG_EXT4_DEBUG is not set
> > CONFIG_JBD2=3Dy
> > # CONFIG_JBD2_DEBUG is not set
> > CONFIG_FS_MBCACHE=3Dy
> > # CONFIG_REISERFS_FS is not set
> > # CONFIG_JFS_FS is not set
> > CONFIG_XFS_FS=3Dm
> > # CONFIG_XFS_SUPPORT_V4 is not set
> > # CONFIG_XFS_QUOTA is not set
> > # CONFIG_XFS_POSIX_ACL is not set
> > # CONFIG_XFS_RT is not set
> > CONFIG_XFS_ONLINE_SCRUB=3Dy
> > # CONFIG_XFS_ONLINE_REPAIR is not set
> > CONFIG_XFS_DEBUG=3Dy
> > CONFIG_XFS_ASSERT_FATAL=3Dy
> > CONFIG_GFS2_FS=3Dy
> > # CONFIG_OCFS2_FS is not set
> > CONFIG_BTRFS_FS=3Dy
> > CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> > CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> > # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> > CONFIG_BTRFS_DEBUG=3Dy
> > # CONFIG_BTRFS_ASSERT is not set
> > CONFIG_BTRFS_FS_REF_VERIFY=3Dy
> > # CONFIG_NILFS2_FS is not set
> > # CONFIG_F2FS_FS is not set
> > # CONFIG_FS_DAX is not set
> > CONFIG_FS_POSIX_ACL=3Dy
> > CONFIG_EXPORTFS=3Dy
> > # CONFIG_EXPORTFS_BLOCK_OPS is not set
> > CONFIG_FILE_LOCKING=3Dy
> > # CONFIG_FS_ENCRYPTION is not set
> > CONFIG_FS_VERITY=3Dy
> > # CONFIG_FS_VERITY_DEBUG is not set
> > CONFIG_FS_VERITY_BUILTIN_SIGNATURES=3Dy
> > CONFIG_FSNOTIFY=3Dy
> > # CONFIG_DNOTIFY is not set
> > CONFIG_INOTIFY_USER=3Dy
> > # CONFIG_FANOTIFY is not set
> > CONFIG_QUOTA=3Dy
> > CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> > # CONFIG_PRINT_QUOTA_WARNING is not set
> > CONFIG_QUOTA_DEBUG=3Dy
> > # CONFIG_QFMT_V1 is not set
> > # CONFIG_QFMT_V2 is not set
> > CONFIG_QUOTACTL=3Dy
> > CONFIG_AUTOFS4_FS=3Dy
> > CONFIG_AUTOFS_FS=3Dy
> > # CONFIG_FUSE_FS is not set
> > CONFIG_OVERLAY_FS=3Dm
> > CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> > # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> > CONFIG_OVERLAY_FS_INDEX=3Dy
> > CONFIG_OVERLAY_FS_METACOPY=3Dy
> > =

> > #
> > # Caches
> > #
> > CONFIG_NETFS_SUPPORT=3Dy
> > CONFIG_NETFS_STATS=3Dy
> > CONFIG_FSCACHE=3Dy
> > # CONFIG_FSCACHE_STATS is not set
> > # CONFIG_FSCACHE_DEBUG is not set
> > CONFIG_CACHEFILES=3Dy
> > # CONFIG_CACHEFILES_DEBUG is not set
> > # CONFIG_CACHEFILES_ERROR_INJECTION is not set
> > # end of Caches
> > =

> > #
> > # CD-ROM/DVD Filesystems
> > #
> > CONFIG_ISO9660_FS=3Dy
> > CONFIG_JOLIET=3Dy
> > CONFIG_ZISOFS=3Dy
> > CONFIG_UDF_FS=3Dm
> > # end of CD-ROM/DVD Filesystems
> > =

> > #
> > # DOS/FAT/EXFAT/NT Filesystems
> > #
> > CONFIG_FAT_FS=3Dy
> > CONFIG_MSDOS_FS=3Dy
> > # CONFIG_VFAT_FS is not set
> > CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> > # CONFIG_EXFAT_FS is not set
> > # CONFIG_NTFS_FS is not set
> > CONFIG_NTFS3_FS=3Dy
> > CONFIG_NTFS3_LZX_XPRESS=3Dy
> > CONFIG_NTFS3_FS_POSIX_ACL=3Dy
> > # end of DOS/FAT/EXFAT/NT Filesystems
> > =

> > #
> > # Pseudo filesystems
> > #
> > CONFIG_PROC_FS=3Dy
> > # CONFIG_PROC_KCORE is not set
> > # CONFIG_PROC_VMCORE is not set
> > CONFIG_PROC_SYSCTL=3Dy
> > CONFIG_PROC_PAGE_MONITOR=3Dy
> > CONFIG_PROC_CHILDREN=3Dy
> > CONFIG_PROC_PID_ARCH_STATUS=3Dy
> > CONFIG_PROC_CPU_RESCTRL=3Dy
> > CONFIG_KERNFS=3Dy
> > CONFIG_SYSFS=3Dy
> > CONFIG_TMPFS=3Dy
> > # CONFIG_TMPFS_POSIX_ACL is not set
> > # CONFIG_TMPFS_XATTR is not set
> > # CONFIG_HUGETLBFS is not set
> > CONFIG_MEMFD_CREATE=3Dy
> > CONFIG_CONFIGFS_FS=3Dy
> > CONFIG_EFIVAR_FS=3Dm
> > # end of Pseudo filesystems
> > =

> > CONFIG_MISC_FILESYSTEMS=3Dy
> > CONFIG_ORANGEFS_FS=3Dy
> > CONFIG_ADFS_FS=3Dm
> > CONFIG_ADFS_FS_RW=3Dy
> > # CONFIG_AFFS_FS is not set
> > # CONFIG_ECRYPT_FS is not set
> > CONFIG_HFS_FS=3Dy
> > # CONFIG_HFSPLUS_FS is not set
> > # CONFIG_BEFS_FS is not set
> > # CONFIG_BFS_FS is not set
> > # CONFIG_EFS_FS is not set
> > # CONFIG_JFFS2_FS is not set
> > # CONFIG_UBIFS_FS is not set
> > CONFIG_CRAMFS=3Dm
> > CONFIG_CRAMFS_BLOCKDEV=3Dy
> > # CONFIG_CRAMFS_MTD is not set
> > CONFIG_SQUASHFS=3Dm
> > # CONFIG_SQUASHFS_FILE_CACHE is not set
> > CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> > # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> > CONFIG_SQUASHFS_DECOMP_MULTI=3Dy
> > # CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
> > CONFIG_SQUASHFS_XATTR=3Dy
> > CONFIG_SQUASHFS_ZLIB=3Dy
> > # CONFIG_SQUASHFS_LZ4 is not set
> > CONFIG_SQUASHFS_LZO=3Dy
> > # CONFIG_SQUASHFS_XZ is not set
> > # CONFIG_SQUASHFS_ZSTD is not set
> > CONFIG_SQUASHFS_4K_DEVBLK_SIZE=3Dy
> > CONFIG_SQUASHFS_EMBEDDED=3Dy
> > CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> > # CONFIG_VXFS_FS is not set
> > CONFIG_MINIX_FS=3Dy
> > CONFIG_OMFS_FS=3Dm
> > # CONFIG_HPFS_FS is not set
> > # CONFIG_QNX4FS_FS is not set
> > CONFIG_QNX6FS_FS=3Dm
> > # CONFIG_QNX6FS_DEBUG is not set
> > CONFIG_ROMFS_FS=3Dy
> > # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
> > CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> > # CONFIG_ROMFS_BACKED_BY_BOTH is not set
> > CONFIG_ROMFS_ON_MTD=3Dy
> > # CONFIG_PSTORE is not set
> > # CONFIG_SYSV_FS is not set
> > # CONFIG_UFS_FS is not set
> > CONFIG_EROFS_FS=3Dm
> > CONFIG_EROFS_FS_DEBUG=3Dy
> > # CONFIG_EROFS_FS_XATTR is not set
> > # CONFIG_EROFS_FS_ZIP is not set
> > CONFIG_NETWORK_FILESYSTEMS=3Dy
> > CONFIG_NFS_FS=3Dy
> > CONFIG_NFS_V2=3Dy
> > CONFIG_NFS_V3=3Dy
> > # CONFIG_NFS_V3_ACL is not set
> > CONFIG_NFS_V4=3Dm
> > # CONFIG_NFS_SWAP is not set
> > # CONFIG_NFS_V4_1 is not set
> > # CONFIG_ROOT_NFS is not set
> > # CONFIG_NFS_FSCACHE is not set
> > # CONFIG_NFS_USE_LEGACY_DNS is not set
> > CONFIG_NFS_USE_KERNEL_DNS=3Dy
> > CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> > # CONFIG_NFSD is not set
> > CONFIG_GRACE_PERIOD=3Dy
> > CONFIG_LOCKD=3Dy
> > CONFIG_LOCKD_V4=3Dy
> > CONFIG_NFS_COMMON=3Dy
> > CONFIG_SUNRPC=3Dy
> > CONFIG_SUNRPC_GSS=3Dm
> > CONFIG_RPCSEC_GSS_KRB5=3Dm
> > # CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
> > # CONFIG_SUNRPC_DEBUG is not set
> > # CONFIG_CEPH_FS is not set
> > CONFIG_CIFS=3Dm
> > CONFIG_CIFS_STATS2=3Dy
> > CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> > # CONFIG_CIFS_UPCALL is not set
> > # CONFIG_CIFS_XATTR is not set
> > CONFIG_CIFS_DEBUG=3Dy
> > # CONFIG_CIFS_DEBUG2 is not set
> > # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> > # CONFIG_CIFS_DFS_UPCALL is not set
> > # CONFIG_CIFS_SWN_UPCALL is not set
> > # CONFIG_CIFS_FSCACHE is not set
> > # CONFIG_SMB_SERVER is not set
> > CONFIG_SMBFS_COMMON=3Dm
> > # CONFIG_CODA_FS is not set
> > # CONFIG_AFS_FS is not set
> > # CONFIG_9P_FS is not set
> > CONFIG_NLS=3Dy
> > CONFIG_NLS_DEFAULT=3D"iso8859-1"
> > CONFIG_NLS_CODEPAGE_437=3Dm
> > CONFIG_NLS_CODEPAGE_737=3Dm
> > CONFIG_NLS_CODEPAGE_775=3Dm
> > # CONFIG_NLS_CODEPAGE_850 is not set
> > # CONFIG_NLS_CODEPAGE_852 is not set
> > CONFIG_NLS_CODEPAGE_855=3Dm
> > CONFIG_NLS_CODEPAGE_857=3Dm
> > CONFIG_NLS_CODEPAGE_860=3Dm
> > CONFIG_NLS_CODEPAGE_861=3Dm
> > # CONFIG_NLS_CODEPAGE_862 is not set
> > CONFIG_NLS_CODEPAGE_863=3Dm
> > # CONFIG_NLS_CODEPAGE_864 is not set
> > CONFIG_NLS_CODEPAGE_865=3Dy
> > # CONFIG_NLS_CODEPAGE_866 is not set
> > CONFIG_NLS_CODEPAGE_869=3Dy
> > CONFIG_NLS_CODEPAGE_936=3Dy
> > CONFIG_NLS_CODEPAGE_950=3Dm
> > CONFIG_NLS_CODEPAGE_932=3Dm
> > # CONFIG_NLS_CODEPAGE_949 is not set
> > # CONFIG_NLS_CODEPAGE_874 is not set
> > # CONFIG_NLS_ISO8859_8 is not set
> > # CONFIG_NLS_CODEPAGE_1250 is not set
> > CONFIG_NLS_CODEPAGE_1251=3Dy
> > CONFIG_NLS_ASCII=3Dm
> > # CONFIG_NLS_ISO8859_1 is not set
> > # CONFIG_NLS_ISO8859_2 is not set
> > CONFIG_NLS_ISO8859_3=3Dy
> > CONFIG_NLS_ISO8859_4=3Dy
> > CONFIG_NLS_ISO8859_5=3Dm
> > CONFIG_NLS_ISO8859_6=3Dm
> > CONFIG_NLS_ISO8859_7=3Dy
> > # CONFIG_NLS_ISO8859_9 is not set
> > CONFIG_NLS_ISO8859_13=3Dy
> > # CONFIG_NLS_ISO8859_14 is not set
> > CONFIG_NLS_ISO8859_15=3Dy
> > CONFIG_NLS_KOI8_R=3Dy
> > CONFIG_NLS_KOI8_U=3Dy
> > CONFIG_NLS_MAC_ROMAN=3Dm
> > # CONFIG_NLS_MAC_CELTIC is not set
> > # CONFIG_NLS_MAC_CENTEURO is not set
> > CONFIG_NLS_MAC_CROATIAN=3Dy
> > # CONFIG_NLS_MAC_CYRILLIC is not set
> > CONFIG_NLS_MAC_GAELIC=3Dy
> > CONFIG_NLS_MAC_GREEK=3Dy
> > CONFIG_NLS_MAC_ICELAND=3Dy
> > # CONFIG_NLS_MAC_INUIT is not set
> > CONFIG_NLS_MAC_ROMANIAN=3Dy
> > CONFIG_NLS_MAC_TURKISH=3Dy
> > CONFIG_NLS_UTF8=3Dm
> > # CONFIG_DLM is not set
> > CONFIG_UNICODE=3Dy
> > # CONFIG_UNICODE_UTF8_DATA is not set
> > CONFIG_IO_WQ=3Dy
> > # end of File systems
> > =

> > #
> > # Security options
> > #
> > CONFIG_KEYS=3Dy
> > CONFIG_KEYS_REQUEST_CACHE=3Dy
> > # CONFIG_PERSISTENT_KEYRINGS is not set
> > CONFIG_TRUSTED_KEYS=3Dm
> > CONFIG_ENCRYPTED_KEYS=3Dy
> > CONFIG_KEY_DH_OPERATIONS=3Dy
> > CONFIG_KEY_NOTIFICATIONS=3Dy
> > # CONFIG_SECURITY_DMESG_RESTRICT is not set
> > CONFIG_SECURITY=3Dy
> > CONFIG_SECURITYFS=3Dy
> > CONFIG_SECURITY_NETWORK=3Dy
> > CONFIG_SECURITY_PATH=3Dy
> > CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> > CONFIG_HARDENED_USERCOPY=3Dy
> > CONFIG_FORTIFY_SOURCE=3Dy
> > # CONFIG_STATIC_USERMODEHELPER is not set
> > # CONFIG_SECURITY_SELINUX is not set
> > # CONFIG_SECURITY_SMACK is not set
> > # CONFIG_SECURITY_TOMOYO is not set
> > CONFIG_SECURITY_APPARMOR=3Dy
> > # CONFIG_SECURITY_APPARMOR_HASH is not set
> > CONFIG_SECURITY_APPARMOR_DEBUG=3Dy
> > CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS=3Dy
> > # CONFIG_SECURITY_APPARMOR_DEBUG_MESSAGES is not set
> > # CONFIG_SECURITY_LOADPIN is not set
> > CONFIG_SECURITY_YAMA=3Dy
> > # CONFIG_SECURITY_SAFESETID is not set
> > # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> > CONFIG_SECURITY_LANDLOCK=3Dy
> > CONFIG_INTEGRITY=3Dy
> > CONFIG_INTEGRITY_SIGNATURE=3Dy
> > CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> > CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
> > # CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
> > CONFIG_INTEGRITY_AUDIT=3Dy
> > CONFIG_IMA=3Dy
> > CONFIG_IMA_MEASURE_PCR_IDX=3D10
> > CONFIG_IMA_LSM_RULES=3Dy
> > # CONFIG_IMA_TEMPLATE is not set
> > CONFIG_IMA_NG_TEMPLATE=3Dy
> > # CONFIG_IMA_SIG_TEMPLATE is not set
> > CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
> > CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> > # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> > # CONFIG_IMA_DEFAULT_HASH_SM3 is not set
> > CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> > # CONFIG_IMA_WRITE_POLICY is not set
> > # CONFIG_IMA_READ_POLICY is not set
> > CONFIG_IMA_APPRAISE=3Dy
> > CONFIG_IMA_ARCH_POLICY=3Dy
> > # CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
> > # CONFIG_IMA_APPRAISE_BOOTPARAM is not set
> > # CONFIG_IMA_APPRAISE_MODSIG is not set
> > CONFIG_IMA_TRUSTED_KEYRING=3Dy
> > # CONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY is not set
> > # CONFIG_IMA_BLACKLIST_KEYRING is not set
> > CONFIG_IMA_LOAD_X509=3Dy
> > CONFIG_IMA_X509_PATH=3D"/etc/keys/x509_ima.der"
> > # CONFIG_IMA_APPRAISE_SIGNED_INIT is not set
> > CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy
> > CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=3Dy
> > CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=3Dy
> > # CONFIG_IMA_DISABLE_HTABLE is not set
> > # CONFIG_EVM is not set
> > CONFIG_DEFAULT_SECURITY_APPARMOR=3Dy
> > # CONFIG_DEFAULT_SECURITY_DAC is not set
> > CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,tomoyo=
,bpf"
> > =

> > #
> > # Kernel hardening options
> > #
> > =

> > #
> > # Memory initialization
> > #
> > CONFIG_INIT_STACK_NONE=3Dy
> > CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
> > CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy
> > # end of Memory initialization
> > # end of Kernel hardening options
> > # end of Security options
> > =

> > CONFIG_XOR_BLOCKS=3Dy
> > CONFIG_CRYPTO=3Dy
> > =

> > #
> > # Crypto core or helper
> > #
> > CONFIG_CRYPTO_ALGAPI=3Dy
> > CONFIG_CRYPTO_ALGAPI2=3Dy
> > CONFIG_CRYPTO_AEAD=3Dy
> > CONFIG_CRYPTO_AEAD2=3Dy
> > CONFIG_CRYPTO_SKCIPHER=3Dy
> > CONFIG_CRYPTO_SKCIPHER2=3Dy
> > CONFIG_CRYPTO_HASH=3Dy
> > CONFIG_CRYPTO_HASH2=3Dy
> > CONFIG_CRYPTO_RNG=3Dy
> > CONFIG_CRYPTO_RNG2=3Dy
> > CONFIG_CRYPTO_RNG_DEFAULT=3Dm
> > CONFIG_CRYPTO_AKCIPHER2=3Dy
> > CONFIG_CRYPTO_AKCIPHER=3Dy
> > CONFIG_CRYPTO_KPP2=3Dy
> > CONFIG_CRYPTO_KPP=3Dy
> > CONFIG_CRYPTO_ACOMP2=3Dy
> > CONFIG_CRYPTO_MANAGER=3Dy
> > CONFIG_CRYPTO_MANAGER2=3Dy
> > # CONFIG_CRYPTO_USER is not set
> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> > CONFIG_CRYPTO_GF128MUL=3Dy
> > CONFIG_CRYPTO_NULL=3Dy
> > CONFIG_CRYPTO_NULL2=3Dy
> > CONFIG_CRYPTO_CRYPTD=3Dm
> > CONFIG_CRYPTO_AUTHENC=3Dy
> > # CONFIG_CRYPTO_TEST is not set
> > CONFIG_CRYPTO_SIMD=3Dm
> > =

> > #
> > # Public-key cryptography
> > #
> > CONFIG_CRYPTO_RSA=3Dy
> > CONFIG_CRYPTO_DH=3Dy
> > CONFIG_CRYPTO_ECC=3Dm
> > CONFIG_CRYPTO_ECDH=3Dm
> > CONFIG_CRYPTO_ECDSA=3Dm
> > # CONFIG_CRYPTO_ECRDSA is not set
> > CONFIG_CRYPTO_SM2=3Dy
> > CONFIG_CRYPTO_CURVE25519=3Dm
> > =

> > #
> > # Authenticated Encryption with Associated Data
> > #
> > CONFIG_CRYPTO_CCM=3Dy
> > CONFIG_CRYPTO_GCM=3Dy
> > # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> > CONFIG_CRYPTO_AEGIS128=3Dy
> > # CONFIG_CRYPTO_SEQIV is not set
> > # CONFIG_CRYPTO_ECHAINIV is not set
> > =

> > #
> > # Block modes
> > #
> > CONFIG_CRYPTO_CBC=3Dy
> > CONFIG_CRYPTO_CFB=3Dm
> > CONFIG_CRYPTO_CTR=3Dy
> > CONFIG_CRYPTO_CTS=3Dm
> > CONFIG_CRYPTO_ECB=3Dy
> > CONFIG_CRYPTO_LRW=3Dy
> > CONFIG_CRYPTO_OFB=3Dy
> > # CONFIG_CRYPTO_PCBC is not set
> > CONFIG_CRYPTO_XTS=3Dy
> > # CONFIG_CRYPTO_KEYWRAP is not set
> > CONFIG_CRYPTO_NHPOLY1305=3Dm
> > CONFIG_CRYPTO_ADIANTUM=3Dm
> > # CONFIG_CRYPTO_ESSIV is not set
> > =

> > #
> > # Hash modes
> > #
> > CONFIG_CRYPTO_CMAC=3Dy
> > CONFIG_CRYPTO_HMAC=3Dy
> > CONFIG_CRYPTO_XCBC=3Dy
> > CONFIG_CRYPTO_VMAC=3Dm
> > =

> > #
> > # Digest
> > #
> > CONFIG_CRYPTO_CRC32C=3Dy
> > # CONFIG_CRYPTO_CRC32C_INTEL is not set
> > CONFIG_CRYPTO_CRC32=3Dm
> > # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> > CONFIG_CRYPTO_XXHASH=3Dy
> > CONFIG_CRYPTO_BLAKE2B=3Dy
> > # CONFIG_CRYPTO_BLAKE2S is not set
> > CONFIG_CRYPTO_CRCT10DIF=3Dy
> > CONFIG_CRYPTO_GHASH=3Dy
> > CONFIG_CRYPTO_POLY1305=3Dy
> > CONFIG_CRYPTO_MD4=3Dm
> > CONFIG_CRYPTO_MD5=3Dm
> > # CONFIG_CRYPTO_MICHAEL_MIC is not set
> > CONFIG_CRYPTO_RMD160=3Dy
> > CONFIG_CRYPTO_SHA1=3Dy
> > CONFIG_CRYPTO_SHA256=3Dy
> > CONFIG_CRYPTO_SHA512=3Dm
> > CONFIG_CRYPTO_SHA3=3Dm
> > CONFIG_CRYPTO_SM3=3Dy
> > # CONFIG_CRYPTO_STREEBOG is not set
> > # CONFIG_CRYPTO_WP512 is not set
> > =

> > #
> > # Ciphers
> > #
> > CONFIG_CRYPTO_AES=3Dy
> > CONFIG_CRYPTO_AES_TI=3Dm
> > CONFIG_CRYPTO_AES_NI_INTEL=3Dm
> > CONFIG_CRYPTO_BLOWFISH=3Dm
> > CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> > CONFIG_CRYPTO_CAMELLIA=3Dm
> > CONFIG_CRYPTO_CAST_COMMON=3Dy
> > CONFIG_CRYPTO_CAST5=3Dy
> > # CONFIG_CRYPTO_CAST6 is not set
> > CONFIG_CRYPTO_DES=3Dm
> > CONFIG_CRYPTO_FCRYPT=3Dy
> > CONFIG_CRYPTO_CHACHA20=3Dm
> > CONFIG_CRYPTO_SERPENT=3Dm
> > CONFIG_CRYPTO_SERPENT_SSE2_586=3Dm
> > # CONFIG_CRYPTO_SM4 is not set
> > CONFIG_CRYPTO_TWOFISH=3Dy
> > CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> > # CONFIG_CRYPTO_TWOFISH_586 is not set
> > =

> > #
> > # Compression
> > #
> > # CONFIG_CRYPTO_DEFLATE is not set
> > # CONFIG_CRYPTO_LZO is not set
> > # CONFIG_CRYPTO_842 is not set
> > CONFIG_CRYPTO_LZ4=3Dy
> > CONFIG_CRYPTO_LZ4HC=3Dy
> > CONFIG_CRYPTO_ZSTD=3Dy
> > =

> > #
> > # Random Number Generation
> > #
> > CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> > CONFIG_CRYPTO_DRBG_MENU=3Dm
> > CONFIG_CRYPTO_DRBG_HMAC=3Dy
> > # CONFIG_CRYPTO_DRBG_HASH is not set
> > # CONFIG_CRYPTO_DRBG_CTR is not set
> > CONFIG_CRYPTO_DRBG=3Dm
> > CONFIG_CRYPTO_JITTERENTROPY=3Dy
> > CONFIG_CRYPTO_KDF800108_CTR=3Dy
> > CONFIG_CRYPTO_USER_API=3Dm
> > # CONFIG_CRYPTO_USER_API_HASH is not set
> > CONFIG_CRYPTO_USER_API_SKCIPHER=3Dm
> > CONFIG_CRYPTO_USER_API_RNG=3Dm
> > CONFIG_CRYPTO_USER_API_RNG_CAVP=3Dy
> > # CONFIG_CRYPTO_USER_API_AEAD is not set
> > # CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
> > CONFIG_CRYPTO_HASH_INFO=3Dy
> > # CONFIG_CRYPTO_HW is not set
> > CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> > CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE=3Dm
> > CONFIG_X509_CERTIFICATE_PARSER=3Dy
> > CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy
> > CONFIG_TPM_KEY_PARSER=3Dm
> > CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> > # CONFIG_PKCS7_TEST_KEY is not set
> > CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> > =

> > #
> > # Certificates for signature checking
> > #
> > CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> > CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> > CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
> > CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
> > CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
> > CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> > CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> > CONFIG_SYSTEM_REVOCATION_LIST=3Dy
> > CONFIG_SYSTEM_REVOCATION_KEYS=3D""
> > # end of Certificates for signature checking
> > =

> > CONFIG_BINARY_PRINTF=3Dy
> > =

> > #
> > # Library routines
> > #
> > CONFIG_RAID6_PQ=3Dy
> > # CONFIG_RAID6_PQ_BENCHMARK is not set
> > CONFIG_LINEAR_RANGES=3Dy
> > # CONFIG_PACKING is not set
> > CONFIG_BITREVERSE=3Dy
> > CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> > CONFIG_GENERIC_STRNLEN_USER=3Dy
> > CONFIG_GENERIC_NET_UTILS=3Dy
> > CONFIG_CORDIC=3Dm
> > CONFIG_PRIME_NUMBERS=3Dm
> > CONFIG_RATIONAL=3Dy
> > CONFIG_GENERIC_PCI_IOMAP=3Dy
> > CONFIG_GENERIC_IOMAP=3Dy
> > CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> > CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> > =

> > #
> > # Crypto library routines
> > #
> > CONFIG_CRYPTO_LIB_AES=3Dy
> > CONFIG_CRYPTO_LIB_ARC4=3Dy
> > CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
> > CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> > CONFIG_CRYPTO_LIB_CHACHA=3Dy
> > CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3Dy
> > CONFIG_CRYPTO_LIB_CURVE25519=3Dy
> > CONFIG_CRYPTO_LIB_DES=3Dm
> > CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D1
> > CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> > # CONFIG_CRYPTO_LIB_POLY1305 is not set
> > # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> > CONFIG_CRYPTO_LIB_SHA256=3Dy
> > # end of Crypto library routines
> > =

> > CONFIG_CRC_CCITT=3Dy
> > CONFIG_CRC16=3Dy
> > CONFIG_CRC_T10DIF=3Dy
> > CONFIG_CRC_ITU_T=3Dy
> > CONFIG_CRC32=3Dy
> > # CONFIG_CRC32_SELFTEST is not set
> > # CONFIG_CRC32_SLICEBY8 is not set
> > CONFIG_CRC32_SLICEBY4=3Dy
> > # CONFIG_CRC32_SARWATE is not set
> > # CONFIG_CRC32_BIT is not set
> > CONFIG_CRC64=3Dy
> > CONFIG_CRC4=3Dm
> > CONFIG_CRC7=3Dm
> > CONFIG_LIBCRC32C=3Dy
> > CONFIG_CRC8=3Dy
> > CONFIG_XXHASH=3Dy
> > CONFIG_AUDIT_GENERIC=3Dy
> > # CONFIG_RANDOM32_SELFTEST is not set
> > CONFIG_ZLIB_INFLATE=3Dy
> > CONFIG_ZLIB_DEFLATE=3Dy
> > CONFIG_LZO_COMPRESS=3Dy
> > CONFIG_LZO_DECOMPRESS=3Dy
> > CONFIG_LZ4_COMPRESS=3Dy
> > CONFIG_LZ4HC_COMPRESS=3Dy
> > CONFIG_LZ4_DECOMPRESS=3Dy
> > CONFIG_ZSTD_COMPRESS=3Dy
> > CONFIG_ZSTD_DECOMPRESS=3Dy
> > CONFIG_XZ_DEC=3Dy
> > CONFIG_XZ_DEC_X86=3Dy
> > CONFIG_XZ_DEC_POWERPC=3Dy
> > CONFIG_XZ_DEC_IA64=3Dy
> > CONFIG_XZ_DEC_ARM=3Dy
> > CONFIG_XZ_DEC_ARMTHUMB=3Dy
> > CONFIG_XZ_DEC_SPARC=3Dy
> > CONFIG_XZ_DEC_MICROLZMA=3Dy
> > CONFIG_XZ_DEC_BCJ=3Dy
> > # CONFIG_XZ_DEC_TEST is not set
> > CONFIG_DECOMPRESS_GZIP=3Dy
> > CONFIG_DECOMPRESS_BZIP2=3Dy
> > CONFIG_DECOMPRESS_LZMA=3Dy
> > CONFIG_DECOMPRESS_XZ=3Dy
> > CONFIG_DECOMPRESS_LZO=3Dy
> > CONFIG_DECOMPRESS_LZ4=3Dy
> > CONFIG_DECOMPRESS_ZSTD=3Dy
> > CONFIG_GENERIC_ALLOCATOR=3Dy
> > CONFIG_REED_SOLOMON=3Dm
> > CONFIG_REED_SOLOMON_DEC16=3Dy
> > CONFIG_BCH=3Dy
> > CONFIG_TEXTSEARCH=3Dy
> > CONFIG_TEXTSEARCH_KMP=3Dm
> > CONFIG_TEXTSEARCH_BM=3Dm
> > CONFIG_TEXTSEARCH_FSM=3Dm
> > CONFIG_XARRAY_MULTI=3Dy
> > CONFIG_ASSOCIATIVE_ARRAY=3Dy
> > CONFIG_HAS_IOMEM=3Dy
> > CONFIG_HAS_IOPORT_MAP=3Dy
> > CONFIG_HAS_DMA=3Dy
> > CONFIG_DMA_OPS=3Dy
> > CONFIG_NEED_SG_DMA_LENGTH=3Dy
> > CONFIG_DMA_DECLARE_COHERENT=3Dy
> > CONFIG_DMA_CMA=3Dy
> > # CONFIG_DMA_PERNUMA_CMA is not set
> > =

> > #
> > # Default contiguous memory area size:
> > #
> > CONFIG_CMA_SIZE_MBYTES=3D0
> > CONFIG_CMA_SIZE_SEL_MBYTES=3Dy
> > # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> > # CONFIG_CMA_SIZE_SEL_MIN is not set
> > # CONFIG_CMA_SIZE_SEL_MAX is not set
> > CONFIG_CMA_ALIGNMENT=3D8
> > # CONFIG_DMA_API_DEBUG is not set
> > # CONFIG_DMA_MAP_BENCHMARK is not set
> > CONFIG_SGL_ALLOC=3Dy
> > CONFIG_CHECK_SIGNATURE=3Dy
> > CONFIG_DQL=3Dy
> > CONFIG_GLOB=3Dy
> > # CONFIG_GLOB_SELFTEST is not set
> > CONFIG_NLATTR=3Dy
> > CONFIG_CLZ_TAB=3Dy
> > # CONFIG_IRQ_POLL is not set
> > CONFIG_MPILIB=3Dy
> > CONFIG_SIGNATURE=3Dy
> > CONFIG_LIBFDT=3Dy
> > CONFIG_OID_REGISTRY=3Dy
> > CONFIG_UCS2_STRING=3Dy
> > CONFIG_HAVE_GENERIC_VDSO=3Dy
> > CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> > CONFIG_GENERIC_VDSO_32=3Dy
> > CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> > CONFIG_FONT_SUPPORT=3Dy
> > CONFIG_FONT_8x16=3Dy
> > CONFIG_FONT_AUTOSELECT=3Dy
> > CONFIG_SG_POOL=3Dy
> > CONFIG_ARCH_STACKWALK=3Dy
> > CONFIG_STACKDEPOT=3Dy
> > CONFIG_STACKDEPOT_ALWAYS_INIT=3Dy
> > CONFIG_STACK_HASH_ORDER=3D20
> > CONFIG_SBITMAP=3Dy
> > # end of Library routines
> > =

> > CONFIG_ASN1_ENCODER=3Dm
> > =

> > #
> > # Kernel hacking
> > #
> > =

> > #
> > # printk and dmesg options
> > #
> > CONFIG_PRINTK_TIME=3Dy
> > CONFIG_PRINTK_CALLER=3Dy
> > CONFIG_STACKTRACE_BUILD_ID=3Dy
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> > CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> > # CONFIG_BOOT_PRINTK_DELAY is not set
> > # CONFIG_DYNAMIC_DEBUG is not set
> > # CONFIG_DYNAMIC_DEBUG_CORE is not set
> > # CONFIG_SYMBOLIC_ERRNAME is not set
> > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > # end of printk and dmesg options
> > =

> > #
> > # Compile-time checks and compiler options
> > #
> > CONFIG_DEBUG_INFO=3Dy
> > CONFIG_DEBUG_INFO_REDUCED=3Dy
> > # CONFIG_DEBUG_INFO_COMPRESSED is not set
> > # CONFIG_DEBUG_INFO_SPLIT is not set
> > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > # CONFIG_DEBUG_INFO_DWARF4 is not set
> > # CONFIG_DEBUG_INFO_DWARF5 is not set
> > CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> > # CONFIG_GDB_SCRIPTS is not set
> > CONFIG_FRAME_WARN=3D1024
> > CONFIG_STRIP_ASM_SYMS=3Dy
> > # CONFIG_READABLE_ASM is not set
> > # CONFIG_HEADERS_INSTALL is not set
> > CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> > CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> > CONFIG_FRAME_POINTER=3Dy
> > # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> > # end of Compile-time checks and compiler options
> > =

> > #
> > # Generic Kernel Debugging Instruments
> > #
> > CONFIG_MAGIC_SYSRQ=3Dy
> > CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> > CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> > CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> > CONFIG_DEBUG_FS=3Dy
> > CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> > # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> > # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> > CONFIG_HAVE_ARCH_KGDB=3Dy
> > # CONFIG_KGDB is not set
> > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> > CONFIG_UBSAN=3Dy
> > # CONFIG_UBSAN_TRAP is not set
> > CONFIG_CC_HAS_UBSAN_BOUNDS=3Dy
> > CONFIG_UBSAN_BOUNDS=3Dy
> > CONFIG_UBSAN_ONLY_BOUNDS=3Dy
> > CONFIG_UBSAN_SHIFT=3Dy
> > # CONFIG_UBSAN_DIV_ZERO is not set
> > CONFIG_UBSAN_UNREACHABLE=3Dy
> > # CONFIG_UBSAN_BOOL is not set
> > # CONFIG_UBSAN_ENUM is not set
> > # CONFIG_UBSAN_ALIGNMENT is not set
> > CONFIG_UBSAN_SANITIZE_ALL=3Dy
> > # CONFIG_TEST_UBSAN is not set
> > # end of Generic Kernel Debugging Instruments
> > =

> > CONFIG_DEBUG_KERNEL=3Dy
> > CONFIG_DEBUG_MISC=3Dy
> > =

> > #
> > # Networking Debugging
> > #
> > # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> > # CONFIG_NET_NS_REFCNT_TRACKER is not set
> > # end of Networking Debugging
> > =

> > #
> > # Memory Debugging
> > #
> > CONFIG_PAGE_EXTENSION=3Dy
> > # CONFIG_DEBUG_PAGEALLOC is not set
> > # CONFIG_PAGE_OWNER is not set
> > # CONFIG_PAGE_POISONING is not set
> > # CONFIG_DEBUG_PAGE_REF is not set
> > # CONFIG_DEBUG_RODATA_TEST is not set
> > CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> > # CONFIG_DEBUG_WX is not set
> > CONFIG_GENERIC_PTDUMP=3Dy
> > CONFIG_PTDUMP_CORE=3Dy
> > # CONFIG_PTDUMP_DEBUGFS is not set
> > # CONFIG_DEBUG_OBJECTS is not set
> > CONFIG_SLUB_DEBUG_ON=3Dy
> > CONFIG_SLUB_STATS=3Dy
> > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > # CONFIG_DEBUG_KMEMLEAK is not set
> > # CONFIG_DEBUG_STACK_USAGE is not set
> > # CONFIG_SCHED_STACK_END_CHECK is not set
> > CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> > # CONFIG_DEBUG_VM is not set
> > CONFIG_DEBUG_VM_PGTABLE=3Dy
> > CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> > # CONFIG_DEBUG_VIRTUAL is not set
> > CONFIG_DEBUG_MEMORY_INIT=3Dy
> > # CONFIG_DEBUG_KMAP_LOCAL is not set
> > CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=3Dy
> > # CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
> > # CONFIG_DEBUG_HIGHMEM is not set
> > CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> > # CONFIG_DEBUG_STACKOVERFLOW is not set
> > CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> > CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> > CONFIG_HAVE_ARCH_KFENCE=3Dy
> > CONFIG_KFENCE=3Dy
> > CONFIG_KFENCE_SAMPLE_INTERVAL=3D100
> > CONFIG_KFENCE_NUM_OBJECTS=3D255
> > CONFIG_KFENCE_STRESS_TEST_FAULTS=3D0
> > # end of Memory Debugging
> > =

> > # CONFIG_DEBUG_SHIRQ is not set
> > =

> > #
> > # Debug Oops, Lockups and Hangs
> > #
> > CONFIG_PANIC_ON_OOPS=3Dy
> > CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > CONFIG_PANIC_TIMEOUT=3D0
> > CONFIG_LOCKUP_DETECTOR=3Dy
> > CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> > # CONFIG_HARDLOCKUP_DETECTOR is not set
> > CONFIG_DETECT_HUNG_TASK=3Dy
> > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480
> > # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> > CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> > CONFIG_WQ_WATCHDOG=3Dy
> > # CONFIG_TEST_LOCKUP is not set
> > # end of Debug Oops, Lockups and Hangs
> > =

> > #
> > # Scheduler Debugging
> > #
> > CONFIG_SCHED_DEBUG=3Dy
> > CONFIG_SCHED_INFO=3Dy
> > CONFIG_SCHEDSTATS=3Dy
> > # end of Scheduler Debugging
> > =

> > CONFIG_DEBUG_TIMEKEEPING=3Dy
> > =

> > #
> > # Lock Debugging (spinlocks, mutexes, etc...)
> > #
> > CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> > CONFIG_PROVE_LOCKING=3Dy
> > # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> > # CONFIG_LOCK_STAT is not set
> > CONFIG_DEBUG_RT_MUTEXES=3Dy
> > CONFIG_DEBUG_SPINLOCK=3Dy
> > CONFIG_DEBUG_MUTEXES=3Dy
> > CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> > CONFIG_DEBUG_RWSEMS=3Dy
> > CONFIG_DEBUG_LOCK_ALLOC=3Dy
> > CONFIG_LOCKDEP=3Dy
> > CONFIG_LOCKDEP_BITS=3D15
> > CONFIG_LOCKDEP_CHAINS_BITS=3D16
> > CONFIG_LOCKDEP_STACK_TRACE_BITS=3D19
> > CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=3D14
> > CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=3D12
> > # CONFIG_DEBUG_LOCKDEP is not set
> > CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > CONFIG_LOCK_TORTURE_TEST=3Dm
> > # CONFIG_WW_MUTEX_SELFTEST is not set
> > # CONFIG_SCF_TORTURE_TEST is not set
> > # end of Lock Debugging (spinlocks, mutexes, etc...)
> > =

> > CONFIG_TRACE_IRQFLAGS=3Dy
> > CONFIG_TRACE_IRQFLAGS_NMI=3Dy
> > # CONFIG_DEBUG_IRQFLAGS is not set
> > CONFIG_STACKTRACE=3Dy
> > CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> > # CONFIG_DEBUG_KOBJECT is not set
> > =

> > #
> > # Debug kernel data structures
> > #
> > # CONFIG_DEBUG_LIST is not set
> > # CONFIG_DEBUG_PLIST is not set
> > # CONFIG_DEBUG_SG is not set
> > # CONFIG_DEBUG_NOTIFIERS is not set
> > # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> > # end of Debug kernel data structures
> > =

> > # CONFIG_DEBUG_CREDENTIALS is not set
> > =

> > #
> > # RCU Debugging
> > #
> > CONFIG_PROVE_RCU=3Dy
> > CONFIG_TORTURE_TEST=3Dm
> > CONFIG_RCU_SCALE_TEST=3Dm
> > CONFIG_RCU_TORTURE_TEST=3Dm
> > # CONFIG_RCU_REF_SCALE_TEST is not set
> > # CONFIG_RCU_TRACE is not set
> > # CONFIG_RCU_EQS_DEBUG is not set
> > # end of RCU Debugging
> > =

> > # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> > CONFIG_LATENCYTOP=3Dy
> > CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> > CONFIG_NOP_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> > CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> > CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> > CONFIG_BUILDTIME_MCOUNT_SORT=3Dy
> > CONFIG_TRACE_CLOCK=3Dy
> > CONFIG_RING_BUFFER=3Dy
> > CONFIG_EVENT_TRACING=3Dy
> > CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> > CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> > CONFIG_TRACING=3Dy
> > CONFIG_TRACING_SUPPORT=3Dy
> > # CONFIG_FTRACE is not set
> > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > # CONFIG_SAMPLES is not set
> > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> > # CONFIG_STRICT_DEVMEM is not set
> > =

> > #
> > # x86 Debugging
> > #
> > CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> > CONFIG_EARLY_PRINTK_USB=3Dy
> > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > CONFIG_EARLY_PRINTK=3Dy
> > CONFIG_EARLY_PRINTK_DBGP=3Dy
> > CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> > CONFIG_EFI_PGT_DUMP=3Dy
> > # CONFIG_DEBUG_TLBFLUSH is not set
> > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > # CONFIG_X86_DECODER_SELFTEST is not set
> > # CONFIG_IO_DELAY_0X80 is not set
> > # CONFIG_IO_DELAY_0XED is not set
> > CONFIG_IO_DELAY_UDELAY=3Dy
> > # CONFIG_IO_DELAY_NONE is not set
> > # CONFIG_DEBUG_BOOT_PARAMS is not set
> > # CONFIG_CPA_DEBUG is not set
> > # CONFIG_DEBUG_ENTRY is not set
> > CONFIG_X86_DEBUG_FPU=3Dy
> > # CONFIG_PUNIT_ATOM_DEBUG is not set
> > CONFIG_UNWINDER_FRAME_POINTER=3Dy
> > # end of x86 Debugging
> > =

> > #
> > # Kernel Testing and Coverage
> > #
> > # CONFIG_KUNIT is not set
> > # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> > CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> > # CONFIG_FAULT_INJECTION is not set
> > CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> > # CONFIG_RUNTIME_TESTING_MENU is not set
> > CONFIG_ARCH_USE_MEMTEST=3Dy
> > CONFIG_MEMTEST=3Dy
> > # end of Kernel Testing and Coverage
> > # end of Kernel hacking
> =

> > #!/bin/sh
> > =

> > export_top_env()
> > {
> > 	export suite=3D'rcutorture'
> > 	export testcase=3D'rcutorture'
> > 	export category=3D'functional'
> > 	export need_memory=3D'300MB'
> > 	export runtime=3D300
> > 	export job_origin=3D'rcutorture.yaml'
> > 	export queue_cmdline_keys=3D'branch
> > commit'
> > 	export queue=3D'validate'
> > 	export testbox=3D'vm-snb-i386-129'
> > 	export tbox_group=3D'vm-snb-i386'
> > 	export branch=3D'vbabka/slub-stackdepot-v3r1'
> > 	export commit=3D'555b8c8cb3f335ec8fd9d1ffd25e1395790d102d'
> > 	export kconfig=3D'i386-randconfig-a004-20220314'
> > 	export nr_vm=3D160
> > 	export submit_id=3D'623a82e3bf36902a2008661c'
> > 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-i386-129/rcutorture-300s=
-cpuhotplug-tasks-debian-i386-20191205.cgz-555b8c8cb3f335ec8fd9d1ffd25e1395=
790d102d-20220323-76320-4rvhyt-25.yaml'
> > 	export id=3D'c22042fb112ba6a0bc489bdf55cde4e35922d75e'
> > 	export queuer_version=3D'/lkp-src'
> > 	export model=3D'qemu-system-i386 -enable-kvm -cpu SandyBridge'
> > 	export nr_cpu=3D2
> > 	export memory=3D'4G'
> > 	export need_kconfig=3D\{\"RCU_TORTURE_TEST\"\=3D\>\"m\"\}'
> > '\{\"SECURITY_LOADPIN_ENABLED\"\=3D\>\"n,\ \<\=3D\ v4.19\"\}'
> > '\{\"SECURITY_LOADPIN_ENFORCE\"\=3D\>\"n,\ v4.20\"\}'
> > '\{\"MODULE_UNLOAD\"\=3D\>\"y\"\}'
> > '\{\"KVM_GUEST\"\=3D\>\"y\"\}
> > 	export ssh_base_port=3D23400
> > 	export kernel_cmdline=3D'vmalloc=3D128M initramfs_async=3D0 page_owner=
=3Don'
> > 	export rootfs=3D'debian-i386-20191205.cgz'
> > 	export compiler=3D'gcc-9'
> > 	export enqueue_time=3D'2022-03-23 10:16:03 +0800'
> > 	export _id=3D'623a82f9bf36902a20086625'
> > 	export _rt=3D'/result/rcutorture/300s-cpuhotplug-tasks/vm-snb-i386/deb=
ian-i386-20191205.cgz/i386-randconfig-a004-20220314/gcc-9/555b8c8cb3f335ec8=
fd9d1ffd25e1395790d102d'
> > 	export user=3D'lkp'
> > 	export LKP_SERVER=3D'internal-lkp-server'
> > 	export result_root=3D'/result/rcutorture/300s-cpuhotplug-tasks/vm-snb-=
i386/debian-i386-20191205.cgz/i386-randconfig-a004-20220314/gcc-9/555b8c8cb=
3f335ec8fd9d1ffd25e1395790d102d/22'
> > 	export scheduler_version=3D'/lkp/lkp/.src-20220323-100648'
> > 	export arch=3D'i386'
> > 	export max_uptime=3D2100
> > 	export initrd=3D'/osimage/debian/debian-i386-20191205.cgz'
> > 	export bootloader_append=3D'root=3D/dev/ram0
> > RESULT_ROOT=3D/result/rcutorture/300s-cpuhotplug-tasks/vm-snb-i386/debi=
an-i386-20191205.cgz/i386-randconfig-a004-20220314/gcc-9/555b8c8cb3f335ec8f=
d9d1ffd25e1395790d102d/22
> > BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a004-20220314/gcc-9/555b8c8cb3f=
335ec8fd9d1ffd25e1395790d102d/vmlinuz-5.17.0-rc1-00003-g555b8c8cb3f3
> > branch=3Dvbabka/slub-stackdepot-v3r1
> > job=3D/lkp/jobs/scheduled/vm-snb-i386-129/rcutorture-300s-cpuhotplug-ta=
sks-debian-i386-20191205.cgz-555b8c8cb3f335ec8fd9d1ffd25e1395790d102d-20220=
323-76320-4rvhyt-25.yaml
> > user=3Dlkp
> > ARCH=3Di386
> > kconfig=3Di386-randconfig-a004-20220314
> > commit=3D555b8c8cb3f335ec8fd9d1ffd25e1395790d102d
> > vmalloc=3D128M initramfs_async=3D0 page_owner=3Don
> > max_uptime=3D2100
> > LKP_SERVER=3Dinternal-lkp-server
> > selinux=3D0
> > debug
> > apic=3Ddebug
> > sysrq_always_enabled
> > rcupdate.rcu_cpu_stall_timeout=3D100
> > net.ifnames=3D0
> > printk.devkmsg=3Don
> > panic=3D-1
> > softlockup_panic=3D1
> > nmi_watchdog=3Dpanic
> > oops=3Dpanic
> > load_ramdisk=3D2
> > prompt_ramdisk=3D0
> > drbd.minor_count=3D8
> > systemd.log_level=3Derr
> > ignore_loglevel
> > console=3Dtty0
> > earlyprintk=3DttyS0,115200
> > console=3DttyS0,115200
> > vga=3Dnormal
> > rw'
> > 	export modules_initrd=3D'/pkg/linux/i386-randconfig-a004-20220314/gcc-=
9/555b8c8cb3f335ec8fd9d1ffd25e1395790d102d/modules.cgz'
> > 	export bm_initrd=3D'/osimage/deps/debian-i386-20191205.cgz/lkp_2020120=
3.cgz'
> > 	export lkp_initrd=3D'/osimage/user/lkp/lkp-i386.cgz'
> > 	export site=3D'inn'
> > 	export LKP_CGI_PORT=3D80
> > 	export LKP_CIFS_PORT=3D139
> > 	export repeat_to=3D32
> > 	export schedule_notify_address=3D
> > 	export kernel=3D'/pkg/linux/i386-randconfig-a004-20220314/gcc-9/555b8c=
8cb3f335ec8fd9d1ffd25e1395790d102d/vmlinuz-5.17.0-rc1-00003-g555b8c8cb3f3'
> > 	export dequeue_time=3D'2022-03-23 10:17:55 +0800'
> > 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-i386-129/rcutorture-30=
0s-cpuhotplug-tasks-debian-i386-20191205.cgz-555b8c8cb3f335ec8fd9d1ffd25e13=
95790d102d-20220323-76320-4rvhyt-25.cgz'
> > =

> > 	[ -n "$LKP_SRC" ] ||
> > 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> > }
> > =

> > run_job()
> > {
> > 	echo $$ > $TMP/run-job.pid
> > =

> > 	. $LKP_SRC/lib/http.sh
> > 	. $LKP_SRC/lib/job.sh
> > 	. $LKP_SRC/lib/env.sh
> > =

> > 	export_top_env
> > =

> > 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> > 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> > 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> > 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> > 	run_monitor $LKP_SRC/monitors/plain/watchdog
> > =

> > 	run_test test=3D'cpuhotplug' torture_type=3D'tasks' $LKP_SRC/tests/wra=
pper rcutorture
> > }
> > =

> > extract_stats()
> > {
> > 	export stats_part_begin=3D
> > 	export stats_part_end=3D
> > =

> > 	env test=3D'cpuhotplug' torture_type=3D'tasks' $LKP_SRC/stats/wrapper =
rcutorture
> > 	$LKP_SRC/stats/wrapper kmsg
> > 	$LKP_SRC/stats/wrapper meminfo
> > =

> > 	$LKP_SRC/stats/wrapper time rcutorture.time
> > 	$LKP_SRC/stats/wrapper dmesg
> > 	$LKP_SRC/stats/wrapper kmsg
> > 	$LKP_SRC/stats/wrapper last_state
> > 	$LKP_SRC/stats/wrapper stderr
> > 	$LKP_SRC/stats/wrapper time
> > }
> > =

> > "$@"
> =

> =

> > 2022-03-23 02:18:35 modprobe rcutorture onoff_interval=3D3 onoff_holdof=
f=3D30 torture_type=3Dtasks
> > 2022-03-23 02:18:35 sleep 300
> > 2022-03-23 02:23:35 rmmod rcutorture
> > [   18.040468] tasks-torture:--- Start of test: nreaders=3D1 nfakewrite=
rs=3D4 stat_interval=3D60 verbose=3D1 test_no_idle_hz=3D1 shuffle_interval=
=3D3 stutter=3D5 irqreader=3D1 fqs_duration=3D0 fqs_holdoff=3D0 fqs_stutter=
=3D3 test_boost=3D1/0 test_boost_interval=3D7 test_boost_duration=3D4 shutd=
own_secs=3D0 stall_cpu=3D0 stall_cpu_holdoff=3D10 stall_cpu_irqsoff=3D0 sta=
ll_cpu_block=3D0 n_barrier_cbs=3D0 onoff_interval=3D3 onoff_holdoff=3D30 re=
ad_exit_delay=3D13 read_exit_burst=3D16 nocbs_nthreads=3D0 nocbs_toggle=3D1=
000
> > [   18.046148] tasks-torture: Creating rcu_torture_writer task
> > [   18.075572] tasks-torture: Creating rcu_torture_fakewriter task
> > [   18.076426] tasks-torture: rcu_torture_writer task started
> > [   18.076993] tasks-torture: GP expediting controlled from boot/sysfs =
for tasks.
> > [   18.077785] tasks-torture: Creating rcu_torture_fakewriter task
> > [   18.078407] tasks-torture: rcu_torture_fakewriter task started
> > [   18.079008] tasks-torture: Creating rcu_torture_fakewriter task
> > [   18.079630] tasks-torture: rcu_torture_fakewriter task started
> > [   18.080225] tasks-torture: Creating rcu_torture_fakewriter task
> > [   18.080866] tasks-torture: rcu_torture_fakewriter task started
> > [   18.091986] tasks-torture: Creating rcu_torture_reader task
> > [   18.092673] tasks-torture: rcu_torture_fakewriter task started
> > [   18.093275] tasks-torture: Creating rcu_torture_stats task
> > [   18.093870] tasks-torture: rcu_torture_reader task started
> > [   18.098748] tasks-torture: Creating torture_shuffle task
> > [   18.099366] tasks-torture: rcu_torture_stats task started
> > [   18.107324] tasks-torture: Creating torture_stutter task
> > [   18.107972] tasks-torture: torture_shuffle task started
> > [   18.117163] tasks-torture: rcu_torture_fwd_prog_init: Limiting fwd_p=
rogress to # CPUs.
> > [   18.118151] tasks-torture: rcu_torture_fwd_prog_init: Disabled, unsu=
pported by RCU flavor under test
> > [   18.119000] tasks-torture: Creating rcu_torture_read_exit task
> > [   18.119634] tasks-torture: torture_stutter task started
> > [   18.121854] tasks-torture: rcu_torture_read_exit: Start of test
> > [   23.485403] tasks-torture: rcu_torture_read_exit: End of episode
> > [   37.094692] tasks-torture: rcu_torture_read_exit: Start of episode
> > [   37.174939] tasks-torture: rcu_torture_read_exit: End of episode
> > [   51.425013] tasks-torture: rcu_torture_read_exit: Start of episode
> > [   53.196427] tasks-torture: rcu_torture_read_exit: End of episode
> > [   66.963911] tasks-torture: rcu_torture_read_exit: Start of episode
> > [   66.967746] tasks-torture: rcu_torture_read_exit: End of episode
> > [   80.523487] tasks-torture: rcu_torture_read_exit: Start of episode
> > [   81.243474] tasks-torture: rtc: f7513624 ver: 132 tfle: 0 rta: 132 r=
taf: 0 rtf: 123 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb:=
 0 nt: 759 barrier: 0/0:0 read-exits: 68 nocb-toggles: 0:0
> > [   81.246883] tasks-torture: Reader Pipe:  15634400 0 0 0 0 0 0 0 0 0 0
> > [   81.248077] tasks-torture: Reader Batch:  15634400 0 0 0 0 0 0 0 0 0=
 0
> > [   81.249528] tasks-torture: Free-Block Circulation:  131 131 130 129 =
128 127 126 125 124 123 0
> > [   83.245694] tasks-torture: rcu_torture_read_exit: End of episode
> > [   97.102976] tasks-torture: rcu_torture_read_exit: Start of episode
> > [   97.106741] tasks-torture: rcu_torture_read_exit: End of episode
> > [  110.922622] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  113.492006] tasks-torture: rcu_torture_read_exit: End of episode
> > [  127.372129] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  127.385908] tasks-torture: rcu_torture_read_exit: End of episode
> > [  141.152066] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  143.071702] tasks-torture: rtc: f7513d08 ver: 292 tfle: 0 rta: 292 r=
taf: 0 rtf: 283 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb:=
 0 nt: 1940 barrier: 0/0:0 read-exits: 136 nocb-toggles: 0:0
> > [  143.075769] tasks-torture: Reader Pipe:  38409326 0 0 0 0 0 0 0 0 0 0
> > [  143.077168] tasks-torture: Reader Batch:  38409326 0 0 0 0 0 0 0 0 0=
 0
> > [  143.078509] tasks-torture: Free-Block Circulation:  291 291 290 289 =
288 287 286 285 284 283 0
> > [  143.684331] tasks-torture: rcu_torture_read_exit: End of episode
> > [  157.946436] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  157.950429] tasks-torture: rcu_torture_read_exit: End of episode
> > [  171.510857] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  173.863192] tasks-torture: rcu_torture_read_exit: End of episode
> > [  187.577288] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  187.599735] tasks-torture: rcu_torture_read_exit: End of episode
> > [  203.969936] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  204.391993] tasks-torture: rcu_torture_read_exit: End of episode
> > [  207.599784] tasks-torture: rtc: f7513a14 ver: 474 tfle: 0 rta: 475 r=
taf: 0 rtf: 457 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb:=
 0 nt: 3022 barrier: 0/0:0 read-exits: 220 nocb-toggles: 0:0
> > [  207.602216] tasks-torture: Reader Pipe:  61571337 0 0 0 0 0 0 0 0 0 0
> > [  207.603225] tasks-torture: Reader Batch:  61571337 0 0 0 0 0 0 0 0 0=
 0
> > [  207.604266] tasks-torture: Free-Block Circulation:  474 473 469 467 =
466 465 463 459 458 457 0
> > [  218.009503] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  218.016359] tasks-torture: rcu_torture_read_exit: End of episode
> > [  232.029040] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  234.656530] tasks-torture: rcu_torture_read_exit: End of episode
> > [  248.298583] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  248.312720] tasks-torture: rcu_torture_read_exit: End of episode
> > [  262.158221] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  264.850689] tasks-torture: rcu_torture_read_exit: End of episode
> > [  269.545749] tasks-torture: rtc: f7513694 ver: 643 tfle: 0 rta: 644 r=
taf: 0 rtf: 631 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb:=
 0 nt: 4205 barrier: 0/0:0 read-exits: 288 nocb-toggles: 0:0
> > [  269.549182] tasks-torture: Reader Pipe:  83224300 0 0 0 0 0 0 0 0 0 0
> > [  269.550432] tasks-torture: Reader Batch:  83224300 0 0 0 0 0 0 0 0 0=
 0
> > [  269.551758] tasks-torture: Free-Block Circulation:  643 642 640 639 =
638 637 634 633 632 631 0
> > [  278.677655] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  278.681017] tasks-torture: rcu_torture_read_exit: End of episode
> > [  292.742541] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  294.907579] tasks-torture: rcu_torture_read_exit: End of episode
> > [  308.796167] tasks-torture: rcu_torture_read_exit: Start of episode
> > [  308.800302] tasks-torture: rcu_torture_read_exit: End of episode
> > [  318.174095] tasks-torture: Stopping torture_shuffle task
> > [  318.175385] tasks-torture: Stopping torture_shuffle
> > [  318.180138] tasks-torture: Stopping torture_stutter task
> > [  318.181387] tasks-torture: Stopping torture_stutter
> > [  318.182636] tasks-torture: Stopping rcu_torture_reader
> > [  318.226676] tasks-torture: Stopping rcu_torture_read_exit
> > [  318.227939] tasks-torture: Stopping rcutorture_read_exit task
> > [  318.229195] tasks-torture: Stopping rcu_torture_writer task
> > [  318.246520] tasks-torture: Stopping rcu_torture_fakewriter
> > [  318.376621] tasks-torture: Dynamic grace-period expediting was disab=
led.
> > [  318.378103] tasks-torture: Stopping rcu_torture_writer
> > [  318.379104] tasks-torture: Stopping rcu_torture_reader task
> > [  318.380229] tasks-torture: Stopping rcu_torture_fakewriter
> > [  318.381192] tasks-torture: Stopping rcu_torture_fakewriter
> > [  318.382174] tasks-torture: Stopping rcu_torture_fakewriter
> > [  318.383372] tasks-torture: Stopping rcu_torture_fakewriter task
> > [  318.384733] tasks-torture: Stopping rcu_torture_fakewriter task
> > [  318.386024] tasks-torture: Stopping rcu_torture_fakewriter task
> > [  318.404594] tasks-torture: Stopping rcu_torture_fakewriter task
> > [  318.407345] tasks-torture: Stopping rcu_torture_stats task
> > [  318.413027] tasks-torture: rtc: 00000000 VER: 782 tfle: 0 rta: 782 r=
taf: 0 rtf: 772 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb:=
 0 nt: 5058 barrier: 0/0:0 read-exits: 339 nocb-toggles: 0:0
> > [  318.416674] tasks-torture: Reader Pipe:  99476015 0 0 0 0 0 0 0 0 0 0
> > [  318.418078] tasks-torture: Reader Batch:  99476015 0 0 0 0 0 0 0 0 0=
 0
> > [  318.419514] tasks-torture: Free-Block Circulation:  781 781 779 778 =
777 776 775 774 773 772 0
> > [  318.421299] tasks-torture: Stopping rcu_torture_stats
> > [  319.028923] tasks-torture: rtc: 00000000 VER: 782 tfle: 0 rta: 782 r=
taf: 0 rtf: 772 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb:=
 0 nt: 5058 barrier: 0/0:0 read-exits: 339 nocb-toggles: 0:0
> > [  319.032352] tasks-torture: Reader Pipe:  99476015 0 0 0 0 0 0 0 0 0 0
> > [  319.033727] tasks-torture: Reader Batch:  99476015 0 0 0 0 0 0 0 0 0=
 0
> > [  319.035188] tasks-torture: Free-Block Circulation:  781 781 779 778 =
777 776 775 774 773 772 0
> > [  319.037158] tasks-torture:--- End of test: SUCCESS: nreaders=3D1 nfa=
kewriters=3D4 stat_interval=3D60 verbose=3D1 test_no_idle_hz=3D1 shuffle_in=
terval=3D3 stutter=3D5 irqreader=3D1 fqs_duration=3D0 fqs_holdoff=3D0 fqs_s=
tutter=3D3 test_boost=3D1/0 test_boost_interval=3D7 test_boost_duration=3D4=
 shutdown_secs=3D0 stall_cpu=3D0 stall_cpu_holdoff=3D10 stall_cpu_irqsoff=
=3D0 stall_cpu_block=3D0 n_barrier_cbs=3D0 onoff_interval=3D3 onoff_holdoff=
=3D30 read_exit_delay=3D13 read_exit_burst=3D16 nocbs_nthreads=3D0 nocbs_to=
ggle=3D1000
>=20
--===============0093535511003517046==--

