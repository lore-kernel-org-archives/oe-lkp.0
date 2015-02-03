Content-Type: multipart/mixed; boundary="===============3900567179973563101=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: lkp@lists.01.org
Subject: Re: [rcu] [ INFO: suspicious RCU usage. ]
Date: Tue, 03 Feb 2015 11:01:42 +0100
Message-ID: <1422957702.17540.1.camel@AMDC1943>
In-Reply-To: <20150201025922.GA16820@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3900567179973563101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On sob, 2015-01-31 at 18:59 -0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rever=
t-c418b8035fac0cc7d242e5de126cec1006a34bed-dd2b39be8eee9d175c7842c30e405a5c=
be50095a

On next-20150203 I hit similar error on ARM/Exynos4412 (Trats2 board)
while suspending to RAM:

[   30.986262] PM: Syncing filesystems ... done.
[   30.994661] PM: Preparing system for mem sleep
[   31.002064] Freezing user space processes ... (elapsed 0.002 seconds) do=
ne.
[   31.008629] Freezing remaining freezable tasks ... (elapsed 0.001 second=
s) done.
[   31.016325] PM: Entering mem sleep
[   31.016338] Suspending console(s) (use no_console_suspend to debug)
[   31.051009] random: nonblocking pool is initialized
[   31.085811] wake enabled for irq 102
[   31.086964] wake enabled for irq 123
[   31.086972] wake enabled for irq 124
[   31.090409] PM: suspend of devices complete after 59.684 msecs
[   31.090524] CAM_ISP_CORE_1.2V: No configuration
[   31.090534] VMEM_VDDF_3.0V: No configuration
[   31.090543] VCC_SUB_2.0V: No configuration
[   31.090552] VCC_SUB_1.35V: No configuration
[   31.090562] VMEM_1.2V_AP: No configuration
[   31.090587] MOTOR_VCC_3.0V: No configuration
[   31.090596] LCD_VCC_3.3V: No configuration
[   31.090605] TSP_VDD_1.8V: No configuration
[   31.090614] TSP_AVDD_3.3V: No configuration
[   31.090623] VMEM_VDD_2.8V: No configuration
[   31.090631] VTF_2.8V: No configuration
[   31.090640] VDDQ_PRE_1.8V: No configuration
[   31.090649] VT_CAM_1.8V: No configuration
[   31.090658] CAM_ISP_SEN_IO_1.8V: No configuration
[   31.090667] CAM_SENSOR_CORE_1.2V: No configuration
[   31.090677] VHSIC_1.8V: No configuration
[   31.090685] VHSIC_1.0V: No configuration
[   31.090694] VABB2_1.95V: No configuration
[   31.090703] NFC_AVDD_1.8V: No configuration
[   31.090712] VUOTG_3.0V: No configuration
[   31.090721] VABB1_1.95V: No configuration
[   31.090730] VMIPI_1.8V: No configuration
[   31.090739] CAM_ISP_MIPI_1.2V: No configuration
[   31.090747] VMIPI_1.0V: No configuration
[   31.090756] VPLL_1.0V_AP: No configuration
[   31.090765] VMPLL_1.0V_AP: No configuration
[   31.090773] VCC_1.8V_IO: No configuration
[   31.090782] VCC_2.8V_AP: No configuration
[   31.090791] VCC_1.8V_AP: No configuration
[   31.090800] VM1M2_1.2V_AP: No configuration
[   31.090809] VALIVE_1.0V_AP: No configuration
[   31.100297] PM: late suspend of devices complete after 9.445 msecs
[   31.108891] PM: noirq suspend of devices complete after 8.577 msecs
[   31.109052] Disabling non-boot CPUs ...
[   31.113921]
[   31.113925] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   31.113928] [ INFO: suspicious RCU usage. ]
[   31.113935] 3.19.0-rc7-next-20150203 #1914 Not tainted
[   31.113938] -------------------------------
[   31.113943] kernel/sched/fair.c:4740 suspicious rcu_dereference_check() =
usage!
[   31.113946]
[   31.113946] other info that might help us debug this:
[   31.113946]
[   31.113952]
[   31.113952] RCU used illegally from offline CPU!
[   31.113952] rcu_scheduler_active =3D 1, debug_locks =3D 0
[   31.113957] 3 locks held by swapper/1/0:
[   31.113988]  #0:  ((cpu_died).wait.lock){......}, at: [<c005a114>] compl=
ete+0x14/0x44
[   31.114012]  #1:  (&p->pi_lock){-.-.-.}, at: [<c004a790>] try_to_wake_up=
+0x28/0x300
[   31.114035]  #2:  (rcu_read_lock){......}, at: [<c004f1b8>] select_task_=
rq_fair+0x5c/0xa04
[   31.114038]
[   31.114038] stack backtrace:
[   31.114046] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 3.19.0-rc7-next-20=
150203 #1914
[   31.114050] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[   31.114076] [<c0014ce4>] (unwind_backtrace) from [<c0011c30>] (show_stac=
k+0x10/0x14)
[   31.114091] [<c0011c30>] (show_stack) from [<c04dc048>] (dump_stack+0x70=
/0xbc)
[   31.114105] [<c04dc048>] (dump_stack) from [<c004f83c>] (select_task_rq_=
fair+0x6e0/0xa04)
[   31.114118] [<c004f83c>] (select_task_rq_fair) from [<c004a83c>] (try_to=
_wake_up+0xd4/0x300)
[   31.114129] [<c004a83c>] (try_to_wake_up) from [<c00598a0>] (__wake_up_c=
ommon+0x4c/0x80)
[   31.114140] [<c00598a0>] (__wake_up_common) from [<c00598e8>] (__wake_up=
_locked+0x14/0x1c)
[   31.114150] [<c00598e8>] (__wake_up_locked) from [<c005a134>] (complete+=
0x34/0x44)
[   31.114167] [<c005a134>] (complete) from [<c04d6ca4>] (cpu_die+0x24/0x84)
[   31.114179] [<c04d6ca4>] (cpu_die) from [<c005a508>] (cpu_startup_entry+=
0x328/0x358)
[   31.114189] [<c005a508>] (cpu_startup_entry) from [<40008784>] (0x400087=
84)
[   31.114226] CPU1: shutdown
[   31.132479] CPU2: shutdown
[   31.146815] CPU3: shutdown
[   31.160767] Enabling non-boot CPUs ...
[   31.175645] CPU1 is up
[   31.191120] CPU2 is up
[   31.206650] CPU3 is up
[   31.206922] s3c-i2c 13860000.i2c: slave address 0x10
[   31.206935] s3c-i2c 13860000.i2c: bus frequency set to 390 KHz
[   31.206952] s3c-i2c 13890000.i2c: slave address 0x10
[   31.206962] s3c-i2c 13890000.i2c: bus frequency set to 390 KHz
[   31.206978] s3c-i2c 138d0000.i2c: slave address 0x10
[   31.206987] s3c-i2c 138d0000.i2c: bus frequency set to 97 KHz
[   31.209201] PM: noirq resume of devices complete after 2.539 msecs
[   31.212202] PM: early resume of devices complete after 2.812 msecs
[   31.229844] Failed to resume regulators from suspend (-22)
[   31.230915] wake disabled for irq 123
[   31.230923] wake disabled for irq 124
[   31.232003] wake disabled for irq 102
[   31.259950] max77686_rtc_tm_to_data: MAX77686 RTC cannot handle the year=
 1970.Assume it's 2000.
