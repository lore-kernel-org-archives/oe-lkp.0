Content-Type: multipart/mixed; boundary="===============1055716483316173457=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ 0.003333] BUG: KASAN: use-after-scope in console_unlock+0x605/0xcc0
Date: Thu, 30 Nov 2017 17:29:09 +0900
Message-ID: <20171130082909.GA469@jagdpanzerIV>
In-Reply-To: <CACT4Y+amQZApke6MneeK0tax=MzDbj5bce6r4MuSf8PHpzeaoA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1055716483316173457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/30/17 09:16), Dmitry Vyukov wrote:
[..]
> > to be honest, this backtrace hardly makes any sense to me.
> >
> > vprintk_emit()
> >  reserve_standard_io_resources()
> >   __flush_tlb_all()
> >    vprintk_emit()
> >     __down_trylock_console_sem()
> >      wake_up_klogd()
> >       console_unlock()
> >
> > I need some help here.
> =

> =

> You can try dirty patch from here:
> https://groups.google.com/d/msg/kasan-dev/iDb5bhcMBT0/55QzwWaHAwAJ
> It should make KASAN print the exact variable name and frame where it
> was allocated.

would be good if Fengguang can try this out. I can't reproduce the
problem on my x86 box (linux-next and Linus's trees both work fine
for me with KASAN + lockdep + TRACE_IRQ).

	-ss

--===============1055716483316173457==--

