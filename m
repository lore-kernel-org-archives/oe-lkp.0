Content-Type: multipart/mixed; boundary="===============1429870759609743664=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: [console_unlock] BUG: KASAN: use-after-scope in console_unlock+0x9cd/0xd10
Date: Thu, 19 Apr 2018 08:04:15 +0200
Message-ID: <CACT4Y+bmYk_A4NcOhCeHcG4t5_c=Q1fmQOPxHLtC8G0hLrxSLA@mail.gmail.com>
In-Reply-To: <20180419021757.66xxs5fgvlrusiup@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1429870759609743664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 19, 2018 at 4:17 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Hello,
>
> FYI this happens in mainline kernel 4.17.0-rc1.
> It at least dates back to v4.15-rc1 .
>
> The regression was reported before
>
>          https://lkml.org/lkml/2017/11/30/33
>
> Where the last message from Dmitry mentions that use-after-scope has
> known false positives with CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL=3Dy
> If so, what would be the best way to workaround such false positives
> in boot testing? Disable the above config?

Hi Fengguang,

As a short-term solution, yes, disable one of them.
But we need a bug filed on structleak plugin, it inserts zeroing at a
wrong place.
We could also make them mutually exclusive in config to prevent people
from hitting these false positives again and again.


> 0day bisects produce diverged results, with 2 of them converge to
> commit d17a1d97dc ("x86/mm/kasan: don't use vmemmap_populate() to
> initialize shadow") and 1 bisected to the earlier a4a3ede213 ("mm:
> zero reserved and unavailable struct pages"). I'll send the bisect
> reports in follow up emails.
>
> This occurs in 6 out of 6 boots.
>
> [    0.001000]  RCU CPU stall warnings timeout set to 100 (rcu_cpu_stall_=
timeout).
> [    0.001000]  Tasks RCU enabled.
> [    0.001000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D1
> [    0.001000] NR_IRQS: 4352, nr_irqs: 48, preallocated irqs: 16
> [    0.001000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.001000] BUG: KASAN: use-after-scope in console_unlock+0x9cd/0xd10:
>                                                 console_unlock at kernel/=
printk/printk.c:2396
> [    0.001000] Write of size 1 at addr ffffffff84c07998 by task swapper/0
> [    0.001000]
> [    0.001000] CPU: 0 PID: 0 Comm: swapper Tainted: G                T 4.=
17.0-rc1 #1
> [    0.001000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    0.001000] Call Trace:
> [    0.001000]  ? dump_stack+0x11a/0x20b:
>                                                 dump_stack at lib/dump_st=
ack.c:115
> [    0.001000]  ? show_regs_print_info+0x5/0x5:
>                                                 dump_stack at lib/dump_st=
ack.c:89
> [    0.001000]  ? do_raw_spin_trylock+0xee/0x190:
>                                                 arch_atomic_cmpxchg at ar=
ch/x86/include/asm/atomic.h:191
>                                                  (inlined by) atomic_cmpx=
chg at include/asm-generic/atomic-instrumented.h:58
>                                                  (inlined by) queued_spin=
_trylock at include/asm-generic/qspinlock.h:72
>                                                  (inlined by) do_raw_spin=
_trylock at kernel/locking/spinlock_debug.c:119
> [    0.001000]  ? print_address_description+0x24/0x330:
>                                                 print_address_description=
 at mm/kasan/report.c:257
> [    0.001000]  ? kasan_report+0x22a/0x380:
>                                                 kasan_report_error at mm/=
kasan/report.c:355
>                                                  (inlined by) kasan_repor=
t at mm/kasan/report.c:412
> [    0.001000]  ? console_unlock+0x9cd/0xd10:
>                                                 console_unlock at kernel/=
printk/printk.c:2396
> [    0.001000]  ? lock_acquire+0x4d0/0x560:
>                                                 get_current at arch/x86/i=
nclude/asm/current.h:15
>                                                  (inlined by) lock_acquir=
e at kernel/locking/lockdep.c:3922
> [    0.001000]  ? vprintk_emit+0x555/0x880:
>                                                 console_trylock_spinning =
at kernel/printk/printk.c:1643
>                                                  (inlined by) vprintk_emi=
t at kernel/printk/printk.c:1906
> [    0.001000]  ? wake_up_klogd+0x110/0x110:
>                                                 console_unlock at kernel/=
printk/printk.c:2289
> [    0.001000]  ? lock_release+0xf80/0xf80:
>                                                 lock_acquire at kernel/lo=
cking/lockdep.c:3909
> [    0.001000]  ? do_raw_spin_trylock+0x190/0x190:
>                                                 do_raw_spin_unlock at ker=
nel/locking/spinlock_debug.c:133
> [    0.001000]  ? trace_hardirqs_on+0x3f0/0x400:
>                                                 trace_hardirqs_on at kern=
el/trace/trace_irqsoff.c:795
> [    0.001000]  ? vprintk_emit+0x555/0x880:
>                                                 console_trylock_spinning =
at kernel/printk/printk.c:1643
>                                                  (inlined by) vprintk_emi=
t at kernel/printk/printk.c:1906
> [    0.001000]  ? vprintk_emit+0x813/0x880:
>                                                 __preempt_count_sub at ar=
ch/x86/include/asm/preempt.h:81
>                                                  (inlined by) vprintk_emi=
t at kernel/printk/printk.c:1908
> [    0.001000]  ? console_unlock+0xd10/0xd10:
>                                                 vprintk_emit at kernel/pr=
intk/printk.c:1830
> [    0.001000]  ? memblock_add+0x163/0x163:
>                                                 memblock_reserve at mm/me=
mblock.c:716
> [    0.001000]  ? lock_release+0xf23/0xf80:
>                                                 lock_release at kernel/lo=
cking/lockdep.c:3929
> [    0.001000]  ? memblock_virt_alloc_internal+0x191/0x2ef:
>                                                 memblock_virt_alloc_inter=
nal at mm/memblock.c:1277 (discriminator 1)
> [    0.001000]  ? memset+0x1f/0x40:
>                                                 memset at mm/kasan/kasan.=
c:287
> [    0.001000]  ? zero_pud_populate+0x5b1/0x936:
>                                                 set_pmd at arch/x86/inclu=
de/asm/paravirt.h:468
>                                                  (inlined by) pmd_populat=
e_kernel at arch/x86/include/asm/pgalloc.h:80
>                                                  (inlined by) zero_pmd_po=
pulate at mm/kasan/kasan_init.c:76
>                                                  (inlined by) zero_pud_po=
pulate at mm/kasan/kasan_init.c:109
> [    0.001000]  ? printk+0x9c/0xc3:
>                                                 printk at kernel/printk/p=
rintk.c:1975
> [    0.001000]  ? kmsg_dump_rewind+0x134/0x134:
>                                                 printk at kernel/printk/p=
rintk.c:1975
> [    0.001000]  ? kasan_init+0x413/0x4af:
>                                                 __flush_tlb_global at arc=
h/x86/include/asm/paravirt.h:299
>                                                  (inlined by) __flush_tlb=
_all at arch/x86/include/asm/tlbflush.h:433
>                                                  (inlined by) kasan_init =
at arch/x86/mm/kasan_init_64.c:390
> [    0.001000]  ? setup_arch+0x1fdf/0x225a:
>                                                 setup_arch at arch/x86/ke=
rnel/setup.c:1216
> [    0.001000]  ? reserve_standard_io_resources+0x88/0x88:
>                                                 setup_arch at arch/x86/ke=
rnel/setup.c:816
> [    0.001000]  ? debug_check_no_locks_freed+0x241/0x280:
>                                                 debug_check_no_locks_free=
d at kernel/locking/lockdep.c:4422 (discriminator 1)
> [    0.001000]  ? printk+0x9c/0xc3:
>                                                 printk at kernel/printk/p=
rintk.c:1975
> [    0.001000]  ? kmsg_dump_rewind+0x134/0x134:
>                                                 printk at kernel/printk/p=
rintk.c:1975
> [    0.001000]  ? do_device_not_available+0x60/0x60:
>                                                 idt_setup_from_table at a=
rch/x86/kernel/idt.c:220
> [    0.001000]  ? start_kernel+0xf3/0xfd4:
>                                                 add_latent_entropy at inc=
lude/linux/random.h:26
>                                                  (inlined by) start_kerne=
l at init/main.c:556
> [    0.001000]  ? early_idt_handler_common+0x3b/0x52:
>                                                 early_idt_handler_common =
at arch/x86/kernel/head_64.S:327
> [    0.001000]  ? mem_encrypt_init+0x33/0x33
> [    0.001000]  ? memcpy_orig+0x54/0x110:
>                                                 memcpy_orig at arch/x86/l=
ib/memcpy_64.S:106
> [    0.001000]  ? secondary_startup_64+0xa5/0xb0:
>                                                 secondary_startup_64 at a=
rch/x86/kernel/head_64.S:242
> [    0.001000]
> [    0.001000] Memory state around the buggy address:
> [    0.001000]  ffffffff84c07880: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00
> [    0.001000]  ffffffff84c07900: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 f1
> [    0.001000] >ffffffff84c07980: f1 f1 f1 f8 f2 f2 f2 f2 f2 f2 f2 01 f2 =
f2 f2 f2
>
> Attached the full dmesg, kconfig and reproduce scripts.
>
> Thanks,
> Fengguang
>
> --
> You received this message because you are subscribed to the Google Groups=
 "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kasan-dev+unsubscribe(a)googlegroups.com.
> To post to this group, send email to kasan-dev(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kasan-dev/20180419021757.66xxs5fgvlrusiup%40wfg-t540p.sh.intel.com.
> For more options, visit https://groups.google.com/d/optout.

--===============1429870759609743664==--

