Content-Type: multipart/mixed; boundary="===============1739118215473985575=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] 34578dc67f: EIP is at vprintk_emit+0x1ea/0x600
Date: Thu, 25 Feb 2016 00:12:42 +0900
Message-ID: <20160224151242.GA2254@swordfish>
In-Reply-To: <20160224125022.GA516@swordfish>
List-Id: <oe-lkp.lists.linux.dev>

--===============1739118215473985575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (02/24/16 21:50), Sergey Senozhatsky wrote:
> On (02/24/16 12:46), Petr Mladek wrote:
> [..]
> > > and you get the NMI watchdog softlockup because you have a whole bunc=
h of
> > > =

> > >    "of_overlay_destroy: Could not find overlay #6"
> > >    "### dt-test ### of_unittest_destroy_tracked_overlays: overlay des=
troy failed for #6"
> > > =

> > > messages to print. seems that somehitng just pushes them in a loop.
> > > there are too many of them:
> > =

> > This sounds like a reasonable explanation. It seems that
> > of_unittest_destroy_tracked_overlays() really ended in an infinite
> > loop.
> > =

> > But I am still curious why the softlookup points to
> > =

> > [   33.497718] EIP is at vprintk_emit+0x1ea/0x600
> > =

> > Also there is on the stack
> > =

> > [   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
> > [   33.497741]  [<c068e712>] vprintk_default+0x32/0x40
> > [   33.497744]  [<c06fdf6e>] printk+0x11/0x13
> > [   33.497744]  [<c06fdf6e>] printk+0x11/0x13
> > [   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
> > [   33.497748]  [<c0df5eec>] of_unittest_overlay+0x8d1/0x900
> > [   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d
> > [   33.497750]  [<c0df6b1f>] of_unittest+0xc04/0xc2d
> > =

> > I would expect that the soft lookup happens in console_unlock()
> > called with IRQs disabled. It seems to me that of_unittest_overlay()
> > is called with IRQs enabled.

hm... both of the logbuf_lock/irq reqions in vprintk_emit/console_unlock
are not modified by the patch set. there is, however, one thing that has
changed -- additional console_cont_flush() calls, which does spin_lock_irq
logbuf_lock and spin_unlock_irq logbuf_lock.

> > I want to be sure that the patch in printk() did not introduce
> > a deadlock that is visible only under a high printk load.

I'll do more tests, certainly.

	-ss

--===============1739118215473985575==--

