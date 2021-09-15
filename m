Content-Type: multipart/mixed; boundary="===============0546993877262024856=="
MIME-Version: 1.0
From: Si, Beibei <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: d646969055: WARNING:at_kernel/ucount.c:#dec_rlimit_ucounts
Date: Wed, 15 Sep 2021 01:54:09 +0000
Message-ID: <69b3f6aee4ac4d259ac250dc1bd5fa1c@intel.com>
In-Reply-To: <20210913193938.xsoowmrqgbg6cb7k@example.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0546993877262024856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, legion

> -----Original Message-----
> From: Alexey Gladkov <legion@kernel.org>
> Sent: Tuesday, September 14, 2021 3:40 AM
> To: Sang, Oliver <oliver.sang@intel.com>
> Cc: Eric W. Biederman <ebiederm@xmission.com>; LKML <linux-
> kernel(a)vger.kernel.org>; lkp(a)lists.01.org; lkp <lkp@intel.com>
> Subject: Re: d646969055: WARNING:at_kernel/ucount.c:#dec_rlimit_ucounts
> =

> On Mon, Sep 13, 2021 at 10:16:54PM +0800, kernel test robot wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: d64696905554e919321e31afc210606653b8f6a4 ("Reimplement
> > RLIMIT_SIGPENDING on top of ucounts")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> >
> > in testcase: trinity
> > version: trinity-i386
> > with following parameters:
> >
> > 	number: 99999
> > 	group: group-02
> >
> > test-description: Trinity is a linux system call fuzz tester.
> > test-url: http://codemonkey.org.uk/projects/trinity/
> >
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp
> > 2 -m 16G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> >
> >
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> >
> >
> > [ 558.756672][ T2642] WARNING: CPU: 0 PID: 2642 at kernel/ucount.c:268
> > dec_rlimit_ucounts (kernel/ucount.c:268 (discriminator 1)) [
> > 558.758020][ T2642] Modules linked in: uvesafb cfbfillrect cfbimgblt
> > cfbcopyarea fb fbdev ppdev crc32_pclmul input_leds led_class intel_agp
> > intel_gtt parport_pc parport qemu_fw_cfg [  558.766247][ T2642] CPU: 0
> > PID: 2642 Comm: trinity-main Not tainted 5.12.0-gd64696905554 #1 [
> > 558.767543][ T2642] Hardware name: QEMU Standard PC (i440FX + PIIX,
> > 1996), BIOS 1.12.0-1 04/01/2014 [ 558.772150][ T2642] EIP:
> dec_rlimit_ucounts (kernel/ucount.c:268 (discriminator 1)) [ 558.772945][=
 T2642]
> Code: 68 73 6c c3 01 83 15 6c 73 6c c3 00 85 c0 0f 94 c0 83 c4 04 5b 5e 5=
f 5d c3
> 8d 76 00 83 05 50 73 6c c3 01 83 15 54 73 6c c3 00 <0f> 0b 83 05 58 73 6c=
 c3 01
