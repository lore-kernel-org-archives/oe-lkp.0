Content-Type: multipart/mixed; boundary="===============2001191455531275893=="
MIME-Version: 1.0
From: Schspa Shi <schspa@gmail.com>
To: lkp@lists.01.org
Subject: Re: [cpufreq] 0a020f0eff: WARNING:possible_recursive_locking_detected
Date: Mon, 16 May 2022 10:35:17 +0800
Message-ID: <CAMA88TpnXVY-8X97+VfnoEmVVOqai2xmJqBiSNz3-bp1pnMgFg@mail.gmail.com>
In-Reply-To: <20220515095313.GE10578@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2001191455531275893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 0a020f0efff0138b975eac68aebd2dd7d92df0f7 ("[PATCH v4 2/2] cpufreq=
: make interface functions and lock holding state clear")
> url: https://github.com/intel-lab-lkp/linux/commits/Schspa-Shi/cpufreq-fi=
x-race-on-cpufreq-online/20220512-215524
> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git li=
nux-next
> patch link: https://lore.kernel.org/linux-pm/20220512135231.10076-2-schsp=
a(a)gmail.com
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [   53.507882][  T196] WARNING: possible recursive locking detected
> [   53.509102][  T196] 5.18.0-rc6-00115-g0a020f0efff0 #1 Not tainted
> [   53.510334][  T196] --------------------------------------------
> [   53.511579][  T196] systemd-udevd/196 is trying to acquire lock:
> [ 53.512814][ T196] ffff888111694380 (&policy->rwsem){+.+.}-{3:3}, at: cp=
ufreq_policy_put_kobj (drivers/cpufreq/cpufreq.c:1184)
> [   53.514800][  T196]
> [   53.514800][  T196] but task is already holding lock:
> [ 53.516300][ T196] ffff888111694380 (&policy->rwsem){+.+.}-{3:3}, at: cp=
ufreq_online (drivers/cpufreq/cpufreq.c:1348)

Dear Rafael and Vriesh:

     There is a BUG as reported, I will upload a v6 patch to fix it.


> [   53.518103][  T196]
> [   53.518103][  T196] other info that might help us debug this:
> [   53.521705][  T196]  Possible unsafe locking scenario:
> [   53.521705][  T196]
> [   53.523195][  T196]        CPU0
> [   53.523945][  T196]        ----
> [   53.524704][  T196]   lock(&policy->rwsem);
> [   53.525633][  T196]   lock(&policy->rwsem);
> [   53.526557][  T196]
> [   53.526557][  T196]  *** DEADLOCK ***
> [   53.526557][  T196]
> [   53.528280][  T196]  May be due to missing lock nesting notation
> [   53.528280][  T196]
> [   53.529983][  T196] 3 locks held by systemd-udevd/196:
> [ 53.531030][ T196] #0: ffffffff9fb79450 (cpu_hotplug_lock){++++}-{0:0}, =
at: cpufreq_register_driver (drivers/cpufreq/cpufreq.c:2828)
> [ 53.535189][ T196] #1: ffff88839684a918 (subsys mutex#6){+.+.}-{3:3}, at=
: subsys_interface_register (drivers/base/bus.c:1033)
> [ 53.537294][ T196] #2: ffff888111694380 (&policy->rwsem){+.+.}-{3:3}, at=
: cpufreq_online (drivers/cpufreq/cpufreq.c:1348)
> [   53.539185][  T196]
> [   53.539185][  T196] stack backtrace:
> [   53.541720][  T196] CPU: 1 PID: 196 Comm: systemd-udevd Not tainted 5.=
18.0-rc6-00115-g0a020f0efff0 #1
> [   53.543593][  T196] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [   53.545677][  T196] Call Trace:
> [   53.546400][  T196]  <TASK>
> [ 53.547091][ T196] dump_stack_lvl (lib/dump_stack.c:107 (discriminator 4=
))
> [ 53.548093][ T196] validate_chain.cold (kernel/locking/lockdep.c:2958 ke=
rnel/locking/lockdep.c:3001 kernel/locking/lockdep.c:3790)
> [ 53.549116][ T196] ? check_prev_add (kernel/locking/lockdep.c:3759)
> [ 53.550146][ T196] ? lock_release (kernel/locking/lockdep.c:436 kernel/l=
ocking/lockdep.c:5663)
> [ 53.551118][ T196] ? start_flush_work (kernel/workqueue.c:3057)
> [ 53.552186][ T196] __lock_acquire (kernel/locking/lockdep.c:5029)
> [ 53.553152][ T196] lock_acquire (kernel/locking/lockdep.c:436 kernel/loc=
king/lockdep.c:5643 kernel/locking/lockdep.c:5606)
> [ 53.554068][ T196] ? cpufreq_policy_put_kobj (drivers/cpufreq/cpufreq.c:=
1184)
> [ 53.555173][ T196] ? rcu_read_unlock (include/linux/rcupdate.h:723 (disc=
riminator 5))
> [ 53.556197][ T196] ? mark_held_locks (kernel/locking/lockdep.c:4208)
> [ 53.557189][ T196] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep=
.c:4501)
> [ 53.558486][ T196] ? lock_is_held_type (kernel/locking/lockdep.c:5382 ke=
rnel/locking/lockdep.c:5684)
> [ 53.559880][ T196] down_write (include/linux/instrumented.h:101 include/=
linux/atomic/atomic-instrumented.h:1779 kernel/locking/rwsem.c:254 kernel/l=
ocking/rwsem.c:1258 kernel/locking/rwsem.c:1268 kernel/locking/rwsem.c:1515)
> [ 53.560771][ T196] ? cpufreq_policy_put_kobj (drivers/cpufreq/cpufreq.c:=
1184)
> [ 53.561868][ T196] ? down_write_killable_nested (kernel/locking/rwsem.c:=
1512)
> [ 53.563032][ T196] ? rcu_read_lock_sched_held (kernel/rcu/update.c:125)
> [ 53.564180][ T196] ? kfree (include/trace/events/kmem.h:118 mm/slub.c:45=
41)
> [ 53.565075][ T196] cpufreq_policy_put_kobj (drivers/cpufreq/cpufreq.c:11=
84)
> [ 53.566190][ T196] cpufreq_policy_free (drivers/cpufreq/cpufreq.c:1319)
> [ 53.567207][ T196] cpufreq_online (drivers/cpufreq/cpufreq.c:1556)
> [ 53.569227][ T196] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep=
.c:4501)
> [ 53.570546][ T196] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/i=
rqflags.h:45 arch/x86/include/asm/irqflags.h:80 arch/x86/include/asm/irqfla=
gs.h:138 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
> [ 53.573947][ T196] cpufreq_add_dev (drivers/cpufreq/cpufreq.c:1572)
> [ 53.574901][ T196] subsys_interface_register (drivers/base/bus.c:990 dri=
vers/base/bus.c:1036)
> [ 53.576041][ T196] ? subsys_interface_unregister (drivers/base/bus.c:102=
0)
> [ 53.577226][ T196] cpufreq_register_driver (drivers/cpufreq/cpufreq.c:28=
55)
> [ 53.578302][ T196] acpi_cpufreq_init (drivers/cpufreq/acpi-cpufreq.c:348=
) acpi_cpufreq
> [ 53.579542][ T196] ? acpi_cpufreq_boost_init (drivers/cpufreq/acpi-cpufr=
eq.c:929) acpi_cpufreq
> [ 53.580875][ T196] do_one_initcall (init/main.c:1298)
> [ 53.581831][ T196] ? trace_event_raw_event_initcall_level (init/main.c:1=
289)
> [ 53.583183][ T196] ? rcu_read_lock_sched_held (kernel/rcu/update.c:125)
> [ 53.584633][ T196] ? kasan_unpoison (mm/kasan/shadow.c:108 mm/kasan/shad=
ow.c:142)
> [ 53.585598][ T196] do_init_module (kernel/module.c:3731)
> [ 53.586564][ T196] __do_sys_finit_module (kernel/module.c:4222)
> [ 53.587619][ T196] ? __ia32_sys_init_module (kernel/module.c:4190)
> [ 53.588681][ T196] ? __seccomp_filter (arch/x86/include/asm/bitops.h:214=
 include/asm-generic/bitops/instrumented-non-atomic.h:135 kernel/seccomp.c:=
351 kernel/seccomp.c:378 kernel/seccomp.c:410 kernel/seccomp.c:1183)
> [ 53.589738][ T196] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep=
.c:4501)
> [ 53.593133][ T196] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/en=
try/common.c:80)
> [ 53.594043][ T196] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep=
.c:4501)
> [ 53.595344][ T196] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_=
64.S:115)
> [   53.596430][  T196] RIP: 0033:0x7f4373b51f59
> [ 53.597308][ T196] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00=
 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f=
 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01 48
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0: 00 c3                   add    %al,%bl
>    2: 66 2e 0f 1f 84 00 00    nopw   %cs:0x0(%rax,%rax,1)
>    9: 00 00 00
>    c: 0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
>   11: 48 89 f8                mov    %rdi,%rax
>   14: 48 89 f7                mov    %rsi,%rdi
>   17: 48 89 d6                mov    %rdx,%rsi
>   1a: 48 89 ca                mov    %rcx,%rdx
>   1d: 4d 89 c2                mov    %r8,%r10
>   20: 4d 89 c8                mov    %r9,%r8
>   23: 4c 8b 4c 24 08          mov    0x8(%rsp),%r9
>   28: 0f 05                   syscall
>   2a:*        48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax    =
     <-- trapping instruction
