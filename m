Content-Type: multipart/mixed; boundary="===============7460187803167058291=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched] 86d68266c6: BUG: spinlock lockup suspected on CPU#1, rcu_sched/7
Date: Thu, 02 Jun 2016 09:54:47 +0200
Message-ID: <CAKfTPtBmtn4TZR3AO2jdpZ8FWcx+sLLjVtWQtB7E0dP2mbWU8Q@mail.gmail.com>
In-Reply-To: <20160602062320.GA30850@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7460187803167058291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

I can't find :
commit 86d68266c6210a86a0e69f6cf242803609aba19b ("sched: fix first
task of a task group is attached twice")
on my git tree but only:
commit a812206263c4c4c84bf9b6f038a732b4d09dd9f0 ("sched: fix first
task of a task group is attached twice")

It seems that you have tested an old version of the commit and the new
one should fix the problem

Thanks,
Vincent

On 2 June 2016 at 08:23, kernel test robot <xiaolong.ye@intel.com> wrote:
>
>
> FYI, we noticed the following commit:
>
> https://git.linaro.org/people/vincent.guittot/kernel.git sched/pelt
> commit 86d68266c6210a86a0e69f6cf242803609aba19b ("sched: fix first task o=
f a task group is attached twice")
>
>
> on test machine: vm-kbuild-yocto-i386: 2 threads qemu-system-i386 -enable=
-kvm with 320M memory
>
> caused below changes:
>
>
> +----------------------------------------------------------------+-------=
-----+------------+
> |                                                                | ef0491=
ea17 | 86d68266c6 |
> +----------------------------------------------------------------+-------=
-----+------------+
> | boot_successes                                                 | 12    =
     | 0          |
> | boot_failures                                                  | 7     =
     | 21         |
> | BUG:workqueue_lockup-pool_cpus=3D#node=3D#flags=3D#nice=3D#stuck_for#s =
| 3          |            |
> | IP-Config:Auto-configuration_of_network_failed                 | 4     =
     |            |
> | BUG:kernel_test_hang                                           | 0     =
     | 10         |
> | BUG:spinlock_lockup_suspected_on_CPU                           | 0     =
     | 11         |
> | EIP_is_at_set_task_rq_fair                                     | 0     =
     | 11         |
> | EIP_is_at__default_send_IPI_dest_field                         | 0     =
     | 11         |
> | backtrace:schedule_timeout                                     | 0     =
     | 1          |
> | backtrace:torture_shuffle                                      | 0     =
     | 3          |
> | backtrace:cpu_startup_entry                                    | 0     =
     | 2          |
> | backtrace:smpboot_thread_fn                                    | 0     =
     | 1          |
> +----------------------------------------------------------------+-------=
-----+------------+
>
>
>
> [   69.565670] Freeing unused kernel memory: 2248K (cabf9000 - cae2b000)
> [   69.570234] Write protecting the kernel text: 18844k
> [   69.615691] Write protecting the kernel read-only data: 6820k
> [   69.633606] BUG: spinlock lockup suspected on CPU#1, rcu_sched/7
> [   69.633606]  lock: 0xd36ba980, .magic: dead4ead, .owner: init/1, .owne=
r_cpu: 0
> [   69.633606] CPU: 1 PID: 7 Comm: rcu_sched Not tainted 4.6.0-rc7-00127-=
g86d6826 #1
> [   69.633606]  00000000 c0059cd4 c9433829 c00303a4 d36ba980 c0059d00 c90=
fffd7 ca79453c
> [   69.633606]  d36ba980 dead4ead c00303a4 00000001 00000000 d36ba980 a08=
bb370 00000000
> [   69.633606]  c0059d1c c910036a a08bb370 00000000 d36ba990 d36ba980 000=
00046 c0059d40
> [   69.633606] Call Trace:
> [   69.633606]  [<c9433829>] dump_stack+0x162/0x1f9
> [   69.633606]  [<c90fffd7>] spin_dump+0xe7/0x160
> [   69.633606]  [<c910036a>] do_raw_spin_lock+0x21a/0x330
> [   69.633606]  [<ca263581>] _raw_spin_lock_irqsave+0x131/0x180
> [   69.633606]  [<c90cebd3>] ? load_balance+0x3e3/0x10d0
> [   69.633606]  [<c90cebd3>] load_balance+0x3e3/0x10d0
> [   69.633606]  [<c904baea>] ? kvm_sched_clock_read+0x3a/0x70
> [   69.633606]  [<c9019766>] ? sched_clock+0x16/0x30
> [   69.633606]  [<c90c1bfd>] ? sched_clock_local+0x2d/0x1e0
> [   69.633606]  [<c90d08a7>] pick_next_task_fair+0x947/0xd50
> [   69.633606]  [<ca259808>] __schedule+0x778/0xd90
> [   69.633606]  [<c948adbc>] ? debug_object_activate+0x23c/0x370
> [   69.633606]  [<ca26250c>] ? schedule_timeout+0x21c/0x290
> [   69.633606]  [<ca259edd>] schedule+0x3d/0x80
> [   69.633606]  [<ca26252d>] schedule_timeout+0x23d/0x290
> [   69.633606]  [<c9130270>] ? detach_if_pending+0x120/0x120
> [   69.633606]  [<c9129aaf>] rcu_gp_kthread+0x85f/0x10f0
> [   69.633606]  [<c9129250>] ? force_qs_rnp+0x250/0x250
> [   69.633606]  [<c90a603c>] kthread+0x13c/0x150
> [   69.633606]  [<ca264e51>] ret_from_kernel_thread+0x21/0x40
> [   69.633606]  [<c90a5f00>] ? __kthread_unpark+0xf0/0xf0
> [   69.633606] Sending NMI to all CPUs:
> [   69.633606] NMI backtrace for cpu 0
> [   69.633606] CPU: 0 PID: 1 Comm: init Not tainted 4.6.0-rc7-00127-g86d6=
826 #1
> [   69.633606] task: c0030000 ti: c0032000 task.ti: c0032000
> [   69.633606] EIP: 0060:[<c90cc942>] EFLAGS: 00000046 CPU: 0
> [   69.633606] EIP is at set_task_rq_fair+0xd2/0x420
> [   69.633606] EAX: 00000000 EBX: 00000000 ECX: cf990d18 EDX: d36ba9d4
> [   69.633606] ESI: 3664896f EDI: 00000010 EBP: c0033eec ESP: c0033eb8
> [   69.633606]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
> [   69.633606] CR0: 80050033 CR2: 47ef2e50 CR3: 1092dae0 CR4: 000006b0
> [   69.633606] Stack:
> [   69.633606]  c0030080 3664896f 00000010 00000000 00000000 00000000 000=
00000 00000001
> [   69.633606]  00000010 00000010 c0030000 00000000 d0353e40 c0033f00 c90=
ccfcd c0030000
> [   69.633606]  d0353e40 d36ba980 c0033f28 c90c0c6a 00000002 00000001 c00=
30000 00000046
> [   69.633606] Call Trace:
> [   69.633606]  [<c90ccfcd>] task_move_group_fair+0x5d/0xe0
> [   69.633606]  [<c90c0c6a>] sched_move_task+0x1ca/0x370
> [   69.633606]  [<c90e0cbd>] autogroup_move_group+0x1bd/0x2b0
> [   69.633606]  [<c90e1062>] sched_autogroup_create_attach+0x232/0x380
> [   69.633606]  [<c90f41f7>] ? trace_hardirqs_on+0x27/0x40
> [   69.633606]  [<c908f521>] sys_setsid+0x1a1/0x1f0
> [   69.633606]  [<c9001e6f>] do_int80_syscall_32+0xbf/0x2d0
> [   69.633606]  [<ca264f6c>] entry_INT80_32+0x2c/0x2c
> [   69.633606] Code: 72 44 8b 7a 48 83 05 d8 67 e8 ca 01 83 15 dc 67 e8 c=
a 00 89 45 e8 8b 41 48 31 f3 89 75 d0 89 45 e4 8b 45 ec 89 7d d4 31 f8 09 c=
3 <75> b4 8b 75 dc 8b 7d d8 33 75 e8 33 7d e4 09 fe 75 a4 8b 5d cc
> [   69.633606] NMI backtrace for cpu 1
> [   69.633606] CPU: 1 PID: 7 Comm: rcu_sched Not tainted 4.6.0-rc7-00127-=
g86d6826 #1
> [   69.633606] task: c0056000 ti: c0058000 task.ti: c0058000
> [   69.633606] EIP: 0060:[<c903bfe2>] EFLAGS: 00000046 CPU: 1
> [   69.633606] EIP is at __default_send_IPI_dest_field+0x132/0x160
> [   69.633606] EAX: 00001f81 EBX: 00000000 ECX: fffff000 EDX: 00000000
> [   69.633606] ESI: 00000002 EDI: 00000c00 EBP: c0059cb4 ESP: c0059ca8
> [   69.633606]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [   69.633606] CR0: 80050033 CR2: 00000000 CR3: 0ae34000 CR4: 000006b0
> [   69.633606] Stack:
> [   69.633606]  00000003 00000046 00000002 c0059cc8 c903c861 00002710 000=
00001 c903e570
> [   69.633606]  c0059cd0 c903e58f c0059cf8 c943b7f0 ca7c08de ca873dc7 d36=
ba980 dead4ead
> [   69.633606]  c00303a4 d36ba980 a08bb370 00000000 c0059d00 c903e64e c00=
59d1c c9100382
> [   69.633606] Call Trace:
> [   69.633606]  [<c903c861>] default_send_IPI_mask_logical+0xd1/0x160
> [   69.633606]  [<c903e570>] ? irq_force_complete_move+0x1e0/0x1e0
> [   69.633606]  [<c903e58f>] nmi_raise_cpu_backtrace+0x1f/0x30
> [   69.633606]  [<c943b7f0>] nmi_trigger_all_cpu_backtrace+0x1b0/0x410
> [   69.633606]  [<c903e64e>] arch_trigger_all_cpu_backtrace+0x1e/0x30
> [   69.633606]  [<c9100382>] do_raw_spin_lock+0x232/0x330
> [   69.633606]  [<ca263581>] _raw_spin_lock_irqsave+0x131/0x180
> [   69.633606]  [<c90cebd3>] ? load_balance+0x3e3/0x10d0
> [   69.633606]  [<c90cebd3>] load_balance+0x3e3/0x10d0
> [   69.633606]  [<c904baea>] ? kvm_sched_clock_read+0x3a/0x70
> [   69.633606]  [<c9019766>] ? sched_clock+0x16/0x30
> [   69.633606]  [<c90c1bfd>] ? sched_clock_local+0x2d/0x1e0
> [   69.633606]  [<c90d08a7>] pick_next_task_fair+0x947/0xd50
> [   69.633606]  [<ca259808>] __schedule+0x778/0xd90
> [   69.633606]  [<c948adbc>] ? debug_object_activate+0x23c/0x370
> [   69.633606]  [<ca26250c>] ? schedule_timeout+0x21c/0x290
> [   69.633606]  [<ca259edd>] schedule+0x3d/0x80
> [   69.633606]  [<ca26252d>] schedule_timeout+0x23d/0x290
> [   69.633606]  [<c9130270>] ? detach_if_pending+0x120/0x120
> [   69.633606]  [<c9129aaf>] rcu_gp_kthread+0x85f/0x10f0
> [   69.633606]  [<c9129250>] ? force_qs_rnp+0x250/0x250
> [   69.633606]  [<c90a603c>] kthread+0x13c/0x150
> [   69.633606]  [<ca264e51>] ret_from_kernel_thread+0x21/0x40
> [   69.633606]  [<c90a5f00>] ? __kthread_unpark+0xf0/0xf0
> [   69.633606] Code: 05 70 60 e5 ca 01 83 15 74 60 e5 ca 00 83 c1 01 83 d=
3 00 89 0d 68 5f e5 ca 89 1d 6c 5f e5 ca 8b 0d 18 a1 92 ca 89 b9 00 c3 ff f=
f <83> c0 01 83 d2 00 83 05 78 60 e5 ca 01 a3 70 5f e5 ca 5b 89 15
>
> Elapsed time: 390
> qemu-system-i386 -enable-kvm -kernel /pkg/linux/i386-randconfig-b0-052620=
19/gcc-6/86d68266c6210a86a0e69f6cf242803609aba19b/vmlinuz-4.6.0-rc7-00127-g=
86d6826 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-kbuild=
-yocto-i386-26/rand_boot-1-yocto-minimal-i386.cgz-i386-randconfig-b0-052620=
19-86d68266c6210a86a0e69f6cf242803609aba19b-20160527-100557-1afgxdi-0.yaml =
ARCH=3Di386 kconfig=3Di386-randconfig-b0-05262019 branch=3Dlinux-devel/deve=
l-spot-201605261922 commit=3D86d68266c6210a86a0e69f6cf242803609aba19b BOOT_=
IMAGE=3D/pkg/linux/i386-randconfig-b0-05262019/gcc-6/86d68266c6210a86a0e69f=
6cf242803609aba19b/vmlinuz-4.6.0-rc7-00127-g86d6826 max_uptime=3D600 RESULT=
_ROOT=3D/result/boot/1/vm-kbuild-yocto-i386/yocto-minimal-i386.cgz/i386-ran=
dconfig-b0-05262019/gcc-6/86d68266c6210a86a0e69f6cf242803609aba19b/0 LKP_SE=
RVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug apic=3D=
debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 =
softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 pro=
mpt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw ip=3D=
::::vm-kbuild-yocto-i386-26::dhcp drbd.minor_count=3D8'  -initrd /fs/sdd1/i=
nitrd-vm-kbuild-yocto-i386-26 -m 320 -smp 2 -device e1000,netdev=3Dnet0 -ne=
tdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -watchdog i6300esb -rtc bas=
e=3Dlocaltime -drive file=3D/fs/sdd1/disk0-vm-kbuild-yocto-i386-26,media=3D=
disk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-kbuild-yocto-i386-26 -seria=
l file:/dev/shm/kboot/serial-vm-kbuild-yocto-i386-26 -daemonize -display no=
ne -monitor null
>
>
> FYI, raw QEMU command line is:
>
>         qemu-system-i386 -enable-kvm -kernel /pkg/linux/i386-randconfig-b=
0-05262019/gcc-6/86d68266c6210a86a0e69f6cf242803609aba19b/vmlinuz-4.6.0-rc7=
-00127-g86d6826 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/v=
m-kbuild-yocto-i386-26/rand_boot-1-yocto-minimal-i386.cgz-i386-randconfig-b=
0-05262019-86d68266c6210a86a0e69f6cf242803609aba19b-20160527-100557-1afgxdi=
-0.yaml ARCH=3Di386 kconfig=3Di386-randconfig-b0-05262019 branch=3Dlinux-de=
vel/devel-spot-201605261922 commit=3D86d68266c6210a86a0e69f6cf242803609aba1=
9b BOOT_IMAGE=3D/pkg/linux/i386-randconfig-b0-05262019/gcc-6/86d68266c6210a=
86a0e69f6cf242803609aba19b/vmlinuz-4.6.0-rc7-00127-g86d6826 max_uptime=3D60=
0 RESULT_ROOT=3D/result/boot/1/vm-kbuild-yocto-i386/yocto-minimal-i386.cgz/=
i386-randconfig-b0-05262019/gcc-6/86d68266c6210a86a0e69f6cf242803609aba19b/=
0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug=
 apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 pan=
ic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=
=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal =
rw ip=3D::::vm-kbuild-yocto-i386-26::dhcp drbd.minor_count=3D8'  -initrd /f=
s/sdd1/initrd-vm-kbuild-yocto-i386-26 -m 320 -smp 2 -device e1000,netdev=3D=
net0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -watchdog i6300esb =
-rtc base=3Dlocaltime -drive file=3D/fs/sdd1/disk0-vm-kbuild-yocto-i386-26,=
media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-kbuild-yocto-i386-2=
6 -serial file:/dev/shm/kboot/serial-vm-kbuild-yocto-i386-26 -daemonize -di=
splay none -monitor null
>
>
>
>
>
> Thanks,
> Xiaolong

--===============7460187803167058291==--

