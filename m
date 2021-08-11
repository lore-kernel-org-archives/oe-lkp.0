Content-Type: multipart/mixed; boundary="===============1742147784776475760=="
MIME-Version: 1.0
From: 王擎 <wangqing@vivo.com>
To: lkp@lists.01.org
Subject: Re: [workqueue/watchdog] 89e28ce60c: BUG:KCSAN:data-race_in_wq_watchdog_touch/wq_watchdog_touch
Date: Wed, 11 Aug 2021 09:02:26 +0000
Message-ID: <AF*AMwCCD6BXfuzW4pVogaoa.3.1628672537246.Hmail.wangqing@vivo.com>
In-Reply-To: <20210809061121.GA5761@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1742147784776475760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Because jiffies are gradual, it does not matter if there is data-race in th=
e assignment, and no modification is required.

Thanks,
Qing


From: kernel test robot <oliver.sang@intel.com>
Date: 2021-08-09 14:11:21
To:  Wang Qing <wangqing@vivo.com>
Cc:  Tejun Heo <tj@kernel.org>,LKML <linux-kernel@vger.kernel.org>,lkp(=
a)lists.01.org,lkp(a)intel.com
Subject: [workqueue/watchdog]  89e28ce60c: BUG:KCSAN:data-race_in_wq_watchd=
og_touch/wq_watchdog_touch>
>
>Greeting,
>
>FYI, we noticed the following commit (built with clang-14):
>
>commit: 89e28ce60cb65971c73359c66d076aa20a395cd5 ("workqueue/watchdog: Mak=
e unbound workqueues aware of touch_softlockup_watchdog()")
>https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
>
>in testcase: boot
>
>on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m=
 16G
>
>caused below changes (please refer to attached dmesg/kmsg for entire log/b=
acktrace):
>
>
>
>If you fix the issue, kindly add following tag
>Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
>[    0.322292][    T1] BUG: KCSAN: data-race in wq_watchdog_touch / wq_wat=
chdog_touch
>[    0.322292][    T1]
>[    0.322292][    T1] write to 0xffffffff8346e680 of 8 bytes by task 0 on=
 cpu 1:
>[ 0.322292][ T1] wq_watchdog_touch (kernel/workqueue.c:5825) =

>[ 0.322292][ T1] touch_softlockup_watchdog (kernel/watchdog.c:265) =

>[ 0.322292][ T1] check_tsc_warp (arch/x86/kernel/tsc_sync.c:265) =

>[ 0.322292][ T1] check_tsc_sync_target (arch/x86/kernel/tsc_sync.c:438) =

>[ 0.322292][ T1] start_secondary (arch/x86/kernel/smpboot.c:251) =

>[ 0.322292][ T1] secondary_startup_64_no_verify (arch/x86/kernel/head_64.S=
:283) =

>[    0.322292][    T1]
>[    0.322292][    T1] write to 0xffffffff8346e680 of 8 bytes by task 1 on=
 cpu 0:
>[ 0.322292][ T1] wq_watchdog_touch (kernel/workqueue.c:5825) =

>[ 0.322292][ T1] touch_softlockup_watchdog (kernel/watchdog.c:265) =

>[ 0.322292][ T1] check_tsc_warp (arch/x86/kernel/tsc_sync.c:265) =

>[ 0.322292][ T1] check_tsc_sync_source (arch/x86/include/asm/atomic.h:29 i=
nclude/asm-generic/atomic-instrumented.h:28 arch/x86/kernel/tsc_sync.c:348) =

>[ 0.322292][ T1] native_cpu_up (arch/x86/kernel/smpboot.c:1191) =

>[ 0.322292][ T1] bringup_cpu (arch/x86/include/asm/smp.h:87 kernel/cpu.c:5=
68) =

>[ 0.322292][ T1] cpuhp_invoke_callback (kernel/cpu.c:173) =

>[ 0.322292][ T1] _cpu_up (kernel/cpu.c:623 kernel/cpu.c:1253) =

>[ 0.322292][ T1] cpu_up (kernel/cpu.c:1288) =

>[ 0.322292][ T1] bringup_nonboot_cpus (kernel/cpu.c:1350) =

>[ 0.322292][ T1] smp_init (include/linux/bitmap.h:400 include/linux/nodema=
sk.h:240 include/linux/nodemask.h:431 kernel/smp.c:816) =

>[ 0.322292][ T1] kernel_init_freeable (init/main.c:1530) =

>[ 0.322292][ T1] kernel_init (init/main.c:1426) =

>[ 0.322292][ T1] ret_from_fork (arch/x86/entry/entry_64.S:300) =

>[    0.322292][    T1]
>[    0.322292][    T1] Reported by Kernel Concurrency Sanitizer on:
>[    0.322292][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc=
5-00184-g89e28ce60cb6 #1
>[    0.322292][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>[    0.322599][   T14] kvm-guest: stealtime: cpu 1, msr 43fd2c0c0
>[    0.325764][    T1] smp: Brought up 1 node, 2 CPUs
>[    0.326291][    T1] smpboot: Max logical packages: 2
>[    0.326786][    T1] smpboot: Total of 2 processors activated (9581.58 B=
ogoMIPS)
>[    0.408828][    T1] allocated 167772160 bytes of page_ext
>[    0.416411][    T1] Node 0, zone    DMA32: page owner found early alloc=
ated 8 pages
>[    0.447668][    T1] Node 0, zone   Normal: page owner found early alloc=
ated 41736 pages
>[    0.449514][    T1] devtmpfs: initialized
>[    0.450145][    T1] x86/mm: Memory block size: 128MB
>[ 0.480910][ T1] random: get_random_bytes called from setup_net+0x8d/0x5b9=
 with crng_init=3D0 =

>[    0.483928][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 6370867519511994 ns
>[    0.484997][    T1] futex hash table entries: 16 (order: -1, 2048 bytes=
, linear)
>[    0.486443][    T1] pinctrl core: initialized pinctrl subsystem
>[    0.488814][    T1] regulator-dummy: no parameters, enabled
>[ 0.490278][ T1] random: get_random_u32 called from rhashtable_init+0x3aa/=
0x570 with crng_init=3D0 =

>[    0.490583][    T1] NET: Registered protocol family 16
>[    0.495386][    T1] DMA: preallocated 2048 KiB GFP_KERNEL pool for atom=
ic allocations
>[    0.495880][    T1] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 poo=
l for atomic allocations
>[    0.498604][    T1] kcsan: selftest: 3/3 tests passed
>[    0.501585][    T1] thermal_sys: Registered thermal governor 'step_wise'
>[    0.501599][    T1] thermal_sys: Registered thermal governor 'user_spac=
e'
>[    0.502576][    T1] cpuidle: using governor ladder
>[    0.503839][    T1] cpuidle: using governor menu
>[ 0.506162][ T1] random: get_random_bytes called from kcmp_cookies_init+0x=
1d/0x67 with crng_init=3D0 =

>[    0.506296][    T1] ACPI: bus type PCI registered
>[    0.507650][    T1] PCI: Using configuration type 1 for base access
>[    0.566045][    T1] HugeTLB registered 2.00 MiB page size, pre-allocate=
d 0 pages
>[    0.573158][    T1] cryptd: max_cpu_qlen set to 1000
>[    0.593434][    T1] ACPI: Added _OSI(Module Device)
>[    0.593928][    T1] ACPI: Added _OSI(Processor Device)
>[    0.594443][    T1] ACPI: Added _OSI(3.0 _SCP Extensions)
>[    0.594942][    T1] ACPI: Added _OSI(Processor Aggregator Device)
>[    0.595723][    T1] ACPI: Added _OSI(Linux-Dell-Video)
>[    0.596217][    T1] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
>[    0.596772][    T1] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
>[    0.616486][    T1] ACPI: 1 ACPI AML tables successfully acquired and l=
oaded
>[    0.625174][    T1] ACPI: Interpreter enabled
>[    0.625787][    T1] ACPI: (supports S0 S3 S5)
>[    0.626322][    T1] ACPI: Using IOAPIC for interrupt routing
>[    0.627026][    T1] PCI: Using host bridge windows from ACPI; if necess=
ary, use "pci=3Dnocrs" and report a bug
>[    0.629847][    T1] ACPI: Enabled 2 GPEs in block 00 to 0F
>[    0.682925][    T1] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-f=
f])
>[    0.683741][    T1] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Se=
gments HPX-Type3]
>[    0.684814][    T1] acpi PNP0A03:00: fail to add MMCONFIG information, =
can't access extended PCI configuration space under this bridge.
>[    0.686520][    T1] PCI host bridge to bus 0000:00
>[    0.686895][    T1] pci_bus 0000:00: root bus resource [io  0x0000-0x0c=
f7 window]
>[    0.687605][    T1] pci_bus 0000:00: root bus resource [io  0x0d00-0xff=
ff window]
>[    0.688226][    T1] pci_bus 0000:00: root bus resource [mem 0x000a0000-=
0x000bffff window]
>[    0.688958][    T1] pci_bus 0000:00: root bus resource [mem 0xc0000000-=
0xfebfffff window]
>[    0.689680][    T1] pci_bus 0000:00: root bus resource [mem 0x440000000=
-0x4bfffffff window]
>[    0.690446][    T1] pci_bus 0000:00: root bus resource [bus 00-ff]
>[    0.691131][    T1] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
>[    0.694434][    T1] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
>[    0.697128][    T1] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
>[    0.700363][    T1] pci 0000:00:01.1: reg 0x20: [io  0xc040-0xc04f]
>[    0.702182][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  =
0x01f0-0x01f7]
>[    0.702306][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  =
0x03f6]
>[    0.703017][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  =
0x0170-0x0177]
>[    0.703618][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  =
0x0376]
>[    0.705984][    T1] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
>[    0.707033][    T1] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claime=
d by PIIX4 ACPI
>[    0.708238][    T1] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claime=
d by PIIX4 SMB
>[    0.710864][    T1] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
>[    0.712837][    T1] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdfff=
fff pref]
>[    0.715644][    T1] pci 0000:00:02.0: reg 0x18: [mem 0xfebf0000-0xfebf0=
fff]
>[    0.721381][    T1] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebef=
fff pref]
>[    0.723990][    T1] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
>[    0.725548][    T1] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdf=
fff]
>[    0.726570][    T1] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
>[    0.731756][    T1] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbf=
fff pref]
>[    0.734403][    T1] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
>[    0.735334][    T1] pci 0000:00:04.0: reg 0x10: [mem 0xfebf1000-0xfebf1=
00f]
>
>
>To reproduce:
>
>        # build kernel
>	cd linux
>	cp config-5.12.0-rc5-00184-g89e28ce60cb6 .config
>	make HOSTCC=3Dclang-14 CC=3Dclang-14 ARCH=3Dx86_64 olddefconfig prepare m=
odules_prepare bzImage
>
>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        bin/lkp qemu -k <bzImage> job-script # job-script is attached in t=
his email
>
>
>
>---
>0DAY/LKP+ Test Infrastructure                   Open Source Technology Cen=
ter
>https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpor=
ation
>
>Thanks,
>Oliver Sang
>



--===============1742147784776475760==--

