Content-Type: multipart/mixed; boundary="===============3834825259673686465=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [perf] BUG: unable to handle kernel NULL pointer dereference at 00000085
Date: Sat, 04 Oct 2014 19:24:56 +0200
Message-ID: <20141004172456.GA7509@worktop.ger.corp.intel.com>
In-Reply-To: <20141004134622.GA5214@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3834825259673686465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 04, 2014 at 09:46:22PM +0800, Fengguang Wu wrote:
> Hi Peter,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
> =

> commit a54b3e27e27c1bb6d2610eade895c04934c2667e
> Author:     Peter Zijlstra <peterz@infradead.org>
> AuthorDate: Wed Sep 24 13:48:42 2014 +0200
> Commit:     Peter Zijlstra <peterz@infradead.org>
> CommitDate: Thu Oct 2 23:11:50 2014 +0200
> =

>     perf: improve perf_sample_data struct layout
>     =

>     This patch reorders fields in the perf_sample_data
>     struct in order to minimize the number of cachelines
>     touched in perf_sample_data_init(). It also removes
>     some intializations which are redundant with the
>     code in kernel/events/core.c
>     =

>     Cc: mingo(a)elte.hu
>     Cc: ak(a)linux.intel.com
>     Cc: jolsa(a)redhat.com
>     Cc: acme(a)redhat.com
>     Cc: cebbert.lkml(a)gmail.com
>     Cc: peterz(a)infradead.org
>     =

>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Link: http://lkml.kernel.org/r/1411559322-16548-7-git-send-email-eran=
ian(a)google.com
> =


> [  267.547006] debug: unmapping init [mem 0xc28f9000-0xc2b03fff]
> [  267.694378] random: init urandom read with 4 bits of entropy available
> [  279.465522] sock: process `trinity-main' is using obsolete setsockopt =
SO_BSDCOMPAT
> [  285.269144] BUG: unable to handle kernel NULL pointer dereference at 0=
0000085
> [  285.273002] IP: [<c11259a1>] perf_prepare_sample+0x33e/0x496
> [  285.276062] *pde =3D 00000000 =

> [  285.279106] Oops: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
> [  285.279106] Modules linked in:
> [  285.279106] CPU: 1 PID: 1583 Comm: trinity-main Not tainted 3.17.0-rc4=
-00210-ga54b3e2 #1
> [  285.279106] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [  285.279106] task: c9475e80 ti: c9670000 task.ti: c9670000
> [  285.279106] EIP: 0060:[<c11259a1>] EFLAGS: 00010046 CPU: 1
> [  285.279106] EIP is at perf_prepare_sample+0x33e/0x496
> [  285.279106] EAX: 00000000 EBX: 00000000 ECX: 00000049 EDX: 00000000
> [  285.279106] ESI: cfd71c40 EDI: cfd71b84 EBP: cfd71b58 ESP: cfd71b34
> [  285.279106]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
> [  285.279106] CR0: 80050033 CR2: 00000085 CR3: 095b4000 CR4: 000006d0
> [  285.279106] DR0: 41000043 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [  285.279106] DR6: ffff0ff0 DR7: 00010602

Could you try the below patch to confirm it works?


> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-i386.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-cpu kvm64
> 	-enable-kvm
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 320
> 	-smp 2
> 	-net nic,vlan=3D1,model=3De1000
> 	-net user,vlan=3D1
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null =

> )
> =

> append=3D(
> 	hung_task_panic=3D1
> 	earlyprintk=3DttyS0,115200
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	root=3D/dev/ram0
> 	rw
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---

What is lacking is the actual .config.

Also the times above (~285 seconds) seem to suggest userspace needs to
do something ?

I tried with i386-defconfig and the above receptie gives me:

...
[    4.887413] tsc: Refined TSC clocksource calibration: 2693.765 MHz
[    5.257469] hwclock (874) used greatest stack depth: 6624 bytes left
[    5.299754] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/=
i8042/serio1/input/input3
[    5.911225] Switched to clocksource tsc
[    6.613714] init: Failed to create pty - disabling logging for job
[    6.615490] init: Temporary process spawn error: No space left on device
[    8.058431] initctl (926) used greatest stack depth: 6192 bytes left
[    9.084036] init: plymouth-log main process (940) terminated with
status 1
Kernel tests: Boot OK!
[   71.302525] reboot: Restarting system


Which I take is 'good', right?

---
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4953,12 +4953,13 @@ void perf_prepare_sample(struct perf_eve
 		header->size +=3D size;
 	}
 =

+	if (sample_type & (PERF_SAMPLE_REGS_USER | PERF_SAMPLE_STACK_USER))
+		perf_sample_regs_user(&data->regs_user, regs);
+
 	if (sample_type & PERF_SAMPLE_REGS_USER) {
 		/* regs dump ABI info */
 		int size =3D sizeof(u64);
 =

-		perf_sample_regs_user(&data->regs_user, regs);
-
 		if (data->regs_user.regs) {
 			u64 mask =3D event->attr.sample_regs_user;
 			size +=3D hweight64(mask) * sizeof(u64);
@@ -4974,15 +4975,11 @@ void perf_prepare_sample(struct perf_eve
 		 * in case new sample type is added, because we could eat
 		 * up the rest of the sample size.
 		 */
-		struct perf_regs *uregs =3D &data->regs_user;
 		u16 stack_size =3D event->attr.sample_stack_user;
 		u16 size =3D sizeof(u64);
 =

-		if (!uregs->abi)
-			perf_sample_regs_user(uregs, regs);
-
 		stack_size =3D perf_sample_ustack_size(stack_size, header->size,
-						     uregs->regs);
+						     data->regs_user.regs);
 =

 		/*
 		 * If there is something to dump, add space for the dump

--===============3834825259673686465==--

