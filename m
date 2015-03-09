Content-Type: multipart/mixed; boundary="===============7992008296699354390=="
MIME-Version: 1.0
From: Denys Vlasenko <vda.linux@googlemail.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 15:08:35 +0100
Message-ID: <CAK1hOcNz=UyphNJSxDN+RRi10DsNO5CgZ6e5rMsFp2TV0YmPTQ@mail.gmail.com>
In-Reply-To: <CALCETrVNJKU1AtAqSi5FNJZ2=stKTJa01H1MX2j_fJqr1JMeFw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7992008296699354390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2015 at 3:00 PM, Andy Lutomirski <luto@amacapital.net> wro=
te:
>> I'm preparing a patch which does this:
>>
>>         btl     $X86_EFLAGS_VM_BIT,PT_EFLAGS(%esp)
>>         jc      restore_nocheck         # VM set, not it
>>         testb   $3,PT_CS(%esp)
>>         jz      restore_nocheck         # CPL0, not it
>>         # Note: we access PT_OLDSS only when we know it exists.
>>         # If PT_CS is from CPL0, this can be not true.
>>         testb   $SEGMENT_TI_MASK,PT_OLDSS(%esp)
>>         jnz     ldt_ss                  # returning to user-space with L=
DT SS
>>
>> All three checks can run in parallel on an OOO CPU.
>> Most of the time, none of branches will be taken.
>
> Why do we need the VM check?  Isn't CS =3D=3D 0 in vm86 mode?

IF VM is set, then we are in vm86 mode, not in 16-bit protected mode
where ESPFIX thingy may be necessary. And also,
%ss register in vm86 does nit have LDT bit, thus that check would
not work properly anyway.

--===============7992008296699354390==--