>   30: 73 01                   jae    0x33
>   32: c3                      retq
>   33: 48 8b 0d 07 6f 0c 00    mov    0xc6f07(%rip),%rcx        # 0xc6f41
>   3a: f7 d8                   neg    %eax
>   3c: 64 89 01                mov    %eax,%fs:(%rcx)
>   3f: 48                      rex.W
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0: 48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax
>    6: 73 01                   jae    0x9
>    8: c3                      retq
>    9: 48 8b 0d 07 6f 0c 00    mov    0xc6f07(%rip),%rcx        # 0xc6f17
>   10: f7 d8                   neg    %eax
>   12: 64 89 01                mov    %eax,%fs:(%rcx)
>   15: 48                      rex.W
> [   53.600905][  T196] RSP: 002b:00007fffb900dc68 EFLAGS: 00000246 ORIG_R=
AX: 0000000000000139
> [   53.602564][  T196] RAX: ffffffffffffffda RBX: 000055ccf555cd00 RCX: 0=
0007f4373b51f59
> [   53.604332][  T196] RDX: 0000000000000000 RSI: 00007f4373a56cad RDI: 0=
000000000000006
> [   53.605910][  T196] RBP: 00007f4373a56cad R08: 0000000000000000 R09: 0=
00055ccf5541be0
> [   53.607549][  T196] R10: 0000000000000006 R11: 0000000000000246 R12: 0=
000000000000000
> [   53.609140][  T196] R13: 000055ccf5567130 R14: 0000000000020000 R15: 0=
00055ccf555cd00
> [   53.610725][  T196]  </TASK>
> [  OK  ] Started D-Bus System Message Bus.
> [  OK  ] Started Daily apt download activities.
> [  OK  ] Started Daily apt upgrade and clean activities.
> Starting System Logging Service...
> [  OK  ] Started Daily rotation of log files.
> [  OK  ] Reached target Timers.
> Starting LSB: OpenIPMI Driver init script...
> [  OK  ] Started Helper to synchronize boot up for ifupdown.
> [   54.028963][  T200] piix4_smbus 0000:00:01.3: SMBus Host Controller at=
 0x700, revision 0
