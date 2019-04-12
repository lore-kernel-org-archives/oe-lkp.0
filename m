Content-Type: multipart/mixed; boundary="===============0604916288954532133=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: 1808d65b55 ("asm-generic/tlb: Remove arch_tlb*_mmu()"): BUG: KASAN: stack-out-of-bounds in __change_page_attr_set_clr
Date: Fri, 12 Apr 2019 15:11:22 +0000
Message-ID: <F18AF0D5-D8B4-4F4B-8469-F9DEC49683C7@vmware.com>
In-Reply-To: <20190412111756.GO14281@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0604916288954532133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On Apr 12, 2019, at 4:17 AM, Peter Zijlstra <peterz@infradead.org> wrot=
e:
> =

> On Fri, Apr 12, 2019 at 12:56:33PM +0200, Peter Zijlstra wrote:
>> On Thu, Apr 11, 2019 at 11:13:48PM +0200, Peter Zijlstra wrote:
>>> On Thu, Apr 11, 2019 at 09:54:24PM +0200, Peter Zijlstra wrote:
>>>> On Thu, Apr 11, 2019 at 09:39:06PM +0200, Peter Zijlstra wrote:
>>>>> I think this bisect is bad. If you look at your own logs this patch
>>>>> merely changes the failure, but doesn't make it go away.
>>>>> =

>>>>> Before this patch (in fact, before tip/core/mm entirely) the errror
>>>>> reads like the below, which suggests there is memory corruption
>>>>> somewhere, and the fingered patch just makes it trigger differently.
>>>>> =

>>>>> It would be very good to find the source of this corruption, but I'm
>>>>> fairly certain it is not here.
>>>> =

>>>> I went back to v4.20 to try and find a time when the below error did n=
ot
>>>> occur, but even that reliably triggers the warning.
>>> =

>>> So I also tested v4.19 and found that that was good, which made me
>>> bisect v4.19..v4.20
>>> =

>>> # bad: [8fe28cb58bcb235034b64cbbb7550a8a43fd88be] Linux 4.20
>>> # good: [84df9525b0c27f3ebc2ebb1864fa62a97fdedb7d] Linux 4.19
>>> git bisect start 'v4.20' 'v4.19'
>>> # bad: [ec9c166434595382be3babf266febf876327774d] Merge tag 'mips_fixes=
_4.20_1' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
>>> git bisect bad ec9c166434595382be3babf266febf876327774d
>>> # bad: [50b825d7e87f4cff7070df6eb26390152bb29537] Merge git://git.kerne=
l.org/pub/scm/linux/kernel/git/davem/net-next
>>> git bisect bad 50b825d7e87f4cff7070df6eb26390152bb29537
>>> # good: [99e9acd85ccbdc8f5785f9e961d4956e96bd6aa5] Merge tag 'mlx5-upda=
tes-2018-10-17' of git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux
>>> git bisect good 99e9acd85ccbdc8f5785f9e961d4956e96bd6aa5
>>> # good: [c403993a41d50db1e7d9bc2d43c3c8498162312f] Merge tag 'for-linus=
-4.20' of https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgithub.com%2Fcminyard%2Flinux-ipmi&amp;data=3D02%7C01%7Cnamit%40vmware.c=
om%7Ca1c3ea5d4bc34cfc785508d6bf388ff3%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C=
0%7C0%7C636906647013777573&amp;sdata=3D3VSR3VdE5rxOitAdkqFNPpAnAtLgDmYLzJto=
Urs5v9Y%3D&amp;reserved=3D0
>>> git bisect good c403993a41d50db1e7d9bc2d43c3c8498162312f
>>> # good: [c05f3642f4304dd081876e77a68555b6aba4483f] Merge branch 'perf-c=
ore-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>> git bisect good c05f3642f4304dd081876e77a68555b6aba4483f
>>> # bad: [44786880df196a4200c178945c4d41675faf9fb7] Merge branch 'parisc-=
4.20-1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
>>> git bisect bad 44786880df196a4200c178945c4d41675faf9fb7
>>> # bad: [99792e0cea1ed733cdc8d0758677981e0cbebfed] Merge branch 'x86-mm-=
for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>> git bisect bad 99792e0cea1ed733cdc8d0758677981e0cbebfed
>>> # good: [fec98069fb72fb656304a3e52265e0c2fc9adf87] Merge branch 'x86-cp=
u-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>> git bisect good fec98069fb72fb656304a3e52265e0c2fc9adf87
>>> # bad: [a31acd3ee8f7dbc0370bdf4a4bfef7a8c13c7542] x86/mm: Page size awa=
re flush_tlb_mm_range()
>>> git bisect bad a31acd3ee8f7dbc0370bdf4a4bfef7a8c13c7542
>>> # good: [a7295fd53c39ce781a9792c9dd2c8747bf274160] x86/mm/cpa: Use flus=
h_tlb_kernel_range()
>>> git bisect good a7295fd53c39ce781a9792c9dd2c8747bf274160
>>> # good: [9cf38d5559e813cccdba8b44c82cc46ba48d0896] kexec: Allocate decr=
ypted control pages for kdump if SME is enabled
>>> git bisect good 9cf38d5559e813cccdba8b44c82cc46ba48d0896
>>> # good: [5b12904065798fee8b153a506ac7b72d5ebbe26c] x86/mm/doc: Clean up=
 the x86-64 virtual memory layout descriptions
