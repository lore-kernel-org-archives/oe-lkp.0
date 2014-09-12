Content-Type: multipart/mixed; boundary="===============7926050278392857934=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] BUG: unable to handle kernel NULL pointer dereference at 000000da
Date: Fri, 12 Sep 2014 12:02:38 -0700
Message-ID: <20140912190238.GJ4775@linux.vnet.ibm.com>
In-Reply-To: <20140901084403.GA18808@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7926050278392857934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2014 at 04:44:04PM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit d860d40327dde251d508a234fa00bd0d90fbb656
> Author:     Shan Wei <davidshan@tencent.com>
> AuthorDate: Thu Jun 19 14:12:44 2014 -0700
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Wed Jul 9 09:15:21 2014 -0700

Hearing nothing from Shan or Pranith...

So, I am not seeing this failure in my testing, but my best guess is
that the problem is due to the fact that force_quiescent_state() is
sometimes invoked with preemption enabled, which breaks __this_cpu_read()
though perhaps with very low probability.  The common-case call (from
__call_rcu_core()) -does- have preemption disabled, in fact, it has
interrupts disabled.

So unless I hear otherwise, I will simply revert this commit.

							Thanx, Paul

>     rcu: Use __this_cpu_read() instead of per_cpu_ptr()
>     =

>     The __this_cpu_read() function produces better code than does
>     per_cpu_ptr() on both ARM and x86.  For example, gcc (Ubuntu/Linaro
>     4.7.3-12ubuntu1) 4.7.3 produces the following:
>     =

>     ARMv7 per_cpu_ptr():
>     =

>     force_quiescent_state:
>         mov    r3, sp    @,
>         bic    r1, r3, #8128    @ tmp171,,
>         ldr    r2, .L98    @ tmp169,
>         bic    r1, r1, #63    @ tmp170, tmp171,
>         ldr    r3, [r0, #220]    @ __ptr, rsp_6(D)->rda
>         ldr    r1, [r1, #20]    @ D.35903_68->cpu, D.35903_68->cpu
>         mov    r6, r0    @ rsp, rsp
>         ldr    r2, [r2, r1, asl #2]    @ tmp173, __per_cpu_offset
>         add    r3, r3, r2    @ tmp175, __ptr, tmp173
>         ldr    r5, [r3, #12]    @ rnp_old, D.29162_13->mynode
>     =

>     ARMv7 __this_cpu_read():
>     =

>     force_quiescent_state:
>         ldr    r3, [r0, #220]    @ rsp_7(D)->rda, rsp_7(D)->rda
>         mov    r6, r0    @ rsp, rsp
>         add    r3, r3, #12    @ __ptr, rsp_7(D)->rda,
>         ldr    r5, [r2, r3]    @ rnp_old, *D.29176_13
>     =

>     Using gcc 4.8.2:
>     =

>     x86_64 per_cpu_ptr():
>     =

>         movl %gs:cpu_number,%edx    # cpu_number, pscr_ret__
>         movslq    %edx, %rdx    # pscr_ret__, pscr_ret__
>         movq    __per_cpu_offset(,%rdx,8), %rdx    # __per_cpu_offset, tm=
p93
>         movq    %rdi, %r13    # rsp, rsp
>         movq    1000(%rdi), %rax    # rsp_9(D)->rda, __ptr
>         movq    24(%rdx,%rax), %r12    # _15->mynode, rnp_old
>     =

>     x86_64 __this_cpu_read():
>     =

>         movq    %rdi, %r13    # rsp, rsp
>         movq    1000(%rdi), %rax    # rsp_9(D)->rda, rsp_9(D)->rda
>         movq %gs:24(%rax),%r12    # _10->mynode, rnp_old
>     =

>     Because this change produces significant benefits for these two very
>     diverse architectures, this commit makes this change.
>     =

>     Signed-off-by: Shan Wei <davidshan@tencent.com>
>     Acked-by: Christoph Lameter <cl@linux.com>
>     Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>     Reviewed-by: Josh Triplett <josh@joshtriplett.org>
>     Reviewed-by: Lai Jiangshan <laijs@cn.fujitsu.com>
> =

> +---------------------------------------------------------------+--------=
----+------------+------------+
> |                                                               | bc1dce5=
14e | d860d40327 | 9687fd9101 |
> +---------------------------------------------------------------+--------=
----+------------+------------+
> | boot_successes                                                | 60     =
    | 0          | 0          |
> | boot_failures                                                 | 0      =
    | 20         | 586        |
> | BUG:unable_to_handle_kernel_NULL_pointer_dereference          | 0      =
    | 20         |            |
> | Oops                                                          | 0      =
    | 20         | 586        |
> | EIP_is_at_update_curr                                         | 0      =
    | 20         |            |
> | Kernel_panic-not_syncing:Fatal_exception                      | 0      =
    | 20         | 586        |
> | backtrace:register_tracer                                     | 0      =
    | 20         | 586        |
> | backtrace:init_branch_tracer                                  | 0      =
    | 20         | 586        |
> | backtrace:kernel_init_freeable                                | 0      =
    | 20         | 586        |
> | WARNING:at_kernel/trace/ring_buffer.c:rb_reserve_next_event() | 0      =
    | 0          | 10         |
> | BUG:spinlock_bad_magic_on_CPU                                 | 0      =
    | 0          | 586        |
> | BUG:unable_to_handle_kernel_paging_request                    | 0      =
    | 0          | 586        |
> | EIP_is_at_spin_dump                                           | 0      =
    | 0          | 586        |
> | backtrace:init_irqsoff_tracer                                 | 0      =
    | 0          | 10         |
> +---------------------------------------------------------------+--------=
----+------------+------------+
> =

> [    0.317670] Testing tracer wakeup_dl: ret =3D 0
> [    0.420620] PASSED
> [    0.420978] Testing tracer branch: =

> [    0.421701] BUG: unable to handle kernel NULL pointer dereference at 0=
00000da
> [    0.422857] IP: [<c1061074>] update_curr+0x1a3/0x2c3
> [    0.423639] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53 =

> [    0.424000] Thread overran stack, or stack corrupted
> [    0.424000] Oops: 0000 [#1] PREEMPT =

> [    0.424000] CPU: 0 PID: 1 Comm: swapper Not tainted 3.16.0-rc1-00015-g=
d860d40 #13
> [    0.424000] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [    0.424000] task: d2034000 ti: d2036000 task.ti: d2036000
> [    0.424000] EIP: 0060:[<c1061074>] EFLAGS: 00010046 CPU: 0
> [    0.424000] EIP is at update_curr+0x1a3/0x2c3
> [    0.424000] EAX: 00000002 EBX: 00000000 ECX: d2191000 EDX: c10a7570
> [    0.424000] ESI: d203402c EDI: c1a41714 EBP: d2037dac ESP: d2037d8c
> [    0.424000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    0.424000] CR0: 80050033 CR2: 000000da CR3: 01bb9000 CR4: 000406b0
> [    0.424000] Stack:
> [    0.424000]  c1959c60 0543a506 00000000 001833f6 00000000 c1a41714 d20=
3402c 00000001
> [    0.424000]  d2037dd0 c10614ce d2191b98 d2037dc0 c106ae67 d2037dec d20=
3402c c1a41714
> [    0.424000]  c1a416c0 d2037dec c10616df 00000001 00000001 c1a416c0 d20=
34000 c16bf6e0
> [    0.424000] Call Trace:
> [    0.424000]  [<c10614ce>] dequeue_entity+0x14/0x1fb
> [    0.424000]  [<c106ae67>] ? trace_hardirqs_off+0xb/0xd
> [    0.424000]  [<c10616df>] dequeue_task_fair+0x2a/0x94
> [    0.424000]  [<c105b7fc>] dequeue_task+0x9f/0xa7
> [    0.424000]  [<c105bd86>] deactivate_task+0x1c/0x1f
> [    0.424000]  [<c16ac296>] __schedule+0x1c0/0x8a1
> [    0.424000]  [<c106ad31>] ? trace_hardirqs_on+0xb/0xd
> [    0.424000]  [<c106ab81>] ? trace_hardirqs_on_caller+0x11/0x1b6
> [    0.424000]  [<c106ad31>] ? trace_hardirqs_on+0xb/0xd
> [    0.424000]  [<c16ac986>] schedule+0xf/0x11
> [    0.424000]  [<c16abd32>] schedule_timeout+0x17a/0x22e
> [    0.424000]  [<c103fc0a>] ? cascade+0x75/0x75
> [    0.424000]  [<c16abe26>] schedule_timeout_uninterruptible+0x14/0x16
> [    0.424000]  [<c1040f3f>] msleep+0x12/0x16
> [    0.424000]  [<c10a3849>] trace_selftest_startup_branch+0x34/0x72
> [    0.424000]  [<c10a3bcf>] register_tracer+0x113/0x204
> [    0.424000]  [<c1b437aa>] ? init_wakeup_tracer+0x2b/0x2b
> [    0.424000]  [<c1b437d7>] init_branch_tracer+0x2d/0x2f
> [    0.424000]  [<c1b2dc65>] do_one_initcall+0x188/0x197
> [    0.424000]  [<c1b2d400>] ? do_early_param+0x28/0x73
> [    0.424000]  [<c105159f>] ? parse_args+0x188/0x235
> [    0.424000]  [<c1b2dd4a>] kernel_init_freeable+0xd6/0x14e
> [    0.424000]  [<c1699f0c>] kernel_init+0x8/0xb8
> [    0.424000]  [<c16b0ea0>] ret_from_kernel_thread+0x20/0x30
> [    0.424000]  [<c1699f04>] ? rest_init+0x10c/0x10c
> [    0.424000] Code: ff 0d 5c 46 a3 c1 0f 84 df 00 00 00 31 db 31 c9 89 d=
a b8 f0 b6 af c1 e8 ec 63 04 00 85 db 74 05 e8 92 75 fa ff 8b 86 d8 03 00 0=
0 <83> b8 d8 00 00 00 00 89 45 e4 74 21 83 be dc 03 00 00 00 b8 dc
> [    0.424000] EIP: [<c1061074>] update_curr+0x1a3/0x2c3 SS:ESP 0068:d203=
7d8c
> [    0.424000] CR2: 00000000000000da
> [    0.424000] ---[ end trace a6f0f5be4ed0ab92 ]---
> [    0.424000] Kernel panic - not syncing: Fatal exception
> =

> git bisect start 9687fd9101afaa1c4b1de7ffd2f9d7e53f45b29f v3.16 --
> git bisect  bad ad0200f72d9875caa2023c59240ee677df66918e  # 12:13      0-=
     20  drivers/rtc/Kconfig: move DS2404 entry where it belongs
> git bisect  bad ed5c41d30ef2ce578fd6b6e2f7ec23f2a58b1eba  # 12:17      0-=
     57  x86: MCE: Add raw_lock conversion again
> git bisect  bad 19d402c1e75077e2bcfe17f7fe5bcfc8deb74991  # 12:22      0-=
     20  Merge branches 'x86-build-for-linus', 'x86-cleanups-for-linus' and=
 'x86-debug-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip=
/tip
> git bisect good c7ed326fa7cafb83ced5a8b02517a61672fe9e90  # 12:37     20+=
     20  Merge tag 'ktest-v3.17' of git://git.kernel.org/pub/scm/linux/kern=
el/git/rostedt/linux-ktest
> git bisect good 489f50be56185fa3492690caedc099d507bf7c98  # 12:40     20+=
     20  Merge tag 'please-pull-misc-3.17' of git://git.kernel.org/pub/scm/=
linux/kernel/git/aegl/linux
> git bisect  bad 8efb90cf1e80129fad197b916714e1d01ee183d2  # 12:45      0-=
     20  Merge branch 'locking-core-for-linus' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tip/tip
> git bisect good a45c657f28f82b056173d1afc2e7ed1f1f68829f  # 12:50     20+=
     20  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/geert/linux-m68k
> git bisect  bad 5bda4f638f36ef4c4e3b1397b02affc3db94356e  # 12:53      0-=
     20  Merge branch 'core-rcu-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
> git bisect  bad b41d1b924d0bd41a225a17f39297b9de0dca93d9  # 12:56      0-=
     20  rcu: Fix a sparse warning in rcu_report_unblock_qs_rnp()
> git bisect good dfeb9765ce3c33cb3cbc5f16db423f1c58a4cc55  # 13:12     20+=
     20  rcu: Allow post-unlock reference for rt_mutex
> git bisect good bc1dce514e9b29b64df28a533015885862f47814  # 13:15     20+=
      0  rcu: Don't use NMIs to dump other CPUs' stacks
> git bisect  bad 11992c703a1c7d95f5d8759498d7617d4a504819  # 13:21      0-=
      3  rcu: Remove CONFIG_PROVE_RCU_DELAY
> git bisect  bad d860d40327dde251d508a234fa00bd0d90fbb656  # 13:24      0-=
      9  rcu: Use __this_cpu_read() instead of per_cpu_ptr()
> # first bad commit: [d860d40327dde251d508a234fa00bd0d90fbb656] rcu: Use _=
_this_cpu_read() instead of per_cpu_ptr()
> git bisect good bc1dce514e9b29b64df28a533015885862f47814  # 13:29     60+=
      0  rcu: Don't use NMIs to dump other CPUs' stacks
> git bisect  bad d7cf2b3139909a354a71e2885c942e21a60ea062  # 13:29      0-=
     51  Add linux-next specific files for 20140829
> git bisect  bad 69e273c0b0a3c337a521d083374c918dc52c666f  # 13:29      0-=
     60  Linux 3.17-rc3
> git bisect  bad d7cf2b3139909a354a71e2885c942e21a60ea062  # 13:29      0-=
     51  Add linux-next specific files for 20140829
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep,+smap
> 	-kernel $kernel
> 	-m 320
> 	-smp 2
> 	-net nic,vlan=3D1,model=3De1000
> 	-net user,vlan=3D1
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null =

> )
> =

> append=3D(
> 	hung_task_panic=3D1
> 	earlyprintk=3DttyS0,115200
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	root=3D/dev/ram0
> 	rw
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
> =

> Thanks,
> Fengguang

> early console in setup code
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.16.0-rc1-00015-gd860d40 (kbuild(a)jaketown=
) (gcc version 4.8.2 (Debian 4.8.2-18) ) #13 PREEMPT Mon Sep 1 13:22:09 CST=
 2014
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Intel GenuineIntel
> [    0.000000]   NSC Geode by NSC
> [    0.000000]   Cyrix CyrixInstead
> [    0.000000]   UMC UMC UMC UMC
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000013ffdfff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000013ffe000-0x0000000013ffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] res=
erved
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] SMBIOS 2.4 present.
> [    0.000000] DMI: Bochs Bochs, BIOS Bochs 01/01/2011
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x13ffe max_arch_pfn =3D 0x1000000
> [    0.000000] initial memory mapped: [mem 0x00000000-0x027fffff]
> [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x12400000-0x125fffff]
> [    0.000000]  [mem 0x12400000-0x125fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x10000000-0x123fffff]
> [    0.000000]  [mem 0x10000000-0x123fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x0fffffff]
> [    0.000000]  [mem 0x00100000-0x001fffff] page 4k
> [    0.000000]  [mem 0x00200000-0x0fffffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x12600000-0x13ffdfff]
> [    0.000000]  [mem 0x12600000-0x13dfffff] page 2M
> [    0.000000]  [mem 0x13e00000-0x13ffdfff] page 4k
> [    0.000000] BRK [0x0238a000, 0x0238afff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x127ab000-0x13feffff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000FD950 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x13FFE450 000034 (v01 BOCHS  BXPCRSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x13FFFF80 000074 (v01 BOCHS  BXPCFACP 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x13FFE490 0011A9 (v01 BXPC   BXDSDT   00000001=
 INTL 20100528)
> [    0.000000] ACPI: FACS 0x13FFFF40 000040
> [    0.000000] ACPI: SSDT 0x13FFF7A0 000796 (v01 BOCHS  BXPCSSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x13FFF680 000080 (v01 BOCHS  BXPCAPIC 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x13FFF640 000038 (v01 BOCHS  BXPCHPET 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffb000 (        fee00000)
> [    0.000000] 0MB HIGHMEM available.
> [    0.000000] 319MB LOWMEM available.
> [    0.000000]   mapped low ram: 0 - 13ffe000
> [    0.000000]   low ram: 0 - 13ffe000
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:13ffd001, primary cpu clock
> [    0.000000] BRK [0x0238b000, 0x0238bfff] PGTABLE
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
> [    0.000000]   Normal   [mem 0x01000000-0x13ffdfff]
> [    0.000000]   HighMem  empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00001000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x13ffdfff]
> [    0.000000] On node 0 totalpages: 81820
> [    0.000000] free_area_init_node: node 0, pgdat c1af1000, node_mem_map =
d252b020
> [    0.000000]   DMA zone: 32 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   Normal zone: 608 pages used for memmap
> [    0.000000]   Normal zone: 77822 pages, LIFO batch:15
> [    0.000000] Using APIC driver default
> [    0.000000] ACPI: PM-Timer IO Port: 0xb008
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffb000 (        fee00000)
> [    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
> [    0.000000] ACPI: NR_CPUS/possible_cpus limit of 1 reached.  Processor=
 1/0x1 ignored.
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> [    0.000000] ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
> [    0.000000] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI =
0-23
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0, API=
C INT 02
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0, API=
C INT 05
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0, API=
C INT 09
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high lev=
el)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0, API=
C INT 0a
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high lev=
el)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0, API=
C INT 0b
> [    0.000000] ACPI: IRQ0 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 0, API=
C INT 01
> [    0.000000] ACPI: IRQ2 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 0, API=
C INT 03
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 0, API=
C INT 04
> [    0.000000] ACPI: IRQ5 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 0, API=
C INT 06
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 0, API=
C INT 07
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 0, API=
C INT 08
> [    0.000000] ACPI: IRQ9 used by override.
> [    0.000000] ACPI: IRQ10 used by override.
> [    0.000000] ACPI: IRQ11 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 0, API=
C INT 0c
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 0, API=
C INT 0d
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 0, API=
C INT 0e
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 0, API=
C INT 0f
> [    0.000000] Using ACPI (MADT) for SMP configuration information
> [    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> [    0.000000] mapped IOAPIC to ffffa000 (fec00000)
> [    0.000000] nr_irqs_gsi: 40
> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1a3c480
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> [    0.000000] pcpu-alloc: [0] 0 =

> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 81180
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_ti=
meout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpan=
ic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty=
0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests/run-queue/kvm/i386=
-randconfig-x0-09010313/next:master:d860d40327dde251d508a234fa00bd0d90fbb65=
6:bisect-linux-0/.vmlinuz-d860d40327dde251d508a234fa00bd0d90fbb656-20140901=
132224-2-kbuild branch=3Dnext/master BOOT_IMAGE=3D/kernel/i386-randconfig-x=
0-09010313/d860d40327dde251d508a234fa00bd0d90fbb656/vmlinuz-3.16.0-rc1-0001=
5-gd860d40 drbd.minor_count=3D8
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340
> [    0.000000] Initializing HighMem for node 0 (00000000:00000000)
> [    0.000000] Memory: 279300K/327280K available (6856K kernel code, 1039=
K rwdata, 3540K rodata, 548K init, 7932K bss, 47980K reserved, 0K highmem)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xfffa1000 - 0xfffff000   ( 376 kB)
> [    0.000000]     pkmap   : 0xffc00000 - 0xffe00000   (2048 kB)
> [    0.000000]     vmalloc : 0xd47fe000 - 0xffbfe000   ( 692 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd3ffe000   ( 319 MB)
> [    0.000000]       .init : 0xc1b2d000 - 0xc1bb6000   ( 548 kB)
> [    0.000000]       .data : 0xc16b255f - 0xc1b2bd60   (4582 kB)
> [    0.000000]       .text : 0xc1000000 - 0xc16b255f   (6857 kB)
> [    0.000000] Checking if this processor honours the WP bit even in supe=
rvisor mode...Ok.
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000] NR_IRQS:2304 nr_irqs:256 16
> [    0.000000] CPU 0 irqstacks, hard=3Dd2002000 soft=3Dd2004000
> [    0.000000] console [ttyS0] enabled
> [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc=
., Ingo Molnar
> [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.000000] ... MAX_LOCK_DEPTH:          48
> [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> [    0.000000] ... CLASSHASH_SIZE:          4096
> [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
> [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
> [    0.000000] ... CHAINHASH_SIZE:          32768
> [    0.000000]  memory used by lock dependency info: 4911 kB
> [    0.000000]  per task-struct memory footprint: 1152 bytes
> [    0.000000] ------------------------
> [    0.000000] | Locking API testsuite:
> [    0.000000] ----------------------------------------------------------=
------------------
> [    0.000000]                                  | spin |wlock |rlock |mut=
ex | wsem | rsem |
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]                      A-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]                  A-B-B-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]              A-B-B-C-C-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]              A-B-C-A-B-C deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]          A-B-B-C-C-D-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]          A-B-C-D-B-D-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]          A-B-C-D-B-C-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]                     double unlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]                   initialize held:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]                  bad unlock order:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]               recursive read-lock:             |  ok  |   =
          |  ok  |
> [    0.000000]            recursive read-lock #2:             |  ok  |   =
          |  ok  |
> [    0.000000]             mixed read-write-lock:             |  ok  |   =
          |  ok  |
> [    0.000000]             mixed write-read-lock:             |  ok  |   =
          |  ok  |
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]      hard-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
> [    0.000000]      soft-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
> [    0.000000]      hard-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
> [    0.000000]      soft-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
> [    0.000000]        sirq-safe-A =3D> hirqs-on/12:  ok  |  ok  |  ok  |
> [    0.000000]        sirq-safe-A =3D> hirqs-on/21:  ok  |  ok  |  ok  |
> [    0.000000]          hard-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
> [    0.000000]          soft-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
> [    0.000000]          hard-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
> [    0.000000]          soft-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/123:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/123:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/132:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/132:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/213:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/213:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/231:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/231:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/312:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/312:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/321:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/321:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq read-recursion/123:  ok  |
> [    0.000000]       soft-irq read-recursion/123:  ok  |
> [    0.000000]       hard-irq read-recursion/132:  ok  |
> [    0.000000]       soft-irq read-recursion/132:  ok  |
> [    0.000000]       hard-irq read-recursion/213:  ok  |
> [    0.000000]       soft-irq read-recursion/213:  ok  |
> [    0.000000]       hard-irq read-recursion/231:  ok  |
> [    0.000000]       soft-irq read-recursion/231:  ok  |
> [    0.000000]       hard-irq read-recursion/312:  ok  |
> [    0.000000]       soft-irq read-recursion/312:  ok  |
> [    0.000000]       hard-irq read-recursion/321:  ok  |
> [    0.000000]       soft-irq read-recursion/321:  ok  |
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]   | Wound/wait tests |
> [    0.000000]   ---------------------
> [    0.000000]                   ww api failures:  ok  |  ok  |  ok  |
> [    0.000000]                ww contexts mixing:  ok  |  ok  |
> [    0.000000]              finishing ww context:  ok  |  ok  |  ok  |  o=
k  |
> [    0.000000]                locking mismatches:  ok  |  ok  |  ok  |
> [    0.000000]                  EDEADLK handling:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> [    0.000000]            spinlock nest unlocked:  ok  |
> [    0.000000]   -----------------------------------------------------
> [    0.000000]                                  |block | try  |context|
> [    0.000000]   -----------------------------------------------------
> [    0.000000]                           context:  ok  |  ok  |  ok  |
> [    0.000000]                               try:  ok  |  ok  |  ok  |
> [    0.000000]                             block:  ok  |  ok  |  ok  |
> [    0.000000]                          spinlock:  ok  |  ok  |  ok  |
> [    0.000000] -------------------------------------------------------
> [    0.000000] Good, all 253 testcases passed! |
> [    0.000000] ---------------------------------
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Detected 2693.452 MHz processor
> [    0.008000] Calibrating delay loop (skipped) preset value.. 5386.90 Bo=
goMIPS (lpj=3D10773808)
> [    0.008000] pid_max: default: 4096 minimum: 301
> [    0.008000] ACPI: Core revision 20140424
> [    0.024020] ACPI: All ACPI Tables successfully acquired
> [    0.024822] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.025651] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.032062] Initializing cgroup subsys perf_event
> [    0.032780] Initializing cgroup subsys debug
> [    0.033561] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.033561] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.033561] tlb_flushall_shift: 6
> [    0.035291] CPU: Intel Core Processor (Haswell) (fam: 06, model: 3c, s=
tepping: 01)
> [    0.043183] Performance Events: unsupported p6 CPU model 60 no PMU dri=
ver, software events only.
> [    0.045490] =

