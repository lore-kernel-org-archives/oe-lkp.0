Content-Type: multipart/mixed; boundary="===============1994251238800824123=="
MIME-Version: 1.0
From: Thomas Garnier <thgarnie@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Wed, 22 Mar 2017 09:38:55 -0700
Message-ID: <CAJcbSZF1MdvoafLQwvyt8MObVxnbKZ-T04g-8Uv8YB0eV59qVA@mail.gmail.com>
In-Reply-To: <CALCETrVnM0OwpN7rfwAvgqk5VyxnLkrxtg95oNKJP6YpATM9Rw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1994251238800824123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 9:33 AM, Andy Lutomirski <luto@amacapital.net> wr=
ote:
> On Wed, Mar 22, 2017 at 12:36 AM, Ingo Molnar <mingo@kernel.org> wrote:
>>
>> * Thomas Garnier <thgarnie@google.com> wrote:
>>
>>> >  static inline void setup_fixmap_gdt(int cpu)
>>> >  {
>>> >         __set_fixmap(get_cpu_gdt_ro_index(cpu),
>>> > -                    __pa(get_cpu_gdt_rw(cpu)), pg_fixmap_gdt_flags);
>>> > +                    slow_virt_to_phys(get_cpu_gdt_rw(cpu)),
>>> > +                    pg_fixmap_gdt_flags);
>>> >  }
>>> >
>>> >  /* Load the original GDT from the per-cpu structure */
>>> >
>>> > This makes UP boot for me, but SMP (2 cpus) is still busted.
>>>
>>> This change fixed boot for me:
>>>
>>> diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixma=
p.h
>>> index b65155cc3760..4e30707d9f9a 100644
>>> --- a/arch/x86/include/asm/fixmap.h
>>> +++ b/arch/x86/include/asm/fixmap.h
>>> @@ -104,7 +104,9 @@ enum fixed_addresses {
>>>         FIX_GDT_REMAP_BEGIN,
>>>         FIX_GDT_REMAP_END =3D FIX_GDT_REMAP_BEGIN + NR_CPUS - 1,
>>>
>>> -       __end_of_permanent_fixed_addresses,
>>> +       __end_of_permanent_fixed_addresses =3D
>>> +               (FIX_GDT_REMAP_END + PTRS_PER_PTE - 1) &
>>> +               -PTRS_PER_PTE,
>>>
>>> Just ensure PKMAP_BASE & FIX_WP_TEST are on a different PMD.
>>>
>>> I don't think that the right fix but it might help understand the
>>> exact root cause.
>>
>> Could this be related to the permission bits in the PMD itself getting o=
ut of sync
>> with the PTEs? WP test marks a page writable/unwritable, and maybe we me=
ss up the
>> restoration. If they are on separate PMDs then this is worked around bec=
ause the
>> fixmap GDT is on a separate PMD.
>>
>
> I don't think so.  I think it's a pair of bugs related to the way that
> percpu areas are virtually mapped.
>
> Bug 1: __pa is totally bogus on percpu pointers.  Oddly, we have one
> older instance of exactly the same bug (on the same GDT address) in
> the kernel.  I'll send a patch.
>
> Bug 2: Nothing syncs a freshly-set-up CPU's percpu area into
> initial_page_table.  This makes access to the gdt fail in
> startup_32_smp.  This looks like a longstanding bug, and I don't see
> what it has to do with Thomas' series.  I'm still mulling over what to
> do about it.

Why do you think padding the fixmap also fix the problem? That's the
thing I don't get.

With the padding the PA is now correct and the memcmp check also
succeed. That's odd.

>
> --Andy



-- =

Thomas

--===============1994251238800824123==--

