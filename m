Content-Type: multipart/mixed; boundary="===============1151991308378717673=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: 87c4696d57 ("mm/debug: Add tests validating architecture page .."): [ 1.395296] kernel BUG at include/linux/mm.h:2007!
Date: Fri, 24 Jan 2020 12:47:59 +0530
Message-ID: <78f5a3f0-7098-0cd9-130d-393c0384b89a@arm.com>
In-Reply-To: <c810b7b5-55b8-e0a6-acdb-2afa11429a41@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1151991308378717673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 01/07/2020 12:00 PM, Rong Chen wrote:
> =

> =

> On 1/7/20 1:57 PM, Anshuman Khandual wrote:
>> On 12/26/2019 02:19 PM, kernel test robot wrote:
>>> 46cf053efe=C2=A0 Linux 5.5-rc3
>>> 87c4696d57=C2=A0 mm/debug: Add tests validating architecture page table=
 helpers
>>> +------------------------------------------+----------+------------+
>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | v5.5-rc3 | 87c4696d57 |
>>> +------------------------------------------+----------+------------+
>>> | boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> | boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> | kernel_BUG_at_include/linux/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> | invalid_opcode:#[##]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>> | EIP:pgtable_pmd_page_dtor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> | Kernel_panic-not_syncing:Fatal_exception | 0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> +------------------------------------------+----------+------------+
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> [=C2=A0=C2=A0=C2=A0 1.390624] smp: Brought up 1 node, 2 CPUs
>>> [=C2=A0=C2=A0=C2=A0 1.390624] smpboot: Max logical packages: 2
>>> [=C2=A0=C2=A0=C2=A0 1.390624] smpboot: Total of 2 processors activated =
(8783.48 BogoMIPS)
>>> [=C2=A0=C2=A0=C2=A0 1.391537] debug_vm_pgtable: debug_vm_pgtable: Valid=
ating architecture page table helpers
>>> [=C2=A0=C2=A0=C2=A0 1.392382] page:f29b85c0 refcount:0 mapcount:0 mappi=
ng:00000000 index:0x0
>>> [=C2=A0=C2=A0=C2=A0 1.393415] raw: 02800000 f29b8624 f29b8584 00000000 =
00000000 edc22280 ffffffff 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.394178] page dumped because: VM_BUG_ON_PAGE(page-=
>pmd_huge_pte)
>>> [=C2=A0=C2=A0=C2=A0 1.394820] ------------[ cut here ]------------
>>> [=C2=A0=C2=A0=C2=A0 1.395296] kernel BUG at include/linux/mm.h:2007!
>>> [=C2=A0=C2=A0=C2=A0 1.395942] invalid opcode: 0000 [#1] SMP DEBUG_PAGEA=
LLOC PTI
>>> [=C2=A0=C2=A0=C2=A0 1.396463] CPU: 0 PID: 1 Comm: swapper/0 Not tainted=
 5.5.0-rc3-00001-g87c4696d57b5e #1
>>> [=C2=A0=C2=A0=C2=A0 1.396722] EIP: pgtable_pmd_page_dtor+0x1a/0x23
>>> [=C2=A0=C2=A0=C2=A0 1.396722] Code: d4 8a 27 c2 e8 16 81 04 00 b2 01 5b=
 88 d0 5d c3 55 89 e5 52 89 45 fc 8b 45 fc 83 78 08 00 74 0c ba e1 e2 e0 c1=
 e8 14 99 13 00 <0f> 0b e8 92 eb 13 00 c9 c3 55 89 e5 52 89 45 fc 8b 45 fc =
90 8d 74
>>> [=C2=A0=C2=A0=C2=A0 1.396722] EAX: c1e0e2e1 EBX: 2dc2e000 ECX: 00000000=
 EDX: c1e0e2e1
>>> [=C2=A0=C2=A0=C2=A0 1.396722] ESI: edc2b000 EDI: edc4e010 EBP: ee287f14=
 ESP: ee287f10
>>> [=C2=A0=C2=A0=C2=A0 1.396722] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0=
068 EFLAGS: 00010246
>>> [=C2=A0=C2=A0=C2=A0 1.396722] CR0: 80050033 CR2: ffffffff CR3: 0226a000=
 CR4: 001406b0
>>> [=C2=A0=C2=A0=C2=A0 1.396722] DR0: 00000000 DR1: 00000000 DR2: 00000000=
 DR3: 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.396722] DR6: fffe0ff0 DR7: 00000400