> [    0.045490] **********************************************************
> [    0.046475] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
> [    0.048013] **                                                      **
> [    0.048847] ** trace_printk() being used. Allocating extra memory.  **
> [    0.049673] **                                                      **
> [    0.050475] ** This means that this is a DEBUG kernel and it is     **
> [    0.052033] ** unsafe for produciton use.                           **
> [    0.052963] **                                                      **
> [    0.053888] ** If you see this message and you are not debugging    **
> [    0.054811] ** the kernel, report this immediately to your vendor!  **
> [    0.056010] **                                                      **
> [    0.056804] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
> [    0.057591] **********************************************************
> [    0.062073] Testing tracer nop: PASSED
> [    0.062756] Enabling APIC mode:  Flat.  Using 1 I/O APICs
> [    0.064020] Getting VERSION: 1050014
> [    0.064543] Getting VERSION: 1050014
> [    0.065072] Getting ID: 0
> [    0.065464] Getting ID: f000000
> [    0.065938] Getting LVT0: 8700
> [    0.066383] Getting LVT1: 8400
> [    0.066936] enabled ExtINT on CPU#0
> [    0.069196] ENABLING IO-APIC IRQs
> [    0.069612] init IO_APIC IRQs
> [    0.069992]  apic 0 pin 0 not connected
> [    0.070489] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.072040] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.073018] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.074008] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.076041] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.077170] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.078291] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.080033] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.081006] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.081962] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.084038] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.085023] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.085999] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.088040] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.089193] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.090338]  apic 0 pin 16 not connected
> [    0.090890]  apic 0 pin 17 not connected
> [    0.091452]  apic 0 pin 18 not connected
> [    0.092008]  apic 0 pin 19 not connected
> [    0.092480]  apic 0 pin 20 not connected
> [    0.092961]  apic 0 pin 21 not connected
> [    0.093429]  apic 0 pin 22 not connected
> [    0.093907]  apic 0 pin 23 not connected
> [    0.096000] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.096051] TSC deadline timer enabled
> [    0.102926] Testing tracer irqsoff: PASSED
> [    0.107988] Testing tracer wakeup: ret =3D 0
> [    0.212168] ftrace-test (13) used greatest stack depth: 7244 bytes left
> [    0.213672] PASSED
> [    0.214679] Testing tracer wakeup_rt: ret =3D 0
> [    0.316593] PASSED
> [    0.317670] Testing tracer wakeup_dl: ret =3D 0
> [    0.420620] PASSED
> [    0.420978] Testing tracer branch: =

