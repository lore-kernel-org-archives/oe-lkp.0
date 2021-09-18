Content-Type: multipart/mixed; boundary="===============4136991372558559486=="
MIME-Version: 1.0
From: Si, Beibei <beibei.si@intel.com>
To: lkp@lists.01.org
Subject: Re: d646969055: WARNING:at_kernel/ucount.c:#dec_rlimit_ucounts
Date: Sat, 18 Sep 2021 02:08:15 +0000
Message-ID: <81cd7a54e5384ae6a5365d6e00dbb48d@intel.com>
In-Reply-To: <20210915113936.kiagbhqriordfadz@example.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4136991372558559486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, legion

> -----Original Message-----
> From: Alexey Gladkov <legion@kernel.org>
> Sent: Wednesday, September 15, 2021 7:40 PM
> To: Si, Beibei <beibei.si@intel.com>
> Cc: Eric W. Biederman <ebiederm@xmission.com>; LKML <linux-
> kernel(a)vger.kernel.org>; lkp(a)lists.01.org; lkp <lkp@intel.com>
> Subject: [LKP] Re: d646969055:
> WARNING:at_kernel/ucount.c:#dec_rlimit_ucounts
> =

> On Wed, Sep 15, 2021 at 01:54:09AM +0000, Si, Beibei wrote:
> > Hi, legion
> >
> > > -----Original Message-----
> > > From: Alexey Gladkov <legion@kernel.org>
> > > Sent: Tuesday, September 14, 2021 3:40 AM
> > > To: Sang, Oliver <oliver.sang@intel.com>
> > > Cc: Eric W. Biederman <ebiederm@xmission.com>; LKML <linux-
> > > kernel(a)vger.kernel.org>; lkp(a)lists.01.org; lkp <lkp@intel.com>
> > > Subject: Re: d646969055:
> WARNING:at_kernel/ucount.c:#dec_rlimit_ucounts
> > >
> > > On Mon, Sep 13, 2021 at 10:16:54PM +0800, kernel test robot wrote:
> > > >
> > > >
> > > > Greeting,
> > > >
> > > > FYI, we noticed the following commit (built with gcc-9):
> > > >
> > > > commit: d64696905554e919321e31afc210606653b8f6a4 ("Reimplement
> > > > RLIMIT_SIGPENDING on top of ucounts")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mas=
ter
> > > >
> > > >
> > > > in testcase: trinity
> > > > version: trinity-i386
> > > > with following parameters:
> > > >
> > > > 	number: 99999
> > > > 	group: group-02
> > > >
> > > > test-description: Trinity is a linux system call fuzz tester.
> > > > test-url: http://codemonkey.org.uk/projects/trinity/
> > > >
> > > >
> > > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -s=
mp
> > > > 2 -m 16G
> > > >
> > > > caused below changes (please refer to attached dmesg/kmsg for entire
> > > log/backtrace):
> > > >
> > > >
> > > >
> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > >
> > > >
> > > > [ 558.756672][ T2642] WARNING: CPU: 0 PID: 2642 at kernel/ucount.c:=
268
> > > > dec_rlimit_ucounts (kernel/ucount.c:268 (discriminator 1)) [
> > > > 558.758020][ T2642] Modules linked in: uvesafb cfbfillrect cfbimgblt
> > > > cfbcopyarea fb fbdev ppdev crc32_pclmul input_leds led_class intel_=
agp
> > > > intel_gtt parport_pc parport qemu_fw_cfg [  558.766247][ T2642] CPU=
: 0
> > > > PID: 2642 Comm: trinity-main Not tainted 5.12.0-gd64696905554 #1 [
> > > > 558.767543][ T2642] Hardware name: QEMU Standard PC (i440FX + PIIX,
> > > > 1996), BIOS 1.12.0-1 04/01/2014 [ 558.772150][ T2642] EIP:
> > > dec_rlimit_ucounts (kernel/ucount.c:268 (discriminator 1))
> [ 558.772945][ T2642]
> > > Code: 68 73 6c c3 01 83 15 6c 73 6c c3 00 85 c0 0f 94 c0 83 c4 04 5b =
5e 5f 5d
> c3
> > > 8d 76 00 83 05 50 73 6c c3 01 83 15 54 73 6c c3 00 <0f> 0b 83 05 58 7=
3 6c c3
> 01
> > > 83 15 5c 73 6c c3 00 eb 9d 8d b4 26 00 All code =3D=3D=3D=3D=3D=3D=3D=
=3D
> > > >    0:	68 73 6c c3 01       	pushq  $0x1c36c73
> > > >    5:	83 15 6c 73 6c c3 00 	adcl   $0x0,-0x3c938c94(%rip)        #
> > > 0xffffffffc36c7378
> > > >    c:	85 c0                	test   %eax,%eax
> > > >    e:	0f 94 c0             	sete   %al
> > > >   11:	83 c4 04             	add    $0x4,%esp
> > > >   14:	5b                   	pop    %rbx
> > > >   15:	5e                   	pop    %rsi
> > > >   16:	5f                   	pop    %rdi
> > > >   17:	5d                   	pop    %rbp
> > > >   18:	c3                   	retq
> > > >   19:	8d 76 00             	lea    0x0(%rsi),%esi
> > > >   1c:	83 05 50 73 6c c3 01 	addl   $0x1,-0x3c938cb0(%rip)        #
> > > 0xffffffffc36c7373
> > > >   23:	83 15 54 73 6c c3 00 	adcl   $0x0,-0x3c938cac(%rip)        #
> > > 0xffffffffc36c737e
> > > >   2a:*	0f 0b                	ud2    		<-- trapping instruction
> > > >   2c:	83 05 58 73 6c c3 01 	addl   $0x1,-0x3c938ca8(%rip)        #
> > > 0xffffffffc36c738b
> > > >   33:	83 15 5c 73 6c c3 00 	adcl   $0x0,-0x3c938ca4(%rip)        #
> > > 0xffffffffc36c7396
> > > >   3a:	eb 9d                	jmp    0xffffffffffffffd9
> > > >   3c:	8d                   	.byte 0x8d
> > > >   3d:	b4 26                	mov    $0x26,%ah
> > > > 	...
> > > >
> > > > Code starting with the faulting instruction
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >    0:	0f 0b                	ud2
> > > >    2:	83 05 58 73 6c c3 01 	addl   $0x1,-0x3c938ca8(%rip)        #
> > > 0xffffffffc36c7361
> > > >    9:	83 15 5c 73 6c c3 00 	adcl   $0x0,-0x3c938ca4(%rip)        #
> > > 0xffffffffc36c736c
> > > >   10:	eb 9d                	jmp    0xffffffffffffffaf
> > > >   12:	8d                   	.byte 0x8d
> > > >   13:	b4 26                	mov    $0x26,%ah
> > > > 	...
> > > > [  558.779398][ T2642] EAX: f63271e0 EBX: f63271e0 ECX: 00000001 ED=
X:
> > > > ffffffff [  558.781206][ T2642] ESI: 0000003c EDI: ffffffff EBP:
> > > > f62e3eac ESP: f62e3e9c [  558.782613][ T2642] DS: 007b ES: 007b FS:
> > > > 0000 GS: 0033 SS: 0068 EFLAGS: 00010246 [  558.783747][ T2642] CR0:
> > > > 80050033 CR2: 08082ff0 CR3: 362b0000 CR4: 00040690
> [  558.792353][ T2642]
> > > Call Trace:
> > > > [ 558.793036][ T2642] ? release_task (include/linux/rcupdate.h:654
> > > > kernel/exit.c:191) [ 558.793936][ T2642] release_task
> > > > (kernel/exit.c:191) [ 558.794818][ T2642] wait_task_zombie
> > > > (kernel/exit.c:1107) [ 558.800667][ T2642] wait_consider_task
> > > > (kernel/exit.c:1334) [ 558.801693][ T2642] ? _raw_read_lock
> > > > (include/linux/rwlock_api_smp.h:149 kernel/locking/spinlock.c:223) [
> > > > 558.802645][ T2642] do_wait (kernel/exit.c:1399 kernel/exit.c:1468)=
 [
> > > > 558.803462][ T2642] kernel_wait4 (kernel/exit.c:1630) [ 558.806901][
> > > > T2642] ? kill_orphaned_pgrp (kernel/exit.c:1422) [ 558.808347][ T26=
42]
> > > > __ia32_sys_waitpid (kernel/exit.c:1675 kernel/exit.c:1673
> > > > kernel/exit.c:1673) [ 558.809338][ T2642] do_int80_syscall_32
> > > > (arch/x86/entry/common.c:77 arch/x86/entry/common.c:94)
> [ 558.810319][
> > > > T2642] entry_INT80_32 (arch/x86/entry/entry_32.S:1064) [  558.81125=
4][
> > > > T2642] EIP: 0x809b132 [ 558.815723][ T2642] Code: 89 c8 c3 90 8d 74=
 26
> > > > 00 85 c0 c7 01 01 00 00 00 75 d8 a1 6c 94 a8 08 eb d1 66 90 66 90 6=
6 90 66
> 90
> > > 66 90 66 90 66 90 90 cd 80 <c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 0=
0 8b 10
> a3
> > > 94 94 a8 08 85 All code =3D=3D=3D=3D=3D=3D=3D=3D
> > > >    0:	89 c8                	mov    %ecx,%eax
> > > >    2:	c3                   	retq
> > > >    3:	90                   	nop
> > > >    4:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
> > > >    8:	85 c0                	test   %eax,%eax
> > > >    a:	c7 01 01 00 00 00    	movl   $0x1,(%rcx)
> > > >   10:	75 d8                	jne    0xffffffffffffffea
> > > >   12:	a1 6c 94 a8 08 eb d1 	movabs 0x9066d1eb08a8946c,%eax
> > > >   19:	66 90
> > > >   1b:	66 90                	xchg   %ax,%ax
> > > >   1d:	66 90                	xchg   %ax,%ax
> > > >   1f:	66 90                	xchg   %ax,%ax
> > > >   21:	66 90                	xchg   %ax,%ax
> > > >   23:	66 90                	xchg   %ax,%ax
> > > >   25:	66 90                	xchg   %ax,%ax
> > > >   27:	90                   	nop
> > > >   28:	cd 80                	int    $0x80
> > > >   2a:*	c3                   	retq   		<-- trapping instruction
> > > >   2b:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
> > > >   31:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
> > > >   38:	8b 10                	mov    (%rax),%edx
> > > >   3a:	a3                   	.byte 0xa3
> > > >   3b:	94                   	xchg   %eax,%esp
> > > >   3c:	94                   	xchg   %eax,%esp
> > > >   3d:	a8 08                	test   $0x8,%al
> > > >   3f:	85                   	.byte 0x85
> > > >
> > > > Code starting with the faulting instruction
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >    0:	c3                   	retq
> > > >    1:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
> > > >    7:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
> > > >    e:	8b 10                	mov    (%rax),%edx
> > > >   10:	a3                   	.byte 0xa3
> > > >   11:	94                   	xchg   %eax,%esp
> > > >   12:	94                   	xchg   %eax,%esp
> > > >   13:	a8 08                	test   $0x8,%al
> > > >   15:	85                   	.byte 0x85
> > > > [  558.820109][ T2642] EAX: ffffffda EBX: 00000f0f ECX: bfb23394 ED=
X:
> > > > 0000000b [  558.821480][ T2642] ESI: 00000002 EDI: 08a890fc EBP:
> > > > 08a89034 ESP: bfb23364 [  558.822693][ T2642] DS: 007b ES: 007b FS:
> > > > 0000 GS: 0033 SS: 007b EFLAGS: 00000246 [  558.828056][ T2642] irq
> > > > event stamp: 1348273 [ 558.828922][ T2642] hardirqs last enabled at
> > > > (1348281): console_unlock (kernel/printk/printk.c:2605 (discriminat=
or
> > > > 1)) [ 558.830629][ T2642] hardirqs last disabled at (1348288):
> > > > console_unlock (kernel/printk/printk.c:2520 (discriminator 1)) [
> > > > 558.833190][ T2642] softirqs last enabled at (1348240): __do_softirq
> > > > (kernel/softirq.c:372) [ 558.834715][ T2642] softirqs last disabled=
 at
> > > > (1348231): do_softirq_own_stack (arch/x86/kernel/irq_32.c:60
> > > > arch/x86/kernel/irq_32.c:149) [  558.840026][ T2642] ---[ end trace
> > > > 6bbb25560ce8d9b6 ]---
> > > >
> > > >
> > > > To reproduce:
> > > >
> > > >         # build kernel
> > > > 	cd linux
> > > > 	cp config-5.12.0-gd64696905554 .config
> > > > 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare
> > > > modules_prepare bzImage
> > > >
> > > >         git clone https://github.com/intel/lkp-tests.git
> > > >         cd lkp-tests
> > > >         bin/lkp qemu -k <bzImage> job-script # job-script is attach=
ed
> > > > in this email
> > >
> > > I am unable to run the test following this instruction.
> >
> > After double check, we can reproduce this issue, could you kindly offer=
 your
> full log and the reproducing steps?
> =

> Sure. Here is what i did:
 =

Thanks, I tried your steps on my machine, but still can reproduce the kerne=
l panic, I add my steps and log here, hope they can help. Also, a soft remi=
nder, no need to download lkp-tests under linux/.

$ grep PRETTY_NAME /etc/os-release
PRETTY_NAME=3D"Debian GNU/Linux 10 (buster)"

$ git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git

$ cd linux

/linux$ git describe
v5.15-rc1-221-g4357f03d6611

/linux$ cp ../config-5.12.0-gd64696905554 .config

/linux$ make -j8 ARCH=3Di386 olddefconfig prepare modules_prepare bzImage
...
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#1)

/lkp-tests$ sudo bin/lkp qemu -k ../linux/arch/x86/boot/bzImage ../tmp/job-=
script

result_root: /home/carel/.lkp//result/trinity/group-02-99999/vm-snb/yocto-i=
386-minimal-20190520.cgz/i386-randconfig-r015-20210910/gcc-9/d64696905554e9=
19321e31afc210606653b8f6a4/8
downloading initrds ...
/usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 http=
://0day.sh.intel.com:80/~lkp/osimage/yocto/yocto-i386-minimal-20190520.cgz =
-N -P /home/carel/.lkp/cache/osimage/yocto
/usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 http=
://0day.sh.intel.com:80/~lkp/osimage/pkg/yocto-i386-minimal-20190520.cgz/tr=
inity-i386.cgz -N -P /home/carel/.lkp/cache/osimage/pkg/yocto-i386-minimal-=
20190520.cgz
exec command: qemu-system-x86_64 -enable-kvm -fsdev local,id=3Dtest_dev,pat=
h=3D/home/carel/.lkp//result/trinity/group-02-99999/vm-snb/yocto-i386-minim=
al-20190520.cgz/i386-randconfig-r015-20210910/gcc-9/d64696905554e919321e31a=
fc210606653b8f6a4/8,security_model=3Dnone -device virtio-9p-pci,fsdev=3Dtes=
t_dev,mount_tag=3D9p/virtfs_mount -kernel ../linux/arch/x86/boot/bzImage -a=
ppend root=3D/dev/ram0 user=3D$(whoami) job=3D/lkp/jobs/scheduled/vm-snb-43=
/trinity-group-02-99999-yocto-i386-minimal-20190520.cgz-d64696905554e919321=
e31afc210606653b8f6a4-20210911-24127-1x1tp2w-8.yaml ARCH=3Di386 kconfig=3Di=
386-randconfig-r015-20210910 branch=3Dtrace/ftrace/core commit=3Dd646969055=
54e919321e31afc210606653b8f6a4 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-r015=
-20210910/gcc-9/d64696905554e919321e31afc210606653b8f6a4/vmlinuz-5.12.0-gd6=
4696905554 vmalloc=3D128M initramfs_async=3D0 page_owner=3Don max_uptime=3D=
2100 RESULT_ROOT=3D/result/trinity/group-02-99999/vm-snb/yocto-i386-minimal=
-20190520.cgz/i386-randconfig-r015-20210910/gcc-9/d64696905554e919321e31afc=
210606653b8f6a4/8 LKP_LOCAL_RUN=3D1 selinux=3D0 debug apic=3Ddebug sysrq_al=
ways_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.de=
vkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpani=
c load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_leve=
l=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 console=
=3DttyS0,115200 vga=3Dnormal rw  ip=3Ddhcp result_service=3D9p/virtfs_mount=
 -initrd /home/carel/.lkp/cache/final_initrd -smp 2 -m 3700M -no-reboot -wa=
