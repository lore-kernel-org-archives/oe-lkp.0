Content-Type: multipart/mixed; boundary="===============4403663456717829100=="
MIME-Version: 1.0
From: Pavel Machek <pavel@ucw.cz>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Sun, 09 Apr 2017 11:57:32 +0200
Message-ID: <20170409095732.GA27363@amd>
In-Reply-To: <20170407102917.3121e9f0@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============4403663456717829100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 2017-04-07 10:29:17, Steven Rostedt wrote:
> On Fri, 7 Apr 2017 10:14:49 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
> =

> > > serial console can be quite slow. and port->lock, that is acquired by
> > > console_unlock()->call_console_drivers()->write(), is also accessible
> > > by serial driver's IRQ handler, and this lock may be busy long
> > > enough -- as long as that IRQ handler transmits/receives chars. but
> > > that's not the point.  =

> > =

> > Well. This is what we had for 20 years.
> =

> But for the last 20 years we were not booting on machines with over 200
> CPUs. Well, we were, but those had custom kernels (which probably
> dismantled printk).

Well, not a problem. Just find a solution that works for dual core
machines as well as it did for 20 years.

2 seconds timeout as proposed earlier should work well for big
machines, and with no regressions on small machines.

									Pavel
-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--===============4403663456717829100==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlFWUVBUkVD
QUFZRkFsanFCWXdBQ2drUU1PZndhcFhiK3ZKZ1JRQ2VPOWQrbmJvM1kyNEtoNmFZYzFRcVhZbFcK
ZGk4QW5pYVNXNTZjejhDcitPYWFPN2cvMnI1Z3FodnQKPUFjS0oKLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCg==

--===============4403663456717829100==--