> [    0.421701] BUG: unable to handle kernel NULL pointer dereference at 0=
00000da
> [    0.422857] IP: [<c1061074>] update_curr+0x1a3/0x2c3
> [    0.423639] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53 =

> [    0.424000] Thread overran stack, or stack corrupted
> [    0.424000] Oops: 0000 [#1] PREEMPT =

> [    0.424000] CPU: 0 PID: 1 Comm: swapper Not tainted 3.16.0-rc1-00015-g=
d860d40 #13
> [    0.424000] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [    0.424000] task: d2034000 ti: d2036000 task.ti: d2036000
> [    0.424000] EIP: 0060:[<c1061074>] EFLAGS: 00010046 CPU: 0
> [    0.424000] EIP is at update_curr+0x1a3/0x2c3
> [    0.424000] EAX: 00000002 EBX: 00000000 ECX: d2191000 EDX: c10a7570
> [    0.424000] ESI: d203402c EDI: c1a41714 EBP: d2037dac ESP: d2037d8c
> [    0.424000]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    0.424000] CR0: 80050033 CR2: 000000da CR3: 01bb9000 CR4: 000406b0
> [    0.424000] Stack:
> [    0.424000]  c1959c60 0543a506 00000000 001833f6 00000000 c1a41714 d20=
3402c 00000001
> [    0.424000]  d2037dd0 c10614ce d2191b98 d2037dc0 c106ae67 d2037dec d20=
3402c c1a41714
> [    0.424000]  c1a416c0 d2037dec c10616df 00000001 00000001 c1a416c0 d20=
34000 c16bf6e0
> [    0.424000] Call Trace:
> [    0.424000]  [<c10614ce>] dequeue_entity+0x14/0x1fb
> [    0.424000]  [<c106ae67>] ? trace_hardirqs_off+0xb/0xd
> [    0.424000]  [<c10616df>] dequeue_task_fair+0x2a/0x94
> [    0.424000]  [<c105b7fc>] dequeue_task+0x9f/0xa7
> [    0.424000]  [<c105bd86>] deactivate_task+0x1c/0x1f
> [    0.424000]  [<c16ac296>] __schedule+0x1c0/0x8a1
> [    0.424000]  [<c106ad31>] ? trace_hardirqs_on+0xb/0xd
> [    0.424000]  [<c106ab81>] ? trace_hardirqs_on_caller+0x11/0x1b6
> [    0.424000]  [<c106ad31>] ? trace_hardirqs_on+0xb/0xd
> [    0.424000]  [<c16ac986>] schedule+0xf/0x11
> [    0.424000]  [<c16abd32>] schedule_timeout+0x17a/0x22e
> [    0.424000]  [<c103fc0a>] ? cascade+0x75/0x75
> [    0.424000]  [<c16abe26>] schedule_timeout_uninterruptible+0x14/0x16
> [    0.424000]  [<c1040f3f>] msleep+0x12/0x16
> [    0.424000]  [<c10a3849>] trace_selftest_startup_branch+0x34/0x72
> [    0.424000]  [<c10a3bcf>] register_tracer+0x113/0x204
> [    0.424000]  [<c1b437aa>] ? init_wakeup_tracer+0x2b/0x2b
> [    0.424000]  [<c1b437d7>] init_branch_tracer+0x2d/0x2f
> [    0.424000]  [<c1b2dc65>] do_one_initcall+0x188/0x197
> [    0.424000]  [<c1b2d400>] ? do_early_param+0x28/0x73
> [    0.424000]  [<c105159f>] ? parse_args+0x188/0x235
> [    0.424000]  [<c1b2dd4a>] kernel_init_freeable+0xd6/0x14e
> [    0.424000]  [<c1699f0c>] kernel_init+0x8/0xb8
> [    0.424000]  [<c16b0ea0>] ret_from_kernel_thread+0x20/0x30
> [    0.424000]  [<c1699f04>] ? rest_init+0x10c/0x10c
> [    0.424000] Code: ff 0d 5c 46 a3 c1 0f 84 df 00 00 00 31 db 31 c9 89 d=
a b8 f0 b6 af c1 e8 ec 63 04 00 85 db 74 05 e8 92 75 fa ff 8b 86 d8 03 00 0=
0 <83> b8 d8 00 00 00 00 89 45 e4 74 21 83 be dc 03 00 00 00 b8 dc
> [    0.424000] EIP: [<c1061074>] update_curr+0x1a3/0x2c3 SS:ESP 0068:d203=
7d8c
> [    0.424000] CR2: 00000000000000da
> [    0.424000] ---[ end trace a6f0f5be4ed0ab92 ]---
> [    0.424000] Kernel panic - not syncing: Fatal exception
> =

> Elapsed time: 15
> qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap -kernel /kernel/i=
386-randconfig-x0-09010313/d860d40327dde251d508a234fa00bd0d90fbb656/vmlinuz=
-3.16.0-rc1-00015-gd860d40 -append 'hung_task_panic=3D1 earlyprintk=3DttyS0=
,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_time=
out=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic=
 load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 =
vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests/run-queue/kvm/i386-r=
andconfig-x0-09010313/next:master:d860d40327dde251d508a234fa00bd0d90fbb656:=
bisect-linux-0/.vmlinuz-d860d40327dde251d508a234fa00bd0d90fbb656-2014090113=
2224-2-kbuild branch=3Dnext/master BOOT_IMAGE=3D/kernel/i386-randconfig-x0-=
09010313/d860d40327dde251d508a234fa00bd0d90fbb656/vmlinuz-3.16.0-rc1-00015-=
gd860d40 drbd.minor_count=3D8'  -initrd /kernel-tests/initrd/quantal-core-i=
386.cgz -m 320 -smp 2 -net nic,vlan=3D1,model=3De1000 -net user,vlan=3D1 -b=
oot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -pidfile=
 /dev/shm/kboot/pid-quantal-kbuild-8 -serial file:/dev/shm/kboot/serial-qua=
ntal-kbuild-8 -daemonize -display none -monitor null =



> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 3.16.0-rc1 Kernel Configuration
> #
> # CONFIG_64BIT is not set
> CONFIG_X86_32=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> # CONFIG_ZONE_DMA32 is not set
> # CONFIG_AUDIT_ARCH is not set
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-ecx -fcall-saved-edx"
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> =

> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=3Dy
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> CONFIG_CROSS_COMPILE=3D""
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> # CONFIG_KERNEL_GZIP is not set
> CONFIG_KERNEL_BZIP2=3Dy
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> # CONFIG_FHANDLE is not set
> CONFIG_USELIB=3Dy
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_LEGACY_ALLOC_HWIRQ=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> # CONFIG_IRQ_DOMAIN_DEBUG is not set
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_KTIME_SCALAR=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> # CONFIG_NO_HZ is not set
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_PREEMPT_RCU=3Dy
> CONFIG_PREEMPT_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_FANOUT=3D32
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_FANOUT_EXACT is not set
> CONFIG_TREE_RCU_TRACE=3Dy
> CONFIG_RCU_BOOST=3Dy
> CONFIG_RCU_BOOST_PRIO=3D1
> CONFIG_RCU_BOOST_DELAY=3D500
> # CONFIG_RCU_NOCB_CPU is not set
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_WANTS_PROT_NUMA_PROT_NONE=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_CGROUP_DEBUG=3Dy
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CPUSETS is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_RESOURCE_COUNTERS is not set
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> # CONFIG_RT_GROUP_SCHED is not set
> # CONFIG_CHECKPOINT_RESTORE is not set
> # CONFIG_NAMESPACES is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> # CONFIG_RD_LZMA is not set
> # CONFIG_RD_XZ is not set
> # CONFIG_RD_LZO is not set
> # CONFIG_RD_LZ4 is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_EXPERT=3Dy
> # CONFIG_UID16 is not set
> CONFIG_SGETMASK_SYSCALL=3Dy
> # CONFIG_SYSFS_SYSCALL is not set
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_PCSPKR_PLATFORM is not set
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> # CONFIG_SIGNALFD is not set
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PERF_USE_VMALLOC=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> # CONFIG_VM_EVENT_COUNTERS is not set
> CONFIG_COMPAT_BRK=3Dy
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB=3Dy
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_JUMP_LABEL is not set
> # CONFIG_UPROBES is not set
> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_ATTRS=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_DMA_API_DEBUG=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> CONFIG_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR_NONE is not set
> CONFIG_CC_STACKPROTECTOR_REGULAR=3Dy
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> # CONFIG_MODULES is not set
> # CONFIG_BLOCK is not set
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_USE_QUEUE_RWLOCK=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> # CONFIG_SMP is not set
> # CONFIG_X86_MPPARSE is not set
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> CONFIG_X86_32_IRIS=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_LGUEST_GUEST is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> CONFIG_MEMTEST=3Dy
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> # CONFIG_M586TSC is not set
> # CONFIG_M586MMX is not set
> # CONFIG_M686 is not set
> # CONFIG_MPENTIUMII is not set
> # CONFIG_MPENTIUMIII is not set
> # CONFIG_MPENTIUMM is not set
> # CONFIG_MPENTIUM4 is not set
> # CONFIG_MK6 is not set
> # CONFIG_MK7 is not set
> # CONFIG_MK8 is not set
> # CONFIG_MCRUSOE is not set
> # CONFIG_MEFFICEON is not set
> # CONFIG_MWINCHIPC6 is not set
> # CONFIG_MWINCHIP3D is not set
> # CONFIG_MELAN is not set
> # CONFIG_MGEODEGX1 is not set
> # CONFIG_MGEODE_LX is not set
> # CONFIG_MCYRIXIII is not set
> CONFIG_MVIAC3_2=3Dy
> # CONFIG_MVIAC7 is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> # CONFIG_X86_GENERIC is not set
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D5
> CONFIG_X86_L1_CACHE_SHIFT=3D5
> CONFIG_X86_ALIGNMENT_16=3Dy
> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> # CONFIG_CPU_SUP_AMD is not set
> # CONFIG_CPU_SUP_CENTAUR is not set
> # CONFIG_CPU_SUP_TRANSMETA_32 is not set
> CONFIG_CPU_SUP_UMC_32=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> CONFIG_NR_CPUS=3D1
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> # CONFIG_X86_MCE is not set
> CONFIG_VM86=3Dy
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX32=3Dy
> CONFIG_TOSHIBA=3Dy
> CONFIG_I8K=3Dy
> CONFIG_X86_REBOOTFIXUPS=3Dy
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_MICROCODE_INTEL_EARLY=3Dy
> # CONFIG_MICROCODE_AMD_EARLY is not set
> CONFIG_MICROCODE_EARLY=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> # CONFIG_NOHIGHMEM is not set
> # CONFIG_HIGHMEM4G is not set
> CONFIG_HIGHMEM64G=3Dy
> CONFIG_VMSPLIT_3G=3Dy
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0xC0000000
> CONFIG_HIGHMEM=3Dy
> CONFIG_X86_PAE=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_FLATMEM_MANUAL=3Dy
> # CONFIG_SPARSEMEM_MANUAL is not set
> CONFIG_FLATMEM=3Dy
> CONFIG_FLAT_NODE_MEM_MAP=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> CONFIG_PAGEFLAGS_EXTENDED=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> # CONFIG_COMPACTION is not set
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ZONE_DMA_FLAG=3D1
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_NEED_PER_CPU_KM=3Dy
> CONFIG_CLEANCACHE=3Dy
> # CONFIG_CMA is not set
> # CONFIG_ZBUD is not set
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_HIGHPTE is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MATH_EMULATION is not set
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=3Dy
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> CONFIG_HZ_250=3Dy
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D250
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_COMPAT_VDSO=3Dy
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> # CONFIG_PM_WAKELOCKS_GC is not set
> # CONFIG_PM_RUNTIME is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_TEST_SUSPEND=3Dy
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> # CONFIG_ACPI_BATTERY is not set
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_DOCK=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> # CONFIG_ACPI_THERMAL is not set
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> # CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_SBS=3Dy
> CONFIG_ACPI_HED=3Dy
> CONFIG_ACPI_CUSTOM_METHOD=3Dy
> CONFIG_ACPI_REDUCED_HARDWARE_ONLY=3Dy
> # CONFIG_ACPI_APEI is not set
> CONFIG_SFI=3Dy
> CONFIG_X86_APM_BOOT=3Dy
> CONFIG_APM=3Dy
> # CONFIG_APM_IGNORE_USER_SUSPEND is not set
> CONFIG_APM_DO_ENABLE=3Dy
> # CONFIG_APM_CPU_IDLE is not set
> CONFIG_APM_DISPLAY_BLANK=3Dy
> CONFIG_APM_ALLOW_INTS=3Dy
> =

> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_MULTIPLE_DRIVERS is not set
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> # CONFIG_PCI_GOBIOS is not set
> # CONFIG_PCI_GOMMCONFIG is not set
> # CONFIG_PCI_GODIRECT is not set
> CONFIG_PCI_GOANY=3Dy
> CONFIG_PCI_BIOS=3Dy
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCI_CNB20LE_QUIRK=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> # CONFIG_PCIEAER is not set
> CONFIG_PCIEASPM=3Dy
> # CONFIG_PCIEASPM_DEBUG is not set
> # CONFIG_PCIEASPM_DEFAULT is not set
> CONFIG_PCIEASPM_POWERSAVE=3Dy
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCI_MSI=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_HT_IRQ=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_IOAPIC=3Dy
> CONFIG_PCI_LABEL=3Dy
> =