>>> git bisect good 5b12904065798fee8b153a506ac7b72d5ebbe26c
>>> # good: [cf089611f4c446285046fcd426d90c18f37d2905] proc/vmcore: Fix i38=
6 build error of missing copy_oldmem_page_encrypted()
>>> git bisect good cf089611f4c446285046fcd426d90c18f37d2905
>>> # good: [a5b966ae42a70b194b03eaa5eaea70d8b3790c40] Merge branch 'tlb/as=
m-generic' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux int=
o x86/mm
>>> git bisect good a5b966ae42a70b194b03eaa5eaea70d8b3790c40
>>> # first bad commit: [a31acd3ee8f7dbc0370bdf4a4bfef7a8c13c7542] x86/mm: =
Page size aware flush_tlb_mm_range()
>>> =

>>> And 'funnily' the bad patch is one of mine too :/
>>> =

>>> I'll go have a look at that tomorrow, because currrently I'm way past
>>> tired.
>> =

>> OK, so the below patchlet makes it all good. It turns out that the
>> provided config has:
>> =

>> CONFIG_X86_L1_CACHE_SHIFT=3D7
>> =

>> which then, for some obscure raisin, results in flush_tlb_mm_range()
>> compiling to use 320 bytes of stack:
>> =

>>  sub    $0x140,%rsp
>> =

>> Where a 'defconfig' build results in:
>> =

>>  sub    $0x58,%rsp
>> =

>> The thing that pushes it over the edge in the above fingered patch is
>> the addition of a field to struct flush_tlb_info, which grows if from 32
>> to 36 bytes.
>> =

>> So my proposal is to basically revert that, unless we can come up with
>> something that GCC can't screw up.
> =

> To clarify, 'that' is Nadav's patch:
> =

>  515ab7c41306 ("x86/mm: Align TLB invalidation info")
> =

> which turns out to be the real problem.

Sorry for that. I still think it should be aligned, especially with all the
effort the Intel puts around to avoid bus-locking on unaligned atomic
operations.

So the right solution seems to me as putting this data structure off stack.
It would prevent flush_tlb_mm_range() from being reentrant, so we can keep a
few entries for this matter and atomically increase the entry number every
time we enter flush_tlb_mm_range().

But my question is - should flush_tlb_mm_range() be reentrant, or can we
assume no TLB shootdowns are initiated in interrupt handlers and #MC
handlers?


--===============0604916288954532133==--