> 83 15 5c 73 6c c3 00 eb 9d 8d b4 26 00 All code =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	68 73 6c c3 01       	pushq  $0x1c36c73
> >    5:	83 15 6c 73 6c c3 00 	adcl   $0x0,-0x3c938c94(%rip)        #
> 0xffffffffc36c7378
> >    c:	85 c0                	test   %eax,%eax
> >    e:	0f 94 c0             	sete   %al
> >   11:	83 c4 04             	add    $0x4,%esp
> >   14:	5b                   	pop    %rbx
> >   15:	5e                   	pop    %rsi
> >   16:	5f                   	pop    %rdi
> >   17:	5d                   	pop    %rbp
> >   18:	c3                   	retq
> >   19:	8d 76 00             	lea    0x0(%rsi),%esi
> >   1c:	83 05 50 73 6c c3 01 	addl   $0x1,-0x3c938cb0(%rip)        #
> 0xffffffffc36c7373
> >   23:	83 15 54 73 6c c3 00 	adcl   $0x0,-0x3c938cac(%rip)        #
> 0xffffffffc36c737e
> >   2a:*	0f 0b                	ud2    		<-- trapping instruction
> >   2c:	83 05 58 73 6c c3 01 	addl   $0x1,-0x3c938ca8(%rip)        #
> 0xffffffffc36c738b
> >   33:	83 15 5c 73 6c c3 00 	adcl   $0x0,-0x3c938ca4(%rip)        #
> 0xffffffffc36c7396
> >   3a:	eb 9d                	jmp    0xffffffffffffffd9
> >   3c:	8d                   	.byte 0x8d
> >   3d:	b4 26                	mov    $0x26,%ah
> > 	...
> >
> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	0f 0b                	ud2
> >    2:	83 05 58 73 6c c3 01 	addl   $0x1,-0x3c938ca8(%rip)        #
> 0xffffffffc36c7361
> >    9:	83 15 5c 73 6c c3 00 	adcl   $0x0,-0x3c938ca4(%rip)        #
> 0xffffffffc36c736c
> >   10:	eb 9d                	jmp    0xffffffffffffffaf
> >   12:	8d                   	.byte 0x8d
> >   13:	b4 26                	mov    $0x26,%ah
> > 	...
> > [  558.779398][ T2642] EAX: f63271e0 EBX: f63271e0 ECX: 00000001 EDX:
> > ffffffff [  558.781206][ T2642] ESI: 0000003c EDI: ffffffff EBP:
> > f62e3eac ESP: f62e3e9c [  558.782613][ T2642] DS: 007b ES: 007b FS:
> > 0000 GS: 0033 SS: 0068 EFLAGS: 00010246 [  558.783747][ T2642] CR0:
> > 80050033 CR2: 08082ff0 CR3: 362b0000 CR4: 00040690 [  558.792353][ T264=
2]
> Call Trace:
> > [ 558.793036][ T2642] ? release_task (include/linux/rcupdate.h:654
> > kernel/exit.c:191) [ 558.793936][ T2642] release_task
> > (kernel/exit.c:191) [ 558.794818][ T2642] wait_task_zombie
> > (kernel/exit.c:1107) [ 558.800667][ T2642] wait_consider_task
> > (kernel/exit.c:1334) [ 558.801693][ T2642] ? _raw_read_lock
> > (include/linux/rwlock_api_smp.h:149 kernel/locking/spinlock.c:223) [
> > 558.802645][ T2642] do_wait (kernel/exit.c:1399 kernel/exit.c:1468) [
> > 558.803462][ T2642] kernel_wait4 (kernel/exit.c:1630) [ 558.806901][
> > T2642] ? kill_orphaned_pgrp (kernel/exit.c:1422) [ 558.808347][ T2642]
> > __ia32_sys_waitpid (kernel/exit.c:1675 kernel/exit.c:1673
> > kernel/exit.c:1673) [ 558.809338][ T2642] do_int80_syscall_32
> > (arch/x86/entry/common.c:77 arch/x86/entry/common.c:94) [ 558.810319][
> > T2642] entry_INT80_32 (arch/x86/entry/entry_32.S:1064) [  558.811254][
> > T2642] EIP: 0x809b132 [ 558.815723][ T2642] Code: 89 c8 c3 90 8d 74 26
> > 00 85 c0 c7 01 01 00 00 00 75 d8 a1 6c 94 a8 08 eb d1 66 90 66 90 66 90=
 66 90
> 66 90 66 90 66 90 90 cd 80 <c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 00 8b=
 10 a3