tchdog i6300esb -rtc base=3Dlocaltime -device e1000,netdev=3Dnet0 -netdev u=
ser,id=3Dnet0 -display none -monitor null -serial stdio
early console in setup code
Probing EDD (edd=3Doff to disable)... ok
Wrong EFI loader signature.
early console in extract_kernel
input_data: 0x031af079
input_len: 0x013d184d
output: 0x01000000
output_len: 0x026da05c
kernel_total_size: 0x03597000
needed_size: 0x03597000

Decompressing Linux... Parsing ELF... done.
Booting the kernel.
[    0.000000][    T0] Linux version 5.15.0-rc1-00221-g4357f03d6611 (carel(=
a)carel) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31=
.1) #1 PREEMPT Sat Sep 18 09:42:44 CST 2021
[    0.000000][    T0] KERNEL supported cpus:
[    0.000000][    T0]   AMD AuthenticAMD
[    0.000000][    T0]   NSC Geode by NSC
[    0.000000][    T0]   Cyrix CyrixInstead
[    0.000000][    T0]   Centaur CentaurHauls
[    0.000000][    T0]   zhaoxin   Shanghai  =

[    0.000000][    T0] CPU: vendor_id 'GenuineIntel' unknown, using generic=
 init.
[    0.000000][    T0] CPU: Your system may be unstable.
[    0.000000][    T0] x86/fpu: x87 FPU will use FXSAVE
[    0.000000][    T0] signal: max sigframe size: 1440
[    0.000000][    T0] BIOS-provided physical RAM map:
[    0.000000][    T0] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbf=
f] usable
[    0.000000][    T0] BIOS-e820: [mem 0x000000000009fc00-0x000000000009fff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x00000000000f0000-0x00000000000ffff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x0000000000100000-0x00000000bffdfff=
f] usable
[    0.000000][    T0] BIOS-e820: [mem 0x00000000bffe0000-0x00000000bffffff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x00000000feffc000-0x00000000fefffff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x00000000fffc0000-0x00000000fffffff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x0000000100000000-0x00000001273ffff=
f] usable
[    0.000000][    T0] printk: debug: ignoring loglevel setting.
[    0.000000][    T0] printk: bootconsole [earlyser0] enabled
[    0.000000][    T0] Notice: NX (Execute Disable) protection cannot be en=
abled: non-PAE kernel!
[    0.000000][    T0] SMBIOS 2.8 present.
[    0.000000][    T0] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.=
12.0-1 04/01/2014
[    0.000000][    T0] Hypervisor detected: KVM
[    0.000000][    T0] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    0.000000][    T0] kvm-clock: cpu 0, msr 370e001, primary cpu clock
[    0.000008][    T0] kvm-clock: using sched offset of 1062708934 cycles
[    0.000544][    T0] clocksource: kvm-clock: mask: 0xffffffffffffffff max=
_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.002029][    T0] tsc: Detected 3591.686 MHz processor
[    0.003356][    T0] e820: update [mem 0x00000000-0x00000fff] usable =3D=
=3D> reserved
[    0.003979][    T0] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.004504][    T0] last_pfn =3D 0xbffe0 max_arch_pfn =3D 0x100000
[    0.005027][    T0] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP=
  UC- WT  =

[    0.005670][    T0] initial memory mapped: [mem 0x00000000-0x047fffff]
[    0.006272][    T0] RAMDISK: [mem 0x7f972000-0x7fffffff]
[    0.006716][    T0] Allocated new RAMDISK: [mem 0x36570000-0x36bfd653]
[    0.008979][    T0] Move RAMDISK from [mem 0x7f972000-0x7ffff653] to [me=
m 0x36570000-0x36bfd653]
[    0.009782][    T0] ACPI: Early table checksum verification disabled
[    0.010351][    T0] ACPI: RSDP 0x00000000000F5850 000014 (v00 BOCHS )
[    0.010893][    T0] ACPI: RSDT 0x00000000BFFE15C9 000030 (v01 BOCHS  BXP=
CRSDT 00000001 BXPC 00000001)
[    0.011667][    T0] ACPI: FACP 0x00000000BFFE149D 000074 (v01 BOCHS  BXP=
CFACP 00000001 BXPC 00000001)
[    0.012441][    T0] ACPI: DSDT 0x00000000BFFE0040 00145D (v01 BOCHS  BXP=
CDSDT 00000001 BXPC 00000001)
[    0.013214][    T0] ACPI: FACS 0x00000000BFFE0000 000040
[    0.013662][    T0] ACPI: APIC 0x00000000BFFE1511 000080 (v01 BOCHS  BXP=
CAPIC 00000001 BXPC 00000001)
[    0.014437][    T0] ACPI: HPET 0x00000000BFFE1591 000038 (v01 BOCHS  BXP=
CHPET 00000001 BXPC 00000001)
[    0.015206][    T0] ACPI: Reserving FACP table memory at [mem 0xbffe149d=
-0xbffe1510]
[    0.015851][    T0] ACPI: Reserving DSDT table memory at [mem 0xbffe0040=
-0xbffe149c]
[    0.016492][    T0] ACPI: Reserving FACS table memory at [mem 0xbffe0000=
-0xbffe003f]
[    0.017134][    T0] ACPI: Reserving APIC table memory at [mem 0xbffe1511=
-0xbffe1590]
[    0.017773][    T0] ACPI: Reserving HPET table memory at [mem 0xbffe1591=
-0xbffe15c8]
[    0.018424][    T0] 2195MB HIGHMEM available.
[    0.018789][    T0] 875MB LOWMEM available.
[    0.019136][    T0]   mapped low ram: 0 - 36bfe000
[    0.019530][    T0]   low ram: 0 - 36bfe000
[    0.021850][    T0] Zone ranges:
[    0.022170][    T0]   Normal   [mem 0x0000000000001000-0x0000000036bfdff=
f]
[    0.022742][    T0]   HighMem  [mem 0x0000000036bfe000-0x00000000bffdfff=
f]
[    0.023312][    T0] Movable zone start for each node
[    0.023723][    T0] Early memory node ranges
[    0.024077][    T0]   node   0: [mem 0x0000000000001000-0x000000000009ef=
ff]
[    0.024655][    T0]   node   0: [mem 0x0000000000100000-0x00000000bffdff=
ff]
[    0.025232][    T0] Initmem setup node 0 [mem 0x0000000000001000-0x00000=
000bffdffff]
[    0.025889][    T0] On node 0, zone Normal: 1 pages in unavailable ranges
[    0.030249][    T0] On node 0, zone Normal: 97 pages in unavailable rang=
es
[    0.041791][    T0] On node 0, zone HighMem: 32 pages in unavailable ran=
ges
[    0.042588][    T0] ACPI: PM-Timer IO Port: 0x608
[    0.043569][    T0] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.044084][    T0] kvm-guest: stealtime: cpu 0, msr 2f13ac0
[    0.044581][    T0] [mem 0xc0000000-0xfeffbfff] available for PCI devices
[    0.045157][    T0] Booting paravirtualized kernel on KVM
[    0.045623][    T0] clocksource: refined-jiffies: mask: 0xffffffff max_c=
ycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.046605][    T0] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
[    0.047131][    T0] pcpu-alloc: [0] 0 =

[    0.047464][    T0] Built 1 zonelists, mobility grouping on.  Total page=
s: 784550
[    0.048095][    T0] Kernel command line: root=3D/dev/ram0 user=3D$(whoam=
i) job=3D/lkp/jobs/scheduled/vm-snb-43/trinity-group-02-99999-yocto-i386-mi=
nimal-20190520.cgz-d64696905554e919321e31afc210606653b8f6a4-20210911-24127-=
1x1tp2w-8.yaml ARCH=3Di386 kconfig=3Di386-randconfig-r015-20210910 branch=
=3Dtrace/ftrace/core commit=3Dd64696905554e919321e31afc210606653b8f6a4 BOOT=
_IMAGE=3D/pkg/linux/i386-randconfig-r015-20210910/gcc-9/d64696905554e919321=
e31afc210606653b8f6a4/vmlinuz-5.12.0-gd64696905554 vmalloc=3D128M initramfs=
_async=3D0 page_owner=3Don max_uptime=3D2100 RESULT_ROOT=3D/result/trinity/=
group-02-99999/vm-snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-r015-=
20210910/gcc-9/d64696905554e919321e31afc210606653b8f6a4/8 LKP_LOCAL_RUN=3D1=
 selinux=3D0 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall=
_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_pa=
nic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=
=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr ignore_loglevel console=
=3Dtty0 =

[    0.048491][    T0] sysrq: sysrq always enabled.
[    0.056301][    T0] ignoring the deprecated load_ramdisk=3D option
[    0.057014][    T0] Unknown command line parameters: user=3D$(whoami) jo=
b=3D/lkp/jobs/scheduled/vm-snb-43/trinity-group-02-99999-yocto-i386-minimal=
-20190520.cgz-d64696905554e919321e31afc210606653b8f6a4-20210911-24127-1x1tp=
2w-8.yaml ARCH=3Di386 kconfig=3Di386-randconfig-r015-20210910 branch=3Dtrac=
e/ftrace/core commit=3Dd64696905554e919321e31afc210606653b8f6a4 BOOT_IMAGE=
=3D/pkg/linux/i386-randconfig-r015-20210910/gcc-9/d64696905554e919321e31afc=
210606653b8f6a4/vmlinuz-5.12.0-gd64696905554 max_uptime=3D2100 RESULT_ROOT=
=3D/result/trinity/group-02-99999/vm-snb/yocto-i386-minimal-20190520.cgz/i3=
86-randconfig-r015-20210910/gcc-9/d64696905554e919321e31afc210606653b8f6a4/=
8 LKP_LOCAL_RUN=3D1 selinux=3D0 apic=3Ddebug softlockup_panic=3D1 prompt_ra=
mdisk=3D0 vga=3Dnormal result_service=3D9p/virtfs_mount
[    0.062708][    T0] Dentry cache hash table entries: 131072 (order: 7, 5=
24288 bytes, linear)
[    0.063433][    T0] Inode-cache hash table entries: 65536 (order: 6, 262=
144 bytes, linear)
[    0.064320][    T0] mem auto-init: stack:off, heap alloc:on, heap free:on
[    0.064898][    T0] mem auto-init: clearing system memory may take some =
time...
[    0.067713][    T0] Initializing HighMem for node 0 (00036bfe:000bffe0)
[    1.664514][    T0] Initializing Movable for node 0 (00000000:00000000)
[    2.271551][    T0] Checking if this processor honours the WP bit even i=
n supervisor mode...Ok.
[    2.272366][    T0] Memory: 3052536K/3145208K available (23745K kernel c=
ode, 7165K rwdata, 7728K rodata, 1028K init, 13920K bss, 92672K reserved, 0=
K cma-reserved, 2248584K highmem)
[    2.273752][    T0] random: get_random_u32 called from __kmem_cache_crea=
te+0x48/0x7c0 with crng_init=3D0
[    2.273842][    T0] random: get_random_u32 called from cache_random_seq_=
create+0xb7/0x250 with crng_init=3D0
[    2.273901][    T0] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPU=
s=3D1, Nodes=3D1
[    2.276153][    T0] random: get_random_u32 called from __kmem_cache_crea=
te+0x48/0x7c0 with crng_init=3D0
[    2.276204][    T0] trace event string verifier disabled
[    2.277560][    T0] Running RCU self tests
[    2.277935][    T0] rcu: Preemptible hierarchical RCU implementation.
[    2.278486][    T0] rcu: 	RCU lockdep checking is enabled.
[    2.278955][    T0] rcu: 	RCU debug extended QS entry/exit.
[    2.279432][    T0] 	RCU CPU stall warnings timeout set to 100 (rcu_cpu_=
stall_timeout).
[    2.280116][    T0] 	Trampoline variant of Tasks RCU enabled.
[    2.280606][    T0] 	Rude variant of Tasks RCU enabled.
[    2.281052][    T0] 	Tracing variant of Tasks RCU enabled.
[    2.281524][    T0] rcu: RCU calculated value of scheduler-enlistment de=
lay is 25 jiffies.
[    2.283419][    T0] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    2.284284][    T0] kfence: initialized - using 2097152 bytes for 255 ob=
jects at 0x(ptrval)-0x(ptrval)
[    2.285222][    T0] printk: console [ttyS0] enabled
[    2.285222][    T0] printk: console [ttyS0] enabled
[    2.286089][    T0] printk: bootconsole [earlyser0] disabled
[    2.286089][    T0] printk: bootconsole [earlyser0] disabled
[    2.287063][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    2.287797][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    2.288218][    T0] ... MAX_LOCK_DEPTH:          48
[    2.288647][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    2.289090][    T0] ... CLASSHASH_SIZE:          4096
[    2.289533][    T0] ... MAX_LOCKDEP_ENTRIES:     32768
[    2.289987][    T0] ... MAX_LOCKDEP_CHAINS:      65536
[    2.290439][    T0] ... CHAINHASH_SIZE:          32768
[    2.290889][    T0]  memory used by lock dependency info: 3805 kB
[    2.291423][    T0]  memory used for stack traces: 2112 kB
[    2.291903][    T0]  per task-struct memory footprint: 1344 bytes
[    2.292443][    T0] ACPI: Core revision 20210730
[    2.292998][    T0] ACPI: setting ELCR to 0200 (from 0c00)
[    2.293574][    T0] clocksource: hpet: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 19112604467 ns
[    2.294563][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x33c5a5f08b9, max_idle_ns: 440795345409 ns
[    2.295561][    T0] Calibrating delay loop (skipped) preset value.. 7183=
.37 BogoMIPS (lpj=3D14366744)
[    2.296352][    T0] pid_max: default: 32768 minimum: 301
[    2.296866][    T0] LSM: Security Framework initializing
[    2.297360][    T0] Mount-cache hash table entries: 2048 (order: 1, 8192=
 bytes, linear)
[    2.298067][    T0] Mountpoint-cache hash table entries: 2048 (order: 1,=
 8192 bytes, linear)
[    2.300096][    T0] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    2.300634][    T0] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    2.301217][    T0] CPU: GenuineIntel QEMU Virtual CPU version 2.5+ (fam=
ily: 0x6, model: 0x6, stepping: 0x3)
[    2.302076][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    2.302889][    T0] Spectre V2 : Spectre mitigation: kernel not compiled=
 with retpoline; no mitigation available!
[    2.302891][    T0] Speculative Store Bypass: Vulnerable
[    2.304023][    T0] L1TF: Kernel not compiled for PAE. No mitigation for=
 L1TF
