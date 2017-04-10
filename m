Content-Type: multipart/mixed; boundary="===============7634471864758579472=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Tue, 11 Apr 2017 00:08:20 +0900
Message-ID: <20170410150820.GB457@tigerII.localdomain>
In-Reply-To: <20170410115432.GV3452@pathway.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7634471864758579472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/10/17 13:54), Petr Mladek wrote:
[..]
> > > that works with my proposal, but not with yours. Seen it happen many
> > > times before.
> > =

> > I see your point, sure.
> > I can't completely agree on "that works with my proposal, but not with =
yours."
> > =

> > on SMP system this would be true only if no other CPU holds the console=
_sem
> > at the time we call printk(). (skipping irrelevant cases when we have s=
uspended
> > console or !online CPU and !CON_ANYTIME console). and there is nothing =
that
> > makes "no other CPU holds the console_sem" always true on SMP system at=
 any
> > given point in time. so no, "A always works, B never works" is not accu=
rate.
> > =

> > but, once again, I see your point.
> =

> A compromise might be to move the offloading from vprintk_emit() to
> console_unlock(). By other words, the printk could always try to
> flush some messages to the console. The console might trigger
> the offload (wakeup kthread) after few lines

yep, that's the proposal.


hm, this also should align with one more thing.

we briefly discussed it before, and it was on my list, that
wake_up(printk_kthread) _eventually_ better be moved to console_unlock()
[1] (I also had it in the slides at KS, but I believe we didn't have much
time back then).

vprintk_emit() is not the only console_lock() caller. user space does
console_lock() and console_unlock() calls, and in some cases a user
space process can stuck in system call printing kernel messages to a
potentially slow console [2]. it can be unpleasant, but far less dramatic
than doing console_unlock() from IRQ, or under spin_lock. so it was
moved down the list. seems we have one more reason to reshuffle the
list and do offloading from console_unlock() from the beginning.

will take a look.

/* in our "in-house" kernels we do 'async' console_unlock(). not
exactly the way it's shown in [1], but quite similar. */

[1] https://marc.info/?l=3Dlinux-kernel&m=3D145750373530161
[2] https://marc.info/?l=3Dlinux-kernel&m=3D145762735308470

	-ss

--===============7634471864758579472==--

