Content-Type: multipart/mixed; boundary="===============7976329487749405678=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 07:00:28 -0700
Message-ID: <CALCETrVNJKU1AtAqSi5FNJZ2=stKTJa01H1MX2j_fJqr1JMeFw@mail.gmail.com>
In-Reply-To: <CAK1hOcO39_3CfC-w+OtahBLtzgAdUdPOOZFQ5t_dL9A==a6UVw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7976329487749405678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2015 at 6:44 AM, Denys Vlasenko <vda.linux@googlemail.com>=
 wrote:
> On Mon, Mar 9, 2015 at 2:35 PM, Andy Lutomirski <luto@amacapital.net> w=
rote:
>>> Apparently, code which uses this still exists, here
>>> (current git):
>>>
>>> restore_all:
>>>         TRACE_IRQS_IRET
>>> restore_all_notrace:
>>> #ifdef CONFIG_X86_ESPFIX32
>>>         movl PT_EFLAGS(%esp), %eax      # mix EFLAGS, SS and CS
>>>         # Warning: PT_OLDSS(%esp) contains the wrong/random values if we
>>>         # are returning to the kernel.
>>>         # See comments in process.c:copy_thread() for details.
>>>         movb PT_OLDSS(%esp), %ah
>>>         movb PT_CS(%esp), %al
>>>         andl $(X86_EFLAGS_VM | (SEGMENT_TI_MASK << 8) | SEGMENT_RPL_MAS=
K), %eax
>>>         cmpl $((SEGMENT_LDT << 8) | USER_RPL), %eax
>>>         CFI_REMEMBER_STATE
>>>         je ldt_ss                       # returning to user-space with =
LDT SS
>>> #endif
>>>
>>> "restore_all_notrace" is used by nmi handler too.
>>> If nmi happened right after sysenter, the stack will indeed
>>> only have three words, SS,ESP,EFLAGS, PT_OLDSS(%esp)
>>> would refer to a word above them.
>>
>> But if we're returning from nmi to userspace, then that nmi didn't hit
>> early in sysenter.
>>
>> Wouldn't it make more sense to change the espfix code to check CS
>> before reading SS so that, if we aren't returning to userspace, we
>> don't read past the top of the stack?
>
> I'm on it.
>
> Because this code has really, really bad register stalls:
>
>          movl PT_EFLAGS(%esp), %eax      # mix EFLAGS, SS and CS
>          movb PT_OLDSS(%esp), %ah
>          movb PT_CS(%esp), %al
>          andl $NUM, %eax
>          cmpl $NUM, %eax
>          je ldt_ss
>
> 2nd MOV will stall waiting for first one.
> 3rd one will stall waiting for second one.
> AND will stall waiting for them.
> CMP will stall waiting for AND.
>
> All this just to have one branch instead of three? Gosh...
> I'm preparing a patch which does this:
>
>         btl     $X86_EFLAGS_VM_BIT,PT_EFLAGS(%esp)
>         jc      restore_nocheck         # VM set, not it
>         testb   $3,PT_CS(%esp)
>         jz      restore_nocheck         # CPL0, not it
>         # Note: we access PT_OLDSS only when we know it exists.
>         # If PT_CS is from CPL0, this can be not true.
>         testb   $SEGMENT_TI_MASK,PT_OLDSS(%esp)
>         jnz     ldt_ss                  # returning to user-space with LD=
T SS
>
> All three checks can run in parallel on an OOO CPU.
> Most of the time, none of branches will be taken.

Why do we need the VM check?  Isn't CS =3D=3D 0 in vm86 mode?

--Andy

--===============7976329487749405678==--

