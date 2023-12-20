Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E974879E
	for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNo+2Cod"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3b547cd4cso632355ad.1
        for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 12:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703102961; x=1703707761; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qez7Gp7d+Qsotwhlv3ZNDbJNqFW6kpg0ErD3hIWh2H0=;
        b=YNo+2CodCg8Zy/q8z0gD/SpcWgo0NZUO53IYS2/3qsxg2CmwLIb4cSGglQyCo7j4ym
         XHlKIfQf1kf19z4utrdS8gMbzaTCoRavjarxg8Ws/EiPzEZ2W+IYheuhoAW6lF5s3yjQ
         V9bkn7UmSjkCnJe0NiJWDSGTAl6Zhps17zaQGUdPFAKQ/PxUghTevCulyN8NsuqkdNzG
         nUgVNrJPLrzS0tm9NDshgCfWd+p+OhaYdqf3Mp4YPCsUj8TecGJwOznUfSS+HFAJwe5v
         78/xJNhvxnKh7T8cdQWgRp088AvAbt5bdizaW0yw1iMDWriDl8Q1U+6CkihjwE4lGaA+
         Fu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703102961; x=1703707761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qez7Gp7d+Qsotwhlv3ZNDbJNqFW6kpg0ErD3hIWh2H0=;
        b=mBbfnTJRM3PltIlKIdj0lIdVyxrpa5IpsZpsKiJN0uwBG87OblGDfe2MYksAehqFca
         PeMG6XIEUwG30Tl8TTKP+orD4Xu0+xSlXyr4nZbS4IQ9uiIl5ekatsuKXzt0E4YuiV8n
         14SYaVYd5GnxujGYX/UtJHo+iZ0ZAEizTMfOMtXDuVZtGJuyyyqHrOHiW0WYOl3CQoN3
         RNfsYF1XF0QaXgcZ3GroylMlDzgLDB3u/eL4OVukXZmUBTJ06NGYQg+tNXDRYqVfn3T8
         CdqFDTsCJLWZPm3gK12NdcCC6Z6qRds4yfoYw4T8ip2NBgqgfe1swCY8yvJIYump93kp
         OBDg==
X-Gm-Message-State: AOJu0YzLv6Q+jdbXUvxF5qGB1wq3/xdTgnR0hA2RLNW9+wE1DU9S8nmd
	rTcOQ8iaD24NJ5B5jRbn1F4jJVFuYDSSC38w55VXZLpN
X-Google-Smtp-Source: AGHT+IHw/fuBmFiR/+pN5MeNJO4M9Og7EJEUgysUReWzSU0vLDZMJ1aNCWDjj+0uCQMTILdf8jvviJrg9YFNpAh2tVQ=
X-Received: by 2002:a17:902:a385:b0:1d4:25a:e597 with SMTP id
 x5-20020a170902a38500b001d4025ae597mr78701pla.85.1703102960581; Wed, 20 Dec
 2023 12:09:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312192310.56367035-oliver.sang@intel.com> <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
In-Reply-To: <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 20 Dec 2023 12:09:07 -0800
Message-ID: <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c: stress-ng.pthread.ops_per_sec
 -84.3% regression
