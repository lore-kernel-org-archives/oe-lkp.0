Content-Type: multipart/mixed; boundary="===============7686430359145333363=="
MIME-Version: 1.0
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: lkp@lists.01.org
Subject: Re: [bonding] 86838ad7bd: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mutex.c
Date: Thu, 21 Feb 2019 21:54:52 +0800
Message-ID: <4407774a-eda4-5d8d-0b34-6f71e12f1c31@huawei.com>
In-Reply-To: <20190221133259.74etmwq7gadltqew@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7686430359145333363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Please ignore this patch, this is unacceptable, thanks.

On 2019/2/21 21:32, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-8):
>
> commit: 86838ad7bde0d7741b272670d94d535580173d95 ("[RFC PATCH] bonding: u=
se mutex lock in bond_get_stats()")
> url: https://github.com/0day-ci/linux/commits/Kefeng-Wang/bonding-use-mut=
ex-lock-in-bond_get_stats/20190216-030058
>
>
> in testcase: rcutorture
> with following parameters:
>
> 	runtime: 300s
> 	test: cpuhotplug
> 	torture_type: srcu
>
> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 1G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------------------------------------=
-----+------------+------------+
> |                                                                        =
     | f9bcc9f3ee | 86838ad7bd |
> +------------------------------------------------------------------------=
-----+------------+------------+
> | boot_successes                                                         =
     | 50         | 24         |
> | boot_failures                                                          =
     | 10         | 41         |
> | invoked_oom-killer:gfp_mask=3D0x                                       =
       | 1          |            |
> | Mem-Info                                                               =
     | 1          |            |
> | Out_of_memory:Kill_process                                             =
     | 1          |            |
> | BUG:kernel_in_stage                                                    =
     | 6          | 8          |
> | BUG:kernel_reboot-without-warning_in_early-boot_stage                  =
     | 2          |            |
> | BUG:kernel_hang_in_test_stage                                          =
     | 1          | 1          |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mut=
ex.c | 0          | 32         |
> +------------------------------------------------------------------------=
-----+------------+------------+
>
>
>
> [   17.153431] BUG: sleeping function called from invalid context at kern=
el/locking/mutex.c:908
> [   17.157556] in_atomic(): 0, irqs_disabled(): 0, pid: 599, name: dropbe=
arkey
> [   17.159141] 2 locks held by dropbearkey/599:
> [   17.159779]  #0: (____ptrval____) (&p->lock){+.+.}, at: seq_read+0x41/=
0x3f0
> [   17.160802]  #1: (____ptrval____) (rcu_read_lock){....}, at: dev_seq_s=
tart+0x5/0x110
> [   17.161928] Preemption disabled at:
> [   17.161935] [<ffffffff818eafe0>] __mutex_lock+0x50/0x980
> [   17.163150] CPU: 1 PID: 599 Comm: dropbearkey Not tainted 5.0.0-rc5-00=
320-g86838ad #1
> [   17.164213] Call Trace:
> [   17.164571]  dump_stack+0x67/0x90
> [   17.165051]  ___might_sleep.cold.14+0xf0/0x106
> [   17.165675]  ? bond_get_stats+0x3b/0x260
> [   17.166232]  __mutex_lock+0x46/0x980
> [   17.166743]  ? kvm_clock_read+0x14/0x30
> [   17.167288]  ? validate_chain+0xb5/0xad0
> [   17.167936]  ? number+0x2fc/0x340
> [   17.168416]  ? bond_get_stats+0x3b/0x260
> [   17.168966]  bond_get_stats+0x3b/0x260
> [   17.169500]  ? seq_vprintf+0x30/0x50
> [   17.170007]  ? seq_printf+0x43/0x50
> [   17.170498]  ? validate_chain+0xb5/0xad0
> [   17.171136]  ? dev_seq_printf_stats+0x9a/0xb0
> [   17.171736]  dev_get_stats+0x55/0xb0
> [   17.172221]  dev_seq_printf_stats+0x1f/0xb0
> [   17.172817]  dev_seq_show+0x10/0x30
> [   17.173289]  seq_read+0x2cd/0x3f0
> [   17.173777]  proc_reg_read+0x36/0x60
> [   17.174288]  __vfs_read+0x23/0x160
> [   17.174779]  ? _copy_to_user+0x5e/0x70
> [   17.175312]  ? entry_INT80_compat+0x7c/0x90
> [   17.175903]  vfs_read+0xa6/0x140
> [   17.176366]  ksys_read+0x42/0xa0
> [   17.176834]  do_int80_syscall_32+0x4f/0x150
> [   17.177418]  entry_INT80_compat+0x84/0x90
> LKP: HOSTNAME vm-snb-openwrt-ia32-524, MAC , kernel 5.0.0-rc5-00320-g8683=
8ad 1, serial console /dev/ttyS0
> [   18.404764] Kernel tests: Boot OK!
> [   18.404764] LKP: waiting for network...
> [   19.256982] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Con=
trol: RX
> [   19.271235] _warn_unseeded_randomness: 1329 callbacks suppressed
> [   19.271244] random: get_random_u64 called from arch_pick_mmap_layout+0=
x65/0x170 with crng_init=3D0
> [   19.273507] random: get_random_u64 called from arch_pick_mmap_layout+0=
x10e/0x170 with crng_init=3D0
> [   19.274790] random: get_random_u64 called from load_elf_binary+0x87d/0=
x1120 with crng_init=3D0
> [   20.407748] /lkp/lkp/src/bin/run-lkp
> [   20.407748] RESULT_ROOT=3D/result/rcutorture/300s-cpuhotplug-srcu/vm-s=
nb-openwrt-ia32/openwrt-i386-2016-03-16.cgz/x86_64-randconfig-s4-02200400/g=
cc-8/86838ad7bde0d7741b272670d94d535580173d95/3
> [   20.407748] job=3D/lkp/jobs/scheduled/vm-snb-openwrt-ia32-524/rcutortu=
re-300s-cpuhotplug-srcu-openwrt-i386-2016-03-16.cgz-20190220-89648-gjivxf-3=
.yaml
> [   20.407748] run-job /lkp/jobs/scheduled/vm-snb-openwrt-ia32-524/rcutor=
ture-300s-cpuhotplug-srcu-openwrt-i386-2016-03-16.cgz-20190220-89648-gjivxf=
-3.yaml
> [   20.407748] /bin/busybox wget -q http://inn:80/~lkp/cgi-bin/lkp-jobfil=
e-append-var?job_file=3D/lkp/jobs/scheduled/vm-snb-openwrt-ia32-524/rcutort=
ure-300s-cpuhotplug-srcu-openwrt-i386-2016-03-16.cgz-20190220-89648-gjivxf-=
3.yaml&job_state=3Drunning -O /dev/null
> [   20.407748] target ucode: =

> [   20.416008] wget: can't connect to remote host (192.168.1.1): Network =
is unreachable
> [   20.416008] /lkp/lkp/src/monitors/heartbeat: line 9: vmstat: not found
> [   20.416008] /lkp/lkp/src/monitors/heartbeat: exec: line 23: vmstat: no=
t found
> [   20.678602] _warn_unseeded_randomness: 431 callbacks suppressed
> [   20.678610] random: get_random_u64 called from arch_pick_mmap_layout+0=
x65/0x170 with crng_init=3D0
> [   20.681816] random: get_random_u64 called from arch_pick_mmap_layout+0=
x10e/0x170 with crng_init=3D0
> [   20.683622] random: get_random_u64 called from load_elf_binary+0x87d/0=
x1120 with crng_init=3D0
> [   21.418765] BusyBox v1.23.2 (2016-01-02 14:31:17 CET) multi-call binar=
y.
> [   21.418765] =

> [   21.418765] Usage: time [-v] PROG ARGS
> [   21.418765] =

> [   21.418765] Run PROG, display resource usage when it exits
> [   21.418765] =

> [   21.418765] 	-v	Verbose
> [   21.418765] =

> [   21.418765] failed to load rcutorture module, try to enable CONFIG_RCU=
_TORTURE_TEST and build rcutorture.ko
> [   21.418765] wget: can't connect to remote host (192.168.1.1): Network =
is unreachable
> [   21.423344] 2019-02-20 06:29:25 modprobe rcutorture onoff_interval=3D3=
 onoff_holdoff=3D30 torture_type=3Dsrcu
> [   21.423344] /bin/busybox wget -q http://inn:80/~lkp/cgi-bin/lkp-jobfil=
e-append-var?job_file=3D/lkp/jobs/scheduled/vm-snb-openwrt-ia32-524/rcutort=
ure-300s-cpuhotplug-srcu-openwrt-i386-2016-03-16.cgz-20190220-89648-gjivxf-=
3.yaml&job_state=3Dpost_run -O /dev/null
> [   21.818029] _warn_unseeded_randomness: 210 callbacks suppressed
> [   21.818037] random: get_random_u64 called from arch_pick_mmap_layout+0=
x65/0x170 with crng_init=3D0
> [   21.821714] random: get_random_u64 called from arch_pick_mmap_layout+0=
x10e/0x170 with crng_init=3D0
> [   21.823918] random: get_random_u64 called from load_elf_binary+0x87d/0=
x1120 with crng_init=3D0
> [   22.190264] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Con=
trol: RX
> [   22.444763] kill 804 cat /proc/kmsg =

> [   22.444763] wait for background processes: 812 810 oom-killer meminfo
>
> Elapsed time: 20
>
> qemu-img create -f qcow2 disk-vm-snb-openwrt-ia32-524-0 256G
> qemu-img create -f qcow2 disk-vm-snb-openwrt-ia32-524-1 256G
>
> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu SandyBridge
> 	-kernel $kernel
> 	-initrd initrd-vm-snb-openwrt-ia32-524
> 	-m 1024
> 	-smp 2
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-drive file=3Ddisk-vm-snb-openwrt-ia32-524-0,media=3Ddisk,if=3Dvirtio
> 	-drive file=3Ddisk-vm-snb-openwrt-ia32-524-1,media=3Ddisk,if=3Dvirtio
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
>
>
> Thanks,
> Rong Chen


--===============7686430359145333363==--

