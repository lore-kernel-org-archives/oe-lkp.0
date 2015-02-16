Content-Type: multipart/mixed; boundary="===============7522541393749172257=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [torture] INFO: task killall5:262 blocked for more than 120 seconds.
Date: Mon, 16 Feb 2015 15:25:28 +0800
Message-ID: <20150216072528.GC17056@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7522541393749172257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

FYI, this may be very hard to reproduce.

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git revert-d34=
7efeb16d3d5150cb7f8d50b05f388b572840e-ab7d45053f99f44f81a221eb5c9fbe253ee94=
524

commit ab7d45053f99f44f81a221eb5c9fbe253ee94524
Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
AuthorDate: Tue Mar 4 11:03:21 2014 -0800
Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
CommitDate: Wed May 14 09:46:02 2014 -0700

    torture: Increase stutter-end intensity
    =

    Currently, all stuttered kthreads block a jiffy at a time, which can
    result in them starting at different times.  (Note: This is not an
    energy-efficiency problem unless you run torture tests in production,
    in which case you have other problems!)  This commit increases the
    intensity of the restart event by causing kthreads to spin through the
    last jiffy, restarting when they see the variable change.
    =

    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
    Reviewed-by: Josh Triplett <josh@joshtriplett.org>

+---------------------------------------------------------------+----------=
--+------------+------------+
|                                                               | fff35c4e9=
f | ab7d45053f | 7afb8886a0 |
+---------------------------------------------------------------+----------=
--+------------+------------+
| boot_successes                                                | 1000     =
  | 884        | 14         |
| boot_failures                                                 | 0        =
  | 16         | 2          |
| INFO:task_blocked_for_more_than#seconds                       | 0        =
  | 12         | 2          |
| Kernel_panic-not_syncing:hung_task:blocked_tasks              | 0        =
  | 12         | 2          |
| backtrace:watchdog                                            | 0        =
  | 12         | 2          |
| WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print() | 0        =
  | 4          |            |
| backtrace:rcu_torture_stats                                   | 0        =
  | 4          |            |
| backtrace:rcu_torture_boost                                   | 0        =
  | 0          | 2          |
+---------------------------------------------------------------+----------=
--+------------+------------+

[  183.290093] rcu-torture: Reader Batch:  7006877 238 0 0 0 0 0 0 0 0 0
[  183.290093] rcu-torture: Free-Block Circulation:  622 622 621 620 619 61=
8 617 616 615 614 0
[  183.290093] ??? Writer stall state 5 g550 c550 f0x0
[  240.530125] INFO: task killall5:262 blocked for more than 120 seconds.
[  240.531833]       Not tainted 3.15.0-rc1-00022-gab7d450 #5
[  240.550103] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[  240.551948] CPU: 0 PID: 27 Comm: khungtaskd Not tainted 3.15.0-rc1-00022=
-gab7d450 #5
[  240.553610] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[  240.555632] task: d1cea290 ti: d1d3e000 task.ti: d1d3e000
[  240.556741] Stack:
[  240.557395] Call Trace:
[  240.558122] Code: 81 00 d3 ff ff f6 c4 10 75 ed c1 e3 18 89 99 10 d3 ff =
ff 89 f0 09 d0 80 ce 04 83 fe 02 0f 45 d0 a1 6c 1b 06 c2 89 90 00 d3 ff ff =
<89> f8 50 9d 8d 74 26 00 83 c4 04 5b 5e 5f 5d c3 ba 70 00 00 00
[  240.560012] CPU: 1 PID: 64 Comm: rcu_torture_boo Not tainted 3.15.0-rc1-=
00022-gab7d450 #5
[  240.560012] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[  240.560012] task: cc4d4310 ti: cc4d8000 task.ti: cc4d8000
[  240.560012] Stack:
[  240.560012] Call Trace:
[  240.560012] Code: 00 00 8b 00 85 c0 0f 85 85 00 00 00 a1 fc 85 7c c2 85 =
c0 74 46 a1 fc 85 7c c2 83 f8 01 74 5c a1 fc 85 7c c2 85 c0 74 23 8d 76 00 =
<31> c9 ba 1c 02 00 00 b8 ac d5 eb c1 e8 5f 12 fb ff e8 8a 0c b3
[  240.598110] Kernel panic - not syncing: hung_task: blocked tasks
[  240.599315] CPU: 0 PID: 27 Comm: khungtaskd Not tainted 3.15.0-rc1-00022=
-gab7d450 #5
[  240.600854] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[  240.602788]  00007f95 00000000 d1d3fedc c1be7294 d29b6f60 d1d3fef4 c1be4=
f9d 00007f95
[  240.604992]  d29b6f60 00007f95 d29b71c8 d1d3ff24 c10a7d1d c1eb744c 00000=
395 00000078
[  240.607268]  00000002 00007f95 d29b6f60 d29b71c8 d1d38e00 00000000 c10a7=
a50 d1d3ffac
[  240.607938] Call Trace:
[  240.607938]  [<c1be7294>] dump_stack+0x48/0x69
[  240.607938]  [<c1be4f9d>] panic+0x7c/0x184
[  240.607938]  [<c10a7d1d>] watchdog+0x2cd/0x2d0
[  240.607938]  [<c10a7a50>] ? hung_task_panic+0x20/0x20
[  240.607938]  [<c105fb93>] kthread+0xa3/0xc0
[  240.607938]  [<c1bf0701>] ret_from_kernel_thread+0x21/0x30
[  240.607938]  [<c105faf0>] ? __kthread_unpark+0x50/0x50
[  240.607938] Kernel Offset: 0x0 from 0xc1000000 (relocation range: 0xc000=
0000-0xd47dffff)

