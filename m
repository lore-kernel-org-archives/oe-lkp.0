Content-Type: multipart/mixed; boundary="===============0836161837210345741=="
MIME-Version: 1.0
From: Yafang Shao <laoar.shao@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 64228563c2: WARNING:at_kernel/kthread.c:#__kthread_bind_mask
Date: Mon, 08 Nov 2021 11:53:28 +0800
Message-ID: <CALOAHbCECsXOpvHtspzdjptufPAqyirfq9oG1NjKn33afqVckA@mail.gmail.com>
In-Reply-To: <20211107093845.GB11442@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0836161837210345741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 7, 2021 at 5:38 PM kernel test robot <oliver.sang@intel.com> =
wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 64228563c20f024e40e4bdaa51eeec99002c489f ("[RFC PATCH 2/4] sched/=
fair: Introduce cfs_migration")
> url: https://github.com/0day-ci/linux/commits/Yafang-Shao/sched-Introduce=
-cfs_migration/20211104-225939
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 8ea9183db4=
ad8afbcb7089a77c23eaf965b0cacd
> patch link: https://lore.kernel.org/lkml/20211104145713.4419-3-laoar.shao=
(a)gmail.com
>
> in testcase: leaking-addresses
> version: leaking-addresses-x86_64-cf2a85e-1_20211103
> with following parameters:
>
>         ucode: 0x28
>
>
>
> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40=
GHz with 16G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +--------------------------------------------------+------------+--------=
----+
> |                                                  | 812ea7cfb1 | 6422856=
3c2 |
> +--------------------------------------------------+------------+--------=
----+
> | boot_successes                                   | 10         | 0      =
    |
> | boot_failures                                    | 0          | 11     =
    |
> | WARNING:at_kernel/kthread.c:#__kthread_bind_mask | 0          | 11     =
    |
> | RIP:__kthread_bind_mask                          | 0          | 11     =
    |
> +--------------------------------------------------+------------+--------=
----+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>

Thanks for the report!

Should make below change:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4a906412570e..fa720e840c6d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12037,7 +12037,6 @@ static struct smp_hotplug_thread
cfs_migration_threads =3D {

 static int __init cfs_migration_init(void)
 {
-       struct cfs_migrater *cm =3D &per_cpu(cfs_migrater,
raw_smp_processor_id());
        unsigned int cpu;

        for_each_possible_cpu(cpu) {
@@ -12048,7 +12047,6 @@ static int __init cfs_migration_init(void)
        }

        WARN_ON_ONCE(smpboot_register_percpu_thread(&cfs_migration_threads)=
);
-       kthread_unpark(cm->thread);

        return 0;
 }


>
> [ 3.072411][ T1] WARNING: CPU: 0 PID: 1 at kernel/kthread.c:465 __kthread=
_bind_mask (kernel/kthread.c:465 (discriminator 1))
> [    3.073411][    T1] Modules linked in:
> [    3.074411][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-r=
c4-00071-g64228563c20f #1
> [    3.075411][    T1] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIO=
S A05 12/05/2013
> [ 3.076411][ T1] RIP: 0010:__kthread_bind_mask (kernel/kthread.c:465 (dis=
criminator 1))
> [ 3.077411][ T1] Code: 89 e2 b7 00 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00=
 00 41 55 41 54 55 48 89 f5 89 d6 53 48 89 fb e8 28 bb 01 00 48 85 c0 75 09=
 <0f> 0b 5b 5d 41 5c 41 5d c3 4c 8d ab a4 0c 00 00 4c 89 ef e8 4b ed
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   89 e2                   mov    %esp,%edx
>    2:   b7 00                   mov    $0x0,%bh
>    4:   66 0f 1f 84 00 00 00    nopw   0x0(%rax,%rax,1)
>    b:   00 00
>    d:   0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
>   12:   41 55                   push   %r13
>   14:   41 54                   push   %r12
>   16:   55                      push   %rbp
>   17:   48 89 f5                mov    %rsi,%rbp
>   1a:   89 d6                   mov    %edx,%esi
>   1c:   53                      push   %rbx
>   1d:   48 89 fb                mov    %rdi,%rbx
>   20:   e8 28 bb 01 00          callq  0x1bb4d
>   25:   48 85 c0                test   %rax,%rax
>   28:   75 09                   jne    0x33
>   2a:*  0f 0b                   ud2             <-- trapping instruction
>   2c:   5b                      pop    %rbx
>   2d:   5d                      pop    %rbp
>   2e:   41 5c                   pop    %r12
>   30:   41 5d                   pop    %r13
>   32:   c3                      retq
>   33:   4c 8d ab a4 0c 00 00    lea    0xca4(%rbx),%r13
>   3a:   4c 89 ef                mov    %r13,%rdi
>   3d:   e8                      .byte 0xe8
>   3e:   4b ed                   rex.WXB in (%dx),%eax
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   0f 0b                   ud2
>    2:   5b                      pop    %rbx
>    3:   5d                      pop    %rbp
>    4:   41 5c                   pop    %r12
>    6:   41 5d                   pop    %r13
>    8:   c3                      retq
>    9:   4c 8d ab a4 0c 00 00    lea    0xca4(%rbx),%r13
>   10:   4c 89 ef                mov    %r13,%rdi
>   13:   e8                      .byte 0xe8
>   14:   4b ed                   rex.WXB in (%dx),%eax
> [    3.078411][    T1] RSP: 0000:ffffc9000002fdd8 EFLAGS: 00010246
> [    3.079411][    T1] RAX: 0000000000000000 RBX: ffff888100aed000 RCX: 0=
000000000000000
> [    3.080411][    T1] RDX: 0000000000000001 RSI: 0000000000000246 RDI: 0=
0000000ffffffff
> [    3.081411][    T1] RBP: ffffffff822101e0 R08: ffffffff8284cec8 R09: f=
fffffff8284cec8
> [    3.082411][    T1] R10: 0000000000000000 R11: ffff8883fda278f0 R12: 0=
000000000000008
> [    3.083411][    T1] R13: 0000000000000000 R14: 0000000000000000 R15: 0=
000000000000000
> [    3.084411][    T1] FS:  0000000000000000(0000) GS:ffff8883fda00000(00=
00) knlGS:0000000000000000
> [    3.085411][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.086411][    T1] CR2: ffff88841ea01000 CR3: 000000041da10001 CR4: 0=
0000000001706f0
> [    3.087411][    T1] Call Trace:
> [ 3.088413][ T1] kthread_unpark (kernel/kthread.c:478 kernel/kthread.c:57=
0)
> [ 3.089411][ T1] cfs_migration_init (kernel/sched/fair.c:12029 (discrimin=
ator 3))
> [ 3.090412][ T1] ? setup_sched_thermal_decay_shift (kernel/sched/fair.c:1=
2014)
> [ 3.091411][ T1] do_one_initcall (init/main.c:1303)
> [ 3.092412][ T1] kernel_init_freeable (init/main.c:1419 init/main.c:1603)
> [ 3.093412][ T1] ? rest_init (init/main.c:1497)
> [ 3.094411][ T1] kernel_init (init/main.c:1507)
> [ 3.095411][ T1] ret_from_fork (arch/x86/entry/entry_64.S:301)
> [    3.096413][    T1] ---[ end trace 221e592f8f64f075 ]---
> [    3.097411][    T1] rcu: Hierarchical SRCU implementation.
> [    3.098989][    T5] NMI watchdog: Enabled. Permanently consumes one hw=
-PMU counter.
> [    3.099473][    T1] smp: Bringing up secondary CPUs ...
> [    3.100482][    T1] x86: Booting SMP configuration:
> [    3.101412][    T1] .... node  #0, CPUs:      #1
> [    0.534696][    T0] masked ExtINT on CPU#1
> [    3.110490][    T1]  #2
> [    0.534696][    T0] masked ExtINT on CPU#2
> [    3.117413][    T1]  #3
> [    0.534696][    T0] masked ExtINT on CPU#3
> [    3.124184][    T1]  #4
> [    0.534696][    T0] masked ExtINT on CPU#4
> [    3.130933][    T1] MDS CPU bug present and SMT on, data leak possible=
. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html f=
or more details.
> [    3.131497][    T1]  #5
> [    0.534696][    T0] masked ExtINT on CPU#5
> [    3.138269][    T1]  #6
> [    0.534696][    T0] masked ExtINT on CPU#6
> [    3.145166][    T1]  #7
> [    0.534696][    T0] masked ExtINT on CPU#7
> [    3.152059][    T1] smp: Brought up 1 node, 8 CPUs
> [    3.152412][    T1] smpboot: Max logical packages: 1
> [    3.153411][    T1] smpboot: Total of 8 processors activated (54273.93=
 BogoMIPS)
> [    3.177958][   T60] node 0 deferred pages initialised in 22ms
> [    3.184695][    T1] devtmpfs: initialized
> [    3.185443][    T1] x86/mm: Memory block size: 128MB
> [    3.187216][    T1] ACPI: PM: Registering ACPI NVS region [mem 0xd1695=
000-0xd169bfff] (28672 bytes)
> [    3.187412][    T1] ACPI: PM: Registering ACPI NVS region [mem 0xda71c=
000-0xda7fffff] (933888 bytes)
> [    3.188450][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 1911260446275000 ns
> [    3.189413][    T1] futex hash table entries: 2048 (order: 5, 131072 b=
ytes, linear)
> [    3.190454][    T1] pinctrl core: initialized pinctrl subsystem
> [    3.191527][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    3.192555][    T1] audit: initializing netlink subsys (disabled)
> [    3.193423][   T71] audit: type=3D2000 audit(1636161192.177:1): state=
=3Dinitialized audit_enabled=3D0 res=3D1
> [    3.193471][    T1] thermal_sys: Registered thermal governor 'fair_sha=
re'
> [    3.194412][    T1] thermal_sys: Registered thermal governor 'bang_ban=
g'
> [    3.195411][    T1] thermal_sys: Registered thermal governor 'step_wis=
e'
> [    3.196411][    T1] thermal_sys: Registered thermal governor 'user_spa=
ce'
> [    3.197420][    T1] cpuidle: using governor menu
> [    3.199511][    T1] ACPI: bus type PCI registered
> [    3.200412][    T1] acpiphp: ACPI Hot Plug PCI Controller Driver versi=
on: 0.5
> [    3.201454][    T1] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem =
0xf8000000-0xfbffffff] (base 0xf8000000)
> [    3.202412][    T1] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reser=
ved in E820
> [    3.203416][    T1] pmd_set_huge: Cannot satisfy [mem 0xf8000000-0xf82=
00000] with a huge-page mapping due to MTRR override.
> [    3.204444][    T1] PCI: Using configuration type 1 for base access
> [    3.205522][    T1] core: PMU erratum BJ122, BV98, HSD29 worked around=
, HT is on
> [    3.207568][    T1] Kprobes globally optimized
> [    3.208425][    T1] HugeTLB registered 1.00 GiB page size, pre-allocat=
ed 0 pages
> [    3.209412][    T1] HugeTLB registered 2.00 MiB page size, pre-allocat=
ed 0 pages
> [    3.210428][    T1] cryptd: max_cpu_qlen set to 1000
> [    3.211440][    T1] ACPI: Added _OSI(Module Device)
> [    3.212415][    T1] ACPI: Added _OSI(Processor Device)
> [    3.213411][    T1] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    3.214411][    T1] ACPI: Added _OSI(Processor Aggregator Device)
> [    3.215411][    T1] ACPI: Added _OSI(Linux-Dell-Video)
> [    3.216411][    T1] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> [    3.217411][    T1] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> [    3.224227][    T1] ACPI: 6 ACPI AML tables successfully acquired and =
loaded
> [    3.225178][    T1] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignor=
ed
> [    3.225803][    T1] ACPI: Dynamic OEM Table Load:
> [    3.226414][    T1] ACPI: SSDT 0xFFFF88841EAB5000 0003D3 (v01 PmRef  C=
pu0Cst  00003001 INTL 20120711)
> [    3.227913][    T1] ACPI: Dynamic OEM Table Load:
> [    3.228414][    T1] ACPI: SSDT 0xFFFF88841EAC4000 0005AA (v01 PmRef  A=
pIst    00003000 INTL 20120711)
> [    3.229916][    T1] ACPI: Dynamic OEM Table Load:
> [    3.230413][    T1] ACPI: SSDT 0xFFFF888100EF8800 000119 (v01 PmRef  A=
pCst    00003000 INTL 20120711)
> [    3.232725][    T1] ACPI: Interpreter enabled
> [    3.233432][    T1] ACPI: PM: (supports S0 S3 S4 S5)
> [    3.234411][    T1] ACPI: Using IOAPIC for interrupt routing
> [    3.235430][    T1] PCI: Using host bridge windows from ACPI; if neces=
sary, use "pci=3Dnocrs" and report a bug
> [    3.236560][    T1] ACPI: Enabled 9 GPEs in block 00 to 3F
> [    3.243366][    T1] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-=
3e])
> [    3.243414][    T1] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig=
 ASPM ClockPM Segments MSI HPX-Type3]
