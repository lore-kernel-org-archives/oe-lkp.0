Content-Type: multipart/mixed; boundary="===============8247109897995723324=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Mon, 10 Apr 2017 13:54:32 +0200
Message-ID: <20170410115432.GV3452@pathway.suse.cz>
In-Reply-To: <20170410045339.GB2793@jagdpanzerIV.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============8247109897995723324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 2017-04-10 13:53:39, Sergey Senozhatsky wrote:
> On (04/09/17 12:12), Pavel Machek wrote:
> [..]
> > > a side note,
> > > that's rather unclear to me how would "message delayed" really help.
> > > if your system hard-lockup so badly and there are no printk messages
> > > even from NMI watchdog, then we won't be able to print that message.
> > =

> > We are talking about
> > =

> >    printk("unusual condition");
> >    do_something_clever(); /* Which unfortunately hard-crashes the machi=
ne */
> > =

> > that works with my proposal, but not with yours. Seen it happen many
> > times before.
> =

> I see your point, sure.
> I can't completely agree on "that works with my proposal, but not with yo=
urs."
> =

> on SMP system this would be true only if no other CPU holds the console_s=
em
> at the time we call printk(). (skipping irrelevant cases when we have sus=
pended
> console or !online CPU and !CON_ANYTIME console). and there is nothing th=
at
> makes "no other CPU holds the console_sem" always true on SMP system at a=
ny
> given point in time. so no, "A always works, B never works" is not accura=
te.
> =

> but, once again, I see your point.

A compromise might be to move the offloading from vprintk_emit() to
console_unlock(). By other words, the printk could always try to
flush some messages to the console. The console might trigger
the offload (wakeup kthread) after few lines or when the printing
takes too long.

We could go even furter. We could replace the cond_resched() in
console_unlock() with a need_resched() check. Then we could avoid
sleeping with console_sem taken.

It will avoid the softlockups caused by printk(). It should
work pretty well in most critical situations.

Of course, it will not guarantee that we will see all messages when
there is a flood of messages from many CPUs. But it was never
guaranteed.

Best Regards,
Petr

--===============8247109897995723324==--

