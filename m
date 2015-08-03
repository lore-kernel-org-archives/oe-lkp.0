Content-Type: multipart/mixed; boundary="===============4370960343820820264=="
MIME-Version: 1.0
From: Sudeep Dutt <sudeep.dutt@intel.com>
To: lkp@lists.01.org
Subject: Re: [mic/SCIF] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:97
Date: Mon, 03 Aug 2015 09:54:05 -0700
Message-ID: <1438620845.115234.22.camel@localhost>
In-Reply-To: <20150729010727.GA24184@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4370960343820820264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-07-29 at 09:07 +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/sudeepdutt/mic.git master
> =


Hi Fengguang,

Many thanks for the bug report. We have a fix for this issue and will
post it to our tree this week.

However, I am confused about how you triggered this bug. We think the
only way this bug can be triggered is if someone explicitly opens and
closes the "/dev/scif" character device node. Is your test triggering an
open and close of the SCIF character device node? If yes, then the
problem is well understood. If not, can you please provide us with more
detailed reproducer instructions?

Thanks,
Sudeep Dutt

> commit d9b3ca3e0275d3f816bb5cfc9d0dc29677369513
> Author:     Sudeep Dutt <sudeep.dutt@intel.com>
> AuthorDate: Sun Jul 12 12:32:47 2015 -0700
> Commit:     Sudeep Dutt <sudeep.dutt@intel.com>
> CommitDate: Mon Jul 27 11:21:37 2015 -0700
> =

>     misc: mic: SCIF RMA nodeqp and minor miscellaneous changes
>     =

>     This patch adds the SCIF kernel node QP control messages required to
>     enable SCIF RMAs. Examples of such node QP control messages include
>     registration, unregistration, remote memory allocation requests,
>     remote memory unmap and SCIF remote fence requests.
>     =

>     The patch also updates the SCIF driver with minor changes required to
>     enable SCIF RMAs by adding the new files to the build, initializing
>     RMA specific information during SCIF endpoint creation, reserving SCIF
>     DMA channels, initializing SCIF RMA specific global data structures,
>     adding the IOCTL hooks required for SCIF RMAs and updating RMA
>     specific debugfs hooks.
>     =

>     Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>     Reviewed-by: Nikhil Rao <nikhil.rao@intel.com>
>     Signed-off-by: Sudeep Dutt <sudeep.dutt@intel.com>
> =

> +------------------------------------------------------------------------=
-----+------------+------------+-----------------+
> |                                                                        =
     | bf64426662 | d9b3ca3e02 | v4.2-rc4_072812 |
> +------------------------------------------------------------------------=
-----+------------+------------+-----------------+
> | boot_successes                                                         =
     | 1870       | 810        | 66              |
> | boot_failures                                                          =
     | 54         | 102        | 6               |
> | BUG:kernel_boot_hang                                                   =
     | 50         | 93         | 2               |
> | IP-Config:Auto-configuration_of_network_failed                         =
     | 4          | 1          | 2               |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mut=
ex.c | 0          | 8          | 2               |
> +------------------------------------------------------------------------=
-----+------------+------------+-----------------+
> =

> [   65.983169] init: Failed to create pty - disabling logging for job
> [   65.986582] init: Temporary process spawn error: No space left on devi=
ce
> Kernel tests: Boot OK!
> [   84.137274] BUG: sleeping function called from invalid context at kern=
el/locking/mutex.c:97
> [   84.151965] in_atomic(): 1, irqs_disabled(): 0, pid: 27, name: kworker=
/1:1
> [   84.158038] Preemption disabled at:[<ffffffff814da919>] scif_cleanup_z=
ombie_epd+0x19/0xc0
> =

> Elapsed time: 100
> qemu-system-x86_64 -enable-kvm -cpu kvm64 -kernel /pkg/linux/x86_64-randc=
onfig-a0-07281258/gcc-4.9/d9b3ca3e0275d3f816bb5cfc9d0dc29677369513/vmlinuz-=
4.2.0-rc4-00019-gd9b3ca3 -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,1=
15200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupd=
ate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdo=
g=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,=
115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-test=
s/run-queue/kvm/x86_64-randconfig-a0-07281258/linux-devel:devel-hourly-2015=
072812:d9b3ca3e0275d3f816bb5cfc9d0dc29677369513:bisect-linux-7/.vmlinuz-d9b=
3ca3e0275d3f816bb5cfc9d0dc29677369513-20150728215553-321-vp branch=3Dlinux-=
devel/devel-hourly-2015072812 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-a0-=
07281258/gcc-4.9/d9b3ca3e0275d3f816bb5cfc9d0dc29677369513/vmlinuz-4.2.0-rc4=
-00019-gd9b3ca3 drbd.minor_count=3D8'  -initrd /osimage/quantal/quantal-cor=
e-x86_64.cgz -m 300 -smp 2 -device e1000,netdev=3Dnet0 -netdev user,id=3Dne=
t0 -boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -dr=
ive file=3D/fs/sde1/disk0-quantal-vp-13,media=3Ddisk,if=3Dvirtio -drive fil=
e=3D/fs/sde1/disk1-quantal-vp-13,media=3Ddisk,if=3Dvirtio -drive file=3D/fs=
/sde1/disk2-quantal-vp-13,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sde1/d=
isk3-quantal-vp-13,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sde1/disk4-qu=
antal-vp-13,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sde1/disk5-quantal-v=
p-13,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sde1/disk6-quantal-vp-13,me=
dia=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-quantal-vp-13 -serial fi=
le:/dev/shm/kboot/serial-quantal-vp-13 -daemonize -display none -monitor nu=
ll =

