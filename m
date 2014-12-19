Content-Type: multipart/mixed; boundary="===============7681022228689903251=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] tick/powerclamp: Remove tick_nohz_idle abuse
Date: Fri, 19 Dec 2014 20:56:23 +0100
Message-ID: <alpine.DEB.2.11.1412192054130.17382@nanos>
In-Reply-To: <20141219103900.101f6c6d@jacob-VirtualBox>
List-Id: <oe-lkp.lists.linux.dev>

--===============7681022228689903251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Dec 2014, Jacob Pan wrote:

> On Thu, 18 Dec 2014 22:12:57 +0100 (CET)
> Thomas Gleixner <tglx@linutronix.de> wrote:
> =

> > On Thu, 18 Dec 2014, Jacob Pan wrote:
> > > OK I agree, also as I mentioned earlier, Peter already has a patch
> > > for consolidated idle loop and remove tick_nohz_idle_enter/exit
> > > call from powerclamp driver. I have been working on a few tweaks to
> > > maintain the functionality and efficiency with the consolidated
> > > idle loop. We can apply the patches on top of yours.
> > =

> > No. This is equally wrong as I pointed out before. The 'unified' idle
> > loop is still fake and just pretending to be idle.
> > =

> In terms of efficiency, the consolidated idle loop will allow turning
> off sched tick during idle injection period. If we just take out the
> tick_nohz_idle_xxx call, the effectiveness of powerclamp is going down
> significantly. I am not arguing the design but from fixing regression
> perspective or short term solution.

There is no perspective. Period.

Its violates every rightful assumption of the nohz_IDLE_* code and
just ever worked by chance. There is so much subtle wreckage lurking
there that the only sane solution is to forbid it. End of story.

Thanks,

	tglx

--===============7681022228689903251==--