Elapsed time: 240

git bisect start v3.16 v3.15 --
git bisect  bad 5170a3b24a9141e2349a3420448743b7c68f2223  # 06:12      0-  =
   11  Merge branch 'akpm' (patches from Andrew Morton)
git bisect  bad 1ad96bb0a20fa26b952b2250e89d14b6397bf618  # 06:12      0-  =
   17  Merge tag 'gpio-v3.16-2' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/linusw/linux-gpio
git bisect  bad 412dd3a6daf0cadce1b2d6a34fa3713f40255579  # 06:12      0-  =
   46  Merge tag 'xfs-for-linus-3.16-rc1' of git://oss.sgi.com/xfs/xfs
git bisect  bad b1cce8032f6abe900b078d24f3c3938726528f97  # 06:20    281-  =
    7  Merge branch 'for-next' of git://git.samba.org/sfrench/cifs-2.6
git bisect  bad da85d191f58a44e149a7c07dbae78b3042909798  # 06:36    416-  =
    7  Merge branch 'for-3.16' of git://git.kernel.org/pub/scm/linux/kernel=
/git/tj/wq
git bisect  bad f8409abdc592e13cefbe4e4a24a84b3d5741e85f  # 07:00    500-  =
   13  Merge tag 'ext4_for_linus' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/tytso/ext4
git bisect  bad ed81e780a7dd5698a986f246fad6a1d8d0b6f9ce  # 07:17    680-  =
   14  Merge branch 'x86-vdso-for-linus' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/tip/tip
git bisect  bad 3f17ea6dea8ba5668873afa54628a91aaa3fb1c0  # 07:32    772-  =
   10  Merge branch 'next' (accumulated 3.16 merge window patches) into mas=
ter
git bisect good 49eb7b0750d9483c74e9c14ae6ea1e9d62481c3c  # 07:54    900+  =
    6  Merge tag 'tty-3.16-rc1' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/gregkh/tty into next
git bisect  bad 15b588303155b22edd559672905db8e59a44ef9a  # 08:07    625-  =
   13  Merge tag 'fbdev-omap-3.16' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/tomba/linux into next
git bisect  bad 776edb59317ada867dfcddde40b55648beeb0078  # 08:29    562-  =
   12  Merge branch 'locking-core-for-linus' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tip/tip into next