> =

> git bisect start 72393e966b06f24449c1996186119f6fd0130bdf cbfe8fa6cd67201=
1c755c3cd85c9ffd4e2d10a6f --
> git bisect  bad eb7f76c33b2d8be8c9a803d1f20d9fe98f8246d9  # 18:55      0-=
     16  Merge 'arm-soc/omap/dt-dm814x' into devel-hourly-2015072812
> git bisect good 638ef803569ecdb9972bbecfb794b6b890ec0cc9  # 19:27    906+=
     78  Merge 'dm/dm-4.3' into devel-hourly-2015072812
> git bisect  bad 28cdc264da4db5ddc10159d0b812705c940db472  # 19:27      0-=
      4  Merge 'robclark/msm-fixes-4.2' into devel-hourly-2015072812
> git bisect good c9e3f1b6ed3ab03f5be54465fecfa6862420864d  # 19:59    908+=
     85  Merge 'kvmarm/next' into devel-hourly-2015072812
> git bisect  bad 225463ff867d9cceaec4a601784451d9d4431a6e  # 19:59      0-=
     19  Merge 'ntb/ntb-next' into devel-hourly-2015072812
> git bisect  bad ca86349941a1bbe628eebce913e37760668a1bd5  # 19:59      0-=
     69  Merge 'mic/master' into devel-hourly-2015072812
> git bisect good 8131ebc8ecb5ef13ef0aa4c49dabe9694f0e410f  # 20:39    902+=
    116  lib: convert iova.c into a library
> git bisect good f8ad236fbde693a118935963ac5a59a63273918a  # 21:16    906+=
    137  misc: mic: SCIF RMA list operations
> git bisect good fe703268a77d8c29d670887ce036a4cf625d0b8d  # 21:51    906+=
    131  misc: mic: SCIF DMA and CPU copy interface
> git bisect  bad d9b3ca3e0275d3f816bb5cfc9d0dc29677369513  # 22:01     57-=
     10  misc: mic: SCIF RMA nodeqp and minor miscellaneous changes
> git bisect good bf64426662d854590ba3bc149aaaf4977bc01c49  # 22:41    900+=
     25  misc: mic: SCIF fence
> # first bad commit: [d9b3ca3e0275d3f816bb5cfc9d0dc29677369513] misc: mic:=
 SCIF RMA nodeqp and minor miscellaneous changes
> git bisect good bf64426662d854590ba3bc149aaaf4977bc01c49  # 23:09   1014+=
     54  misc: mic: SCIF fence
> # extra tests on HEAD of linux-devel/devel-hourly-2015072812
> git bisect  bad 72393e966b06f24449c1996186119f6fd0130bdf  # 23:09      0-=
      6  0day head guard for 'devel-hourly-2015072812'
> # extra tests on tree/branch mic/master
> git bisect  bad d9b3ca3e0275d3f816bb5cfc9d0dc29677369513  # 01:09      0-=
    102  misc: mic: SCIF RMA nodeqp and minor miscellaneous changes
> # extra tests with first bad commit reverted
> git bisect good 9b9b4cf984edd8e74084a139923ffc3a846f7bf5  # 01:47   1005+=
      0  Revert "misc: mic: SCIF RMA nodeqp and minor miscellaneous changes"
> # extra tests on tree/branch linus/master
> git bisect good 67eb890e5e132b56d9af7adf407e7c2a6ed248dc  # 02:23   1002+=
      0  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/egtvedt/linux-avr32
> # extra tests on tree/branch linux-next/master
> git bisect good 5aa6180315a5f8ea1236608082e7135a4beaaf8a  # 02:57   1009+=
      0  Add linux-next specific files for 20150728
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu kvm64
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 300
> 	-smp 2
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0
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
> 	systemd.log_level=3Derr
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
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



--===============4370960343820820264==--

