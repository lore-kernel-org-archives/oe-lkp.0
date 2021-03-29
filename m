Content-Type: multipart/mixed; boundary="===============2651754684417116606=="
MIME-Version: 1.0
From: Alistair Popple <apopple@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [kernel/resource] cf1e4e12c9: WARNING:possible_recursive_locking_detected
Date: Mon, 29 Mar 2021 18:53:33 +1100
Message-ID: <1783395.ZrcDVnWPF7@nvdebian>
In-Reply-To: <20210329054230.GB3633@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2651754684417116606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Not sure why I didn't hit this in testing but the problem is obvious: I mis=
sed =

that revoke_iomem() calls devmem_is_allowed() which on x86 calls =

region_intersects(). I guess I must have forgotten to do a boot test with =

CONFIG_IO_STRICT_DEVMEM. Will put a fix together.

 - Alistair

On Monday, 29 March 2021 4:42:30 PM AEDT kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: cf1e4e12c95dec0bb945df3eb138190fc353460f ("[PATCH v2] kernel/
resource: Fix locking in request_free_mem_region")
> url: https://github.com/0day-ci/linux/commits/Alistair-Popple/kernel-reso=
urce-Fix-locking-in-request_free_mem_region/20210326-092150
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git =

a74e6a014c9d4d4161061f770c9b4f98372ac778
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/
backtrace):
> =

> =

> +----------------------------------------------+------------+------------+
> |                                              | a74e6a014c | cf1e4e12c9 |
> +----------------------------------------------+------------+------------+
> | boot_successes                               | 6          | 0          |
> | boot_failures                                | 0          | 6          |
> | WARNING:possible_recursive_locking_detected  | 0          | 6          |
> | INFO:rcu_sched_self-detected_stall_on_CPU    | 0          | 6          |
> | INFO:rcu_sched_detected_stalls_on_CPUs/tasks | 0          | 1          |
> | EIP:queued_read_lock_slowpath                | 0          | 1          |
> +----------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [    9.616229] WARNING: possible recursive locking detected
> [    9.617758] 5.12.0-rc2-00297-gcf1e4e12c95d #1 Not tainted
> [    9.617758] --------------------------------------------
> [    9.617758] swapper/0/1 is trying to acquire lock:
> [    9.617758] 41bb9674 (resource_lock){++++}-{2:2}, at: region_intersect=
s =

(kbuild/src/consumer/kernel/resource.c:534 kbuild/src/consumer/kernel/
resource.c:580)
> [    9.619753]
> [    9.619753] but task is already holding lock:
> [    9.619753] 41bb9674 (resource_lock){++++}-{2:2}, at: __request_region =

(kbuild/src/consumer/kernel/resource.c:1188 kbuild/src/consumer/kernel/
resource.c:1255)
> [    9.621757]
> [    9.621757] other info that might help us debug this:
> [    9.621757]  Possible unsafe locking scenario:
> [    9.621757]
> [    9.621757]        CPU0
> [    9.621757]        ----
> [    9.623721]   lock(resource_lock);
> [    9.623747]   lock(resource_lock);
> [    9.623747]
> [    9.623747]  *** DEADLOCK ***
> [    9.623747]
> [    9.623747]  May be due to missing lock nesting notation
> [    9.623747]
> [    9.625725] 2 locks held by swapper/0/1:
> [    9.625759] #0: 42e1f160 (&dev->mutex){....}-{3:3}, at: device_lock =

(kbuild/src/consumer/include/linux/device.h:741)
> [    9.625759] #1: 41bb9674 (resource_lock){++++}-{2:2}, at: =

