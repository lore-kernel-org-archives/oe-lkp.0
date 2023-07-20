Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFDC19A0A
	for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 13:00:08 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-460eb67244eso342015e0c.1
        for <oe-lkp@lists.linux.dev>; Thu, 20 Jul 2023 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689858007; x=1690462807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLa6UJOWW/B5cmDVeDgwxqaFOtsq36f9MM8GBuRmH28=;
        b=XzNSdn3GAKVQHwg4qp95v/8PAAO4Q0KPvYIiFMlG2zBx7/38j8xuWwW1AQGpyik7wP
         iAKQrOMb06tvxQfN7GVkAMwzOqxiHHE7rKPneJ+hgRRSq5sTBECqf7Zlx+P+GLrxndzf
         2uYEbJMwWfbQApq8ihsRQjcLAYiWRplFEfmR+vVFZ7DVGPg2w5AtoBZSG5ZOwPP+iQTo
         BqrpLr/pqcAj2vaXjZ0COwstZ5LwvtsjdK44XWG18TDuMItSLkygVNHwJdFhenmkXoY6
         h2n5R2rRICfxYpyPxKaPgbIhhNXaatz+MnR9s038yp6FE2EkBQ9cwP3jvGzMqXVJn+/g
         IhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689858007; x=1690462807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLa6UJOWW/B5cmDVeDgwxqaFOtsq36f9MM8GBuRmH28=;
        b=L3uXl07suaSKm+1Qq+W4iSxqYuZ2aorFTGsB/EgPm2yy33V7oHAalUoB5dIgF1ZQKR
         fpOGYoq64cWvBcrnwsg8HS7QalNg4SHo1bz/dJcUrri3YusO0KiDg8gp1E3dib246LBO
         quVqulZrK52nCP0Xp5aFDDLPK/ufj2xiclAAJD/M79wtJgOAYvCgMjpTl+SDWxxNuaK1
         OcuL3wt+PgLIdQHo8erQlo530CzkbVP6CM4y0AwKRbbsn2gSp9KdidFRqenrCsEAWUi2
         zUrRj61tcbLl5PO/uiy/gsS1ISr557PjBknjnidOv1458eYCYnmPnzkmStUF0D8NTZsJ
         Wozg==
X-Gm-Message-State: ABy/qLa7Cg5VEiA3F+6ZJ3BpFaevo3r7OGDiuRu3/5VadJGoU35w/n10
	8a4fSoJiCa7bEOuSu2JC2vV6ZnVf46Tz/1TI9iM=
X-Google-Smtp-Source: APBJJlGegfkJhYJtei9Ttbs2Tj2ASlCADIjVxkHC5Plh2H8vE5SqfWSAuZJNLfJyu8jNbR0IqHELw3CtYB4oiwA1000=
X-Received: by 2002:a1f:3d44:0:b0:465:fa30:d633 with SMTP id
 k65-20020a1f3d44000000b00465fa30d633mr3905764vka.0.1689858007282; Thu, 20 Jul
 2023 06:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230628095740.589893-1-jaypatel@linux.ibm.com>
 <202307172140.3b34825a-oliver.sang@intel.com> <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
 <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020>
In-Reply-To: <ZLijZ8QRc0FRgJIF@xsang-OptiPlex-9020>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Thu, 20 Jul 2023 21:59:56 +0900
Message-ID: <CAB=+i9QmF2C7QsZBEW0HMT-PGcEf3MeCukVaq0_O1HkGy7n93w@mail.gmail.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jay Patel <jaypatel@linux.ibm.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com, cl@linux.com, penberg@kernel.org, rientjes@google.com, 
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	aneesh.kumar@linux.ibm.com, tsahu@linux.ibm.com, piyushs@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 12:01=E2=80=AFPM Oliver Sang <oliver.sang@intel.com=
> wrote:
>
> hi, Hyeonggon Yoo,
>
> On Tue, Jul 18, 2023 at 03:43:16PM +0900, Hyeonggon Yoo wrote:
> > On Mon, Jul 17, 2023 at 10:41=E2=80=AFPM kernel test robot
> > <oliver.sang@intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed a -12.5% regression of hackbench.throughput=
 on:
> > >
> > >
> > > commit: a0fd217e6d6fbd23e91f8796787b621e7d576088 ("[PATCH] [RFC PATCH=
 v2]mm/slub: Optimize slub memory usage")
