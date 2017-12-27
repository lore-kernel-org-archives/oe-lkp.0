Content-Type: multipart/mixed; boundary="===============1139863937296912033=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/cpu_entry_area] 10043e02db: kernel_BUG_at_arch/x86/mm/physaddr.c
Date: Wed, 27 Dec 2017 19:12:47 +0100
Message-ID: <CACT4Y+aEMHEYVF+XW_BwUJUY215Xy_t4vv4vwRzOw5YfzkiBgA@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.20.1712271849490.2431@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============1139863937296912033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2017 at 7:05 PM, Thomas Gleixner <tglx@linutronix.de> wro=
te:
> On Tue, 26 Dec 2017, kernel test robot wrote:
>
>>
>> FYI, we noticed the following commit (built with gcc-6):
>>
>> commit: 10043e02db7f8a4161f76434931051e7d797a5f6 ("x86/cpu_entry_area: A=
dd debugstore entries to cpu_entry_area")
>> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git WIP.x86/pti
>
> ...
>
>> [    0.000000] kernel BUG at arch/x86/mm/physaddr.c:27!
>> PANIC: early exception 0x06 IP 10:ffffffff8115586f error 0 cr2 0xffff880=
00e468000
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.14.0-00160-g100=
43e02 #1
>> [    0.000000] task: ffffffff8a4683c0 task.stack: ffffffff8a400000
>> [    0.000000] RIP: 0010:__phys_addr+0x268/0x276
>> [    0.000000] RSP: 0000:ffffffff8a407bd8 EFLAGS: 00010002 ORIG_RAX: 000=
0000000000000
>> [    0.000000] RAX: 0000000000000000 RBX: 0000780000000000 RCX: 1fffffff=
f17a9a01
>> [    0.000000] RDX: dffffc0000000000 RSI: 0000000000000003 RDI: ffffffff=
8bd4d340
>> [    0.000000] RBP: ffffffff8a407bf8 R08: 0000000000000001 R09: ffffffff=
8a407a48
>> [    0.000000] R10: ffff880000010000 R11: ffff880000010fff R12: 00000000=
00000001
>> [    0.000000] R13: 0000000000000001 R14: 0000000000000000 R15: fffffbd0=
0c401000
>> [    0.000000] FS:  0000000000000000(0000) GS:ffffffff8cb4d000(0000) knl=
GS:0000000000000000
>> [    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    0.000000] CR2: ffff88000e468000 CR3: 000000000cde8000 CR4: 00000000=
000406b0
>> [    0.000000] Call Trace:
>> [    0.000000]  kasan_populate_shadow+0x3f2/0x497
>
> So this dies simply because kasan_populate_shadow() runs out of memory and
> has no sanity check whatsoever.
>
> static __init void *early_alloc(size_t size, int nid)
> {
>         return memblock_virt_alloc_try_nid_nopanic(size, size,
>                 __pa(MAX_DMA_ADDRESS), BOOTMEM_ALLOC_ACCESSIBLE, nid);
> }
>
> kasan_populate_pmd()
> {
>         .....
>
>                 p =3D early_alloc(PAGE_SIZE, nid);
>                 entry =3D pfn_pte(PFN_DOWN(__pa(p)), PAGE_KERNEL);
>
> I've instrumented the whole thing and early_alloc() returns NULL at some
> point and then __pa(NULL) dies in the VIRTUAL_DEBUG code. Well, it would
> die with VIRTUAL_DEBUG=3Dn as well at some other place.
>
> Not really a problem caused by the patch above, it's merily exposing a co=
de
> path which relies blindly on "enough memory available" assumptions.
>
> Throwing more memory at the VM makes the problem go away...

Hi Thomas,

We just need a check inside of early_alloc() to properly diagnose such
situation, right?
KASAN allocates 1/8 of physical memory, so the code has _some_ logic
behind it. But I guess it runs into a corner case where 1/8 is somehow
larger than 1 :)

--===============1139863937296912033==--