__request_region (kbuild/src/consumer/kernel/resource.c:1188 kbuild/src/
consumer/kernel/resource.c:1255)
> [    9.625759]
> [    9.625759] stack backtrace:
> [    9.627748] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc2-00297-
gcf1e4e12c95d #1
> [    9.627748] Call Trace:
> [    9.627748] ? dump_stack (kbuild/src/consumer/lib/dump_stack.c:122)
> [    9.627748] ? validate_chain (kbuild/src/consumer/kernel/locking/
lockdep.c:2829 kbuild/src/consumer/kernel/locking/lockdep.c:2872 kbuild/src/
consumer/kernel/locking/lockdep.c:3661)
> [    9.629761] ? __lock_acquire (kbuild/src/consumer/kernel/locking/
lockdep.c:4900)
> [    9.629761] ? lock_acquire (kbuild/src/consumer/kernel/locking/lockdep=
.c:
437 kbuild/src/consumer/kernel/locking/lockdep.c:5512 kbuild/src/consumer/
kernel/locking/lockdep.c:5475)
> [    9.629761] ? region_intersects (kbuild/src/consumer/kernel/resource.c:
534 kbuild/src/consumer/kernel/resource.c:580)
> [    9.629761] ? lock_acquire (kbuild/src/consumer/kernel/locking/lockdep=
.c:
437 kbuild/src/consumer/kernel/locking/lockdep.c:5512 kbuild/src/consumer/
kernel/locking/lockdep.c:5475)
> [    9.629761] ? lock_is_held_type (kbuild/src/consumer/kernel/locking/
lockdep.c:5253 kbuild/src/consumer/kernel/locking/lockdep.c:5549)
> [    9.631752] ? _raw_read_lock (kbuild/src/consumer/include/linux/
rwlock_api_smp.h:150 kbuild/src/consumer/kernel/locking/spinlock.c:223)
> [    9.631752] ? region_intersects (kbuild/src/consumer/kernel/resource.c:
534 kbuild/src/consumer/kernel/resource.c:580)
> [    9.631752] ? devmem_is_allowed (kbuild/src/consumer/arch/x86/mm/init.=
c:
823)
> [    9.633761] ? __request_region (kbuild/src/consumer/kernel/resource.c:
1157 kbuild/src/consumer/kernel/resource.c:1232 kbuild/src/consumer/kernel/
resource.c:1255)
> [    9.633761] ? wake_up_q (kbuild/src/consumer/kernel/sched/core.c:5542)
> [    9.633761] ? __pci_request_region (kbuild/src/consumer/drivers/pci/
pci.c:3848 (discriminator 2))
> [    9.633761] ? __pci_request_selected_regions (kbuild/src/consumer/
drivers/pci/pci.c:3915)
> [    9.635756] ? pci_request_selected_regions (kbuild/src/consumer/driver=
s/
pci/pci.c:3938)
> [    9.637732] ? e1000_probe (kbuild/src/consumer/drivers/net/ethernet/
intel/e1000/e1000_main.c:948)
> [    9.637767] ? trace_hardirqs_on (kbuild/src/consumer/kernel/trace/
trace_preemptirq.c:51 (discriminator 19))
> [    9.637767] ? __pm_runtime_resume (kbuild/src/consumer/drivers/base/
power/runtime.c:1093)
> [    9.637767] ? e1000_io_slot_reset (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:922)
> [    9.637767] ? pci_device_probe (kbuild/src/consumer/drivers/pci/pci-
driver.c:309 kbuild/src/consumer/drivers/pci/pci-driver.c:366 kbuild/src/
consumer/drivers/pci/pci-driver.c:391 kbuild/src/consumer/drivers/pci/pci-
driver.c:434)
> [    9.639749] ? really_probe (kbuild/src/consumer/drivers/base/dd.c:555)
> [    9.639749] ? driver_probe_device (kbuild/src/consumer/drivers/base/dd=
.c:
740)
> [    9.639749] ? device_driver_attach (kbuild/src/consumer/drivers/base/
dd.c:1015)
> [    9.639749] ? __driver_attach (kbuild/src/consumer/drivers/base/dd.c:
1094)
> [    9.639749] ? bus_for_each_dev (kbuild/src/consumer/drivers/base/bus.c:
305)
> [    9.641762] ? driver_attach (kbuild/src/consumer/drivers/base/dd.c:110=
9)
> [    9.641762] ? device_driver_attach (kbuild/src/consumer/drivers/base/
dd.c:1047)
> [    9.641762] ? bus_add_driver (kbuild/src/consumer/drivers/base/bus.c:6=
23)
> [    9.641762] ? driver_register (kbuild/src/consumer/drivers/base/driver=
.c:
171)
> [    9.643749] ? __pci_register_driver (kbuild/src/consumer/drivers/pci/p=
ci-
driver.c:1394)
> [    9.643749] ? blackhole_netdev_init (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:221)
> [    9.643749] ? e1000_init_module (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:227)
> [    9.643749] ? blackhole_netdev_init (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:221)
> [    9.643749] ? do_one_initcall (kbuild/src/consumer/init/main.c:1226)
> [    9.645767] ? rcu_read_lock_sched_held (kbuild/src/consumer/include/
linux/lockdep.h:278 kbuild/src/consumer/kernel/rcu/update.c:125)
> [    9.645767] ? trace_initcall_level (kbuild/src/consumer/include/trace/
events/initcall.h:10 kbuild/src/consumer/include/trace/events/initcall.h:10)
> [    9.645767] ? kernel_init_freeable (kbuild/src/consumer/init/main.c:12=
98 =

kbuild/src/consumer/init/main.c:1315 kbuild/src/consumer/init/main.c:1335 =

kbuild/src/consumer/init/main.c:1537)
> [    9.645767] ? kernel_init_freeable (kbuild/src/consumer/init/main.c:12=
98 =

kbuild/src/consumer/init/main.c:1315 kbuild/src/consumer/init/main.c:1335 =

kbuild/src/consumer/init/main.c:1537)
> [    9.647749] ? rest_init (kbuild/src/consumer/init/main.c:1421)
> [    9.647749] ? kernel_init (kbuild/src/consumer/init/main.c:1426)
> [    9.647749] ? ret_from_fork (kbuild/src/consumer/arch/x86/entry/
entry_32.S:856)
> [   13.148425] rcu-torture: rcu_torture_read_exit: End of episode
> [   68.608707] rcu-torture: rtc: (ptrval) ver: 5 tfle: 0 rta: 6 rtaf: 0 r=
tf: =