> #
> # PCI host controller drivers
> #
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_ISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_SCx200=3Dy
> CONFIG_SCx200HR_TIMER=3Dy
> CONFIG_ALIX=3Dy
> # CONFIG_NET5501 is not set
> # CONFIG_GEOS is not set
> CONFIG_PCCARD=3Dy
> # CONFIG_PCMCIA is not set
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> CONFIG_PCMCIA_PROBE=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> # CONFIG_RAPIDIO is not set
> CONFIG_X86_SYSFB=3Dy
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_HAVE_AOUT=3Dy
> CONFIG_BINFMT_AOUT=3Dy
> # CONFIG_BINFMT_MISC is not set
> # CONFIG_COREDUMP is not set
> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> CONFIG_IOSF_MBI=3Dy
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_NET_KEY is not set
> # CONFIG_INET is not set
> # CONFIG_NETWORK_SECMARK is not set
> # CONFIG_NET_PTP_CLASSIFY is not set
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> # CONFIG_ATM is not set
> # CONFIG_BRIDGE is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_IPX is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_MMAP is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_NET_MPLS_GSO is not set
> # CONFIG_HSR is not set
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_IRDA is not set
> # CONFIG_BT is not set
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> # CONFIG_LIB80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> # CONFIG_RFKILL_REGULATOR is not set
> # CONFIG_NET_9P is not set
> # CONFIG_CAIF is not set
> # CONFIG_NFC is not set
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> # CONFIG_DEVTMPFS is not set
> # CONFIG_STANDALONE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> # CONFIG_MTD_REDBOOT_PARTS is not set
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> CONFIG_MTD_AR7_PARTS=3Dy
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_OOPS=3Dy
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> CONFIG_MTD_JEDECPROBE=3Dy
> CONFIG_MTD_GEN_PROBE=3Dy
> CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> # CONFIG_MTD_CFI_NOSWAP is not set
> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_LE_BYTE_SWAP=3Dy
> # CONFIG_MTD_CFI_GEOMETRY is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_I8 is not set
> # CONFIG_MTD_OTP is not set
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> CONFIG_MTD_CFI_STAA=3Dy
> CONFIG_MTD_CFI_UTIL=3Dy
> # CONFIG_MTD_RAM is not set
> CONFIG_MTD_ROM=3Dy
> CONFIG_MTD_ABSENT=3Dy
> =

> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> CONFIG_MTD_PHYSMAP=3Dy
> # CONFIG_MTD_PHYSMAP_COMPAT is not set
> CONFIG_MTD_SCx200_DOCFLASH=3Dy
> CONFIG_MTD_AMD76XROM=3Dy
> CONFIG_MTD_ICHXROM=3Dy
> CONFIG_MTD_ESB2ROM=3Dy
> CONFIG_MTD_CK804XROM=3Dy
> CONFIG_MTD_SCB2_FLASH=3Dy
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=3Dy
> CONFIG_MTD_INTEL_VR_NOR=3Dy
> # CONFIG_MTD_PLATRAM is not set
> =

> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dy
> # CONFIG_MTD_PMC551_BUGFIX is not set
> CONFIG_MTD_PMC551_DEBUG=3Dy
> CONFIG_MTD_SLRAM=3Dy
> # CONFIG_MTD_PHRAM is not set
> # CONFIG_MTD_MTDRAM is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> CONFIG_MTD_NAND_ECC=3Dy
> # CONFIG_MTD_NAND_ECC_SMC is not set
> CONFIG_MTD_NAND=3Dy
> # CONFIG_MTD_NAND_ECC_BCH is not set
> CONFIG_MTD_SM_COMMON=3Dy
> CONFIG_MTD_NAND_DENALI=3Dy
> CONFIG_MTD_NAND_DENALI_PCI=3Dy
> CONFIG_MTD_NAND_DENALI_DT=3Dy
> CONFIG_MTD_NAND_DENALI_SCRATCH_REG_ADDR=3D0xFF108018
> CONFIG_MTD_NAND_GPIO=3Dy
> CONFIG_MTD_NAND_IDS=3Dy
> CONFIG_MTD_NAND_RICOH=3Dy
> # CONFIG_MTD_NAND_DISKONCHIP is not set
> # CONFIG_MTD_NAND_DOCG4 is not set
> CONFIG_MTD_NAND_CAFE=3Dy
> CONFIG_MTD_NAND_CS553X=3Dy
> CONFIG_MTD_NAND_NANDSIM=3Dy
> CONFIG_MTD_NAND_PLATFORM=3Dy
> # CONFIG_MTD_ONENAND is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> CONFIG_MTD_SPI_NOR=3Dy
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> CONFIG_MTD_UBI_FASTMAP=3Dy
> # CONFIG_MTD_UBI_GLUEBI is not set
> CONFIG_PARPORT=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dy
> CONFIG_PARPORT_SERIAL=3Dy
> CONFIG_PARPORT_PC_FIFO=3Dy
> # CONFIG_PARPORT_PC_SUPERIO is not set
> # CONFIG_PARPORT_GSC is not set
> # CONFIG_PARPORT_AX88796 is not set
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> # CONFIG_ISAPNP is not set
> # CONFIG_PNPBIOS is not set
> CONFIG_PNPACPI=3Dy
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> # CONFIG_AD525X_DPOT is not set
> # CONFIG_DUMMY_IRQ is not set
> CONFIG_IBM_ASM=3Dy
> # CONFIG_PHANTOM is not set
> CONFIG_SGI_IOC4=3Dy
> CONFIG_TIFM_CORE=3Dy
> # CONFIG_TIFM_7XX1 is not set
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> CONFIG_CS5535_MFGPT=3Dy
> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
> CONFIG_CS5535_CLOCK_EVENT_SRC=3Dy
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dy
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1780=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> # CONFIG_SENSORS_APDS990X is not set
> # CONFIG_HMC6352 is not set
> # CONFIG_DS1682 is not set
> CONFIG_VMWARE_BALLOON=3Dy
> # CONFIG_BMP085_I2C is not set
> CONFIG_PCH_PHUB=3Dy
> # CONFIG_USB_SWITCH_FSA9480 is not set
> CONFIG_SRAM=3Dy
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> # CONFIG_EEPROM_LEGACY is not set
> # CONFIG_EEPROM_MAX6875 is not set
> CONFIG_EEPROM_93CX6=3Dy
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # CONFIG_SENSORS_LIS3_I2C is not set
> =

> #
> # Altera FPGA firmware download module
> #
> CONFIG_ALTERA_STAPL=3Dy
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC Host Driver
> #
> =

> #
> # Intel MIC Card Driver
> #
> CONFIG_ECHO=3Dy
> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_SCSI_DMA is not set
> # CONFIG_SCSI_NETLINK is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> CONFIG_FIREWIRE_OHCI=3Dy
> CONFIG_FIREWIRE_NOSY=3Dy
> # CONFIG_I2O is not set
> # CONFIG_MACINTOSH_DRIVERS is not set
> # CONFIG_NETDEVICES is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dy
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADP5520=3Dy
> # CONFIG_KEYBOARD_ADP5588 is not set
> CONFIG_KEYBOARD_ADP5589=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1070=3Dy
> # CONFIG_KEYBOARD_QT2160 is not set
> CONFIG_KEYBOARD_LKKBD=3Dy
> # CONFIG_KEYBOARD_GPIO is not set
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> CONFIG_KEYBOARD_TCA6416=3Dy
> # CONFIG_KEYBOARD_TCA8418 is not set
> CONFIG_KEYBOARD_MATRIX=3Dy
> # CONFIG_KEYBOARD_LM8323 is not set
> CONFIG_KEYBOARD_LM8333=3Dy
> CONFIG_KEYBOARD_MAX7359=3Dy
> CONFIG_KEYBOARD_MCS=3Dy
> CONFIG_KEYBOARD_MPR121=3Dy
> CONFIG_KEYBOARD_NEWTON=3Dy
> CONFIG_KEYBOARD_OPENCORES=3Dy
> # CONFIG_KEYBOARD_SAMSUNG is not set
> CONFIG_KEYBOARD_STOWAWAY=3Dy
> CONFIG_KEYBOARD_SUNKBD=3Dy
> CONFIG_KEYBOARD_TC3589X=3Dy
> CONFIG_KEYBOARD_XTKBD=3Dy
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_INPUT_JOYSTICK is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> CONFIG_TABLET_USB_AIPTEK=3Dy
> CONFIG_TABLET_USB_GTCO=3Dy
> CONFIG_TABLET_USB_HANWANG=3Dy
> CONFIG_TABLET_USB_KBTAB=3Dy
> # CONFIG_TABLET_USB_WACOM is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_88PM860X=3Dy
> # CONFIG_TOUCHSCREEN_AD7879 is not set
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> # CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
> CONFIG_TOUCHSCREEN_BU21013=3Dy
> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> # CONFIG_TOUCHSCREEN_EETI is not set
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> CONFIG_TOUCHSCREEN_ILI210X=3Dy
> CONFIG_TOUCHSCREEN_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_ELO=3Dy
> CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
> # CONFIG_TOUCHSCREEN_WACOM_I2C is not set
> CONFIG_TOUCHSCREEN_MAX11801=3Dy
> CONFIG_TOUCHSCREEN_MCS5000=3Dy
> # CONFIG_TOUCHSCREEN_MMS114 is not set
> # CONFIG_TOUCHSCREEN_MTOUCH is not set
> CONFIG_TOUCHSCREEN_INEXIO=3Dy
> # CONFIG_TOUCHSCREEN_MK712 is not set
> # CONFIG_TOUCHSCREEN_HTCPEN is not set
> CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> # CONFIG_TOUCHSCREEN_TI_AM335X_TSC is not set
> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> # CONFIG_TOUCHSCREEN_WM831X is not set
> CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dy
> CONFIG_TOUCHSCREEN_USB_EGALAX=3Dy
> CONFIG_TOUCHSCREEN_USB_PANJIT=3Dy
> CONFIG_TOUCHSCREEN_USB_3M=3Dy
> CONFIG_TOUCHSCREEN_USB_ITM=3Dy
> # CONFIG_TOUCHSCREEN_USB_ETURBO is not set
> # CONFIG_TOUCHSCREEN_USB_GUNZE is not set
> CONFIG_TOUCHSCREEN_USB_DMC_TSC10=3Dy
> # CONFIG_TOUCHSCREEN_USB_IRTOUCH is not set
> CONFIG_TOUCHSCREEN_USB_IDEALTEK=3Dy
> # CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH is not set
> CONFIG_TOUCHSCREEN_USB_GOTOP=3Dy
> CONFIG_TOUCHSCREEN_USB_JASTEC=3Dy
> # CONFIG_TOUCHSCREEN_USB_ELO is not set
> CONFIG_TOUCHSCREEN_USB_E2I=3Dy
> CONFIG_TOUCHSCREEN_USB_ZYTRONIC=3Dy
> CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=3Dy
> # CONFIG_TOUCHSCREEN_USB_NEXIO is not set
> CONFIG_TOUCHSCREEN_USB_EASYTOUCH=3Dy
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
> # CONFIG_TOUCHSCREEN_TSC2007 is not set
> CONFIG_TOUCHSCREEN_ST1232=3Dy
> CONFIG_TOUCHSCREEN_SUR40=3Dy
> CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> CONFIG_TOUCHSCREEN_ZFORCE=3Dy
> # CONFIG_INPUT_MISC is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dy
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_HYPERV_KEYBOARD=3Dy
> # CONFIG_GAMEPORT is not set
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> # CONFIG_UNIX98_PTYS is not set
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> # CONFIG_SERIAL_NONSTANDARD is not set
> CONFIG_NOZOMI=3Dy
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_SINK is not set
> # CONFIG_DEVKMEM is not set
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> # CONFIG_SERIAL_8250_PNP is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> # CONFIG_SERIAL_8250_FOURPORT is not set
> CONFIG_SERIAL_8250_ACCENT=3Dy
> # CONFIG_SERIAL_8250_BOCA is not set
> CONFIG_SERIAL_8250_EXAR_ST16C554=3Dy
> # CONFIG_SERIAL_8250_HUB6 is not set
> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=3Dy
> CONFIG_SERIAL_8250_DW=3Dy
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MFD_HSU is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dy
> CONFIG_SERIAL_SCCNXP=3Dy
> CONFIG_SERIAL_SCCNXP_CONSOLE=3Dy
> CONFIG_SERIAL_SC16IS7XX=3Dy
> CONFIG_SERIAL_TIMBERDALE=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> # CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
> CONFIG_SERIAL_PCH_UART=3Dy
> CONFIG_SERIAL_PCH_UART_CONSOLE=3Dy
> CONFIG_SERIAL_ARC=3Dy
> # CONFIG_SERIAL_ARC_CONSOLE is not set
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=3Dy
> CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
> CONFIG_TTY_PRINTK=3Dy
> # CONFIG_PRINTER is not set
> # CONFIG_PPDEV is not set
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_VIRTIO_CONSOLE=3Dy
> # CONFIG_IPMI_HANDLER is not set
> # CONFIG_HW_RANDOM is not set
> CONFIG_NVRAM=3Dy
> CONFIG_DTLK=3Dy
> CONFIG_R3964=3Dy
> CONFIG_APPLICOM=3Dy
> CONFIG_SONYPI=3Dy
> CONFIG_MWAVE=3Dy
> CONFIG_SCx200_GPIO=3Dy
> CONFIG_PC8736x_GPIO=3Dy
> CONFIG_NSC_GPIO=3Dy
> # CONFIG_HPET is not set
> # CONFIG_HANGCHECK_TIMER is not set
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> # CONFIG_TCG_INFINEON is not set
> CONFIG_TCG_ST33_I2C=3Dy
> CONFIG_TELCLOCK=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_I2C=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> CONFIG_I2C_MUX_PCA954x=3Dy
> CONFIG_I2C_MUX_PINCTRL=3Dy
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCF=3Dy
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dy
> CONFIG_I2C_ALI1563=3Dy
> CONFIG_I2C_ALI15X3=3Dy
> # CONFIG_I2C_AMD756 is not set
> CONFIG_I2C_AMD8111=3Dy
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dy
> # CONFIG_I2C_ISMT is not set
> CONFIG_I2C_PIIX4=3Dy
> # CONFIG_I2C_NFORCE2 is not set
> CONFIG_I2C_SIS5595=3Dy
> CONFIG_I2C_SIS630=3Dy
> CONFIG_I2C_SIS96X=3Dy
> CONFIG_I2C_VIA=3Dy
> CONFIG_I2C_VIAPRO=3Dy
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dy
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> CONFIG_I2C_EG20T=3Dy
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_KEMPLD is not set
> CONFIG_I2C_OCORES=3Dy
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dy
> CONFIG_I2C_PARPORT=3Dy
> CONFIG_I2C_PARPORT_LIGHT=3Dy
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> # CONFIG_I2C_TAOS_EVM is not set
> # CONFIG_I2C_TINY_USB is not set
> # CONFIG_I2C_VIPERBOARD is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_ELEKTOR=3Dy
> # CONFIG_I2C_PCA_ISA is not set
> # CONFIG_SCx200_I2C is not set
> CONFIG_SCx200_ACB=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dy
> CONFIG_HSI=3Dy
> CONFIG_HSI_BOARDINFO=3Dy
> =