[    2.304650][    T0] MDS: Vulnerable: Clear CPU buffers attempted, no mic=
rocode
[    2.306112][    T1] Running RCU-tasks wait API self tests
[    2.407774][    T1] Performance Events: no PMU driver, software events o=
nly.
[    2.409029][    T1] rcu: Hierarchical SRCU implementation.
[    2.410091][    T1] dyndbg: Ignore empty _ddebug table in a CONFIG_DYNAM=
IC_DEBUG_CORE build
[    2.411359][    T1] NMI watchdog: Perf NMI watchdog permanently disabled
[    2.415631][   T12] Callback from call_rcu_tasks_trace() invoked.
[    2.419040][    T1] allocated 31457280 bytes of page_ext
[    2.420779][    T1] Node 0, zone   Normal: page owner found early alloca=
ted 8181 pages
[    2.422009][    T1] Node 0, zone  HighMem: page owner found early alloca=
ted 0 pages
[    2.423650][    T1] devtmpfs: initialized
[    2.424381][    T1] version magic: 0x4138332a
[    2.427072][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 7645041785100000 ns
[    2.427568][    T1] futex hash table entries: 256 (order: 1, 12288 bytes=
, linear)
[    2.428377][    T1] prandom: seed boundary self test passed
[    2.429388][    T1] prandom: 100 self tests passed
[    2.433248][    T1] prandom32: self test passed (less than 6 bits correl=
ated)
[    2.433877][    T1] pinctrl core: initialized pinctrl subsystem
[    2.434402][    T1] pinctrl core: failed to create debugfs directory
[    2.435209][    T1] regulator-dummy: no parameters, enabled
[    2.435665][    T1] =

[    2.435871][    T1] ****************************************************=
*********
[    2.436525][    T1] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOT=
ICE    **
[    2.437177][    T1] **                                                  =
       **
[    2.437838][    T1] **  IOMMU DebugFS SUPPORT HAS BEEN ENABLED IN THIS K=
ERNEL  **
[    2.438486][    T1] **                                                  =
       **
[    2.439139][    T1] ** This means that this kernel is built to expose in=
ternal **
[    2.439556][    T1] ** IOMMU data structures, which may compromise secur=
ity on **
[    2.440210][    T1] ** your system.                                     =
       **
[    2.440861][    T1] **                                                  =
       **
[    2.441508][    T1] ** If you see this message and you are not debugging=
 the   **
[    2.442159][    T1] ** kernel, report this immediately to your vendor!  =
       **
[    2.442813][    T1] **                                                  =
       **
[    2.443556][    T1] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOT=
ICE    **
[    2.444210][    T1] ****************************************************=
*********
[    2.445099][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    2.446474][    T1] audit: initializing netlink subsys (disabled)
[    2.447713][    T1] cpuidle: using governor ladder
[    2.448685][    T1] ACPI: bus type PCI registered
[    2.449251][    T1] PCI: Using configuration type 1 for base access
[    2.451593][   T18] audit: type=3D2000 audit(1631929790.328:1): state=3D=
initialized audit_enabled=3D0 res=3D1
[    2.459421][    T1] HugeTLB registered 4.00 MiB page size, pre-allocated=
 0 pages
[    2.460512][   T25] cryptomgr_test (25) used greatest stack depth: 7324 =
bytes left
[    2.462143][    T1] cryptd: max_cpu_qlen set to 1000
[    2.464553][    T1] gpio-f7188x: Not a Fintek device at 0x0000002e
[    2.465127][    T1] gpio-f7188x: Not a Fintek device at 0x0000004e
[    2.465728][    T1] ACPI: Added _OSI(Module Device)
[    2.466164][    T1] ACPI: Added _OSI(Processor Device)
[    2.466619][    T1] ACPI: Added _OSI(3.0 _SCP Extensions)
[    2.467101][    T1] ACPI: Added _OSI(Processor Aggregator Device)
[    2.467665][    T1] ACPI: Added _OSI(Linux-Dell-Video)
[    2.468124][    T1] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    2.468654][    T1] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    2.471762][    T1] ACPI: 1 ACPI AML tables successfully acquired and lo=
aded
[    2.474525][    T1] ACPI: Interpreter enabled
[    2.474959][    T1] ACPI: PM: (supports S0 S3 S5)
[    2.475379][    T1] ACPI: Using PIC for interrupt routing
[    2.475598][    T1] PCI: Using host bridge windows from ACPI; if necessa=
ry, use "pci=3Dnocrs" and report a bug
[    2.476792][    T1] ACPI: Enabled 2 GPEs in block 00 to 0F
[    2.487114][    T1] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff=
])
[    2.487567][    T1] acpi PNP0A03:00: _OSC: OS supports [Segments HPX-Typ=
e3]
[    2.488207][    T1] acpi resource window ([0x140000000-0x1bfffffff] igno=
red, not CPU addressable)
[    2.489975][    T1] PCI host bridge to bus 0000:00
[    2.490402][    T1] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf=
7 window]
[    2.491059][    T1] pci_bus 0000:00: root bus resource [io  0x0d00-0xfff=
f window]
[    2.491557][    T1] pci_bus 0000:00: root bus resource [mem 0x000a0000-0=
x000bffff window]
[    2.492268][    T1] pci_bus 0000:00: root bus resource [mem 0xc0000000-0=
xfebfffff window]
[    2.492974][    T1] pci_bus 0000:00: root bus resource [bus 00-ff]
[    2.493968][    T1] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    2.495802][    T1] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    2.497037][    T1] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    2.499268][    T1] pci 0000:00:01.1: reg 0x20: [io  0xc080-0xc08f]
[    2.500250][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0=
x01f0-0x01f7]
[    2.500932][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0=
x03f6]
[    2.501555][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0=
x0170-0x0177]
[    2.502230][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0=
x0376]
[    2.504048][    T1] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    2.504876][    T1] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed=
 by PIIX4 ACPI
[    2.505571][    T1] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed=
 by PIIX4 SMB
[    2.506929][    T1] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
[    2.511755][   T11] Callback from call_rcu_tasks_rude() invoked.
[    2.515963][    T1] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffff=
ff pref]
[    2.518124][    T1] pci 0000:00:02.0: reg 0x18: [mem 0xfebf0000-0xfebf0f=
ff]
[    2.521663][    T1] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeff=
ff pref]
[    2.524209][    T1] pci 0000:00:03.0: [1af4:1009] type 00 class 0x000200
[    2.525976][    T1] pci 0000:00:03.0: reg 0x10: [io  0xc000-0xc03f]
[    2.527331][    T1] pci 0000:00:03.0: reg 0x14: [mem 0xfebf1000-0xfebf1f=
ff]
[    2.529511][    T1] pci 0000:00:03.0: reg 0x20: [mem 0xfe000000-0xfe003f=
ff 64bit pref]
[    2.532428][    T1] pci 0000:00:04.0: [8086:100e] type 00 class 0x020000
[    2.533708][    T1] pci 0000:00:04.0: reg 0x10: [mem 0xfebc0000-0xfebdff=
ff]
[    2.534960][    T1] pci 0000:00:04.0: reg 0x14: [io  0xc040-0xc07f]
[    2.538549][    T1] pci 0000:00:04.0: reg 0x30: [mem 0xfeb80000-0xfebbff=
ff pref]
[    2.539960][    T1] pci 0000:00:05.0: [8086:25ab] type 00 class 0x088000
[    2.540813][    T1] pci 0000:00:05.0: reg 0x10: [mem 0xfebf2000-0xfebf20=
0f]
[    2.543208][    T1] pci_bus 0000:00: on NUMA node 0
[    2.544762][    T1] ACPI: PCI: Interrupt link LNKA configured for IRQ 10
[    2.545566][    T1] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    2.546357][    T1] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    2.547701][    T1] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
[    2.548470][    T1] ACPI: PCI: Interrupt link LNKS configured for IRQ 9
[    2.549739][    T1] iommu: Default domain type: Translated =

[    2.550234][    T1] iommu: DMA domain TLB invalidation policy: lazy mode =

[    2.551069][    T1] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    2.551552][    T1] pci 0000:00:02.0: vgaarb: VGA device added: decodes=
=3Dio+mem,owns=3Dio+mem,locks=3Dnone
[    2.551558][    T1] pci 0000:00:02.0: vgaarb: bridge control possible
[    2.552118][    T1] vgaarb: loaded
[    2.552890][    T1] SCSI subsystem initialized
[    2.553322][    T1] libata version 3.00 loaded.
[    2.553821][    T1] ACPI: bus type USB registered
[    2.554311][    T1] usbcore: registered new interface driver usbfs
[    2.555594][    T1] usbcore: registered new interface driver hub
[    2.556144][    T1] usbcore: registered new device driver usb
[    2.556803][    T1] mc: Linux media interface: v0.10
[    2.557362][    T1] videodev: Linux video capture interface: v2.00
[    2.557922][    T1] cec: Failed to create debugfs cec dir
[    2.558417][    T1] pps_core: LinuxPPS API ver. 1 registered
[    2.558920][    T1] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 =
Rodolfo Giometti <giometti@linux.it>
[    2.559571][    T1] PTP clock support registered
[    2.560592][    T1] PCI: Using ACPI for IRQ routing
[    2.561032][    T1] PCI: pci_cache_line_size set to 64 bytes
[    2.561603][    T1] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
[    2.562195][    T1] e820: reserve RAM buffer [mem 0xbffe0000-0xbfffffff]
[    2.563869][    T1] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    2.564371][    T1] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
[    2.568656][    T1] clocksource: Switched to clocksource kvm-clock
[    2.603886][    T1] VFS: Disk quotas dquot_6.6.0
[    2.604326][    T1] VFS: Dquot-cache hash table entries: 1024 (order 0, =
4096 bytes)
[    2.605145][    T1] pnp: PnP ACPI init
[    2.605820][    T1] pnp 00:03: [dma 2]
[    2.607006][    T1] pnp: PnP ACPI: found 6 devices
[    2.607444][    T1] PnPBIOS: Disabled
[    2.654549][    T1] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xf=
fffff, max_idle_ns: 2085701024 ns
[    2.655450][    T1] intel_rapl_common: driver does not support CPU famil=
y 6 model 6
[    2.656239][    T1] NET: Registered PF_INET protocol family
[    2.656804][    T1] IP idents hash table entries: 16384 (order: 5, 13107=
2 bytes, linear)
[    2.657924][    T1] CE: hpet increased min_delta_ns to 5000 nsec
[    2.657982][    T1] CE: hpet increased min_delta_ns to 7500 nsec
[    2.658067][    T1] CE: hpet increased min_delta_ns to 11250 nsec
[    2.658238][    T1] tcp_listen_portaddr_hash hash table entries: 512 (or=
der: 2, 22528 bytes, linear)
[    2.660688][    T1] TCP established hash table entries: 8192 (order: 3, =
32768 bytes, linear)
[    2.661524][    T1] TCP bind hash table entries: 8192 (order: 6, 327680 =
bytes, linear)
[    2.662406][    T1] TCP: Hash tables configured (established 8192 bind 8=
192)
[    2.663095][    T1] UDP hash table entries: 512 (order: 3, 49152 bytes, =
linear)
[    2.663884][    T1] UDP-Lite hash table entries: 512 (order: 3, 49152 by=
tes, linear)
[    2.664683][    T1] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    2.665548][    T1] RPC: Registered named UNIX socket transport module.
[    2.666144][    T1] RPC: Registered udp transport module.
[    2.666622][    T1] RPC: Registered tcp transport module.
[    2.667098][    T1] RPC: Registered tcp NFSv4.1 backchannel transport mo=
dule.
[    2.667787][    T1] NET: Registered PF_XDP protocol family
[    2.668288][    T1] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 windo=
w]
[    2.668894][    T1] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff windo=
w]
[    2.669503][    T1] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bff=
ff window]
[    2.670166][    T1] pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfff=
ff window]
[    2.670846][    T1] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    2.671417][    T1] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    2.672047][    T1] pci 0000:00:01.0: Activating ISA DMA hang workarounds
[    2.672676][    T1] pci 0000:00:02.0: Video device with shadowed ROM at =
[mem 0x000c0000-0x000dffff]
[    2.673494][    T1] PCI: CLS 0 bytes, default 64
[    2.674101][    T7] Unpacking initramfs...
[    2.723674][   T10] Callback from call_rcu_tasks() invoked.
[    2.999818][    T7] Freeing initrd memory: 6712K
[    3.000768][    T1] clocksource: tsc: mask: 0xffffffffffffffff max_cycle=
s: 0x33c5a5f08b9, max_idle_ns: 440795345409 ns
[    3.001880][    T1] NatSemi SCx200 Driver
[    3.303836][    C0] random: fast init done
[    3.511878][    T9] _warn_unseeded_randomness: 232 callbacks suppressed
[    3.511882][    T9] random: get_random_u32 called from get_random_order+=
0xd0/0x130 with crng_init=3D1
[    7.526547][    T7] random: get_random_u32 called from allocate_slab+0x2=
21/0xbd0 with crng_init=3D1
[    7.529115][    T9] random: get_random_u32 called from stress_one_work+0=
x21/0xe0 with crng_init=3D1
[    7.529177][   T68] random: get_random_u32 called from get_random_order+=
0xd0/0x130 with crng_init=3D1
[    9.531307][    T1] _warn_unseeded_randomness: 1 callbacks suppressed
[    9.531311][    T1] random: get_random_u32 called from __kmem_cache_crea=
te+0x48/0x7c0 with crng_init=3D1
[    9.531319][    T1] random: get_random_u32 called from cache_random_seq_=
create+0xb7/0x250 with crng_init=3D1
[    9.531365][    T1] random: get_random_u32 called from allocate_slab+0x2=
21/0xbd0 with crng_init=3D1
[    9.716152][    T1] Initialise system trusted keyrings
[    9.716716][    T1] workingset: timestamp_bits=3D30 max_order=3D20 bucke=
t_order=3D0
[    9.723158][    T1] zbud: loaded
[    9.723992][    T1] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    9.725282][    T1] efs: 1.0a - http://aeschi.ch.eu.org/efs/
[    9.725902][    T1] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[    9.726505][    T1] QNX4 filesystem 0.2.3 registered.
[    9.727134][    T1] JFS: nTxBlock =3D 8192, nTxLock =3D 65536
[    9.731931][    T1] gfs2: GFS2 installed
[    9.742088][    T1] NET: Registered PF_ALG protocol family
[    9.742603][    T1] Key type asymmetric registered
[    9.743047][    T1] Asymmetric key parser 'x509' registered
[    9.743771][    T1] bounce: pool size: 64 pages
[    9.744282][    T1] Block layer SCSI generic (bsg) driver version 0.4 lo=
aded (major 249)
[    9.745014][    T1] io scheduler kyber registered
[    9.759031][    T1] crc32: CRC_LE_BITS =3D 1, CRC_BE BITS =3D 1
[    9.759527][    T1] crc32: self tests passed, processed 225944 bytes in =
6670415 nsec
[    9.767046][    T1] crc32c: CRC_LE_BITS =3D 1
[    9.767423][    T1] crc32c: self tests passed, processed 225944 bytes in=
 3365492 nsec
[   10.062697][    T1] crc32_combine: 8373 self tests passed
[   10.343705][    T1] crc32c_combine: 8373 self tests passed
[   10.344523][    T1] start plist test
[   10.347001][    T1] end plist test
[   10.348086][    T1] switchtec: loaded.
[   10.348683][    T1] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN=
:00/input/input0
[   10.355768][    T1] ACPI: button: Power Button [PWRF]
[   10.356297][    T1] EINJ: EINJ table not found.
[   10.356819][    T1] isapnp: Scanning for PnP cards...
[   10.713449][    T1] isapnp: No Plug & Play device found
[   10.861044][    T1] ACPI: \_SB_.LNKC: Enabled at IRQ 11
[   10.861528][    T1] PCI: setting IRQ 11 as level-triggered
[   10.886858][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing disa=
bled
[   10.887553][    T1] serial 00:05: GPIO lookup for consumer rs485-term
[   10.888165][    T1] serial 00:05: using ACPI for GPIO lookup
[   10.888669][    T1] acpi PNP0501:00: GPIO: looking up rs485-term-gpios
[   10.889240][    T1] acpi PNP0501:00: GPIO: looking up rs485-term-gpio
[   10.889811][    T1] serial 00:05: using lookup tables for GPIO lookup
[   10.890383][    T1] serial 00:05: No GPIO consumer rs485-term found
[   10.891033][    T1] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D =
115200) is a 16550A
[   10.892621][    T1] Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:5=
7 dwmw2 Exp $
[   10.893325][    T1] ac.o: No PCI boards found.
[   10.893720][    T1] ac.o: For an ISA board you must supply memory and ir=
q parameters.
[   10.894788][    T1] platform pc8736x_gpio.0: NatSemi pc8736x GPIO Driver=
 Initializing
[   10.895488][    T1] platform pc8736x_gpio.0: no device found
[   10.896106][    T1] nsc_gpio initializing
[   10.896477][    T1] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
[   10.896985][    T1] Linux agpgart interface v0.103
[   10.897524][    T1] dummy-irq: no IRQ given.  Use irq=3DN
[   10.898490][    T1] usbcore: registered new interface driver dln2
[   10.899155][    T1] _warn_unseeded_randomness: 175 callbacks suppressed
[   10.899156][    T1] random: get_random_u32 called from __kmem_cache_crea=
te+0x48/0x7c0 with crng_init=3D1
[   10.899162][    T1] random: get_random_u32 called from cache_random_seq_=
create+0xb7/0x250 with crng_init=3D1
[   10.899183][    T1] random: get_random_u32 called from allocate_slab+0x2=
21/0xbd0 with crng_init=3D1
[   10.903868][    T1] Rounding down aligned max_sectors from 4294967295 to=
 4294967288
[   10.904625][    T1] db_root: cannot open: /etc/target
[   10.905182][    T1] mtdoops: mtd device (mtddev=3Dname/number) must be s=
upplied
[   10.905862][    T1] slram: not enough parameters.
[   10.907922][    T1] mtd mtd0: GPIO lookup for consumer wp
[   10.908415][    T1] mtd mtd0: using lookup tables for GPIO lookup
[   10.908952][    T1] mtd mtd0: No GPIO consumer wp found
[   10.910396][   T96] kworker/u2:3 (96) used greatest stack depth: 6764 by=
tes left
[   10.911319][    T1] [nandsim] warning: read_byte: unexpected data output=
 cycle, state is STATE_READY return 0x0