[   31.298929] mmc_host mmc1: Bus speed (slot 0) =3D 50000000Hz (slot req 4=
00000Hz, actual 396825HZ div =3D 63)
[   31.526729] mmc_host mmc1: Bus speed (slot 0) =3D 50000000Hz (slot req 5=
2000000Hz, actual 50000000HZ div =3D 0)
[   31.526976] mmc_host mmc1: Bus speed (slot 0) =3D 100000000Hz (slot req =
52000000Hz, actual 50000000HZ div =3D 1)
[   31.527207] PM: resume of devices complete after 297.352 msecs
[   31.985665] PM: Finishing wakeup.
[   31.988959] Restarting tasks ... done.
root(a)target:~#

Best regards,
Krzysztof

> =

> commit dd2b39be8eee9d175c7842c30e405a5cbe50095a
> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> AuthorDate: Wed Jan 28 14:42:09 2015 -0800
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Fri Jan 30 12:59:22 2015 -0800
> =

>     rcu: Handle outgoing CPUs on exit from idle loop
>     =

>     This commit informs RCU of an outgoing CPU just before that CPU invok=
es
>     arch_cpu_idle_dead() during its last pass through the idle loop (via a
>     new CPU_DYING_IDLE notifier value).  This change means that RCU need =
not
>     deal with outgoing CPUs passing through the scheduler after informing
>     RCU that they are no longer online.  Note that removing the CPU from
>     the rcu_node ->qsmaskinit bit masks is done at CPU_DYING_IDLE time,
>     and orphaning callbacks is still done at CPU_DEAD time, the reason be=
ing
>     that at CPU_DEAD time we have another CPU that can adopt them.
>     =