To: Yin Fengwei <fengwei.yin@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Christopher Lameter <cl@linux.com>, ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 12:34=E2=80=AFAM Yin Fengwei <fengwei.yin@intel.com=
> wrote:
>
>
>
> On 2023/12/20 13:27, Yang Shi wrote:
> > On Tue, Dec 19, 2023 at 7:41=E2=80=AFAM kernel test robot <oliver.sang@=
intel.com> wrote:
> >>
> >>
> >>
> >> Hello,
> >>
> >> for this commit, we reported
> >> "[mm]  96db82a66d:  will-it-scale.per_process_ops -95.3% regression"
> >> in Aug, 2022 when it's in linux-next/master
> >> https://lore.kernel.org/all/YwIoiIYo4qsYBcgd@xsang-OptiPlex-9020/
> >>
> >> later, we reported
> >> "[mm] f35b5d7d67: will-it-scale.per_process_ops -95.5% regression"
> >> in Oct, 2022 when it's in linus/master
> >> https://lore.kernel.org/all/202210181535.7144dd15-yujie.liu@intel.com/
> >>
> >> and the commit was reverted finally by
> >> commit 0ba09b1733878afe838fe35c310715fda3d46428
> >> Author: Linus Torvalds <torvalds@linux-foundation.org>
> >> Date:   Sun Dec 4 12:51:59 2022 -0800
> >>
> >> now we noticed it goes into linux-next/master again.
> >>
> >> we are not sure if there is an agreement that the benefit of this comm=
it
> >> has already overweight performance drop in some mirco benchmark.
> >>
> >> we also noticed from https://lore.kernel.org/all/20231214223423.113307=
4-1-yang@os.amperecomputing.com/
> >> that
> >> "This patch was applied to v6.1, but was reverted due to a regression
> >> report.  However it turned out the regression was not due to this patc=
h.
> >> I ping'ed Andrew to reapply this patch, Andrew may forget it.  This
> >> patch helps promote THP, so I rebased it onto the latest mm-unstable."
> >
> > IIRC, Huang Ying's analysis showed the regression for will-it-scale
> > micro benchmark is fine, it was actually reverted due to kernel build
> > regression with LLVM reported by Nathan Chancellor. Then the
> > regression was resolved by commit
> > 81e506bec9be1eceaf5a2c654e28ba5176ef48d8 ("mm/thp: check and bail out
> > if page in deferred queue already"). And this patch did improve kernel
> > build with GCC by ~3% if I remember correctly.
> >
> >>
> >> however, unfortunately, in our latest tests, we still observed below r=
egression
> >> upon this commit. just FYI.
> >>
> >>
> >>
> >> kernel test robot noticed a -84.3% regression of stress-ng.pthread.ops=
_per_sec on:
> >
> > Interesting, wasn't the same regression seen last time? And I'm a
> > little bit confused about how pthread got regressed. I didn't see the
> > pthread benchmark do any intensive memory alloc/free operations. Do
> > the pthread APIs do any intensive memory operations? I saw the
> > benchmark does allocate memory for thread stack, but it should be just
> > 8K per thread, so it should not trigger what this patch does. With
> > 1024 threads, the thread stacks may get merged into one single VMA (8M
> > total), but it may do so even though the patch is not applied.
> stress-ng.pthread test code is strange here:
>
> https://github.com/ColinIanKing/stress-ng/blob/master/stress-pthread.c#L5=
73
>
> Even it allocates its own stack, but that attr is not passed
> to pthread_create. So it's still glibc to allocate stack for
> pthread which is 8M size. This is why this patch can impact
> the stress-ng.pthread testing.

Aha, nice catch, I overlooked that.

>
>
> My understanding is this is different regression (if it's a valid
> regression). The previous hotspot was in:
>     deferred_split_huge_page
>        deferred_split_huge_page
>           deferred_split_huge_page
>              spin_lock
>
> while this time, the hotspot is in (pmd_lock from do_madvise I suppose):
>     - 55.02% zap_pmd_range.isra.0
>        - 53.42% __split_huge_pmd
>           - 51.74% _raw_spin_lock
>              - 51.73% native_queued_spin_lock_slowpath
>                 + 3.03% asm_sysvec_call_function
>           - 1.67% __split_huge_pmd_locked
>              - 0.87% pmdp_invalidate
>                 + 0.86% flush_tlb_mm_range
>        - 1.60% zap_pte_range
>           - 1.04% page_remove_rmap
>                0.55% __mod_lruvec_page_state
>
>
> >
> >>
> >>
> >> commit: 1111d46b5cbad57486e7a3fab75888accac2f072 ("mm: align larger an=
onymous mappings on THP boundaries")
> >> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git maste=
r
> >>
> >> testcase: stress-ng
> >> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ =
3.00GHz (Cascade Lake) with 128G memory
> >> parameters:
> >>
> >>          nr_threads: 1
> >>          disk: 1HDD
> >>          testtime: 60s
> >>          fs: ext4
> >>          class: os
> >>          test: pthread
> >>          cpufreq_governor: performance
> >>
> >>
> >> In addition to that, the commit also has significant impact on the fol=
lowing tests:
> >>
> >> +------------------+--------------------------------------------------=
---------------------------------------------+
> >> | testcase: change | stream: stream.triad_bandwidth_MBps -12.1% regres=
sion                                         |
> >> | test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8=
480CTDX (Sapphire Rapids) with 512G memory   |
> >> | test parameters  | array_size=3D50000000                            =
                                               |
> >> |                  | cpufreq_governor=3Dperformance                   =
                                               |
> >> |                  | iterations=3D10x                                 =
                                               |
> >> |                  | loop=3D100                                       =
                                               |
> >> |                  | nr_threads=3D25%                                 =
                                               |
> >> |                  | omp=3Dtrue                                       =
                                               |
> >> +------------------+--------------------------------------------------=
---------------------------------------------+
> >> | testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed=
.Average.Integer.mb_s -3.5% regression       |
> >> | test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CP=
U @ 3.20GHz (Coffee Lake) with 16G memory    |
> >> | test parameters  | cpufreq_governor=3Dperformance                   =
                                               |
> >> |                  | option_a=3DAverage                               =
                                               |
> >> |                  | option_b=3DInteger                               =
                                               |
> >> |                  | test=3Dramspeed-1.4.3                            =
                                               |
> >> +------------------+--------------------------------------------------=
---------------------------------------------+
> >> | testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed=
.Average.FloatingPoint.mb_s -3.0% regression |
> >> | test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CP=
U @ 3.20GHz (Coffee Lake) with 16G memory    |
> >> | test parameters  | cpufreq_governor=3Dperformance                   =
                                               |
> >> |                  | option_a=3DAverage                               =
                                               |
> >> |                  | option_b=3DFloating Point                        =
                                               |
> >> |                  | test=3Dramspeed-1.4.3                            =
                                               |
> >> +------------------+--------------------------------------------------=
---------------------------------------------+
> >>
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <oliver.sang@intel.com>
> >> | Closes: https://lore.kernel.org/oe-lkp/202312192310.56367035-oliver.=
sang@intel.com
> >>
> >>
> >> Details are as below:
> >> ----------------------------------------------------------------------=
---------------------------->
> >>
> >>
> >> The kernel config and materials to reproduce are available at:
> >> https://download.01.org/0day-ci/archive/20231219/202312192310.56367035=
-oliver.sang@intel.com
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox=
_group/test/testcase/testtime:
> >>    os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_6=
4-20220510.cgz/lkp-csl-d02/pthread/stress-ng/60s
> >>
> >> commit:
> >>    30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
> >>    1111d46b5c ("mm: align larger anonymous mappings on THP boundaries"=
)
> >>
> >> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75
> >> ---------------- ---------------------------
> >>           %stddev     %change         %stddev
> >>               \          |                \
> >>    13405796           -65.5%    4620124        cpuidle..usage
> >>        8.00            +8.2%       8.66 =C4=85  2%  iostat.cpu.system
> >>        1.61           -60.6%       0.63        iostat.cpu.user
> >>      597.50 =C4=85 14%     -64.3%     213.50 =C4=85 14%  perf-c2c.DRAM=
.local
> >>        1882 =C4=85 14%     -74.7%     476.83 =C4=85  7%  perf-c2c.HITM=
.local
> >>     3768436           -12.9%    3283395        vmstat.memory.cache
> >>      355105           -75.7%      86344 =C4=85  3%  vmstat.system.cs
> >>      385435           -20.7%     305714 =C4=85  3%  vmstat.system.in
> >>        1.13            -0.2        0.88        mpstat.cpu.all.irq%
> >>        0.29            -0.2        0.10 =C4=85  2%  mpstat.cpu.all.sof=
t%
> >>        6.76 =C4=85  2%      +1.1        7.88 =C4=85  2%  mpstat.cpu.al=
l.sys%
> >>        1.62            -1.0        0.62 =C4=85  2%  mpstat.cpu.all.usr=
%
> >>     2234397           -84.3%     350161 =C4=85  5%  stress-ng.pthread.=
ops
> >>       37237           -84.3%       5834 =C4=85  5%  stress-ng.pthread.=
ops_per_sec
> >>      294706 =C4=85  2%     -68.0%      94191 =C4=85  6%  stress-ng.tim=
e.involuntary_context_switches
> >>       41442 =C4=85  2%   +5023.4%    2123284        stress-ng.time.max=
imum_resident_set_size
> >>     4466457           -83.9%     717053 =C4=85  5%  stress-ng.time.min=
or_page_faults
> >
> > The larger RSS and fewer page faults are expected.
> >
> >>      243.33           +13.5%     276.17 =C4=85  3%  stress-ng.time.per=
cent_of_cpu_this_job_got
> >>      131.64           +27.7%     168.11 =C4=85  3%  stress-ng.time.sys=
tem_time
> >>       19.73           -82.1%       3.53 =C4=85  4%  stress-ng.time.use=
r_time
> >
> > Much less user time. And it seems to match the drop of the pthread metr=
ic.
> >
> >>     7715609           -80.2%    1530125 =C4=85  4%  stress-ng.time.vol=
untary_context_switches
> >>       76728           -80.8%      14724 =C4=85  4%  perf-stat.i.minor-=
faults
> >>     5600408           -61.4%    2160997 =C4=85  5%  perf-stat.i.node-l=
oads
> >>     8873996           +52.1%   13499744 =C4=85  5%  perf-stat.i.node-s=
tores
> >>      112409           -81.9%      20305 =C4=85  4%  perf-stat.i.page-f=
aults
> >>        2.55           +89.6%       4.83        perf-stat.overall.MPKI
> >
> > Much more TLB misses.
> >
> >>        1.51            -0.4        1.13        perf-stat.overall.branc=
h-miss-rate%
> >>       19.26           +24.5       43.71        perf-stat.overall.cache=
-miss-rate%
> >>        1.70           +56.4%       2.65        perf-stat.overall.cpi
> >>      665.84           -17.5%     549.51 =C4=85  2%  perf-stat.overall.=
cycles-between-cache-misses
> >>        0.12 =C4=85  4%      -0.1        0.04        perf-stat.overall.=
dTLB-load-miss-rate%
> >>        0.08 =C4=85  2%      -0.0        0.03        perf-stat.overall.=
dTLB-store-miss-rate%
> >>       59.16            +0.9       60.04        perf-stat.overall.iTLB-=
load-miss-rate%
> >>        1278           +86.1%       2379 =C4=85  2%  perf-stat.overall.=
instructions-per-iTLB-miss
> >>        0.59           -36.1%       0.38        perf-stat.overall.ipc
> >
> > Worse IPC and CPI.
> >
> >>   2.078e+09           -48.3%  1.074e+09 =C4=85  4%  perf-stat.ps.branc=
h-instructions
> >>    31292687           -61.2%   12133349 =C4=85  2%  perf-stat.ps.branc=
h-misses
> >>    26057291            -5.9%   24512034 =C4=85  4%  perf-stat.ps.cache=
-misses
> >>   1.353e+08           -58.6%   56072195 =C4=85  4%  perf-stat.ps.cache=
-references
> >>      365254           -75.8%      88464 =C4=85  3%  perf-stat.ps.conte=
xt-switches
> >>   1.735e+10           -22.4%  1.346e+10 =C4=85  2%  perf-stat.ps.cpu-c=
ycles
> >>       60838           -79.1%      12727 =C4=85  6%  perf-stat.ps.cpu-m=
igrations
> >>     3056601 =C4=85  4%     -81.5%     565354 =C4=85  4%  perf-stat.ps.=
dTLB-load-misses
> >>   2.636e+09           -50.7%    1.3e+09 =C4=85  4%  perf-stat.ps.dTLB-=
loads
> >>     1155253 =C4=85  2%     -83.0%     196581 =C4=85  5%  perf-stat.ps.=
dTLB-store-misses
> >>   1.473e+09           -57.4%  6.268e+08 =C4=85  3%  perf-stat.ps.dTLB-=
stores
> >>     7997726           -73.3%    2131477 =C4=85  3%  perf-stat.ps.iTLB-=
load-misses
> >>     5521346           -74.3%    1418623 =C4=85  2%  perf-stat.ps.iTLB-=
loads
> >>   1.023e+10           -50.4%  5.073e+09 =C4=85  4%  perf-stat.ps.instr=
uctions
> >>       75671           -80.9%      14479 =C4=85  4%  perf-stat.ps.minor=
-faults
> >>     5549722           -61.4%    2141750 =C4=85  4%  perf-stat.ps.node-=
loads
> >>     8769156           +51.6%   13296579 =C4=85  5%  perf-stat.ps.node-=
stores
> >>      110795           -82.0%      19977 =C4=85  4%  perf-stat.ps.page-=
faults
> >>   6.482e+11           -50.7%  3.197e+11 =C4=85  4%  perf-stat.total.in=
structions
> >>        0.00 =C4=85 37%    -100.0%       0.00        perf-sched.sch_del=
ay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc=
_slab_cgroups.allocate_slab
> >>        0.01 =C4=85 18%   +8373.1%       0.73 =C4=85 49%  perf-sched.sc=
h_delay.avg.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_sys=
call_64
> >>        0.01 =C4=85 16%   +4600.0%       0.38 =C4=85 24%  perf-sched.sc=
h_delay.avg.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
> >
> > More time spent in madvise and munmap. but I'm not sure whether this
> > is caused by tearing down the address space when exiting the test. If
> > so it should not count in the regression.
> It's not for the whole address space tearing down. It's for pthread
> stack tearing down when pthread exit (can be treated as address space
> tearing down? I suppose so).
>
> https://github.com/lattera/glibc/blob/master/nptl/allocatestack.c#L384
> https://github.com/lattera/glibc/blob/master/nptl/pthread_create.c#L576

It explains the problem. The madvise() does have some extra overhead
for handling THP (splitting pmd, deferred split queue, etc).

>
> Another thing is whether it's worthy to make stack use THP? It may be
> useful for some apps which need large stack size?

Kernel actually doesn't apply THP to stack (see
vma_is_temporary_stack()). But kernel can't know whether the VMA is
stack or not by checking VM_GROWSDOWN | VM_GROWSUP flags. So if glibc
doesn't set the proper flags to tell kernel the area is stack, kernel
just treats it as normal anonymous area. So glibc should set up stack
properly IMHO.

>
>
> Regards
> Yin, Fengwei
