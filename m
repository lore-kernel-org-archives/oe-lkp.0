Content-Type: multipart/mixed; boundary="===============0196279225659472463=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: 87c4696d57 ("mm/debug: Add tests validating architecture page .."): [ 1.395296] kernel BUG at include/linux/mm.h:2007!
Date: Tue, 07 Jan 2020 11:27:50 +0530
Message-ID: <a5644902-0941-3971-8043-43513a9af7b5@arm.com>
In-Reply-To: <20191226084925.GX2760@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0196279225659472463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/26/2019 02:19 PM, kernel test robot wrote:
> 46cf053efe  Linux 5.5-rc3
> 87c4696d57  mm/debug: Add tests validating architecture page table helpers
> +------------------------------------------+----------+------------+
> |                                          | v5.5-rc3 | 87c4696d57 |
> +------------------------------------------+----------+------------+
> | boot_successes                           | 32       | 0          |
> | boot_failures                            | 0        | 11         |
> | kernel_BUG_at_include/linux/mm.h         | 0        | 11         |
> | invalid_opcode:#[##]                     | 0        | 11         |
> | EIP:pgtable_pmd_page_dtor                | 0        | 11         |
> | Kernel_panic-not_syncing:Fatal_exception | 0        | 11         |
> +------------------------------------------+----------+------------+
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> [    1.390624] smp: Brought up 1 node, 2 CPUs
> [    1.390624] smpboot: Max logical packages: 2
> [    1.390624] smpboot: Total of 2 processors activated (8783.48 BogoMIPS)
> [    1.391537] debug_vm_pgtable: debug_vm_pgtable: Validating architectur=
e page table helpers
> [    1.392382] page:f29b85c0 refcount:0 mapcount:0 mapping:00000000 index=
:0x0
> [    1.393415] raw: 02800000 f29b8624 f29b8584 00000000 00000000 edc22280=
 ffffffff 00000000
> [    1.394178] page dumped because: VM_BUG_ON_PAGE(page->pmd_huge_pte)
> [    1.394820] ------------[ cut here ]------------
> [    1.395296] kernel BUG at include/linux/mm.h:2007!
> [    1.395942] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
> [    1.396463] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc3-00001-=
g87c4696d57b5e #1
> [    1.396722] EIP: pgtable_pmd_page_dtor+0x1a/0x23
> [    1.396722] Code: d4 8a 27 c2 e8 16 81 04 00 b2 01 5b 88 d0 5d c3 55 8=
9 e5 52 89 45 fc 8b 45 fc 83 78 08 00 74 0c ba e1 e2 e0 c1 e8 14 99 13 00 <=
0f> 0b e8 92 eb 13 00 c9 c3 55 89 e5 52 89 45 fc 8b 45 fc 90 8d 74
> [    1.396722] EAX: c1e0e2e1 EBX: 2dc2e000 ECX: 00000000 EDX: c1e0e2e1
> [    1.396722] ESI: edc2b000 EDI: edc4e010 EBP: ee287f14 ESP: ee287f10
> [    1.396722] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010=
246
> [    1.396722] CR0: 80050033 CR2: ffffffff CR3: 0226a000 CR4: 001406b0
> [    1.396722] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    1.396722] DR6: fffe0ff0 DR7: 00000400
> [    1.396722] Call Trace:
> [    1.396722]  mop_up_one_pmd+0x48/0x62
> [    1.396722]  pgd_free+0x35/0xe0
> [    1.396722]  __mmdrop+0x42/0x96
> [    1.396722]  debug_vm_pgtable+0x460/0x47c
> [    1.396722]  kernel_init_freeable+0x84/0x172
> [    1.396722]  ? rest_init+0xe9/0xe9
> [    1.396722]  kernel_init+0xd/0xe9
> [    1.396722]  ret_from_fork+0x1e/0x28
> [    1.396722] Modules linked in:
> [    1.396742] ---[ end trace 9c6f11143a94c590 ]---
> [    1.397197] EIP: pgtable_pmd_page_dtor+0x1a/0x23

Hello,

Wondering if some one could help me with steps to reproduce this crash ?
Could not reproduce the problem with the patch applied on Linux 5.5-rc3
when built with the config file provided here on a standard KVM guest.

- Anshuman
--===============0196279225659472463==--

