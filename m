Content-Type: multipart/mixed; boundary="===============7015995405302384784=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 07 Apr 2017 16:46:34 +0900
Message-ID: <20170407074634.GB1091@jagdpanzerIV.localdomain>
In-Reply-To: <20170407071558.GA11792@amd>
List-Id: <oe-lkp.lists.linux.dev>

--===============7015995405302384784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/07/17 09:15), Pavel Machek wrote:
> On Fri 2017-04-07 13:44:40, Sergey Senozhatsky wrote:
> > Hello,
> > =

> > On (04/06/17 19:33), Pavel Machek wrote:
> > > > This patch set gives up part of the printk() reliability for bounded
> > > > latency (at least unless we detect we are really in trouble) which =
is IMHO
> > > > a good trade-off for lots of users (and others can just turn this f=
eature
> > > > off).
> > > =

> > > If they can ever realize they were bitten by this feature.
> > > =

> > > Can we go for different tradeoff?
> > > =

> > > In console_unlock(), if you detect too much work, print "Too many
> > > messages to print, %d bytes delayed" and wake up kernel thread.
> > =

> > "too many messages" is undefined. console_unlock() can be called from
> > IRQ handler or with preemtion disabled, or under spin_lock, or under
> > RCU read lock, etc. etc. By the time we decide to wake up printk_kthread
> > from console_unlock() it may be already too late.
> =

> So lets define "too many messages" as 240 characters. We know printk
> worked rather well for us for more than 20 years. Kernel code is used
> to printk taking few miliseconds.

serial console can be quite slow. and port->lock, that is acquired by
console_unlock()->call_console_drivers()->write(), is also accessible
by serial driver's IRQ handler, and this lock may be busy long
enough -- as long as that IRQ handler transmits/receives chars. but
that's not the point.

[..]
> Yeah? So you know modified printk() does not work, that's why
> "emergency mode" exists. Unfortunately, you can't rely on fact that
> you can detect half-crashed machines by printk levels. You usually
> can't.

I'm not happy with those printk_emergency_begin()/end(), sure. but that's
the reality -- every single solution that would offload printing duty impli=
es
that there will be cases when offloading would not be possible. either
PENDING_PRINTK_IPI to other CPUs, or irq_work(PENDING_OUTPUT) on a local CP=
U,
or anything else (um... what it is?... softirq? tasklet? print one logbuf
entry from every IRQ handler? dunno, anything else?). There will be cases
when we won't be able to expect that something will take over and finish
printing for us. Well, may be I'm missing some other solution that would
offload printing, eliminating lockup conditions, and at the same time work
in 100% of the cases.

	-ss

--===============7015995405302384784==--

