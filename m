Content-Type: multipart/mixed; boundary="===============3151753248106285691=="
MIME-Version: 1.0
From: Denys Vlasenko <vda.linux@googlemail.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Sun, 08 Mar 2015 20:59:21 +0100
Message-ID: <CAK1hOcN0NkW7w3-zSxgfdLn+0fXwR0FEPurp_WnUniLyAXHacQ@mail.gmail.com>
In-Reply-To: <CALCETrU3Ums8SnNQttoCYkdDi-T=HkhCQs-jvF21Nh6igJ3Mhw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3151753248106285691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2015 at 8:41 PM, Andy Lutomirski <luto@amacapital.net> wro=
te:
>>> 4. Not directly related, but the 32-bit tss_struct contains this gem:
>>>
>>>     /*
>>>      * .. and then another 0x100 bytes for the emergency kernel stack:
>>>      */
>>>     unsigned long        stack[64];
>>>
>>> Last I checked, 0x100 !=3D 64.  Also, wow, this is kind of disgusting. =
:)
>>
>>
>> Seems to be unused: I commented it out on "defconfig" build
>> and got no build errors.
>
> It's used.  On 32-bit, NMIs don't use task gates (I don't know why),
> so sysenter is set up to set rsp to point to that "stack".

Where is it set up that way? Aha. Here?

void enable_sep_cpu(void)
{
        int cpu =3D get_cpu();
        struct tss_struct *tss =3D &per_cpu(cpu_tss, cpu);
...
        tss->x86_tss.ss1 =3D __KERNEL_CS;
        tss->x86_tss.sp1 =3D sizeof(struct tss_struct) + (unsigned long) ts=
s;
        wrmsr(MSR_IA32_SYSENTER_CS, __KERNEL_CS, 0);
        wrmsr(MSR_IA32_SYSENTER_ESP, tss->x86_tss.sp1, 0);


Can this be written in a way so that the field we use here
in fact gets referenced? I propose this:

        tss->x86_tss.sp1 =3D (unsinged long) &tss->stack + sizeof(tss->stac=
k);

(And I would rename it "emergency_stack" or something).

--===============3151753248106285691==--

