Content-Type: multipart/mixed; boundary="===============4358296995477292355=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] fa6726c1e7: kernel_BUG_at_include/linux/mm.h
Date: Tue, 28 Apr 2020 07:18:46 +0530
Message-ID: <51dcbcbf-6020-6672-05b0-5bb10c6292b5@arm.com>
In-Reply-To: <20200427140706.GC5770@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4358296995477292355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/27/2020 07:37 PM, kernel test robot wrote:
> =

> [   10.263354] kernel BUG at include/linux/mm.h:699!
> [   10.264320] invalid opcode: 0000 [#1] SMP
> [   10.264872] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc2-00230-=
gfa6726c1e7f01 #2
> [   10.265928] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [   10.267074] EIP: __free_pages+0x4f/0x62
> [   10.267615] Code: 85 ff 74 0e 89 fa 89 f0 e8 83 ed ff ff 5b 5e 5f 5d c=
3 89 f0 e8 57 ff ff ff 5b 5e 5f 5d c3 ba fc 86 fc c1 89 f0 e8 ff 2e fe ff <=
0f> 0b 0f b6 cb ba ff ff ff ff 89 f0 e8 07 8f 01 00 eb bf 55 89 e5
> [   10.270098] EAX: 0000003e EBX: ee800000 ECX: 00000000 EDX: c0068000
> [   10.270925] ESI: eece0640 EDI: c016d020 EBP: c0071f10 ESP: c0071f04
> [   10.271786] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010=
286
> [   10.272724] CR0: 80050033 CR2: b7d6467d CR3: 023d0000 CR4: 000006b0
> [   10.273572] Call Trace:
> [   10.273912]  free_pages+0x3d/0x43
> [   10.274367]  pgd_free+0xea/0x11b
> [   10.274807]  __mmdrop+0x3c/0xc7
> [   10.275237]  ? __free_pages+0x3e/0x62
> [   10.275761]  debug_vm_pgtable+0x411/0x419
> [   10.276305]  ? rest_init+0x23c/0x23c
> [   10.276767]  kernel_init+0x15/0xf4
> [   10.277208]  ? schedule_tail_wrapper+0x9/0xc
> [   10.277756]  ret_from_fork+0x2e/0x38
> [   10.278217] Modules linked in: stm_p_basic
> [   10.278776] ---[ end trace b838f89424113a3a ]---
This is an unsupported (enabled via CONFIG_EXPERT) X86 platform (CONFIG_X86=
_PAE)
and is known to fail. The latest (V17) patch had moved the test invocation =
into
a late_initcall() per Linus thus pushing down any possible failures (like t=
his)
after early boot. Please ignore this report.

Apart from this X86_PAE based config, no other platform failures have repor=
ted
so far. Assuming that this test robot does have a good platform coverage, t=
he
CONFIG_EXPERT method of enabling CONFIG_DEBUG_VM_PGTABLE should help in get=
ting
more platform coverage for this test.

- Anshuman
--===============4358296995477292355==--

