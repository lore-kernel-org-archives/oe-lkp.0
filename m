Content-Type: multipart/mixed; boundary="===============1180052199698688451=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 45208c9105: aim7.jobs-per-min -14.0% regression
Date: Thu, 09 Sep 2021 18:19:06 -0700
Message-ID: <CALvZod5_L55RLzwOXh_5C+v9rjVQ4_FEaEB2QYS5+6kuHpHpQg@mail.gmail.com>
In-Reply-To: <20210910010842.GA94434@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1180052199698688451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 9, 2021 at 6:08 PM Feng Tang <feng.tang@intel.com> wrote:
>
> On Thu, Sep 09, 2021 at 05:43:40PM -0700, Shakeel Butt wrote:
> > On Mon, Sep 6, 2021 at 8:30 PM Feng Tang <feng.tang@intel.com> wrote:
> > >
> > > Hi Shakeel,
> > >
> > > On Sun, Sep 05, 2021 at 03:15:46PM -0700, Shakeel Butt wrote:
> > > > On Sun, Sep 5, 2021 at 5:27 AM kernel test robot <oliver.sang@int=
el.com> wrote:
> > > [...]
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/=
test/testcase/ucode:
> > > > >   gcc-9/performance/1BRD_48G/xfs/x86_64-rhel-8.3/3000/debian-10.4=
-x86_64-20200603.cgz/lkp-icl-2sp2/disk_rr/aim7/0xd000280
> > > > >
> > > > > commit:
> > > > >   3c28c7680e ("memcg: switch lruvec stats to rstat")
> > > > >   45208c9105 ("memcg: infrastructure to flush memcg stats")
> > > >
> > > > I am looking into this. I was hoping we have resolution for [1] as
> > > > these patches touch similar data structures.
> > > >
> > > > [1] https://lore.kernel.org/all/20210811031734.GA5193(a)xsang-OptiP=
lex-9020/T/#u
> > >
> > > I tried 2 debug methods for that 36.4% vm-scalability regression:
> > >
> > > 1. Disable the HW cache prefetcher, no effect on this case
> > > 2. relayout and add padding to 'struct cgroup_subsys_state', reduce
> > >    the regression to 3.1%
> > >
> >
> > Thanks Feng but it seems like the issue for this commit is different.
> > Rearranging the layout didn't help. Actually the cause of slowdown is
> > the call to queue_work() inside __mod_memcg_lruvec_state().
> >
> > At the moment, queue_work() is called after 32 updates. I changed it
> > to 128 and the slowdown of will-it-scale:page_fault[1|2|3] halved
> > (from around 10% to 5%). I am unable to run reaim or
> > will-it-scale:fallocate2 as I was getting weird errors.
> >
> > Feng, is it possible for you to run these benchmarks with the change
> > (basically changing MEMCG_CHARGE_BATCH to 128 in the if condition
> > before queue_work() inside __mod_memcg_lruvec_state())?
>
> When I checked this, I tried different changes, including this batch
> number change :), but it didn't recover the regression (the regression
> is slightly reduced to about 12%)
>
> Please check if my patch is what you want to test:

Yes, the following patch is what I want to test.

>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 4d8c9af..a50a69a 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -682,7 +682,8 @@ void __mod_memcg_lruvec_state(struct lruvec *lruvec, =
enum node_stat_item idx,
>
>         /* Update lruvec */
>         __this_cpu_add(pn->lruvec_stats_percpu->state[idx], val);
> -       if (!(__this_cpu_inc_return(stats_flush_threshold) % MEMCG_CHARGE=
_BATCH))
> +//     if (!(__this_cpu_inc_return(stats_flush_threshold) % MEMCG_CHARGE=
_BATCH))
> +       if (!(__this_cpu_inc_return(stats_flush_threshold) % 128))
>                 queue_work(system_unbound_wq, &stats_flush_work);
>  }
>

Another change we can try is to remove this specific queue_work()
altogether because this is the only significant change for the
workload. That will give us the base performance number. If that also
has regression then there are more issues to debug. Thanks a lot for
your help.
--===============1180052199698688451==--