> #
> # HSI controllers
> #
> =

> #
> # HSI clients
> #
> # CONFIG_HSI_CHAR is not set
> =

> #
> # PPS support
> #
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> # CONFIG_NTP_PPS is not set
> =

> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dy
> CONFIG_PPS_CLIENT_LDISC=3Dy
> # CONFIG_PPS_CLIENT_PARPORT is not set
> CONFIG_PPS_CLIENT_GPIO=3Dy
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # CONFIG_PTP_1588_CLOCK_PCH is not set
> CONFIG_PINCTRL=3Dy
> =

> #
> # Pin controllers
> #
> # CONFIG_PINMUX is not set
> # CONFIG_PINCONF is not set
> CONFIG_DEBUG_PINCTRL=3Dy
> # CONFIG_PINCTRL_BAYTRAIL is not set
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> =

> #
> # Memory mapped GPIO drivers:
> #
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> CONFIG_GPIO_IT8761E=3Dy
> # CONFIG_GPIO_F7188X is not set
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_SCH=3Dy
> # CONFIG_GPIO_ICH is not set
> # CONFIG_GPIO_VX855 is not set
> CONFIG_GPIO_LYNXPOINT=3Dy
> =

> #
> # I2C GPIO expanders:
> #
> CONFIG_GPIO_ARIZONA=3Dy
> # CONFIG_GPIO_LP3943 is not set
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=3Dy
> # CONFIG_GPIO_MAX732X_IRQ is not set
> CONFIG_GPIO_PCA953X=3Dy
> # CONFIG_GPIO_PCA953X_IRQ is not set
> CONFIG_GPIO_PCF857X=3Dy
> # CONFIG_GPIO_RC5T583 is not set
> # CONFIG_GPIO_SX150X is not set
> CONFIG_GPIO_TC3589X=3Dy
> # CONFIG_GPIO_TPS65912 is not set
> CONFIG_GPIO_WM831X=3Dy
> CONFIG_GPIO_WM8350=3Dy
> CONFIG_GPIO_WM8994=3Dy
> # CONFIG_GPIO_ADP5520 is not set
> # CONFIG_GPIO_ADP5588 is not set
> =

> #
> # PCI GPIO expanders:
> #
> CONFIG_GPIO_CS5535=3Dy
> # CONFIG_GPIO_BT8XX is not set
> CONFIG_GPIO_AMD8111=3Dy
> # CONFIG_GPIO_INTEL_MID is not set
> CONFIG_GPIO_PCH=3Dy
> CONFIG_GPIO_ML_IOH=3Dy
> # CONFIG_GPIO_TIMBERDALE is not set
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI GPIO expanders:
> #
> =

> #
> # AC97 GPIO expanders:
> #
> =

> #
> # LPC GPIO expanders:
> #
> CONFIG_GPIO_KEMPLD=3Dy
> =

> #
> # MODULbus GPIO expanders:
> #
> # CONFIG_GPIO_JANZ_TTL is not set
> # CONFIG_GPIO_TPS6586X is not set
> # CONFIG_GPIO_TPS65910 is not set
> =

> #
> # USB GPIO expanders:
> #
> # CONFIG_GPIO_VIPERBOARD is not set
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2490=3Dy
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> # CONFIG_W1_MASTER_GPIO is not set
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=3Dy
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> # CONFIG_W1_SLAVE_DS2760 is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_W1_SLAVE_BQ27000=3Dy
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_GENERIC_ADC_BATTERY=3Dy
> # CONFIG_WM831X_BACKUP is not set
> # CONFIG_WM831X_POWER is not set
> # CONFIG_WM8350_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_BATTERY_88PM860X is not set
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> # CONFIG_BATTERY_SBS is not set
> CONFIG_BATTERY_BQ27x00=3Dy
> # CONFIG_BATTERY_BQ27X00_I2C is not set
> CONFIG_BATTERY_BQ27X00_PLATFORM=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dy
> CONFIG_CHARGER_PCF50633=3Dy
> CONFIG_CHARGER_ISP1704=3Dy
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> CONFIG_CHARGER_LP8788=3Dy
> CONFIG_CHARGER_GPIO=3Dy
> # CONFIG_CHARGER_MANAGER is not set
> CONFIG_CHARGER_MAX14577=3Dy
> # CONFIG_CHARGER_BQ2415X is not set
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> # CONFIG_CHARGER_SMB347 is not set
> CONFIG_CHARGER_TPS65090=3Dy
> CONFIG_POWER_RESET=3Dy
> CONFIG_POWER_AVS=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=3Dy
> CONFIG_SENSORS_ABITUGURU3=3Dy
> CONFIG_SENSORS_AD7414=3Dy
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> CONFIG_SENSORS_ADM1025=3Dy
> CONFIG_SENSORS_ADM1026=3Dy
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> # CONFIG_SENSORS_ADT7410 is not set
> CONFIG_SENSORS_ADT7411=3Dy
> # CONFIG_SENSORS_ADT7462 is not set
> # CONFIG_SENSORS_ADT7470 is not set
> CONFIG_SENSORS_ADT7475=3Dy
> CONFIG_SENSORS_ASC7621=3Dy
> CONFIG_SENSORS_K8TEMP=3Dy
> CONFIG_SENSORS_K10TEMP=3Dy
> CONFIG_SENSORS_FAM15H_POWER=3Dy
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dy
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_I5K_AMB=3Dy
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dy
> # CONFIG_SENSORS_F75375S is not set
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_GL518SM=3Dy
> # CONFIG_SENSORS_GL520SM is not set
> # CONFIG_SENSORS_G760A is not set
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_GPIO_FAN=3Dy
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IIO_HWMON=3Dy
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dy
> CONFIG_SENSORS_JC42=3Dy
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=3Dy
> # CONFIG_SENSORS_LTC4151 is not set
> # CONFIG_SENSORS_LTC4215 is not set
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=3Dy
> # CONFIG_SENSORS_MAX1668 is not set
> # CONFIG_SENSORS_MAX197 is not set
> # CONFIG_SENSORS_MAX6639 is not set
> CONFIG_SENSORS_MAX6642=3Dy
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_HTU21=3Dy
> # CONFIG_SENSORS_MCP3021 is not set
> # CONFIG_SENSORS_LM63 is not set
> CONFIG_SENSORS_LM73=3Dy
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> # CONFIG_SENSORS_LM93 is not set
> CONFIG_SENSORS_LM95234=3Dy
> CONFIG_SENSORS_LM95241=3Dy
> CONFIG_SENSORS_LM95245=3Dy
> CONFIG_SENSORS_PC87360=3Dy
> CONFIG_SENSORS_PC87427=3Dy
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> CONFIG_SENSORS_NCT6683=3Dy
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> # CONFIG_SENSORS_ADM1275 is not set
> # CONFIG_SENSORS_LM25066 is not set
> CONFIG_SENSORS_LTC2978=3Dy
> CONFIG_SENSORS_MAX16064=3Dy
> CONFIG_SENSORS_MAX34440=3Dy
> CONFIG_SENSORS_MAX8688=3Dy
> CONFIG_SENSORS_UCD9000=3Dy
> CONFIG_SENSORS_UCD9200=3Dy
> # CONFIG_SENSORS_ZL6100 is not set
> CONFIG_SENSORS_SHT15=3Dy
> # CONFIG_SENSORS_SHT21 is not set
> CONFIG_SENSORS_SHTC1=3Dy
> CONFIG_SENSORS_SIS5595=3Dy
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> # CONFIG_SENSORS_SMSC47M1 is not set
> # CONFIG_SENSORS_SMSC47M192 is not set
> CONFIG_SENSORS_SMSC47B397=3Dy
> # CONFIG_SENSORS_SCH56XX_COMMON is not set
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dy
> CONFIG_SENSORS_ADS1015=3Dy
> CONFIG_SENSORS_ADS7828=3Dy
> CONFIG_SENSORS_AMC6821=3Dy
> CONFIG_SENSORS_INA209=3Dy
> # CONFIG_SENSORS_INA2XX is not set
> # CONFIG_SENSORS_THMC50 is not set
> # CONFIG_SENSORS_TMP102 is not set
> CONFIG_SENSORS_TMP401=3Dy
> # CONFIG_SENSORS_TMP421 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> CONFIG_SENSORS_VT8231=3Dy
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> CONFIG_SENSORS_W83793=3Dy
> CONFIG_SENSORS_W83795=3Dy
> CONFIG_SENSORS_W83795_FANCTRL=3Dy
> CONFIG_SENSORS_W83L785TS=3Dy
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
> # CONFIG_SENSORS_WM831X is not set
> # CONFIG_SENSORS_WM8350 is not set
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dy
> CONFIG_SENSORS_ATK0110=3Dy
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_HWMON=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> # CONFIG_THERMAL_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> CONFIG_THERMAL_EMULATION=3Dy
> # CONFIG_INTEL_POWERCLAMP is not set
> # CONFIG_ACPI_INT3403_THERMAL is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # Texas Instruments thermal drivers
> #
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> CONFIG_SSB=3Dy
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> # CONFIG_SSB_B43_PCI_BRIDGE is not set
> # CONFIG_SSB_SILENT is not set
> CONFIG_SSB_DEBUG=3Dy
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> # CONFIG_SSB_DRIVER_PCICORE is not set
> CONFIG_SSB_DRIVER_GPIO=3Dy
> CONFIG_BCMA_POSSIBLE=3Dy
> =

