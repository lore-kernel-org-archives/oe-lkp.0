Content-Type: multipart/mixed; boundary="===============4734119982574793372=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [printk] c162d5b433: BUG:KASAN:use-after-scope_in_c
Date: Thu, 01 Mar 2018 16:53:15 +0100
Message-ID: <CACT4Y+byVgvjzTush=Zft_iQmZ3e46QS8X6ooZ15CmAxvPu-oA@mail.gmail.com>
In-Reply-To: <20180301151934.GA507@tigerII.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============4734119982574793372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 1, 2018 at 4:19 PM, Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
> On (03/01/18 09:51), Dmitry Vyukov wrote:
>> > https://marc.info/?l=3Dlinux-kernel&m=3D151200883525299
>> >
>> > [..]
>> >> I feel lost a bit.
>> >
>> > Yeah... can't understand what's going on there.
>> >
>> > The last time kasan didn't like this part
>> >
>> > [    0.003333]  ? console_unlock+0x605/0xcc0:
>> >                               atomic_read at arch/x86/include/asm/atom=
ic.h:27
>> >                                (inlined by) static_key_count at includ=
e/linux/jump_label.h:191
>> >                                (inlined by) static_key_false at includ=
e/linux/jump_label.h:201
>> >                                (inlined by) trace_console_rcuidle at i=
nclude/trace/events/printk.h:10
>> >                                (inlined by) call_console_drivers at ke=
rnel/printk/printk.c:1556
>> >                                (inlined by) console_unlock at kernel/p=
rintk/printk.c:2233
>> >
>> > complaining that there was a write of size 4... at atomic_read().
>>
>> Hi Sergey,
>>
>> Where is that report?
>> I doubt that KASAN has instrumented a read as a write (at least there
>> are no such known cases), so perhaps it's pointing to some other
>> memory access.
>
> Hello Dmitry,
>
> I believe it's this one
>
> https://marc.info/?l=3Dlinux-kernel&m=3D151200883525299


Thanks, but now that I debugged this one, I think that one is the same issu=
e.
Amusingly a write in READ_ONCE is actually legitimate because
GCC_PLUGIN_STRUCTLEAK emits an initializing write for __u variable in
READ_ONCE implementation.

--===============4734119982574793372==--