> 94 94 a8 08 85 All code =3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	89 c8                	mov    %ecx,%eax
> >    2:	c3                   	retq
> >    3:	90                   	nop
> >    4:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
> >    8:	85 c0                	test   %eax,%eax
> >    a:	c7 01 01 00 00 00    	movl   $0x1,(%rcx)
> >   10:	75 d8                	jne    0xffffffffffffffea
> >   12:	a1 6c 94 a8 08 eb d1 	movabs 0x9066d1eb08a8946c,%eax
> >   19:	66 90
> >   1b:	66 90                	xchg   %ax,%ax
> >   1d:	66 90                	xchg   %ax,%ax
> >   1f:	66 90                	xchg   %ax,%ax
> >   21:	66 90                	xchg   %ax,%ax
> >   23:	66 90                	xchg   %ax,%ax
> >   25:	66 90                	xchg   %ax,%ax
> >   27:	90                   	nop
> >   28:	cd 80                	int    $0x80
> >   2a:*	c3                   	retq   		<-- trapping instruction
> >   2b:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
> >   31:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
> >   38:	8b 10                	mov    (%rax),%edx
> >   3a:	a3                   	.byte 0xa3
> >   3b:	94                   	xchg   %eax,%esp
> >   3c:	94                   	xchg   %eax,%esp
> >   3d:	a8 08                	test   $0x8,%al
> >   3f:	85                   	.byte 0x85
> >
> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0:	c3                   	retq
> >    1:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
> >    7:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
> >    e:	8b 10                	mov    (%rax),%edx
> >   10:	a3                   	.byte 0xa3
> >   11:	94                   	xchg   %eax,%esp
> >   12:	94                   	xchg   %eax,%esp
> >   13:	a8 08                	test   $0x8,%al
> >   15:	85                   	.byte 0x85
> > [  558.820109][ T2642] EAX: ffffffda EBX: 00000f0f ECX: bfb23394 EDX:
> > 0000000b [  558.821480][ T2642] ESI: 00000002 EDI: 08a890fc EBP:
> > 08a89034 ESP: bfb23364 [  558.822693][ T2642] DS: 007b ES: 007b FS:
> > 0000 GS: 0033 SS: 007b EFLAGS: 00000246 [  558.828056][ T2642] irq
> > event stamp: 1348273 [ 558.828922][ T2642] hardirqs last enabled at
> > (1348281): console_unlock (kernel/printk/printk.c:2605 (discriminator
> > 1)) [ 558.830629][ T2642] hardirqs last disabled at (1348288):
> > console_unlock (kernel/printk/printk.c:2520 (discriminator 1)) [
> > 558.833190][ T2642] softirqs last enabled at (1348240): __do_softirq
> > (kernel/softirq.c:372) [ 558.834715][ T2642] softirqs last disabled at
> > (1348231): do_softirq_own_stack (arch/x86/kernel/irq_32.c:60
> > arch/x86/kernel/irq_32.c:149) [  558.840026][ T2642] ---[ end trace
> > 6bbb25560ce8d9b6 ]---
> >
> >
> > To reproduce:
> >
> >         # build kernel
> > 	cd linux
> > 	cp config-5.12.0-gd64696905554 .config
> > 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare
> > modules_prepare bzImage
> >
> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp qemu -k <bzImage> job-script # job-script is attached
> > in this email
> =

> I am unable to run the test following this instruction.
 =

After double check, we can reproduce this issue, could you kindly offer you=
r full log and the reproducing steps?

As the log you mentioned, below [1] shows our corresponding log, they are v=
ery similar, only we don't have depmod error, I found some solutions and ad=
d their links here, could you check if they can solve your issue? Thanks.

depmod: ERROR: could not open directory /lib/modules/5.14.0-09687-g27151f17=
7827: No such file or directory
depmod: FATAL: could not search modules: No such file or directory

https://stackoverflow.com/questions/28644386/kernel-install-gives-missing-m=
odule-error
https://serverfault.com/questions/780980/error-could-not-open-directory-lib=
-modules-4-2-0-25-generic-no-such-file-or-d

[1]

[   12.451508][  T142] udevd[142]: starting version 3.2.7
[   12.452573][  T142] random: udevd: uninitialized urandom read (16 bytes =
read)
[   12.453575][  T142] random: udevd: uninitialized urandom read (16 bytes =
read)
[   12.454383][  T142] random: udevd: uninitialized urandom read (16 bytes =
read)
[   12.457336][  T142] udevd[142]: specified group 'kvm' unknown
[   12.461646][  T143] udevd[143]: starting eudev-3.2.7
[   12.505124][  T143] udevd[143]: specified group 'kvm' unknown
[   12.551437][  T155] parport_pc 00:04: reported by Plug and Play ACPI
[   12.552300][  T155] parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE]
[   12.631105][  T145] udevadm (145) used greatest stack depth: 6188 bytes =
left
[   12.677804][  T155] parport_pc parport_pc.956: Unable to set coherent dm=
a mask: disabling DMA
[   12.679095][  T155] parport_pc parport_pc.888: Unable to set coherent dm=
a mask: disabling DMA
[   12.680302][  T155] parport_pc parport_pc.632: Unable to set coherent dm=
a mask: disabling DMA
[   12.816138][  T148] ppdev: user-space parallel port driver
[   13.828199][  T161] _warn_unseeded_randomness: 196 callbacks suppressed
[   13.828206][  T161] random: get_random_u32 called from arch_rnd+0x32/0x8=
0 with crng_init=3D1
[   13.828215][  T161] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   13.828223][  T161] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   13.850739][  T168] uvesafb: failed to execute /sbin/v86d
[   13.851380][  T168] uvesafb: make sure that the v86d helper is installed=
 and executable
