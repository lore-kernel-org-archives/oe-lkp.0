Content-Type: multipart/mixed; boundary="===============3880150944350353970=="
MIME-Version: 1.0
From: Luis Chamberlain <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [proc/sysctl] 1dd38979b2: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 25 Apr 2022 16:08:57 -0700
Message-ID: <YmcqCVLv3HQ+Kxeq@bombadil.infradead.org>
In-Reply-To: <20220425144607.2c2588e6b1f00ab8a6f3f6ea@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3880150944350353970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 02:46:07PM -0700, Andrew Morton wrote:
> On Mon, 25 Apr 2022 12:00:21 -0700 Luis Chamberlain <mcgrof@kernel.org>=
 wrote:
> =

> > Andrew, can we drop this patch for now?
> =

> I've been sitting on (ie, forgotten about) this patch
> (https://lore.kernel.org/all/20200709235115.56954-1-jpitti(a)cisco.com/T/=
#u)

Jesh, yeah I see.

> for two years.  Evidently waiting for you/Kees/Ingo to provide
> guidance.  So sure, the need seems very unurgent so I can drop it.

Well Keew as OK with it, but I yeah I can't decipher the issue at this
point in time.

> However I fail to see how that patch could have caused this crash.  I'm
> suspecting a bisection error?
> =

> Maybe something is unwell in drivers/vdpa/vdpa_user/vduse_dev.c.

At a quick glance, yes it could very well by vduse_init() is messy and
races somehow with init, but if a race does lurk here my instincts tell
me this can't be the only place.

Not sure if leaving a patch in place more time to see how else things
can explode is worth it.

  Luis

> =

> >   Luis
> > =

> > On Mon, Apr 25, 2022 at 04:33:02PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with gcc-11):
> > > =

> > > commit: 1dd38979b2f04a9b7261e05961999024059b3db2 ("proc/sysctl: make =
protected_* world readable")
> > > url: https://github.com/intel-lab-lkp/linux/commits/Randy-Dunlap/huge=
tlb-use-mm-h-instead-of-mm_types-h/20220421-094935
> > > =

> > > in testcase: trinity
> > > version: trinity-static-i386-x86_64-1c734c75-1_2020-01-06
> > > with following parameters:
> > > =

> > > 	runtime: 300s
> > > 	group: group-03
> > > =

> > > test-description: Trinity is a linux system call fuzz tester.
> > > test-url: http://codemonkey.org.uk/projects/trinity/
> > > =

> > > =

> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp=
 2 -m 16G
> > > =

> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> > > =

> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > > =

> > > [  132.841881][ T3644] BUG: kernel NULL pointer dereference, address:=
 00000000000000f8
> > > [  132.843457][ T3644] #PF: supervisor read access in kernel mode
> > > [  132.844654][ T3644] #PF: error_code(0x0000) - not-present page
> > > [  132.845813][ T3644] PGD 8000000176d99067 P4D 8000000176d99067 PUD =
176d9a067 PMD 0
> > > [  132.847313][ T3644] Oops: 0000 [#1] PTI
> > > [  132.848075][ T3644] CPU: 0 PID: 3644 Comm: trinity-c2 Not tainted =
5.18.0-rc2-mm1-00223-g1dd38979b2f0 #1 1590c2cb69aaeb6333e1eb9fb467faf90eeaf=
6bc
> > > [ 132.850619][ T3644] RIP: 0010:msg_timeout_show (drivers/vdpa/vdpa_u=
ser/vduse_dev.c:1271) =

> > > [ 132.851625][ T3644] Code: cc 0f 1f 00 e8 1b 6c 33 ff 55 48 89 d5 53=
 48 89 fb 48 8d 7f 78 e8 fa 02 57 ff 48 8b 5b 78 48 8d bb f8 00 00 00 e8 6a=
 ff 56 ff <8b> 93 f8 00 00 00 48 89 ef 48 c7 c6 2f 03 f0 a1 e8 95 b2 82 ff =
5b
> > > All code
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:	cc                   	int3   =

> > >    1:	0f 1f 00             	nopl   (%rax)
> > >    4:	e8 1b 6c 33 ff       	callq  0xffffffffff336c24
> > >    9:	55                   	push   %rbp
> > >    a:	48 89 d5             	mov    %rdx,%rbp
> > >    d:	53                   	push   %rbx
> > >    e:	48 89 fb             	mov    %rdi,%rbx
> > >   11:	48 8d 7f 78          	lea    0x78(%rdi),%rdi
> > >   15:	e8 fa 02 57 ff       	callq  0xffffffffff570314
> > >   1a:	48 8b 5b 78          	mov    0x78(%rbx),%rbx
> > >   1e:	48 8d bb f8 00 00 00 	lea    0xf8(%rbx),%rdi
> > >   25:	e8 6a ff 56 ff       	callq  0xffffffffff56ff94
> > >   2a:*	8b 93 f8 00 00 00    	mov    0xf8(%rbx),%edx		<-- trapping ins=
truction
> > >   30:	48 89 ef             	mov    %rbp,%rdi
> > >   33:	48 c7 c6 2f 03 f0 a1 	mov    $0xffffffffa1f0032f,%rsi
> > >   3a:	e8 95 b2 82 ff       	callq  0xffffffffff82b2d4
> > >   3f:	5b                   	pop    %rbx
> > > =

> > > Code starting with the faulting instruction
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:	8b 93 f8 00 00 00    	mov    0xf8(%rbx),%edx
> > >    6:	48 89 ef             	mov    %rbp,%rdi
> > >    9:	48 c7 c6 2f 03 f0 a1 	mov    $0xffffffffa1f0032f,%rsi
> > >   10:	e8 95 b2 82 ff       	callq  0xffffffffff82b2aa
> > >   15:	5b                   	pop    %rbx
> > > [  132.854983][ T3644] RSP: 0000:ffffc90005a47b50 EFLAGS: 00010246
> > > [  132.856171][ T3644] RAX: 0000000000000000 RBX: 0000000000000000 RC=
X: 0000000000000000
> > > [  132.857723][ T3644] RDX: 0000000000000000 RSI: 0000000000000000 RD=
I: 0000000000000000
> > > [  132.859332][ T3644] RBP: ffff888174621000 R08: 0000000000000000 R0=
9: 0000000000000000
> > > [  132.860824][ T3644] R10: 0000000000000000 R11: 0000000000000000 R1=
2: ffff88811a26a000
> > > [  132.862346][ T3644] R13: ffff888174621000 R14: ffff88811b781a50 R1=
5: 0000000000000000
> > > [  132.863895][ T3644] FS:  0000000000000000(0000) GS:ffffffffa22ba00=
0(0063) knlGS:0000000008acb840
> > > [  132.865587][ T3644] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050=
033
> > > [  132.866872][ T3644] CR2: 00000000000000f8 CR3: 0000000176c86000 CR=
4: 00000000000406b0
> > > [  132.868298][ T3644] Call Trace:
> > > [  132.868893][ T3644]  <TASK>
> > > [ 132.869447][ T3644] dev_attr_show (drivers/base/core.c:2094) =

> > > [ 132.870215][ T3644] sysfs_kf_seq_show (fs/sysfs/file.c:59) =

> > > [ 132.871164][ T3644] ? device_remove_bin_file (drivers/base/core.c:2=
088) =

> > > [ 132.872082][ T3644] kernfs_seq_show (fs/kernfs/file.c:164) =

> > > [ 132.872838][ T3644] seq_read_iter (fs/seq_file.c:230) =

> > > [ 132.873578][ T3644] ? __vmalloc_area_node (mm/vmalloc.c:3041) =

> > > [ 132.874532][ T3644] kernfs_fop_read_iter (fs/kernfs/file.c:238) =

> > > [ 132.875513][ T3644] __kernel_read (fs/read_write.c:440 (discriminat=
or 1)) =

> > > [ 132.876319][ T3644] kernel_read (fs/read_write.c:459) =

> > > [ 132.877129][ T3644] kernel_read_file (fs/kernel_read_file.c:94) =

> > > [ 132.877978][ T3644] kernel_read_file_from_fd (include/linux/file.h:=
45 fs/kernel_read_file.c:186) =

> > > [ 132.879019][ T3644] __do_sys_finit_module (kernel/module.c:4207) =

> > > [ 132.879930][ T3644] __ia32_sys_finit_module (kernel/module.c:4189) =

> > > [ 132.880930][ T3644] do_int80_syscall_32 (arch/x86/entry/common.c:11=
2 arch/x86/entry/common.c:132) =

> > > [ 132.881847][ T3644] entry_INT80_compat (arch/x86/entry/entry_64_com=
pat.S:419) =

> > > [  132.882718][ T3644] RIP: 0023:0x80a3392
> > > [ 132.883398][ T3644] Code: 89 c8 c3 90 8d 74 26 00 85 c0 c7 01 01 00=
 00 00 75 d8 a1 c8 a9 ac 08 eb d1 66 90 66 90 66 90 66 90 66 90 66 90 66 90=
 90 cd 80 <c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 00 8b 10 a3 f0 a9 ac 08 =
85
> > > All code
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:	89 c8                	mov    %ecx,%eax
> > >    2:	c3                   	retq   =

> > >    3:	90                   	nop
> > >    4:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
> > >    8:	85 c0                	test   %eax,%eax
> > >    a:	c7 01 01 00 00 00    	movl   $0x1,(%rcx)
> > >   10:	75 d8                	jne    0xffffffffffffffea
> > >   12:	a1 c8 a9 ac 08 eb d1 	movabs 0x9066d1eb08aca9c8,%eax
> > >   19:	66 90 =

> > >   1b:	66 90                	xchg   %ax,%ax
> > >   1d:	66 90                	xchg   %ax,%ax
> > >   1f:	66 90                	xchg   %ax,%ax
> > >   21:	66 90                	xchg   %ax,%ax
> > >   23:	66 90                	xchg   %ax,%ax
> > >   25:	66 90                	xchg   %ax,%ax
> > >   27:	90                   	nop
> > >   28:	cd 80                	int    $0x80
> > >   2a:*	c3                   	retq   		<-- trapping instruction
> > >   2b:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
> > >   31:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
> > >   38:	8b 10                	mov    (%rax),%edx
> > >   3a:	a3                   	.byte 0xa3
> > >   3b:	f0                   	lock
> > >   3c:	a9                   	.byte 0xa9
> > >   3d:	ac                   	lods   %ds:(%rsi),%al
> > >   3e:	08                   	.byte 0x8
> > >   3f:	85                   	.byte 0x85
> > > =

> > > Code starting with the faulting instruction
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:	c3                   	retq   =

> > >    1:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
> > >    7:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
> > >    e:	8b 10                	mov    (%rax),%edx
> > >   10:	a3                   	.byte 0xa3
> > >   11:	f0                   	lock
> > >   12:	a9                   	.byte 0xa9
> > >   13:	ac                   	lods   %ds:(%rsi),%al
> > >   14:	08                   	.byte 0x8
> > >   15:	85                   	.byte 0x85
> > > [  132.886851][ T3644] RSP: 002b:00000000ffef5ee8 EFLAGS: 00000292 OR=
IG_RAX: 000000000000015e
> > > [  132.888199][ T3644] RAX: ffffffffffffffda RBX: 000000000000002c RC=
X: 0000000000000004
> > > [  132.889512][ T3644] RDX: 0000000000000002 RSI: 00000000fffffffa RD=
I: 0000000000000100
> > > [  132.891017][ T3644] RBP: 00000000ffff0000 R08: 0000000000000000 R0=
9: 0000000000000000
> > > [  132.892490][ T3644] R10: 0000000000000000 R11: 0000000000000000 R1=
2: 0000000000000000
> > > [  132.893858][ T3644] R13: 0000000000000000 R14: 0000000000000000 R1=
5: 0000000000000000
> > > [  132.895243][ T3644]  </TASK>
> > > [  132.895744][ T3644] Modules linked in: uvesafb ppdev crct10dif_pcl=
mul crc32_pclmul parport_pc parport
> > > [  132.897456][ T3644] CR2: 00000000000000f8
> > > [  132.898187][ T3644] ---[ end trace 0000000000000000 ]---
> > > [ 132.899104][ T3644] RIP: 0010:msg_timeout_show (drivers/vdpa/vdpa_u=
ser/vduse_dev.c:1271) =

> > > [ 132.900224][ T3644] Code: cc 0f 1f 00 e8 1b 6c 33 ff 55 48 89 d5 53=
 48 89 fb 48 8d 7f 78 e8 fa 02 57 ff 48 8b 5b 78 48 8d bb f8 00 00 00 e8 6a=
 ff 56 ff <8b> 93 f8 00 00 00 48 89 ef 48 c7 c6 2f 03 f0 a1 e8 95 b2 82 ff =
5b
> > > All code
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:	cc                   	int3   =

> > >    1:	0f 1f 00             	nopl   (%rax)
> > >    4:	e8 1b 6c 33 ff       	callq  0xffffffffff336c24
> > >    9:	55                   	push   %rbp
> > >    a:	48 89 d5             	mov    %rdx,%rbp
> > >    d:	53                   	push   %rbx
> > >    e:	48 89 fb             	mov    %rdi,%rbx
> > >   11:	48 8d 7f 78          	lea    0x78(%rdi),%rdi
> > >   15:	e8 fa 02 57 ff       	callq  0xffffffffff570314
> > >   1a:	48 8b 5b 78          	mov    0x78(%rbx),%rbx
> > >   1e:	48 8d bb f8 00 00 00 	lea    0xf8(%rbx),%rdi
> > >   25:	e8 6a ff 56 ff       	callq  0xffffffffff56ff94
> > >   2a:*	8b 93 f8 00 00 00    	mov    0xf8(%rbx),%edx		<-- trapping ins=
truction
> > >   30:	48 89 ef             	mov    %rbp,%rdi
> > >   33:	48 c7 c6 2f 03 f0 a1 	mov    $0xffffffffa1f0032f,%rsi
> > >   3a:	e8 95 b2 82 ff       	callq  0xffffffffff82b2d4
> > >   3f:	5b                   	pop    %rbx
> > > =

> > > Code starting with the faulting instruction
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:	8b 93 f8 00 00 00    	mov    0xf8(%rbx),%edx
> > >    6:	48 89 ef             	mov    %rbp,%rdi
> > >    9:	48 c7 c6 2f 03 f0 a1 	mov    $0xffffffffa1f0032f,%rsi
> > >   10:	e8 95 b2 82 ff       	callq  0xffffffffff82b2aa
> > >   15:	5b                   	pop    %rbx
> > > =

> > > =

> > > To reproduce:
> > > =

> > >         # build kernel
> > > 	cd linux
> > > 	cp config-5.18.0-rc2-mm1-00223-g1dd38979b2f0 .config
> > > 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 olddefconfig prepare =
modules_prepare bzImage modules
> > > 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<m=
od-install-dir> modules_install
> > > 	cd <mod-install-dir>
> > > 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> > > =

> > > =

> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-scr=
ipt is attached in this email
> > > =

> > >         # if come across any failure that blocks the test,
> > >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> > > =

> > > =

> > > =

> > > -- =

> > > 0-DAY CI Kernel Test Service
> > > https://01.org/lkp
> > > =

> > > =

> > =

> > > #
> > > # Automatically generated file; DO NOT EDIT.
> > > # Linux/x86_64 5.18.0-rc2-mm1 Kernel Configuration
> > > #
> > > CONFIG_CC_VERSION_TEXT=3D"gcc-11 (Debian 11.2.0-20) 11.2.0"
> > > CONFIG_CC_IS_GCC=3Dy
> > > CONFIG_GCC_VERSION=3D110200
> > > CONFIG_CLANG_VERSION=3D0
> > > CONFIG_AS_IS_GNU=3Dy
> > > CONFIG_AS_VERSION=3D23800
> > > CONFIG_LD_IS_BFD=3Dy
> > > CONFIG_LD_VERSION=3D23800
> > > CONFIG_LLD_VERSION=3D0
> > > CONFIG_CC_CAN_LINK=3Dy
> > > CONFIG_CC_CAN_LINK_STATIC=3Dy
> > > CONFIG_CC_HAS_ASM_GOTO=3Dy
> > > CONFIG_CC_HAS_ASM_GOTO_OUTPUT=3Dy
> > > CONFIG_CC_HAS_ASM_INLINE=3Dy
> > > CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
> > > CONFIG_PAHOLE_VERSION=3D123
> > > CONFIG_IRQ_WORK=3Dy
> > > CONFIG_BUILDTIME_TABLE_SORT=3Dy
> > > CONFIG_THREAD_INFO_IN_TASK=3Dy
> > > =

> > > #
> > > # General setup
> > > #
> > > CONFIG_BROKEN_ON_SMP=3Dy
> > > CONFIG_INIT_ENV_ARG_LIMIT=3D32
> > > # CONFIG_COMPILE_TEST is not set
> > > # CONFIG_WERROR is not set
> > > # CONFIG_UAPI_HEADER_TEST is not set
> > > CONFIG_LOCALVERSION=3D""
> > > CONFIG_LOCALVERSION_AUTO=3Dy
> > > CONFIG_BUILD_SALT=3D""
> > > CONFIG_HAVE_KERNEL_GZIP=3Dy
> > > CONFIG_HAVE_KERNEL_BZIP2=3Dy
> > > CONFIG_HAVE_KERNEL_LZMA=3Dy
> > > CONFIG_HAVE_KERNEL_XZ=3Dy
> > > CONFIG_HAVE_KERNEL_LZO=3Dy
> > > CONFIG_HAVE_KERNEL_LZ4=3Dy
> > > CONFIG_HAVE_KERNEL_ZSTD=3Dy
> > > # CONFIG_KERNEL_GZIP is not set
> > > # CONFIG_KERNEL_BZIP2 is not set
> > > # CONFIG_KERNEL_LZMA is not set
> > > # CONFIG_KERNEL_XZ is not set
> > > CONFIG_KERNEL_LZO=3Dy
> > > # CONFIG_KERNEL_LZ4 is not set
> > > # CONFIG_KERNEL_ZSTD is not set
> > > CONFIG_DEFAULT_INIT=3D""
> > > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> > > # CONFIG_SWAP is not set
> > > CONFIG_SYSVIPC=3Dy
> > > CONFIG_SYSVIPC_SYSCTL=3Dy
> > > CONFIG_POSIX_MQUEUE=3Dy
> > > CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> > > CONFIG_WATCH_QUEUE=3Dy
> > > CONFIG_CROSS_MEMORY_ATTACH=3Dy
> > > CONFIG_USELIB=3Dy
> > > CONFIG_AUDIT=3Dy
> > > CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> > > CONFIG_AUDITSYSCALL=3Dy
> > > =

> > > #
> > > # IRQ subsystem
> > > #
> > > CONFIG_GENERIC_IRQ_PROBE=3Dy
> > > CONFIG_GENERIC_IRQ_SHOW=3Dy
> > > CONFIG_HARDIRQS_SW_RESEND=3Dy
> > > CONFIG_IRQ_DOMAIN=3Dy
> > > CONFIG_IRQ_SIM=3Dy
> > > CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> > > CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> > > CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> > > CONFIG_IRQ_FORCED_THREADING=3Dy
> > > CONFIG_SPARSE_IRQ=3Dy
> > > # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> > > # end of IRQ subsystem
> > > =

> > > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > > CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> > > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> > > CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> > > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > > CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> > > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> > > CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> > > =

> > > #
> > > # Timers subsystem
> > > #
> > > CONFIG_TICK_ONESHOT=3Dy
> > > CONFIG_NO_HZ_COMMON=3Dy
> > > # CONFIG_HZ_PERIODIC is not set
> > > CONFIG_NO_HZ_IDLE=3Dy
> > > # CONFIG_NO_HZ is not set
> > > # CONFIG_HIGH_RES_TIMERS is not set
> > > CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=3D100
> > > # end of Timers subsystem
> > > =

> > > CONFIG_BPF=3Dy
> > > CONFIG_HAVE_EBPF_JIT=3Dy
> > > CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> > > =

> > > #
> > > # BPF subsystem
> > > #
> > > CONFIG_BPF_SYSCALL=3Dy
> > > CONFIG_BPF_JIT=3Dy
> > > CONFIG_BPF_JIT_ALWAYS_ON=3Dy
> > > CONFIG_BPF_JIT_DEFAULT_ON=3Dy
> > > # CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
> > > CONFIG_USERMODE_DRIVER=3Dy
> > > CONFIG_BPF_PRELOAD=3Dy
> > > # CONFIG_BPF_PRELOAD_UMD is not set
> > > # CONFIG_BPF_LSM is not set
> > > # end of BPF subsystem
> > > =

> > > CONFIG_PREEMPT_VOLUNTARY_BUILD=3Dy
> > > # CONFIG_PREEMPT_NONE is not set
> > > CONFIG_PREEMPT_VOLUNTARY=3Dy
> > > # CONFIG_PREEMPT is not set
> > > CONFIG_PREEMPT_COUNT=3Dy
> > > # CONFIG_PREEMPT_DYNAMIC is not set
> > > =

> > > #
> > > # CPU/Task time and stats accounting
> > > #
> > > CONFIG_TICK_CPU_ACCOUNTING=3Dy
> > > # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> > > CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> > > # CONFIG_BSD_PROCESS_ACCT is not set
> > > # CONFIG_TASKSTATS is not set
> > > # CONFIG_PSI is not set
> > > # end of CPU/Task time and stats accounting
> > > =

> > > #
> > > # RCU Subsystem
> > > #
> > > CONFIG_TINY_RCU=3Dy
> > > # CONFIG_RCU_EXPERT is not set
> > > CONFIG_SRCU=3Dy
> > > CONFIG_TINY_SRCU=3Dy
> > > CONFIG_TASKS_RCU_GENERIC=3Dy
> > > CONFIG_TASKS_RCU=3Dy
> > > CONFIG_TASKS_RUDE_RCU=3Dy
> > > CONFIG_TASKS_TRACE_RCU=3Dy
> > > CONFIG_RCU_NEED_SEGCBLIST=3Dy
> > > # end of RCU Subsystem
> > > =

> > > CONFIG_IKCONFIG=3Dy
> > > CONFIG_IKCONFIG_PROC=3Dy
> > > # CONFIG_IKHEADERS is not set
> > > CONFIG_LOG_BUF_SHIFT=3D20
> > > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> > > CONFIG_PRINTK_INDEX=3Dy
> > > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> > > =

> > > #
> > > # Scheduler features
> > > #
> > > # end of Scheduler features
> > > =

> > > CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> > > CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> > > CONFIG_CC_HAS_INT128=3Dy
> > > CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
> > > CONFIG_ARCH_SUPPORTS_INT128=3Dy
> > > CONFIG_CGROUPS=3Dy
> > > CONFIG_PAGE_COUNTER=3Dy
> > > CONFIG_MEMCG=3Dy
> > > CONFIG_MEMCG_KMEM=3Dy
> > > CONFIG_BLK_CGROUP=3Dy
> > > CONFIG_CGROUP_WRITEBACK=3Dy
> > > CONFIG_CGROUP_SCHED=3Dy
> > > CONFIG_FAIR_GROUP_SCHED=3Dy
> > > # CONFIG_CFS_BANDWIDTH is not set
> > > CONFIG_RT_GROUP_SCHED=3Dy
> > > CONFIG_CGROUP_PIDS=3Dy
> > > # CONFIG_CGROUP_RDMA is not set
> > > CONFIG_CGROUP_FREEZER=3Dy
> > > # CONFIG_CGROUP_HUGETLB is not set
> > > # CONFIG_CGROUP_DEVICE is not set
> > > CONFIG_CGROUP_CPUACCT=3Dy
> > > # CONFIG_CGROUP_PERF is not set
> > > CONFIG_CGROUP_BPF=3Dy
> > > # CONFIG_CGROUP_MISC is not set
> > > # CONFIG_CGROUP_DEBUG is not set
> > > CONFIG_SOCK_CGROUP_DATA=3Dy
> > > # CONFIG_NAMESPACES is not set
> > > CONFIG_CHECKPOINT_RESTORE=3Dy
> > > # CONFIG_SCHED_AUTOGROUP is not set
> > > # CONFIG_SYSFS_DEPRECATED is not set
> > > # CONFIG_RELAY is not set
> > > CONFIG_BLK_DEV_INITRD=3Dy
> > > CONFIG_INITRAMFS_SOURCE=3D""
> > > CONFIG_RD_GZIP=3Dy
> > > CONFIG_RD_BZIP2=3Dy
> > > # CONFIG_RD_LZMA is not set
> > > CONFIG_RD_XZ=3Dy
> > > CONFIG_RD_LZO=3Dy
> > > CONFIG_RD_LZ4=3Dy
> > > # CONFIG_RD_ZSTD is not set
> > > CONFIG_BOOT_CONFIG=3Dy
> > > CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> > > # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> > > CONFIG_LD_ORPHAN_WARN=3Dy
> > > CONFIG_SYSCTL=3Dy
> > > CONFIG_HAVE_UID16=3Dy
> > > CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> > > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > > CONFIG_EXPERT=3Dy
> > > CONFIG_UID16=3Dy
> > > CONFIG_MULTIUSER=3Dy
> > > # CONFIG_SGETMASK_SYSCALL is not set
> > > CONFIG_SYSFS_SYSCALL=3Dy
> > > CONFIG_FHANDLE=3Dy
> > > # CONFIG_POSIX_TIMERS is not set
> > > CONFIG_PRINTK=3Dy
> > > CONFIG_BUG=3Dy
> > > # CONFIG_ELF_CORE is not set
> > > CONFIG_PCSPKR_PLATFORM=3Dy
> > > CONFIG_BASE_FULL=3Dy
> > > CONFIG_FUTEX=3Dy
> > > CONFIG_FUTEX_PI=3Dy
> > > CONFIG_EPOLL=3Dy
> > > CONFIG_SIGNALFD=3Dy
> > > CONFIG_TIMERFD=3Dy
> > > CONFIG_EVENTFD=3Dy
> > > CONFIG_SHMEM=3Dy
> > > CONFIG_AIO=3Dy
> > > CONFIG_IO_URING=3Dy
> > > # CONFIG_ADVISE_SYSCALLS is not set
> > > CONFIG_MEMBARRIER=3Dy
> > > CONFIG_KALLSYMS=3Dy
> > > CONFIG_KALLSYMS_ALL=3Dy
> > > CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> > > # CONFIG_USERFAULTFD is not set
> > > CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> > > CONFIG_KCMP=3Dy
> > > CONFIG_RSEQ=3Dy
> > > # CONFIG_DEBUG_RSEQ is not set
> > > CONFIG_EMBEDDED=3Dy
> > > CONFIG_HAVE_PERF_EVENTS=3Dy
> > > CONFIG_GUEST_PERF_EVENTS=3Dy
> > > CONFIG_PERF_USE_VMALLOC=3Dy
> > > # CONFIG_PC104 is not set
> > > =

> > > #
> > > # Kernel Performance Events And Counters
> > > #
> > > CONFIG_PERF_EVENTS=3Dy
> > > CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> > > # end of Kernel Performance Events And Counters
> > > =

> > > CONFIG_VM_EVENT_COUNTERS=3Dy
> > > CONFIG_SLUB_DEBUG=3Dy
> > > CONFIG_COMPAT_BRK=3Dy
> > > # CONFIG_SLAB is not set
> > > CONFIG_SLUB=3Dy
> > > # CONFIG_SLOB is not set
> > > CONFIG_SLAB_MERGE_DEFAULT=3Dy
> > > # CONFIG_SLAB_FREELIST_RANDOM is not set
> > > CONFIG_SLAB_FREELIST_HARDENED=3Dy
> > > CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
> > > CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> > > CONFIG_PROFILING=3Dy
> > > CONFIG_TRACEPOINTS=3Dy
> > > # end of General setup
> > > =

> > > CONFIG_64BIT=3Dy
> > > CONFIG_X86_64=3Dy
> > > CONFIG_X86=3Dy
> > > CONFIG_INSTRUCTION_DECODER=3Dy
> > > CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> > > CONFIG_LOCKDEP_SUPPORT=3Dy
> > > CONFIG_STACKTRACE_SUPPORT=3Dy
> > > CONFIG_MMU=3Dy
> > > CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> > > CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> > > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> > > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> > > CONFIG_GENERIC_ISA_DMA=3Dy
> > > CONFIG_GENERIC_BUG=3Dy
> > > CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> > > CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> > > CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> > > CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> > > CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> > > CONFIG_ARCH_NR_GPIO=3D1024
> > > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > > CONFIG_AUDIT_ARCH=3Dy
> > > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > > CONFIG_FIX_EARLYCON_MEM=3Dy
> > > CONFIG_PGTABLE_LEVELS=3D5
> > > CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> > > =

> > > #
> > > # Processor type and features
> > > #
> > > # CONFIG_SMP is not set
> > > CONFIG_X86_FEATURE_NAMES=3Dy
> > > CONFIG_X86_X2APIC=3Dy
> > > CONFIG_X86_MPPARSE=3Dy
> > > # CONFIG_GOLDFISH is not set
> > > # CONFIG_RETPOLINE is not set
> > > CONFIG_CC_HAS_SLS=3Dy
> > > CONFIG_SLS=3Dy
> > > # CONFIG_X86_CPU_RESCTRL is not set
> > > CONFIG_X86_EXTENDED_PLATFORM=3Dy
> > > # CONFIG_X86_GOLDFISH is not set
> > > CONFIG_X86_INTEL_MID=3Dy
> > > # CONFIG_X86_INTEL_LPSS is not set
> > > # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> > > CONFIG_IOSF_MBI=3Dy
> > > # CONFIG_IOSF_MBI_DEBUG is not set
> > > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > > CONFIG_HYPERVISOR_GUEST=3Dy
> > > CONFIG_PARAVIRT=3Dy
> > > CONFIG_PARAVIRT_XXL=3Dy
> > > CONFIG_PARAVIRT_DEBUG=3Dy
> > > CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> > > CONFIG_XEN=3Dy
> > > CONFIG_XEN_PV=3Dy
> > > CONFIG_XEN_512GB=3Dy
> > > CONFIG_XEN_PV_DOM0=3Dy
> > > CONFIG_XEN_PVHVM=3Dy
> > > # CONFIG_XEN_PVHVM_GUEST is not set
> > > CONFIG_XEN_SAVE_RESTORE=3Dy
> > > CONFIG_XEN_DEBUG_FS=3Dy
> > > # CONFIG_XEN_PVH is not set
> > > CONFIG_XEN_DOM0=3Dy
> > > CONFIG_KVM_GUEST=3Dy
> > > CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> > > CONFIG_PVH=3Dy
> > > # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> > > CONFIG_PARAVIRT_CLOCK=3Dy
> > > CONFIG_JAILHOUSE_GUEST=3Dy
> > > CONFIG_ACRN_GUEST=3Dy
> > > # CONFIG_MK8 is not set
> > > # CONFIG_MPSC is not set
> > > # CONFIG_MCORE2 is not set
> > > # CONFIG_MATOM is not set
> > > CONFIG_GENERIC_CPU=3Dy
> > > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> > > CONFIG_X86_L1_CACHE_SHIFT=3D6
> > > CONFIG_X86_TSC=3Dy
> > > CONFIG_X86_CMPXCHG64=3Dy
> > > CONFIG_X86_CMOV=3Dy
> > > CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> > > CONFIG_X86_DEBUGCTLMSR=3Dy
> > > CONFIG_IA32_FEAT_CTL=3Dy
> > > CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> > > # CONFIG_PROCESSOR_SELECT is not set
> > > CONFIG_CPU_SUP_INTEL=3Dy
> > > CONFIG_CPU_SUP_AMD=3Dy
> > > CONFIG_CPU_SUP_HYGON=3Dy
> > > CONFIG_CPU_SUP_CENTAUR=3Dy
> > > CONFIG_CPU_SUP_ZHAOXIN=3Dy
> > > CONFIG_HPET_TIMER=3Dy
> > > CONFIG_HPET_EMULATE_RTC=3Dy
> > > # CONFIG_DMI is not set
> > > # CONFIG_GART_IOMMU is not set
> > > CONFIG_NR_CPUS_RANGE_BEGIN=3D1
> > > CONFIG_NR_CPUS_RANGE_END=3D1
> > > CONFIG_NR_CPUS_DEFAULT=3D1
> > > CONFIG_NR_CPUS=3D1
> > > CONFIG_UP_LATE_INIT=3Dy
> > > CONFIG_X86_LOCAL_APIC=3Dy
> > > CONFIG_X86_IO_APIC=3Dy
> > > CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> > > # CONFIG_X86_MCE is not set
> > > =

> > > #
> > > # Performance monitoring
> > > #
> > > CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> > > # CONFIG_PERF_EVENTS_INTEL_RAPL is not set
> > > CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> > > # CONFIG_PERF_EVENTS_AMD_POWER is not set
> > > # CONFIG_PERF_EVENTS_AMD_UNCORE is not set
> > > # end of Performance monitoring
> > > =

> > > CONFIG_X86_VSYSCALL_EMULATION=3Dy
> > > CONFIG_X86_IOPL_IOPERM=3Dy
> > > # CONFIG_MICROCODE is not set
> > > CONFIG_X86_MSR=3Dm
> > > CONFIG_X86_CPUID=3Dy
> > > CONFIG_X86_5LEVEL=3Dy
> > > CONFIG_X86_DIRECT_GBPAGES=3Dy
> > > # CONFIG_X86_CPA_STATISTICS is not set
> > > # CONFIG_AMD_MEM_ENCRYPT is not set
> > > CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> > > CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> > > # CONFIG_ARCH_MEMORY_PROBE is not set
> > > CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> > > CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> > > # CONFIG_X86_PMEM_LEGACY is not set
> > > # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> > > CONFIG_MTRR=3Dy
> > > CONFIG_MTRR_SANITIZER=3Dy
> > > CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> > > CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> > > CONFIG_X86_PAT=3Dy
> > > CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> > > CONFIG_ARCH_RANDOM=3Dy
> > > CONFIG_X86_SMAP=3Dy
> > > CONFIG_X86_UMIP=3Dy
> > > CONFIG_CC_HAS_IBT=3Dy
> > > # CONFIG_X86_KERNEL_IBT is not set
> > > # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
> > > # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> > > CONFIG_X86_INTEL_TSX_MODE_ON=3Dy
> > > # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> > > CONFIG_X86_SGX=3Dy
> > > # CONFIG_EFI is not set
> > > # CONFIG_HZ_100 is not set
> > > # CONFIG_HZ_250 is not set
> > > CONFIG_HZ_300=3Dy
> > > # CONFIG_HZ_1000 is not set
> > > CONFIG_HZ=3D300
> > > CONFIG_KEXEC=3Dy
> > > # CONFIG_KEXEC_FILE is not set
> > > # CONFIG_CRASH_DUMP is not set
> > > CONFIG_PHYSICAL_START=3D0x1000000
> > > CONFIG_RELOCATABLE=3Dy
> > > CONFIG_RANDOMIZE_BASE=3Dy
> > > CONFIG_X86_NEED_RELOCS=3Dy
> > > CONFIG_PHYSICAL_ALIGN=3D0x200000
> > > CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> > > # CONFIG_RANDOMIZE_MEMORY is not set
> > > CONFIG_COMPAT_VDSO=3Dy
> > > CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> > > # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> > > # CONFIG_LEGACY_VSYSCALL_NONE is not set
> > > # CONFIG_CMDLINE_BOOL is not set
> > > # CONFIG_MODIFY_LDT_SYSCALL is not set
> > > # CONFIG_STRICT_SIGALTSTACK_SIZE is not set
> > > CONFIG_HAVE_LIVEPATCH=3Dy
> > > # end of Processor type and features
> > > =

> > > CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> > > CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> > > =

> > > #
> > > # Power management and ACPI options
> > > #
> > > CONFIG_SUSPEND=3Dy
> > > CONFIG_SUSPEND_FREEZER=3Dy
> > > # CONFIG_SUSPEND_SKIP_SYNC is not set
> > > CONFIG_HIBERNATE_CALLBACKS=3Dy
> > > CONFIG_PM_SLEEP=3Dy
> > > CONFIG_PM_AUTOSLEEP=3Dy
> > > CONFIG_PM_WAKELOCKS=3Dy
> > > CONFIG_PM_WAKELOCKS_LIMIT=3D100
> > > # CONFIG_PM_WAKELOCKS_GC is not set
> > > CONFIG_PM=3Dy
> > > CONFIG_PM_DEBUG=3Dy
> > > CONFIG_PM_ADVANCED_DEBUG=3Dy
> > > # CONFIG_PM_TEST_SUSPEND is not set
> > > CONFIG_PM_SLEEP_DEBUG=3Dy
> > > CONFIG_PM_TRACE=3Dy
> > > CONFIG_PM_TRACE_RTC=3Dy
> > > CONFIG_PM_CLK=3Dy
> > > # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> > > CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> > > CONFIG_ACPI=3Dy
> > > CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> > > CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> > > CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> > > # CONFIG_ACPI_DEBUGGER is not set
> > > CONFIG_ACPI_SPCR_TABLE=3Dy
> > > # CONFIG_ACPI_FPDT is not set
> > > CONFIG_ACPI_LPIT=3Dy
> > > CONFIG_ACPI_SLEEP=3Dy
> > > CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> > > # CONFIG_ACPI_EC_DEBUGFS is not set
> > > CONFIG_ACPI_AC=3Dy
> > > CONFIG_ACPI_BATTERY=3Dy
> > > CONFIG_ACPI_BUTTON=3Dy
> > > CONFIG_ACPI_VIDEO=3Dy
> > > CONFIG_ACPI_FAN=3Dy
> > > # CONFIG_ACPI_TAD is not set
> > > # CONFIG_ACPI_DOCK is not set
> > > CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> > > CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> > > CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> > > CONFIG_ACPI_PROCESSOR=3Dy
> > > # CONFIG_ACPI_IPMI is not set
> > > # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> > > CONFIG_ACPI_THERMAL=3Dy
> > > CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> > > CONFIG_ACPI_TABLE_UPGRADE=3Dy
> > > # CONFIG_ACPI_DEBUG is not set
> > > # CONFIG_ACPI_PCI_SLOT is not set
> > > # CONFIG_ACPI_CONTAINER is not set
> > > # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> > > CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> > > # CONFIG_ACPI_SBS is not set
> > > # CONFIG_ACPI_HED is not set
> > > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > > # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> > > # CONFIG_ACPI_NFIT is not set
> > > CONFIG_HAVE_ACPI_APEI=3Dy
> > > CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> > > # CONFIG_ACPI_APEI is not set
> > > # CONFIG_ACPI_DPTF is not set
> > > # CONFIG_ACPI_CONFIGFS is not set
> > > # CONFIG_ACPI_PFRUT is not set
> > > # CONFIG_PMIC_OPREGION is not set
> > > CONFIG_X86_PM_TIMER=3Dy
> > > =

> > > #
> > > # CPU Frequency scaling
> > > #
> > > CONFIG_CPU_FREQ=3Dy
> > > CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> > > CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> > > # CONFIG_CPU_FREQ_STAT is not set
> > > CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> > > # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> > > # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> > > # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> > > # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> > > CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> > > CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> > > CONFIG_CPU_FREQ_GOV_USERSPACE=3Dm
> > > CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dm
> > > CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> > > =

> > > #
> > > # CPU frequency scaling drivers
> > > #
> > > # CONFIG_X86_INTEL_PSTATE is not set
> > > # CONFIG_X86_PCC_CPUFREQ is not set
> > > # CONFIG_X86_AMD_PSTATE is not set
> > > # CONFIG_X86_ACPI_CPUFREQ is not set
> > > # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> > > CONFIG_X86_P4_CLOCKMOD=3Dy
> > > =

> > > #
> > > # shared options
> > > #
> > > CONFIG_X86_SPEEDSTEP_LIB=3Dy
> > > # end of CPU Frequency scaling
> > > =

> > > #
> > > # CPU Idle
> > > #
> > > CONFIG_CPU_IDLE=3Dy
> > > # CONFIG_CPU_IDLE_GOV_LADDER is not set
> > > CONFIG_CPU_IDLE_GOV_MENU=3Dy
> > > # CONFIG_CPU_IDLE_GOV_TEO is not set
> > > # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> > > CONFIG_HALTPOLL_CPUIDLE=3Dy
> > > # end of CPU Idle
> > > =

> > > # CONFIG_INTEL_IDLE is not set
> > > # end of Power management and ACPI options
> > > =

> > > #
> > > # Bus options (PCI etc.)
> > > #
> > > CONFIG_PCI_DIRECT=3Dy
> > > CONFIG_PCI_MMCONFIG=3Dy
> > > CONFIG_PCI_XEN=3Dy
> > > CONFIG_MMCONF_FAM10H=3Dy
> > > # CONFIG_PCI_CNB20LE_QUIRK is not set
> > > # CONFIG_ISA_BUS is not set
> > > CONFIG_ISA_DMA_API=3Dy
> > > CONFIG_AMD_NB=3Dy
> > > # end of Bus options (PCI etc.)
> > > =

> > > #
> > > # Binary Emulations
> > > #
> > > CONFIG_IA32_EMULATION=3Dy
> > > # CONFIG_X86_X32_ABI is not set
> > > CONFIG_COMPAT_32=3Dy
> > > CONFIG_COMPAT=3Dy
> > > CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> > > CONFIG_SYSVIPC_COMPAT=3Dy
> > > # end of Binary Emulations
> > > =

> > > CONFIG_HAVE_KVM=3Dy
> > > # CONFIG_VIRTUALIZATION is not set
> > > CONFIG_AS_AVX512=3Dy
> > > CONFIG_AS_SHA1_NI=3Dy
> > > CONFIG_AS_SHA256_NI=3Dy
> > > CONFIG_AS_TPAUSE=3Dy
> > > =

> > > #
> > > # General architecture-dependent options
> > > #
> > > CONFIG_CRASH_CORE=3Dy
> > > CONFIG_KEXEC_CORE=3Dy
> > > CONFIG_GENERIC_ENTRY=3Dy
> > > # CONFIG_KPROBES is not set
> > > # CONFIG_JUMP_LABEL is not set
> > > # CONFIG_STATIC_CALL_SELFTEST is not set
> > > CONFIG_UPROBES=3Dy
> > > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> > > CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> > > CONFIG_HAVE_IOREMAP_PROT=3Dy
> > > CONFIG_HAVE_KPROBES=3Dy
> > > CONFIG_HAVE_KRETPROBES=3Dy
> > > CONFIG_HAVE_OPTPROBES=3Dy
> > > CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> > > CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=3Dy
> > > CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> > > CONFIG_HAVE_NMI=3Dy
> > > CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> > > CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> > > CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> > > CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> > > CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> > > CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> > > CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> > > CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> > > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> > > CONFIG_ARCH_WANTS_NO_INSTR=3Dy
> > > CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> > > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > > CONFIG_HAVE_RSEQ=3Dy
> > > CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> > > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > > CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> > > CONFIG_HAVE_PERF_REGS=3Dy
> > > CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> > > CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> > > CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> > > CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> > > CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> > > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> > > CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> > > CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> > > CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> > > CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> > > CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> > > CONFIG_HAVE_ARCH_SECCOMP=3Dy
> > > CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> > > CONFIG_SECCOMP=3Dy
> > > CONFIG_SECCOMP_FILTER=3Dy
> > > CONFIG_SECCOMP_CACHE_DEBUG=3Dy
> > > CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> > > CONFIG_HAVE_STACKPROTECTOR=3Dy
> > > # CONFIG_STACKPROTECTOR is not set
> > > CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> > > CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> > > CONFIG_LTO_NONE=3Dy
> > > CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> > > CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> > > CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=3Dy
> > > CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> > > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> > > CONFIG_HAVE_MOVE_PUD=3Dy
> > > CONFIG_HAVE_MOVE_PMD=3Dy
> > > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> > > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> > > CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> > > CONFIG_HAVE_ARCH_HUGE_VMALLOC=3Dy
> > > CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> > > CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> > > CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> > > CONFIG_MODULES_USE_ELF_RELA=3Dy
> > > CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> > > CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> > > CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> > > CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> > > CONFIG_HAVE_EXIT_THREAD=3Dy
> > > CONFIG_ARCH_MMAP_RND_BITS=3D28
> > > CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> > > CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> > > CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> > > CONFIG_PAGE_SIZE_LESS_THAN_64KB=3Dy
> > > CONFIG_PAGE_SIZE_LESS_THAN_256KB=3Dy
> > > CONFIG_HAVE_STACK_VALIDATION=3Dy
> > > CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> > > CONFIG_ISA_BUS_API=3Dy
> > > CONFIG_OLD_SIGSUSPEND3=3Dy
> > > CONFIG_COMPAT_OLD_SIGACTION=3Dy
> > > CONFIG_COMPAT_32BIT_TIME=3Dy
> > > CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> > > CONFIG_VMAP_STACK=3Dy
> > > CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> > > CONFIG_RANDOMIZE_KSTACK_OFFSET=3Dy
> > > # CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
> > > CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> > > CONFIG_STRICT_KERNEL_RWX=3Dy
> > > CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> > > CONFIG_STRICT_MODULE_RWX=3Dy
> > > CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> > > # CONFIG_LOCK_EVENT_COUNTS is not set
> > > CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> > > CONFIG_HAVE_STATIC_CALL=3Dy
> > > CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
> > > CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> > > CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=3Dy
> > > CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> > > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> > > CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=3Dy
> > > CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
> > > CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
> > > CONFIG_DYNAMIC_SIGFRAME=3Dy
> > > CONFIG_HAVE_ARCH_NODE_DEV_GROUP=3Dy
> > > CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=3Dy
> > > =

> > > #
> > > # GCOV-based kernel profiling
> > > #
> > > # CONFIG_GCOV_KERNEL is not set
> > > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> > > # end of GCOV-based kernel profiling
> > > =

> > > CONFIG_HAVE_GCC_PLUGINS=3Dy
> > > # CONFIG_GCC_PLUGINS is not set
> > > # end of General architecture-dependent options
> > > =

> > > CONFIG_RT_MUTEXES=3Dy
> > > CONFIG_BASE_SMALL=3D0
> > > CONFIG_MODULES=3Dy
> > > # CONFIG_MODULE_FORCE_LOAD is not set
> > > CONFIG_MODULE_UNLOAD=3Dy
> > > # CONFIG_MODULE_FORCE_UNLOAD is not set
> > > # CONFIG_MODVERSIONS is not set
> > > # CONFIG_MODULE_SRCVERSION_ALL is not set
> > > # CONFIG_MODULE_SIG is not set
> > > CONFIG_MODULE_COMPRESS_NONE=3Dy
> > > # CONFIG_MODULE_COMPRESS_GZIP is not set
> > > # CONFIG_MODULE_COMPRESS_XZ is not set
> > > # CONFIG_MODULE_COMPRESS_ZSTD is not set
> > > # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> > > CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> > > # CONFIG_TRIM_UNUSED_KSYMS is not set
> > > CONFIG_MODULES_TREE_LOOKUP=3Dy
> > > CONFIG_BLOCK=3Dy
> > > # CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
> > > CONFIG_BLK_RQ_ALLOC_TIME=3Dy
> > > CONFIG_BLK_CGROUP_RWSTAT=3Dy
> > > CONFIG_BLK_DEV_BSG_COMMON=3Dy
> > > CONFIG_BLK_ICQ=3Dy
> > > CONFIG_BLK_DEV_BSGLIB=3Dy
> > > CONFIG_BLK_DEV_INTEGRITY=3Dy
> > > CONFIG_BLK_DEV_INTEGRITY_T10=3Dy
> > > CONFIG_BLK_DEV_ZONED=3Dy
> > > CONFIG_BLK_DEV_THROTTLING=3Dy
> > > # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> > > # CONFIG_BLK_WBT is not set
> > > CONFIG_BLK_CGROUP_IOLATENCY=3Dy
> > > CONFIG_BLK_CGROUP_FC_APPID=3Dy
> > > CONFIG_BLK_CGROUP_IOCOST=3Dy
> > > # CONFIG_BLK_CGROUP_IOPRIO is not set
> > > # CONFIG_BLK_DEBUG_FS is not set
> > > CONFIG_BLK_SED_OPAL=3Dy
> > > # CONFIG_BLK_INLINE_ENCRYPTION is not set
> > > =

> > > #
> > > # Partition Types
> > > #
> > > # CONFIG_PARTITION_ADVANCED is not set
> > > CONFIG_MSDOS_PARTITION=3Dy
> > > CONFIG_EFI_PARTITION=3Dy
> > > # end of Partition Types
> > > =

> > > CONFIG_BLOCK_COMPAT=3Dy
> > > CONFIG_BLK_MQ_PCI=3Dy
> > > CONFIG_BLK_MQ_VIRTIO=3Dy
> > > CONFIG_BLK_MQ_RDMA=3Dy
> > > CONFIG_BLK_PM=3Dy
> > > CONFIG_BLOCK_HOLDER_DEPRECATED=3Dy
> > > CONFIG_BLK_MQ_STACKING=3Dy
> > > =

> > > #
> > > # IO Schedulers
> > > #
> > > CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> > > CONFIG_MQ_IOSCHED_KYBER=3Dm
> > > CONFIG_IOSCHED_BFQ=3Dm
> > > CONFIG_BFQ_GROUP_IOSCHED=3Dy
> > > CONFIG_BFQ_CGROUP_DEBUG=3Dy
> > > # end of IO Schedulers
> > > =

> > > CONFIG_ASN1=3Dy
> > > CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> > > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> > > CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> > > CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> > > CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> > > CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> > > CONFIG_FREEZER=3Dy
> > > =

> > > #
> > > # Executable file formats
> > > #
> > > CONFIG_BINFMT_ELF=3Dy
> > > CONFIG_COMPAT_BINFMT_ELF=3Dy
> > > CONFIG_ELFCORE=3Dy
> > > CONFIG_BINFMT_SCRIPT=3Dy
> > > # CONFIG_BINFMT_MISC is not set
> > > CONFIG_COREDUMP=3Dy
> > > # end of Executable file formats
> > > =

> > > #
> > > # Memory Management options
> > > #
> > > CONFIG_SPARSEMEM=3Dy
> > > CONFIG_SPARSEMEM_EXTREME=3Dy
> > > CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> > > CONFIG_SPARSEMEM_VMEMMAP=3Dy
> > > CONFIG_HAVE_FAST_GUP=3Dy
> > > CONFIG_MEMORY_ISOLATION=3Dy
> > > CONFIG_EXCLUSIVE_SYSTEM_RAM=3Dy
> > > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > > CONFIG_MEMORY_HOTPLUG=3Dy
> > > # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> > > CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> > > # CONFIG_MEMORY_HOTREMOVE is not set
> > > CONFIG_MHP_MEMMAP_ON_MEMORY=3Dy
> > > CONFIG_SPLIT_PTLOCK_CPUS=3D4
> > > CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> > > CONFIG_COMPACTION=3Dy
> > > # CONFIG_PAGE_REPORTING is not set
> > > CONFIG_MIGRATION=3Dy
> > > CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> > > CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> > > CONFIG_CONTIG_ALLOC=3Dy
> > > CONFIG_PHYS_ADDR_T_64BIT=3Dy
> > > CONFIG_VIRT_TO_BUS=3Dy
> > > CONFIG_MMU_NOTIFIER=3Dy
> > > # CONFIG_KSM is not set
> > > CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> > > CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> > > CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> > > # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> > > CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> > > CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> > > CONFIG_NEED_PER_CPU_KM=3Dy
> > > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> > > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> > > CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> > > CONFIG_CMA=3Dy
> > > # CONFIG_CMA_DEBUG is not set
> > > CONFIG_CMA_DEBUGFS=3Dy
> > > # CONFIG_CMA_SYSFS is not set
> > > CONFIG_CMA_AREAS=3D7
> > > # CONFIG_MEM_SOFT_DIRTY is not set
> > > # CONFIG_ZPOOL is not set
> > > CONFIG_ZSMALLOC=3Dy
> > > CONFIG_ZSMALLOC_STAT=3Dy
> > > CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> > > CONFIG_PAGE_IDLE_FLAG=3Dy
> > > # CONFIG_IDLE_PAGE_TRACKING is not set
> > > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> > > CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=3Dy
> > > CONFIG_ARCH_HAS_VM_GET_PAGE_PROT=3Dy
> > > CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> > > CONFIG_ARCH_HAS_ZONE_DMA_SET=3Dy
> > > CONFIG_ZONE_DMA=3Dy
> > > CONFIG_ZONE_DMA32=3Dy
> > > CONFIG_PERCPU_STATS=3Dy
> > > # CONFIG_GUP_TEST is not set
> > > CONFIG_READ_ONLY_THP_FOR_FS=3Dy
> > > CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> > > CONFIG_MAPPING_DIRTY_HELPERS=3Dy
> > > CONFIG_PTE_MARKER=3Dy
> > > # CONFIG_LRU_GEN is not set
> > > =

> > > #
> > > # Data Access Monitoring
> > > #
> > > CONFIG_DAMON=3Dy
> > > CONFIG_DAMON_VADDR=3Dy
> > > # CONFIG_DAMON_PADDR is not set
> > > # CONFIG_DAMON_SYSFS is not set
> > > # end of Data Access Monitoring
> > > # end of Memory Management options
> > > =

> > > CONFIG_NET=3Dy
> > > CONFIG_WANT_COMPAT_NETLINK_MESSAGES=3Dy
> > > CONFIG_COMPAT_NETLINK_MESSAGES=3Dy
> > > CONFIG_SKB_EXTENSIONS=3Dy
> > > =

> > > #
> > > # Networking options
> > > #
> > > CONFIG_PACKET=3Dy
> > > # CONFIG_PACKET_DIAG is not set
> > > CONFIG_UNIX=3Dy
> > > CONFIG_UNIX_SCM=3Dy
> > > CONFIG_AF_UNIX_OOB=3Dy
> > > CONFIG_UNIX_DIAG=3Dm
> > > CONFIG_TLS=3Dy
> > > # CONFIG_TLS_DEVICE is not set
> > > # CONFIG_TLS_TOE is not set
> > > CONFIG_XFRM=3Dy
> > > CONFIG_XFRM_ALGO=3Dy
> > > CONFIG_XFRM_USER=3Dy
> > > CONFIG_XFRM_USER_COMPAT=3Dm
> > > # CONFIG_XFRM_INTERFACE is not set
> > > CONFIG_XFRM_SUB_POLICY=3Dy
> > > CONFIG_XFRM_MIGRATE=3Dy
> > > CONFIG_XFRM_STATISTICS=3Dy
> > > CONFIG_XFRM_AH=3Dy
> > > CONFIG_XFRM_ESP=3Dy
> > > CONFIG_XFRM_IPCOMP=3Dm
> > > # CONFIG_NET_KEY is not set
> > > CONFIG_XFRM_ESPINTCP=3Dy
> > > CONFIG_SMC=3Dm
> > > CONFIG_SMC_DIAG=3Dm
> > > CONFIG_XDP_SOCKETS=3Dy
> > > # CONFIG_XDP_SOCKETS_DIAG is not set
> > > CONFIG_INET=3Dy
> > > # CONFIG_IP_MULTICAST is not set
> > > CONFIG_IP_ADVANCED_ROUTER=3Dy
> > > # CONFIG_IP_FIB_TRIE_STATS is not set
> > > # CONFIG_IP_MULTIPLE_TABLES is not set
> > > # CONFIG_IP_ROUTE_MULTIPATH is not set
> > > # CONFIG_IP_ROUTE_VERBOSE is not set
> > > CONFIG_IP_PNP=3Dy
> > > CONFIG_IP_PNP_DHCP=3Dy
> > > # CONFIG_IP_PNP_BOOTP is not set
> > > # CONFIG_IP_PNP_RARP is not set
> > > CONFIG_NET_IPIP=3Dm
> > > # CONFIG_NET_IPGRE_DEMUX is not set
> > > CONFIG_NET_IP_TUNNEL=3Dy
> > > # CONFIG_SYN_COOKIES is not set
> > > # CONFIG_NET_IPVTI is not set
> > > CONFIG_NET_UDP_TUNNEL=3Dy
> > > CONFIG_NET_FOU=3Dy
> > > CONFIG_NET_FOU_IP_TUNNELS=3Dy
> > > CONFIG_INET_AH=3Dy
> > > CONFIG_INET_ESP=3Dy
> > > # CONFIG_INET_ESP_OFFLOAD is not set
> > > CONFIG_INET_ESPINTCP=3Dy
> > > # CONFIG_INET_IPCOMP is not set
> > > CONFIG_INET_TUNNEL=3Dy
> > > CONFIG_INET_DIAG=3Dm
> > > CONFIG_INET_TCP_DIAG=3Dm
> > > CONFIG_INET_UDP_DIAG=3Dm
> > > CONFIG_INET_RAW_DIAG=3Dm
> > > # CONFIG_INET_DIAG_DESTROY is not set
> > > CONFIG_TCP_CONG_ADVANCED=3Dy
> > > CONFIG_TCP_CONG_BIC=3Dy
> > > # CONFIG_TCP_CONG_CUBIC is not set
> > > CONFIG_TCP_CONG_WESTWOOD=3Dy
> > > CONFIG_TCP_CONG_HTCP=3Dm
> > > # CONFIG_TCP_CONG_HSTCP is not set
> > > # CONFIG_TCP_CONG_HYBLA is not set
> > > CONFIG_TCP_CONG_VEGAS=3Dm
> > > # CONFIG_TCP_CONG_NV is not set
> > > # CONFIG_TCP_CONG_SCALABLE is not set
> > > # CONFIG_TCP_CONG_LP is not set
> > > # CONFIG_TCP_CONG_VENO is not set
> > > CONFIG_TCP_CONG_YEAH=3Dm
> > > # CONFIG_TCP_CONG_ILLINOIS is not set
> > > # CONFIG_TCP_CONG_DCTCP is not set
> > > CONFIG_TCP_CONG_CDG=3Dy
> > > # CONFIG_TCP_CONG_BBR is not set
> > > CONFIG_DEFAULT_BIC=3Dy
> > > # CONFIG_DEFAULT_WESTWOOD is not set
> > > # CONFIG_DEFAULT_CDG is not set
> > > # CONFIG_DEFAULT_RENO is not set
> > > CONFIG_DEFAULT_TCP_CONG=3D"bic"
> > > CONFIG_TCP_MD5SIG=3Dy
> > > CONFIG_IPV6=3Dy
> > > # CONFIG_IPV6_ROUTER_PREF is not set
> > > CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
> > > CONFIG_INET6_AH=3Dy
> > > CONFIG_INET6_ESP=3Dy
> > > # CONFIG_INET6_ESP_OFFLOAD is not set
> > > CONFIG_INET6_ESPINTCP=3Dy
> > > CONFIG_INET6_IPCOMP=3Dm
> > > CONFIG_IPV6_MIP6=3Dm
> > > CONFIG_INET6_XFRM_TUNNEL=3Dm
> > > CONFIG_INET6_TUNNEL=3Dy
> > > # CONFIG_IPV6_VTI is not set
> > > CONFIG_IPV6_SIT=3Dy
> > > CONFIG_IPV6_SIT_6RD=3Dy
> > > CONFIG_IPV6_NDISC_NODETYPE=3Dy
> > > CONFIG_IPV6_TUNNEL=3Dy
> > > CONFIG_IPV6_FOU=3Dy
> > > CONFIG_IPV6_FOU_TUNNEL=3Dy
> > > CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> > > # CONFIG_IPV6_SUBTREES is not set
> > > # CONFIG_IPV6_MROUTE is not set
> > > CONFIG_IPV6_SEG6_LWTUNNEL=3Dy
> > > CONFIG_IPV6_SEG6_HMAC=3Dy
> > > CONFIG_IPV6_SEG6_BPF=3Dy
> > > # CONFIG_IPV6_RPL_LWTUNNEL is not set
> > > CONFIG_IPV6_IOAM6_LWTUNNEL=3Dy
> > > # CONFIG_NETLABEL is not set
> > > CONFIG_MPTCP=3Dy
> > > CONFIG_INET_MPTCP_DIAG=3Dm
> > > CONFIG_MPTCP_IPV6=3Dy
> > > # CONFIG_NETWORK_SECMARK is not set
> > > # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> > > # CONFIG_NETFILTER is not set
> > > CONFIG_BPFILTER=3Dy
> > > # CONFIG_BPFILTER_UMH is not set
> > > # CONFIG_IP_DCCP is not set
> > > CONFIG_IP_SCTP=3Dy
> > > # CONFIG_SCTP_DBG_OBJCNT is not set
> > > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> > > CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> > > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> > > # CONFIG_SCTP_COOKIE_HMAC_MD5 is not set
> > > CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> > > CONFIG_INET_SCTP_DIAG=3Dm
> > > # CONFIG_RDS is not set
> > > CONFIG_TIPC=3Dy
> > > CONFIG_TIPC_MEDIA_UDP=3Dy
> > > CONFIG_TIPC_CRYPTO=3Dy
> > > CONFIG_TIPC_DIAG=3Dm
> > > CONFIG_ATM=3Dy
> > > # CONFIG_ATM_CLIP is not set
> > > CONFIG_ATM_LANE=3Dy
> > > # CONFIG_ATM_MPOA is not set
> > > CONFIG_ATM_BR2684=3Dm
> > > CONFIG_ATM_BR2684_IPFILTER=3Dy
> > > CONFIG_L2TP=3Dm
> > > # CONFIG_L2TP_DEBUGFS is not set
> > > # CONFIG_L2TP_V3 is not set
> > > CONFIG_STP=3Dy
> > > CONFIG_GARP=3Dm
> > > CONFIG_BRIDGE=3Dy
> > > CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> > > CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> > > CONFIG_BRIDGE_MRP=3Dy
> > > # CONFIG_BRIDGE_CFM is not set
> > > CONFIG_NET_DSA=3Dm
> > > CONFIG_NET_DSA_TAG_AR9331=3Dm
> > > CONFIG_NET_DSA_TAG_BRCM_COMMON=3Dm
> > > CONFIG_NET_DSA_TAG_BRCM=3Dm
> > > CONFIG_NET_DSA_TAG_BRCM_LEGACY=3Dm
> > > CONFIG_NET_DSA_TAG_BRCM_PREPEND=3Dm
> > > CONFIG_NET_DSA_TAG_HELLCREEK=3Dm
> > > CONFIG_NET_DSA_TAG_GSWIP=3Dm
> > > CONFIG_NET_DSA_TAG_DSA_COMMON=3Dm
> > > CONFIG_NET_DSA_TAG_DSA=3Dm
> > > CONFIG_NET_DSA_TAG_EDSA=3Dm
> > > # CONFIG_NET_DSA_TAG_MTK is not set
> > > CONFIG_NET_DSA_TAG_KSZ=3Dm
> > > # CONFIG_NET_DSA_TAG_OCELOT is not set
> > > # CONFIG_NET_DSA_TAG_OCELOT_8021Q is not set
> > > CONFIG_NET_DSA_TAG_QCA=3Dm
> > > # CONFIG_NET_DSA_TAG_RTL4_A is not set
> > > CONFIG_NET_DSA_TAG_RTL8_4=3Dm
> > > CONFIG_NET_DSA_TAG_LAN9303=3Dm
> > > CONFIG_NET_DSA_TAG_SJA1105=3Dm
> > > CONFIG_NET_DSA_TAG_TRAILER=3Dm
> > > CONFIG_NET_DSA_TAG_XRS700X=3Dm
> > > CONFIG_VLAN_8021Q=3Dm
> > > CONFIG_VLAN_8021Q_GVRP=3Dy
> > > # CONFIG_VLAN_8021Q_MVRP is not set
> > > CONFIG_DECNET=3Dy
> > > CONFIG_DECNET_ROUTER=3Dy
> > > CONFIG_LLC=3Dy
> > > CONFIG_LLC2=3Dy
> > > # CONFIG_ATALK is not set
> > > CONFIG_X25=3Dm
> > > CONFIG_LAPB=3Dm
> > > CONFIG_PHONET=3Dy
> > > CONFIG_6LOWPAN=3Dm
> > > # CONFIG_6LOWPAN_DEBUGFS is not set
> > > CONFIG_6LOWPAN_NHC=3Dm
> > > # CONFIG_6LOWPAN_NHC_DEST is not set
> > > CONFIG_6LOWPAN_NHC_FRAGMENT=3Dm
> > > CONFIG_6LOWPAN_NHC_HOP=3Dm
> > > # CONFIG_6LOWPAN_NHC_IPV6 is not set
> > > CONFIG_6LOWPAN_NHC_MOBILITY=3Dm
> > > CONFIG_6LOWPAN_NHC_ROUTING=3Dm
> > > # CONFIG_6LOWPAN_NHC_UDP is not set
> > > CONFIG_6LOWPAN_GHC_EXT_HDR_HOP=3Dm
> > > CONFIG_6LOWPAN_GHC_UDP=3Dm
> > > # CONFIG_6LOWPAN_GHC_ICMPV6 is not set
> > > # CONFIG_6LOWPAN_GHC_EXT_HDR_DEST is not set
> > > # CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG is not set
> > > # CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
> > > CONFIG_IEEE802154=3Dy
> > > CONFIG_IEEE802154_NL802154_EXPERIMENTAL=3Dy
> > > CONFIG_IEEE802154_SOCKET=3Dy
> > > CONFIG_IEEE802154_6LOWPAN=3Dm
> > > CONFIG_MAC802154=3Dm
> > > # CONFIG_NET_SCHED is not set
> > > CONFIG_DCB=3Dy
> > > CONFIG_DNS_RESOLVER=3Dy
> > > CONFIG_BATMAN_ADV=3Dy
> > > CONFIG_BATMAN_ADV_BATMAN_V=3Dy
> > > # CONFIG_BATMAN_ADV_BLA is not set
> > > CONFIG_BATMAN_ADV_DAT=3Dy
> > > CONFIG_BATMAN_ADV_NC=3Dy
> > > # CONFIG_BATMAN_ADV_MCAST is not set
> > > CONFIG_BATMAN_ADV_DEBUG=3Dy
> > > CONFIG_BATMAN_ADV_TRACING=3Dy
> > > CONFIG_OPENVSWITCH=3Dy
> > > CONFIG_VSOCKETS=3Dy
> > > CONFIG_VSOCKETS_DIAG=3Dm
> > > CONFIG_VSOCKETS_LOOPBACK=3Dy
> > > # CONFIG_VIRTIO_VSOCKETS is not set
> > > CONFIG_VIRTIO_VSOCKETS_COMMON=3Dy
> > > CONFIG_NETLINK_DIAG=3Dm
> > > CONFIG_MPLS=3Dy
> > > CONFIG_NET_MPLS_GSO=3Dy
> > > # CONFIG_MPLS_ROUTING is not set
> > > CONFIG_NET_NSH=3Dy
> > > CONFIG_HSR=3Dy
> > > CONFIG_NET_SWITCHDEV=3Dy
> > > CONFIG_NET_L3_MASTER_DEV=3Dy
> > > # CONFIG_QRTR is not set
> > > CONFIG_NET_NCSI=3Dy
> > > # CONFIG_NCSI_OEM_CMD_GET_MAC is not set
> > > # CONFIG_NCSI_OEM_CMD_KEEP_PHY is not set
> > > CONFIG_CGROUP_NET_PRIO=3Dy
> > > # CONFIG_CGROUP_NET_CLASSID is not set
> > > CONFIG_NET_RX_BUSY_POLL=3Dy
> > > CONFIG_BQL=3Dy
> > > # CONFIG_BPF_STREAM_PARSER is not set
> > > =

> > > #
> > > # Network testing
> > > #
> > > # CONFIG_NET_PKTGEN is not set
> > > # CONFIG_NET_DROP_MONITOR is not set
> > > # end of Network testing
> > > # end of Networking options
> > > =

> > > # CONFIG_HAMRADIO is not set
> > > CONFIG_CAN=3Dy
> > > CONFIG_CAN_RAW=3Dm
> > > CONFIG_CAN_BCM=3Dm
> > > # CONFIG_CAN_GW is not set
> > > # CONFIG_CAN_J1939 is not set
> > > CONFIG_CAN_ISOTP=3Dm
> > > =

> > > #
> > > # CAN Device Drivers
> > > #
> > > CONFIG_CAN_VCAN=3Dy
> > > CONFIG_CAN_VXCAN=3Dm
> > > # CONFIG_CAN_SLCAN is not set
> > > CONFIG_CAN_DEV=3Dm
> > > CONFIG_CAN_CALC_BITTIMING=3Dy
> > > # CONFIG_CAN_JANZ_ICAN3 is not set
> > > CONFIG_CAN_KVASER_PCIEFD=3Dm
> > > CONFIG_CAN_C_CAN=3Dm
> > > # CONFIG_CAN_C_CAN_PLATFORM is not set
> > > CONFIG_CAN_C_CAN_PCI=3Dm
> > > # CONFIG_CAN_CC770 is not set
> > > # CONFIG_CAN_IFI_CANFD is not set
> > > # CONFIG_CAN_M_CAN is not set
> > > CONFIG_CAN_PEAK_PCIEFD=3Dm
> > > CONFIG_CAN_SJA1000=3Dm
> > > CONFIG_CAN_EMS_PCI=3Dm
> > > # CONFIG_CAN_EMS_PCMCIA is not set
> > > # CONFIG_CAN_F81601 is not set
> > > CONFIG_CAN_KVASER_PCI=3Dm
> > > # CONFIG_CAN_PEAK_PCI is not set
> > > CONFIG_CAN_PEAK_PCMCIA=3Dm
> > > CONFIG_CAN_PLX_PCI=3Dm
> > > CONFIG_CAN_SJA1000_ISA=3Dm
> > > CONFIG_CAN_SJA1000_PLATFORM=3Dm
> > > CONFIG_CAN_SOFTING=3Dm
> > > CONFIG_CAN_SOFTING_CS=3Dm
> > > =

> > > #
> > > # CAN SPI interfaces
> > > #
> > > # CONFIG_CAN_HI311X is not set
> > > CONFIG_CAN_MCP251X=3Dm
> > > CONFIG_CAN_MCP251XFD=3Dm
> > > CONFIG_CAN_MCP251XFD_SANITY=3Dy
> > > # end of CAN SPI interfaces
> > > =

> > > # CONFIG_CAN_DEBUG_DEVICES is not set
> > > # end of CAN Device Drivers
> > > =

> > > CONFIG_BT=3Dy
> > > CONFIG_BT_BREDR=3Dy
> > > # CONFIG_BT_RFCOMM is not set
> > > CONFIG_BT_BNEP=3Dm
> > > CONFIG_BT_BNEP_MC_FILTER=3Dy
> > > # CONFIG_BT_BNEP_PROTO_FILTER is not set
> > > # CONFIG_BT_HIDP is not set
> > > # CONFIG_BT_HS is not set
> > > CONFIG_BT_LE=3Dy
> > > CONFIG_BT_6LOWPAN=3Dm
> > > CONFIG_BT_LEDS=3Dy
> > > CONFIG_BT_MSFTEXT=3Dy
> > > # CONFIG_BT_AOSPEXT is not set
> > > CONFIG_BT_DEBUGFS=3Dy
> > > # CONFIG_BT_SELFTEST is not set
> > > CONFIG_BT_FEATURE_DEBUG=3Dy
> > > =

> > > #
> > > # Bluetooth device drivers
> > > #
> > > CONFIG_BT_MTK=3Dy
> > > CONFIG_BT_HCIBTSDIO=3Dm
> > > # CONFIG_BT_HCIUART is not set
> > > CONFIG_BT_HCIDTL1=3Dm
> > > CONFIG_BT_HCIBT3C=3Dm
> > > CONFIG_BT_HCIBLUECARD=3Dy
> > > CONFIG_BT_HCIVHCI=3Dm
> > > CONFIG_BT_MRVL=3Dy
> > > # CONFIG_BT_MRVL_SDIO is not set
> > > CONFIG_BT_MTKSDIO=3Dy
> > > CONFIG_BT_MTKUART=3Dm
> > > CONFIG_BT_VIRTIO=3Dm
> > > # end of Bluetooth device drivers
> > > =

> > > CONFIG_AF_RXRPC=3Dm
> > > CONFIG_AF_RXRPC_IPV6=3Dy
> > > CONFIG_AF_RXRPC_INJECT_LOSS=3Dy
> > > # CONFIG_AF_RXRPC_DEBUG is not set
> > > CONFIG_RXKAD=3Dy
> > > CONFIG_AF_KCM=3Dm
> > > CONFIG_STREAM_PARSER=3Dy
> > > # CONFIG_MCTP is not set
> > > CONFIG_FIB_RULES=3Dy
> > > # CONFIG_WIRELESS is not set
> > > # CONFIG_RFKILL is not set
> > > CONFIG_NET_9P=3Dy
> > > CONFIG_NET_9P_FD=3Dm
> > > CONFIG_NET_9P_VIRTIO=3Dy
> > > CONFIG_NET_9P_XEN=3Dm
> > > CONFIG_NET_9P_RDMA=3Dm
> > > CONFIG_NET_9P_DEBUG=3Dy
> > > CONFIG_CAIF=3Dm
> > > CONFIG_CAIF_DEBUG=3Dy
> > > # CONFIG_CAIF_NETDEV is not set
> > > CONFIG_CAIF_USB=3Dm
> > > CONFIG_CEPH_LIB=3Dy
> > > # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> > > CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> > > # CONFIG_NFC is not set
> > > CONFIG_PSAMPLE=3Dy
> > > # CONFIG_NET_IFE is not set
> > > CONFIG_LWTUNNEL=3Dy
> > > # CONFIG_LWTUNNEL_BPF is not set
> > > CONFIG_DST_CACHE=3Dy
> > > CONFIG_GRO_CELLS=3Dy
> > > CONFIG_NET_SELFTESTS=3Dy
> > > CONFIG_NET_SOCK_MSG=3Dy
> > > CONFIG_NET_DEVLINK=3Dy
> > > CONFIG_PAGE_POOL=3Dy
> > > # CONFIG_PAGE_POOL_STATS is not set
> > > CONFIG_FAILOVER=3Dy
> > > # CONFIG_ETHTOOL_NETLINK is not set
> > > =

> > > #
> > > # Device Drivers
> > > #
> > > CONFIG_HAVE_EISA=3Dy
> > > CONFIG_EISA=3Dy
> > > CONFIG_EISA_VLB_PRIMING=3Dy
> > > # CONFIG_EISA_PCI_EISA is not set
> > > CONFIG_EISA_VIRTUAL_ROOT=3Dy
> > > CONFIG_EISA_NAMES=3Dy
> > > CONFIG_HAVE_PCI=3Dy
> > > CONFIG_PCI=3Dy
> > > CONFIG_PCI_DOMAINS=3Dy
> > > # CONFIG_PCIEPORTBUS is not set
> > > # CONFIG_PCIEASPM is not set
> > > CONFIG_PCIE_PTM=3Dy
> > > # CONFIG_PCI_MSI is not set
> > > CONFIG_PCI_QUIRKS=3Dy
> > > # CONFIG_PCI_DEBUG is not set
> > > CONFIG_PCI_STUB=3Dy
> > > CONFIG_XEN_PCIDEV_FRONTEND=3Dm
> > > CONFIG_PCI_ATS=3Dy
> > > CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> > > # CONFIG_PCI_IOV is not set
> > > CONFIG_PCI_PRI=3Dy
> > > # CONFIG_PCI_PASID is not set
> > > CONFIG_PCI_LABEL=3Dy
> > > # CONFIG_PCIE_BUS_TUNE_OFF is not set
> > > # CONFIG_PCIE_BUS_DEFAULT is not set
> > > CONFIG_PCIE_BUS_SAFE=3Dy
> > > # CONFIG_PCIE_BUS_PERFORMANCE is not set
> > > # CONFIG_PCIE_BUS_PEER2PEER is not set
> > > # CONFIG_VGA_ARB is not set
> > > CONFIG_HOTPLUG_PCI=3Dy
> > > # CONFIG_HOTPLUG_PCI_ACPI is not set
> > > # CONFIG_HOTPLUG_PCI_CPCI is not set
> > > # CONFIG_HOTPLUG_PCI_SHPC is not set
> > > =

> > > #
> > > # PCI controller drivers
> > > #
> > > =

> > > #
> > > # DesignWare PCI Core Support
> > > #
> > > # end of DesignWare PCI Core Support
> > > =

> > > #
> > > # Mobiveil PCIe Core Support
> > > #
> > > # end of Mobiveil PCIe Core Support
> > > =

> > > #
> > > # Cadence PCIe controllers support
> > > #
> > > # end of Cadence PCIe controllers support
> > > # end of PCI controller drivers
> > > =

> > > #
> > > # PCI Endpoint
> > > #
> > > CONFIG_PCI_ENDPOINT=3Dy
> > > CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
> > > # CONFIG_PCI_EPF_TEST is not set
> > > # CONFIG_PCI_EPF_NTB is not set
> > > # end of PCI Endpoint
> > > =

> > > #
> > > # PCI switch controller drivers
> > > #
> > > CONFIG_PCI_SW_SWITCHTEC=3Dm
> > > # end of PCI switch controller drivers
> > > =

> > > # CONFIG_CXL_BUS is not set
> > > CONFIG_PCCARD=3Dy
> > > CONFIG_PCMCIA=3Dy
> > > CONFIG_PCMCIA_LOAD_CIS=3Dy
> > > # CONFIG_CARDBUS is not set
> > > =

> > > #
> > > # PC-card bridges
> > > #
> > > # CONFIG_YENTA is not set
> > > CONFIG_PD6729=3Dm
> > > CONFIG_I82092=3Dm
> > > CONFIG_PCCARD_NONSTATIC=3Dy
> > > # CONFIG_RAPIDIO is not set
> > > =

> > > #
> > > # Generic Driver Options
> > > #
> > > CONFIG_AUXILIARY_BUS=3Dy
> > > # CONFIG_UEVENT_HELPER is not set
> > > CONFIG_DEVTMPFS=3Dy
> > > # CONFIG_DEVTMPFS_MOUNT is not set
> > > CONFIG_DEVTMPFS_SAFE=3Dy
> > > CONFIG_STANDALONE=3Dy
> > > # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> > > =

> > > #
> > > # Firmware loader
> > > #
> > > CONFIG_FW_LOADER=3Dy
> > > CONFIG_FW_LOADER_PAGED_BUF=3Dy
> > > CONFIG_EXTRA_FIRMWARE=3D""
> > > # CONFIG_FW_LOADER_USER_HELPER is not set
> > > CONFIG_FW_LOADER_COMPRESS=3Dy
> > > CONFIG_FW_CACHE=3Dy
> > > # end of Firmware loader
> > > =

> > > CONFIG_WANT_DEV_COREDUMP=3Dy
> > > # CONFIG_ALLOW_DEV_COREDUMP is not set
> > > # CONFIG_DEBUG_DRIVER is not set
> > > CONFIG_DEBUG_DEVRES=3Dy
> > > # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> > > # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> > > CONFIG_SYS_HYPERVISOR=3Dy
> > > CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> > > CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> > > CONFIG_REGMAP=3Dy
> > > CONFIG_REGMAP_I2C=3Dy
> > > CONFIG_REGMAP_SPI=3Dy
> > > CONFIG_REGMAP_MMIO=3Dy
> > > CONFIG_REGMAP_IRQ=3Dy
> > > CONFIG_REGMAP_SCCB=3Dm
> > > CONFIG_DMA_SHARED_BUFFER=3Dy
> > > CONFIG_DMA_FENCE_TRACE=3Dy
> > > # end of Generic Driver Options
> > > =

> > > #
> > > # Bus devices
> > > #
> > > CONFIG_MHI_BUS=3Dm
> > > CONFIG_MHI_BUS_DEBUG=3Dy
> > > CONFIG_MHI_BUS_PCI_GENERIC=3Dm
> > > # end of Bus devices
> > > =

> > > CONFIG_CONNECTOR=3Dy
> > > CONFIG_PROC_EVENTS=3Dy
> > > =

> > > #
> > > # Firmware Drivers
> > > #
> > > =

> > > #
> > > # ARM System Control and Management Interface Protocol
> > > #
> > > # end of ARM System Control and Management Interface Protocol
> > > =

> > > # CONFIG_EDD is not set
> > > CONFIG_FIRMWARE_MEMMAP=3Dy
> > > # CONFIG_ISCSI_IBFT is not set
> > > # CONFIG_FW_CFG_SYSFS is not set
> > > CONFIG_SYSFB=3Dy
> > > CONFIG_SYSFB_SIMPLEFB=3Dy
> > > CONFIG_CS_DSP=3Dm
> > > # CONFIG_GOOGLE_FIRMWARE is not set
> > > =

> > > #
> > > # Tegra firmware driver
> > > #
> > > # end of Tegra firmware driver
> > > # end of Firmware Drivers
> > > =

> > > # CONFIG_GNSS is not set
> > > CONFIG_MTD=3Dy
> > > # CONFIG_MTD_TESTS is not set
> > > =

> > > #
> > > # Partition parsers
> > > #
> > > # CONFIG_MTD_AR7_PARTS is not set
> > > # CONFIG_MTD_CMDLINE_PARTS is not set
> > > CONFIG_MTD_REDBOOT_PARTS=3Dy
> > > CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> > > CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> > > # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> > > # end of Partition parsers
> > > =

> > > #
> > > # User Modules And Translation Layers
> > > #
> > > CONFIG_MTD_BLKDEVS=3Dy
> > > CONFIG_MTD_BLOCK=3Dm
> > > CONFIG_MTD_BLOCK_RO=3Dy
> > > =

> > > #
> > > # Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
> > > #
> > > # CONFIG_FTL is not set
> > > CONFIG_NFTL=3Dm
> > > # CONFIG_NFTL_RW is not set
> > > CONFIG_INFTL=3Dm
> > > CONFIG_RFD_FTL=3Dy
> > > CONFIG_SSFDC=3Dm
> > > CONFIG_SM_FTL=3Dm
> > > CONFIG_MTD_OOPS=3Dy
> > > # CONFIG_MTD_PARTITIONED_MASTER is not set
> > > =

> > > #
> > > # RAM/ROM/Flash chip drivers
> > > #
> > > CONFIG_MTD_CFI=3Dy
> > > CONFIG_MTD_JEDECPROBE=3Dm
> > > CONFIG_MTD_GEN_PROBE=3Dy
> > > # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> > > CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> > > CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> > > CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> > > CONFIG_MTD_CFI_I1=3Dy
> > > CONFIG_MTD_CFI_I2=3Dy
> > > CONFIG_MTD_CFI_INTELEXT=3Dy
> > > # CONFIG_MTD_CFI_AMDSTD is not set
> > > CONFIG_MTD_CFI_STAA=3Dm
> > > CONFIG_MTD_CFI_UTIL=3Dy
> > > CONFIG_MTD_RAM=3Dy
> > > CONFIG_MTD_ROM=3Dy
> > > CONFIG_MTD_ABSENT=3Dy
> > > # end of RAM/ROM/Flash chip drivers
> > > =

> > > #
> > > # Mapping drivers for chip access
> > > #
> > > # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> > > CONFIG_MTD_PHYSMAP=3Dy
> > > # CONFIG_MTD_PHYSMAP_COMPAT is not set
> > > # CONFIG_MTD_AMD76XROM is not set
> > > CONFIG_MTD_ICHXROM=3Dm
> > > CONFIG_MTD_ESB2ROM=3Dm
> > > CONFIG_MTD_CK804XROM=3Dm
> > > # CONFIG_MTD_SCB2_FLASH is not set
> > > CONFIG_MTD_NETtel=3Dm
> > > # CONFIG_MTD_L440GX is not set
> > > CONFIG_MTD_INTEL_VR_NOR=3Dy
> > > CONFIG_MTD_PLATRAM=3Dy
> > > # end of Mapping drivers for chip access
> > > =

> > > #
> > > # Self-contained MTD device drivers
> > > #
> > > CONFIG_MTD_PMC551=3Dy
> > > CONFIG_MTD_PMC551_BUGFIX=3Dy
> > > CONFIG_MTD_PMC551_DEBUG=3Dy
> > > # CONFIG_MTD_DATAFLASH is not set
> > > CONFIG_MTD_MCHP23K256=3Dm
> > > CONFIG_MTD_MCHP48L640=3Dm
> > > CONFIG_MTD_SST25L=3Dy
> > > # CONFIG_MTD_SLRAM is not set
> > > CONFIG_MTD_PHRAM=3Dy
> > > CONFIG_MTD_MTDRAM=3Dy
> > > CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> > > CONFIG_MTDRAM_ERASE_SIZE=3D128
> > > # CONFIG_MTD_BLOCK2MTD is not set
> > > =

> > > #
> > > # Disk-On-Chip Device Drivers
> > > #
> > > # CONFIG_MTD_DOCG3 is not set
> > > # end of Self-contained MTD device drivers
> > > =

> > > #
> > > # NAND
> > > #
> > > CONFIG_MTD_NAND_CORE=3Dy
> > > CONFIG_MTD_ONENAND=3Dm
> > > # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> > > # CONFIG_MTD_ONENAND_GENERIC is not set
> > > CONFIG_MTD_ONENAND_OTP=3Dy
> > > # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> > > # CONFIG_MTD_RAW_NAND is not set
> > > CONFIG_MTD_SPI_NAND=3Dy
> > > =

> > > #
> > > # ECC engine support
> > > #
> > > CONFIG_MTD_NAND_ECC=3Dy
> > > CONFIG_MTD_NAND_ECC_SW_HAMMING=3Dy
> > > CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=3Dy
> > > CONFIG_MTD_NAND_ECC_SW_BCH=3Dy
> > > # CONFIG_MTD_NAND_ECC_MXIC is not set
> > > # end of ECC engine support
> > > # end of NAND
> > > =

> > > #
> > > # LPDDR & LPDDR2 PCM memory drivers
> > > #
> > > CONFIG_MTD_LPDDR=3Dy
> > > CONFIG_MTD_QINFO_PROBE=3Dy
> > > # end of LPDDR & LPDDR2 PCM memory drivers
> > > =

> > > CONFIG_MTD_SPI_NOR=3Dm
> > > CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> > > CONFIG_MTD_SPI_NOR_SWP_DISABLE=3Dy
> > > # CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is not set
> > > # CONFIG_MTD_SPI_NOR_SWP_KEEP is not set
> > > CONFIG_MTD_UBI=3Dm
> > > CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> > > CONFIG_MTD_UBI_BEB_LIMIT=3D20
> > > # CONFIG_MTD_UBI_FASTMAP is not set
> > > # CONFIG_MTD_UBI_GLUEBI is not set
> > > # CONFIG_MTD_UBI_BLOCK is not set
> > > # CONFIG_MTD_HYPERBUS is not set
> > > # CONFIG_OF is not set
> > > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> > > CONFIG_PARPORT=3Dm
> > > CONFIG_PARPORT_PC=3Dm
> > > # CONFIG_PARPORT_SERIAL is not set
> > > # CONFIG_PARPORT_PC_FIFO is not set
> > > # CONFIG_PARPORT_PC_SUPERIO is not set
> > > # CONFIG_PARPORT_PC_PCMCIA is not set
> > > CONFIG_PARPORT_AX88796=3Dm
> > > # CONFIG_PARPORT_1284 is not set
> > > CONFIG_PARPORT_NOT_PC=3Dy
> > > CONFIG_PNP=3Dy
> > > CONFIG_PNP_DEBUG_MESSAGES=3Dy
> > > =

> > > #
> > > # Protocols
> > > #
> > > CONFIG_PNPACPI=3Dy
> > > CONFIG_BLK_DEV=3Dy
> > > # CONFIG_BLK_DEV_NULL_BLK is not set
> > > # CONFIG_BLK_DEV_FD is not set
> > > # CONFIG_PARIDE is not set
> > > # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> > > # CONFIG_ZRAM is not set
> > > # CONFIG_BLK_DEV_LOOP is not set
> > > # CONFIG_BLK_DEV_DRBD is not set
> > > # CONFIG_BLK_DEV_NBD is not set
> > > # CONFIG_BLK_DEV_SX8 is not set
> > > # CONFIG_BLK_DEV_RAM is not set
> > > # CONFIG_CDROM_PKTCDVD is not set
> > > # CONFIG_ATA_OVER_ETH is not set
> > > CONFIG_XEN_BLKDEV_FRONTEND=3Dy
> > > # CONFIG_XEN_BLKDEV_BACKEND is not set
> > > # CONFIG_VIRTIO_BLK is not set
> > > # CONFIG_BLK_DEV_RBD is not set
> > > # CONFIG_BLK_DEV_RNBD_CLIENT is not set
> > > # CONFIG_BLK_DEV_RNBD_SERVER is not set
> > > =

> > > #
> > > # NVME Support
> > > #
> > > CONFIG_NVME_CORE=3Dm
> > > # CONFIG_BLK_DEV_NVME is not set
> > > CONFIG_NVME_MULTIPATH=3Dy
> > > CONFIG_NVME_VERBOSE_ERRORS=3Dy
> > > # CONFIG_NVME_HWMON is not set
> > > CONFIG_NVME_FABRICS=3Dm
> > > CONFIG_NVME_RDMA=3Dm
> > > CONFIG_NVME_FC=3Dm
> > > CONFIG_NVME_TCP=3Dm
> > > # CONFIG_NVME_TARGET is not set
> > > # end of NVME Support
> > > =

> > > #
> > > # Misc devices
> > > #
> > > # CONFIG_AD525X_DPOT is not set
> > > # CONFIG_DUMMY_IRQ is not set
> > > # CONFIG_IBM_ASM is not set
> > > CONFIG_PHANTOM=3Dy
> > > CONFIG_TIFM_CORE=3Dy
> > > # CONFIG_TIFM_7XX1 is not set
> > > CONFIG_ICS932S401=3Dm
> > > CONFIG_ENCLOSURE_SERVICES=3Dy
> > > CONFIG_HP_ILO=3Dy
> > > CONFIG_APDS9802ALS=3Dm
> > > CONFIG_ISL29003=3Dm
> > > # CONFIG_ISL29020 is not set
> > > CONFIG_SENSORS_TSL2550=3Dm
> > > CONFIG_SENSORS_BH1770=3Dm
> > > CONFIG_SENSORS_APDS990X=3Dy
> > > CONFIG_HMC6352=3Dy
> > > CONFIG_DS1682=3Dm
> > > CONFIG_LATTICE_ECP3_CONFIG=3Dm
> > > # CONFIG_SRAM is not set
> > > CONFIG_DW_XDATA_PCIE=3Dm
> > > # CONFIG_PCI_ENDPOINT_TEST is not set
> > > # CONFIG_XILINX_SDFEC is not set
> > > # CONFIG_C2PORT is not set
> > > =

> > > #
> > > # EEPROM support
> > > #
> > > # CONFIG_EEPROM_AT24 is not set
> > > CONFIG_EEPROM_AT25=3Dm
> > > CONFIG_EEPROM_LEGACY=3Dm
> > > CONFIG_EEPROM_MAX6875=3Dm
> > > CONFIG_EEPROM_93CX6=3Dy
> > > # CONFIG_EEPROM_93XX46 is not set
> > > # CONFIG_EEPROM_IDT_89HPESX is not set
> > > # CONFIG_EEPROM_EE1004 is not set
> > > # end of EEPROM support
> > > =

> > > CONFIG_CB710_CORE=3Dy
> > > CONFIG_CB710_DEBUG=3Dy
> > > CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> > > =

> > > #
> > > # Texas Instruments shared transport line discipline
> > > #
> > > # CONFIG_TI_ST is not set
> > > # end of Texas Instruments shared transport line discipline
> > > =

> > > # CONFIG_SENSORS_LIS3_I2C is not set
> > > CONFIG_ALTERA_STAPL=3Dm
> > > # CONFIG_INTEL_MEI is not set
> > > # CONFIG_INTEL_MEI_ME is not set
> > > # CONFIG_INTEL_MEI_TXE is not set
> > > # CONFIG_VMWARE_VMCI is not set
> > > # CONFIG_GENWQE is not set
> > > CONFIG_ECHO=3Dm
> > > CONFIG_MISC_ALCOR_PCI=3Dy
> > > # CONFIG_MISC_RTSX_PCI is not set
> > > # CONFIG_HABANA_AI is not set
> > > CONFIG_UACCE=3Dy
> > > CONFIG_PVPANIC=3Dy
> > > # CONFIG_PVPANIC_MMIO is not set
> > > # CONFIG_PVPANIC_PCI is not set
> > > # end of Misc devices
> > > =

> > > #
> > > # SCSI device support
> > > #
> > > CONFIG_SCSI_MOD=3Dy
> > > CONFIG_RAID_ATTRS=3Dy
> > > CONFIG_SCSI_COMMON=3Dy
> > > CONFIG_SCSI=3Dy
> > > CONFIG_SCSI_DMA=3Dy
> > > CONFIG_SCSI_PROC_FS=3Dy
> > > =

> > > #
> > > # SCSI support type (disk, tape, CD-ROM)
> > > #
> > > CONFIG_BLK_DEV_SD=3Dy
> > > CONFIG_CHR_DEV_ST=3Dm
> > > # CONFIG_BLK_DEV_SR is not set
> > > CONFIG_CHR_DEV_SG=3Dy
> > > # CONFIG_BLK_DEV_BSG is not set
> > > CONFIG_CHR_DEV_SCH=3Dy
> > > # CONFIG_SCSI_ENCLOSURE is not set
> > > CONFIG_SCSI_CONSTANTS=3Dy
> > > CONFIG_SCSI_LOGGING=3Dy
> > > # CONFIG_SCSI_SCAN_ASYNC is not set
> > > =

> > > #
> > > # SCSI Transports
> > > #
> > > CONFIG_SCSI_SPI_ATTRS=3Dy
> > > # CONFIG_SCSI_FC_ATTRS is not set
> > > CONFIG_SCSI_ISCSI_ATTRS=3Dy
> > > CONFIG_SCSI_SAS_ATTRS=3Dy
> > > CONFIG_SCSI_SAS_LIBSAS=3Dm
> > > CONFIG_SCSI_SAS_ATA=3Dy
> > > CONFIG_SCSI_SAS_HOST_SMP=3Dy
> > > CONFIG_SCSI_SRP_ATTRS=3Dm
> > > # end of SCSI Transports
> > > =

> > > CONFIG_SCSI_LOWLEVEL=3Dy
> > > CONFIG_ISCSI_TCP=3Dy
> > > CONFIG_ISCSI_BOOT_SYSFS=3Dy
> > > # CONFIG_SCSI_CXGB3_ISCSI is not set
> > > CONFIG_SCSI_CXGB4_ISCSI=3Dm
> > > CONFIG_SCSI_BNX2_ISCSI=3Dy
> > > CONFIG_BE2ISCSI=3Dy
> > > # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> > > # CONFIG_SCSI_HPSA is not set
> > > CONFIG_SCSI_3W_9XXX=3Dm
> > > CONFIG_SCSI_3W_SAS=3Dm
> > > CONFIG_SCSI_ACARD=3Dm
> > > # CONFIG_SCSI_AHA1740 is not set
> > > # CONFIG_SCSI_AACRAID is not set
> > > CONFIG_SCSI_AIC7XXX=3Dy
> > > CONFIG_AIC7XXX_CMDS_PER_DEVICE=3D32
> > > CONFIG_AIC7XXX_RESET_DELAY_MS=3D5000
> > > # CONFIG_AIC7XXX_BUILD_FIRMWARE is not set
> > > CONFIG_AIC7XXX_DEBUG_ENABLE=3Dy
> > > CONFIG_AIC7XXX_DEBUG_MASK=3D0
> > > CONFIG_AIC7XXX_REG_PRETTY_PRINT=3Dy
> > > CONFIG_SCSI_AIC79XX=3Dy
> > > CONFIG_AIC79XX_CMDS_PER_DEVICE=3D32
> > > CONFIG_AIC79XX_RESET_DELAY_MS=3D5000
> > > # CONFIG_AIC79XX_BUILD_FIRMWARE is not set
> > > # CONFIG_AIC79XX_DEBUG_ENABLE is not set
> > > CONFIG_AIC79XX_DEBUG_MASK=3D0
> > > CONFIG_AIC79XX_REG_PRETTY_PRINT=3Dy
> > > # CONFIG_SCSI_AIC94XX is not set
> > > # CONFIG_SCSI_MVSAS is not set
> > > # CONFIG_SCSI_MVUMI is not set
> > > CONFIG_SCSI_DPT_I2O=3Dy
> > > CONFIG_SCSI_ADVANSYS=3Dm
> > > # CONFIG_SCSI_ARCMSR is not set
> > > CONFIG_SCSI_ESAS2R=3Dm
> > > # CONFIG_MEGARAID_NEWGEN is not set
> > > CONFIG_MEGARAID_LEGACY=3Dy
> > > CONFIG_MEGARAID_SAS=3Dy
> > > CONFIG_SCSI_MPT3SAS=3Dy
> > > CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
> > > CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
> > > CONFIG_SCSI_MPT2SAS=3Dy
> > > CONFIG_SCSI_MPI3MR=3Dm
> > > CONFIG_SCSI_SMARTPQI=3Dm
> > > # CONFIG_SCSI_UFSHCD is not set
> > > # CONFIG_SCSI_HPTIOP is not set
> > > # CONFIG_SCSI_BUSLOGIC is not set
> > > CONFIG_SCSI_MYRB=3Dy
> > > # CONFIG_SCSI_MYRS is not set
> > > CONFIG_VMWARE_PVSCSI=3Dm
> > > CONFIG_XEN_SCSI_FRONTEND=3Dy
> > > CONFIG_SCSI_SNIC=3Dm
> > > # CONFIG_SCSI_SNIC_DEBUG_FS is not set
> > > # CONFIG_SCSI_DMX3191D is not set
> > > CONFIG_SCSI_FDOMAIN=3Dm
> > > # CONFIG_SCSI_FDOMAIN_PCI is not set
> > > CONFIG_SCSI_ISCI=3Dm
> > > # CONFIG_SCSI_IPS is not set
> > > CONFIG_SCSI_INITIO=3Dy
> > > CONFIG_SCSI_INIA100=3Dy
> > > # CONFIG_SCSI_PPA is not set
> > > # CONFIG_SCSI_IMM is not set
> > > CONFIG_SCSI_STEX=3Dy
> > > CONFIG_SCSI_SYM53C8XX_2=3Dy
> > > CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=3D1
> > > CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=3D16
> > > CONFIG_SCSI_SYM53C8XX_MAX_TAGS=3D64
> > > CONFIG_SCSI_SYM53C8XX_MMIO=3Dy
> > > CONFIG_SCSI_IPR=3Dy
> > > # CONFIG_SCSI_IPR_TRACE is not set
> > > CONFIG_SCSI_IPR_DUMP=3Dy
> > > # CONFIG_SCSI_QLOGIC_1280 is not set
> > > CONFIG_SCSI_QLA_ISCSI=3Dm
> > > CONFIG_SCSI_SIM710=3Dm
> > > # CONFIG_SCSI_DC395x is not set
> > > CONFIG_SCSI_AM53C974=3Dm
> > > CONFIG_SCSI_WD719X=3Dm
> > > CONFIG_SCSI_DEBUG=3Dm
> > > # CONFIG_SCSI_PMCRAID is not set
> > > # CONFIG_SCSI_PM8001 is not set
> > > CONFIG_SCSI_VIRTIO=3Dy
> > > CONFIG_SCSI_LOWLEVEL_PCMCIA=3Dy
> > > # CONFIG_PCMCIA_AHA152X is not set
> > > CONFIG_PCMCIA_FDOMAIN=3Dm
> > > # CONFIG_PCMCIA_QLOGIC is not set
> > > CONFIG_PCMCIA_SYM53C500=3Dm
> > > CONFIG_SCSI_DH=3Dy
> > > # CONFIG_SCSI_DH_RDAC is not set
> > > CONFIG_SCSI_DH_HP_SW=3Dm
> > > CONFIG_SCSI_DH_EMC=3Dm
> > > CONFIG_SCSI_DH_ALUA=3Dy
> > > # end of SCSI device support
> > > =

> > > CONFIG_ATA=3Dy
> > > CONFIG_SATA_HOST=3Dy
> > > CONFIG_PATA_TIMINGS=3Dy
> > > CONFIG_ATA_VERBOSE_ERROR=3Dy
> > > CONFIG_ATA_FORCE=3Dy
> > > CONFIG_ATA_ACPI=3Dy
> > > # CONFIG_SATA_ZPODD is not set
> > > # CONFIG_SATA_PMP is not set
> > > =

> > > #
> > > # Controllers with non-SFF native interface
> > > #
> > > CONFIG_SATA_AHCI=3Dy
> > > CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> > > # CONFIG_SATA_AHCI_PLATFORM is not set
> > > # CONFIG_SATA_INIC162X is not set
> > > CONFIG_SATA_ACARD_AHCI=3Dy
> > > CONFIG_SATA_SIL24=3Dm
> > > CONFIG_ATA_SFF=3Dy
> > > =

> > > #
> > > # SFF controllers with custom DMA interface
> > > #
> > > CONFIG_PDC_ADMA=3Dm
> > > # CONFIG_SATA_QSTOR is not set
> > > CONFIG_SATA_SX4=3Dm
> > > # CONFIG_ATA_BMDMA is not set
> > > =

> > > #
> > > # PIO-only SFF controllers
> > > #
> > > CONFIG_PATA_CMD640_PCI=3Dm
> > > CONFIG_PATA_MPIIX=3Dm
> > > CONFIG_PATA_NS87410=3Dm
> > > # CONFIG_PATA_OPTI is not set
> > > # CONFIG_PATA_PCMCIA is not set
> > > # CONFIG_PATA_PLATFORM is not set
> > > CONFIG_PATA_RZ1000=3Dm
> > > =

> > > #
> > > # Generic fallback / legacy drivers
> > > #
> > > # CONFIG_PATA_LEGACY is not set
> > > CONFIG_MD=3Dy
> > > CONFIG_BLK_DEV_MD=3Dy
> > > CONFIG_MD_AUTODETECT=3Dy
> > > # CONFIG_MD_LINEAR is not set
> > > CONFIG_MD_RAID0=3Dm
> > > CONFIG_MD_RAID1=3Dm
> > > CONFIG_MD_RAID10=3Dm
> > > CONFIG_MD_RAID456=3Dm
> > > CONFIG_MD_MULTIPATH=3Dy
> > > CONFIG_MD_FAULTY=3Dy
> > > CONFIG_MD_CLUSTER=3Dm
> > > CONFIG_BCACHE=3Dy
> > > # CONFIG_BCACHE_DEBUG is not set
> > > # CONFIG_BCACHE_CLOSURES_DEBUG is not set
> > > CONFIG_BCACHE_ASYNC_REGISTRATION=3Dy
> > > CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> > > CONFIG_BLK_DEV_DM=3Dm
> > > CONFIG_DM_DEBUG=3Dy
> > > CONFIG_DM_BUFIO=3Dm
> > > CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=3Dy
> > > # CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
> > > CONFIG_DM_PERSISTENT_DATA=3Dm
> > > CONFIG_DM_UNSTRIPED=3Dm
> > > CONFIG_DM_CRYPT=3Dm
> > > # CONFIG_DM_SNAPSHOT is not set
> > > # CONFIG_DM_THIN_PROVISIONING is not set
> > > # CONFIG_DM_CACHE is not set
> > > # CONFIG_DM_WRITECACHE is not set
> > > # CONFIG_DM_EBS is not set
> > > # CONFIG_DM_ERA is not set
> > > CONFIG_DM_CLONE=3Dm
> > > CONFIG_DM_MIRROR=3Dm
> > > # CONFIG_DM_LOG_USERSPACE is not set
> > > CONFIG_DM_RAID=3Dm
> > > CONFIG_DM_ZERO=3Dm
> > > # CONFIG_DM_MULTIPATH is not set
> > > CONFIG_DM_DELAY=3Dm
> > > # CONFIG_DM_DUST is not set
> > > # CONFIG_DM_UEVENT is not set
> > > CONFIG_DM_FLAKEY=3Dm
> > > CONFIG_DM_VERITY=3Dm
> > > CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG=3Dy
> > > CONFIG_DM_VERITY_FEC=3Dy
> > > CONFIG_DM_SWITCH=3Dm
> > > # CONFIG_DM_LOG_WRITES is not set
> > > CONFIG_DM_INTEGRITY=3Dm
> > > CONFIG_DM_ZONED=3Dm
> > > CONFIG_DM_AUDIT=3Dy
> > > CONFIG_TARGET_CORE=3Dm
> > > CONFIG_TCM_IBLOCK=3Dm
> > > # CONFIG_TCM_FILEIO is not set
> > > CONFIG_TCM_PSCSI=3Dm
> > > CONFIG_TCM_USER2=3Dm
> > > CONFIG_LOOPBACK_TARGET=3Dm
> > > CONFIG_ISCSI_TARGET=3Dm
> > > CONFIG_ISCSI_TARGET_CXGB4=3Dm
> > > # CONFIG_SBP_TARGET is not set
> > > CONFIG_FUSION=3Dy
> > > # CONFIG_FUSION_SPI is not set
> > > # CONFIG_FUSION_SAS is not set
> > > CONFIG_FUSION_MAX_SGE=3D128
> > > CONFIG_FUSION_LOGGING=3Dy
> > > =

> > > #
> > > # IEEE 1394 (FireWire) support
> > > #
> > > CONFIG_FIREWIRE=3Dm
> > > CONFIG_FIREWIRE_OHCI=3Dm
> > > CONFIG_FIREWIRE_SBP2=3Dm
> > > # CONFIG_FIREWIRE_NET is not set
> > > CONFIG_FIREWIRE_NOSY=3Dm
> > > # end of IEEE 1394 (FireWire) support
> > > =

> > > # CONFIG_MACINTOSH_DRIVERS is not set
> > > CONFIG_NETDEVICES=3Dy
> > > CONFIG_MII=3Dy
> > > # CONFIG_NET_CORE is not set
> > > # CONFIG_ARCNET is not set
> > > CONFIG_ATM_DRIVERS=3Dy
> > > # CONFIG_ATM_DUMMY is not set
> > > CONFIG_ATM_TCP=3Dy
> > > # CONFIG_ATM_LANAI is not set
> > > # CONFIG_ATM_ENI is not set
> > > # CONFIG_ATM_FIRESTREAM is not set
> > > CONFIG_ATM_ZATM=3Dy
> > > # CONFIG_ATM_ZATM_DEBUG is not set
> > > # CONFIG_ATM_NICSTAR is not set
> > > # CONFIG_ATM_IDT77252 is not set
> > > # CONFIG_ATM_AMBASSADOR is not set
> > > CONFIG_ATM_HORIZON=3Dm
> > > CONFIG_ATM_HORIZON_DEBUG=3Dy
> > > # CONFIG_ATM_IA is not set
> > > # CONFIG_ATM_FORE200E is not set
> > > # CONFIG_ATM_HE is not set
> > > CONFIG_ATM_SOLOS=3Dy
> > > CONFIG_CAIF_DRIVERS=3Dy
> > > # CONFIG_CAIF_TTY is not set
> > > # CONFIG_CAIF_VIRTIO is not set
> > > =

> > > #
> > > # Distributed Switch Architecture drivers
> > > #
> > > CONFIG_B53=3Dm
> > > # CONFIG_B53_SPI_DRIVER is not set
> > > CONFIG_B53_MDIO_DRIVER=3Dm
> > > CONFIG_B53_MMAP_DRIVER=3Dm
> > > # CONFIG_B53_SRAB_DRIVER is not set
> > > # CONFIG_B53_SERDES is not set
> > > CONFIG_NET_DSA_BCM_SF2=3Dm
> > > CONFIG_NET_DSA_LOOP=3Dm
> > > # CONFIG_NET_DSA_LANTIQ_GSWIP is not set
> > > # CONFIG_NET_DSA_MT7530 is not set
> > > CONFIG_NET_DSA_MV88E6060=3Dm
> > > CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON=3Dm
> > > CONFIG_NET_DSA_MICROCHIP_KSZ9477=3Dm
> > > CONFIG_NET_DSA_MICROCHIP_KSZ9477_I2C=3Dm
> > > CONFIG_NET_DSA_MICROCHIP_KSZ9477_SPI=3Dm
> > > CONFIG_NET_DSA_MICROCHIP_KSZ8795=3Dm
> > > CONFIG_NET_DSA_MICROCHIP_KSZ8795_SPI=3Dm
> > > CONFIG_NET_DSA_MICROCHIP_KSZ8863_SMI=3Dm
> > > # CONFIG_NET_DSA_MV88E6XXX is not set
> > > CONFIG_NET_DSA_AR9331=3Dm
> > > CONFIG_NET_DSA_SJA1105=3Dm
> > > CONFIG_NET_DSA_XRS700X=3Dm
> > > CONFIG_NET_DSA_XRS700X_I2C=3Dm
> > > CONFIG_NET_DSA_XRS700X_MDIO=3Dm
> > > # CONFIG_NET_DSA_QCA8K is not set
> > > CONFIG_NET_DSA_REALTEK=3Dm
> > > CONFIG_NET_DSA_SMSC_LAN9303=3Dm
> > > CONFIG_NET_DSA_SMSC_LAN9303_I2C=3Dm
> > > CONFIG_NET_DSA_SMSC_LAN9303_MDIO=3Dm
> > > CONFIG_NET_DSA_VITESSE_VSC73XX=3Dm
> > > CONFIG_NET_DSA_VITESSE_VSC73XX_SPI=3Dm
> > > CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM=3Dm
> > > # end of Distributed Switch Architecture drivers
> > > =

> > > CONFIG_ETHERNET=3Dy
> > > CONFIG_MDIO=3Dy
> > > CONFIG_NET_VENDOR_3COM=3Dy
> > > CONFIG_EL3=3Dy
> > > CONFIG_PCMCIA_3C574=3Dm
> > > # CONFIG_PCMCIA_3C589 is not set
> > > # CONFIG_VORTEX is not set
> > > # CONFIG_TYPHOON is not set
> > > CONFIG_NET_VENDOR_ADAPTEC=3Dy
> > > # CONFIG_ADAPTEC_STARFIRE is not set
> > > CONFIG_NET_VENDOR_AGERE=3Dy
> > > CONFIG_ET131X=3Dm
> > > CONFIG_NET_VENDOR_ALACRITECH=3Dy
> > > CONFIG_SLICOSS=3Dm
> > > CONFIG_NET_VENDOR_ALTEON=3Dy
> > > CONFIG_ACENIC=3Dm
> > > # CONFIG_ACENIC_OMIT_TIGON_I is not set
> > > # CONFIG_ALTERA_TSE is not set
> > > CONFIG_NET_VENDOR_AMAZON=3Dy
> > > # CONFIG_NET_VENDOR_AMD is not set
> > > CONFIG_NET_VENDOR_AQUANTIA=3Dy
> > > CONFIG_AQTION=3Dy
> > > # CONFIG_NET_VENDOR_ARC is not set
> > > # CONFIG_NET_VENDOR_ASIX is not set
> > > # CONFIG_NET_VENDOR_ATHEROS is not set
> > > CONFIG_NET_VENDOR_BROADCOM=3Dy
> > > # CONFIG_B44 is not set
> > > CONFIG_BCMGENET=3Dy
> > > CONFIG_BNX2=3Dy
> > > CONFIG_CNIC=3Dy
> > > CONFIG_TIGON3=3Dm
> > > # CONFIG_TIGON3_HWMON is not set
> > > CONFIG_BNX2X=3Dm
> > > CONFIG_SYSTEMPORT=3Dm
> > > CONFIG_BNXT=3Dm
> > > CONFIG_BNXT_FLOWER_OFFLOAD=3Dy
> > > CONFIG_BNXT_DCB=3Dy
> > > # CONFIG_BNXT_HWMON is not set
> > > # CONFIG_NET_VENDOR_BROCADE is not set
> > > CONFIG_NET_VENDOR_CADENCE=3Dy
> > > CONFIG_MACB=3Dy
> > > CONFIG_MACB_PCI=3Dy
> > > # CONFIG_NET_VENDOR_CAVIUM is not set
> > > CONFIG_NET_VENDOR_CHELSIO=3Dy
> > > CONFIG_CHELSIO_T1=3Dy
> > > CONFIG_CHELSIO_T1_1G=3Dy
> > > # CONFIG_CHELSIO_T3 is not set
> > > CONFIG_CHELSIO_T4=3Dm
> > > CONFIG_CHELSIO_T4_DCB=3Dy
> > > CONFIG_CHELSIO_T4VF=3Dy
> > > CONFIG_CHELSIO_LIB=3Dm
> > > # CONFIG_CHELSIO_INLINE_CRYPTO is not set
> > > CONFIG_NET_VENDOR_CIRRUS=3Dy
> > > # CONFIG_NET_VENDOR_CISCO is not set
> > > CONFIG_NET_VENDOR_CORTINA=3Dy
> > > CONFIG_CX_ECAT=3Dy
> > > CONFIG_NET_VENDOR_DAVICOM=3Dy
> > > CONFIG_DM9051=3Dm
> > > # CONFIG_DNET is not set
> > > # CONFIG_NET_VENDOR_DEC is not set
> > > # CONFIG_NET_VENDOR_DLINK is not set
> > > CONFIG_NET_VENDOR_EMULEX=3Dy
> > > CONFIG_BE2NET=3Dm
> > > CONFIG_BE2NET_HWMON=3Dy
> > > # CONFIG_BE2NET_BE2 is not set
> > > # CONFIG_BE2NET_BE3 is not set
> > > CONFIG_BE2NET_LANCER=3Dy
> > > CONFIG_BE2NET_SKYHAWK=3Dy
> > > CONFIG_NET_VENDOR_ENGLEDER=3Dy
> > > CONFIG_TSNEP=3Dm
> > > # CONFIG_TSNEP_SELFTESTS is not set
> > > # CONFIG_NET_VENDOR_EZCHIP is not set
> > > CONFIG_NET_VENDOR_FUJITSU=3Dy
> > > # CONFIG_PCMCIA_FMVJ18X is not set
> > > # CONFIG_NET_VENDOR_FUNGIBLE is not set
> > > # CONFIG_NET_VENDOR_GOOGLE is not set
> > > CONFIG_NET_VENDOR_HUAWEI=3Dy
> > > # CONFIG_NET_VENDOR_I825XX is not set
> > > CONFIG_NET_VENDOR_INTEL=3Dy
> > > CONFIG_E100=3Dy
> > > CONFIG_E1000=3Dy
> > > CONFIG_E1000E=3Dy
> > > CONFIG_E1000E_HWTS=3Dy
> > > # CONFIG_IGB is not set
> > > # CONFIG_IGBVF is not set
> > > # CONFIG_IXGB is not set
> > > # CONFIG_IXGBE is not set
> > > CONFIG_I40E=3Dy
> > > # CONFIG_I40E_DCB is not set
> > > # CONFIG_IGC is not set
> > > # CONFIG_NET_VENDOR_MICROSOFT is not set
> > > CONFIG_JME=3Dy
> > > CONFIG_NET_VENDOR_LITEX=3Dy
> > > CONFIG_NET_VENDOR_MARVELL=3Dy
> > > CONFIG_MVMDIO=3Dm
> > > CONFIG_SKGE=3Dm
> > > # CONFIG_SKGE_DEBUG is not set
> > > # CONFIG_SKGE_GENESIS is not set
> > > # CONFIG_SKY2 is not set
> > > CONFIG_PRESTERA=3Dm
> > > CONFIG_PRESTERA_PCI=3Dm
> > > CONFIG_NET_VENDOR_MELLANOX=3Dy
> > > CONFIG_MLX4_EN=3Dm
> > > # CONFIG_MLX4_EN_DCB is not set
> > > CONFIG_MLX4_CORE=3Dm
> > > CONFIG_MLX4_DEBUG=3Dy
> > > CONFIG_MLX4_CORE_GEN2=3Dy
> > > CONFIG_MLX5_CORE=3Dm
> > > # CONFIG_MLX5_FPGA is not set
> > > CONFIG_MLX5_CORE_EN=3Dy
> > > CONFIG_MLX5_EN_RXNFC=3Dy
> > > CONFIG_MLX5_MPFS=3Dy
> > > # CONFIG_MLX5_ESWITCH is not set
> > > CONFIG_MLX5_CORE_EN_DCB=3Dy
> > > CONFIG_MLX5_CORE_IPOIB=3Dy
> > > # CONFIG_MLX5_SF is not set
> > > # CONFIG_MLXSW_CORE is not set
> > > CONFIG_MLXFW=3Dm
> > > CONFIG_NET_VENDOR_MICREL=3Dy
> > > CONFIG_KS8851=3Dy
> > > # CONFIG_KS8851_MLL is not set
> > > # CONFIG_KSZ884X_PCI is not set
> > > CONFIG_NET_VENDOR_MICROCHIP=3Dy
> > > CONFIG_ENC28J60=3Dy
> > > # CONFIG_ENC28J60_WRITEVERIFY is not set
> > > # CONFIG_ENCX24J600 is not set
> > > CONFIG_LAN743X=3Dy
> > > # CONFIG_NET_VENDOR_MICROSEMI is not set
> > > CONFIG_NET_VENDOR_MYRI=3Dy
> > > CONFIG_MYRI10GE=3Dm
> > > # CONFIG_FEALNX is not set
> > > # CONFIG_NET_VENDOR_NATSEMI is not set
> > > CONFIG_NET_VENDOR_NETERION=3Dy
> > > # CONFIG_S2IO is not set
> > > # CONFIG_VXGE is not set
> > > CONFIG_NET_VENDOR_NETRONOME=3Dy
> > > # CONFIG_NET_VENDOR_NI is not set
> > > # CONFIG_NET_VENDOR_NVIDIA is not set
> > > # CONFIG_NET_VENDOR_OKI is not set
> > > CONFIG_ETHOC=3Dm
> > > # CONFIG_NET_VENDOR_PACKET_ENGINES is not set
> > > CONFIG_NET_VENDOR_PENSANDO=3Dy
> > > CONFIG_IONIC=3Dm
> > > CONFIG_NET_VENDOR_QLOGIC=3Dy
> > > CONFIG_QLA3XXX=3Dm
> > > # CONFIG_QLCNIC is not set
> > > CONFIG_NETXEN_NIC=3Dy
> > > # CONFIG_QED is not set
> > > # CONFIG_NET_VENDOR_QUALCOMM is not set
> > > CONFIG_NET_VENDOR_RDC=3Dy
> > > # CONFIG_R6040 is not set
> > > CONFIG_NET_VENDOR_REALTEK=3Dy
> > > CONFIG_ATP=3Dm
> > > CONFIG_8139CP=3Dm
> > > # CONFIG_8139TOO is not set
> > > CONFIG_R8169=3Dy
> > > CONFIG_NET_VENDOR_RENESAS=3Dy
> > > CONFIG_NET_VENDOR_ROCKER=3Dy
> > > # CONFIG_ROCKER is not set
> > > CONFIG_NET_VENDOR_SAMSUNG=3Dy
> > > CONFIG_SXGBE_ETH=3Dm
> > > CONFIG_NET_VENDOR_SEEQ=3Dy
> > > # CONFIG_NET_VENDOR_SOLARFLARE is not set
> > > CONFIG_NET_VENDOR_SILAN=3Dy
> > > CONFIG_SC92031=3Dy
> > > # CONFIG_NET_VENDOR_SIS is not set
> > > CONFIG_NET_VENDOR_SMSC=3Dy
> > > CONFIG_PCMCIA_SMC91C92=3Dm
> > > CONFIG_EPIC100=3Dy
> > > # CONFIG_SMSC911X is not set
> > > # CONFIG_SMSC9420 is not set
> > > # CONFIG_NET_VENDOR_SOCIONEXT is not set
> > > CONFIG_NET_VENDOR_STMICRO=3Dy
> > > CONFIG_STMMAC_ETH=3Dm
> > > # CONFIG_STMMAC_SELFTESTS is not set
> > > # CONFIG_STMMAC_PLATFORM is not set
> > > # CONFIG_DWMAC_INTEL is not set
> > > # CONFIG_DWMAC_LOONGSON is not set
> > > CONFIG_STMMAC_PCI=3Dm
> > > # CONFIG_NET_VENDOR_SUN is not set
> > > # CONFIG_NET_VENDOR_SYNOPSYS is not set
> > > # CONFIG_NET_VENDOR_TEHUTI is not set
> > > # CONFIG_NET_VENDOR_TI is not set
> > > # CONFIG_NET_VENDOR_VERTEXCOM is not set
> > > CONFIG_NET_VENDOR_VIA=3Dy
> > > # CONFIG_VIA_RHINE is not set
> > > CONFIG_VIA_VELOCITY=3Dy
> > > # CONFIG_NET_VENDOR_WIZNET is not set
> > > # CONFIG_NET_VENDOR_XILINX is not set
> > > # CONFIG_NET_VENDOR_XIRCOM is not set
> > > CONFIG_FDDI=3Dm
> > > CONFIG_DEFXX=3Dm
> > > # CONFIG_SKFP is not set
> > > # CONFIG_HIPPI is not set
> > > # CONFIG_NET_SB1000 is not set
> > > CONFIG_PHYLINK=3Dy
> > > CONFIG_PHYLIB=3Dy
> > > CONFIG_SWPHY=3Dy
> > > # CONFIG_LED_TRIGGER_PHY is not set
> > > CONFIG_FIXED_PHY=3Dy
> > > # CONFIG_SFP is not set
> > > =

> > > #
> > > # MII PHY device drivers
> > > #
> > > # CONFIG_AMD_PHY is not set
> > > CONFIG_ADIN_PHY=3Dm
> > > CONFIG_AQUANTIA_PHY=3Dm
> > > # CONFIG_AX88796B_PHY is not set
> > > CONFIG_BROADCOM_PHY=3Dm
> > > CONFIG_BCM54140_PHY=3Dy
> > > CONFIG_BCM7XXX_PHY=3Dy
> > > CONFIG_BCM84881_PHY=3Dy
> > > CONFIG_BCM87XX_PHY=3Dm
> > > CONFIG_BCM_NET_PHYLIB=3Dy
> > > CONFIG_CICADA_PHY=3Dy
> > > CONFIG_CORTINA_PHY=3Dy
> > > CONFIG_DAVICOM_PHY=3Dy
> > > CONFIG_ICPLUS_PHY=3Dy
> > > CONFIG_LXT_PHY=3Dm
> > > CONFIG_INTEL_XWAY_PHY=3Dm
> > > # CONFIG_LSI_ET1011C_PHY is not set
> > > # CONFIG_MARVELL_PHY is not set
> > > CONFIG_MARVELL_10G_PHY=3Dy
> > > # CONFIG_MARVELL_88X2222_PHY is not set
> > > # CONFIG_MAXLINEAR_GPHY is not set
> > > # CONFIG_MEDIATEK_GE_PHY is not set
> > > CONFIG_MICREL_PHY=3Dy
> > > # CONFIG_MICROCHIP_PHY is not set
> > > # CONFIG_MICROCHIP_T1_PHY is not set
> > > # CONFIG_MICROSEMI_PHY is not set
> > > CONFIG_MOTORCOMM_PHY=3Dy
> > > CONFIG_NATIONAL_PHY=3Dy
> > > CONFIG_NXP_C45_TJA11XX_PHY=3Dy
> > > CONFIG_NXP_TJA11XX_PHY=3Dm
> > > # CONFIG_AT803X_PHY is not set
> > > CONFIG_QSEMI_PHY=3Dm
> > > CONFIG_REALTEK_PHY=3Dy
> > > CONFIG_RENESAS_PHY=3Dm
> > > # CONFIG_ROCKCHIP_PHY is not set
> > > CONFIG_SMSC_PHY=3Dy
> > > # CONFIG_STE10XP is not set
> > > CONFIG_TERANETICS_PHY=3Dy
> > > CONFIG_DP83822_PHY=3Dm
> > > # CONFIG_DP83TC811_PHY is not set
> > > CONFIG_DP83848_PHY=3Dy
> > > CONFIG_DP83867_PHY=3Dm
> > > # CONFIG_DP83869_PHY is not set
> > > CONFIG_VITESSE_PHY=3Dm
> > > # CONFIG_XILINX_GMII2RGMII is not set
> > > CONFIG_MICREL_KS8995MA=3Dm
> > > CONFIG_MDIO_DEVICE=3Dy
> > > CONFIG_MDIO_BUS=3Dy
> > > CONFIG_FWNODE_MDIO=3Dy
> > > CONFIG_ACPI_MDIO=3Dy
> > > CONFIG_MDIO_DEVRES=3Dy
> > > CONFIG_MDIO_BITBANG=3Dm
> > > CONFIG_MDIO_BCM_UNIMAC=3Dy
> > > CONFIG_MDIO_CAVIUM=3Dy
> > > CONFIG_MDIO_GPIO=3Dm
> > > # CONFIG_MDIO_MSCC_MIIM is not set
> > > CONFIG_MDIO_THUNDER=3Dy
> > > =

> > > #
> > > # MDIO Multiplexers
> > > #
> > > =

> > > #
> > > # PCS device drivers
> > > #
> > > CONFIG_PCS_XPCS=3Dy
> > > # end of PCS device drivers
> > > =

> > > # CONFIG_PLIP is not set
> > > CONFIG_PPP=3Dy
> > > CONFIG_PPP_BSDCOMP=3Dy
> > > CONFIG_PPP_DEFLATE=3Dm
> > > CONFIG_PPP_FILTER=3Dy
> > > # CONFIG_PPP_MPPE is not set
> > > CONFIG_PPP_MULTILINK=3Dy
> > > CONFIG_PPPOATM=3Dm
> > > CONFIG_PPPOE=3Dy
> > > CONFIG_PPPOL2TP=3Dm
> > > # CONFIG_PPP_ASYNC is not set
> > > # CONFIG_PPP_SYNC_TTY is not set
> > > # CONFIG_SLIP is not set
> > > CONFIG_SLHC=3Dy
> > > =

> > > #
> > > # Host-side USB support is needed for USB Network Adapter support
> > > #
> > > # CONFIG_WLAN is not set
> > > CONFIG_WAN=3Dy
> > > # CONFIG_LANMEDIA is not set
> > > CONFIG_HDLC=3Dm
> > > CONFIG_HDLC_RAW=3Dm
> > > # CONFIG_HDLC_RAW_ETH is not set
> > > # CONFIG_HDLC_CISCO is not set
> > > CONFIG_HDLC_FR=3Dm
> > > # CONFIG_HDLC_PPP is not set
> > > CONFIG_HDLC_X25=3Dm
> > > # CONFIG_PCI200SYN is not set
> > > # CONFIG_WANXL is not set
> > > CONFIG_PC300TOO=3Dm
> > > # CONFIG_FARSYNC is not set
> > > CONFIG_LAPBETHER=3Dm
> > > CONFIG_IEEE802154_DRIVERS=3Dm
> > > # CONFIG_IEEE802154_FAKELB is not set
> > > CONFIG_IEEE802154_AT86RF230=3Dm
> > > CONFIG_IEEE802154_AT86RF230_DEBUGFS=3Dy
> > > CONFIG_IEEE802154_MRF24J40=3Dm
> > > CONFIG_IEEE802154_CC2520=3Dm
> > > CONFIG_IEEE802154_ADF7242=3Dm
> > > CONFIG_IEEE802154_CA8210=3Dm
> > > # CONFIG_IEEE802154_CA8210_DEBUGFS is not set
> > > CONFIG_IEEE802154_MCR20A=3Dm
> > > # CONFIG_IEEE802154_HWSIM is not set
> > > =

> > > #
> > > # Wireless WAN
> > > #
> > > CONFIG_WWAN=3Dy
> > > # CONFIG_WWAN_DEBUGFS is not set
> > > # CONFIG_WWAN_HWSIM is not set
> > > CONFIG_MHI_WWAN_CTRL=3Dm
> > > CONFIG_MHI_WWAN_MBIM=3Dm
> > > CONFIG_RPMSG_WWAN_CTRL=3Dm
> > > # end of Wireless WAN
> > > =

> > > CONFIG_XEN_NETDEV_FRONTEND=3Dm
> > > # CONFIG_XEN_NETDEV_BACKEND is not set
> > > # CONFIG_VMXNET3 is not set
> > > # CONFIG_FUJITSU_ES is not set
> > > CONFIG_USB4_NET=3Dy
> > > CONFIG_NETDEVSIM=3Dm
> > > CONFIG_NET_FAILOVER=3Dy
> > > # CONFIG_ISDN is not set
> > > =

> > > #
> > > # Input device support
> > > #
> > > CONFIG_INPUT=3Dy
> > > CONFIG_INPUT_LEDS=3Dy
> > > # CONFIG_INPUT_FF_MEMLESS is not set
> > > # CONFIG_INPUT_SPARSEKMAP is not set
> > > # CONFIG_INPUT_MATRIXKMAP is not set
> > > CONFIG_INPUT_VIVALDIFMAP=3Dy
> > > =

> > > #
> > > # Userland interfaces
> > > #
> > > # CONFIG_INPUT_MOUSEDEV is not set
> > > # CONFIG_INPUT_JOYDEV is not set
> > > # CONFIG_INPUT_EVDEV is not set
> > > # CONFIG_INPUT_EVBUG is not set
> > > =

> > > #
> > > # Input Device Drivers
> > > #
> > > CONFIG_INPUT_KEYBOARD=3Dy
> > > # CONFIG_KEYBOARD_ADC is not set
> > > # CONFIG_KEYBOARD_ADP5588 is not set
> > > # CONFIG_KEYBOARD_ADP5589 is not set
> > > CONFIG_KEYBOARD_ATKBD=3Dy
> > > # CONFIG_KEYBOARD_QT1050 is not set
> > > # CONFIG_KEYBOARD_QT1070 is not set
> > > # CONFIG_KEYBOARD_QT2160 is not set
> > > # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> > > # CONFIG_KEYBOARD_LKKBD is not set
> > > # CONFIG_KEYBOARD_GPIO is not set
> > > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > > # CONFIG_KEYBOARD_TCA6416 is not set
> > > # CONFIG_KEYBOARD_TCA8418 is not set
> > > # CONFIG_KEYBOARD_MATRIX is not set
> > > # CONFIG_KEYBOARD_LM8323 is not set
> > > # CONFIG_KEYBOARD_LM8333 is not set
> > > # CONFIG_KEYBOARD_MAX7359 is not set
> > > # CONFIG_KEYBOARD_MCS is not set
> > > # CONFIG_KEYBOARD_MPR121 is not set
> > > # CONFIG_KEYBOARD_NEWTON is not set
> > > # CONFIG_KEYBOARD_OPENCORES is not set
> > > # CONFIG_KEYBOARD_SAMSUNG is not set
> > > # CONFIG_KEYBOARD_STOWAWAY is not set
> > > # CONFIG_KEYBOARD_SUNKBD is not set
> > > # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> > > # CONFIG_KEYBOARD_TWL4030 is not set
> > > # CONFIG_KEYBOARD_XTKBD is not set
> > > # CONFIG_KEYBOARD_MTK_PMIC is not set
> > > # CONFIG_KEYBOARD_CYPRESS_SF is not set
> > > CONFIG_INPUT_MOUSE=3Dy
> > > CONFIG_MOUSE_PS2=3Dy
> > > CONFIG_MOUSE_PS2_ALPS=3Dy
> > > CONFIG_MOUSE_PS2_BYD=3Dy
> > > CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> > > CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> > > CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> > > CONFIG_MOUSE_PS2_CYPRESS=3Dy
> > > CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> > > # CONFIG_MOUSE_PS2_ELANTECH is not set
> > > # CONFIG_MOUSE_PS2_SENTELIC is not set
> > > # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> > > CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> > > # CONFIG_MOUSE_PS2_VMMOUSE is not set
> > > CONFIG_MOUSE_PS2_SMBUS=3Dy
> > > # CONFIG_MOUSE_SERIAL is not set
> > > # CONFIG_MOUSE_APPLETOUCH is not set
> > > # CONFIG_MOUSE_BCM5974 is not set
> > > # CONFIG_MOUSE_CYAPA is not set
> > > # CONFIG_MOUSE_ELAN_I2C is not set
> > > # CONFIG_MOUSE_VSXXXAA is not set
> > > # CONFIG_MOUSE_GPIO is not set
> > > # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> > > # CONFIG_MOUSE_SYNAPTICS_USB is not set
> > > # CONFIG_INPUT_JOYSTICK is not set
> > > # CONFIG_INPUT_TABLET is not set
> > > # CONFIG_INPUT_TOUCHSCREEN is not set
> > > # CONFIG_INPUT_MISC is not set
> > > # CONFIG_RMI4_CORE is not set
> > > =

> > > #
> > > # Hardware I/O ports
> > > #
> > > CONFIG_SERIO=3Dy
> > > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> > > CONFIG_SERIO_I8042=3Dy
> > > CONFIG_SERIO_SERPORT=3Dy
> > > # CONFIG_SERIO_CT82C710 is not set
> > > CONFIG_SERIO_PARKBD=3Dm
> > > CONFIG_SERIO_PCIPS2=3Dm
> > > CONFIG_SERIO_LIBPS2=3Dy
> > > # CONFIG_SERIO_RAW is not set
> > > # CONFIG_SERIO_ALTERA_PS2 is not set
> > > # CONFIG_SERIO_PS2MULT is not set
> > > CONFIG_SERIO_ARC_PS2=3Dm
> > > CONFIG_SERIO_GPIO_PS2=3Dm
> > > CONFIG_USERIO=3Dm
> > > CONFIG_GAMEPORT=3Dm
> > > # CONFIG_GAMEPORT_NS558 is not set
> > > CONFIG_GAMEPORT_L4=3Dm
> > > CONFIG_GAMEPORT_EMU10K1=3Dm
> > > CONFIG_GAMEPORT_FM801=3Dm
> > > # end of Hardware I/O ports
> > > # end of Input device support
> > > =

> > > #
> > > # Character devices
> > > #
> > > CONFIG_TTY=3Dy
> > > # CONFIG_VT is not set
> > > CONFIG_UNIX98_PTYS=3Dy
> > > CONFIG_LEGACY_PTYS=3Dy
> > > CONFIG_LEGACY_PTY_COUNT=3D256
> > > CONFIG_LDISC_AUTOLOAD=3Dy
> > > =

> > > #
> > > # Serial drivers
> > > #
> > > CONFIG_SERIAL_EARLYCON=3Dy
> > > CONFIG_SERIAL_8250=3Dy
> > > CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> > > CONFIG_SERIAL_8250_PNP=3Dy
> > > # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> > > # CONFIG_SERIAL_8250_FINTEK is not set
> > > CONFIG_SERIAL_8250_CONSOLE=3Dy
> > > CONFIG_SERIAL_8250_PCI=3Dy
> > > CONFIG_SERIAL_8250_EXAR=3Dy
> > > # CONFIG_SERIAL_8250_CS is not set
> > > CONFIG_SERIAL_8250_NR_UARTS=3D4
> > > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > > # CONFIG_SERIAL_8250_EXTENDED is not set
> > > CONFIG_SERIAL_8250_DWLIB=3Dy
> > > # CONFIG_SERIAL_8250_DW is not set
> > > # CONFIG_SERIAL_8250_RT288X is not set
> > > CONFIG_SERIAL_8250_LPSS=3Dy
> > > CONFIG_SERIAL_8250_MID=3Dy
> > > CONFIG_SERIAL_8250_PERICOM=3Dy
> > > =

> > > #
> > > # Non-8250 serial port support
> > > #
> > > # CONFIG_SERIAL_MAX3100 is not set
> > > # CONFIG_SERIAL_MAX310X is not set
> > > # CONFIG_SERIAL_UARTLITE is not set
> > > CONFIG_SERIAL_CORE=3Dy
> > > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > > # CONFIG_SERIAL_JSM is not set
> > > # CONFIG_SERIAL_LANTIQ is not set
> > > # CONFIG_SERIAL_SCCNXP is not set
> > > # CONFIG_SERIAL_SC16IS7XX is not set
> > > # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> > > # CONFIG_SERIAL_ALTERA_UART is not set
> > > # CONFIG_SERIAL_ARC is not set
> > > # CONFIG_SERIAL_RP2 is not set
> > > # CONFIG_SERIAL_FSL_LPUART is not set
> > > # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> > > # CONFIG_SERIAL_SPRD is not set
> > > # end of Serial drivers
> > > =

> > > CONFIG_SERIAL_MCTRL_GPIO=3Dy
> > > # CONFIG_SERIAL_NONSTANDARD is not set
> > > # CONFIG_N_GSM is not set
> > > # CONFIG_NOZOMI is not set
> > > # CONFIG_NULL_TTY is not set
> > > CONFIG_HVC_DRIVER=3Dy
> > > CONFIG_HVC_IRQ=3Dy
> > > CONFIG_HVC_XEN=3Dy
> > > CONFIG_HVC_XEN_FRONTEND=3Dy
> > > # CONFIG_RPMSG_TTY is not set
> > > CONFIG_SERIAL_DEV_BUS=3Dy
> > > CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> > > # CONFIG_TTY_PRINTK is not set
> > > CONFIG_PRINTER=3Dm
> > > CONFIG_LP_CONSOLE=3Dy
> > > CONFIG_PPDEV=3Dm
> > > # CONFIG_VIRTIO_CONSOLE is not set
> > > CONFIG_IPMI_HANDLER=3Dm
> > > CONFIG_IPMI_PLAT_DATA=3Dy
> > > # CONFIG_IPMI_PANIC_EVENT is not set
> > > CONFIG_IPMI_DEVICE_INTERFACE=3Dm
> > > CONFIG_IPMI_SI=3Dm
> > > CONFIG_IPMI_SSIF=3Dm
> > > CONFIG_IPMI_IPMB=3Dm
> > > CONFIG_IPMI_WATCHDOG=3Dm
> > > # CONFIG_IPMI_POWEROFF is not set
> > > # CONFIG_IPMB_DEVICE_INTERFACE is not set
> > > CONFIG_HW_RANDOM=3Dy
> > > CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> > > CONFIG_HW_RANDOM_INTEL=3Dm
> > > # CONFIG_HW_RANDOM_AMD is not set
> > > CONFIG_HW_RANDOM_BA431=3Dm
> > > # CONFIG_HW_RANDOM_VIA is not set
> > > CONFIG_HW_RANDOM_VIRTIO=3Dy
> > > CONFIG_HW_RANDOM_XIPHERA=3Dy
> > > # CONFIG_APPLICOM is not set
> > > =

> > > #
> > > # PCMCIA character devices
> > > #
> > > # CONFIG_SYNCLINK_CS is not set
> > > CONFIG_CARDMAN_4000=3Dy
> > > CONFIG_CARDMAN_4040=3Dm
> > > CONFIG_SCR24X=3Dm
> > > # CONFIG_IPWIRELESS is not set
> > > # end of PCMCIA character devices
> > > =

> > > # CONFIG_MWAVE is not set
> > > # CONFIG_DEVMEM is not set
> > > # CONFIG_NVRAM is not set
> > > # CONFIG_DEVPORT is not set
> > > # CONFIG_HPET is not set
> > > CONFIG_HANGCHECK_TIMER=3Dy
> > > CONFIG_TCG_TPM=3Dm
> > > # CONFIG_HW_RANDOM_TPM is not set
> > > CONFIG_TCG_TIS_CORE=3Dm
> > > CONFIG_TCG_TIS=3Dm
> > > CONFIG_TCG_TIS_SPI=3Dm
> > > CONFIG_TCG_TIS_SPI_CR50=3Dy
> > > CONFIG_TCG_TIS_I2C_CR50=3Dm
> > > CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> > > CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> > > CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> > > CONFIG_TCG_NSC=3Dm
> > > CONFIG_TCG_ATMEL=3Dm
> > > # CONFIG_TCG_INFINEON is not set
> > > CONFIG_TCG_XEN=3Dm
> > > # CONFIG_TCG_CRB is not set
> > > # CONFIG_TCG_VTPM_PROXY is not set
> > > CONFIG_TCG_TIS_ST33ZP24=3Dm
> > > CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> > > CONFIG_TCG_TIS_ST33ZP24_SPI=3Dm
> > > # CONFIG_TELCLOCK is not set
> > > CONFIG_XILLYBUS_CLASS=3Dm
> > > CONFIG_XILLYBUS=3Dm
> > > CONFIG_RANDOM_TRUST_CPU=3Dy
> > > CONFIG_RANDOM_TRUST_BOOTLOADER=3Dy
> > > # end of Character devices
> > > =

> > > #
> > > # I2C support
> > > #
> > > CONFIG_I2C=3Dy
> > > CONFIG_ACPI_I2C_OPREGION=3Dy
> > > CONFIG_I2C_BOARDINFO=3Dy
> > > CONFIG_I2C_COMPAT=3Dy
> > > # CONFIG_I2C_CHARDEV is not set
> > > CONFIG_I2C_MUX=3Dy
> > > =

> > > #
> > > # Multiplexer I2C Chip support
> > > #
> > > CONFIG_I2C_MUX_GPIO=3Dy
> > > CONFIG_I2C_MUX_LTC4306=3Dm
> > > # CONFIG_I2C_MUX_PCA9541 is not set
> > > CONFIG_I2C_MUX_PCA954x=3Dm
> > > CONFIG_I2C_MUX_REG=3Dm
> > > CONFIG_I2C_MUX_MLXCPLD=3Dm
> > > # end of Multiplexer I2C Chip support
> > > =

> > > CONFIG_I2C_HELPER_AUTO=3Dy
> > > CONFIG_I2C_SMBUS=3Dm
> > > CONFIG_I2C_ALGOBIT=3Dy
> > > CONFIG_I2C_ALGOPCA=3Dm
> > > =

> > > #
> > > # I2C Hardware Bus support
> > > #
> > > =

> > > #
> > > # PC SMBus host controller drivers
> > > #
> > > CONFIG_I2C_CCGX_UCSI=3Dy
> > > # CONFIG_I2C_ALI1535 is not set
> > > # CONFIG_I2C_ALI1563 is not set
> > > CONFIG_I2C_ALI15X3=3Dm
> > > # CONFIG_I2C_AMD756 is not set
> > > # CONFIG_I2C_AMD8111 is not set
> > > # CONFIG_I2C_AMD_MP2 is not set
> > > CONFIG_I2C_I801=3Dm
> > > # CONFIG_I2C_ISCH is not set
> > > CONFIG_I2C_ISMT=3Dy
> > > CONFIG_I2C_PIIX4=3Dy
> > > CONFIG_I2C_NFORCE2=3Dm
> > > # CONFIG_I2C_NFORCE2_S4985 is not set
> > > CONFIG_I2C_NVIDIA_GPU=3Dy
> > > # CONFIG_I2C_SIS5595 is not set
> > > CONFIG_I2C_SIS630=3Dy
> > > CONFIG_I2C_SIS96X=3Dm
> > > CONFIG_I2C_VIA=3Dy
> > > CONFIG_I2C_VIAPRO=3Dm
> > > =

> > > #
> > > # ACPI drivers
> > > #
> > > # CONFIG_I2C_SCMI is not set
> > > =

> > > #
> > > # I2C system bus drivers (mostly embedded / system-on-chip)
> > > #
> > > CONFIG_I2C_CBUS_GPIO=3Dm
> > > # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> > > # CONFIG_I2C_DESIGNWARE_PCI is not set
> > > CONFIG_I2C_EMEV2=3Dm
> > > CONFIG_I2C_GPIO=3Dm
> > > CONFIG_I2C_GPIO_FAULT_INJECTOR=3Dy
> > > CONFIG_I2C_KEMPLD=3Dy
> > > CONFIG_I2C_OCORES=3Dy
> > > CONFIG_I2C_PCA_PLATFORM=3Dm
> > > CONFIG_I2C_SIMTEC=3Dy
> > > CONFIG_I2C_XILINX=3Dm
> > > =

> > > #
> > > # External I2C/SMBus adapter drivers
> > > #
> > > CONFIG_I2C_PARPORT=3Dm
> > > # CONFIG_I2C_TAOS_EVM is not set
> > > =

> > > #
> > > # Other I2C/SMBus bus drivers
> > > #
> > > CONFIG_I2C_MLXCPLD=3Dm
> > > CONFIG_I2C_VIRTIO=3Dm
> > > # end of I2C Hardware Bus support
> > > =

> > > # CONFIG_I2C_STUB is not set
> > > CONFIG_I2C_SLAVE=3Dy
> > > CONFIG_I2C_SLAVE_EEPROM=3Dy
> > > # CONFIG_I2C_SLAVE_TESTUNIT is not set
> > > # CONFIG_I2C_DEBUG_CORE is not set
> > > # CONFIG_I2C_DEBUG_ALGO is not set
> > > # CONFIG_I2C_DEBUG_BUS is not set
> > > # end of I2C support
> > > =

> > > CONFIG_I3C=3Dm
> > > # CONFIG_CDNS_I3C_MASTER is not set
> > > CONFIG_DW_I3C_MASTER=3Dm
> > > CONFIG_SVC_I3C_MASTER=3Dm
> > > CONFIG_MIPI_I3C_HCI=3Dm
> > > CONFIG_SPI=3Dy
> > > # CONFIG_SPI_DEBUG is not set
> > > CONFIG_SPI_MASTER=3Dy
> > > CONFIG_SPI_MEM=3Dy
> > > =

> > > #
> > > # SPI Master Controller Drivers
> > > #
> > > CONFIG_SPI_ALTERA=3Dy
> > > CONFIG_SPI_ALTERA_CORE=3Dy
> > > CONFIG_SPI_AXI_SPI_ENGINE=3Dm
> > > CONFIG_SPI_BITBANG=3Dy
> > > # CONFIG_SPI_BUTTERFLY is not set
> > > CONFIG_SPI_CADENCE=3Dm
> > > # CONFIG_SPI_DESIGNWARE is not set
> > > CONFIG_SPI_NXP_FLEXSPI=3Dy
> > > CONFIG_SPI_GPIO=3Dy
> > > CONFIG_SPI_INTEL=3Dm
> > > CONFIG_SPI_INTEL_PCI=3Dm
> > > # CONFIG_SPI_INTEL_PLATFORM is not set
> > > # CONFIG_SPI_LM70_LLP is not set
> > > # CONFIG_SPI_LANTIQ_SSC is not set
> > > CONFIG_SPI_OC_TINY=3Dy
> > > CONFIG_SPI_PXA2XX=3Dy
> > > CONFIG_SPI_PXA2XX_PCI=3Dy
> > > CONFIG_SPI_ROCKCHIP=3Dm
> > > CONFIG_SPI_SC18IS602=3Dy
> > > CONFIG_SPI_SIFIVE=3Dy
> > > CONFIG_SPI_MXIC=3Dy
> > > # CONFIG_SPI_XCOMM is not set
> > > CONFIG_SPI_XILINX=3Dm
> > > CONFIG_SPI_ZYNQMP_GQSPI=3Dm
> > > # CONFIG_SPI_AMD is not set
> > > =

> > > #
> > > # SPI Multiplexer support
> > > #
> > > CONFIG_SPI_MUX=3Dy
> > > =

> > > #
> > > # SPI Protocol Masters
> > > #
> > > CONFIG_SPI_SPIDEV=3Dm
> > > # CONFIG_SPI_LOOPBACK_TEST is not set
> > > CONFIG_SPI_TLE62X0=3Dy
> > > CONFIG_SPI_SLAVE=3Dy
> > > CONFIG_SPI_SLAVE_TIME=3Dm
> > > # CONFIG_SPI_SLAVE_SYSTEM_CONTROL is not set
> > > CONFIG_SPI_DYNAMIC=3Dy
> > > # CONFIG_SPMI is not set
> > > CONFIG_HSI=3Dy
> > > CONFIG_HSI_BOARDINFO=3Dy
> > > =

> > > #
> > > # HSI controllers
> > > #
> > > =

> > > #
> > > # HSI clients
> > > #
> > > # CONFIG_HSI_CHAR is not set
> > > CONFIG_PPS=3Dy
> > > # CONFIG_PPS_DEBUG is not set
> > > =

> > > #
> > > # PPS clients support
> > > #
> > > CONFIG_PPS_CLIENT_KTIMER=3Dy
> > > # CONFIG_PPS_CLIENT_LDISC is not set
> > > CONFIG_PPS_CLIENT_PARPORT=3Dm
> > > CONFIG_PPS_CLIENT_GPIO=3Dy
> > > =

> > > #
> > > # PPS generators support
> > > #
> > > =

> > > #
> > > # PTP clock support
> > > #
> > > CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> > > =

> > > #
> > > # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional cl=
ocks.
> > > #
> > > # end of PTP clock support
> > > =

> > > # CONFIG_PINCTRL is not set
> > > CONFIG_GPIOLIB=3Dy
> > > CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> > > CONFIG_GPIO_ACPI=3Dy
> > > CONFIG_GPIOLIB_IRQCHIP=3Dy
> > > CONFIG_DEBUG_GPIO=3Dy
> > > # CONFIG_GPIO_SYSFS is not set
> > > CONFIG_GPIO_CDEV=3Dy
> > > CONFIG_GPIO_CDEV_V1=3Dy
> > > CONFIG_GPIO_GENERIC=3Dy
> > > CONFIG_GPIO_MAX730X=3Dy
> > > =

> > > #
> > > # Memory mapped GPIO drivers
> > > #
> > > # CONFIG_GPIO_AMDPT is not set
> > > CONFIG_GPIO_DWAPB=3Dy
> > > # CONFIG_GPIO_EXAR is not set
> > > CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> > > CONFIG_GPIO_ICH=3Dm
> > > CONFIG_GPIO_MB86S7X=3Dm
> > > CONFIG_GPIO_VX855=3Dy
> > > # CONFIG_GPIO_AMD_FCH is not set
> > > # end of Memory mapped GPIO drivers
> > > =

> > > #
> > > # Port-mapped I/O GPIO drivers
> > > #
> > > CONFIG_GPIO_F7188X=3Dy
> > > CONFIG_GPIO_IT87=3Dy
> > > # CONFIG_GPIO_SCH is not set
> > > # CONFIG_GPIO_SCH311X is not set
> > > # CONFIG_GPIO_WINBOND is not set
> > > CONFIG_GPIO_WS16C48=3Dy
> > > # end of Port-mapped I/O GPIO drivers
> > > =

> > > #
> > > # I2C GPIO expanders
> > > #
> > > # CONFIG_GPIO_ADP5588 is not set
> > > CONFIG_GPIO_MAX7300=3Dy
> > > # CONFIG_GPIO_MAX732X is not set
> > > CONFIG_GPIO_PCA953X=3Dy
> > > CONFIG_GPIO_PCA953X_IRQ=3Dy
> > > CONFIG_GPIO_PCA9570=3Dy
> > > # CONFIG_GPIO_PCF857X is not set
> > > # CONFIG_GPIO_TPIC2810 is not set
> > > # end of I2C GPIO expanders
> > > =

> > > #
> > > # MFD GPIO expanders
> > > #
> > > CONFIG_GPIO_ARIZONA=3Dm
> > > # CONFIG_GPIO_DA9052 is not set
> > > # CONFIG_GPIO_JANZ_TTL is not set
> > > CONFIG_GPIO_KEMPLD=3Dm
> > > CONFIG_GPIO_LP3943=3Dy
> > > CONFIG_GPIO_PALMAS=3Dy
> > > CONFIG_GPIO_RC5T583=3Dy
> > > CONFIG_GPIO_TQMX86=3Dm
> > > # CONFIG_GPIO_TWL4030 is not set
> > > CONFIG_GPIO_TWL6040=3Dy
> > > # CONFIG_GPIO_UCB1400 is not set
> > > CONFIG_GPIO_WM831X=3Dy
> > > # CONFIG_GPIO_WM8994 is not set
> > > # end of MFD GPIO expanders
> > > =

> > > #
> > > # PCI GPIO expanders
> > > #
> > > # CONFIG_GPIO_AMD8111 is not set
> > > CONFIG_GPIO_BT8XX=3Dm
> > > CONFIG_GPIO_MERRIFIELD=3Dy
> > > # CONFIG_GPIO_ML_IOH is not set
> > > # CONFIG_GPIO_PCI_IDIO_16 is not set
> > > CONFIG_GPIO_PCIE_IDIO_24=3Dy
> > > CONFIG_GPIO_RDC321X=3Dy
> > > # end of PCI GPIO expanders
> > > =

> > > #
> > > # SPI GPIO expanders
> > > #
> > > CONFIG_GPIO_MAX3191X=3Dm
> > > CONFIG_GPIO_MAX7301=3Dy
> > > CONFIG_GPIO_MC33880=3Dy
> > > CONFIG_GPIO_PISOSR=3Dy
> > > # CONFIG_GPIO_XRA1403 is not set
> > > # end of SPI GPIO expanders
> > > =

> > > #
> > > # Virtual GPIO drivers
> > > #
> > > CONFIG_GPIO_AGGREGATOR=3Dy
> > > CONFIG_GPIO_MOCKUP=3Dy
> > > CONFIG_GPIO_VIRTIO=3Dm
> > > CONFIG_GPIO_SIM=3Dy
> > > # end of Virtual GPIO drivers
> > > =

> > > CONFIG_W1=3Dy
> > > # CONFIG_W1_CON is not set
> > > =

> > > #
> > > # 1-wire Bus Masters
> > > #
> > > # CONFIG_W1_MASTER_MATROX is not set
> > > CONFIG_W1_MASTER_DS2482=3Dm
> > > # CONFIG_W1_MASTER_DS1WM is not set
> > > CONFIG_W1_MASTER_GPIO=3Dm
> > > CONFIG_W1_MASTER_SGI=3Dm
> > > # end of 1-wire Bus Masters
> > > =

> > > #
> > > # 1-wire Slaves
> > > #
> > > # CONFIG_W1_SLAVE_THERM is not set
> > > # CONFIG_W1_SLAVE_SMEM is not set
> > > # CONFIG_W1_SLAVE_DS2405 is not set
> > > CONFIG_W1_SLAVE_DS2408=3Dm
> > > # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> > > CONFIG_W1_SLAVE_DS2413=3Dm
> > > CONFIG_W1_SLAVE_DS2406=3Dm
> > > # CONFIG_W1_SLAVE_DS2423 is not set
> > > # CONFIG_W1_SLAVE_DS2805 is not set
> > > CONFIG_W1_SLAVE_DS2430=3Dy
> > > CONFIG_W1_SLAVE_DS2431=3Dy
> > > CONFIG_W1_SLAVE_DS2433=3Dy
> > > CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> > > CONFIG_W1_SLAVE_DS2438=3Dy
> > > CONFIG_W1_SLAVE_DS250X=3Dy
> > > CONFIG_W1_SLAVE_DS2780=3Dy
> > > CONFIG_W1_SLAVE_DS2781=3Dy
> > > CONFIG_W1_SLAVE_DS28E04=3Dy
> > > CONFIG_W1_SLAVE_DS28E17=3Dy
> > > # end of 1-wire Slaves
> > > =

> > > CONFIG_POWER_RESET=3Dy
> > > CONFIG_POWER_RESET_ATC260X=3Dm
> > > # CONFIG_POWER_RESET_MT6323 is not set
> > > CONFIG_POWER_RESET_RESTART=3Dy
> > > CONFIG_POWER_SUPPLY=3Dy
> > > # CONFIG_POWER_SUPPLY_DEBUG is not set
> > > # CONFIG_POWER_SUPPLY_HWMON is not set
> > > CONFIG_PDA_POWER=3Dy
> > > # CONFIG_GENERIC_ADC_BATTERY is not set
> > > CONFIG_IP5XXX_POWER=3Dy
> > > # CONFIG_WM831X_BACKUP is not set
> > > # CONFIG_WM831X_POWER is not set
> > > # CONFIG_TEST_POWER is not set
> > > # CONFIG_CHARGER_ADP5061 is not set
> > > # CONFIG_BATTERY_CW2015 is not set
> > > # CONFIG_BATTERY_DS2760 is not set
> > > CONFIG_BATTERY_DS2780=3Dy
> > > CONFIG_BATTERY_DS2781=3Dy
> > > CONFIG_BATTERY_DS2782=3Dm
> > > CONFIG_BATTERY_SAMSUNG_SDI=3Dy
> > > CONFIG_BATTERY_SBS=3Dy
> > > CONFIG_CHARGER_SBS=3Dy
> > > # CONFIG_MANAGER_SBS is not set
> > > # CONFIG_BATTERY_BQ27XXX is not set
> > > CONFIG_BATTERY_DA9030=3Dm
> > > CONFIG_BATTERY_DA9052=3Dm
> > > # CONFIG_CHARGER_DA9150 is not set
> > > CONFIG_BATTERY_DA9150=3Dy
> > > # CONFIG_BATTERY_MAX17040 is not set
> > > # CONFIG_BATTERY_MAX17042 is not set
> > > # CONFIG_BATTERY_MAX1721X is not set
> > > CONFIG_BATTERY_TWL4030_MADC=3Dm
> > > # CONFIG_CHARGER_PCF50633 is not set
> > > CONFIG_BATTERY_RX51=3Dm
> > > # CONFIG_CHARGER_MAX8903 is not set
> > > CONFIG_CHARGER_TWL4030=3Dm
> > > CONFIG_CHARGER_LP8727=3Dm
> > > # CONFIG_CHARGER_LP8788 is not set
> > > # CONFIG_CHARGER_GPIO is not set
> > > # CONFIG_CHARGER_MANAGER is not set
> > > CONFIG_CHARGER_LT3651=3Dy
> > > # CONFIG_CHARGER_LTC4162L is not set
> > > CONFIG_CHARGER_MAX77976=3Dm
> > > # CONFIG_CHARGER_MAX8998 is not set
> > > # CONFIG_CHARGER_MP2629 is not set
> > > CONFIG_CHARGER_BQ2415X=3Dm
> > > CONFIG_CHARGER_BQ24190=3Dy
> > > CONFIG_CHARGER_BQ24257=3Dy
> > > CONFIG_CHARGER_BQ24735=3Dy
> > > CONFIG_CHARGER_BQ2515X=3Dy
> > > CONFIG_CHARGER_BQ25890=3Dy
> > > CONFIG_CHARGER_BQ25980=3Dy
> > > # CONFIG_CHARGER_BQ256XX is not set
> > > CONFIG_CHARGER_SMB347=3Dy
> > > CONFIG_CHARGER_TPS65090=3Dm
> > > CONFIG_BATTERY_GAUGE_LTC2941=3Dm
> > > CONFIG_BATTERY_GOLDFISH=3Dy
> > > CONFIG_BATTERY_RT5033=3Dm
> > > CONFIG_CHARGER_RT9455=3Dy
> > > # CONFIG_CHARGER_BD99954 is not set
> > > # CONFIG_BATTERY_UG3105 is not set
> > > CONFIG_HWMON=3Dy
> > > CONFIG_HWMON_VID=3Dy
> > > # CONFIG_HWMON_DEBUG_CHIP is not set
> > > =

> > > #
> > > # Native drivers
> > > #
> > > # CONFIG_SENSORS_AD7314 is not set
> > > CONFIG_SENSORS_AD7414=3Dy
> > > CONFIG_SENSORS_AD7418=3Dm
> > > CONFIG_SENSORS_ADM1021=3Dm
> > > CONFIG_SENSORS_ADM1025=3Dy
> > > CONFIG_SENSORS_ADM1026=3Dm
> > > # CONFIG_SENSORS_ADM1029 is not set
> > > CONFIG_SENSORS_ADM1031=3Dm
> > > CONFIG_SENSORS_ADM1177=3Dy
> > > CONFIG_SENSORS_ADM9240=3Dy
> > > CONFIG_SENSORS_ADT7X10=3Dm
> > > # CONFIG_SENSORS_ADT7310 is not set
> > > CONFIG_SENSORS_ADT7410=3Dm
> > > CONFIG_SENSORS_ADT7411=3Dy
> > > CONFIG_SENSORS_ADT7462=3Dm
> > > # CONFIG_SENSORS_ADT7470 is not set
> > > CONFIG_SENSORS_ADT7475=3Dy
> > > CONFIG_SENSORS_AHT10=3Dy
> > > # CONFIG_SENSORS_AS370 is not set
> > > CONFIG_SENSORS_ASC7621=3Dm
> > > CONFIG_SENSORS_AXI_FAN_CONTROL=3Dm
> > > CONFIG_SENSORS_K8TEMP=3Dy
> > > # CONFIG_SENSORS_K10TEMP is not set
> > > # CONFIG_SENSORS_FAM15H_POWER is not set
> > > # CONFIG_SENSORS_APPLESMC is not set
> > > CONFIG_SENSORS_ASB100=3Dy
> > > CONFIG_SENSORS_ASPEED=3Dm
> > > # CONFIG_SENSORS_ATXP1 is not set
> > > # CONFIG_SENSORS_CORSAIR_CPRO is not set
> > > # CONFIG_SENSORS_CORSAIR_PSU is not set
> > > CONFIG_SENSORS_DRIVETEMP=3Dy
> > > CONFIG_SENSORS_DS620=3Dy
> > > # CONFIG_SENSORS_DS1621 is not set
> > > CONFIG_SENSORS_DELL_SMM=3Dm
> > > CONFIG_I8K=3Dy
> > > CONFIG_SENSORS_DA9052_ADC=3Dm
> > > # CONFIG_SENSORS_I5K_AMB is not set
> > > # CONFIG_SENSORS_F71805F is not set
> > > CONFIG_SENSORS_F71882FG=3Dm
> > > CONFIG_SENSORS_F75375S=3Dm
> > > CONFIG_SENSORS_MC13783_ADC=3Dm
> > > CONFIG_SENSORS_FSCHMD=3Dy
> > > CONFIG_SENSORS_FTSTEUTATES=3Dy
> > > # CONFIG_SENSORS_GL518SM is not set
> > > CONFIG_SENSORS_GL520SM=3Dy
> > > # CONFIG_SENSORS_G760A is not set
> > > CONFIG_SENSORS_G762=3Dm
> > > CONFIG_SENSORS_HIH6130=3Dy
> > > # CONFIG_SENSORS_IBMAEM is not set
> > > CONFIG_SENSORS_IBMPEX=3Dm
> > > CONFIG_SENSORS_IIO_HWMON=3Dm
> > > CONFIG_SENSORS_I5500=3Dy
> > > CONFIG_SENSORS_CORETEMP=3Dy
> > > CONFIG_SENSORS_IT87=3Dy
> > > CONFIG_SENSORS_JC42=3Dm
> > > # CONFIG_SENSORS_POWR1220 is not set
> > > CONFIG_SENSORS_LINEAGE=3Dm
> > > CONFIG_SENSORS_LTC2945=3Dy
> > > CONFIG_SENSORS_LTC2947=3Dy
> > > CONFIG_SENSORS_LTC2947_I2C=3Dy
> > > CONFIG_SENSORS_LTC2947_SPI=3Dy
> > > # CONFIG_SENSORS_LTC2990 is not set
> > > # CONFIG_SENSORS_LTC2992 is not set
> > > CONFIG_SENSORS_LTC4151=3Dm
> > > CONFIG_SENSORS_LTC4215=3Dy
> > > CONFIG_SENSORS_LTC4222=3Dm
> > > # CONFIG_SENSORS_LTC4245 is not set
> > > CONFIG_SENSORS_LTC4260=3Dy
> > > CONFIG_SENSORS_LTC4261=3Dy
> > > CONFIG_SENSORS_MAX1111=3Dm
> > > # CONFIG_SENSORS_MAX127 is not set
> > > # CONFIG_SENSORS_MAX16065 is not set
> > > # CONFIG_SENSORS_MAX1619 is not set
> > > CONFIG_SENSORS_MAX1668=3Dy
> > > CONFIG_SENSORS_MAX197=3Dm
> > > CONFIG_SENSORS_MAX31722=3Dm
> > > CONFIG_SENSORS_MAX31730=3Dm
> > > # CONFIG_SENSORS_MAX6620 is not set
> > > # CONFIG_SENSORS_MAX6621 is not set
> > > CONFIG_SENSORS_MAX6639=3Dm
> > > # CONFIG_SENSORS_MAX6642 is not set
> > > CONFIG_SENSORS_MAX6650=3Dm
> > > # CONFIG_SENSORS_MAX6697 is not set
> > > CONFIG_SENSORS_MAX31790=3Dy
> > > CONFIG_SENSORS_MCP3021=3Dy
> > > CONFIG_SENSORS_TC654=3Dm
> > > CONFIG_SENSORS_TPS23861=3Dy
> > > CONFIG_SENSORS_MENF21BMC_HWMON=3Dm
> > > CONFIG_SENSORS_MR75203=3Dm
> > > CONFIG_SENSORS_ADCXX=3Dy
> > > CONFIG_SENSORS_LM63=3Dm
> > > CONFIG_SENSORS_LM70=3Dy
> > > CONFIG_SENSORS_LM73=3Dy
> > > CONFIG_SENSORS_LM75=3Dm
> > > # CONFIG_SENSORS_LM77 is not set
> > > CONFIG_SENSORS_LM78=3Dm
> > > CONFIG_SENSORS_LM80=3Dy
> > > # CONFIG_SENSORS_LM83 is not set
> > > # CONFIG_SENSORS_LM85 is not set
> > > # CONFIG_SENSORS_LM87 is not set
> > > CONFIG_SENSORS_LM90=3Dy
> > > CONFIG_SENSORS_LM92=3Dy
> > > # CONFIG_SENSORS_LM93 is not set
> > > # CONFIG_SENSORS_LM95234 is not set
> > > CONFIG_SENSORS_LM95241=3Dm
> > > CONFIG_SENSORS_LM95245=3Dy
> > > CONFIG_SENSORS_PC87360=3Dy
> > > # CONFIG_SENSORS_PC87427 is not set
> > > CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> > > CONFIG_SENSORS_NCT6683=3Dy
> > > # CONFIG_SENSORS_NCT6775 is not set
> > > # CONFIG_SENSORS_NCT7802 is not set
> > > CONFIG_SENSORS_NCT7904=3Dm
> > > # CONFIG_SENSORS_NPCM7XX is not set
> > > CONFIG_SENSORS_PCF8591=3Dm
> > > CONFIG_SENSORS_PECI_CPUTEMP=3Dm
> > > CONFIG_SENSORS_PECI_DIMMTEMP=3Dm
> > > CONFIG_SENSORS_PECI=3Dm
> > > CONFIG_PMBUS=3Dy
> > > CONFIG_SENSORS_PMBUS=3Dm
> > > # CONFIG_SENSORS_ADM1266 is not set
> > > CONFIG_SENSORS_ADM1275=3Dm
> > > CONFIG_SENSORS_BEL_PFE=3Dm
> > > CONFIG_SENSORS_BPA_RS600=3Dm
> > > CONFIG_SENSORS_DELTA_AHE50DC_FAN=3Dy
> > > CONFIG_SENSORS_FSP_3Y=3Dm
> > > CONFIG_SENSORS_IBM_CFFPS=3Dm
> > > CONFIG_SENSORS_DPS920AB=3Dy
> > > CONFIG_SENSORS_INSPUR_IPSPS=3Dy
> > > # CONFIG_SENSORS_IR35221 is not set
> > > # CONFIG_SENSORS_IR36021 is not set
> > > CONFIG_SENSORS_IR38064=3Dy
> > > # CONFIG_SENSORS_IR38064_REGULATOR is not set
> > > # CONFIG_SENSORS_IRPS5401 is not set
> > > # CONFIG_SENSORS_ISL68137 is not set
> > > # CONFIG_SENSORS_LM25066 is not set
> > > # CONFIG_SENSORS_LTC2978 is not set
> > > CONFIG_SENSORS_LTC3815=3Dy
> > > CONFIG_SENSORS_MAX15301=3Dm
> > > CONFIG_SENSORS_MAX16064=3Dm
> > > # CONFIG_SENSORS_MAX16601 is not set
> > > CONFIG_SENSORS_MAX20730=3Dm
> > > # CONFIG_SENSORS_MAX20751 is not set
> > > CONFIG_SENSORS_MAX31785=3Dm
> > > # CONFIG_SENSORS_MAX34440 is not set
> > > CONFIG_SENSORS_MAX8688=3Dm
> > > CONFIG_SENSORS_MP2888=3Dy
> > > CONFIG_SENSORS_MP2975=3Dm
> > > # CONFIG_SENSORS_MP5023 is not set
> > > CONFIG_SENSORS_PIM4328=3Dy
> > > CONFIG_SENSORS_PLI1209BC=3Dm
> > > CONFIG_SENSORS_PLI1209BC_REGULATOR=3Dy
> > > CONFIG_SENSORS_PM6764TR=3Dm
> > > CONFIG_SENSORS_PXE1610=3Dm
> > > CONFIG_SENSORS_Q54SJ108A2=3Dm
> > > # CONFIG_SENSORS_STPDDC60 is not set
> > > # CONFIG_SENSORS_TPS40422 is not set
> > > CONFIG_SENSORS_TPS53679=3Dm
> > > # CONFIG_SENSORS_UCD9000 is not set
> > > CONFIG_SENSORS_UCD9200=3Dy
> > > CONFIG_SENSORS_XDPE122=3Dy
> > > CONFIG_SENSORS_XDPE122_REGULATOR=3Dy
> > > CONFIG_SENSORS_ZL6100=3Dm
> > > CONFIG_SENSORS_SBTSI=3Dy
> > > # CONFIG_SENSORS_SBRMI is not set
> > > CONFIG_SENSORS_SHT15=3Dy
> > > CONFIG_SENSORS_SHT21=3Dy
> > > CONFIG_SENSORS_SHT3x=3Dm
> > > CONFIG_SENSORS_SHT4x=3Dm
> > > CONFIG_SENSORS_SHTC1=3Dm
> > > CONFIG_SENSORS_SIS5595=3Dm
> > > # CONFIG_SENSORS_SY7636A is not set
> > > # CONFIG_SENSORS_DME1737 is not set
> > > CONFIG_SENSORS_EMC1403=3Dy
> > > CONFIG_SENSORS_EMC2103=3Dm
> > > CONFIG_SENSORS_EMC6W201=3Dm
> > > CONFIG_SENSORS_SMSC47M1=3Dm
> > > CONFIG_SENSORS_SMSC47M192=3Dm
> > > CONFIG_SENSORS_SMSC47B397=3Dy
> > > CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> > > CONFIG_SENSORS_SCH5627=3Dy
> > > # CONFIG_SENSORS_SCH5636 is not set
> > > # CONFIG_SENSORS_STTS751 is not set
> > > CONFIG_SENSORS_SMM665=3Dy
> > > # CONFIG_SENSORS_ADC128D818 is not set
> > > CONFIG_SENSORS_ADS7828=3Dm
> > > # CONFIG_SENSORS_ADS7871 is not set
> > > CONFIG_SENSORS_AMC6821=3Dy
> > > CONFIG_SENSORS_INA209=3Dm
> > > CONFIG_SENSORS_INA2XX=3Dy
> > > CONFIG_SENSORS_INA238=3Dy
> > > CONFIG_SENSORS_INA3221=3Dy
> > > CONFIG_SENSORS_TC74=3Dy
> > > # CONFIG_SENSORS_THMC50 is not set
> > > # CONFIG_SENSORS_TMP102 is not set
> > > CONFIG_SENSORS_TMP103=3Dm
> > > CONFIG_SENSORS_TMP108=3Dy
> > > CONFIG_SENSORS_TMP401=3Dm
> > > CONFIG_SENSORS_TMP421=3Dm
> > > # CONFIG_SENSORS_TMP464 is not set
> > > CONFIG_SENSORS_TMP513=3Dy
> > > # CONFIG_SENSORS_VIA_CPUTEMP is not set
> > > CONFIG_SENSORS_VIA686A=3Dm
> > > # CONFIG_SENSORS_VT1211 is not set
> > > CONFIG_SENSORS_VT8231=3Dm
> > > CONFIG_SENSORS_W83773G=3Dy
> > > CONFIG_SENSORS_W83781D=3Dm
> > > # CONFIG_SENSORS_W83791D is not set
> > > # CONFIG_SENSORS_W83792D is not set
> > > # CONFIG_SENSORS_W83793 is not set
> > > # CONFIG_SENSORS_W83795 is not set
> > > CONFIG_SENSORS_W83L785TS=3Dy
> > > # CONFIG_SENSORS_W83L786NG is not set
> > > CONFIG_SENSORS_W83627HF=3Dy
> > > # CONFIG_SENSORS_W83627EHF is not set
> > > # CONFIG_SENSORS_WM831X is not set
> > > =

> > > #
> > > # ACPI drivers
> > > #
> > > # CONFIG_SENSORS_ACPI_POWER is not set
> > > # CONFIG_SENSORS_ATK0110 is not set
> > > # CONFIG_SENSORS_ASUS_EC is not set
> > > CONFIG_THERMAL=3Dy
> > > # CONFIG_THERMAL_NETLINK is not set
> > > # CONFIG_THERMAL_STATISTICS is not set
> > > CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> > > CONFIG_THERMAL_HWMON=3Dy
> > > CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> > > CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> > > # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> > > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > > # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> > > CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> > > # CONFIG_THERMAL_GOV_BANG_BANG is not set
> > > CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> > > # CONFIG_THERMAL_EMULATION is not set
> > > =

> > > #
> > > # Intel thermal drivers
> > > #
> > > # CONFIG_INTEL_POWERCLAMP is not set
> > > CONFIG_X86_THERMAL_VECTOR=3Dy
> > > CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> > > # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> > > =

> > > #
> > > # ACPI INT340X thermal drivers
> > > #
> > > # CONFIG_INT340X_THERMAL is not set
> > > # end of ACPI INT340X thermal drivers
> > > =

> > > # CONFIG_INTEL_PCH_THERMAL is not set
> > > # CONFIG_INTEL_TCC_COOLING is not set
> > > # CONFIG_INTEL_MENLOW is not set
> > > # CONFIG_INTEL_HFI_THERMAL is not set
> > > # end of Intel thermal drivers
> > > =

> > > # CONFIG_GENERIC_ADC_THERMAL is not set
> > > CONFIG_WATCHDOG=3Dy
> > > CONFIG_WATCHDOG_CORE=3Dy
> > > # CONFIG_WATCHDOG_NOWAYOUT is not set
> > > CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
> > > CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> > > # CONFIG_WATCHDOG_SYSFS is not set
> > > # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
> > > =

> > > #
> > > # Watchdog Pretimeout Governors
> > > #
> > > # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> > > =

> > > #
> > > # Watchdog Device Drivers
> > > #
> > > CONFIG_SOFT_WATCHDOG=3Dy
> > > CONFIG_DA9052_WATCHDOG=3Dm
> > > CONFIG_DA9063_WATCHDOG=3Dy
> > > CONFIG_DA9062_WATCHDOG=3Dy
> > > # CONFIG_MENF21BMC_WATCHDOG is not set
> > > # CONFIG_WDAT_WDT is not set
> > > # CONFIG_WM831X_WATCHDOG is not set
> > > CONFIG_XILINX_WATCHDOG=3Dy
> > > CONFIG_ZIIRAVE_WATCHDOG=3Dy
> > > CONFIG_RAVE_SP_WATCHDOG=3Dm
> > > CONFIG_CADENCE_WATCHDOG=3Dy
> > > CONFIG_DW_WATCHDOG=3Dm
> > > # CONFIG_TWL4030_WATCHDOG is not set
> > > CONFIG_MAX63XX_WATCHDOG=3Dm
> > > CONFIG_RETU_WATCHDOG=3Dm
> > > CONFIG_ACQUIRE_WDT=3Dm
> > > CONFIG_ADVANTECH_WDT=3Dy
> > > # CONFIG_ALIM1535_WDT is not set
> > > CONFIG_ALIM7101_WDT=3Dy
> > > CONFIG_EBC_C384_WDT=3Dy
> > > CONFIG_F71808E_WDT=3Dy
> > > # CONFIG_SP5100_TCO is not set
> > > CONFIG_SBC_FITPC2_WATCHDOG=3Dm
> > > # CONFIG_EUROTECH_WDT is not set
> > > CONFIG_IB700_WDT=3Dm
> > > # CONFIG_IBMASR is not set
> > > # CONFIG_WAFER_WDT is not set
> > > # CONFIG_I6300ESB_WDT is not set
> > > CONFIG_IE6XX_WDT=3Dy
> > > CONFIG_INTEL_MID_WATCHDOG=3Dm
> > > # CONFIG_ITCO_WDT is not set
> > > CONFIG_IT8712F_WDT=3Dm
> > > # CONFIG_IT87_WDT is not set
> > > CONFIG_HP_WATCHDOG=3Dm
> > > # CONFIG_HPWDT_NMI_DECODING is not set
> > > # CONFIG_KEMPLD_WDT is not set
> > > # CONFIG_SC1200_WDT is not set
> > > # CONFIG_PC87413_WDT is not set
> > > CONFIG_NV_TCO=3Dm
> > > CONFIG_60XX_WDT=3Dy
> > > # CONFIG_CPU5_WDT is not set
> > > CONFIG_SMSC_SCH311X_WDT=3Dm
> > > CONFIG_SMSC37B787_WDT=3Dm
> > > CONFIG_TQMX86_WDT=3Dy
> > > CONFIG_VIA_WDT=3Dy
> > > CONFIG_W83627HF_WDT=3Dm
> > > # CONFIG_W83877F_WDT is not set
> > > # CONFIG_W83977F_WDT is not set
> > > CONFIG_MACHZ_WDT=3Dy
> > > CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> > > # CONFIG_NI903X_WDT is not set
> > > # CONFIG_NIC7018_WDT is not set
> > > CONFIG_MEN_A21_WDT=3Dm
> > > # CONFIG_XEN_WDT is not set
> > > =

> > > #
> > > # PCI-based Watchdog Cards
> > > #
> > > # CONFIG_PCIPCWATCHDOG is not set
> > > # CONFIG_WDTPCI is not set
> > > CONFIG_SSB_POSSIBLE=3Dy
> > > # CONFIG_SSB is not set
> > > CONFIG_BCMA_POSSIBLE=3Dy
> > > CONFIG_BCMA=3Dm
> > > CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > > CONFIG_BCMA_HOST_PCI=3Dy
> > > CONFIG_BCMA_HOST_SOC=3Dy
> > > CONFIG_BCMA_DRIVER_PCI=3Dy
> > > # CONFIG_BCMA_SFLASH is not set
> > > CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> > > CONFIG_BCMA_DRIVER_GPIO=3Dy
> > > CONFIG_BCMA_DEBUG=3Dy
> > > =

> > > #
> > > # Multifunction device drivers
> > > #
> > > CONFIG_MFD_CORE=3Dy
> > > # CONFIG_MFD_AS3711 is not set
> > > # CONFIG_PMIC_ADP5520 is not set
> > > # CONFIG_MFD_AAT2870_CORE is not set
> > > CONFIG_MFD_BCM590XX=3Dm
> > > # CONFIG_MFD_BD9571MWV is not set
> > > # CONFIG_MFD_AXP20X_I2C is not set
> > > # CONFIG_MFD_MADERA is not set
> > > CONFIG_PMIC_DA903X=3Dy
> > > CONFIG_PMIC_DA9052=3Dy
> > > CONFIG_MFD_DA9052_SPI=3Dy
> > > # CONFIG_MFD_DA9052_I2C is not set
> > > # CONFIG_MFD_DA9055 is not set
> > > CONFIG_MFD_DA9062=3Dy
> > > CONFIG_MFD_DA9063=3Dy
> > > CONFIG_MFD_DA9150=3Dy
> > > CONFIG_MFD_MC13XXX=3Dm
> > > CONFIG_MFD_MC13XXX_SPI=3Dm
> > > # CONFIG_MFD_MC13XXX_I2C is not set
> > > CONFIG_MFD_MP2629=3Dy
> > > CONFIG_HTC_PASIC3=3Dm
> > > # CONFIG_HTC_I2CPLD is not set
> > > # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> > > CONFIG_LPC_ICH=3Dm
> > > CONFIG_LPC_SCH=3Dy
> > > # CONFIG_INTEL_SOC_PMIC_MRFLD is not set
> > > CONFIG_MFD_INTEL_LPSS=3Dy
> > > # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> > > CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> > > # CONFIG_MFD_INTEL_PMC_BXT is not set
> > > # CONFIG_MFD_IQS62X is not set
> > > CONFIG_MFD_JANZ_CMODIO=3Dm
> > > CONFIG_MFD_KEMPLD=3Dy
> > > # CONFIG_MFD_88PM800 is not set
> > > CONFIG_MFD_88PM805=3Dy
> > > # CONFIG_MFD_88PM860X is not set
> > > # CONFIG_MFD_MAX14577 is not set
> > > # CONFIG_MFD_MAX77693 is not set
> > > # CONFIG_MFD_MAX77843 is not set
> > > CONFIG_MFD_MAX8907=3Dy
> > > # CONFIG_MFD_MAX8925 is not set
> > > # CONFIG_MFD_MAX8997 is not set
> > > CONFIG_MFD_MAX8998=3Dy
> > > # CONFIG_MFD_MT6360 is not set
> > > CONFIG_MFD_MT6397=3Dy
> > > CONFIG_MFD_MENF21BMC=3Dm
> > > # CONFIG_EZX_PCAP is not set
> > > CONFIG_MFD_RETU=3Dm
> > > CONFIG_MFD_PCF50633=3Dy
> > > # CONFIG_PCF50633_ADC is not set
> > > # CONFIG_PCF50633_GPIO is not set
> > > CONFIG_UCB1400_CORE=3Dm
> > > CONFIG_MFD_RDC321X=3Dy
> > > CONFIG_MFD_RT4831=3Dy
> > > # CONFIG_MFD_RT5033 is not set
> > > CONFIG_MFD_RC5T583=3Dy
> > > CONFIG_MFD_SI476X_CORE=3Dm
> > > # CONFIG_MFD_SIMPLE_MFD_I2C is not set
> > > # CONFIG_MFD_SM501 is not set
> > > CONFIG_MFD_SKY81452=3Dy
> > > CONFIG_MFD_SYSCON=3Dy
> > > # CONFIG_MFD_TI_AM335X_TSCADC is not set
> > > CONFIG_MFD_LP3943=3Dy
> > > CONFIG_MFD_LP8788=3Dy
> > > CONFIG_MFD_TI_LMU=3Dy
> > > CONFIG_MFD_PALMAS=3Dy
> > > CONFIG_TPS6105X=3Dm
> > > # CONFIG_TPS65010 is not set
> > > CONFIG_TPS6507X=3Dy
> > > # CONFIG_MFD_TPS65086 is not set
> > > CONFIG_MFD_TPS65090=3Dy
> > > # CONFIG_MFD_TI_LP873X is not set
> > > # CONFIG_MFD_TPS6586X is not set
> > > # CONFIG_MFD_TPS65910 is not set
> > > # CONFIG_MFD_TPS65912_I2C is not set
> > > # CONFIG_MFD_TPS65912_SPI is not set
> > > CONFIG_TWL4030_CORE=3Dy
> > > CONFIG_MFD_TWL4030_AUDIO=3Dy
> > > CONFIG_TWL6040_CORE=3Dy
> > > CONFIG_MFD_WL1273_CORE=3Dy
> > > # CONFIG_MFD_LM3533 is not set
> > > CONFIG_MFD_TQMX86=3Dy
> > > CONFIG_MFD_VX855=3Dy
> > > CONFIG_MFD_ARIZONA=3Dm
> > > CONFIG_MFD_ARIZONA_I2C=3Dm
> > > # CONFIG_MFD_ARIZONA_SPI is not set
> > > # CONFIG_MFD_CS47L24 is not set
> > > CONFIG_MFD_WM5102=3Dy
> > > CONFIG_MFD_WM5110=3Dy
> > > # CONFIG_MFD_WM8997 is not set
> > > CONFIG_MFD_WM8998=3Dy
> > > # CONFIG_MFD_WM8400 is not set
> > > CONFIG_MFD_WM831X=3Dy
> > > # CONFIG_MFD_WM831X_I2C is not set
> > > CONFIG_MFD_WM831X_SPI=3Dy
> > > # CONFIG_MFD_WM8350_I2C is not set
> > > CONFIG_MFD_WM8994=3Dy
> > > CONFIG_MFD_ATC260X=3Dm
> > > CONFIG_MFD_ATC260X_I2C=3Dm
> > > CONFIG_RAVE_SP_CORE=3Dm
> > > # CONFIG_MFD_INTEL_M10_BMC is not set
> > > # end of Multifunction device drivers
> > > =

> > > CONFIG_REGULATOR=3Dy
> > > CONFIG_REGULATOR_DEBUG=3Dy
> > > CONFIG_REGULATOR_FIXED_VOLTAGE=3Dm
> > > # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> > > # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> > > # CONFIG_REGULATOR_88PG86X is not set
> > > CONFIG_REGULATOR_ACT8865=3Dy
> > > # CONFIG_REGULATOR_AD5398 is not set
> > > CONFIG_REGULATOR_ARIZONA_LDO1=3Dm
> > > # CONFIG_REGULATOR_ARIZONA_MICSUPP is not set
> > > CONFIG_REGULATOR_ATC260X=3Dm
> > > # CONFIG_REGULATOR_BCM590XX is not set
> > > CONFIG_REGULATOR_DA903X=3Dy
> > > # CONFIG_REGULATOR_DA9052 is not set
> > > CONFIG_REGULATOR_DA9062=3Dy
> > > CONFIG_REGULATOR_DA9210=3Dm
> > > # CONFIG_REGULATOR_DA9211 is not set
> > > CONFIG_REGULATOR_FAN53555=3Dm
> > > # CONFIG_REGULATOR_GPIO is not set
> > > CONFIG_REGULATOR_ISL9305=3Dm
> > > # CONFIG_REGULATOR_ISL6271A is not set
> > > # CONFIG_REGULATOR_LM363X is not set
> > > # CONFIG_REGULATOR_LP3971 is not set
> > > CONFIG_REGULATOR_LP3972=3Dm
> > > CONFIG_REGULATOR_LP872X=3Dm
> > > # CONFIG_REGULATOR_LP8755 is not set
> > > CONFIG_REGULATOR_LP8788=3Dy
> > > CONFIG_REGULATOR_LTC3589=3Dy
> > > # CONFIG_REGULATOR_LTC3676 is not set
> > > CONFIG_REGULATOR_MAX1586=3Dm
> > > CONFIG_REGULATOR_MAX8649=3Dy
> > > # CONFIG_REGULATOR_MAX8660 is not set
> > > CONFIG_REGULATOR_MAX8893=3Dy
> > > # CONFIG_REGULATOR_MAX8907 is not set
> > > CONFIG_REGULATOR_MAX8952=3Dy
> > > CONFIG_REGULATOR_MAX8998=3Dm
> > > CONFIG_REGULATOR_MAX20086=3Dy
> > > CONFIG_REGULATOR_MAX77826=3Dm
> > > CONFIG_REGULATOR_MC13XXX_CORE=3Dm
> > > CONFIG_REGULATOR_MC13783=3Dm
> > > CONFIG_REGULATOR_MC13892=3Dm
> > > # CONFIG_REGULATOR_MP8859 is not set
> > > # CONFIG_REGULATOR_MT6311 is not set
> > > CONFIG_REGULATOR_MT6323=3Dm
> > > # CONFIG_REGULATOR_MT6358 is not set
> > > # CONFIG_REGULATOR_MT6359 is not set
> > > CONFIG_REGULATOR_MT6397=3Dy
> > > # CONFIG_REGULATOR_PALMAS is not set
> > > # CONFIG_REGULATOR_PCA9450 is not set
> > > CONFIG_REGULATOR_PCF50633=3Dm
> > > # CONFIG_REGULATOR_PV88060 is not set
> > > CONFIG_REGULATOR_PV88080=3Dy
> > > CONFIG_REGULATOR_PV88090=3Dy
> > > CONFIG_REGULATOR_PWM=3Dy
> > > # CONFIG_REGULATOR_RC5T583 is not set
> > > CONFIG_REGULATOR_RT4801=3Dy
> > > CONFIG_REGULATOR_RT4831=3Dy
> > > CONFIG_REGULATOR_RT5190A=3Dy
> > > CONFIG_REGULATOR_RT6160=3Dm
> > > CONFIG_REGULATOR_RT6245=3Dm
> > > CONFIG_REGULATOR_RTQ2134=3Dm
> > > CONFIG_REGULATOR_RTMV20=3Dm
> > > CONFIG_REGULATOR_RTQ6752=3Dm
> > > CONFIG_REGULATOR_SKY81452=3Dm
> > > # CONFIG_REGULATOR_SLG51000 is not set
> > > # CONFIG_REGULATOR_SY7636A is not set
> > > CONFIG_REGULATOR_TPS51632=3Dm
> > > CONFIG_REGULATOR_TPS6105X=3Dm
> > > # CONFIG_REGULATOR_TPS62360 is not set
> > > # CONFIG_REGULATOR_TPS65023 is not set
> > > # CONFIG_REGULATOR_TPS6507X is not set
> > > CONFIG_REGULATOR_TPS65090=3Dy
> > > # CONFIG_REGULATOR_TPS65132 is not set
> > > CONFIG_REGULATOR_TPS6524X=3Dm
> > > # CONFIG_REGULATOR_TWL4030 is not set
> > > # CONFIG_REGULATOR_WM831X is not set
> > > # CONFIG_REGULATOR_WM8994 is not set
> > > # CONFIG_RC_CORE is not set
> > > CONFIG_CEC_CORE=3Dy
> > > CONFIG_CEC_NOTIFIER=3Dy
> > > =

> > > #
> > > # CEC support
> > > #
> > > CONFIG_MEDIA_CEC_SUPPORT=3Dy
> > > # CONFIG_CEC_CH7322 is not set
> > > # CONFIG_USB_PULSE8_CEC is not set
> > > # CONFIG_USB_RAINSHADOW_CEC is not set
> > > # end of CEC support
> > > =

> > > CONFIG_MEDIA_SUPPORT=3Dm
> > > # CONFIG_MEDIA_SUPPORT_FILTER is not set
> > > CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> > > =

> > > #
> > > # Media device types
> > > #
> > > CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> > > CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> > > CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> > > CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> > > CONFIG_MEDIA_SDR_SUPPORT=3Dy
> > > CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
> > > CONFIG_MEDIA_TEST_SUPPORT=3Dy
> > > # end of Media device types
> > > =

> > > #
> > > # Media core support
> > > #
> > > CONFIG_VIDEO_DEV=3Dm
> > > CONFIG_MEDIA_CONTROLLER=3Dy
> > > CONFIG_DVB_CORE=3Dm
> > > # end of Media core support
> > > =

> > > #
> > > # Video4Linux options
> > > #
> > > CONFIG_VIDEO_V4L2_I2C=3Dy
> > > CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> > > # CONFIG_VIDEO_ADV_DEBUG is not set
> > > # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> > > CONFIG_VIDEO_TUNER=3Dm
> > > CONFIG_V4L2_FLASH_LED_CLASS=3Dm
> > > CONFIG_V4L2_FWNODE=3Dm
> > > CONFIG_V4L2_ASYNC=3Dm
> > > CONFIG_VIDEOBUF_GEN=3Dm
> > > CONFIG_VIDEOBUF_DMA_SG=3Dm
> > > # end of Video4Linux options
> > > =

> > > #
> > > # Media controller options
> > > #
> > > CONFIG_MEDIA_CONTROLLER_DVB=3Dy
> > > # end of Media controller options
> > > =

> > > #
> > > # Digital TV options
> > > #
> > > # CONFIG_DVB_MMAP is not set
> > > # CONFIG_DVB_NET is not set
> > > CONFIG_DVB_MAX_ADAPTERS=3D16
> > > CONFIG_DVB_DYNAMIC_MINORS=3Dy
> > > # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> > > # CONFIG_DVB_ULE_DEBUG is not set
> > > # end of Digital TV options
> > > =

> > > #
> > > # Media drivers
> > > #
> > > =

> > > #
> > > # Media drivers
> > > #
> > > CONFIG_MEDIA_PCI_SUPPORT=3Dy
> > > =

> > > #
> > > # Media capture support
> > > #
> > > CONFIG_VIDEO_SOLO6X10=3Dm
> > > CONFIG_VIDEO_TW5864=3Dm
> > > CONFIG_VIDEO_TW68=3Dm
> > > CONFIG_VIDEO_TW686X=3Dm
> > > =

> > > #
> > > # Media capture/analog TV support
> > > #
> > > CONFIG_VIDEO_DT3155=3Dm
> > > CONFIG_VIDEO_HEXIUM_GEMINI=3Dm
> > > CONFIG_VIDEO_HEXIUM_ORION=3Dm
> > > CONFIG_VIDEO_MXB=3Dm
> > > =

> > > #
> > > # Media capture/analog/hybrid TV support
> > > #
> > > CONFIG_VIDEO_CX25821=3Dm
> > > # CONFIG_VIDEO_CX25821_ALSA is not set
> > > CONFIG_VIDEO_SAA7134=3Dm
> > > CONFIG_VIDEO_SAA7134_ALSA=3Dm
> > > CONFIG_VIDEO_SAA7134_DVB=3Dm
> > > CONFIG_VIDEO_SAA7164=3Dm
> > > =

> > > #
> > > # Media digital TV PCI Adapters
> > > #
> > > CONFIG_DVB_B2C2_FLEXCOP_PCI=3Dm
> > > CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG=3Dy
> > > CONFIG_DVB_DDBRIDGE=3Dm
> > > CONFIG_DVB_NETUP_UNIDVB=3Dm
> > > CONFIG_DVB_NGENE=3Dm
> > > CONFIG_DVB_PLUTO2=3Dm
> > > # CONFIG_DVB_PT1 is not set
> > > # CONFIG_DVB_PT3 is not set
> > > # CONFIG_DVB_BUDGET_CORE is not set
> > > # CONFIG_VIDEO_PCI_SKELETON is not set
> > > # CONFIG_VIDEO_IPU3_CIO2 is not set
> > > CONFIG_RADIO_ADAPTERS=3Dy
> > > CONFIG_RADIO_MAXIRADIO=3Dm
> > > # CONFIG_RADIO_SAA7706H is not set
> > > # CONFIG_RADIO_SI4713 is not set
> > > # CONFIG_RADIO_SI476X is not set
> > > CONFIG_RADIO_TEA575X=3Dm
> > > CONFIG_RADIO_TEA5764=3Dm
> > > CONFIG_RADIO_TEF6862=3Dm
> > > # CONFIG_RADIO_WL1273 is not set
> > > CONFIG_RADIO_SI470X=3Dm
> > > # CONFIG_I2C_SI470X is not set
> > > # CONFIG_MEDIA_PLATFORM_DRIVERS is not set
> > > =

> > > #
> > > # MMC/SDIO DVB adapters
> > > #
> > > CONFIG_SMS_SDIO_DRV=3Dm
> > > # CONFIG_V4L_TEST_DRIVERS is not set
> > > # CONFIG_DVB_TEST_DRIVERS is not set
> > > =

> > > #
> > > # FireWire (IEEE 1394) Adapters
> > > #
> > > CONFIG_DVB_FIREDTV=3Dm
> > > CONFIG_DVB_FIREDTV_INPUT=3Dy
> > > CONFIG_MEDIA_COMMON_OPTIONS=3Dy
> > > =

> > > #
> > > # common driver options
> > > #
> > > CONFIG_VIDEO_TVEEPROM=3Dm
> > > CONFIG_DVB_B2C2_FLEXCOP=3Dm
> > > CONFIG_DVB_B2C2_FLEXCOP_DEBUG=3Dy
> > > CONFIG_VIDEO_SAA7146=3Dm
> > > CONFIG_VIDEO_SAA7146_VV=3Dm
> > > CONFIG_SMS_SIANO_MDTV=3Dm
> > > CONFIG_VIDEOBUF2_CORE=3Dm
> > > CONFIG_VIDEOBUF2_V4L2=3Dm
> > > CONFIG_VIDEOBUF2_MEMOPS=3Dm
> > > CONFIG_VIDEOBUF2_DMA_CONTIG=3Dm
> > > CONFIG_VIDEOBUF2_VMALLOC=3Dm
> > > CONFIG_VIDEOBUF2_DMA_SG=3Dm
> > > CONFIG_VIDEOBUF2_DVB=3Dm
> > > # end of Media drivers
> > > =

> > > #
> > > # Media ancillary drivers
> > > #
> > > CONFIG_MEDIA_ATTACH=3Dy
> > > =

> > > #
> > > # Camera sensor devices
> > > #
> > > CONFIG_VIDEO_APTINA_PLL=3Dm
> > > CONFIG_VIDEO_CCS_PLL=3Dm
> > > # CONFIG_VIDEO_HI556 is not set
> > > CONFIG_VIDEO_HI846=3Dm
> > > CONFIG_VIDEO_HI847=3Dm
> > > CONFIG_VIDEO_IMX208=3Dm
> > > CONFIG_VIDEO_IMX214=3Dm
> > > CONFIG_VIDEO_IMX219=3Dm
> > > CONFIG_VIDEO_IMX258=3Dm
> > > CONFIG_VIDEO_IMX274=3Dm
> > > # CONFIG_VIDEO_IMX290 is not set
> > > # CONFIG_VIDEO_IMX319 is not set
> > > CONFIG_VIDEO_IMX355=3Dm
> > > CONFIG_VIDEO_MAX9271_LIB=3Dm
> > > CONFIG_VIDEO_MT9M001=3Dm
> > > # CONFIG_VIDEO_MT9M032 is not set
> > > CONFIG_VIDEO_MT9M111=3Dm
> > > CONFIG_VIDEO_MT9P031=3Dm
> > > CONFIG_VIDEO_MT9T001=3Dm
> > > # CONFIG_VIDEO_MT9T112 is not set
> > > # CONFIG_VIDEO_MT9V011 is not set
> > > CONFIG_VIDEO_MT9V032=3Dm
> > > CONFIG_VIDEO_MT9V111=3Dm
> > > CONFIG_VIDEO_NOON010PC30=3Dm
> > > # CONFIG_VIDEO_OG01A1B is not set
> > > CONFIG_VIDEO_OV02A10=3Dm
> > > # CONFIG_VIDEO_OV08D10 is not set
> > > CONFIG_VIDEO_OV13858=3Dm
> > > CONFIG_VIDEO_OV13B10=3Dm
> > > CONFIG_VIDEO_OV2640=3Dm
> > > CONFIG_VIDEO_OV2659=3Dm
> > > CONFIG_VIDEO_OV2680=3Dm
> > > CONFIG_VIDEO_OV2685=3Dm
> > > # CONFIG_VIDEO_OV2740 is not set
> > > CONFIG_VIDEO_OV5647=3Dm
> > > # CONFIG_VIDEO_OV5648 is not set
> > > CONFIG_VIDEO_OV5670=3Dm
> > > # CONFIG_VIDEO_OV5675 is not set
> > > CONFIG_VIDEO_OV5693=3Dm
> > > CONFIG_VIDEO_OV5695=3Dm
> > > CONFIG_VIDEO_OV6650=3Dm
> > > CONFIG_VIDEO_OV7251=3Dm
> > > CONFIG_VIDEO_OV7640=3Dm
> > > CONFIG_VIDEO_OV7670=3Dm
> > > CONFIG_VIDEO_OV772X=3Dm
> > > # CONFIG_VIDEO_OV7740 is not set
> > > # CONFIG_VIDEO_OV8856 is not set
> > > CONFIG_VIDEO_OV8865=3Dm
> > > CONFIG_VIDEO_OV9640=3Dm
> > > # CONFIG_VIDEO_OV9650 is not set
> > > # CONFIG_VIDEO_OV9734 is not set
> > > CONFIG_VIDEO_RDACM20=3Dm
> > > CONFIG_VIDEO_RDACM21=3Dm
> > > CONFIG_VIDEO_RJ54N1=3Dm
> > > # CONFIG_VIDEO_S5C73M3 is not set
> > > CONFIG_VIDEO_S5K4ECGX=3Dm
> > > CONFIG_VIDEO_S5K5BAF=3Dm
> > > CONFIG_VIDEO_S5K6A3=3Dm
> > > CONFIG_VIDEO_S5K6AA=3Dm
> > > CONFIG_VIDEO_SR030PC30=3Dm
> > > CONFIG_VIDEO_VS6624=3Dm
> > > CONFIG_VIDEO_CCS=3Dm
> > > CONFIG_VIDEO_ET8EK8=3Dm
> > > CONFIG_VIDEO_M5MOLS=3Dm
> > > # end of Camera sensor devices
> > > =

> > > #
> > > # Lens drivers
> > > #
> > > CONFIG_VIDEO_AD5820=3Dm
> > > CONFIG_VIDEO_AK7375=3Dm
> > > CONFIG_VIDEO_DW9714=3Dm
> > > CONFIG_VIDEO_DW9768=3Dm
> > > CONFIG_VIDEO_DW9807_VCM=3Dm
> > > # end of Lens drivers
> > > =

> > > #
> > > # Flash devices
> > > #
> > > CONFIG_VIDEO_ADP1653=3Dm
> > > CONFIG_VIDEO_LM3560=3Dm
> > > CONFIG_VIDEO_LM3646=3Dm
> > > # end of Flash devices
> > > =

> > > #
> > > # Audio decoders, processors and mixers
> > > #
> > > CONFIG_VIDEO_CS3308=3Dm
> > > # CONFIG_VIDEO_CS5345 is not set
> > > CONFIG_VIDEO_CS53L32A=3Dm
> > > CONFIG_VIDEO_MSP3400=3Dm
> > > # CONFIG_VIDEO_SONY_BTF_MPX is not set
> > > # CONFIG_VIDEO_TDA1997X is not set
> > > CONFIG_VIDEO_TDA7432=3Dm
> > > CONFIG_VIDEO_TDA9840=3Dm
> > > CONFIG_VIDEO_TEA6415C=3Dm
> > > CONFIG_VIDEO_TEA6420=3Dm
> > > CONFIG_VIDEO_TLV320AIC23B=3Dm
> > > CONFIG_VIDEO_TVAUDIO=3Dm
> > > CONFIG_VIDEO_UDA1342=3Dm
> > > # CONFIG_VIDEO_VP27SMPX is not set
> > > CONFIG_VIDEO_WM8739=3Dm
> > > CONFIG_VIDEO_WM8775=3Dm
> > > # end of Audio decoders, processors and mixers
> > > =

> > > #
> > > # RDS decoders
> > > #
> > > CONFIG_VIDEO_SAA6588=3Dm
> > > # end of RDS decoders
> > > =

> > > #
> > > # Video decoders
> > > #
> > > CONFIG_VIDEO_ADV7180=3Dm
> > > # CONFIG_VIDEO_ADV7183 is not set
> > > CONFIG_VIDEO_ADV7604=3Dm
> > > CONFIG_VIDEO_ADV7604_CEC=3Dy
> > > # CONFIG_VIDEO_ADV7842 is not set
> > > CONFIG_VIDEO_BT819=3Dm
> > > # CONFIG_VIDEO_BT856 is not set
> > > CONFIG_VIDEO_BT866=3Dm
> > > # CONFIG_VIDEO_KS0127 is not set
> > > CONFIG_VIDEO_ML86V7667=3Dm
> > > CONFIG_VIDEO_SAA7110=3Dm
> > > CONFIG_VIDEO_SAA711X=3Dm
> > > CONFIG_VIDEO_TC358743=3Dm
> > > # CONFIG_VIDEO_TC358743_CEC is not set
> > > # CONFIG_VIDEO_TVP514X is not set
> > > # CONFIG_VIDEO_TVP5150 is not set
> > > # CONFIG_VIDEO_TVP7002 is not set
> > > CONFIG_VIDEO_TW2804=3Dm
> > > CONFIG_VIDEO_TW9903=3Dm
> > > CONFIG_VIDEO_TW9906=3Dm
> > > # CONFIG_VIDEO_TW9910 is not set
> > > CONFIG_VIDEO_VPX3220=3Dm
> > > =

> > > #
> > > # Video and audio decoders
> > > #
> > > CONFIG_VIDEO_SAA717X=3Dm
> > > # CONFIG_VIDEO_CX25840 is not set
> > > # end of Video decoders
> > > =

> > > #
> > > # Video encoders
> > > #
> > > # CONFIG_VIDEO_AD9389B is not set
> > > CONFIG_VIDEO_ADV7170=3Dm
> > > # CONFIG_VIDEO_ADV7175 is not set
> > > CONFIG_VIDEO_ADV7343=3Dm
> > > # CONFIG_VIDEO_ADV7393 is not set
> > > CONFIG_VIDEO_ADV7511=3Dm
> > > # CONFIG_VIDEO_ADV7511_CEC is not set
> > > CONFIG_VIDEO_AK881X=3Dm
> > > CONFIG_VIDEO_SAA7127=3Dm
> > > # CONFIG_VIDEO_SAA7185 is not set
> > > CONFIG_VIDEO_THS8200=3Dm
> > > # end of Video encoders
> > > =

> > > #
> > > # Video improvement chips
> > > #
> > > CONFIG_VIDEO_UPD64031A=3Dm
> > > CONFIG_VIDEO_UPD64083=3Dm
> > > # end of Video improvement chips
> > > =

> > > #
> > > # Audio/Video compression chips
> > > #
> > > CONFIG_VIDEO_SAA6752HS=3Dm
> > > # end of Audio/Video compression chips
> > > =

> > > #
> > > # SDR tuner chips
> > > #
> > > # CONFIG_SDR_MAX2175 is not set
> > > # end of SDR tuner chips
> > > =

> > > #
> > > # Miscellaneous helper chips
> > > #
> > > CONFIG_VIDEO_I2C=3Dm
> > > # CONFIG_VIDEO_M52790 is not set
> > > CONFIG_VIDEO_ST_MIPID02=3Dm
> > > # CONFIG_VIDEO_THS7303 is not set
> > > # end of Miscellaneous helper chips
> > > =

> > > #
> > > # Media SPI Adapters
> > > #
> > > # CONFIG_CXD2880_SPI_DRV is not set
> > > CONFIG_VIDEO_GS1662=3Dm
> > > # end of Media SPI Adapters
> > > =

> > > CONFIG_MEDIA_TUNER=3Dm
> > > =

> > > #
> > > # Customize TV tuners
> > > #
> > > CONFIG_MEDIA_TUNER_E4000=3Dm
> > > # CONFIG_MEDIA_TUNER_FC0011 is not set
> > > # CONFIG_MEDIA_TUNER_FC0012 is not set
> > > # CONFIG_MEDIA_TUNER_FC0013 is not set
> > > CONFIG_MEDIA_TUNER_FC2580=3Dm
> > > CONFIG_MEDIA_TUNER_IT913X=3Dm
> > > # CONFIG_MEDIA_TUNER_M88RS6000T is not set
> > > CONFIG_MEDIA_TUNER_MAX2165=3Dm
> > > CONFIG_MEDIA_TUNER_MC44S803=3Dm
> > > CONFIG_MEDIA_TUNER_MSI001=3Dm
> > > CONFIG_MEDIA_TUNER_MT2060=3Dm
> > > CONFIG_MEDIA_TUNER_MT2063=3Dm
> > > CONFIG_MEDIA_TUNER_MT20XX=3Dm
> > > CONFIG_MEDIA_TUNER_MT2131=3Dm
> > > # CONFIG_MEDIA_TUNER_MT2266 is not set
> > > CONFIG_MEDIA_TUNER_MXL301RF=3Dm
> > > CONFIG_MEDIA_TUNER_MXL5005S=3Dm
> > > CONFIG_MEDIA_TUNER_MXL5007T=3Dm
> > > CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
> > > # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
> > > CONFIG_MEDIA_TUNER_QT1010=3Dm
> > > # CONFIG_MEDIA_TUNER_R820T is not set
> > > CONFIG_MEDIA_TUNER_SI2157=3Dm
> > > CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> > > CONFIG_MEDIA_TUNER_TDA18212=3Dm
> > > CONFIG_MEDIA_TUNER_TDA18218=3Dm
> > > CONFIG_MEDIA_TUNER_TDA18250=3Dm
> > > CONFIG_MEDIA_TUNER_TDA18271=3Dm
> > > CONFIG_MEDIA_TUNER_TDA827X=3Dm
> > > CONFIG_MEDIA_TUNER_TDA8290=3Dm
> > > CONFIG_MEDIA_TUNER_TDA9887=3Dm
> > > CONFIG_MEDIA_TUNER_TEA5761=3Dm
> > > CONFIG_MEDIA_TUNER_TEA5767=3Dm
> > > CONFIG_MEDIA_TUNER_TUA9001=3Dm
> > > CONFIG_MEDIA_TUNER_XC2028=3Dm
> > > CONFIG_MEDIA_TUNER_XC4000=3Dm
> > > CONFIG_MEDIA_TUNER_XC5000=3Dm
> > > # end of Customize TV tuners
> > > =

> > > #
> > > # Customise DVB Frontends
> > > #
> > > =

> > > #
> > > # Multistandard (satellite) frontends
> > > #
> > > CONFIG_DVB_M88DS3103=3Dm
> > > CONFIG_DVB_MXL5XX=3Dm
> > > # CONFIG_DVB_STB0899 is not set
> > > # CONFIG_DVB_STB6100 is not set
> > > CONFIG_DVB_STV090x=3Dm
> > > CONFIG_DVB_STV0910=3Dm
> > > CONFIG_DVB_STV6110x=3Dm
> > > CONFIG_DVB_STV6111=3Dm
> > > =

> > > #
> > > # Multistandard (cable + terrestrial) frontends
> > > #
> > > CONFIG_DVB_DRXK=3Dm
> > > CONFIG_DVB_MN88472=3Dm
> > > CONFIG_DVB_MN88473=3Dm
> > > CONFIG_DVB_SI2165=3Dm
> > > CONFIG_DVB_TDA18271C2DD=3Dm
> > > =

> > > #
> > > # DVB-S (satellite) frontends
> > > #
> > > CONFIG_DVB_CX24110=3Dm
> > > CONFIG_DVB_CX24116=3Dm
> > > CONFIG_DVB_CX24117=3Dm
> > > CONFIG_DVB_CX24120=3Dm
> > > CONFIG_DVB_CX24123=3Dm
> > > CONFIG_DVB_DS3000=3Dm
> > > # CONFIG_DVB_MB86A16 is not set
> > > CONFIG_DVB_MT312=3Dm
> > > CONFIG_DVB_S5H1420=3Dm
> > > # CONFIG_DVB_SI21XX is not set
> > > CONFIG_DVB_STB6000=3Dm
> > > CONFIG_DVB_STV0288=3Dm
> > > CONFIG_DVB_STV0299=3Dm
> > > CONFIG_DVB_STV0900=3Dm
> > > CONFIG_DVB_STV6110=3Dm
> > > CONFIG_DVB_TDA10071=3Dm
> > > CONFIG_DVB_TDA10086=3Dm
> > > # CONFIG_DVB_TDA8083 is not set
> > > # CONFIG_DVB_TDA8261 is not set
> > > CONFIG_DVB_TDA826X=3Dm
> > > # CONFIG_DVB_TS2020 is not set
> > > # CONFIG_DVB_TUA6100 is not set
> > > CONFIG_DVB_TUNER_CX24113=3Dm
> > > CONFIG_DVB_TUNER_ITD1000=3Dm
> > > CONFIG_DVB_VES1X93=3Dm
> > > CONFIG_DVB_ZL10036=3Dm
> > > CONFIG_DVB_ZL10039=3Dm
> > > =

> > > #
> > > # DVB-T (terrestrial) frontends
> > > #
> > > CONFIG_DVB_AF9013=3Dm
> > > CONFIG_DVB_CX22700=3Dm
> > > CONFIG_DVB_CX22702=3Dm
> > > CONFIG_DVB_CXD2820R=3Dm
> > > CONFIG_DVB_CXD2841ER=3Dm
> > > # CONFIG_DVB_DIB3000MB is not set
> > > # CONFIG_DVB_DIB3000MC is not set
> > > # CONFIG_DVB_DIB7000M is not set
> > > CONFIG_DVB_DIB7000P=3Dm
> > > # CONFIG_DVB_DIB9000 is not set
> > > CONFIG_DVB_DRXD=3Dm
> > > CONFIG_DVB_EC100=3Dm
> > > CONFIG_DVB_L64781=3Dm
> > > CONFIG_DVB_MT352=3Dm
> > > # CONFIG_DVB_NXT6000 is not set
> > > CONFIG_DVB_RTL2830=3Dm
> > > # CONFIG_DVB_RTL2832 is not set
> > > CONFIG_DVB_S5H1432=3Dm
> > > CONFIG_DVB_SI2168=3Dm
> > > # CONFIG_DVB_SP887X is not set
> > > CONFIG_DVB_STV0367=3Dm
> > > CONFIG_DVB_TDA10048=3Dm
> > > CONFIG_DVB_TDA1004X=3Dm
> > > CONFIG_DVB_ZD1301_DEMOD=3Dm
> > > CONFIG_DVB_ZL10353=3Dm
> > > CONFIG_DVB_CXD2880=3Dm
> > > =

> > > #
> > > # DVB-C (cable) frontends
> > > #
> > > CONFIG_DVB_STV0297=3Dm
> > > # CONFIG_DVB_TDA10021 is not set
> > > CONFIG_DVB_TDA10023=3Dm
> > > CONFIG_DVB_VES1820=3Dm
> > > =

> > > #
> > > # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> > > #
> > > CONFIG_DVB_AU8522=3Dm
> > > # CONFIG_DVB_AU8522_DTV is not set
> > > CONFIG_DVB_AU8522_V4L=3Dm
> > > CONFIG_DVB_BCM3510=3Dm
> > > CONFIG_DVB_LG2160=3Dm
> > > CONFIG_DVB_LGDT3305=3Dm
> > > # CONFIG_DVB_LGDT3306A is not set
> > > CONFIG_DVB_LGDT330X=3Dm
> > > # CONFIG_DVB_MXL692 is not set
> > > CONFIG_DVB_NXT200X=3Dm
> > > CONFIG_DVB_OR51132=3Dm
> > > CONFIG_DVB_OR51211=3Dm
> > > CONFIG_DVB_S5H1409=3Dm
> > > CONFIG_DVB_S5H1411=3Dm
> > > =

> > > #
> > > # ISDB-T (terrestrial) frontends
> > > #
> > > CONFIG_DVB_DIB8000=3Dm
> > > CONFIG_DVB_MB86A20S=3Dm
> > > CONFIG_DVB_S921=3Dm
> > > =

> > > #
> > > # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> > > #
> > > CONFIG_DVB_MN88443X=3Dm
> > > CONFIG_DVB_TC90522=3Dm
> > > =

> > > #
> > > # Digital terrestrial only tuners/PLL
> > > #
> > > CONFIG_DVB_PLL=3Dm
> > > # CONFIG_DVB_TUNER_DIB0070 is not set
> > > # CONFIG_DVB_TUNER_DIB0090 is not set
> > > =

> > > #
> > > # SEC control devices for DVB-S
> > > #
> > > CONFIG_DVB_A8293=3Dm
> > > CONFIG_DVB_AF9033=3Dm
> > > CONFIG_DVB_ASCOT2E=3Dm
> > > CONFIG_DVB_ATBM8830=3Dm
> > > CONFIG_DVB_HELENE=3Dm
> > > CONFIG_DVB_HORUS3A=3Dm
> > > CONFIG_DVB_ISL6405=3Dm
> > > CONFIG_DVB_ISL6421=3Dm
> > > # CONFIG_DVB_ISL6423 is not set
> > > CONFIG_DVB_IX2505V=3Dm
> > > CONFIG_DVB_LGS8GL5=3Dm
> > > CONFIG_DVB_LGS8GXX=3Dm
> > > CONFIG_DVB_LNBH25=3Dm
> > > # CONFIG_DVB_LNBH29 is not set
> > > CONFIG_DVB_LNBP21=3Dm
> > > CONFIG_DVB_LNBP22=3Dm
> > > CONFIG_DVB_M88RS2000=3Dm
> > > CONFIG_DVB_TDA665x=3Dm
> > > # CONFIG_DVB_DRX39XYJ is not set
> > > =

> > > #
> > > # Common Interface (EN50221) controller drivers
> > > #
> > > CONFIG_DVB_CXD2099=3Dm
> > > CONFIG_DVB_SP2=3Dm
> > > # end of Customise DVB Frontends
> > > =

> > > #
> > > # Tools to develop new frontends
> > > #
> > > CONFIG_DVB_DUMMY_FE=3Dm
> > > # end of Media ancillary drivers
> > > =

> > > #
> > > # Graphics support
> > > #
> > > CONFIG_AGP=3Dy
> > > # CONFIG_AGP_AMD64 is not set
> > > # CONFIG_AGP_INTEL is not set
> > > CONFIG_AGP_SIS=3Dm
> > > CONFIG_AGP_VIA=3Dy
> > > # CONFIG_VGA_SWITCHEROO is not set
> > > CONFIG_DRM=3Dy
> > > CONFIG_DRM_MIPI_DBI=3Dy
> > > CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> > > CONFIG_DRM_DEBUG_MM=3Dy
> > > # CONFIG_DRM_DEBUG_SELFTEST is not set
> > > CONFIG_DRM_DP_HELPER=3Dm
> > > CONFIG_DRM_KMS_HELPER=3Dy
> > > CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS=3Dy
> > > CONFIG_DRM_DEBUG_MODESET_LOCK=3Dy
> > > # CONFIG_DRM_FBDEV_EMULATION is not set
> > > CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> > > CONFIG_DRM_DP_CEC=3Dy
> > > CONFIG_DRM_TTM=3Dy
> > > CONFIG_DRM_VRAM_HELPER=3Dy
> > > CONFIG_DRM_TTM_HELPER=3Dy
> > > CONFIG_DRM_GEM_CMA_HELPER=3Dy
> > > CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
> > > =

> > > #
> > > # I2C encoder or helper chips
> > > #
> > > CONFIG_DRM_I2C_CH7006=3Dm
> > > CONFIG_DRM_I2C_SIL164=3Dy
> > > CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> > > CONFIG_DRM_I2C_NXP_TDA9950=3Dm
> > > # end of I2C encoder or helper chips
> > > =

> > > #
> > > # ARM devices
> > > #
> > > # end of ARM devices
> > > =

> > > # CONFIG_DRM_RADEON is not set
> > > # CONFIG_DRM_AMDGPU is not set
> > > # CONFIG_DRM_NOUVEAU is not set
> > > # CONFIG_DRM_I915 is not set
> > > CONFIG_DRM_VGEM=3Dy
> > > CONFIG_DRM_VKMS=3Dm
> > > CONFIG_DRM_VMWGFX=3Dy
> > > # CONFIG_DRM_VMWGFX_MKSSTATS is not set
> > > CONFIG_DRM_GMA500=3Dy
> > > # CONFIG_DRM_AST is not set
> > > CONFIG_DRM_MGAG200=3Dm
> > > CONFIG_DRM_QXL=3Dm
> > > CONFIG_DRM_PANEL=3Dy
> > > =

> > > #
> > > # Display Panels
> > > #
> > > CONFIG_DRM_PANEL_WIDECHIPS_WS2401=3Dm
> > > # end of Display Panels
> > > =

> > > CONFIG_DRM_BRIDGE=3Dy
> > > CONFIG_DRM_PANEL_BRIDGE=3Dy
> > > =

> > > #
> > > # Display Interface Bridges
> > > #
> > > CONFIG_DRM_ANALOGIX_ANX78XX=3Dm
> > > CONFIG_DRM_ANALOGIX_DP=3Dm
> > > # end of Display Interface Bridges
> > > =

> > > # CONFIG_DRM_ETNAVIV is not set
> > > CONFIG_DRM_BOCHS=3Dy
> > > CONFIG_DRM_CIRRUS_QEMU=3Dm
> > > CONFIG_DRM_PANEL_MIPI_DBI=3Dy
> > > CONFIG_DRM_SIMPLEDRM=3Dy
> > > CONFIG_TINYDRM_HX8357D=3Dy
> > > # CONFIG_TINYDRM_ILI9163 is not set
> > > # CONFIG_TINYDRM_ILI9225 is not set
> > > # CONFIG_TINYDRM_ILI9341 is not set
> > > CONFIG_TINYDRM_ILI9486=3Dy
> > > CONFIG_TINYDRM_MI0283QT=3Dy
> > > CONFIG_TINYDRM_REPAPER=3Dm
> > > CONFIG_TINYDRM_ST7586=3Dy
> > > CONFIG_TINYDRM_ST7735R=3Dy
> > > # CONFIG_DRM_XEN_FRONTEND is not set
> > > CONFIG_DRM_VBOXVIDEO=3Dm
> > > CONFIG_DRM_SSD130X=3Dm
> > > # CONFIG_DRM_SSD130X_I2C is not set
> > > CONFIG_DRM_LEGACY=3Dy
> > > # CONFIG_DRM_TDFX is not set
> > > # CONFIG_DRM_R128 is not set
> > > CONFIG_DRM_MGA=3Dy
> > > CONFIG_DRM_SIS=3Dm
> > > CONFIG_DRM_VIA=3Dm
> > > CONFIG_DRM_SAVAGE=3Dy
> > > CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> > > CONFIG_DRM_NOMODESET=3Dy
> > > =

> > > #
> > > # Frame buffer Devices
> > > #
> > > CONFIG_FB_CMDLINE=3Dy
> > > CONFIG_FB_NOTIFY=3Dy
> > > CONFIG_FB=3Dy
> > > # CONFIG_FIRMWARE_EDID is not set
> > > CONFIG_FB_DDC=3Dy
> > > CONFIG_FB_CFB_FILLRECT=3Dy
> > > CONFIG_FB_CFB_COPYAREA=3Dy
> > > CONFIG_FB_CFB_IMAGEBLIT=3Dy
> > > CONFIG_FB_SYS_FILLRECT=3Dy
> > > CONFIG_FB_SYS_COPYAREA=3Dy
> > > CONFIG_FB_SYS_IMAGEBLIT=3Dy
> > > CONFIG_FB_FOREIGN_ENDIAN=3Dy
> > > # CONFIG_FB_BOTH_ENDIAN is not set
> > > CONFIG_FB_BIG_ENDIAN=3Dy
> > > # CONFIG_FB_LITTLE_ENDIAN is not set
> > > CONFIG_FB_SYS_FOPS=3Dy
> > > CONFIG_FB_DEFERRED_IO=3Dy
> > > CONFIG_FB_HECUBA=3Dy
> > > CONFIG_FB_SVGALIB=3Dy
> > > CONFIG_FB_BACKLIGHT=3Dy
> > > CONFIG_FB_MODE_HELPERS=3Dy
> > > CONFIG_FB_TILEBLITTING=3Dy
> > > =

> > > #
> > > # Frame buffer hardware drivers
> > > #
> > > # CONFIG_FB_CIRRUS is not set
> > > # CONFIG_FB_PM2 is not set
> > > CONFIG_FB_CYBER2000=3Dy
> > > CONFIG_FB_CYBER2000_DDC=3Dy
> > > # CONFIG_FB_ARC is not set
> > > # CONFIG_FB_ASILIANT is not set
> > > # CONFIG_FB_IMSTT is not set
> > > # CONFIG_FB_VGA16 is not set
> > > CONFIG_FB_UVESA=3Dm
> > > # CONFIG_FB_VESA is not set
> > > CONFIG_FB_N411=3Dy
> > > CONFIG_FB_HGA=3Dy
> > > # CONFIG_FB_OPENCORES is not set
> > > CONFIG_FB_S1D13XXX=3Dy
> > > CONFIG_FB_NVIDIA=3Dy
> > > # CONFIG_FB_NVIDIA_I2C is not set
> > > # CONFIG_FB_NVIDIA_DEBUG is not set
> > > CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
> > > CONFIG_FB_RIVA=3Dm
> > > # CONFIG_FB_RIVA_I2C is not set
> > > # CONFIG_FB_RIVA_DEBUG is not set
> > > CONFIG_FB_RIVA_BACKLIGHT=3Dy
> > > CONFIG_FB_I740=3Dm
> > > # CONFIG_FB_LE80578 is not set
> > > CONFIG_FB_MATROX=3Dy
> > > CONFIG_FB_MATROX_MILLENIUM=3Dy
> > > # CONFIG_FB_MATROX_MYSTIQUE is not set
> > > # CONFIG_FB_MATROX_G is not set
> > > CONFIG_FB_MATROX_I2C=3Dm
> > > # CONFIG_FB_RADEON is not set
> > > CONFIG_FB_ATY128=3Dy
> > > # CONFIG_FB_ATY128_BACKLIGHT is not set
> > > CONFIG_FB_ATY=3Dm
> > > # CONFIG_FB_ATY_CT is not set
> > > # CONFIG_FB_ATY_GX is not set
> > > # CONFIG_FB_ATY_BACKLIGHT is not set
> > > CONFIG_FB_S3=3Dm
> > > # CONFIG_FB_S3_DDC is not set
> > > # CONFIG_FB_SAVAGE is not set
> > > CONFIG_FB_SIS=3Dm
> > > CONFIG_FB_SIS_300=3Dy
> > > # CONFIG_FB_SIS_315 is not set
> > > CONFIG_FB_VIA=3Dy
> > > CONFIG_FB_VIA_DIRECT_PROCFS=3Dy
> > > CONFIG_FB_VIA_X_COMPATIBILITY=3Dy
> > > CONFIG_FB_NEOMAGIC=3Dy
> > > CONFIG_FB_KYRO=3Dy
> > > CONFIG_FB_3DFX=3Dm
> > > # CONFIG_FB_3DFX_ACCEL is not set
> > > CONFIG_FB_3DFX_I2C=3Dy
> > > CONFIG_FB_VOODOO1=3Dm
> > > CONFIG_FB_VT8623=3Dy
> > > # CONFIG_FB_TRIDENT is not set
> > > CONFIG_FB_ARK=3Dm
> > > CONFIG_FB_PM3=3Dm
> > > CONFIG_FB_CARMINE=3Dy
> > > # CONFIG_FB_CARMINE_DRAM_EVAL is not set
> > > CONFIG_CARMINE_DRAM_CUSTOM=3Dy
> > > # CONFIG_FB_IBM_GXT4500 is not set
> > > CONFIG_FB_VIRTUAL=3Dy
> > > CONFIG_XEN_FBDEV_FRONTEND=3Dy
> > > CONFIG_FB_METRONOME=3Dy
> > > # CONFIG_FB_MB862XX is not set
> > > CONFIG_FB_SSD1307=3Dy
> > > CONFIG_FB_SM712=3Dy
> > > # end of Frame buffer Devices
> > > =

> > > #
> > > # Backlight & LCD device support
> > > #
> > > CONFIG_LCD_CLASS_DEVICE=3Dm
> > > CONFIG_LCD_L4F00242T03=3Dm
> > > CONFIG_LCD_LMS283GF05=3Dm
> > > # CONFIG_LCD_LTV350QV is not set
> > > CONFIG_LCD_ILI922X=3Dm
> > > CONFIG_LCD_ILI9320=3Dm
> > > CONFIG_LCD_TDO24M=3Dm
> > > CONFIG_LCD_VGG2432A4=3Dm
> > > CONFIG_LCD_PLATFORM=3Dm
> > > CONFIG_LCD_AMS369FG06=3Dm
> > > CONFIG_LCD_LMS501KF03=3Dm
> > > # CONFIG_LCD_HX8357 is not set
> > > CONFIG_LCD_OTM3225A=3Dm
> > > CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> > > CONFIG_BACKLIGHT_KTD253=3Dm
> > > CONFIG_BACKLIGHT_PWM=3Dm
> > > # CONFIG_BACKLIGHT_DA903X is not set
> > > # CONFIG_BACKLIGHT_DA9052 is not set
> > > # CONFIG_BACKLIGHT_APPLE is not set
> > > # CONFIG_BACKLIGHT_QCOM_WLED is not set
> > > CONFIG_BACKLIGHT_RT4831=3Dm
> > > CONFIG_BACKLIGHT_SAHARA=3Dm
> > > CONFIG_BACKLIGHT_WM831X=3Dy
> > > CONFIG_BACKLIGHT_ADP8860=3Dm
> > > # CONFIG_BACKLIGHT_ADP8870 is not set
> > > CONFIG_BACKLIGHT_PCF50633=3Dy
> > > CONFIG_BACKLIGHT_LM3630A=3Dy
> > > CONFIG_BACKLIGHT_LM3639=3Dy
> > > CONFIG_BACKLIGHT_LP855X=3Dm
> > > CONFIG_BACKLIGHT_LP8788=3Dy
> > > CONFIG_BACKLIGHT_PANDORA=3Dm
> > > CONFIG_BACKLIGHT_SKY81452=3Dy
> > > CONFIG_BACKLIGHT_GPIO=3Dm
> > > CONFIG_BACKLIGHT_LV5207LP=3Dy
> > > CONFIG_BACKLIGHT_BD6107=3Dy
> > > CONFIG_BACKLIGHT_ARCXCNN=3Dy
> > > CONFIG_BACKLIGHT_RAVE_SP=3Dm
> > > # end of Backlight & LCD device support
> > > =

> > > CONFIG_VGASTATE=3Dy
> > > CONFIG_VIDEOMODE_HELPERS=3Dy
> > > CONFIG_HDMI=3Dy
> > > CONFIG_LOGO=3Dy
> > > # CONFIG_LOGO_LINUX_MONO is not set
> > > # CONFIG_LOGO_LINUX_VGA16 is not set
> > > # CONFIG_LOGO_LINUX_CLUT224 is not set
> > > # end of Graphics support
> > > =

> > > CONFIG_SOUND=3Dy
> > > CONFIG_SND=3Dm
> > > CONFIG_SND_TIMER=3Dm
> > > CONFIG_SND_PCM=3Dm
> > > CONFIG_SND_PCM_ELD=3Dy
> > > CONFIG_SND_PCM_IEC958=3Dy
> > > CONFIG_SND_DMAENGINE_PCM=3Dm
> > > CONFIG_SND_HWDEP=3Dm
> > > CONFIG_SND_SEQ_DEVICE=3Dm
> > > CONFIG_SND_RAWMIDI=3Dm
> > > CONFIG_SND_COMPRESS_OFFLOAD=3Dm
> > > CONFIG_SND_JACK=3Dy
> > > CONFIG_SND_JACK_INPUT_DEV=3Dy
> > > # CONFIG_SND_OSSEMUL is not set
> > > # CONFIG_SND_PCM_TIMER is not set
> > > CONFIG_SND_DYNAMIC_MINORS=3Dy
> > > CONFIG_SND_MAX_CARDS=3D32
> > > CONFIG_SND_SUPPORT_OLD_API=3Dy
> > > CONFIG_SND_PROC_FS=3Dy
> > > CONFIG_SND_VERBOSE_PROCFS=3Dy
> > > # CONFIG_SND_VERBOSE_PRINTK is not set
> > > # CONFIG_SND_DEBUG is not set
> > > CONFIG_SND_VMASTER=3Dy
> > > CONFIG_SND_DMA_SGBUF=3Dy
> > > CONFIG_SND_CTL_LED=3Dm
> > > CONFIG_SND_SEQUENCER=3Dm
> > > CONFIG_SND_SEQ_DUMMY=3Dm
> > > CONFIG_SND_SEQ_MIDI_EVENT=3Dm
> > > CONFIG_SND_SEQ_MIDI=3Dm
> > > CONFIG_SND_SEQ_MIDI_EMUL=3Dm
> > > CONFIG_SND_SEQ_VIRMIDI=3Dm
> > > CONFIG_SND_MPU401_UART=3Dm
> > > CONFIG_SND_OPL3_LIB=3Dm
> > > CONFIG_SND_OPL3_LIB_SEQ=3Dm
> > > CONFIG_SND_VX_LIB=3Dm
> > > CONFIG_SND_AC97_CODEC=3Dm
> > > CONFIG_SND_DRIVERS=3Dy
> > > CONFIG_SND_DUMMY=3Dm
> > > CONFIG_SND_ALOOP=3Dm
> > > # CONFIG_SND_VIRMIDI is not set
> > > CONFIG_SND_MTPAV=3Dm
> > > # CONFIG_SND_MTS64 is not set
> > > CONFIG_SND_SERIAL_U16550=3Dm
> > > CONFIG_SND_MPU401=3Dm
> > > CONFIG_SND_PORTMAN2X4=3Dm
> > > # CONFIG_SND_AC97_POWER_SAVE is not set
> > > CONFIG_SND_PCI=3Dy
> > > CONFIG_SND_AD1889=3Dm
> > > # CONFIG_SND_ALS300 is not set
> > > # CONFIG_SND_ALS4000 is not set
> > > CONFIG_SND_ALI5451=3Dm
> > > # CONFIG_SND_ASIHPI is not set
> > > CONFIG_SND_ATIIXP=3Dm
> > > CONFIG_SND_ATIIXP_MODEM=3Dm
> > > CONFIG_SND_AU8810=3Dm
> > > CONFIG_SND_AU8820=3Dm
> > > CONFIG_SND_AU8830=3Dm
> > > # CONFIG_SND_AW2 is not set
> > > # CONFIG_SND_AZT3328 is not set
> > > CONFIG_SND_BT87X=3Dm
> > > # CONFIG_SND_BT87X_OVERCLOCK is not set
> > > CONFIG_SND_CA0106=3Dm
> > > # CONFIG_SND_CMIPCI is not set
> > > CONFIG_SND_OXYGEN_LIB=3Dm
> > > CONFIG_SND_OXYGEN=3Dm
> > > CONFIG_SND_CS4281=3Dm
> > > # CONFIG_SND_CS46XX is not set
> > > CONFIG_SND_CTXFI=3Dm
> > > CONFIG_SND_DARLA20=3Dm
> > > # CONFIG_SND_GINA20 is not set
> > > CONFIG_SND_LAYLA20=3Dm
> > > CONFIG_SND_DARLA24=3Dm
> > > # CONFIG_SND_GINA24 is not set
> > > CONFIG_SND_LAYLA24=3Dm
> > > CONFIG_SND_MONA=3Dm
> > > CONFIG_SND_MIA=3Dm
> > > CONFIG_SND_ECHO3G=3Dm
> > > CONFIG_SND_INDIGO=3Dm
> > > CONFIG_SND_INDIGOIO=3Dm
> > > # CONFIG_SND_INDIGODJ is not set
> > > # CONFIG_SND_INDIGOIOX is not set
> > > CONFIG_SND_INDIGODJX=3Dm
> > > CONFIG_SND_EMU10K1=3Dm
> > > CONFIG_SND_EMU10K1_SEQ=3Dm
> > > # CONFIG_SND_EMU10K1X is not set
> > > # CONFIG_SND_ENS1370 is not set
> > > CONFIG_SND_ENS1371=3Dm
> > > CONFIG_SND_ES1938=3Dm
> > > CONFIG_SND_ES1968=3Dm
> > > # CONFIG_SND_ES1968_INPUT is not set
> > > CONFIG_SND_ES1968_RADIO=3Dy
> > > CONFIG_SND_FM801=3Dm
> > > # CONFIG_SND_FM801_TEA575X_BOOL is not set
> > > CONFIG_SND_HDSP=3Dm
> > > # CONFIG_SND_HDSPM is not set
> > > CONFIG_SND_ICE1712=3Dm
> > > CONFIG_SND_ICE1724=3Dm
> > > CONFIG_SND_INTEL8X0=3Dm
> > > CONFIG_SND_INTEL8X0M=3Dm
> > > CONFIG_SND_KORG1212=3Dm
> > > # CONFIG_SND_LOLA is not set
> > > CONFIG_SND_LX6464ES=3Dm
> > > # CONFIG_SND_MAESTRO3 is not set
> > > # CONFIG_SND_MIXART is not set
> > > CONFIG_SND_NM256=3Dm
> > > # CONFIG_SND_PCXHR is not set
> > > CONFIG_SND_RIPTIDE=3Dm
> > > CONFIG_SND_RME32=3Dm
> > > CONFIG_SND_RME96=3Dm
> > > # CONFIG_SND_RME9652 is not set
> > > CONFIG_SND_SONICVIBES=3Dm
> > > # CONFIG_SND_TRIDENT is not set
> > > CONFIG_SND_VIA82XX=3Dm
> > > CONFIG_SND_VIA82XX_MODEM=3Dm
> > > # CONFIG_SND_VIRTUOSO is not set
> > > CONFIG_SND_VX222=3Dm
> > > CONFIG_SND_YMFPCI=3Dm
> > > =

> > > #
> > > # HD-Audio
> > > #
> > > CONFIG_SND_HDA=3Dm
> > > CONFIG_SND_HDA_GENERIC_LEDS=3Dy
> > > CONFIG_SND_HDA_INTEL=3Dm
> > > CONFIG_SND_HDA_HWDEP=3Dy
> > > CONFIG_SND_HDA_RECONFIG=3Dy
> > > # CONFIG_SND_HDA_INPUT_BEEP is not set
> > > CONFIG_SND_HDA_PATCH_LOADER=3Dy
> > > # CONFIG_SND_HDA_SCODEC_CS35L41_I2C is not set
> > > # CONFIG_SND_HDA_SCODEC_CS35L41_SPI is not set
> > > CONFIG_SND_HDA_CODEC_REALTEK=3Dm
> > > CONFIG_SND_HDA_CODEC_ANALOG=3Dm
> > > CONFIG_SND_HDA_CODEC_SIGMATEL=3Dm
> > > CONFIG_SND_HDA_CODEC_VIA=3Dm
> > > CONFIG_SND_HDA_CODEC_HDMI=3Dm
> > > CONFIG_SND_HDA_CODEC_CIRRUS=3Dm
> > > # CONFIG_SND_HDA_CODEC_CS8409 is not set
> > > CONFIG_SND_HDA_CODEC_CONEXANT=3Dm
> > > # CONFIG_SND_HDA_CODEC_CA0110 is not set
> > > CONFIG_SND_HDA_CODEC_CA0132=3Dm
> > > # CONFIG_SND_HDA_CODEC_CA0132_DSP is not set
> > > CONFIG_SND_HDA_CODEC_CMEDIA=3Dm
> > > # CONFIG_SND_HDA_CODEC_SI3054 is not set
> > > CONFIG_SND_HDA_GENERIC=3Dm
> > > CONFIG_SND_HDA_POWER_SAVE_DEFAULT=3D0
> > > # CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM is not set
> > > # end of HD-Audio
> > > =

> > > CONFIG_SND_HDA_CORE=3Dm
> > > CONFIG_SND_HDA_PREALLOC_SIZE=3D0
> > > CONFIG_SND_INTEL_NHLT=3Dy
> > > CONFIG_SND_INTEL_DSP_CONFIG=3Dm
> > > CONFIG_SND_INTEL_SOUNDWIRE_ACPI=3Dm
> > > CONFIG_SND_SPI=3Dy
> > > # CONFIG_SND_FIREWIRE is not set
> > > # CONFIG_SND_PCMCIA is not set
> > > CONFIG_SND_SOC=3Dm
> > > CONFIG_SND_SOC_AC97_BUS=3Dy
> > > CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> > > CONFIG_SND_SOC_COMPRESS=3Dy
> > > CONFIG_SND_SOC_ACPI=3Dm
> > > # CONFIG_SND_SOC_ADI is not set
> > > # CONFIG_SND_SOC_AMD_ACP is not set
> > > # CONFIG_SND_SOC_AMD_ACP3x is not set
> > > # CONFIG_SND_SOC_AMD_RENOIR is not set
> > > # CONFIG_SND_SOC_AMD_ACP5x is not set
> > > # CONFIG_SND_SOC_AMD_ACP6x is not set
> > > # CONFIG_SND_AMD_ACP_CONFIG is not set
> > > # CONFIG_SND_SOC_AMD_ACP_COMMON is not set
> > > # CONFIG_SND_ATMEL_SOC is not set
> > > CONFIG_SND_BCM63XX_I2S_WHISTLER=3Dm
> > > # CONFIG_SND_DESIGNWARE_I2S is not set
> > > =

> > > #
> > > # SoC Audio for Freescale CPUs
> > > #
> > > =

> > > #
> > > # Common SoC Audio options for Freescale CPUs:
> > > #
> > > CONFIG_SND_SOC_FSL_ASRC=3Dm
> > > CONFIG_SND_SOC_FSL_SAI=3Dm
> > > CONFIG_SND_SOC_FSL_MQS=3Dm
> > > # CONFIG_SND_SOC_FSL_AUDMIX is not set
> > > # CONFIG_SND_SOC_FSL_SSI is not set
> > > CONFIG_SND_SOC_FSL_SPDIF=3Dm
> > > CONFIG_SND_SOC_FSL_ESAI=3Dm
> > > CONFIG_SND_SOC_FSL_MICFIL=3Dm
> > > CONFIG_SND_SOC_FSL_EASRC=3Dm
> > > CONFIG_SND_SOC_FSL_XCVR=3Dm
> > > CONFIG_SND_SOC_FSL_RPMSG=3Dm
> > > CONFIG_SND_SOC_IMX_AUDMUX=3Dm
> > > # end of SoC Audio for Freescale CPUs
> > > =

> > > # CONFIG_SND_I2S_HI6210_I2S is not set
> > > # CONFIG_SND_SOC_IMG is not set
> > > CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=3Dy
> > > CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=3Dm
> > > # CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI is not set
> > > CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI=3Dm
> > > # CONFIG_SND_SOC_INTEL_SKYLAKE is not set
> > > # CONFIG_SND_SOC_INTEL_SKL is not set
> > > # CONFIG_SND_SOC_INTEL_APL is not set
> > > # CONFIG_SND_SOC_INTEL_KBL is not set
> > > # CONFIG_SND_SOC_INTEL_GLK is not set
> > > # CONFIG_SND_SOC_INTEL_CNL is not set
> > > # CONFIG_SND_SOC_INTEL_CFL is not set
> > > # CONFIG_SND_SOC_INTEL_CML_H is not set
> > > # CONFIG_SND_SOC_INTEL_CML_LP is not set
> > > CONFIG_SND_SOC_ACPI_INTEL_MATCH=3Dm
> > > # CONFIG_SND_SOC_INTEL_AVS is not set
> > > CONFIG_SND_SOC_INTEL_MACH=3Dy
> > > CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES=3Dy
> > > # CONFIG_SND_SOC_MTK_BTCVSD is not set
> > > # CONFIG_SND_SOC_SOF_TOPLEVEL is not set
> > > =

> > > #
> > > # STMicroelectronics STM32 SOC audio support
> > > #
> > > # end of STMicroelectronics STM32 SOC audio support
> > > =

> > > # CONFIG_SND_SOC_XILINX_I2S is not set
> > > CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=3Dm
> > > CONFIG_SND_SOC_XILINX_SPDIF=3Dm
> > > CONFIG_SND_SOC_XTFPGA_I2S=3Dm
> > > CONFIG_SND_SOC_I2C_AND_SPI=3Dm
> > > =

> > > #
> > > # CODEC drivers
> > > #
> > > CONFIG_SND_SOC_WM_ADSP=3Dm
> > > CONFIG_SND_SOC_AC97_CODEC=3Dm
> > > CONFIG_SND_SOC_ADAU_UTILS=3Dm
> > > CONFIG_SND_SOC_ADAU1372=3Dm
> > > CONFIG_SND_SOC_ADAU1372_I2C=3Dm
> > > # CONFIG_SND_SOC_ADAU1372_SPI is not set
> > > CONFIG_SND_SOC_ADAU1701=3Dm
> > > CONFIG_SND_SOC_ADAU17X1=3Dm
> > > CONFIG_SND_SOC_ADAU1761=3Dm
> > > # CONFIG_SND_SOC_ADAU1761_I2C is not set
> > > CONFIG_SND_SOC_ADAU1761_SPI=3Dm
> > > # CONFIG_SND_SOC_ADAU7002 is not set
> > > # CONFIG_SND_SOC_ADAU7118_HW is not set
> > > # CONFIG_SND_SOC_ADAU7118_I2C is not set
> > > CONFIG_SND_SOC_AK4104=3Dm
> > > CONFIG_SND_SOC_AK4118=3Dm
> > > CONFIG_SND_SOC_AK4375=3Dm
> > > # CONFIG_SND_SOC_AK4458 is not set
> > > CONFIG_SND_SOC_AK4554=3Dm
> > > CONFIG_SND_SOC_AK4613=3Dm
> > > CONFIG_SND_SOC_AK4642=3Dm
> > > # CONFIG_SND_SOC_AK5386 is not set
> > > # CONFIG_SND_SOC_AK5558 is not set
> > > # CONFIG_SND_SOC_ALC5623 is not set
> > > CONFIG_SND_SOC_AW8738=3Dm
> > > # CONFIG_SND_SOC_BD28623 is not set
> > > CONFIG_SND_SOC_BT_SCO=3Dm
> > > CONFIG_SND_SOC_CS35L32=3Dm
> > > CONFIG_SND_SOC_CS35L33=3Dm
> > > CONFIG_SND_SOC_CS35L34=3Dm
> > > CONFIG_SND_SOC_CS35L35=3Dm
> > > CONFIG_SND_SOC_CS35L36=3Dm
> > > CONFIG_SND_SOC_CS35L41_LIB=3Dm
> > > CONFIG_SND_SOC_CS35L41=3Dm
> > > # CONFIG_SND_SOC_CS35L41_SPI is not set
> > > CONFIG_SND_SOC_CS35L41_I2C=3Dm
> > > CONFIG_SND_SOC_CS42L42=3Dm
> > > CONFIG_SND_SOC_CS42L51=3Dm
> > > CONFIG_SND_SOC_CS42L51_I2C=3Dm
> > > # CONFIG_SND_SOC_CS42L52 is not set
> > > # CONFIG_SND_SOC_CS42L56 is not set
> > > CONFIG_SND_SOC_CS42L73=3Dm
> > > CONFIG_SND_SOC_CS4234=3Dm
> > > CONFIG_SND_SOC_CS4265=3Dm
> > > CONFIG_SND_SOC_CS4270=3Dm
> > > CONFIG_SND_SOC_CS4271=3Dm
> > > # CONFIG_SND_SOC_CS4271_I2C is not set
> > > CONFIG_SND_SOC_CS4271_SPI=3Dm
> > > # CONFIG_SND_SOC_CS42XX8_I2C is not set
> > > # CONFIG_SND_SOC_CS43130 is not set
> > > CONFIG_SND_SOC_CS4341=3Dm
> > > # CONFIG_SND_SOC_CS4349 is not set
> > > CONFIG_SND_SOC_CS53L30=3Dm
> > > # CONFIG_SND_SOC_CX2072X is not set
> > > # CONFIG_SND_SOC_DA7213 is not set
> > > CONFIG_SND_SOC_DMIC=3Dm
> > > CONFIG_SND_SOC_HDMI_CODEC=3Dm
> > > CONFIG_SND_SOC_ES7134=3Dm
> > > CONFIG_SND_SOC_ES7241=3Dm
> > > # CONFIG_SND_SOC_ES8316 is not set
> > > CONFIG_SND_SOC_ES8328=3Dm
> > > CONFIG_SND_SOC_ES8328_I2C=3Dm
> > > CONFIG_SND_SOC_ES8328_SPI=3Dm
> > > CONFIG_SND_SOC_GTM601=3Dm
> > > CONFIG_SND_SOC_ICS43432=3Dm
> > > # CONFIG_SND_SOC_INNO_RK3036 is not set
> > > CONFIG_SND_SOC_MAX98088=3Dm
> > > CONFIG_SND_SOC_MAX98357A=3Dm
> > > # CONFIG_SND_SOC_MAX98504 is not set
> > > CONFIG_SND_SOC_MAX9867=3Dm
> > > CONFIG_SND_SOC_MAX98927=3Dm
> > > # CONFIG_SND_SOC_MAX98520 is not set
> > > CONFIG_SND_SOC_MAX98373=3Dm
> > > CONFIG_SND_SOC_MAX98373_I2C=3Dm
> > > # CONFIG_SND_SOC_MAX98390 is not set
> > > CONFIG_SND_SOC_MAX9860=3Dm
> > > # CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
> > > # CONFIG_SND_SOC_PCM1681 is not set
> > > CONFIG_SND_SOC_PCM1789=3Dm
> > > CONFIG_SND_SOC_PCM1789_I2C=3Dm
> > > CONFIG_SND_SOC_PCM179X=3Dm
> > > # CONFIG_SND_SOC_PCM179X_I2C is not set
> > > CONFIG_SND_SOC_PCM179X_SPI=3Dm
> > > # CONFIG_SND_SOC_PCM186X_I2C is not set
> > > # CONFIG_SND_SOC_PCM186X_SPI is not set
> > > CONFIG_SND_SOC_PCM3060=3Dm
> > > # CONFIG_SND_SOC_PCM3060_I2C is not set
> > > CONFIG_SND_SOC_PCM3060_SPI=3Dm
> > > CONFIG_SND_SOC_PCM3168A=3Dm
> > > # CONFIG_SND_SOC_PCM3168A_I2C is not set
> > > CONFIG_SND_SOC_PCM3168A_SPI=3Dm
> > > CONFIG_SND_SOC_PCM5102A=3Dm
> > > CONFIG_SND_SOC_PCM512x=3Dm
> > > CONFIG_SND_SOC_PCM512x_I2C=3Dm
> > > CONFIG_SND_SOC_PCM512x_SPI=3Dm
> > > CONFIG_SND_SOC_RK3328=3Dm
> > > CONFIG_SND_SOC_RL6231=3Dm
> > > CONFIG_SND_SOC_RT5616=3Dm
> > > CONFIG_SND_SOC_RT5631=3Dm
> > > CONFIG_SND_SOC_RT5640=3Dm
> > > # CONFIG_SND_SOC_RT5659 is not set
> > > CONFIG_SND_SOC_RT9120=3Dm
> > > # CONFIG_SND_SOC_SGTL5000 is not set
> > > CONFIG_SND_SOC_SIGMADSP=3Dm
> > > CONFIG_SND_SOC_SIGMADSP_I2C=3Dm
> > > CONFIG_SND_SOC_SIGMADSP_REGMAP=3Dm
> > > CONFIG_SND_SOC_SIMPLE_AMPLIFIER=3Dm
> > > CONFIG_SND_SOC_SIMPLE_MUX=3Dm
> > > # CONFIG_SND_SOC_SPDIF is not set
> > > CONFIG_SND_SOC_SSM2305=3Dm
> > > # CONFIG_SND_SOC_SSM2518 is not set
> > > CONFIG_SND_SOC_SSM2602=3Dm
> > > CONFIG_SND_SOC_SSM2602_SPI=3Dm
> > > CONFIG_SND_SOC_SSM2602_I2C=3Dm
> > > CONFIG_SND_SOC_SSM4567=3Dm
> > > # CONFIG_SND_SOC_STA32X is not set
> > > CONFIG_SND_SOC_STA350=3Dm
> > > CONFIG_SND_SOC_STI_SAS=3Dm
> > > # CONFIG_SND_SOC_TAS2552 is not set
> > > CONFIG_SND_SOC_TAS2562=3Dm
> > > # CONFIG_SND_SOC_TAS2764 is not set
> > > CONFIG_SND_SOC_TAS2770=3Dm
> > > # CONFIG_SND_SOC_TAS5086 is not set
> > > CONFIG_SND_SOC_TAS571X=3Dm
> > > CONFIG_SND_SOC_TAS5720=3Dm
> > > CONFIG_SND_SOC_TAS5805M=3Dm
> > > # CONFIG_SND_SOC_TAS6424 is not set
> > > CONFIG_SND_SOC_TDA7419=3Dm
> > > CONFIG_SND_SOC_TFA9879=3Dm
> > > CONFIG_SND_SOC_TFA989X=3Dm
> > > CONFIG_SND_SOC_TLV320ADC3XXX=3Dm
> > > CONFIG_SND_SOC_TLV320AIC23=3Dm
> > > CONFIG_SND_SOC_TLV320AIC23_I2C=3Dm
> > > CONFIG_SND_SOC_TLV320AIC23_SPI=3Dm
> > > CONFIG_SND_SOC_TLV320AIC31XX=3Dm
> > > CONFIG_SND_SOC_TLV320AIC32X4=3Dm
> > > # CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
> > > CONFIG_SND_SOC_TLV320AIC32X4_SPI=3Dm
> > > CONFIG_SND_SOC_TLV320AIC3X=3Dm
> > > # CONFIG_SND_SOC_TLV320AIC3X_I2C is not set
> > > CONFIG_SND_SOC_TLV320AIC3X_SPI=3Dm
> > > # CONFIG_SND_SOC_TLV320ADCX140 is not set
> > > CONFIG_SND_SOC_TS3A227E=3Dm
> > > # CONFIG_SND_SOC_TSCS42XX is not set
> > > CONFIG_SND_SOC_TSCS454=3Dm
> > > CONFIG_SND_SOC_UDA1334=3Dm
> > > # CONFIG_SND_SOC_WM8510 is not set
> > > # CONFIG_SND_SOC_WM8523 is not set
> > > CONFIG_SND_SOC_WM8524=3Dm
> > > CONFIG_SND_SOC_WM8580=3Dm
> > > CONFIG_SND_SOC_WM8711=3Dm
> > > CONFIG_SND_SOC_WM8728=3Dm
> > > CONFIG_SND_SOC_WM8731=3Dm
> > > CONFIG_SND_SOC_WM8737=3Dm
> > > CONFIG_SND_SOC_WM8741=3Dm
> > > CONFIG_SND_SOC_WM8750=3Dm
> > > # CONFIG_SND_SOC_WM8753 is not set
> > > CONFIG_SND_SOC_WM8770=3Dm
> > > CONFIG_SND_SOC_WM8776=3Dm
> > > CONFIG_SND_SOC_WM8782=3Dm
> > > CONFIG_SND_SOC_WM8804=3Dm
> > > # CONFIG_SND_SOC_WM8804_I2C is not set
> > > CONFIG_SND_SOC_WM8804_SPI=3Dm
> > > CONFIG_SND_SOC_WM8903=3Dm
> > > CONFIG_SND_SOC_WM8904=3Dm
> > > # CONFIG_SND_SOC_WM8960 is not set
> > > # CONFIG_SND_SOC_WM8962 is not set
> > > CONFIG_SND_SOC_WM8974=3Dm
> > > CONFIG_SND_SOC_WM8978=3Dm
> > > CONFIG_SND_SOC_WM8985=3Dm
> > > # CONFIG_SND_SOC_ZL38060 is not set
> > > CONFIG_SND_SOC_MAX9759=3Dm
> > > # CONFIG_SND_SOC_MT6351 is not set
> > > CONFIG_SND_SOC_MT6358=3Dm
> > > CONFIG_SND_SOC_MT6660=3Dm
> > > CONFIG_SND_SOC_NAU8315=3Dm
> > > # CONFIG_SND_SOC_NAU8540 is not set
> > > CONFIG_SND_SOC_NAU8810=3Dm
> > > CONFIG_SND_SOC_NAU8821=3Dm
> > > CONFIG_SND_SOC_NAU8822=3Dm
> > > CONFIG_SND_SOC_NAU8824=3Dm
> > > # CONFIG_SND_SOC_TPA6130A2 is not set
> > > CONFIG_SND_SOC_LPASS_MACRO_COMMON=3Dm
> > > # CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
> > > # CONFIG_SND_SOC_LPASS_VA_MACRO is not set
> > > CONFIG_SND_SOC_LPASS_RX_MACRO=3Dm
> > > # CONFIG_SND_SOC_LPASS_TX_MACRO is not set
> > > # end of CODEC drivers
> > > =

> > > CONFIG_SND_SIMPLE_CARD_UTILS=3Dm
> > > CONFIG_SND_SIMPLE_CARD=3Dm
> > > CONFIG_SND_X86=3Dy
> > > CONFIG_SND_SYNTH_EMUX=3Dm
> > > CONFIG_SND_XEN_FRONTEND=3Dm
> > > # CONFIG_SND_VIRTIO is not set
> > > CONFIG_AC97_BUS=3Dm
> > > =

> > > #
> > > # HID support
> > > #
> > > CONFIG_HID=3Dy
> > > # CONFIG_HID_BATTERY_STRENGTH is not set
> > > # CONFIG_HIDRAW is not set
> > > # CONFIG_UHID is not set
> > > CONFIG_HID_GENERIC=3Dy
> > > =

> > > #
> > > # Special HID drivers
> > > #
> > > # CONFIG_HID_A4TECH is not set
> > > # CONFIG_HID_ACRUX is not set
> > > # CONFIG_HID_APPLE is not set
> > > # CONFIG_HID_AUREAL is not set
> > > # CONFIG_HID_BELKIN is not set
> > > # CONFIG_HID_CHERRY is not set
> > > # CONFIG_HID_COUGAR is not set
> > > # CONFIG_HID_MACALLY is not set
> > > # CONFIG_HID_CMEDIA is not set
> > > # CONFIG_HID_CYPRESS is not set
> > > # CONFIG_HID_DRAGONRISE is not set
> > > # CONFIG_HID_EMS_FF is not set
> > > # CONFIG_HID_ELECOM is not set
> > > # CONFIG_HID_EZKEY is not set
> > > # CONFIG_HID_GEMBIRD is not set
> > > # CONFIG_HID_GFRM is not set
> > > # CONFIG_HID_GLORIOUS is not set
> > > # CONFIG_HID_VIVALDI is not set
> > > # CONFIG_HID_KEYTOUCH is not set
> > > # CONFIG_HID_KYE is not set
> > > # CONFIG_HID_WALTOP is not set
> > > # CONFIG_HID_VIEWSONIC is not set
> > > # CONFIG_HID_XIAOMI is not set
> > > # CONFIG_HID_GYRATION is not set
> > > # CONFIG_HID_ICADE is not set
> > > # CONFIG_HID_ITE is not set
> > > # CONFIG_HID_JABRA is not set
> > > # CONFIG_HID_TWINHAN is not set
> > > # CONFIG_HID_KENSINGTON is not set
> > > # CONFIG_HID_LCPOWER is not set
> > > # CONFIG_HID_LED is not set
> > > # CONFIG_HID_LENOVO is not set
> > > # CONFIG_HID_MAGICMOUSE is not set
> > > # CONFIG_HID_MALTRON is not set
> > > # CONFIG_HID_MAYFLASH is not set
> > > # CONFIG_HID_REDRAGON is not set
> > > # CONFIG_HID_MICROSOFT is not set
> > > # CONFIG_HID_MONTEREY is not set
> > > # CONFIG_HID_MULTITOUCH is not set
> > > # CONFIG_HID_NINTENDO is not set
> > > # CONFIG_HID_NTI is not set
> > > # CONFIG_HID_ORTEK is not set
> > > # CONFIG_HID_PANTHERLORD is not set
> > > # CONFIG_HID_PETALYNX is not set
> > > # CONFIG_HID_PICOLCD is not set
> > > # CONFIG_HID_PLANTRONICS is not set
> > > # CONFIG_HID_RAZER is not set
> > > # CONFIG_HID_PRIMAX is not set
> > > # CONFIG_HID_SAITEK is not set
> > > # CONFIG_HID_SEMITEK is not set
> > > # CONFIG_HID_SPEEDLINK is not set
> > > # CONFIG_HID_STEAM is not set
> > > # CONFIG_HID_STEELSERIES is not set
> > > # CONFIG_HID_SUNPLUS is not set
> > > # CONFIG_HID_RMI is not set
> > > # CONFIG_HID_GREENASIA is not set
> > > # CONFIG_HID_SMARTJOYPLUS is not set
> > > # CONFIG_HID_TIVO is not set
> > > # CONFIG_HID_TOPSEED is not set
> > > # CONFIG_HID_THINGM is not set
> > > # CONFIG_HID_UDRAW_PS3 is not set
> > > # CONFIG_HID_WIIMOTE is not set
> > > # CONFIG_HID_XINMO is not set
> > > # CONFIG_HID_ZEROPLUS is not set
> > > # CONFIG_HID_ZYDACRON is not set
> > > # CONFIG_HID_SENSOR_HUB is not set
> > > # CONFIG_HID_ALPS is not set
> > > # end of Special HID drivers
> > > =

> > > #
> > > # I2C HID support
> > > #
> > > # CONFIG_I2C_HID_ACPI is not set
> > > # end of I2C HID support
> > > =

> > > #
> > > # Intel ISH HID support
> > > #
> > > # CONFIG_INTEL_ISH_HID is not set
> > > # end of Intel ISH HID support
> > > =

> > > #
> > > # AMD SFH HID Support
> > > #
> > > # CONFIG_AMD_SFH_HID is not set
> > > # end of AMD SFH HID Support
> > > # end of HID support
> > > =

> > > CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> > > CONFIG_USB_SUPPORT=3Dy
> > > # CONFIG_USB_ULPI_BUS is not set
> > > # CONFIG_USB_CONN_GPIO is not set
> > > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > > # CONFIG_USB is not set
> > > CONFIG_USB_PCI=3Dy
> > > =

> > > #
> > > # USB port drivers
> > > #
> > > =

> > > #
> > > # USB Physical Layer drivers
> > > #
> > > # CONFIG_NOP_USB_XCEIV is not set
> > > # CONFIG_USB_GPIO_VBUS is not set
> > > # CONFIG_TAHVO_USB is not set
> > > # end of USB Physical Layer drivers
> > > =

> > > # CONFIG_USB_GADGET is not set
> > > # CONFIG_TYPEC is not set
> > > # CONFIG_USB_ROLE_SWITCH is not set
> > > CONFIG_MMC=3Dy
> > > CONFIG_MMC_BLOCK=3Dm
> > > CONFIG_MMC_BLOCK_MINORS=3D8
> > > # CONFIG_SDIO_UART is not set
> > > # CONFIG_MMC_TEST is not set
> > > =

> > > #
> > > # MMC/SD/SDIO Host Controller Drivers
> > > #
> > > # CONFIG_MMC_DEBUG is not set
> > > CONFIG_MMC_SDHCI=3Dy
> > > CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> > > CONFIG_MMC_SDHCI_PCI=3Dm
> > > # CONFIG_MMC_RICOH_MMC is not set
> > > # CONFIG_MMC_SDHCI_ACPI is not set
> > > CONFIG_MMC_SDHCI_PLTFM=3Dm
> > > # CONFIG_MMC_SDHCI_F_SDH30 is not set
> > > CONFIG_MMC_WBSD=3Dy
> > > CONFIG_MMC_ALCOR=3Dm
> > > CONFIG_MMC_TIFM_SD=3Dy
> > > # CONFIG_MMC_SPI is not set
> > > CONFIG_MMC_SDRICOH_CS=3Dm
> > > CONFIG_MMC_CB710=3Dm
> > > CONFIG_MMC_VIA_SDMMC=3Dm
> > > # CONFIG_MMC_USDHI6ROL0 is not set
> > > CONFIG_MMC_CQHCI=3Dm
> > > CONFIG_MMC_HSQ=3Dm
> > > CONFIG_MMC_TOSHIBA_PCI=3Dy
> > > CONFIG_MMC_MTK=3Dm
> > > CONFIG_MMC_SDHCI_XENON=3Dm
> > > CONFIG_MEMSTICK=3Dy
> > > CONFIG_MEMSTICK_DEBUG=3Dy
> > > =

> > > #
> > > # MemoryStick drivers
> > > #
> > > CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> > > CONFIG_MSPRO_BLOCK=3Dy
> > > # CONFIG_MS_BLOCK is not set
> > > =

> > > #
> > > # MemoryStick Host Controller Drivers
> > > #
> > > CONFIG_MEMSTICK_TIFM_MS=3Dm
> > > CONFIG_MEMSTICK_JMICRON_38X=3Dm
> > > CONFIG_MEMSTICK_R592=3Dm
> > > CONFIG_NEW_LEDS=3Dy
> > > CONFIG_LEDS_CLASS=3Dy
> > > CONFIG_LEDS_CLASS_FLASH=3Dy
> > > # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> > > CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> > > =

> > > #
> > > # LED drivers
> > > #
> > > CONFIG_LEDS_LM3530=3Dm
> > > # CONFIG_LEDS_LM3532 is not set
> > > # CONFIG_LEDS_LM3642 is not set
> > > CONFIG_LEDS_MT6323=3Dm
> > > # CONFIG_LEDS_PCA9532 is not set
> > > CONFIG_LEDS_GPIO=3Dm
> > > # CONFIG_LEDS_LP3944 is not set
> > > CONFIG_LEDS_LP3952=3Dm
> > > CONFIG_LEDS_LP50XX=3Dy
> > > CONFIG_LEDS_LP8788=3Dm
> > > # CONFIG_LEDS_PCA955X is not set
> > > # CONFIG_LEDS_PCA963X is not set
> > > CONFIG_LEDS_WM831X_STATUS=3Dy
> > > # CONFIG_LEDS_DA903X is not set
> > > # CONFIG_LEDS_DA9052 is not set
> > > # CONFIG_LEDS_DAC124S085 is not set
> > > # CONFIG_LEDS_PWM is not set
> > > CONFIG_LEDS_REGULATOR=3Dy
> > > # CONFIG_LEDS_BD2802 is not set
> > > CONFIG_LEDS_LT3593=3Dm
> > > # CONFIG_LEDS_MC13783 is not set
> > > CONFIG_LEDS_TCA6507=3Dm
> > > # CONFIG_LEDS_TLC591XX is not set
> > > CONFIG_LEDS_LM355x=3Dm
> > > # CONFIG_LEDS_MENF21BMC is not set
> > > =

> > > #
> > > # LED driver for blink(1) USB RGB LED is under Special HID drivers (H=
ID_THINGM)
> > > #
> > > CONFIG_LEDS_BLINKM=3Dm
> > > CONFIG_LEDS_MLXREG=3Dm
> > > CONFIG_LEDS_USER=3Dm
> > > # CONFIG_LEDS_NIC78BX is not set
> > > CONFIG_LEDS_TI_LMU_COMMON=3Dy
> > > CONFIG_LEDS_LM36274=3Dy
> > > # CONFIG_LEDS_TPS6105X is not set
> > > =

> > > #
> > > # Flash and Torch LED drivers
> > > #
> > > # CONFIG_LEDS_AS3645A is not set
> > > # CONFIG_LEDS_LM3601X is not set
> > > # CONFIG_LEDS_RT8515 is not set
> > > CONFIG_LEDS_SGM3140=3Dm
> > > =

> > > #
> > > # LED Triggers
> > > #
> > > CONFIG_LEDS_TRIGGERS=3Dy
> > > # CONFIG_LEDS_TRIGGER_TIMER is not set
> > > CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> > > CONFIG_LEDS_TRIGGER_DISK=3Dy
> > > # CONFIG_LEDS_TRIGGER_MTD is not set
> > > # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
> > > CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> > > CONFIG_LEDS_TRIGGER_CPU=3Dy
> > > # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> > > # CONFIG_LEDS_TRIGGER_GPIO is not set
> > > CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> > > =

> > > #
> > > # iptables trigger is under Netfilter config (LED target)
> > > #
> > > CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> > > CONFIG_LEDS_TRIGGER_CAMERA=3Dm
> > > # CONFIG_LEDS_TRIGGER_PANIC is not set
> > > CONFIG_LEDS_TRIGGER_NETDEV=3Dy
> > > CONFIG_LEDS_TRIGGER_PATTERN=3Dy
> > > CONFIG_LEDS_TRIGGER_AUDIO=3Dm
> > > # CONFIG_LEDS_TRIGGER_TTY is not set
> > > =

> > > #
> > > # Simple LED drivers
> > > #
> > > # CONFIG_ACCESSIBILITY is not set
> > > CONFIG_INFINIBAND=3Dm
> > > # CONFIG_INFINIBAND_USER_MAD is not set
> > > # CONFIG_INFINIBAND_USER_ACCESS is not set
> > > CONFIG_INFINIBAND_ADDR_TRANS=3Dy
> > > CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=3Dy
> > > CONFIG_INFINIBAND_VIRT_DMA=3Dy
> > > CONFIG_INFINIBAND_MTHCA=3Dm
> > > # CONFIG_INFINIBAND_MTHCA_DEBUG is not set
> > > CONFIG_INFINIBAND_CXGB4=3Dm
> > > CONFIG_MLX4_INFINIBAND=3Dm
> > > CONFIG_MLX5_INFINIBAND=3Dm
> > > CONFIG_INFINIBAND_OCRDMA=3Dm
> > > # CONFIG_INFINIBAND_BNXT_RE is not set
> > > # CONFIG_INFINIBAND_RDMAVT is not set
> > > CONFIG_RDMA_RXE=3Dm
> > > CONFIG_RDMA_SIW=3Dm
> > > # CONFIG_INFINIBAND_IPOIB is not set
> > > # CONFIG_INFINIBAND_SRP is not set
> > > CONFIG_INFINIBAND_SRPT=3Dm
> > > CONFIG_INFINIBAND_ISER=3Dm
> > > CONFIG_INFINIBAND_ISERT=3Dm
> > > CONFIG_INFINIBAND_RTRS=3Dm
> > > CONFIG_INFINIBAND_RTRS_CLIENT=3Dm
> > > CONFIG_INFINIBAND_RTRS_SERVER=3Dm
> > > # CONFIG_INFINIBAND_OPA_VNIC is not set
> > > CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> > > CONFIG_EDAC_SUPPORT=3Dy
> > > CONFIG_EDAC=3Dm
> > > CONFIG_EDAC_LEGACY_SYSFS=3Dy
> > > CONFIG_EDAC_DEBUG=3Dy
> > > CONFIG_EDAC_E752X=3Dm
> > > CONFIG_EDAC_I82975X=3Dm
> > > CONFIG_EDAC_I3000=3Dm
> > > # CONFIG_EDAC_I3200 is not set
> > > CONFIG_EDAC_IE31200=3Dm
> > > CONFIG_EDAC_X38=3Dm
> > > # CONFIG_EDAC_I5400 is not set
> > > # CONFIG_EDAC_I5000 is not set
> > > CONFIG_EDAC_I5100=3Dm
> > > # CONFIG_EDAC_I7300 is not set
> > > CONFIG_RTC_LIB=3Dy
> > > CONFIG_RTC_MC146818_LIB=3Dy
> > > CONFIG_RTC_CLASS=3Dy
> > > CONFIG_RTC_HCTOSYS=3Dy
> > > CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> > > CONFIG_RTC_SYSTOHC=3Dy
> > > CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
> > > CONFIG_RTC_DEBUG=3Dy
> > > CONFIG_RTC_NVMEM=3Dy
> > > =

> > > #
> > > # RTC interfaces
> > > #
> > > CONFIG_RTC_INTF_SYSFS=3Dy
> > > # CONFIG_RTC_INTF_PROC is not set
> > > CONFIG_RTC_INTF_DEV=3Dy
> > > CONFIG_RTC_INTF_DEV_UIE_EMUL=3Dy
> > > # CONFIG_RTC_DRV_TEST is not set
> > > =

> > > #
> > > # I2C RTC drivers
> > > #
> > > # CONFIG_RTC_DRV_ABB5ZES3 is not set
> > > CONFIG_RTC_DRV_ABEOZ9=3Dy
> > > CONFIG_RTC_DRV_ABX80X=3Dy
> > > CONFIG_RTC_DRV_DS1307=3Dm
> > > # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> > > # CONFIG_RTC_DRV_DS1374 is not set
> > > CONFIG_RTC_DRV_DS1672=3Dm
> > > CONFIG_RTC_DRV_LP8788=3Dy
> > > # CONFIG_RTC_DRV_MAX6900 is not set
> > > CONFIG_RTC_DRV_MAX8907=3Dm
> > > CONFIG_RTC_DRV_MAX8998=3Dm
> > > # CONFIG_RTC_DRV_RS5C372 is not set
> > > CONFIG_RTC_DRV_ISL1208=3Dm
> > > CONFIG_RTC_DRV_ISL12022=3Dy
> > > CONFIG_RTC_DRV_X1205=3Dm
> > > CONFIG_RTC_DRV_PCF8523=3Dy
> > > # CONFIG_RTC_DRV_PCF85063 is not set
> > > CONFIG_RTC_DRV_PCF85363=3Dm
> > > # CONFIG_RTC_DRV_PCF8563 is not set
> > > # CONFIG_RTC_DRV_PCF8583 is not set
> > > CONFIG_RTC_DRV_M41T80=3Dy
> > > # CONFIG_RTC_DRV_M41T80_WDT is not set
> > > CONFIG_RTC_DRV_BQ32K=3Dy
> > > CONFIG_RTC_DRV_PALMAS=3Dm
> > > CONFIG_RTC_DRV_RC5T583=3Dm
> > > # CONFIG_RTC_DRV_S35390A is not set
> > > CONFIG_RTC_DRV_FM3130=3Dy
> > > # CONFIG_RTC_DRV_RX8010 is not set
> > > # CONFIG_RTC_DRV_RX8581 is not set
> > > # CONFIG_RTC_DRV_RX8025 is not set
> > > CONFIG_RTC_DRV_EM3027=3Dm
> > > CONFIG_RTC_DRV_RV3028=3Dm
> > > # CONFIG_RTC_DRV_RV3032 is not set
> > > # CONFIG_RTC_DRV_RV8803 is not set
> > > CONFIG_RTC_DRV_SD3078=3Dy
> > > =

> > > #
> > > # SPI RTC drivers
> > > #
> > > CONFIG_RTC_DRV_M41T93=3Dm
> > > CONFIG_RTC_DRV_M41T94=3Dy
> > > CONFIG_RTC_DRV_DS1302=3Dm
> > > # CONFIG_RTC_DRV_DS1305 is not set
> > > CONFIG_RTC_DRV_DS1343=3Dm
> > > CONFIG_RTC_DRV_DS1347=3Dy
> > > CONFIG_RTC_DRV_DS1390=3Dm
> > > CONFIG_RTC_DRV_MAX6916=3Dm
> > > CONFIG_RTC_DRV_R9701=3Dy
> > > # CONFIG_RTC_DRV_RX4581 is not set
> > > CONFIG_RTC_DRV_RS5C348=3Dm
> > > CONFIG_RTC_DRV_MAX6902=3Dy
> > > CONFIG_RTC_DRV_PCF2123=3Dm
> > > # CONFIG_RTC_DRV_MCP795 is not set
> > > CONFIG_RTC_I2C_AND_SPI=3Dy
> > > =

> > > #
> > > # SPI and I2C RTC drivers
> > > #
> > > CONFIG_RTC_DRV_DS3232=3Dy
> > > CONFIG_RTC_DRV_DS3232_HWMON=3Dy
> > > # CONFIG_RTC_DRV_PCF2127 is not set
> > > CONFIG_RTC_DRV_RV3029C2=3Dm
> > > # CONFIG_RTC_DRV_RV3029_HWMON is not set
> > > CONFIG_RTC_DRV_RX6110=3Dm
> > > =

> > > #
> > > # Platform RTC drivers
> > > #
> > > CONFIG_RTC_DRV_CMOS=3Dy
> > > CONFIG_RTC_DRV_DS1286=3Dm
> > > # CONFIG_RTC_DRV_DS1511 is not set
> > > CONFIG_RTC_DRV_DS1553=3Dy
> > > CONFIG_RTC_DRV_DS1685_FAMILY=3Dm
> > > # CONFIG_RTC_DRV_DS1685 is not set
> > > CONFIG_RTC_DRV_DS1689=3Dy
> > > # CONFIG_RTC_DRV_DS17285 is not set
> > > # CONFIG_RTC_DRV_DS17485 is not set
> > > # CONFIG_RTC_DRV_DS17885 is not set
> > > CONFIG_RTC_DRV_DS1742=3Dm
> > > CONFIG_RTC_DRV_DS2404=3Dm
> > > CONFIG_RTC_DRV_DA9052=3Dy
> > > # CONFIG_RTC_DRV_DA9063 is not set
> > > # CONFIG_RTC_DRV_STK17TA8 is not set
> > > CONFIG_RTC_DRV_M48T86=3Dy
> > > # CONFIG_RTC_DRV_M48T35 is not set
> > > CONFIG_RTC_DRV_M48T59=3Dm
> > > CONFIG_RTC_DRV_MSM6242=3Dm
> > > CONFIG_RTC_DRV_BQ4802=3Dm
> > > # CONFIG_RTC_DRV_RP5C01 is not set
> > > # CONFIG_RTC_DRV_V3020 is not set
> > > CONFIG_RTC_DRV_WM831X=3Dm
> > > # CONFIG_RTC_DRV_PCF50633 is not set
> > > =

> > > #
> > > # on-CPU RTC drivers
> > > #
> > > # CONFIG_RTC_DRV_FTRTC010 is not set
> > > CONFIG_RTC_DRV_MC13XXX=3Dm
> > > CONFIG_RTC_DRV_MT6397=3Dy
> > > =

> > > #
> > > # HID Sensor RTC drivers
> > > #
> > > CONFIG_RTC_DRV_GOLDFISH=3Dm
> > > # CONFIG_DMADEVICES is not set
> > > =

> > > #
> > > # DMABUF options
> > > #
> > > CONFIG_SYNC_FILE=3Dy
> > > # CONFIG_SW_SYNC is not set
> > > # CONFIG_UDMABUF is not set
> > > CONFIG_DMABUF_MOVE_NOTIFY=3Dy
> > > CONFIG_DMABUF_DEBUG=3Dy
> > > # CONFIG_DMABUF_SELFTESTS is not set
> > > # CONFIG_DMABUF_HEAPS is not set
> > > CONFIG_DMABUF_SYSFS_STATS=3Dy
> > > # end of DMABUF options
> > > =

> > > CONFIG_AUXDISPLAY=3Dy
> > > CONFIG_CHARLCD=3Dy
> > > CONFIG_LINEDISP=3Dy
> > > # CONFIG_HD44780 is not set
> > > CONFIG_KS0108=3Dm
> > > CONFIG_KS0108_PORT=3D0x378
> > > CONFIG_KS0108_DELAY=3D2
> > > CONFIG_CFAG12864B=3Dm
> > > CONFIG_CFAG12864B_RATE=3D20
> > > CONFIG_IMG_ASCII_LCD=3Dy
> > > # CONFIG_HT16K33 is not set
> > > CONFIG_LCD2S=3Dy
> > > # CONFIG_PARPORT_PANEL is not set
> > > # CONFIG_PANEL_CHANGE_MESSAGE is not set
> > > # CONFIG_CHARLCD_BL_OFF is not set
> > > # CONFIG_CHARLCD_BL_ON is not set
> > > CONFIG_CHARLCD_BL_FLASH=3Dy
> > > # CONFIG_PANEL is not set
> > > CONFIG_UIO=3Dy
> > > CONFIG_UIO_CIF=3Dy
> > > CONFIG_UIO_PDRV_GENIRQ=3Dm
> > > # CONFIG_UIO_DMEM_GENIRQ is not set
> > > # CONFIG_UIO_AEC is not set
> > > # CONFIG_UIO_SERCOS3 is not set
> > > CONFIG_UIO_PCI_GENERIC=3Dy
> > > CONFIG_UIO_NETX=3Dy
> > > CONFIG_UIO_PRUSS=3Dm
> > > CONFIG_UIO_MF624=3Dm
> > > CONFIG_VFIO=3Dm
> > > CONFIG_VFIO_IOMMU_TYPE1=3Dm
> > > CONFIG_VFIO_VIRQFD=3Dm
> > > CONFIG_VFIO_NOIOMMU=3Dy
> > > CONFIG_VFIO_PCI_CORE=3Dm
> > > CONFIG_VFIO_PCI_MMAP=3Dy
> > > CONFIG_VFIO_PCI_INTX=3Dy
> > > CONFIG_VFIO_PCI=3Dm
> > > # CONFIG_VFIO_PCI_IGD is not set
> > > CONFIG_MLX5_VFIO_PCI=3Dm
> > > CONFIG_VFIO_MDEV=3Dm
> > > CONFIG_IRQ_BYPASS_MANAGER=3Dm
> > > CONFIG_VIRT_DRIVERS=3Dy
> > > CONFIG_VMGENID=3Dy
> > > # CONFIG_VBOXGUEST is not set
> > > # CONFIG_ACRN_HSM is not set
> > > CONFIG_VIRTIO=3Dy
> > > # CONFIG_VIRTIO_MENU is not set
> > > CONFIG_VDPA=3Dy
> > > CONFIG_VDPA_SIM=3Dy
> > > CONFIG_VDPA_SIM_NET=3Dm
> > > CONFIG_VDPA_SIM_BLOCK=3Dm
> > > CONFIG_VDPA_USER=3Dy
> > > CONFIG_MLX5_VDPA=3Dy
> > > CONFIG_MLX5_VDPA_NET=3Dm
> > > CONFIG_VHOST_IOTLB=3Dy
> > > CONFIG_VHOST_RING=3Dy
> > > # CONFIG_VHOST_MENU is not set
> > > =

> > > #
> > > # Microsoft Hyper-V guest support
> > > #
> > > # CONFIG_HYPERV is not set
> > > # end of Microsoft Hyper-V guest support
> > > =

> > > #
> > > # Xen driver support
> > > #
> > > # CONFIG_XEN_BALLOON is not set
> > > CONFIG_XEN_MEMORY_HOTPLUG_LIMIT=3D512
> > > # CONFIG_XEN_DEV_EVTCHN is not set
> > > CONFIG_XEN_BACKEND=3Dy
> > > CONFIG_XENFS=3Dy
> > > CONFIG_XEN_COMPAT_XENFS=3Dy
> > > CONFIG_XEN_SYS_HYPERVISOR=3Dy
> > > CONFIG_XEN_XENBUS_FRONTEND=3Dy
> > > CONFIG_XEN_GNTDEV=3Dy
> > > CONFIG_XEN_GRANT_DEV_ALLOC=3Dm
> > > # CONFIG_XEN_GRANT_DMA_ALLOC is not set
> > > CONFIG_SWIOTLB_XEN=3Dy
> > > CONFIG_XEN_PCI_STUB=3Dy
> > > CONFIG_XEN_PCIDEV_BACKEND=3Dm
> > > CONFIG_XEN_PVCALLS_FRONTEND=3Dy
> > > CONFIG_XEN_PVCALLS_BACKEND=3Dm
> > > CONFIG_XEN_SCSI_BACKEND=3Dm
> > > CONFIG_XEN_PRIVCMD=3Dy
> > > CONFIG_XEN_ACPI_PROCESSOR=3Dm
> > > CONFIG_XEN_HAVE_PVMMU=3Dy
> > > CONFIG_XEN_AUTO_XLATE=3Dy
> > > CONFIG_XEN_ACPI=3Dy
> > > CONFIG_XEN_SYMS=3Dy
> > > CONFIG_XEN_HAVE_VPMU=3Dy
> > > CONFIG_XEN_FRONT_PGDIR_SHBUF=3Dm
> > > # end of Xen driver support
> > > =

> > > CONFIG_GREYBUS=3Dm
> > > CONFIG_COMEDI=3Dm
> > > CONFIG_COMEDI_DEBUG=3Dy
> > > CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> > > CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> > > # CONFIG_COMEDI_MISC_DRIVERS is not set
> > > CONFIG_COMEDI_ISA_DRIVERS=3Dy
> > > CONFIG_COMEDI_PCL711=3Dm
> > > # CONFIG_COMEDI_PCL724 is not set
> > > CONFIG_COMEDI_PCL726=3Dm
> > > CONFIG_COMEDI_PCL730=3Dm
> > > CONFIG_COMEDI_PCL812=3Dm
> > > CONFIG_COMEDI_PCL816=3Dm
> > > CONFIG_COMEDI_PCL818=3Dm
> > > CONFIG_COMEDI_PCM3724=3Dm
> > > # CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
> > > CONFIG_COMEDI_AMPLC_PC236_ISA=3Dm
> > > # CONFIG_COMEDI_AMPLC_PC263_ISA is not set
> > > # CONFIG_COMEDI_RTI800 is not set
> > > CONFIG_COMEDI_RTI802=3Dm
> > > # CONFIG_COMEDI_DAC02 is not set
> > > CONFIG_COMEDI_DAS16M1=3Dm
> > > CONFIG_COMEDI_DAS08_ISA=3Dm
> > > # CONFIG_COMEDI_DAS16 is not set
> > > # CONFIG_COMEDI_DAS800 is not set
> > > CONFIG_COMEDI_DAS1800=3Dm
> > > CONFIG_COMEDI_DAS6402=3Dm
> > > CONFIG_COMEDI_DT2801=3Dm
> > > CONFIG_COMEDI_DT2811=3Dm
> > > CONFIG_COMEDI_DT2814=3Dm
> > > CONFIG_COMEDI_DT2815=3Dm
> > > # CONFIG_COMEDI_DT2817 is not set
> > > # CONFIG_COMEDI_DT282X is not set
> > > # CONFIG_COMEDI_DMM32AT is not set
> > > CONFIG_COMEDI_FL512=3Dm
> > > # CONFIG_COMEDI_AIO_AIO12_8 is not set
> > > CONFIG_COMEDI_AIO_IIRO_16=3Dm
> > > CONFIG_COMEDI_II_PCI20KC=3Dm
> > > CONFIG_COMEDI_C6XDIGIO=3Dm
> > > # CONFIG_COMEDI_MPC624 is not set
> > > CONFIG_COMEDI_ADQ12B=3Dm
> > > CONFIG_COMEDI_NI_AT_A2150=3Dm
> > > # CONFIG_COMEDI_NI_AT_AO is not set
> > > CONFIG_COMEDI_NI_ATMIO=3Dm
> > > # CONFIG_COMEDI_NI_ATMIO16D is not set
> > > # CONFIG_COMEDI_NI_LABPC_ISA is not set
> > > # CONFIG_COMEDI_PCMAD is not set
> > > CONFIG_COMEDI_PCMDA12=3Dm
> > > # CONFIG_COMEDI_PCMMIO is not set
> > > # CONFIG_COMEDI_PCMUIO is not set
> > > CONFIG_COMEDI_MULTIQ3=3Dm
> > > CONFIG_COMEDI_S526=3Dm
> > > CONFIG_COMEDI_PCI_DRIVERS=3Dm
> > > # CONFIG_COMEDI_8255_PCI is not set
> > > CONFIG_COMEDI_ADDI_WATCHDOG=3Dm
> > > CONFIG_COMEDI_ADDI_APCI_1032=3Dm
> > > CONFIG_COMEDI_ADDI_APCI_1500=3Dm
> > > CONFIG_COMEDI_ADDI_APCI_1516=3Dm
> > > # CONFIG_COMEDI_ADDI_APCI_1564 is not set
> > > CONFIG_COMEDI_ADDI_APCI_16XX=3Dm
> > > # CONFIG_COMEDI_ADDI_APCI_2032 is not set
> > > CONFIG_COMEDI_ADDI_APCI_2200=3Dm
> > > CONFIG_COMEDI_ADDI_APCI_3120=3Dm
> > > # CONFIG_COMEDI_ADDI_APCI_3501 is not set
> > > CONFIG_COMEDI_ADDI_APCI_3XXX=3Dm
> > > # CONFIG_COMEDI_ADL_PCI6208 is not set
> > > CONFIG_COMEDI_ADL_PCI7X3X=3Dm
> > > # CONFIG_COMEDI_ADL_PCI8164 is not set
> > > CONFIG_COMEDI_ADL_PCI9111=3Dm
> > > CONFIG_COMEDI_ADL_PCI9118=3Dm
> > > CONFIG_COMEDI_ADV_PCI1710=3Dm
> > > CONFIG_COMEDI_ADV_PCI1720=3Dm
> > > # CONFIG_COMEDI_ADV_PCI1723 is not set
> > > CONFIG_COMEDI_ADV_PCI1724=3Dm
> > > CONFIG_COMEDI_ADV_PCI1760=3Dm
> > > # CONFIG_COMEDI_ADV_PCI_DIO is not set
> > > CONFIG_COMEDI_AMPLC_DIO200_PCI=3Dm
> > > CONFIG_COMEDI_AMPLC_PC236_PCI=3Dm
> > > # CONFIG_COMEDI_AMPLC_PC263_PCI is not set
> > > CONFIG_COMEDI_AMPLC_PCI224=3Dm
> > > CONFIG_COMEDI_AMPLC_PCI230=3Dm
> > > # CONFIG_COMEDI_CONTEC_PCI_DIO is not set
> > > CONFIG_COMEDI_DAS08_PCI=3Dm
> > > CONFIG_COMEDI_DT3000=3Dm
> > > # CONFIG_COMEDI_DYNA_PCI10XX is not set
> > > # CONFIG_COMEDI_GSC_HPDI is not set
> > > # CONFIG_COMEDI_MF6X4 is not set
> > > CONFIG_COMEDI_ICP_MULTI=3Dm
> > > CONFIG_COMEDI_DAQBOARD2000=3Dm
> > > CONFIG_COMEDI_JR3_PCI=3Dm
> > > CONFIG_COMEDI_KE_COUNTER=3Dm
> > > # CONFIG_COMEDI_CB_PCIDAS64 is not set
> > > # CONFIG_COMEDI_CB_PCIDAS is not set
> > > # CONFIG_COMEDI_CB_PCIDDA is not set
> > > # CONFIG_COMEDI_CB_PCIMDAS is not set
> > > CONFIG_COMEDI_CB_PCIMDDA=3Dm
> > > CONFIG_COMEDI_ME4000=3Dm
> > > CONFIG_COMEDI_ME_DAQ=3Dm
> > > CONFIG_COMEDI_NI_6527=3Dm
> > > CONFIG_COMEDI_NI_65XX=3Dm
> > > # CONFIG_COMEDI_NI_660X is not set
> > > # CONFIG_COMEDI_NI_670X is not set
> > > CONFIG_COMEDI_NI_LABPC_PCI=3Dm
> > > # CONFIG_COMEDI_NI_PCIDIO is not set
> > > CONFIG_COMEDI_NI_PCIMIO=3Dm
> > > # CONFIG_COMEDI_RTD520 is not set
> > > CONFIG_COMEDI_S626=3Dm
> > > CONFIG_COMEDI_MITE=3Dm
> > > CONFIG_COMEDI_NI_TIOCMD=3Dm
> > > CONFIG_COMEDI_PCMCIA_DRIVERS=3Dm
> > > CONFIG_COMEDI_CB_DAS16_CS=3Dm
> > > # CONFIG_COMEDI_DAS08_CS is not set
> > > # CONFIG_COMEDI_NI_DAQ_700_CS is not set
> > > CONFIG_COMEDI_NI_DAQ_DIO24_CS=3Dm
> > > CONFIG_COMEDI_NI_LABPC_CS=3Dm
> > > CONFIG_COMEDI_NI_MIO_CS=3Dm
> > > CONFIG_COMEDI_QUATECH_DAQP_CS=3Dm
> > > CONFIG_COMEDI_8254=3Dm
> > > CONFIG_COMEDI_8255=3Dm
> > > # CONFIG_COMEDI_8255_SA is not set
> > > # CONFIG_COMEDI_KCOMEDILIB is not set
> > > CONFIG_COMEDI_AMPLC_DIO200=3Dm
> > > CONFIG_COMEDI_AMPLC_PC236=3Dm
> > > CONFIG_COMEDI_DAS08=3Dm
> > > CONFIG_COMEDI_ISADMA=3Dm
> > > CONFIG_COMEDI_NI_LABPC=3Dm
> > > CONFIG_COMEDI_NI_TIO=3Dm
> > > CONFIG_COMEDI_NI_ROUTING=3Dm
> > > # CONFIG_COMEDI_TESTS is not set
> > > # CONFIG_STAGING is not set
> > > CONFIG_X86_PLATFORM_DEVICES=3Dy
> > > # CONFIG_ACPI_WMI is not set
> > > # CONFIG_ACERHDF is not set
> > > # CONFIG_ACER_WIRELESS is not set
> > > # CONFIG_AMD_PMC is not set
> > > # CONFIG_AMD_HSMP is not set
> > > # CONFIG_ADV_SWBUTTON is not set
> > > # CONFIG_APPLE_GMUX is not set
> > > # CONFIG_ASUS_LAPTOP is not set
> > > # CONFIG_ASUS_WIRELESS is not set
> > > # CONFIG_ASUS_TF103C_DOCK is not set
> > > CONFIG_MERAKI_MX100=3Dm
> > > # CONFIG_EEEPC_LAPTOP is not set
> > > # CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
> > > # CONFIG_FUJITSU_LAPTOP is not set
> > > # CONFIG_FUJITSU_TABLET is not set
> > > # CONFIG_GPD_POCKET_FAN is not set
> > > # CONFIG_HP_ACCEL is not set
> > > # CONFIG_WIRELESS_HOTKEY is not set
> > > CONFIG_IBM_RTL=3Dm
> > > # CONFIG_SENSORS_HDAPS is not set
> > > # CONFIG_THINKPAD_ACPI is not set
> > > CONFIG_INTEL_ATOMISP2_PDX86=3Dy
> > > CONFIG_INTEL_ATOMISP2_LED=3Dm
> > > # CONFIG_INTEL_ATOMISP2_PM is not set
> > > # CONFIG_INTEL_SAR_INT1092 is not set
> > > # CONFIG_INTEL_SKL_INT3472 is not set
> > > # CONFIG_INTEL_PMC_CORE is not set
> > > =

> > > #
> > > # Intel Speed Select Technology interface support
> > > #
> > > CONFIG_INTEL_SPEED_SELECT_INTERFACE=3Dy
> > > # end of Intel Speed Select Technology interface support
> > > =

> > > #
> > > # Intel Uncore Frequency Control
> > > #
> > > CONFIG_INTEL_UNCORE_FREQ_CONTROL=3Dm
> > > # end of Intel Uncore Frequency Control
> > > =

> > > # CONFIG_INTEL_HID_EVENT is not set
> > > # CONFIG_INTEL_VBTN is not set
> > > # CONFIG_INTEL_INT0002_VGPIO is not set
> > > # CONFIG_INTEL_PUNIT_IPC is not set
> > > # CONFIG_INTEL_RST is not set
> > > # CONFIG_INTEL_SMARTCONNECT is not set
> > > # CONFIG_INTEL_VSEC is not set
> > > # CONFIG_PCENGINES_APU2 is not set
> > > # CONFIG_BARCO_P50_GPIO is not set
> > > CONFIG_SAMSUNG_LAPTOP=3Dm
> > > # CONFIG_SAMSUNG_Q10 is not set
> > > # CONFIG_TOSHIBA_BT_RFKILL is not set
> > > # CONFIG_TOSHIBA_HAPS is not set
> > > # CONFIG_ACPI_CMPC is not set
> > > # CONFIG_PANASONIC_LAPTOP is not set
> > > # CONFIG_SYSTEM76_ACPI is not set
> > > # CONFIG_TOPSTAR_LAPTOP is not set
> > > # CONFIG_SERIAL_MULTI_INSTANTIATE is not set
> > > # CONFIG_MLX_PLATFORM is not set
> > > # CONFIG_INTEL_IPS is not set
> > > CONFIG_INTEL_SCU_IPC=3Dy
> > > CONFIG_INTEL_SCU=3Dy
> > > CONFIG_INTEL_SCU_PCI=3Dy
> > > # CONFIG_INTEL_SCU_PLATFORM is not set
> > > CONFIG_INTEL_SCU_WDT=3Dy
> > > CONFIG_INTEL_SCU_IPC_UTIL=3Dy
> > > # CONFIG_SIEMENS_SIMATIC_IPC is not set
> > > CONFIG_PMC_ATOM=3Dy
> > > # CONFIG_CHROME_PLATFORMS is not set
> > > # CONFIG_MELLANOX_PLATFORM is not set
> > > # CONFIG_SURFACE_PLATFORMS is not set
> > > CONFIG_HAVE_CLK=3Dy
> > > CONFIG_HAVE_CLK_PREPARE=3Dy
> > > CONFIG_COMMON_CLK=3Dy
> > > CONFIG_COMMON_CLK_WM831X=3Dy
> > > CONFIG_LMK04832=3Dy
> > > CONFIG_COMMON_CLK_MAX9485=3Dm
> > > CONFIG_COMMON_CLK_SI5341=3Dm
> > > CONFIG_COMMON_CLK_SI5351=3Dy
> > > CONFIG_COMMON_CLK_SI544=3Dy
> > > CONFIG_COMMON_CLK_CDCE706=3Dy
> > > # CONFIG_COMMON_CLK_CS2000_CP is not set
> > > CONFIG_CLK_TWL6040=3Dm
> > > CONFIG_COMMON_CLK_PALMAS=3Dy
> > > # CONFIG_COMMON_CLK_PWM is not set
> > > CONFIG_XILINX_VCU=3Dm
> > > CONFIG_HWSPINLOCK=3Dy
> > > =

> > > #
> > > # Clock Source drivers
> > > #
> > > CONFIG_CLKEVT_I8253=3Dy
> > > CONFIG_I8253_LOCK=3Dy
> > > CONFIG_CLKBLD_I8253=3Dy
> > > CONFIG_DW_APB_TIMER=3Dy
> > > # end of Clock Source drivers
> > > =

> > > # CONFIG_MAILBOX is not set
> > > CONFIG_IOMMU_IOVA=3Dy
> > > CONFIG_IOMMU_API=3Dy
> > > # CONFIG_IOMMU_SUPPORT is not set
> > > =

> > > #
> > > # Remoteproc drivers
> > > #
> > > CONFIG_REMOTEPROC=3Dy
> > > # CONFIG_REMOTEPROC_CDEV is not set
> > > # end of Remoteproc drivers
> > > =

> > > #
> > > # Rpmsg drivers
> > > #
> > > CONFIG_RPMSG=3Dm
> > > # CONFIG_RPMSG_CHAR is not set
> > > CONFIG_RPMSG_CTRL=3Dm
> > > CONFIG_RPMSG_NS=3Dm
> > > CONFIG_RPMSG_VIRTIO=3Dm
> > > # end of Rpmsg drivers
> > > =

> > > # CONFIG_SOUNDWIRE is not set
> > > =

> > > #
> > > # SOC (System On Chip) specific Drivers
> > > #
> > > =

> > > #
> > > # Amlogic SoC drivers
> > > #
> > > # end of Amlogic SoC drivers
> > > =

> > > #
> > > # Broadcom SoC drivers
> > > #
> > > # end of Broadcom SoC drivers
> > > =

> > > #
> > > # NXP/Freescale QorIQ SoC drivers
> > > #
> > > # end of NXP/Freescale QorIQ SoC drivers
> > > =

> > > #
> > > # i.MX SoC drivers
> > > #
> > > # end of i.MX SoC drivers
> > > =

> > > #
> > > # Enable LiteX SoC Builder specific drivers
> > > #
> > > # end of Enable LiteX SoC Builder specific drivers
> > > =

> > > #
> > > # Qualcomm SoC drivers
> > > #
> > > # end of Qualcomm SoC drivers
> > > =

> > > # CONFIG_SOC_TI is not set
> > > =

> > > #
> > > # Xilinx SoC drivers
> > > #
> > > # end of Xilinx SoC drivers
> > > # end of SOC (System On Chip) specific Drivers
> > > =

> > > # CONFIG_PM_DEVFREQ is not set
> > > CONFIG_EXTCON=3Dy
> > > =

> > > #
> > > # Extcon Device Drivers
> > > #
> > > CONFIG_EXTCON_ADC_JACK=3Dm
> > > # CONFIG_EXTCON_FSA9480 is not set
> > > # CONFIG_EXTCON_GPIO is not set
> > > # CONFIG_EXTCON_INTEL_INT3496 is not set
> > > CONFIG_EXTCON_MAX3355=3Dy
> > > CONFIG_EXTCON_PALMAS=3Dy
> > > CONFIG_EXTCON_PTN5150=3Dm
> > > CONFIG_EXTCON_RT8973A=3Dm
> > > CONFIG_EXTCON_SM5502=3Dm
> > > # CONFIG_EXTCON_USB_GPIO is not set
> > > # CONFIG_EXTCON_USBC_TUSB320 is not set
> > > # CONFIG_MEMORY is not set
> > > CONFIG_IIO=3Dm
> > > CONFIG_IIO_BUFFER=3Dy
> > > CONFIG_IIO_BUFFER_CB=3Dm
> > > CONFIG_IIO_BUFFER_DMA=3Dm
> > > CONFIG_IIO_BUFFER_DMAENGINE=3Dm
> > > CONFIG_IIO_BUFFER_HW_CONSUMER=3Dm
> > > CONFIG_IIO_KFIFO_BUF=3Dm
> > > CONFIG_IIO_TRIGGERED_BUFFER=3Dm
> > > CONFIG_IIO_CONFIGFS=3Dm
> > > CONFIG_IIO_TRIGGER=3Dy
> > > CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> > > CONFIG_IIO_SW_DEVICE=3Dm
> > > CONFIG_IIO_SW_TRIGGER=3Dm
> > > CONFIG_IIO_TRIGGERED_EVENT=3Dm
> > > =

> > > #
> > > # Accelerometers
> > > #
> > > CONFIG_ADIS16201=3Dm
> > > CONFIG_ADIS16209=3Dm
> > > CONFIG_ADXL313=3Dm
> > > CONFIG_ADXL313_I2C=3Dm
> > > # CONFIG_ADXL313_SPI is not set
> > > CONFIG_ADXL345=3Dm
> > > CONFIG_ADXL345_I2C=3Dm
> > > CONFIG_ADXL345_SPI=3Dm
> > > # CONFIG_ADXL355_I2C is not set
> > > # CONFIG_ADXL355_SPI is not set
> > > CONFIG_ADXL367=3Dm
> > > CONFIG_ADXL367_SPI=3Dm
> > > CONFIG_ADXL367_I2C=3Dm
> > > CONFIG_ADXL372=3Dm
> > > CONFIG_ADXL372_SPI=3Dm
> > > # CONFIG_ADXL372_I2C is not set
> > > CONFIG_BMA180=3Dm
> > > CONFIG_BMA220=3Dm
> > > # CONFIG_BMA400 is not set
> > > # CONFIG_BMC150_ACCEL is not set
> > > # CONFIG_BMI088_ACCEL is not set
> > > CONFIG_DA280=3Dm
> > > CONFIG_DA311=3Dm
> > > CONFIG_DMARD09=3Dm
> > > # CONFIG_DMARD10 is not set
> > > # CONFIG_FXLS8962AF_I2C is not set
> > > # CONFIG_FXLS8962AF_SPI is not set
> > > CONFIG_IIO_ST_ACCEL_3AXIS=3Dm
> > > CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dm
> > > CONFIG_IIO_ST_ACCEL_SPI_3AXIS=3Dm
> > > CONFIG_KXSD9=3Dm
> > > CONFIG_KXSD9_SPI=3Dm
> > > # CONFIG_KXSD9_I2C is not set
> > > CONFIG_KXCJK1013=3Dm
> > > CONFIG_MC3230=3Dm
> > > CONFIG_MMA7455=3Dm
> > > CONFIG_MMA7455_I2C=3Dm
> > > # CONFIG_MMA7455_SPI is not set
> > > CONFIG_MMA7660=3Dm
> > > CONFIG_MMA8452=3Dm
> > > CONFIG_MMA9551_CORE=3Dm
> > > CONFIG_MMA9551=3Dm
> > > # CONFIG_MMA9553 is not set
> > > CONFIG_MXC4005=3Dm
> > > # CONFIG_MXC6255 is not set
> > > CONFIG_SCA3000=3Dm
> > > CONFIG_SCA3300=3Dm
> > > CONFIG_STK8312=3Dm
> > > CONFIG_STK8BA50=3Dm
> > > # end of Accelerometers
> > > =

> > > #
> > > # Analog to digital converters
> > > #
> > > CONFIG_AD_SIGMA_DELTA=3Dm
> > > CONFIG_AD7091R5=3Dm
> > > CONFIG_AD7124=3Dm
> > > # CONFIG_AD7192 is not set
> > > CONFIG_AD7266=3Dm
> > > CONFIG_AD7280=3Dm
> > > CONFIG_AD7291=3Dm
> > > # CONFIG_AD7292 is not set
> > > # CONFIG_AD7298 is not set
> > > CONFIG_AD7476=3Dm
> > > CONFIG_AD7606=3Dm
> > > CONFIG_AD7606_IFACE_PARALLEL=3Dm
> > > CONFIG_AD7606_IFACE_SPI=3Dm
> > > # CONFIG_AD7766 is not set
> > > CONFIG_AD7768_1=3Dm
> > > CONFIG_AD7780=3Dm
> > > # CONFIG_AD7791 is not set
> > > CONFIG_AD7793=3Dm
> > > CONFIG_AD7887=3Dm
> > > # CONFIG_AD7923 is not set
> > > CONFIG_AD7949=3Dm
> > > CONFIG_AD799X=3Dm
> > > CONFIG_CC10001_ADC=3Dm
> > > CONFIG_DA9150_GPADC=3Dm
> > > CONFIG_HI8435=3Dm
> > > CONFIG_HX711=3Dm
> > > CONFIG_LP8788_ADC=3Dm
> > > CONFIG_LTC2471=3Dm
> > > CONFIG_LTC2485=3Dm
> > > CONFIG_LTC2496=3Dm
> > > # CONFIG_LTC2497 is not set
> > > # CONFIG_MAX1027 is not set
> > > CONFIG_MAX11100=3Dm
> > > CONFIG_MAX1118=3Dm
> > > CONFIG_MAX1241=3Dm
> > > CONFIG_MAX1363=3Dm
> > > # CONFIG_MAX9611 is not set
> > > CONFIG_MCP320X=3Dm
> > > # CONFIG_MCP3422 is not set
> > > CONFIG_MCP3911=3Dm
> > > CONFIG_MP2629_ADC=3Dm
> > > CONFIG_NAU7802=3Dm
> > > CONFIG_PALMAS_GPADC=3Dm
> > > CONFIG_TI_ADC081C=3Dm
> > > CONFIG_TI_ADC0832=3Dm
> > > # CONFIG_TI_ADC084S021 is not set
> > > CONFIG_TI_ADC12138=3Dm
> > > CONFIG_TI_ADC108S102=3Dm
> > > CONFIG_TI_ADC128S052=3Dm
> > > CONFIG_TI_ADC161S626=3Dm
> > > CONFIG_TI_ADS1015=3Dm
> > > # CONFIG_TI_ADS7950 is not set
> > > CONFIG_TI_ADS8344=3Dm
> > > CONFIG_TI_ADS8688=3Dm
> > > # CONFIG_TI_ADS124S08 is not set
> > > # CONFIG_TI_ADS131E08 is not set
> > > CONFIG_TI_TLC4541=3Dm
> > > # CONFIG_TI_TSC2046 is not set
> > > CONFIG_TWL4030_MADC=3Dm
> > > CONFIG_TWL6030_GPADC=3Dm
> > > CONFIG_XILINX_XADC=3Dm
> > > # end of Analog to digital converters
> > > =

> > > #
> > > # Analog to digital and digital to analog converters
> > > #
> > > CONFIG_AD74413R=3Dm
> > > # end of Analog to digital and digital to analog converters
> > > =

> > > #
> > > # Analog Front Ends
> > > #
> > > # end of Analog Front Ends
> > > =

> > > #
> > > # Amplifiers
> > > #
> > > # CONFIG_AD8366 is not set
> > > CONFIG_ADA4250=3Dm
> > > CONFIG_HMC425=3Dm
> > > # end of Amplifiers
> > > =

> > > #
> > > # Capacitance to digital converters
> > > #
> > > # CONFIG_AD7150 is not set
> > > # end of Capacitance to digital converters
> > > =

> > > #
> > > # Chemical Sensors
> > > #
> > > CONFIG_ATLAS_PH_SENSOR=3Dm
> > > # CONFIG_ATLAS_EZO_SENSOR is not set
> > > CONFIG_BME680=3Dm
> > > CONFIG_BME680_I2C=3Dm
> > > CONFIG_BME680_SPI=3Dm
> > > CONFIG_CCS811=3Dm
> > > CONFIG_IAQCORE=3Dm
> > > CONFIG_PMS7003=3Dm
> > > CONFIG_SCD30_CORE=3Dm
> > > CONFIG_SCD30_I2C=3Dm
> > > CONFIG_SCD30_SERIAL=3Dm
> > > CONFIG_SCD4X=3Dm
> > > # CONFIG_SENSIRION_SGP30 is not set
> > > CONFIG_SENSIRION_SGP40=3Dm
> > > CONFIG_SPS30=3Dm
> > > # CONFIG_SPS30_I2C is not set
> > > CONFIG_SPS30_SERIAL=3Dm
> > > # CONFIG_SENSEAIR_SUNRISE_CO2 is not set
> > > CONFIG_VZ89X=3Dm
> > > # end of Chemical Sensors
> > > =

> > > #
> > > # Hid Sensor IIO Common
> > > #
> > > # end of Hid Sensor IIO Common
> > > =

> > > CONFIG_IIO_MS_SENSORS_I2C=3Dm
> > > =

> > > #
> > > # IIO SCMI Sensors
> > > #
> > > # end of IIO SCMI Sensors
> > > =

> > > #
> > > # SSP Sensor Common
> > > #
> > > # CONFIG_IIO_SSP_SENSORHUB is not set
> > > # end of SSP Sensor Common
> > > =

> > > CONFIG_IIO_ST_SENSORS_I2C=3Dm
> > > CONFIG_IIO_ST_SENSORS_SPI=3Dm
> > > CONFIG_IIO_ST_SENSORS_CORE=3Dm
> > > =

> > > #
> > > # Digital to analog converters
> > > #
> > > CONFIG_AD3552R=3Dm
> > > CONFIG_AD5064=3Dm
> > > # CONFIG_AD5360 is not set
> > > # CONFIG_AD5380 is not set
> > > CONFIG_AD5421=3Dm
> > > CONFIG_AD5446=3Dm
> > > # CONFIG_AD5449 is not set
> > > CONFIG_AD5592R_BASE=3Dm
> > > CONFIG_AD5592R=3Dm
> > > CONFIG_AD5593R=3Dm
> > > # CONFIG_AD5504 is not set
> > > # CONFIG_AD5624R_SPI is not set
> > > CONFIG_LTC2688=3Dm
> > > CONFIG_AD5686=3Dm
> > > CONFIG_AD5686_SPI=3Dm
> > > # CONFIG_AD5696_I2C is not set
> > > CONFIG_AD5755=3Dm
> > > # CONFIG_AD5758 is not set
> > > # CONFIG_AD5761 is not set
> > > # CONFIG_AD5764 is not set
> > > CONFIG_AD5766=3Dm
> > > # CONFIG_AD5770R is not set
> > > CONFIG_AD5791=3Dm
> > > CONFIG_AD7293=3Dm
> > > CONFIG_AD7303=3Dm
> > > CONFIG_AD8801=3Dm
> > > CONFIG_DS4424=3Dm
> > > CONFIG_LTC1660=3Dm
> > > # CONFIG_LTC2632 is not set
> > > CONFIG_M62332=3Dm
> > > CONFIG_MAX517=3Dm
> > > CONFIG_MAX5821=3Dm
> > > # CONFIG_MCP4725 is not set
> > > # CONFIG_MCP4922 is not set
> > > # CONFIG_TI_DAC082S085 is not set
> > > # CONFIG_TI_DAC5571 is not set
> > > # CONFIG_TI_DAC7311 is not set
> > > CONFIG_TI_DAC7612=3Dm
> > > # end of Digital to analog converters
> > > =

> > > #
> > > # IIO dummy driver
> > > #
> > > CONFIG_IIO_DUMMY_EVGEN=3Dm
> > > CONFIG_IIO_SIMPLE_DUMMY=3Dm
> > > CONFIG_IIO_SIMPLE_DUMMY_EVENTS=3Dy
> > > # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
> > > # end of IIO dummy driver
> > > =

> > > #
> > > # Filters
> > > #
> > > # CONFIG_ADMV8818 is not set
> > > # end of Filters
> > > =

> > > #
> > > # Frequency Synthesizers DDS/PLL
> > > #
> > > =

> > > #
> > > # Clock Generator/Distribution
> > > #
> > > CONFIG_AD9523=3Dm
> > > # end of Clock Generator/Distribution
> > > =

> > > #
> > > # Phase-Locked Loop (PLL) frequency synthesizers
> > > #
> > > CONFIG_ADF4350=3Dm
> > > CONFIG_ADF4371=3Dm
> > > CONFIG_ADMV1013=3Dm
> > > CONFIG_ADMV1014=3Dm
> > > CONFIG_ADMV4420=3Dm
> > > CONFIG_ADRF6780=3Dm
> > > # end of Phase-Locked Loop (PLL) frequency synthesizers
> > > # end of Frequency Synthesizers DDS/PLL
> > > =

> > > #
> > > # Digital gyroscope sensors
> > > #
> > > CONFIG_ADIS16080=3Dm
> > > # CONFIG_ADIS16130 is not set
> > > # CONFIG_ADIS16136 is not set
> > > # CONFIG_ADIS16260 is not set
> > > CONFIG_ADXRS290=3Dm
> > > CONFIG_ADXRS450=3Dm
> > > CONFIG_BMG160=3Dm
> > > CONFIG_BMG160_I2C=3Dm
> > > CONFIG_BMG160_SPI=3Dm
> > > CONFIG_FXAS21002C=3Dm
> > > CONFIG_FXAS21002C_I2C=3Dm
> > > CONFIG_FXAS21002C_SPI=3Dm
> > > # CONFIG_MPU3050_I2C is not set
> > > CONFIG_IIO_ST_GYRO_3AXIS=3Dm
> > > # CONFIG_IIO_ST_GYRO_I2C_3AXIS is not set
> > > CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dm
> > > # CONFIG_ITG3200 is not set
> > > # end of Digital gyroscope sensors
> > > =

> > > #
> > > # Health Sensors
> > > #
> > > =

> > > #
> > > # Heart Rate Monitors
> > > #
> > > # CONFIG_AFE4403 is not set
> > > # CONFIG_AFE4404 is not set
> > > # CONFIG_MAX30100 is not set
> > > # CONFIG_MAX30102 is not set
> > > # end of Heart Rate Monitors
> > > # end of Health Sensors
> > > =

> > > #
> > > # Humidity sensors
> > > #
> > > # CONFIG_AM2315 is not set
> > > # CONFIG_DHT11 is not set
> > > # CONFIG_HDC100X is not set
> > > # CONFIG_HDC2010 is not set
> > > CONFIG_HTS221=3Dm
> > > CONFIG_HTS221_I2C=3Dm
> > > CONFIG_HTS221_SPI=3Dm
> > > CONFIG_HTU21=3Dm
> > > CONFIG_SI7005=3Dm
> > > CONFIG_SI7020=3Dm
> > > # end of Humidity sensors
> > > =

> > > #
> > > # Inertial measurement units
> > > #
> > > CONFIG_ADIS16400=3Dm
> > > # CONFIG_ADIS16460 is not set
> > > # CONFIG_ADIS16475 is not set
> > > CONFIG_ADIS16480=3Dm
> > > CONFIG_BMI160=3Dm
> > > CONFIG_BMI160_I2C=3Dm
> > > CONFIG_BMI160_SPI=3Dm
> > > # CONFIG_FXOS8700_I2C is not set
> > > # CONFIG_FXOS8700_SPI is not set
> > > # CONFIG_KMX61 is not set
> > > CONFIG_INV_ICM42600=3Dm
> > > # CONFIG_INV_ICM42600_I2C is not set
> > > CONFIG_INV_ICM42600_SPI=3Dm
> > > CONFIG_INV_MPU6050_IIO=3Dm
> > > CONFIG_INV_MPU6050_I2C=3Dm
> > > CONFIG_INV_MPU6050_SPI=3Dm
> > > # CONFIG_IIO_ST_LSM6DSX is not set
> > > CONFIG_IIO_ST_LSM9DS0=3Dm
> > > CONFIG_IIO_ST_LSM9DS0_I2C=3Dm
> > > CONFIG_IIO_ST_LSM9DS0_SPI=3Dm
> > > # end of Inertial measurement units
> > > =

> > > CONFIG_IIO_ADIS_LIB=3Dm
> > > CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> > > =

> > > #
> > > # Light sensors
> > > #
> > > # CONFIG_ACPI_ALS is not set
> > > CONFIG_ADJD_S311=3Dm
> > > # CONFIG_ADUX1020 is not set
> > > CONFIG_AL3010=3Dm
> > > CONFIG_AL3320A=3Dm
> > > # CONFIG_APDS9300 is not set
> > > CONFIG_APDS9960=3Dm
> > > CONFIG_AS73211=3Dm
> > > # CONFIG_BH1750 is not set
> > > CONFIG_BH1780=3Dm
> > > CONFIG_CM32181=3Dm
> > > # CONFIG_CM3232 is not set
> > > # CONFIG_CM3323 is not set
> > > CONFIG_CM36651=3Dm
> > > CONFIG_GP2AP002=3Dm
> > > CONFIG_GP2AP020A00F=3Dm
> > > CONFIG_SENSORS_ISL29018=3Dm
> > > # CONFIG_SENSORS_ISL29028 is not set
> > > CONFIG_ISL29125=3Dm
> > > CONFIG_JSA1212=3Dm
> > > CONFIG_RPR0521=3Dm
> > > CONFIG_LTR501=3Dm
> > > CONFIG_LV0104CS=3Dm
> > > CONFIG_MAX44000=3Dm
> > > CONFIG_MAX44009=3Dm
> > > CONFIG_NOA1305=3Dm
> > > CONFIG_OPT3001=3Dm
> > > # CONFIG_PA12203001 is not set
> > > # CONFIG_SI1133 is not set
> > > # CONFIG_SI1145 is not set
> > > CONFIG_STK3310=3Dm
> > > CONFIG_ST_UVIS25=3Dm
> > > CONFIG_ST_UVIS25_I2C=3Dm
> > > CONFIG_ST_UVIS25_SPI=3Dm
> > > CONFIG_TCS3414=3Dm
> > > CONFIG_TCS3472=3Dm
> > > # CONFIG_SENSORS_TSL2563 is not set
> > > # CONFIG_TSL2583 is not set
> > > # CONFIG_TSL2591 is not set
> > > # CONFIG_TSL2772 is not set
> > > # CONFIG_TSL4531 is not set
> > > CONFIG_US5182D=3Dm
> > > # CONFIG_VCNL4000 is not set
> > > CONFIG_VCNL4035=3Dm
> > > CONFIG_VEML6030=3Dm
> > > # CONFIG_VEML6070 is not set
> > > CONFIG_VL6180=3Dm
> > > # CONFIG_ZOPT2201 is not set
> > > # end of Light sensors
> > > =

> > > #
> > > # Magnetometer sensors
> > > #
> > > CONFIG_AK8975=3Dm
> > > CONFIG_AK09911=3Dm
> > > CONFIG_BMC150_MAGN=3Dm
> > > CONFIG_BMC150_MAGN_I2C=3Dm
> > > CONFIG_BMC150_MAGN_SPI=3Dm
> > > CONFIG_MAG3110=3Dm
> > > CONFIG_MMC35240=3Dm
> > > CONFIG_IIO_ST_MAGN_3AXIS=3Dm
> > > CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dm
> > > CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dm
> > > CONFIG_SENSORS_HMC5843=3Dm
> > > CONFIG_SENSORS_HMC5843_I2C=3Dm
> > > CONFIG_SENSORS_HMC5843_SPI=3Dm
> > > CONFIG_SENSORS_RM3100=3Dm
> > > CONFIG_SENSORS_RM3100_I2C=3Dm
> > > CONFIG_SENSORS_RM3100_SPI=3Dm
> > > # CONFIG_YAMAHA_YAS530 is not set
> > > # end of Magnetometer sensors
> > > =

> > > #
> > > # Multiplexers
> > > #
> > > # end of Multiplexers
> > > =

> > > #
> > > # Inclinometer sensors
> > > #
> > > # end of Inclinometer sensors
> > > =

> > > #
> > > # Triggers - standalone
> > > #
> > > # CONFIG_IIO_HRTIMER_TRIGGER is not set
> > > CONFIG_IIO_INTERRUPT_TRIGGER=3Dm
> > > CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dm
> > > # CONFIG_IIO_SYSFS_TRIGGER is not set
> > > # end of Triggers - standalone
> > > =

> > > #
> > > # Linear and angular position sensors
> > > #
> > > # end of Linear and angular position sensors
> > > =

> > > #
> > > # Digital potentiometers
> > > #
> > > CONFIG_AD5110=3Dm
> > > CONFIG_AD5272=3Dm
> > > # CONFIG_DS1803 is not set
> > > CONFIG_MAX5432=3Dm
> > > CONFIG_MAX5481=3Dm
> > > # CONFIG_MAX5487 is not set
> > > # CONFIG_MCP4018 is not set
> > > CONFIG_MCP4131=3Dm
> > > CONFIG_MCP4531=3Dm
> > > CONFIG_MCP41010=3Dm
> > > CONFIG_TPL0102=3Dm
> > > # end of Digital potentiometers
> > > =

> > > #
> > > # Digital potentiostats
> > > #
> > > CONFIG_LMP91000=3Dm
> > > # end of Digital potentiostats
> > > =

> > > #
> > > # Pressure sensors
> > > #
> > > # CONFIG_ABP060MG is not set
> > > CONFIG_BMP280=3Dm
> > > CONFIG_BMP280_I2C=3Dm
> > > CONFIG_BMP280_SPI=3Dm
> > > CONFIG_DLHL60D=3Dm
> > > # CONFIG_DPS310 is not set
> > > # CONFIG_HP03 is not set
> > > # CONFIG_ICP10100 is not set
> > > CONFIG_MPL115=3Dm
> > > # CONFIG_MPL115_I2C is not set
> > > CONFIG_MPL115_SPI=3Dm
> > > # CONFIG_MPL3115 is not set
> > > CONFIG_MS5611=3Dm
> > > CONFIG_MS5611_I2C=3Dm
> > > CONFIG_MS5611_SPI=3Dm
> > > CONFIG_MS5637=3Dm
> > > CONFIG_IIO_ST_PRESS=3Dm
> > > CONFIG_IIO_ST_PRESS_I2C=3Dm
> > > CONFIG_IIO_ST_PRESS_SPI=3Dm
> > > CONFIG_T5403=3Dm
> > > # CONFIG_HP206C is not set
> > > CONFIG_ZPA2326=3Dm
> > > CONFIG_ZPA2326_I2C=3Dm
> > > CONFIG_ZPA2326_SPI=3Dm
> > > # end of Pressure sensors
> > > =

> > > #
> > > # Lightning sensors
> > > #
> > > CONFIG_AS3935=3Dm
> > > # end of Lightning sensors
> > > =

> > > #
> > > # Proximity and distance sensors
> > > #
> > > CONFIG_ISL29501=3Dm
> > > CONFIG_LIDAR_LITE_V2=3Dm
> > > CONFIG_MB1232=3Dm
> > > # CONFIG_PING is not set
> > > # CONFIG_RFD77402 is not set
> > > CONFIG_SRF04=3Dm
> > > CONFIG_SX_COMMON=3Dm
> > > CONFIG_SX9310=3Dm
> > > # CONFIG_SX9324 is not set
> > > CONFIG_SX9360=3Dm
> > > CONFIG_SX9500=3Dm
> > > CONFIG_SRF08=3Dm
> > > CONFIG_VCNL3020=3Dm
> > > # CONFIG_VL53L0X_I2C is not set
> > > # end of Proximity and distance sensors
> > > =

> > > #
> > > # Resolver to digital converters
> > > #
> > > CONFIG_AD2S90=3Dm
> > > # CONFIG_AD2S1200 is not set
> > > # end of Resolver to digital converters
> > > =

> > > #
> > > # Temperature sensors
> > > #
> > > CONFIG_LTC2983=3Dm
> > > CONFIG_MAXIM_THERMOCOUPLE=3Dm
> > > CONFIG_MLX90614=3Dm
> > > CONFIG_MLX90632=3Dm
> > > CONFIG_TMP006=3Dm
> > > # CONFIG_TMP007 is not set
> > > CONFIG_TMP117=3Dm
> > > # CONFIG_TSYS01 is not set
> > > CONFIG_TSYS02D=3Dm
> > > CONFIG_MAX31856=3Dm
> > > # CONFIG_MAX31865 is not set
> > > # end of Temperature sensors
> > > =

> > > # CONFIG_NTB is not set
> > > CONFIG_VME_BUS=3Dy
> > > =

> > > #
> > > # VME Bridge Drivers
> > > #
> > > # CONFIG_VME_CA91CX42 is not set
> > > CONFIG_VME_TSI148=3Dy
> > > # CONFIG_VME_FAKE is not set
> > > =

> > > #
> > > # VME Board Drivers
> > > #
> > > # CONFIG_VMIVME_7805 is not set
> > > =

> > > #
> > > # VME Device Drivers
> > > #
> > > CONFIG_PWM=3Dy
> > > CONFIG_PWM_SYSFS=3Dy
> > > # CONFIG_PWM_DEBUG is not set
> > > CONFIG_PWM_DWC=3Dm
> > > CONFIG_PWM_LP3943=3Dm
> > > CONFIG_PWM_LPSS=3Dm
> > > CONFIG_PWM_LPSS_PCI=3Dm
> > > # CONFIG_PWM_LPSS_PLATFORM is not set
> > > CONFIG_PWM_PCA9685=3Dy
> > > # CONFIG_PWM_TWL is not set
> > > CONFIG_PWM_TWL_LED=3Dm
> > > =

> > > #
> > > # IRQ chip support
> > > #
> > > # end of IRQ chip support
> > > =

> > > CONFIG_IPACK_BUS=3Dy
> > > CONFIG_BOARD_TPCI200=3Dy
> > > # CONFIG_SERIAL_IPOCTAL is not set
> > > CONFIG_RESET_CONTROLLER=3Dy
> > > CONFIG_RESET_TI_SYSCON=3Dy
> > > =

> > > #
> > > # PHY Subsystem
> > > #
> > > CONFIG_GENERIC_PHY=3Dy
> > > # CONFIG_USB_LGM_PHY is not set
> > > CONFIG_PHY_CAN_TRANSCEIVER=3Dm
> > > =

> > > #
> > > # PHY drivers for Broadcom platforms
> > > #
> > > CONFIG_BCM_KONA_USB2_PHY=3Dy
> > > # end of PHY drivers for Broadcom platforms
> > > =

> > > CONFIG_PHY_PXA_28NM_HSIC=3Dm
> > > # CONFIG_PHY_PXA_28NM_USB2 is not set
> > > # CONFIG_PHY_CPCAP_USB is not set
> > > CONFIG_PHY_INTEL_LGM_EMMC=3Dy
> > > # end of PHY Subsystem
> > > =

> > > CONFIG_POWERCAP=3Dy
> > > CONFIG_INTEL_RAPL_CORE=3Dy
> > > CONFIG_INTEL_RAPL=3Dy
> > > # CONFIG_IDLE_INJECT is not set
> > > # CONFIG_MCB is not set
> > > =

> > > #
> > > # Performance monitor support
> > > #
> > > # end of Performance monitor support
> > > =

> > > CONFIG_RAS=3Dy
> > > CONFIG_USB4=3Dy
> > > CONFIG_USB4_DEBUGFS_WRITE=3Dy
> > > # CONFIG_USB4_DMA_TEST is not set
> > > =

> > > #
> > > # Android
> > > #
> > > # CONFIG_ANDROID is not set
> > > # end of Android
> > > =

> > > # CONFIG_LIBNVDIMM is not set
> > > CONFIG_DAX=3Dm
> > > CONFIG_DEV_DAX=3Dm
> > > CONFIG_DEV_DAX_KMEM=3Dm
> > > CONFIG_NVMEM=3Dy
> > > CONFIG_NVMEM_SYSFS=3Dy
> > > # CONFIG_RAVE_SP_EEPROM is not set
> > > # CONFIG_NVMEM_RMEM is not set
> > > =

> > > #
> > > # HW tracing support
> > > #
> > > # CONFIG_STM is not set
> > > CONFIG_INTEL_TH=3Dy
> > > CONFIG_INTEL_TH_PCI=3Dy
> > > # CONFIG_INTEL_TH_ACPI is not set
> > > CONFIG_INTEL_TH_GTH=3Dm
> > > CONFIG_INTEL_TH_MSU=3Dy
> > > CONFIG_INTEL_TH_PTI=3Dm
> > > # CONFIG_INTEL_TH_DEBUG is not set
> > > # end of HW tracing support
> > > =

> > > CONFIG_FPGA=3Dy
> > > CONFIG_ALTERA_PR_IP_CORE=3Dm
> > > # CONFIG_FPGA_MGR_ALTERA_PS_SPI is not set
> > > CONFIG_FPGA_MGR_ALTERA_CVP=3Dy
> > > CONFIG_FPGA_MGR_XILINX_SPI=3Dm
> > > CONFIG_FPGA_MGR_MACHXO2_SPI=3Dm
> > > # CONFIG_FPGA_BRIDGE is not set
> > > # CONFIG_FPGA_DFL is not set
> > > CONFIG_TEE=3Dm
> > > =

> > > #
> > > # TEE drivers
> > > #
> > > # end of TEE drivers
> > > =

> > > CONFIG_MULTIPLEXER=3Dy
> > > =

> > > #
> > > # Multiplexer drivers
> > > #
> > > # CONFIG_MUX_ADG792A is not set
> > > CONFIG_MUX_ADGS1408=3Dy
> > > # CONFIG_MUX_GPIO is not set
> > > # end of Multiplexer drivers
> > > =

> > > # CONFIG_UNISYS_VISORBUS is not set
> > > # CONFIG_SIOX is not set
> > > # CONFIG_SLIMBUS is not set
> > > # CONFIG_INTERCONNECT is not set
> > > CONFIG_COUNTER=3Dy
> > > CONFIG_INTERRUPT_CNT=3Dm
> > > # CONFIG_INTEL_QEP is not set
> > > # CONFIG_MOST is not set
> > > CONFIG_PECI=3Dm
> > > CONFIG_PECI_CPU=3Dm
> > > # end of Device Drivers
> > > =

> > > #
> > > # File systems
> > > #
> > > CONFIG_DCACHE_WORD_ACCESS=3Dy
> > > CONFIG_VALIDATE_FS_PARSER=3Dy
> > > CONFIG_FS_IOMAP=3Dy
> > > CONFIG_EXT2_FS=3Dm
> > > CONFIG_EXT2_FS_XATTR=3Dy
> > > # CONFIG_EXT2_FS_POSIX_ACL is not set
> > > CONFIG_EXT2_FS_SECURITY=3Dy
> > > # CONFIG_EXT3_FS is not set
> > > CONFIG_EXT4_FS=3Dy
> > > # CONFIG_EXT4_FS_POSIX_ACL is not set
> > > # CONFIG_EXT4_FS_SECURITY is not set
> > > CONFIG_EXT4_DEBUG=3Dy
> > > CONFIG_JBD2=3Dy
> > > # CONFIG_JBD2_DEBUG is not set
> > > CONFIG_FS_MBCACHE=3Dy
> > > CONFIG_REISERFS_FS=3Dy
> > > CONFIG_REISERFS_CHECK=3Dy
> > > CONFIG_REISERFS_PROC_INFO=3Dy
> > > # CONFIG_REISERFS_FS_XATTR is not set
> > > CONFIG_JFS_FS=3Dy
> > > # CONFIG_JFS_POSIX_ACL is not set
> > > # CONFIG_JFS_SECURITY is not set
> > > # CONFIG_JFS_DEBUG is not set
> > > # CONFIG_JFS_STATISTICS is not set
> > > CONFIG_XFS_FS=3Dm
> > > CONFIG_XFS_SUPPORT_V4=3Dy
> > > CONFIG_XFS_QUOTA=3Dy
> > > CONFIG_XFS_POSIX_ACL=3Dy
> > > CONFIG_XFS_RT=3Dy
> > > CONFIG_XFS_ONLINE_SCRUB=3Dy
> > > # CONFIG_XFS_ONLINE_REPAIR is not set
> > > CONFIG_XFS_DEBUG=3Dy
> > > CONFIG_XFS_ASSERT_FATAL=3Dy
> > > CONFIG_GFS2_FS=3Dy
> > > CONFIG_GFS2_FS_LOCKING_DLM=3Dy
> > > # CONFIG_OCFS2_FS is not set
> > > CONFIG_BTRFS_FS=3Dy
> > > CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> > > # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> > > # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> > > # CONFIG_BTRFS_DEBUG is not set
> > > CONFIG_BTRFS_ASSERT=3Dy
> > > # CONFIG_BTRFS_FS_REF_VERIFY is not set
> > > CONFIG_NILFS2_FS=3Dm
> > > # CONFIG_F2FS_FS is not set
> > > # CONFIG_ZONEFS_FS is not set
> > > CONFIG_FS_POSIX_ACL=3Dy
> > > CONFIG_EXPORTFS=3Dy
> > > CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> > > CONFIG_FILE_LOCKING=3Dy
> > > CONFIG_FS_ENCRYPTION=3Dy
> > > CONFIG_FS_ENCRYPTION_ALGS=3Dy
> > > # CONFIG_FS_VERITY is not set
> > > CONFIG_FSNOTIFY=3Dy
> > > CONFIG_DNOTIFY=3Dy
> > > CONFIG_INOTIFY_USER=3Dy
> > > # CONFIG_FANOTIFY is not set
> > > CONFIG_QUOTA=3Dy
> > > # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> > > # CONFIG_PRINT_QUOTA_WARNING is not set
> > > CONFIG_QUOTA_DEBUG=3Dy
> > > CONFIG_QUOTA_TREE=3Dm
> > > CONFIG_QFMT_V1=3Dy
> > > CONFIG_QFMT_V2=3Dm
> > > CONFIG_QUOTACTL=3Dy
> > > CONFIG_AUTOFS4_FS=3Dy
> > > CONFIG_AUTOFS_FS=3Dy
> > > CONFIG_FUSE_FS=3Dm
> > > CONFIG_CUSE=3Dm
> > > CONFIG_VIRTIO_FS=3Dm
> > > CONFIG_OVERLAY_FS=3Dm
> > > # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> > > CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> > > # CONFIG_OVERLAY_FS_INDEX is not set
> > > # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> > > # CONFIG_OVERLAY_FS_METACOPY is not set
> > > =

> > > #
> > > # Caches
> > > #
> > > CONFIG_NETFS_SUPPORT=3Dy
> > > CONFIG_NETFS_STATS=3Dy
> > > CONFIG_FSCACHE=3Dy
> > > CONFIG_FSCACHE_STATS=3Dy
> > > # CONFIG_FSCACHE_DEBUG is not set
> > > CONFIG_CACHEFILES=3Dm
> > > # CONFIG_CACHEFILES_DEBUG is not set
> > > # CONFIG_CACHEFILES_ERROR_INJECTION is not set
> > > # end of Caches
> > > =

> > > #
> > > # CD-ROM/DVD Filesystems
> > > #
> > > # CONFIG_ISO9660_FS is not set
> > > CONFIG_UDF_FS=3Dm
> > > # end of CD-ROM/DVD Filesystems
> > > =

> > > #
> > > # DOS/FAT/EXFAT/NT Filesystems
> > > #
> > > CONFIG_FAT_FS=3Dy
> > > CONFIG_MSDOS_FS=3Dy
> > > # CONFIG_VFAT_FS is not set
> > > CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> > > CONFIG_EXFAT_FS=3Dy
> > > CONFIG_EXFAT_DEFAULT_IOCHARSET=3D"utf8"
> > > CONFIG_NTFS_FS=3Dy
> > > CONFIG_NTFS_DEBUG=3Dy
> > > CONFIG_NTFS_RW=3Dy
> > > # CONFIG_NTFS3_FS is not set
> > > # end of DOS/FAT/EXFAT/NT Filesystems
> > > =

> > > #
> > > # Pseudo filesystems
> > > #
> > > CONFIG_PROC_FS=3Dy
> > > CONFIG_PROC_KCORE=3Dy
> > > CONFIG_PROC_SYSCTL=3Dy
> > > CONFIG_PROC_PAGE_MONITOR=3Dy
> > > CONFIG_PROC_CHILDREN=3Dy
> > > CONFIG_PROC_PID_ARCH_STATUS=3Dy
> > > CONFIG_KERNFS=3Dy
> > > CONFIG_SYSFS=3Dy
> > > CONFIG_TMPFS=3Dy
> > > CONFIG_TMPFS_POSIX_ACL=3Dy
> > > CONFIG_TMPFS_XATTR=3Dy
> > > CONFIG_TMPFS_INODE64=3Dy
> > > CONFIG_HUGETLBFS=3Dy
> > > CONFIG_HUGETLB_PAGE=3Dy
> > > CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=3Dy
> > > CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=3Dy
> > > # CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
> > > CONFIG_MEMFD_CREATE=3Dy
> > > CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> > > CONFIG_CONFIGFS_FS=3Dy
> > > # end of Pseudo filesystems
> > > =

> > > CONFIG_MISC_FILESYSTEMS=3Dy
> > > # CONFIG_ORANGEFS_FS is not set
> > > # CONFIG_ADFS_FS is not set
> > > CONFIG_AFFS_FS=3Dm
> > > CONFIG_ECRYPT_FS=3Dm
> > > # CONFIG_ECRYPT_FS_MESSAGING is not set
> > > # CONFIG_HFS_FS is not set
> > > CONFIG_HFSPLUS_FS=3Dm
> > > CONFIG_BEFS_FS=3Dy
> > > # CONFIG_BEFS_DEBUG is not set
> > > CONFIG_BFS_FS=3Dy
> > > CONFIG_EFS_FS=3Dm
> > > # CONFIG_JFFS2_FS is not set
> > > CONFIG_UBIFS_FS=3Dm
> > > CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> > > CONFIG_UBIFS_FS_LZO=3Dy
> > > # CONFIG_UBIFS_FS_ZLIB is not set
> > > CONFIG_UBIFS_FS_ZSTD=3Dy
> > > CONFIG_UBIFS_ATIME_SUPPORT=3Dy
> > > CONFIG_UBIFS_FS_XATTR=3Dy
> > > CONFIG_UBIFS_FS_SECURITY=3Dy
> > > CONFIG_UBIFS_FS_AUTHENTICATION=3Dy
> > > # CONFIG_CRAMFS is not set
> > > # CONFIG_SQUASHFS is not set
> > > CONFIG_VXFS_FS=3Dm
> > > CONFIG_MINIX_FS=3Dy
> > > # CONFIG_OMFS_FS is not set
> > > # CONFIG_HPFS_FS is not set
> > > CONFIG_QNX4FS_FS=3Dy
> > > # CONFIG_QNX6FS_FS is not set
> > > CONFIG_ROMFS_FS=3Dy
> > > # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
> > > CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> > > # CONFIG_ROMFS_BACKED_BY_BOTH is not set
> > > CONFIG_ROMFS_ON_MTD=3Dy
> > > # CONFIG_PSTORE is not set
> > > CONFIG_SYSV_FS=3Dy
> > > CONFIG_UFS_FS=3Dm
> > > # CONFIG_UFS_FS_WRITE is not set
> > > CONFIG_UFS_DEBUG=3Dy
> > > CONFIG_EROFS_FS=3Dy
> > > CONFIG_EROFS_FS_DEBUG=3Dy
> > > # CONFIG_EROFS_FS_XATTR is not set
> > > CONFIG_EROFS_FS_ZIP=3Dy
> > > # CONFIG_EROFS_FS_ZIP_LZMA is not set
> > > # CONFIG_NETWORK_FILESYSTEMS is not set
> > > CONFIG_NLS=3Dy
> > > CONFIG_NLS_DEFAULT=3D"iso8859-1"
> > > # CONFIG_NLS_CODEPAGE_437 is not set
> > > # CONFIG_NLS_CODEPAGE_737 is not set
> > > CONFIG_NLS_CODEPAGE_775=3Dy
> > > # CONFIG_NLS_CODEPAGE_850 is not set
> > > # CONFIG_NLS_CODEPAGE_852 is not set
> > > CONFIG_NLS_CODEPAGE_855=3Dy
> > > # CONFIG_NLS_CODEPAGE_857 is not set
> > > # CONFIG_NLS_CODEPAGE_860 is not set
> > > # CONFIG_NLS_CODEPAGE_861 is not set
> > > # CONFIG_NLS_CODEPAGE_862 is not set
> > > # CONFIG_NLS_CODEPAGE_863 is not set
> > > # CONFIG_NLS_CODEPAGE_864 is not set
> > > CONFIG_NLS_CODEPAGE_865=3Dy
> > > # CONFIG_NLS_CODEPAGE_866 is not set
> > > CONFIG_NLS_CODEPAGE_869=3Dm
> > > CONFIG_NLS_CODEPAGE_936=3Dy
> > > # CONFIG_NLS_CODEPAGE_950 is not set
> > > # CONFIG_NLS_CODEPAGE_932 is not set
> > > CONFIG_NLS_CODEPAGE_949=3Dy
> > > # CONFIG_NLS_CODEPAGE_874 is not set
> > > CONFIG_NLS_ISO8859_8=3Dm
> > > # CONFIG_NLS_CODEPAGE_1250 is not set
> > > # CONFIG_NLS_CODEPAGE_1251 is not set
> > > CONFIG_NLS_ASCII=3Dm
> > > CONFIG_NLS_ISO8859_1=3Dy
> > > CONFIG_NLS_ISO8859_2=3Dy
> > > CONFIG_NLS_ISO8859_3=3Dm
> > > # CONFIG_NLS_ISO8859_4 is not set
> > > CONFIG_NLS_ISO8859_5=3Dy
> > > # CONFIG_NLS_ISO8859_6 is not set
> > > CONFIG_NLS_ISO8859_7=3Dm
> > > CONFIG_NLS_ISO8859_9=3Dm
> > > CONFIG_NLS_ISO8859_13=3Dy
> > > CONFIG_NLS_ISO8859_14=3Dm
> > > # CONFIG_NLS_ISO8859_15 is not set
> > > CONFIG_NLS_KOI8_R=3Dm
> > > # CONFIG_NLS_KOI8_U is not set
> > > CONFIG_NLS_MAC_ROMAN=3Dy
> > > # CONFIG_NLS_MAC_CELTIC is not set
> > > CONFIG_NLS_MAC_CENTEURO=3Dy
> > > # CONFIG_NLS_MAC_CROATIAN is not set
> > > # CONFIG_NLS_MAC_CYRILLIC is not set
> > > CONFIG_NLS_MAC_GAELIC=3Dy
> > > CONFIG_NLS_MAC_GREEK=3Dm
> > > CONFIG_NLS_MAC_ICELAND=3Dm
> > > CONFIG_NLS_MAC_INUIT=3Dm
> > > # CONFIG_NLS_MAC_ROMANIAN is not set
> > > CONFIG_NLS_MAC_TURKISH=3Dy
> > > CONFIG_NLS_UTF8=3Dm
> > > CONFIG_DLM=3Dy
> > > CONFIG_DLM_DEBUG=3Dy
> > > # CONFIG_UNICODE is not set
> > > CONFIG_IO_WQ=3Dy
> > > # end of File systems
> > > =

> > > #
> > > # Security options
> > > #
> > > CONFIG_KEYS=3Dy
> > > CONFIG_KEYS_REQUEST_CACHE=3Dy
> > > # CONFIG_PERSISTENT_KEYRINGS is not set
> > > CONFIG_TRUSTED_KEYS=3Dm
> > > CONFIG_ENCRYPTED_KEYS=3Dm
> > > # CONFIG_USER_DECRYPTED_DATA is not set
> > > # CONFIG_KEY_DH_OPERATIONS is not set
> > > # CONFIG_KEY_NOTIFICATIONS is not set
> > > # CONFIG_SECURITY_DMESG_RESTRICT is not set
> > > CONFIG_SECURITY=3Dy
> > > # CONFIG_SECURITYFS is not set
> > > # CONFIG_SECURITY_NETWORK is not set
> > > CONFIG_PAGE_TABLE_ISOLATION=3Dy
> > > # CONFIG_SECURITY_INFINIBAND is not set
> > > # CONFIG_SECURITY_PATH is not set
> > > CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> > > CONFIG_HARDENED_USERCOPY=3Dy
> > > CONFIG_FORTIFY_SOURCE=3Dy
> > > CONFIG_STATIC_USERMODEHELPER=3Dy
> > > CONFIG_STATIC_USERMODEHELPER_PATH=3D"/sbin/usermode-helper"
> > > # CONFIG_SECURITY_SMACK is not set
> > > # CONFIG_SECURITY_TOMOYO is not set
> > > # CONFIG_SECURITY_APPARMOR is not set
> > > # CONFIG_SECURITY_LOADPIN is not set
> > > # CONFIG_SECURITY_YAMA is not set
> > > # CONFIG_SECURITY_SAFESETID is not set
> > > # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> > > # CONFIG_SECURITY_LANDLOCK is not set
> > > CONFIG_INTEGRITY=3Dy
> > > # CONFIG_INTEGRITY_SIGNATURE is not set
> > > CONFIG_INTEGRITY_AUDIT=3Dy
> > > # CONFIG_IMA is not set
> > > # CONFIG_EVM is not set
> > > CONFIG_DEFAULT_SECURITY_DAC=3Dy
> > > CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
> > > =

> > > #
> > > # Kernel hardening options
> > > #
> > > =

> > > #
> > > # Memory initialization
> > > #
> > > CONFIG_INIT_STACK_NONE=3Dy
> > > CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
> > > # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> > > CONFIG_CC_HAS_ZERO_CALL_USED_REGS=3Dy
> > > CONFIG_ZERO_CALL_USED_REGS=3Dy
> > > # end of Memory initialization
> > > # end of Kernel hardening options
> > > # end of Security options
> > > =

> > > CONFIG_XOR_BLOCKS=3Dy
> > > CONFIG_ASYNC_CORE=3Dm
> > > CONFIG_ASYNC_MEMCPY=3Dm
> > > CONFIG_ASYNC_XOR=3Dm
> > > CONFIG_ASYNC_PQ=3Dm
> > > CONFIG_ASYNC_RAID6_RECOV=3Dm
> > > CONFIG_CRYPTO=3Dy
> > > =

> > > #
> > > # Crypto core or helper
> > > #
> > > CONFIG_CRYPTO_ALGAPI=3Dy
> > > CONFIG_CRYPTO_ALGAPI2=3Dy
> > > CONFIG_CRYPTO_AEAD=3Dy
> > > CONFIG_CRYPTO_AEAD2=3Dy
> > > CONFIG_CRYPTO_SKCIPHER=3Dy
> > > CONFIG_CRYPTO_SKCIPHER2=3Dy
> > > CONFIG_CRYPTO_HASH=3Dy
> > > CONFIG_CRYPTO_HASH2=3Dy
> > > CONFIG_CRYPTO_RNG=3Dy
> > > CONFIG_CRYPTO_RNG2=3Dy
> > > CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> > > CONFIG_CRYPTO_AKCIPHER2=3Dy
> > > CONFIG_CRYPTO_AKCIPHER=3Dy
> > > CONFIG_CRYPTO_KPP2=3Dy
> > > CONFIG_CRYPTO_KPP=3Dy
> > > CONFIG_CRYPTO_ACOMP2=3Dy
> > > CONFIG_CRYPTO_MANAGER=3Dy
> > > CONFIG_CRYPTO_MANAGER2=3Dy
> > > CONFIG_CRYPTO_USER=3Dm
> > > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> > > CONFIG_CRYPTO_GF128MUL=3Dy
> > > CONFIG_CRYPTO_NULL=3Dy
> > > CONFIG_CRYPTO_NULL2=3Dy
> > > CONFIG_CRYPTO_CRYPTD=3Dy
> > > CONFIG_CRYPTO_AUTHENC=3Dy
> > > # CONFIG_CRYPTO_TEST is not set
> > > CONFIG_CRYPTO_SIMD=3Dy
> > > =

> > > #
> > > # Public-key cryptography
> > > #
> > > CONFIG_CRYPTO_RSA=3Dy
> > > # CONFIG_CRYPTO_DH is not set
> > > CONFIG_CRYPTO_ECC=3Dy
> > > CONFIG_CRYPTO_ECDH=3Dy
> > > CONFIG_CRYPTO_ECDSA=3Dy
> > > CONFIG_CRYPTO_ECRDSA=3Dm
> > > # CONFIG_CRYPTO_SM2 is not set
> > > CONFIG_CRYPTO_CURVE25519=3Dy
> > > # CONFIG_CRYPTO_CURVE25519_X86 is not set
> > > =

> > > #
> > > # Authenticated Encryption with Associated Data
> > > #
> > > CONFIG_CRYPTO_CCM=3Dm
> > > CONFIG_CRYPTO_GCM=3Dy
> > > CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> > > CONFIG_CRYPTO_AEGIS128=3Dm
> > > # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> > > CONFIG_CRYPTO_SEQIV=3Dy
> > > CONFIG_CRYPTO_ECHAINIV=3Dy
> > > =

> > > #
> > > # Block modes
> > > #
> > > CONFIG_CRYPTO_CBC=3Dy
> > > CONFIG_CRYPTO_CFB=3Dy
> > > CONFIG_CRYPTO_CTR=3Dy
> > > CONFIG_CRYPTO_CTS=3Dy
> > > CONFIG_CRYPTO_ECB=3Dy
> > > CONFIG_CRYPTO_LRW=3Dy
> > > CONFIG_CRYPTO_OFB=3Dy
> > > CONFIG_CRYPTO_PCBC=3Dy
> > > CONFIG_CRYPTO_XTS=3Dm
> > > CONFIG_CRYPTO_KEYWRAP=3Dm
> > > CONFIG_CRYPTO_NHPOLY1305=3Dy
> > > CONFIG_CRYPTO_NHPOLY1305_SSE2=3Dm
> > > CONFIG_CRYPTO_NHPOLY1305_AVX2=3Dy
> > > CONFIG_CRYPTO_ADIANTUM=3Dm
> > > CONFIG_CRYPTO_ESSIV=3Dm
> > > =

> > > #
> > > # Hash modes
> > > #
> > > CONFIG_CRYPTO_CMAC=3Dy
> > > CONFIG_CRYPTO_HMAC=3Dy
> > > CONFIG_CRYPTO_XCBC=3Dy
> > > CONFIG_CRYPTO_VMAC=3Dm
> > > =

> > > #
> > > # Digest
> > > #
> > > CONFIG_CRYPTO_CRC32C=3Dy
> > > CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> > > CONFIG_CRYPTO_CRC32=3Dm
> > > CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> > > CONFIG_CRYPTO_XXHASH=3Dy
> > > CONFIG_CRYPTO_BLAKE2B=3Dy
> > > CONFIG_CRYPTO_BLAKE2S=3Dm
> > > CONFIG_CRYPTO_BLAKE2S_X86=3Dy
> > > CONFIG_CRYPTO_CRCT10DIF=3Dy
> > > CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
> > > CONFIG_CRYPTO_CRC64_ROCKSOFT=3Dy
> > > CONFIG_CRYPTO_GHASH=3Dy
> > > CONFIG_CRYPTO_POLY1305=3Dy
> > > CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> > > # CONFIG_CRYPTO_MD4 is not set
> > > CONFIG_CRYPTO_MD5=3Dy
> > > # CONFIG_CRYPTO_MICHAEL_MIC is not set
> > > # CONFIG_CRYPTO_RMD160 is not set
> > > CONFIG_CRYPTO_SHA1=3Dy
> > > # CONFIG_CRYPTO_SHA1_SSSE3 is not set
> > > # CONFIG_CRYPTO_SHA256_SSSE3 is not set
> > > CONFIG_CRYPTO_SHA512_SSSE3=3Dm
> > > CONFIG_CRYPTO_SHA256=3Dy
> > > CONFIG_CRYPTO_SHA512=3Dy
> > > CONFIG_CRYPTO_SHA3=3Dm
> > > CONFIG_CRYPTO_SM3=3Dy
> > > CONFIG_CRYPTO_SM3_AVX_X86_64=3Dy
> > > CONFIG_CRYPTO_STREEBOG=3Dm
> > > CONFIG_CRYPTO_WP512=3Dy
> > > CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
> > > =

> > > #
> > > # Ciphers
> > > #
> > > CONFIG_CRYPTO_AES=3Dy
> > > CONFIG_CRYPTO_AES_TI=3Dm
> > > # CONFIG_CRYPTO_AES_NI_INTEL is not set
> > > CONFIG_CRYPTO_BLOWFISH=3Dm
> > > CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> > > CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
> > > # CONFIG_CRYPTO_CAMELLIA is not set
> > > CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> > > CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
> > > CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
> > > CONFIG_CRYPTO_CAST_COMMON=3Dy
> > > CONFIG_CRYPTO_CAST5=3Dy
> > > CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> > > CONFIG_CRYPTO_CAST6=3Dy
> > > CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm
> > > CONFIG_CRYPTO_DES=3Dm
> > > CONFIG_CRYPTO_DES3_EDE_X86_64=3Dm
> > > CONFIG_CRYPTO_FCRYPT=3Dm
> > > CONFIG_CRYPTO_CHACHA20=3Dy
> > > CONFIG_CRYPTO_CHACHA20_X86_64=3Dm
> > > CONFIG_CRYPTO_SERPENT=3Dy
> > > CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> > > CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
> > > CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
> > > CONFIG_CRYPTO_SM4=3Dm
> > > CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=3Dy
> > > CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=3Dy
> > > CONFIG_CRYPTO_TWOFISH=3Dy
> > > CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> > > CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> > > CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> > > CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
> > > =

> > > #
> > > # Compression
> > > #
> > > CONFIG_CRYPTO_DEFLATE=3Dy
> > > CONFIG_CRYPTO_LZO=3Dm
> > > # CONFIG_CRYPTO_842 is not set
> > > CONFIG_CRYPTO_LZ4=3Dy
> > > CONFIG_CRYPTO_LZ4HC=3Dy
> > > CONFIG_CRYPTO_ZSTD=3Dm
> > > =

> > > #
> > > # Random Number Generation
> > > #
> > > CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> > > CONFIG_CRYPTO_DRBG_MENU=3Dy
> > > CONFIG_CRYPTO_DRBG_HMAC=3Dy
> > > CONFIG_CRYPTO_DRBG_HASH=3Dy
> > > # CONFIG_CRYPTO_DRBG_CTR is not set
> > > CONFIG_CRYPTO_DRBG=3Dy
> > > CONFIG_CRYPTO_JITTERENTROPY=3Dy
> > > CONFIG_CRYPTO_USER_API=3Dy
> > > CONFIG_CRYPTO_USER_API_HASH=3Dy
> > > # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> > > CONFIG_CRYPTO_USER_API_RNG=3Dy
> > > CONFIG_CRYPTO_USER_API_RNG_CAVP=3Dy
> > > # CONFIG_CRYPTO_USER_API_AEAD is not set
> > > # CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
> > > CONFIG_CRYPTO_STATS=3Dy
> > > CONFIG_CRYPTO_HASH_INFO=3Dy
> > > # CONFIG_CRYPTO_HW is not set
> > > CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> > > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> > > CONFIG_X509_CERTIFICATE_PARSER=3Dy
> > > CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy
> > > CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> > > # CONFIG_PKCS7_TEST_KEY is not set
> > > # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
> > > =

> > > #
> > > # Certificates for signature checking
> > > #
> > > CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> > > CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> > > CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
> > > CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
> > > # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> > > # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> > > # end of Certificates for signature checking
> > > =

> > > CONFIG_BINARY_PRINTF=3Dy
> > > =

> > > #
> > > # Library routines
> > > #
> > > CONFIG_RAID6_PQ=3Dy
> > > CONFIG_RAID6_PQ_BENCHMARK=3Dy
> > > CONFIG_LINEAR_RANGES=3Dy
> > > CONFIG_PACKING=3Dy
> > > CONFIG_BITREVERSE=3Dy
> > > CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> > > CONFIG_GENERIC_STRNLEN_USER=3Dy
> > > CONFIG_GENERIC_NET_UTILS=3Dy
> > > CONFIG_CORDIC=3Dm
> > > CONFIG_PRIME_NUMBERS=3Dy
> > > CONFIG_RATIONAL=3Dy
> > > CONFIG_GENERIC_PCI_IOMAP=3Dy
> > > CONFIG_GENERIC_IOMAP=3Dy
> > > CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> > > CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> > > CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> > > =

> > > #
> > > # Crypto library routines
> > > #
> > > CONFIG_CRYPTO_LIB_AES=3Dy
> > > CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=3Dy
> > > CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
> > > CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm
> > > CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> > > CONFIG_CRYPTO_LIB_CHACHA=3Dm
> > > CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3Dy
> > > CONFIG_CRYPTO_LIB_CURVE25519=3Dy
> > > CONFIG_CRYPTO_LIB_DES=3Dm
> > > CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> > > CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dy
> > > CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> > > CONFIG_CRYPTO_LIB_POLY1305=3Dy
> > > CONFIG_CRYPTO_LIB_CHACHA20POLY1305=3Dm
> > > CONFIG_CRYPTO_LIB_SHA256=3Dy
> > > CONFIG_CRYPTO_LIB_SM3=3Dy
> > > CONFIG_CRYPTO_LIB_SM4=3Dy
> > > # end of Crypto library routines
> > > =

> > > CONFIG_CRC_CCITT=3Dy
> > > CONFIG_CRC16=3Dy
> > > CONFIG_CRC_T10DIF=3Dy
> > > CONFIG_CRC64_ROCKSOFT=3Dy
> > > CONFIG_CRC_ITU_T=3Dm
> > > CONFIG_CRC32=3Dy
> > > # CONFIG_CRC32_SELFTEST is not set
> > > CONFIG_CRC32_SLICEBY8=3Dy
> > > # CONFIG_CRC32_SLICEBY4 is not set
> > > # CONFIG_CRC32_SARWATE is not set
> > > # CONFIG_CRC32_BIT is not set
> > > CONFIG_CRC64=3Dy
> > > CONFIG_CRC4=3Dy
> > > CONFIG_CRC7=3Dm
> > > CONFIG_LIBCRC32C=3Dy
> > > CONFIG_CRC8=3Dm
> > > CONFIG_XXHASH=3Dy
> > > # CONFIG_RANDOM32_SELFTEST is not set
> > > CONFIG_ZLIB_INFLATE=3Dy
> > > CONFIG_ZLIB_DEFLATE=3Dy
> > > CONFIG_LZO_COMPRESS=3Dy
> > > CONFIG_LZO_DECOMPRESS=3Dy
> > > CONFIG_LZ4_COMPRESS=3Dy
> > > CONFIG_LZ4HC_COMPRESS=3Dy
> > > CONFIG_LZ4_DECOMPRESS=3Dy
> > > CONFIG_ZSTD_COMPRESS=3Dy
> > > CONFIG_ZSTD_DECOMPRESS=3Dy
> > > CONFIG_XZ_DEC=3Dy
> > > CONFIG_XZ_DEC_X86=3Dy
> > > CONFIG_XZ_DEC_POWERPC=3Dy
> > > CONFIG_XZ_DEC_IA64=3Dy
> > > CONFIG_XZ_DEC_ARM=3Dy
> > > # CONFIG_XZ_DEC_ARMTHUMB is not set
> > > CONFIG_XZ_DEC_SPARC=3Dy
> > > CONFIG_XZ_DEC_MICROLZMA=3Dy
> > > CONFIG_XZ_DEC_BCJ=3Dy
> > > # CONFIG_XZ_DEC_TEST is not set
> > > CONFIG_DECOMPRESS_GZIP=3Dy
> > > CONFIG_DECOMPRESS_BZIP2=3Dy
> > > CONFIG_DECOMPRESS_XZ=3Dy
> > > CONFIG_DECOMPRESS_LZO=3Dy
> > > CONFIG_DECOMPRESS_LZ4=3Dy
> > > CONFIG_GENERIC_ALLOCATOR=3Dy
> > > CONFIG_REED_SOLOMON=3Dm
> > > CONFIG_REED_SOLOMON_DEC8=3Dy
> > > CONFIG_BCH=3Dy
> > > CONFIG_INTERVAL_TREE=3Dy
> > > CONFIG_XARRAY_MULTI=3Dy
> > > CONFIG_ASSOCIATIVE_ARRAY=3Dy
> > > CONFIG_HAS_IOMEM=3Dy
> > > CONFIG_HAS_IOPORT_MAP=3Dy
> > > CONFIG_HAS_DMA=3Dy
> > > CONFIG_DMA_OPS=3Dy
> > > CONFIG_NEED_SG_DMA_LENGTH=3Dy
> > > CONFIG_NEED_DMA_MAP_STATE=3Dy
> > > CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> > > CONFIG_SWIOTLB=3Dy
> > > CONFIG_DMA_CMA=3Dy
> > > CONFIG_DMA_PERNUMA_CMA=3Dy
> > > =

> > > #
> > > # Default contiguous memory area size:
> > > #
> > > CONFIG_CMA_SIZE_MBYTES=3D0
> > > CONFIG_CMA_SIZE_PERCENTAGE=3D0
> > > # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> > > # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> > > # CONFIG_CMA_SIZE_SEL_MIN is not set
> > > CONFIG_CMA_SIZE_SEL_MAX=3Dy
> > > CONFIG_CMA_ALIGNMENT=3D8
> > > # CONFIG_DMA_API_DEBUG is not set
> > > CONFIG_DMA_MAP_BENCHMARK=3Dy
> > > CONFIG_SGL_ALLOC=3Dy
> > > CONFIG_DQL=3Dy
> > > CONFIG_GLOB=3Dy
> > > # CONFIG_GLOB_SELFTEST is not set
> > > CONFIG_NLATTR=3Dy
> > > CONFIG_CLZ_TAB=3Dy
> > > CONFIG_IRQ_POLL=3Dy
> > > CONFIG_MPILIB=3Dy
> > > CONFIG_DIMLIB=3Dy
> > > CONFIG_OID_REGISTRY=3Dy
> > > CONFIG_HAVE_GENERIC_VDSO=3Dy
> > > CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> > > CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> > > CONFIG_FONT_SUPPORT=3Dm
> > > CONFIG_FONT_8x16=3Dy
> > > CONFIG_FONT_AUTOSELECT=3Dy
> > > CONFIG_SG_POOL=3Dy
> > > CONFIG_ARCH_HAS_PMEM_API=3Dy
> > > CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> > > CONFIG_ARCH_HAS_COPY_MC=3Dy
> > > CONFIG_ARCH_STACKWALK=3Dy
> > > CONFIG_STACKDEPOT=3Dy
> > > CONFIG_STACK_HASH_ORDER=3D20
> > > CONFIG_REF_TRACKER=3Dy
> > > CONFIG_SBITMAP=3Dy
> > > # end of Library routines
> > > =

> > > CONFIG_ASN1_ENCODER=3Dm
> > > =

> > > #
> > > # Kernel hacking
> > > #
> > > =

> > > #
> > > # printk and dmesg options
> > > #
> > > CONFIG_PRINTK_TIME=3Dy
> > > CONFIG_PRINTK_CALLER=3Dy
> > > CONFIG_STACKTRACE_BUILD_ID=3Dy
> > > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> > > CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> > > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> > > # CONFIG_BOOT_PRINTK_DELAY is not set
> > > # CONFIG_DYNAMIC_DEBUG is not set
> > > # CONFIG_DYNAMIC_DEBUG_CORE is not set
> > > # CONFIG_SYMBOLIC_ERRNAME is not set
> > > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > > # end of printk and dmesg options
> > > =

> > > CONFIG_DEBUG_KERNEL=3Dy
> > > CONFIG_DEBUG_MISC=3Dy
> > > =

> > > #
> > > # Compile-time checks and compiler options
> > > #
> > > CONFIG_DEBUG_INFO=3Dy
> > > # CONFIG_DEBUG_INFO_NONE is not set
> > > # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> > > CONFIG_DEBUG_INFO_DWARF4=3Dy
> > > # CONFIG_DEBUG_INFO_DWARF5 is not set
> > > CONFIG_DEBUG_INFO_REDUCED=3Dy
> > > CONFIG_DEBUG_INFO_COMPRESSED=3Dy
> > > # CONFIG_DEBUG_INFO_SPLIT is not set
> > > CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> > > # CONFIG_GDB_SCRIPTS is not set
> > > CONFIG_FRAME_WARN=3D2048
> > > CONFIG_STRIP_ASM_SYMS=3Dy
> > > CONFIG_READABLE_ASM=3Dy
> > > CONFIG_HEADERS_INSTALL=3Dy
> > > CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> > > CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> > > # CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
> > > CONFIG_STACK_VALIDATION=3Dy
> > > CONFIG_VMLINUX_VALIDATION=3Dy
> > > # CONFIG_VMLINUX_MAP is not set
> > > # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> > > # end of Compile-time checks and compiler options
> > > =

> > > #
> > > # Generic Kernel Debugging Instruments
> > > #
> > > CONFIG_MAGIC_SYSRQ=3Dy
> > > CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> > > CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> > > CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> > > CONFIG_DEBUG_FS=3Dy
> > > CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> > > # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> > > # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> > > CONFIG_HAVE_ARCH_KGDB=3Dy
> > > # CONFIG_KGDB is not set
> > > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> > > CONFIG_UBSAN=3Dy
> > > # CONFIG_UBSAN_TRAP is not set
> > > CONFIG_CC_HAS_UBSAN_BOUNDS=3Dy
> > > CONFIG_UBSAN_BOUNDS=3Dy
> > > CONFIG_UBSAN_ONLY_BOUNDS=3Dy
> > > CONFIG_UBSAN_SHIFT=3Dy
> > > # CONFIG_UBSAN_DIV_ZERO is not set
> > > # CONFIG_UBSAN_BOOL is not set
> > > # CONFIG_UBSAN_ENUM is not set
> > > # CONFIG_UBSAN_ALIGNMENT is not set
> > > CONFIG_UBSAN_SANITIZE_ALL=3Dy
> > > # CONFIG_TEST_UBSAN is not set
> > > CONFIG_HAVE_ARCH_KCSAN=3Dy
> > > CONFIG_HAVE_KCSAN_COMPILER=3Dy
> > > CONFIG_KCSAN=3Dy
> > > # CONFIG_KCSAN_VERBOSE is not set
> > > # CONFIG_KCSAN_SELFTEST is not set
> > > CONFIG_KCSAN_EARLY_ENABLE=3Dy
> > > CONFIG_KCSAN_NUM_WATCHPOINTS=3D64
> > > CONFIG_KCSAN_UDELAY_TASK=3D80
> > > CONFIG_KCSAN_UDELAY_INTERRUPT=3D20
> > > CONFIG_KCSAN_DELAY_RANDOMIZE=3Dy
> > > CONFIG_KCSAN_SKIP_WATCH=3D4000
> > > CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE=3Dy
> > > # CONFIG_KCSAN_INTERRUPT_WATCHER is not set
> > > CONFIG_KCSAN_REPORT_ONCE_IN_MS=3D3000
> > > # CONFIG_KCSAN_REPORT_RACE_UNKNOWN_ORIGIN is not set
> > > # CONFIG_KCSAN_STRICT is not set
> > > # CONFIG_KCSAN_REPORT_VALUE_CHANGE_ONLY is not set
> > > CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC=3Dy
> > > # CONFIG_KCSAN_IGNORE_ATOMICS is not set
> > > # end of Generic Kernel Debugging Instruments
> > > =

> > > #
> > > # Networking Debugging
> > > #
> > > # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> > > CONFIG_NET_NS_REFCNT_TRACKER=3Dy
> > > # end of Networking Debugging
> > > =

> > > #
> > > # Memory Debugging
> > > #
> > > CONFIG_PAGE_EXTENSION=3Dy
> > > # CONFIG_DEBUG_PAGEALLOC is not set
> > > # CONFIG_PAGE_OWNER is not set
> > > CONFIG_PAGE_TABLE_CHECK=3Dy
> > > # CONFIG_PAGE_TABLE_CHECK_ENFORCED is not set
> > > # CONFIG_PAGE_POISONING is not set
> > > CONFIG_DEBUG_PAGE_REF=3Dy
> > > # CONFIG_DEBUG_RODATA_TEST is not set
> > > CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> > > CONFIG_DEBUG_WX=3Dy
> > > CONFIG_GENERIC_PTDUMP=3Dy
> > > CONFIG_PTDUMP_CORE=3Dy
> > > CONFIG_PTDUMP_DEBUGFS=3Dy
> > > # CONFIG_DEBUG_OBJECTS is not set
> > > CONFIG_SLUB_DEBUG_ON=3Dy
> > > CONFIG_SLUB_STATS=3Dy
> > > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > > # CONFIG_DEBUG_KMEMLEAK is not set
> > > CONFIG_DEBUG_STACK_USAGE=3Dy
> > > # CONFIG_SCHED_STACK_END_CHECK is not set
> > > CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> > > CONFIG_DEBUG_VM=3Dy
> > > CONFIG_DEBUG_VM_VMACACHE=3Dy
> > > CONFIG_DEBUG_VM_RB=3Dy
> > > CONFIG_DEBUG_VM_PGFLAGS=3Dy
> > > CONFIG_DEBUG_VM_PGTABLE=3Dy
> > > CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> > > # CONFIG_DEBUG_VIRTUAL is not set
> > > # CONFIG_DEBUG_MEMORY_INIT is not set
> > > CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=3Dm
> > > CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=3Dy
> > > # CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
> > > CONFIG_HAVE_ARCH_KASAN=3Dy
> > > CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> > > CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> > > CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> > > # CONFIG_KASAN is not set
> > > CONFIG_HAVE_ARCH_KFENCE=3Dy
> > > CONFIG_KFENCE=3Dy
> > > CONFIG_KFENCE_SAMPLE_INTERVAL=3D100
> > > CONFIG_KFENCE_NUM_OBJECTS=3D255
> > > # CONFIG_KFENCE_DEFERRABLE is not set
> > > CONFIG_KFENCE_STRESS_TEST_FAULTS=3D0
> > > # end of Memory Debugging
> > > =

> > > CONFIG_DEBUG_SHIRQ=3Dy
> > > =

> > > #
> > > # Debug Oops, Lockups and Hangs
> > > #
> > > CONFIG_PANIC_ON_OOPS=3Dy
> > > CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > > CONFIG_PANIC_TIMEOUT=3D0
> > > CONFIG_LOCKUP_DETECTOR=3Dy
> > > CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> > > # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> > > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> > > CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> > > # CONFIG_HARDLOCKUP_DETECTOR is not set
> > > CONFIG_DETECT_HUNG_TASK=3Dy
> > > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480
> > > # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> > > CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> > > CONFIG_WQ_WATCHDOG=3Dy
> > > # CONFIG_TEST_LOCKUP is not set
> > > # end of Debug Oops, Lockups and Hangs
> > > =

> > > #
> > > # Scheduler Debugging
> > > #
> > > # CONFIG_SCHED_DEBUG is not set
> > > CONFIG_SCHED_INFO=3Dy
> > > CONFIG_SCHEDSTATS=3Dy
> > > # end of Scheduler Debugging
> > > =

> > > # CONFIG_DEBUG_TIMEKEEPING is not set
> > > =

> > > #
> > > # Lock Debugging (spinlocks, mutexes, etc...)
> > > #
> > > CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> > > CONFIG_PROVE_LOCKING=3Dy
> > > # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> > > # CONFIG_LOCK_STAT is not set
> > > CONFIG_DEBUG_RT_MUTEXES=3Dy
> > > CONFIG_DEBUG_SPINLOCK=3Dy
> > > CONFIG_DEBUG_MUTEXES=3Dy
> > > CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> > > CONFIG_DEBUG_RWSEMS=3Dy
> > > CONFIG_DEBUG_LOCK_ALLOC=3Dy
> > > CONFIG_LOCKDEP=3Dy
> > > CONFIG_LOCKDEP_BITS=3D15
> > > CONFIG_LOCKDEP_CHAINS_BITS=3D16
> > > CONFIG_LOCKDEP_STACK_TRACE_BITS=3D19
> > > CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=3D14
> > > CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=3D12
> > > # CONFIG_DEBUG_LOCKDEP is not set
> > > CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> > > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > > CONFIG_LOCK_TORTURE_TEST=3Dm
> > > # CONFIG_WW_MUTEX_SELFTEST is not set
> > > # CONFIG_SCF_TORTURE_TEST is not set
> > > CONFIG_CSD_LOCK_WAIT_DEBUG=3Dy
> > > # end of Lock Debugging (spinlocks, mutexes, etc...)
> > > =

> > > CONFIG_TRACE_IRQFLAGS=3Dy
> > > CONFIG_TRACE_IRQFLAGS_NMI=3Dy
> > > CONFIG_DEBUG_IRQFLAGS=3Dy
> > > CONFIG_STACKTRACE=3Dy
> > > CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> > > # CONFIG_DEBUG_KOBJECT is not set
> > > =

> > > #
> > > # Debug kernel data structures
> > > #
> > > CONFIG_DEBUG_LIST=3Dy
> > > # CONFIG_DEBUG_PLIST is not set
> > > CONFIG_DEBUG_SG=3Dy
> > > # CONFIG_DEBUG_NOTIFIERS is not set
> > > CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> > > # end of Debug kernel data structures
> > > =

> > > CONFIG_DEBUG_CREDENTIALS=3Dy
> > > =

> > > #
> > > # RCU Debugging
> > > #
> > > CONFIG_PROVE_RCU=3Dy
> > > CONFIG_TORTURE_TEST=3Dm
> > > CONFIG_RCU_SCALE_TEST=3Dm
> > > CONFIG_RCU_TORTURE_TEST=3Dm
> > > # CONFIG_RCU_REF_SCALE_TEST is not set
> > > CONFIG_RCU_TRACE=3Dy
> > > CONFIG_RCU_EQS_DEBUG=3Dy
> > > # end of RCU Debugging
> > > =

> > > CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> > > CONFIG_LATENCYTOP=3Dy
> > > CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> > > CONFIG_NOP_TRACER=3Dy
> > > CONFIG_HAVE_RETHOOK=3Dy
> > > CONFIG_HAVE_FUNCTION_TRACER=3Dy
> > > CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> > > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> > > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> > > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> > > CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> > > CONFIG_HAVE_FENTRY=3Dy
> > > CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
> > > CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> > > CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=3Dy
> > > CONFIG_TRACE_CLOCK=3Dy
> > > CONFIG_RING_BUFFER=3Dy
> > > CONFIG_EVENT_TRACING=3Dy
> > > CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> > > CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> > > CONFIG_TRACING=3Dy
> > > CONFIG_GENERIC_TRACER=3Dy
> > > CONFIG_TRACING_SUPPORT=3Dy
> > > CONFIG_FTRACE=3Dy
> > > # CONFIG_BOOTTIME_TRACING is not set
> > > CONFIG_FUNCTION_TRACER=3Dy
> > > # CONFIG_DYNAMIC_FTRACE is not set
> > > CONFIG_FUNCTION_PROFILER=3Dy
> > > # CONFIG_STACK_TRACER is not set
> > > # CONFIG_IRQSOFF_TRACER is not set
> > > # CONFIG_SCHED_TRACER is not set
> > > # CONFIG_HWLAT_TRACER is not set
> > > CONFIG_OSNOISE_TRACER=3Dy
> > > CONFIG_TIMERLAT_TRACER=3Dy
> > > CONFIG_MMIOTRACE=3Dy
> > > # CONFIG_FTRACE_SYSCALLS is not set
> > > # CONFIG_TRACER_SNAPSHOT is not set
> > > CONFIG_BRANCH_PROFILE_NONE=3Dy
> > > # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> > > # CONFIG_BLK_DEV_IO_TRACE is not set
> > > CONFIG_UPROBE_EVENTS=3Dy
> > > CONFIG_BPF_EVENTS=3Dy
> > > CONFIG_DYNAMIC_EVENTS=3Dy
> > > CONFIG_PROBE_EVENTS=3Dy
> > > CONFIG_TRACING_MAP=3Dy
> > > CONFIG_SYNTH_EVENTS=3Dy
> > > CONFIG_HIST_TRIGGERS=3Dy
> > > CONFIG_TRACE_EVENT_INJECT=3Dy
> > > CONFIG_TRACEPOINT_BENCHMARK=3Dy
> > > CONFIG_RING_BUFFER_BENCHMARK=3Dm
> > > CONFIG_TRACE_EVAL_MAP_FILE=3Dy
> > > CONFIG_FTRACE_RECORD_RECURSION=3Dy
> > > CONFIG_FTRACE_RECORD_RECURSION_SIZE=3D128
> > > # CONFIG_RING_BUFFER_RECORD_RECURSION is not set
> > > # CONFIG_FTRACE_STARTUP_TEST is not set
> > > # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> > > CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=3Dy
> > > # CONFIG_MMIOTRACE_TEST is not set
> > > # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> > > # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> > > # CONFIG_HIST_TRIGGERS_DEBUG is not set
> > > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > > CONFIG_SAMPLES=3Dy
> > > # CONFIG_SAMPLE_AUXDISPLAY is not set
> > > CONFIG_SAMPLE_TRACE_EVENTS=3Dm
> > > # CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
> > > CONFIG_SAMPLE_TRACE_PRINTK=3Dm
> > > CONFIG_SAMPLE_TRACE_ARRAY=3Dm
> > > CONFIG_SAMPLE_KOBJECT=3Dm
> > > # CONFIG_SAMPLE_HW_BREAKPOINT is not set
> > > # CONFIG_SAMPLE_KFIFO is not set
> > > CONFIG_SAMPLE_RPMSG_CLIENT=3Dm
> > > CONFIG_SAMPLE_CONFIGFS=3Dm
> > > CONFIG_SAMPLE_CONNECTOR=3Dm
> > > # CONFIG_SAMPLE_HIDRAW is not set
> > > # CONFIG_SAMPLE_LANDLOCK is not set
> > > # CONFIG_SAMPLE_PIDFD is not set
> > > CONFIG_SAMPLE_SECCOMP=3Dy
> > > # CONFIG_SAMPLE_TIMER is not set
> > > # CONFIG_SAMPLE_UHID is not set
> > > # CONFIG_SAMPLE_VFIO_MDEV_MTTY is not set
> > > # CONFIG_SAMPLE_VFIO_MDEV_MDPY is not set
> > > # CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
> > > CONFIG_SAMPLE_VFIO_MDEV_MBOCHS=3Dm
> > > CONFIG_SAMPLE_ANDROID_BINDERFS=3Dy
> > > # CONFIG_SAMPLE_VFS is not set
> > > # CONFIG_SAMPLE_WATCHDOG is not set
> > > # CONFIG_SAMPLE_WATCH_QUEUE is not set
> > > CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=3Dy
> > > CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=3Dy
> > > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> > > # CONFIG_STRICT_DEVMEM is not set
> > > =

> > > #
> > > # x86 Debugging
> > > #
> > > # CONFIG_DEBUG_AID_FOR_SYZBOT is not set
> > > CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> > > CONFIG_EARLY_PRINTK_USB=3Dy
> > > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > > CONFIG_EARLY_PRINTK=3Dy
> > > CONFIG_EARLY_PRINTK_DBGP=3Dy
> > > CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> > > # CONFIG_DEBUG_TLBFLUSH is not set
> > > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > > # CONFIG_X86_DECODER_SELFTEST is not set
> > > # CONFIG_IO_DELAY_0X80 is not set
> > > CONFIG_IO_DELAY_0XED=3Dy
> > > # CONFIG_IO_DELAY_UDELAY is not set
> > > # CONFIG_IO_DELAY_NONE is not set
> > > # CONFIG_DEBUG_BOOT_PARAMS is not set
> > > # CONFIG_CPA_DEBUG is not set
> > > CONFIG_DEBUG_ENTRY=3Dy
> > > # CONFIG_DEBUG_NMI_SELFTEST is not set
> > > CONFIG_X86_DEBUG_FPU=3Dy
> > > CONFIG_PUNIT_ATOM_DEBUG=3Dy
> > > CONFIG_UNWINDER_ORC=3Dy
> > > # CONFIG_UNWINDER_FRAME_POINTER is not set
> > > # end of x86 Debugging
> > > =

> > > #
> > > # Kernel Testing and Coverage
> > > #
> > > # CONFIG_KUNIT is not set
> > > CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> > > CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dm
> > > CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=3Dy
> > > CONFIG_FAULT_INJECTION=3Dy
> > > # CONFIG_FAILSLAB is not set
> > > CONFIG_FAIL_PAGE_ALLOC=3Dy
> > > CONFIG_FAULT_INJECTION_USERCOPY=3Dy
> > > CONFIG_FAIL_MAKE_REQUEST=3Dy
> > > # CONFIG_FAIL_IO_TIMEOUT is not set
> > > # CONFIG_FAIL_FUTEX is not set
> > > CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> > > # CONFIG_FAIL_MMC_REQUEST is not set
> > > CONFIG_ARCH_HAS_KCOV=3Dy
> > > CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> > > # CONFIG_KCOV is not set
> > > CONFIG_RUNTIME_TESTING_MENU=3Dy
> > > # CONFIG_LKDTM is not set
> > > # CONFIG_TEST_MIN_HEAP is not set
> > > # CONFIG_TEST_DIV64 is not set
> > > # CONFIG_BACKTRACE_SELF_TEST is not set
> > > # CONFIG_TEST_REF_TRACKER is not set
> > > # CONFIG_RBTREE_TEST is not set
> > > # CONFIG_REED_SOLOMON_TEST is not set
> > > # CONFIG_INTERVAL_TREE_TEST is not set
> > > # CONFIG_PERCPU_TEST is not set
> > > # CONFIG_ATOMIC64_SELFTEST is not set
> > > # CONFIG_ASYNC_RAID6_TEST is not set
> > > # CONFIG_TEST_HEXDUMP is not set
> > > # CONFIG_STRING_SELFTEST is not set
> > > # CONFIG_TEST_STRING_HELPERS is not set
> > > # CONFIG_TEST_STRSCPY is not set
> > > # CONFIG_TEST_KSTRTOX is not set
> > > # CONFIG_TEST_PRINTF is not set
> > > # CONFIG_TEST_SCANF is not set
> > > # CONFIG_TEST_BITMAP is not set
> > > # CONFIG_TEST_UUID is not set
> > > # CONFIG_TEST_XARRAY is not set
> > > # CONFIG_TEST_RHASHTABLE is not set
> > > # CONFIG_TEST_SIPHASH is not set
> > > # CONFIG_TEST_IDA is not set
> > > # CONFIG_TEST_LKM is not set
> > > # CONFIG_TEST_BITOPS is not set
> > > # CONFIG_TEST_VMALLOC is not set
> > > # CONFIG_TEST_USER_COPY is not set
> > > # CONFIG_TEST_BPF is not set
> > > # CONFIG_TEST_BLACKHOLE_DEV is not set
> > > # CONFIG_FIND_BIT_BENCHMARK is not set
> > > # CONFIG_TEST_FIRMWARE is not set
> > > # CONFIG_TEST_SYSCTL is not set
> > > # CONFIG_TEST_UDELAY is not set
> > > # CONFIG_TEST_STATIC_KEYS is not set
> > > # CONFIG_TEST_MEMCAT_P is not set
> > > # CONFIG_TEST_MEMINIT is not set
> > > # CONFIG_TEST_FREE_PAGES is not set
> > > # CONFIG_TEST_FPU is not set
> > > # CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
> > > CONFIG_ARCH_USE_MEMTEST=3Dy
> > > CONFIG_MEMTEST=3Dy
> > > # end of Kernel Testing and Coverage
> > > # end of Kernel hacking
> > =

> > > #!/bin/sh
> > > =

> > > export_top_env()
> > > {
> > > 	export suite=3D'trinity'
> > > 	export testcase=3D'trinity'
> > > 	export category=3D'functional'
> > > 	export need_memory=3D'300MB'
> > > 	export runtime=3D300
> > > 	export job_origin=3D'trinity.yaml'
> > > 	export queue_cmdline_keys=3D
> > > 	export queue=3D'int'
> > > 	export testbox=3D'vm-snb-8'
> > > 	export tbox_group=3D'vm-snb'
> > > 	export branch=3D'linux-review/Randy-Dunlap/hugetlb-use-mm-h-instead-=
of-mm_types-h/20220421-094935'
> > > 	export commit=3D'1dd38979b2f04a9b7261e05961999024059b3db2'
> > > 	export kconfig=3D'x86_64-randconfig-a001-20220418'
> > > 	export nr_vm=3D160
> > > 	export submit_id=3D'6265fec90b9a932d05596b7b'
> > > 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-8/trinity-group-03-300=
s-yocto-i386-minimal-20190520.cgz-1dd38979b2f04a9b7261e05961999024059b3db2-=
20220425-77061-q08e1t-1.yaml'
> > > 	export id=3D'a59ab2ed8703ea2add2f2a0a922effd7f2eb0c44'
> > > 	export queuer_version=3D'/lkp/xsang/.src-20220425-091415'
> > > 	export model=3D'qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
> > > 	export nr_cpu=3D2
> > > 	export memory=3D'16G'
> > > 	export need_kconfig=3D\{\"KVM_GUEST\"\=3D\>\"y\"\}
> > > 	export ssh_base_port=3D23032
> > > 	export kernel_cmdline=3D'vmalloc=3D128M initramfs_async=3D0 page_own=
er=3Don'
> > > 	export rootfs=3D'yocto-i386-minimal-20190520.cgz'
> > > 	export compiler=3D'gcc-11'
> > > 	export enqueue_time=3D'2022-04-25 09:52:10 +0800'
> > > 	export _id=3D'6265feca0b9a932d05596b7c'
> > > 	export _rt=3D'/result/trinity/group-03-300s/vm-snb/yocto-i386-minima=
l-20190520.cgz/x86_64-randconfig-a001-20220418/gcc-11/1dd38979b2f04a9b7261e=
05961999024059b3db2'
> > > 	export user=3D'lkp'
> > > 	export LKP_SERVER=3D'internal-lkp-server'
> > > 	export result_root=3D'/result/trinity/group-03-300s/vm-snb/yocto-i38=
6-minimal-20190520.cgz/x86_64-randconfig-a001-20220418/gcc-11/1dd38979b2f04=
a9b7261e05961999024059b3db2/19'
> > > 	export scheduler_version=3D'/lkp/lkp/.src-20220424-161621'
> > > 	export arch=3D'i386'
> > > 	export max_uptime=3D2100
> > > 	export initrd=3D'/osimage/yocto/yocto-i386-minimal-20190520.cgz'
> > > 	export bootloader_append=3D'root=3D/dev/ram0
> > > RESULT_ROOT=3D/result/trinity/group-03-300s/vm-snb/yocto-i386-minimal=
-20190520.cgz/x86_64-randconfig-a001-20220418/gcc-11/1dd38979b2f04a9b7261e0=
5961999024059b3db2/19
> > > BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a001-20220418/gcc-11/1dd389=
79b2f04a9b7261e05961999024059b3db2/vmlinuz-5.18.0-rc2-mm1-00223-g1dd38979b2=
f0
> > > branch=3Dlinux-review/Randy-Dunlap/hugetlb-use-mm-h-instead-of-mm_typ=
es-h/20220421-094935
> > > job=3D/lkp/jobs/scheduled/vm-snb-8/trinity-group-03-300s-yocto-i386-m=
inimal-20190520.cgz-1dd38979b2f04a9b7261e05961999024059b3db2-20220425-77061=
-q08e1t-1.yaml
> > > user=3Dlkp
> > > ARCH=3Dx86_64
> > > kconfig=3Dx86_64-randconfig-a001-20220418
> > > commit=3D1dd38979b2f04a9b7261e05961999024059b3db2
> > > vmalloc=3D128M initramfs_async=3D0 page_owner=3Don
> > > max_uptime=3D2100
> > > LKP_SERVER=3Dinternal-lkp-server
> > > selinux=3D0
> > > debug
> > > apic=3Ddebug
> > > sysrq_always_enabled
> > > rcupdate.rcu_cpu_stall_timeout=3D100
> > > net.ifnames=3D0
> > > printk.devkmsg=3Don
> > > panic=3D-1
> > > softlockup_panic=3D1
> > > nmi_watchdog=3Dpanic
> > > oops=3Dpanic
> > > load_ramdisk=3D2
> > > prompt_ramdisk=3D0
> > > drbd.minor_count=3D8
> > > systemd.log_level=3Derr
> > > ignore_loglevel
> > > console=3Dtty0
> > > earlyprintk=3DttyS0,115200
> > > console=3DttyS0,115200
> > > vga=3Dnormal
> > > rw'
> > > 	export modules_initrd=3D'/pkg/linux/x86_64-randconfig-a001-20220418/=
gcc-11/1dd38979b2f04a9b7261e05961999024059b3db2/modules.cgz'
> > > 	export bm_initrd=3D'/osimage/pkg/debian-x86_64-20180403.cgz/trinity-=
static-i386-x86_64-1c734c75-1_2020-01-06.cgz'
> > > 	export lkp_initrd=3D'/osimage/user/lkp/lkp-i386.cgz'
> > > 	export site=3D'inn'
> > > 	export LKP_CGI_PORT=3D80
> > > 	export LKP_CIFS_PORT=3D139
> > > 	export schedule_notify_address=3D
> > > 	export kernel=3D'/pkg/linux/x86_64-randconfig-a001-20220418/gcc-11/1=
dd38979b2f04a9b7261e05961999024059b3db2/vmlinuz-5.18.0-rc2-mm1-00223-g1dd38=
979b2f0'
> > > 	export dequeue_time=3D'2022-04-25 09:53:44 +0800'
> > > 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-8/trinity-group-03-3=
00s-yocto-i386-minimal-20190520.cgz-1dd38979b2f04a9b7261e05961999024059b3db=
2-20220425-77061-q08e1t-1.cgz'
> > > =

> > > 	[ -n "$LKP_SRC" ] ||
> > > 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> > > }
> > > =

> > > run_job()
> > > {
> > > 	echo $$ > $TMP/run-job.pid
> > > =

> > > 	. $LKP_SRC/lib/http.sh
> > > 	. $LKP_SRC/lib/job.sh
> > > 	. $LKP_SRC/lib/env.sh
> > > =

> > > 	export_top_env
> > > =

> > > 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> > > 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> > > 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> > > 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> > > 	run_monitor $LKP_SRC/monitors/plain/watchdog
> > > =

> > > 	run_test group=3D'group-03' $LKP_SRC/tests/wrapper trinity
> > > }
> > > =

> > > extract_stats()
> > > {
> > > 	export stats_part_begin=3D
> > > 	export stats_part_end=3D
> > > =

> > > 	$LKP_SRC/stats/wrapper kmsg
> > > 	$LKP_SRC/stats/wrapper meminfo
> > > =

> > > 	$LKP_SRC/stats/wrapper time trinity.time
> > > 	$LKP_SRC/stats/wrapper dmesg
> > > 	$LKP_SRC/stats/wrapper kmsg
> > > 	$LKP_SRC/stats/wrapper last_state
> > > 	$LKP_SRC/stats/wrapper stderr
> > > 	$LKP_SRC/stats/wrapper time
> > > }
> > > =

> > > "$@"
> >=20
--===============3880150944350353970==--

