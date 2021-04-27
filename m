Content-Type: multipart/mixed; boundary="===============9168462823467977476=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [clocksource] 8c30ace35d: WARNING:at_kernel/time/clocksource.c:#clocksource_watchdog
Date: Tue, 27 Apr 2021 06:37:46 -0700
Message-ID: <20210427133746.GG975577@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210427084522.GB65970@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9168462823467977476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 04:45:22PM +0800, Feng Tang wrote:
> On Tue, Apr 27, 2021 at 03:27:02PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-9):
> > =

> > commit: 8c30ace35da3b362089f5c903144d762a065b58a ("[PATCH v10 clocksour=
ce 6/7] clocksource: Forgive tsc_early pre-calibration drift")
> > url: https://github.com/0day-ci/linux/commits/Paul-E-McKenney/Do-not-ma=
rk-clocks-unstable-due-to-delays-for-v5-13/20210426-064834
> > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 2d036dfa=
5f10df9782f5278fc591d79d283c1fad
> > =

> > in testcase: boot
> > =

> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 16G
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > =

> > [   70.350923] WARNING: CPU: 0 PID: 1 at kernel/time/clocksource.c:435 =
clocksource_watchdog (kbuild/src/x86_64/kernel/time/clocksource.c:435) =

> > [   70.353152] Modules linked in:
> > [   70.354074] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc3-000=
31-g8c30ace35da3 #2
> > [   70.356180] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.12.0-1 04/01/2014
> > [   70.358471] RIP: 0010:clocksource_watchdog (kbuild/src/x86_64/kernel=
/time/clocksource.c:435) =

> =

> Some log extraced from the attached dmesg.xz:
> =

> [    8.376387] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycle=
s: 0x26d347b2dd9, max_idle_ns: 440795223616 ns
> [    8.890982] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 1911260446275000 ns
> [    9.132146] clocksource: Switched to clocksource kvm-clock
> [   10.324011] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
> =

> [   10.397945] Trying to unpack rootfs image as initramfs...
> [   70.350923] WARNING: CPU: 0 PID: 1 at kernel/time/clocksource.c:435 cl=
ocksource_watchdog+0x3b8/0x4c0
> [  199.544368] Freeing initrd memory: 592780K
> =

> [  199.551256] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
6d347b2dd9, max_idle_ns: 440795223616 ns
> =

> Seems the initramfs took too long time, and exceeds the 60
> seconds of WATCHDOG_SYNC_FORGIVENESS time, which triggers
> the warning.
> =

> Also I asked Oliver about the reproduce rate, and he said the
> warning was seen only once for all around 100 boot tests. From
> other good boot logs, the initramfs unpacking usually only takes
> about 20 seconds. =


Hmmm...  70 seconds.  Is this a legitimate diagnostic of initramfs?
If not, is there some way to detect that initramfs took longer than
expected?

I suppose that I give it (say) 120 seconds instead of the current 60,
which might be the right thing to do, but it does feel like papering
over a very real initramfs problem.  Alternatively, I could provide a
boot parameter allowing those with slow systems to adjust as needed.

							Thanx, Paul

> Thanks,
> Feng
> =

> > [   70.382655]  <IRQ>
> > [   70.386145] call_timer_fn (kbuild/src/x86_64/arch/x86/include/asm/ju=
mp_label.h:25 kbuild/src/x86_64/include/linux/jump_label.h:200 kbuild/src/x=
86_64/include/trace/events/timer.h:125 kbuild/src/x86_64/kernel/time/timer.=
c:1432) =

> > [   70.387393] run_timer_softirq (kbuild/src/x86_64/kernel/time/timer.c=
:1477 kbuild/src/x86_64/kernel/time/timer.c:1745 kbuild/src/x86_64/kernel/t=
ime/timer.c:1721 kbuild/src/x86_64/kernel/time/timer.c:1758) =

> > [   70.389855] __do_softirq (kbuild/src/x86_64/arch/x86/include/asm/jum=
p_label.h:25 kbuild/src/x86_64/include/linux/jump_label.h:200 kbuild/src/x8=
6_64/include/trace/events/irq.h:142 kbuild/src/x86_64/kernel/softirq.c:346) =

> > [   70.390965] irq_exit_rcu (kbuild/src/x86_64/kernel/softirq.c:221 kbu=
ild/src/x86_64/kernel/softirq.c:422 kbuild/src/x86_64/kernel/softirq.c:434) =

> > [   70.392198] sysvec_apic_timer_interrupt (kbuild/src/x86_64/arch/x86/=
kernel/apic/apic.c:1100 (discriminator 14)) =

> > [   70.393575]  </IRQ>
> > [   70.394355] asm_sysvec_apic_timer_interrupt (kbuild/src/x86_64/arch/=
x86/include/asm/idtentry.h:632) =

> > [   70.395968] RIP: 0010:__memcpy (kbuild/src/x86_64/arch/x86/lib/memcp=
y_64.S:39) =

> > [ 70.397140] Code: 84 00 00 00 00 00 66 90 48 89 fe 48 c7 c7 7e 0a a2 a=
7 e9 f1 fe ff ff cc 66 66 90 66 90 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 <=
f3> 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 f3 a4
> > [   70.404945] RSP: 0000:ffffb8e500013ae8 EFLAGS: 00010246
> > [   70.406424] RAX: ffff9fc255c00000 RBX: 0000000000001000 RCX: 0000000=
000000200
> > [   70.408416] RDX: 0000000000000000 RSI: ffff9fc2423e4bb0 RDI: ffff9fc=
255c00000
> > [   70.410277] RBP: ffff9fc255c00000 R08: ffff9fc140000000 R09: 0000000=
000004bb0
> > [   70.412300] R10: ffff9fc2402a3180 R11: 0000000000000000 R12: 0000000=
000001000
> > [   70.414194] R13: ffffb8e500013c08 R14: 0000000000001000 R15: ffffe73=
dc0000000
> > [   70.416239] iov_iter_copy_from_user_atomic (kbuild/src/x86_64/lib/io=
v_iter.c:991 (discriminator 10)) =

