Content-Type: multipart/mixed; boundary="===============7625912528477185401=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 45208c9105: aim7.jobs-per-min -14.0% regression
Date: Fri, 10 Sep 2021 10:34:15 +0800
Message-ID: <20210910023415.GB94434@shbuild999.sh.intel.com>
In-Reply-To: <CALvZod5_L55RLzwOXh_5C+v9rjVQ4_FEaEB2QYS5+6kuHpHpQg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7625912528477185401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 09, 2021 at 06:19:06PM -0700, Shakeel Butt wrote:
[...]
> > > > > I am looking into this. I was hoping we have resolution for [1] as
> > > > > these patches touch similar data structures.
> > > > >
> > > > > [1] https://lore.kernel.org/all/20210811031734.GA5193(a)xsang-Opt=
iPlex-9020/T/#u
> > > >
> > > > I tried 2 debug methods for that 36.4% vm-scalability regression:
> > > >
> > > > 1. Disable the HW cache prefetcher, no effect on this case
> > > > 2. relayout and add padding to 'struct cgroup_subsys_state', reduce
> > > >    the regression to 3.1%
> > > >
> > >
> > > Thanks Feng but it seems like the issue for this commit is different.
> > > Rearranging the layout didn't help. Actually the cause of slowdown is
> > > the call to queue_work() inside __mod_memcg_lruvec_state().
> > >
> > > At the moment, queue_work() is called after 32 updates. I changed it
> > > to 128 and the slowdown of will-it-scale:page_fault[1|2|3] halved
> > > (from around 10% to 5%). I am unable to run reaim or
> > > will-it-scale:fallocate2 as I was getting weird errors.
> > >
> > > Feng, is it possible for you to run these benchmarks with the change
> > > (basically changing MEMCG_CHARGE_BATCH to 128 in the if condition
> > > before queue_work() inside __mod_memcg_lruvec_state())?
> >
> > When I checked this, I tried different changes, including this batch
> > number change :), but it didn't recover the regression (the regression
> > is slightly reduced to about 12%)
[...]
> =

> Another change we can try is to remove this specific queue_work()
> altogether because this is the only significant change for the
> workload. That will give us the base performance number. If that also
> has regression then there are more issues to debug. Thanks a lot for
> your help.

I just tested with patch removing the queue_work() in __mod_memcg_lruvec_st=
ate(),
and the regression is gone.

Also to avoid some duplication of debugging, here are some other tries
I did:
* add padding in 'struct lruvec' for 'lru_lock', no effect
* add padding in 'mem_cgroup_per_node' between 'lruvec_stats_percpu' and
  'lruvec_stats', no effect.

Thanks,
Feng

--===============7625912528477185401==--