0 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 19364 =

onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D1000) barrier: 0/0:0 read-exits: 16 nocb-
toggles: 0:0
> [   68.611404] rcu-torture: Reader Pipe:  7767697 1 0 0 0 0 0 0 0 0 0
> [   68.612232] rcu-torture: Reader Batch:  7767697 1 0 0 0 0 0 0 0 0 0
> [   68.612964] rcu-torture: Free-Block Circulation:  5 4 3 2 1 0 0 0 0 0 0
> [  113.915674] rcu: INFO: rcu_sched self-detected stall on CPU
> [  113.915674] rcu:     1-....: (104125 ticks this GP) idle=3Ddf6/1/0x400=
00000 =

softirq=3D1939/1941 fqs=3D20299
> [  113.915674]  (t=3D105001 jiffies g=3D5985 q=3D37696)
> [  113.915674] NMI backtrace for cpu 1
> [  113.915674] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc2-00297-
gcf1e4e12c95d #1
> [  113.918848] Call Trace:
> [  113.918848] ? dump_stack (kbuild/src/consumer/lib/dump_stack.c:122)
> [  113.918848] ? lapic_can_unplug_cpu (kbuild/src/consumer/arch/x86/kerne=
l/
apic/vector.c:1081)
> [  113.918848] ? nmi_cpu_backtrace (kbuild/src/consumer/include/linux/
cpumask.h:356 kbuild/src/consumer/lib/nmi_backtrace.c:107)
> [  113.918848] ? lapic_can_unplug_cpu (kbuild/src/consumer/arch/x86/kerne=
l/
apic/hw_nmi.c:33)
> [  113.918848] ? nmi_trigger_cpumask_backtrace (kbuild/src/consumer/lib/
nmi_backtrace.c:64)
> [  113.918848] ? arch_trigger_cpumask_backtrace (kbuild/src/consumer/arch/
x86/kernel/apic/hw_nmi.c:41)
> [  113.918848] ? rcu_dump_cpu_stacks (kbuild/src/consumer/kernel/rcu/
tree_stall.h:337 (discriminator 5))
> [  113.918848] ? rcu_sched_clock_irq (kbuild/src/consumer/kernel/rcu/
tree_stall.h:624 kbuild/src/consumer/kernel/rcu/tree_stall.h:697 kbuild/src/
consumer/kernel/rcu/tree.c:3830 kbuild/src/consumer/kernel/rcu/tree.c:2650)
> [  113.918848] ? __raise_softirq_irqoff (kbuild/src/consumer/include/trac=
e/
events/irq.h:156 kbuild/src/consumer/kernel/softirq.c:484)
> [  113.918848] ? update_process_times (kbuild/src/consumer/arch/x86/inclu=
de/
asm/preempt.h:27 kbuild/src/consumer/kernel/time/timer.c:1798)
> [  113.918848] ? tick_sched_timer (kbuild/src/consumer/kernel/time/tick-
sched.c:227 kbuild/src/consumer/kernel/time/tick-sched.c:1369)
> [  113.918848] ? __hrtimer_run_queues (kbuild/src/consumer/kernel/time/
hrtimer.c:1521 kbuild/src/consumer/kernel/time/hrtimer.c:1583)
> [  113.918848] ? do_write_seqcount_begin_nested (kbuild/src/consumer/
include/linux/spinlock.h:354 kbuild/src/consumer/include/linux/seqlock.h:89=
3)
> [  113.918848] ? hrtimer_interrupt (kbuild/src/consumer/kernel/time/
hrtimer.c:1648)
> [  113.918848] ? bigsmp_ioapic_phys_id_map (kbuild/src/consumer/arch/x86/
include/asm/apic.h:105)
> [  113.918848] ? sysvec_call_function_single (kbuild/src/consumer/arch/x8=
6/
kernel/apic/apic.c:1100)
> [  113.918848] ? __sysvec_apic_timer_interrupt (kbuild/src/consumer/arch/
x86/include/asm/jump_label.h:25 kbuild/src/consumer/include/linux/
jump_label.h:200 kbuild/src/consumer/arch/x86/include/asm/trace/irq_vectors=
.h:
41 kbuild/src/consumer/arch/x86/kernel/apic/apic.c:1107)
> [  113.918848] ? sysvec_apic_timer_interrupt (kbuild/src/consumer/arch/x8=
6/
kernel/apic/apic.c:1100)
> [  113.918848] ? handle_exception (kbuild/src/consumer/arch/x86/entry/
entry_32.S:1179)
> [  113.918848] ? sysvec_call_function_single (kbuild/src/consumer/arch/x8=
6/
kernel/apic/apic.c:1100)
> [  113.918848] ? queued_read_lock_slowpath (kbuild/src/consumer/arch/x86/
include/asm/vdso/processor.h:19 kbuild/src/consumer/kernel/locking/qrwlock.=
c:
48)
> [  113.918848] ? sysvec_call_function_single (kbuild/src/consumer/arch/x8=
6/
kernel/apic/apic.c:1100)
> [  113.918848] ? queued_read_lock_slowpath (kbuild/src/consumer/arch/x86/
include/asm/vdso/processor.h:19 kbuild/src/consumer/kernel/locking/qrwlock.=
c:
48)
> [  113.918848] ? do_raw_read_lock (kbuild/src/consumer/kernel/locking/
spinlock_debug.c:159)
> [  113.918848] ? _raw_read_lock (kbuild/src/consumer/include/linux/
rwlock_api_smp.h:150 kbuild/src/consumer/kernel/locking/spinlock.c:223)
> [  113.918848] ? region_intersects (kbuild/src/consumer/kernel/resource.c:
534 kbuild/src/consumer/kernel/resource.c:580)
> [  113.918848] ? devmem_is_allowed (kbuild/src/consumer/arch/x86/mm/init.=
c:
823)
> [  113.918848] ? __request_region (kbuild/src/consumer/kernel/resource.c:
1157 kbuild/src/consumer/kernel/resource.c:1232 kbuild/src/consumer/kernel/
resource.c:1255)
> [  113.918848] ? wake_up_q (kbuild/src/consumer/kernel/sched/core.c:5542)
> [  113.918848] ? __pci_request_region (kbuild/src/consumer/drivers/pci/
pci.c:3848 (discriminator 2))
> [  113.918848] ? __pci_request_selected_regions (kbuild/src/consumer/
drivers/pci/pci.c:3915)
> [  113.918848] ? pci_request_selected_regions (kbuild/src/consumer/driver=
s/
pci/pci.c:3938)
> [  113.918848] ? e1000_probe (kbuild/src/consumer/drivers/net/ethernet/
intel/e1000/e1000_main.c:948)
> [  113.918848] ? trace_hardirqs_on (kbuild/src/consumer/kernel/trace/
trace_preemptirq.c:51 (discriminator 19))
> [  113.918848] ? __pm_runtime_resume (kbuild/src/consumer/drivers/base/
power/runtime.c:1093)
> [  113.918848] ? e1000_io_slot_reset (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:922)
> [  113.918848] ? pci_device_probe (kbuild/src/consumer/drivers/pci/pci-
driver.c:309 kbuild/src/consumer/drivers/pci/pci-driver.c:366 kbuild/src/
consumer/drivers/pci/pci-driver.c:391 kbuild/src/consumer/drivers/pci/pci-
driver.c:434)
> [  113.918848] ? really_probe (kbuild/src/consumer/drivers/base/dd.c:555)
> [  113.918848] ? driver_probe_device (kbuild/src/consumer/drivers/base/dd=
.c:
740)
> [  113.918848] ? device_driver_attach (kbuild/src/consumer/drivers/base/
dd.c:1015)
> [  113.918848] ? __driver_attach (kbuild/src/consumer/drivers/base/dd.c:
1094)
> [  113.918848] ? bus_for_each_dev (kbuild/src/consumer/drivers/base/bus.c:
305)
> [  113.918848] ? driver_attach (kbuild/src/consumer/drivers/base/dd.c:110=
9)
> [  113.918848] ? device_driver_attach (kbuild/src/consumer/drivers/base/
dd.c:1047)
> [  113.918848] ? bus_add_driver (kbuild/src/consumer/drivers/base/bus.c:6=
23)
> [  113.918848] ? driver_register (kbuild/src/consumer/drivers/base/driver=
.c:
171)
> [  113.918848] ? __pci_register_driver (kbuild/src/consumer/drivers/pci/p=
ci-
driver.c:1394)
> [  113.918848] ? blackhole_netdev_init (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:221)
> [  113.918848] ? e1000_init_module (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:227)
> [  113.918848] ? blackhole_netdev_init (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:221)
> [  113.918848] ? do_one_initcall (kbuild/src/consumer/init/main.c:1226)
> [  113.918848] ? rcu_read_lock_sched_held (kbuild/src/consumer/include/
linux/lockdep.h:278 kbuild/src/consumer/kernel/rcu/update.c:125)
> [  113.918848] ? trace_initcall_level (kbuild/src/consumer/include/trace/
events/initcall.h:10 kbuild/src/consumer/include/trace/events/initcall.h:10)
> [  113.918848] ? kernel_init_freeable (kbuild/src/consumer/init/main.c:12=
98 =

kbuild/src/consumer/init/main.c:1315 kbuild/src/consumer/init/main.c:1335 =

kbuild/src/consumer/init/main.c:1537)
> [  113.918848] ? kernel_init_freeable (kbuild/src/consumer/init/main.c:12=
98 =

kbuild/src/consumer/init/main.c:1315 kbuild/src/consumer/init/main.c:1335 =

kbuild/src/consumer/init/main.c:1537)
> [  113.918848] ? rest_init (kbuild/src/consumer/init/main.c:1421)
> [  113.918848] ? kernel_init (kbuild/src/consumer/init/main.c:1426)
> [  113.918848] ? ret_from_fork (kbuild/src/consumer/arch/x86/entry/
entry_32.S:856)
> [  121.856725] rcu: INFO: rcu_sched detected expedited stalls on CPUs/tas=
ks: =

