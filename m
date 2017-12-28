Content-Type: multipart/mixed; boundary="===============5501001876050785727=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/cpu_entry_area] 10043e02db: kernel_BUG_at_arch/x86/mm/physaddr.c
Date: Thu, 28 Dec 2017 19:18:33 +0300
Message-ID: <ba1bc259-9db7-64d8-f136-c889d2c967e0@virtuozzo.com>
In-Reply-To: <CACT4Y+Ymqjm9L0L75JGrgSrZYOV_wQ2U06E5Je5bsqJ7FFEq8Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5501001876050785727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/28/2017 02:54 PM, Dmitry Vyukov wrote:
> On Thu, Dec 28, 2017 at 12:51 PM, Thomas Gleixner <tglx@linutronix.de> =
wrote:
>> On Wed, 27 Dec 2017, Dmitry Vyukov wrote:
>>> On Wed, Dec 27, 2017 at 7:05 PM, Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>>>> So this dies simply because kasan_populate_shadow() runs out of memory=
 and
>>>> has no sanity check whatsoever.
>>>>
>>>> static __init void *early_alloc(size_t size, int nid)
>>>> {
>>>>         return memblock_virt_alloc_try_nid_nopanic(size, size,
>>>>                 __pa(MAX_DMA_ADDRESS), BOOTMEM_ALLOC_ACCESSIBLE, nid);
>>>> }
>>>>
>>>> kasan_populate_pmd()
>>>> {
>>>>         .....
>>>>
>>>>                 p =3D early_alloc(PAGE_SIZE, nid);
>>>>                 entry =3D pfn_pte(PFN_DOWN(__pa(p)), PAGE_KERNEL);
>>>>
>>>> I've instrumented the whole thing and early_alloc() returns NULL at so=
me
>>>> point and then __pa(NULL) dies in the VIRTUAL_DEBUG code. Well, it wou=
ld
>>>> die with VIRTUAL_DEBUG=3Dn as well at some other place.
>>>>
>>>> Not really a problem caused by the patch above, it's merily exposing a=
 code
>>>> path which relies blindly on "enough memory available" assumptions.
>>>>
>>>> Throwing more memory at the VM makes the problem go away...
>>>
>>> Hi Thomas,
>>>
>>> We just need a check inside of early_alloc() to properly diagnose such
>>> situation, right?
>>
>> At least you want to panic with a proper out of memory message. But lett=
ing
>> the thing die at a random place is a bad idea.
> =

> Thanks. I will cook a patch (if Andrey won't beat me to it).
> =


We probably should panic only if PAGE_SIZE allocation failed. PUD_SIZE,PMD_=
SIZE allocations have
failure fallback. I would suggest add 'bool panic' param  to early_alloc() =
and call
memblock_virt_alloc_try_nid() if it's true.

--===============5501001876050785727==--

