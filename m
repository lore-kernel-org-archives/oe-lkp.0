Content-Type: multipart/mixed; boundary="===============2226387633539598391=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [sched, rcu] b84c4e08143: +3.1% will-it-scale.per_thread_ops
Date: Thu, 17 Apr 2014 06:55:03 -0700
Message-ID: <20140417135503.GK4496@linux.vnet.ibm.com>
In-Reply-To: <20140417040353.GF8702@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2226387633539598391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2014 at 12:03:53PM +0800, Fengguang Wu wrote:
> Hi Paul,
> =

> FYI, this improves will-it-scale/open1 throughput.

Cool!  Not a planned benefit, but I will take it.  ;-)

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2=
014.04.14a
> commit b84c4e08143c98dad4b4d139f08db0b98b0d3ec4 ("sched,rcu: Make cond_re=
sched() report RCU quiescent states")

But how should I read the data below?  I see lots of positive percentages
and lots of negative percentages for the delta, and all near zero for
standard deviation.  Is the overall improvement an average of these or
some such?  What is being measured?

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>     563496 ~ 0%      +3.1%     581059 ~ 0%  nhm4/micro/will-it-scale/open1
>     563496 ~ 0%      +3.1%     581059 ~ 0%  TOTAL will-it-scale.per_threa=
d_ops
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>     756894 ~ 0%      +2.8%     778452 ~ 0%  nhm4/micro/will-it-scale/open1
>     756894 ~ 0%      +2.8%     778452 ~ 0%  TOTAL will-it-scale.per_proce=
ss_ops
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       0.57 ~ 0%      -2.7%       0.55 ~ 0%  nhm4/micro/will-it-scale/open1
>       0.57 ~ 0%      -2.7%       0.55 ~ 0%  TOTAL will-it-scale.scalabili=
ty
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>     346764 ~ 2%     -74.0%      90164 ~ 1%  nhm4/micro/will-it-scale/open1
>     346764 ~ 2%     -74.0%      90164 ~ 1%  TOTAL slabinfo.kmalloc-256.ac=
tive_objs
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>      10837 ~ 2%     -73.9%       2824 ~ 1%  nhm4/micro/will-it-scale/open1
>      10837 ~ 2%     -73.9%       2824 ~ 1%  TOTAL slabinfo.kmalloc-256.ac=
tive_slabs
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>      10837 ~ 2%     -73.9%       2824 ~ 1%  nhm4/micro/will-it-scale/open1
>      10837 ~ 2%     -73.9%       2824 ~ 1%  TOTAL slabinfo.kmalloc-256.nu=
m_slabs
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>     346821 ~ 2%     -73.9%      90393 ~ 1%  nhm4/micro/will-it-scale/open1
>     346821 ~ 2%     -73.9%      90393 ~ 1%  TOTAL slabinfo.kmalloc-256.nu=
m_objs
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>     105961 ~ 1%     -63.0%      39153 ~ 1%  nhm4/micro/will-it-scale/open1
>     105961 ~ 1%     -63.0%      39153 ~ 1%  TOTAL meminfo.SUnreclaim
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>      26432 ~ 1%     -62.9%       9814 ~ 1%  nhm4/micro/will-it-scale/open1
>      26432 ~ 1%     -62.9%       9814 ~ 1%  TOTAL proc-vmstat.nr_slab_unr=
eclaimable
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>      50298 ~ 0%    +194.3%     148011 ~ 0%  nhm4/micro/will-it-scale/open1
>      37020 ~ 0%     +42.6%      52798 ~ 1%  nhm4/micro/will-it-scale/sign=
al1
>      87318 ~ 0%    +130.0%     200809 ~ 0%  TOTAL softirqs.RCU
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>     140354 ~ 1%     -47.6%      73490 ~ 0%  nhm4/micro/will-it-scale/open1
>     140354 ~ 1%     -47.6%      73490 ~ 0%  TOTAL meminfo.Slab
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>      77391 ~ 1%     -46.7%      41235 ~ 2%  nhm4/micro/will-it-scale/sign=
al1
>      77391 ~ 1%     -46.7%      41235 ~ 2%  TOTAL cpuidle.C6-NHM.usage
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>      19871 ~ 2%     -37.6%      12397 ~ 2%  nhm4/micro/will-it-scale/open1
>      18497 ~ 1%     -37.5%      11556 ~ 1%  nhm4/micro/will-it-scale/sign=
al1
>      38368 ~ 2%     -37.6%      23954 ~ 2%  TOTAL softirqs.SCHED
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       1.24 ~ 4%     -35.4%       0.80 ~ 3%  nhm4/micro/will-it-scale/open1
>       1.24 ~ 4%     -35.4%       0.80 ~ 3%  TOTAL perf-profile.cpu-cycles=
.do_notify_resume.int_signal.close
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       1.43 ~ 4%     +41.9%       2.03 ~ 4%  nhm4/micro/will-it-scale/open1
>       1.43 ~ 4%     +41.9%       2.03 ~ 4%  TOTAL perf-profile.cpu-cycles=
.rcu_process_callbacks.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_=
timer_interrupt
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       1.27 ~ 3%     -30.0%       0.89 ~ 6%  nhm4/micro/will-it-scale/open1
>       1.27 ~ 3%     -30.0%       0.89 ~ 6%  TOTAL perf-profile.cpu-cycles=
.setup_object.isra.46.new_slab.__slab_alloc.kmem_cache_alloc.get_empty_filp
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       1.54 ~ 7%     +35.6%       2.09 ~ 8%  nhm4/micro/will-it-scale/open1
>       1.54 ~ 7%     +35.6%       2.09 ~ 8%  TOTAL perf-profile.cpu-cycles=
.kmem_cache_alloc.getname_flags.getname.do_sys_open.sys_open
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       4.21 ~ 2%     -29.1%       2.98 ~ 3%  nhm4/micro/will-it-scale/open1
>       4.21 ~ 2%     -29.1%       2.98 ~ 3%  TOTAL perf-profile.cpu-cycles=
.link_path_walk.path_openat.do_filp_open.do_sys_open.sys_open
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       1.37 ~ 4%     -23.1%       1.05 ~ 7%  nhm4/micro/will-it-scale/open1
>       1.37 ~ 4%     -23.1%       1.05 ~ 7%  TOTAL perf-profile.cpu-cycles=
.__d_lookup_rcu.lookup_fast.link_path_walk.path_openat.do_filp_open
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       0.88 ~17%     +29.1%       1.14 ~ 9%  nhm4/micro/will-it-scale/open1
>       0.88 ~17%     +29.1%       1.14 ~ 9%  TOTAL perf-profile.cpu-cycles=
.path_init.path_openat.do_filp_open.do_sys_open.sys_open
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       0.67 ~16%     +33.6%       0.90 ~10%  nhm4/micro/will-it-scale/sign=
al1
>       0.67 ~16%     +33.6%       0.90 ~10%  TOTAL perf-profile.cpu-cycles=
.restore_sigcontext.sys_rt_sigreturn.stub_rt_sigreturn.raise
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       3.19 ~ 1%     +17.4%       3.74 ~ 5%  nhm4/micro/will-it-scale/open1
>       3.19 ~ 1%     +17.4%       3.74 ~ 5%  TOTAL perf-profile.cpu-cycles=
.file_free_rcu.rcu_process_callbacks.__do_softirq.irq_exit.smp_apic_timer_i=
nterrupt
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       4329 ~ 7%     +15.2%       4986 ~ 5%  nhm4/micro/will-it-scale/open1
>       4329 ~ 7%     +15.2%       4986 ~ 5%  TOTAL slabinfo.vm_area_struct=
.active_objs
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       2536 ~ 1%     -75.8%        614 ~ 9%  nhm4/micro/will-it-scale/open1
>       2536 ~ 1%     -75.8%        614 ~ 9%  TOTAL time.involuntary_contex=
t_switches
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>      32593 ~ 1%     -62.1%      12349 ~ 2%  nhm4/micro/will-it-scale/sign=
al1
>      32593 ~ 1%     -62.1%      12349 ~ 2%  TOTAL interrupts.0:IO-APIC-ed=
ge.timer
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       4374 ~14%    +124.7%       9830 ~ 8%  nhm4/micro/will-it-scale/open1
>       2559 ~ 2%     +20.3%       3078 ~ 3%  nhm4/micro/will-it-scale/sign=
al1
>       6934 ~ 9%     +86.2%      12908 ~ 7%  TOTAL interrupts.RES
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>        490 ~ 1%     -37.3%        307 ~ 1%  nhm4/micro/will-it-scale/sign=
al1
>        490 ~ 1%     -37.3%        307 ~ 1%  TOTAL vmstat.system.cs
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>       1639 ~ 0%      -8.8%       1495 ~ 0%  nhm4/micro/will-it-scale/sign=
al1
>       1639 ~ 0%      -8.8%       1495 ~ 0%  TOTAL vmstat.system.in
> =

> ad86a04266f9b49  b84c4e08143c98dad4b4d139f  =

> ---------------  -------------------------  =

>     419046 ~ 0%      -1.5%     412661 ~ 0%  nhm4/micro/will-it-scale/open1
>     400635 ~ 0%      -5.9%     376866 ~ 0%  nhm4/micro/will-it-scale/sign=
al1
>     819681 ~ 0%      -3.7%     789527 ~ 0%  TOTAL interrupts.LOC
> =

> =

> Legend:
> 	~XX%    - stddev percent
> 	[+-]XX% - change percent
> =

> =

>                           time.involuntary_context_switches
> =

>    3500 ++---------------------------------------------------------------=
---+
>         |             .*..                                               =
   |
>    3000 ++         .*.    *..*..  .*..*.. .*..                           =
   |
>         *..*..*..*.             *.       *                               =
   |
>         |                                     *..*..     .*..     .*..*  =
   |
>    2500 ++                                          *..*.    *..*.       =
   |
>         |                                                                =
   |
>    2000 ++                                                               =
   |
>         |                                                                =
   |
>    1500 ++                                                               =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>    1000 ++                                                               =
   |
>         |     O  O  O              O  O                   O  O     O     =
   O
>     500 O+-O-----------O--O--O--O--------O-O--O--O--O--O--------O-----O--=
O--+
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample

So the good case increases involuntary context switches, but helps something
else?  Or does the benefit stem from increased involuntary context switches
and thus less time spinning or some such?

							Thanx, Paul

> Thanks,
> Fengguang
> =



--===============2226387633539598391==--

