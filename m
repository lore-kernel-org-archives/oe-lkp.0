Content-Type: multipart/mixed; boundary="===============8485808199170120311=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [do_execve] attempted to set unsupported pgprot
Date: Wed, 18 Apr 2018 13:33:55 -0700
Message-ID: <361242c4-261c-1ddb-b948-c71f672779a8@linux.intel.com>
In-Reply-To: <20180418125916.a8be1fac1ac017f41a10f0fb@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8485808199170120311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/18/2018 12:59 PM, Andrew Morton wrote:
>> [   12.348499] ------------[ cut here ]------------
>> [   12.349193] attempted to set unsupported pgprot: 8000000000000025 bit=
s: 8000000000000000 supported: 7fffffffffffffff
>> [   12.350792] WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/pgtable.h:=
540 handle_mm_fault+0xfc1/0xfe0:
>> 						check_pgprot at arch/x86/include/asm/pgtable.h:535
>> 						 (inlined by) pfn_pte at arch/x86/include/asm/pgtable.h:549
>> 						 (inlined by) do_anonymous_page at mm/memory.c:3169
>> 						 (inlined by) handle_pte_fault at mm/memory.c:3961
>> 						 (inlined by) __handle_mm_fault at mm/memory.c:4087
>> 						 (inlined by) handle_mm_fault at mm/memory.c:4124
>> [   12.352294] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.17.0-rc1 #172
>> [   12.353357] EIP: handle_mm_fault+0xfc1/0xfe0:
>> 						check_pgprot at arch/x86/include/asm/pgtable.h:535
>> 						 (inlined by) pfn_pte at arch/x86/include/asm/pgtable.h:549
>> 						 (inlined by) do_anonymous_page at mm/memory.c:3169
>> 						 (inlined by) handle_pte_fault at mm/memory.c:3961
>> 						 (inlined by) __handle_mm_fault at mm/memory.c:4087
>> 						 (inlined by) handle_mm_fault at mm/memory.c:4124
> Dave, fb43d6cb91ef57 ("x86/mm: Do not auto-massage page protections")
> looks like a culprit?


This looks like NX somehow getting set on a system where it is
unsupported.  Any idea what kind of VMA it is?  We probably should have
kept NX from getting set in vm_page_prot to begin with.
>         entry =3D mk_pte(page, vma->vm_page_prot);
>         if (vma->vm_flags & VM_WRITE)
>                 entry =3D pte_mkwrite(pte_mkdirty(entry));
>=20

--===============8485808199170120311==--

