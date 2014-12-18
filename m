Content-Type: multipart/mixed; boundary="===============6770475460087343313=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] tick/powerclamp: Remove tick_nohz_idle abuse
Date: Thu, 18 Dec 2014 15:43:06 +0100
Message-ID: <alpine.DEB.2.11.1412181507000.17382@nanos>
In-Reply-To: <20141218140106.GA6323@developer>
List-Id: <oe-lkp.lists.linux.dev>

--===============6770475460087343313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Dec 2014, Eduardo Valentin wrote:
> > The real solution is to fix the powerclamp driver by rewriting it with
> > a sane concept, but that's beyond the scope of this.
> > =

> =

> Do you have suggestions on what exactly is the expected rewriting or the
> correct sane concepts?

There was quite some discussion about this in this very thread.
 =

> > So the only solution for now is to remove the calls into the core NOHZ
> > code from the powerclamp trainwreck along with the exports.
> > =

> > Fixes: d6d71ee4a14a "PM: Introduce Intel PowerClamp Driver"
> =

> If I got it right, the driver is currently broken due to changes in NOHZ
> core. So, does this patch fix power clamp behavior ?

The driver has been broken forever. It just worked by chance.

Now a very well justified and correct change in the core code exposed
that wreckage. So we have 2 choices:

  1) Get rid of the abuse and let powerclamp deal with the problem.
 =

  2) Revert a correct patch for the sake of a 'works by chance' driver
     or put hacky workarounds in the core. Either of that will just
     paper over the real root cause until the next thing breaks in
     subtle ways.

#1 is the only sane decision. We cannot deal with misdesigned driver
   code in the NOHZ core.

> If I got your proposal right, in the end power clamp will be still
> broken, but at least won't be abusing NOHZ. Is that what you are
> proposing?

Yes, the design of powerclamp stays broken, but the NOHZ abuse is
gone. powerclamp will work, but it can't benefit from the possible
longer idle times anymore.

Thanks,

	tglx

--===============6770475460087343313==--