>>> [=C2=A0=C2=A0=C2=A0 1.396722] Call Trace:
>>> [=C2=A0=C2=A0=C2=A0 1.396722]=C2=A0 mop_up_one_pmd+0x48/0x62
>>> [=C2=A0=C2=A0=C2=A0 1.396722]=C2=A0 pgd_free+0x35/0xe0
>>> [=C2=A0=C2=A0=C2=A0 1.396722]=C2=A0 __mmdrop+0x42/0x96
>>> [=C2=A0=C2=A0=C2=A0 1.396722]=C2=A0 debug_vm_pgtable+0x460/0x47c
>>> [=C2=A0=C2=A0=C2=A0 1.396722]=C2=A0 kernel_init_freeable+0x84/0x172
>>> [=C2=A0=C2=A0=C2=A0 1.396722]=C2=A0 ? rest_init+0xe9/0xe9
>>> [=C2=A0=C2=A0=C2=A0 1.396722]=C2=A0 kernel_init+0xd/0xe9
>>> [=C2=A0=C2=A0=C2=A0 1.396722]=C2=A0 ret_from_fork+0x1e/0x28
>>> [=C2=A0=C2=A0=C2=A0 1.396722] Modules linked in:
>>> [=C2=A0=C2=A0=C2=A0 1.396742] ---[ end trace 9c6f11143a94c590 ]---
>>> [=C2=A0=C2=A0=C2=A0 1.397197] EIP: pgtable_pmd_page_dtor+0x1a/0x23
>> Hello,
>>
>> Wondering if some one could help me with steps to reproduce this crash ?
>> Could not reproduce the problem with the patch applied on Linux 5.5-rc3
>> when built with the config file provided here on a standard KVM guest.
>>
>> - Anshuman
> =

> Hi Anshuman,
> =

> You can compile the kernel with config-5.5.0-rc3-00001-g87c4696d57b5e, an=
d run the reproduce script.
> Both files are in the original report mail.

I did compile the kernel (5.5-rc3 with this patch) along with given config
file config-5.5.0-rc3-00001-g87c4696d57b5e. Tried building kernel with and
without ("ARCH=3Di386 olddefconfig prepare modules_prepare bzImage") for two
different experiments.

> =