[   10.912284][    T1] [nandsim] warning: read_byte: unexpected data output=
 cycle, state is STATE_READY return 0x0
[   10.913250][    T1] [nandsim] warning: read_byte: unexpected data output=
 cycle, state is STATE_READY return 0x0
[   10.914137][    T1] [nandsim] warning: read_byte: unexpected data output=
 cycle, state is STATE_READY return 0x0
[   10.915010][    T1] [nandsim] warning: read_byte: unexpected data output=
 cycle, state is STATE_READY return 0x0
[   10.915964][    T1] [nandsim] warning: read_byte: unexpected data output=
 cycle, state is STATE_READY return 0x0
[   10.916861][    T1] nand: device found, Manufacturer ID: 0x98, Chip ID: =
0x39
[   10.917489][    T1] nand: Toshiba NAND 128MiB 1,8V 8-bit
[   10.917967][    T1] nand: 128 MiB, SLC, erase size: 16 KiB, page size: 5=
12, OOB size: 16
[   10.918686][    T1] flash size: 128 MiB
[   10.919030][    T1] page size: 512 bytes
[   10.919380][    T1] OOB area size: 16 bytes
[   10.919838][    T1] sector size: 16 KiB
[   10.920188][    T1] pages number: 262144
[   10.920537][    T1] pages per sector: 32
[   10.920888][    T1] bus width: 8
[   10.921177][    T1] bits in sector size: 14
[   10.921557][    T1] bits in page size: 9
[   10.921905][    T1] bits in OOB size: 4
[   10.922247][    T1] flash size with OOB: 135168 KiB
[   10.922677][    T1] page address bytes: 4
[   10.923035][    T1] sector address bytes: 3
[   10.923414][    T1] options: 0x42
[   10.924729][    T1] Scanning device for bad blocks
[   10.940846][    T1] mtd mtd1: GPIO lookup for consumer wp
[   10.941339][    T1] mtd mtd1: using lookup tables for GPIO lookup
[   10.941872][    T1] mtd mtd1: No GPIO consumer wp found
[   10.942429][    T1] mtdblock: MTD device 'NAND 128MiB 1,8V 8-bit' is NAN=
D, please consider using UBI block devices instead.
[   10.944013][    T1] Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit=
":
[   10.944630][    T1] 0x000000000000-0x000008000000 : "NAND simulator part=
ition 0"
[   10.950174][    T1] mtd mtd2: GPIO lookup for consumer wp
[   10.950660][    T1] mtd mtd2: using lookup tables for GPIO lookup
[   10.951195][    T1] mtd mtd2: No GPIO consumer wp found
[   10.951875][    T1] mtdblock: MTD device 'NAND simulator partition 0' is=
 NAND, please consider using UBI block devices instead.
[   10.953344][    T1] MACsec IEEE 802.1AE
[   10.954388][    T1] mdio_bus fixed-0: GPIO lookup for consumer reset
[   10.954959][    T1] mdio_bus fixed-0: using lookup tables for GPIO lookup
[   10.955561][    T1] mdio_bus fixed-0: No GPIO consumer reset found
[   10.956214][    T1] libphy: Fixed MDIO Bus: probed
[   10.957361][    T1] e1000: Intel(R) PRO/1000 Network Driver
[   10.957859][    T1] e1000: Copyright (c) 1999-2006 Intel Corporation.
[   11.105215][    T1] ACPI: \_SB_.LNKD: Enabled at IRQ 11
[   11.445953][    T1] e1000 0000:00:04.0 eth0: (PCI:33MHz:32-bit) 52:54:00=
:12:34:56
[   11.446657][    T1] e1000 0000:00:04.0 eth0: Intel(R) PRO/1000 Network C=
onnection
[   11.447397][    T1] PPP generic driver version 2.4.2
[   11.448058][    T1] usbcore: registered new interface driver lan78xx
[   11.448932][    T1] VFIO - User Level meta-driver version: 0.3
[   11.449748][    T1] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driv=
er
[   11.450418][    T1] driver u132_hcd
[   11.450850][    T1] usbcore: registered new interface driver microtekX6
[   11.451448][    T1] usbcore: registered new interface driver emi26 - fir=
mware loader
[   11.452174][    T1] ftdi_elan: driver ftdi-elan
[   11.452599][    T1] usbcore: registered new interface driver ftdi-elan
[   11.453192][    T1] usbcore: registered new interface driver iowarrior
[   11.453787][    T1] usbcore: registered new interface driver ldusb
[   11.454346][    T1] usbcore: registered new interface driver legousbtower
[   11.454973][    T1] usbcore: registered new interface driver usbtest
[   11.455548][    T1] usbcore: registered new interface driver trancevibra=
tor
[   11.456225][    T1] usbcore: registered new interface driver yurex
[   11.456869][    T1] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU=
] at 0x60,0x64 irq 1,12
[   11.458241][    T1] serio: i8042 KBD port at 0x60,0x64 irq 1
[   11.458904][    T1] serio: i8042 AUX port at 0x60,0x64 irq 12
[   11.460037][    T5] input: AT Translated Set 2 keyboard as /devices/plat=
form/i8042/serio0/input/input1
[   11.462860][    T1] rtc-test rtc-test.0: registered as rtc0
[   11.463371][    T1] rtc-test rtc-test.0: setting system clock to 2021-09=
-18T01:49:59 UTC (1631929799)
[   11.464617][    T1] rtc-test rtc-test.1: registered as rtc1
[   11.465293][    T1] rtc-test rtc-test.2: registered as rtc2
[   11.465866][    T1] i2c_dev: i2c /dev entries driver
[   11.466473][    T1] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0=
x700, revision 0
[   11.468866][    T1] eeprom 0-0050: eeprom driver is deprecated, please u=
se at24 instead
[   11.471018][    T1] eeprom 0-0051: eeprom driver is deprecated, please u=
se at24 instead
[   11.473212][    T1] eeprom 0-0052: eeprom driver is deprecated, please u=
se at24 instead
[   11.475335][    T1] eeprom 0-0053: eeprom driver is deprecated, please u=
se at24 instead
[   11.477489][    T1] eeprom 0-0054: eeprom driver is deprecated, please u=
se at24 instead
[   11.479704][    T1] eeprom 0-0055: eeprom driver is deprecated, please u=
se at24 instead
[   11.481982][    T1] eeprom 0-0056: eeprom driver is deprecated, please u=
se at24 instead
[   11.489331][    T1] eeprom 0-0057: eeprom driver is deprecated, please u=
se at24 instead
[   11.490817][    T1] isa i2c-pca-isa.0: Please specify I/O base
[   11.493416][    T1] dvbdev: DVB: registering new adapter (dvb_vidtv_brid=
ge)
[   11.495303][    T1] i2c i2c-1: DVB: registering adapter 0 frontend 0 (Du=
mmy demod for DVB-T/T2/C/S/S2)...
[   11.496901][    T1] dvbdev: dvb_create_media_entity: media entity 'Dummy=
 demod for DVB-T/T2/C/S/S2' registered.
[   11.500240][    T1] dvbdev: dvb_create_media_entity: media entity 'dvb-d=
emux' registered.
[   11.501575][    T1] vidtv vidtv.0: Successfully initialized vidtv!
[   11.502354][    T1] Driver for 1-wire Dallas network protocol.
[   11.502937][    T1] usbcore: registered new interface driver DS9490R
[   11.628376][    T1] sdhci: Secure Digital Host Controller Interface driv=
er
[   11.629403][    T1] sdhci: Copyright(c) Pierre Ossman
[   11.630190][    T1] wbsd: Winbond W83L51xD SD/MMC card interface driver
[   11.631161][    T1] wbsd: Copyright(c) Pierre Ossman
[   11.632071][    T1] ledtrig-cpu: registered to indicate activity on CPUs
[   11.634071][    T1] usbcore: registered new interface driver usbhid
[   11.635007][    T1] usbhid: USB HID core driver
[   11.636268][    T1] IDT PCI-E Non-Transparent Bridge Driver 2.0
[   11.637343][    T1] Software Queue-Pair Transport over NTB, version 4
[   11.638432][    T1] usbcore: registered new interface driver hdm_usb
[   11.640331][    T1] NET: Registered PF_INET6 protocol family
[   11.642263][    T1] Segment Routing with IPv6
[   11.642945][    T1] In-situ OAM (IOAM) with IPv6
[   11.643788][    T1] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[   11.644755][    T1] NET: Registered PF_PACKET protocol family
[   11.645308][    T1] can: controller area network core
[   11.645842][    T1] NET: Registered PF_CAN protocol family
[   11.646329][    T1] can: raw protocol
[   11.646667][    T1] can: broadcast manager protocol
[   11.647104][    T1] can: netlink gateway - max_hops=3D1
[   11.647800][    T1] 9pnet: Installing 9P2000 support
[   11.649059][    T1] batman_adv: B.A.T.M.A.N. advanced 2021.3 (compatibil=
ity version 15) loaded
[   11.650343][    T1] sched_clock: Marking stable (11640208064, 7381146)->=
(11676156873, -28567663)
[   11.651206][    T1] registered taskstats version 1
[   11.651704][    T1] Loading compiled-in X.509 certificates
[   11.652192][    T1] debug_vm_pgtable: [debug_vm_pgtable         ]: Valid=
ating architecture page table helpers
[   11.654322][    T1] Key type ._fscrypt registered
[   11.654758][    T1] Key type .fscrypt registered
[   11.655169][    T1] Key type fscrypt-provisioning registered
[   11.655819][    T1] fs-verity: Initialized fs-verity
[   11.657513][    T1] Key type encrypted registered
[   11.658191][    T1] UBI error: cannot create "ubi" debugfs directory, er=
ror -2
[   11.659248][    T1] UBI error: cannot initialize UBI, error -2
[   12.073468][    T5] input: ImExPS/2 Generic Explorer Mouse as /devices/p=
latform/i8042/serio1/input/input3
[   12.079546][    T1] _warn_unseeded_randomness: 111 callbacks suppressed
[   12.079550][    T1] random: get_random_bytes called from ip_auto_config+=
0x52b/0x10d3 with crng_init=3D1
[   12.084443][    T5] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Fl=
ow Control: RX
[   12.087817][    T5] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes re=
ady
[   12.089422][    T5] random: get_random_bytes called from addrconf_dad_ki=
ck+0x9b/0x140 with crng_init=3D1
[   12.107865][    T1] Sending DHCP requests .
[   12.107874][    T1] random: get_random_bytes called from ic_dynamic+0x1b=
d/0x838 with crng_init=3D1
[   12.108143][    T1] , OK
[   12.110590][    T1] IP-Config: Got DHCP answer from 10.0.2.2, my address=
 is 10.0.2.15
[   12.111875][    T1] IP-Config: Complete:
[   12.112467][    T1]      device=3Deth0, hwaddr=3D52:54:00:12:34:56, ipad=
dr=3D10.0.2.15, mask=3D255.255.255.0, gw=3D10.0.2.2
[   12.113964][    T1]      host=3D10.0.2.15, domain=3D, nis-domain=3D(none)
[   12.114874][    T1]      bootserver=3D10.0.2.2, rootserver=3D10.0.2.2, r=
ootpath=3D
[   12.114878][    T1]      nameserver0=3D10.0.2.3
[   12.120151][    T1] Freeing unused kernel image (initmem) memory: 1028K
[   12.128086][    T1] Write protecting kernel text and read-only data: 314=
76k
[   12.128808][    T1] rodata_test: all tests were successful
[   12.139988][    T1] Run /init as init process
[   12.140448][    T1]   with arguments:
[   12.140810][    T1]     /init
[   12.141106][    T1]   with environment:
[   12.141569][    T1]     HOME=3D/
[   12.142027][    T1]     TERM=3Dlinux
[   12.142532][    T1]     user=3D$(whoami)
[   12.143088][    T1]     job=3D/lkp/jobs/scheduled/vm-snb-43/trinity-grou=
p-02-99999-yocto-i386-minimal-20190520.cgz-d64696905554e919321e31afc2106066=
53b8f6a4-20210911-24127-1x1tp2w-8.yaml
[   12.145528][    T1]     ARCH=3Di386
[   12.146038][    T1]     kconfig=3Di386-randconfig-r015-20210910
[   12.146885][    T1]     branch=3Dtrace/ftrace/core
[   12.147573][    T1]     commit=3Dd64696905554e919321e31afc210606653b8f6a4
[   12.148618][    T1]     BOOT_IMAGE=3D/pkg/linux/i386-randconfig-r015-202=
10910/gcc-9/d64696905554e919321e31afc210606653b8f6a4/vmlinuz-5.12.0-gd64696=
905554
[   12.150596][    T1]     max_uptime=3D2100
[   12.151168][    T1]     RESULT_ROOT=3D/result/trinity/group-02-99999/vm-=
snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-r015-20210910/gcc-9/d64=
696905554e919321e31afc210606653b8f6a4/8
[   12.152932][    T1]     LKP_LOCAL_RUN=3D1
[   12.153314][    T1]     selinux=3D0
[   12.153611][    T1]     apic=3Ddebug
[   12.153915][    T1]     softlockup_panic=3D1
[   12.154278][    T1]     prompt_ramdisk=3D0
[   12.154627][    T1]     vga=3Dnormal
[   12.154931][    T1]     result_service=3D9p/virtfs_mount
INIT: version 2.88 booting
[   12.163098][  T120] mount (120) used greatest stack depth: 6684 bytes le=
ft
[   12.167439][  T122] rc (122) used greatest stack depth: 6520 bytes left
Starting udev
[   12.197692][  T143] pidof (143) used greatest stack depth: 6436 bytes le=
ft
[   12.200700][  T144] udevd[144]: starting version 3.2.7
[   12.201464][  T144] random: udevd: uninitialized urandom read (16 bytes =
read)
[   12.202180][  T144] random: udevd: uninitialized urandom read (16 bytes =
read)
[   12.202833][  T144] random: udevd: uninitialized urandom read (16 bytes =
read)
[   12.205343][  T144] udevd[144]: specified group 'kvm' unknown
[   12.209366][  T145] udevd[145]: starting eudev-3.2.7
[   12.248942][  T145] udevd[145]: specified group 'kvm' unknown
[   12.359690][  T147] udevadm (147) used greatest stack depth: 6188 bytes =
left
[   13.515054][  T163] _warn_unseeded_randomness: 196 callbacks suppressed
[   13.515062][  T163] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   13.515073][  T163] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   13.515082][  T163] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
depmod: ERROR: could not open directory /lib/modules/5.15.0-rc1-00221-g4357=
f03d6611: No such file or directory
depmod: WARNING: -e needs -E or -F
depmod: ERROR: could not open directory /lib/modules/5.15.0-rc1-00221-g4357=
f03d6611: No such file or directory
depmod: FATAL: could not search modules: No such file or directory
hwclock: can't open '/dev/misc/rtc': No such file or directory
[   13.710909][  T291] urandom_read: 3 callbacks suppressed
[   13.710912][  T291] random: dd: uninitialized urandom read (512 bytes re=
ad)
INIT: Entering runlevel: 5
Configuring network interfaces... ip: RTNETLINK answers: File exists
hwclock: can't open '/dev/misc/rtc': No such file or directory
Starting syslogd/klogd: done
/etc/rc5.d/S77lkp-bootstrap: /lkp/jobs/scheduled/vm-snb-43/trinity-group-02=
-99999-yocto-i386-minimal-20190520.cgz-d64696905554e919321e31afc210606653b8=
f6a4-20210911-24127-1x1tp2w-8.sh: line 123: start: not found
PATH=3D/sbin:/usr/sbin:/bin:/usr/bin:/lkp/root/src/bin
[   13.791208][  T183] bootlogd (183) used greatest stack depth: 6136 bytes=
 left
export VM_VIRTFS=3D1 due to result service 9p/virtfs_mount
LKP: HOSTNAME vm-snb-43, MAC 52:54:00:12:34:56, kernel 5.15.0-rc1-00221-g43=
57f03d6611 1, serial console /dev/ttyS0

Poky (Yocto Project Reference Distro) 2.7+snapshot vm-snb-43 /dev/ttyS0