git bisect good f456205265a61f1d649f8378eceaa163850cba4e  # 08:46    900+  =
    2  Merge tag 'hwmon-for-linus' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/groeck/linux-staging into next
git bisect good e13cccfd86481bd4c0499577f44c570d334da79b  # 08:59    900+  =
    2  Merge tag 'spi-v3.16' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/broonie/spi into next
git bisect good ff806d034ef8e9a95ff0b0532104dd65332e446b  # 09:15    900+  =
    0  Merge branch 'for-v3.16' of git://git.linaro.org/people/mszyprowski/=
linux-dma-mapping into next
git bisect  bad 6348675c4e3612e001860354fea78258e041d9a1  # 09:32    550-  =
    8  torture: Remove unused definition
git bisect  bad ab7d45053f99f44f81a221eb5c9fbe253ee94524  # 09:40    438-  =
    8  torture: Increase stutter-end intensity
git bisect good a0edd47ca4f0ffa33df137c13a08189bae66bcc3  # 09:59    900+  =
    4  torture: Rename RCU_QEMU_INTERACTIVE to TORTURE_QEMU_INTERACTIVE
git bisect good b3b8a4d42bba8e1fb1b91cc6fd53829d28a503de  # 10:13    900+  =
    4  rcutorture: Mark function as static in kernel/rcu/torture.c
git bisect good 589a8f59509dc4c68f9c1e2522c5b0b556009221  # 10:38    900+  =
    2  rcutorture: Print negatives for SRCU counter wraparound
git bisect good fff35c4e9fbb0982aef6230cbf713c2492925eca  # 10:55    900+  =
    0  torture: Report diagnostics from qemu
# first bad commit: [ab7d45053f99f44f81a221eb5c9fbe253ee94524] torture: Inc=
rease stutter-end intensity
git bisect good fff35c4e9fbb0982aef6230cbf713c2492925eca  # 10:57   1000+  =
    0  torture: Report diagnostics from qemu
# extra tests with DEBUG_INFO
# extra tests on HEAD of net/master
git bisect  bad 7afb8886a05be68e376655539a064ec672de8a8e  # 11:02      0-  =
    2  rtnetlink: call ->dellink on failure when ->newlink exists
# extra tests on tree/branch linus/master
# extra tests with first bad commit reverted
# extra tests on tree/branch linus/master
# extra tests on tree/branch next/master


This script may reproduce the error.

----------------------------------------------------------------------------
#!/bin/bash

kernel=3D$1
initrd=3Dquantal-core-i386.cgz

wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/mas=
ter/initrd/$initrd

kvm=3D(
	qemu-system-x86_64
	-cpu kvm64
	-enable-kvm
	-kernel $kernel
	-initrd $initrd
	-m 320
	-smp 2
	-net nic,vlan=3D1,model=3De1000
	-net user,vlan=3D1
	-boot order=3Dnc
	-no-reboot
	-watchdog i6300esb
	-rtc base=3Dlocaltime
	-serial stdio
	-display none
	-monitor null =

)

append=3D(
	hung_task_panic=3D1
	earlyprintk=3DttyS0,115200
	rd.udev.log-priority=3Derr
	systemd.log_target=3Djournal
	systemd.log_level=3Dwarning
	debug
	apic=3Ddebug
	sysrq_always_enabled
	rcupdate.rcu_cpu_stall_timeout=3D100
	panic=3D-1
	softlockup_panic=3D1
	nmi_watchdog=3Dpanic
	oops=3Dpanic
	load_ramdisk=3D2
	prompt_ramdisk=3D0
	console=3DttyS0,115200
	console=3Dtty0
	vga=3Dnormal
	root=3D/dev/ram0
	rw
	drbd.minor_count=3D8
)

"${kvm[@]}" --append "${append[*]}"
----------------------------------------------------------------------------

Thanks,
Fengguang

--===============7522541393749172257==--