{ 1-... } 108713 jiffies s: 73 root: 0x2/.
> [  121.858173] rcu: blocking rcu_node structures (internal RCU debug):
> [  121.858984] Task dump for CPU 1:
> [  121.859402] task:swapper/0       state:R  running task     stack: 5736 =

pid:    1 ppid:     0 flags:0x00004008
> [  121.860681] Call Trace:
> [  121.860996] ? wake_up_q (kbuild/src/consumer/kernel/sched/core.c:5542)
> [  121.861429] ? __pci_request_region (kbuild/src/consumer/drivers/pci/
pci.c:3848 (discriminator 2))
> [  121.861990] ? __pci_request_selected_regions (kbuild/src/consumer/
drivers/pci/pci.c:3915)
> [  121.862639] ? pci_request_selected_regions (kbuild/src/consumer/driver=
s/
pci/pci.c:3938)
> [  121.863247] ? e1000_probe (kbuild/src/consumer/drivers/net/ethernet/
intel/e1000/e1000_main.c:948)
> [  121.863713] ? trace_hardirqs_on (kbuild/src/consumer/kernel/trace/
trace_preemptirq.c:51 (discriminator 19))
> [  121.865689] ? __pm_runtime_resume (kbuild/src/consumer/drivers/base/
power/runtime.c:1093)
> [  121.866262] ? e1000_io_slot_reset (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:922)
> [  121.866807] ? pci_device_probe (kbuild/src/consumer/drivers/pci/pci-
driver.c:309 kbuild/src/consumer/drivers/pci/pci-driver.c:366 kbuild/src/
consumer/drivers/pci/pci-driver.c:391 kbuild/src/consumer/drivers/pci/pci-
driver.c:434)
> [  121.867363] ? really_probe (kbuild/src/consumer/drivers/base/dd.c:555)
> [  121.867875] ? driver_probe_device (kbuild/src/consumer/drivers/base/dd=
.c:
740)
> [  121.869481] ? device_driver_attach (kbuild/src/consumer/drivers/base/
dd.c:1015)
> [  121.870046] ? __driver_attach (kbuild/src/consumer/drivers/base/dd.c:
1094)
> [  121.870576] ? bus_for_each_dev (kbuild/src/consumer/drivers/base/bus.c:
305)
> [  121.871092] ? driver_attach (kbuild/src/consumer/drivers/base/dd.c:110=
9)
> [  121.871625] ? device_driver_attach (kbuild/src/consumer/drivers/base/
dd.c:1047)
> [  121.872227] ? bus_add_driver (kbuild/src/consumer/drivers/base/bus.c:6=
23)
> [  121.872739] ? driver_register (kbuild/src/consumer/drivers/base/driver=
.c:
171)
> [  121.873305] ? __pci_register_driver (kbuild/src/consumer/drivers/pci/p=
ci-
driver.c:1394)
> [  121.873878] ? blackhole_netdev_init (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:221)
> [  121.874466] ? e1000_init_module (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:227)
> [  121.874996] ? blackhole_netdev_init (kbuild/src/consumer/drivers/net/
ethernet/intel/e1000/e1000_main.c:221)
> [  121.875586] ? do_one_initcall (kbuild/src/consumer/init/main.c:1226)
> [  121.876114] ? rcu_read_lock_sched_held (kbuild/src/consumer/include/
linux/lockdep.h:278 kbuild/src/consumer/kernel/rcu/update.c:125)
> [  121.876757] ? trace_initcall_level (kbuild/src/consumer/include/trace/
events/initcall.h:10 kbuild/src/consumer/include/trace/events/initcall.h:10)
> [  121.877368] ? kernel_init_freeable (kbuild/src/consumer/init/main.c:12=
98 =

kbuild/src/consumer/init/main.c:1315 kbuild/src/consumer/init/main.c:1335 =

kbuild/src/consumer/init/main.c:1537)
> [  121.877940] ? kernel_init_freeable (kbuild/src/consumer/init/main.c:12=
98 =

kbuild/src/consumer/init/main.c:1315 kbuild/src/consumer/init/main.c:1335 =

kbuild/src/consumer/init/main.c:1537)
> [  121.878538] ? rest_init (kbuild/src/consumer/init/main.c:1421)
> [  121.879008] ? kernel_init (kbuild/src/consumer/init/main.c:1426)
> [  121.879473] ? ret_from_fork (kbuild/src/consumer/arch/x86/entry/
entry_32.S:856)
> [  130.048872] rcu-torture: rtc: (ptrval) ver: 5 tfle: 0 rta: 6 rtaf: 0 r=
tf: =

