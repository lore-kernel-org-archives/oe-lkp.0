Content-Type: multipart/mixed; boundary="===============3920570737009971490=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 53d3bc773e: hackbench.throughput -32.9% regression
Date: Wed, 01 Jun 2016 10:40:35 +0200
Message-ID: <20160601084035.GL3190@twins.programming.kicks-ass.net>
In-Reply-To: <87eg8h8pwl.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3920570737009971490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2016 at 01:00:10PM +0800, Huang, Ying wrote:
> Hi, Peter,
> =

> Peter Zijlstra <peterz@infradead.org> writes:
> =

> > On Tue, May 31, 2016 at 04:34:36PM +0800, Huang, Ying wrote:
> >> Hi, Ingo,
> >> =

> >> Part of the regression has been recovered in v4.7-rc1 from -32.9% to
> >> -9.8%.  But there is still some regression.  Is it possible for fully
> >> restore it?
> >
> > after much searching on how you guys run hackbench... I figured
> > something like:
> >
> >   perf bench sched messaging -g 20 --thread -l 60000
> =

> There is a reproduce file attached in the original report email, its
> contents is something like below:
> =

> 2016-05-15 08:57:02 echo performance > /sys/devices/system/cpu/cpu0/cpufr=
eq/scaling_governor

<snip stupid large output>

> 2016-05-15 09:06:24 /usr/bin/hackbench -g 24 --threads -l 60000
> =

> Hope that will help you for reproduce.

It did not, because I didn't have the exact same machine and its not
apparent how I should modify -- if at all -- the arguments to be
representative when ran on my machine.

> > on my IVB-EP (2*10*2) is similar to your IVT thing.
> >
> > And running something like:
> >
> >   for i in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ; do e=
cho performance > $i ; done
> >   perf stat --null --repeat 10 -- perf bench sched messaging -g 20 --th=
read -l 60000 | grep "seconds time elapsed"
> >
> > gets me:
> >
> > v4.6:
> >
> >       36.786914089 seconds time elapsed ( +-  0.49% )
> >       37.054017355 seconds time elapsed ( +-  1.05% )
> >
> >
> > origin/master (v4.7-rc1-ish):
> >
> >       34.757435264 seconds time elapsed ( +-  3.34% )
> >       35.396252515 seconds time elapsed ( +-  3.38% )
> >
> >
> > Which doesn't show a regression between v4.6 and HEAD; in fact it shows
> > an improvement.
> =

> Yes.  For hackbench test, linus/master (v4.7-rc1+) is better than v4.6,
> but it is worse than v4.6-rc7.  Details is as below.

That kernel was broken.. what your point?

--===============3920570737009971490==--