INIT: Id "S1" respawning too fast: disabled for 5 minutes
[   14.815728][  T347] mkdir: can't create directory '/sys/kernel/debug': O=
peration not permitted
[   14.815728][  T347] mount: mounting debug on /sys/kernel/debug failed: N=
o such file or directory
[   14.815728][  T347] mount: mounting 9p/virtfs_mount on //result/trinity/=
group-02-99999/vm-snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-r015-=
20210910/gcc-9/d64696905554e919321e31afc210606653b8f6a4/8 failed: No such d=
evice
[   15.071963][  T609] _warn_unseeded_randomness: 2110 callbacks suppressed
[   15.071970][  T609] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   15.071980][  T609] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   15.071988][  T609] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   15.135814][  T622] random: trinity: uninitialized urandom read (4 bytes=
 read)
[   15.505088][  T149] udevd (149) used greatest stack depth: 6132 bytes le=
ft
[   16.077349][ T1506] _warn_unseeded_randomness: 2734 callbacks suppressed
[   16.077352][ T1506] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   16.077357][ T1506] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   16.077362][ T1506] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   17.079904][ T2445] _warn_unseeded_randomness: 2821 callbacks suppressed
[   17.079907][ T2445] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   17.079911][ T2445] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   17.079914][ T2445] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   18.160090][ T2754] _warn_unseeded_randomness: 946 callbacks suppressed
[   18.160097][ T2754] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   18.160107][ T2754] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   18.160114][ T2754] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   19.174054][ T2757] _warn_unseeded_randomness: 13 callbacks suppressed
[   19.174061][ T2757] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   19.174071][ T2757] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   19.174079][ T2757] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   20.188003][ T2760] _warn_unseeded_randomness: 13 callbacks suppressed
[   20.188011][ T2760] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   20.188021][ T2760] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   20.188029][ T2760] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   21.202771][ T2763] _warn_unseeded_randomness: 13 callbacks suppressed
[   21.202778][ T2763] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   21.202788][ T2763] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   21.202798][ T2763] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   22.217261][ T2766] _warn_unseeded_randomness: 13 callbacks suppressed
[   22.217270][ T2766] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   22.217286][ T2766] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   22.217325][ T2766] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   23.231477][ T2769] _warn_unseeded_randomness: 13 callbacks suppressed
[   23.231485][ T2769] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   23.231496][ T2769] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   23.231505][ T2769] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   24.247489][ T2773] _warn_unseeded_randomness: 19 callbacks suppressed
[   24.247497][ T2773] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   24.247508][ T2773] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   24.247517][ T2773] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   25.264692][ T2779] _warn_unseeded_randomness: 29 callbacks suppressed
[   25.264700][ T2779] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   25.264710][ T2779] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   25.264720][ T2779] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   26.278903][ T2782] _warn_unseeded_randomness: 13 callbacks suppressed
[   26.278912][ T2782] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   26.278925][ T2782] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   26.278935][ T2782] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   27.294938][ T2785] _warn_unseeded_randomness: 13 callbacks suppressed
[   27.294947][ T2785] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   27.294960][ T2785] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   27.294971][ T2785] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   28.260754][ T2753] trinity-main uses obsolete (PF_INET,SOCK_PACKET)
[   28.310586][ T2912] _warn_unseeded_randomness: 18 callbacks suppressed
[   28.310592][ T2912] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   28.310601][ T2912] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   28.310608][ T2912] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   29.322570][ T2915] _warn_unseeded_randomness: 15 callbacks suppressed
[   29.322575][ T2915] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   29.322581][ T2915] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   29.322586][ T2915] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   30.303697][ T2911] CE: hpet increased min_delta_ns to 16875 nsec
[   30.303897][ T2911] CE: hpet increased min_delta_ns to 25312 nsec
[   30.304082][ T2911] CE: hpet increased min_delta_ns to 37968 nsec
[   30.336566][ T2918] _warn_unseeded_randomness: 14 callbacks suppressed
[   30.336571][ T2918] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   30.336578][ T2918] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   30.336583][ T2918] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   31.317804][ T2909] CE: hpet increased min_delta_ns to 56952 nsec
[   31.348020][ T2921] _warn_unseeded_randomness: 14 callbacks suppressed
[   31.348026][ T2921] random: get_random_u32 called from allocate_slab+0x2=
21/0xbd0 with crng_init=3D1
[   31.348233][ T2921] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   31.348241][ T2921] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   32.361691][ T2924] _warn_unseeded_randomness: 15 callbacks suppressed
[   32.361698][ T2924] random: get_random_u32 called from allocate_slab+0x2=
21/0xbd0 with crng_init=3D1
[   32.361922][ T2924] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   32.361931][ T2924] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   33.375338][ T2927] _warn_unseeded_randomness: 15 callbacks suppressed
[   33.375343][ T2927] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   33.375350][ T2927] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   33.375355][ T2927] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   34.386633][ T2931] _warn_unseeded_randomness: 23 callbacks suppressed
[   34.386639][ T2931] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   34.386648][ T2931] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   34.386654][ T2931] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   35.402110][ T2934] _warn_unseeded_randomness: 14 callbacks suppressed
[   35.402116][ T2934] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   35.402126][ T2934] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   35.402134][ T2934] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   36.416956][ T2940] _warn_unseeded_randomness: 32 callbacks suppressed
[   36.416963][ T2940] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   36.416972][ T2940] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   36.416980][ T2940] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   37.430119][ T2943] _warn_unseeded_randomness: 15 callbacks suppressed
[   37.430127][ T2943] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   37.430137][ T2943] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   37.430146][ T2943] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   38.447454][ T2947] _warn_unseeded_randomness: 15 callbacks suppressed
[   38.447464][ T2947] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   38.447479][ T2947] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   38.447491][ T2947] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   39.464985][ T2950] _warn_unseeded_randomness: 13 callbacks suppressed
[   39.464996][ T2950] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   39.465012][ T2950] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   39.465026][ T2950] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   40.484751][ T2953] _warn_unseeded_randomness: 15 callbacks suppressed
[   40.484763][ T2953] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   40.484780][ T2953] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   40.484795][ T2953] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   41.501952][ T2956] _warn_unseeded_randomness: 13 callbacks suppressed
[   41.501964][ T2956] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   41.501981][ T2956] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   41.501996][ T2956] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   42.518088][ T2959] _warn_unseeded_randomness: 17 callbacks suppressed
[   42.518098][ T2959] random: get_random_u32 called from arch_rnd+0x34/0x8=
0 with crng_init=3D1
[   42.518115][ T2959] random: get_random_u32 called from randomize_stack_t=
op+0x4b/0x80 with crng_init=3D1
[   42.518128][ T2959] random: get_random_u32 called from arch_align_stack+=
0x5b/0x80 with crng_init=3D1
[   43.414471][    C0] random: crng init done
[   43.416074][    C0] random: 14 get_random_xx warning(s) missed due to ra=
telimiting
[   72.318904][ T2909] trinity-c1 (2909) used greatest stack depth: 6012 by=
tes left
[   75.338835][ T3061] CE: hpet increased min_delta_ns to 85428 nsec
INIT: Id "1" respawning too fast: disabled for 5 minutes
INIT: Id "S1" respawning too fast: disabled for 5 minutes
[  470.838084][ T3484] ------------[ cut here ]------------
[  470.838606][ T3484] WARNING: CPU: 0 PID: 3484 at kernel/ucount.c:253 dec=
_ucount+0x9e/0xf0
[  470.839356][ T3484] Modules linked in:
[  470.839950][ T3484] CPU: 0 PID: 3484 Comm: trinity-c1 Not tainted 5.15.0=
-rc1-00221-g4357f03d6611 #1
[  470.840778][ T3484] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.12.0-1 04/01/2014
[  470.841609][ T3484] EIP: dec_ucount+0x9e/0xf0
[  470.842013][ T3484] Code: c3 00 0f b1 0a 74 b5 83 05 98 46 73 c3 01 89 c=
1 83 15 9c 46 73 c3 00 83 e9 01 79 d8 83 05 a8 46 73 c3 01 83 15 ac 46 73 c=
3 00 <0f> 0b 8b 43 08 83 05 b0 46 73 c3 01 83 15 b4 46 73 c3 00 8b 98 9c
[  470.843840][    C0] BUG: kernel NULL pointer dereference, address: 00000=
19c
[  470.843843][    C0] #PF: supervisor read access in kernel mode
[  470.843844][    C0] #PF: error_code(0x0000) - not-present page
[  470.843845][    C0] *pde =3D 00000000 =