> > > url: https://github.com/intel-lab-lkp/linux/commits/Jay-Patel/mm-slub=
-Optimize-slub-memory-usage/20230628-180050
> > > base: git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git for-=
next
> > > patch link: https://lore.kernel.org/all/20230628095740.589893-1-jaypa=
tel@linux.ibm.com/
> > > patch subject: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory us=
age
> > >
> > > testcase: hackbench
> > > test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ =
2.00GHz (Ice Lake) with 256G memory
> > > parameters:
> > >
> > >         nr_threads: 100%
> > >         iterations: 4
> > >         mode: process
> > >         ipc: socket
> > >         cpufreq_governor: performance
> > >
> > >
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202307172140.3b34825a-oliver=
.sang@intel.com
> > >
> > >
> > > Details are as below:
> > > ---------------------------------------------------------------------=
----------------------------->
> > >
> > >
> > > To reproduce:
> > >
> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         sudo bin/lkp install job.yaml           # job file is attache=
d in this email
> > >         bin/lkp split-job --compatible job.yaml # generate the yaml f=
ile for lkp run
> > >         sudo bin/lkp run generated-yaml-file
> > >
> > >         # if come across any failure that blocks the test,
> > >         # please remove ~/.lkp and /lkp dir to run from a clean state=
.
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/root=
fs/tbox_group/testcase:
> > >   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.=
1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench
> > >
> > > commit:
> > >   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/for-6.5/s=
lab_no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next")
> > >   a0fd217e6d ("mm/slub: Optimize slub memory usage")
> > >
> > > 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> > > ---------------- ---------------------------
> > >          %stddev     %change         %stddev
> > >              \          |                \
> > >     222503 =C4=85 86%    +108.7%     464342 =C4=85 58%  numa-meminfo.=
node1.Active
> > >     222459 =C4=85 86%    +108.7%     464294 =C4=85 58%  numa-meminfo.=
node1.Active(anon)
> > >      55573 =C4=85 85%    +108.0%     115619 =C4=85 58%  numa-vmstat.n=
ode1.nr_active_anon
> > >      55573 =C4=85 85%    +108.0%     115618 =C4=85 58%  numa-vmstat.n=
ode1.nr_zone_active_anon
> >
> > I'm quite baffled while reading this.
> > How did changing slab order calculation double the number of active ano=
n pages?
> > I doubt two experiments were performed on the same settings.
>
> let me introduce our test process.
>
> we make sure the tests upon commit and its parent have exact same environ=
ment
> except the kernel difference, and we also make sure the config to build t=
he
> commit and its parent are identical.
>
> we run tests for one commit at least 6 times to make sure the data is sta=
ble.
>
> such like for this case, we rebuild the commit and its parent's kernel, t=
he
> config is attached FYI.

Hello Oliver,

Thank you for confirming the testing environment is totally fine.
and I'm sorry. I didn't mean to offend that your tests were bad.

It was more like  "oh, the data totally doesn't make sense to me"
and I blamed the tests rather than my poor understanding of the data ;)

Anyway,
as the data shows a repeatable regression,
let's think more about the possible scenario:

I can't stop thinking that the patch must've affected the system's
reclamation behavior in some way.
(I think more active anon pages with a similar number total of anon
pages implies the kernel scanned more pages)

It might be because kswapd was more frequently woken up (possible if
skbs were allocated with GFP_ATOMIC)
But the data provided is not enough to support this argument.

>  2.43 =C2=B1 7% +4.5 6.90 =C2=B1 11% perf-profile.children.cycles-pp.get_=
partial_node
>  3.23 =C2=B1  5%      +4.5        7.77 =C2=B1  9%  perf-profile.children.=
cycles-pp.___slab_alloc
>  7.51 =C2=B1  2%      +4.6       12.11 =C2=B1  5%  perf-profile.children.=
cycles-pp.kmalloc_reserve
> 6.94 =C2=B1  2%      +4.7       11.62 =C2=B1  6%  perf-profile.children.c=
ycles-pp.__kmalloc_node_track_caller
> 6.46 =C2=B1  2%      +4.8       11.22 =C2=B1  6%  perf-profile.children.c=
ycles-pp.__kmem_cache_alloc_node
>  8.48 =C2=B1  4%      +7.9       16.42 =C2=B1  8%  perf-profile.children.=
cycles-pp._raw_spin_lock_irqsave
>  6.12 =C2=B1  6%      +8.6       14.74 =C2=B1  9%  perf-profile.children.=
cycles-pp.native_queued_spin_lock_slowpath