>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> =

> +-------------------------------------+------------+------------+--------=
----+
> |                                     | 8c50d7da91 | dd2b39be8e | d586642=
522 |
> +-------------------------------------+------------+------------+--------=
----+
> | boot_successes                      | 198        | 11         | 51     =
    |
> | boot_failures                       | 0          | 55         | 15     =
    |
> | INFO:suspicious_RCU_usage           | 0          | 55         | 15     =
    |
> | RCU_used_illegally_from_offline_CPU | 0          | 55         | 15     =
    |
> | backtrace:cpu_startup_entry         | 0          | 55         | 15     =
    |
> | BUG:kernel_test_hang                | 0          | 0          | 4      =
    |
> +-------------------------------------+------------+------------+--------=
----+
> =

> [   15.244825] numa_remove_cpu cpu 0 node 0: mask now 1
> [   15.246713] =

> [   15.246917] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   15.247424] [ INFO: suspicious RCU usage. ]
> [   15.247964] 3.19.0-rc1-gdd2b39b #10 Not tainted
> [   15.248531] -------------------------------
> [   15.248586] include/trace/events/rcu.h:35 suspicious rcu_dereference_c=
heck() usage!
> [   15.248586] =

> [   15.248586] other info that might help us debug this:
> [   15.248586] =

> [   15.248586] =

> [   15.248586] RCU used illegally from offline CPU!
> [   15.248586] rcu_scheduler_active =3D 1, debug_locks =3D 0
> [   15.248586] no locks held by swapper/0/0.
> [   15.248586] =

> [   15.248586] stack backtrace:
> [   15.248586] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.19.0-rc1-gdd2b=
39b #10
> [   15.248586]  0000000000000001 ffffffff81e03e08 ffffffff8171b89b 000000=
0000000000
> [   15.248586]  ffffffff81e0e580 ffffffff81e03e38 ffffffff810efec2 ffffff=
ff81e4b140
> [   15.248586]  ffffffff81c77ba0 0000000000000002 ffffffff81e11e98 ffffff=
ff81e03e58
> [   15.248586] Call Trace:
> [   15.248586]  [<ffffffff8171b89b>] dump_stack+0x7f/0xa7
> [   15.248586]  [<ffffffff810efec2>] lockdep_rcu_suspicious+0x107/0x110
> [   15.248586]  [<ffffffff81111363>] trace_rcu_utilization+0x127/0x133
> [   15.248586]  [<ffffffff8111291e>] rcu_cpu_notify+0x527/0x53b
> [   15.248586]  [<ffffffff810e9722>] cpu_startup_entry+0x1dc/0x4ea
> [   15.248586]  [<ffffffff8170eb5d>] rest_init+0x159/0x15f
> [   15.248586]  [<ffffffff8237b2da>] start_kernel+0x565/0x572
> [   15.248586]  [<ffffffff8237a120>] ? early_idt_handlers+0x120/0x120
> [   15.248586]  [<ffffffff8237a4e4>] x86_64_start_reservations+0x41/0x43
> [   15.248586]  [<ffffffff8237a623>] x86_64_start_kernel+0x13d/0x14c
> [   15.265151] CPU 0 is now offline
> [   15.265941] debug: unmapping init [mem 0xffffffff82365000-0xffffffff82=
539fff]
> [   15.266726] Write protecting the kernel read-only data: 14336k
> =