[  470.843848][    C0] Oops: 0000 [#1] PREEMPT
[  470.843849][    C0] CPU: 0 PID: 3484 Comm: trinity-c1 Not tainted 5.15.0=
-rc1-00221-g4357f03d6611 #1
[  470.843851][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.12.0-1 04/01/2014
[  470.843852][    C0] EIP: dec_ucount+0xb1/0xf0
[  470.843854][    C0] Code: 46 73 c3 00 83 e9 01 79 d8 83 05 a8 46 73 c3 0=
1 83 15 ac 46 73 c3 00 0f 0b 8b 43 08 83 05 b0 46 73 c3 01 83 15 b4 46 73 c=
3 00 <8b> 98 9c 01 00 00 85 db 75 90 83 05 b8 46 73 c3 01 89 f0 83 15 bc
[  470.843855][    C0] EAX: 00000000 EBX: c56eb240 ECX: ffffffff EDX: c56eb=
258
[  470.843857][    C0] ESI: c56eb1e0 EDI: 00000018 EBP: c0181f4c ESP: c0181=
f40
[  470.843858][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS:=
 00010246
[  470.843861][    C0] CR0: 80050033 CR2: 0000019c CR3: 057fc000 CR4: 00000=
690
[  470.843863][    C0] Call Trace:
[  470.843863][    C0]  <SOFTIRQ>
[  470.843865][    C0]  delayed_free_pidns+0x25/0x180
[  470.843868][    C0]  rcu_do_batch.constprop.74+0x1ba/0x930
[  470.843872][    C0]  ? rcu_do_batch.constprop.74+0x174/0x930
[  470.843875][    C0]  rcu_core+0x44d/0xad0
[  470.843878][    C0]  rcu_core_si+0x16/0x30
[  470.843881][    C0]  __do_softirq+0x13f/0x8cf
[  470.843884][    C0]  ? _paravirt_nop+0x1/0x1
[  470.843886][    C0]  do_softirq_own_stack+0x2a/0x40
[  470.843890][    C0]  </SOFTIRQ>
[  470.843891][    C0]  irq_exit_rcu+0x114/0x1b0
[  470.843894][    C0]  common_interrupt+0x27/0x40
[  470.843896][    C0]  asm_common_interrupt+0x119/0x120
[  470.843898][    C0] EIP: console_unlock+0x3f6/0x9a0
[  470.843900][    C0] Code: c3 01 83 15 5c ca d1 c3 00 f6 c4 02 0f 85 2a 0=
5 00 00 8b 75 88 85 f6 74 0f 83 05 70 ca d1 c3 01 83 15 74 ca d1 c3 00 fb 8=
5 db <0f> 85 64 05 00 00 8b 8d 7c ff ff ff 83 05 78 ca d1 c3 01 83 15 7c
[  470.843901][    C0] EAX: 00000046 EBX: 00000000 ECX: 00000006 EDX: 00000=
000
[  470.843902][    C0] ESI: 00000200 EDI: 00000200 EBP: cc0a3c70 ESP: cc0a3=
bec
[  470.843904][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS:=
 00000246
[  470.843906][    C0]  ? trace_event_raw_event_lock_acquire+0x9b/0x200
[  470.843908][    C0]  ? trace_find_next_entry_inc+0xf0/0x120
[  470.843911][    C0]  ? trace_find_next_entry_inc+0xf0/0x120
[  470.843913][    C0]  ? console_unlock+0x3f6/0x9a0
[  470.843917][    C0]  vprintk_emit+0x2d1/0x580
[  470.843919][    C0]  ? dec_ucount+0x74/0xf0
[  470.843921][    C0]  vprintk_default+0x1e/0x30
[  470.843923][    C0]  vprintk+0x99/0xd0
[  470.843924][    C0]  ? dec_ucount+0x74/0xf0
[  470.843925][    C0]  _printk+0x1d/0x2d
[  470.843929][    C0]  show_opcodes.cold.6+0x23/0x39
[  470.843933][    C0]  ? sed_ioctl+0x5c3/0x1150
[  470.843937][    C0]  show_ip+0x3c/0x54
[  470.843939][    C0]  ? dec_ucount+0x9e/0xf0
[  470.843941][    C0]  __show_regs+0x3d/0x1c0
[  470.843943][    C0]  ? dec_ucount+0x9e/0xf0
[  470.843945][    C0]  show_regs+0x5d/0x90
[  470.843947][    C0]  __warn.cold.6+0x9b/0x19e
[  470.843949][    C0]  ? dec_ucount+0x9e/0xf0
[  470.843950][    C0]  report_bug+0x121/0x1d0
[  470.843954][    C0]  ? exc_overflow+0x40/0x40
[  470.843955][    C0]  handle_bug+0x2d/0x60
[  470.843957][    C0]  exc_invalid_op+0x1b/0x60
[  470.843958][    C0]  handle_exception+0x115/0x115
[  470.843960][    C0] EIP: dec_ucount+0x9e/0xf0
[  470.843961][    C0] Code: c3 00 0f b1 0a 74 b5 83 05 98 46 73 c3 01 89 c=
1 83 15 9c 46 73 c3 00 83 e9 01 79 d8 83 05 a8 46 73 c3 01 83 15 ac 46 73 c=
3 00 <0f> 0b 8b 43 08 83 05 b0 46 73 c3 01 83 15 b4 46 73 c3 00 8b 98 9c
[  470.843962][    C0] EAX: 00000000 EBX: c56eb240 ECX: ffffffff EDX: c56eb=
274
[  470.843964][    C0] ESI: c56eb240 EDI: 00000034 EBP: cc0a3e34 ESP: cc0a3=
e28
[  470.843965][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS:=
 00010246
[  470.843967][    C0]  ? exc_overflow+0x40/0x40
[  470.843969][    C0]  ? exc_overflow+0x40/0x40
[  470.843970][    C0]  ? dec_ucount+0x9e/0xf0
[  470.843972][    C0]  inotify_free_group_priv+0x60/0x90
[  470.843974][    C0]  fsnotify_put_group+0xb3/0x160
[  470.843977][    C0]  fsnotify_destroy_group+0xef/0x1c0
[  470.843979][    C0]  ? locks_remove_file+0x2b7/0x5f0
[  470.843982][    C0]  inotify_release+0x1c/0x30
[  470.843984][    C0]  __fput+0xe5/0x5a0
[  470.843987][    C0]  ____fput+0x16/0x30
[  470.843989][    C0]  task_work_run+0xaf/0x150
[  470.843992][    C0]  do_exit+0x621/0x1040
[  470.843995][    C0]  ? _raw_spin_unlock_irq+0x63/0xf0
[  470.843996][    C0]  do_group_exit+0x3b/0x140
[  470.843999][    C0]  get_signal+0x2a8/0x15d0
[  470.844002][    C0]  arch_do_signal_or_restart+0xb6/0x490
[  470.844005][    C0]  ? find_held_lock+0x34/0x130
[  470.844007][    C0]  ? syscall_exit_to_user_mode+0x1a/0x50
[  470.844009][    C0]  ? exit_to_user_mode_prepare+0x298/0x5f0
[  470.844012][    C0]  ? syscall_exit_to_user_mode+0x1a/0x50
[  470.844013][    C0]  ? trace_hardirqs_on+0x67/0x2a0
[  470.844016][    C0]  exit_to_user_mode_prepare+0x4b7/0x5f0
[  470.844018][    C0]  syscall_exit_to_user_mode+0x1a/0x50
[  470.844020][    C0]  do_int80_syscall_32+0x38/0x80
[  470.844022][    C0]  entry_INT80_32+0x107/0x107
[  470.844023][    C0] EIP: 0x809b132
[  470.844025][    C0] Code: Unable to access opcode bytes at RIP 0x809b108.
[  470.844026][    C0] EAX: fffffe00 EBX: 0000013c ECX: 0925f718 EDX: 00000=
001
[  470.844027][    C0] ESI: 3024f060 EDI: 0002010a EBP: 04000000 ESP: bfbae=
ed8
[  470.844028][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 007b EFLAGS:=
 00000296
[  470.844031][    C0] Modules linked in:
[  470.844036][    C0] CR2: 000000000000019c
[  470.844038][    C0] ---[ end trace 2e62bdafeb2ef073 ]---
[  470.844039][    C0] EIP: dec_ucount+0xb1/0xf0
[  470.844040][    C0] Code: 46 73 c3 00 83 e9 01 79 d8 83 05 a8 46 73 c3 0=
1 83 15 ac 46 73 c3 00 0f 0b 8b 43 08 83 05 b0 46 73 c3 01 83 15 b4 46 73 c=
3 00 <8b> 98 9c 01 00 00 85 db 75 90 83 05 b8 46 73 c3 01 89 f0 83 15 bc
[  470.844042][    C0] EAX: 00000000 EBX: c56eb240 ECX: ffffffff EDX: c56eb=
258
[  470.844043][    C0] ESI: c56eb1e0 EDI: 00000018 EBP: c0181f4c ESP: c0181=
f40
[  470.844044][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS:=
 00010246
[  470.844046][    C0] CR0: 80050033 CR2: 0000019c CR3: 057fc000 CR4: 00000=
690
[  470.844047][    C0] Kernel panic - not syncing: Fatal exception in inter=
rupt
[  470.844049][    C0] Kernel Offset: disabled
> =

> $ grep PRETTY_NAME /etc/os-release
> PRETTY_NAME=3D"Fedora 34 (Workstation Edition)"
> =

> $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git
> $ cd linux
> =

> $ git describe
> v5.15-rc1-19-g3ca706c189db
> =

> $ cp /tmp/config-5.12.0-gd64696905554 .config
> =

> $ make -j8 ARCH=3Di386 olddefconfig prepare modules_prepare bzImage
> ...
> Kernel: arch/x86/boot/bzImage is ready  (#2)
> =

> $ git clone https://github.com/intel/lkp-tests.git
> $ cd lkp-tests
> =

> $ git describe --always
> 64ef6f2b
> =

> $ bin/lkp qemu -k ../arch/x86/boot/bzImage ../job-script
> The approx. disk space requirements are
> =

> 10M             simple boot test in rootfs openwrt
> 50M             simple boot test in rootfs debian
> 1G              plan to run a number of different tests
> 100G or more    IO tests
> =

> Please enter a dir with enough disk space, or simply press Enter to accep=
t the
> default.
> You may still symlink /home/legion/.lkp to a more suitable place in futur=
e.
> /home/legion/.lkp =3D>
> ~/scm/kernel/linux/lkp-tests/pkg/lkp-src ~/scm/kernel/linux/lkp-tests
> x86_64
> =3D=3D> Making package: lkp-src 0-1 (=D0=A1=D1=80 15 =D1=81=D0=B5=D0=BD 2=
021 13:11:17 CEST)
> =3D=3D> Checking runtime dependencies...
> =3D=3D> Checking buildtime dependencies...
> =3D=3D> WARNING: Using existing $srcdir/ tree
> =3D=3D> Removing existing $pkgdir/ directory...
> =3D=3D> Starting build()...
> make: Entering directory '/home/legion/scm/kernel/linux/lkp-tests/bin/eve=
nt'
> gcc -m32 -Wl,-O1,--sort-common,--as-needed,-z,relro -static -o wakeup
> wakeup.o
> rm -f wakeup.o
> strip wakeup
> strip: wakeup[.gnu.build.attributes__libc_freeres_fn]: Warning: version n=
ote
> missing - assuming version 3
> make: Leaving directory '/home/legion/scm/kernel/linux/lkp-tests/bin/even=
t'
> =3D=3D> Entering fakeroot environment...
> x86_64
> =3D=3D> Starting package()...
> =3D=3D> Creating package "lkp-src"...
> 8808 blocks
> renamed '/home/legion/.lkp/cache/lkp-i386.cgz.tmp' ->
> '/home/legion/.lkp/cache/lkp-i386.cgz'
> =3D=3D> Leaving fakeroot environment.
> =3D=3D> Finished making: lkp-src 0-1 (=D0=A1=D1=80 15 =D1=81=D0=B5=D0=BD =
2021 13:16:19 CEST)
> ~/scm/kernel/linux/lkp-tests
> 11 blocks
> result_root: /home/legion/.lkp//result/trinity/group-02-99999/vm-snb/yoct=
o-
> i386-minimal-20190520.cgz/i386-randconfig-r015-20210910/gcc-
> 9/d64696905554e919321e31afc210606653b8f6a4/0
> downloading initrds ...
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8
> https://download.01.org/0day-ci/lkp-qemu/osimage/yocto/yocto-i386-
> minimal-20190520.cgz -N -P /home/legion/.lkp/cache/osimage/yocto
> 17916 blocks
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8
> https://download.01.org/0day-ci/lkp-qemu/osimage/pkg/yocto-i386-minimal-
> 20190520.cgz/trinity-i386.cgz -N -P
> /home/legion/.lkp/cache/osimage/pkg/yocto-i386-minimal-20190520.cgz
> 46817 blocks
> exec command: qemu-system-x86_64 -enable-kvm -fsdev
> local,id=3Dtest_dev,path=3D/home/legion/.lkp//result/trinity/group-02-999=
99/vm-
> snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-r015-20210910/gcc-
> 9/d64696905554e919321e31afc210606653b8f6a4/0,security_model=3Dnone -
> device virtio-9p-pci,fsdev=3Dtest_dev,mount_tag=3D9p/virtfs_mount -
> kernel ../arch/x86/boot/bzImage -append root=3D/dev/ram0 user=3D$(whoami)
> job=3D/lkp/jobs/scheduled/vm-snb-43/trinity-group-02-99999-yocto-i386-
> minimal-20190520.cgz-d64696905554e919321e31afc210606653b8f6a4-
> 20210911-24127-1x1tp2w-8.yaml ARCH=3Di386 kconfig=3Di386-randconfig-r015-
> 20210910 branch=3Dtrace/ftrace/core
> commit=3Dd64696905554e919321e31afc210606653b8f6a4
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-r015-20210910/gcc-
> 9/d64696905554e919321e31afc210606653b8f6a4/vmlinuz-5.12.0-
> gd64696905554 vmalloc=3D128M initramfs_async=3D0 page_owner=3Don
> max_uptime=3D2100 RESULT_ROOT=3D/result/trinity/group-02-99999/vm-
> snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-r015-20210910/gcc-
> 9/d64696905554e919321e31afc210606653b8f6a4/8 LKP_LOCAL_RUN=3D1
> selinux=3D0 debug apic=3Ddebug sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don =
panic=3D-
> 1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2
> prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr ignore_lo=
glevel
> console=3Dtty0 earlyprintk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dno=
rmal rw
> ip=3Ddhcp result_service=3D9p/virtfs_mount -initrd
> /home/legion/.lkp/cache/final_initrd -smp 2 -m 5390M -no-reboot -watchdog
> i6300esb -rtc base=3Dlocaltime -device e1000,netdev=3Dnet0 -netdev user,i=
d=3Dnet0 -
> display none -monitor null -serial stdio
> early console in setup code
> Probing EDD (edd=3Doff to disable)... ok
> [    0.000000] Linux version 5.15.0-rc1+ (legion(a)example.com) (gcc (GCC=
) 11.1.1
> 20210531 (Red Hat 11.1.1-3), GNU ld version 2.35.1-41.fc34) #2 SMP Wed Sep
> 15 13:03:08 CEST 2021
> [    0.000000] x86/fpu: x87 FPU will use FXSAVE
> [    0.000000] signal: max sigframe size: 1440
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff]
> usable
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000bffdffff]
> usable
> [    0.000000] BIOS-e820: [mem 0x00000000bffe0000-0x00000000bfffffff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000190dfffff]
> usable
> [    0.000000] printk: debug: ignoring loglevel setting.
> [    0.000000] printk: bootconsole [earlyser0] enabled
> [    0.000000] Notice: NX (Execute Disable) protection cannot be enabled:=
 non-
> PAE kernel!
> [    0.000000] SMBIOS 2.8 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-4=
.fc34
> 04/01/2014
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 10818001, primary cpu clock
> [    0.000002] kvm-clock: using sched offset of 247343709 cycles
> [    0.000856] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycle=
s:
> 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.003174] tsc: Detected 2593.994 MHz processor
> [    0.004586] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.005496] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.006318] last_pfn =3D 0xbffe0 max_arch_pfn =3D 0x100000
> [    0.007096] x86/PAT: PAT not supported by the CPU.
> [    0.007789] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- =
UC
> [    0.008817] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.009606] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.010348] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.014307] found SMP MP-table at [mem 0x000f5c80-0x000f5c8f]
> [    0.015120]   mpc: f5c90-f5d7c
> [    0.015524] initial memory mapped: [mem 0x00000000-0x10bfffff]
> [    0.016384] RAMDISK: [mem 0x7f97e000-0x7fffffff]
> [    0.017080] Allocated new RAMDISK: [mem 0x3617c000-0x367fdbe9]
> [    0.021514] Move RAMDISK from [mem 0x7f97e000-0x7ffffbe9] to [mem
> 0x3617c000-0x367fdbe9]
> [    0.022741] ACPI: Early table checksum verification disabled
> [    0.023589] ACPI: RSDP 0x00000000000F5A60 000014 (v00 BOCHS )
> [    0.024427] ACPI: RSDT 0x00000000BFFE15AB 000034 (v01 BOCHS  BXPCRSDT
> 00000001 BXPC 00000001)
> [    0.025704] ACPI: FACP 0x00000000BFFE1457 000074 (v01 BOCHS  BXPCFACP
> 00000001 BXPC 00000001)
> [    0.026839] ACPI: DSDT 0x00000000BFFE0040 001417 (v01 BOCHS  BXPCDSDT
> 00000001 BXPC 00000001)
> [    0.028102] ACPI: FACS 0x00000000BFFE0000 000040
> [    0.028758] ACPI: APIC 0x00000000BFFE14CB 000080 (v01 BOCHS  BXPCAPIC
> 00000001 BXPC 00000001)
> [    0.029967] ACPI: HPET 0x00000000BFFE154B 000038 (v01 BOCHS  BXPCHPET
> 00000001 BXPC 00000001)
> [    0.031216] ACPI: WAET 0x00000000BFFE1583 000028 (v01 BOCHS
> BXPCWAET 00000001 BXPC 00000001)
> [    0.032382] ACPI: Reserving FACP table memory at [mem 0xbffe1457-
> 0xbffe14ca]
> [    0.033398] ACPI: Reserving DSDT table memory at [mem 0xbffe0040-
> 0xbffe1456]
> [    0.034362] ACPI: Reserving FACS table memory at [mem 0xbffe0000-
> 0xbffe003f]
> [    0.035370] ACPI: Reserving APIC table memory at [mem 0xbffe14cb-
> 0xbffe154a]
> [    0.036258] ACPI: Reserving HPET table memory at [mem 0xbffe154b-
> 0xbffe1582]
> [    0.037266] ACPI: Reserving WAET table memory at [mem 0xbffe1583-
> 0xbffe15aa]
> [    0.038257] mapped APIC to         ffffb000 (        fee00000)
> [    0.039083] 2199MB HIGHMEM available.
> [    0.039560] 871MB LOWMEM available.
> [    0.040074]   mapped low ram: 0 - 367fe000
> [    0.040631]   low ram: 0 - 367fe000
> [    0.045476] Zone ranges:
> [    0.045863]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.046766]   Normal   [mem 0x0000000001000000-0x00000000367fdfff]
> [    0.047642]   HighMem  [mem 0x00000000367fe000-0x00000000bffdffff]
> [    0.048551] Movable zone start for each node
> [    0.049125] Early memory node ranges
> [    0.049574]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.050454]   node   0: [mem 0x0000000000100000-0x00000000bffdffff]
> [    0.051376] Initmem setup node 0 [mem 0x0000000000001000-
> 0x00000000bffdffff]
> [    0.052390] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.052449] On node 0, zone DMA: 97 pages in unavailable ranges
> [    0.064385] On node 0, zone HighMem: 32 pages in unavailable ranges
> [    0.065265] Using APIC driver default
> [    0.067043] ACPI: PM-Timer IO Port: 0x608
> [    0.067641] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> [    0.068456] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI =
0-23
> [    0.069426] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.070328] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0, API=
C INT 02
> [    0.071352] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
> [    0.072303] Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0, API=
C INT 05
> [    0.073328] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> [    0.074194] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0, API=
C INT 09
> [    0.075147] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high lev=
el)
> [    0.076073] Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0, API=
C INT 0a
> [    0.077122] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high lev=
el)
> [    0.078099] Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0, API=
C INT 0b
> [    0.079079] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 0, API=
C INT 01
> [    0.080105] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 0, API=
C INT 03
> [    0.081120] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 0, API=
C INT 04
> [    0.082136] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 0, API=
C INT 06
> [    0.083165] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 0, API=
C INT 07
> [    0.084167] Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 0, API=
C INT 08
> [    0.085124] Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 0, API=
C INT 0c
> [    0.086156] Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 0, API=
C INT 0d
> [    0.087124] Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 0, API=
C INT 0e
> [    0.088193] Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 0, API=
C INT 0f
> [    0.089185] ACPI: Using ACPI (MADT) for SMP configuration information
> [    0.090090] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> [    0.090862] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
> [    0.091529] mapped IOAPIC to ffffa000 (fec00000)
> [    0.092172] PM: hibernation: Registered nosave memory: [mem 0x00000000-
> 0x00000fff]
> [    0.093235] PM: hibernation: Registered nosave memory: [mem 0x0009f000-
> 0x0009ffff]
> [    0.094346] PM: hibernation: Registered nosave memory: [mem 0x000a0000-
> 0x000effff]
> [    0.095428] PM: hibernation: Registered nosave memory: [mem 0x000f0000-
> 0x000fffff]
> [    0.096474] [mem 0xc0000000-0xfeffbfff] available for PCI devices
> [    0.097274] Booting paravirtualized kernel on KVM
> [    0.097927] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff,
> max_idle_ns: 1910969940391419 ns
> [    0.099382] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2
> nr_node_ids:1
> [    0.100454] percpu: Embedded 32 pages/cpu s99276 r0 d31796 u131072
> [    0.101331] pcpu-alloc: s99276 r0 d31796 u131072 alloc=3D32*4096
> [    0.102151] pcpu-alloc: [0] 0 [0] 1
> [    0.102653] kvm-guest: stealtime: cpu 0, msr 36147a40
> [    0.103411] kvm-guest: PV spinlocks disabled, no host support
> [    0.104247] Built 1 zonelists, mobility grouping on.  Total pages: 784=
122
> [    0.105201] Kernel command line: root=3D/dev/ram0 user=3D$(whoami)
> job=3D/lkp/jobs/scheduled/vm-snb-43/trinity-group-02-99999-yocto-i386-
> minimal-20190520.cgz-d64696905554e919321e31afc210606653b8f6a4-
> 20210911-24127-1x1tp2w-8.yaml ARCH=3Di386 kconfig=3Di386-randconfig-r015-
> 20210910 branch=3Dtrace/ftrace/core
> commit=3Dd64696905554e919321e31afc210606653b8f6a4
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-r015-20210910/gcc-
> 9/d64696905554e919321e31afc210606653b8f6a4/vmlinuz-5.12.0-
> gd64696905554 vmalloc=3D128M initramfs_async=3D0 page_owner=3Don
> max_uptime=3D2100 RESULT_ROOT=3D/result/trinity/group-02-99999/vm-
> snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-r015-20210910/gcc-
> 9/d64696905554e919321e31afc210606653b8f6a4/8 LKP_LOCAL_RUN=3D1
> selinux=3D0 debug apic=3Ddebug sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don =
panic=3D-
> 1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2
> prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr ignore_lo=
glevel
> console=3Dtty0 earlyprintk=3DttyS
> [    0.105625] sysrq: sysrq always enabled.
> [    0.119255] ignoring the deprecated load_ramdisk=3D option
> [    0.120230] Unknown command line parameters: user=3D$(whoami)
> job=3D/lkp/jobs/scheduled/vm-snb-43/trinity-group-02-99999-yocto-i386-
> minimal-20190520.cgz-d64696905554e919321e31afc210606653b8f6a4-
> 20210911-24127-1x1tp2w-8.yaml ARCH=3Di386 kconfig=3Di386-randconfig-r015-
> 20210910 branch=3Dtrace/ftrace/core
> commit=3Dd64696905554e919321e31afc210606653b8f6a4
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-r015-20210910/gcc-
> 9/d64696905554e919321e31afc210606653b8f6a4/vmlinuz-5.12.0-
> gd64696905554 max_uptime=3D2100 RESULT_ROOT=3D/result/trinity/group-02-
> 99999/vm-snb/yocto-i386-minimal-20190520.cgz/i386-randconfig-r015-
> 20210910/gcc-9/d64696905554e919321e31afc210606653b8f6a4/8
> LKP_LOCAL_RUN=3D1 softlockup_panic=3D1 prompt_ramdisk=3D0 vga=3Dnormal ip=
=3Ddhcp
> result_service=3D9p/virtfs_mount
> [    0.129916] Dentry cache hash table entries: 131072 (order: 7, 524288 =
bytes,
> linear)
> [    0.131086] Inode-cache hash table entries: 65536 (order: 6, 262144 by=
tes,
> linear)
> [    0.132185] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.134089] Initializing HighMem for node 0 (000367fe:000bffe0)
> [    0.216658] Initializing Movable for node 0 (00000000:00000000)
> [    0.219183] Checking if this processor honours the WP bit even in supe=
rvisor
> mode...Ok.
> [    0.220375] Memory: 3076340K/3145208K available (12370K kernel code,
> 1901K rwdata, 9072K rodata, 1076K init, 840K bss, 68868K reserved, 0K cma-
> reserved, 2252680K highmem)
> [    0.222620] random: get_random_u32 called from
> __kmem_cache_create+0x23/0x540 with crng_init=3D0
> [    0.222950] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=
 Nodes=3D1
