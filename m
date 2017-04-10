Content-Type: multipart/mixed; boundary="===============8677473268231994640=="
MIME-Version: 1.0
From: Pavel Machek <pavel@ucw.cz>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Mon, 10 Apr 2017 20:48:58 +0200
Message-ID: <20170410184858.GA24226@amd>
In-Reply-To: <20170410045339.GB2793@jagdpanzerIV.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============8677473268231994640==
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
> given point in time. so no, "A always works, B never works" is not
> accurate.

Ok, you are right. OTOH the common case is console_sem is unlocked (at
least on systems I develop on). =


> but, once again, I see your point.

Good. Does that mean that the next version of patches will work ok in
that case?
									Pavel
-- =

(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--===============8677473268231994640==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEKCmlFWUVBUkVD
QUFZRkFsanIwNW9BQ2drUU1PZndhcFhiK3ZLYzNBQ2ZVUFpFSUxqWEJ6TXlwM2M5UzU4eVg4N2EK
U09ZQW9NUWdURE9WbUZPaE9BdnR3RTIzOGN1TE9oM0UKPS9oak0KLS0tLS1FTkQgUEdQIFNJR05B
VFVSRS0tLS0tCg==

--===============8677473268231994640==--

