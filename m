Content-Type: multipart/mixed; boundary="===============0919588999882034660=="
MIME-Version: 1.0
From: Pavel Machek <pavel@ucw.cz>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 07 Apr 2017 09:15:58 +0200
Message-ID: <20170407071558.GA11792@amd>
In-Reply-To: <20170407044334.GA487@jagdpanzerIV.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============0919588999882034660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 2017-04-07 13:44:40, Sergey Senozhatsky wrote:
> Hello,
> =

> On (04/06/17 19:33), Pavel Machek wrote:
> > > This patch set gives up part of the printk() reliability for bounded
> > > latency (at least unless we detect we are really in trouble) which is=
 IMHO
> > > a good trade-off for lots of users (and others can just turn this fea=
ture
> > > off).
> > =

> > If they can ever realize they were bitten by this feature.
> > =

> > Can we go for different tradeoff?
> > =

> > In console_unlock(), if you detect too much work, print "Too many
> > messages to print, %d bytes delayed" and wake up kernel thread.
> =

> "too many messages" is undefined. console_unlock() can be called from
> IRQ handler or with preemtion disabled, or under spin_lock, or under
> RCU read lock, etc. etc. By the time we decide to wake up printk_kthread
> from console_unlock() it may be already too late.

So lets define "too many messages" as 240 characters. We know printk
worked rather well for us for more than 20 years. Kernel code is used
to printk taking few miliseconds. =


> besides, this does not really address any of the concerns you have
> pointed out in other emails. we might be unable to wake_up printk_kthread
> (because there is a misbehaving higher prio process, or because the
> scheduler is misbehaving, etc. etc.) so the "emergency mode" is still
> here and still requires special handling.

Yeah? So you know modified printk() does not work, that's why
"emergency mode" exists. Unfortunately, you can't rely on fact that
you can detect half-crashed machines by printk levels. You usually
can't.

									Pavel
-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--===============0919588999882034660==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlFWUVBUkVD
QUFZRkFsam5QSzRBQ2drUU1PZndhcFhiK3ZMMmFnQ2ZTc0ZSNmlvRW9MWEZXQ1lnbVlvYlNGMEwK
VnpFQW9KaHU4azVGR2JXRXFXLytnNDRQWG9RWWtaaGEKPXRMTUsKLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCg==

--===============0919588999882034660==--