> [    0.225214] ftrace: allocating 43733 entries in 86 pages
> [    0.240068] ftrace: allocated 86 pages with 4 groups
> [    0.240825] trace event string verifier disabled
> [    0.241732] rcu: Hierarchical RCU implementation.
> [    0.242375] rcu:     RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_i=
ds=3D2.
> [    0.243319]  RCU CPU stall warnings timeout set to 100
> (rcu_cpu_stall_timeout).
> [    0.244382]  Trampoline variant of Tasks RCU enabled.
> [    0.245116]  Rude variant of Tasks RCU enabled.
> [    0.245786]  Tracing variant of Tasks RCU enabled.
> [    0.246507] rcu: RCU calculated value of scheduler-enlistment delay is=
 100
> jiffies.
> [    0.247651] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
> [    0.254529] NR_IRQS: 2304, nr_irqs: 440, preallocated irqs: 16
> [    0.273395] Console: colour VGA+ 80x25
> [    0.325543] printk: console [tty0] enabled
> [    0.326385] printk: console [ttyS0] enabled
> [    0.326385] printk: console [ttyS0] enabled
> [    0.327855] printk: bootconsole [earlyser0] disabled
> [    0.327855] printk: bootconsole [earlyser0] disabled
> [    0.329521] ACPI: Core revision 20210730
> [    0.330469] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff,
> max_idle_ns: 19112604467 ns
> [    0.332345] APIC: Switch to symmetric I/O mode setup
> [    0.333394] Enabling APIC mode:  Flat.  Using 1 I/O APICs
> [    0.334576] masked ExtINT on CPU#0
> [    0.336162] ENABLING IO-APIC IRQs
> [    0.336899] init IO_APIC IRQs
> [    0.337572]  apic 0 pin 0 not connected
> [    0.338387] IOAPIC[0]: Preconfigured routing entry (0-1 -> IRQ 1 Level=
:0
> ActiveLow:0)
> [    0.339909] IOAPIC[0]: Preconfigured routing entry (0-2 -> IRQ 0 Level=
:0
> ActiveLow:0)
> [    0.341474] IOAPIC[0]: Preconfigured routing entry (0-3 -> IRQ 3 Level=
:0
> ActiveLow:0)
> [    0.343019] IOAPIC[0]: Preconfigured routing entry (0-4 -> IRQ 4 Level=
:0
> ActiveLow:0)
> [    0.344544] IOAPIC[0]: Preconfigured routing entry (0-5 -> IRQ 5 Level=
:1
> ActiveLow:0)
> [    0.346058] IOAPIC[0]: Preconfigured routing entry (0-6 -> IRQ 6 Level=
:0
> ActiveLow:0)
> [    0.347634] IOAPIC[0]: Preconfigured routing entry (0-7 -> IRQ 7 Level=
:0
> ActiveLow:0)
> [    0.349221] IOAPIC[0]: Preconfigured routing entry (0-8 -> IRQ 8 Level=
:0
> ActiveLow:0)
> [    0.350788] IOAPIC[0]: Preconfigured routing entry (0-9 -> IRQ 9 Level=
:1
> ActiveLow:0)
> [    0.352295] IOAPIC[0]: Preconfigured routing entry (0-10 -> IRQ 10 Lev=
el:1
> ActiveLow:0)
> [    0.353912] IOAPIC[0]: Preconfigured routing entry (0-11 -> IRQ 11 Lev=
el:1
> ActiveLow:0)
> [    0.355484] IOAPIC[0]: Preconfigured routing entry (0-12 -> IRQ 12 Lev=
el:0
> ActiveLow:0)
> [    0.357066] IOAPIC[0]: Preconfigured routing entry (0-13 -> IRQ 13 Lev=
el:0
> ActiveLow:0)
> [    0.358652] IOAPIC[0]: Preconfigured routing entry (0-14 -> IRQ 14 Lev=
el:0
> ActiveLow:0)
> [    0.360247] IOAPIC[0]: Preconfigured routing entry (0-15 -> IRQ 15 Lev=
el:0
> ActiveLow:0)
> [    0.361853]  apic 0 pin 16 not connected
> [    0.362661]  apic 0 pin 17 not connected
> [    0.363464]  apic 0 pin 18 not connected
> [    0.364250]  apic 0 pin 19 not connected
> [    0.365094]  apic 0 pin 20 not connected
> [    0.365915]  apic 0 pin 21 not connected
> [    0.366715]  apic 0 pin 22 not connected
> [    0.367519]  apic 0 pin 23 not connected
> [    0.368427] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.369673] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycle=
s:
> 0x256412811b4, max_idle_ns: 440795306987 ns
> [    0.371716] Calibrating delay loop (skipped) preset value.. 5187.98 Bo=
goMIPS
> (lpj=3D2593994)
> [    0.372714] pid_max: default: 32768 minimum: 301
> [    0.373612] LSM: Security Framework initializing
> [    0.373723] Yama: becoming mindful.
> [    0.374724] LSM support for eBPF active
> [    0.375716] landlock: Up and running.
> [    0.376725] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes=
, linear)
> [    0.377715] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 =
bytes,
> linear)
> Poking KASLR using RDTSC...
> [    0.379760] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.380714] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.381717] Spectre V1 : Mitigation: usercopy/swapgs barriers and __us=
er
> pointer sanitization
> [    0.382717] Spectre V2 : Mitigation: Full generic retpoline
> [    0.383714] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling R=
SB on
> context switch
> [    0.384714] Speculative Store Bypass: Vulnerable
> [    0.385714] L1TF: Kernel not compiled for PAE. No mitigation for L1TF
> [    0.386716] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
> [    0.389800] Freeing SMP alternatives memory: 40K
> [    0.390781] Using local APIC timer interrupts.
> [    0.390781] calibrating APIC timer ...
> [    0.494491] ... lapic delta =3D 6250028
> [    0.494712] ... PM-Timer delta =3D 357953
> [    0.494712] ... PM-Timer result ok
> [    0.494712] ..... delta 6250028
> [    0.494712] ..... mult: 268435456
> [    0.494712] ..... calibration result: 1000004
> [    0.494712] ..... CPU clock speed is 2593.0965 MHz.
> [    0.494712] ..... host bus clock speed is 1000.0004 MHz.
> [    0.494760] smpboot: CPU0: Intel QEMU Virtual CPU version 2.5+ (family=
: 0x6,
> model: 0x6, stepping: 0x3)
> [    0.495822] Performance Events: PMU not available due to virtualizatio=
n, using
> software events only.
> [    0.496745] rcu: Hierarchical SRCU implementation.
> [    0.497945] NMI watchdog: Perf NMI watchdog permanently disabled
> [    0.498759] smp: Bringing up secondary CPUs ...
> [    0.499790] x86: Booting SMP configuration:
> [    0.500715] .... node  #0, CPUs:      #1
> [    0.113149] kvm-clock: cpu 1, msr 10818021, secondary cpu clock
> [    0.113149] masked ExtINT on CPU#1
> [    0.113149] smpboot: CPU 1 Converting physical 0 to logical die 1
> [    0.504730] kvm-guest: stealtime: cpu 1, msr 36167a40
> [    0.506757] smp: Brought up 1 node, 2 CPUs
> [    0.507715] smpboot: Max logical packages: 2
> [    0.508714] smpboot: Total of 2 processors activated (10375.97 BogoMIP=
S)
> [    0.518115] allocated 31457280 bytes of page_ext
> [    0.518781] Node 0, zone      DMA: page owner found early allocated 0 =
pages
> [    0.521199] Node 0, zone   Normal: page owner found early allocated 83=
26
> pages
> [    0.522727] Node 0, zone  HighMem: page owner found early allocated 63
> pages
> [    0.523792] devtmpfs: initialized
> [    0.525970] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff,
> max_idle_ns: 1911260446275000 ns
> [    0.526718] futex hash table entries: 512 (order: 2, 16384 bytes, line=
ar)
> [    0.527763] pinctrl core: initialized pinctrl subsystem
> [    0.528844] PM: RTC time: 13:16:34, date: 2021-09-15
> [    0.529859] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.532088] audit: initializing netlink subsys (disabled)
> [    0.532748] audit: type=3D2000 audit(1631704594.860:1): state=3Dinitia=
lized
> audit_enabled=3D0 res=3D1
> [    0.532882] thermal_sys: Registered thermal governor 'fair_share'
> [    0.533716] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.534715] thermal_sys: Registered thermal governor 'step_wise'
> [    0.535715] thermal_sys: Registered thermal governor 'user_space'
> [    0.536727] cpuidle: using governor menu
> [    0.539187] ACPI: bus type PCI registered
> [    0.539715] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.540876] PCI: PCI BIOS revision 2.10 entry at 0xfd1b8, last bus=3D0
> [    0.541716] PCI: Using configuration type 1 for base access
> [    0.544343] Kprobes globally optimized
> [    0.544778] HugeTLB registered 4.00 MiB page size, pre-allocated 0 pag=
es
> [    1.232030] cryptd: max_cpu_qlen set to 1000
> [    1.236954] alg: No test for 842 (842-generic)
> [    1.237743] alg: No test for 842 (842-scomp)
> [    1.252185] DRBG: Continuing without Jitter RNG
> [    1.282782] raid6: skip pq benchmark and using algorithm sse2x2
> [    1.283719] raid6: using intx1 recovery algorithm
> [    1.284764] ACPI: Added _OSI(Module Device)
> [    1.285716] ACPI: Added _OSI(Processor Device)
> [    1.286718] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    1.287715] ACPI: Added _OSI(Processor Aggregator Device)
> [    1.288717] ACPI: Added _OSI(Linux-Dell-Video)
> [    1.289715] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> [    1.290715] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> [    1.292174] ACPI: 1 ACPI AML tables successfully acquired and loaded
> [    1.294348] ACPI: Interpreter enabled
> [    1.294728] ACPI: PM: (supports S0 S3 S4 S5)
> [    1.295715] ACPI: Using IOAPIC for interrupt routing
> [    1.296727] PCI: Using host bridge windows from ACPI; if necessary, use
> "pci=3Dnocrs" and report a bug
> [    1.297810] ACPI: Enabled 2 GPEs in block 00 to 0F
> [    1.300466] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    1.300718] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments
> MSI EDR HPX-Type3]
> [    1.301719] acpi PNP0A03:00: fail to add MMCONFIG information, can't a=
ccess
> extended PCI configuration space under this bridge.
> [    1.302721] acpi resource window ([0x1c0000000-0x23fffffff] ignored, n=
ot
> CPU addressable)
> [    1.303916] acpiphp: Slot [3] registered
> [    1.304731] acpiphp: Slot [4] registered
> [    1.305730] acpiphp: Slot [5] registered
> [    1.306489] acpiphp: Slot [6] registered
> [    1.306733] acpiphp: Slot [7] registered
> [    1.307733] acpiphp: Slot [8] registered
> [    1.308730] acpiphp: Slot [9] registered
> [    1.309730] acpiphp: Slot [10] registered
> [    1.310568] acpiphp: Slot [11] registered
> [    1.310730] acpiphp: Slot [12] registered
> [    1.311730] acpiphp: Slot [13] registered
> [    1.312730] acpiphp: Slot [14] registered
> [    1.313730] acpiphp: Slot [15] registered
> [    1.314723] acpiphp: Slot [16] registered
> [    1.315577] acpiphp: Slot [17] registered
> [    1.315732] acpiphp: Slot [18] registered
> [    1.316730] acpiphp: Slot [19] registered
> [    1.317730] acpiphp: Slot [20] registered
> [    1.318729] acpiphp: Slot [21] registered
> [    1.319526] acpiphp: Slot [22] registered
> [    1.319730] acpiphp: Slot [23] registered
> [    1.320737] acpiphp: Slot [24] registered
> [    1.321732] acpiphp: Slot [25] registered
> [    1.322732] acpiphp: Slot [26] registered
> [    1.323733] acpiphp: Slot [27] registered
> [    1.324750] acpiphp: Slot [28] registered
> [    1.325733] acpiphp: Slot [29] registered
> [    1.327716] acpiphp: Slot [30] registered
> [    1.328732] acpiphp: Slot [31] registered
> [    1.329725] PCI host bridge to bus 0000:00
> [    1.330715] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    1.331715] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
> [    1.332715] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff
> window]
> [    1.333715] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfebff=
fff
> window]
> [    1.334715] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    1.335805] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    1.337132] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    1.338223] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    1.340912] pci 0000:00:01.1: reg 0x20: [io  0xc080-0xc08f]
> [    1.343171] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-=
0x01f7]
> [    1.343715] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    1.344717] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-=
0x0177]
> [    1.345715] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    1.346958] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    1.348085] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PI=
IX4 ACPI
> [    1.348723] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PI=
IX4 SMB
> [    1.349953] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
> [    1.351733] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffffff pre=
f]
> [    1.354732] pci 0000:00:02.0: reg 0x18: [mem 0xfebf0000-0xfebf0fff]
> [    1.360734] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pre=
f]
> [    1.362913] pci 0000:00:03.0: [1af4:1009] type 00 class 0x000200
> [    1.364715] pci 0000:00:03.0: reg 0x10: [io  0xc000-0xc03f]
> [    1.366715] pci 0000:00:03.0: reg 0x14: [mem 0xfebf1000-0xfebf1fff]
> [    1.370716] pci 0000:00:03.0: reg 0x20: [mem 0xfe000000-0xfe003fff 64b=
it
> pref]
> [    1.373770] pci 0000:00:04.0: [8086:100e] type 00 class 0x020000
> [    1.375715] pci 0000:00:04.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> [    1.377982] pci 0000:00:04.0: reg 0x14: [io  0xc040-0xc07f]
> [    1.383054] pci 0000:00:04.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pre=
f]
> [    1.383965] pci 0000:00:05.0: [8086:25ab] type 00 class 0x088000
> [    1.385991] pci 0000:00:05.0: reg 0x10: [mem 0xfebf2000-0xfebf200f]
> [    1.389365] pci_bus 0000:00: on NUMA node 0
> [    1.390854] ACPI: PCI: Interrupt link LNKA configured for IRQ 10
> [    1.392813] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
> [    1.393809] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
> [    1.394806] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
> [    1.396713] ACPI: PCI: Interrupt link LNKS configured for IRQ 9
> [    1.398072] iommu: Default domain type: Translated
> [    1.398715] iommu: DMA domain TLB invalidation policy: lazy mode
> [    1.399790] pci 0000:00:02.0: vgaarb: setting as boot VGA device
> [    1.400712] pci 0000:00:02.0: vgaarb: VGA device added:
> decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
> [    1.400716] pci 0000:00:02.0: vgaarb: bridge control possible
> [    1.401715] vgaarb: loaded
> [    1.402643] SCSI subsystem initialized
> [    1.403744] libata version 3.00 loaded.
> [    1.404758] ACPI: bus type USB registered
> [    1.405742] usbcore: registered new interface driver usbfs
> [    1.406731] usbcore: registered new interface driver hub
> [    1.408717] usbcore: registered new device driver usb
> [    1.409750] pps_core: LinuxPPS API ver. 1 registered
> [    1.410714] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
> Giometti <giometti@linux.it>
> [    1.411718] PTP clock support registered
> [    1.412766] EDAC MC: Ver: 3.0.0
> [    1.414938] NetLabel: Initializing
> [    1.415715] NetLabel:  domain hash size =3D 128
> [    1.416714] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
> [    1.417734] NetLabel:  unlabeled traffic allowed by default
> [    1.418722] PCI: Using ACPI for IRQ routing
> [    1.419715] PCI: pci_cache_line_size set to 64 bytes
> [    1.420823] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    1.421719] e820: reserve RAM buffer [mem 0xbffe0000-0xbfffffff]
> [    1.423811] hpet: 3 channels of 0 reserved for per-cpu timers
> [    1.424731] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [    1.425714] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
> [    1.432769] clocksource: Switched to clocksource kvm-clock
> [    1.450889] VFS: Disk quotas dquot_6.6.0
> [    1.451842] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 b=
ytes)
> [    1.453453] pnp: PnP ACPI init
> [    1.454285] pnp 00:02: [dma 2]
> [    1.455285] pnp: PnP ACPI: found 6 devices
> [    1.491745] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,
> max_idle_ns: 2085701024 ns
> [    1.493617] NET: Registered PF_INET protocol family
> [    1.494694] IP idents hash table entries: 16384 (order: 5, 131072 byte=
s, linear)
> [    1.496491] tcp_listen_portaddr_hash hash table entries: 512 (order: 0=
, 6144
> bytes, linear)
> [    1.498309] TCP established hash table entries: 8192 (order: 3, 32768 =
bytes,
> linear)
> [    1.499923] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, =
linear)
> [    1.501431] TCP: Hash tables configured (established 8192 bind 8192)
> [    1.502821] MPTCP token hash table entries: 1024 (order: 2, 16384 byte=
s,
> linear)
> [    1.504415] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    1.505808] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, l=
inear)
> [    1.507313] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    1.508519] NET: Registered PF_XDP protocol family
> [    1.509557] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> [    1.510849] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> [    1.512086] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff
> window]
> [    1.513538] pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfffff win=
dow]
> [    1.514980] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    1.516212] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    1.517460] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    1.518761] pci 0000:00:02.0: Video device with shadowed ROM at [mem
> 0x000c0000-0x000dffff]
> [    1.520525] PCI: CLS 0 bytes, default 64
> [    1.521457] Trying to unpack rootfs image as initramfs...
> [    1.713192] Freeing initrd memory: 6664K
> [    1.714909] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
> 0x256412811b4, max_idle_ns: 440795306987 ns
> [    1.717760] Initialise system trusted keyrings
> [    1.718783] Key type blacklist registered
> [    1.719752] workingset: timestamp_bits=3D14 max_order=3D20 bucket_orde=
r=3D6
> [    1.722543] zbud: loaded
> [    1.723639] integrity: Platform Keyring initialized
> [    1.737954] NET: Registered PF_ALG protocol family
> [    1.738980] xor: measuring software checksum speed
> [    1.740561]    pIII_sse        : 20542 MB/sec
> [    1.741925]    prefetch64-sse  : 23982 MB/sec
> [    1.742909] xor: using function: prefetch64-sse (23982 MB/sec)
> [    1.744139] Key type asymmetric registered
> [    1.745039] Asymmetric key parser 'x509' registered
> [    1.746169] bounce: pool size: 64 pages
> [    1.747094] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 245)
> [    1.748707] io scheduler mq-deadline registered
> [    1.750002] io scheduler kyber registered
> [    1.751161] io scheduler bfq registered
> [    1.752394] atomic64_test: passed for i586+ platform with CX8 and with=
 SSE
