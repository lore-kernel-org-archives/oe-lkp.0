Content-Type: multipart/mixed; boundary="===============7545595167830784997=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 7bb39313cd: netperf.Throughput_tps -4.5% regression
Date: Sat, 16 Jan 2021 07:34:26 -0800
Message-ID: <20210116153413.GP2743@paulmck-ThinkPad-P72>
In-Reply-To: <20210116035251.GB29609@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7545595167830784997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 16, 2021 at 11:52:51AM +0800, Feng Tang wrote:
> Hi Boris,
> =

> On Tue, Jan 12, 2021 at 03:14:38PM +0100, Borislav Petkov wrote:
> > On Tue, Jan 12, 2021 at 10:21:09PM +0800, kernel test robot wrote:
> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a -4.5% regression of netperf.Throughput_tps due to c=
ommit:
> > > =

> > > =

> > > commit: 7bb39313cd6239e7eb95198950a02b4ad2a08316 ("x86/mce: Make mce_=
timed_out() identify holdout CPUs")
> > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git ras/core
> > > =

> > > =

> > > in testcase: netperf
> > > on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.3=
0GHz with 192G memory
> > > with following parameters:
> > > =

> > > 	ip: ipv4
> > > 	runtime: 300s
> > > 	nr_threads: 16
> > > 	cluster: cs-localhost
> > > 	test: TCP_CRR
> > > 	cpufreq_governor: performance
> > > 	ucode: 0x5003003
> > > =

> > > test-description: Netperf is a benchmark that can be use to measure v=
arious aspect of networking performance.
> > > test-url: http://www.netperf.org/netperf/
> > =

> > I'm very very sceptical this thing benchmarks #MC exception handler
> > performance. Because the code this patch adds gets run only during a MCE
> > exception.
> > =

> > So unless I'm missing something obvious please check your setup.
> =

> We've tracked some similar strange kernel performance changes, like
> another mce related one [1]. For many of them, the root cause is
> the patch changes the code or data alignment/address of other
> components, as could be seen from System.map file.
> =

> We added debug patch trying to force data sections of each .o be
> aligned (isolating components), and run the test 3 times, and
> the regression is gone.
> =

>          %stddev     %change         %stddev
>              \          |                \  =

>     263059            -0.2%     262523        netperf.Throughput_total_tps
>      16441            -0.2%      16407        netperf.Throughput_tps
> =

> So the -4.5% is likely to be caused by data address change. =

> =

> But still there is something I don't understand, that the patch
> introduces a new cpumask 'mce_missing_cpus', which is 1024B, and
> from the System.map, all data following it get a 1024B offset,
> without changing the cacheline alignment situation.
> =

> 2 original system map files are attached in case people want
> to check.
> =

> [1]. https://lore.kernel.org/lkml/20200425114414.GU26573(a)shao2-debian/

One possibility is that the data-address changes put more stress on the
TLB, for example, if that region of memory is not covered by a huge
TLB entry.  If this is the case, is there a convenient way to define
mce_missing_cpus so as to get it out of the way?

							Thanx, Paul
--===============7545595167830784997==--

