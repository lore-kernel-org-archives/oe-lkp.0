Content-Type: multipart/mixed; boundary="===============2002030972768387234=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 0b0695f2b3: phoronix-test-suite.compress-gzip.0.seconds 19.8% regression
Date: Fri, 29 May 2020 19:26:01 +0200
Message-ID: <CAKfTPtA8bGTGr2jDiGqA9R_FAZUzFBwvthJmunDjBUdzQF3wJQ@mail.gmail.com>
In-Reply-To: <CAKfTPtD+JW-mBt20vHAwOBxo7wbYG3seAc2+t2dWkqSzxf3dSQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2002030972768387234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 25 May 2020 at 10:02, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Thu, 21 May 2020 at 10:28, Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > On Wed, May 20, 2020 at 03:04:48PM +0200, Vincent Guittot wrote:
> > > On Thu, 14 May 2020 at 19:09, Vincent Guittot
> > > <vincent.guittot@linaro.org> wrote:
> > > >
> > > > Hi Oliver,
> > > >
> > > > On Thu, 14 May 2020 at 16:05, kernel test robot <oliver.sang@inte=
l.com> wrote:
> > > > >
> > > > > Hi Vincent Guittot,
> > > > >
> > > > > Below report FYI.
> > > > > Last year, we actually reported an improvement "[sched/fair] 0b06=
95f2b3:
> > > > > vm-scalability.median 3.1% improvement" on link [1].
> > > > > but now we found the regression on pts.compress-gzip.
> > > > > This seems align with what showed in "[v4,00/10] sched/fair: rewo=
rk the CFS
> > > > > load balance" (link [2]), where showed the reworked load balance =
could have
> > > > > both positive and negative effect for different test suites.
> > > >
> > > > We have tried to run  all possible use cases but it's impossible to
> > > > covers all so there were a possibility that one that is not covered,
> > > > would regressed.
> > > >
> > > > > And also from link [3], the patch set risks regressions.
> > > > >
> > > > > We also confirmed this regression on another platform
> > > > > (Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz with 8G memory),
> > > > > below is the data (lower is better).
> > > > > v5.4    4.1
> > > > > fcf0553db6f4c79387864f6e4ab4a891601f395e    4.01
> > > > > 0b0695f2b34a4afa3f6e9aa1ff0e5336d8dad912    4.89
> > > > > v5.5    5.18
> > > > > v5.6    4.62
> > > > > v5.7-rc2    4.53
> > > > > v5.7-rc3    4.59
> > > > >
> > > > > It seems there are some recovery on latest kernels, but not fully=
 back.
> > > > > We were just wondering whether you could share some lights the fu=
rther works
> > > > > on the load balance after patch set [2] which could cause the per=
formance
> > > > > change?
> > > > > And whether you have plan to refine the load balance algorithm fu=
rther?
> > > >
> > > > I'm going to have a look at your regression to understand what is
> > > > going wrong and how it can be fixed
> > >
> > > I have run the benchmark on my local setups to try to reproduce the
> > > regression and I don't see the regression. But my setups are different
> > > from your so it might be a problem specific to yours
> >
> > Hi Vincent, which OS are you using? We found the regression on Clear OS,
> > but it cannot reproduce on Debian.
> > On https://www.phoronix.com/scan.php?page=3Darticle&item=3Dmac-win-linu=
x2018&num=3D5
> > it was mentioned that -
> > Gzip compression is much faster out-of-the-box on Clear Linux due to it=
 exploiting
> > multi-threading capabilities compared to the other operating systems Gz=
ip support.
>
> I'm using Debian, I haven't noticed it was only on Clear OS.
> I'm going to look at it. Could you send me traces in the meantime ?

I run more tests to understand the problem. Even if Clear Linux uses
multithreading, the system is not overloaded and there is a
significant amount of idle time. This means that we use the has_spare
capacity path that spreads tasks on the system. At least that is what
I have seen in the KVM image. Beside this, I think that I have been
able to reproduce the problem on my platform with debian using pigz
instead of gzip for the compress-gzip-1.2.0 test. On my platform, I
can see a difference when I enable all CPU idle states whereas there
is no performance difference when only the shallowest idle state is
enabled.

The new load balance rework is more efficient at spreading tasks on
the system and one side effect could be that there is more idle time
between tasks wake up on each CPU. As a result, CPUs have to wake up
from a deeper idle state. This could explain the +54% increase of C6
usage that is reported.  Is it possible to get All C-state statistics
?

Could you run the test after disabling deep idle states like C6 and
above and check what is the difference between v5.7-rc7 and v5.4 ?
comparing fcf0553db6 ("sched/fair: Remove meaningless imbalance
calculation") and
  0b0695f2b3 ("sched/fair: Rework load_balance()") is not really
useful because they are part of the same rework and should be
considered a one single change.

>
> >
> > >
> > > After analysing the benchmark, it doesn't overload the system and is
> > > mainly based on 1 main gzip thread with few others waking up and
> > > sleeping around.
> > >
> > > I thought that scheduler could be too aggressive when trying to
> > > balance the threads on your system, which could generate more task
> > > migrations and impact the performance. But this doesn't seem to be the
> > > case because perf-stat.i.cpu-migrations is -8%. On the other side, the
> > > context switch is +16% and more interestingly idle state C1E and C6
> > > usages increase more than 50%. I don't know if we can rely or this
> > > value or not but I wonder if it could be that threads are now spread
> > > on different CPUs which generates idle time on the busy CPUs but the
> > > added time to enter/leave these states hurts the performance.
> > >
> > > Could you make some traces of both kernels ? Tracing sched events
> > > should be enough to understand the behavior
> > >
> > > Regards,
> > > Vincent
> > >
> > > >
> > > > Thanks
> > > > Vincent
> > > >
> > > > > thanks
> > > > >
> > > > > [1] https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/threa=
d/SANC7QLYZKUNMM6O7UNR3OAQAKS5BESE/
> > > > > [2] https://lore.kernel.org/patchwork/cover/1141687/
> > > > > [3] https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLinux=
-5.5-Scheduler
--===============2002030972768387234==--

