Content-Type: multipart/mixed; boundary="===============8916439540191447689=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 592dc8b215 ("lockdep: Prepare for NMI IRQ state tracking"): [ 5.103068] WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:3765 lockdep_hardirqs_off
Date: Tue, 02 Jun 2020 14:33:20 +0200
Message-ID: <20200602123320.GG706478@hirez.programming.kicks-ass.net>
In-Reply-To: <20200602115130.GA10863@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8916439540191447689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 07:51:30PM +0800, Philip Li wrote:
> On Tue, Jun 02, 2020 at 12:21:56PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 02, 2020 at 08:28:16AM +0800, kernel test robot wrote:
> > > Greetings,
> > > =

> > > 0day kernel testing robot got the below dmesg and the first bad commi=
t is
> > > =

> > > https://github.com/0day-ci/linux/commits/Peter-Zijlstra/x86-entry-loc=
kdep-Improve-IRQ-state-tracking/20200528-222257
> > =

> > I did ask you to stop scraping my patches from lkml. I'll stick them in
> > a git tree (they _are_ in a git tree), build those.
> sorry for this, the mail from you is disabled per early mail on May 29 (P=
RC time),
> but this one happens to be caught on 20200528, which is still in the bise=
ction
> queue and leads to the noise. But new patches in mail will not be further
> tested.

Thanks!
--===============8916439540191447689==--

