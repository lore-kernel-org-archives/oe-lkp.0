Content-Type: multipart/mixed; boundary="===============6777927270854003941=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 0b0695f2b3: phoronix-test-suite.compress-gzip.0.seconds 19.8% regression
Date: Wed, 03 Jun 2020 19:06:18 +0200
Message-ID: <CAKfTPtBLKUBF_p-LxfRce2nJQFqGj95KZ+yisAN_qrMq5VxW=w@mail.gmail.com>
In-Reply-To: <20200602142305.GA31901@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6777927270854003941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Tue, 2 Jun 2020 at 16:11, Oliver Sang <oliver.sang@intel.com> wrote:
>
> On Tue, Jun 02, 2020 at 01:23:19PM +0800, Oliver Sang wrote:
> > On Fri, May 29, 2020 at 07:26:01PM +0200, Vincent Guittot wrote:
> > > On Mon, 25 May 2020 at 10:02, Vincent Guittot
> > > <vincent.guittot@linaro.org> wrote:
> > > >

> > > > > > > > We also confirmed this regression on another platform
> > > > > > > > (Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz with 8G memory),
> > > > > > > > below is the data (lower is better).
> > > > > > > > v5.4    4.1
> > > > > > > > fcf0553db6f4c79387864f6e4ab4a891601f395e    4.01
> > > > > > > > 0b0695f2b34a4afa3f6e9aa1ff0e5336d8dad912    4.89
> > > > > > > > v5.5    5.18
> > > > > > > > v5.6    4.62
> > > > > > > > v5.7-rc2    4.53
> > > > > > > > v5.7-rc3    4.59
> > > > > > > >
> > > > > > > > It seems there are some recovery on latest kernels, but not=
 fully back.
> > > > > > > > We were just wondering whether you could share some lights =
the further works
> > > > > > > > on the load balance after patch set [2] which could cause t=
he performance
> > > > > > > > change?
> > > > > > > > And whether you have plan to refine the load balance algori=
thm further?
> > > > > > >

> >
> > Hi Vincent, sorry for late. I selected the turbostat while running
> > compress-gzip on Clear OS, as attached. Besides v5.4 and v5.7-rc7,
> > I got the data for v5.5 and v5.7, too. Not sure it's enough since you
> > said "All C-state statistics". Hope it could be useful and if you want
> > more data, please let us know.
> >
> > Again, I collect these data on our "Intel(R) Core(TM) i7-8700 CPU @ 3.2=
0GHz
> > with 8G memory" platform. for each release, I ran test twice to assure
> > the results consistent.
> >
> > phoronix-test-suite.compress-gzip.0.seconds
> > release               run1    run2
> > v5.4          4.37    4.37
> > v5.5          5.37    5.46
> > v5.7-rc7      4.82    4.85
> > v5.7          4.86    4.83
> >
> > >
> > > Could you run the test after disabling deep idle states like C6 and
> > > above and check what is the difference between v5.7-rc7 and v5.4 ?
> >
> > thanks for suggestion, will collect this data later.
>
> Hi Vincent, I test by disabling deep idle states, but the regression
> still exists, just the gap becomes smaller -
> release         run1    run2
> v5.4            4.32    4.3     <-- little change comparing to above
> v5.5            5.04    5.06    <-- improves
> v5.7-rc7        4.79    4.78
> v5.7            4.77    4.77
>
> I also attached turbostat data as attached.

Thanks for the test results and the turbo stats figures.
The outcomes are not as obvious as I would have expected. The
performance difference for v5.5 and v5.7 when C6 and above are
disabled tends to confirm that the idle state is impacting the
performance but the difference still remain.
Regarding turbostat output, the 1st main difference is the number of
time the CPUs entered idle state:
v5.4 run1 : 587252+905317+367732+859828+108+332436+110+217=3D3053000
v5.7 run1 : 807623+639635+466723+1298557+108+283548+63+156=3D3496413
which is +14% of entering idle.
This is even more obvious on v5.5 run1:
761950+1320362+1681750+682042+91+304755+79+243=3D4751272 which is +55%
of entering idle

We have a similar ratio without c6 and above c-state between v5.4 and
v5.7 and the ratio has decreased to +22% between v5.4 and v5.5.

So this tends to confirm my assumption that tasks are more spread and
this generates more enter/leave cpuidle. I still need to think about
how to balance this


>
> >
> > > comparing fcf0553db6 ("sched/fair: Remove meaningless imbalance
> > > calculation") and
> > >   0b0695f2b3 ("sched/fair: Rework load_balance()") is not really
> > > useful because they are part of the same rework and should be
> > > considered a one single change.
> > >
> > > >
> > > > >
> > > > > >
> > > > > > After analysing the benchmark, it doesn't overload the system a=
nd is
> > > > > > mainly based on 1 main gzip thread with few others waking up and
> > > > > > sleeping around.
> > > > > >
> > > > > > I thought that scheduler could be too aggressive when trying to
> > > > > > balance the threads on your system, which could generate more t=
ask
> > > > > > migrations and impact the performance. But this doesn't seem to=
 be the
> > > > > > case because perf-stat.i.cpu-migrations is -8%. On the other si=
de, the
> > > > > > context switch is +16% and more interestingly idle state C1E an=
d C6
> > > > > > usages increase more than 50%. I don't know if we can rely or t=
his
> > > > > > value or not but I wonder if it could be that threads are now s=
pread
> > > > > > on different CPUs which generates idle time on the busy CPUs bu=
t the
> > > > > > added time to enter/leave these states hurts the performance.
> > > > > >
> > > > > > Could you make some traces of both kernels ? Tracing sched even=
ts
> > > > > > should be enough to understand the behavior
> > > > > >
> > > > > > Regards,
> > > > > > Vincent
> > > > > >
> > > > > > >
> > > > > > > Thanks
> > > > > > > Vincent
> > > > > > >
> > > > > > > > thanks
> > > > > > > >
> > > > > > > > [1] https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org=
/thread/SANC7QLYZKUNMM6O7UNR3OAQAKS5BESE/
> > > > > > > > [2] https://lore.kernel.org/patchwork/cover/1141687/
> > > > > > > > [3] https://www.phoronix.com/scan.php?page=3Dnews_item&px=
=3DLinux-5.5-Scheduler
>
>
--===============6777927270854003941==--