> > [   70.417718] generic_perform_write (kbuild/src/x86_64/mm/filemap.c:35=
86) =

> > [   70.419241] __generic_file_write_iter (kbuild/src/x86_64/mm/filemap.=
c:3705) =

> > [   70.420517] generic_file_write_iter (kbuild/src/x86_64/include/linux=
/fs.h:780 kbuild/src/x86_64/mm/filemap.c:3737) =

> > [   70.421643] __kernel_write (kbuild/src/x86_64/fs/read_write.c:550 (d=
iscriminator 1)) =

> > [   70.422769] kernel_write (kbuild/src/x86_64/include/linux/fs.h:2903 =
kbuild/src/x86_64/fs/read_write.c:580 kbuild/src/x86_64/fs/read_write.c:569=
) =

> > [   70.423999] ? write_buffer (kbuild/src/x86_64/init/initramfs.c:436) =

> > [   70.425104] xwrite+0x31/0x62 =

> > [   70.426262] do_copy (kbuild/src/x86_64/init/initramfs.c:394) =

> > [   70.427333] ? write_buffer (kbuild/src/x86_64/init/initramfs.c:436) =

> > [   70.428395] write_buffer (kbuild/src/x86_64/init/initramfs.c:430 (di=
scriminator 1)) =

> > [   70.429461] flush_buffer (kbuild/src/x86_64/init/initramfs.c:442) =

> > [   70.430523] ? initrd_load (kbuild/src/x86_64/init/initramfs.c:44) =

> > [   70.431700] __gunzip (kbuild/src/x86_64/lib/decompress_inflate.c:161=
) =

> > [   70.432696] ? bunzip2 (kbuild/src/x86_64/lib/decompress_inflate.c:39=
) =

> > [   70.433760] ? __gunzip (kbuild/src/x86_64/lib/decompress_inflate.c:2=
07) =

> > [   70.434841] gunzip (kbuild/src/x86_64/lib/decompress_inflate.c:207) =

> > [   70.435927] ? initrd_load (kbuild/src/x86_64/init/initramfs.c:44) =

> > [   70.437032] unpack_to_rootfs (kbuild/src/x86_64/init/initramfs.c:500=
) =

> > [   70.438284] ? initrd_load (kbuild/src/x86_64/init/initramfs.c:44) =

> > [   70.439507] ? reserve_initrd_mem (kbuild/src/x86_64/init/initramfs.c=
:662) =

> > [   70.440794] populate_rootfs (kbuild/src/x86_64/init/initramfs.c:676) =

> > [   70.441946] ? reserve_initrd_mem (kbuild/src/x86_64/init/initramfs.c=
:662) =

> > [   70.443386] do_one_initcall (kbuild/src/x86_64/init/main.c:1226) =

> > [   70.444562] ? rcu_read_lock_sched_held (kbuild/src/x86_64/include/li=
nux/lockdep.h:278 kbuild/src/x86_64/kernel/rcu/update.c:125) =

> > [   70.445893] kernel_init_freeable (kbuild/src/x86_64/init/main.c:1298=
 kbuild/src/x86_64/init/main.c:1315 kbuild/src/x86_64/init/main.c:1335 kbui=
ld/src/x86_64/init/main.c:1537) =

> > [   70.447344] ? rest_init (kbuild/src/x86_64/init/main.c:1421) =

> > [   70.448383] kernel_init (kbuild/src/x86_64/init/main.c:1426) =

> > [   70.449219] ret_from_fork (kbuild/src/x86_64/arch/x86/entry/entry_64=
.S:300) =

> > [   70.450175] irq event stamp: 2300500
> > [   70.451358] hardirqs last enabled at (2300510): console_unlock (kbui=
ld/src/x86_64/arch/x86/include/asm/irqflags.h:45 (discriminator 1) kbuild/s=
rc/x86_64/arch/x86/include/asm/irqflags.h:80 (discriminator 1) kbuild/src/x=
86_64/arch/x86/include/asm/irqflags.h:145 (discriminator 1) kbuild/src/x86_=
64/kernel/printk/printk.c:2605 (discriminator 1)) =

> > [   70.453717] hardirqs last disabled at (2300519): console_unlock (kbu=
ild/src/x86_64/kernel/printk/printk.c:2520 (discriminator 1)) =

> > [   70.456262] softirqs last enabled at (2299674): __do_softirq (kbuild=
/src/x86_64/arch/x86/include/asm/preempt.h:27 kbuild/src/x86_64/kernel/soft=
irq.c:373) =

> > [   70.458585] softirqs last disabled at (2299819): irq_exit_rcu (kbuil=
d/src/x86_64/kernel/softirq.c:221 kbuild/src/x86_64/kernel/softirq.c:422 kb=
uild/src/x86_64/kernel/softirq.c:434) =

> > [   70.461343] ---[ end trace 5049069f8395a579 ]---
> > [  199.544368] Freeing initrd memory: 592780K
> > [  199.545765] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> > [  199.547432] software IO TLB: mapped [mem 0x00000000bbfe0000-0x000000=
00bffe0000] (64MB)
> > [  199.550168] kvm: no hardware support
> > [  199.551256] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0=
x26d347b2dd9, max_idle_ns: 440795223616 ns
> > [  199.563791] Initialise system trusted keyrings
> > [  199.565211] Key type blacklist registered
--===============9168462823467977476==--