0 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 41670 =

onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D1000) barrier: 0/0:0 read-exits: 16 nocb-
toggles: 0:0
> [  130.051537] rcu-torture: Reader Pipe:  16853873 1 0 0 0 0 0 0 0 0 0
> [  130.052366] rcu-torture: Reader Batch:  16853873 1 0 0 0 0 0 0 0 0 0
> [  130.053161] rcu-torture: Free-Block Circulation:  5 4 3 2 1 0 0 0 0 0 0
> [  130.053994] ??? Writer stall state RTWS_SYNC(9) g5985 f0x0 ->state 0x2 =

cpu 0
> [  130.054858] task:rcu_torture_wri state:D stack: 6900 pid:  109 ppid:  =
   =

2 flags:0x00004000
> [  130.055908] Call Trace:
> [  130.056221] ? __schedule (kbuild/src/consumer/kernel/sched/core.c:4327 =

kbuild/src/consumer/kernel/sched/core.c:5075)
> [  130.056697] ? lock_release (kbuild/src/consumer/include/trace/events/
lock.h:58 kbuild/src/consumer/kernel/locking/lockdep.c:5521)
> [  130.057173] ? schedule (kbuild/src/consumer/arch/x86/include/asm/
preempt.h:85 (discriminator 1) kbuild/src/consumer/kernel/sched/core.c:5155 =

(discriminator 1))
> [  130.057593] ? schedule_preempt_disabled (kbuild/src/consumer/arch/x86/
include/asm/preempt.h:80 kbuild/src/consumer/kernel/sched/core.c:5214)
> [  130.058186] ? __mutex_lock (kbuild/src/consumer/kernel/locking/mutex.c:
1029 kbuild/src/consumer/kernel/locking/mutex.c:1093)
> [  130.058667] ? mutex_lock_nested (kbuild/src/consumer/kernel/locking/
mutex.c:1109)
> [  130.060228] ? synchronize_rcu_expedited (kbuild/src/consumer/kernel/rc=
u/
tree_exp.h:324 kbuild/src/consumer/kernel/rcu/tree_exp.h:836)
> [  130.060861] ? synchronize_rcu_expedited (kbuild/src/consumer/kernel/rc=
u/
tree_exp.h:324 kbuild/src/consumer/kernel/rcu/tree_exp.h:836)
> [  130.061479] ? debug_object_free (kbuild/src/consumer/lib/debugobjects.=
c:
853)
> [  130.061996] ? rcu_preempt_sleep_check (kbuild/src/consumer/include/lin=
ux/
rcupdate.h:327)
> [  130.062538] ? __might_sleep (kbuild/src/consumer/kernel/sched/core.c:8=
285 =

(discriminator 14))
> [  130.063008] ? lock_acquire (kbuild/src/consumer/include/trace/events/
lock.h:13 kbuild/src/consumer/kernel/locking/lockdep.c:5481)
> [  130.063460] ? synchronize_rcu (kbuild/src/consumer/kernel/rcu/tree.c:
3767)
> [  130.063960] ? schedule_hrtimeout_range (kbuild/src/consumer/kernel/tim=
e/
hrtimer.c:2186)
> [  130.064509] ? lock_acquired (kbuild/src/consumer/include/trace/events/
lock.h:67 kbuild/src/consumer/kernel/locking/lockdep.c:5751)
> [  130.064986] ? __delay (kbuild/src/consumer/arch/x86/lib/delay.c:204)
> [  130.065384] ? __const_udelay (kbuild/src/consumer/arch/x86/lib/delay.c:
218 (discriminator 21))
> [  130.065890] ? rcu_torture_writer (kbuild/src/consumer/kernel/rcu/
rcutorture.c:1220)
> [  130.066435] ? __kthread_parkme (kbuild/src/consumer/arch/x86/include/a=
sm/
bitops.h:207 kbuild/src/consumer/include/asm-generic/bitops/instrumented-no=
n-
atomic.h:135 kbuild/src/consumer/kernel/kthread.c:222)
> [  130.066947] ? kthread (kbuild/src/consumer/kernel/kthread.c:294)
> [  130.067352] ? rcu_torture_pipe_update (kbuild/src/consumer/kernel/rcu/
rcutorture.c:1126)
> [  130.067945] ? __list_del_entry (kbuild/src/consumer/arch/x86/events/
intel/uncore.c:318)
> [  130.068439] ? ret_from_fork (kbuild/src/consumer/arch/x86/entry/
entry_32.S:856)
> [  130.068922] rcu: rcu_sched: wait state: RCU_GP_WAIT_FQS(5) ->state: 0x=
0 =