> #
> # Broadcom specific AMBA
> #
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> # CONFIG_BCMA_HOST_PCI is not set
> CONFIG_BCMA_HOST_SOC=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> # CONFIG_BCMA_DRIVER_GPIO is not set
> CONFIG_BCMA_DEBUG=3Dy
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_CS5535=3Dy
> # CONFIG_MFD_AS3711 is not set
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_AXP20X=3Dy
> # CONFIG_MFD_CROS_EC is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> CONFIG_MFD_DA9063=3Dy
> # CONFIG_MFD_MC13XXX_I2C is not set
> CONFIG_HTC_PASIC3=3Dy
> # CONFIG_HTC_I2CPLD is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dy
> # CONFIG_MFD_88PM800 is not set
> CONFIG_MFD_88PM805=3Dy
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_MAX14577=3Dy
> # CONFIG_MFD_MAX77686 is not set
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> CONFIG_MFD_MAX8998=3Dy
> CONFIG_MFD_VIPERBOARD=3Dy
> # CONFIG_MFD_RETU is not set
> CONFIG_MFD_PCF50633=3Dy
> CONFIG_PCF50633_ADC=3Dy
> # CONFIG_PCF50633_GPIO is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RTSX_PCI is not set
> CONFIG_MFD_RTSX_USB=3Dy
> CONFIG_MFD_RC5T583=3Dy
> # CONFIG_MFD_SEC_CORE is not set
> CONFIG_MFD_SI476X_CORE=3Dy
> # CONFIG_MFD_SM501 is not set
> CONFIG_MFD_SMSC=3Dy
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> CONFIG_MFD_LP8788=3Dy
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65090=3Dy
> # CONFIG_MFD_TPS65217 is not set
> # CONFIG_MFD_TPS65218 is not set
> CONFIG_MFD_TPS6586X=3Dy
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> # CONFIG_MFD_TPS80031 is not set
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> # CONFIG_MFD_WL1273_CORE is not set
> # CONFIG_MFD_LM3533 is not set
> CONFIG_MFD_TIMBERDALE=3Dy
> CONFIG_MFD_TC3589X=3Dy
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> # CONFIG_MFD_WM5102 is not set
> # CONFIG_MFD_WM5110 is not set
> # CONFIG_MFD_WM8997 is not set
> # CONFIG_MFD_WM8400 is not set
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dy
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> CONFIG_REGULATOR_88PM8607=3Dy
> # CONFIG_REGULATOR_ACT8865 is not set
> CONFIG_REGULATOR_AD5398=3Dy
> # CONFIG_REGULATOR_ANATOP is not set
> CONFIG_REGULATOR_AXP20X=3Dy
> # CONFIG_REGULATOR_BCM590XX is not set
> # CONFIG_REGULATOR_DA9063 is not set
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> CONFIG_REGULATOR_GPIO=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> CONFIG_REGULATOR_LP3971=3Dy
> # CONFIG_REGULATOR_LP3972 is not set
> # CONFIG_REGULATOR_LP872X is not set
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LP8788=3Dy
> # CONFIG_REGULATOR_LTC3589 is not set
> # CONFIG_REGULATOR_MAX14577 is not set
> # CONFIG_REGULATOR_MAX1586 is not set
> # CONFIG_REGULATOR_MAX8649 is not set
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX8973=3Dy
> # CONFIG_REGULATOR_MAX8998 is not set
> CONFIG_REGULATOR_PCF50633=3Dy
> CONFIG_REGULATOR_PFUZE100=3Dy
> # CONFIG_REGULATOR_RC5T583 is not set
> CONFIG_REGULATOR_TPS51632=3Dy
> CONFIG_REGULATOR_TPS6105X=3Dy
> # CONFIG_REGULATOR_TPS62360 is not set
> # CONFIG_REGULATOR_TPS65023 is not set
> CONFIG_REGULATOR_TPS6507X=3Dy
> CONFIG_REGULATOR_TPS65090=3Dy
> CONFIG_REGULATOR_TPS6586X=3Dy
> CONFIG_REGULATOR_TPS65910=3Dy
> # CONFIG_REGULATOR_TPS65912 is not set
> CONFIG_REGULATOR_WM831X=3Dy
> CONFIG_REGULATOR_WM8350=3Dy
> CONFIG_REGULATOR_WM8994=3Dy
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> CONFIG_AGP_ALI=3Dy
> CONFIG_AGP_ATI=3Dy
> CONFIG_AGP_AMD=3Dy
> # CONFIG_AGP_INTEL is not set
> # CONFIG_AGP_NVIDIA is not set
> CONFIG_AGP_SIS=3Dy
> # CONFIG_AGP_SWORKS is not set
> CONFIG_AGP_VIA=3Dy
> # CONFIG_AGP_EFFICEON is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> CONFIG_VGA_SWITCHEROO=3Dy
> =

> #
> # Direct Rendering Manager
> #
> CONFIG_DRM=3Dy
> CONFIG_DRM_USB=3Dy
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_TTM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> CONFIG_DRM_PTN3460=3Dy
> CONFIG_DRM_TDFX=3Dy
> CONFIG_DRM_R128=3Dy
> CONFIG_DRM_RADEON=3Dy
> CONFIG_DRM_RADEON_UMS=3Dy
> CONFIG_DRM_NOUVEAU=3Dy
> CONFIG_NOUVEAU_DEBUG=3D5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
> CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
> # CONFIG_DRM_I915 is not set
> # CONFIG_DRM_MGA is not set
> CONFIG_DRM_SIS=3Dy
> CONFIG_DRM_VIA=3Dy
> CONFIG_DRM_SAVAGE=3Dy
> # CONFIG_DRM_VMWGFX is not set
> CONFIG_DRM_GMA500=3Dy
> CONFIG_DRM_GMA600=3Dy
> CONFIG_DRM_GMA3600=3Dy
> CONFIG_DRM_UDL=3Dy
> CONFIG_DRM_AST=3Dy
> CONFIG_DRM_MGAG200=3Dy
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> CONFIG_DRM_BOCHS=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_DDC=3Dy
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dy
> CONFIG_FB_SVGALIB=3Dy
> # CONFIG_FB_MACMODES is not set
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> CONFIG_FB_CYBER2000=3Dy
> # CONFIG_FB_CYBER2000_DDC is not set
> CONFIG_FB_ARC=3Dy
> CONFIG_FB_ASILIANT=3Dy
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_N411=3Dy
> # CONFIG_FB_HGA is not set
> # CONFIG_FB_OPENCORES is not set
> CONFIG_FB_S1D13XXX=3Dy
> CONFIG_FB_NVIDIA=3Dy
> # CONFIG_FB_NVIDIA_I2C is not set
> CONFIG_FB_NVIDIA_DEBUG=3Dy
> # CONFIG_FB_NVIDIA_BACKLIGHT is not set
> CONFIG_FB_RIVA=3Dy
> # CONFIG_FB_RIVA_I2C is not set
> CONFIG_FB_RIVA_DEBUG=3Dy
> CONFIG_FB_RIVA_BACKLIGHT=3Dy
> # CONFIG_FB_I740 is not set
> CONFIG_FB_LE80578=3Dy
> CONFIG_FB_CARILLO_RANCH=3Dy
> CONFIG_FB_MATROX=3Dy
> CONFIG_FB_MATROX_MILLENIUM=3Dy
> # CONFIG_FB_MATROX_MYSTIQUE is not set
> # CONFIG_FB_MATROX_G is not set
> # CONFIG_FB_MATROX_I2C is not set
> CONFIG_FB_RADEON=3Dy
> # CONFIG_FB_RADEON_I2C is not set
> CONFIG_FB_RADEON_BACKLIGHT=3Dy
> CONFIG_FB_RADEON_DEBUG=3Dy
> # CONFIG_FB_ATY128 is not set
> CONFIG_FB_ATY=3Dy
> CONFIG_FB_ATY_CT=3Dy
> CONFIG_FB_ATY_GENERIC_LCD=3Dy
> CONFIG_FB_ATY_GX=3Dy
> # CONFIG_FB_ATY_BACKLIGHT is not set
> CONFIG_FB_S3=3Dy
> # CONFIG_FB_S3_DDC is not set
> # CONFIG_FB_SAVAGE is not set
> CONFIG_FB_SIS=3Dy
> # CONFIG_FB_SIS_300 is not set
> CONFIG_FB_SIS_315=3Dy
> CONFIG_FB_VIA=3Dy
> CONFIG_FB_VIA_DIRECT_PROCFS=3Dy
> # CONFIG_FB_VIA_X_COMPATIBILITY is not set
> CONFIG_FB_NEOMAGIC=3Dy
> CONFIG_FB_KYRO=3Dy
> CONFIG_FB_3DFX=3Dy
> # CONFIG_FB_3DFX_ACCEL is not set
> CONFIG_FB_3DFX_I2C=3Dy
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> CONFIG_FB_TRIDENT=3Dy
> CONFIG_FB_ARK=3Dy
> # CONFIG_FB_PM3 is not set
> CONFIG_FB_CARMINE=3Dy
> CONFIG_FB_CARMINE_DRAM_EVAL=3Dy
> # CONFIG_CARMINE_DRAM_CUSTOM is not set
> CONFIG_FB_GEODE=3Dy
> # CONFIG_FB_GEODE_LX is not set
> # CONFIG_FB_GEODE_GX is not set
> # CONFIG_FB_GEODE_GX1 is not set
> # CONFIG_FB_SMSCUFX is not set
> # CONFIG_FB_UDL is not set
> # CONFIG_FB_VIRTUAL is not set
> CONFIG_FB_METRONOME=3Dy
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_BROADSHEET=3Dy
> CONFIG_FB_AUO_K190X=3Dy
> CONFIG_FB_AUO_K1900=3Dy
> # CONFIG_FB_AUO_K1901 is not set
> CONFIG_FB_HYPERV=3Dy
> CONFIG_FB_SIMPLE=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dy
> CONFIG_BACKLIGHT_PWM=3Dy
> CONFIG_BACKLIGHT_APPLE=3Dy
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_WM831X=3Dy
> CONFIG_BACKLIGHT_ADP5520=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dy
> CONFIG_BACKLIGHT_ADP8870=3Dy
> # CONFIG_BACKLIGHT_88PM860X is not set
> CONFIG_BACKLIGHT_PCF50633=3Dy
> # CONFIG_BACKLIGHT_LM3630A is not set
> CONFIG_BACKLIGHT_LM3639=3Dy
> CONFIG_BACKLIGHT_LP855X=3Dy
> CONFIG_BACKLIGHT_LP8788=3Dy
> CONFIG_BACKLIGHT_OT200=3Dy
> # CONFIG_BACKLIGHT_GPIO is not set
> # CONFIG_BACKLIGHT_LV5207LP is not set
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_VGASTATE=3Dy
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dy
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dy
> CONFIG_HID_ACRUX=3Dy
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dy
> CONFIG_HID_APPLEIR=3Dy
> # CONFIG_HID_AUREAL is not set
> CONFIG_HID_BELKIN=3Dy
> CONFIG_HID_CHERRY=3Dy
> CONFIG_HID_CHICONY=3Dy
> CONFIG_HID_CP2112=3Dy
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DRAGONRISE=3Dy
> # CONFIG_DRAGONRISE_FF is not set
> CONFIG_HID_EMS_FF=3Dy
> CONFIG_HID_ELECOM=3Dy
> CONFIG_HID_ELO=3Dy
> CONFIG_HID_EZKEY=3Dy
> CONFIG_HID_HOLTEK=3Dy
> # CONFIG_HOLTEK_FF is not set
> CONFIG_HID_HUION=3Dy
> # CONFIG_HID_KEYTOUCH is not set
> CONFIG_HID_KYE=3Dy
> CONFIG_HID_UCLOGIC=3Dy
> CONFIG_HID_WALTOP=3Dy
> # CONFIG_HID_GYRATION is not set
> CONFIG_HID_ICADE=3Dy
> # CONFIG_HID_TWINHAN is not set
> CONFIG_HID_KENSINGTON=3Dy
> # CONFIG_HID_LCPOWER is not set
> # CONFIG_HID_LENOVO_TPKBD is not set
> CONFIG_HID_LOGITECH=3Dy
> # CONFIG_HID_LOGITECH_DJ is not set
> CONFIG_LOGITECH_FF=3Dy
> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> # CONFIG_LOGIG940_FF is not set
> # CONFIG_LOGIWHEELS_FF is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MICROSOFT is not set
> # CONFIG_HID_MONTEREY is not set
> CONFIG_HID_MULTITOUCH=3Dy
> CONFIG_HID_NTRIG=3Dy
> CONFIG_HID_ORTEK=3Dy
> CONFIG_HID_PANTHERLORD=3Dy
> CONFIG_PANTHERLORD_FF=3Dy
> CONFIG_HID_PETALYNX=3Dy
> CONFIG_HID_PICOLCD=3Dy
> # CONFIG_HID_PICOLCD_FB is not set
> # CONFIG_HID_PICOLCD_BACKLIGHT is not set
> CONFIG_HID_PICOLCD_LCD=3Dy
> # CONFIG_HID_PICOLCD_LEDS is not set
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_ROCCAT=3Dy
> CONFIG_HID_SAITEK=3Dy
> CONFIG_HID_SAMSUNG=3Dy
> # CONFIG_HID_SONY is not set
> CONFIG_HID_SPEEDLINK=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> # CONFIG_HID_RMI is not set
> CONFIG_HID_GREENASIA=3Dy
> # CONFIG_GREENASIA_FF is not set
> # CONFIG_HID_HYPERV_MOUSE is not set
> CONFIG_HID_SMARTJOYPLUS=3Dy
> CONFIG_SMARTJOYPLUS_FF=3Dy
> # CONFIG_HID_TIVO is not set
> # CONFIG_HID_TOPSEED is not set
> # CONFIG_HID_THINGM is not set
> # CONFIG_HID_THRUSTMASTER is not set
> CONFIG_HID_WACOM=3Dy
> CONFIG_HID_WIIMOTE=3Dy
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> CONFIG_HID_ZYDACRON=3Dy
> CONFIG_HID_SENSOR_HUB=3Dy
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> CONFIG_HID_PID=3Dy
> # CONFIG_USB_HIDDEV is not set
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> =

> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> CONFIG_USB_OTG=3Dy
> # CONFIG_USB_OTG_WHITELIST is not set
> CONFIG_USB_OTG_BLACKLIST_HUB=3Dy
> CONFIG_USB_OTG_FSM=3Dy
> CONFIG_USB_MON=3Dy
> CONFIG_USB_WUSB_CBAF=3Dy
> CONFIG_USB_WUSB_CBAF_DEBUG=3Dy
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> CONFIG_USB_XHCI_HCD=3Dy
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> CONFIG_USB_EHCI_PCI=3Dy
> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> CONFIG_USB_OXU210HP_HCD=3Dy
> CONFIG_USB_ISP116X_HCD=3Dy
> CONFIG_USB_ISP1760_HCD=3Dy
> CONFIG_USB_ISP1362_HCD=3Dy
> CONFIG_USB_FUSBH200_HCD=3Dy
> # CONFIG_USB_FOTG210_HCD is not set
> # CONFIG_USB_OHCI_HCD is not set
> CONFIG_USB_UHCI_HCD=3Dy
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> CONFIG_USB_HCD_BCMA=3Dy
> # CONFIG_USB_HCD_SSB is not set
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=3Dy
> CONFIG_USB_PRINTER=3Dy
> CONFIG_USB_WDM=3Dy
> # CONFIG_USB_TMC is not set
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> =

> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=3Dy
> CONFIG_USB_MUSB_HDRC=3Dy
> CONFIG_USB_MUSB_HOST=3Dy
> # CONFIG_USB_MUSB_TUSB6010 is not set
> CONFIG_USB_MUSB_UX500=3Dy
> CONFIG_USB_UX500_DMA=3Dy
> # CONFIG_MUSB_PIO_ONLY is not set
> # CONFIG_USB_DWC3 is not set
> CONFIG_USB_DWC2=3Dy
> CONFIG_USB_DWC2_HOST=3Dy
> CONFIG_USB_DWC2_PLATFORM=3Dy
> # CONFIG_USB_DWC2_PCI is not set
> =

> #
> # Gadget mode requires USB Gadget support to be enabled
> #
> # CONFIG_USB_DWC2_DEBUG is not set
> CONFIG_USB_DWC2_TRACK_MISSED_SOFS=3Dy
> CONFIG_USB_CHIPIDEA=3Dy
> CONFIG_USB_CHIPIDEA_HOST=3Dy
> CONFIG_USB_CHIPIDEA_DEBUG=3Dy
> =

> #
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> CONFIG_USB_SERIAL=3Dy
> # CONFIG_USB_SERIAL_CONSOLE is not set
> # CONFIG_USB_SERIAL_GENERIC is not set
> # CONFIG_USB_SERIAL_SIMPLE is not set
> CONFIG_USB_SERIAL_AIRCABLE=3Dy
> CONFIG_USB_SERIAL_ARK3116=3Dy
> CONFIG_USB_SERIAL_BELKIN=3Dy
> CONFIG_USB_SERIAL_CH341=3Dy
> CONFIG_USB_SERIAL_WHITEHEAT=3Dy
> CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dy
> CONFIG_USB_SERIAL_CP210X=3Dy
> CONFIG_USB_SERIAL_CYPRESS_M8=3Dy
> CONFIG_USB_SERIAL_EMPEG=3Dy
> CONFIG_USB_SERIAL_FTDI_SIO=3Dy
> CONFIG_USB_SERIAL_VISOR=3Dy
> # CONFIG_USB_SERIAL_IPAQ is not set
> # CONFIG_USB_SERIAL_IR is not set
> CONFIG_USB_SERIAL_EDGEPORT=3Dy
> CONFIG_USB_SERIAL_EDGEPORT_TI=3Dy
> # CONFIG_USB_SERIAL_F81232 is not set
> # CONFIG_USB_SERIAL_GARMIN is not set
> # CONFIG_USB_SERIAL_IPW is not set
> CONFIG_USB_SERIAL_IUU=3Dy
> CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dy
> CONFIG_USB_SERIAL_KEYSPAN=3Dy
> CONFIG_USB_SERIAL_KLSI=3Dy
> # CONFIG_USB_SERIAL_KOBIL_SCT is not set
> CONFIG_USB_SERIAL_MCT_U232=3Dy
> CONFIG_USB_SERIAL_METRO=3Dy
> CONFIG_USB_SERIAL_MOS7720=3Dy
> # CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
> CONFIG_USB_SERIAL_MOS7840=3Dy
> # CONFIG_USB_SERIAL_MXUPORT is not set
> # CONFIG_USB_SERIAL_NAVMAN is not set
> CONFIG_USB_SERIAL_PL2303=3Dy
> CONFIG_USB_SERIAL_OTI6858=3Dy
> # CONFIG_USB_SERIAL_QCAUX is not set
> CONFIG_USB_SERIAL_QUALCOMM=3Dy
> CONFIG_USB_SERIAL_SPCP8X5=3Dy
> CONFIG_USB_SERIAL_SAFE=3Dy
> CONFIG_USB_SERIAL_SAFE_PADDED=3Dy
> CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dy
> CONFIG_USB_SERIAL_SYMBOL=3Dy
> # CONFIG_USB_SERIAL_TI is not set
> CONFIG_USB_SERIAL_CYBERJACK=3Dy
> CONFIG_USB_SERIAL_XIRCOM=3Dy
> CONFIG_USB_SERIAL_WWAN=3Dy
> CONFIG_USB_SERIAL_OPTION=3Dy
> # CONFIG_USB_SERIAL_OMNINET is not set
> # CONFIG_USB_SERIAL_OPTICON is not set
> CONFIG_USB_SERIAL_XSENS_MT=3Dy
> # CONFIG_USB_SERIAL_WISHBONE is not set
> # CONFIG_USB_SERIAL_ZTE is not set
> CONFIG_USB_SERIAL_SSU100=3Dy
> CONFIG_USB_SERIAL_QT2=3Dy
> # CONFIG_USB_SERIAL_DEBUG is not set
> =

> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=3Dy
> CONFIG_USB_EMI26=3Dy
> # CONFIG_USB_ADUTUX is not set
> # CONFIG_USB_SEVSEG is not set
> # CONFIG_USB_RIO500 is not set
> CONFIG_USB_LEGOTOWER=3Dy
> # CONFIG_USB_LCD is not set
> # CONFIG_USB_LED is not set
> CONFIG_USB_CYPRESS_CY7C63=3Dy
> CONFIG_USB_CYTHERM=3Dy
> # CONFIG_USB_IDMOUSE is not set
> # CONFIG_USB_FTDI_ELAN is not set
> # CONFIG_USB_APPLEDISPLAY is not set
> # CONFIG_USB_SISUSBVGA is not set
> CONFIG_USB_LD=3Dy
> # CONFIG_USB_TRANCEVIBRATOR is not set
> CONFIG_USB_IOWARRIOR=3Dy
> CONFIG_USB_TEST=3Dy
> CONFIG_USB_EHSET_TEST_FIXTURE=3Dy
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> CONFIG_USB_EZUSB_FX2=3Dy
> CONFIG_USB_HSIC_USB3503=3Dy
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> # CONFIG_SAMSUNG_USB2PHY is not set
> # CONFIG_SAMSUNG_USB3PHY is not set
> # CONFIG_USB_GPIO_VBUS is not set
> CONFIG_USB_ISP1301=3Dy
> # CONFIG_USB_GADGET is not set
> # CONFIG_UWB is not set
> # CONFIG_MMC is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dy
> CONFIG_LEDS_LM3530=3Dy
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_NET48XX is not set
> # CONFIG_LEDS_WRAP is not set
> CONFIG_LEDS_PCA9532=3Dy
> CONFIG_LEDS_PCA9532_GPIO=3Dy
> CONFIG_LEDS_GPIO=3Dy
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> # CONFIG_LEDS_LP5521 is not set
> CONFIG_LEDS_LP5523=3Dy
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dy
> # CONFIG_LEDS_LP8788 is not set
> CONFIG_LEDS_CLEVO_MAIL=3Dy
> CONFIG_LEDS_PCA955X=3Dy
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_WM831X_STATUS is not set
> CONFIG_LEDS_WM8350=3Dy
> # CONFIG_LEDS_PWM is not set
> CONFIG_LEDS_REGULATOR=3Dy
> # CONFIG_LEDS_BD2802 is not set
> # CONFIG_LEDS_INTEL_SS4200 is not set
> CONFIG_LEDS_LT3593=3Dy
> CONFIG_LEDS_ADP5520=3Dy
> # CONFIG_LEDS_DELL_NETBOOKS is not set
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_LM355x=3Dy
> # CONFIG_LEDS_OT200 is not set
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dy
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> # CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
> # CONFIG_LEDS_TRIGGER_CPU is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> # CONFIG_LEDS_TRIGGER_TRANSIENT is not set
> # CONFIG_LEDS_TRIGGER_CAMERA is not set
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_MM_EDAC=3Dy
> CONFIG_EDAC_AMD76X=3Dy
> # CONFIG_EDAC_E7XXX is not set
> CONFIG_EDAC_E752X=3Dy
> CONFIG_EDAC_I82875P=3Dy
> CONFIG_EDAC_I82975X=3Dy
> CONFIG_EDAC_I3000=3Dy
> CONFIG_EDAC_I3200=3Dy
> CONFIG_EDAC_X38=3Dy
> CONFIG_EDAC_I5400=3Dy
> CONFIG_EDAC_I82860=3Dy
> CONFIG_EDAC_R82600=3Dy
> CONFIG_EDAC_I5000=3Dy
> # CONFIG_EDAC_I5100 is not set
> CONFIG_EDAC_I7300=3Dy
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> # CONFIG_RTC_HCTOSYS is not set
> # CONFIG_RTC_SYSTOHC is not set
> CONFIG_RTC_DEBUG=3Dy
> =

> #
> # RTC interfaces
> #
> # CONFIG_RTC_INTF_SYSFS is not set
> # CONFIG_RTC_INTF_PROC is not set
> CONFIG_RTC_INTF_DEV=3Dy
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> CONFIG_RTC_DRV_TEST=3Dy
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM860X=3Dy
> # CONFIG_RTC_DRV_DS1307 is not set
> CONFIG_RTC_DRV_DS1374=3Dy
> CONFIG_RTC_DRV_DS1672=3Dy
> CONFIG_RTC_DRV_DS3232=3Dy
> # CONFIG_RTC_DRV_LP8788 is not set
> # CONFIG_RTC_DRV_MAX6900 is not set
> # CONFIG_RTC_DRV_MAX8998 is not set
> CONFIG_RTC_DRV_RS5C372=3Dy
> CONFIG_RTC_DRV_ISL1208=3Dy
> CONFIG_RTC_DRV_ISL12022=3Dy
> # CONFIG_RTC_DRV_ISL12057 is not set
> CONFIG_RTC_DRV_X1205=3Dy
> CONFIG_RTC_DRV_PCF2127=3Dy
> CONFIG_RTC_DRV_PCF8523=3Dy
> CONFIG_RTC_DRV_PCF8563=3Dy
> CONFIG_RTC_DRV_PCF8583=3Dy
> CONFIG_RTC_DRV_M41T80=3Dy
> CONFIG_RTC_DRV_M41T80_WDT=3Dy
> CONFIG_RTC_DRV_BQ32K=3Dy
> CONFIG_RTC_DRV_TPS6586X=3Dy
> CONFIG_RTC_DRV_TPS65910=3Dy
> CONFIG_RTC_DRV_RC5T583=3Dy
> CONFIG_RTC_DRV_S35390A=3Dy
> CONFIG_RTC_DRV_FM3130=3Dy
> # CONFIG_RTC_DRV_RX8581 is not set
> # CONFIG_RTC_DRV_RX8025 is not set
> CONFIG_RTC_DRV_EM3027=3Dy
> CONFIG_RTC_DRV_RV3029C2=3Dy
> =

> #
> # SPI RTC drivers
> #
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> CONFIG_RTC_DRV_DS1286=3Dy
> CONFIG_RTC_DRV_DS1511=3Dy
> CONFIG_RTC_DRV_DS1553=3Dy
> # CONFIG_RTC_DRV_DS1742 is not set
> CONFIG_RTC_DRV_DA9063=3Dy
> # CONFIG_RTC_DRV_STK17TA8 is not set
> # CONFIG_RTC_DRV_M48T86 is not set
> CONFIG_RTC_DRV_M48T35=3Dy
> CONFIG_RTC_DRV_M48T59=3Dy
> CONFIG_RTC_DRV_MSM6242=3Dy
> # CONFIG_RTC_DRV_BQ4802 is not set
> CONFIG_RTC_DRV_RP5C01=3Dy
> CONFIG_RTC_DRV_V3020=3Dy
> # CONFIG_RTC_DRV_DS2404 is not set
> CONFIG_RTC_DRV_WM831X=3Dy
> CONFIG_RTC_DRV_WM8350=3Dy
> CONFIG_RTC_DRV_PCF50633=3Dy
> =

> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_DRV_MOXART is not set
> CONFIG_RTC_DRV_XGENE=3Dy
> =

> #
> # HID Sensor RTC drivers
> #
> CONFIG_RTC_DRV_HID_SENSOR_TIME=3Dy
> # CONFIG_DMADEVICES is not set
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_UIO is not set
> CONFIG_VIRT_DRIVERS=3Dy
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> # CONFIG_VIRTIO_BALLOON is not set
> CONFIG_VIRTIO_MMIO=3Dy
> CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_HYPERV=3Dy
> # CONFIG_HYPERV_BALLOON is not set
> # CONFIG_STAGING is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> CONFIG_ACER_WMI=3Dy
> # CONFIG_ACERHDF is not set
> # CONFIG_ALIENWARE_WMI is not set
> CONFIG_ASUS_LAPTOP=3Dy
> CONFIG_DELL_LAPTOP=3Dy
> CONFIG_DELL_WMI=3Dy
> CONFIG_DELL_WMI_AIO=3Dy
> # CONFIG_DELL_SMO8800 is not set
> CONFIG_FUJITSU_LAPTOP=3Dy
> CONFIG_FUJITSU_LAPTOP_DEBUG=3Dy
> CONFIG_FUJITSU_TABLET=3Dy
> CONFIG_TC1100_WMI=3Dy
> CONFIG_HP_ACCEL=3Dy
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_HP_WMI is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_THINKPAD_ACPI is not set
> CONFIG_SENSORS_HDAPS=3Dy
> CONFIG_ACPI_WMI=3Dy
> # CONFIG_MSI_WMI is not set
> CONFIG_TOPSTAR_LAPTOP=3Dy
> CONFIG_ACPI_TOSHIBA=3Dy
> CONFIG_TOSHIBA_BT_RFKILL=3Dy
> # CONFIG_ACPI_CMPC is not set
> CONFIG_INTEL_IPS=3Dy
> CONFIG_IBM_RTL=3Dy
> CONFIG_SAMSUNG_LAPTOP=3Dy
> CONFIG_MXM_WMI=3Dy
> CONFIG_SAMSUNG_Q10=3Dy
> CONFIG_APPLE_GMUX=3Dy
> # CONFIG_INTEL_RST is not set
> CONFIG_INTEL_SMARTCONNECT=3Dy
> CONFIG_PVPANIC=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> # CONFIG_CHROMEOS_LAPTOP is not set
> CONFIG_CHROMEOS_PSTORE=3Dy
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> CONFIG_COMMON_CLK_WM831X=3Dy
> CONFIG_COMMON_CLK_SI5351=3Dy
> =