> [    1.754383] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
.4
> [    1.756225] input: Power Button as
> /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
> [    1.758287] ACPI: button: Power Button [PWRF]
> [    1.775040] ACPI: \_SB_.LNKC: Enabled at IRQ 11
> [    1.777056] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    1.778502] 00:04: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [    1.781332] Non-volatile memory driver v1.3
> [    1.782297] Linux agpgart interface v0.103
> [    1.783540] ata_piix 0000:00:01.1: version 2.13
> [    1.785339] scsi host0: ata_piix
> [    1.786304] scsi host1: ata_piix
> [    1.787111] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc080 irq
> 14
> [    1.788567] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc088 irq
> 15
> [    1.790069] libphy: Fixed MDIO Bus: probed
> [    1.791249] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    1.792615] ehci-pci: EHCI PCI platform driver
> [    1.793564] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    1.794910] ohci-pci: OHCI PCI platform driver
> [    1.795868] uhci_hcd: USB Universal Host Controller Interface driver
> [    1.797245] usbcore: registered new interface driver usbserial_generic
> [    1.798634] usbserial: USB Serial support registered for generic
> [    1.799947] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at
> 0x60,0x64 irq 1,12
> [    1.802437] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    1.803499] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    1.804623] mousedev: PS/2 mouse device common for all mice
> [    1.806140] input: AT Translated Set 2 keyboard as
> /devices/platform/i8042/serio0/input/input1
> [    1.808292] rtc_cmos 00:05: RTC can wake from S4
> [    1.809901] input: VirtualPS/2 VMware VMMouse as
> /devices/platform/i8042/serio1/input/input4
> [    1.812102] input: VirtualPS/2 VMware VMMouse as
> /devices/platform/i8042/serio1/input/input3
> [    1.813914] rtc_cmos 00:05: registered as rtc0
> [    1.814970] rtc_cmos 00:05: setting system clock to 2021-09-15T13:16:3=
6 UTC
> (1631711796)
> [    1.816672] rtc_cmos 00:05: alarms up to one day, y3k, 242 bytes nvram=
, hpet
> irqs
> [    1.818294] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled.
> Duplicate IMA measurements will not be recorded in the IMA log.
> [    1.820756] device-mapper: uevent: version 1.0.3
> [    1.821788] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialise=
d: dm-
> devel(a)redhat.com
> [    1.823764] intel_pstate: CPU model not supported
> [    1.824907] hid: raw HID events driver (C) Jiri Kosina
> [    1.826142] usbcore: registered new interface driver usbhid
> [    1.827312] usbhid: USB HID core driver
> [    1.828212] drop_monitor: Initializing network drop monitor service
> [    1.838572] Initializing XFRM netlink socket
> [    1.839585] NET: Registered PF_INET6 protocol family
> [    1.841801] Segment Routing with IPv6
> [    1.842683] RPL Segment Routing with IPv6
> [    1.843585] In-situ OAM (IOAM) with IPv6
> [    1.844440] mip6: Mobile IPv6
> [    1.845176] NET: Registered PF_PACKET protocol family
> [    1.847003] IPI shorthand broadcast: enabled
> [    1.848037] ... APIC ID:      00000000 (0)
> [    1.849028] ... APIC VERSION: 00050014
> [    1.849028]
> 0000000000000000000000000000000000000000000000000000000000000000
> [    1.849028]
> 0000000000000000000000000000000000000000000000000000000000000000
> [    1.849028]
> 0000000000000000000000000000000000000000000000000000000000001000
> [    1.849028]
> [    1.854384] number of MP IRQ sources: 15.
> [    1.855515] number of IO-APIC #0 registers: 24.
> [    1.856719] testing the IO APIC.......................
> [    1.858135] IO APIC #0......
> [    1.859016] .... register #00: 00000000
> [    1.860108] .......    : physical APIC id: 00
> [    1.861249] .......    : Delivery Type: 0
> [    1.862379] .......    : LTS          : 0
> [    1.863551] .... register #01: 00170011
> [    1.864654] .......     : max redirection entries: 17
> [    1.865673] .......     : PRQ implemented: 0
> [    1.866614] .......     : IO APIC version: 11
> [    1.867563] .... register #02: 00000000
> [    1.868390] .......     : arbitration: 00
> [    1.869295] .... IRQ redirection table:
> [    1.870177] IOAPIC 0:
> [    1.870810]  pin00, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.872434]  pin01, enabled , edge , high, V(23), IRR(0), S(0), logica=
l , D(0002),
> M(0)
> [    1.874154]  pin02, enabled , edge , high, V(30), IRR(0), S(0), logica=
l , D(0001),
> M(0)
> [    1.875823]  pin03, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.877581]  pin04, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.879254]  pin05, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.880966]  pin06, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.882650]  pin07, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.884268]  pin08, enabled , edge , high, V(23), IRR(0), S(0), logica=
l , D(0001),
> M(0)
> [    1.885952]  pin09, enabled , level, high, V(21), IRR(0), S(0), logica=
l , D(0002),
> M(0)
> [    1.887693]  pin0a, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.889363]  pin0b, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.891044]  pin0c, enabled , edge , high, V(22), IRR(0), S(0), logica=
l , D(0001),
> M(0)
> [    1.892798]  pin0d, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.894462]  pin0e, enabled , edge , high, V(21), IRR(0), S(0), logica=
l , D(0001),
> M(0)
> [    1.896144]  pin0f, enabled , edge , high, V(22), IRR(0), S(0), logica=
l , D(0002),
> M(0)
> [    1.897779]  pin10, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.899354]  pin11, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.901063]  pin12, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.902768]  pin13, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.904403]  pin14, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.906092]  pin15, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.907805]  pin16, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.909507]  pin17, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(0000),
> M(0)
> [    1.911204] IRQ to pin mappings:
> [    1.911965] IRQ0 -> 0:2
> [    1.912559] IRQ1 -> 0:1
> [    1.913151] IRQ3 -> 0:3
> [    1.913728] IRQ4 -> 0:4
> [    1.914319] IRQ5 -> 0:5
> [    1.914934] IRQ6 -> 0:6
> [    1.915513] IRQ7 -> 0:7
> [    1.916134] IRQ8 -> 0:8
> [    1.916709] IRQ9 -> 0:9
> [    1.917346] IRQ10 -> 0:10
> [    1.917939] IRQ11 -> 0:11
> [    1.918584] IRQ12 -> 0:12
> [    1.919226] IRQ13 -> 0:13
> [    1.919843] IRQ14 -> 0:14
> [    1.920425] IRQ15 -> 0:15
> [    1.921074] .................................... done.
> [    1.922166] sched_clock: Marking stable (1809994723, 112149602)-
> >(1997769292, -75624967)
> [    1.923944] registered taskstats version 1
> [    1.924877] Loading compiled-in X.509 certificates
> [    1.928813] Loaded X.509 cert 'Build time autogenerated kernel key:
> 5f848f3a256c3033a276d466d757b9174d58558c'
> [    1.931028] zswap: loaded using pool lzo/zbud
> [    1.932212] Key type ._fscrypt registered
> [    1.933141] Key type .fscrypt registered
> [    1.933989] Key type fscrypt-provisioning registered
> [    1.935399] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dyes, fsveri=
ty=3Dyes
> [    1.937362] Key type encrypted registered
> [    1.938451] ima: No TPM chip found, activating TPM-bypass!
> [    1.939809] Loading compiled-in module X.509 certificates
> [    1.943733] Loaded X.509 cert 'Build time autogenerated kernel key:
> 5f848f3a256c3033a276d466d757b9174d58558c'
> [    1.944780] ata2.01: NODEV after polling detection
> [    1.946329] ima: Allocated hash algorithm: sha256
> [    1.947837] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
> [    1.948670] ima: No architecture policies found
> [    1.951261] evm: Initialising EVM extended attributes:
> [    1.952552] evm: security.selinux
> [    1.953446] evm: security.SMACK64 (disabled)
> [    1.954550] evm: security.SMACK64EXEC (disabled)
> [    1.955734] evm: security.SMACK64TRANSMUTE (disabled)
> [    1.956970] evm: security.SMACK64MMAP (disabled)
> [    1.958269] evm: security.apparmor (disabled)
> [    1.958297] scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     =
2.5+ PQ:
> 0 ANSI: 5
> [    1.959343] evm: security.ima
> [    1.959344] evm: security.capability
> [    1.959345] evm: HMAC attrs: 0x1
> [    1.963315] PM:   Magic number: 5:244:281
> [    1.964463] tty tty18: hash matches
> [    1.983501] sr 1:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tr=
ay
> [    1.985182] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    2.003515] sr 1:0:0:0: Attached scsi CD-ROM sr0
> [    2.004946] sr 1:0:0:0: Attached scsi generic sg0 type 5
> [    2.007640] Freeing unused kernel image (initmem) memory: 1076K
> [    2.013798] Write protecting kernel text and read-only data: 21444k
> [    2.015796] rodata_test: all tests were successful
> [    2.022763] Run /init as init process
> [    2.023922]   with arguments:
> [    2.024801]     /init
> [    2.025447]   with environment:
> [    2.026337]     HOME=3D/
> [    2.027006]     TERM=3Dlinux
> [    2.027784]     user=3D$(whoami)
> [    2.028659]     job=3D/lkp/jobs/scheduled/vm-snb-43/trinity-group-02-9=
9999-
> yocto-i386-minimal-20190520.cgz-
> d64696905554e919321e31afc210606653b8f6a4-20210911-24127-1x1tp2w-
> 8.yaml
> [    2.032415]     ARCH=3Di386
> [    2.033140]     kconfig=3Di386-randconfig-r015-20210910
> [    2.034457]     branch=3Dtrace/ftrace/core
> [    2.035503]     commit=3Dd64696905554e919321e31afc210606653b8f6a4
> [    2.036995]     BOOT_IMAGE=3D/pkg/linux/i386-randconfig-r015-20210910/=
gcc-
> 9/d64696905554e919321e31afc210606653b8f6a4/vmlinuz-5.12.0-
> gd64696905554
> [    2.040147]     max_uptime=3D2100
> [    2.041044]     RESULT_ROOT=3D/result/trinity/group-02-99999/vm-snb/yo=
cto-
> i386-minimal-20190520.cgz/i386-randconfig-r015-20210910/gcc-
> 9/d64696905554e919321e31afc210606653b8f6a4/8
> [    2.044850]     LKP_LOCAL_RUN=3D1
> [    2.045749]     softlockup_panic=3D1
> [    2.046688]     prompt_ramdisk=3D0
> [    2.047584]     vga=3Dnormal
> [    2.048380]     ip=3Ddhcp
> [    2.049110]     result_service=3D9p/virtfs_mount
> INIT: version 2.88 booting
> Starting udev
> [    2.073317] udevd[167]: starting version 3.2.7
> [    2.074652] random: udevd: uninitialized urandom read (16 bytes read)
> [    2.076331] random: udevd: uninitialized urandom read (16 bytes read)
> [    2.077986] random: udevd: uninitialized urandom read (16 bytes read)
> [    2.080262] udevd[167]: specified group 'kvm' unknown
> [    2.082655] udevd[168]: starting eudev-3.2.7
> depmod: ERROR: could not open directory /lib/modules/5.15.0-rc1+: No such
> file or directory
> depmod: WARNING: -e needs -E or -F
> depmod: ERROR: could not open directory /lib/modules/5.15.0-rc1+: No such
> file or directory
> depmod: FATAL: could not search modules: No such file or directory
> INIT: Entering runlevel: 5
> Configuring network interfaces... done.
> Starting syslogd/klogd: done
> /etc/rc5.d/S77lkp-bootstrap: /lkp/jobs/scheduled/vm-snb-43/trinity-group-=
02-
> 99999-yocto-i386-minimal-20190520.cgz-
> d64696905554e919321e31afc210606653b8f6a4-20210911-24127-1x1tp2w-8.sh:
> line 123: start: not found
> /etc/rc5.d/S77lkp-bootstrap: line 75: /lkp/root/src/bin/lkp-setup-rootfs:=
 not
> found
> INIT: Id "S1" respawning too fast: disabled for 5 minutes
> =

> Poky (Yocto Project Reference Distro) 2.7+snapshot qemux86 /dev/ttyS0
> =

> qemux86 login:
> =

> =

> > As the log you mentioned, below [1] shows our corresponding log, they a=
re
> very similar, only we don't have depmod error, I found some solutions and=
 add
> their links here, could you check if they can solve your issue? Thanks.
> >
> > depmod: ERROR: could not open directory /lib/modules/5.14.0-09687-
> g27151f177827: No such file or directory
> > depmod: FATAL: could not search modules: No such file or directory
> >
> > https://stackoverflow.com/questions/28644386/kernel-install-gives-missi=
ng-
> module-error
> > https://serverfault.com/questions/780980/error-could-not-open-directory=
-lib-
> modules-4-2-0-25-generic-no-such-file-or-d
> =

> The error occurs inside qemu. It seems that the directory with modules and
> lkp-tests itself (/lkp/root/src) was not mounted from the host system.
> =

> --
> Rgrds, legion
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============4136991372558559486==--

