Content-Type: multipart/mixed; boundary="===============7995096573528333697=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ 0.003333] BUG: KASAN: use-after-scope in console_unlock+0x605/0xcc0
Date: Thu, 30 Nov 2017 15:47:12 +0900
Message-ID: <20171130064712.GA488@jagdpanzerIV>
In-Reply-To: <20171130022655.2e5ehqmf3lyi4jy3@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7995096573528333697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On (11/30/17 10:26), Fengguang Wu wrote:
> FYI this happens in mainline kernel v4.15-rc1 .
> It shows up after v4.14 . Bisect is on the way.

hm, printk saw no changes between 4.14 and 4.15


> It occurs in 4 out of 4 boots.
> =

> [    0.003333] 	RCU callback double-/use-after-free debug enabled.
> [    0.003333] 	RCU CPU stall warnings timeout set to 100 (rcu_cpu_stall_=
timeout).
> [    0.003333] 	Tasks RCU enabled.
> [    0.003333] NR_IRQS: 4352, nr_irqs: 48, preallocated irqs: 16
> [    0.003333] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.003333] BUG: KASAN: use-after-scope in console_unlock+0x605/0xcc0:
> 						atomic_read at arch/x86/include/asm/atomic.h:27
> 						 (inlined by) static_key_count at include/linux/jump_label.h:191
> 						 (inlined by) static_key_false at include/linux/jump_label.h:201
> 						 (inlined by) trace_console_rcuidle at include/trace/events/printk.=
h:10
> 						 (inlined by) call_console_drivers at kernel/printk/printk.c:1556
> 						 (inlined by) console_unlock at kernel/printk/printk.c:2233
> [    0.003333] Write of size 4 at addr ffffffff83607aa0 by task swapper/0
> [    0.003333]
> [    0.003333] CPU: 0 PID: 0 Comm: swapper Not tainted 4.15.0-rc1 #1
> [    0.003333] Call Trace:
> [    0.003333]  ? print_address_description+0x4f/0x3c0:
> 						print_address_description at mm/kasan/report.c:253
> [    0.003333]  ? console_unlock+0x605/0xcc0:
> 						atomic_read at arch/x86/include/asm/atomic.h:27
> 						 (inlined by) static_key_count at include/linux/jump_label.h:191
> 						 (inlined by) static_key_false at include/linux/jump_label.h:201
> 						 (inlined by) trace_console_rcuidle at include/trace/events/printk.=
h:10
> 						 (inlined by) call_console_drivers at kernel/printk/printk.c:1556
> 						 (inlined by) console_unlock at kernel/printk/printk.c:2233

so KASAN didn't like atomic_read(&key->enabled) from static_key_count()?
"Write of size 4"...


