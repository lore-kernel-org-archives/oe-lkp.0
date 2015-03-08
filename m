Content-Type: multipart/mixed; boundary="===============8107290601676297217=="
MIME-Version: 1.0
From: Denys Vlasenko <vda.linux@googlemail.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Sun, 08 Mar 2015 20:49:00 +0100
Message-ID: <CAK1hOcOumZPo0nOqXNRn=PwcqevyMKhB=_r-5JOhMzZPe=E8-Q@mail.gmail.com>
In-Reply-To: <CAK1hOcMrNb=RSqB92LzXRBRVZBkOdwggERSS3FLKak1EZi9gkA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8107290601676297217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2015 at 8:13 PM, Denys Vlasenko <vda.linux@googlemail.com>=
 wrote:
>> /*
>>  * The below -8 is to reserve 8 bytes on top of the ring0 stack.
>>  * This is necessary to guarantee that the entire "struct pt_regs"
>>  * is accessible even if the CPU haven't stored the SS/ESP registers
>>  * on the stack (interrupt gate does not save these registers
>>  * when switching to the same priv ring).
>>  * Therefore beware: accessing the ss/esp fields of the
>>  * "struct pt_regs" is possible, but they may contain the
>>  * completely wrong values.
>>  */
>> #define task_pt_regs(task)                                             \
>> ({                                                                     \
>>        struct pt_regs *__regs__;                                       \
>>        __regs__ =3D (struct pt_regs *)(KSTK_TOP(task_stack_page(task))-8=
); \
>>        __regs__ - 1;                                                   \
>> })
>>
>> I'm confused about multiple things:
>>
>> 1. I don't understand this comment.
>
> Comment says that in 32-bit x86, interrupts and exceptions
> in ring 0 do not push SS,ESP - they only save EFLAGS,CS,EIP
> in iret frame. (This happens because CPL doesn't
> change, not beacuse ot is zero).
>
> IRET insn likewise does not restore SS,ESP if it detects
> that RPL(stack_CS) =3D RPL(CS).

It seems that whoever wrote that code were afraid of this behavior
and they added this 8-byte area to ensure that pt_regs->sp
and pt_regs->ss always can be accessed.

They were wrong.

tss.sp0 will only be used on *inter-CPL* interrupts/exceptions,
and those *always* push SS,ESP.

If interrupt/exception happens while we are in CPL0,
it will _not_ use tss.sp0 - it will not switch stacks
since it is already on CPL0-stack. Therefore,
the scenario where SS,ESP are "missing" and must not
be accessed via pt_regs->esp in fear of touching
not-present page is impossible.

Let's just remove this "-8" thingy.

--===============8107290601676297217==--