> #
> # Hardware Spinlock drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> CONFIG_MAILBOX=3Dy
> # CONFIG_IOMMU_SUPPORT is not set
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_STE_MODEM_RPROC is not set
> =

> #
> # Rpmsg drivers
> #
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> =

> #
> # DEVFREQ Drivers
> #
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_GPIO is not set
> CONFIG_EXTCON_ADC_JACK=3Dy
> # CONFIG_EXTCON_MAX14577 is not set
> # CONFIG_MEMORY is not set
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> =

> #
> # Accelerometers
> #
> # CONFIG_BMA180 is not set
> CONFIG_HID_SENSOR_ACCEL_3D=3Dy
> CONFIG_IIO_ST_ACCEL_3AXIS=3Dy
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dy
> CONFIG_MMA8452=3Dy
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD799X=3Dy
> CONFIG_LP8788_ADC=3Dy
> CONFIG_MAX1363=3Dy
> CONFIG_MCP3422=3Dy
> CONFIG_NAU7802=3Dy
> CONFIG_TI_ADC081C=3Dy
> CONFIG_TI_AM335X_ADC=3Dy
> CONFIG_VIPERBOARD_ADC=3Dy
> =

> #
> # Amplifiers
> #
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=3Dy
> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dy
> CONFIG_AD5380=3Dy
> # CONFIG_AD5446 is not set
> # CONFIG_MAX517 is not set
> # CONFIG_MCP4725 is not set
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> =

> #
> # Digital gyroscope sensors
> #
> # CONFIG_HID_SENSOR_GYRO_3D is not set
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_ITG3200=3Dy
> =

> #
> # Humidity sensors
> #
> # CONFIG_DHT11 is not set
> CONFIG_SI7005=3Dy
> =

> #
> # Inertial measurement units
> #
> CONFIG_INV_MPU6050_IIO=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ADJD_S311 is not set
> CONFIG_APDS9300=3Dy
> CONFIG_CM32181=3Dy
> # CONFIG_CM36651 is not set
> CONFIG_GP2AP020A00F=3Dy
> # CONFIG_HID_SENSOR_ALS is not set
> CONFIG_HID_SENSOR_PROX=3Dy
> # CONFIG_LTR501 is not set
> CONFIG_TCS3472=3Dy
> CONFIG_SENSORS_TSL2563=3Dy
> CONFIG_TSL4531=3Dy
> CONFIG_VCNL4000=3Dy
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dy
> CONFIG_MAG3110=3Dy
> # CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
> # CONFIG_IIO_ST_MAGN_3AXIS is not set
> =

> #
> # Inclinometer sensors
> #
> # CONFIG_HID_SENSOR_INCLINOMETER_3D is not set
> # CONFIG_HID_SENSOR_DEVICE_ROTATION is not set
> =

> #
> # Triggers - standalone
> #
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> CONFIG_IIO_SYSFS_TRIGGER=3Dy
> =

> #
> # Pressure sensors
> #
> # CONFIG_HID_SENSOR_PRESS is not set
> CONFIG_MPL115=3Dy
> CONFIG_MPL3115=3Dy
> CONFIG_IIO_ST_PRESS=3Dy
> CONFIG_IIO_ST_PRESS_I2C=3Dy
> =

> #
> # Lightning sensors
> #
> =

> #
> # Temperature sensors
> #
> CONFIG_MLX90614=3Dy
> # CONFIG_TMP006 is not set
> # CONFIG_NTB is not set
> CONFIG_VME_BUS=3Dy
> =

> #
> # VME Bridge Drivers
> #
> # CONFIG_VME_CA91CX42 is not set
> CONFIG_VME_TSI148=3Dy
> =

> #
> # VME Board Drivers
> #
> # CONFIG_VMIVME_7805 is not set
> =

> #
> # VME Device Drivers
> #
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_LP3943=3Dy
> CONFIG_PWM_LPSS=3Dy
> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_FMC=3Dy
> # CONFIG_FMC_FAKEDEV is not set
> # CONFIG_FMC_TRIVIAL is not set
> CONFIG_FMC_WRITE_EEPROM=3Dy
> # CONFIG_FMC_CHARDEV is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_PHY_SAMSUNG_USB2=3Dy
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> CONFIG_EDD_OFF=3Dy
> CONFIG_FIRMWARE_MEMMAP=3Dy
> # CONFIG_DELL_RBU is not set
> CONFIG_DCDBAS=3Dy
> CONFIG_DMIID=3Dy
> # CONFIG_DMI_SYSFS is not set
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> CONFIG_ISCSI_IBFT_FIND=3Dy
> CONFIG_GOOGLE_FIRMWARE=3Dy
> =

> #
> # Google Firmware Drivers
> #
> CONFIG_GOOGLE_MEMCONSOLE=3Dy
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_FS_POSIX_ACL is not set
> # CONFIG_FILE_LOCKING is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> # CONFIG_INOTIFY_USER is not set
> CONFIG_FANOTIFY=3Dy
> # CONFIG_QUOTA is not set
> # CONFIG_QUOTACTL is not set
> CONFIG_AUTOFS4_FS=3Dy
> # CONFIG_FUSE_FS is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_KCORE=3Dy
> # CONFIG_PROC_VMCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> # CONFIG_PROC_PAGE_MONITOR is not set
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> # CONFIG_TMPFS is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> CONFIG_JFFS2_SUMMARY=3Dy
> # CONFIG_JFFS2_FS_XATTR is not set
> CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> # CONFIG_JFFS2_ZLIB is not set
> CONFIG_JFFS2_LZO=3Dy
> CONFIG_JFFS2_RTIME=3Dy
> # CONFIG_JFFS2_RUBIN is not set
> # CONFIG_JFFS2_CMODE_NONE is not set
> # CONFIG_JFFS2_CMODE_PRIORITY is not set
> # CONFIG_JFFS2_CMODE_SIZE is not set
> CONFIG_JFFS2_CMODE_FAVOURLZO=3Dy
> CONFIG_UBIFS_FS=3Dy
> CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> # CONFIG_UBIFS_FS_LZO is not set
> # CONFIG_UBIFS_FS_ZLIB is not set
> # CONFIG_LOGFS is not set
> # CONFIG_ROMFS_FS is not set
> # CONFIG_PSTORE is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dy
> CONFIG_NLS_CODEPAGE_865=3Dy
> # CONFIG_NLS_CODEPAGE_866 is not set
> CONFIG_NLS_CODEPAGE_869=3Dy
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> CONFIG_NLS_CODEPAGE_1251=3Dy
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> # CONFIG_NLS_ISO8859_6 is not set
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> # CONFIG_NLS_ISO8859_13 is not set
> CONFIG_NLS_ISO8859_14=3Dy
> # CONFIG_NLS_ISO8859_15 is not set
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> CONFIG_NLS_MAC_CENTEURO=3Dy
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dy
> CONFIG_NLS_MAC_GREEK=3Dy
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dy
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
> # CONFIG_NLS_UTF8 is not set
> =

> #
> # Kernel hacking
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_DEFAULT_MESSAGE_LOGLEVEL=3D4
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> # CONFIG_DYNAMIC_DEBUG is not set
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # CONFIG_MAGIC_SYSRQ is not set
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> CONFIG_DEBUG_VM=3Dy
> CONFIG_DEBUG_VM_VMACACHE=3Dy
> CONFIG_DEBUG_VM_RB=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> # CONFIG_DEBUG_HIGHMEM is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_LOCKUP_DETECTOR is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # CONFIG_TIMER_STATS is not set
> CONFIG_DEBUG_PREEMPT=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_RT_MUTEX_TESTER is not set
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_DEBUG_PI_LIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> CONFIG_PROVE_RCU_REPEATEDLY=3Dy
> # CONFIG_PROVE_RCU_DELAY is not set
> CONFIG_SPARSE_RCU_POINTER=3Dy
> CONFIG_TORTURE_TEST=3Dy
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_CPU_STALL_VERBOSE=3Dy
> CONFIG_RCU_CPU_STALL_INFO=3Dy
> CONFIG_RCU_TRACE=3Dy
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_FAULT_INJECTION=3Dy
> CONFIG_FAIL_PAGE_ALLOC=3Dy
> # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
> CONFIG_LATENCYTOP=3Dy
> CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
> CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_FUNCTION_TRACER is not set
> CONFIG_IRQSOFF_TRACER=3Dy
> # CONFIG_PREEMPT_TRACER is not set
> CONFIG_SCHED_TRACER=3Dy
> # CONFIG_FTRACE_SYSCALLS is not set
> CONFIG_TRACER_SNAPSHOT=3Dy
> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> CONFIG_TRACE_BRANCH_PROFILING=3Dy
> # CONFIG_BRANCH_PROFILE_NONE is not set
> CONFIG_PROFILE_ANNOTATED_BRANCHES=3Dy
> # CONFIG_PROFILE_ALL_BRANCHES is not set
> CONFIG_TRACING_BRANCHES=3Dy
> CONFIG_BRANCH_TRACER=3Dy
> # CONFIG_STACK_TRACER is not set
> # CONFIG_UPROBE_EVENT is not set
> # CONFIG_PROBE_EVENTS is not set
> CONFIG_FTRACE_SELFTEST=3Dy
> CONFIG_FTRACE_STARTUP_TEST=3Dy
> # CONFIG_EVENT_TRACE_TEST_SYSCALLS is not set
> # CONFIG_MMIOTRACE is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dy
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> =

> #
> # Runtime Testing
> #
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> CONFIG_RBTREE_TEST=3Dy
> CONFIG_ATOMIC64_SELFTEST=3Dy
> CONFIG_TEST_STRING_HELPERS=3Dy
> CONFIG_TEST_KSTRTOX=3Dy
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_BUILD_DOCSRC is not set
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_STRICT_DEVMEM=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> # CONFIG_EARLY_PRINTK is not set
> CONFIG_X86_PTDUMP=3Dy
> CONFIG_DEBUG_RODATA=3Dy
> CONFIG_DEBUG_RODATA_TEST=3Dy
> # CONFIG_DOUBLEFAULT is not set
> # CONFIG_DEBUG_TLBFLUSH is not set
> # CONFIG_IOMMU_STRESS is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_IO_DELAY_TYPE_0X80=3D0
> CONFIG_IO_DELAY_TYPE_0XED=3D1
> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> CONFIG_IO_DELAY_TYPE_NONE=3D3
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEFAULT_IO_DELAY_TYPE=3D0
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_OPTIMIZE_INLINING is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_STATIC_CPU_HAS=3Dy
> =

> #
> # Security options
> #
> # CONFIG_KEYS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> # CONFIG_SECURITY is not set
> CONFIG_SECURITYFS=3Dy
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_BLKCIPHER=3Dy
> CONFIG_CRYPTO_BLKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_PCOMP=3Dy
> CONFIG_CRYPTO_PCOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> # CONFIG_CRYPTO_CCM is not set
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> # CONFIG_CRYPTO_CTS is not set
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> # CONFIG_CRYPTO_PCBC is not set
> CONFIG_CRYPTO_XTS=3Dy
> =

> #
> # Hash modes
> #
> # CONFIG_CRYPTO_CMAC is not set
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> # CONFIG_CRYPTO_VMAC is not set
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> # CONFIG_CRYPTO_CRC32 is not set
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> # CONFIG_CRYPTO_MD5 is not set
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> CONFIG_CRYPTO_RMD128=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dy
> # CONFIG_CRYPTO_SHA1 is not set
> # CONFIG_CRYPTO_SHA256 is not set
> # CONFIG_CRYPTO_SHA512 is not set
> # CONFIG_CRYPTO_TGR192 is not set
> # CONFIG_CRYPTO_WP512 is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_586=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_DES=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> # CONFIG_CRYPTO_KHAZAD is not set
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_SALSA20_586=3Dy
> # CONFIG_CRYPTO_SEED is not set
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> CONFIG_CRYPTO_TEA=3Dy
> # CONFIG_CRYPTO_TWOFISH is not set
> # CONFIG_CRYPTO_TWOFISH_586 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_ZLIB=3Dy
> # CONFIG_CRYPTO_LZO is not set
> CONFIG_CRYPTO_LZ4=3Dy
> CONFIG_CRYPTO_LZ4HC=3Dy
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_HW is not set
> CONFIG_HAVE_KVM=3Dy
> # CONFIG_VIRTUALIZATION is not set
> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_BITREVERSE=3Dy
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_GENERIC_IO=3Dy
> # CONFIG_CRC_CCITT is not set
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=3Dy
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> # CONFIG_XZ_DEC_IA64 is not set
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> CONFIG_AVERAGE=3Dy
> # CONFIG_CORDIC is not set
> CONFIG_DDR=3Dy

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com


--===============7926050278392857934==--