delta ->gp_activity 21 ->gp_req_activity 121169 ->gp_wake_time 121169 -
>gp_wake_seq 5984 ->gp_seq 5985 ->gp_seq_needed 5988 ->gp_flags 0x0
> [  130.071191] rcu:     rcu_node 0:1 ->gp_seq 5985 ->gp_seq_needed 5988
> [  130.071956] rcu:     cpu 0 ->gp_seq_needed 5988
> [  130.072500] rcu:     cpu 1 ->gp_seq_needed 5988
> [  130.073046] rcu: RCU callbacks invoked since boot: 23719
> [  130.073712] rcu_tasks: RTGS_WAIT_CBS(11) since 127497 g:2 i:0/0 k.
> [  130.074481] rcu_tasks_rude: RTGS_WAIT_CBS(11) since 127657 g:2 i:0/3 k.
> [  130.075385] rcu_tasks_trace: RTGS_WAIT_CBS(11) since 127828 g:2 i:0/1 =
k. =

N0 h:0/0/0
> [  130.078873] Dumping ftrace buffer:
> [  130.079310]    (ftrace buffer empty)
> [  191.488693] rcu-torture: rtc: (ptrval) ver: 5 tfle: 0 rta: 6 rtaf: 0 r=
tf: =

0 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 63533 =

onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D1000) barrier: 0/0:0 read-exits: 16 nocb-
toggles: 0:0
> [  191.491304] rcu-torture: Reader Pipe:  25714613 1 0 0 0 0 0 0 0 0 0
> [  191.492111] rcu-torture: Reader Batch:  25714613 1 0 0 0 0 0 0 0 0 0
> [  191.492907] rcu-torture: Free-Block Circulation:  5 4 3 2 1 0 0 0 0 0 0
> [  191.493730] ??? Writer stall state RTWS_SYNC(9) g5985 f0x0 ->state 0x2 =

cpu 0
> [  191.494579] rcu: rcu_sched: wait state: RCU_GP_WAIT_FQS(5) ->state: 0x=
0 =

delta ->gp_activity 7 ->gp_req_activity 182594 ->gp_wake_time 182594 -
>gp_wake_seq 5984 ->gp_seq 5985 ->gp_seq_needed 5988 ->gp_flags 0x0
> [  191.496790] rcu:     rcu_node 0:1 ->gp_seq 5985 ->gp_seq_needed 5988
> [  191.497521] rcu:     cpu 0 ->gp_seq_needed 5988
> [  191.498050] rcu:     cpu 1 ->gp_seq_needed 5988
> [  191.498572] rcu: RCU callbacks invoked since boot: 23719
> [  191.499222] rcu_tasks: RTGS_WAIT_CBS(11) since 188922 g:2 i:0/0 k.
> [  191.499999] rcu_tasks_rude: RTGS_WAIT_CBS(11) since 189083 g:2 i:0/3 k.
> [  191.500832] rcu_tasks_trace: RTGS_WAIT_CBS(11) since 189254 g:2 i:0/1 =
k. =

