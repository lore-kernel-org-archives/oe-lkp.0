Content-Type: multipart/mixed; boundary="===============3711817573009976440=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] 9597d64116d: -16.1% hackbench.throughput
Date: Tue, 18 Nov 2014 09:03:15 +0800
Message-ID: <20141118010315.GA16010@yliu-dev.sh.intel.com>
In-Reply-To: <CAKfTPtDp-8_bn=tswypKKopiGEkb4GeO=UqE2SjhwnFTCoTJRQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3711817573009976440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2014 at 03:54:19PM +0100, Vincent Guittot wrote:
> On 17 November 2014 04:44, Yuanhan Liu <yuanhan.liu@linux.intel.com> wr=
ote:
> > On Fri, Nov 14, 2014 at 01:59:51PM +0100, Vincent Guittot wrote:
> >> On 14 November 2014 04:35, Yuanhan Liu <yuanhan.liu@linux.intel.com>=
 wrote:
> >> > On Wed, Nov 12, 2014 at 03:44:34PM +0100, Vincent Guittot wrote:
> >> >> On 10 November 2014 06:54,  <lkp@01.org> wrote:
> >> >> > FYI, we noticed the below changes on
> >> >> >
> >> >> > https://git.linaro.org/people/mturquette/linux.git eas-next
> >> >> > commit 9597d64116d0d441dea32e7f5f05fa135d16f44b ("sched: replace =
capacity_factor by usage")
> >> >> >
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  testbox/testcase/te=
stparams
> >> >> > ----------------  --------------------------  -------------------=
--------
> >> >> >          %stddev     %change         %stddev
> >> >> >              \          |                \
> >> >> >     104249 =C4=85  0%     -16.1%      87436 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     104249           -16.1%      87436        GEO-MEAN hackbench.=
throughput
> >> >>
> >> >> Hi yuanhan,
> >> >>
> >> >> i understand this email as a 16% drop in hackbench performance when
> >> >> the number of group is half the number of CPUs. Is it the only test
> >> >> for which you  have seen some decreases ? where can i find the list=
 of
> >> >> tests that you have passed ?
> >> >
> >> > Sorry, the list is not accessed outside, plus, you have to run some
> >> > commands to generate the list on fly. Anyway, I checked it for you,
> >>
> >> thanks,
> >>
> >> > and we have run hackbench/performance-50%-threads-socket only on that
> >> > commit, which is reasonable in our system as we bisected once on this
> >> > issue.
> >> >
> >> > But I can run more tests(say, with 100% and 1600% cpu) on that commi=
t if
> >>
> >> yes, that would be interesting
> >>
> >> > you like, and it also would be good if you can name some of benchmar=
ks
> >> > you care most so that we can run it for you.
> >>
> >> ebizzy with a number of thread that is half the number of CPU is a
> >> good candidate as well
> >
> > I tried ebizzy with 50% of CPU, and here is the script we used:
> >
> >     duration=3D10s
> >     iterations=3D100
> >
> >     for i in $(seq 1 $iterations)
> >     do
> >             echo Iteration: $i
> >             cmd ./ebizzy -t $nr_threads \
> >                          -S $duration
> >     done
> >
> > But we observed no performance change.
> =

> ok. thanks for the results
> =

> >
> > BTW, here is the result from the test 50/100/1600%-threads-socket
> > and 50%-ebizzy(note: only changes are listed here):
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  testbox/testcase/testpara=
ms
> > ----------------  --------------------------  -------------------------=
--
> >          %stddev     %change         %stddev
> >              \          |                \
> >     186758 =C2=B1  8%     -19.1%     151079 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >     104249 =C2=B1  0%     -16.1%      87436 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     139533           -17.6%     114934        GEO-MEAN hackbench.throug=
hput
> =

> based on the note above : only changes are listed here, can i assume
> that there is no change for 1600% ?

Yep.

	--yliu
> =

> Thanks for the results, i'm going to look more deeply the details value b=
elow
> =

> Vincent
> =

> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     340536 =C2=B1 25%     -77.7%      75915 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >     340536           -77.7%      75915        GEO-MEAN sched_debug.cpu#=
32.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1420 =C2=B1 12%    +370.7%       6686 =C2=B1 21%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1420          +370.7%       6686        GEO-MEAN sched_debug.cpu#=
97.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.00 =C2=B1  0%  +7.4e+13%  738901.37 =C2=B1 10%  ivb42/hackbench=
/performance-100%-threads-socket
> >       0.00        +7.4e+13%  738901.37        GEO-MEAN sched_debug.cfs_=
rq[23]:/.max_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.00 =C2=B1  0%  +7.4e+13%  738901.37 =C2=B1 10%  ivb42/hackbench=
/performance-100%-threads-socket
> >       0.00        +7.4e+13%  738901.37        GEO-MEAN sched_debug.cfs_=
rq[23]:/.MIN_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >  808074.08 =C2=B1 24%    -100.0%       0.00 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >  808074.08          -100.0%       0.00        GEO-MEAN sched_debug.cfs_=
rq[10]:/.max_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >  808074.08 =C2=B1 24%    -100.0%       0.00 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >  808074.08          -100.0%       0.00        GEO-MEAN sched_debug.cfs_=
rq[10]:/.MIN_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     360093 =C2=B1 31%     -78.1%      78716 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >     360093           -78.1%      78716        GEO-MEAN sched_debug.cpu#=
7.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.00 =C2=B1  0%  +7.7e+13%  770048.71 =C2=B1 43%  ivb42/hackbench=
/performance-100%-threads-socket
> >       0.00        +7.7e+13%  770048.71        GEO-MEAN sched_debug.cfs_=
rq[6]:/.max_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.00 =C2=B1  0%  +7.7e+13%  770048.71 =C2=B1 43%  ivb42/hackbench=
/performance-100%-threads-socket
> >       0.00        +7.7e+13%  770048.71        GEO-MEAN sched_debug.cfs_=
rq[6]:/.MIN_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     358961 =C2=B1 38%     -73.5%      95026 =C2=B1 17%  ivb42/hackbench=
/performance-100%-threads-socket
> >     358961           -73.5%      95026        GEO-MEAN sched_debug.cpu#=
24.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.88 =C2=B1 25%    +209.7%       2.74 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >       0.88          +209.7%       2.74        GEO-MEAN perf-profile.cpu=
-cycles.ttwu_do_activate.constprop.87.sched_ttwu_pending.scheduler_ipi.smp_=
reschedule_interrupt.reschedule_interrupt
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3276492 =C2=B1  5%     +15.5%    3784016 =C2=B1  8%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3276492           +15.5%    3784016        GEO-MEAN sched_debug.cfs_=
rq[35]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         57 =C2=B1 29%     -50.6%         28 =C2=B1 29%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         57           -50.6%         28        GEO-MEAN sched_debug.cpu#=
22.nr_uninterruptible
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3387494 =C2=B1  6%     +16.9%    3960647 =C2=B1  7%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3387494           +16.9%    3960647        GEO-MEAN sched_debug.cfs_=
rq[33]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3335586 =C2=B1  3%     +22.0%    4070327 =C2=B1  8%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3335586           +22.0%    4070327        GEO-MEAN sched_debug.cfs_=
rq[34]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3230592 =C2=B1  8%     +14.9%    3712705 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3230592           +14.9%    3712705        GEO-MEAN sched_debug.cfs_=
rq[30]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     323284 =C2=B1 30%     -74.7%      81724 =C2=B1 21%  ivb42/hackbench=
/performance-100%-threads-socket
> >     323284           -74.7%      81723        GEO-MEAN sched_debug.cpu#=
31.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3155171 =C2=B1  2%     +19.0%    3753143 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3155171           +19.0%    3753143        GEO-MEAN sched_debug.cfs_=
rq[31]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1524 =C2=B1 16%    +253.1%       5383 =C2=B1 25%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1524          +253.1%       5383        GEO-MEAN sched_debug.cpu#=
94.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1304331 =C2=B1 11%     +49.2%    1946271 =C2=B1 13%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1304331           +49.2%    1946271        GEO-MEAN sched_debug.cfs_=
rq[11]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2877453 =C2=B1  6%     +25.4%    3608032 =C2=B1  6%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2877453           +25.4%    3608032        GEO-MEAN sched_debug.cfs_=
rq[26]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3170186 =C2=B1 12%     +20.8%    3830642 =C2=B1  8%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3170186           +20.8%    3830642        GEO-MEAN sched_debug.cfs_=
rq[41]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3100432 =C2=B1 12%     +22.4%    3793805 =C2=B1  6%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3100432           +22.4%    3793805        GEO-MEAN sched_debug.cfs_=
rq[37]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3116277 =C2=B1  7%     +13.2%    3527174 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3116277           +13.2%    3527174        GEO-MEAN sched_debug.cfs_=
rq[29]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         71 =C2=B1 35%     -69.0%         22 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         71           -69.0%         22        GEO-MEAN sched_debug.cfs_=
rq[24]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2069 =C2=B1  8%    +257.0%       7388 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2069          +257.0%       7388        GEO-MEAN sched_debug.cpu#=
71.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2820456 =C2=B1  4%     +23.4%    3479484 =C2=B1  7%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2820456           +23.4%    3479484        GEO-MEAN sched_debug.cfs_=
rq[27]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.76 =C2=B1 26%    +209.2%       2.36 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >       0.76          +209.2%       2.36        GEO-MEAN perf-profile.cpu=
-cycles.activate_task.ttwu_do_activate.sched_ttwu_pending.scheduler_ipi.smp=
_reschedule_interrupt
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.76 =C2=B1 26%    +210.6%       2.35 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >       0.76          +210.6%       2.35        GEO-MEAN perf-profile.cpu=
-cycles.enqueue_task.activate_task.ttwu_do_activate.sched_ttwu_pending.sche=
duler_ipi
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2095 =C2=B1 47%    +153.6%       5314 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2095          +153.6%       5314        GEO-MEAN sched_debug.cpu#=
93.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2329483 =C2=B1 18%     -66.1%     788636 =C2=B1 23%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    3321870 =C2=B1  7%     +14.8%    3811901 =C2=B1  7%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2781769           -37.7%    1733841        GEO-MEAN sched_debug.cfs_=
rq[47]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1008818 =C2=B1 20%     +70.9%    1724167 =C2=B1 14%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1008818           +70.9%    1724167        GEO-MEAN sched_debug.cfs_=
rq[6]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.70 =C2=B1 25%    +203.1%       2.13 =C2=B1  6%  ivb42/hackbench=
/performance-50%-threads-socket
> >       0.70          +203.1%       2.13        GEO-MEAN perf-profile.cpu=
-cycles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.sched=
_ttwu_pending
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     243252 =C2=B1 46%    +242.5%     833240 =C2=B1 42%  ivb42/hackbench=
/performance-50%-threads-socket
> >     243252          +242.5%     833240        GEO-MEAN sched_debug.cfs_=
rq[2]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         78 =C2=B1 27%    +171.4%        211 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         78          +171.4%        211        GEO-MEAN sched_debug.cfs_=
rq[17]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6805 =C2=B1  7%    +211.4%      21195 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       6805          +211.4%      21195        GEO-MEAN sched_debug.cpu#=
97.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     915637 =C2=B1 16%     +93.4%    1771080 =C2=B1 18%  ivb42/hackbench=
/performance-50%-threads-socket
> >     915637           +93.4%    1771080        GEO-MEAN sched_debug.cfs_=
rq[7]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2231 =C2=B1 11%    +227.0%       7298 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2231          +227.0%       7298        GEO-MEAN sched_debug.cpu#=
68.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1374284 =C2=B1 42%     +63.3%    2243578 =C2=B1 23%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1374284           +63.3%    2243578        GEO-MEAN sched_debug.cfs_=
rq[42]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2958 =C2=B1  9%    +196.1%       8759 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2958          +196.1%       8759        GEO-MEAN sched_debug.cpu#=
97.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         11 =C2=B1 36%     -64.7%          4 =C2=B1 20%  ivb42/hackbench=
/performance-100%-threads-socket
> >         11           -64.7%          4        GEO-MEAN sched_debug.cpu#=
16.nr_uninterruptible
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1128380 =C2=B1 24%     +67.1%    1886076 =C2=B1 15%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1128380           +67.1%    1886076        GEO-MEAN sched_debug.cfs_=
rq[8]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     311556 =C2=B1 28%     -82.5%      54597 =C2=B1 41%  ivb42/hackbench=
/performance-100%-threads-socket
> >      35577 =C2=B1 20%     +42.9%      50840 =C2=B1 15%  ivb42/hackbench=
/performance-50%-threads-socket
> >     105282           -50.0%      52685        GEO-MEAN sched_debug.cpu#=
11.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2115 =C2=B1 40%    +228.2%       6943 =C2=B1 39%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2115          +228.2%       6943        GEO-MEAN sched_debug.cpu#=
100.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1663 =C2=B1 14%    +193.5%       4882 =C2=B1 26%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1663          +193.5%       4882        GEO-MEAN sched_debug.cpu#=
117.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1605 =C2=B1 18%    +248.8%       5598 =C2=B1 35%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1605          +248.8%       5598        GEO-MEAN sched_debug.cpu#=
105.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1357971 =C2=B1 14%     +41.3%    1918898 =C2=B1  9%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1357971           +41.3%    1918898        GEO-MEAN sched_debug.cfs_=
rq[9]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9696 =C2=B1 26%    +159.1%      25126 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9696          +159.1%      25126        GEO-MEAN sched_debug.cpu#=
94.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3341263 =C2=B1 11%     +20.3%    4019480 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3341263           +20.3%    4019480        GEO-MEAN sched_debug.cfs_=
rq[45]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1590814 =C2=B1 37%     -47.3%     837986 =C2=B1 20%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    2845181 =C2=B1 10%     +25.9%    3581780 =C2=B1  9%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2127476           -18.6%    1732478        GEO-MEAN sched_debug.cfs_=
rq[40]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     683813 =C2=B1  7%     -21.3%     538426 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     683813           -21.3%     538426        GEO-MEAN sched_debug.cpu#=
46.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      11733 =C2=B1 31%    +150.3%      29364 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      11733          +150.3%      29364        GEO-MEAN sched_debug.cpu#=
100.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7947 =C2=B1 11%    +220.2%      25445 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7947          +220.2%      25445        GEO-MEAN sched_debug.cpu#=
102.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     324927 =C2=B1 17%     -80.7%      62808 =C2=B1 12%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1019932 =C2=B1 15%     -19.9%     817432 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     575677           -60.6%     226586        GEO-MEAN sched_debug.cpu#=
9.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     335420 =C2=B1 27%     -75.9%      80856 =C2=B1 35%  ivb42/hackbench=
/performance-100%-threads-socket
> >    2006305 =C2=B1 16%     +21.8%    2443697 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     820339           -45.8%     444510        GEO-MEAN sched_debug.cpu#=
34.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.05 =C2=B1 42%     -75.5%       0.50 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >       3.76 =C2=B1 15%     -48.7%       1.93 =C2=B1 42%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       2.78           -64.5%       0.99        GEO-MEAN perf-profile.cpu=
-cycles.unix_destruct_scm.skb_release_all.consume_skb.unix_stream_recvmsg.s=
ock_aio_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3311434 =C2=B1  8%     +19.3%    3950522 =C2=B1 12%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3311434           +19.3%    3950522        GEO-MEAN sched_debug.cfs_=
rq[46]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     699300 =C2=B1  3%     -19.5%     562724 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     328558 =C2=B1 33%     -78.1%      71849 =C2=B1 27%  ivb42/hackbench=
/performance-100%-threads-socket
> >     479333           -58.1%     201075        GEO-MEAN sched_debug.cpu#=
26.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     824608 =C2=B1  2%     -19.2%     666616 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     824608           -19.2%     666616        GEO-MEAN sched_debug.cpu#=
23.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         15 =C2=B1 25%    +260.0%         54 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         15          +260.0%         54        GEO-MEAN sched_debug.cfs_=
rq[90]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2085 =C2=B1  8%    +248.2%       7260 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2085          +248.2%       7260        GEO-MEAN sched_debug.cpu#=
72.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3043317 =C2=B1  9%     +25.3%    3814417 =C2=B1 13%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3043317           +25.3%    3814417        GEO-MEAN sched_debug.cfs_=
rq[38]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     762721 =C2=B1  1%     -14.5%     652458 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     318111 =C2=B1 31%     -80.9%      60809 =C2=B1 32%  ivb42/hackbench=
/performance-100%-threads-socket
> >     492575           -59.6%     199187        GEO-MEAN sched_debug.cpu#=
2.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     763331 =C2=B1  2%     -10.9%     679883 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     311279 =C2=B1 32%     -80.1%      62076 =C2=B1 37%  ivb42/hackbench=
/performance-100%-threads-socket
> >     487451           -57.9%     205437        GEO-MEAN sched_debug.cpu#=
4.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     647286 =C2=B1  7%     -12.3%     567405 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     347686 =C2=B1 30%     -78.8%      73643 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >     474396           -56.9%     204415        GEO-MEAN sched_debug.cpu#=
35.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     637961 =C2=B1  7%     -13.2%     553592 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     359647 =C2=B1 29%     -79.8%      72691 =C2=B1 21%  ivb42/hackbench=
/performance-100%-threads-socket
> >     479000           -58.1%     200602        GEO-MEAN sched_debug.cpu#=
33.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     755170 =C2=B1  2%     -10.6%     674786 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     348991 =C2=B1 32%     -77.3%      79313 =C2=B1 38%  ivb42/hackbench=
/performance-100%-threads-socket
> >     513369           -54.9%     231342        GEO-MEAN sched_debug.cpu#=
10.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     289530 =C2=B1 21%     -76.4%      68398 =C2=B1 10%  ivb42/hackbench=
/performance-100%-threads-socket
> >     868862 =C2=B1 13%     +24.0%    1077186 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     501559           -45.9%     271435        GEO-MEAN sched_debug.cpu#=
1.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10651 =C2=B1 37%    +132.5%      24769 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10651          +132.5%      24769        GEO-MEAN sched_debug.cpu#=
103.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3234028 =C2=B1  9%     +15.2%    3724307 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3234028           +15.2%    3724307        GEO-MEAN sched_debug.cfs_=
rq[39]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         92 =C2=B1 23%    +152.9%        232 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         92          +152.9%        232        GEO-MEAN sched_debug.cfs_=
rq[17]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     801963 =C2=B1  4%     -24.0%     609711 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     801963           -24.0%     609711        GEO-MEAN sched_debug.cpu#=
19.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2896486 =C2=B1  7%     +19.6%    3463508 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2896486           +19.6%    3463508        GEO-MEAN sched_debug.cfs_=
rq[25]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2372 =C2=B1 27%    +213.7%       7442 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2372          +213.7%       7442        GEO-MEAN sched_debug.cpu#=
118.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     718225 =C2=B1  3%      -8.6%     656214 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     329552 =C2=B1 25%     -75.6%      80488 =C2=B1 26%  ivb42/hackbench=
/performance-100%-threads-socket
> >     486510           -52.8%     229820        GEO-MEAN sched_debug.cpu#=
3.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     641106 =C2=B1  3%     -21.5%     503105 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     641106           -21.5%     503105        GEO-MEAN sched_debug.cpu#=
45.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1629 =C2=B1  8%    +218.9%       5194 =C2=B1 40%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1629          +218.9%       5194        GEO-MEAN sched_debug.cpu#=
112.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4992 =C2=B1 11%    +217.0%      15828 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4992          +217.0%      15828        GEO-MEAN sched_debug.cpu#=
89.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1560 =C2=B1 15%    +225.9%       5085 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1560          +225.9%       5085        GEO-MEAN sched_debug.cpu#=
102.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10025 =C2=B1 31%    +187.4%      28813 =C2=B1 33%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10025          +187.4%      28812        GEO-MEAN sched_debug.cpu#=
95.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      11381 =C2=B1 11%    +203.5%      34548 =C2=B1  2%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      11381          +203.5%      34548        GEO-MEAN sched_debug.cpu#=
89.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     658371 =C2=B1  2%     -22.4%     510864 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     349779 =C2=B1 26%     -74.9%      87948 =C2=B1 22%  ivb42/hackbench=
/performance-100%-threads-socket
> >     479879           -55.8%     211966        GEO-MEAN sched_debug.cpu#=
30.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     715056 =C2=B1  2%      -9.2%     649573 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     304375 =C2=B1 24%     -78.2%      66392 =C2=B1 21%  ivb42/hackbench=
/performance-100%-threads-socket
> >     466524           -55.5%     207669        GEO-MEAN sched_debug.cpu#=
8.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     645934 =C2=B1  3%     -10.7%     576615 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     358510 =C2=B1 34%     -74.3%      92018 =C2=B1 15%  ivb42/hackbench=
/performance-100%-threads-socket
> >     481221           -52.1%     230346        GEO-MEAN sched_debug.cpu#=
29.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         59 =C2=B1 41%     +71.8%        101 =C2=B1 21%  ivb42/hackbench=
/performance-100%-threads-socket
> >         59           +71.8%        101        GEO-MEAN sched_debug.cfs_=
rq[32]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2523 =C2=B1 27%    +177.2%       6996 =C2=B1 25%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2523          +177.2%       6996        GEO-MEAN sched_debug.cpu#=
63.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2236 =C2=B1  9%    +171.5%       6070 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2236          +171.5%       6070        GEO-MEAN sched_debug.cpu#=
73.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7994 =C2=B1 13%    +160.1%      20794 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7994          +160.1%      20794        GEO-MEAN sched_debug.cpu#=
71.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1 10%    +133.3%         30 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13          +133.3%         30        GEO-MEAN sched_debug.cfs_=
rq[17]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10252 =C2=B1 42%    +102.7%      20784 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10252          +102.7%      20783        GEO-MEAN sched_debug.cpu#=
65.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8236 =C2=B1 23%    +121.3%      18224 =C2=B1 15%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8236          +121.3%      18224        GEO-MEAN sched_debug.cpu#=
93.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1783 =C2=B1 14%    +204.8%       5435 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1783          +204.8%       5435        GEO-MEAN sched_debug.cpu#=
103.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7354 =C2=B1  9%    +149.2%      18329 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7354          +149.2%      18329        GEO-MEAN sched_debug.cpu#=
94.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3993 =C2=B1 19%    +162.6%      10485 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3993          +162.6%      10485        GEO-MEAN sched_debug.cpu#=
72.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12300 =C2=B1 21%    +146.6%      30332 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12300          +146.6%      30332        GEO-MEAN sched_debug.cpu#=
118.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7527 =C2=B1 10%    +152.1%      18978 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7527          +152.1%      18978        GEO-MEAN sched_debug.cpu#=
117.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     687894 =C2=B1  3%     -13.8%     592946 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     382098 =C2=B1 33%     -80.0%      76426 =C2=B1 21%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1658515 =C2=B1 17%     +42.3%    2360101 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     758237           -37.4%     474675        GEO-MEAN sched_debug.cpu#=
27.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      11102 =C2=B1 42%     +98.6%      22048 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      11102           +98.6%      22048        GEO-MEAN sched_debug.cpu#=
73.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4059 =C2=B1 15%    +165.4%      10773 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4059          +165.4%      10773        GEO-MEAN sched_debug.cpu#=
71.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3328 =C2=B1 28%     -42.3%       1920 =C2=B1 39%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       3328           -42.3%       1920        GEO-MEAN sched_debug.cfs_=
rq[14]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1671 =C2=B1 15%    +286.3%       6455 =C2=B1 48%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1671          +286.3%       6455        GEO-MEAN sched_debug.cpu#=
95.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3956 =C2=B1 10%     -26.7%       2898 =C2=B1  3%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      77244 =C2=B1 16%     -69.0%      23916 =C2=B1 38%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      17481           -52.4%       8325        GEO-MEAN sched_debug.cpu#=
37.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2559 =C2=B1 46%    +139.7%       6134 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2559          +139.7%       6134        GEO-MEAN sched_debug.cpu#=
60.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     741796 =C2=B1  2%     -16.7%     618285 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     309425 =C2=B1 23%     -79.2%      64385 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >     738410 =C2=B1 14%     +46.7%    1082966 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     553409           -36.6%     350641        GEO-MEAN sched_debug.cpu#=
6.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10088 =C2=B1 27%    +143.3%      24541 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10088          +143.3%      24541        GEO-MEAN sched_debug.cpu#=
117.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8180 =C2=B1 20%    +169.7%      22064 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8180          +169.7%      22063        GEO-MEAN sched_debug.cpu#=
100.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2061 =C2=B1 15%    +122.1%       4577 =C2=B1 25%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2061          +122.1%       4577        GEO-MEAN sched_debug.cpu#=
113.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3854 =C2=B1  6%     -27.4%       2796 =C2=B1  3%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      83004 =C2=B1 23%     -60.4%      32834 =C2=B1 42%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      17887           -46.4%       9582        GEO-MEAN sched_debug.cpu#=
39.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9201 =C2=B1 12%    +164.6%      24347 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9201          +164.6%      24347        GEO-MEAN sched_debug.cpu#=
118.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        131 =C2=B1 27%     -63.5%         48 =C2=B1 36%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        131           -63.5%         48        GEO-MEAN sched_debug.cpu#=
26.nr_uninterruptible
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     321515 =C2=B1 38%     -75.1%      79944 =C2=B1 23%  ivb42/hackbench=
/performance-100%-threads-socket
> >     969764 =C2=B1 14%     +27.3%    1234187 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     558385           -43.7%     314112        GEO-MEAN sched_debug.cpu#=
0.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      13938 =C2=B1 39%     +73.4%      24172 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      13938           +73.4%      24172        GEO-MEAN sched_debug.cpu#=
64.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     674402 =C2=B1  4%     -20.0%     539774 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     674402           -20.0%     539773        GEO-MEAN sched_debug.cpu#=
41.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     838140 =C2=B1  2%     -22.0%     653719 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     991119 =C2=B1 21%     +29.7%    1285398 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     911425            +0.6%     916673        GEO-MEAN sched_debug.cpu#=
17.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7748 =C2=B1 15%    +158.6%      20041 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7748          +158.6%      20041        GEO-MEAN sched_debug.cpu#=
105.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7467 =C2=B1 10%    +174.0%      20458 =C2=B1 29%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7467          +174.0%      20458        GEO-MEAN sched_debug.cpu#=
95.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3916 =C2=B1  9%     -28.1%       2817 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      91776 =C2=B1 12%     -64.9%      32254 =C2=B1 28%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      18959           -49.7%       9532        GEO-MEAN sched_debug.cpu#=
38.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3729 =C2=B1 26%     +95.4%       7286 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3729           +95.4%       7286        GEO-MEAN sched_debug.cpu#=
93.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3804 =C2=B1  8%    +145.2%       9326 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3804          +145.2%       9326        GEO-MEAN sched_debug.cpu#=
73.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1737 =C2=B1 29%    +150.0%       4344 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1737          +150.0%       4344        GEO-MEAN sched_debug.cpu#=
90.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12302 =C2=B1 25%     +97.6%      24308 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12302           +97.6%      24307        GEO-MEAN sched_debug.cpu#=
96.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10067 =C2=B1 40%     +92.4%      19368 =C2=B1 23%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10067           +92.4%      19368        GEO-MEAN sched_debug.cpu#=
91.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8462 =C2=B1 17%    +141.0%      20398 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8462          +141.0%      20398        GEO-MEAN sched_debug.cpu#=
68.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10319 =C2=B1 13%    +116.7%      22363 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10319          +116.7%      22363        GEO-MEAN sched_debug.cpu#=
113.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9187 =C2=B1 21%    +154.7%      23398 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9187          +154.7%      23398        GEO-MEAN sched_debug.cpu#=
71.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7161 =C2=B1  9%    +154.0%      18188 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7161          +154.0%      18188        GEO-MEAN sched_debug.cpu#=
102.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1 14%    +122.7%         32 =C2=B1 21%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14          +122.7%         32        GEO-MEAN sched_debug.cpu#=
17.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9525 =C2=B1 29%    +122.7%      21212 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9525          +122.7%      21212        GEO-MEAN sched_debug.cpu#=
60.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3352 =C2=B1  7%    +118.5%       7324 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3352          +118.5%       7324        GEO-MEAN sched_debug.cpu#=
94.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8128 =C2=B1  7%    +148.8%      20226 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8128          +148.8%      20226        GEO-MEAN sched_debug.cpu#=
72.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2219 =C2=B1 13%    +172.1%       6040 =C2=B1 32%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2219          +172.1%       6040        GEO-MEAN sched_debug.cpu#=
61.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8669 =C2=B1  6%    +111.2%      18311 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8669          +111.2%      18311        GEO-MEAN sched_debug.cpu#=
113.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.94 =C2=B1 32%     -54.5%       0.88 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       1.94           -54.5%       0.88        GEO-MEAN perf-profile.cpu=
-cycles.finish_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write=
.do_sync_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14243 =C2=B1 39%     +68.8%      24044 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      14243           +68.8%      24044        GEO-MEAN sched_debug.cpu#=
106.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9743 =C2=B1 26%    +152.1%      24562 =C2=B1 21%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9743          +152.1%      24562        GEO-MEAN sched_debug.cpu#=
105.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3127 =C2=B1 42%    +142.2%       7574 =C2=B1 33%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3127          +142.2%       7574        GEO-MEAN sched_debug.cpu#=
64.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2687 =C2=B1 20%     -51.4%       1304 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     652448 =C2=B1 29%     +97.5%    1288375 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      41871            -2.1%      41000        GEO-MEAN sched_debug.cpu#=
26.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12052 =C2=B1 43%    +128.7%      27562 =C2=B1 43%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12052          +128.7%      27562        GEO-MEAN sched_debug.cpu#=
111.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1725 =C2=B1 17%    +170.8%       4672 =C2=B1 30%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1725          +170.8%       4672        GEO-MEAN sched_debug.cpu#=
109.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4343 =C2=B1 21%    +142.1%      10513 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4343          +142.1%      10512        GEO-MEAN sched_debug.cpu#=
68.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     104282 =C2=B1 12%     -66.4%      35064 =C2=B1 39%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   17116572 =C2=B1 11%     +59.5%   27297076 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30485250 =C2=B1  0%     -16.9%   25323543 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3789417           -23.6%    2894014        GEO-MEAN sched_debug.cpu#=
30.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7944 =C2=B1  5%    +146.0%      19544 =C2=B1 23%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7944          +146.0%      19544        GEO-MEAN sched_debug.cpu#=
112.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7955 =C2=B1  7%    +138.7%      18986 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7955          +138.7%      18986        GEO-MEAN sched_debug.cpu#=
103.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     666391 =C2=B1  1%     -10.6%     595956 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     318210 =C2=B1 25%     -71.4%      91037 =C2=B1 21%  ivb42/hackbench=
/performance-100%-threads-socket
> >    2209362 =C2=B1 26%     -32.0%    1502193 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     776670           -44.2%     433564        GEO-MEAN sched_debug.cpu#=
28.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2893 =C2=B1 37%    +118.0%       6307 =C2=B1 29%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2893          +118.0%       6307        GEO-MEAN sched_debug.cpu#=
96.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14287 =C2=B1 35%    +100.8%      28694 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      14287          +100.8%      28694        GEO-MEAN sched_debug.cpu#=
99.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     675773 =C2=B1 26%     +90.6%    1287832 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >     675773           +90.6%    1287832        GEO-MEAN sched_debug.cpu#=
30.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4137 =C2=B1 32%    +127.3%       9402 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4137          +127.3%       9402        GEO-MEAN sched_debug.cpu#=
60.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        337 =C2=B1 24%     +37.2%        463 =C2=B1 12%  ivb42/hackbench=
/performance-100%-threads-socket
> >        337           +37.2%        463        GEO-MEAN numa-vmstat.node=
0.nr_inactive_anon
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      51208 =C2=B1  3%    +124.9%     115155 =C2=B1  2%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      51208          +124.9%     115155        GEO-MEAN sched_debug.cpu#=
89.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      11401 =C2=B1 34%    +130.6%      26290 =C2=B1 25%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      11401          +130.6%      26289        GEO-MEAN sched_debug.cpu#=
90.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2028 =C2=B1 31%    +164.0%       5355 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2028          +164.0%       5354        GEO-MEAN sched_debug.cpu#=
65.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         94 =C2=B1 12%     -50.4%         47 =C2=B1 32%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         94           -50.4%         46        GEO-MEAN sched_debug.cpu#=
3.nr_uninterruptible
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     742428 =C2=B1  1%      -9.6%     671471 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     333691 =C2=B1 28%     -76.4%      78910 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1024709 =C2=B1 18%     -25.3%     765836 =C2=B1 18%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     633189           -45.7%     343635        GEO-MEAN sched_debug.cpu#=
5.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      52076 =C2=B1  3%    +121.7%     115435 =C2=B1  2%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      52076          +121.7%     115435        GEO-MEAN sched_debug.cpu#=
89.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3972 =C2=B1  5%     -30.6%       2755 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2831 =C2=B1 27%     +74.9%       4954 =C2=B1 24%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     873871 =C2=B1 33%     +47.0%    1284286 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      79678 =C2=B1 34%     -64.1%      28635 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      29748           -10.5%      26617        GEO-MEAN sched_debug.cpu#=
36.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10975 =C2=B1 41%    +124.1%      24599 =C2=B1 33%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10975          +124.1%      24599        GEO-MEAN sched_debug.cpu#=
61.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     674586 =C2=B1 26%     +88.0%    1268103 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >     674586           +88.0%    1268103        GEO-MEAN sched_debug.cpu#=
29.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3726 =C2=B1 23%    +144.9%       9124 =C2=B1 31%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3726          +144.9%       9124        GEO-MEAN sched_debug.cpu#=
100.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     680865 =C2=B1 26%     +86.2%    1267993 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >     680865           +86.2%    1267993        GEO-MEAN sched_debug.cpu#=
25.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2244 =C2=B1 10%    +125.4%       5058 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2244          +125.4%       5058        GEO-MEAN sched_debug.cpu#=
119.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1974 =C2=B1 34%     +83.1%       3614 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1974           +83.1%       3614        GEO-MEAN sched_debug.cpu#=
115.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9839 =C2=B1 17%    +109.4%      20599 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9838          +109.4%      20598        GEO-MEAN sched_debug.cpu#=
96.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8190 =C2=B1  8%    +119.8%      18004 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8190          +119.8%      18004        GEO-MEAN sched_debug.cpu#=
73.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12965 =C2=B1 37%     +67.3%      21693 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12965           +67.3%      21693        GEO-MEAN sched_debug.cpu#=
109.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         78 =C2=B1 31%     +55.1%        122 =C2=B1 17%  ivb42/hackbench=
/performance-100%-threads-socket
> >         78           +55.1%        122        GEO-MEAN sched_debug.cfs_=
rq[32]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     640509 =C2=B1  6%     -10.4%     573818 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     303671 =C2=B1 24%     -69.4%      92852 =C2=B1 19%  ivb42/hackbench=
/performance-100%-threads-socket
> >     441026           -47.7%     230825        GEO-MEAN sched_debug.cpu#=
25.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         28 =C2=B1  2%     -51.2%         13 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         27           -51.2%         13        GEO-MEAN sched_debug.cpu#=
44.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  7%     -50.0%         13 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -50.0%         13        GEO-MEAN sched_debug.cfs_=
rq[44]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  8%     -50.6%         13 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         27           -50.6%         13        GEO-MEAN sched_debug.cfs_=
rq[44]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  6%     -50.0%         13 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         27           -50.0%         13        GEO-MEAN sched_debug.cpu#=
44.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3868 =C2=B1 33%    +126.0%       8740 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3868          +126.0%       8740        GEO-MEAN sched_debug.cpu#=
65.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4.31 =C2=B1 35%     -60.0%       1.73 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >       4.95 =C2=B1 14%     -43.7%       2.79 =C2=B1 37%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       4.62           -52.5%       2.19        GEO-MEAN perf-profile.cpu=
-cycles.copy_user_enhanced_fast_string.skb_copy_datagram_iovec.unix_stream_=
recvmsg.sock_aio_read.sock_aio_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3497 =C2=B1  9%    +117.2%       7598 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3497          +117.2%       7598        GEO-MEAN sched_debug.cpu#=
103.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3266 =C2=B1 11%    +102.4%       6611 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3266          +102.4%       6611        GEO-MEAN sched_debug.cpu#=
117.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10902 =C2=B1 21%    +153.2%      27605 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10902          +153.2%      27605        GEO-MEAN sched_debug.cpu#=
97.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2039 =C2=B1 32%     +89.0%       3855 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2039           +89.0%       3855        GEO-MEAN sched_debug.cpu#=
101.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3387 =C2=B1 13%    +148.0%       8401 =C2=B1 36%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3387          +148.0%       8401        GEO-MEAN sched_debug.cpu#=
95.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4839 =C2=B1 31%    +126.0%      10939 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4839          +126.0%      10939        GEO-MEAN sched_debug.cpu#=
64.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4041 =C2=B1 38%    +184.1%      11482 =C2=B1 32%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     875043 =C2=B1  2%     -10.0%     787246 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      59467           +59.9%      95075        GEO-MEAN sched_debug.cpu#=
34.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7706 =C2=B1 14%    +115.5%      16604 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7706          +115.5%      16604        GEO-MEAN sched_debug.cpu#=
90.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12855 =C2=B1 30%     +67.5%      21531 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      12855           +67.5%      21531        GEO-MEAN softirqs.HRTIMER
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4317 =C2=B1 16%    +119.8%       9490 =C2=B1 21%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4317          +119.8%       9490        GEO-MEAN sched_debug.cpu#=
61.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        110 =C2=B1 27%     +67.9%        184 =C2=B1 19%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        110           +67.9%        184        GEO-MEAN sched_debug.cfs_=
rq[22]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8104 =C2=B1 16%     +90.8%      15464 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8104           +90.8%      15464        GEO-MEAN sched_debug.cpu#=
101.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2328798 =C2=B1 10%     -62.2%     880977 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    1109100 =C2=B1 25%     +53.9%    1707190 =C2=B1 16%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1607131           -23.7%    1226375        GEO-MEAN sched_debug.cfs_=
rq[15]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8172 =C2=B1 10%    +123.8%      18287 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8172          +123.8%      18287        GEO-MEAN sched_debug.cpu#=
109.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4915 =C2=B1 14%     -31.2%       3380 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     890704 =C2=B1 36%     +51.7%    1351140 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      95322 =C2=B1 16%     -59.1%      39011 =C2=B1 24%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      74731           -24.7%      56273        GEO-MEAN sched_debug.cpu#=
46.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4476 =C2=B1 15%    +131.1%      10345 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4476          +131.1%      10345        GEO-MEAN sched_debug.cpu#=
63.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12953 =C2=B1 33%     +65.1%      21382 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12953           +65.1%      21382        GEO-MEAN sched_debug.cpu#=
107.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4005 =C2=B1  9%     -21.4%       3147 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     882034 =C2=B1 33%     +46.5%    1292381 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      91195 =C2=B1 14%     -66.2%      30860 =C2=B1 23%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      68554           -27.0%      50072        GEO-MEAN sched_debug.cpu#=
44.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        107 =C2=B1 36%    +123.9%        240 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         98 =C2=B1 36%     -49.1%         50 =C2=B1 34%  ivb42/hackbench=
/performance-50%-threads-socket
> >        102            +6.8%        109        GEO-MEAN sched_debug.cfs_=
rq[18]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8604 =C2=B1 14%     +89.6%      16312 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8603           +89.6%      16312        GEO-MEAN sched_debug.cpu#=
115.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3129 =C2=B1 28%    +114.4%       6710 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3129          +114.4%       6710        GEO-MEAN sched_debug.cpu#=
74.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2156 =C2=B1 29%     +95.4%       4214 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2156           +95.4%       4214        GEO-MEAN sched_debug.cpu#=
110.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8779 =C2=B1 30%    +103.3%      17847 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8779          +103.3%      17847        GEO-MEAN sched_debug.cpu#=
60.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12004 =C2=B1 21%    +108.9%      25079 =C2=B1 27%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12004          +108.9%      25079        GEO-MEAN sched_debug.cpu#=
93.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      13436 =C2=B1 29%    +104.9%      27528 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      13436          +104.9%      27528        GEO-MEAN sched_debug.cpu#=
92.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10222 =C2=B1 20%    +150.2%      25577 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10222          +150.2%      25577        GEO-MEAN sched_debug.cpu#=
72.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8816 =C2=B1 15%    +104.3%      18014 =C2=B1 21%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8816          +104.3%      18014        GEO-MEAN sched_debug.cpu#=
61.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3264 =C2=B1 13%    +120.0%       7182 =C2=B1 27%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3263          +120.0%       7182        GEO-MEAN sched_debug.cpu#=
105.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2479 =C2=B1 17%    +133.9%       5799 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2479          +133.9%       5799        GEO-MEAN sched_debug.cpu#=
66.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4210 =C2=B1  4%     -31.4%       2889 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     854454 =C2=B1 35%     +47.8%    1262955 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      87160 =C2=B1 24%     -58.6%      36096 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      67938           -25.1%      50880        GEO-MEAN sched_debug.cpu#=
41.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3268 =C2=B1 11%    +122.6%       7276 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3268          +122.6%       7276        GEO-MEAN sched_debug.cpu#=
102.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7923 =C2=B1 30%    +110.7%      16696 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7923          +110.7%      16696        GEO-MEAN sched_debug.cpu#=
65.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1659 =C2=B1 14%    +140.5%       3991 =C2=B1 30%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1659          +140.5%       3991        GEO-MEAN sched_debug.cpu#=
111.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      13480 =C2=B1 39%     +61.4%      21753 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      13480           +61.4%      21753        GEO-MEAN sched_debug.cpu#=
116.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3895 =C2=B1  9%     -21.0%       3075 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     877671 =C2=B1 33%     +49.6%    1312951 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >      94555 =C2=B1 24%     -65.5%      32586 =C2=B1 17%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      68629           -25.9%      50863        GEO-MEAN sched_debug.cpu#=
45.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1 11%     -42.2%         12 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           -42.2%         12        GEO-MEAN sched_debug.cpu#=
41.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        199 =C2=B1 13%     -59.6%         80 =C2=B1 39%  ivb42/hackbench=
/performance-100%-threads-socket
> >        198           -59.6%         80        GEO-MEAN sched_debug.cfs_=
rq[29]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         11 =C2=B1 26%     +68.6%         19 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         11           +68.6%         19        GEO-MEAN sched_debug.cpu#=
23.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10700 =C2=B1 13%     +91.9%      20535 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10700           +91.9%      20535        GEO-MEAN sched_debug.cpu#=
119.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8157 =C2=B1  8%    +110.3%      17158 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8157          +110.3%      17158        GEO-MEAN sched_debug.cpu#=
111.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4428 =C2=B1 23%    +107.8%       9202 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4428          +107.8%       9202        GEO-MEAN sched_debug.cpu#=
66.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12467 =C2=B1 43%    +105.2%      25584 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12467          +105.2%      25584        GEO-MEAN sched_debug.cpu#=
91.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      11149 =C2=B1 19%    +127.4%      25350 =C2=B1 30%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      11148          +127.4%      25350        GEO-MEAN sched_debug.cpu#=
112.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2398 =C2=B1 44%    +145.4%       5885 =C2=B1 40%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2398          +145.4%       5885        GEO-MEAN sched_debug.cpu#=
99.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        124 =C2=B1 22%     +62.6%        201 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        124           +62.6%        201        GEO-MEAN sched_debug.cfs_=
rq[22]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        543 =C2=B1 12%     -42.4%        312 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        542           -42.4%        312        GEO-MEAN sched_debug.cfs_=
rq[41]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      11100 =C2=B1 35%    +113.3%      23677 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      11100          +113.3%      23677        GEO-MEAN sched_debug.cpu#=
68.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9096 =C2=B1 14%    +119.4%      19955 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9096          +119.4%      19955        GEO-MEAN sched_debug.cpu#=
63.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10347 =C2=B1 28%    +104.1%      21118 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10347          +104.1%      21118        GEO-MEAN sched_debug.cpu#=
64.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        141 =C2=B1  2%     +39.5%        196 =C2=B1 21%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         55 =C2=B1 24%    +164.8%        145 =C2=B1 24%  ivb42/hackbench=
/performance-100%-threads-socket
> >         88           +92.2%        169        GEO-MEAN sched_debug.cfs_=
rq[33]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4817 =C2=B1 15%     -30.3%       3359 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      84395 =C2=B1 33%     -65.5%      29123 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      20163           -50.9%       9891        GEO-MEAN sched_debug.cpu#=
47.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         51 =C2=B1 24%    +160.1%        132 =C2=B1 47%  ivb42/hackbench=
/performance-100%-threads-socket
> >         51          +160.1%        132        GEO-MEAN sched_debug.cfs_=
rq[7]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5109 =C2=B1 29%    +100.1%      10224 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       5109          +100.1%      10224        GEO-MEAN sched_debug.cpu#=
74.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14788 =C2=B1 12%     +92.3%      28443 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      14788           +92.3%      28443        GEO-MEAN sched_debug.cpu#=
104.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      78375 =C2=B1 26%     -60.1%      31238 =C2=B1 15%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1487380 =C2=B1  1%     -16.3%    1244520 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     341429           -42.3%     197171        GEO-MEAN sched_debug.cpu#=
23.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      75615 =C2=B1 14%     -60.8%      29648 =C2=B1 22%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1418996 =C2=B1  0%     -16.4%    1186744 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     327564           -42.7%     187577        GEO-MEAN sched_debug.cpu#=
16.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      11926 =C2=B1 12%    +101.0%      23972 =C2=B1 26%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      11926          +101.0%      23972        GEO-MEAN sched_debug.cpu#=
104.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1 17%     -45.5%         12 =C2=B1 18%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         22           -45.5%         12        GEO-MEAN sched_debug.cpu#=
41.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1 13%     -41.9%         12 =C2=B1 18%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20           -41.9%         12        GEO-MEAN sched_debug.cfs_=
rq[41]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1 13%     -41.9%         12 =C2=B1 18%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20           -41.9%         12        GEO-MEAN sched_debug.cfs_=
rq[41]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1 30%     +50.0%         21 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         13           +50.0%         21        GEO-MEAN sched_debug.cpu#=
39.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2697666 =C2=B1 25%     -42.1%    1561300 =C2=B1 38%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     923375 =C2=B1 22%     +96.3%    1812750 =C2=B1 21%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1578277            +6.6%    1682334        GEO-MEAN sched_debug.cfs_=
rq[14]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4394 =C2=B1 15%    +109.0%       9183 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4394          +109.0%       9183        GEO-MEAN sched_debug.cpu#=
118.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7129 =C2=B1 17%     -43.6%       4020 =C2=B1 16%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7129           -43.6%       4020        GEO-MEAN sched_debug.cpu#=
45.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3428 =C2=B1 10%     +96.3%       6727 =C2=B1 31%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3427           +96.3%       6727        GEO-MEAN sched_debug.cpu#=
112.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9071 =C2=B1 25%    +114.8%      19484 =C2=B1 23%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9071          +114.8%      19483        GEO-MEAN sched_debug.cpu#=
99.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      13501 =C2=B1 24%     +81.2%      24458 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      13501           +81.2%      24458        GEO-MEAN sched_debug.cpu#=
110.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4656 =C2=B1 19%     +77.9%       8286 =C2=B1 23%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4656           +77.9%       8286        GEO-MEAN sched_debug.cpu#=
96.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4101 =C2=B1  5%     -27.6%       2969 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      86361 =C2=B1 42%     -68.6%      27099 =C2=B1 17%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      18821           -52.3%       8969        GEO-MEAN sched_debug.cpu#=
43.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4195 =C2=B1 12%     -32.6%       2828 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4454 =C2=B1 27%    +113.0%       9485 =C2=B1 24%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     702933 =C2=B1 25%     +86.9%    1313646 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      23594           +39.0%      32786        GEO-MEAN sched_debug.cpu#=
34.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9428 =C2=B1 12%     +87.6%      17690 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9428           +87.6%      17690        GEO-MEAN sched_debug.cpu#=
110.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2700 =C2=B1 28%     +89.5%       5115 =C2=B1 33%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2699           +89.5%       5115        GEO-MEAN sched_debug.cpu#=
104.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  1%     -43.4%         15 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         27           -43.4%         15        GEO-MEAN sched_debug.cpu#=
44.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8665 =C2=B1  7%     +88.1%      16301 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8665           +88.1%      16301        GEO-MEAN sched_debug.cpu#=
108.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4667 =C2=B1  9%     -40.5%       2776 =C2=B1 16%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      78363 =C2=B1 16%     -60.5%      30923 =C2=B1 21%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1417611 =C2=B1  1%     -16.1%    1189420 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      80336           -41.8%      46743        GEO-MEAN sched_debug.cpu#=
14.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10055 =C2=B1 22%     +70.8%      17173 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10055           +70.8%      17173        GEO-MEAN sched_debug.cpu#=
116.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        305 =C2=B1 17%     +65.9%        507 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        305           +65.9%        507        GEO-MEAN sched_debug.cfs_=
rq[23]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1  6%     -37.7%         14 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23           -37.7%         14        GEO-MEAN sched_debug.cfs_=
rq[43]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1  7%     -41.4%         13 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23           -41.4%         13        GEO-MEAN sched_debug.cpu#=
41.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1  6%     -37.7%         14 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23           -37.7%         14        GEO-MEAN sched_debug.cfs_=
rq[43]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1 10%     -37.3%         14 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         22           -37.3%         13        GEO-MEAN sched_debug.cpu#=
45.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         96 =C2=B1 41%     -48.6%         49 =C2=B1 23%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1482 =C2=B1 17%     +87.6%       2782 =C2=B1 30%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        378            -1.8%        371        GEO-MEAN sched_debug.cfs_=
rq[4]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14015 =C2=B1 16%     +65.6%      23204 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      14014           +65.6%      23203        GEO-MEAN sched_debug.cfs_=
rq[23]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4468 =C2=B1 14%     -30.6%       3102 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     684347 =C2=B1 25%     +91.0%    1307218 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      55299           +15.2%      63680        GEO-MEAN sched_debug.cpu#=
33.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9108 =C2=B1 17%     +94.8%      17740 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9108           +94.8%      17740        GEO-MEAN sched_debug.cpu#=
66.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        119 =C2=B1 29%     +77.9%        211 =C2=B1 27%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        119           +77.9%        211        GEO-MEAN sched_debug.cfs_=
rq[21]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        121 =C2=B1 32%    +112.1%        257 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        119 =C2=B1 32%     -41.7%         69 =C2=B1 23%  ivb42/hackbench=
/performance-50%-threads-socket
> >        120           +11.2%        134        GEO-MEAN sched_debug.cfs_=
rq[18]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4506 =C2=B1 26%     +63.3%       7357 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4506           +63.3%       7357        GEO-MEAN sched_debug.cpu#=
58.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         45 =C2=B1 17%     -55.0%         20 =C2=B1 28%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         45           -55.0%         20        GEO-MEAN sched_debug.cfs_=
rq[46]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         94 =C2=B1 23%     +99.6%        187 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         94           +99.6%        187        GEO-MEAN sched_debug.cfs_=
rq[20]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         89 =C2=B1 22%     +57.8%        141 =C2=B1 32%  ivb42/hackbench=
/performance-100%-threads-socket
> >         89           +57.8%        141        GEO-MEAN sched_debug.cfs_=
rq[43]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         45 =C2=B1 39%     +91.1%         86 =C2=B1 25%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         44           +91.1%         85        GEO-MEAN sched_debug.cfs_=
rq[0]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 24%     +55.3%         19 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +55.3%         19        GEO-MEAN sched_debug.cpu#=
23.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 11%     +63.9%         19 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +63.9%         19        GEO-MEAN sched_debug.cpu#=
20.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3549 =C2=B1 12%     +79.2%       6361 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3549           +79.2%       6361        GEO-MEAN sched_debug.cpu#=
90.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10074 =C2=B1 20%     +83.0%      18438 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10073           +83.0%      18437        GEO-MEAN sched_debug.cpu#=
114.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        160 =C2=B1 18%     +51.0%        241 =C2=B1 18%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         65 =C2=B1 36%    +107.6%        136 =C2=B1 22%  ivb42/hackbench=
/performance-100%-threads-socket
> >       3368 =C2=B1 28%     -42.4%       1940 =C2=B1 39%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        328           +21.8%        399        GEO-MEAN sched_debug.cfs_=
rq[14]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14851 =C2=B1 29%     +62.6%      24151 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      14851           +62.6%      24151        GEO-MEAN sched_debug.cpu#=
119.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12294 =C2=B1 25%     +76.6%      21718 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12294           +76.6%      21717        GEO-MEAN sched_debug.cpu#=
66.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        313 =C2=B1 11%     +66.0%        519 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        312           +66.0%        519        GEO-MEAN sched_debug.cfs_=
rq[20]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        176 =C2=B1 26%     +30.1%        229 =C2=B1 16%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        100 =C2=B1  4%     -55.3%         45 =C2=B1 22%  ivb42/hackbench=
/performance-100%-threads-socket
> >       3329 =C2=B1 11%     -41.0%       1963 =C2=B1 28%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        389           -30.0%        272        GEO-MEAN sched_debug.cfs_=
rq[5]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        119 =C2=B1 35%     -40.2%         71 =C2=B1 15%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1511 =C2=B1 17%     +85.4%       2801 =C2=B1 30%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        424            +5.3%        447        GEO-MEAN sched_debug.cfs_=
rq[4]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14368 =C2=B1 11%     +65.6%      23794 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      14368           +65.6%      23794        GEO-MEAN sched_debug.cfs_=
rq[20]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         28 =C2=B1 35%     +91.4%         53 =C2=B1 44%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         27           +91.4%         53        GEO-MEAN sched_debug.cfs_=
rq[39]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2121 =C2=B1  8%     -29.9%       1487 =C2=B1 32%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     674766 =C2=B1 29%     +84.3%    1243680 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      37834           +13.7%      43006        GEO-MEAN sched_debug.cpu#=
28.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3865 =C2=B1 10%     +62.2%       6270 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3865           +62.2%       6270        GEO-MEAN sched_debug.cpu#=
113.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3681 =C2=B1 20%    +109.1%       7697 =C2=B1 31%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3681          +109.1%       7697        GEO-MEAN sched_debug.cpu#=
30.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        757 =C2=B1 39%     -49.3%        383 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >        756           -49.3%        383        GEO-MEAN sched_debug.cpu#=
84.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4694 =C2=B1 11%     -27.9%       3383 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     690405 =C2=B1 25%     +89.0%    1304632 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      56927           +16.7%      66434        GEO-MEAN sched_debug.cpu#=
31.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4565 =C2=B1 36%    +106.5%       9429 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4565          +106.5%       9429        GEO-MEAN sched_debug.cpu#=
69.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14499 =C2=B1 21%     +83.6%      26623 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      14499           +83.6%      26623        GEO-MEAN sched_debug.cpu#=
114.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        679 =C2=B1 29%     -56.0%        299 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >        679           -56.0%        299        GEO-MEAN sched_debug.cpu#=
85.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12264 =C2=B1 18%     +73.0%      21211 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12264           +73.0%      21211        GEO-MEAN sched_debug.cpu#=
115.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1006499 =C2=B1 33%     +67.8%    1688436 =C2=B1 22%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1006499           +67.8%    1688436        GEO-MEAN sched_debug.cfs_=
rq[13]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3741 =C2=B1 29%     +58.4%       5927 =C2=B1 20%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     692121 =C2=B1 29%     +82.6%    1263807 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      50888           +70.1%      86550        GEO-MEAN sched_debug.cpu#=
24.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12227 =C2=B1 31%    +142.1%      29608 =C2=B1 31%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   17773083 =C2=B1 10%     +54.6%   27478266 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   31340929 =C2=B1  0%     -16.7%   26094438 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1895568           +46.1%    2768962        GEO-MEAN sched_debug.cpu#=
34.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  8%     -38.5%         13 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           -38.5%         13        GEO-MEAN sched_debug.cfs_=
rq[45]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  8%     -38.5%         13 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           -38.5%         13        GEO-MEAN sched_debug.cfs_=
rq[45]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1 12%     +76.9%         23 =C2=B1 21%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +76.9%         23        GEO-MEAN sched_debug.cpu#=
17.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        107 =C2=B1 21%     +90.3%        203 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        106           +90.3%        203        GEO-MEAN sched_debug.cfs_=
rq[20]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4744 =C2=B1  4%     -26.5%       3488 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4034 =C2=B1 27%     +73.4%       6995 =C2=B1 19%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     686771 =C2=B1 30%     +88.0%    1291369 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      23600           +33.8%      31585        GEO-MEAN sched_debug.cpu#=
32.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2760 =C2=B1 37%     +72.2%       4751 =C2=B1 25%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2760           +72.2%       4751        GEO-MEAN sched_debug.cpu#=
114.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1 11%     -40.3%         13 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         22           -40.3%         13        GEO-MEAN sched_debug.cfs_=
rq[47]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1 11%     -40.3%         13 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         22           -40.3%         13        GEO-MEAN sched_debug.cfs_=
rq[47]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2501 =C2=B1 39%    +119.5%       5490 =C2=B1 35%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2501          +119.5%       5490        GEO-MEAN sched_debug.cpu#=
92.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        134 =C2=B1 24%     +67.9%        225 =C2=B1 25%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        133           +67.9%        225        GEO-MEAN sched_debug.cfs_=
rq[21]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9384 =C2=B1 35%     +94.2%      18221 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9384           +94.2%      18221        GEO-MEAN sched_debug.cpu#=
69.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9462 =C2=B1 18%     +97.7%      18705 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9462           +97.7%      18705        GEO-MEAN sched_debug.cpu#=
92.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2123826 =C2=B1 11%     -43.5%    1200487 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2588915 =C2=B1 20%     -27.8%    1869878 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1067752 =C2=B1 25%     +65.3%    1764542 =C2=B1 11%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1803996           -12.3%    1582223        GEO-MEAN sched_debug.cfs_=
rq[16]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10916 =C2=B1 22%     +81.0%      19761 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10916           +81.0%      19760        GEO-MEAN sched_debug.cpu#=
74.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4129 =C2=B1 10%     -25.6%       3072 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     702266 =C2=B1 27%     +91.0%    1341447 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      53853           +19.2%      64202        GEO-MEAN sched_debug.cpu#=
35.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 30%     +50.0%         19 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +50.0%         18        GEO-MEAN sched_debug.cpu#=
23.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 11%     +58.3%         19 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +58.3%         18        GEO-MEAN sched_debug.cpu#=
20.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2141496 =C2=B1 10%     -43.3%    1213650 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    1203841 =C2=B1 25%     +53.0%    1842451 =C2=B1 19%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1605622            -6.9%    1495357        GEO-MEAN sched_debug.cfs_=
rq[17]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6826 =C2=B1 16%     -42.2%       3947 =C2=B1 21%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       6826           -42.2%       3947        GEO-MEAN sched_debug.cpu#=
42.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  9%     +68.3%         23 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +68.3%         23        GEO-MEAN sched_debug.cpu#=
17.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  9%     +68.3%         23 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +68.3%         23        GEO-MEAN sched_debug.cpu#=
17.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  7%     +67.5%         22 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +67.5%         22        GEO-MEAN sched_debug.cpu#=
12.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         24 =C2=B1 11%     -38.4%         15 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24           -38.4%         15        GEO-MEAN sched_debug.cpu#=
43.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1  4%     -40.0%         14 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23           -40.0%         13        GEO-MEAN sched_debug.cpu#=
45.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4220 =C2=B1 27%     +89.2%       7986 =C2=B1 30%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4220           +89.2%       7986        GEO-MEAN sched_debug.cpu#=
99.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     783024 =C2=B1 10%     +67.2%    1309563 =C2=B1 22%  ivb42/hackbench=
/performance-50%-threads-socket
> >     783024           +67.2%    1309563        GEO-MEAN sched_debug.cfs_=
rq[5]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4437 =C2=B1 24%    +106.1%       9146 =C2=B1 15%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     868193 =C2=B1  1%     -15.6%     732542 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      62068           +31.9%      81852        GEO-MEAN sched_debug.cpu#=
13.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        129 =C2=B1 20%     +30.6%        169 =C2=B1 22%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        129           +30.6%        169        GEO-MEAN sched_debug.cfs_=
rq[27]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3679 =C2=B1 15%     +61.4%       5937 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3679           +61.4%       5937        GEO-MEAN sched_debug.cpu#=
101.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        303 =C2=B1 21%     +76.5%        535 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        303           +76.5%        535        GEO-MEAN sched_debug.cfs_=
rq[22]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6.27 =C2=B1 30%     -53.4%       2.92 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >       6.39 =C2=B1 14%     -42.5%       3.67 =C2=B1 36%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       2.62 =C2=B1  1%     +10.8%       2.90 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       4.72           -33.3%       3.15        GEO-MEAN perf-profile.cpu=
-cycles.skb_copy_datagram_iovec.unix_stream_recvmsg.sock_aio_read.sock_aio_=
read.do_sync_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15488825 =C2=B1 11%     +52.2%   23580743 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25578650 =C2=B1  1%     -18.4%   20864649 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   19904352           +11.4%   22181161        GEO-MEAN sched_debug.cpu#=
4.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      13913 =C2=B1 21%     +76.1%      24495 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      13913           +76.1%      24495        GEO-MEAN sched_debug.cfs_=
rq[22]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3918 =C2=B1  8%     -25.7%       2912 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      70998 =C2=B1 22%     -58.0%      29820 =C2=B1 26%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      16678           -44.1%       9318        GEO-MEAN sched_debug.cpu#=
40.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3322 =C2=B1 38%    +106.6%       6864 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3322          +106.6%       6864        GEO-MEAN sched_debug.cpu#=
70.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   56932895 =C2=B1 29%     +53.2%   87212652 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    6311098 =C2=B1 10%     -52.0%    3030624 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >  1.356e+08 =C2=B1  0%     -15.5%  1.147e+08 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   36525190           -14.6%   31177685        GEO-MEAN cpuidle.C1-IVT.u=
sage
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.70 =C2=B1  5%     +27.7%       3.45 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       2.70           +27.7%       3.45        GEO-MEAN perf-profile.cpu=
-cycles.idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.def=
ault_wake_function
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6916 =C2=B1 20%     -48.5%       3561 =C2=B1 22%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      27938 =C2=B1  6%     -10.6%      24989 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      13900           -32.1%       9433        GEO-MEAN sched_debug.cpu#=
41.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      71213 =C2=B1 24%     -53.3%      33238 =C2=B1 28%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1443239 =C2=B1  0%     -16.5%    1205709 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     320589           -37.6%     200190        GEO-MEAN sched_debug.cpu#=
12.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  6%     +71.8%         22 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +71.8%         22        GEO-MEAN sched_debug.cpu#=
17.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  6%     +61.0%         22 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +61.0%         22        GEO-MEAN sched_debug.cpu#=
12.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7629 =C2=B1 19%     +92.3%      14669 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   21654231 =C2=B1  1%     -24.3%   16385202 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     406469           +20.6%     490269        GEO-MEAN sched_debug.cpu#=
13.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.26 =C2=B1  4%     -38.0%       1.40 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >       2.26           -38.0%       1.40        GEO-MEAN perf-profile.cpu=
-cycles._raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wake=
_function.__wake_up_common
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        563 =C2=B1  9%     -36.6%        357 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        563           -36.6%        356        GEO-MEAN sched_debug.cfs_=
rq[45]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     682108 =C2=B1 27%     +89.0%    1289515 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      50797 =C2=B1 38%     -40.9%      30042 =C2=B1 15%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     186142            +5.7%     196825        GEO-MEAN sched_debug.cpu#=
27.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3963 =C2=B1 11%     -26.4%       2916 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     866574 =C2=B1 35%     +50.8%    1306785 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      80354 =C2=B1 15%     -39.7%      48426 =C2=B1 21%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      65108           -12.6%      56933        GEO-MEAN sched_debug.cpu#=
42.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        107 =C2=B1 18%     +48.4%        159 =C2=B1 28%  ivb42/hackbench=
/performance-100%-threads-socket
> >        107           +48.4%        159        GEO-MEAN sched_debug.cfs_=
rq[43]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      68301 =C2=B1 22%     -46.5%      36531 =C2=B1 46%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   17193479 =C2=B1 12%     +57.7%   27116974 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30548238 =C2=B1  0%     -17.4%   25222173 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    3298074           -11.4%    2923455        GEO-MEAN sched_debug.cpu#=
25.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      38016 =C2=B1  8%     -51.8%      18317 =C2=B1 43%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   15881533 =C2=B1  9%     +51.7%   24085282 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25808917 =C2=B1  0%     -18.1%   21133286 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2497729           -15.7%    2104729        GEO-MEAN sched_debug.cpu#=
6.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14939 =C2=B1  5%     +65.9%      24777 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      14939           +65.9%      24777        GEO-MEAN sched_debug.cfs_=
rq[14]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        325 =C2=B1  5%     +66.0%        540 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        325           +66.0%        540        GEO-MEAN sched_debug.cfs_=
rq[14]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1 10%     +51.3%         19 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +51.3%         19        GEO-MEAN sched_debug.cpu#=
21.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         24 =C2=B1  5%     -39.2%         15 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24           -39.2%         15        GEO-MEAN sched_debug.cpu#=
41.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         24 =C2=B1 11%     -33.8%         16 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24           -33.8%         16        GEO-MEAN sched_debug.cpu#=
46.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.99 =C2=B1  4%     -39.9%       0.59 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >       0.99           -39.9%       0.59        GEO-MEAN perf-profile.cpu=
-cycles.__fdget_pos.sys_read.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1 16%     +51.0%         24 =C2=B1  1%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         16           +51.0%         24        GEO-MEAN sched_debug.cfs_=
rq[16]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      15519 =C2=B1  3%     +69.7%      26336 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      15518           +69.7%      26336        GEO-MEAN sched_debug.cfs_=
rq[17]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        161 =C2=B1  1%     +32.2%        213 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         75 =C2=B1 17%    +119.6%        164 =C2=B1 22%  ivb42/hackbench=
/performance-100%-threads-socket
> >        110           +70.3%        187        GEO-MEAN sched_debug.cfs_=
rq[33]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        338 =C2=B1  3%     +69.9%        574 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        338           +69.9%        574        GEO-MEAN sched_debug.cfs_=
rq[17]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1 13%     -24.2%         16 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         15 =C2=B1 18%    +102.2%         30 =C2=B1 32%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18           +23.8%         22        GEO-MEAN sched_debug.cfs_=
rq[38]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4133 =C2=B1  3%     +69.6%       7011 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4133           +69.6%       7011        GEO-MEAN sched_debug.cpu#=
119.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        195 =C2=B1 23%     +27.3%        248 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        122 =C2=B1  4%     -46.3%         65 =C2=B1 14%  ivb42/hackbench=
/performance-100%-threads-socket
> >       3356 =C2=B1 11%     -40.8%       1988 =C2=B1 28%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        431           -26.0%        319        GEO-MEAN sched_debug.cfs_=
rq[5]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14285 =C2=B1 30%     +65.4%      23622 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      14285           +65.4%      23622        GEO-MEAN sched_debug.cpu#=
98.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9343 =C2=B1 12%     +65.6%      15471 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9343           +65.6%      15471        GEO-MEAN sched_debug.cpu#=
106.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  1%     -37.3%         17 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         27           -37.3%         17        GEO-MEAN sched_debug.cpu#=
44.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         52 =C2=B1 14%     -47.9%         27 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         52           -47.9%         27        GEO-MEAN sched_debug.cfs_=
rq[46]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  7%     +70.0%         22 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +70.0%         22        GEO-MEAN sched_debug.cpu#=
17.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1 10%     -38.0%         14 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23           -38.0%         14        GEO-MEAN sched_debug.cpu#=
47.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3618 =C2=B1 20%     +86.7%       6755 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4494 =C2=B1 29%     +94.3%       8734 =C2=B1 23%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    2231243 =C2=B1  6%     +10.5%    2465052 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     860847 =C2=B1  2%     -11.2%     764541 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      74760           +37.4%     102689        GEO-MEAN sched_debug.cpu#=
39.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1206549 =C2=B1 22%     +39.1%    1678852 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1206549           +39.1%    1678852        GEO-MEAN softirqs.SCHED
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3173 =C2=B1 18%     -28.6%       2266 =C2=B1 32%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       3173           -28.6%       2266        GEO-MEAN sched_debug.cfs_=
rq[38]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     537895 =C2=B1 26%     +82.5%     981394 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1471462 =C2=B1  1%      -9.5%    1331414 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     889658           +28.5%    1143084        GEO-MEAN sched_debug.cpu#=
8.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4541 =C2=B1  8%     -20.5%       3611 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      84588 =C2=B1 17%     -58.8%      34872 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1487383 =C2=B1  1%     -17.0%    1233892 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >      82979           -35.2%      53761        GEO-MEAN sched_debug.cpu#=
22.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3196 =C2=B1 18%     -28.1%       2298 =C2=B1 32%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       3196           -28.1%       2298        GEO-MEAN sched_debug.cfs_=
rq[38]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  1%     -37.7%         16 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         25           -37.7%         15        GEO-MEAN sched_debug.cpu#=
41.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  9%     -32.5%         18 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -32.5%         17        GEO-MEAN sched_debug.cpu#=
46.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  1%     -39.0%         15 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         25           -39.0%         15        GEO-MEAN sched_debug.cpu#=
41.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        325 =C2=B1  9%     +57.9%        513 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        324           +57.9%        513        GEO-MEAN sched_debug.cfs_=
rq[21]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         90 =C2=B1 49%     -49.6%         45 =C2=B1 23%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         90           -49.6%         45        GEO-MEAN sched_debug.cpu#=
24.nr_uninterruptible
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        134 =C2=B1 23%     +69.9%        227 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        133           +69.9%        227        GEO-MEAN sched_debug.cfs_=
rq[19]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.61 =C2=B1 19%     +56.0%       0.96 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.61           +56.0%       0.96        GEO-MEAN perf-profile.cpu=
-cycles.load_balance.pick_next_task_fair.__sched_text_start.schedule.schedu=
le_hrtimeout_range_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14901 =C2=B1  9%     +57.7%      23504 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      14901           +57.7%      23504        GEO-MEAN sched_debug.cfs_=
rq[21]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.68 =C2=B1 17%     +52.5%       1.04 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.68           +52.5%       1.04        GEO-MEAN perf-profile.cpu=
-cycles.schedule.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.po=
ll_schedule_timeout.do_sys_poll
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.67 =C2=B1 17%     +53.5%       1.03 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.67           +53.5%       1.03        GEO-MEAN perf-profile.cpu=
-cycles.__sched_text_start.schedule.schedule_hrtimeout_range_clock.schedule=
_hrtimeout_range.poll_schedule_timeout
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1 12%     -36.2%         14 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16 =C2=B1 23%     +62.5%         26 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         19            +1.8%         19        GEO-MEAN sched_debug.cfs_=
rq[40]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5478 =C2=B1  4%     -25.0%       4108 =C2=B1 22%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      73277 =C2=B1 19%     -55.6%      32537 =C2=B1 17%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1429701 =C2=B1  1%     -16.2%    1198182 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >      83103           -34.7%      54305        GEO-MEAN sched_debug.cpu#=
15.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4024 =C2=B1 19%     +50.6%       6062 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4024           +50.6%       6062        GEO-MEAN sched_debug.cpu#=
52.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1  3%     +65.8%         21 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +65.8%         21        GEO-MEAN sched_debug.cpu#=
14.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1 10%     +50.0%         21 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +50.0%         21        GEO-MEAN sched_debug.cpu#=
13.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6909 =C2=B1 14%     +59.1%      10993 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       6097 =C2=B1 25%     +76.4%      10756 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   20172173 =C2=B1  0%     -24.0%   15328449 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      94717           +28.7%     121923        GEO-MEAN sched_debug.cpu#=
39.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        583 =C2=B1  7%     -39.3%        354 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        582           -39.3%        353        GEO-MEAN sched_debug.cfs_=
rq[46]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.63 =C2=B1 19%     +54.8%       0.97 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.63           +54.8%       0.97        GEO-MEAN perf-profile.cpu=
-cycles.pick_next_task_fair.__sched_text_start.schedule.schedule_hrtimeout_=
range_clock.schedule_hrtimeout_range
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.68 =C2=B1 17%     +52.2%       1.04 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.68           +52.2%       1.04        GEO-MEAN perf-profile.cpu=
-cycles.poll_schedule_timeout.do_sys_poll.sys_poll.system_call_fastpath.poll
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     546799 =C2=B1 23%     +82.5%     997770 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1499703 =C2=B1  0%      -9.7%    1354350 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     905558           +28.4%    1162467        GEO-MEAN sched_debug.cpu#=
10.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7322 =C2=B1 18%     -42.4%       4214 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7321           -42.4%       4214        GEO-MEAN sched_debug.cpu#=
38.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        580 =C2=B1  5%     -39.0%        354 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        580           -39.0%        353        GEO-MEAN sched_debug.cfs_=
rq[43]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5981 =C2=B1 16%     -39.5%       3621 =C2=B1 32%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     872462 =C2=B1  0%     -15.4%     737745 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      72237           -28.5%      51685        GEO-MEAN sched_debug.cpu#=
15.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1 16%     +49.0%         24 =C2=B1  1%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         16           +49.0%         24        GEO-MEAN sched_debug.cpu#=
16.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1 12%     -33.8%         15 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23           -33.8%         15        GEO-MEAN sched_debug.cpu#=
46.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1 12%     -33.8%         15 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23           -33.8%         15        GEO-MEAN sched_debug.cfs_=
rq[46]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.68 =C2=B1 17%     +51.7%       1.04 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.68           +51.7%       1.04        GEO-MEAN perf-profile.cpu=
-cycles.schedule_hrtimeout_range.poll_schedule_timeout.do_sys_poll.sys_poll=
.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.68 =C2=B1 17%     +51.7%       1.04 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.68           +51.7%       1.04        GEO-MEAN perf-profile.cpu=
-cycles.schedule_hrtimeout_range_clock.schedule_hrtimeout_range.poll_schedu=
le_timeout.do_sys_poll.sys_poll
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4148 =C2=B1 10%     -37.2%       2604 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4148           -37.2%       2604        GEO-MEAN sched_debug.cpu#=
54.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4.45 =C2=B1  4%     -35.2%       2.88 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >       4.45           -35.2%       2.88        GEO-MEAN perf-profile.cpu=
-cycles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_t=
o_wake_up
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        122 =C2=B1 24%     +71.9%        209 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        122           +71.9%        209        GEO-MEAN sched_debug.cfs_=
rq[19]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     531678 =C2=B1 21%     +73.3%     921348 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1427072 =C2=B1  1%      -9.9%    1285217 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     871058           +24.9%    1088178        GEO-MEAN sched_debug.cpu#=
5.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5329 =C2=B1 29%     +90.0%      10124 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       5328           +90.0%      10124        GEO-MEAN sched_debug.cpu#=
70.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        836 =C2=B1 42%     -45.7%        454 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >        836           -45.7%        454        GEO-MEAN sched_debug.cpu#=
79.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3921 =C2=B1 19%     -38.5%       2413 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4015 =C2=B1  9%     -31.4%       2754 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      66687 =C2=B1  7%     -49.1%      33950 =C2=B1 20%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1450656 =C2=B1  1%     -17.1%    1202921 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      35130           -35.0%      22824        GEO-MEAN sched_debug.cpu#=
18.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7426 =C2=B1 16%     +53.1%      11372 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7426           +53.1%      11372        GEO-MEAN sched_debug.cpu#=
58.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3955 =C2=B1 13%     -24.9%       2970 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     545421 =C2=B1 22%     +82.6%     996072 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1495572 =C2=B1  0%     -10.9%    1333271 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     147764            +6.9%     158010        GEO-MEAN sched_debug.cpu#=
9.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  3%     -35.4%         17 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -35.4%         17        GEO-MEAN sched_debug.cpu#=
43.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  9%     -33.7%         18 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         27           -33.7%         18        GEO-MEAN sched_debug.cpu#=
46.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  6%     -35.8%         17 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         27           -35.8%         17        GEO-MEAN sched_debug.cpu#=
43.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  9%     -33.7%         18 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         27           -33.7%         18        GEO-MEAN sched_debug.cpu#=
46.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  6%     -32.9%         17 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -32.9%         17        GEO-MEAN sched_debug.cpu#=
47.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4030 =C2=B1 18%     +61.5%       6508 =C2=B1 23%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4030           +61.5%       6508        GEO-MEAN sched_debug.cpu#=
50.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        351 =C2=B1  9%     +58.8%        557 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        350           +58.8%        557        GEO-MEAN sched_debug.cfs_=
rq[12]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.11 =C2=B1  3%     -29.1%       0.78 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.11           -29.1%       0.78        GEO-MEAN perf-profile.cpu=
-cycles.check_preempt_curr.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.d=
efault_wake_function
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        882 =C2=B1 30%     -38.9%        539 =C2=B1 32%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >        882           -38.9%        539        GEO-MEAN sched_debug.cpu#=
88.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      16092 =C2=B1  9%     +58.6%      25525 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      16091           +58.6%      25525        GEO-MEAN sched_debug.cfs_=
rq[12]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1  3%     +54.1%         19 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +54.1%         18        GEO-MEAN sched_debug.cpu#=
14.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 13%     +52.6%         19 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +52.6%         19        GEO-MEAN sched_debug.cpu#=
21.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 10%     +51.4%         18 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +51.4%         18        GEO-MEAN sched_debug.cpu#=
20.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6.42 =C2=B1  4%     -33.1%       4.30 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >       6.42           -33.1%       4.30        GEO-MEAN perf-profile.cpu=
-cycles.ttwu_do_activate.constprop.87.try_to_wake_up.default_wake_function.=
autoremove_wake_function.__wake_up_common
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.22 =C2=B1  3%     -29.1%       0.87 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.22           -29.1%       0.87        GEO-MEAN perf-profile.cpu=
-cycles.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.default_wake_functio=
n.autoremove_wake_function
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.24 =C2=B1 23%     -42.5%       0.71 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.24           -42.5%       0.71        GEO-MEAN perf-profile.cpu=
-cycles.cmpxchg_double_slab.isra.49.__slab_free.kmem_cache_free.kfree_skbme=
m.consume_skb
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5.13 =C2=B1  4%     -33.8%       3.40 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >       5.13           -33.8%       3.40        GEO-MEAN perf-profile.cpu=
-cycles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.default_=
wake_function
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.63 =C2=B1  3%     +17.9%       4.29 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       3.63           +17.9%       4.29        GEO-MEAN perf-profile.cpu=
-cycles.select_idle_sibling.select_task_rq_fair.try_to_wake_up.default_wake=
_function.autoremove_wake_function
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8188 =C2=B1 16%     +67.0%      13677 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   11910986 =C2=B1 14%     +61.3%   19211796 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   21798079 =C2=B1  1%     -14.6%   18621574 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1285823           +32.0%    1697690        GEO-MEAN sched_debug.cpu#=
9.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   30345040 =C2=B1  1%     -18.8%   24632965 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   30345040           -18.8%   24632965        GEO-MEAN sched_debug.cpu#=
39.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5.14 =C2=B1  4%     -33.8%       3.41 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >       5.14           -33.8%       3.41        GEO-MEAN perf-profile.cpu=
-cycles.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function=
.autoremove_wake_function
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2029 =C2=B1 16%     +79.2%       3637 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2029           +79.2%       3637        GEO-MEAN sched_debug.cpu#=
108.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1  5%     +64.3%         23 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +64.3%         23        GEO-MEAN sched_debug.cpu#=
12.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1  5%     +61.9%         22 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +61.9%         22        GEO-MEAN sched_debug.cpu#=
12.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1  5%     +61.9%         22 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +61.9%         22        GEO-MEAN sched_debug.cpu#=
12.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7338 =C2=B1 12%     -46.3%       3940 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      27156 =C2=B1  7%     -12.6%      23745 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14116           -31.5%       9672        GEO-MEAN sched_debug.cpu#=
43.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3570 =C2=B1 11%     +73.3%       6187 =C2=B1 25%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3570           +73.3%       6187        GEO-MEAN sched_debug.cpu#=
109.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     529022 =C2=B1 23%     +76.8%     935086 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1395020 =C2=B1  0%     -10.0%    1255965 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     859067           +26.2%    1083713        GEO-MEAN sched_debug.cpu#=
1.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         15 =C2=B1 28%     +55.3%         24 =C2=B1 20%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         15           +55.3%         24        GEO-MEAN sched_debug.cpu#=
38.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         15 =C2=B1 23%     +78.7%         28 =C2=B1 34%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         15           +78.7%         27        GEO-MEAN sched_debug.cpu#=
12.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  6%     -33.3%         16 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24           -33.3%         16        GEO-MEAN sched_debug.cpu#=
47.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  3%     -36.4%         16 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         25           -36.4%         16        GEO-MEAN sched_debug.cpu#=
43.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1 12%     -34.8%         15 =C2=B1 19%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16 =C2=B1 24%     +56.0%         26 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         19            +0.9%         19        GEO-MEAN sched_debug.cpu#=
40.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     535261 =C2=B1 24%     +78.9%     957745 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1451847 =C2=B1  1%      -9.6%    1311874 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     881543           +27.2%    1120911        GEO-MEAN sched_debug.cpu#=
7.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      20643 =C2=B1 23%     +36.4%      28161 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      16155 =C2=B1  3%     +66.8%      26952 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >      18262           +50.9%      27550        GEO-MEAN proc-vmstat.numa=
_pages_migrated
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      20643 =C2=B1 23%     +36.4%      28161 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      16155 =C2=B1  3%     +66.8%      26952 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >      18262           +50.9%      27550        GEO-MEAN proc-vmstat.pgmi=
grate_success
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9385 =C2=B1 14%     -41.0%       5534 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   17006086 =C2=B1 12%     +60.9%   27369535 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30313545 =C2=B1  1%     -17.1%   25125827 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1691341            -7.7%    1561336        GEO-MEAN sched_debug.cpu#=
26.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        356 =C2=B1 10%     +53.4%        546 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        356           +53.4%        546        GEO-MEAN sched_debug.cfs_=
rq[13]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7389 =C2=B1  8%     +71.4%      12668 =C2=B1 26%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   19417423 =C2=B1  1%     -23.3%   14891714 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     378801           +14.7%     434336        GEO-MEAN sched_debug.cpu#=
41.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         10 =C2=B1 24%     -29.4%          7 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         31 =C2=B1 24%     -38.3%         19 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         17           -34.0%         11        GEO-MEAN sched_debug.cfs_=
rq[15]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        592 =C2=B1  5%     -40.1%        354 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        312 =C2=B1  7%     +31.6%        410 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        429           -11.2%        381        GEO-MEAN sched_debug.cfs_=
rq[44]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3416598 =C2=B1  7%     -35.9%    2189890 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    3416598           -35.9%    2189890        GEO-MEAN sched_debug.cfs_=
rq[88]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3832 =C2=B1 15%     +39.8%       5358 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3832           +39.8%       5358        GEO-MEAN sched_debug.cpu#=
115.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23.87 =C2=B1 12%     -32.1%      16.21 =C2=B1 24%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      23.87           -32.1%      16.21        GEO-MEAN perf-profile.cpu=
-cycles.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync_read.vfs_re=
ad
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3655 =C2=B1 10%     -21.4%       2872 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      87492 =C2=B1 28%     -57.0%      37635 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1447302 =C2=B1  0%     -16.4%    1210584 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      77353           -34.4%      50773        GEO-MEAN sched_debug.cpu#=
19.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4.32 =C2=B1  2%     +13.3%       4.90 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       4.32           +13.3%       4.90        GEO-MEAN perf-profile.cpu=
-cycles.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremove=
_wake_function.__wake_up_common
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      24.70 =C2=B1 12%     -31.9%      16.82 =C2=B1 24%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      24.70           -31.9%      16.82        GEO-MEAN perf-profile.cpu=
-cycles.sock_aio_read.part.10.sock_aio_read.do_sync_read.vfs_read.sys_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1  2%     -28.0%         12 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16           -28.0%         12        GEO-MEAN sched_debug.cpu#=
27.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1  2%     -30.0%         11 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16           -30.0%         11        GEO-MEAN sched_debug.cfs_=
rq[27]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1  2%     -30.0%         11 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16           -30.0%         11        GEO-MEAN sched_debug.cfs_=
rq[27]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 15%     +51.4%         18 =C2=B1 16%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +51.4%         18        GEO-MEAN sched_debug.cfs_=
rq[17]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      24.74 =C2=B1 12%     -31.9%      16.85 =C2=B1 24%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      24.74           -31.9%      16.85        GEO-MEAN perf-profile.cpu=
-cycles.sock_aio_read.do_sync_read.vfs_read.sys_read.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27.38 =C2=B1 12%     -31.8%      18.68 =C2=B1 23%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      27.38           -31.8%      18.68        GEO-MEAN perf-profile.cpu=
-cycles.sys_read.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      16368 =C2=B1 10%     +52.9%      25026 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      16368           +52.9%      25026        GEO-MEAN sched_debug.cfs_=
rq[13]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      26.74 =C2=B1 12%     -31.7%      18.25 =C2=B1 23%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      26.74           -31.7%      18.25        GEO-MEAN perf-profile.cpu=
-cycles.vfs_read.sys_read.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9928 =C2=B1 16%     +65.5%      16433 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9928           +65.5%      16432        GEO-MEAN sched_debug.cpu#=
107.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      24.94 =C2=B1 12%     -31.8%      17.00 =C2=B1 23%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      24.94           -31.8%      17.00        GEO-MEAN perf-profile.cpu=
-cycles.do_sync_read.vfs_read.sys_read.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1906 =C2=B1  6%     -32.3%       1291 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1906           -32.3%       1291        GEO-MEAN sched_debug.cpu#=
104.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  9%     +60.0%         21 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +60.0%         21        GEO-MEAN sched_debug.cpu#=
18.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1 15%     +47.5%         19 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +47.5%         19        GEO-MEAN sched_debug.cpu#=
21.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1  3%     +57.9%         20 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +57.9%         19        GEO-MEAN sched_debug.cpu#=
14.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  9%     +62.5%         21 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +62.5%         21        GEO-MEAN sched_debug.cpu#=
18.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1  3%     +60.5%         20 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +60.5%         20        GEO-MEAN sched_debug.cpu#=
14.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  9%     +60.0%         21 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +60.0%         21        GEO-MEAN sched_debug.cpu#=
18.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3140 =C2=B1 36%    +144.5%       7678 =C2=B1 21%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    3441316 =C2=B1 10%     +10.7%    3808986 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >     103950           +64.5%     171016        GEO-MEAN sched_debug.cpu#=
24.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8114 =C2=B1 16%     +95.9%      15897 =C2=B1 23%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   11925417 =C2=B1 16%     +62.2%   19343786 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   21736276 =C2=B1  0%     -15.7%   18334370 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1281273           +38.9%    1779842        GEO-MEAN sched_debug.cpu#=
8.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4725 =C2=B1 17%     +64.0%       7751 =C2=B1 25%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4725           +64.0%       7750        GEO-MEAN sched_debug.cpu#=
104.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7495 =C2=B1 17%     +32.7%       9948 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7495           +32.7%       9948        GEO-MEAN sched_debug.cfs_=
rq[12]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4917 =C2=B1 16%     +82.6%       8980 =C2=B1 29%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4257 =C2=B1 14%     -45.8%       2307 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    2403163 =C2=B1  2%      -8.8%    2191554 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     862442 =C2=B1  0%     -15.1%     732316 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      81157            -6.4%      75937        GEO-MEAN sched_debug.cpu#=
14.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7576 =C2=B1 16%     +31.7%       9978 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7576           +31.7%       9978        GEO-MEAN sched_debug.cfs_=
rq[13]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      32805 =C2=B1  9%     -33.8%      21701 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      32805           -33.8%      21701        GEO-MEAN sched_debug.cfs_=
rq[46]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        716 =C2=B1  9%     -33.9%        473 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        716           -33.9%        473        GEO-MEAN sched_debug.cfs_=
rq[46]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      75672 =C2=B1 15%     -50.5%      37483 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1473950 =C2=B1  1%     -16.2%    1235367 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     333971           -35.6%     215187        GEO-MEAN sched_debug.cpu#=
20.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  6%     -33.8%         17 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -33.7%         17        GEO-MEAN sched_debug.cpu#=
43.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  9%     -30.8%         18 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -30.8%         17        GEO-MEAN sched_debug.cpu#=
46.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        382 =C2=B1  6%     +46.4%        559 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        382           +46.4%        559        GEO-MEAN sched_debug.cfs_=
rq[15]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4992 =C2=B1 25%    +100.4%      10005 =C2=B1 20%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   11668236 =C2=B1 13%     +59.7%   18628665 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20231936 =C2=B1  0%     -13.8%   17436914 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1056263           +40.2%    1481231        GEO-MEAN sched_debug.cpu#=
24.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14541 =C2=B1 18%     +69.8%      24696 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      14541           +69.8%      24695        GEO-MEAN sched_debug.cfs_=
rq[19]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        317 =C2=B1 18%     +70.1%        539 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        317           +70.1%        539        GEO-MEAN sched_debug.cfs_=
rq[19]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7215 =C2=B1 15%     +34.7%       9716 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7214           +34.7%       9716        GEO-MEAN sched_debug.cfs_=
rq[9]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      17530 =C2=B1  6%     +46.0%      25603 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      17530           +46.0%      25602        GEO-MEAN sched_debug.cfs_=
rq[15]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7309 =C2=B1 16%     +33.9%       9789 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7309           +33.9%       9789        GEO-MEAN sched_debug.cfs_=
rq[10]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      30019 =C2=B1  7%     +14.9%      34496 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       6890 =C2=B1 19%     -54.9%       3109 =C2=B1 17%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      22044 =C2=B1  1%     +25.8%      27733 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >      16582           -13.3%      14381        GEO-MEAN cpuidle.C1E-IVT.=
usage
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.63 =C2=B1  8%     -32.9%       1.09 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.63           -32.9%       1.09        GEO-MEAN perf-profile.cpu=
-cycles.inode_has_perm.isra.30.file_has_perm.selinux_file_permission.securi=
ty_file_permission.rw_verify_area
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7383 =C2=B1 17%     +33.5%       9857 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7383           +33.5%       9857        GEO-MEAN sched_debug.cfs_=
rq[11]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7949 =C2=B1 18%     +28.4%      10203 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7949           +28.4%      10203        GEO-MEAN sched_debug.cfs_=
rq[19]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1230679 =C2=B1  9%     +65.1%    2032295 =C2=B1 14%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1230679           +65.1%    2032295        GEO-MEAN sched_debug.cfs_=
rq[10]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8408 =C2=B1 11%     +19.2%      10025 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       6401 =C2=B1 24%    +120.5%      14112 =C2=B1 27%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   11821848 =C2=B1 11%     +56.6%   18516571 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20560704 =C2=B1  0%     -16.2%   17227893 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     338198           +36.3%     460924        GEO-MEAN sched_debug.cpu#=
34.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7677 =C2=B1 16%     +30.2%       9992 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7677           +30.2%       9992        GEO-MEAN sched_debug.cfs_=
rq[14]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7909 =C2=B1 18%     +28.7%      10178 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7909           +28.7%      10178        GEO-MEAN sched_debug.cfs_=
rq[18]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5847 =C2=B1 24%     -28.9%       4154 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     516962 =C2=B1 23%     +80.2%     931432 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1404122 =C2=B1  0%     -10.1%    1262026 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     161907            +4.8%     169658        GEO-MEAN sched_debug.cpu#=
2.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   5.22e+09 =C2=B1  7%     +58.9%  8.293e+09 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >  6.257e+08 =C2=B1 12%     +34.0%  8.383e+08 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >  1.807e+09           +45.9%  2.637e+09        GEO-MEAN cpuidle.C1-IVT.t=
ime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      15999 =C2=B1 10%     +59.5%      25516 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      15999           +59.5%      25515        GEO-MEAN sched_debug.cfs_=
rq[18]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        349 =C2=B1 10%     +59.5%        557 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        349           +59.5%        557        GEO-MEAN sched_debug.cfs_=
rq[18]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7975 =C2=B1 18%     +28.3%      10236 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7975           +28.3%      10236        GEO-MEAN sched_debug.cfs_=
rq[20]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   17005681 =C2=B1 14%     +56.0%   26524924 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30364476 =C2=B1  0%     -17.2%   25142879 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   22723745           +13.6%   25824658        GEO-MEAN sched_debug.cpu#=
28.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     640395 =C2=B1  3%     -15.6%     540784 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    1456410 =C2=B1 18%     +70.5%    2483287 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     965753           +20.0%    1158845        GEO-MEAN sched_debug.cpu#=
47.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.44 =C2=B1  8%     -32.3%       0.98 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.44           -32.3%       0.98        GEO-MEAN perf-profile.cpu=
-cycles.avc_has_perm.inode_has_perm.file_has_perm.selinux_file_permission.s=
ecurity_file_permission
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8919 =C2=B1 11%     +65.7%      14777 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   12095766 =C2=B1 13%     +62.2%   19621720 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   21609616 =C2=B1  0%     -14.6%   18459478 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1326005           +31.9%    1749264        GEO-MEAN sched_debug.cpu#=
5.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7935 =C2=B1 18%     +28.0%      10155 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7935           +28.0%      10155        GEO-MEAN sched_debug.cfs_=
rq[17]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7977 =C2=B1 18%     +28.6%      10256 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7977           +28.6%      10256        GEO-MEAN sched_debug.cfs_=
rq[21]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3478 =C2=B1 17%    +117.2%       7555 =C2=B1 28%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     870275 =C2=B1  1%     -13.3%     754578 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >      55021           +37.2%      75505        GEO-MEAN sched_debug.cpu#=
36.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9062 =C2=B1 23%     -32.3%       6135 =C2=B1 21%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   16827253 =C2=B1 13%     +60.0%   26927363 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30468014 =C2=B1  1%     -17.2%   25213426 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1668668            -3.6%    1609000        GEO-MEAN sched_debug.cpu#=
27.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  5%     -30.9%         18 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         15 =C2=B1  8%     +32.6%         20 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20            -4.3%         19        GEO-MEAN sched_debug.cpu#=
47.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      17581 =C2=B1 19%     +65.3%      29062 =C2=B1 12%  ivb42/hackbench=
/performance-100%-threads-socket
> >     254353 =C2=B1  4%     +18.7%     302028 =C2=B1  7%  ivb42/hackbench=
/performance-50%-threads-socket
> >      66872           +40.1%      93688        GEO-MEAN proc-vmstat.numa=
_hint_faults_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      13264 =C2=B1 35%     +84.1%      24424 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      13264           +84.1%      24424        GEO-MEAN sched_debug.cpu#=
62.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.11 =C2=B1 11%     -35.1%       0.72 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.11           -35.1%       0.72        GEO-MEAN perf-profile.cpu=
-cycles.file_has_perm.selinux_file_permission.security_file_permission.rw_v=
erify_area.vfs_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     526427 =C2=B1 23%     +76.6%     929461 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1394923 =C2=B1  0%      -9.3%    1265094 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     856928           +26.5%    1084369        GEO-MEAN sched_debug.cpu#=
3.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7863 =C2=B1 17%     +28.3%      10087 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7863           +28.3%      10087        GEO-MEAN sched_debug.cfs_=
rq[16]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7187 =C2=B1 14%     +33.6%       9600 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7187           +33.6%       9600        GEO-MEAN sched_debug.cfs_=
rq[8]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4.53 =C2=B1 15%     -37.7%       2.82 =C2=B1 32%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       2.57 =C2=B1  4%     +13.8%       2.92 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       3.41           -15.8%       2.87        GEO-MEAN perf-profile.cpu=
-cycles._raw_spin_lock.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs=
_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     557866 =C2=B1 23%     +80.5%    1007189 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      53065 =C2=B1 20%     -30.0%      37147 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1493710 =C2=B1  1%     -10.0%    1344628 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     353619            +4.4%     369158        GEO-MEAN sched_debug.cpu#=
11.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4063 =C2=B1 15%    +107.1%       8413 =C2=B1 36%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2179222 =C2=B1  5%     +10.1%    2399421 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     839076 =C2=B1  1%     -11.6%     741571 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     195133           +26.3%     246460        GEO-MEAN sched_debug.cpu#=
41.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9837 =C2=B1 32%     +95.8%      19258 =C2=B1 20%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   17220541 =C2=B1 16%     +56.5%   26958322 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30884674 =C2=B1  0%     -18.7%   25097824 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1736043           +35.5%    2353134        GEO-MEAN sched_debug.cpu#=
24.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1 28%     +47.7%         21 =C2=B1 15%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         14           +47.7%         21        GEO-MEAN sched_debug.cpu#=
45.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1 22%     +38.6%         20 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14           +38.6%         20        GEO-MEAN sched_debug.cfs_=
rq[23]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1  2%     +49.1%         26 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         17           +49.1%         26        GEO-MEAN sched_debug.cpu#=
9.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1 12%     +60.0%         21 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +60.0%         21        GEO-MEAN sched_debug.cpu#=
18.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1 25%     +46.5%         21 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         14           +46.5%         21        GEO-MEAN sched_debug.cpu#=
47.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1  8%     +44.2%         20 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14           +44.2%         20        GEO-MEAN sched_debug.cpu#=
13.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 19%     +64.9%         20 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +64.9%         20        GEO-MEAN sched_debug.cpu#=
22.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7773 =C2=B1 17%     +28.9%      10021 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7773           +28.9%      10021        GEO-MEAN sched_debug.cfs_=
rq[15]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      15443 =C2=B1 16%     -42.1%       8942 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    3938792 =C2=B1  4%     -14.0%    3386333 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   25580176 =C2=B1  0%     -21.8%   19998098 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1158775           -27.0%     846027        GEO-MEAN sched_debug.cpu#=
14.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9653 =C2=B1  9%     -32.9%       6480 =C2=B1 16%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   26079901 =C2=B1  0%     -22.7%   20147877 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     501746           -28.0%     361347        GEO-MEAN sched_debug.cpu#=
18.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        703 =C2=B1  4%     -30.6%        488 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        703           -30.6%        488        GEO-MEAN sched_debug.cfs_=
rq[44]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2896697 =C2=B1  4%     -38.1%    1793407 =C2=B1 29%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1443204 =C2=B1 24%     +51.5%    2187058 =C2=B1  6%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2044633            -3.1%    1980476        GEO-MEAN sched_debug.cfs_=
rq[23]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8004 =C2=B1 17%     +28.4%      10276 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8004           +28.4%      10276        GEO-MEAN sched_debug.cfs_=
rq[22]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8027 =C2=B1 18%     +28.8%      10336 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8027           +28.8%      10336        GEO-MEAN sched_debug.cfs_=
rq[24]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      32238 =C2=B1  4%     -30.6%      22365 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      32238           -30.6%      22365        GEO-MEAN sched_debug.cfs_=
rq[44]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4820 =C2=B1 11%     -31.9%       3282 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4820           -31.9%       3282        GEO-MEAN sched_debug.cpu#=
48.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  6%     -39.3%         11 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19 =C2=B1  6%     +19.0%         23 =C2=B1  9%  ivb42/hackbench=
/performance-100%-threads-socket
> >         18           -15.0%         16        GEO-MEAN sched_debug.cfs_=
rq[28]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8011 =C2=B1 17%     +28.6%      10298 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8011           +28.6%      10298        GEO-MEAN sched_debug.cfs_=
rq[23]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      31701 =C2=B1  2%     -32.5%      21398 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      31701           -32.5%      21398        GEO-MEAN sched_debug.cfs_=
rq[38]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4167 =C2=B1 19%    +107.5%       8648 =C2=B1 37%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       6235 =C2=B1 28%     +44.5%       9006 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     871725 =C2=B1  3%      -9.5%     788740 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      28293           +39.5%      39459        GEO-MEAN sched_debug.cpu#=
35.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        449 =C2=B1  6%     -27.7%        324 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        449           -27.7%        324        GEO-MEAN sched_debug.cfs_=
rq[31]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.53 =C2=B1  3%     -16.4%       1.28 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.53           -16.4%       1.28        GEO-MEAN perf-profile.cpu=
-cycles.update_cfs_shares.enqueue_entity.enqueue_task_fair.enqueue_task.act=
ivate_task
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        692 =C2=B1  2%     -32.5%        467 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        692           -32.5%        467        GEO-MEAN sched_debug.cfs_=
rq[38]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      38613 =C2=B1 21%     +52.0%      58679 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >     287269 =C2=B1  4%     +32.4%     380327 =C2=B1  6%  ivb42/hackbench=
/performance-50%-threads-socket
> >     105320           +41.8%     149389        GEO-MEAN proc-vmstat.numa=
_hint_faults
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.37 =C2=B1  3%     -15.6%       1.15 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.37           -15.6%       1.15        GEO-MEAN perf-profile.cpu=
-cycles.schedule_user.sysret_careful
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8063 =C2=B1 18%     +28.1%      10333 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8063           +28.1%      10333        GEO-MEAN sched_debug.cfs_=
rq[25]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7348 =C2=B1 15%     +74.3%      12808 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   11806551 =C2=B1 11%     +55.2%   18329503 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20314951 =C2=B1  0%     -15.6%   17140944 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1207946           +31.7%    1590605        GEO-MEAN sched_debug.cpu#=
30.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.61 =C2=B1  1%     -14.9%       1.37 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.61           -14.9%       1.37        GEO-MEAN perf-profile.cpu=
-cycles.pick_next_task_fair.__sched_text_start.schedule.schedule_timeout.un=
ix_stream_recvmsg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.01 =C2=B1 28%     -40.8%       0.60 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.01           -40.8%       0.60        GEO-MEAN perf-profile.cpu=
-cycles.cmpxchg_double_slab.isra.49.__slab_free.kfree.skb_free_head.skb_rel=
ease_data
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   16941114 =C2=B1 11%     +64.1%   27793664 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   31373706 =C2=B1  0%     -18.0%   25734789 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   23054404           +16.0%   26744422        GEO-MEAN sched_debug.cpu#=
33.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.40 =C2=B1  2%     -16.1%       1.17 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.40           -16.1%       1.17        GEO-MEAN perf-profile.cpu=
-cycles.sysret_careful
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.33 =C2=B1  2%     -16.4%       1.11 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.33           -16.4%       1.11        GEO-MEAN perf-profile.cpu=
-cycles.__sched_text_start.schedule_user.sysret_careful
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   16927905 =C2=B1 11%     +64.2%   27789022 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   31356060 =C2=B1  0%     -17.9%   25728656 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   23038932           +16.1%   26739001        GEO-MEAN sched_debug.cpu#=
33.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10.34 =C2=B1 19%     -34.7%       6.75 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >       8.89 =C2=B1 10%     -30.5%       6.18 =C2=B1 21%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       9.59           -32.7%       6.46        GEO-MEAN perf-profile.cpu=
-cycles.skb_release_all.consume_skb.unix_stream_recvmsg.sock_aio_read.sock_=
aio_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     677903 =C2=B1 23%     +44.6%     980014 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >     677903           +44.6%     980014        GEO-MEAN sched_debug.cpu#=
35.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        101 =C2=B1 17%     +47.5%        149 =C2=B1 21%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       1868 =C2=B1 11%     -23.9%       1421 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        434            +5.9%        460        GEO-MEAN sched_debug.cfs_=
rq[1]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        150 =C2=B1 28%     +58.0%        237 =C2=B1 26%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         84 =C2=B1  3%     -25.0%         63 =C2=B1 33%  ivb42/hackbench=
/performance-100%-threads-socket
> >        112            +8.9%        122        GEO-MEAN sched_debug.cfs_=
rq[15]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >          8 =C2=B1  7%     +40.0%         11 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         18 =C2=B1  5%     -32.7%         12 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12            -3.0%         11        GEO-MEAN sched_debug.cpu#=
30.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8083 =C2=B1 13%     +78.7%      14442 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       6483 =C2=B1  9%     -33.4%       4316 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    2866789 =C2=B1  2%     -12.7%    2501832 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   21661306 =C2=B1  0%     -24.2%   16411873 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     238841            -5.8%     224927        GEO-MEAN sched_debug.cpu#=
14.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4514 =C2=B1 18%     +74.5%       7876 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     884715 =C2=B1  2%     -11.6%     782521 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      63194           +24.2%      78506        GEO-MEAN sched_debug.cpu#=
9.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.25 =C2=B1  2%     -25.4%       0.93 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.25           -25.4%       0.93        GEO-MEAN perf-profile.cpu=
-cycles.update_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.dea=
ctivate_task
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10616 =C2=B1 25%     -38.7%       6506 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   16835397 =C2=B1 13%     +60.0%   26932709 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30477512 =C2=B1  1%     -17.2%   25229055 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1759527            -6.7%    1641230        GEO-MEAN sched_debug.cpu#=
27.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8105 =C2=B1 18%     +27.2%      10311 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8105           +27.2%      10311        GEO-MEAN sched_debug.cfs_=
rq[26]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7379 =C2=B1  8%     +49.8%      11053 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7379           +49.8%      11053        GEO-MEAN sched_debug.cpu#=
50.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7697 =C2=B1 15%     +70.3%      13108 =C2=B1 25%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8581 =C2=B1 15%     +39.8%      11998 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   11754315 =C2=B1 15%     +57.2%   18472436 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20829936 =C2=B1  0%     -17.0%   17279112 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     356612           +32.7%     473344        GEO-MEAN sched_debug.cpu#=
35.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        444 =C2=B1 17%     -27.5%        322 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        576 =C2=B1  4%     -21.6%        452 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >        506           -24.6%        381        GEO-MEAN sched_debug.cfs_=
rq[25]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8412 =C2=B1  5%     -22.9%       6484 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     536508 =C2=B1 25%     +72.1%     923157 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1406705 =C2=B1  1%     -10.8%    1254824 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     185165            +5.8%     195839        GEO-MEAN sched_debug.cpu#=
0.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1 15%     +49.0%         24 =C2=B1 20%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         16           +49.0%         24        GEO-MEAN sched_debug.cpu#=
21.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  3%     -33.3%         16 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24           -33.3%         16        GEO-MEAN sched_debug.cpu#=
45.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         24 =C2=B1  5%     -28.4%         17 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24           -28.4%         17        GEO-MEAN sched_debug.cpu#=
37.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  5%     -28.4%         19 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         15 =C2=B1  0%     +35.6%         20 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20            -1.5%         19        GEO-MEAN sched_debug.cpu#=
47.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9010 =C2=B1 13%     +54.6%      13927 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   12233313 =C2=B1 17%     +57.5%   19266075 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   22693545 =C2=B1  0%     -16.6%   18915402 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1357459           +26.6%    1718539        GEO-MEAN sched_debug.cpu#=
11.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7218 =C2=B1 19%     +42.0%      10253 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7218           +42.0%      10253        GEO-MEAN sched_debug.cpu#=
55.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4577 =C2=B1 13%     +92.1%       8792 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4497 =C2=B1 47%     -45.5%       2450 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     869234 =C2=B1  1%     -10.1%     781750 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      26155            -2.0%      25632        GEO-MEAN sched_debug.cpu#=
3.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      13499 =C2=B1 34%     +77.7%      23993 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      13499           +77.7%      23993        GEO-MEAN sched_debug.cpu#=
74.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7502 =C2=B1 13%     +47.8%      11086 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   11693700 =C2=B1 14%     +57.5%   18413834 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20020943 =C2=B1  0%     -14.5%   17120192 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1206550           +25.8%    1517548        GEO-MEAN sched_debug.cpu#=
33.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        571 =C2=B1  9%     -35.9%        366 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        569 =C2=B1 13%     -15.7%        480 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >        570           -26.5%        419        GEO-MEAN sched_debug.cfs_=
rq[40]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8128 =C2=B1 18%     +27.0%      10320 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8128           +27.0%      10320        GEO-MEAN sched_debug.cfs_=
rq[27]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4417 =C2=B1 13%     -19.8%       3540 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       5065 =C2=B1 16%     -17.6%       4173 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     515138 =C2=B1 26%     +78.8%     921170 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1423158 =C2=B1  1%     -10.2%    1278070 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >      63641            +1.5%      64581        GEO-MEAN sched_debug.cpu#=
4.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      15390 =C2=B1 12%     +34.2%      20648 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      12822 =C2=B1 23%     +79.5%      23018 =C2=B1 19%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   30316596 =C2=B1  1%     -18.8%   24607293 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     181538           +25.0%     226989        GEO-MEAN sched_debug.cpu#=
39.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1 10%     -34.5%         12 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -34.5%         12        GEO-MEAN sched_debug.cpu#=
28.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  2%     -27.6%         14 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -27.6%         13        GEO-MEAN sched_debug.cpu#=
30.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4118 =C2=B1 12%     -21.6%       3229 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     541605 =C2=B1 22%     +73.4%     939202 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >    1440886 =C2=B1  0%     -10.0%    1296355 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     147577            +6.9%     157827        GEO-MEAN sched_debug.cpu#=
6.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3158 =C2=B1  7%     -18.3%       2580 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      71506 =C2=B1 21%     -47.2%      37754 =C2=B1 19%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1423709 =C2=B1  0%     -15.8%    1198274 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      68507           -28.7%      48874        GEO-MEAN sched_debug.cpu#=
17.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7156 =C2=B1 13%     +31.9%       9438 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7156           +31.9%       9438        GEO-MEAN sched_debug.cfs_=
rq[7]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8153 =C2=B1 18%     +26.4%      10309 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8153           +26.4%      10309        GEO-MEAN sched_debug.cfs_=
rq[29]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5419 =C2=B1 22%     +54.4%       8369 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     895578 =C2=B1  2%     -11.5%     792265 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      69665           +16.9%      81429        GEO-MEAN sched_debug.cpu#=
11.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8153 =C2=B1 18%     +26.5%      10314 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8153           +26.5%      10314        GEO-MEAN sched_debug.cfs_=
rq[28]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        580 =C2=B1 12%     -38.0%        359 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        580           -38.0%        359        GEO-MEAN sched_debug.cfs_=
rq[38]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1 12%     -33.8%         15 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         22 =C2=B1 15%     -26.9%         16 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         22           -30.4%         15        GEO-MEAN sched_debug.cfs_=
rq[46]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15444360 =C2=B1 11%     +61.0%   24864698 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26710729 =C2=B1  1%     -19.1%   21602428 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20310837           +14.1%   23176234        GEO-MEAN sched_debug.cpu#=
9.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4500 =C2=B1 12%     -25.2%       3366 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4500           -25.2%       3366        GEO-MEAN sched_debug.cpu#=
49.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1525 =C2=B1 18%     +48.7%       2268 =C2=B1 32%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1525           +48.7%       2267        GEO-MEAN sched_debug.cpu#=
86.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10770 =C2=B1  9%     +50.5%      16213 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   12271585 =C2=B1 16%     +57.9%   19381310 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   22662241 =C2=B1  0%     -15.3%   19188484 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1441472           +26.3%    1820131        GEO-MEAN sched_debug.cpu#=
3.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8113 =C2=B1 19%     +26.9%      10296 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8112           +26.9%      10296        GEO-MEAN sched_debug.cfs_=
rq[30]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4302 =C2=B1 21%     +71.4%       7373 =C2=B1 25%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4302           +71.4%       7373        GEO-MEAN sched_debug.cpu#=
92.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8951 =C2=B1 23%     +48.3%      13272 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   12573544 =C2=B1 11%     +53.2%   19263201 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   22458882 =C2=B1  0%     -16.7%   18703491 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1362194           +23.7%    1684742        GEO-MEAN sched_debug.cpu#=
10.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8998 =C2=B1 21%     +54.1%      13866 =C2=B1 15%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   12201362 =C2=B1 16%     +58.9%   19384000 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   22476314 =C2=B1  1%     -16.3%   18802789 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1351324           +27.0%    1716118        GEO-MEAN sched_debug.cpu#=
7.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8190 =C2=B1 20%     +25.3%      10261 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8189           +25.3%      10261        GEO-MEAN sched_debug.cfs_=
rq[36]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4014 =C2=B1  9%    +119.8%       8826 =C2=B1 27%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2434032 =C2=B1  0%      -8.9%    2217954 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     873433 =C2=B1  1%     -15.8%     735098 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     204361           +19.0%     243231        GEO-MEAN sched_debug.cpu#=
12.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8250 =C2=B1 21%     +24.5%      10271 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8250           +24.5%      10271        GEO-MEAN sched_debug.cfs_=
rq[37]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8.05 =C2=B1  2%     -12.5%       7.04 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       8.05           -12.5%       7.04        GEO-MEAN perf-profile.cpu=
-cycles._raw_spin_lock_irqsave.__wake_up_sync_key.sock_def_readable.unix_st=
ream_sendmsg.sock_aio_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   17308722 =C2=B1 16%     +55.8%   26962813 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30891431 =C2=B1  0%     -18.7%   25116019 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   23123391           +12.5%   26023038        GEO-MEAN sched_debug.cpu#=
24.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8184 =C2=B1 20%     +25.3%      10254 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8184           +25.3%      10254        GEO-MEAN sched_debug.cfs_=
rq[35]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8129 =C2=B1 19%     +26.5%      10286 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8128           +26.5%      10285        GEO-MEAN sched_debug.cfs_=
rq[31]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8182 =C2=B1 20%     +25.2%      10245 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8182           +25.2%      10245        GEO-MEAN sched_debug.cfs_=
rq[34]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   12346526 =C2=B1 13%     +58.9%   19614719 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   22483652 =C2=B1  1%     -15.0%   19119883 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   16661182           +16.2%   19365720        GEO-MEAN sched_debug.cpu#=
1.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8144 =C2=B1 19%     +26.1%      10267 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8144           +26.1%      10267        GEO-MEAN sched_debug.cfs_=
rq[32]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8166 =C2=B1 19%     +25.7%      10263 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8166           +25.7%      10263        GEO-MEAN sched_debug.cfs_=
rq[33]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   17017865 =C2=B1 12%     +60.8%   27370190 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30325190 =C2=B1  1%     -17.1%   25139575 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   22717174           +15.5%   26231183        GEO-MEAN sched_debug.cpu#=
26.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        165 =C2=B1 25%     +54.9%        256 =C2=B1 24%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        103 =C2=B1  2%     -18.7%         84 =C2=B1 23%  ivb42/hackbench=
/performance-100%-threads-socket
> >        130           +12.2%        146        GEO-MEAN sched_debug.cfs_=
rq[15]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5106 =C2=B1 26%     +49.5%       7632 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     860018 =C2=B1  2%     -10.0%     773781 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >      66269           +16.0%      76847        GEO-MEAN sched_debug.cpu#=
4.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8251 =C2=B1 21%     +24.4%      10265 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8250           +24.4%      10265        GEO-MEAN sched_debug.cfs_=
rq[38]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15824219 =C2=B1 12%     +54.9%   24515228 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26226903 =C2=B1  1%     -17.9%   21539753 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20372046           +12.8%   22979381        GEO-MEAN sched_debug.cpu#=
8.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  4%     -27.8%         19 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -27.8%         18        GEO-MEAN sched_debug.cpu#=
38.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  3%     -29.5%         18 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -29.5%         18        GEO-MEAN sched_debug.cpu#=
45.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  4%     -29.1%         18 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -29.1%         18        GEO-MEAN sched_debug.cpu#=
38.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7515 =C2=B1 11%     +60.0%      12025 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   19963010 =C2=B1  1%     -24.1%   15143746 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     387342           +10.2%     426750        GEO-MEAN sched_debug.cpu#=
37.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      31979 =C2=B1  7%     -33.2%      21356 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      31979           -33.2%      21356        GEO-MEAN sched_debug.cfs_=
rq[43]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8253 =C2=B1 20%     +24.2%      10251 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8253           +24.2%      10251        GEO-MEAN sched_debug.cfs_=
rq[40]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8250 =C2=B1 20%     +24.3%      10256 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8249           +24.3%      10256        GEO-MEAN sched_debug.cfs_=
rq[39]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5816 =C2=B1  9%     -28.7%       4145 =C2=B1 18%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      28245 =C2=B1  7%     -15.0%      24021 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      12817           -22.1%       9979        GEO-MEAN sched_debug.cpu#=
31.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        698 =C2=B1  7%     -33.2%        466 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        698           -33.2%        466        GEO-MEAN sched_debug.cfs_=
rq[43]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.74 =C2=B1 13%     -32.0%       1.86 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.01 =C2=B1 12%     -30.9%       0.70 =C2=B1 22%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       1.67           -31.5%       1.14        GEO-MEAN perf-profile.cpu=
-cycles.fsnotify.vfs_write.sys_write.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8277 =C2=B1 20%     +23.8%      10249 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8277           +23.8%      10249        GEO-MEAN sched_debug.cfs_=
rq[41]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        415 =C2=B1  7%     -25.6%        309 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        415           -25.6%        309        GEO-MEAN sched_debug.cfs_=
rq[26]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      32646 =C2=B1  5%     -27.7%      23597 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      32646           -27.7%      23596        GEO-MEAN sched_debug.cfs_=
rq[47]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         11 =C2=B1 22%     +77.1%         20 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14 =C2=B1  8%     +27.3%         18 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         13           +50.2%         19        GEO-MEAN sched_debug.cpu#=
19.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        445 =C2=B1  6%     -33.1%        297 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        444           -33.1%        297        GEO-MEAN sched_debug.cfs_=
rq[28]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   17189411 =C2=B1 12%     +57.7%   27104451 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30533255 =C2=B1  0%     -17.4%   25208231 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   22909576           +14.1%   26139152        GEO-MEAN sched_debug.cpu#=
25.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8318 =C2=B1 19%     +23.1%      10244 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8318           +23.1%      10244        GEO-MEAN sched_debug.cfs_=
rq[42]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7466 =C2=B1  7%     +90.2%      14197 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2928574 =C2=B1  0%     -13.5%    2534027 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   21686213 =C2=B1  1%     -24.5%   16369380 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     779786            +7.5%     838210        GEO-MEAN sched_debug.cpu#=
12.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8318 =C2=B1 19%     +23.2%      10246 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8318           +23.2%      10246        GEO-MEAN sched_debug.cfs_=
rq[44]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8320 =C2=B1 19%     +23.1%      10246 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8320           +23.1%      10246        GEO-MEAN sched_debug.cfs_=
rq[43]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      16126 =C2=B1 14%     +50.1%      24205 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   25625064 =C2=B1  1%     -21.6%   20086187 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     642837            +8.5%     697279        GEO-MEAN sched_debug.cpu#=
13.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1 10%     -20.0%         16 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >         17 =C2=B1 17%     +43.4%         25 =C2=B1 15%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18            +7.1%         20        GEO-MEAN sched_debug.cpu#=
16.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1 12%     +27.5%         21 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         17           +27.5%         21        GEO-MEAN sched_debug.cpu#=
7.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        713 =C2=B1  5%     -27.7%        515 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        713           -27.7%        515        GEO-MEAN sched_debug.cfs_=
rq[47]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10961 =C2=B1 27%     +79.4%      19666 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      10961           +79.4%      19666        GEO-MEAN sched_debug.cpu#=
70.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8319 =C2=B1 19%     +23.0%      10235 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8319           +23.0%      10235        GEO-MEAN sched_debug.cfs_=
rq[45]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        659 =C2=B1  4%     -32.2%        447 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        659           -32.2%        447        GEO-MEAN sched_debug.cfs_=
rq[42]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7304 =C2=B1 19%     -41.4%       4277 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      24956 =C2=B1  4%     +17.6%      29349 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      13501           -17.0%      11204        GEO-MEAN sched_debug.cpu#=
40.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4189 =C2=B1 12%     +44.5%       6051 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4189           +44.5%       6051        GEO-MEAN sched_debug.cpu#=
110.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  4%     -24.7%         19 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13 =C2=B1 26%     +48.8%         20 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18            +5.9%         19        GEO-MEAN sched_debug.cpu#=
40.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.93 =C2=B1 40%     +62.9%       1.51 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.48 =C2=B1  4%     -23.7%       1.13 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.17           +11.5%       1.31        GEO-MEAN perf-profile.cpu=
-cycles.__switch_to
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   17279000 =C2=B1 12%     +56.0%   26953707 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30917867 =C2=B1  0%     -16.9%   25707653 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   23113412           +13.9%   26323308        GEO-MEAN sched_debug.cpu#=
31.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   17290091 =C2=B1 12%     +55.9%   26954969 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30924268 =C2=B1  0%     -16.8%   25716265 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   23123222           +13.9%   26328333        GEO-MEAN sched_debug.cpu#=
31.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4.45 =C2=B1  1%     -11.6%       3.93 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       4.45           -11.6%       3.93        GEO-MEAN perf-profile.cpu=
-cycles.deactivate_task.__sched_text_start.schedule.schedule_timeout.unix_s=
tream_recvmsg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8326 =C2=B1 19%     +22.7%      10215 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8325           +22.7%      10215        GEO-MEAN sched_debug.cfs_=
rq[46]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      30211 =C2=B1  4%     -32.2%      20486 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      30211           -32.2%      20486        GEO-MEAN sched_debug.cfs_=
rq[42]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8319 =C2=B1 19%     +22.6%      10197 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       8319           +22.6%      10197        GEO-MEAN sched_debug.cfs_=
rq[47]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   11644496 =C2=B1 13%     +56.4%   18216544 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20618809 =C2=B1  0%     -15.7%   17385264 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   15495020           +14.9%   17796051        GEO-MEAN sched_debug.cpu#=
27.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1  6%     -12.1%         19 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         22           -12.1%         19        GEO-MEAN sched_debug.cfs_=
rq[2]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 19%     +62.2%         20 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +62.2%         19        GEO-MEAN sched_debug.cpu#=
22.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1 10%     -28.6%         15 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           -28.6%         15        GEO-MEAN sched_debug.cfs_=
rq[37]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1 10%     -28.6%         15 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           -28.6%         15        GEO-MEAN sched_debug.cfs_=
rq[37]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1  8%     +41.9%         20 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14           +41.9%         20        GEO-MEAN sched_debug.cpu#=
13.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7383 =C2=B1 19%     -44.1%       4124 =C2=B1 16%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      28557 =C2=B1  8%     -17.7%      23506 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14050 =C2=B1  2%      -9.9%      12664 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >      14361           -25.4%      10708        GEO-MEAN sched_debug.cpu#=
47.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   12348995 =C2=B1 14%     +57.9%   19497335 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   22509799 =C2=B1  0%     -15.2%   19080882 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   16672534           +15.7%   19287984        GEO-MEAN sched_debug.cpu#=
2.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   11773827 =C2=B1 11%     +57.4%   18530291 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20534273 =C2=B1  1%     -15.8%   17284516 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   15548857           +15.1%   17896567        GEO-MEAN sched_debug.cpu#=
25.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3689 =C2=B1 19%     -24.3%       2792 =C2=B1 15%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3689           -24.3%       2792        GEO-MEAN sched_debug.cpu#=
84.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        282 =C2=B1 18%     +31.4%        371 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        396 =C2=B1 13%     -25.1%        297 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        334            -0.8%        331        GEO-MEAN sched_debug.cfs_=
rq[21]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4740 =C2=B1 21%    +118.4%      10349 =C2=B1 36%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     879602 =C2=B1  1%     -11.5%     778421 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >      64570           +39.0%      89758        GEO-MEAN sched_debug.cpu#=
8.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8032 =C2=B1 16%     -22.5%       6222 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   19455420 =C2=B1  1%     -24.4%   14708872 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     395321           -23.5%     302520        GEO-MEAN sched_debug.cpu#=
44.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         24 =C2=B1  6%     -20.5%         19 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12 =C2=B1 20%     +64.9%         20 =C2=B1 12%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         17           +14.5%         19        GEO-MEAN sched_debug.cpu#=
40.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9375 =C2=B1 20%     +44.3%      13529 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   12271244 =C2=B1 12%     +58.5%   19451933 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   22069167 =C2=B1  0%     -15.4%   18674407 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1364251           +24.6%    1700184        GEO-MEAN sched_debug.cpu#=
6.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         11 =C2=B1 29%     +70.6%         19 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14 =C2=B1 10%     +35.7%         19 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         12           +52.2%         19        GEO-MEAN sched_debug.cpu#=
19.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7230 =C2=B1 16%     +54.3%      11153 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   19641786 =C2=B1  1%     -23.5%   15029146 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     376857            +8.6%     409421        GEO-MEAN sched_debug.cpu#=
42.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        356 =C2=B1 10%     +46.9%        524 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        356           +46.9%        523        GEO-MEAN sched_debug.cfs_=
rq[16]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6454 =C2=B1  7%     +69.5%      10937 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   11434344 =C2=B1 12%     +60.0%   18296120 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    2575345 =C2=B1  6%      +8.9%    2805431 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   19897448 =C2=B1  1%     -15.2%   16867976 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1394542           +25.8%    1754235        GEO-MEAN sched_debug.cpu#=
29.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        159 =C2=B1 23%     -40.4%         95 =C2=B1 15%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        608 =C2=B1  3%     -28.7%        433 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >        311           -34.8%        203        GEO-MEAN cpuidle.POLL.usa=
ge
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        427 =C2=B1  1%     -29.0%        303 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        594 =C2=B1  7%     -24.0%        451 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >        503           -26.6%        369        GEO-MEAN sched_debug.cfs_=
rq[27]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      16367 =C2=B1 10%     +46.5%      23982 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      16367           +46.5%      23982        GEO-MEAN sched_debug.cfs_=
rq[16]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1855 =C2=B1  5%     -10.7%       1657 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      10787 =C2=B1 17%     -48.1%       5597 =C2=B1 21%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      26923 =C2=B1  2%     +29.2%      34786 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       8137           -15.7%       6859        GEO-MEAN cpuidle.C3-IVT.u=
sage
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2377 =C2=B1 28%     +37.8%       3275 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2377           +37.8%       3275        GEO-MEAN sched_debug.cpu#=
106.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7152 =C2=B1 13%     +30.1%       9305 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7152           +30.1%       9305        GEO-MEAN sched_debug.cfs_=
rq[6]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        639 =C2=B1  3%     -28.1%        459 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        639           -28.1%        459        GEO-MEAN sched_debug.cfs_=
rq[39]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  3%     -29.1%         18 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -29.1%         18        GEO-MEAN sched_debug.cpu#=
45.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1371 =C2=B1 11%     +35.6%       1860 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1371           +35.6%       1859        GEO-MEAN sched_debug.cfs_=
rq[89]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      29270 =C2=B1  3%     -28.1%      21048 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      29270           -28.1%      21048        GEO-MEAN sched_debug.cfs_=
rq[39]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      66373 =C2=B1 13%     -23.6%      50702 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      66373           -23.6%      50702        GEO-MEAN slabinfo.kmalloc=
-256.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        742 =C2=B1 14%     -28.3%        532 =C2=B1 19%  ivb42/hackbench=
/performance-100%-threads-socket
> >        742           -28.3%        532        GEO-MEAN slabinfo.xfs_buf=
.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1 12%     -30.0%         11 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16           -30.0%         11        GEO-MEAN sched_debug.cfs_=
rq[30]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         11 =C2=B1  4%     +48.6%         17 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         11           +48.6%         17        GEO-MEAN sched_debug.cpu#=
14.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        742 =C2=B1 14%     -28.3%        532 =C2=B1 19%  ivb42/hackbench=
/performance-100%-threads-socket
> >        742           -28.3%        532        GEO-MEAN slabinfo.xfs_buf=
.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1 12%     -28.0%         12 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16           -28.0%         12        GEO-MEAN sched_debug.cfs_=
rq[30]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1  2%     -28.8%         12 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         17           -28.8%         12        GEO-MEAN sched_debug.cpu#=
27.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      67758 =C2=B1 12%     -23.5%      51824 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      67758           -23.5%      51824        GEO-MEAN slabinfo.kmalloc=
-512.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3881 =C2=B1  8%     -27.8%       2802 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3881           -27.8%       2802        GEO-MEAN sched_debug.cpu#=
55.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15720685 =C2=B1 11%     +52.2%   23926629 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26008985 =C2=B1  0%     -17.3%   21498163 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20220758           +12.2%   22679915        GEO-MEAN sched_debug.cpu#=
7.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  6%     -39.3%         11 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18 =C2=B1  2%     +14.3%         21 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         18           -16.7%         15        GEO-MEAN sched_debug.cfs_=
rq[28]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15728389 =C2=B1 11%     +52.2%   23931307 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26021354 =C2=B1  0%     -17.3%   21510179 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20230521           +12.1%   22688470        GEO-MEAN sched_debug.cpu#=
7.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      17210 =C2=B1  9%     +40.2%      24126 =C2=B1 22%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      13814 =C2=B1 10%     -38.5%       8490 =C2=B1 19%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    3917354 =C2=B1  4%     -13.8%    3376712 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   25569796 =C2=B1  0%     -21.9%   19978756 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     392839           -12.7%     342859        GEO-MEAN sched_debug.cpu#=
14.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4133 =C2=B1  5%     -28.8%       2941 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4133           -28.8%       2941        GEO-MEAN sched_debug.cpu#=
51.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15414448 =C2=B1 10%     +53.7%   23690369 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25437824 =C2=B1  0%     -19.0%   20602002 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   19801767           +11.6%   22092284        GEO-MEAN sched_debug.cpu#=
1.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        683 =C2=B1  3%     -27.8%        493 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        683           -27.8%        493        GEO-MEAN sched_debug.cfs_=
rq[45]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     654510 =C2=B1 16%     +17.7%     770657 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >    2295224 =C2=B1 23%     -35.1%    1489091 =C2=B1 45%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1225662           -12.6%    1071251        GEO-MEAN sched_debug.cfs_=
rq[12]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1  5%     -26.8%         17 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23           -26.8%         17        GEO-MEAN sched_debug.cpu#=
37.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1  6%     -23.2%         17 =C2=B1 23%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23           -23.2%         17        GEO-MEAN sched_debug.cpu#=
43.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.01 =C2=B1  2%     -18.4%       2.46 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       3.01           -18.4%       2.46        GEO-MEAN perf-profile.cpu=
-cycles.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__sch=
ed_text_start
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.91 =C2=B1  1%     -14.3%       3.35 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       3.91           -14.3%       3.35        GEO-MEAN perf-profile.cpu=
-cycles.dequeue_task_fair.dequeue_task.deactivate_task.__sched_text_start.s=
chedule
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        670 =C2=B1  5%     -30.2%        468 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        670           -30.2%        468        GEO-MEAN sched_debug.cfs_=
rq[36]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      30700 =C2=B1  5%     -30.1%      21472 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      30700           -30.1%      21472        GEO-MEAN sched_debug.cfs_=
rq[36]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5171 =C2=B1 12%     +78.1%       9208 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     883237 =C2=B1  2%     -11.9%     777826 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      67586           +25.2%      84633        GEO-MEAN sched_debug.cpu#=
1.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4.46 =C2=B1  1%     -11.2%       3.96 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       4.46           -11.2%       3.96        GEO-MEAN perf-profile.cpu=
-cycles.dequeue_task.deactivate_task.__sched_text_start.schedule.schedule_t=
imeout
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.89 =C2=B1 15%     -27.1%       2.11 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >       0.95 =C2=B1 12%     -29.1%       0.67 =C2=B1 19%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       1.66           -28.1%       1.19        GEO-MEAN perf-profile.cpu=
-cycles.security_file_permission.rw_verify_area.vfs_read.sys_read.system_ca=
ll_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   17777759 =C2=B1 10%     +54.6%   27486266 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   31354076 =C2=B1  0%     -16.7%   26120882 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   23609430           +13.5%   26794878        GEO-MEAN sched_debug.cpu#=
34.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  6%     -21.3%         19 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13 =C2=B1 24%     +55.0%         20 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18           +10.4%         20        GEO-MEAN sched_debug.cpu#=
40.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      11475 =C2=B1 31%     +79.7%      20626 =C2=B1 31%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   16828977 =C2=B1 15%     +61.6%   27191839 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >    3191735 =C2=B1  2%      +7.9%    3442470 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   30929790 =C2=B1  1%     -16.7%   25766295 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2089584           +27.1%    2655802        GEO-MEAN sched_debug.cpu#=
32.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        580 =C2=B1 12%     -38.8%        355 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        582 =C2=B1  4%     -14.7%        496 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >        581           -27.7%        419        GEO-MEAN sched_debug.cfs_=
rq[47]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      16557 =C2=B1  8%     +45.9%      24152 =C2=B1 26%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   30196745 =C2=B1  1%     -19.4%   24347741 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     707088            +8.5%     766845        GEO-MEAN sched_debug.cpu#=
41.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      16853 =C2=B1 13%     +58.8%      26761 =C2=B1 27%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   15740913 =C2=B1 12%     +55.7%   24510192 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26216240 =C2=B1  1%     -17.9%   21529356 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1908802           +26.6%    2417111        GEO-MEAN sched_debug.cpu#=
8.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      15445 =C2=B1 10%     +48.8%      22974 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   17102719 =C2=B1 11%     +59.6%   27293530 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30424082 =C2=B1  0%     -16.8%   25305405 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2003042           +25.5%    2512898        GEO-MEAN sched_debug.cpu#=
30.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5615 =C2=B1 23%     -32.3%       3801 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      27987 =C2=B1  9%     -16.0%      23509 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14093 =C2=B1  3%      -9.5%      12748 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >      13035           -19.9%      10444        GEO-MEAN sched_debug.cpu#=
25.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4417 =C2=B1 20%     +65.5%       7308 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     859082 =C2=B1  1%     -12.0%     756012 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      61602           +20.7%      74332        GEO-MEAN sched_debug.cpu#=
37.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1814 =C2=B1  9%     -24.7%       1365 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1814           -24.7%       1365        GEO-MEAN sched_debug.cpu#=
112.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15485508 =C2=B1 11%     +52.3%   23577239 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25532967 =C2=B1  1%     -18.3%   20857796 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   19884441           +11.5%   22175871        GEO-MEAN sched_debug.cpu#=
4.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.09 =C2=B1  9%     -28.2%       0.78 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.09           -28.2%       0.78        GEO-MEAN perf-profile.cpu=
-cycles.file_has_perm.selinux_file_permission.security_file_permission.rw_v=
erify_area.vfs_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 24%     +66.7%         20 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14 =C2=B1  6%     +30.2%         18 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         13           +47.3%         19        GEO-MEAN sched_debug.cpu#=
19.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 24%     +72.2%         20 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14 =C2=B1  8%     +27.3%         18 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         13           +48.1%         19        GEO-MEAN sched_debug.cpu#=
19.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      22705 =C2=B1  8%     +31.3%      29822 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      22705           +31.3%      29822        GEO-MEAN sched_debug.cpu#=
20.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   11363979 =C2=B1 12%     +60.6%   18249720 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   19520181 =C2=B1  0%     -14.6%   16662350 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   14893855           +17.1%   17437982        GEO-MEAN sched_debug.cpu#=
28.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  4%     -26.0%         19 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13 =C2=B1 26%     +46.3%         20 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18            +4.1%         19        GEO-MEAN sched_debug.cpu#=
40.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        304 =C2=B1 10%     +29.8%        394 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        304           +29.8%        394        GEO-MEAN sched_debug.cfs_=
rq[18]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   16225534 =C2=B1 12%     +54.3%   25043461 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26692010 =C2=B1  0%     -17.7%   21973527 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20810865           +12.7%   23458328        GEO-MEAN sched_debug.cpu#=
11.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14.75 =C2=B1 19%     -32.9%       9.90 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      11.09 =C2=B1 10%     -26.9%       8.11 =C2=B1 18%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      12.79           -30.0%       8.96        GEO-MEAN perf-profile.cpu=
-cycles.consume_skb.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync=
_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1 10%     -13.4%         19 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12 =C2=B1 20%     +64.9%         20 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         16           +19.5%         19        GEO-MEAN sched_debug.cpu#=
40.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   16292415 =C2=B1  7%     +51.7%   24718068 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26524961 =C2=B1  0%     -17.8%   21793394 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20788354           +11.6%   23209709        GEO-MEAN sched_debug.cpu#=
10.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12271 =C2=B1 32%     -43.2%       6968 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   26295715 =C2=B1  1%     -21.6%   20610286 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     568052           -33.3%     378971        GEO-MEAN sched_debug.cpu#=
21.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      17232 =C2=B1 12%     +26.9%      21875 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   15433879 =C2=B1 11%     +61.1%   24860000 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26700103 =C2=B1  1%     -19.1%   21595767 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1922116           +18.3%    2273040        GEO-MEAN sched_debug.cpu#=
9.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   16303455 =C2=B1  7%     +51.7%   24728475 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26544024 =C2=B1  0%     -17.7%   21833203 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20802867           +11.7%   23235787        GEO-MEAN sched_debug.cpu#=
10.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4411 =C2=B1 14%     +97.3%       8701 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2197327 =C2=B1  3%     +12.1%    2463596 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     863764 =C2=B1  1%      -9.4%     782356 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     203052           +26.1%     255965        GEO-MEAN sched_debug.cpu#=
5.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1  6%     -10.6%         19 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >         22           -10.6%         19        GEO-MEAN sched_debug.cpu#=
2.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8018 =C2=B1 15%     +33.6%      10715 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       5953 =C2=B1 21%     +74.9%      10412 =C2=B1 25%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   11483246 =C2=B1 13%     +60.7%   18459096 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20008939 =C2=B1  0%     -15.6%   16896437 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     323617           +33.5%     431905        GEO-MEAN sched_debug.cpu#=
32.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      17533 =C2=B1 13%     +34.5%      23588 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      17533           +34.5%      23587        GEO-MEAN sched_debug.cpu#=
58.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  3%     -29.9%         18 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         25           -29.9%         17        GEO-MEAN sched_debug.cpu#=
45.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  5%     -24.4%         19 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26           -24.4%         19        GEO-MEAN sched_debug.cpu#=
38.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  4%     -30.3%         17 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         25           -30.3%         17        GEO-MEAN sched_debug.cpu#=
37.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  3%     -29.3%         17 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24           -29.3%         17        GEO-MEAN sched_debug.cpu#=
39.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  3%     -28.0%         18 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24           -28.0%         17        GEO-MEAN sched_debug.cpu#=
37.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        435 =C2=B1  8%     -31.4%        298 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        349 =C2=B1  3%     +31.1%        458 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        390            -5.2%        369        GEO-MEAN sched_debug.cfs_=
rq[33]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7143 =C2=B1 13%     +27.8%       9131 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7143           +27.8%       9131        GEO-MEAN sched_debug.cfs_=
rq[5]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15737422 =C2=B1 12%     +50.4%   23663020 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25599960 =C2=B1  0%     -19.5%   20605928 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20071806           +10.0%   22081632        GEO-MEAN sched_debug.cpu#=
0.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3865 =C2=B1 14%     +66.8%       6448 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     865949 =C2=B1  2%      -8.8%     789915 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      57856           +23.4%      71367        GEO-MEAN sched_debug.cpu#=
33.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4097 =C2=B1 15%     -28.2%       2941 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      78671 =C2=B1 26%     -48.2%      40787 =C2=B1 29%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1472841 =C2=B1  1%     -15.7%    1241382 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >      78013           -32.1%      53004        GEO-MEAN sched_debug.cpu#=
21.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        108 =C2=B1 29%     +74.5%        189 =C2=B1 21%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        108           +74.5%        189        GEO-MEAN sched_debug.cfs_=
rq[11]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        459 =C2=B1  8%     -30.6%        318 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        611 =C2=B1 12%     -19.3%        493 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >        529           -25.2%        396        GEO-MEAN sched_debug.cfs_=
rq[34]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        321 =C2=B1 11%     +34.5%        432 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        652 =C2=B1  5%     -21.2%        514 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >        457            +3.0%        471        GEO-MEAN sched_debug.cfs_=
rq[17]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1 12%     -36.2%         14 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13 =C2=B1 24%     +48.8%         20 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         17            -2.6%         17        GEO-MEAN sched_debug.cfs_=
rq[40]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        659 =C2=B1 14%     -23.4%        505 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >        659           -23.4%        505        GEO-MEAN sched_debug.cfs_=
rq[1]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1850 =C2=B1 11%     -21.4%       1454 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1850           -21.4%       1454        GEO-MEAN sched_debug.cpu#=
116.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      18037 =C2=B1 11%     -30.9%      12471 =C2=B1 20%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   25682384 =C2=B1  0%     -22.1%   20009219 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     680612           -26.6%     499548        GEO-MEAN sched_debug.cpu#=
15.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      21409 =C2=B1  6%     +31.4%      28140 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   15408401 =C2=B1 10%     +53.7%   23680354 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25429518 =C2=B1  0%     -19.0%   20597694 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2031902           +17.8%    2394291        GEO-MEAN sched_debug.cpu#=
1.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3985 =C2=B1  2%     -26.7%       2920 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3985           -26.7%       2920        GEO-MEAN sched_debug.cpu#=
52.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     207498 =C2=B1 12%     +26.5%     262500 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     207498           +26.5%     262500        GEO-MEAN sched_debug.cfs_=
rq[23]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      16654 =C2=B1 13%     +48.5%      24724 =C2=B1 24%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      16868 =C2=B1 22%     +37.9%      23264 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   17534415 =C2=B1 14%     +61.2%   28267329 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    3492372 =C2=B1  3%      -9.1%    3175249 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   31557915 =C2=B1  0%     -16.4%   26383001 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     885007           +20.2%    1063749        GEO-MEAN sched_debug.cpu#=
35.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      30.79 =C2=B1 15%     +35.8%      41.81 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      30.79           +35.8%      41.81        GEO-MEAN perf-profile.cpu=
-cycles._raw_spin_lock_irqsave.prepare_to_wait.sock_alloc_send_pskb.unix_st=
ream_sendmsg.sock_aio_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5061398 =C2=B1 12%     +26.5%    6402439 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5061398           +26.5%    6402439        GEO-MEAN sched_debug.cfs_=
rq[23]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15520997 =C2=B1  9%     +52.7%   23705723 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25252993 =C2=B1  1%     -18.0%   20700339 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   19797768           +11.9%   22152122        GEO-MEAN sched_debug.cpu#=
2.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15518742 =C2=B1  9%     +52.7%   23702598 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25242747 =C2=B1  1%     -18.0%   20695565 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   19792313           +11.9%   22148107        GEO-MEAN sched_debug.cpu#=
2.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5733 =C2=B1 13%     -39.4%       3474 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      27414 =C2=B1  7%      -9.0%      24942 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      12537           -25.7%       9309        GEO-MEAN sched_debug.cpu#=
28.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   12027700 =C2=B1 13%     +51.3%   18194381 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20609132 =C2=B1  0%     -15.8%   17362846 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   15744220           +12.9%   17773751        GEO-MEAN sched_debug.cpu#=
26.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1508175 =C2=B1 18%     +37.7%    2076043 =C2=B1 16%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1508175           +37.7%    2076043        GEO-MEAN sched_debug.cfs_=
rq[21]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.82 =C2=B1  8%     +39.7%       1.15 =C2=B1 23%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      14.75 =C2=B1  1%     -12.6%      12.89 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       3.48           +10.5%       3.85        GEO-MEAN perf-profile.cpu=
-cycles.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_d=
ef_readable.unix_stream_sendmsg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1 22%     -31.0%         16 =C2=B1 20%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14 =C2=B1 17%     +33.3%         18 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18            -4.1%         17        GEO-MEAN sched_debug.cpu#=
39.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4047900 =C2=B1  7%     -26.6%    2971876 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4047900           -26.6%    2971876        GEO-MEAN sched_debug.cfs_=
rq[84]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      31.10 =C2=B1 14%     +35.4%      42.10 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      31.10           +35.4%      42.10        GEO-MEAN perf-profile.cpu=
-cycles.prepare_to_wait.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_w=
rite.do_sync_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        558 =C2=B1  6%     -31.9%        380 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        558           -31.9%        380        GEO-MEAN sched_debug.cfs_=
rq[36]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3145 =C2=B1 10%     +71.0%       5380 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2258112 =C2=B1  4%     +10.3%    2489655 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      84279           +37.3%     115738        GEO-MEAN sched_debug.cpu#=
29.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.82 =C2=B1  7%     +39.0%       1.14 =C2=B1 23%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      14.50 =C2=B1  1%     -13.3%      12.57 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       3.45            +9.8%       3.79        GEO-MEAN perf-profile.cpu=
-cycles.default_wake_function.autoremove_wake_function.__wake_up_common.__w=
ake_up_sync_key.sock_def_readable
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.09 =C2=B1 13%     -35.3%       0.70 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.09           -35.3%       0.70        GEO-MEAN perf-profile.cpu=
-cycles.__srcu_read_lock.fsnotify.vfs_write.sys_write.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      16175 =C2=B1 14%     +26.8%      20509 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      16174           +26.8%      20509        GEO-MEAN numa-vmstat.node=
1.numa_other
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9151 =C2=B1 13%     +36.5%      12495 =C2=B1 21%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   11781359 =C2=B1 14%     +55.6%   18330287 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   20626695 =C2=B1  0%     -16.6%   17207030 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1305291           +21.0%    1579580        GEO-MEAN sched_debug.cpu#=
31.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15865603 =C2=B1  9%     +51.7%   24075127 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25755165 =C2=B1  0%     -18.0%   21119793 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20214382           +11.5%   22549095        GEO-MEAN sched_debug.cpu#=
6.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  1%     -36.1%         17 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         15 =C2=B1 13%     +31.9%         20 =C2=B1 14%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20            -8.2%         19        GEO-MEAN sched_debug.cpu#=
44.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      30191 =C2=B1  5%     -29.3%      21352 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      30190           -29.3%      21352        GEO-MEAN sched_debug.cfs_=
rq[37]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3879 =C2=B1 18%     -28.9%       2758 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3879           -28.9%       2758        GEO-MEAN sched_debug.cpu#=
85.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.88 =C2=B1  7%     +37.1%       1.21 =C2=B1 22%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      15.05 =C2=B1  1%     -11.8%      13.27 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >       3.64           +10.0%       4.00        GEO-MEAN perf-profile.cpu=
-cycles.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_s=
endmsg.sock_aio_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6570 =C2=B1 18%     -29.7%       4615 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       6570           -29.7%       4615        GEO-MEAN sched_debug.cpu#=
39.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.98 =C2=B1 12%     -35.4%       0.63 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >       0.98           -35.4%       0.63        GEO-MEAN perf-profile.cpu=
-cycles.copy_user_enhanced_fast_string.skb_copy_datagram_from_iovec.unix_st=
ream_sendmsg.sock_aio_write.do_sync_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   17038360 =C2=B1 13%     +58.6%   27029572 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    3294532 =C2=B1  6%     +12.7%    3712740 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   30130205 =C2=B1  0%     -16.7%   25101385 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   11914465           +14.2%   13606418        GEO-MEAN sched_debug.cpu#=
29.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   17102761 =C2=B1 13%     +58.5%   27104251 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    3297892 =C2=B1  6%     +12.6%    3714290 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   30140313 =C2=B1  0%     -16.7%   25115800 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   11934845           +14.1%   13623439        GEO-MEAN sched_debug.cpu#=
29.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5402 =C2=B1 18%     -29.1%       3830 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      28528 =C2=B1  7%     -14.0%      24532 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      12414           -21.9%       9693        GEO-MEAN sched_debug.cpu#=
30.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  3%     -30.3%         17 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         25           -30.3%         17        GEO-MEAN sched_debug.cpu#=
42.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        658 =C2=B1  5%     -29.2%        466 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        658           -29.2%        466        GEO-MEAN sched_debug.cfs_=
rq[37]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3422 =C2=B1 45%     -50.3%       1702 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     876946 =C2=B1  1%     -16.9%     728531 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      54780           -35.7%      35216        GEO-MEAN sched_debug.cpu#=
21.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   16891713 =C2=B1 15%     +61.0%   27201743 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >    3209126 =C2=B1  2%      +7.3%    3442495 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   30944860 =C2=B1  1%     -16.7%   25778928 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   11881820           +12.9%   13414617        GEO-MEAN sched_debug.cpu#=
32.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     737173 =C2=B1 24%     +38.4%    1020501 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >     737173           +38.4%    1020501        GEO-MEAN sched_debug.cpu#=
47.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4139 =C2=B1 14%     +27.5%       5277 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       4138           +27.5%       5277        GEO-MEAN sched_debug.cpu#=
17.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15354091 =C2=B1 12%     +53.0%   23491482 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25405187 =C2=B1  1%     -18.1%   20818635 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   19750280           +12.0%   22114714        GEO-MEAN sched_debug.cpu#=
3.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7724 =C2=B1 15%     -46.1%       4160 =C2=B1 16%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      28134 =C2=B1  7%     -12.1%      24727 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      29633 =C2=B1  1%      -9.1%      26932 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      14168 =C2=B1  3%     -11.3%      12566 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >      17379           -21.4%      13659        GEO-MEAN sched_debug.cpu#=
44.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.65 =C2=B1  0%     +24.0%       2.05 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      14.53 =C2=B1  1%     -12.9%      12.66 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       4.90            +3.9%       5.09        GEO-MEAN perf-profile.cpu=
-cycles.try_to_wake_up.default_wake_function.autoremove_wake_function.__wak=
e_up_common.__wake_up_sync_key
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14337 =C2=B1 13%     -29.1%      10161 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   26674784 =C2=B1  1%     -23.1%   20500535 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     618414           -26.2%     456420        GEO-MEAN sched_debug.cpu#=
22.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         11 =C2=B1 22%     +74.3%         20 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18 =C2=B1  2%      +7.3%         19 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         14           +36.7%         19        GEO-MEAN sched_debug.cpu#=
22.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4130334 =C2=B1  6%     -28.0%    2974799 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4130334           -28.0%    2974799        GEO-MEAN sched_debug.cfs_=
rq[76]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        457 =C2=B1 16%     -22.1%        356 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        457           -22.1%        356        GEO-MEAN sched_debug.cfs_=
rq[35]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        575 =C2=B1  9%     -23.0%        442 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >        575           -23.0%        442        GEO-MEAN slabinfo.tasksta=
ts.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        575 =C2=B1  9%     -23.0%        442 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >        575           -23.0%        442        GEO-MEAN slabinfo.tasksta=
ts.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4491 =C2=B1 18%     +41.5%       6353 =C2=B1 16%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4490           +41.5%       6353        GEO-MEAN sched_debug.cpu#=
56.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7535 =C2=B1 13%     -46.5%       4029 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      14193 =C2=B1  2%     -10.5%      12697 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      10341           -30.8%       7152        GEO-MEAN sched_debug.cpu#=
46.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27484 =C2=B1  6%     -21.9%      21460 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      18247 =C2=B1  5%     -20.7%      14477 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   12296466 =C2=B1 14%     +60.2%   19704481 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   22444826 =C2=B1  1%     -14.2%   19266125 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     609946            -3.9%     586031        GEO-MEAN sched_debug.cpu#=
0.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6887 =C2=B1 20%     -39.9%       4142 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      28082 =C2=B1  7%     -11.3%      24899 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      13906           -27.0%      10155        GEO-MEAN sched_debug.cpu#=
37.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  2%     -22.4%         15 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -22.4%         15        GEO-MEAN sched_debug.cpu#=
30.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1 22%     +46.2%         19 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +46.2%         18        GEO-MEAN sched_debug.cpu#=
22.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1 12%     +45.0%         19 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         13           +45.0%         19        GEO-MEAN sched_debug.cpu#=
19.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  5%     -23.6%         14 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           -23.6%         13        GEO-MEAN sched_debug.cpu#=
27.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1 10%     +48.7%         19 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +48.7%         19        GEO-MEAN sched_debug.cfs_=
rq[12]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1  8%     +32.6%         19 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14           +32.6%         18        GEO-MEAN sched_debug.cpu#=
13.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2742 =C2=B1 20%     +28.1%       3514 =C2=B1  7%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       6547 =C2=B1  8%     -23.8%       4992 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   21754207 =C2=B1  0%     -24.2%   16487812 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      73099            -9.5%      66134        GEO-MEAN sched_debug.cpu#=
22.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      30288 =C2=B1  5%     -26.5%      22265 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      30288           -26.5%      22265        GEO-MEAN sched_debug.cfs_=
rq[40]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5.33 =C2=B1 18%     -31.2%       3.67 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >       3.32 =C2=B1  9%     -24.1%       2.52 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       4.21           -27.7%       3.04        GEO-MEAN perf-profile.cpu=
-cycles.skb_release_data.skb_release_all.consume_skb.unix_stream_recvmsg.so=
ck_aio_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     820452 =C2=B1  1%     -14.9%     698371 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     852002 =C2=B1 25%     +61.6%    1376769 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     836078           +17.3%     980559        GEO-MEAN sched_debug.cpu#=
14.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        661 =C2=B1  5%     -26.5%        486 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        661           -26.5%        485        GEO-MEAN sched_debug.cfs_=
rq[40]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      81817 =C2=B1 11%     -20.4%      65120 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      81817           -20.4%      65120        GEO-MEAN slabinfo.kmalloc=
-256.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.19 =C2=B1 15%     -35.7%       0.76 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.19           -35.7%       0.76        GEO-MEAN perf-profile.cpu=
-cycles.system_call
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1278 =C2=B1 11%     -20.4%       1017 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1277           -20.4%       1017        GEO-MEAN slabinfo.kmalloc=
-256.active_slabs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1278 =C2=B1 11%     -20.4%       1017 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1277           -20.4%       1017        GEO-MEAN slabinfo.kmalloc=
-256.num_slabs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4015 =C2=B1  9%     -21.6%       3150 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4015           -21.6%       3149        GEO-MEAN sched_debug.cpu#=
56.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7131 =C2=B1 13%     +26.0%       8988 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       7131           +26.0%       8988        GEO-MEAN sched_debug.cfs_=
rq[4]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1 12%     -27.1%         17 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         23           -27.1%         17        GEO-MEAN sched_debug.cpu#=
29.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1 14%     +25.5%         23 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18           +25.5%         23        GEO-MEAN sched_debug.cpu#=
22.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      17505 =C2=B1 13%     +35.9%      23793 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   15340856 =C2=B1  8%     +55.1%   23793350 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    3152835 =C2=B1  6%     +16.2%    3662411 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   25624862 =C2=B1  0%     -18.0%   21018684 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2158234           +19.0%    2569348        GEO-MEAN sched_debug.cpu#=
5.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7005 =C2=B1 15%     +70.4%      11936 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2854139 =C2=B1  2%      -9.5%    2581771 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   19904854 =C2=B1  1%     -24.2%   15083433 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     735560            +5.3%     774626        GEO-MEAN sched_debug.cpu#=
36.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2119713 =C2=B1  9%     -31.4%    1453596 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    1336731 =C2=B1 24%     +41.1%    1886101 =C2=B1 10%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1683296            -1.6%    1655786        GEO-MEAN sched_debug.cfs_=
rq[18]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.27 =C2=B1 11%     +37.2%       1.75 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       1.27           +37.2%       1.75        GEO-MEAN perf-profile.cpu=
-cycles.do_sys_poll.sys_poll.system_call_fastpath.poll.start_thread
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      18892 =C2=B1  8%     +39.1%      26286 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   15335716 =C2=B1 12%     +53.2%   23488460 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25398742 =C2=B1  1%     -18.1%   20807675 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1945080           +20.4%    2342099        GEO-MEAN sched_debug.cpu#=
3.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1700 =C2=B1 11%     -21.1%       1342 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1700           -21.1%       1342        GEO-MEAN sched_debug.cpu#=
98.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1468667 =C2=B1 15%     +43.2%    2102926 =C2=B1  9%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1468667           +43.2%    2102926        GEO-MEAN sched_debug.cfs_=
rq[22]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3913375 =C2=B1  5%     -26.5%    2877791 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    3913375           -26.5%    2877791        GEO-MEAN sched_debug.cfs_=
rq[86]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1291 =C2=B1 11%     -20.1%       1031 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1291           -20.1%       1031        GEO-MEAN slabinfo.kmalloc=
-512.num_slabs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1291 =C2=B1 11%     -20.1%       1031 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1291           -20.1%       1031        GEO-MEAN slabinfo.kmalloc=
-512.active_slabs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        147 =C2=B1  2%     +35.1%        199 =C2=B1 16%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        147           +35.1%        198        GEO-MEAN sched_debug.cfs_=
rq[34]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      82655 =C2=B1 11%     -20.1%      66035 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      82655           -20.1%      66034        GEO-MEAN slabinfo.kmalloc=
-512.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12164 =C2=B1 25%     +90.9%      23225 =C2=B1 38%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   31047087 =C2=B1  1%     -19.2%   25085514 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     614554           +24.2%     763289        GEO-MEAN sched_debug.cpu#=
45.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         10 =C2=B1 23%     -25.5%          7 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         14 =C2=B1  6%     +47.7%         21 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12            +4.9%         12        GEO-MEAN sched_debug.cpu#=
15.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5153 =C2=B1 14%     -28.1%       3705 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      27914 =C2=B1  6%     -11.6%      24667 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      11993           -20.3%       9560        GEO-MEAN sched_debug.cpu#=
26.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.96 =C2=B1  6%     +43.2%       1.37 =C2=B1 23%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      23.87 =C2=B1  1%     -10.7%      21.31 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       4.78           +13.1%       5.40        GEO-MEAN perf-profile.cpu=
-cycles.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_aio_w=
rite.do_sync_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  3%     -28.9%         18 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         15 =C2=B1 19%     +28.9%         19 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         19            -4.3%         18        GEO-MEAN sched_debug.cpu#=
39.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        536 =C2=B1  8%     -35.4%        346 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        536 =C2=B1  6%     +12.2%        602 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >        536           -14.9%        456        GEO-MEAN sched_debug.cfs_=
rq[42]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3561 =C2=B1 10%     +61.8%       5763 =C2=B1 26%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3561           +61.8%       5763        GEO-MEAN sched_debug.cpu#=
111.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     291407 =C2=B1  4%     +31.7%     383859 =C2=B1  6%  ivb42/hackbench=
/performance-50%-threads-socket
> >     291407           +31.7%     383859        GEO-MEAN proc-vmstat.numa=
_pte_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1 10%     -37.9%         12 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19 =C2=B1  0%     +10.5%         21 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           -17.2%         15        GEO-MEAN sched_debug.cpu#=
28.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6197 =C2=B1 19%     -21.6%       4858 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     860253 =C2=B1  1%     -13.1%     747838 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      73017           -17.5%      60274        GEO-MEAN sched_debug.cpu#=
44.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      18668 =C2=B1 11%     +22.2%      22817 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   16200259 =C2=B1 12%     +54.6%   25039683 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   26676971 =C2=B1  0%     -17.7%   21964784 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2005643           +15.9%    2323839        GEO-MEAN sched_debug.cpu#=
11.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.28 =C2=B1 11%     +36.4%       1.75 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       1.28           +36.4%       1.75        GEO-MEAN perf-profile.cpu=
-cycles.sys_poll.system_call_fastpath.poll.start_thread
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   15413656 =C2=B1  9%     +55.1%   23913955 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >    3160285 =C2=B1  6%     +15.9%    3664235 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   25640553 =C2=B1  0%     -18.0%   21025853 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   10769274           +13.8%   12259218        GEO-MEAN sched_debug.cpu#=
5.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7197 =C2=B1  9%     +41.0%      10147 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7197           +41.0%      10146        GEO-MEAN sched_debug.cpu#=
52.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8244 =C2=B1  3%     -24.8%       6200 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   17001269 =C2=B1 14%     +56.0%   26513630 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   30298989 =C2=B1  0%     -17.1%   25132450 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1619381            -0.9%    1604646        GEO-MEAN sched_debug.cpu#=
28.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   20399319 =C2=B1  1%     -24.9%   15320065 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20399319           -24.9%   15320065        GEO-MEAN sched_debug.cpu#=
47.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        434 =C2=B1 11%     -28.6%        310 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        600 =C2=B1  6%     -17.5%        495 =C2=B1 15%  ivb42/hackbench=
/performance-100%-threads-socket
> >        510           -23.3%        391        GEO-MEAN sched_debug.cfs_=
rq[30]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        322 =C2=B1 14%     +29.0%        415 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        322           +29.0%        415        GEO-MEAN numa-vmstat.node=
1.nr_page_table_pages
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        518 =C2=B1  9%     -26.3%        381 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        517           -26.3%        381        GEO-MEAN sched_debug.cfs_=
rq[39]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.30 =C2=B1 11%     +36.2%       1.77 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       1.30           +36.2%       1.77        GEO-MEAN perf-profile.cpu=
-cycles.poll.start_thread
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      16455 =C2=B1  9%     +26.0%      20741 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      16455           +26.0%      20741        GEO-MEAN sched_debug.cpu#=
52.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4239 =C2=B1 11%     -28.6%       3026 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4238           -28.6%       3026        GEO-MEAN sched_debug.cpu#=
50.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3909 =C2=B1  5%     -23.9%       2976 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3909           -23.9%       2976        GEO-MEAN sched_debug.cpu#=
59.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1  3%     -32.9%         18 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16 =C2=B1 13%     +27.1%         20 =C2=B1 12%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20            -7.7%         19        GEO-MEAN sched_debug.cpu#=
44.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4027310 =C2=B1  6%     -25.3%    3007061 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4027310           -25.3%    3007061        GEO-MEAN sched_debug.cfs_=
rq[87]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   21955842 =C2=B1  1%     -25.2%   16425955 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   21955842           -25.2%   16425955        GEO-MEAN sched_debug.cpu#=
19.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4086 =C2=B1 24%     +62.7%       6648 =C2=B1 17%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2265114 =C2=B1  5%     +14.0%    2581650 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     860005 =C2=B1  1%     -12.9%     748893 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >     199669           +17.3%     234246        GEO-MEAN sched_debug.cpu#=
42.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   21384750 =C2=B1  0%     -24.7%   16103640 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   21384750           -24.7%   16103640        GEO-MEAN sched_debug.cpu#=
21.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         11 =C2=B1 10%     +34.3%         15 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         15 =C2=B1  7%     +23.4%         19 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         13           +28.7%         17        GEO-MEAN sched_debug.cfs_=
rq[16]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     -24.1%         14 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -24.1%         14        GEO-MEAN sched_debug.cpu#=
27.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  5%     +26.8%         23 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           +26.8%         23        GEO-MEAN sched_debug.cpu#=
7.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.98 =C2=B1 15%     -34.1%       0.64 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >       0.98           -34.1%       0.64        GEO-MEAN perf-profile.cpu=
-cycles.__srcu_read_unlock.fsnotify.vfs_write.sys_write.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     -20.7%         15 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -20.7%         15        GEO-MEAN sched_debug.cpu#=
29.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  5%     +25.0%         23 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           +25.0%         23        GEO-MEAN sched_debug.cpu#=
7.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1  3%     +89.2%         23 =C2=B1 35%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         15 =C2=B1  7%     +23.4%         19 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20 =C2=B1  4%     -10.7%         18 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >         15           +27.8%         20        GEO-MEAN sched_debug.cpu#=
16.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1999 =C2=B1 13%     -21.2%       1575 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1999           -21.2%       1575        GEO-MEAN sched_debug.cpu#=
79.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10562 =C2=B1 13%     +29.7%      13701 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   12153175 =C2=B1 13%     +58.1%   19209563 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >   21278578 =C2=B1  0%     -14.0%   18299464 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1397846           +20.8%    1688782        GEO-MEAN sched_debug.cpu#=
4.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        528 =C2=B1  2%     -19.4%        425 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        528           -19.4%        425        GEO-MEAN sched_debug.cfs_=
rq[31]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     165567 =C2=B1  9%     -37.0%     104359 =C2=B1 33%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   17557884 =C2=B1 14%     +61.0%   28269645 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >    3504314 =C2=B1  3%      -9.4%    3175807 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   31570143 =C2=B1  0%     -16.4%   26389314 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    4234785            -6.4%    3965367        GEO-MEAN sched_debug.cpu#=
35.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1287 =C2=B1 14%     +28.8%       1658 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       1287           +28.8%       1658        GEO-MEAN numa-meminfo.nod=
e1.PageTables
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        675 =C2=B1  0%     -36.7%        427 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        869 =C2=B1  5%      +8.4%        942 =C2=B1  0%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        766           -17.2%        634        GEO-MEAN sched_debug.cfs_=
rq[41]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5831 =C2=B1 13%     -37.8%       3624 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      27873 =C2=B1  4%      -9.6%      25194 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14332 =C2=B1  2%      -9.0%      13045 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >      13256           -20.0%      10600        GEO-MEAN sched_debug.cpu#=
33.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.24 =C2=B1 12%     +27.6%       4.13 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3.24           +27.6%       4.13        GEO-MEAN perf-profile.cpu=
-cycles.clockevents_program_event.tick_program_event.hrtimer_interrupt.loca=
l_apic_timer_interrupt.smp_apic_timer_interrupt
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      30899 =C2=B1  0%     -36.6%      19596 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      39777 =C2=B1  5%      +8.8%      43276 =C2=B1  0%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      35058           -16.9%      29121        GEO-MEAN sched_debug.cfs_=
rq[41]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      15605 =C2=B1  4%     +52.6%      23814 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    3926577 =C2=B1  2%     -14.6%    3352124 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   25785235 =C2=B1  0%     -21.6%   20221040 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1164715            +0.7%    1173065        GEO-MEAN sched_debug.cpu#=
12.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2262327 =C2=B1 11%     -25.5%    1684998 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2262327           -25.5%    1684998        GEO-MEAN sched_debug.cfs_=
rq[20]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      24185 =C2=B1  2%     -19.4%      19484 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      24184           -19.4%      19483        GEO-MEAN sched_debug.cfs_=
rq[31]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.25 =C2=B1 12%     +27.4%       4.14 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3.25           +27.4%       4.14        GEO-MEAN perf-profile.cpu=
-cycles.tick_program_event.hrtimer_interrupt.local_apic_timer_interrupt.smp=
_apic_timer_interrupt.apic_timer_interrupt
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        117 =C2=B1 31%     +53.6%        179 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        117           +53.6%        179        GEO-MEAN sched_debug.cfs_=
rq[24]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4066351 =C2=B1  5%     -25.6%    3025134 =C2=B1  3%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4066351           -25.6%    3025134        GEO-MEAN sched_debug.cfs_=
rq[85]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.92 =C2=B1 12%     -33.0%       0.62 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >       0.92           -33.0%       0.62        GEO-MEAN perf-profile.cpu=
-cycles.system_call_after_swapgs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1  9%     -28.3%         12 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21 =C2=B1  7%     +20.0%         26 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         19            -7.2%         18        GEO-MEAN sched_debug.cpu#=
29.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      25356 =C2=B1  6%     +13.7%      28842 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   15698679 =C2=B1 12%     +50.7%   23654259 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   25587783 =C2=B1  0%     -19.5%   20590387 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2167687           +11.3%    2412887        GEO-MEAN sched_debug.cpu#=
0.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4144596 =C2=B1  5%     -26.6%    3041569 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4144596           -26.6%    3041569        GEO-MEAN sched_debug.cfs_=
rq[75]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   20991987 =C2=B1  0%     -24.1%   15929117 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20991987           -24.1%   15929117        GEO-MEAN sched_debug.cpu#=
20.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   20232670 =C2=B1  1%     -24.7%   15244668 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20232670           -24.7%   15244668        GEO-MEAN sched_debug.cpu#=
43.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.41 =C2=B1  9%     +25.3%       3.02 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2.41           +25.3%       3.02        GEO-MEAN turbostat.%c1
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        164 =C2=B1 10%     +35.2%        221 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         88 =C2=B1 18%     +28.8%        113 =C2=B1 11%  ivb42/hackbench=
/performance-100%-threads-socket
> >        120           +31.9%        158        GEO-MEAN sched_debug.cfs_=
rq[40]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1775 =C2=B1 11%     -23.4%       1359 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1775           -23.4%       1359        GEO-MEAN sched_debug.cpu#=
91.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7155 =C2=B1 14%     +42.7%      10211 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2957082 =C2=B1  8%     -13.8%    2547856 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   20091416 =C2=B1  0%     -24.4%   15193784 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     751915            -2.4%     733913        GEO-MEAN sched_debug.cpu#=
38.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     817086 =C2=B1  3%     -24.5%     617070 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     817086           -24.5%     617070        GEO-MEAN sched_debug.cpu#=
18.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7630 =C2=B1  9%     +40.3%      10708 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7630           +40.3%      10708        GEO-MEAN sched_debug.cpu#=
59.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2013 =C2=B1 11%     -27.7%       1456 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       2013           -27.7%       1456        GEO-MEAN sched_debug.cpu#=
110.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        118 =C2=B1  4%     -25.1%         88 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        118           -25.1%         88        GEO-MEAN sched_debug.cpu#=
8.nr_uninterruptible
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   19221661 =C2=B1  1%     -23.7%   14665426 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   19221661           -23.7%   14665426        GEO-MEAN sched_debug.cpu#=
40.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   21058318 =C2=B1  1%     -24.2%   15959916 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   21058318           -24.2%   15959916        GEO-MEAN sched_debug.cpu#=
17.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        126 =C2=B1 24%     +63.6%        206 =C2=B1 19%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        126           +63.6%        206        GEO-MEAN sched_debug.cfs_=
rq[11]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        437 =C2=B1 11%     -29.6%        308 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        674 =C2=B1  5%     -18.6%        548 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >        542           -24.3%        411        GEO-MEAN sched_debug.cfs_=
rq[29]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     605972 =C2=B1 12%     +40.9%     853678 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >     605972           +40.9%     853678        GEO-MEAN sched_debug.cpu#=
32.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        438 =C2=B1 15%     -23.7%        334 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        438           -23.7%        334        GEO-MEAN sched_debug.cfs_=
rq[32]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  9%     -26.7%         18 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         24           -26.7%         18        GEO-MEAN sched_debug.cpu#=
34.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     +29.8%         24 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           +29.8%         24        GEO-MEAN sched_debug.cpu#=
9.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  1%     -30.3%         17 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         25           -30.3%         17        GEO-MEAN sched_debug.cpu#=
42.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     754687 =C2=B1 24%     +34.7%    1016297 =C2=B1 10%  ivb42/hackbench=
/performance-100%-threads-socket
> >     754687           +34.7%    1016297        GEO-MEAN sched_debug.cpu#=
40.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      89908 =C2=B1  6%     -13.7%      77620 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      89907           -13.7%      77619        GEO-MEAN meminfo.DirectMa=
p4k
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4142 =C2=B1 20%     +40.9%       5836 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4141           +40.9%       5836        GEO-MEAN sched_debug.cpu#=
48.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1 10%     -20.0%         16 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           -20.0%         15        GEO-MEAN sched_debug.cpu#=
10.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1 13%     -24.2%         16 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         22           -24.2%         16        GEO-MEAN sched_debug.cfs_=
rq[38]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  6%     -21.0%         16 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20           -21.0%         16        GEO-MEAN sched_debug.cpu#=
1.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  2%     -17.7%         17 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20           -17.7%         17        GEO-MEAN sched_debug.cpu#=
31.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4184 =C2=B1 24%     +46.1%       6112 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3817 =C2=B1 32%     +99.0%       7596 =C2=B1 37%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     863792 =C2=B1  1%     -10.0%     777585 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      23984           +37.8%      33051        GEO-MEAN sched_debug.cpu#=
32.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   20748744 =C2=B1  1%     -23.7%   15832368 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   20748743           -23.7%   15832368        GEO-MEAN sched_debug.cpu#=
16.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1771 =C2=B1  4%     -23.4%       1357 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1771           -23.4%       1357        GEO-MEAN sched_debug.cpu#=
108.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1721 =C2=B1  5%     -19.8%       1379 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1721           -19.8%       1379        GEO-MEAN sched_debug.cpu#=
99.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1846 =C2=B1 11%     -24.4%       1395 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       1846           -24.4%       1395        GEO-MEAN sched_debug.cfs_=
rq[1]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8712 =C2=B1 13%     -26.5%       6406 =C2=B1 16%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   21896234 =C2=B1  0%     -24.2%   16598293 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     436769           -25.3%     326089        GEO-MEAN sched_debug.cpu#=
15.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        447 =C2=B1  8%     -22.1%        348 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        447           -22.1%        348        GEO-MEAN sched_debug.cfs_=
rq[3]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4047485 =C2=B1  7%     -25.7%    3008163 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4047485           -25.7%    3008163        GEO-MEAN sched_debug.cfs_=
rq[83]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 13%     +40.5%         17 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +40.5%         17        GEO-MEAN sched_debug.cpu#=
20.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   26689071 =C2=B1  1%     -23.1%   20511407 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   26689071           -23.1%   20511407        GEO-MEAN sched_debug.cpu#=
22.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5169 =C2=B1  9%     -33.3%       3449 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      28241 =C2=B1  8%     -13.3%      24473 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      23285 =C2=B1  3%     +24.7%      29036 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      14153 =C2=B1  3%      -9.4%      12817 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      14810           -10.1%      13313        GEO-MEAN sched_debug.cpu#=
27.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   21264995 =C2=B1  1%     -23.6%   16250715 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   21264995           -23.6%   16250715        GEO-MEAN sched_debug.cpu#=
18.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1 10%     -30.0%         11 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21 =C2=B1  2%     -10.8%         19 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           -21.0%         15        GEO-MEAN sched_debug.cfs_=
rq[29]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5509 =C2=B1 19%     -32.6%       3712 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      28775 =C2=B1  7%     -13.1%      24996 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      12590           -23.5%       9632        GEO-MEAN sched_debug.cpu#=
29.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1755 =C2=B1 15%     -28.9%       1247 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1755           -28.9%       1247        GEO-MEAN sched_debug.cpu#=
107.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.70 =C2=B1  8%     +34.0%       0.93 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.70           +34.0%       0.93        GEO-MEAN perf-profile.cpu=
-cycles._raw_spin_lock.get_partial_node.__slab_alloc.kmem_cache_alloc_node.=
__alloc_skb
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4.08 =C2=B1 19%     -28.2%       2.93 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       4.08           -28.2%       2.93        GEO-MEAN perf-profile.cpu=
-cycles.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_recvmsg.sock_a=
io_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3540 =C2=B1 19%     -26.1%       2618 =C2=B1 11%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3540           -26.1%       2617        GEO-MEAN sched_debug.cpu#=
85.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3912740 =C2=B1  6%     -23.8%    2982939 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    3912740           -23.8%    2982939        GEO-MEAN sched_debug.cfs_=
rq[81]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2492 =C2=B1 17%     -25.8%       1848 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       2492           -25.8%       1848        GEO-MEAN sched_debug.cfs_=
rq[3]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4125871 =C2=B1  6%     -23.7%    3148724 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4125871           -23.7%    3148724        GEO-MEAN sched_debug.cfs_=
rq[79]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        511 =C2=B1  6%     -18.1%        418 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        511           -18.1%        418        GEO-MEAN sched_debug.cfs_=
rq[32]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2465 =C2=B1 17%     -25.8%       1828 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       2465           -25.8%       1828        GEO-MEAN sched_debug.cfs_=
rq[3]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     670477 =C2=B1 17%     +42.3%     954251 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >     670477           +42.3%     954251        GEO-MEAN sched_debug.cpu#=
33.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4.21 =C2=B1 19%     -28.1%       3.03 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       4.21           -28.1%       3.03        GEO-MEAN perf-profile.cpu=
-cycles.kfree_skbmem.consume_skb.unix_stream_recvmsg.sock_aio_read.sock_aio=
_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         10 =C2=B1 25%     -28.3%          7 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         15 =C2=B1  8%     +39.1%         21 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12            -0.1%         12        GEO-MEAN sched_debug.cpu#=
15.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        411 =C2=B1  8%     -18.8%        334 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        317 =C2=B1 10%     +27.8%        405 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        361            +1.9%        368        GEO-MEAN sched_debug.cfs_=
rq[24]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1 11%     -17.2%         17 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >         21           -17.2%         17        GEO-MEAN sched_debug.cpu#=
6.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   26104071 =C2=B1  0%     -22.7%   20165898 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   26104071           -22.7%   20165898        GEO-MEAN sched_debug.cpu#=
18.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     642767 =C2=B1  2%     -23.7%     490470 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     642767           -23.7%     490470        GEO-MEAN sched_debug.cpu#=
43.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23380 =C2=B1  6%     -18.0%      19170 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23380           -18.0%      19170        GEO-MEAN sched_debug.cfs_=
rq[32]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4232 =C2=B1 20%     -31.2%       2913 =C2=B1 23%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     885971 =C2=B1  1%     -17.6%     730417 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      61237           -24.7%      46127        GEO-MEAN sched_debug.cpu#=
22.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      11923 =C2=B1 38%     +84.4%      21984 =C2=B1 19%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      11923           +84.4%      21984        GEO-MEAN sched_debug.cpu#=
69.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5726033 =C2=B1  6%     +23.5%    7070171 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5726033           +23.5%    7070171        GEO-MEAN sched_debug.cfs_=
rq[10]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.07 =C2=B1 12%     +26.5%       3.88 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3.07           +26.5%       3.88        GEO-MEAN perf-profile.cpu=
-cycles.ktime_get.clockevents_program_event.tick_program_event.hrtimer_inte=
rrupt.local_apic_timer_interrupt
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        167 =C2=B1  1%     +29.3%        216 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        167           +29.3%        216        GEO-MEAN sched_debug.cfs_=
rq[34]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         29 =C2=B1 27%     -32.2%         19 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20 =C2=B1  7%     +13.3%         22 =C2=B1  9%  ivb42/hackbench=
/performance-100%-threads-socket
> >         24           -12.3%         21        GEO-MEAN sched_debug.cpu#=
15.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        133 =C2=B1 27%     +47.9%        197 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        133           +47.9%        197        GEO-MEAN sched_debug.cfs_=
rq[24]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.81 =C2=B1 19%     -28.3%       2.01 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2.81           -28.3%       2.01        GEO-MEAN perf-profile.cpu=
-cycles.__slab_free.kmem_cache_free.kfree_skbmem.consume_skb.unix_stream_re=
cvmsg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4006326 =C2=B1  6%     -20.7%    3176947 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4006326           -20.7%    3176947        GEO-MEAN sched_debug.cfs_=
rq[80]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  4%     -27.6%         18 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14 =C2=B1 17%     +29.5%         19 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         19            -3.2%         18        GEO-MEAN sched_debug.cpu#=
39.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        490 =C2=B1  3%     +21.0%        593 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        490           +21.0%        593        GEO-MEAN sched_debug.cfs_=
rq[7]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      22513 =C2=B1  3%     +20.9%      27230 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      22513           +20.9%      27230        GEO-MEAN sched_debug.cfs_=
rq[7]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      17031 =C2=B1  9%     +29.9%      22132 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   30527777 =C2=B1  1%     -19.2%   24677022 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     721070            +2.5%     739020        GEO-MEAN sched_debug.cpu#=
37.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1 11%     -22.6%         13 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         17           -22.6%         13        GEO-MEAN sched_debug.cpu#=
30.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  5%     -21.4%         14 =C2=B1 11%  ivb42/hackbench=
/performance-100%-threads-socket
> >         18           -21.4%         14        GEO-MEAN sched_debug.cpu#=
25.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1 17%     +35.7%         19 =C2=B1 11%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +35.7%         18        GEO-MEAN sched_debug.cpu#=
21.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         10 =C2=B1 24%     -29.4%          7 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         10           -29.4%          7        GEO-MEAN sched_debug.cfs_=
rq[15]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  9%     +53.7%         21 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21 =C2=B1  5%     -10.9%         19 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         16 =C2=B1 12%     +16.0%         19 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         16           +16.7%         19        GEO-MEAN sched_debug.cpu#=
16.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3916 =C2=B1  5%     -22.3%       3043 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3916           -22.3%       3043        GEO-MEAN sched_debug.cpu#=
58.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    7138831 =C2=B1  1%     -22.1%    5563134 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    7138831           -22.1%    5563134        GEO-MEAN proc-vmstat.pgfr=
ee
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  6%     -24.7%         19 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16 =C2=B1 10%     +22.9%         19 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20            -3.8%         19        GEO-MEAN sched_debug.cpu#=
36.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  6%     -22.1%         20 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         15 =C2=B1 13%     +27.7%         20 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20            -0.3%         19        GEO-MEAN sched_debug.cpu#=
36.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    7160822 =C2=B1  1%     -22.0%    5584442 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    7160822           -22.0%    5584442        GEO-MEAN proc-vmstat.pgal=
loc_normal
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4082355 =C2=B1  5%     -23.2%    3133632 =C2=B1  3%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4082355           -23.2%    3133632        GEO-MEAN sched_debug.cfs_=
rq[78]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        613 =C2=B1  6%     -18.4%        500 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >        613           -18.4%        499        GEO-MEAN sched_debug.cfs_=
rq[19]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   25705305 =C2=B1  0%     -22.1%   20026342 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   25705305           -22.1%   20026342        GEO-MEAN sched_debug.cpu#=
15.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     563117 =C2=B1  3%     +19.0%     669901 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >     424656 =C2=B1  2%     +37.7%     584637 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >     489010           +28.0%     625818        GEO-MEAN cpuidle.C6-IVT.u=
sage
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1790 =C2=B1  5%     -22.1%       1394 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1790           -22.1%       1394        GEO-MEAN sched_debug.cpu#=
103.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   25686569 =C2=B1  1%     -21.6%   20148163 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   25686569           -21.6%   20148163        GEO-MEAN sched_debug.cpu#=
13.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.01 =C2=B1 11%     +26.3%       3.81 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3.01           +26.3%       3.81        GEO-MEAN perf-profile.cpu=
-cycles.read_hpet.ktime_get.clockevents_program_event.tick_program_event.hr=
timer_interrupt
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7192 =C2=B1 13%     -36.7%       4555 =C2=B1 15%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      28185 =C2=B1  7%     -12.3%      24706 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      23128 =C2=B1  5%     +25.5%      29028 =C2=B1 14%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      14225 =C2=B1  2%      -7.6%      13149 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >      16070           -10.4%      14397        GEO-MEAN sched_debug.cpu#=
36.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     659506 =C2=B1  0%     -21.1%     520254 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     659506           -21.1%     520254        GEO-MEAN sched_debug.cpu#=
44.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        474 =C2=B1  2%     +28.6%        610 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        474           +28.6%        610        GEO-MEAN sched_debug.cfs_=
rq[10]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      21738 =C2=B1  2%     +28.6%      27956 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      21738           +28.6%      27956        GEO-MEAN sched_debug.cfs_=
rq[10]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   26289191 =C2=B1  1%     -21.5%   20639754 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   26289191           -21.5%   20639754        GEO-MEAN sched_debug.cpu#=
20.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  9%     +20.7%         23 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +20.7%         23        GEO-MEAN sched_debug.cpu#=
8.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   26272949 =C2=B1  1%     -21.5%   20616474 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   26272949           -21.5%   20616474        GEO-MEAN sched_debug.cpu#=
20.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         68 =C2=B1  8%     +23.9%         84 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         68           +23.9%         84        GEO-MEAN sched_debug.cpu#=
31.nr_uninterruptible
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  5%     -23.4%         16 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23 =C2=B1 11%     -18.3%         19 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         22           -20.9%         17        GEO-MEAN sched_debug.cpu#=
34.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     233620 =C2=B1  5%     +23.6%     288688 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     233620           +23.6%     288688        GEO-MEAN sched_debug.cfs_=
rq[10]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     106116 =C2=B1 14%     -29.3%      75002 =C2=B1 15%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     106116           -29.3%      75002        GEO-MEAN sched_debug.cfs_=
rq[1]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         76 =C2=B1  7%     -24.6%         57 =C2=B1 27%  ivb42/hackbench=
/performance-100%-threads-socket
> >         76           -24.6%         57        GEO-MEAN sched_debug.cfs_=
rq[13]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1355 =C2=B1 24%     +36.0%       1843 =C2=B1 11%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1355           +36.0%       1843        GEO-MEAN numa-meminfo.nod=
e0.Inactive(anon)
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6844 =C2=B1 14%     +49.9%      10259 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     869997 =C2=B1  1%     -10.0%     782794 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >      77167           +16.1%      89615        GEO-MEAN sched_debug.cpu#=
2.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     837853 =C2=B1  1%     -22.6%     648690 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     836852 =C2=B1 41%     +54.5%    1293306 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     837352            +9.4%     915945        GEO-MEAN sched_debug.cpu#=
22.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   25525885 =C2=B1  0%     -21.5%   20037162 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   25525885           -21.5%   20037162        GEO-MEAN sched_debug.cpu#=
17.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        545 =C2=B1  2%     -23.8%        415 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        545           -23.8%        415        GEO-MEAN sched_debug.cfs_=
rq[34]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.53 =C2=B1 12%     +44.0%       0.76 =C2=B1 25%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.53           +44.0%       0.76        GEO-MEAN perf-profile.cpu=
-cycles.get_partial_node.isra.47.__slab_alloc.__kmalloc_node_track_caller._=
_kmalloc_reserve.__alloc_skb
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   25575741 =C2=B1  0%     -21.4%   20104812 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   25575741           -21.4%   20104812        GEO-MEAN sched_debug.cpu#=
17.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     265158 =C2=B1  4%     -21.7%     207674 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     265158           -21.7%     207674        GEO-MEAN sched_debug.cfs_=
rq[34]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4050059 =C2=B1  8%     -23.8%    3088113 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4050059           -23.8%    3088113        GEO-MEAN sched_debug.cfs_=
rq[82]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6479886 =C2=B1  4%     -21.5%    5085287 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6479886           -21.5%    5085287        GEO-MEAN sched_debug.cfs_=
rq[34]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        298 =C2=B1  9%     +33.7%        399 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        584 =C2=B1  5%     -13.8%        503 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >        417            +7.4%        448        GEO-MEAN sched_debug.cfs_=
rq[16]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.35 =C2=B1 15%     -26.1%       2.48 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       3.35           -26.1%       2.48        GEO-MEAN perf-profile.cpu=
-cycles.rw_verify_area.vfs_read.sys_read.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        266 =C2=B1 22%     +36.1%        362 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        609 =C2=B1 14%     -18.4%        497 =C2=B1  9%  ivb42/hackbench=
/performance-100%-threads-socket
> >        402            +5.4%        424        GEO-MEAN sched_debug.cfs_=
rq[20]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      24955 =C2=B1  1%     -23.7%      19033 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      24955           -23.7%      19033        GEO-MEAN sched_debug.cfs_=
rq[34]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     650072 =C2=B1  4%     -17.8%     534335 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      31534 =C2=B1 13%     +41.8%      44720 =C2=B1 14%  ivb42/hackbench=
/performance-50%-threads-socket
> >     143177            +8.0%     154583        GEO-MEAN sched_debug.cpu#=
38.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  6%     +23.6%         22 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         26 =C2=B1 22%     -27.5%         19 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         22            -5.3%         20        GEO-MEAN sched_debug.cpu#=
7.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  7%     +22.8%         23 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23 =C2=B1  8%     -18.3%         19 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         21            +0.2%         21        GEO-MEAN sched_debug.cpu#=
7.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.62 =C2=B1 12%     -33.5%       1.08 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.03 =C2=B1  1%     -13.2%       0.89 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.29           -24.0%       0.98        GEO-MEAN perf-profile.cpu=
-cycles.skb_unlink.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync_=
read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1877 =C2=B1  8%     -20.7%       1489 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1877           -20.7%       1489        GEO-MEAN sched_debug.cpu#=
111.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        636 =C2=B1  7%     -18.1%        521 =C2=B1 11%  ivb42/hackbench=
/performance-100%-threads-socket
> >        636           -18.1%        521        GEO-MEAN sched_debug.cfs_=
rq[6]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     816065 =C2=B1  2%     -20.8%     645990 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     816064           -20.8%     645989        GEO-MEAN sched_debug.cpu#=
21.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  4%     -31.7%         13 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19 =C2=B1  0%     +10.5%         21 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           -13.1%         16        GEO-MEAN sched_debug.cpu#=
28.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  9%     +51.2%         20 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20 =C2=B1  2%      -9.7%         18 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >         16           +16.8%         19        GEO-MEAN sched_debug.cpu#=
16.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        587 =C2=B1  5%     -11.8%        517 =C2=B1 10%  ivb42/hackbench=
/performance-100%-threads-socket
> >        487 =C2=B1  5%     +36.3%        664 =C2=B1 15%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        534            +9.7%        586        GEO-MEAN sched_debug.cfs_=
rq[0]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  2%     -17.2%         16 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -17.2%         15        GEO-MEAN sched_debug.cpu#=
30.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1 13%     +43.9%         19 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         13           +43.9%         19        GEO-MEAN sched_debug.cfs_=
rq[19]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     -17.5%         15 =C2=B1 10%  ivb42/hackbench=
/performance-100%-threads-socket
> >         18           -17.5%         15        GEO-MEAN sched_debug.cpu#=
27.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  2%     -19.0%         15 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -19.0%         15        GEO-MEAN sched_debug.cpu#=
30.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   25395850 =C2=B1  0%     -21.3%   19996864 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   25395850           -21.3%   19996864        GEO-MEAN sched_debug.cpu#=
16.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   25385835 =C2=B1  0%     -21.3%   19979026 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   25385835           -21.3%   19979026        GEO-MEAN sched_debug.cpu#=
16.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        536 =C2=B1 10%     -33.0%        359 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        586 =C2=B1  2%      -8.0%        540 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >        560           -21.4%        440        GEO-MEAN sched_debug.cfs_=
rq[37]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5092506 =C2=B1  4%     +25.6%    6395946 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5092506           +25.6%    6395946        GEO-MEAN sched_debug.cfs_=
rq[14]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     208891 =C2=B1  4%     +25.5%     262171 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     208891           +25.5%     262171        GEO-MEAN sched_debug.cfs_=
rq[14]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5694 =C2=B1 14%     -28.1%       4091 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      27951 =C2=B1  7%     -14.0%      24051 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      31238 =C2=B1  7%     -19.4%      25181 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      13928 =C2=B1  3%     -10.0%      12532 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      16222           -18.2%      13275        GEO-MEAN sched_debug.cpu#=
34.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   26311333 =C2=B1  1%     -21.6%   20632524 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   26311333           -21.6%   20632524        GEO-MEAN sched_debug.cpu#=
21.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3042142 =C2=B1  4%     -14.0%    2614903 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   22221059 =C2=B1  1%     -25.7%   16516998 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    8221899           -20.1%    6571936        GEO-MEAN sched_debug.cpu#=
23.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     +24.6%         23 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           +24.6%         23        GEO-MEAN sched_debug.cpu#=
10.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  6%     +22.4%         23 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +22.4%         23        GEO-MEAN sched_debug.cpu#=
10.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         24 =C2=B1  5%     -17.8%         20 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         24           -17.8%         19        GEO-MEAN sched_debug.cfs_=
rq[8]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  8%     +22.0%         24 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +22.0%         24        GEO-MEAN sched_debug.cpu#=
10.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     +20.3%         23 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24 =C2=B1  6%     -19.4%         19 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         21            -1.5%         21        GEO-MEAN sched_debug.cpu#=
9.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     +22.0%         24 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +22.0%         24        GEO-MEAN sched_debug.cpu#=
9.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         27 =C2=B1 25%     -34.1%         18 =C2=B1 16%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         27           -34.1%         17        GEO-MEAN sched_debug.cpu#=
34.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  8%     +20.3%         23 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +20.3%         23        GEO-MEAN sched_debug.cpu#=
8.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3962812 =C2=B1  2%     -13.8%    3417120 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   25842972 =C2=B1  0%     -21.5%   20284708 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   10119824           -17.7%    8325580        GEO-MEAN sched_debug.cpu#=
12.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     660294 =C2=B1  9%     -14.4%     564994 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    1526194 =C2=B1 17%     +65.4%    2524720 =C2=B1 29%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1003861           +19.0%    1194341        GEO-MEAN sched_debug.cpu#=
40.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         10 =C2=B1 25%     -28.3%          7 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         15 =C2=B1  8%     +37.0%         21 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12            -0.9%         12        GEO-MEAN sched_debug.cpu#=
15.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1354 =C2=B1 16%    +100.7%       2717 =C2=B1 49%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     882994 =C2=B1  2%      -9.2%     801606 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      34579           +35.0%      46672        GEO-MEAN sched_debug.cpu#=
25.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   30824379 =C2=B1  1%     -20.1%   24621183 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   30824379           -20.1%   24621183        GEO-MEAN sched_debug.cpu#=
42.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1791 =C2=B1  8%     -17.4%       1480 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1791           -17.4%       1480        GEO-MEAN sched_debug.cpu#=
113.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   30849469 =C2=B1  1%     -20.1%   24636230 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   30849469           -20.1%   24636230        GEO-MEAN sched_debug.cpu#=
42.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.05 =C2=B1 17%     -22.7%       1.59 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2.05           -22.7%       1.59        GEO-MEAN perf-profile.cpu=
-cycles.__slab_free.kfree.skb_free_head.skb_release_data.skb_release_all
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      17108 =C2=B1  9%     +29.5%      22154 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      17108           +29.5%      22154        GEO-MEAN sched_debug.cpu#=
50.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  4%     -20.0%         16 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >         31 =C2=B1 17%     +29.0%         40 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         24            +1.6%         25        GEO-MEAN sched_debug.cpu#=
0.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1857 =C2=B1 22%     -24.1%       1410 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1857           -24.1%       1410        GEO-MEAN sched_debug.cpu#=
85.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        423 =C2=B1 11%     -19.9%        339 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        422           -19.9%        338        GEO-MEAN numa-vmstat.node=
0.nr_page_table_pages
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      31306 =C2=B1  3%     -27.8%      22592 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      40348 =C2=B1  4%      +6.7%      43051 =C2=B1  1%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      35540           -12.3%      31186        GEO-MEAN sched_debug.cfs_=
rq[45]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1690 =C2=B1 11%     -19.9%       1353 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       1690           -19.9%       1353        GEO-MEAN numa-meminfo.nod=
e0.PageTables
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5462429 =C2=B1  7%     +16.4%    6355796 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5462429           +16.4%    6355796        GEO-MEAN sched_debug.cfs_=
rq[13]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   31513770 =C2=B1  0%     -20.1%   25180158 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   31513770           -20.1%   25180158        GEO-MEAN sched_debug.cpu#=
46.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   31530459 =C2=B1  0%     -20.1%   25191647 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   31530459           -20.1%   25191647        GEO-MEAN sched_debug.cpu#=
46.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6940689 =C2=B1 10%     -14.9%    5905543 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6940689           -14.9%    5905543        GEO-MEAN sched_debug.cfs_=
rq[47]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14799 =C2=B1  7%     +50.6%      22281 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    3863385 =C2=B1  3%     -10.9%    3441935 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   30720180 =C2=B1  0%     -19.4%   24772598 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1206555            +2.6%    1238523        GEO-MEAN sched_debug.cpu#=
36.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     285373 =C2=B1 10%     -14.9%     242798 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     285373           -14.9%     242798        GEO-MEAN sched_debug.cfs_=
rq[47]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.04 =C2=B1 13%     -28.0%       0.75 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.04           -28.0%       0.75        GEO-MEAN perf-profile.cpu=
-cycles.__pthread_disable_asynccancel.start_thread
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1 25%     +52.9%         26 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         17           +52.9%         26        GEO-MEAN sched_debug.cpu#=
23.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.90 =C2=B1 13%     -27.1%       1.38 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.11 =C2=B1  7%     -12.5%       0.97 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.45           -20.1%       1.16        GEO-MEAN perf-profile.cpu=
-cycles.selinux_file_permission.security_file_permission.rw_verify_area.vfs=
_read.sys_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     224197 =C2=B1  7%     +16.2%     260451 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     224197           +16.2%     260451        GEO-MEAN sched_debug.cfs_=
rq[13]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       4865 =C2=B1 15%     +28.4%       6248 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     860946 =C2=B1  1%     -13.4%     745561 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      64718            +5.5%      68251        GEO-MEAN sched_debug.cpu#=
45.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    7047781 =C2=B1  9%     -20.6%    5593913 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    7047781           -20.6%    5593913        GEO-MEAN sched_debug.cfs_=
rq[36]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     288861 =C2=B1  9%     -20.7%     229030 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     288861           -20.7%     229030        GEO-MEAN sched_debug.cfs_=
rq[36]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        509 =C2=B1  3%     -21.2%        401 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        509           -21.2%        401        GEO-MEAN sched_debug.cfs_=
rq[28]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     810012 =C2=B1 27%     +35.8%    1100210 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >     810012           +35.8%    1100210        GEO-MEAN sched_debug.cpu#=
9.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23365 =C2=B1  3%     -21.2%      18418 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23365           -21.2%      18417        GEO-MEAN sched_debug.cfs_=
rq[28]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     -20.7%         15 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -20.7%         15        GEO-MEAN sched_debug.cpu#=
27.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         15 =C2=B1  7%     +23.4%         19 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         15           +23.4%         19        GEO-MEAN sched_debug.cpu#=
41.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     -20.7%         15 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -20.7%         15        GEO-MEAN sched_debug.cpu#=
27.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         11 =C2=B1  8%     +35.3%         15 =C2=B1 13%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         11           +35.3%         15        GEO-MEAN sched_debug.cfs_=
rq[14]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  4%     +23.3%         24 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +23.3%         24        GEO-MEAN sched_debug.cpu#=
3.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  3%     -25.3%         18 =C2=B1 18%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24           -25.3%         18        GEO-MEAN sched_debug.cpu#=
42.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1 10%     -23.1%         16 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >         21           -23.1%         16        GEO-MEAN sched_debug.cpu#=
2.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  6%     -18.6%         16 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -18.6%         15        GEO-MEAN sched_debug.cpu#=
29.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  8%     -18.3%         16 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -18.3%         16        GEO-MEAN sched_debug.cpu#=
32.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.95 =C2=B1 12%     -30.5%       1.36 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2.00 =C2=B1  2%     +13.0%       2.26 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       1.97           -11.4%       1.75        GEO-MEAN perf-profile.cpu=
-cycles.start_thread
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3968 =C2=B1  8%     -20.3%       3161 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3968           -20.3%       3161        GEO-MEAN sched_debug.cpu#=
57.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      12911 =C2=B1 12%     -20.6%      10247 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    3911134 =C2=B1  5%     -10.6%    3495961 =C2=B1  1%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   25905972 =C2=B1  0%     -21.3%   20386581 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1093673           -17.7%     900550        GEO-MEAN sched_debug.cpu#=
19.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9523 =C2=B1  9%     -19.7%       7649 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4167689 =C2=B1  9%     -15.5%    3522556 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   26595019 =C2=B1  0%     -21.8%   20795049 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1018190           -19.0%     824434        GEO-MEAN sched_debug.cpu#=
23.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      32393 =C2=B1 24%     +36.5%      44205 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      32393           +36.5%      44205        GEO-MEAN proc-vmstat.pgac=
tivate
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        141 =C2=B1 19%     -29.6%         99 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >        141           -29.6%         99        GEO-MEAN sched_debug.cfs_=
rq[28]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   30227050 =C2=B1  1%     -19.3%   24406165 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   30227049           -19.3%   24406164        GEO-MEAN sched_debug.cpu#=
41.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     114395 =C2=B1 12%     -25.5%      85254 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     114395           -25.5%      85254        GEO-MEAN sched_debug.cfs_=
rq[2]:/.tg_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8088 =C2=B1 14%     +24.1%      10036 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8088           +24.1%      10036        GEO-MEAN sched_debug.cpu#=
51.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      57291 =C2=B1 10%     +15.4%      66141 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      57291           +15.4%      66141        GEO-MEAN numa-vmstat.node=
0.nr_file_pages
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     229200 =C2=B1 10%     +15.4%     264540 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >     229200           +15.4%     264540        GEO-MEAN numa-meminfo.nod=
e0.FilePages
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3831 =C2=B1  6%     -24.6%       2887 =C2=B1 12%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3831           -24.6%       2887        GEO-MEAN sched_debug.cpu#=
53.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5349079 =C2=B1 12%     +26.8%    6781934 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5349079           +26.8%    6781934        GEO-MEAN sched_debug.cfs_=
rq[12]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27900 =C2=B1  7%     -14.5%      23846 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      27900           -14.5%      23846        GEO-MEAN sched_debug.cpu#=
35.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     219437 =C2=B1 12%     +26.1%     276803 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     219437           +26.1%     276803        GEO-MEAN sched_debug.cfs_=
rq[12]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3872 =C2=B1  7%     +33.7%       5176 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3872           +33.7%       5175        GEO-MEAN sched_debug.cpu#=
108.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     905517 =C2=B1  0%     -20.3%     721697 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     905517           -20.3%     721697        GEO-MEAN cpuidle.C6-IVT-4=
S.usage
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28374 =C2=B1  9%     -14.5%      24267 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      28374           -14.5%      24266        GEO-MEAN sched_debug.cpu#=
14.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         24 =C2=B1  9%     -28.4%         17 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         14 =C2=B1 16%     +27.9%         18 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18            -4.3%         17        GEO-MEAN sched_debug.cpu#=
39.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  7%     +20.6%         25 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           +20.6%         25        GEO-MEAN sched_debug.cpu#=
1.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   30686015 =C2=B1  0%     -19.0%   24852515 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   30686015           -19.0%   24852515        GEO-MEAN sched_debug.cpu#=
43.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   30567772 =C2=B1  1%     -19.1%   24719285 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   30567772           -19.1%   24719285        GEO-MEAN sched_debug.cpu#=
37.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   30700393 =C2=B1  0%     -19.0%   24871670 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   30700393           -19.0%   24871669        GEO-MEAN sched_debug.cpu#=
43.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4067106 =C2=B1  4%     -23.1%    3129521 =C2=B1  6%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    4067106           -23.1%    3129521        GEO-MEAN sched_debug.cfs_=
rq[77]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  7%     +65.0%         22 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         22 =C2=B1 11%     -14.9%         19 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         16 =C2=B1 10%     +18.4%         19 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20 =C2=B1  3%      -9.8%         18 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >         17           +10.6%         19        GEO-MEAN sched_debug.cpu#=
16.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  6%     +22.4%         23 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23 =C2=B1  7%     -15.9%         19 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         21            +1.4%         21        GEO-MEAN sched_debug.cpu#=
7.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28022 =C2=B1 13%     -15.9%      23564 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >      28022           -15.9%      23564        GEO-MEAN numa-meminfo.nod=
e1.SReclaimable
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.98 =C2=B1  9%     -19.0%       1.60 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.98           -19.0%       1.60        GEO-MEAN perf-profile.cpu=
-cycles.selinux_file_permission.security_file_permission.rw_verify_area.vfs=
_write.sys_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7002 =C2=B1 13%     -15.9%       5891 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >       7002           -15.9%       5891        GEO-MEAN numa-vmstat.node=
1.nr_slab_reclaimable
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  7%     -21.5%         17 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           -21.5%         17        GEO-MEAN sched_debug.cpu#=
37.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6844932 =C2=B1  6%     -13.3%    5937522 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6844932           -13.3%    5937522        GEO-MEAN sched_debug.cfs_=
rq[37]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     280599 =C2=B1  6%     -13.3%     243386 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     280599           -13.3%     243386        GEO-MEAN sched_debug.cfs_=
rq[37]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5215378 =C2=B1  9%     +24.2%    6475445 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5215378           +24.2%    6475445        GEO-MEAN sched_debug.cfs_=
rq[20]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        503 =C2=B1  6%     +18.5%        597 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        503           +18.5%        597        GEO-MEAN sched_debug.cfs_=
rq[8]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4132420 =C2=B1 13%     -20.0%    3307061 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   30426640 =C2=B1  0%     -18.9%   24661763 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   11213191           -19.5%    9030944        GEO-MEAN sched_debug.cpu#=
38.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    7197555 =C2=B1  3%     -18.5%    5868547 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    7197555           -18.5%    5868547        GEO-MEAN sched_debug.cfs_=
rq[38]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2148640 =C2=B1  9%     -23.4%    1645673 =C2=B1  8%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    1374659 =C2=B1 25%     +37.8%    1894017 =C2=B1  8%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1718618            +2.7%    1765484        GEO-MEAN sched_debug.cfs_=
rq[19]:/.spread0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     294987 =C2=B1  3%     -18.5%     240496 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     294987           -18.5%     240496        GEO-MEAN sched_debug.cfs_=
rq[38]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     214039 =C2=B1  9%     +24.1%     265518 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     214039           +24.1%     265518        GEO-MEAN sched_debug.cfs_=
rq[20]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      22926 =C2=B1  1%     -14.5%      19608 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      22926           -14.5%      19608        GEO-MEAN sched_debug.cfs_=
rq[30]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  4%     +20.3%         23 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         24 =C2=B1  3%     -18.1%         19 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         21            -0.7%         21        GEO-MEAN sched_debug.cpu#=
9.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.19 =C2=B1  8%     -20.4%       0.95 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       1.19           -20.4%       0.95        GEO-MEAN turbostat.%c6
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        500 =C2=B1  1%     -14.4%        428 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        499           -14.4%        427        GEO-MEAN sched_debug.cfs_=
rq[30]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  6%     +56.4%         20 =C2=B1 33%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         13           +56.4%         20        GEO-MEAN sched_debug.cpu#=
18.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1 14%     -25.4%         16 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23 =C2=B1  3%     -22.5%         18 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         22           -24.0%         17        GEO-MEAN sched_debug.cpu#=
34.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23114 =C2=B1  6%     +18.2%      27326 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23114           +18.2%      27326        GEO-MEAN sched_debug.cfs_=
rq[8]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9273 =C2=B1  8%     +30.0%      12054 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     882824 =C2=B1  1%     -10.1%     793313 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >      90479            +8.1%      97790        GEO-MEAN sched_debug.cpu#=
0.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28202 =C2=B1  8%     -15.5%      23828 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      28202           -15.5%      23828        GEO-MEAN sched_debug.cpu#=
2.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         10 =C2=B1 22%     -26.4%          7 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         15 =C2=B1 10%     +35.6%         20 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12            -0.1%         12        GEO-MEAN sched_debug.cpu#=
15.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5249761 =C2=B1  7%     +21.7%    6386909 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5249761           +21.7%    6386909        GEO-MEAN sched_debug.cfs_=
rq[19]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8828 =C2=B1  9%     +18.6%      10472 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >   19800323 =C2=B1  1%     -24.6%   14937832 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     418097            -5.4%     395514        GEO-MEAN sched_debug.cpu#=
45.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   29982666 =C2=B1  0%     -18.4%   24458570 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   29982666           -18.4%   24458570        GEO-MEAN sched_debug.cpu#=
40.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1614 =C2=B1  4%     -16.5%       1348 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1614           -16.5%       1348        GEO-MEAN sched_debug.cpu#=
93.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   29960708 =C2=B1  0%     -18.4%   24438001 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   29960708           -18.4%   24438001        GEO-MEAN sched_debug.cpu#=
40.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   31032942 =C2=B1  1%     -19.2%   25067720 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   31032942           -19.2%   25067720        GEO-MEAN sched_debug.cpu#=
45.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     215352 =C2=B1  7%     +21.6%     261827 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     215352           +21.6%     261827        GEO-MEAN sched_debug.cfs_=
rq[19]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7824 =C2=B1 12%     +34.6%      10529 =C2=B1 14%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       7824           +34.6%      10529        GEO-MEAN sched_debug.cpu#=
56.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.53 =C2=B1  3%     +23.0%       1.88 =C2=B1  7%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.53           +23.0%       1.88        GEO-MEAN perf-profile.cpu=
-cycles.fput.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  5%     +27.7%         27 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           +27.7%         27        GEO-MEAN sched_debug.cpu#=
1.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     819312 =C2=B1  2%     -19.6%     658365 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     819312           -19.6%     658365        GEO-MEAN sched_debug.cpu#=
20.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4164779 =C2=B1  9%     -16.9%    3460017 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   26577794 =C2=B1  0%     -22.0%   20738980 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   10520962           -19.5%    8470964        GEO-MEAN sched_debug.cpu#=
23.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   31156436 =C2=B1  0%     -18.7%   25325830 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   31156435           -18.7%   25325830        GEO-MEAN sched_debug.cpu#=
44.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        494 =C2=B1  6%     -16.0%        415 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        494           -16.0%        414        GEO-MEAN sched_debug.cfs_=
rq[33]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3898 =C2=B1 18%     -23.9%       2965 =C2=B1 10%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3897           -23.9%       2964        GEO-MEAN sched_debug.cpu#=
79.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   31140524 =C2=B1  0%     -18.8%   25300128 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   31140524           -18.8%   25300128        GEO-MEAN sched_debug.cpu#=
44.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23171 =C2=B1  7%     -18.6%      18867 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23171           -18.6%      18867        GEO-MEAN sched_debug.cfs_=
rq[29]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      22629 =C2=B1  6%     -16.0%      19000 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      22629           -16.0%      19000        GEO-MEAN sched_debug.cfs_=
rq[33]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1  5%     -17.9%         18 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         22           -17.9%         18        GEO-MEAN sched_debug.cfs_=
rq[4]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1  9%     +25.0%         21 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         17           +25.0%         21        GEO-MEAN sched_debug.cpu#=
1.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  6%     +23.6%         22 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           +23.6%         22        GEO-MEAN sched_debug.cpu#=
10.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     226665 =C2=B1  5%     +25.4%     284127 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     226665           +25.4%     284127        GEO-MEAN sched_debug.cfs_=
rq[17]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     855729 =C2=B1 28%     +34.2%    1148664 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >     855729           +34.2%    1148664        GEO-MEAN sched_debug.cpu#=
6.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5526644 =C2=B1  5%     +25.4%    6930225 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5526644           +25.4%    6930225        GEO-MEAN sched_debug.cfs_=
rq[17]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2372846 =C2=B1 10%     -14.4%    2031906 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    2372845           -14.4%    2031906        GEO-MEAN cpuidle.C3-IVT.t=
ime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        707 =C2=B1 12%     +40.6%        995 =C2=B1 18%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >        707           +40.6%        995        GEO-MEAN sched_debug.cpu#=
81.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        586 =C2=B1  3%     -17.0%        486 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >        586           -17.0%        486        GEO-MEAN sched_debug.cfs_=
rq[8]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  8%     -21.9%         16 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         23 =C2=B1  7%     -20.0%         18 =C2=B1 11%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         22           -20.9%         17        GEO-MEAN sched_debug.cpu#=
34.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  6%     -20.3%         15 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20 =C2=B1  2%      -6.5%         19 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20           -13.7%         17        GEO-MEAN sched_debug.cpu#=
29.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  0%     -23.3%         15 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19 =C2=B1  0%     +10.5%         21 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19            -7.9%         17        GEO-MEAN sched_debug.cpu#=
28.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  0%     -25.0%         15 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19 =C2=B1  0%     +12.3%         21 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19            -8.2%         17        GEO-MEAN sched_debug.cpu#=
28.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        505 =C2=B1  7%     -18.3%        412 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        505           -18.3%        412        GEO-MEAN sched_debug.cfs_=
rq[29]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1188 =C2=B1  9%     +14.5%       1361 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1188           +14.5%       1360        GEO-MEAN slabinfo.anon_vm=
a.active_slabs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1188 =C2=B1  9%     +14.5%       1361 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1188           +14.5%       1360        GEO-MEAN slabinfo.anon_vm=
a.num_slabs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      66604 =C2=B1  9%     +14.5%      76248 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      66604           +14.5%      76248        GEO-MEAN slabinfo.anon_vm=
a.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    4139312 =C2=B1 13%     -19.2%    3345528 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   30443857 =C2=B1  0%     -18.9%   24679394 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   11225713           -19.1%    9086562        GEO-MEAN sched_debug.cpu#=
38.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      66162 =C2=B1  9%     +14.3%      75642 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      66161           +14.3%      75642        GEO-MEAN slabinfo.anon_vm=
a.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         13 =C2=B1  9%     +48.8%         20 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         16 =C2=B1 15%     +18.0%         19 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20 =C2=B1  2%      -8.7%         18 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >         16           +17.0%         19        GEO-MEAN sched_debug.cpu#=
16.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         25 =C2=B1  5%     -16.0%         21 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >         21 =C2=B1  9%     +23.4%         26 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         23            +1.8%         23        GEO-MEAN sched_debug.cfs_=
rq[29]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         86 =C2=B1  4%     -23.6%         65 =C2=B1 18%  ivb42/hackbench=
/performance-100%-threads-socket
> >         85           -23.6%         65        GEO-MEAN sched_debug.cfs_=
rq[6]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3912870 =C2=B1  3%     -11.4%    3466362 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   30769646 =C2=B1  1%     -19.3%   24823365 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   10972585           -15.5%    9276139        GEO-MEAN sched_debug.cpu#=
36.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     881319 =C2=B1  1%     -16.5%     735645 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >     881319           -16.5%     735645        GEO-MEAN sched_debug.cpu#=
19.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28336 =C2=B1  7%     -13.6%      24483 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      28336           -13.6%      24483        GEO-MEAN sched_debug.cpu#=
4.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1788 =C2=B1  8%     -23.9%       1360 =C2=B1 13%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1788           -23.9%       1360        GEO-MEAN sched_debug.cpu#=
114.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  6%     -21.4%         14 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21 =C2=B1  4%     -10.9%         19 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           -16.3%         16        GEO-MEAN sched_debug.cpu#=
29.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9047 =C2=B1 12%     -16.0%       7597 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   19955834 =C2=B1  0%     -23.9%   15189591 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     424908           -20.1%     339698        GEO-MEAN sched_debug.cpu#=
46.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27812 =C2=B1  7%     -13.7%      23998 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      27812           -13.7%      23998        GEO-MEAN sched_debug.cpu#=
6.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        978 =C2=B1  7%     -13.0%        850 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >        978           -13.0%        850        GEO-MEAN vmstat.procs.r
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  6%     +20.7%         23 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +20.7%         23        GEO-MEAN sched_debug.cpu#=
8.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  6%     +20.7%         23 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +20.7%         23        GEO-MEAN sched_debug.cpu#=
8.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  2%     +34.5%         26 =C2=B1 19%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +34.5%         26        GEO-MEAN sched_debug.cpu#=
3.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  6%     +15.5%         22 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +15.5%         22        GEO-MEAN sched_debug.cpu#=
11.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  2%     +25.0%         23 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           +25.0%         23        GEO-MEAN sched_debug.cpu#=
10.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        502 =C2=B1  5%     -18.0%        411 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        501           -18.0%        411        GEO-MEAN sched_debug.cfs_=
rq[27]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     654341 =C2=B1  4%     -18.0%     536748 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     654341           -18.0%     536747        GEO-MEAN sched_debug.cpu#=
39.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        134 =C2=B1 28%     +61.3%        216 =C2=B1 23%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        134           +61.3%        216        GEO-MEAN sched_debug.cfs_=
rq[30]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      22993 =C2=B1  5%     -18.0%      18852 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      22993           -18.0%      18851        GEO-MEAN sched_debug.cfs_=
rq[27]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9.33 =C2=B1 12%     -21.7%       7.31 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       9.33           -21.7%       7.31        GEO-MEAN perf-profile.cpu=
-cycles.__alloc_skb.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write=
.do_sync_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.81 =C2=B1  7%     +28.4%       1.04 =C2=B1 15%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       0.81           +28.4%       1.04        GEO-MEAN perf-profile.cpu=
-cycles.get_partial_node.isra.47.__slab_alloc.kmem_cache_alloc_node.__alloc=
_skb.sock_alloc_send_pskb
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5422421 =C2=B1  9%      +6.7%    5784234 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5422421            +6.7%    5784234        GEO-MEAN meminfo.DirectMa=
p2M
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        480 =C2=B1  3%     +21.3%        582 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        480           +21.3%        582        GEO-MEAN sched_debug.cfs_=
rq[1]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23982 =C2=B1  5%     +14.9%      27559 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23982           +14.9%      27558        GEO-MEAN sched_debug.cfs_=
rq[9]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      22036 =C2=B1  3%     +21.1%      26680 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      22036           +21.1%      26680        GEO-MEAN sched_debug.cfs_=
rq[1]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     248037 =C2=B1  4%     -14.6%     211800 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     248037           -14.6%     211800        GEO-MEAN sched_debug.cfs_=
rq[30]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        523 =C2=B1  5%     +14.8%        600 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        523           +14.8%        600        GEO-MEAN sched_debug.cfs_=
rq[9]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3975794 =C2=B1  3%     -12.4%    3484643 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   31508807 =C2=B1  0%     -19.2%   25447218 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   11192521           -15.9%    9416713        GEO-MEAN sched_debug.cpu#=
47.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      13.79 =C2=B1 11%     -18.7%      11.22 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      13.79           -18.7%      11.22        GEO-MEAN perf-profile.cpu=
-cycles.sock_alloc_send_pskb.unix_stream_sendmsg.sock_aio_write.do_sync_wri=
te.vfs_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6707995 =C2=B1  4%     -20.4%    5338153 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6707995           -20.4%    5338153        GEO-MEAN sched_debug.cfs_=
rq[41]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28480 =C2=B1  6%     -14.5%      24340 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      28480           -14.5%      24340        GEO-MEAN sched_debug.cpu#=
3.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.44 =C2=B1 13%     -31.5%       1.67 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.30 =C2=B1  2%     -10.9%       1.16 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.78           -21.9%       1.39        GEO-MEAN perf-profile.cpu=
-cycles.skb_copy_datagram_from_iovec.unix_stream_sendmsg.sock_aio_write.do_=
sync_write.vfs_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5630 =C2=B1 20%     -27.4%       4085 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      28428 =C2=B1  6%     -13.4%      24615 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14374 =C2=B1  1%      -9.7%      12976 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      13201           -17.2%      10927        GEO-MEAN sched_debug.cpu#=
32.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  4%     +28.3%         25 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +28.3%         25        GEO-MEAN sched_debug.cpu#=
3.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  8%     +16.7%         23 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +16.7%         23        GEO-MEAN sched_debug.cpu#=
5.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1 10%     +18.6%         23 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +18.6%         23        GEO-MEAN sched_debug.cpu#=
5.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1  8%     -14.1%         20 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         23           -14.1%         20        GEO-MEAN sched_debug.cfs_=
rq[31]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  5%     -16.1%         15 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           -16.1%         15        GEO-MEAN sched_debug.cpu#=
26.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  4%     +21.7%         24 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           +21.7%         24        GEO-MEAN sched_debug.cpu#=
3.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         23 =C2=B1  6%     -13.0%         20 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         23           -13.0%         19        GEO-MEAN sched_debug.cfs_=
rq[2]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  2%     -14.5%         15 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           -14.5%         15        GEO-MEAN sched_debug.cpu#=
26.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3976394 =C2=B1  3%     -11.7%    3510398 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   31529669 =C2=B1  0%     -19.1%   25504070 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >   11197071           -15.5%    9462000        GEO-MEAN sched_debug.cpu#=
47.sched_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        299 =C2=B1  9%     +31.8%        394 =C2=B1 14%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        299           +31.8%        394        GEO-MEAN sched_debug.cfs_=
rq[14]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6188990 =C2=B1  4%     -16.9%    5143546 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6188990           -16.9%    5143546        GEO-MEAN sched_debug.cfs_=
rq[28]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27911 =C2=B1  7%      -9.1%      25365 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      27590 =C2=B1  9%     -10.0%      24831 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      27750            -9.6%      25096        GEO-MEAN sched_debug.cpu#=
15.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      24152 =C2=B1  3%     -17.9%      19823 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      24152           -17.9%      19823        GEO-MEAN sched_debug.cfs_=
rq[25]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  7%     +15.8%         22 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20 =C2=B1  2%      -8.1%         19 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >         23 =C2=B1  6%     -14.5%         19 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         20            -3.1%         20        GEO-MEAN sched_debug.cpu#=
8.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        527 =C2=B1  3%     -17.8%        433 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        527           -17.8%        432        GEO-MEAN sched_debug.cfs_=
rq[25]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         95 =C2=B1  5%     -19.2%         77 =C2=B1 19%  ivb42/hackbench=
/performance-100%-threads-socket
> >         95           -19.2%         77        GEO-MEAN sched_debug.cfs_=
rq[13]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1 12%     -23.5%         13 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21 =C2=B1  4%     -10.9%         19 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           -17.5%         15        GEO-MEAN sched_debug.cpu#=
29.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     253158 =C2=B1  4%     -16.8%     210701 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     253158           -16.8%     210701        GEO-MEAN sched_debug.cfs_=
rq[28]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    3881265 =C2=B1  5%     -11.0%    3454243 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >   25887804 =C2=B1  0%     -21.3%   20372718 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >   10023843           -16.3%    8388821        GEO-MEAN sched_debug.cpu#=
19.nr_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8120 =C2=B1  7%     +21.9%       9900 =C2=B1  5%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       8120           +21.9%       9900        GEO-MEAN sched_debug.cpu#=
48.ttwu_count
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     291131 =C2=B1  6%     +13.4%     330032 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     291131           +13.4%     330032        GEO-MEAN sched_debug.cpu#=
23.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        151 =C2=B1  6%     +14.1%        172 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         64 =C2=B1  6%     -30.9%         44 =C2=B1 32%  ivb42/hackbench=
/performance-100%-threads-socket
> >         98           -11.2%         87        GEO-MEAN sched_debug.cfs_=
rq[6]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.98 =C2=B1  3%     +20.0%       1.18 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >       0.98           +20.0%       1.18        GEO-MEAN perf-profile.cpu=
-cycles._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_aio_=
write.do_sync_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     798851 =C2=B1  3%     -15.8%     672484 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     798851           -15.8%     672484        GEO-MEAN sched_debug.cpu#=
15.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  4%     +15.0%         23 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >         26 =C2=B1  6%     -15.0%         22 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         23            -1.1%         22        GEO-MEAN sched_debug.cpu#=
4.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  7%     +19.0%         25 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           +19.0%         24        GEO-MEAN sched_debug.cpu#=
1.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  9%     -16.4%         17 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >         16 =C2=B1 24%     +48.0%         24 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18           +11.2%         20        GEO-MEAN sched_debug.cpu#=
12.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >  1.883e+10 =C2=B1  2%     -16.3%  1.575e+10 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >  1.883e+10           -16.3%  1.575e+10        GEO-MEAN cpuidle.C6-IVT.t=
ime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     242217 =C2=B1  3%     -12.7%     211488 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     242217           -12.7%     211488        GEO-MEAN sched_debug.cfs_=
rq[33]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     851770 =C2=B1  0%     -15.3%     721480 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >     851770           -15.3%     721480        GEO-MEAN sched_debug.cpu#=
17.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1 10%     -19.0%         15 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           -19.0%         15        GEO-MEAN sched_debug.cpu#=
11.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  8%     -22.0%         15 =C2=B1 16%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           -22.0%         15        GEO-MEAN sched_debug.cpu#=
30.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         15 =C2=B1 14%     +28.9%         19 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         15           +28.9%         19        GEO-MEAN sched_debug.cpu#=
36.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  6%     -15.5%         16 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -15.5%         16        GEO-MEAN sched_debug.cpu#=
33.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  8%     -16.9%         16 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -16.9%         16        GEO-MEAN sched_debug.cpu#=
33.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        935 =C2=B1  5%     -14.5%        799 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        935           -14.5%        799        GEO-MEAN slabinfo.mnt_cac=
he.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        935 =C2=B1  5%     -14.5%        799 =C2=B1 13%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        935           -14.5%        799        GEO-MEAN slabinfo.mnt_cac=
he.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        161 =C2=B1 16%     -24.4%        121 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >        161           -24.4%        121        GEO-MEAN sched_debug.cfs_=
rq[28]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.23 =C2=B1  9%     -16.9%       1.85 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2.23           -16.9%       1.85        GEO-MEAN perf-profile.cpu=
-cycles.security_file_permission.rw_verify_area.vfs_write.sys_write.system_=
call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6402970 =C2=B1  6%     -14.7%    5458801 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6402970           -14.7%    5458801        GEO-MEAN sched_debug.cfs_=
rq[25]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  4%     +28.3%         25 =C2=B1 17%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         28 =C2=B1 39%     -34.1%         18 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         23            -8.0%         21        GEO-MEAN sched_debug.cpu#=
4.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     262352 =C2=B1  6%     -14.7%     223668 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     262352           -14.7%     223668        GEO-MEAN sched_debug.cfs_=
rq[25]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  2%     -20.7%         15 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19 =C2=B1  0%     +10.5%         21 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19            -6.4%         17        GEO-MEAN sched_debug.cpu#=
28.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        703 =C2=B1 15%     -23.1%        541 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >        703           -23.1%        540        GEO-MEAN sched_debug.cfs_=
rq[2]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27795 =C2=B1  5%     -13.2%      24134 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      27794           -13.2%      24134        GEO-MEAN sched_debug.cpu#=
16.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3412 =C2=B1  8%     -15.1%       2898 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    1420038 =C2=B1  1%     -16.0%    1193250 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      69611           -15.5%      58809        GEO-MEAN sched_debug.cpu#=
13.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      22447 =C2=B1  4%     -15.7%      18930 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      22447           -15.7%      18930        GEO-MEAN sched_debug.cfs_=
rq[26]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28675 =C2=B1  6%     -13.0%      24950 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      28675           -13.0%      24950        GEO-MEAN sched_debug.cpu#=
13.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5675688 =C2=B1  1%     +15.1%    6531142 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5675688           +15.1%    6531142        GEO-MEAN sched_debug.cfs_=
rq[15]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        521 =C2=B1  4%     -14.2%        447 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        521           -14.2%        447        GEO-MEAN sched_debug.cfs_=
rq[35]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  5%     +20.0%         26 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           +20.0%         26        GEO-MEAN sched_debug.cpu#=
1.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  5%     +16.9%         25 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           +16.9%         25        GEO-MEAN sched_debug.cpu#=
2.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         26 =C2=B1  6%     -15.0%         22 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         26           -15.0%         22        GEO-MEAN sched_debug.cfs_=
rq[4]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  4%     +17.2%         25 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           +17.2%         24        GEO-MEAN sched_debug.cpu#=
2.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        507 =C2=B1  8%     +18.0%        598 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        507           +18.0%        598        GEO-MEAN sched_debug.cfs_=
rq[5]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23248 =C2=B1  8%     +18.1%      27465 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23248           +18.1%      27465        GEO-MEAN sched_debug.cfs_=
rq[5]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23877 =C2=B1  4%     -14.2%      20481 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23877           -14.2%      20481        GEO-MEAN sched_debug.cfs_=
rq[35]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        494 =C2=B1  4%     +15.8%        573 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        494           +15.8%        573        GEO-MEAN sched_debug.cfs_=
rq[11]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        514 =C2=B1  1%     +13.2%        581 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        514           +13.2%        581        GEO-MEAN sched_debug.cfs_=
rq[6]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        489 =C2=B1  4%     -15.6%        413 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        489           -15.6%        413        GEO-MEAN sched_debug.cfs_=
rq[26]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     235161 =C2=B1  1%     +14.8%     269925 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     235161           +14.8%     269925        GEO-MEAN sched_debug.cfs_=
rq[15]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27474 =C2=B1  0%     +17.4%      32249 =C2=B1  0%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      27474           +17.4%      32249        GEO-MEAN sched_debug.cpu#=
5.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     654103 =C2=B1 16%     +35.4%     885670 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >     654103           +35.4%     885670        GEO-MEAN sched_debug.cpu#=
34.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28467 =C2=B1  8%     -13.3%      24684 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14483 =C2=B1  2%     -11.5%      12813 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >      20305           -12.4%      17784        GEO-MEAN sched_debug.cpu#=
7.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23596 =C2=B1  1%     +13.0%      26662 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23596           +13.0%      26661        GEO-MEAN sched_debug.cfs_=
rq[6]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        107 =C2=B1 15%     +22.9%        132 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >        107           +22.9%        132        GEO-MEAN sched_debug.cfs_=
rq[40]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        340 =C2=B1  7%     +26.7%        430 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        595 =C2=B1 10%     -16.5%        496 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >        449            +2.8%        462        GEO-MEAN sched_debug.cfs_=
rq[12]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      22666 =C2=B1  4%     +15.7%      26230 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      22666           +15.7%      26230        GEO-MEAN sched_debug.cfs_=
rq[11]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  6%     -16.4%         17 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20           -16.4%         17        GEO-MEAN sched_debug.cpu#=
32.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        110 =C2=B1 13%     -17.9%         90 =C2=B1 13%  ivb42/hackbench=
/performance-100%-threads-socket
> >        110           -17.9%         90        GEO-MEAN sched_debug.cfs_=
rq[16]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6564712 =C2=B1  2%     -12.6%    5736157 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6564712           -12.6%    5736157        GEO-MEAN sched_debug.cfs_=
rq[39]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.91 =C2=B1 14%     -20.7%       2.31 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.65 =C2=B1  3%     -11.9%       1.45 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       2.19           -16.4%       1.83        GEO-MEAN perf-profile.cpu=
-cycles.__kmalloc_reserve.isra.26.__alloc_skb.sock_alloc_send_pskb.unix_str=
eam_sendmsg.sock_aio_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     269231 =C2=B1  2%     -12.7%     234926 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     269231           -12.7%     234926        GEO-MEAN sched_debug.cfs_=
rq[39]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        415 =C2=B1 12%     -21.2%        327 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >        414           -21.2%        327        GEO-MEAN sched_debug.cfs_=
rq[5]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8082 =C2=B1  6%     -16.3%       6768 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >       8082           -16.3%       6768        GEO-MEAN slabinfo.sock_in=
ode_cache.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        167 =C2=B1 30%     +52.1%        254 =C2=B1 18%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        167           +52.1%        254        GEO-MEAN sched_debug.cfs_=
rq[12]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28252 =C2=B1  6%     -15.3%      23930 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14095 =C2=B1  2%      -9.6%      12748 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      19955           -12.5%      17466        GEO-MEAN sched_debug.cpu#=
12.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     866621 =C2=B1  1%     -15.9%     728734 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >     866621           -15.9%     728734        GEO-MEAN sched_debug.cpu#=
18.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1039319 =C2=B1  1%     -14.8%     885271 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1039319           -14.8%     885271        GEO-MEAN numa-numastat.no=
de0.local_node
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  6%     -12.9%         18 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20           -12.9%         17        GEO-MEAN sched_debug.cpu#=
31.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  4%     +20.4%         21 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >         17           +20.4%         21        GEO-MEAN sched_debug.cpu#=
21.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1 17%     +31.4%         22 =C2=B1 15%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         17           +31.4%         22        GEO-MEAN sched_debug.cpu#=
43.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  6%     -16.1%         17 =C2=B1  9%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20           -16.1%         17        GEO-MEAN sched_debug.cpu#=
17.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  0%     +14.8%         20 =C2=B1  6%  ivb42/hackbench=
/performance-100%-threads-socket
> >         17           +14.8%         20        GEO-MEAN sched_debug.cfs_=
rq[26]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         22 =C2=B1  6%     -18.2%         18 =C2=B1  9%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         22           -18.2%         17        GEO-MEAN sched_debug.cfs_=
rq[9]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1  7%     +16.9%         20 =C2=B1  4%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >         17           +16.9%         20        GEO-MEAN sched_debug.cpu#=
89.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >          7 =C2=B1 10%     -18.9%          6 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >          7           -18.9%          6        GEO-MEAN sched_debug.cpu#=
31.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.65 =C2=B1 10%     -16.4%       2.21 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2.65           -16.4%       2.21        GEO-MEAN perf-profile.cpu=
-cycles.rw_verify_area.vfs_write.sys_write.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2279041 =C2=B1  3%      +9.8%    2501740 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     867410 =C2=B1  1%     -15.8%     730524 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1406009            -3.8%    1351880        GEO-MEAN sched_debug.cpu#=
20.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       0.92 =C2=B1  3%     +16.1%       1.07 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >       0.92           +16.1%       1.07        GEO-MEAN perf-profile.cpu=
-cycles._raw_spin_lock.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_s=
ync_read
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1043155 =C2=B1  1%     -14.6%     891335 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1043155           -14.6%     891335        GEO-MEAN numa-numastat.no=
de0.numa_hit
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        661 =C2=B1 10%     +32.4%        875 =C2=B1 20%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >        661           +32.4%        875        GEO-MEAN sched_debug.cpu#=
80.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.39 =C2=B1 13%     -18.5%       1.95 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.36 =C2=B1  3%     -11.6%       1.20 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.80           -15.1%       1.53        GEO-MEAN perf-profile.cpu=
-cycles.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.sock_allo=
c_send_pskb.unix_stream_sendmsg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.05 =C2=B1  7%     -20.6%       0.83 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1.05           -20.6%       0.83        GEO-MEAN perf-profile.cpu=
-cycles.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_stat=
e.skb_release_all
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     846804 =C2=B1  1%     -14.7%     722316 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     846804           -14.7%     722316        GEO-MEAN sched_debug.cpu#=
16.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     238110 =C2=B1  3%     -11.2%     211524 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     238110           -11.2%     211524        GEO-MEAN sched_debug.cfs_=
rq[26]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         24 =C2=B1  6%     +16.4%         28 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         24           +16.4%         28        GEO-MEAN sched_debug.cpu#=
31.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      83778 =C2=B1  3%     -12.3%      73451 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >      83778           -12.3%      73451        GEO-MEAN numa-meminfo.nod=
e0.SUnreclaim
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28311 =C2=B1  6%     -14.4%      24235 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14371 =C2=B1  1%     -10.2%      12907 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      20170           -12.3%      17686        GEO-MEAN sched_debug.cpu#=
22.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      20954 =C2=B1  3%     -12.3%      18370 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >      20954           -12.3%      18370        GEO-MEAN numa-vmstat.node=
0.nr_slab_unreclaimable
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23494 =C2=B1  5%     +19.1%      27971 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23494           +19.1%      27971        GEO-MEAN sched_debug.cfs_=
rq[4]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        512 =C2=B1  5%     +19.1%        610 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        512           +19.1%        610        GEO-MEAN sched_debug.cfs_=
rq[4]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     309512 =C2=B1  3%     +13.0%     349773 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     309511           +13.0%     349773        GEO-MEAN sched_debug.cpu#=
10.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     871677 =C2=B1  0%     -13.2%     756998 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     871677           -13.2%     756998        GEO-MEAN sched_debug.cpu#=
47.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5912874 =C2=B1  3%     -12.7%    5163918 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   32948870 =C2=B1  2%      +9.6%   36105667 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   13957884            -2.2%   13654549        GEO-MEAN sched_debug.cfs_=
rq[33]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6896945 =C2=B1  7%     -15.7%    5811415 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6896945           -15.7%    5811415        GEO-MEAN sched_debug.cfs_=
rq[44]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     282705 =C2=B1  7%     -15.7%     238207 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     282705           -15.7%     238207        GEO-MEAN sched_debug.cfs_=
rq[44]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     252684 =C2=B1  2%     +13.0%     285532 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     252684           +13.0%     285532        GEO-MEAN sched_debug.cfs_=
rq[6]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6163243 =C2=B1  2%     +13.1%    6967723 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6163243           +13.1%    6967723        GEO-MEAN sched_debug.cfs_=
rq[6]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     225520 =C2=B1  1%     +19.1%     268653 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     225520           +19.1%     268653        GEO-MEAN sched_debug.cfs_=
rq[16]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2537303 =C2=B1  4%     -10.2%    2278663 =C2=B1  3%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     884857 =C2=B1  0%     -16.3%     741031 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1498383           -13.3%    1299446        GEO-MEAN sched_debug.cpu#=
23.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     832647 =C2=B1  3%     -13.7%     718243 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     832647           -13.7%     718242        GEO-MEAN sched_debug.cpu#=
13.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6056418 =C2=B1  4%     -14.7%    5168979 =C2=B1  8%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   32932650 =C2=B1  1%      +8.8%   35838098 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >   14122815            -3.6%   13610524        GEO-MEAN sched_debug.cfs_=
rq[30]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5916186 =C2=B1  5%     +14.2%    6756084 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5916186           +14.2%    6756084        GEO-MEAN sched_debug.cfs_=
rq[1]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7942 =C2=B1  5%     -15.6%       6700 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >       7941           -15.6%       6699        GEO-MEAN slabinfo.sock_in=
ode_cache.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  4%     +23.3%         24 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21 =C2=B1  3%      -7.9%         19 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20            +6.6%         21        GEO-MEAN sched_debug.cpu#=
3.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     938148 =C2=B1 38%     +41.3%    1325208 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >     938148           +41.3%    1325208        GEO-MEAN sched_debug.cpu#=
16.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10568 =C2=B1  2%     -11.4%       9365 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      10567           -11.4%       9365        GEO-MEAN slabinfo.kmalloc=
-192.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6645 =C2=B1  6%     -12.5%       5816 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >       4025 =C2=B1  6%      -8.3%       3691 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >       5172           -10.4%       4634        GEO-MEAN slabinfo.RAW.num=
_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     242508 =C2=B1  5%     +14.2%     276835 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     242508           +14.2%     276835        GEO-MEAN sched_debug.cfs_=
rq[1]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     827688 =C2=B1 27%     +32.6%    1097797 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >     827688           +32.6%    1097797        GEO-MEAN sched_debug.cpu#=
5.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     863531 =C2=B1  1%     -12.4%     756423 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     863531           -12.4%     756423        GEO-MEAN sched_debug.cpu#=
46.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      10568 =C2=B1  2%     -11.4%       9367 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      10567           -11.4%       9366        GEO-MEAN slabinfo.kmalloc=
-192.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     278399 =C2=B1  1%      +9.4%     304661 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     275094 =C2=B1  4%     -20.4%     218896 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     276742            -6.7%     258243        GEO-MEAN sched_debug.cfs_=
rq[41]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6954107 =C2=B1  6%     -15.0%    5908384 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6954107           -15.0%    5908384        GEO-MEAN sched_debug.cfs_=
rq[43]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     860124 =C2=B1  0%     -12.8%     750152 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     860124           -12.8%     750152        GEO-MEAN sched_debug.cpu#=
38.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        150 =C2=B1 25%     +52.2%        229 =C2=B1 22%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        150           +52.2%        229        GEO-MEAN sched_debug.cfs_=
rq[30]:/.tg_load_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.56 =C2=B1 14%     -18.9%       2.89 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2.04 =C2=B1  7%     -16.0%       1.72 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       2.70           -17.5%       2.23        GEO-MEAN perf-profile.cpu=
-cycles.kfree.skb_free_head.skb_release_data.skb_release_all.consume_skb
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     349472 =C2=B1  5%     -12.3%     306466 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     349472           -12.3%     306466        GEO-MEAN sched_debug.cpu#=
36.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  7%     +24.6%         23 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         18           +24.6%         23        GEO-MEAN sched_debug.cpu#=
19.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   31982562 =C2=B1  0%     +15.7%   37009149 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    5977374 =C2=B1  3%     -12.1%    5255719 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   13826487            +0.9%   13946673        GEO-MEAN sched_debug.cfs_=
rq[29]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1950 =C2=B1  5%     +12.4%       2191 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       1950           +12.4%       2191        GEO-MEAN numa-vmstat.node=
1.nr_inactive_anon
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23783 =C2=B1  4%     +16.4%      27678 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23783           +16.4%      27678        GEO-MEAN sched_debug.cfs_=
rq[2]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5834 =C2=B1  6%     +11.1%       6483 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       5834           +11.1%       6483        GEO-MEAN slabinfo.mm_stru=
ct.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6222825 =C2=B1 12%     -18.5%    5072717 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6222825           -18.5%    5072717        GEO-MEAN sched_debug.cfs_=
rq[24]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     255038 =C2=B1 12%     -18.8%     207195 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     255038           -18.8%     207195        GEO-MEAN sched_debug.cfs_=
rq[24]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        519 =C2=B1  4%     +16.2%        603 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        518           +16.2%        603        GEO-MEAN sched_debug.cfs_=
rq[2]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     870131 =C2=B1  1%     -13.0%     757186 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     870131           -13.0%     757185        GEO-MEAN sched_debug.cpu#=
43.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3.62 =C2=B1 14%     -18.5%       2.95 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2.08 =C2=B1  7%     -16.1%       1.74 =C2=B1 10%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       2.74           -17.3%       2.27        GEO-MEAN perf-profile.cpu=
-cycles.skb_free_head.skb_release_data.skb_release_all.consume_skb.unix_str=
eam_recvmsg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27743 =C2=B1  7%     -12.0%      24409 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      27743           -12.0%      24409        GEO-MEAN sched_debug.cpu#=
18.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       7804 =C2=B1  5%     +12.1%       8751 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       7804           +12.1%       8751        GEO-MEAN numa-meminfo.nod=
e1.Inactive(anon)
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27888 =C2=B1  5%      -9.6%      25222 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      27888            -9.6%      25222        GEO-MEAN sched_debug.cpu#=
19.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5495470 =C2=B1  1%     +18.8%    6526373 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5495470           +18.8%    6526373        GEO-MEAN sched_debug.cfs_=
rq[16]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5884155 =C2=B1  4%     -10.8%    5248844 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5884155           -10.8%    5248844        GEO-MEAN sched_debug.cfs_=
rq[27]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     244799 =C2=B1  3%     -12.1%     215287 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     244799           -12.1%     215287        GEO-MEAN sched_debug.cfs_=
rq[29]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  6%     -16.4%         17 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20 =C2=B1  2%     -11.5%         18 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20           -14.0%         17        GEO-MEAN sched_debug.cpu#=
25.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  6%     -16.4%         17 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20 =C2=B1  2%     -11.5%         18 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20           -14.0%         17        GEO-MEAN sched_debug.cpu#=
25.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3212 =C2=B1 16%     +30.7%       4199 =C2=B1 10%  ivb42/hackbench=
/performance-100%-threads-socket
> >       3212           +30.7%       4199        GEO-MEAN meminfo.AnonHuge=
Pages
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       6578 =C2=B1  5%     -12.2%       5778 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >       3989 =C2=B1  5%      -8.8%       3639 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >       5122           -10.5%       4585        GEO-MEAN slabinfo.RAW.act=
ive_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     885844 =C2=B1  1%     -11.8%     780892 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     885844           -11.8%     780892        GEO-MEAN sched_debug.cpu#=
10.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  6%     +16.1%         24 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20           +16.1%         24        GEO-MEAN sched_debug.cpu#=
4.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  7%     +14.3%         24 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           +14.3%         24        GEO-MEAN sched_debug.cpu#=
4.cpu_load[3]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  4%     +12.3%         24 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           +12.3%         24        GEO-MEAN sched_debug.cpu#=
4.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  7%     +15.9%         24 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           +15.9%         24        GEO-MEAN sched_debug.cpu#=
1.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  8%     +14.8%         23 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20           +14.8%         23        GEO-MEAN sched_debug.cpu#=
5.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         12 =C2=B1 19%     +27.0%         15 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         12           +27.0%         15        GEO-MEAN sched_debug.cpu#=
20.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     247955 =C2=B1  4%     +15.1%     285457 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     247955           +15.1%     285457        GEO-MEAN sched_debug.cfs_=
rq[4]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     292711 =C2=B1  7%     +15.4%     337697 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     292710           +15.4%     337697        GEO-MEAN sched_debug.cpu#=
12.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     354011 =C2=B1  2%     -11.3%     314109 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     354010           -11.3%     314109        GEO-MEAN sched_debug.cpu#=
38.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1946 =C2=B1  1%     +15.1%       2240 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >       1946           +15.1%       2240        GEO-MEAN uptime.idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        153 =C2=B1 33%     +52.3%        233 =C2=B1 20%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        152           +52.3%        232        GEO-MEAN sched_debug.cfs_=
rq[12]:/.blocked_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     668434 =C2=B1  4%     -17.5%     551164 =C2=B1 12%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     668433           -17.5%     551164        GEO-MEAN sched_debug.cpu#=
37.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5316 =C2=B1 31%     +57.6%       8376 =C2=B1 26%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     884511 =C2=B1  1%     -10.9%     788238 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      68572           +18.5%      81254        GEO-MEAN sched_debug.cpu#=
7.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      33.71 =C2=B1 10%     +19.5%      40.27 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      62.72 =C2=B1  6%     +15.1%      72.21 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      45.98           +17.3%      53.93        GEO-MEAN perf-profile.cpu=
-cycles.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_write.sys_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     240644 =C2=B1  4%     -10.7%     214983 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     240644           -10.7%     214983        GEO-MEAN sched_debug.cfs_=
rq[27]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     343906 =C2=B1  3%      -8.1%     315903 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     343906            -8.1%     315903        GEO-MEAN sched_debug.cpu#=
37.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2115995 =C2=B1  0%     -11.9%    1863524 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2115994           -11.9%    1863523        GEO-MEAN proc-vmstat.numa=
_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    2122348 =C2=B1  0%     -11.9%    1869613 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    2122348           -11.9%    1869613        GEO-MEAN proc-vmstat.numa=
_hit
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        604 =C2=B1  6%     -10.5%        541 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >        604           -10.5%        540        GEO-MEAN sched_debug.cfs_=
rq[15]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     276025 =C2=B1  2%     -14.9%     234860 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     276025           -14.9%     234860        GEO-MEAN sched_debug.cfs_=
rq[40]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6732351 =C2=B1  2%     -14.9%    5729702 =C2=B1 10%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6732351           -14.9%    5729702        GEO-MEAN sched_debug.cfs_=
rq[40]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     301307 =C2=B1  4%      +8.8%     327692 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     301307            +8.8%     327692        GEO-MEAN sched_debug.cpu#=
13.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23540 =C2=B1  4%     +17.1%      27569 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23540           +17.1%      27569        GEO-MEAN sched_debug.cfs_=
rq[3]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5809119 =C2=B1  3%     -11.1%    5164063 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >   32901785 =C2=B1  1%      +8.6%   35724630 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   13824991            -1.8%   13582498        GEO-MEAN sched_debug.cfs_=
rq[26]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9580 =C2=B1  5%     +11.5%      10681 =C2=B1  2%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       3727 =C2=B1  0%     -10.3%       3344 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >       5975            +0.0%       5977        GEO-MEAN slabinfo.task_xs=
tate.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        495 =C2=B1  7%     -11.4%        439 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        495           -11.4%        439        GEO-MEAN sched_debug.cfs_=
rq[24]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      22713 =C2=B1  7%     -11.4%      20122 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      22713           -11.4%      20121        GEO-MEAN sched_debug.cfs_=
rq[24]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      36.10 =C2=B1  9%     +17.3%      42.37 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      63.71 =C2=B1  6%     +14.6%      72.99 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      47.96           +16.0%      55.61        GEO-MEAN perf-profile.cpu=
-cycles.sock_aio_write.do_sync_write.vfs_write.sys_write.system_call_fastpa=
th
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     809883 =C2=B1 27%     +39.6%    1130362 =C2=B1 16%  ivb42/hackbench=
/performance-100%-threads-socket
> >     809883           +39.6%    1130362        GEO-MEAN sched_debug.cpu#=
2.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      66.69 =C2=B1  5%     +13.0%      75.33 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      66.69           +13.0%      75.33        GEO-MEAN perf-profile.cpu=
-cycles.vfs_write.sys_write.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        513 =C2=B1  4%     +17.1%        601 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        513           +17.1%        601        GEO-MEAN sched_debug.cfs_=
rq[3]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5371188 =C2=B1  6%     +14.5%    6151452 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5371188           +14.5%    6151452        GEO-MEAN sched_debug.cfs_=
rq[21]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     291849 =C2=B1  2%     +12.8%     329163 =C2=B1  3%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     291849           +12.8%     329163        GEO-MEAN sched_debug.cpu#=
14.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     124649 =C2=B1  4%      +8.9%     135753 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >     124648            +8.9%     135753        GEO-MEAN meminfo.Committe=
d_AS
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     220313 =C2=B1  6%     +14.4%     252043 =C2=B1  6%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     220313           +14.4%     252043        GEO-MEAN sched_debug.cfs_=
rq[21]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  0%     +13.3%         22 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21 =C2=B1  0%      -7.9%         19 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20            +2.1%         20        GEO-MEAN sched_debug.cpu#=
6.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      36.84 =C2=B1  9%     +16.4%      42.88 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      63.94 =C2=B1  5%     +14.4%      73.15 =C2=B1  6%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      48.53           +15.4%      56.01        GEO-MEAN perf-profile.cpu=
-cycles.do_sync_write.vfs_write.sys_write.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     247217 =C2=B1  3%     -12.5%     216334 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     247217           -12.5%     216334        GEO-MEAN sched_debug.cfs_=
rq[31]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6076887 =C2=B1  4%     +14.6%    6964063 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6076887           +14.6%    6964063        GEO-MEAN sched_debug.cfs_=
rq[4]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     873852 =C2=B1  2%     -10.8%     779782 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     873852           -10.8%     779782        GEO-MEAN sched_debug.cpu#=
31.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     332613 =C2=B1  2%     -11.7%     293591 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     332613           -11.7%     293591        GEO-MEAN sched_debug.cpu#=
34.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6034414 =C2=B1  3%     -12.4%    5283623 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6034414           -12.4%    5283623        GEO-MEAN sched_debug.cfs_=
rq[31]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     872491 =C2=B1  2%     -10.3%     782420 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     872491           -10.3%     782420        GEO-MEAN sched_debug.cpu#=
6.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     278773 =C2=B1  2%      +9.5%     305360 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     285131 =C2=B1  6%     -15.0%     242231 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     281934            -3.5%     271970        GEO-MEAN sched_debug.cfs_=
rq[43]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         14 =C2=B1 12%     +22.7%         18 =C2=B1  0%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         14           +22.7%         17        GEO-MEAN sched_debug.cpu#=
36.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         18 =C2=B1  5%     -14.3%         16 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         18           -14.3%         15        GEO-MEAN sched_debug.cpu#=
26.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      67.85 =C2=B1  5%     +12.6%      76.39 =C2=B1  5%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      67.85           +12.6%      76.39        GEO-MEAN perf-profile.cpu=
-cycles.sys_write.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27894 =C2=B1  5%     -11.3%      24750 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14326 =C2=B1  3%      -7.6%      13231 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >      19990            -9.5%      18096        GEO-MEAN sched_debug.cpu#=
9.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9581 =C2=B1  5%     +11.5%      10681 =C2=B1  2%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       9581           +11.5%      10681        GEO-MEAN slabinfo.task_xs=
tate.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23986 =C2=B1  5%     -10.6%      21444 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      23986           -10.6%      21444        GEO-MEAN slabinfo.kmalloc=
-128.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28074 =C2=B1  6%     -10.9%      25010 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >      14384 =C2=B1  2%     -10.9%      12817 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      20095           -10.9%      17904        GEO-MEAN sched_debug.cpu#=
23.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1.39 =C2=B1  2%     +11.9%       1.56 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >       1.39           +11.9%       1.56        GEO-MEAN perf-profile.cpu=
-cycles.skb_queue_tail.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs=
_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        593 =C2=B1  8%     -15.5%        501 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >        593           -15.5%        501        GEO-MEAN sched_debug.cfs_=
rq[7]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     863793 =C2=B1  3%     +12.2%     969283 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     863793           +12.2%     969283        GEO-MEAN sched_debug.cpu#=
107.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     303913 =C2=B1  3%     +13.7%     345451 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     303913           +13.7%     345451        GEO-MEAN sched_debug.cpu#=
17.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     244221 =C2=B1  1%      +8.7%     265370 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     244221            +8.7%     265370        GEO-MEAN sched_debug.cfs_=
rq[11]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    5955487 =C2=B1  2%      +8.7%    6472486 =C2=B1  5%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    5955487            +8.7%    6472486        GEO-MEAN sched_debug.cfs_=
rq[11]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      24029 =C2=B1  5%     -10.7%      21463 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >      24029           -10.7%      21463        GEO-MEAN slabinfo.kmalloc=
-128.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2677 =C2=B1  2%     +10.5%       2957 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2818 =C2=B1  2%      +8.5%       3057 =C2=B1  4%  ivb42/hackbench=
/performance-1600%-threads-socket
> >       2746            +9.5%       3006        GEO-MEAN slabinfo.signal_=
cache.active_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     264668 =C2=B1  2%      +9.0%     288425 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     264668            +9.0%     288425        GEO-MEAN sched_debug.cfs_=
rq[2]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     869839 =C2=B1  3%     +10.9%     964876 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     869839           +10.9%     964876        GEO-MEAN sched_debug.cpu#=
114.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6459224 =C2=B1  2%      +8.9%    7036571 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6459224            +8.9%    7036571        GEO-MEAN sched_debug.cfs_=
rq[2]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     295316 =C2=B1  5%     +12.9%     333345 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     295316           +12.9%     333345        GEO-MEAN sched_debug.cpu#=
20.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      14692 =C2=B1  1%     -10.8%      13111 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >      14692           -10.8%      13111        GEO-MEAN sched_debug.cpu#=
10.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       5361 =C2=B1  5%     +33.2%       7141 =C2=B1 21%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     882178 =C2=B1  2%      -8.7%     805480 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >      68774           +10.3%      75841        GEO-MEAN sched_debug.cpu#=
26.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  8%     -15.3%         16 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         19           -15.3%         16        GEO-MEAN sched_debug.cpu#=
33.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         16 =C2=B1 13%     +22.9%         19 =C2=B1  8%  ivb42/hackbench=
/performance-1600%-threads-socket
> >         15           +22.9%         19        GEO-MEAN sched_debug.cpu#=
23.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        512 =C2=B1  8%     +13.4%        580 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >        511           +13.4%        580        GEO-MEAN sched_debug.cfs_=
rq[0]:/.tg_runnable_contrib
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     340066 =C2=B1  2%     -12.4%     298050 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     340066           -12.4%     298050        GEO-MEAN sched_debug.cpu#=
41.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     864616 =C2=B1  4%     +11.7%     965878 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     864616           +11.7%     965878        GEO-MEAN sched_debug.cpu#=
98.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      23481 =C2=B1  8%     +13.5%      26650 =C2=B1  1%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >      23481           +13.5%      26649        GEO-MEAN sched_debug.cfs_=
rq[0]:/.avg->runnable_avg_sum
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      27727 =C2=B1  4%     -12.8%      24187 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >      27727           -12.8%      24187        GEO-MEAN sched_debug.cpu#=
21.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       1629 =C2=B1  4%     -14.7%       1389 =C2=B1  9%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1629           -14.7%       1389        GEO-MEAN sched_debug.cpu#=
101.sched_goidle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        595 =C2=B1  2%     -12.3%        522 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >        595           -12.3%        522        GEO-MEAN sched_debug.cfs_=
rq[11]:/.utilization_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     296137 =C2=B1  4%     +11.3%     329486 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     296137           +11.3%     329486        GEO-MEAN sched_debug.cpu#=
19.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     292298 =C2=B1  2%      +8.3%     316492 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     292298            +8.3%     316492        GEO-MEAN sched_debug.cpu#=
1.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  2%     -11.5%         18 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20           -11.5%         17        GEO-MEAN sched_debug.cpu#=
25.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  6%     -19.0%         17 =C2=B1  8%  ivb42/hackbench=
/performance-100%-threads-socket
> >         21           -19.0%         17        GEO-MEAN sched_debug.cpu#=
3.nr_running
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  4%     -10.0%         18 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           -10.0%         17        GEO-MEAN sched_debug.cfs_=
rq[25]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         21 =C2=B1  6%     -15.9%         17 =C2=B1  7%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         21           -15.9%         17        GEO-MEAN sched_debug.cpu#=
32.cpu_load[2]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  2%     -11.5%         18 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20           -11.5%         17        GEO-MEAN sched_debug.cpu#=
25.cpu_load[1]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  3%     -10.9%         18 =C2=B1  3%  ivb42/hackbench=
/performance-50%-threads-socket
> >         20           -10.9%         17        GEO-MEAN sched_debug.cpu#=
5.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  6%     -13.1%         17 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20           -13.1%         17        GEO-MEAN sched_debug.cpu#=
25.cpu_load[0]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         17 =C2=B1  7%     +11.3%         19 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >         17           +11.3%         19        GEO-MEAN sched_debug.cfs_=
rq[22]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  6%     -11.5%         18 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >         20           -11.5%         17        GEO-MEAN sched_debug.cpu#=
35.cpu_load[4]
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     863639 =C2=B1  5%     +12.7%     973188 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     863639           +12.7%     973188        GEO-MEAN sched_debug.cpu#=
111.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     887828 =C2=B1  2%      +9.8%     974669 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     887828            +9.8%     974669        GEO-MEAN sched_debug.cpu#=
108.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      45906 =C2=B1  4%      -7.3%      42564 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      45906            -7.3%      42563        GEO-MEAN proc-vmstat.nr_s=
lab_unreclaimable
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     878539 =C2=B1  3%     +10.0%     966188 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     878539           +10.0%     966188        GEO-MEAN sched_debug.cpu#=
105.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     882058 =C2=B1  4%      +9.2%     962926 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     882058            +9.2%     962926        GEO-MEAN sched_debug.cpu#=
115.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     183127 =C2=B1  4%      -7.0%     170358 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >     183127            -7.0%     170358        GEO-MEAN meminfo.SUnrecla=
im
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.38 =C2=B1  1%     +12.1%       2.67 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >       2.38           +12.1%       2.67        GEO-MEAN perf-profile.cpu=
-cycles.__fdget_pos.sys_write.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6169346 =C2=B1 12%     +17.8%    7267207 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6169346           +17.8%    7267207        GEO-MEAN sched_debug.cfs_=
rq[0]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     325723 =C2=B1  2%      -9.6%     294426 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     325723            -9.6%     294426        GEO-MEAN sched_debug.cpu#=
28.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     641780 =C2=B1  4%     -13.1%     557691 =C2=B1  9%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     641780           -13.1%     557691        GEO-MEAN sched_debug.cpu#=
42.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     878266 =C2=B1  2%      +9.4%     960869 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     878265            +9.4%     960869        GEO-MEAN sched_debug.cpu#=
112.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     873490 =C2=B1  2%     +11.3%     972078 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     873490           +11.3%     972078        GEO-MEAN sched_debug.cpu#=
110.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     869768 =C2=B1  3%     +12.3%     976670 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     869768           +12.3%     976670        GEO-MEAN sched_debug.cpu#=
116.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    6168215 =C2=B1  3%      -8.4%    5647800 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >    6168215            -8.4%    5647800        GEO-MEAN sched_debug.cfs_=
rq[35]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  3%      -8.7%         19 =C2=B1  5%  ivb42/hackbench=
/performance-50%-threads-socket
> >         20            -8.7%         18        GEO-MEAN sched_debug.cfs_=
rq[5]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  2%     +12.1%         21 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >         19           +12.1%         21        GEO-MEAN sched_debug.cpu#=
32.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         19 =C2=B1  0%     +14.0%         21 =C2=B1  7%  ivb42/hackbench=
/performance-100%-threads-socket
> >         18           +14.0%         21        GEO-MEAN sched_debug.cfs_=
rq[32]:/.load
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >         20 =C2=B1  2%      -8.1%         19 =C2=B1  4%  ivb42/hackbench=
/performance-100%-threads-socket
> >         20            -8.1%         18        GEO-MEAN sched_debug.cfs_=
rq[34]:/.runnable_load_avg
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     875905 =C2=B1  3%      +9.6%     960122 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     875905            +9.6%     960122        GEO-MEAN sched_debug.cpu#=
97.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     252344 =C2=B1  3%      -8.3%     231291 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     252344            -8.3%     231291        GEO-MEAN sched_debug.cfs_=
rq[35]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      28092 =C2=B1  6%     +12.8%      31678 =C2=B1  7%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      28092           +12.8%      31678        GEO-MEAN sched_debug.cpu#=
8.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     885542 =C2=B1  1%      +9.2%     967066 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     885542            +9.2%     967066        GEO-MEAN sched_debug.cpu#=
117.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     331866 =C2=B1  3%      -8.5%     303502 =C2=B1  2%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     331866            -8.5%     303502        GEO-MEAN sched_debug.cpu#=
25.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     883209 =C2=B1  2%     +10.3%     973864 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     883208           +10.3%     973864        GEO-MEAN sched_debug.cpu#=
119.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     257326 =C2=B1 11%     +17.1%     301232 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     257326           +17.1%     301232        GEO-MEAN sched_debug.cfs_=
rq[0]:/.exec_clock
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     877064 =C2=B1  0%      -8.9%     799209 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >     877064            -8.9%     799208        GEO-MEAN sched_debug.cpu#=
27.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1081809 =C2=B1  1%      -9.1%     983451 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1081809            -9.1%     983451        GEO-MEAN numa-numastat.no=
de1.local_node
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >    1084327 =C2=B1  1%      -9.3%     983476 =C2=B1  1%  ivb42/hackbench=
/performance-50%-threads-socket
> >    1084327            -9.3%     983475        GEO-MEAN numa-numastat.no=
de1.numa_hit
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     866831 =C2=B1  3%     +11.9%     969612 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     866831           +11.9%     969612        GEO-MEAN sched_debug.cpu#=
113.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.29 =C2=B1  1%     +11.9%       2.57 =C2=B1  4%  ivb42/hackbench=
/performance-50%-threads-socket
> >       2.29           +11.9%       2.57        GEO-MEAN perf-profile.cpu=
-cycles.__fget_light.__fdget_pos.sys_write.system_call_fastpath
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >   33152118 =C2=B1  2%      +7.8%   35741164 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >   33152118            +7.8%   35741164        GEO-MEAN sched_debug.cfs_=
rq[32]:/.min_vruntime
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     847788 =C2=B1  3%     -12.0%     746038 =C2=B1  2%  ivb42/hackbench=
/performance-50%-threads-socket
> >     847788           -12.0%     746038        GEO-MEAN sched_debug.cpu#=
40.ttwu_local
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2.42 =C2=B1 10%     -15.2%       2.05 =C2=B1  5%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2.42           -15.2%       2.05        GEO-MEAN perf-profile.cpu=
-cycles.kmem_cache_alloc_node.__alloc_skb.sock_alloc_send_pskb.unix_stream_=
sendmsg.sock_aio_write
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     889659 =C2=B1 30%     +30.7%    1162352 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >     889659           +30.7%    1162352        GEO-MEAN sched_debug.cpu#=
15.max_idle_balance_cost
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     320242 =C2=B1  2%      -8.3%     293814 =C2=B1  4%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >     320241            -8.3%     293814        GEO-MEAN sched_debug.cpu#=
30.nr_load_updates
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     861007 =C2=B1  2%     +11.8%     962300 =C2=B1  1%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >     861007           +11.8%     962300        GEO-MEAN sched_debug.cpu#=
104.avg_idle
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       2762 =C2=B1  0%      +8.7%       3004 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >       2762            +8.7%       3004        GEO-MEAN slabinfo.signal_=
cache.num_objs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      26457 =C2=B1  6%     +10.4%      29200 =C2=B1  2%  ivb42/hackbench=
/performance-1600%-threads-socket
> >      26457           +10.4%      29200        GEO-MEAN sched_debug.cpu#=
11.curr->pid
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       9.40 =C2=B1  2%     +52.1%      14.30 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >       9.40           +52.1%      14.30        GEO-MEAN turbostat.RAM_W
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     649374 =C2=B1  3%    +105.3%    1333405 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      50784 =C2=B1  4%     -32.0%      34549 =C2=B1  0%  ivb42/ebizzy/pe=
rformance-50%-100x-10s
> >  4.442e+08 =C2=B1 10%     +26.0%  5.596e+08 =C2=B1  1%  ivb42/hackbench=
/performance-100%-threads-socket
> >  5.504e+08 =C2=B1  0%     -18.7%  4.477e+08 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >    9475905            +9.4%   10364881        GEO-MEAN time.involuntary=
_context_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >  1.349e+09 =C2=B1 18%     +35.8%  1.832e+09 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >  2.029e+09 =C2=B1  0%     -19.6%  1.632e+09 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >  1.654e+09            +4.5%  1.729e+09        GEO-MEAN time.voluntary_c=
ontext_switches
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       3287 =C2=B1  1%     +47.1%       4835 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >    2984855 =C2=B1 18%     +31.9%    3935924 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >    4221419 =C2=B1  0%     -18.2%    3451963 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     346015           +16.6%     403510        GEO-MEAN vmstat.system.cs
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     527825 =C2=B1 25%     +55.6%     821385 =C2=B1  3%  ivb42/hackbench=
/performance-100%-threads-socket
> >      57542 =C2=B1  2%      -5.1%      54624 =C2=B1  0%  ivb42/hackbench=
/performance-1600%-threads-socket
> >    1096082 =C2=B1  1%     +11.3%    1220347 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >     321692           +18.0%     379728        GEO-MEAN vmstat.system.in
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >     135280 =C2=B1  1%      +3.5%     140039 =C2=B1  2%  ivb42/hackbench=
/performance-100%-threads-socket
> >     328603 =C2=B1  4%     +28.0%     420733 =C2=B1  6%  ivb42/hackbench=
/performance-50%-threads-socket
> >     210840           +15.1%     242732        GEO-MEAN time.minor_page_=
faults
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      19219 =C2=B1  3%      -4.1%      18425 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       1263 =C2=B1  7%     -13.1%       1097 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >        808 =C2=B1  0%     -10.7%        721 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >       2697            -9.4%       2443        GEO-MEAN time.user_time
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        327 =C2=B1  9%     +12.5%        368 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >        173 =C2=B1  0%      -3.0%        168 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >        238            +4.5%        249        GEO-MEAN turbostat.Cor_W
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        409 =C2=B1  7%     +10.3%        452 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >        204 =C2=B1  0%      -1.8%        200 =C2=B1  0%  ivb42/hackbench=
/performance-50%-threads-socket
> >        289            +4.1%        301        GEO-MEAN turbostat.Pkg_W
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      56589 =C2=B1  1%      +4.5%      59152 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      27783 =C2=B1  0%      +1.4%      28183 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >      39651            +3.0%      40830        GEO-MEAN time.system_time
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >      74.04 =C2=B1  0%      +1.6%      75.20 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >      74.04            +1.6%      75.20        GEO-MEAN turbostat.%c0
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >       8852 =C2=B1  0%      +1.6%       8992 =C2=B1  0%  brickland3/vm-s=
calability/performance-300s-8T-anon-cow-seq
> >       4659 =C2=B1  0%      -0.9%       4618 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >       6422            +0.3%       6444        GEO-MEAN time.percent_of_=
cpu_this_job_got
> >
> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> > ----------------  --------------------------
> >        623 =C2=B1  0%      +1.7%        633 =C2=B1  0%  ivb42/hackbench=
/performance-100%-threads-socket
> >        623            +1.7%        633        GEO-MEAN time.elapsed_time
> >
> >
> >         --yliu
> >
> >
> >> Regards,
> >> Vincent
> >>
> >> >
> >> >         --yliu
> >> >>
> >> >> I'm going to try to reproduce the test in my local setup
> >> >>
> >> >> Regards,
> >> >> Vincent
> >> >>
> >> >>
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       0.88 =C4=85 25%    +209.7%       2.74 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       0.88          +209.7%       2.74        GEO-MEAN perf-profi=
le.cpu-cycles.ttwu_do_activate.constprop.87.sched_ttwu_pending.scheduler_ip=
i.smp_reschedule_interrupt.reschedule_interrupt
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       0.76 =C4=85 26%    +209.2%       2.36 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       0.76          +209.2%       2.36        GEO-MEAN perf-profi=
le.cpu-cycles.activate_task.ttwu_do_activate.sched_ttwu_pending.scheduler_i=
pi.smp_reschedule_interrupt
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       0.76 =C4=85 26%    +210.6%       2.35 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       0.76          +210.6%       2.35        GEO-MEAN perf-profi=
le.cpu-cycles.enqueue_task.activate_task.ttwu_do_activate.sched_ttwu_pendin=
g.scheduler_ipi
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       0.70 =C4=85 25%    +203.1%       2.13 =C4=85  6%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       0.70          +203.1%       2.13        GEO-MEAN perf-profi=
le.cpu-cycles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate=
.sched_ttwu_pending
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     243252 =C4=85 46%    +242.5%     833240 =C4=85 42%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     243252          +242.5%     833240        GEO-MEAN sched_debu=
g.cfs_rq[2]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >         98 =C4=85 36%     -49.1%         50 =C4=85 34%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >         98           -49.1%         50        GEO-MEAN sched_debu=
g.cfs_rq[18]:/.blocked_load_avg
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1067752 =C4=85 25%     +65.3%    1764542 =C4=85 11%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1067752           +65.3%    1764542        GEO-MEAN sched_debu=
g.cfs_rq[16]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     923375 =C4=85 22%     +96.3%    1812750 =C4=85 21%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     923375           +96.3%    1812750        GEO-MEAN sched_debu=
g.cfs_rq[14]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1008818 =C4=85 20%     +70.9%    1724167 =C4=85 14%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1008818           +70.9%    1724167        GEO-MEAN sched_debu=
g.cfs_rq[6]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1109100 =C4=85 25%     +53.9%    1707190 =C4=85 16%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1109100           +53.9%    1707190        GEO-MEAN sched_debu=
g.cfs_rq[15]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1006499 =C4=85 33%     +67.8%    1688436 =C4=85 22%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1006499           +67.8%    1688436        GEO-MEAN sched_debu=
g.cfs_rq[13]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     915637 =C4=85 16%     +93.4%    1771080 =C4=85 18%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     915637           +93.4%    1771080        GEO-MEAN sched_debu=
g.cfs_rq[7]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     783024 =C4=85 10%     +67.2%    1309563 =C4=85 22%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     783024           +67.2%    1309563        GEO-MEAN sched_debu=
g.cfs_rq[5]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      16155 =C4=85  3%     +66.8%      26952 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      16155           +66.8%      26952        GEO-MEAN proc-vmsta=
t.numa_pages_migrated
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      16155 =C4=85  3%     +66.8%      26952 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      16155           +66.8%      26952        GEO-MEAN proc-vmsta=
t.pgmigrate_success
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1443204 =C4=85 24%     +51.5%    2187058 =C4=85  6%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1443204           +51.5%    2187058        GEO-MEAN sched_debu=
g.cfs_rq[23]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       2.26 =C4=85  4%     -38.0%       1.40 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       2.26           -38.0%       1.40        GEO-MEAN perf-profi=
le.cpu-cycles._raw_spin_lock.try_to_wake_up.default_wake_function.autoremov=
e_wake_function.__wake_up_common
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1203841 =C4=85 25%     +53.0%    1842451 =C4=85 19%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1203841           +53.0%    1842451        GEO-MEAN sched_debu=
g.cfs_rq[17]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >        119 =C4=85 32%     -41.7%         69 =C4=85 23%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >        119           -41.7%         69        GEO-MEAN sched_debu=
g.cfs_rq[18]:/.tg_load_contrib
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1128380 =C4=85 24%     +67.1%    1886076 =C4=85 15%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1128380           +67.1%    1886076        GEO-MEAN sched_debu=
g.cfs_rq[8]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      35577 =C4=85 20%     +42.9%      50840 =C4=85 15%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      35577           +42.9%      50840        GEO-MEAN sched_debu=
g.cpu#11.avg_idle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       4.45 =C4=85  4%     -35.2%       2.88 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       4.45           -35.2%       2.88        GEO-MEAN perf-profi=
le.cpu-cycles.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate=
.try_to_wake_up
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1230679 =C4=85  9%     +65.1%    2032295 =C4=85 14%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1230679           +65.1%    2032295        GEO-MEAN sched_debu=
g.cfs_rq[10]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       6.42 =C4=85  4%     -33.1%       4.30 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       6.42           -33.1%       4.30        GEO-MEAN perf-profi=
le.cpu-cycles.ttwu_do_activate.constprop.87.try_to_wake_up.default_wake_fun=
ction.autoremove_wake_function.__wake_up_common
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       5.13 =C4=85  4%     -33.8%       3.40 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       5.13           -33.8%       3.40        GEO-MEAN perf-profi=
le.cpu-cycles.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.de=
fault_wake_function
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       5.14 =C4=85  4%     -33.8%       3.41 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       5.14           -33.8%       3.41        GEO-MEAN perf-profi=
le.cpu-cycles.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_fu=
nction.autoremove_wake_function
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.11 =C4=85  3%     -29.1%       0.78 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.11           -29.1%       0.78        GEO-MEAN perf-profi=
le.cpu-cycles.check_preempt_curr.ttwu_do_wakeup.ttwu_do_activate.try_to_wak=
e_up.default_wake_function
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.22 =C4=85  3%     -29.1%       0.87 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.22           -29.1%       0.87        GEO-MEAN perf-profi=
le.cpu-cycles.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.default_wake_f=
unction.autoremove_wake_function
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1357971 =C4=85 14%     +41.3%    1918898 =C4=85  9%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1357971           +41.3%    1918898        GEO-MEAN sched_debu=
g.cfs_rq[9]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1304331 =C4=85 11%     +49.2%    1946271 =C4=85 13%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1304331           +49.2%    1946271        GEO-MEAN sched_debu=
g.cfs_rq[11]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >        608 =C4=85  3%     -28.7%        433 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >        608           -28.7%        433        GEO-MEAN cpuidle.PO=
LL.usage
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     424656 =C4=85  2%     +37.7%     584637 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     424656           +37.7%     584637        GEO-MEAN cpuidle.C6=
-IVT.usage
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1508175 =C4=85 18%     +37.7%    2076043 =C4=85 16%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1508175           +37.7%    2076043        GEO-MEAN sched_debu=
g.cfs_rq[21]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     287269 =C4=85  4%     +32.4%     380327 =C4=85  6%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     287268           +32.4%     380326        GEO-MEAN proc-vmsta=
t.numa_hint_faults
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   22221059 =C4=85  1%     -25.7%   16516998 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   22221059           -25.7%   16516998        GEO-MEAN sched_debu=
g.cpu#23.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1468667 =C4=85 15%     +43.2%    2102926 =C4=85  9%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1468667           +43.2%    2102926        GEO-MEAN sched_debu=
g.cfs_rq[22]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     291407 =C4=85  4%     +31.7%     383859 =C4=85  6%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     291407           +31.7%     383859        GEO-MEAN proc-vmsta=
t.numa_pte_updates
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20399319 =C4=85  1%     -24.9%   15320065 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20399319           -24.9%   15320065        GEO-MEAN sched_debu=
g.cpu#47.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21955842 =C4=85  1%     -25.2%   16425955 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21955842           -25.2%   16425955        GEO-MEAN sched_debu=
g.cpu#19.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21384750 =C4=85  0%     -24.7%   16103640 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21384750           -24.7%   16103640        GEO-MEAN sched_debu=
g.cpu#21.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19455420 =C4=85  1%     -24.4%   14708872 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19455420           -24.4%   14708872        GEO-MEAN sched_debu=
g.cpu#44.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.48 =C4=85  4%     -23.7%       1.13 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.48           -23.7%       1.13        GEO-MEAN perf-profi=
le.cpu-cycles.__switch_to
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       2.70 =C4=85  5%     +27.7%       3.45 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       2.70           +27.7%       3.45        GEO-MEAN perf-profi=
le.cpu-cycles.idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_=
up.default_wake_function
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20991987 =C4=85  0%     -24.1%   15929117 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20991987           -24.1%   15929117        GEO-MEAN sched_debu=
g.cpu#20.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20232670 =C4=85  1%     -24.7%   15244668 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20232670           -24.7%   15244668        GEO-MEAN sched_debu=
g.cpu#43.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21686213 =C4=85  1%     -24.5%   16369380 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21686213           -24.5%   16369380        GEO-MEAN sched_debu=
g.cpu#12.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21654231 =C4=85  1%     -24.3%   16385202 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21654231           -24.3%   16385202        GEO-MEAN sched_debu=
g.cpu#13.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19800323 =C4=85  1%     -24.6%   14937832 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19800323           -24.6%   14937832        GEO-MEAN sched_debu=
g.cpu#45.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20091416 =C4=85  0%     -24.4%   15193784 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20091416           -24.4%   15193784        GEO-MEAN sched_debu=
g.cpu#38.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19904854 =C4=85  1%     -24.2%   15083433 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19904854           -24.2%   15083433        GEO-MEAN sched_debu=
g.cpu#36.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20172173 =C4=85  0%     -24.0%   15328449 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20172173           -24.0%   15328448        GEO-MEAN sched_debu=
g.cpu#39.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.25 =C4=85  2%     -25.4%       0.93 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.25           -25.4%       0.93        GEO-MEAN perf-profi=
le.cpu-cycles.update_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_ta=
sk.deactivate_task
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21661306 =C4=85  0%     -24.2%   16411873 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21661306           -24.2%   16411873        GEO-MEAN sched_debu=
g.cpu#14.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21896234 =C4=85  0%     -24.2%   16598293 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21896234           -24.2%   16598293        GEO-MEAN sched_debu=
g.cpu#15.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19221661 =C4=85  1%     -23.7%   14665426 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19221661           -23.7%   14665426        GEO-MEAN sched_debu=
g.cpu#40.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21058318 =C4=85  1%     -24.2%   15959916 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21058318           -24.2%   15959916        GEO-MEAN sched_debu=
g.cpu#17.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21754207 =C4=85  0%     -24.2%   16487812 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21754207           -24.2%   16487812        GEO-MEAN sched_debu=
g.cpu#22.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19963010 =C4=85  1%     -24.1%   15143746 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19963009           -24.1%   15143746        GEO-MEAN sched_debu=
g.cpu#37.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20748744 =C4=85  1%     -23.7%   15832368 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20748743           -23.7%   15832368        GEO-MEAN sched_debu=
g.cpu#16.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19955834 =C4=85  0%     -23.9%   15189591 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19955834           -23.9%   15189591        GEO-MEAN sched_debu=
g.cpu#46.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26674784 =C4=85  1%     -23.1%   20500535 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26674784           -23.1%   20500535        GEO-MEAN sched_debu=
g.cpu#22.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26689071 =C4=85  1%     -23.1%   20511407 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26689071           -23.1%   20511407        GEO-MEAN sched_debu=
g.cpu#22.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21264995 =C4=85  1%     -23.6%   16250715 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21264995           -23.6%   16250715        GEO-MEAN sched_debu=
g.cpu#18.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19641786 =C4=85  1%     -23.5%   15029146 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19641786           -23.5%   15029146        GEO-MEAN sched_debu=
g.cpu#42.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      26923 =C4=85  2%     +29.2%      34786 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      26923           +29.2%      34786        GEO-MEAN cpuidle.C3=
-IVT.usage
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19417423 =C4=85  1%     -23.3%   14891714 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19417423           -23.3%   14891714        GEO-MEAN sched_debu=
g.cpu#41.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26079901 =C4=85  0%     -22.7%   20147877 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26079901           -22.7%   20147877        GEO-MEAN sched_debu=
g.cpu#18.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26104071 =C4=85  0%     -22.7%   20165898 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26104071           -22.7%   20165898        GEO-MEAN sched_debu=
g.cpu#18.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25569796 =C4=85  0%     -21.9%   19978756 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25569796           -21.9%   19978756        GEO-MEAN sched_debu=
g.cpu#14.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25580176 =C4=85  0%     -21.8%   19998098 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25580176           -21.8%   19998098        GEO-MEAN sched_debu=
g.cpu#14.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1336731 =C4=85 24%     +41.1%    1886101 =C4=85 10%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1336731           +41.1%    1886101        GEO-MEAN sched_debu=
g.cfs_rq[18]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    7138831 =C4=85  1%     -22.1%    5563134 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    7138831           -22.1%    5563134        GEO-MEAN proc-vmsta=
t.pgfree
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    7160822 =C4=85  1%     -22.0%    5584442 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    7160822           -22.0%    5584442        GEO-MEAN proc-vmsta=
t.pgalloc_normal
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25705305 =C4=85  0%     -22.1%   20026342 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25705305           -22.1%   20026342        GEO-MEAN sched_debu=
g.cpu#15.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26577794 =C4=85  0%     -22.0%   20738980 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26577794           -22.0%   20738980        GEO-MEAN sched_debu=
g.cpu#23.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25887804 =C4=85  0%     -21.3%   20372718 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25887804           -21.3%   20372718        GEO-MEAN sched_debu=
g.cpu#19.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25686569 =C4=85  1%     -21.6%   20148163 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25686569           -21.6%   20148163        GEO-MEAN sched_debu=
g.cpu#13.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25905972 =C4=85  0%     -21.3%   20386581 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25905972           -21.3%   20386581        GEO-MEAN sched_debu=
g.cpu#19.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26595019 =C4=85  0%     -21.8%   20795049 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26595019           -21.8%   20795049        GEO-MEAN sched_debu=
g.cpu#23.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25682384 =C4=85  0%     -22.1%   20009219 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25682384           -22.1%   20009218        GEO-MEAN sched_debu=
g.cpu#15.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25625064 =C4=85  1%     -21.6%   20086187 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25625064           -21.6%   20086187        GEO-MEAN sched_debu=
g.cpu#13.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26289191 =C4=85  1%     -21.5%   20639754 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26289191           -21.5%   20639754        GEO-MEAN sched_debu=
g.cpu#20.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26272949 =C4=85  1%     -21.5%   20616474 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26272949           -21.5%   20616474        GEO-MEAN sched_debu=
g.cpu#20.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25785235 =C4=85  0%     -21.6%   20221040 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25785235           -21.6%   20221040        GEO-MEAN sched_debu=
g.cpu#12.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25525885 =C4=85  0%     -21.5%   20037162 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25525885           -21.5%   20037162        GEO-MEAN sched_debu=
g.cpu#17.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25575741 =C4=85  0%     -21.4%   20104812 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25575741           -21.4%   20104812        GEO-MEAN sched_debu=
g.cpu#17.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25842972 =C4=85  0%     -21.5%   20284708 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25842972           -21.5%   20284708        GEO-MEAN sched_debu=
g.cpu#12.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25395850 =C4=85  0%     -21.3%   19996864 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25395850           -21.3%   19996864        GEO-MEAN sched_debu=
g.cpu#16.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25385835 =C4=85  0%     -21.3%   19979026 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25385835           -21.3%   19979026        GEO-MEAN sched_debu=
g.cpu#16.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26295715 =C4=85  1%     -21.6%   20610286 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26295715           -21.6%   20610286        GEO-MEAN sched_debu=
g.cpu#21.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26311333 =C4=85  1%     -21.6%   20632524 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26311333           -21.6%   20632524        GEO-MEAN sched_debu=
g.cpu#21.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30824379 =C4=85  1%     -20.1%   24621183 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30824379           -20.1%   24621183        GEO-MEAN sched_debu=
g.cpu#42.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30849469 =C4=85  1%     -20.1%   24636230 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30849469           -20.1%   24636230        GEO-MEAN sched_debu=
g.cpu#42.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31513770 =C4=85  0%     -20.1%   25180158 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31513770           -20.1%   25180158        GEO-MEAN sched_debu=
g.cpu#46.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31530459 =C4=85  0%     -20.1%   25191647 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31530459           -20.1%   25191647        GEO-MEAN sched_debu=
g.cpu#46.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      31534 =C4=85 13%     +41.8%      44720 =C4=85 14%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      31534           +41.8%      44720        GEO-MEAN sched_debu=
g.cpu#38.avg_idle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3311434 =C4=85  8%     +19.3%    3950522 =C4=85 12%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3311434           +19.3%    3950522        GEO-MEAN sched_debu=
g.cfs_rq[46]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25599960 =C4=85  0%     -19.5%   20605928 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25599960           -19.5%   20605928        GEO-MEAN sched_debu=
g.cpu#0.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25587783 =C4=85  0%     -19.5%   20590387 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25587783           -19.5%   20590387        GEO-MEAN sched_debu=
g.cpu#0.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30196745 =C4=85  1%     -19.4%   24347741 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30196745           -19.4%   24347740        GEO-MEAN sched_debu=
g.cpu#41.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    2845181 =C4=85 10%     +25.9%    3581780 =C4=85  9%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    2845181           +25.9%    3581780        GEO-MEAN sched_debu=
g.cfs_rq[40]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30227050 =C4=85  1%     -19.3%   24406165 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30227049           -19.3%   24406164        GEO-MEAN sched_debu=
g.cpu#41.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30720180 =C4=85  0%     -19.4%   24772598 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30720180           -19.4%   24772598        GEO-MEAN sched_debu=
g.cpu#36.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30769646 =C4=85  1%     -19.3%   24823365 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30769646           -19.3%   24823365        GEO-MEAN sched_debu=
g.cpu#36.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30527777 =C4=85  1%     -19.2%   24677022 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30527776           -19.2%   24677022        GEO-MEAN sched_debu=
g.cpu#37.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      22044 =C4=85  1%     +25.8%      27733 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      22044           +25.8%      27733        GEO-MEAN cpuidle.C1=
E-IVT.usage
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3387494 =C4=85  6%     +16.9%    3960647 =C4=85  7%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3387494           +16.9%    3960647        GEO-MEAN sched_debu=
g.cfs_rq[33]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31508807 =C4=85  0%     -19.2%   25447218 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31508807           -19.2%   25447218        GEO-MEAN sched_debu=
g.cpu#47.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30884674 =C4=85  0%     -18.7%   25097824 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30884674           -18.7%   25097824        GEO-MEAN sched_debu=
g.cpu#24.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31529669 =C4=85  0%     -19.1%   25504070 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31529669           -19.1%   25504070        GEO-MEAN sched_debu=
g.cpu#47.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30891431 =C4=85  0%     -18.7%   25116019 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30891431           -18.7%   25116019        GEO-MEAN sched_debu=
g.cpu#24.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    2877453 =C4=85  6%     +25.4%    3608032 =C4=85  6%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    2877453           +25.4%    3608032        GEO-MEAN sched_debu=
g.cfs_rq[26]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30686015 =C4=85  0%     -19.0%   24852515 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30686015           -19.0%   24852515        GEO-MEAN sched_debu=
g.cpu#43.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30567772 =C4=85  1%     -19.1%   24719285 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30567772           -19.1%   24719285        GEO-MEAN sched_debu=
g.cpu#37.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30700393 =C4=85  0%     -19.0%   24871670 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30700393           -19.0%   24871669        GEO-MEAN sched_debu=
g.cpu#43.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25429518 =C4=85  0%     -19.0%   20597694 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25429518           -19.0%   20597693        GEO-MEAN sched_debu=
g.cpu#1.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30426640 =C4=85  0%     -18.9%   24661763 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30426640           -18.9%   24661762        GEO-MEAN sched_debu=
g.cpu#38.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25437824 =C4=85  0%     -19.0%   20602002 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25437824           -19.0%   20602002        GEO-MEAN sched_debu=
g.cpu#1.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30443857 =C4=85  0%     -18.9%   24679394 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30443857           -18.9%   24679394        GEO-MEAN sched_debu=
g.cpu#38.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3170186 =C4=85 12%     +20.8%    3830642 =C4=85  8%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3170186           +20.8%    3830642        GEO-MEAN sched_debu=
g.cfs_rq[41]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30345040 =C4=85  1%     -18.8%   24632965 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30345040           -18.8%   24632965        GEO-MEAN sched_debu=
g.cpu#39.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30316596 =C4=85  1%     -18.8%   24607293 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30316596           -18.8%   24607293        GEO-MEAN sched_debu=
g.cpu#39.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   29982666 =C4=85  0%     -18.4%   24458570 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   29982666           -18.4%   24458570        GEO-MEAN sched_debu=
g.cpu#40.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   29960708 =C4=85  0%     -18.4%   24438001 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   29960708           -18.4%   24438001        GEO-MEAN sched_debu=
g.cpu#40.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31047087 =C4=85  1%     -19.2%   25085514 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31047087           -19.2%   25085514        GEO-MEAN sched_debu=
g.cpu#45.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31032942 =C4=85  1%     -19.2%   25067720 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31032942           -19.2%   25067720        GEO-MEAN sched_debu=
g.cpu#45.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25578650 =C4=85  1%     -18.4%   20864649 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25578650           -18.4%   20864649        GEO-MEAN sched_debu=
g.cpu#4.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.53 =C4=85  3%     +23.0%       1.88 =C4=85  7%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.53           +23.0%       1.88        GEO-MEAN perf-profi=
le.cpu-cycles.fput.system_call_fastpath
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25532967 =C4=85  1%     -18.3%   20857796 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25532967           -18.3%   20857796        GEO-MEAN sched_debu=
g.cpu#4.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3155171 =C4=85  2%     +19.0%    3753143 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3155171           +19.0%    3753143        GEO-MEAN sched_debu=
g.cfs_rq[31]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26700103 =C4=85  1%     -19.1%   21595767 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26700103           -19.1%   21595767        GEO-MEAN sched_debu=
g.cpu#9.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26710729 =C4=85  1%     -19.1%   21602428 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26710729           -19.1%   21602428        GEO-MEAN sched_debu=
g.cpu#9.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31156436 =C4=85  0%     -18.7%   25325830 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31156435           -18.7%   25325830        GEO-MEAN sched_debu=
g.cpu#44.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31140524 =C4=85  0%     -18.8%   25300128 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31140524           -18.8%   25300128        GEO-MEAN sched_debu=
g.cpu#44.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26524961 =C4=85  0%     -17.8%   21793394 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26524961           -17.8%   21793394        GEO-MEAN sched_debu=
g.cpu#10.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3335586 =C4=85  3%     +22.0%    4070327 =C4=85  8%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3335586           +22.0%    4070327        GEO-MEAN sched_debu=
g.cfs_rq[34]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25755165 =C4=85  0%     -18.0%   21119793 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25755165           -18.0%   21119793        GEO-MEAN sched_debu=
g.cpu#6.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25808917 =C4=85  0%     -18.1%   21133286 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25808917           -18.1%   21133286        GEO-MEAN sched_debu=
g.cpu#6.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31373706 =C4=85  0%     -18.0%   25734789 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31373706           -18.0%   25734789        GEO-MEAN sched_debu=
g.cpu#33.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31356060 =C4=85  0%     -17.9%   25728656 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31356060           -17.9%   25728656        GEO-MEAN sched_debu=
g.cpu#33.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26544024 =C4=85  0%     -17.7%   21833203 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26544024           -17.7%   21833203        GEO-MEAN sched_debu=
g.cpu#10.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26226903 =C4=85  1%     -17.9%   21539753 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26226903           -17.9%   21539753        GEO-MEAN sched_debu=
g.cpu#8.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26216240 =C4=85  1%     -17.9%   21529356 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26216240           -17.9%   21529356        GEO-MEAN sched_debu=
g.cpu#8.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26008985 =C4=85  0%     -17.3%   21498163 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26008985           -17.3%   21498162        GEO-MEAN sched_debu=
g.cpu#7.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25640553 =C4=85  0%     -18.0%   21025853 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25640553           -18.0%   21025853        GEO-MEAN sched_debu=
g.cpu#5.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25624862 =C4=85  0%     -18.0%   21018684 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25624862           -18.0%   21018684        GEO-MEAN sched_debu=
g.cpu#5.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26021354 =C4=85  0%     -17.3%   21510179 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26021354           -17.3%   21510179        GEO-MEAN sched_debu=
g.cpu#7.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     254353 =C4=85  4%     +18.7%     302028 =C4=85  7%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     254353           +18.7%     302028        GEO-MEAN proc-vmsta=
t.numa_hint_faults_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25398742 =C4=85  1%     -18.1%   20807675 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25398742           -18.1%   20807675        GEO-MEAN sched_debu=
g.cpu#3.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25405187 =C4=85  1%     -18.1%   20818635 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25405187           -18.1%   20818635        GEO-MEAN sched_debu=
g.cpu#3.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     881319 =C4=85  1%     -16.5%     735645 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     881319           -16.5%     735645        GEO-MEAN sched_debu=
g.cpu#19.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30533255 =C4=85  0%     -17.4%   25208231 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30533255           -17.4%   25208231        GEO-MEAN sched_debu=
g.cpu#25.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26692010 =C4=85  0%     -17.7%   21973527 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26692010           -17.7%   21973527        GEO-MEAN sched_debu=
g.cpu#11.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   26676971 =C4=85  0%     -17.7%   21964784 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   26676971           -17.7%   21964784        GEO-MEAN sched_debu=
g.cpu#11.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30548238 =C4=85  0%     -17.4%   25222173 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30548238           -17.4%   25222173        GEO-MEAN sched_debu=
g.cpu#25.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30313545 =C4=85  1%     -17.1%   25125827 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30313545           -17.1%   25125827        GEO-MEAN sched_debu=
g.cpu#26.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30325190 =C4=85  1%     -17.1%   25139575 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30325190           -17.1%   25139575        GEO-MEAN sched_debu=
g.cpu#26.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30298989 =C4=85  0%     -17.1%   25132450 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30298989           -17.1%   25132450        GEO-MEAN sched_debu=
g.cpu#28.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30364476 =C4=85  0%     -17.2%   25142879 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30364476           -17.2%   25142879        GEO-MEAN sched_debu=
g.cpu#28.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       3.63 =C4=85  3%     +17.9%       4.29 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       3.63           +17.9%       4.29        GEO-MEAN perf-profi=
le.cpu-cycles.select_idle_sibling.select_task_rq_fair.try_to_wake_up.defaul=
t_wake_function.autoremove_wake_function
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     885971 =C4=85  1%     -17.6%     730417 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     885971           -17.6%     730417        GEO-MEAN sched_debu=
g.cpu#22.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.61 =C4=85  1%     -14.9%       1.37 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.61           -14.9%       1.37        GEO-MEAN perf-profi=
le.cpu-cycles.pick_next_task_fair.__sched_text_start.schedule.schedule_time=
out.unix_stream_recvmsg
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1487383 =C4=85  1%     -17.0%    1233892 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1487383           -17.0%    1233892        GEO-MEAN sched_debu=
g.cpu#22.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     873433 =C4=85  1%     -15.8%     735098 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     873433           -15.8%     735098        GEO-MEAN sched_debu=
g.cpu#12.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25242747 =C4=85  1%     -18.0%   20695565 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25242747           -18.0%   20695565        GEO-MEAN sched_debu=
g.cpu#2.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   25252993 =C4=85  1%     -18.0%   20700339 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   25252993           -18.0%   20700338        GEO-MEAN sched_debu=
g.cpu#2.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     876946 =C4=85  1%     -16.9%     728531 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     876946           -16.9%     728531        GEO-MEAN sched_debu=
g.cpu#21.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30929790 =C4=85  1%     -16.7%   25766295 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30929790           -16.7%   25766295        GEO-MEAN sched_debu=
g.cpu#32.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30944860 =C4=85  1%     -16.7%   25778928 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30944860           -16.7%   25778928        GEO-MEAN sched_debu=
g.cpu#32.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31340929 =C4=85  0%     -16.7%   26094438 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31340929           -16.7%   26094438        GEO-MEAN sched_debu=
g.cpu#34.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31354076 =C4=85  0%     -16.7%   26120882 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31354075           -16.7%   26120882        GEO-MEAN sched_debu=
g.cpu#34.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       3.01 =C4=85  2%     -18.4%       2.46 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       3.01           -18.4%       2.46        GEO-MEAN perf-profi=
le.cpu-cycles.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task=
.__sched_text_start
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     884857 =C4=85  0%     -16.3%     741031 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     884857           -16.3%     741031        GEO-MEAN sched_debu=
g.cpu#23.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   22693545 =C4=85  0%     -16.6%   18915402 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   22693545           -16.6%   18915402        GEO-MEAN sched_debu=
g.cpu#11.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30424082 =C4=85  0%     -16.8%   25305405 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30424082           -16.8%   25305405        GEO-MEAN sched_debu=
g.cpu#30.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30485250 =C4=85  0%     -16.9%   25323543 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30485250           -16.9%   25323542        GEO-MEAN sched_debu=
g.cpu#30.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30917867 =C4=85  0%     -16.9%   25707653 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30917867           -16.9%   25707653        GEO-MEAN sched_debu=
g.cpu#31.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30924268 =C4=85  0%     -16.8%   25716265 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30924268           -16.8%   25716265        GEO-MEAN sched_debu=
g.cpu#31.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30468014 =C4=85  1%     -17.2%   25213426 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30468014           -17.2%   25213426        GEO-MEAN sched_debu=
g.cpu#27.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30477512 =C4=85  1%     -17.2%   25229055 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30477512           -17.2%   25229055        GEO-MEAN sched_debu=
g.cpu#27.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30130205 =C4=85  0%     -16.7%   25101385 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30130205           -16.7%   25101385        GEO-MEAN sched_debu=
g.cpu#29.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   22458882 =C4=85  0%     -16.7%   18703491 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   22458882           -16.7%   18703491        GEO-MEAN sched_debu=
g.cpu#10.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   30140313 =C4=85  0%     -16.7%   25115800 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   30140313           -16.7%   25115800        GEO-MEAN sched_debu=
g.cpu#29.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     868193 =C4=85  1%     -15.6%     732542 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     868193           -15.6%     732542        GEO-MEAN sched_debu=
g.cpu#13.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1374659 =C4=85 25%     +37.8%    1894017 =C4=85  8%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1374659           +37.8%    1894017        GEO-MEAN sched_debu=
g.cfs_rq[19]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20829936 =C4=85  0%     -17.0%   17279112 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20829936           -17.0%   17279112        GEO-MEAN sched_debu=
g.cpu#35.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1418996 =C4=85  0%     -16.4%    1186744 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1418996           -16.4%    1186744        GEO-MEAN sched_debu=
g.cpu#16.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31557915 =C4=85  0%     -16.4%   26383001 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31557915           -16.4%   26383001        GEO-MEAN sched_debu=
g.cpu#35.nr_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   31570143 =C4=85  0%     -16.4%   26389314 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   31570143           -16.4%   26389314        GEO-MEAN sched_debu=
g.cpu#35.sched_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1420038 =C4=85  1%     -16.0%    1193250 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1420038           -16.0%    1193250        GEO-MEAN sched_debu=
g.cpu#13.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1450656 =C4=85  1%     -17.1%    1202921 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1450656           -17.1%    1202921        GEO-MEAN sched_debu=
g.cpu#18.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20626695 =C4=85  0%     -16.6%   17207030 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20626695           -16.6%   17207030        GEO-MEAN sched_debu=
g.cpu#31.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   22476314 =C4=85  1%     -16.3%   18802789 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   22476314           -16.3%   18802789        GEO-MEAN sched_debu=
g.cpu#7.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20008939 =C4=85  0%     -15.6%   16896437 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20008939           -15.6%   16896437        GEO-MEAN sched_debu=
g.cpu#32.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1447302 =C4=85  0%     -16.4%    1210584 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1447302           -16.4%    1210584        GEO-MEAN sched_debu=
g.cpu#19.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1429701 =C4=85  1%     -16.2%    1198182 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1429701           -16.2%    1198181        GEO-MEAN sched_debu=
g.cpu#15.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     872462 =C4=85  0%     -15.4%     737745 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     872462           -15.4%     737745        GEO-MEAN sched_debu=
g.cpu#15.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.53 =C4=85  3%     -16.4%       1.28 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.53           -16.4%       1.28        GEO-MEAN perf-profi=
le.cpu-cycles.update_cfs_shares.enqueue_entity.enqueue_task_fair.enqueue_ta=
sk.activate_task
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20534273 =C4=85  1%     -15.8%   17284516 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20534273           -15.8%   17284516        GEO-MEAN sched_debu=
g.cpu#25.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20560704 =C4=85  0%     -16.2%   17227893 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20560704           -16.2%   17227893        GEO-MEAN sched_debu=
g.cpu#34.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     862442 =C4=85  0%     -15.1%     732316 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     862442           -15.1%     732316        GEO-MEAN sched_debu=
g.cpu#14.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1443239 =C4=85  0%     -16.5%    1205709 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1443239           -16.5%    1205709        GEO-MEAN sched_debu=
g.cpu#12.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       0.98 =C4=85  3%     +20.0%       1.18 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       0.98           +20.0%       1.18        GEO-MEAN perf-profi=
le.cpu-cycles._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.soc=
k_aio_write.do_sync_write
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1487380 =C4=85  1%     -16.3%    1244520 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1487380           -16.3%    1244520        GEO-MEAN sched_debu=
g.cpu#23.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >  1.356e+08 =C4=85  0%     -15.5%  1.147e+08 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >  1.356e+08           -15.5%  1.147e+08        GEO-MEAN cpuidle.C1=
-IVT.usage
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20314951 =C4=85  0%     -15.6%   17140944 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20314951           -15.6%   17140944        GEO-MEAN sched_debu=
g.cpu#30.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1473950 =C4=85  1%     -16.2%    1235367 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1473950           -16.2%    1235367        GEO-MEAN sched_debu=
g.cpu#20.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     867410 =C4=85  1%     -15.8%     730524 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     867410           -15.8%     730524        GEO-MEAN sched_debu=
g.cpu#20.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.33 =C4=85  2%     -16.4%       1.11 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.33           -16.4%       1.11        GEO-MEAN perf-profi=
le.cpu-cycles.__sched_text_start.schedule_user.sysret_careful
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1472841 =C4=85  1%     -15.7%    1241382 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1472841           -15.7%    1241382        GEO-MEAN sched_debu=
g.cpu#21.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1423709 =C4=85  0%     -15.8%    1198274 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1423709           -15.8%    1198274        GEO-MEAN sched_debu=
g.cpu#17.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     851770 =C4=85  0%     -15.3%     721480 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     851770           -15.3%     721480        GEO-MEAN sched_debu=
g.cpu#17.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.40 =C4=85  2%     -16.1%       1.17 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.40           -16.1%       1.17        GEO-MEAN perf-profi=
le.cpu-cycles.sysret_careful
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21736276 =C4=85  0%     -15.7%   18334370 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21736276           -15.7%   18334370        GEO-MEAN sched_debu=
g.cpu#8.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1417611 =C4=85  1%     -16.1%    1189420 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1417611           -16.1%    1189420        GEO-MEAN sched_debu=
g.cpu#14.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20609132 =C4=85  0%     -15.8%   17362846 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20609132           -15.8%   17362846        GEO-MEAN sched_debu=
g.cpu#26.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   22069167 =C4=85  0%     -15.4%   18674407 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   22069167           -15.4%   18674407        GEO-MEAN sched_debu=
g.cpu#6.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    2820456 =C4=85  4%     +23.4%    3479484 =C4=85  7%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    2820456           +23.4%    3479484        GEO-MEAN sched_debu=
g.cfs_rq[27]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20618809 =C4=85  0%     -15.7%   17385264 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20618809           -15.7%   17385264        GEO-MEAN sched_debu=
g.cpu#27.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19897448 =C4=85  1%     -15.2%   16867976 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19897448           -15.2%   16867976        GEO-MEAN sched_debu=
g.cpu#29.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   22444826 =C4=85  1%     -14.2%   19266125 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   22444826           -14.2%   19266125        GEO-MEAN sched_debu=
g.cpu#0.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3341263 =C4=85 11%     +20.3%    4019480 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3341263           +20.3%    4019480        GEO-MEAN sched_debu=
g.cfs_rq[45]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   22509799 =C4=85  0%     -15.2%   19080882 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   22509799           -15.2%   19080882        GEO-MEAN sched_debu=
g.cpu#2.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   22483652 =C4=85  1%     -15.0%   19119883 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   22483652           -15.0%   19119883        GEO-MEAN sched_debu=
g.cpu#1.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20020943 =C4=85  0%     -14.5%   17120192 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20020943           -14.5%   17120192        GEO-MEAN sched_debu=
g.cpu#33.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21609616 =C4=85  0%     -14.6%   18459478 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21609616           -14.6%   18459478        GEO-MEAN sched_debu=
g.cpu#5.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   19520181 =C4=85  0%     -14.6%   16662350 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   19520181           -14.6%   16662349        GEO-MEAN sched_debu=
g.cpu#28.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.37 =C4=85  3%     -15.6%       1.15 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.37           -15.6%       1.15        GEO-MEAN perf-profi=
le.cpu-cycles.schedule_user.sysret_careful
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   22662241 =C4=85  0%     -15.3%   19188484 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   22662241           -15.3%   19188484        GEO-MEAN sched_debu=
g.cpu#3.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     866621 =C4=85  1%     -15.9%     728734 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     866621           -15.9%     728734        GEO-MEAN sched_debu=
g.cpu#18.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1039319 =C4=85  1%     -14.8%     885271 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1039319           -14.8%     885271        GEO-MEAN numa-numas=
tat.node0.local_node
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21798079 =C4=85  1%     -14.6%   18621574 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21798079           -14.6%   18621574        GEO-MEAN sched_debu=
g.cpu#9.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3043317 =C4=85  9%     +25.3%    3814417 =C4=85 13%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3043317           +25.3%    3814417        GEO-MEAN sched_debu=
g.cfs_rq[38]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   20231936 =C4=85  0%     -13.8%   17436914 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   20231936           -13.8%   17436914        GEO-MEAN sched_debu=
g.cpu#24.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >         20 =C4=85  4%     -10.7%         18 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >         20           -10.7%         18        GEO-MEAN sched_debu=
g.cpu#16.cpu_load[0]
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >         20 =C4=85  3%      -9.8%         18 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >         20            -9.8%         18        GEO-MEAN sched_debu=
g.cpu#16.cpu_load[1]
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       0.92 =C4=85  3%     +16.1%       1.07 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       0.92           +16.1%       1.07        GEO-MEAN perf-profi=
le.cpu-cycles._raw_spin_lock.unix_stream_recvmsg.sock_aio_read.sock_aio_rea=
d.do_sync_read
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >   21278578 =C4=85  0%     -14.0%   18299464 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >   21278578           -14.0%   18299464        GEO-MEAN sched_debu=
g.cpu#4.ttwu_count
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1043155 =C4=85  1%     -14.6%     891335 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1043155           -14.6%     891335        GEO-MEAN numa-numas=
tat.node0.numa_hit
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     860946 =C4=85  1%     -13.4%     745561 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     860946           -13.4%     745561        GEO-MEAN sched_debu=
g.cpu#45.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     846804 =C4=85  1%     -14.7%     722316 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     846804           -14.7%     722316        GEO-MEAN sched_debu=
g.cpu#16.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3100432 =C4=85 12%     +22.4%    3793805 =C4=85  6%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3100432           +22.4%    3793805        GEO-MEAN sched_debu=
g.cfs_rq[37]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     860253 =C4=85  1%     -13.1%     747838 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     860253           -13.1%     747838        GEO-MEAN sched_debu=
g.cpu#44.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    2896486 =C4=85  7%     +19.6%    3463508 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    2896486           +19.6%    3463508        GEO-MEAN sched_debu=
g.cfs_rq[25]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     871677 =C4=85  0%     -13.2%     756998 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     871677           -13.2%     756998        GEO-MEAN sched_debu=
g.cpu#47.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3230592 =C4=85  8%     +14.9%    3712705 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3230592           +14.9%    3712705        GEO-MEAN sched_debu=
g.cfs_rq[30]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       3.91 =C4=85  1%     -14.3%       3.35 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       3.91           -14.3%       3.35        GEO-MEAN perf-profi=
le.cpu-cycles.dequeue_task_fair.dequeue_task.deactivate_task.__sched_text_s=
tart.schedule
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     860005 =C4=85  1%     -12.9%     748893 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     860005           -12.9%     748893        GEO-MEAN sched_debu=
g.cpu#42.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3321870 =C4=85  7%     +14.8%    3811901 =C4=85  7%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3321870           +14.8%    3811901        GEO-MEAN sched_debu=
g.cfs_rq[47]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14483 =C4=85  2%     -11.5%      12813 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14483           -11.5%      12813        GEO-MEAN sched_debu=
g.cpu#7.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14.50 =C4=85  1%     -13.3%      12.57 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14.50           -13.3%      12.57        GEO-MEAN perf-profi=
le.cpu-cycles.default_wake_function.autoremove_wake_function.__wake_up_comm=
on.__wake_up_sync_key.sock_def_readable
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3234028 =C4=85  9%     +15.2%    3724307 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3234028           +15.2%    3724307        GEO-MEAN sched_debu=
g.cfs_rq[39]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     863531 =C4=85  1%     -12.4%     756423 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     863531           -12.4%     756423        GEO-MEAN sched_debu=
g.cpu#46.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3276492 =C4=85  5%     +15.5%    3784016 =C4=85  8%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3276492           +15.5%    3784016        GEO-MEAN sched_debu=
g.cfs_rq[35]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     860124 =C4=85  0%     -12.8%     750152 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     860124           -12.8%     750152        GEO-MEAN sched_debu=
g.cpu#38.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       4.32 =C4=85  2%     +13.3%       4.90 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       4.32           +13.3%       4.90        GEO-MEAN perf-profi=
le.cpu-cycles.select_task_rq_fair.try_to_wake_up.default_wake_function.auto=
remove_wake_function.__wake_up_common
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       4025 =C4=85  6%      -8.3%       3691 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       4025            -8.3%       3691        GEO-MEAN slabinfo.R=
AW.num_objs
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     859082 =C4=85  1%     -12.0%     756012 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     859082           -12.0%     756012        GEO-MEAN sched_debu=
g.cpu#37.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     870131 =C4=85  1%     -13.0%     757186 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     870131           -13.0%     757185        GEO-MEAN sched_debu=
g.cpu#43.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14.53 =C4=85  1%     -12.9%      12.66 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14.53           -12.9%      12.66        GEO-MEAN perf-profi=
le.cpu-cycles.try_to_wake_up.default_wake_function.autoremove_wake_function=
.__wake_up_common.__wake_up_sync_key
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14.75 =C4=85  1%     -12.6%      12.89 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14.75           -12.6%      12.89        GEO-MEAN perf-profi=
le.cpu-cycles.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.=
sock_def_readable.unix_stream_sendmsg
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     870275 =C4=85  1%     -13.3%     754578 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     870275           -13.3%     754578        GEO-MEAN sched_debu=
g.cpu#36.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       3989 =C4=85  5%      -8.8%       3639 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       3989            -8.8%       3639        GEO-MEAN slabinfo.R=
AW.active_objs
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.03 =C4=85  1%     -13.2%       0.89 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.03           -13.2%       0.89        GEO-MEAN perf-profi=
le.cpu-cycles.skb_unlink.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do=
_sync_read
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     885844 =C4=85  1%     -11.8%     780892 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     885844           -11.8%     780892        GEO-MEAN sched_debu=
g.cpu#10.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     895578 =C4=85  2%     -11.5%     792265 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     895578           -11.5%     792265        GEO-MEAN sched_debu=
g.cpu#11.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     883237 =C4=85  2%     -11.9%     777826 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     883237           -11.9%     777826        GEO-MEAN sched_debu=
g.cpu#1.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    2115995 =C4=85  0%     -11.9%    1863524 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    2115994           -11.9%    1863523        GEO-MEAN proc-vmsta=
t.numa_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    2122348 =C4=85  0%     -11.9%    1869613 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    2122348           -11.9%    1869613        GEO-MEAN proc-vmsta=
t.numa_hit
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       2.57 =C4=85  4%     +13.8%       2.92 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       2.57           +13.8%       2.92        GEO-MEAN perf-profi=
le.cpu-cycles._raw_spin_lock.unix_stream_sendmsg.sock_aio_write.do_sync_wri=
te.vfs_write
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1406705 =C4=85  1%     -10.8%    1254824 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1406705           -10.8%    1254824        GEO-MEAN sched_debu=
g.cpu#0.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      15.05 =C4=85  1%     -11.8%      13.27 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      15.05           -11.8%      13.27        GEO-MEAN perf-profi=
le.cpu-cycles.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_st=
ream_sendmsg.sock_aio_write
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     879602 =C4=85  1%     -11.5%     778421 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     879602           -11.5%     778421        GEO-MEAN sched_debu=
g.cpu#8.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     884715 =C4=85  2%     -11.6%     782521 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     884714           -11.6%     782521        GEO-MEAN sched_debu=
g.cpu#9.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     869234 =C4=85  1%     -10.1%     781750 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     869234           -10.1%     781749        GEO-MEAN sched_debu=
g.cpu#3.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      13928 =C4=85  3%     -10.0%      12532 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      13928           -10.0%      12531        GEO-MEAN sched_debu=
g.cpu#34.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.65 =C4=85  3%     -11.9%       1.45 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.65           -11.9%       1.45        GEO-MEAN perf-profi=
le.cpu-cycles.__kmalloc_reserve.isra.26.__alloc_skb.sock_alloc_send_pskb.un=
ix_stream_sendmsg.sock_aio_write
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     860847 =C4=85  2%     -11.2%     764541 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     860847           -11.2%     764541        GEO-MEAN sched_debu=
g.cpu#39.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     839076 =C4=85  1%     -11.6%     741571 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     839076           -11.6%     741571        GEO-MEAN sched_debu=
g.cpu#41.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     875043 =C4=85  2%     -10.0%     787246 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     875042           -10.0%     787246        GEO-MEAN sched_debu=
g.cpu#34.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      23.87 =C4=85  1%     -10.7%      21.31 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      23.87           -10.7%      21.31        GEO-MEAN perf-profi=
le.cpu-cycles.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock=
_aio_write.do_sync_write
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       4.45 =C4=85  1%     -11.6%       3.93 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       4.45           -11.6%       3.93        GEO-MEAN perf-profi=
le.cpu-cycles.deactivate_task.__sched_text_start.schedule.schedule_timeout.=
unix_stream_recvmsg
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     873852 =C4=85  2%     -10.8%     779782 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     873852           -10.8%     779782        GEO-MEAN sched_debu=
g.cpu#31.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     872491 =C4=85  2%     -10.3%     782420 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     872491           -10.3%     782420        GEO-MEAN sched_debu=
g.cpu#6.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.11 =C4=85  7%     -12.5%       0.97 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.11           -12.5%       0.97        GEO-MEAN perf-profi=
le.cpu-cycles.selinux_file_permission.security_file_permission.rw_verify_ar=
ea.vfs_read.sys_read
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       8.05 =C4=85  2%     -12.5%       7.04 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       8.05           -12.5%       7.04        GEO-MEAN perf-profi=
le.cpu-cycles._raw_spin_lock_irqsave.__wake_up_sync_key.sock_def_readable.u=
nix_stream_sendmsg.sock_aio_write
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.36 =C4=85  3%     -11.6%       1.20 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.36           -11.6%       1.20        GEO-MEAN perf-profi=
le.cpu-cycles.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.soc=
k_alloc_send_pskb.unix_stream_sendmsg
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     884511 =C4=85  1%     -10.9%     788238 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     884511           -10.9%     788238        GEO-MEAN sched_debu=
g.cpu#7.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1423158 =C4=85  1%     -10.2%    1278070 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1423157           -10.2%    1278070        GEO-MEAN sched_debu=
g.cpu#4.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.39 =C4=85  2%     +11.9%       1.56 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.39           +11.9%       1.56        GEO-MEAN perf-profi=
le.cpu-cycles.skb_queue_tail.unix_stream_sendmsg.sock_aio_write.do_sync_wri=
te.vfs_write
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       4.46 =C4=85  1%     -11.2%       3.96 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       4.46           -11.2%       3.96        GEO-MEAN perf-profi=
le.cpu-cycles.dequeue_task.deactivate_task.__sched_text_start.schedule.sche=
dule_timeout
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     882994 =C4=85  2%      -9.2%     801606 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     882994            -9.2%     801606        GEO-MEAN sched_debu=
g.cpu#25.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14371 =C4=85  1%     -10.2%      12907 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14371           -10.2%      12907        GEO-MEAN sched_debu=
g.cpu#22.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14692 =C4=85  1%     -10.8%      13111 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14692           -10.8%      13111        GEO-MEAN sched_debu=
g.cpu#10.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14093 =C4=85  3%      -9.5%      12748 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14093            -9.5%      12748        GEO-MEAN sched_debu=
g.cpu#25.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1495572 =C4=85  0%     -10.9%    1333271 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1495571           -10.9%    1333271        GEO-MEAN sched_debu=
g.cpu#9.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14153 =C4=85  3%      -9.4%      12817 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14153            -9.4%      12817        GEO-MEAN sched_debu=
g.cpu#27.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14374 =C4=85  1%      -9.7%      12976 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14374            -9.7%      12976        GEO-MEAN sched_debu=
g.cpu#32.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     860018 =C4=85  2%     -10.0%     773781 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     860018           -10.0%     773781        GEO-MEAN sched_debu=
g.cpu#4.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     863792 =C4=85  1%     -10.0%     777585 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     863792           -10.0%     777585        GEO-MEAN sched_debu=
g.cpu#32.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14193 =C4=85  2%     -10.5%      12697 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14193           -10.5%      12697        GEO-MEAN sched_debu=
g.cpu#46.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1394923 =C4=85  0%      -9.3%    1265094 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1394922            -9.3%    1265094        GEO-MEAN sched_debu=
g.cpu#3.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1427072 =C4=85  1%      -9.9%    1285217 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1427072            -9.9%    1285217        GEO-MEAN sched_debu=
g.cpu#5.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >         20 =C4=85  3%     -10.9%         18 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >         20           -10.9%         17        GEO-MEAN sched_debu=
g.cpu#5.cpu_load[0]
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       1.30 =C4=85  2%     -10.9%       1.16 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       1.30           -10.9%       1.16        GEO-MEAN perf-profi=
le.cpu-cycles.skb_copy_datagram_from_iovec.unix_stream_sendmsg.sock_aio_wri=
te.do_sync_write.vfs_write
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1404122 =C4=85  0%     -10.1%    1262026 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1404122           -10.1%    1262026        GEO-MEAN sched_debu=
g.cpu#2.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     871725 =C4=85  3%      -9.5%     788740 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     871725            -9.5%     788740        GEO-MEAN sched_debu=
g.cpu#35.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       2.62 =C4=85  1%     +10.8%       2.90 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       2.62           +10.8%       2.90        GEO-MEAN perf-profi=
le.cpu-cycles.skb_copy_datagram_iovec.unix_stream_recvmsg.sock_aio_read.soc=
k_aio_read.do_sync_read
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1440886 =C4=85  0%     -10.0%    1296355 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1440886           -10.0%    1296355        GEO-MEAN sched_debu=
g.cpu#6.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14332 =C4=85  2%      -9.0%      13045 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14332            -9.0%      13045        GEO-MEAN sched_debu=
g.cpu#33.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     882824 =C4=85  1%     -10.1%     793313 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     882824           -10.1%     793312        GEO-MEAN sched_debu=
g.cpu#0.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    3116277 =C4=85  7%     +13.2%    3527174 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    3116277           +13.2%    3527174        GEO-MEAN sched_debu=
g.cfs_rq[29]:/.spread0
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       2.38 =C4=85  1%     +12.1%       2.67 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       2.38           +12.1%       2.67        GEO-MEAN perf-profi=
le.cpu-cycles.__fdget_pos.sys_write.system_call_fastpath
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14095 =C4=85  2%      -9.6%      12748 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14095            -9.6%      12748        GEO-MEAN sched_debu=
g.cpu#12.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1499703 =C4=85  0%      -9.7%    1354350 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1499703            -9.7%    1354350        GEO-MEAN sched_debu=
g.cpu#10.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14050 =C4=85  2%      -9.9%      12664 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14050            -9.9%      12664        GEO-MEAN sched_debu=
g.cpu#47.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1493710 =C4=85  1%     -10.0%    1344628 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1493710           -10.0%    1344628        GEO-MEAN sched_debu=
g.cpu#11.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     882178 =C4=85  2%      -8.7%     805480 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     882178            -8.7%     805480        GEO-MEAN sched_debu=
g.cpu#26.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1451847 =C4=85  1%      -9.6%    1311874 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1451847            -9.6%    1311874        GEO-MEAN sched_debu=
g.cpu#7.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     869997 =C4=85  1%     -10.0%     782794 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     869997           -10.0%     782794        GEO-MEAN sched_debu=
g.cpu#2.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14168 =C4=85  3%     -11.3%      12566 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14168           -11.3%      12565        GEO-MEAN sched_debu=
g.cpu#44.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     863764 =C4=85  1%      -9.4%     782356 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     863764            -9.4%     782356        GEO-MEAN sched_debu=
g.cpu#5.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >         20 =C4=85  2%      -9.7%         18 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >         20            -9.7%         18        GEO-MEAN sched_debu=
g.cpu#16.cpu_load[3]
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >         20 =C4=85  2%      -8.7%         18 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >         20            -8.7%         18        GEO-MEAN sched_debu=
g.cpu#16.cpu_load[4]
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >         20 =C4=85  3%      -8.7%         19 =C4=85  5%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >         20            -8.7%         18        GEO-MEAN sched_debu=
g.cfs_rq[5]:/.runnable_load_avg
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1471462 =C4=85  1%      -9.5%    1331414 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1471462            -9.5%    1331414        GEO-MEAN sched_debu=
g.cpu#8.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     877064 =C4=85  0%      -8.9%     799209 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     877064            -8.9%     799208        GEO-MEAN sched_debu=
g.cpu#27.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1081809 =C4=85  1%      -9.1%     983451 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1081809            -9.1%     983451        GEO-MEAN numa-numas=
tat.node1.local_node
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14225 =C4=85  2%      -7.6%      13149 =C4=85  3%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14225            -7.6%      13149        GEO-MEAN sched_debu=
g.cpu#36.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1084327 =C4=85  1%      -9.3%     983476 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1084327            -9.3%     983475        GEO-MEAN numa-numas=
tat.node1.numa_hit
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       2.29 =C4=85  1%     +11.9%       2.57 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       2.29           +11.9%       2.57        GEO-MEAN perf-profi=
le.cpu-cycles.__fget_light.__fdget_pos.sys_write.system_call_fastpath
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     847788 =C4=85  3%     -12.0%     746038 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     847788           -12.0%     746038        GEO-MEAN sched_debu=
g.cpu#40.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     865949 =C4=85  2%      -8.8%     789915 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     865949            -8.8%     789915        GEO-MEAN sched_debu=
g.cpu#33.ttwu_local
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14384 =C4=85  2%     -10.9%      12817 =C4=85  2%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14384           -10.9%      12816        GEO-MEAN sched_debu=
g.cpu#23.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1395020 =C4=85  0%     -10.0%    1255965 =C4=85  1%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1395020           -10.0%    1255965        GEO-MEAN sched_debu=
g.cpu#1.sched_goidle
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >      14326 =C4=85  3%      -7.6%      13231 =C4=85  4%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >      14326            -7.6%      13231        GEO-MEAN sched_debu=
g.cpu#9.curr->pid
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >       9.40 =C4=85  2%     +52.1%      14.30 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >       9.40           +52.1%      14.30        GEO-MEAN turbostat.=
RAM_W
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >     328603 =C4=85  4%     +28.0%     420733 =C4=85  6%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >     328603           +28.0%     420732        GEO-MEAN time.minor=
_page_faults
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >  2.029e+09 =C4=85  0%     -19.6%  1.632e+09 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >  2.029e+09           -19.6%  1.632e+09        GEO-MEAN time.volun=
tary_context_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >  5.504e+08 =C4=85  0%     -18.7%  4.477e+08 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >  5.504e+08           -18.7%  4.477e+08        GEO-MEAN time.invol=
untary_context_switches
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    4221419 =C4=85  0%     -18.2%    3451963 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    4221418           -18.2%    3451963        GEO-MEAN vmstat.sys=
tem.cs
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >        808 =C4=85  0%     -10.7%        721 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >        808           -10.7%        721        GEO-MEAN time.user_=
time
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >    1096082 =C4=85  1%     +11.3%    1220347 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >    1096082           +11.3%    1220347        GEO-MEAN vmstat.sys=
tem.in
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >        173 =C4=85  0%      -3.0%        168 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >        173            -3.0%        168        GEO-MEAN turbostat.=
Cor_W
> >> >> >
> >> >> > b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f
> >> >> > ----------------  --------------------------
> >> >> >        204 =C4=85  0%      -1.8%        200 =C4=85  0%  ivb42/hac=
kbench/performance-50%-threads-socket
> >> >> >        204            -1.8%        200        GEO-MEAN turbostat.=
Pkg_W
> >> >> >
> >> >> >
> >> >> > ivb42: Ivytown Ivy Bridge-EP
> >> >> > Memory: 64G
> >> >> >
> >> >> >
> >> >> > To reproduce:
> >> >> >
> >> >> >         apt-get install ruby ruby-oj
> >> >> >         git clone git://git.kernel.org/pub/scm/linux/kernel/git/w=
fg/lkp-tests.git
> >> >> >         cd lkp-tests
> >> >> >         bin/setup-local job.yaml # the job file attached in this =
email
> >> >> >         bin/run-local   job.yaml
> >> >> >
> >> >> >
> >> >> > Disclaimer:
> >> >> > Results have been estimated based on internal Intel analysis and =
are provided
> >> >> > for informational purposes only. Any difference in system hardwar=
e or software
> >> >> > design or configuration may affect actual performance.
> >> >> >
> >> >> > _______________________________________________
> >> >> > LKP mailing list
> >> >> > LKP(a)linux.intel.com
> >> >> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
> > the body of a message to majordomo(a)vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/

--===============3711817573009976440==--

