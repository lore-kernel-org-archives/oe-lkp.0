Content-Type: multipart/mixed; boundary="===============4367176922787297816=="
MIME-Version: 1.0
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 5541e53659: BUG:spinlock_bad_magic_on_CPU
Date: Thu, 04 Nov 2021 17:39:44 +0100
Message-ID: <3190fc080138108c189626e22676aaae80b72414.camel@redhat.com>
In-Reply-To: <20211104143809.GB6499@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4367176922787297816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-11-04 at 22:38 +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 5541e5365954069e4c7b649831c0e41bc9e5e081 ("[PATCH v2 2/3] mm/page=
_alloc: Convert per-cpu lists' local locks to per-cpu spin locks")
> url: https://github.com/0day-ci/linux/commits/Nicolas-Saenz-Julienne/mm-p=
age_alloc-Remote-per-cpu-page-list-drain-support/20211104-010825
> base: https://github.com/hnaz/linux-mm master
> patch link: https://lore.kernel.org/lkml/20211103170512.2745765-3-nsaenzj=
u(a)redhat.com
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------------------------+------------+------------+
> >                                            | 69c421f2b4 | 5541e53659 |
> +--------------------------------------------+------------+------------+
> > boot_successes                             | 11         | 0          |
> > boot_failures                              | 0          | 11         |
> > BUG:spinlock_bad_magic_on_CPU              | 0          | 11         |
> > BUG:using_smp_processor_id()in_preemptible | 0          | 11         |
> +--------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [    0.161872][    T0] BUG: spinlock bad magic on CPU#0, swapper/0
> [    0.162248][    T0]  lock: 0xeb24bef0, .magic: 00000000, .owner: swapp=
er/0, .owner_cpu: 0
> [    0.162767][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0-rc7=
-mm1-00437-g5541e5365954 #1
> [    0.163325][    T0] Call Trace:
> [ 0.163524][ T0] dump_stack_lvl (lib/dump_stack.c:107 (discriminator 4)) =

> [ 0.163802][ T0] dump_stack (lib/dump_stack.c:114) =

> [ 0.164050][ T0] spin_bug (kernel/locking/spinlock_debug.c:70 kernel/lock=
ing/spinlock_debug.c:77) =

> [ 0.164296][ T0] do_raw_spin_unlock (arch/x86/include/asm/atomic.h:29 inc=
lude/linux/atomic/atomic-instrumented.h:28 include/asm-generic/qspinlock.h:=
28 kernel/locking/spinlock_debug.c:100 kernel/locking/spinlock_debug.c:140) =

> [ 0.164624][ T0] _raw_spin_unlock_irqrestore (include/linux/spinlock_api_=
smp.h:160 kernel/locking/spinlock.c:194) =

> [ 0.164971][ T0] free_unref_page (include/linux/spinlock.h:423 mm/page_al=
loc.c:3400) =

> [ 0.165253][ T0] free_the_page (mm/page_alloc.c:699) =

> [ 0.165521][ T0] __free_pages (mm/page_alloc.c:5453) =

> [ 0.165785][ T0] add_highpages_with_active_regions (include/linux/mm.h:25=
11 arch/x86/mm/init_32.c:416) =

> [ 0.166179][ T0] set_highmem_pages_init (arch/x86/mm/highmem_32.c:30) =

> [ 0.166501][ T0] mem_init (arch/x86/mm/init_32.c:749 (discriminator 2)) =

> [ 0.166749][ T0] start_kernel (init/main.c:842 init/main.c:988) =

> [ 0.167026][ T0] ? early_idt_handler_common (arch/x86/kernel/head_32.S:41=
7) =

> [ 0.167369][ T0] i386_start_kernel (arch/x86/kernel/head32.c:57) =

> [ 0.167662][ T0] startup_32_smp (arch/x86/kernel/head_32.S:328) =


I did test this with lock debugging enabled, but I somehow missed this stack
trace. Here's the fix:

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 7dbdab100461..c8964e28aa59 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6853,6 +6853,7 @@ static void per_cpu_pages_init(struct per_cpu_pages *=
pcp, struct per_cpu_zonesta
        pcp->high =3D BOOT_PAGESET_HIGH;
        pcp->batch =3D BOOT_PAGESET_BATCH;
        pcp->free_factor =3D 0;
+       spin_lock_init(&pcp->lock);
 }
 =

 static void __zone_set_pageset_high_and_batch(struct zone *zone, unsigned =
long high,
@@ -6902,7 +6903,6 @@ void __meminit setup_zone_pageset(struct zone *zone)
                struct per_cpu_zonestat *pzstats;
 =

                pcp =3D per_cpu_ptr(zone->per_cpu_pageset, cpu);
-               spin_lock_init(&pcp->lock);
                pzstats =3D per_cpu_ptr(zone->per_cpu_zonestats, cpu);
                per_cpu_pages_init(pcp, pzstats);
        }

-- =

Nicol=C3=A1s S=C3=A1enz

--===============4367176922787297816==--

