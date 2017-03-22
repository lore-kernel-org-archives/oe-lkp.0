Content-Type: multipart/mixed; boundary="===============8663256289119031869=="
MIME-Version: 1.0
From: Thomas Garnier <thgarnie@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Tue, 21 Mar 2017 22:16:12 -0700
Message-ID: <CAJcbSZEvR5GmxGt1K6JrA9KsDgv2TTbntwWFPZ+B01EhO9DSGQ@mail.gmail.com>
In-Reply-To: <CALCETrXOpdmEa+S8a6GimZ5D0-DeUih5tAZh97VY2SZq7GGKuA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8663256289119031869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 9:27 PM, Andy Lutomirski <luto@kernel.org> wrote:
> On Tue, Mar 21, 2017 at 5:41 PM, Thomas Garnier <thgarnie@google.com> w=
rote:
>> On Tue, Mar 21, 2017 at 4:51 PM, Andy Lutomirski <luto@kernel.org> wro=
te:
>>> On Tue, Mar 21, 2017 at 3:32 PM, Andy Lutomirski <luto@amacapital.net=
> wrote:
>>>> On Tue, Mar 21, 2017 at 2:11 PM, Linus Torvalds
>>>> <torvalds@linux-foundation.org> wrote:
>>>>> On Tue, Mar 21, 2017 at 1:25 PM, Thomas Garnier <thgarnie@google.co=
m> wrote:
>>>>>> The issue seems to be related to exceptions happening in close pages
>>>>>> to the fixmap GDT remapping.
>>>>>>
>>>>>> The original page fault happen in do_test_wp_bit which set a fixmap
>>>>>> entry to test WP flag. If I grow the number of processors supported
>>>>>> increasing the distance between the remapped GDT page and the WP test
>>>>>> page, the error does not reproduce.
>>>>>>
>>>>>> I am still looking at the exact distance between repro and no-repro =
as
>>>>>> well as the exact root cause.
>>>>>
>>>>> Hmm. Have we set the GDT limit incorrectly, somehow? The GDT *can*
>>>>> cover 8k entries, which at 8 bytes each would be 64kB.
>>>>
>>>> The QEMU barf says the GDT limit is 0xff, for better or for worse.
>>>>
>>>>>
>>>>> So somebody trying to load an invalid segment (say, 0xffff) might end
>>>>> up causing an access to the GDT base + 64k - 8.
>>>>>
>>>>> It is also possible that the CPU might do a page table writability
>>>>> check *before* it does the limit check. That would sound odd, though.
>>>>> Might be a CPU errata.
>>>>>
>>>>
>>>
>>>> There's presumably something genuinely wrong with our GDT.
>>>
>>> This is suspicious.  I added this code in test_wp_bit:
>>>
>>>     if (memcmp(get_current_gdt_ro(), get_current_gdt_rw(), 4096) !=3D 0=
) {
>>>         pr_err("Oh crap\n");
>>>         BUG_ON(1);
>>>     }
>>>
>>> It printed "Oh crap" and blew up.  Methinks something's wrong with the
>>> fixmap.  Is it possible that we're crossing a PMD boundary and failing
>>> to translate the addresses right?
>>
>> I might be that. We crash when the PKMAP_BASE is just after the FIX_WP_T=
EST.
>>
>> I will continue testing couple scenarios and design a fix. Moving the
>> GDT FIXMAP at the beginning or align the base (or pad the end).
>>
>
> Talk about barking up the wrong tree...
>
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index f8e22dbad86c..c564f62c7a8d 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -462,7 +464,8 @@ pgprot_t pg_fixmap_gdt_flags =3D PAGE_KERNEL;
>  static inline void setup_fixmap_gdt(int cpu)
>  {
>         __set_fixmap(get_cpu_gdt_ro_index(cpu),
> -                    __pa(get_cpu_gdt_rw(cpu)), pg_fixmap_gdt_flags);
> +                    slow_virt_to_phys(get_cpu_gdt_rw(cpu)),
> +                    pg_fixmap_gdt_flags);
>  }
>
>  /* Load the original GDT from the per-cpu structure */
>
> This makes UP boot for me, but SMP (2 cpus) is still busted.

This change fixed boot for me:

diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixmap.h
index b65155cc3760..4e30707d9f9a 100644
--- a/arch/x86/include/asm/fixmap.h
+++ b/arch/x86/include/asm/fixmap.h
@@ -104,7 +104,9 @@ enum fixed_addresses {
        FIX_GDT_REMAP_BEGIN,
        FIX_GDT_REMAP_END =3D FIX_GDT_REMAP_BEGIN + NR_CPUS - 1,

-       __end_of_permanent_fixed_addresses,
+       __end_of_permanent_fixed_addresses =3D
+               (FIX_GDT_REMAP_END + PTRS_PER_PTE - 1) &
+               -PTRS_PER_PTE,

Just ensure PKMAP_BASE & FIX_WP_TEST are on a different PMD.

I don't think that the right fix but it might help understand the
exact root cause.

-- =

Thomas

--===============8663256289119031869==--