And this increased cycles in the SLUB slowpath implies that the actual
number of objects available in
the per cpu partial list has been decreased, possibly because of
inaccuracy in the heuristic?
(cuz the assumption that slabs cached per are half-filled, and that
slabs' order is s->oo)

Any thoughts, Vlastimil or Jay?

>
> then retest on this test machine:
> 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake)=
 with 256G memory
>
> we noticed the regression still exists (datail comparison is attached
> as hackbench-a0fd217e6d-ICL-Gold-6338):
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/t=
box_group/testcase:
>   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x8=
6_64-20220510.cgz/lkp-icl-2sp2/hackbench
>
> 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>     479042           -12.5%     419357        hackbench.throughput
>
> the real data is as below,
>
> for 7bc162d5cc:
>   "hackbench.throughput": [
>     480199.7631014502,
>     478713.21886768367,
>     480692.1967633392,
>     476795.9313413859,
>     478545.2225235285,
>     479309.7938967886
>   ],
>
> for a0fd217e6d:
>   "hackbench.throughput": [
>     422654.2688081149,
>     419017.82222470525,
>     416817.183983105,
>     423286.39557524625,
>     414307.41610274825,
>     420062.1692010417
>   ],
>
>
> we also rerun the tests on another test machine:
> 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice L=
ake) with 128G memory
>
> still found a regression
> (detail as attached hackbench-a0fd217e6d-ICL-Platinum-8358):
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/t=
box_group/testcase:
>   gcc-12/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-11.1-x8=
6_64-20220510.cgz/lkp-icl-2sp6/hackbench
>
> 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>     455347            -5.9%     428458        hackbench.throughput
>
>
> >
> > >    1377834 =C4=85  2%     -10.7%    1230013        sched_debug.cpu.nr=
_switches.avg
> > >    1218144 =C4=85  2%     -13.3%    1055659 =C4=85  2%  sched_debug.c=
pu.nr_switches.min
> > >    3047631 =C4=85  2%     -13.2%    2646560        vmstat.system.cs
> > >     561797           -13.8%     484137        vmstat.system.in
> > >     280976 =C4=85 66%    +122.6%     625459 =C4=85 52%  meminfo.Activ=
e
> > >     280881 =C4=85 66%    +122.6%     625365 =C4=85 52%  meminfo.Activ=
e(anon)
> > >     743351 =C4=85  4%      -9.7%     671534 =C4=85  6%  meminfo.AnonP=
ages
> > >       1.36            -0.1        1.21        mpstat.cpu.all.irq%
> > >       0.04 =C4=85  4%      -0.0        0.03 =C4=85  4%  mpstat.cpu.al=
l.soft%
> > >       5.38            -0.8        4.58        mpstat.cpu.all.usr%
> > >       0.26           -11.9%       0.23        turbostat.IPC
> > >     160.93           -19.3      141.61        turbostat.PKG_%
> > >      60.48            -8.9%      55.10        turbostat.RAMWatt
> > >      70049 =C4=85 68%    +124.5%     157279 =C4=85 52%  proc-vmstat.n=
r_active_anon
> > >     185963 =C4=85  4%      -9.8%     167802 =C4=85  6%  proc-vmstat.n=
r_anon_pages
> > >      37302            -1.2%      36837        proc-vmstat.nr_slab_rec=
laimable
> > >      70049 =C4=85 68%    +124.5%     157279 =C4=85 52%  proc-vmstat.n=
r_zone_active_anon
> > >    1101451           +12.0%    1233638        proc-vmstat.unevictable=
_pgs_scanned
> > >     477310           -12.5%     417480        hackbench.throughput
> > >     464064           -12.0%     408333        hackbench.throughput_av=
g
> > >     477310           -12.5%     417480        hackbench.throughput_be=
st
> > >     435294            -9.5%     394098        hackbench.throughput_wo=
rst
> > >     131.28           +13.4%     148.89        hackbench.time.elapsed_=
time
> > >     131.28           +13.4%     148.89        hackbench.time.elapsed_=
time.max
> > >   90404617            -5.2%   85662614 =C4=85  2%  hackbench.time.inv=
oluntary_context_switches
> > >      15342           +15.0%      17642        hackbench.time.system_t=
ime
> > >     866.32            -3.2%     838.32        hackbench.time.user_tim=
e
> > >  4.581e+10           -11.2%  4.069e+10        perf-stat.i.branch-inst=
ructions
> > >       0.45            +0.1        0.56        perf-stat.i.branch-miss=
-rate%
> > >  2.024e+08           +11.8%  2.263e+08        perf-stat.i.branch-miss=
es
> > >      21.49            -1.1       20.42        perf-stat.i.cache-miss-=
rate%
> > >  4.202e+08           -16.6%  3.505e+08        perf-stat.i.cache-misse=
s
> > >  1.935e+09           -11.5%  1.711e+09        perf-stat.i.cache-refer=
ences
> > >    3115707 =C4=85  2%     -13.9%    2681887        perf-stat.i.contex=
t-switches
> > >       1.31           +13.2%       1.48        perf-stat.i.cpi
> > >     375155 =C4=85  3%     -16.3%     314001 =C4=85  2%  perf-stat.i.c=
pu-migrations
> > >  6.727e+10           -11.2%  5.972e+10        perf-stat.i.dTLB-loads
> > >  4.169e+10           -12.2%  3.661e+10        perf-stat.i.dTLB-stores
> > >  2.465e+11           -11.4%  2.185e+11        perf-stat.i.instruction=
s
> > >       0.77           -11.8%       0.68        perf-stat.i.ipc
> > >     818.18 =C4=85  5%     +61.8%       1323 =C4=85  2%  perf-stat.i.m=
etric.K/sec
> > >       1225           -11.6%       1083        perf-stat.i.metric.M/se=
c
> > >      11341 =C4=85  4%     -12.6%       9916 =C4=85  4%  perf-stat.i.m=
inor-faults
> > >   1.27e+08           -13.2%  1.102e+08        perf-stat.i.node-load-m=
isses
> > >    3376198           -15.4%    2855906        perf-stat.i.node-loads
> > >   72756698           -22.9%   56082330        perf-stat.i.node-store-=
misses
> > >    4118986 =C4=85  2%     -19.3%    3322276        perf-stat.i.node-s=
tores
> > >      11432 =C4=85  3%     -12.6%       9991 =C4=85  4%  perf-stat.i.p=
age-faults
> > >       0.44            +0.1        0.56        perf-stat.overall.branc=
h-miss-rate%
> > >      21.76            -1.3       20.49        perf-stat.overall.cache=
-miss-rate%
> > >       1.29           +13.5%       1.47        perf-stat.overall.cpi
> > >     755.39           +21.1%     914.82        perf-stat.overall.cycle=
s-between-cache-misses
> > >       0.77           -11.9%       0.68        perf-stat.overall.ipc
> > >  4.546e+10           -11.0%  4.046e+10        perf-stat.ps.branch-ins=
tructions
> > >  2.006e+08           +12.0%  2.246e+08        perf-stat.ps.branch-mis=
ses
> > >  4.183e+08           -16.8%   3.48e+08        perf-stat.ps.cache-miss=
es
> > >  1.923e+09           -11.7%  1.699e+09        perf-stat.ps.cache-refe=
rences
> > >    3073921 =C4=85  2%     -13.9%    2647497        perf-stat.ps.conte=
xt-switches
> > >     367849 =C4=85  3%     -16.1%     308496 =C4=85  2%  perf-stat.ps.=
cpu-migrations
> > >  6.683e+10           -11.2%  5.938e+10        perf-stat.ps.dTLB-loads
> > >  4.144e+10           -12.2%  3.639e+10        perf-stat.ps.dTLB-store=
s
> > >  2.447e+11           -11.2%  2.172e+11        perf-stat.ps.instructio=
ns
> > >      10654 =C4=85  4%     -11.5%       9428 =C4=85  4%  perf-stat.ps.=
minor-faults
> > >  1.266e+08           -13.5%  1.095e+08        perf-stat.ps.node-load-=
misses
> > >    3361116           -15.6%    2836863        perf-stat.ps.node-loads
> > >   72294146           -23.1%   55573600        perf-stat.ps.node-store=
-misses
> > >    4043240 =C4=85  2%     -19.4%    3258771        perf-stat.ps.node-=
stores
> > >      10734 =C4=85  4%     -11.6%       9494 =C4=85  4%  perf-stat.ps.=
page-faults
> >
> > <...>
> >
> > >
> > > Disclaimer:
> > > Results have been estimated based on internal Intel analysis and are =
provided
> > > for informational purposes only. Any difference in system hardware or=
 software
> > > design or configuration may affect actual performance.
> > >
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > >
> > >
> >
