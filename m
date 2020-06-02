Content-Type: multipart/mixed; boundary="===============6069348362106060165=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: 592dc8b215 ("lockdep: Prepare for NMI IRQ state tracking"): [ 5.103068] WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:3765 lockdep_hardirqs_off
Date: Tue, 02 Jun 2020 19:51:30 +0800
Message-ID: <20200602115130.GA10863@intel.com>
In-Reply-To: <20200602102156.GS706495@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6069348362106060165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 12:21:56PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 02, 2020 at 08:28:16AM +0800, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://github.com/0day-ci/linux/commits/Peter-Zijlstra/x86-entry-lockd=
ep-Improve-IRQ-state-tracking/20200528-222257
> =

> I did ask you to stop scraping my patches from lkml. I'll stick them in
> a git tree (they _are_ in a git tree), build those.
sorry for this, the mail from you is disabled per early mail on May 29 (PRC=
 time),
but this one happens to be caught on 20200528, which is still in the bisect=
ion
queue and leads to the noise. But new patches in mail will not be further
tested.

> =

> That said; yes, this patch is buggered, Rostedt already noted that on
> review Friday.
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============6069348362106060165==--

