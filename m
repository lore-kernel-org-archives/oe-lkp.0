Content-Type: multipart/mixed; boundary="===============3403835245338062399=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ 0.003333] BUG: KASAN: use-after-scope in console_unlock+0x605/0xcc0
Date: Fri, 01 Dec 2017 10:32:30 +0900
Message-ID: <20171201013230.GB22663@jagdpanzerIV>
In-Reply-To: <20171130143006.76eebrxp5rpwdtok@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3403835245338062399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (11/30/17 22:30), Fengguang Wu wrote:
> On Thu, Nov 30, 2017 at 05:29:09PM +0900, Sergey Senozhatsky wrote:
> > On (11/30/17 09:16), Dmitry Vyukov wrote:
> > [..]
> > > > to be honest, this backtrace hardly makes any sense to me.
> > > >
> > > > vprintk_emit()
> > > >  reserve_standard_io_resources()
> > > >   __flush_tlb_all()
> > > >    vprintk_emit()
> > > >     __down_trylock_console_sem()
> > > >      wake_up_klogd()
> > > >       console_unlock()
> > > >
> > > > I need some help here.
> > > =

> > > =

> > > You can try dirty patch from here:
> > > https://groups.google.com/d/msg/kasan-dev/iDb5bhcMBT0/55QzwWaHAwAJ
> > > It should make KASAN print the exact variable name and frame where it
> > > was allocated.
> > =

> > would be good if Fengguang can try this out. I can't reproduce the
> > problem on my x86 box (linux-next and Linus's trees both work fine
> > for me with KASAN + lockdep + TRACE_IRQ).
> =

> Attached is the dmesg with Dmitry's patch. The new output is:
> =

> [    0.003333] frame offset: 32
> [    0.003333] desc: '2 32 4 3 __u 96 8 3 __u '
> [    0.003333] func: console_unlock+0x0/0xcc0

thanks!

	-ss

--===============3403835245338062399==--

