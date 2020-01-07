Content-Type: multipart/mixed; boundary="===============3607917158092995663=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 87c4696d57 ("mm/debug: Add tests validating architecture page .."): [ 1.395296] kernel BUG at include/linux/mm.h:2007!
Date: Tue, 07 Jan 2020 14:30:18 +0800
Message-ID: <c810b7b5-55b8-e0a6-acdb-2afa11429a41@intel.com>
In-Reply-To: <a5644902-0941-3971-8043-43513a9af7b5@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3607917158092995663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/7/20 1:57 PM, Anshuman Khandual wrote:
> On 12/26/2019 02:19 PM, kernel test robot wrote:
>> 46cf053efe  Linux 5.5-rc3
>> 87c4696d57  mm/debug: Add tests validating architecture page table helpe=
rs
>> +------------------------------------------+----------+------------+
>> |                                          | v5.5-rc3 | 87c4696d57 |
>> +------------------------------------------+----------+------------+
>> | boot_successes                           | 32       | 0          |
>> | boot_failures                            | 0        | 11         |
>> | kernel_BUG_at_include/linux/mm.h         | 0        | 11         |
>> | invalid_opcode:#[##]                     | 0        | 11         |
>> | EIP:pgtable_pmd_page_dtor                | 0        | 11         |
>> | Kernel_panic-not_syncing:Fatal_exception | 0        | 11         |
>> +------------------------------------------+----------+------------+
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> [    1.390624] smp: Brought up 1 node, 2 CPUs
>> [    1.390624] smpboot: Max logical packages: 2
>> [    1.390624] smpboot: Total of 2 processors activated (8783.48 BogoMIP=
S)
>> [    1.391537] debug_vm_pgtable: debug_vm_pgtable: Validating architectu=
re page table helpers
>> [    1.392382] page:f29b85c0 refcount:0 mapcount:0 mapping:00000000 inde=
x:0x0
>> [    1.393415] raw: 02800000 f29b8624 f29b8584 00000000 00000000 edc2228=
0 ffffffff 00000000
>> [    1.394178] page dumped because: VM_BUG_ON_PAGE(page->pmd_huge_pte)
>> [    1.394820] ------------[ cut here ]------------
>> [    1.395296] kernel BUG at include/linux/mm.h:2007!
>> [    1.395942] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
>> [    1.396463] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc3-00001=
-g87c4696d57b5e #1
>> [    1.396722] EIP: pgtable_pmd_page_dtor+0x1a/0x23
>> [    1.396722] Code: d4 8a 27 c2 e8 16 81 04 00 b2 01 5b 88 d0 5d c3 55 =
89 e5 52 89 45 fc 8b 45 fc 83 78 08 00 74 0c ba e1 e2 e0 c1 e8 14 99 13 00 =
<0f> 0b e8 92 eb 13 00 c9 c3 55 89 e5 52 89 45 fc 8b 45 fc 90 8d 74
>> [    1.396722] EAX: c1e0e2e1 EBX: 2dc2e000 ECX: 00000000 EDX: c1e0e2e1
>> [    1.396722] ESI: edc2b000 EDI: edc4e010 EBP: ee287f14 ESP: ee287f10
>> [    1.396722] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 0001=
0246
>> [    1.396722] CR0: 80050033 CR2: ffffffff CR3: 0226a000 CR4: 001406b0
>> [    1.396722] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
>> [    1.396722] DR6: fffe0ff0 DR7: 00000400
>> [    1.396722] Call Trace:
>> [    1.396722]  mop_up_one_pmd+0x48/0x62
>> [    1.396722]  pgd_free+0x35/0xe0
>> [    1.396722]  __mmdrop+0x42/0x96
>> [    1.396722]  debug_vm_pgtable+0x460/0x47c
>> [    1.396722]  kernel_init_freeable+0x84/0x172
>> [    1.396722]  ? rest_init+0xe9/0xe9
>> [    1.396722]  kernel_init+0xd/0xe9
>> [    1.396722]  ret_from_fork+0x1e/0x28
>> [    1.396722] Modules linked in:
>> [    1.396742] ---[ end trace 9c6f11143a94c590 ]---
>> [    1.397197] EIP: pgtable_pmd_page_dtor+0x1a/0x23
> Hello,
>
> Wondering if some one could help me with steps to reproduce this crash ?
> Could not reproduce the problem with the patch applied on Linux 5.5-rc3
> when built with the config file provided here on a standard KVM guest.
>
> - Anshuman

Hi Anshuman,

You can compile the kernel with config-5.5.0-rc3-00001-g87c4696d57b5e, =

and run the reproduce script.
Both files are in the original report mail.

# =

./reproduce-yocto-vm-yocto-f91855057302-20191226051639-i386-randconfig-a001=
-20191225-5.5.0-rc3-00001-g87c4696d57b5e-1 =

~/linux/arch/x86/boot/bzImage 2>&1 | tail -20
[=C2=A0=C2=A0=C2=A0 1.471128] Call Trace:
[=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 mop_up_one_pmd+0x48/0x62
[=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 pgd_free+0x33/0xcc
[=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 __mmdrop+0x42/0x96
[=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 debug_vm_pgtable+0x45d/0x465
[=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 kernel_init_freeable+0x83/0x16b
[=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 ? rest_init+0xe0/0xe0
[=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 kernel_init+0xd/0xe9
[=C2=A0=C2=A0=C2=A0 1.471128]=C2=A0 ret_from_fork+0x1e/0x28
[=C2=A0=C2=A0=C2=A0 1.471128] Modules linked in:
[=C2=A0=C2=A0=C2=A0 1.471134] ---[ end trace b241750e0a95311e ]---
[=C2=A0=C2=A0=C2=A0 1.471570] EIP: pgtable_pmd_page_dtor+0x1a/0x23
[=C2=A0=C2=A0=C2=A0 1.472006] Code: ba 9b 0b df c1 e8 eb 71 04 00 5b 89 f0 =
5e 5d c3 55 =

89 e5 52 89 45 fc 8b 45 fc 83 78 08 00 74 0c ba b6 0b df c1 e8 d6 51 13 =

00 <0f> 0b e8 c6 a3 13 00 c9 c3 55 89 e5 52 89 45 fc 8b 45 fc 90 8d 74
[=C2=A0=C2=A0=C2=A0 1.473746] EAX: c1df0bb6 EBX: 2e42d000 ECX: 00000000 EDX=
: c1df0bb6
[=C2=A0=C2=A0=C2=A0 1.474340] ESI: ee42b000 EDI: ee44e008 EBP: eea87f20 ESP=
: eea87f1c
[=C2=A0=C2=A0=C2=A0 1.474465] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 =
EFLAGS: 00010246
[=C2=A0=C2=A0=C2=A0 1.475112] CR0: 80050033 CR2: ffffffff CR3: 02242000 CR4=
: 001406b0
[=C2=A0=C2=A0=C2=A0 1.475712] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3=
: 00000000
[=C2=A0=C2=A0=C2=A0 1.476299] DR6: fffe0ff0 DR7: 00000400
[=C2=A0=C2=A0=C2=A0 1.476661] Kernel panic - not syncing: Fatal exception

Best Regards,
Rong Chen
--===============3607917158092995663==--

