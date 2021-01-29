Content-Type: multipart/mixed; boundary="===============1145154700769589433=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [workqueue] d5bff968ea: WARNING:at_kernel/workqueue.c:#process_one_work
Date: Fri, 29 Jan 2021 07:11:24 -0800
Message-ID: <20210129151124.GB2743@paulmck-ThinkPad-P72>
In-Reply-To: <bfb8370e-43e4-7f72-a71f-8481eb66f6ed@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1145154700769589433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 02:20:18PM +0800, Xing Zhengjun wrote:
> =

> =

> On 1/29/2021 2:08 AM, Paul E. McKenney wrote:
> > On Thu, Jan 28, 2021 at 05:09:05PM +0800, Hillf Danton wrote:
> > > On Thu, 28 Jan 2021 15:52:40 +0800 Xing Zhengjun wrote:
> > =

> > [ . . . ]
> > =

> > > > I test the patch 4 times, no warning appears in the kernel log.
> > > =

> > > Thank you so much Zhengjun!
> > > =

> > > And the overall brain dump so far is
> > > =

> > > 1/ before and after d5bff968ea, changing the allowed ptr at online ti=
me
> > > is the key to quiesce the warning in process_one_work().
> > > =

> > > 2/ marking pcpu before changing aptr in rebind_workers() is mandatory=
 in
> > > regards to cutting the risk of triggering such a warning.
> > > =

> > > 3/ we canot maintain such an order without quiescing the 508 warning =
for
> > > kworkers. And we have a couple of excuses to do so, a) the number of
> > > allowed CPUs is no longer checked in is_per_cpu_kthread() instead of
> > > PF_NO_SETAFFINITY, b) there is always a followup act to change the ap=
tr
> > > in order to fix the number of aCPUs.
> > > =

> > > 4/ same order is maintained also at rescue time.
> > =

> > Just out of curiosity, does this test still fail on current mainline?
> > =

> > 							Thanx, Paul
> > =

> I test mainline v5.11-rc5, it has no issue. The issue is only for d5bff96=
8ea
> which is in
> https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git
> dev.2021.01.11b.

Got it, and that commit is long gone from the -rcu dev branch, having
been replaced by a series of commits from Valentin, Lai Jiangshan, and
Peter Zijlstra that are close to those in v5.11-rc5.  Which I will drop
when I port to v5.12-rc1.

Thank you very much!

							Thanx, Paul
--===============1145154700769589433==--

