Content-Type: multipart/mixed; boundary="===============8549208471597013664=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 45208c9105: aim7.jobs-per-min -14.0% regression
Date: Thu, 09 Sep 2021 21:17:54 -0700
Message-ID: <CALvZod79NnB=CG_sr5ZYLStageb-9W8c5uss22=p2tGJNsFmKQ@mail.gmail.com>
In-Reply-To: <20210910023415.GB94434@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8549208471597013664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 9, 2021 at 7:34 PM Feng Tang <feng.tang@intel.com> wrote:
>
> On Thu, Sep 09, 2021 at 06:19:06PM -0700, Shakeel Butt wrote:
> [...]
> > > > > > I am looking into this. I was hoping we have resolution for [1]=
 as
> > > > > > these patches touch similar data structures.
> > > > > >
> > > > > > [1] https://lore.kernel.org/all/20210811031734.GA5193(a)xsang-O=
ptiPlex-9020/T/#u
> > > > >
> > > > > I tried 2 debug methods for that 36.4% vm-scalability regression:
> > > > >
> > > > > 1. Disable the HW cache prefetcher, no effect on this case
> > > > > 2. relayout and add padding to 'struct cgroup_subsys_state', redu=
ce
> > > > >    the regression to 3.1%
> > > > >
> > > >
> > > > Thanks Feng but it seems like the issue for this commit is differen=
t.
> > > > Rearranging the layout didn't help. Actually the cause of slowdown =
is
> > > > the call to queue_work() inside __mod_memcg_lruvec_state().
> > > >
> > > > At the moment, queue_work() is called after 32 updates. I changed it
> > > > to 128 and the slowdown of will-it-scale:page_fault[1|2|3] halved
> > > > (from around 10% to 5%). I am unable to run reaim or
> > > > will-it-scale:fallocate2 as I was getting weird errors.
> > > >
> > > > Feng, is it possible for you to run these benchmarks with the change
> > > > (basically changing MEMCG_CHARGE_BATCH to 128 in the if condition
> > > > before queue_work() inside __mod_memcg_lruvec_state())?
> > >
> > > When I checked this, I tried different changes, including this batch
> > > number change :), but it didn't recover the regression (the regression
> > > is slightly reduced to about 12%)
> [...]
> >
> > Another change we can try is to remove this specific queue_work()
> > altogether because this is the only significant change for the
> > workload. That will give us the base performance number. If that also
> > has regression then there are more issues to debug. Thanks a lot for
> > your help.
>
> I just tested with patch removing the queue_work() in __mod_memcg_lruvec_=
state(),
> and the regression is gone.

Thanks again for confirming this. I will follow this lead and see how
to improve this.
--===============8549208471597013664==--

