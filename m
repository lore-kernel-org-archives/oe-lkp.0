Content-Type: multipart/mixed; boundary="===============3707013928910432239=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [mm/usercopy] 517e1fbeb6: kernel BUG at arch/x86/mm/physaddr.c:78!
Date: Mon, 08 May 2017 12:15:11 -0700
Message-ID: <CAGXu5jJQdf0KXKuTaqyH7YP=NL-0WYNKDYOZJSVjkjrYd4tG9A@mail.gmail.com>
In-Reply-To: <851cb32e-e9da-a710-6e4d-ed2e8790ae70@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3707013928910432239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2017 at 11:41 AM, Laura Abbott <labbott@redhat.com> wrote:
> On 05/07/2017 07:51 AM, Kees Cook wrote:
>> On Sun, May 7, 2017 at 2:06 AM, kernel test robot
>> <fengguang.wu@intel.com> wrote:
>>> Greetings,
>>>
>>> 0day kernel testing robot got the below dmesg and the first bad commit =
is
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
>>>
>>> commit 517e1fbeb65f5eade8d14f46ac365db6c75aea9b
>>> Author:     Laura Abbott <labbott@redhat.com>
>>> AuthorDate: Tue Apr 4 14:09:00 2017 -0700
>>> Commit:     Kees Cook <keescook@chromium.org>
>>> CommitDate: Wed Apr 5 12:30:18 2017 -0700
>>>
>>>     mm/usercopy: Drop extra is_vmalloc_or_module() check
>>>
>>>     Previously virt_addr_valid() was insufficient to validate if virt_t=
o_page()
>>>     could be called on an address on arm64. This has since been fixed u=
p so
>>>     there is no need for the extra check. Drop it.
>>>
>>>     Signed-off-by: Laura Abbott <labbott@redhat.com>
>>>     Acked-by: Mark Rutland <mark.rutland@arm.com>
>>>     Signed-off-by: Kees Cook <keescook@chromium.org>
>>
>> This appears to be from CONFIG_DEBUG_VIRTUAL on __phys_addr, used by
>> hardened usercopy, probably during virt_addr_valid(). I'll take a
>> closer look on Monday...
>>
>> -Kees
>>
>
> So this looks like a strange edge case/bug on x86 32-bit.
> virt_addr_valid is returning true on vmalloc addresses because
> __vmalloc_start_set is never getting set because the below
> configuration uses CONFIG_NEED_MULTIPLE_NODES=3Dy and that variable
> only gets set with CONFIG_NEED_MULTIPLE_NODES=3Dn currently. If
> I set it in arch/x86/mm/numa_32.c, it seems to work:
>
> Thanks,
> Laura
>
>
> diff --git a/arch/x86/mm/numa_32.c b/arch/x86/mm/numa_32.c
> index 6b7ce62..aca6295 100644
> --- a/arch/x86/mm/numa_32.c
> +++ b/arch/x86/mm/numa_32.c
> @@ -100,5 +100,6 @@ void __init initmem_init(void)
>         printk(KERN_DEBUG "High memory starts at vaddr %08lx\n",
>                         (ulong) pfn_to_kaddr(highstart_pfn));
>
> +       __vmalloc_start_set =3D true;
>         setup_bootmem_allocator();
>  }

Ah, nice catch. Can you send this as a normal patch for Ingo to apply?

-Kees

-- =

Kees Cook
Pixel Security

--===============3707013928910432239==--

