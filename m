Content-Type: multipart/mixed; boundary="===============5695536269428796599=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 0b0695f2b3: phoronix-test-suite.compress-gzip.0.seconds 19.8% regression
Date: Mon, 25 May 2020 10:02:44 +0200
Message-ID: <CAKfTPtD+JW-mBt20vHAwOBxo7wbYG3seAc2+t2dWkqSzxf3dSQ@mail.gmail.com>
In-Reply-To: <20200521083815.GA19280@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5695536269428796599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 21 May 2020 at 10:28, Oliver Sang <oliver.sang@intel.com> wrote:
>
> On Wed, May 20, 2020 at 03:04:48PM +0200, Vincent Guittot wrote:
> > On Thu, 14 May 2020 at 19:09, Vincent Guittot
> > <vincent.guittot@linaro.org> wrote:
> > >
> > > Hi Oliver,
> > >
> > > On Thu, 14 May 2020 at 16:05, kernel test robot <oliver.sang@intel.=
com> wrote:
> > > >
> > > > Hi Vincent Guittot,
> > > >
> > > > Below report FYI.
> > > > Last year, we actually reported an improvement "[sched/fair] 0b0695=
f2b3:
> > > > vm-scalability.median 3.1% improvement" on link [1].
> > > > but now we found the regression on pts.compress-gzip.
> > > > This seems align with what showed in "[v4,00/10] sched/fair: rework=
 the CFS
> > > > load balance" (link [2]), where showed the reworked load balance co=
uld have
> > > > both positive and negative effect for different test suites.
> > >
> > > We have tried to run  all possible use cases but it's impossible to
> > > covers all so there were a possibility that one that is not covered,
> > > would regressed.
> > >
> > > > And also from link [3], the patch set risks regressions.
> > > >
> > > > We also confirmed this regression on another platform
> > > > (Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz with 8G memory),
> > > > below is the data (lower is better).
> > > > v5.4    4.1
> > > > fcf0553db6f4c79387864f6e4ab4a891601f395e    4.01
> > > > 0b0695f2b34a4afa3f6e9aa1ff0e5336d8dad912    4.89
> > > > v5.5    5.18
> > > > v5.6    4.62
> > > > v5.7-rc2    4.53
> > > > v5.7-rc3    4.59
> > > >
> > > > It seems there are some recovery on latest kernels, but not fully b=
ack.
> > > > We were just wondering whether you could share some lights the furt=
her works
> > > > on the load balance after patch set [2] which could cause the perfo=
rmance
> > > > change?
> > > > And whether you have plan to refine the load balance algorithm furt=
her?
> > >
> > > I'm going to have a look at your regression to understand what is
> > > going wrong and how it can be fixed
> >
> > I have run the benchmark on my local setups to try to reproduce the
> > regression and I don't see the regression. But my setups are different
> > from your so it might be a problem specific to yours
>
> Hi Vincent, which OS are you using? We found the regression on Clear OS,
> but it cannot reproduce on Debian.
> On https://www.phoronix.com/scan.php?page=3Darticle&item=3Dmac-win-linux2=
018&num=3D5
> it was mentioned that -
> Gzip compression is much faster out-of-the-box on Clear Linux due to it e=
xploiting
> multi-threading capabilities compared to the other operating systems Gzip=
 support.

I'm using Debian, I haven't noticed it was only on Clear OS.
I'm going to look at it. Could you send me traces in the meantime ?

>
> >
> > After analysing the benchmark, it doesn't overload the system and is
> > mainly based on 1 main gzip thread with few others waking up and
> > sleeping around.
> >
> > I thought that scheduler could be too aggressive when trying to
> > balance the threads on your system, which could generate more task
> > migrations and impact the performance. But this doesn't seem to be the
> > case because perf-stat.i.cpu-migrations is -8%. On the other side, the
> > context switch is +16% and more interestingly idle state C1E and C6
> > usages increase more than 50%. I don't know if we can rely or this
> > value or not but I wonder if it could be that threads are now spread
> > on different CPUs which generates idle time on the busy CPUs but the
> > added time to enter/leave these states hurts the performance.
> >
> > Could you make some traces of both kernels ? Tracing sched events
> > should be enough to understand the behavior
> >
> > Regards,
> > Vincent
> >
> > >
> > > Thanks
> > > Vincent
> > >
> > > > thanks
> > > >
> > > > [1] https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/thread/=
SANC7QLYZKUNMM6O7UNR3OAQAKS5BESE/
> > > > [2] https://lore.kernel.org/patchwork/cover/1141687/
> > > > [3] https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLinux-5=
.5-Scheduler
--===============5695536269428796599==--

