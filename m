Content-Type: multipart/mixed; boundary="===============8486211265658562568=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 0 PID: 95 at kernel/sched/core.c:7312 __might_sleep()
Date: Mon, 27 Oct 2014 21:49:48 +0800
Message-ID: <20141027134948.GA8977@wfg-t540p.sh.intel.com>
In-Reply-To: <20141027133627.GH3337@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8486211265658562568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2014 at 02:36:27PM +0100, Peter Zijlstra wrote:
> On Mon, Oct 27, 2014 at 09:06:21PM +0800, Fengguang Wu wrote:
> > Hi Peter,
> > =

> > FYI, this bug seems still there on v3.18-rc2.
> =

> Oh, right, I commented out that patch and the audit one because I was
> waiting for some feedback. Lemme go prod people.

audit? I do hit an kauditd_thread warning recently:

[   89.102903] ------------[ cut here ]------------
[   89.107650] WARNING: CPU: 6 PID: 3175 at /kbuild/src/lkp/kernel/sched/co=
re.c:7310 __might_sleep+0x8e/0xc0()
[   89.117606] do not call blocking ops when !TASK_RUNNING; state=3D1 set a=
t [<ffffffff811088f8>] kauditd_thread+0x168/0x220
[   89.128588] Modules linked in: btrfs raid456 async_raid6_recov async_mem=
cpy async_pq async_xor xor async_tx raid6_pq ipmi_watchdog ipmi_msghandler =
ses enclosure sg s
d_mod ata_generic pata_acpi floppy parport_pc parport snd_pcm snd_timer snd=
 ata_piix soundcore i2c_i801 serio_raw mptsas libata pcspkr i5400_edac shpc=
hp mptscsih edac_core mptbase i5k_amb tpm_infineon scsi_transport_sas      =
                                                                           =
                                    [   89.165503] CPU: 6 PID: 3175 Comm: k=
auditd Tainted: G        W      3.18.0-rc2-g8696cce #1
[   89.173988] Hardware name: Supermicro X7DW3/X7DWN, BIOS 6.00 09/28/2007
[   89.180735]  0000000000000009 ffff880229d8bd78 ffffffff81876101 ffff8802=
2fd90478
[   89.188596]  ffff880229d8bdc8 ffff880229d8bdb8 ffffffff8106a421 ffff8802=
29d8bda8
[   89.196483]  ffffffff81b345f0 0000000000000038 0000000000000000 ffff8800=
bd0fd850
[   89.204364] Call Trace:
[   89.206945]  [<ffffffff81876101>] dump_stack+0x4e/0x68
[   89.212209]  [<ffffffff8106a421>] warn_slowpath_common+0x81/0xa0
[   89.218362]  [<ffffffff8106a486>] warn_slowpath_fmt+0x46/0x50
[   89.224257]  [<ffffffff811088f8>] ? kauditd_thread+0x168/0x220
[   89.230216]  [<ffffffff811088f8>] ? kauditd_thread+0x168/0x220
[   89.236201]  [<ffffffff8109039e>] __might_sleep+0x8e/0xc0
[   89.241746]  [<ffffffff8110897b>] kauditd_thread+0x1eb/0x220
[   89.247536]  [<ffffffff81098030>] ? wake_up_state+0x20/0x20
[   89.253247]  [<ffffffff81108790>] ? audit_printk_skb+0x70/0x70
[   89.259237]  [<ffffffff81089e8f>] kthread+0xef/0x110
[   89.264330]  [<ffffffff81089da0>] ? kthread_create_on_node+0x180/0x180
[   89.271010]  [<ffffffff8187eabc>] ret_from_fork+0x7c/0xb0
[   89.276543]  [<ffffffff81089da0>] ? kthread_create_on_node+0x180/0x180
[   89.283205] ---[ end trace 4692477bd4539c42 ]---

However I'm not sure if it's a bug in 3.18-rc2, or one of the
following trees introduced that warning.

 amirv/driver_updates
 arm-platforms/irq/irqchip_state
 arm-platforms/irq/priority_drop
 asoc/for-linus
 asoc/for-next
 asoc/topic/sgtl5000
 bluetooth/master
 chanwoo-extcon/extcon-next
 drm-intel/drm-intel-next-queued
 drm-intel/drm-intel-nightly
 hwmon/poweroff-handler
 ipsec-next/master
 ipsec-next/testing
 jiangliu/ioapic/hotplug_v7
 kees/lsm/modpin.old
 kvm/queue
 m68k/for-3.19
 m68k/for-linus
 m68k/for-next
 m68k/m68k-queue
 mips-john/mips-for-linux-next
 net/master
 net-next/master
 peterz-queue/locking/urgent
 peterz-queue/perf/core
 peterz-queue/perf/urgent
 peterz-queue/sched/urgent
 peterz-queue/sched/wait
 peterz-queue/timers/urgent
 regulator/for-next
 renesas/cleanup-for-v3.19
 renesas/devel
 renesas/dt-clocksource-for-v3.19
 renesas/dt-du-for-v3.19
 renesas/dt-for-v3.19
 renesas/next
 renesas/soc-for-v3.19
 sound/for-linus
 spi/for-linus
 spi/for-next
 staging/staging-testing
 tip/locking/urgent
 usb/usb-linus

Thanks,
Fengguang

--===============8486211265658562568==--

