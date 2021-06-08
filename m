Content-Type: multipart/mixed; boundary="===============8518173619472708830=="
MIME-Version: 1.0
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: lkp@lists.01.org
Subject: Re: [init/initramfs.c] e7cb072eb9: invoked_oom-killer:gfp_mask=0x
Date: Tue, 08 Jun 2021 09:42:58 +0200
Message-ID: <d28354fd-0f72-559d-771f-fb2a80b51b05@rasmusvillemoes.dk>
In-Reply-To: <20210607144419.GA23706@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8518173619472708830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/06/2021 16.44, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: e7cb072eb988e46295512617c39d004f9e1c26f8 ("init/initramfs.c: do u=
npacking asynchronously")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: locktorture
> version: =

> with following parameters:
> =

> 	runtime: 300s
> 	test: cpuhotplug
> =

> test-description: This torture test consists of creating a number of kern=
el threads which acquire the lock and hold it for specific amount of time, =
thus simulating different critical region behaviors.
> test-url: https://www.kernel.org/doc/Documentation/locking/locktorture.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> please be noted that we use 'vmalloc=3D512M' for both parent and this com=
mit.
> since it's ok on parent but oom on this commit, we want to send this repo=
rt
> to show the potential problem of the commit on some cases.
> =

> we also tested by changing to use 'vmalloc=3D128M', it will succeed.
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [    4.443950] e1000: Copyright (c) 1999-2006 Intel Corporation.
> [    4.716374] ACPI: _SB_.LNKC: Enabled at IRQ 11
> [    5.081518] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34=
:56
> [    5.082999] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connect=
ion
> [    5.085275] VFIO - User Level meta-driver version: 0.3
> [    8.029204] kworker/u4:0 invoked oom-killer: gfp_mask=3D0x100cc0(GFP_U=
SER), order=3D0, oom_score_adj=3D0
> [    8.031021] CPU: 1 PID: 7 Comm: kworker/u4:0 Not tainted 5.12.0-11533-=
ge7cb072eb988 #1
> [    8.031988] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [    8.031988] Workqueue: events_unbound async_run_entry_fn
> [    8.031988] Call Trace:
> [    8.031988] dump_stack (kbuild/src/consumer/lib/dump_stack.c:122) =

> [    8.031988] dump_header (kbuild/src/consumer/mm/oom_kill.c:463) =

> [    8.031988] ? lock_release (kbuild/src/consumer/kernel/locking/lockdep=
.c:5190 kbuild/src/consumer/kernel/locking/lockdep.c:5532) =

> [    8.031988] ? out_of_memory (kbuild/src/consumer/include/linux/rcupdat=
e.h:710 kbuild/src/consumer/mm/oom_kill.c:379 kbuild/src/consumer/mm/oom_ki=
ll.c:1102 kbuild/src/consumer/mm/oom_kill.c:1048) =

> [    8.031988] out_of_memory.cold (kbuild/src/consumer/mm/oom_kill.c:1106=
 kbuild/src/consumer/mm/oom_kill.c:1048) =

> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.12.0-11533-ge7cb072eb988 .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage modules
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod-insta=
ll-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz

So I got this far...

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email

Is there some way to reproduce which doesn't require adding an lkp user?
Also, I don't have 16G to give to a virtual machine. I tried running the
bzImage with that modules.cgz under qemu with some naive parameters just
to get some output [1], but other than failing because there's no rootfs
to mount (as expected), I only managed to make it fail when providing
too little memory (the .cgz is around 70M, decompressed about 200M -
giving '-m 1G' to qemu works fine). You mention the vmalloc=3D argument,
but I can't make the decompression fail when passing either vmalloc=3D128M
or vmalloc=3D512M or no vmalloc=3D at all.

As an extra data point, what happens if you add initramfs_async=3D0 to the
command line?

[1] qemu-system-x86_64 -kernel arch/i386/boot/bzImage -initrd
../../tmp/header-install/modules.cgz -append "console=3DttyAMA0
console=3DttyS0 vmalloc=3D512M" -serial stdio -smp 2 -m 1G

Rasmus
--===============8518173619472708830==--

