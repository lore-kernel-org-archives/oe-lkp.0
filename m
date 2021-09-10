Content-Type: multipart/mixed; boundary="===============6001087145136491947=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 45208c9105: aim7.jobs-per-min -14.0% regression
Date: Thu, 09 Sep 2021 17:43:40 -0700
Message-ID: <CALvZod6M_sySPM1KaWzb=tkLxXJksVDrSheckXaiBpMC3cNeqw@mail.gmail.com>
In-Reply-To: <20210907033000.GA88160@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6001087145136491947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 6, 2021 at 8:30 PM Feng Tang <feng.tang@intel.com> wrote:
>
> Hi Shakeel,
>
> On Sun, Sep 05, 2021 at 03:15:46PM -0700, Shakeel Butt wrote:
> > On Sun, Sep 5, 2021 at 5:27 AM kernel test robot <oliver.sang@intel.c=
om> wrote:
> [...]
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test=
/testcase/ucode:
> > >   gcc-9/performance/1BRD_48G/xfs/x86_64-rhel-8.3/3000/debian-10.4-x86=
_64-20200603.cgz/lkp-icl-2sp2/disk_rr/aim7/0xd000280
> > >
> > > commit:
> > >   3c28c7680e ("memcg: switch lruvec stats to rstat")
> > >   45208c9105 ("memcg: infrastructure to flush memcg stats")
> >
> > I am looking into this. I was hoping we have resolution for [1] as
> > these patches touch similar data structures.
> >
> > [1] https://lore.kernel.org/all/20210811031734.GA5193(a)xsang-OptiPlex-=
9020/T/#u
>
> I tried 2 debug methods for that 36.4% vm-scalability regression:
>
> 1. Disable the HW cache prefetcher, no effect on this case
> 2. relayout and add padding to 'struct cgroup_subsys_state', reduce
>    the regression to 3.1%
>

Thanks Feng but it seems like the issue for this commit is different.
Rearranging the layout didn't help. Actually the cause of slowdown is
the call to queue_work() inside __mod_memcg_lruvec_state().

At the moment, queue_work() is called after 32 updates. I changed it
to 128 and the slowdown of will-it-scale:page_fault[1|2|3] halved
(from around 10% to 5%). I am unable to run reaim or
will-it-scale:fallocate2 as I was getting weird errors.

Feng, is it possible for you to run these benchmarks with the change
(basically changing MEMCG_CHARGE_BATCH to 128 in the if condition
before queue_work() inside __mod_memcg_lruvec_state())?

For the formal patch/fix, I will write down a better explanation on
what should be the batch size.

thanks,
Shakeel
--===============6001087145136491947==--

