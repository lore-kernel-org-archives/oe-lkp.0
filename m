Content-Type: multipart/mixed; boundary="===============4529618938739583193=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [sched] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/cpu/common.c:1439 warn_pre_alternatives()
Date: Thu, 11 Dec 2014 00:56:58 +0100
Message-ID: <20141210235658.GB28630@pd.tnic>
In-Reply-To: <20141210232645.GD24163@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4529618938739583193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 03:26:45PM -0800, Fengguang Wu wrote:
> Hi Dietmar,
> =

> FYI, here is another bisect result.
> =

> https://git.linaro.org/people/mturquette/linux.git eas-next
> commit 1fadb581b0be9420b143e43ff2f4a07ea7e45f6c
> Author:     Dietmar Eggemann <dietmar.eggemann@arm.com>
> AuthorDate: Tue Dec 2 14:06:24 2014 +0000
> Commit:     Michael Turquette <mturquette@deferred.io>
> CommitDate: Tue Dec 9 20:33:17 2014 -0800
> =

>     sched: Make usage and load tracking cpu scale-invariant
>     =

>     Besides the existing frequency scale-invariance correction factor, ap=
ply
>     cpu scale-invariance correction factor to usage and load tracking.
>     =

>     Cpu scale-invariance takes cpu performance deviations due to
>     micro-architectural differences (i.e. instructions per seconds) betwe=
en
>     cpus in HMP systems (e.g. big.LITTLE) and differences in the frequency
>     value of the highest OPP between cpus in SMP systems into considerati=
on.
>     =

>     Each segment of the sched_avg::{running_avg_sum, runnable_avg_sum}
>     geometric series is now scaled by the cpu performance factor too so t=
he
>     sched_avg::{utilization_avg_contrib, load_avg_contrib} of each entity=
 will
>     be invariant from the particular cpu of the HMP/SMP system it is gath=
ered
>     on. As a result, cfs_rq::runnable_load_avg which is the sum of
>     sched_avg::load_avg_contrib, becomes cpu scale-invariant too.
>     =

>     So the {usage, load} level that is returned by {get_cpu_usage,
>     weighted_cpuload} stays relative to the max cpu performance of the sy=
stem.
>     =

>     Cc: Ingo Molnar <mingo@redhat.com>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Signed-off-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> PARENT COMMIT NOT CLEAN. LOOK OUT FOR WRONG BISECT!
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> =

> Attached dmesg for the parent commit, too, to help confirm whether it is =
a noise error.
> =

> +------------------------------------------------------------------+-----=
-------+------------+------------+
> |                                                                  | e754=
569101 | 1fadb581b0 | 1e7327cb22 |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> | boot_successes                                                   | 0   =
       | 0          | 0          |
> | boot_failures                                                    | 80  =
       | 20         | 14         |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 80  =
       |            |            |
> | backtrace:lock_torture_stats                                     | 80  =
       |            |            |
> | WARNING:at_arch/x86/kernel/cpu/common.c:#warn_pre_alternatives() | 0   =
       | 19         | 14         |
> | BUG:unable_to_handle_kernel                                      | 0   =
       | 19         | 14         |
> | Oops                                                             | 0   =
       | 19         | 14         |
> | RIP:arch_scale_cpu_capacity                                      | 0   =
       | 19         | 14         |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt            | 0   =
       | 19         | 14         |
> | backtrace:acpi_load_tables                                       | 0   =
       | 19         | 14         |
> | backtrace:acpi_early_init                                        | 0   =
       | 19         | 14         |
> | BUG:kernel_boot_crashed                                          | 0   =
       | 1          |            |
> +------------------------------------------------------------------+-----=
-------+------------+------------+
> =

> [    0.020000] pid_max: default: 32768 minimum: 301
> [    0.020000] ACPI: Core revision 20140926
> [    0.020006] ------------[ cut here ]------------
> [    0.021391] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/cpu/common.c:143=
9 warn_pre_alternatives+0x2e/0x40()
> [    0.024425] You're using static_cpu_has before alternatives have run!

This says it...

> [    0.026159] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.18.0-rc2-g1fad=
b58 #507
> [    0.028350] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [    0.029899]  0000000000000009 ffff8800126039f8 ffffffff82d77315 ffff88=
0012603a48
> [    0.030000]  0000000000000009 ffff880012603a38 ffffffff81105674 000000=
0000000000
> [    0.030000]  0000000000000050 ffffffff83c7de40 0000000000000000 000000=
0000000060
> [    0.030000] Call Trace:
> [    0.030000]  <IRQ>  [<ffffffff82d77315>] dump_stack+0xc5/0x175
> [    0.030000]  [<ffffffff81105674>] warn_slowpath_common+0xc4/0x100
> [    0.030000]  [<ffffffff81105746>] warn_slowpath_fmt+0x56/0x60
> [    0.030000]  [<ffffffff81034dde>] warn_pre_alternatives+0x2e/0x40
> [    0.030000]  [<ffffffff81092831>] __do_page_fault+0x4f1/0x1060

... and it looks like it might be smap_violation() which uses
static_cpu_has() in __do_page_fault(). To verify, one would have to
rebuild with the attached config and peek at __do_page_fault+0x4f1 to
see whether that is actually the case.

-- =

Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--

--===============4529618938739583193==--