> git bisect start d58664252218cfefb19709d597ff0c5d93688203 26bc420b59a38e4=
e6685a73345a0def461136dce --
> git bisect  bad 19f7d9c2f948a4c5c7742adb16fe00920f35f302  # 13:29     23-=
      6  Merge 'jtkirshe-net-next/i40e-queue' into devel-roam-smoke-2015013=
11226
> git bisect  bad 2c86978183cc365003e2d6949052a30865ef8b89  # 13:33     34-=
     32  Merge 'wsa/i2c/for-next' into devel-roam-smoke-201501311226
> git bisect good 1ffdd3662d27b1d4d59d51bbcc104b200be63d6a  # 13:37     66+=
      0  Merge 'pci/pci/virtualization' into devel-roam-smoke-201501311226
> git bisect  bad 0ce6ea6707a3d5ae5bfdbdc4d16ebc86cff77f5f  # 13:43     32-=
     22  Merge 'rcu/rcu/next' into devel-roam-smoke-201501311226
> git bisect good 53805a9f2fa76294af534fb7e9f96d43f1d820eb  # 13:52     66+=
      0  Merge 'iio/testing' into devel-roam-smoke-201501311226
> git bisect good 78e691f4ae2d5edea0199ca802bb505b9cdced88  # 14:01     66+=
      0  Merge branches 'doc.2015.01.07a', 'fixes.2015.01.15a', 'preempt.20=
15.01.06a', 'srcu.2015.01.06a', 'stall.2015.01.16a' and 'torture.2015.01.11=
a' into HEAD
> git bisect good 17366dc8dc49858ba931c4120d8de494e388d93e  # 14:05     66+=
      0  documentation: Update rcutree.kthread_prio for grace-period kthrea=
d use
> git bisect good 569c1500e44189136c8a9f4b5e39f0055e422b0d  # 14:14     66+=
      0  documentation: Update based on on-demand vmstat workers
> git bisect good 14fefdb410cf48327c972ce91deb5e98edc8671f  # 14:18     66+=
      0  rcu: Eliminate ->onoff_mutex from rcu_node structure
> git bisect  bad dd2b39be8eee9d175c7842c30e405a5cbe50095a  # 14:29     11-=
     55  rcu: Handle outgoing CPUs on exit from idle loop
> git bisect good 8c50d7da9124a9f1e92e13996a0a148b2431390d  # 14:34     66+=
      0  cpu: Make CPU-offline idle-loop transition point more precise
> # first bad commit: [dd2b39be8eee9d175c7842c30e405a5cbe50095a] rcu: Handl=
e outgoing CPUs on exit from idle loop
> git bisect good 8c50d7da9124a9f1e92e13996a0a148b2431390d  # 14:37    198+=
      0  cpu: Make CPU-offline idle-loop transition point more precise
> # extra tests with DEBUG_INFO
> git bisect good dd2b39be8eee9d175c7842c30e405a5cbe50095a  # 15:35    198+=
    198  rcu: Handle outgoing CPUs on exit from idle loop
> # extra tests on HEAD of linux-devel/devel-roam-smoke-201501311226
> git bisect  bad d58664252218cfefb19709d597ff0c5d93688203  # 15:35      0-=
     15  0day head guard for 'devel-roam-smoke-201501311226'
> # extra tests on tree/branch rcu/rcu/next
> git bisect  bad c418b8035fac0cc7d242e5de126cec1006a34bed  # 15:52     47-=
     21  cpu: Stop newly offlined CPU from using RCU readers
> # extra tests with first bad commit reverted
> # extra tests on tree/branch linus/master
> git bisect good 2141fd018156db0f29efb384f4d99ead23b48f18  # 16:04    198+=
      0  Merge tag 'char-misc-3.19-rc7' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/gregkh/char-misc
> # extra tests on tree/branch next/master
> git bisect good 827e3bdf1bb2401c1a1e5586eb3977d228d298b2  # 16:12    198+=
      0  Add linux-next specific files for 20150130
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
> =

> Thanks,
> Fengguang
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com


--===============3900567179973563101==--