> # ./reproduce-yocto-vm-yocto-f91855057302-20191226051639-i386-randconfig-=
a001-20191225-5.5.0-rc3-00001-g87c4696d57b5e-1 ~/linux/arch/x86/boot/bzImag=
e 2>&1 | tail -20
> [=C2=A0=C2=A0=C2=A0 1.471128] Call Trace:
> [=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 mop_up_one_pmd+0x48/0x62
> [=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 pgd_free+0x33/0xcc
> [=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 __mmdrop+0x42/0x96
> [=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 debug_vm_pgtable+0x45d/0x465
> [=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 kernel_init_freeable+0x83/0x16b
> [=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 ? rest_init+0xe0/0xe0
> [=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 kernel_init+0xd/0xe9
> [=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 ret_from_fork+0x1e/0x28
> [=C2=A0=C2=A0=C2=A0 1.471128] Modules linked in:
> [=C2=A0=C2=A0=C2=A0 1.471134] ---[ end trace b241750e0a95311e ]---
> [=C2=A0=C2=A0=C2=A0 1.471570] EIP: pgtable_pmd_page_dtor+0x1a/0x23
> [=C2=A0=C2=A0=C2=A0 1.472006] Code: ba 9b 0b df c1 e8 eb 71 04 00 5b 89 f=
0 5e 5d c3 55 89 e5 52 89 45 fc 8b 45 fc 83 78 08 00 74 0c ba b6 0b df c1 e=
8 d6 51 13 00 <0f> 0b e8 c6 a3 13 00 c9 c3 55 89 e5 52 89 45 fc 8b 45 fc 90=
 8d 74
> [=C2=A0=C2=A0=C2=A0 1.473746] EAX: c1df0bb6 EBX: 2e42d000 ECX: 00000000 E=
DX: c1df0bb6
> [=C2=A0=C2=A0=C2=A0 1.474340] ESI: ee42b000 EDI: ee44e008 EBP: eea87f20 E=
SP: eea87f1c
> [=C2=A0=C2=A0=C2=A0 1.474465] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 006=
8 EFLAGS: 00010246
> [=C2=A0=C2=A0=C2=A0 1.475112] CR0: 80050033 CR2: ffffffff CR3: 02242000 C=
R4: 001406b0
> [=C2=A0=C2=A0=C2=A0 1.475712] DR0: 00000000 DR1: 00000000 DR2: 00000000 D=
R3: 00000000
> [=C2=A0=C2=A0=C2=A0 1.476299] DR6: fffe0ff0 DR7: 00000400
> [=C2=A0=C2=A0=C2=A0 1.476661] Kernel panic - not syncing: Fatal exception

In both the cases, could not reproduce the problem after following the
above test procedure. Am I missing something here ?

[    0.983425] TSC deadline timer enabled
[    0.984054] smpboot: CPU0: Intel Core Processor (Haswell) (family: 0x6, =
model: 0x3c, stepping: 0x1)
[    0.984054] Performance Events: unsupported p6 CPU model 60 no PMU drive=
r, software events only.
[    0.984122] rcu: Hierarchical SRCU implementation.
[    0.986937] smp: Bringing up secondary CPUs ...
[    0.988760] x86: Booting SMP configuration:
[    0.989499] .... node  #0, CPUs:      #1
[    0.403123] kvm-clock: cpu 1, msr 2c35041, secondary cpu clock
[    0.403123] masked ExtINT on CPU#1
[    0.403123] smpboot: CPU 1 Converting physical 0 to logical die 1
[    0.997431] KVM setup async PF for cpu 1
[    0.998057] kvm-stealtime: cpu 1, msr 23ed19f00
[    0.998763] smp: Brought up 1 node, 2 CPUs
[    0.998763] smpboot: Max logical packages: 2
[    0.998763] smpboot: Total of 2 processors activated (8782.17 BogoMIPS)
[    1.000952] debug_vm_pgtable: debug_vm_pgtable: Validating architecture =
page table helpers --> [Test Ran]
[    1.002305] devtmpfs: initialized
[    1.002305] version magic: 0x3530342a
[    1.005978] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 6370867519511994 ns
[    1.007404] futex hash table entries: 512 (order: 4, 65536 bytes, linear)
[    1.008515] pinctrl core: initialized pinctrl subsystem

The previously reported error log here

[    1.390624] smp: Brought up 1 node, 2 CPUs
[    1.390624] smpboot: Max logical packages: 2
[    1.390624] smpboot: Total of 2 processors activated (8783.48 BogoMIPS)
[    1.391537] debug_vm_pgtable: debug_vm_pgtable: Validating architecture =
page table helpers
[    1.392382] page:f29b85c0 refcount:0 mapcount:0 mapping:00000000 index:0=
x0
[    1.393415] raw: 02800000 f29b8624 f29b8584 00000000 00000000 edc22280 f=
fffffff 00000000
[    1.394178] page dumped because: VM_BUG_ON_PAGE(page->pmd_huge_pte)
[    1.394820] ------------[ cut here ]------------
[    1.395296] kernel BUG at include/linux/mm.h:2007!
[    1.395942] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
[    1.396463] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc3-00001-g8=
7c4696d57b5e #1
[    1.396722] EIP: pgtable_pmd_page_dtor+0x1a/0x23
[    1.396722] Code: d4 8a 27 c2 e8 16 81 04 00 b2 01 5b 88 d0 5d c3 55 89 =
e5 52 89 45 fc 8b
45 fc 83 78 08 00 74 0c ba e1 e2 e0 c1 e8 14 99 13 00 <0f> 0b e8 92 eb 13 0=
0 c9 c3 55 89 e5
52 89 45 fc 8b 45 fc 90 8d 74
[    1.396722] EAX: c1e0e2e1 EBX: 2dc2e000 ECX: 00000000 EDX: c1e0e2e1
[    1.396722] ESI: edc2b000 EDI: edc4e010 EBP: ee287f14 ESP: ee287f10
[    1.396722] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010246
[    1.396722] CR0: 80050033 CR2: ffffffff CR3: 0226a000 CR4: 001406b0
[    1.396722] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    1.396722] DR6: fffe0ff0 DR7: 00000400
[    1.396722] Call Trace:
[    1.396722]  mop_up_one_pmd+0x48/0x62
[    1.396722]  pgd_free+0x35/0xe0
[    1.396722]  __mmdrop+0x42/0x96
[    1.396722]  debug_vm_pgtable+0x460/0x47c
[    1.396722]  kernel_init_freeable+0x84/0x172
[    1.396722]  ? rest_init+0xe9/0xe9
[    1.396722]  kernel_init+0xd/0xe9
[    1.396722]  ret_from_fork+0x1e/0x28
[    1.396722] Modules linked in:
[    1.396742] ---[ end trace 9c6f11143a94c590 ]---
[    1.397197] EIP: pgtable_pmd_page_dtor+0x1a/0x23

might be getting generated from this path

kernel BUG at include/linux/mm.h:2007!

debug_vm_pgtable()
__mmdrop()
 pgd_free()
  pgd_mop_up_pmds()
   mop_up_one_pmd()
    pmd_free()
     pgtable_pmd_page_dtor()

static inline void pgtable_pmd_page_dtor(struct page *page)
{
#ifdef CONFIG_TRANSPARENT_HUGEPAGE
        VM_BUG_ON_PAGE(page->pmd_huge_pte, page); ---------> BUG
#endif
        ptlock_free(page);
}

In here, a minimal page table is being created with helpers to
perform various tests before being freed up.

	...............................................
        mm =3D mm_alloc();
        if (!mm) {
                pr_err("mm_struct allocation failed\n");
                return;
        }
	...............................................
	pgdp =3D pgd_offset(mm, vaddr);
        p4dp =3D p4d_alloc(mm, pgdp, vaddr);
        pudp =3D pud_alloc(mm, p4dp, vaddr);
        pmdp =3D pmd_alloc(mm, pudp, vaddr);
        ptep =3D pte_alloc_map(mm, pmdp, vaddr);
	...............................................
	saved_p4dp =3D p4d_offset(pgdp, 0UL);
        saved_pudp =3D pud_offset(p4dp, 0UL);
        saved_pmdp =3D pmd_offset(pudp, 0UL);
        saved_ptep =3D pmd_pgtable(pmd);
	...............................................
        p4d_free(mm, saved_p4dp);
        pud_free(mm, saved_pudp);
        pmd_free(mm, saved_pmdp);
        pte_free(mm, saved_ptep);
        mm_dec_nr_puds(mm);
        mm_dec_nr_pmds(mm);
        mm_dec_nr_ptes(mm);
        __mmdrop(mm);
	..............................................

Is the above page table allocation-free sequence problematic for any
particular x86 configuration ? Though I have not seen these sequence
fail either on arm64 or x86. But the config option coverage during
my experiments were limited. Any suggestions or pointers welcome.

- Anshuman

> =

> Best Regards,
> Rong Chen
>=20
--===============1151991308378717673==--

