Content-Type: multipart/mixed; boundary="===============0122549859875844065=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [printk] c162d5b433: BUG:KASAN:use-after-scope_in_c
Date: Fri, 02 Mar 2018 00:19:34 +0900
Message-ID: <20180301151934.GA507@tigerII.localdomain>
In-Reply-To: <CACT4Y+ZUDu588gwgCbqru5D1RD5C+s3+E5ydhP7h9RoCjwQWJw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0122549859875844065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (03/01/18 09:51), Dmitry Vyukov wrote:
> > https://marc.info/?l=3Dlinux-kernel&m=3D151200883525299
> >
> > [..]
> >> I feel lost a bit.
> >
> > Yeah... can't understand what's going on there.
> >
> > The last time kasan didn't like this part
> >
> > [    0.003333]  ? console_unlock+0x605/0xcc0:
> >                               atomic_read at arch/x86/include/asm/atomi=
c.h:27
> >                                (inlined by) static_key_count at include=
/linux/jump_label.h:191
> >                                (inlined by) static_key_false at include=
/linux/jump_label.h:201
> >                                (inlined by) trace_console_rcuidle at in=
clude/trace/events/printk.h:10
> >                                (inlined by) call_console_drivers at ker=
nel/printk/printk.c:1556
> >                                (inlined by) console_unlock at kernel/pr=
intk/printk.c:2233
> >
> > complaining that there was a write of size 4... at atomic_read().
> =

> Hi Sergey,
> =

> Where is that report?
> I doubt that KASAN has instrumented a read as a write (at least there
> are no such known cases), so perhaps it's pointing to some other
> memory access.

Hello Dmitry,

I believe it's this one

https://marc.info/?l=3Dlinux-kernel&m=3D151200883525299


	-ss

--===============0122549859875844065==--

