Content-Type: multipart/mixed; boundary="===============4523456886001166717=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: 08ed4efad6: stress-ng.sigsegv.ops_per_sec -41.9% regression
Date: Wed, 28 Apr 2021 22:36:40 +0800
Message-ID: <20210428143008.GA19916@xsang-OptiPlex-9020>
In-Reply-To: <20210423074431.7ob6aqasome2zjbk@example.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4523456886001166717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi, Alexey Gladkov,

On Fri, Apr 23, 2021 at 09:44:31AM +0200, Alexey Gladkov wrote:
> On Fri, Apr 23, 2021 at 10:47:22AM +0800, Oliver Sang wrote:
> > hi, Eric,
> > =

> > On Thu, Apr 08, 2021 at 01:44:43PM -0500, Eric W. Biederman wrote:
> > > Linus Torvalds <torvalds@linux-foundation.org> writes:
> > > =

> > > > On Thu, Apr 8, 2021 at 1:32 AM kernel test robot <oliver.sang@int=
el.com> wrote:
> > > >>
> > > >> FYI, we noticed a -41.9% regression of stress-ng.sigsegv.ops_per_s=
ec due to commit
> > > >> 08ed4efad684 ("[PATCH v10 6/9] Reimplement RLIMIT_SIGPENDING on to=
p of ucounts")
> > > >
> > > > Ouch.
> > > =

> > > We were cautiously optimistic when no test problems showed up from
> > > the last posting that there was nothing to look at here.
> > > =

> > > Unfortunately it looks like the bots just missed the last posting. =

> > =

> > this report is upon v10. do you have newer version which hope bot test?
> =

> Yes. I posted a new version of this patch set. I would be very grateful if
> you could test it.
> =

> https://lore.kernel.org/lkml/cover.1619094428.git.legion(a)kernel.org/
>

we tested this v11 version, and found the regression reduced to about 1.6%.
please be noted, according to our previous experience, the stress-ng is
kind of sensitive testsuite, so we normally wouldn't report <3% regression.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/tbox_group/t=
est/testcase/testtime/ucode:
  interrupt/gcc-9/performance/1HDD/x86_64-rhel-8.3/100%/debian-10.4-x86_64-=
20200603.cgz/lkp-ivb-2ep1/sigsegv/stress-ng/60s/0x42e

commit:
  00a58a6af1c4 ("Reimplement RLIMIT_MSGQUEUE on top of ucounts")
  8932738fc10c ("Reimplement RLIMIT_SIGPENDING on top of ucounts")

00a58a6af1c473c5 8932738fc10c4398521892adfe6
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
 4.745e+08            -1.6%  4.669e+08        stress-ng.sigsegv.ops
   7908964            -1.6%    7781343        stress-ng.sigsegv.ops_per_sec

Below is some data of results from your new branch and base.
b3ad8e1fa3fd8 ucounts: Set ucount_max to the largest positive value the typ=
e can hold  7783421.61 7794441.59 7775793.52 7773683.6 7760744.1 7757720.33
8932738fc10c4 Reimplement RLIMIT_SIGPENDING on top of ucounts              =
            7755985.06 7780646.72 7783944.12 7809090.98 7798193.32 7760202.=
59
00a58a6af1c47 Reimplement RLIMIT_MSGQUEUE on top of ucounts                =
            7940474.72 7912442.26 7879195.61 7869803.63 7912693.69 7939175.=
48
e75074781f173 selftests/resctrl: Change a few printed messages             =
            7660254.5 7676124.45 7745330.79 7736754.88 7716834.93 7660143.13
87f1c20e2effd Documentation: kselftest: fix path to test module files      =
            7729609.16 7726906.92 7760819.26
06bd03a57f8c2 selftests/resctrl: Fix MBA/MBM results reporting format      =
            7692866.06 7730606.11 7681414.48
a38fd87484648 Linux 5.12-rc2                                               =
            7724932.06 =


 =

> > please be noted, sorry to say, due to various reasons, it will be a
> > big challenge for us to capture each version of a patch set.
> > =

> > e.g. we didn't make out a similar performance regression for
> > v8/v9 version of this one..
> > =

> > > =

> > > So it seems we are finally pretty much at correct code in need
> > > of performance tuning.
> > > =

> > > > I *think* this test may be testing "send so many signals that it
> > > > triggers the signal queue overflow case".
> > > >
> > > > And I *think* that the performance degradation may be due to lots of
> > > > unnecessary allocations, because ity looks like that commit changes
> > > > __sigqueue_alloc() to do
> > > >
> > > >         struct sigqueue *q =3D kmem_cache_alloc(sigqueue_cachep, fl=
ags);
> > > >
> > > > *before* checking the signal limit, and then if the signal limit was
> > > > exceeded, it will just be free'd instead.
> > > >
> > > > The old code would check the signal count against RLIMIT_SIGPENDING
> > > > *first*, and if there were m ore pending signals then it wouldn't do
> > > > anything at all (including not incrementing that expensive atomic
> > > > count).
> > > =

> > > This is an interesting test in a lot of ways as it is testing the
> > > synchronous signal delivery path caused by an exception.  The test
> > > is either executing *ptr =3D 0 (where ptr points to a read-only page)
> > > or it executes an x86 instruction that is excessively long.
> > > =

> > > I have found the code but I haven't figured out how it is being
> > > called yet.  The core loop is just:
> > > 	for(;;) {
> > > 		sigaction(SIGSEGV, &action, NULL);
> > > 		sigaction(SIGILL, &action, NULL);
> > > 		sigaction(SIGBUS, &action, NULL);
> > > =

> > > 		ret =3D sigsetjmp(jmp_env, 1);
> > > 		if (done())
> > >                 	break;
> > > 		if (ret) {
> > >                 	/* verify signal */
> > >                 } else {
> > >                 	*ptr =3D 0;
> > >                 }
> > > 	}
> > > =

> > > Code like that fundamentally can not be multi-threaded.  So the only =
way
> > > the sigpending limit is being hit is if there are more processes runn=
ing
> > > that code simultaneously than the size of the limit.
> > > =

> > > Further it looks like stress-ng pushes RLIMIT_SIGPENDING as high as it
> > > will go before the test starts.
> > > =

> > > =

> > > > Also, the old code was very careful to only do the "get_user()" for
> > > > the *first* signal it added to the queue, and do the "put_user()" f=
or
> > > > when removing the last signal. Exactly because those atomics are ve=
ry
> > > > expensive.
> > > >
> > > > The new code just does a lot of these atomics unconditionally.
> > > =

> > > Yes. That seems a likely culprit.
> > > =

> > > > I dunno. The profile data in there is a bit hard to read, but there=
's
> > > > a lot more cachee misses, and a *lot* of node crossers:
> > > >
> > > >>    5961544          +190.4%   17314361        perf-stat.i.cache-mi=
sses
> > > >>   22107466          +119.2%   48457656        perf-stat.i.cache-re=
ferences
> > > >>     163292 =C4=85  3%   +4582.0%    7645410        perf-stat.i.nod=
e-load-misses
> > > >>     227388 =C4=85  2%   +3708.8%    8660824        perf-stat.i.nod=
e-loads
> > > >
> > > > and (probably as a result) average instruction costs have gone up e=
normously:
> > > >
> > > >>       3.47           +66.8%       5.79        perf-stat.overall.cpi
> > > >>      22849           -65.6%       7866        perf-stat.overall.cy=
cles-between-cache-misses
> > > >
> > > > and it does seem to be at least partly about "put_ucounts()":
> > > >
> > > >>       0.00            +4.5        4.46        perf-profile.calltra=
ce.cycles-pp.put_ucounts.__sigqueue_free.get_signal.arch_do_signal_or_resta=
rt.exit_to_user_mode_prepare
> > > >
> > > > and a lot of "get_ucounts()".
> > > >
> > > > But it may also be that the new "get sigpending" is just *so* much
> > > > more expensive than it used to be.
> > > =

> > > That too is possible.
> > > =

> > > That node-load-misses number does look like something is bouncing back
> > > and forth between the nodes a lot more.  So I suspect stress-ng is
> > > running multiple copies of the sigsegv test in different processes at
> > > once.
> > > =

> > > =

> > > =

> > > That really suggests cache line ping pong from get_ucounts and
> > > incrementing sigpending.
> > > =

> > > It surprises me that obtaining the cache lines exclusively is
> > > the dominant cost on this code path but obtaining two cache lines
> > > exclusively instead of one cache cache line exclusively is consistent
> > > with a causing the exception delivery to take nearly twice as long.
> > > =

> > > For the optimization we only care about the leaf count so with a litt=
le
> > > care we can restore the optimization.  So that is probably the thing
> > > to do here.  The fewer changes to worry about the less likely to find
> > > surprises.
> > > =

> > > =

> > > =

> > > That said for this specific case there is a lot of potential room for
> > > improvement.  As this is a per thread signal the code update sigpendi=
ng
> > > in commit_cred and never worry about needing to pin the struct
> > > user_struct or struct ucounts.  As this is a synchronous signal we co=
uld
> > > skip the sigpending increment, skip the signal queue entirely, and
> > > deliver the signal to user-space immediately.  The removal of all cac=
he
> > > ping pongs might make it worth it.
> > > =

> > > There is also Thomas Gleixner's recent optimization to cache one
> > > sigqueue entry per task to give more predictable behavior.  That
> > > would remove the cost of the allocation.
> > > =

> > > Eric
> > =

> =

> -- =

> Rgrds, legion
>=20
--===============4523456886001166717==--