> [    0.003333]  ? kasan_report+0x304/0x390:
> 						kasan_report_error at mm/kasan/report.c:352
> 						 (inlined by) kasan_report at mm/kasan/report.c:409
> [    0.003333]  ? console_unlock+0x605/0xcc0:
> 						atomic_read at arch/x86/include/asm/atomic.h:27
> 						 (inlined by) static_key_count at include/linux/jump_label.h:191
> 						 (inlined by) static_key_false at include/linux/jump_label.h:201
> 						 (inlined by) trace_console_rcuidle at include/trace/events/printk.=
h:10
> 						 (inlined by) call_console_drivers at kernel/printk/printk.c:1556
> 						 (inlined by) console_unlock at kernel/printk/printk.c:2233
> [    0.003333]  ? wake_up_klogd+0x180/0x180:
> 						console_unlock at kernel/printk/printk.c:2138
> [    0.003333]  ? _raw_spin_unlock_irqrestore+0xcf/0xf0:
> 						__raw_spin_unlock_irqrestore at include/linux/spinlock_api_smp.h:161
> 						 (inlined by) _raw_spin_unlock_irqrestore at kernel/locking/spinloc=
k.c:191
> [    0.003333]  ? __down_trylock_console_sem+0xf8/0x120:
> 						__down_trylock_console_sem at kernel/printk/printk.c:234
> [    0.003333]  ? __down_trylock_console_sem+0x106/0x120:
> 						__down_trylock_console_sem at kernel/printk/printk.c:235
> [    0.003333]  ? vprintk_emit+0x63e/0x6f0:
> 						vprintk_emit at kernel/printk/printk.c:1757
> [    0.003333]  ? vprintk_func+0x11e/0x130:
> 						vprintk_func at kernel/printk/printk_safe.c:379
> [    0.003333]  ? printk+0xaf/0xcf:
> 						printk at kernel/printk/printk.c:1824
> [    0.003333]  ? show_regs_print_info+0x40/0x40:
> 						printk at kernel/printk/printk.c:1824
> [    0.003333]  ? __flush_tlb_all+0x1e/0x31:
> 						__flush_tlb_global at arch/x86/include/asm/paravirt.h:298
> 						 (inlined by) __flush_tlb_all at arch/x86/include/asm/tlbflush.h:293
> [    0.003333]  ? native_flush_tlb_global+0x5/0xa0:
> 						native_flush_tlb_global at arch/x86/kernel/paravirt.c:199
> [    0.003333]  ? kasan_init+0x276/0x306:
> 						kasan_init at arch/x86/mm/kasan_init_64.c:349
> [    0.003333]  ? setup_arch+0x1bb0/0x1cad:
> 						setup_arch at arch/x86/kernel/setup.c:1236
> [    0.003333]  ? reserve_standard_io_resources+0x88/0x88:
> 						setup_arch at arch/x86/kernel/setup.c:829
> [    0.003333]  ? vprintk_emit+0x6dc/0x6f0:
> 						vprintk_emit at kernel/printk/printk.c:1761
> [    0.003333]  ? vprintk_func+0x125/0x130:
> 						vprintk_func at kernel/printk/printk_safe.c:380
> [    0.003333]  ? printk+0xaf/0xcf:
> 						printk at kernel/printk/printk.c:1824
> [    0.003333]  ? show_regs_print_info+0x40/0x40:
> 						printk at kernel/printk/printk.c:1824
> [    0.003333]  ? trace_hardirqs_on+0x220/0x220:
> 						trace_hardirqs_off at kernel/trace/trace_irqsoff.c:799
> [    0.003333]  ? __early_make_pgtable+0x2a5/0x308:
> 						__early_make_pgtable at arch/x86/kernel/head64.c:251
> [    0.003333]  ? boot_cpu_init+0x16/0x56:
> 						set_bit at arch/x86/include/asm/bitops.h:76
> 						 (inlined by) cpumask_set_cpu at include/linux/cpumask.h:297
> 						 (inlined by) set_cpu_online at include/linux/cpumask.h:799
> 						 (inlined by) boot_cpu_init at kernel/cpu.c:2012
> [    0.003333]  ? start_kernel+0xe7/0x8cd:
> 						add_latent_entropy at include/linux/random.h:26
> 						 (inlined by) start_kernel at init/main.c:535
> [    0.003333]  ? thread_stack_cache_init+0x37/0x37
> [    0.003333]  ? x86_cpuid_vendor+0xbe/0xd0:
> 						x86_cpuid_vendor at arch/x86/include/asm/microcode.h:125
> [    0.003333]  ? x86_family+0x2f/0x40:
> 						x86_family at arch/x86/lib/cpu.c:14
> [    0.003333]  ? load_ucode_bsp+0x3c4/0x46f:
> 						load_ucode_bsp at arch/x86/kernel/cpu/microcode/core.c:189
> [    0.003333]  ? x86_early_init_platform_quirks+0x146/0x1a1:
> 						x86_early_init_platform_quirks at arch/x86/kernel/platform-quirks.c=
:31
> [    0.003333]  ? secondary_startup_64+0xa5/0xb0:
> 						secondary_startup_64 at arch/x86/kernel/head_64.S:237
> [    0.003333]
> [    0.003333] Memory state around the buggy address:
> [    0.003333]  ffffffff83607980: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00
> [    0.003333]  ffffffff83607a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00
> [    0.003333] >ffffffff83607a80: f1 f1 f1 f1 f8 f2 f2 f2 f2 f2 f2 f2 00 =
f2 f2 f2

to be honest, this backtrace hardly makes any sense to me.

vprintk_emit()
 reserve_standard_io_resources()
  __flush_tlb_all()
   vprintk_emit()
    __down_trylock_console_sem()
     wake_up_klogd()
      console_unlock()

I need some help here.

	-ss

--===============7995096573528333697==--

