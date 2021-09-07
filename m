Content-Type: multipart/mixed; boundary="===============3877444751724684170=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 45208c9105: aim7.jobs-per-min -14.0% regression
Date: Tue, 07 Sep 2021 11:30:00 +0800
Message-ID: <20210907033000.GA88160@shbuild999.sh.intel.com>
In-Reply-To: <CALvZod77aP7qdwc5FkaZJf4FikeD0NwSuoJB4N94Uf0yqZFQpQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3877444751724684170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Shakeel, =


On Sun, Sep 05, 2021 at 03:15:46PM -0700, Shakeel Butt wrote:
> On Sun, Sep 5, 2021 at 5:27 AM kernel test robot <oliver.sang@intel.com=
> wrote:
[...]
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/t=
estcase/ucode:
> >   gcc-9/performance/1BRD_48G/xfs/x86_64-rhel-8.3/3000/debian-10.4-x86_6=
4-20200603.cgz/lkp-icl-2sp2/disk_rr/aim7/0xd000280
> >
> > commit:
> >   3c28c7680e ("memcg: switch lruvec stats to rstat")
> >   45208c9105 ("memcg: infrastructure to flush memcg stats")
> =

> I am looking into this. I was hoping we have resolution for [1] as
> these patches touch similar data structures.
> =

> [1] https://lore.kernel.org/all/20210811031734.GA5193(a)xsang-OptiPlex-90=
20/T/#u

I tried 2 debug methods for that 36.4% vm-scalability regression:

1. Disable the HW cache prefetcher, no effect on this case =

2. relayout and add padding to 'struct cgroup_subsys_state', reduce
   the regression to 3.1%

Thanks,
Feng

--===============3877444751724684170==--