[   13.852224][  T168] uvesafb: Getting VBE info block failed (eax=3D0x4f00=
, err=3D-2)
[   13.853009][  T168] uvesafb: vbe_init() failed with -22
[   13.853713][  T168] uvesafb: probe of uvesafb.0 failed with error -22
hwclock: can't open '/dev/misc/rtc': No such file or directory
[   14.052516][  T289] urandom_read: 3 callbacks suppressed
[   14.052519][  T289] random: dd: uninitialized urandom read (512 bytes re=
ad)
INIT: Entering runlevel: 5
Configuring network interfaces... ip: RTNETLINK answers: File exists
hwclock: can't open '/dev/misc/rtc': No such file or directory
Starting syslogd/klogd: done
/etc/rc5.d/S77lkp-bootstrap: /lkp/jobs/scheduled/vm-snb-43/trinity-group-02=
-99999-yocto-i386-minimal-20190520.cgz-d64696905554e919321e31afc210606653b8=
f6a4-20210911-24127-1x1tp2
w-8.sh: line 123: start: not found
PATH=3D/sbin:/usr/sbin:/bin:/usr/bin:/lkp/root/src/bin
[   14.141304][  T181] bootlogd (181) used greatest stack depth: 6124 bytes=
 left
export VM_VIRTFS=3D1 due to result service 9p/virtfs_mount
LKP: HOSTNAME vm-snb-43, MAC 52:54:00:12:34:56, kernel 5.12.0-gd64696905554=
 1, serial co
nsole /dev/ttyS0

Poky (Yocto Project Reference Distro) 2.7+snapshot vm-snb-43 /dev/ttyS0

INIT: Id "S1" respawning too fast: disabled for 5 minutes

> =

> I see a log like this:
> =

> [   11.641013][  T144] udevd[144]: starting version 3.2.7
> [   11.641708][  T144] random: udevd: uninitialized urandom read (16 byte=
s read)
> [   11.642545][  T144] random: udevd: uninitialized urandom read (16 byte=
s read)
> [   11.643211][  T144] random: udevd: uninitialized urandom read (16 byte=
s read)
> [   11.645112][  T144] udevd[144]: specified group 'kvm' unknown
> [   11.648240][  T145] udevd[145]: starting eudev-3.2.7
> [   11.676942][  T145] udevd[145]: specified group 'kvm' unknown
> [   12.871897][  T163] _warn_unseeded_randomness: 197 callbacks suppressed
> [   12.871904][  T163] random: get_random_u32 called from
> arch_rnd+0x32/0x80 with crng_init=3D1
> [   12.871912][  T163] random: get_random_u32 called from
> randomize_stack_top+0x53/0x70 with crng_init=3D1
> [   12.871917][  T163] random: get_random_u32 called from
> arch_align_stack+0x5b/0x80 with crng_init=3D1
> depmod: ERROR: could not open directory /lib/modules/5.14.0-09687-
> g27151f177827: No such file or directory
> depmod: WARNING: -e needs -E or -F
> depmod: ERROR: could not open directory /lib/modules/5.14.0-09687-
> g27151f177827: No such file or directory
> depmod: FATAL: could not search modules: No such file or directory
> hwclock: can't open '/dev/misc/rtc': No such file or directory
> [   13.047209][  T291] urandom_read: 3 callbacks suppressed
> [   13.047212][  T291] random: dd: uninitialized urandom read (512 bytes =
read)
> INIT: Entering runlevel: 5
> Configuring network interfaces... ip: RTNETLINK answers: File exists
> hwclock: can't open '/dev/misc/rtc': No such file or directory Starting
> syslogd/klogd: done
> /etc/rc5.d/S77lkp-bootstrap: /lkp/jobs/scheduled/vm-snb-43/trinity-group-=
02-
> 99999-yocto-i386-minimal-20190520.cgz-
> d64696905554e919321e31afc210606653b8f6a4-20210911-24127-1x1tp2w-8.sh:
> line 123: start: not found
> /etc/rc5.d/S77lkp-bootstrap: line 75: /lkp/root/src/bin/lkp-setup-rootfs:=
 not
> found
> [   13.103013][  T183] bootlogd (183) used greatest stack depth: 6132 byt=
es left
> INIT: Id "S1" respawning too fast: disabled for 5 minutes
> =

> --
> Rgrds, legion


--===============0546993877262024856==--

