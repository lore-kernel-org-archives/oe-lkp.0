Content-Type: multipart/mixed; boundary="===============3645543715503395634=="
MIME-Version: 1.0
From: Gavin Shan <gshan@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug_vm_pgtable] 08cb589cb3: BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c
Date: Mon, 09 Aug 2021 18:49:53 +1000
Message-ID: <7a891ba4-dc7d-8fa3-5f0e-da99d34702d6@redhat.com>
In-Reply-To: <20210808142553.GD27482@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3645543715503395634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/9/21 12:25 AM, kernel test robot wrote:
>

[...]

> =

> [    9.433105][    T1] BUG: sleeping function called from invalid context=
 at mm/page_alloc.c:5170
> [    9.434513][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, =
pid: 1, name: swapper/0
> [    9.436116][    T1] no locks held by swapper/0/1.
> [    9.436923][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.14.0-r=
c4-00161-g08cb589cb3d2 #1
> [    9.438398][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [    9.439880][    T1] Call Trace:
> [ 9.440404][ T1] ? dump_stack_lvl (lib/dump_stack.c:106)
> [ 9.441154][ T1] ? dump_stack (lib/dump_stack.c:113)
> [ 9.441827][ T1] ? ___might_sleep.cold (kernel/sched/core.c:9155)
> [ 9.442645][ T1] ? __might_sleep (kernel/sched/core.c:9109 (discriminator=
 14))
> [ 9.444795][ T1] ? __alloc_pages (include/linux/kernel.h:104 mm/page_allo=
c.c:5170 mm/page_alloc.c:5380)
> [ 9.445583][ T1] ? mem_encrypt_init+0x1/0x1
> [ 9.446389][ T1] ? destroy_args (mm/debug_vm_pgtable.c:1219)
> [ 9.447193][ T1] ? debug_vm_pgtable (mm/debug_vm_pgtable.c:1208 mm/debug_=
vm_pgtable.c:1237)
> [ 9.448076][ T1] ? destroy_args (mm/debug_vm_pgtable.c:1219)
> [ 9.448863][ T1] ? do_one_initcall (init/main.c:1282)
> [ 9.449676][ T1] ? parse_args (kernel/params.c:190)
> [ 9.450470][ T1] ? kernel_init_freeable (init/main.c:1354 init/main.c:137=
1 init/main.c:1390 init/main.c:1592)
> [ 9.451358][ T1] ? rest_init (init/main.c:1476)
> [ 9.452063][ T1] ? kernel_init (init/main.c:1486)
> [ 9.452759][ T1] ? ret_from_fork (arch/x86/entry/entry_32.S:775)
> [    9.453815][    T1] ------------[ cut here ]------------

[...]

Thanks for reporting the issue. The same issue was reported against v4 seri=
es before,
but this time, it's raised on v5 series. Fortunately, this report provides =
more useful
information so that I can reproduce the issue locally and I'm going to fix =
the issue
in v6 since I need to address Anshuman's last comment on v5.

As to the root cause, pte_alloc_map() is used in init_args(). The PTE entry=
 is mapped
in atomic mode when CONFIG_HIGHPTE is enabled on i386. It means GFP_KERNEL =
isn't right
option to be used by alloc_pages() in init_args(). The fix is use pte_alloc=
() to replace
pte_alloc_map() and args->pte will be mapped when it's used in debug_vm_pgt=
able() for
PTE modifying tests. We need avoid atomic context lasting for too long.

Thanks,
Gavin

--===============3645543715503395634==--

