Content-Type: multipart/mixed; boundary="===============0973708560765158710=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [signal/vm86_32] 1a4d21a23c: kernel_BUG_at_arch/x86/kernel/vm#_32.c
Date: Fri, 12 Nov 2021 09:21:21 -0600
Message-ID: <87ee7lv1qm.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <20211112074030.GB19820@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0973708560765158710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 1a4d21a23c4ca7467726be7db9ae8077a62b2c62 ("signal/vm86_32: Replac=
e open coded BUG_ON with an actual BUG_ON")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: trinity
> version: trinity-static-i386-x86_64-1c734c75-1_2020-01-06
> with following parameters:
>
> 	runtime: 300s
> 	group: group-00
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/

I am trying to figure out what to do with this, as it looks like I
converted a bug that was previously being ignored into a bug that is
being reported.

Is there a way to reliably run trinity such that it repeats the same
set of system calls?

I don't see that in the job_script?  Am I just missing that?

Eric

>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +-------------------------------------------------------+------------+---=
---------+
> |                                                       | 984bd71fb3 | 1a=
4d21a23c |
> +-------------------------------------------------------+------------+---=
---------+
> | kernel_BUG_at_arch/x86/kernel/vm#_32.c                | 0          | 13=
         |
> | invalid_opcode:#[##]                                  | 0          | 13=
         |
> | EIP:save_v86_state                                    | 0          | 13=
         |
> | Kernel_panic-not_syncing:Fatal_exception              | 0          | 13=
         |
> +-------------------------------------------------------+------------+---=
---------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [   70.645554][ T3747] kernel BUG at arch/x86/kernel/vm86_32.c:109!
> [   70.646185][ T3747] invalid opcode: 0000 [#1] SMP
> [   70.646682][ T3747] CPU: 0 PID: 3747 Comm: trinity-c6 Not tainted 5.15=
.0-rc1-00009-g1a4d21a23c4c #1
> [ 70.647598][ T3747] EIP: save_v86_state (arch/x86/kernel/vm86_32.c:109 (=
discriminator 3)) =

> [ 70.648113][ T3747] Code: 89 c3 64 8b 35 60 b8 25 c2 83 ec 08 89 55 f0 8=
b 96 10 19 00 00 89 55 ec e8 c6 2d 0c 00 fb 8b 55 ec 85 d2 74 05 83 3a 00 7=
5 02 <0f> 0b 8b 86 10 19 00 00 8b 4b 38 8b 78 48 31 cf 89 f8 8b 7a 4c 81
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	89 c3                	mov    %eax,%ebx
>    2:	64 8b 35 60 b8 25 c2 	mov    %fs:-0x3dda47a0(%rip),%esi        # 0x=
ffffffffc225b869
>    9:	83 ec 08             	sub    $0x8,%esp
>    c:	89 55 f0             	mov    %edx,-0x10(%rbp)
>    f:	8b 96 10 19 00 00    	mov    0x1910(%rsi),%edx
>   15:	89 55 ec             	mov    %edx,-0x14(%rbp)
>   18:	e8 c6 2d 0c 00       	callq  0xc2de3
>   1d:	fb                   	sti    =

>   1e:	8b 55 ec             	mov    -0x14(%rbp),%edx
>   21:	85 d2                	test   %edx,%edx
>   23:	74 05                	je     0x2a
>   25:	83 3a 00             	cmpl   $0x0,(%rdx)
>   28:	75 02                	jne    0x2c
>   2a:*	0f 0b                	ud2    		<-- trapping instruction
>   2c:	8b 86 10 19 00 00    	mov    0x1910(%rsi),%eax
>   32:	8b 4b 38             	mov    0x38(%rbx),%ecx
>   35:	8b 78 48             	mov    0x48(%rax),%edi
>   38:	31 cf                	xor    %ecx,%edi
>   3a:	89 f8                	mov    %edi,%eax
>   3c:	8b 7a 4c             	mov    0x4c(%rdx),%edi
>   3f:	81                   	.byte 0x81
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	0f 0b                	ud2    =

>    2:	8b 86 10 19 00 00    	mov    0x1910(%rsi),%eax
>    8:	8b 4b 38             	mov    0x38(%rbx),%ecx
>    b:	8b 78 48             	mov    0x48(%rax),%edi
>    e:	31 cf                	xor    %ecx,%edi
>   10:	89 f8                	mov    %edi,%eax
>   12:	8b 7a 4c             	mov    0x4c(%rdx),%edi
>   15:	81                   	.byte 0x81
> [   70.650136][ T3747] EAX: 00000001 EBX: f5f49fac ECX: 0000000b EDX: f61=
0b600
> [   70.650852][ T3747] ESI: f5f79cc0 EDI: f5f79cc0 EBP: f5f49f04 ESP: f5f=
49ef0
> [   70.651593][ T3747] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAG=
S: 00010246
> [   70.652413][ T3747] CR0: 80050033 CR2: 00004000 CR3: 35fc7000 CR4: 000=
406d0
> [   70.653169][ T3747] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [   70.653897][ T3747] DR6: fffe0ff0 DR7: 00000400
> [   70.654382][ T3747] Call Trace:
> [ 70.654719][ T3747] arch_do_signal_or_restart (arch/x86/kernel/signal.c:=
792 arch/x86/kernel/signal.c:867) =

> [ 70.655288][ T3747] exit_to_user_mode_prepare (kernel/entry/common.c:174=
 kernel/entry/common.c:209) =

> [ 70.655854][ T3747] irqentry_exit_to_user_mode (kernel/entry/common.c:12=
6 kernel/entry/common.c:317) =

> [ 70.656450][ T3747] irqentry_exit (kernel/entry/common.c:406) =

> [ 70.656897][ T3747] exc_page_fault (arch/x86/mm/fault.c:1535) =

> [ 70.657369][ T3747] ? sysvec_kvm_asyncpf_interrupt (arch/x86/mm/fault.c:=
1488) =

> [ 70.657989][ T3747] handle_exception (arch/x86/entry/entry_32.S:1085) =

> [   70.658495][ T3747] EIP: 0xc26
> [ 70.658827][ T3747] Code: 00 00 00 00 47 00 3e 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 61 <00> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	00 00                	add    %al,(%rax)
>    2:	00 00                	add    %al,(%rax)
>    4:	47 00 3e             	rex.RXB add %r15b,(%r14)
> 	...
>   27:	00 00                	add    %al,(%rax)
>   29:	61                   	(bad)  =

> 	...
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	...
> [   70.660853][ T3747] EAX: 8c430000 EBX: 40000000 ECX: 01010000 EDX: 000=
00000
> [   70.661584][ T3747] ESI: 00004000 EDI: 00000cf1 EBP: 8c438025 ESP: 000=
00010
> [   70.662313][ T3747] DS: 0000 ES: 0000 FS: 0000 GS: 0000 SS: 0000 EFLAG=
S: 00030203
> [ 70.663097][ T3747] ? sysvec_kvm_asyncpf_interrupt (arch/x86/mm/fault.c:=
1488) =

> [   70.663697][ T3747] Modules linked in: serio_raw floppy
> [   70.664338][ T3747] ---[ end trace 270eda615b02f17c ]---
> [ 70.664878][ T3747] EIP: save_v86_state (arch/x86/kernel/vm86_32.c:109 (=
discriminator 3)) =

> [ 70.665397][ T3747] Code: 89 c3 64 8b 35 60 b8 25 c2 83 ec 08 89 55 f0 8=
b 96 10 19 00 00 89 55 ec e8 c6 2d 0c 00 fb 8b 55 ec 85 d2 74 05 83 3a 00 7=
5 02 <0f> 0b 8b 86 10 19 00 00 8b 4b 38 8b 78 48 31 cf 89 f8 8b 7a 4c 81
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	89 c3                	mov    %eax,%ebx
>    2:	64 8b 35 60 b8 25 c2 	mov    %fs:-0x3dda47a0(%rip),%esi        # 0x=
ffffffffc225b869
>    9:	83 ec 08             	sub    $0x8,%esp
>    c:	89 55 f0             	mov    %edx,-0x10(%rbp)
>    f:	8b 96 10 19 00 00    	mov    0x1910(%rsi),%edx
>   15:	89 55 ec             	mov    %edx,-0x14(%rbp)
>   18:	e8 c6 2d 0c 00       	callq  0xc2de3
>   1d:	fb                   	sti    =

>   1e:	8b 55 ec             	mov    -0x14(%rbp),%edx
>   21:	85 d2                	test   %edx,%edx
>   23:	74 05                	je     0x2a
>   25:	83 3a 00             	cmpl   $0x0,(%rdx)
>   28:	75 02                	jne    0x2c
>   2a:*	0f 0b                	ud2    		<-- trapping instruction
>   2c:	8b 86 10 19 00 00    	mov    0x1910(%rsi),%eax
>   32:	8b 4b 38             	mov    0x38(%rbx),%ecx
>   35:	8b 78 48             	mov    0x48(%rax),%edi
>   38:	31 cf                	xor    %ecx,%edi
>   3a:	89 f8                	mov    %edi,%eax
>   3c:	8b 7a 4c             	mov    0x4c(%rdx),%edi
>   3f:	81                   	.byte 0x81
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	0f 0b                	ud2    =

>    2:	8b 86 10 19 00 00    	mov    0x1910(%rsi),%eax
>    8:	8b 4b 38             	mov    0x38(%rbx),%ecx
>    b:	8b 78 48             	mov    0x48(%rax),%edi
>    e:	31 cf                	xor    %ecx,%edi
>   10:	89 f8                	mov    %edi,%eax
>   12:	8b 7a 4c             	mov    0x4c(%rdx),%edi
>   15:	81                   	.byte 0x81
>
>
> To reproduce:
>
>         # build kernel
> 	cd linux
> 	cp config-5.15.0-rc1-00009-g1a4d21a23c4c .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
>
> Thanks,
> Oliver Sang
>
>
> #!/bin/sh
>
> export_top_env()
> {
> 	export suite=3D'trinity'
> 	export testcase=3D'trinity'
> 	export category=3D'functional'
> 	export need_memory=3D'300MB'
> 	export runtime=3D300
> 	export job_origin=3D'trinity.yaml'
> 	export queue_cmdline_keys=3D'branch
> commit
> queue_at_least_once'
> 	export queue=3D'validate'
> 	export testbox=3D'vm-snb-116'
> 	export tbox_group=3D'vm-snb'
> 	export branch=3D'linux-next/master'
> 	export commit=3D'1a4d21a23c4ca7467726be7db9ae8077a62b2c62'
> 	export kconfig=3D'i386-randconfig-a012-20211103'
> 	export repeat_to=3D9
> 	export nr_vm=3D160
> 	export submit_id=3D'618c4306ad13dcbf705e4382'
> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-116/trinity-group-00-300s-=
yocto-i386-minimal-20190520.cgz-1a4d21a23c4ca7467726be7db9ae8077a62b2c62-20=
211111-49008-hf642f-8.yaml'
> 	export id=3D'1991abdc3825a7b25ae0320d99f85b782a73a3c9'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=3D2
> 	export memory=3D'16G'
> 	export need_kconfig=3D\{\"KVM_GUEST\"\=3D\>\"y\"\}
> 	export ssh_base_port=3D23032
> 	export kernel_cmdline=3D'vmalloc=3D128M initramfs_async=3D0 page_owner=
=3Don'
> 	export rootfs=3D'yocto-i386-minimal-20190520.cgz'
> 	export compiler=3D'gcc-9'
> 	export enqueue_time=3D'2021-11-11 06:09:11 +0800'
> 	export _id=3D'618c4306ad13dcbf705e4382'
> 	export _rt=3D'/result/trinity/group-00-300s/vm-snb/yocto-i386-minimal-20=
190520.cgz/i386-randconfig-a012-20211103/gcc-9/1a4d21a23c4ca7467726be7db9ae=
8077a62b2c62'
> 	export user=3D'lkp'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export result_root=3D'/result/trinity/group-00-300s/vm-snb/yocto-i386-mi=
nimal-20190520.cgz/i386-randconfig-a012-20211103/gcc-9/1a4d21a23c4ca7467726=
be7db9ae8077a62b2c62/8'
> 	export scheduler_version=3D'/lkp/lkp/.src-20211110-155738'
> 	export arch=3D'i386'
> 	export max_uptime=3D2100
> 	export initrd=3D'/osimage/yocto/yocto-i386-minimal-20190520.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/vm-snb-116/trinity-group-00-300s-yocto-i386-min=
imal-20190520.cgz-1a4d21a23c4ca7467726be7db9ae8077a62b2c62-20211111-49008-h=
f642f-8.yaml
> ARCH=3Di386
> kconfig=3Di386-randconfig-a012-20211103
> branch=3Dlinux-next/master
> commit=3D1a4d21a23c4ca7467726be7db9ae8077a62b2c62
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a012-20211103/gcc-9/1a4d21a23c4ca=
7467726be7db9ae8077a62b2c62/vmlinuz-5.15.0-rc1-00009-g1a4d21a23c4c
> vmalloc=3D128M initramfs_async=3D0 page_owner=3Don
> max_uptime=3D2100
> RESULT_ROOT=3D/result/trinity/group-00-300s/vm-snb/yocto-i386-minimal-201=
90520.cgz/i386-randconfig-a012-20211103/gcc-9/1a4d21a23c4ca7467726be7db9ae8=
077a62b2c62/8
> LKP_SERVER=3Dinternal-lkp-server
> selinux=3D0
> debug
> apic=3Ddebug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100
> net.ifnames=3D0
> printk.devkmsg=3Don
> panic=3D-1
> softlockup_panic=3D1
> nmi_watchdog=3Dpanic
> oops=3Dpanic
> load_ramdisk=3D2
> prompt_ramdisk=3D0
> drbd.minor_count=3D8
> systemd.log_level=3Derr
> ignore_loglevel
> console=3Dtty0
> earlyprintk=3DttyS0,115200
> console=3DttyS0,115200
> vga=3Dnormal
> rw'
> 	export modules_initrd=3D'/pkg/linux/i386-randconfig-a012-20211103/gcc-9/=
1a4d21a23c4ca7467726be7db9ae8077a62b2c62/modules.cgz'
> 	export bm_initrd=3D'/osimage/pkg/debian-x86_64-20180403.cgz/trinity-stat=
ic-i386-x86_64-1c734c75-1_2020-01-06.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-i386.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export schedule_notify_address=3D
> 	export queue_at_least_once=3D1
> 	export kernel=3D'/pkg/linux/i386-randconfig-a012-20211103/gcc-9/1a4d21a2=
3c4ca7467726be7db9ae8077a62b2c62/vmlinuz-5.15.0-rc1-00009-g1a4d21a23c4c'
> 	export dequeue_time=3D'2021-11-11 06:09:56 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-116/trinity-group-00-300=
s-yocto-i386-minimal-20190520.cgz-1a4d21a23c4ca7467726be7db9ae8077a62b2c62-=
20211111-49008-hf642f-8.cgz'
>
> 	[ -n "$LKP_SRC" ] ||
> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> }
>
> run_job()
> {
> 	echo $$ > $TMP/run-job.pid
>
> 	. $LKP_SRC/lib/http.sh
> 	. $LKP_SRC/lib/job.sh
> 	. $LKP_SRC/lib/env.sh
>
> 	export_top_env
>
> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
>
> 	run_test group=3D'group-00' $LKP_SRC/tests/wrapper trinity
> }
>
> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
>
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper meminfo
>
> 	$LKP_SRC/stats/wrapper time trinity.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
>
> "$@"
--===============0973708560765158710==--

