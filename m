Content-Type: multipart/mixed; boundary="===============6991472786913313446=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [sched, rcu] b84c4e08143: +3.1% will-it-scale.per_thread_ops
Date: Mon, 21 Apr 2014 18:50:48 -0700
Message-ID: <20140422015048.GZ4496@linux.vnet.ibm.com>
In-Reply-To: <20140419081146.GA29068@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============6991472786913313446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2014 at 04:11:46PM +0800, Fengguang Wu wrote:
> On Thu, Apr 17, 2014 at 06:55:03AM -0700, Paul E. McKenney wrote:
> > On Thu, Apr 17, 2014 at 12:03:53PM +0800, Fengguang Wu wrote:
> > > Hi Paul,
> > > =

> > > FYI, this improves will-it-scale/open1 throughput.
> > =

> > Cool!  Not a planned benefit, but I will take it.  ;-)
> > =

> > > git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git d=
ev.2014.04.14a
> > > commit b84c4e08143c98dad4b4d139f08db0b98b0d3ec4 ("sched,rcu: Make con=
d_resched() report RCU quiescent states")
> > =

> > But how should I read the data below?  I see lots of positive percentag=
es
> > and lots of negative percentages for the delta, and all near zero for
> > standard deviation.  Is the overall improvement an average of these or
> > some such?  What is being measured?
> =

> There are a lot of things being measured, which are shown after each
> "TOTAL".  For example, to get an overview of the report:

OK, let me see if I understand this...

> grep "TOTAL" this_email
> =

>      563496 ~ 0%      +3.1%     581059 ~ 0%  TOTAL will-it-scale.per_thre=
ad_ops
>      756894 ~ 0%      +2.8%     778452 ~ 0%  TOTAL will-it-scale.per_proc=
ess_ops

These two look like improvements, albeit small ones.

>        0.57 ~ 0%      -2.7%       0.55 ~ 0%  TOTAL will-it-scale.scalabil=
ity

This one looks like a degradation, again small.

>      346764 ~ 2%     -74.0%      90164 ~ 1%  TOTAL slabinfo.kmalloc-256.a=
ctive_objs
>       10837 ~ 2%     -73.9%       2824 ~ 1%  TOTAL slabinfo.kmalloc-256.a=
ctive_slabs
>       10837 ~ 2%     -73.9%       2824 ~ 1%  TOTAL slabinfo.kmalloc-256.n=
um_slabs
>      346821 ~ 2%     -73.9%      90393 ~ 1%  TOTAL slabinfo.kmalloc-256.n=
um_objs
>      105961 ~ 1%     -63.0%      39153 ~ 1%  TOTAL meminfo.SUnreclaim
>       26432 ~ 1%     -62.9%       9814 ~ 1%  TOTAL proc-vmstat.nr_slab_un=
reclaimable

The above all look great -- about the same amount of work done with a
lot less work on the part of the Linux kernel's memory-management system.

>       87318 ~ 0%    +130.0%     200809 ~ 0%  TOTAL softirqs.RCU

This one is not so good, as RCU is consuming more time an energy for
roughly the same amount of work.

>      140354 ~ 1%     -47.6%      73490 ~ 0%  TOTAL meminfo.Slab
>       77391 ~ 1%     -46.7%      41235 ~ 2%  TOTAL cpuidle.C6-NHM.usage
>       38368 ~ 2%     -37.6%      23954 ~ 2%  TOTAL softirqs.SCHED
>        1.24 ~ 4%     -35.4%       0.80 ~ 3%  TOTAL perf-profile.cpu-cycle=
s.do_notify_resume.int_signal.close

These look like improvements, again less work for a given level of
throughput.

>        1.43 ~ 4%     +41.9%       2.03 ~ 4%  TOTAL perf-profile.cpu-cycle=
s.rcu_process_callbacks.__do_softirq.irq_exit.smp_apic_timer_in

This is another aspect of RCU working harder.  One good thing is that
there is less work per invocation.  This could be consistent with shorter
RCU grace-period latencies, which would generally be a good thing.
(And yes, I still owe you RCU grace-period-latency measurements!)

> rupt.apic_timer_interrupt
>        1.27 ~ 3%     -30.0%       0.89 ~ 6%  TOTAL perf-profile.cpu-cycle=
s.setup_object.isra.46.new_slab.__slab_alloc.kmem_cache_alloc.g

Less memory-allocation work, goodness.

> empty_filp
>        1.54 ~ 7%     +35.6%       2.09 ~ 8%  TOTAL perf-profile.cpu-cycle=
s.kmem_cache_alloc.getname_flags.getname.do_sys_open.sys_open

But more of whatever this turns out to be.  More allocations from within
the open() system call?

>        4.21 ~ 2%     -29.1%       2.98 ~ 3%  TOTAL perf-profile.cpu-cycle=
s.link_path_walk.path_openat.do_filp_open.do_sys_open.sys_open
>        1.37 ~ 4%     -23.1%       1.05 ~ 7%  TOTAL perf-profile.cpu-cycle=
s.__d_lookup_rcu.lookup_fast.link_path_walk.path_openat.do_filp
> en
>        0.88 ~17%     +29.1%       1.14 ~ 9%  TOTAL perf-profile.cpu-cycle=
s.path_init.path_openat.do_filp_open.do_sys_open.sys_open

Mixed results on other aspects of the open() system call?

>        0.67 ~16%     +33.6%       0.90 ~10%  TOTAL perf-profile.cpu-cycle=
s.restore_sigcontext.sys_rt_sigreturn.stub_rt_sigreturn.raise

I confess to being lost on this one.

>        3.19 ~ 1%     +17.4%       3.74 ~ 5%  TOTAL perf-profile.cpu-cycle=
s.file_free_rcu.rcu_process_callbacks.__do_softirq.irq_exit.smp

More RCU softirqs means more softirq exit overhead, presumably.

> ic_timer_interrupt

???

>        4329 ~ 7%     +15.2%       4986 ~ 5%  TOTAL slabinfo.vm_area_struc=
t.active_objs

But increased number of active objects would seem to hint at longer
RCU grace-period latencies, in contradiction with the previous hints
in the other direction.

>        2536 ~ 1%     -75.8%        614 ~ 9%  TOTAL time.involuntary_conte=
xt_switches
>       32593 ~ 1%     -62.1%      12349 ~ 2%  TOTAL interrupts.0:IO-APIC-e=
dge.timer

These look like improvements.

>        6934 ~ 9%     +86.2%      12908 ~ 7%  TOTAL interrupts.RES

Looks like a degradation.  Caused by the increase in RCU softirqs?

>         490 ~ 1%     -37.3%        307 ~ 1%  TOTAL vmstat.system.cs
>        1639 ~ 0%      -8.8%       1495 ~ 0%  TOTAL vmstat.system.in
>      819681 ~ 0%      -3.7%     789527 ~ 0%  TOTAL interrupts.LOC

These all look like improvements.

> > > Legend:
> > > 	~XX%    - stddev percent
> > > 	[+-]XX% - change percent
> > > =

> > > =

> > >                           time.involuntary_context_switches
> > > =

> > >    3500 ++-----------------------------------------------------------=
-------+
> > >         |             .*..                                           =
       |
> > >    3000 ++         .*.    *..*..  .*..*.. .*..                       =
       |
> > >         *..*..*..*.             *.       *                           =
       |
> > >         |                                     *..*..     .*..     .*.=
.*     |
> > >    2500 ++                                          *..*.    *..*.   =
       |
> > >         |                                                            =
       |
> > >    2000 ++                                                           =
       |
> > >         |                                                            =
       |
> > >    1500 ++                                                           =
       |
> > >         |                                                            =
       |
> > >         |                                                            =
       |
> > >    1000 ++                                                           =
       |
> > >         |     O  O  O              O  O                   O  O     O =
       O
> > >     500 O+-O-----------O--O--O--O--------O-O--O--O--O--O--------O----=
-O--O--+
> > > =

> > > =

> > > 	[*] bisect-good sample
> > > 	[O] bisect-bad  sample
> > =

> > So the good case increases involuntary context switches, but helps some=
thing
> > else?  Or does the benefit stem from increased involuntary context swit=
ches
> > and thus less time spinning or some such?
> =

> In bisect POV, branch BASE is good and HEAD is bad. Which has nothing
> to do with the improvement/regression in performance POV.
> =

> Here the HEAD(bisect bad) commit has less involuntary_context_switches
> which indicates an improvement over BASE.  It does look like close to
> the root cause of improved will-it-scale throughput.

Ah, that explains it!

Would it make sense to add "(HEAD)" to the legend for "[O]"?

							Thanx, Paul


--===============6991472786913313446==--

