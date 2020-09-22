Content-Type: multipart/mixed; boundary="===============7930165669267883640=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug_vm_pgtable/locks] e2aad6f1d2: BUG:unable_to_handle_page_fault_for_address
Date: Tue, 22 Sep 2020 14:22:32 +0530
Message-ID: <84ce4dc1-9763-c7df-b7b2-55000e53b502@arm.com>
In-Reply-To: <289c3fdb-1394-c1af-bdc4-5542907089dc@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7930165669267883640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/22/2020 09:33 AM, Aneesh Kumar K.V wrote:
> On 9/21/20 2:51 PM, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: e2aad6f1d232b457ea6a3194992dd4c0a83534a5 ("mm/debug_vm_pgtable/l=
ocks: take correct page table lock")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>>
>> in testcase: trinity
>> version: trinity-i386
>> with following parameters:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0runtime: 300s
>>
>> test-description: Trinity is a linux system call fuzz tester.
>> test-url: http://codemonkey.org.uk/projects/trinity/
>>
>>
>> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m=
 8G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> +----------------------------------------------------------------------+=
------------+------------+
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | c50eb1ed65 | e2aad6f1d2 |
>> +----------------------------------------------------------------------+=
------------+------------+
>> | boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
>> | boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 61=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |
>> | BUG:workqueue_lockup-pool=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | BUG:sleeping_function_called_from_invalid_context_at_mm/page_alloc.c |=
 60=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | BUG:unable_to_handle_page_fault_for_address=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
>> | Oops:#[##]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | EIP:ptep_get=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>> | Kernel_panic-not_syncing:Fatal_exception=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> +----------------------------------------------------------------------+=
------------+------------+
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>
>>
>> [=C2=A0=C2=A0 28.726464] BUG: sleeping function called from invalid cont=
ext at mm/page_alloc.c:4822
>> [=C2=A0=C2=A0 28.727835] in_atomic(): 1, irqs_disabled(): 0, non_block: =
0, pid: 1, name: swapper
>> [=C2=A0=C2=A0 28.729221] no locks held by swapper/1.
>> [=C2=A0=C2=A0 28.729954] CPU: 0 PID: 1 Comm: swapper Not tainted 5.9.0-r=
c3-00324-ge2aad6f1d232b4 #1
>> [=C2=A0=C2=A0 28.731484] Hardware name: QEMU Standard PC (i440FX + PIIX,=
 1996), BIOS 1.12.0-1 04/01/2014
>> [=C2=A0=C2=A0 28.732891] Call Trace:
>> [=C2=A0=C2=A0 28.733295]=C2=A0 ? show_stack+0x48/0x50
>> [=C2=A0=C2=A0 28.733943]=C2=A0 dump_stack+0x1b/0x1d
>> [=C2=A0=C2=A0 28.734569]=C2=A0 ___might_sleep+0x205/0x219
>> [=C2=A0=C2=A0 28.735292]=C2=A0 __might_sleep+0x106/0x10f
>> [=C2=A0=C2=A0 28.736022]=C2=A0 __alloc_pages_nodemask+0xe0/0x2c8
>> [=C2=A0=C2=A0 28.736845]=C2=A0 swap_migration_tests+0x62/0x295
>> [=C2=A0=C2=A0 28.737639]=C2=A0 debug_vm_pgtable+0x587/0x9b5
>> [=C2=A0=C2=A0 28.738374]=C2=A0 ? pte_advanced_tests+0x267/0x267
>> [=C2=A0=C2=A0 28.739318]=C2=A0 do_one_initcall+0x129/0x31c
>> [=C2=A0=C2=A0 28.740023]=C2=A0 ? rcu_read_lock_sched_held+0x46/0x74
>> [=C2=A0=C2=A0 28.740944]=C2=A0 kernel_init_freeable+0x201/0x250
>> [=C2=A0=C2=A0 28.741763]=C2=A0 ? rest_init+0xf8/0xf8
>> [=C2=A0=C2=A0 28.742401]=C2=A0 kernel_init+0xe/0x15d
>> [=C2=A0=C2=A0 28.743040]=C2=A0 ? rest_init+0xf8/0xf8
>> [=C2=A0=C2=A0 28.743694]=C2=A0 ret_from_fork+0x1c/0x30
> =

> =

> This should be fixed by
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/mm/debug_vm_pgtable.c?id=3D3a4f9a45eadb6ed5fc04686e8db4dc7bb1caec44
> =

>> [=C2=A0=C2=A0 28.744364] BUG: unable to handle page fault for address: f=
ffbbea4
>> [=C2=A0=C2=A0 28.745465] #PF: supervisor read access in kernel mode
>> [=C2=A0=C2=A0 28.746373] #PF: error_code(0x0000) - not-present page
>> [=C2=A0=C2=A0 28.747275] *pde =3D 0492b067 *pte =3D 00000000
>> [=C2=A0=C2=A0 28.748054] Oops: 0000 [#1]
>> [=C2=A0=C2=A0 28.748548] CPU: 0 PID: 1 Comm: swapper Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 5.9.0-rc3-00324-ge2aad6f1d232b4 #1
>> [=C2=A0=C2=A0 28.750188] Hardware name: QEMU Standard PC (i440FX + PIIX,=
 1996), BIOS 1.12.0-1 04/01/2014
>> [=C2=A0=C2=A0 28.751641] EIP: ptep_get+0x0/0x3
>> [=C2=A0=C2=A0 28.752226] Code: 5d fc c9 c3 55 c1 e8 1a 89 e5 53 31 db 83=
 f8 1f 6a 00 0f 94 c3 b8 80 67 02 c4 31 c9 89 da e8 16 5c f1 ff 89 d8 8b 5d=
 fc c9 c3 <8b> 00 c3 55 31 c9 89 e5 57 56 53 8b 70 04 89 c3 b8 10 68 02 c4 =
6a
>> [=C2=A0=C2=A0 28.755465] EAX: fffbbea4 EBX: fffbbea4 ECX: 000047bd EDX: =
fffbbea4
>> [=C2=A0=C2=A0 28.756418] ESI: 000047bd EDI: 00000025 EBP: f406bed8 ESP: =
f406bebc
>> [=C2=A0=C2=A0 28.757522] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EF=
LAGS: 00010286
>> [=C2=A0=C2=A0 28.758739] CR0: 80050033 CR2: fffbbea4 CR3: 04928000 CR4: =
000406d0
>> [=C2=A0=C2=A0 28.759828] Call Trace:
>> [=C2=A0=C2=A0 28.760235]=C2=A0 ? hugetlb_advanced_tests+0x2a/0x27f
>> [=C2=A0=C2=A0 28.761099]=C2=A0 ? do_raw_spin_unlock+0xd7/0x112
>> [=C2=A0=C2=A0 28.761872]=C2=A0 debug_vm_pgtable+0x927/0x9b5
>> [=C2=A0=C2=A0 28.762578]=C2=A0 ? pte_advanced_tests+0x267/0x267
>> [=C2=A0=C2=A0 28.763462]=C2=A0 do_one_initcall+0x129/0x31c
>> [=C2=A0=C2=A0 28.764134]=C2=A0 ? rcu_read_lock_sched_held+0x46/0x74
>> [=C2=A0=C2=A0 28.764948]=C2=A0 kernel_init_freeable+0x201/0x250
>> [=C2=A0=C2=A0 28.765654]=C2=A0 ? rest_init+0xf8/0xf8
>> [=C2=A0=C2=A0 28.766277]=C2=A0 kernel_init+0xe/0x15d
>> [=C2=A0=C2=A0 28.766878]=C2=A0 ? rest_init+0xf8/0xf8
>> [=C2=A0=C2=A0 28.767488]=C2=A0 ret_from_fork+0x1c/0x30
>> [=C2=A0=C2=A0 28.768052] Modules linked in:
>> [=C2=A0=C2=A0 28.768532] CR2: 00000000fffbbea4
>> [=C2=A0=C2=A0 28.769065] ---[ end trace 9c4395cf49c7b3e7 ]---
>>
> =

> IIUC, Anshuman is reworking the test to follow the page table update rule=
s.

The failure here has been attributed to this particular patch, and
IIRC we did not see this particular failure before this series.
--===============7930165669267883640==--