N0 h:0/0/0
> [  253.207367] rcu-torture: rtc: (ptrval) ver: 5 tfle: 0 rta: 6 rtaf: 0 r=
tf: =

0 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 rtbf: 0 rtb: 0 nt: 83753 =

onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D1000) barrier: 0/0:0 read-exits: 16 nocb-
toggles: 0:0
> [  253.209923] rcu-torture: Reader Pipe:  33834394 1 0 0 0 0 0 0 0 0 0
> [  253.210714] rcu-torture: Reader Batch:  33834394 1 0 0 0 0 0 0 0 0 0
> [  253.211498] rcu-torture: Free-Block Circulation:  5 4 3 2 1 0 0 0 0 0 0
> [  253.212358] ??? Writer stall state RTWS_SYNC(9) g5985 f0x0 ->state 0x2 =

cpu 0
> [  253.213214] rcu: rcu_sched: wait state: RCU_GP_WAIT_FQS(5) ->state: 0x=
0 =

delta ->gp_activity 6 ->gp_req_activity 244313 ->gp_wake_time 244313 -
>gp_wake_seq 5984 ->gp_seq 5985 ->gp_seq_needed 5988 ->gp_flags 0x0
> [  253.215409] rcu:     rcu_node 0:1 ->gp_seq 5985 ->gp_seq_needed 5988
> [  253.216164] rcu:     cpu 0 ->gp_seq_needed 5988
> [  253.216695] rcu:     cpu 1 ->gp_seq_needed 5988
> [  253.217225] rcu: RCU callbacks invoked since boot: 23719
> [  253.217885] rcu_tasks: RTGS_WAIT_CBS(11) since 250641 g:2 i:0/0 k.
> [  253.218647] rcu_tasks_rude: RTGS_WAIT_CBS(11) since 250801 g:2 i:0/3 k.
> [  253.219473] rcu_tasks_trace: RTGS_WAIT_CBS(11) since 250972 g:2 i:0/1 =
k. =

N0 h:0/0/0
> =

> =

> To reproduce:
> =

>         # build kernel
>         cd linux
>         cp config-5.12.0-rc2-00297-gcf1e4e12c95d .config
>         make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare =

modules_prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =

this email
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology =

Center
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel =

Corporation
> =

> Thanks,
> Oliver Sang
> =





--===============2651754684417116606==--

