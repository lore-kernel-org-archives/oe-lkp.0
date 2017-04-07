Content-Type: multipart/mixed; boundary="===============1559859007473325058=="
MIME-Version: 1.0
From: Pavel Machek <pavel@ucw.cz>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 07 Apr 2017 10:14:49 +0200
Message-ID: <20170407081449.GA12859@amd>
In-Reply-To: <20170407074634.GB1091@jagdpanzerIV.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============1559859007473325058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 2017-04-07 16:46:34, Sergey Senozhatsky wrote:
> On (04/07/17 09:15), Pavel Machek wrote:
> > On Fri 2017-04-07 13:44:40, Sergey Senozhatsky wrote:
> > > Hello,
> > > =

> > > On (04/06/17 19:33), Pavel Machek wrote:
> > > > > This patch set gives up part of the printk() reliability for boun=
ded
> > > > > latency (at least unless we detect we are really in trouble) whic=
h is IMHO
> > > > > a good trade-off for lots of users (and others can just turn this=
 feature
> > > > > off).
> > > > =

> > > > If they can ever realize they were bitten by this feature.
> > > > =

> > > > Can we go for different tradeoff?
> > > > =

> > > > In console_unlock(), if you detect too much work, print "Too many
> > > > messages to print, %d bytes delayed" and wake up kernel thread.
> > > =

> > > "too many messages" is undefined. console_unlock() can be called from
> > > IRQ handler or with preemtion disabled, or under spin_lock, or under
> > > RCU read lock, etc. etc. By the time we decide to wake up printk_kthr=
ead
> > > from console_unlock() it may be already too late.
> > =

> > So lets define "too many messages" as 240 characters. We know printk
> > worked rather well for us for more than 20 years. Kernel code is used
> > to printk taking few miliseconds.
> =

> serial console can be quite slow. and port->lock, that is acquired by
> console_unlock()->call_console_drivers()->write(), is also accessible
> by serial driver's IRQ handler, and this lock may be busy long
> enough -- as long as that IRQ handler transmits/receives chars. but
> that's not the point.

Well. This is what we had for 20 years.

> [..]
> > Yeah? So you know modified printk() does not work, that's why
> > "emergency mode" exists. Unfortunately, you can't rely on fact that
> > you can detect half-crashed machines by printk levels. You usually
> > can't.
> =

> I'm not happy with those printk_emergency_begin()/end(), sure. but that's
> the reality -- every single solution that would offload printing duty imp=
lies
> that there will be cases when offloading would not be possible. either
> PENDING_PRINTK_IPI to other CPUs, or irq_work(PENDING_OUTPUT) on a local =
CPU,
> or anything else (um... what it is?... softirq? tasklet? print one logbuf
> entry from every IRQ handler? dunno, anything else?). There will be cases
> when we won't be able to expect that something will take over and finish
> printing for us. Well, may be I'm missing some other solution that would
> offload printing, eliminating lockup conditions, and at the same time work
> in 100% of the cases.

I don't have magic solution in my sleeve. You made a good case that
spending 30 seconds in printk() is a bad idea. I agree with that. Your
solution is to introduce printk_emergency_begin()/end(). I don't agree
there.

I believe "spend at most 2 seconds in printk(), then print a warning
and offload" is a solution closer to what we had before.

									Pavel
-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--===============1559859007473325058==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlFWUVBUkVD
QUFZRkFsam5TbmtBQ2drUU1PZndhcFhiK3ZKUmFRQ2RGZWZKdmRVUUFPallTVkFvaHZ6dDdqSDIK
QnZjQW4ySVloNDJxdml2WXRKUitEOTcxNjdYZHZ0bmwKPVRCM0UKLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCg==

--===============1559859007473325058==--