> [    3.244781][    T1] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplu=
g SHPCHotplug PME AER PCIeCapability LTR]
> [    3.245679][    T1] PCI host bridge to bus 0000:00
> [    3.246412][    T1] pci_bus 0000:00: root bus resource [io  0x0000-0x0=
cf7 window]
> [    3.247411][    T1] pci_bus 0000:00: root bus resource [io  0x0d00-0xf=
fff window]
> [    3.248411][    T1] pci_bus 0000:00: root bus resource [mem 0x000a0000=
-0x000bffff window]
> [    3.249411][    T1] pci_bus 0000:00: root bus resource [mem 0x000d4000=
-0x000d7fff window]
> [    3.250411][    T1] pci_bus 0000:00: root bus resource [mem 0x000d8000=
-0x000dbfff window]
> [    3.251411][    T1] pci_bus 0000:00: root bus resource [mem 0x000dc000=
-0x000dffff window]
> [    3.252411][    T1] pci_bus 0000:00: root bus resource [mem 0x000e0000=
-0x000e3fff window]
> [    3.253411][    T1] pci_bus 0000:00: root bus resource [mem 0x000e4000=
-0x000e7fff window]
> [    3.254411][    T1] pci_bus 0000:00: root bus resource [mem 0xdf200000=
-0xfeafffff window]
> [    3.255411][    T1] pci_bus 0000:00: root bus resource [bus 00-3e]
> [    3.256436][    T1] pci 0000:00:00.0: [8086:0c00] type 00 class 0x0600=
00
> [    3.257508][    T1] pci 0000:00:02.0: [8086:0412] type 00 class 0x0300=
00
> [    3.258416][    T1] pci 0000:00:02.0: reg 0x10: [mem 0xf7800000-0xf7bf=
ffff 64bit]
> [    3.259414][    T1] pci 0000:00:02.0: reg 0x18: [mem 0xe0000000-0xefff=
ffff 64bit pref]
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
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


-- =

Thanks
Yafang
--===============0836161837210345741==--