> Starting LSB: Load kernel image with kexec...
> Starting Raise network interfaces...
> [  OK  ] Started Login Service.
> [   54.258656][  T225] IPMI message handler: version 39.2
> [   54.291478][  T225] ipmi device interface
> [  OK  ] Started LSB: Load kernel image with kexec.
> [  OK  ] Started Raise network interfaces.
> [   54.379602][  T178] RAPL PMU: API unit is 2^-32 Joules, 0 fixed counte=
rs, 10737418240 ms ovfl timer
> [  OK  ] Reached target Network.
> [   54.413487][  T199] libata version 3.00 loaded.
> Starting Permit User Sessions...
> [   54.460902][  T244] ipmi_si: IPMI System Interface driver
> [   54.462665][  T244] ipmi_si: Unable to find any System Interface(s)
> Starting /etc/rc.local Compatibility...
> [   54.500918][  T198] parport_pc 00:03: reported by Plug and Play ACPI
> Starting OpenBSD Secure Shell server...
> [   54.566683][  T198] parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE]
> Starting LKP bootstrap...
> [FAILED] Failed to start LSB: OpenIPMI Driver init script.
> See 'systemctl status openipmi.service' for details.
> [   54.508949] rc.local[250]: PATH=3D/usr/local/sbin:/usr/local/bin:/usr/=
sbin:/usr/bin:/sbin:/bin:/lkp/lkp/src/bin
> [  OK  ] Started Permit User Sessions.
> [  OK  ] Started /etc/rc.local Compatibility.
> [   54.685664][  T199] ata_piix 0000:00:01.1: version 2.13
> [   54.579006] rc.local[250]: /lkp/lkp/src/bin/lkp-setup-rootfs: 78: /lkp=
/lkp/src/bin/lkp-setup-rootfs: cannot create /sys/devices/system/cpu/microc=
ode/reload: Directory nonexistent
> [  OK  ] Started Getty on tty1.
> [  OK  ] Reached target Login Prompts.
> [  OK  ] Started OpenBSD Secure Shell server.
> [   54.848488][  T199] scsi host0: ata_piix
> [   54.890906][  T199] scsi host1: ata_piix
> [   54.901762][  T199] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0x=
c040 irq 14
>
>
> To reproduce:
>
>         # build kernel
>       cd linux
>       cp config-5.18.0-rc6-00115-g0a020f0efff0 .config
>       make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 olddefconfig prepare=
 modules_prepare bzImage modules
>       make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<=
mod-install-dir> modules_install
>       cd <mod-install-dir>
>       find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
--===============2001191455531275893==--

