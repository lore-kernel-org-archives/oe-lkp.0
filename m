Content-Type: multipart/mixed; boundary="===============3287611246375133230=="
MIME-Version: 1.0
From: Pavel Machek <pavel@ucw.cz>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 07 Apr 2017 14:44:55 +0200
Message-ID: <20170407124455.GC4756@amd>
In-Reply-To: <20170407121021.GA379@jagdpanzerIV.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============3287611246375133230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 2017-04-07 21:10:21, Sergey Senozhatsky wrote:
> On (04/07/17 10:14), Pavel Machek wrote:
> [..]
> > Well. This is what we had for 20 years.
> =

> I guess it's not just me who is a bit unhappy with printk. ask
> Peter Zijlstra what's the first word that comes into his mind
> when we reads "printk"  :)

Well, still we should make sure we are improving.

> [..]
> > I believe "spend at most 2 seconds in printk(), then print a warning
> > and offload" is a solution closer to what we had before.
> =

> a warning here can be very noisy.

Well, on normally-configured it should be ok. We don't commonly see
printk problems... If it is too noisy, perhaps we should increase from
2 seconds, but I don't think it will be problem.

> it's quite common that serial console (`console_seq') is a bit behind
> the logbuf head (`log_next_seq'). because log_store() can be much faster
> that call into console drivers.
> =

> another case is that  printk() !=3D console_unlock().  console_sem can be
> locked by VT, TTY, fbdev, (not to mention that some other CPU might be
> doing printing), etc. etc. all printk()-s in the meantime will just
> log_store() messages, so we can have a bunch on pending messsges in
> logbuf, it's normal. the CPU that owns the console_sem will print all
> those pending messages from console_unlock() path. the distance between
> `log_next_seq' and `console_seq' can be much bigger than 2 seconds or
> 240/320/etc chars. so wrong offloading can leave with nothing valuable
> in the serial output, even if we would defer it.
> =

> well, I'm not arguing. just saying that it's not so easy to do everything
> right here.
>

Well, I have to agree here. This is 20 years worth of mess :-(.

> what we have been thinking about is something like printk-stall detection.
> we probably (there are some if-s) can detect in printk() that offloading
> does not work and we must automatically switch to printk_emergency mode.
> that, in theory, can relax our dependency on printk_emergency_begin/end
> being in the right place at the right time. need to think more about it.

So... I don't really like the begin/end interface. I would rather have
printk_emergency(KERN_ ...).

Second... I don't think "stuck detector" is that helpful. What I
usually seen was some rather innocent kernel message followed by
hard-lock. That's where "message delayed" is useful..
								Pavel
-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--===============3287611246375133230==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlFWUVBUkVD
QUFZRkFsam5pY2NBQ2drUU1PZndhcFhiK3ZJSERnQ2dqMmtBcm9aRkhGVUJqNG5kakMrY29YdWYK
Y2RRQW4xTWFxT0drcC8vL2tSN2FuTWo3SlBackV5M1IKPVhDbU8KLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCg==

--===============3287611246375133230==--

