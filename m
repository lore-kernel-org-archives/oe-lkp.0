Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A138AFBE1
	for <oe-lkp@lists.linux.dev>; Wed, 20 Dec 2023 05:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qemw88M8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d3aa0321b5so29234245ad.2
        for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 21:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703050041; x=1703654841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyCa8aNvFFMzS/2cpbfLyfUNa1SzwIXdOb7F8Mv2w/s=;
        b=Qemw88M88yEvIaUyBK7DiNhS2q23fGgTgMfA93GD9Vb7VneBes6as7U1zsenkpk7Ua
         53aErwMoOE7v41tva2yPkDSahjjgDcJhfPNMoqeyWso79553HzMDG3iyRjEWoOxRNZjF
         r9ejW/X6ubMn++nIyICkh4T7+U+1EOizF3hhzq0Fqwhmxcz+qCm0w/sJ7wMe7EyGd4Cm
         WCjcYHfJ9Ct/Bkgf+EYQ1R5WHOK05K3Iw202qHeBpsHKk7t7J7EHIWY23CUVGZxFjySB
         v4uE2JJKhwGnRjUYhiF5le5Hb9rLGI/AbPAfK04VtFpl/sJ4iHl0TdmYVAxUnFn72b0I
         C87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703050041; x=1703654841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyCa8aNvFFMzS/2cpbfLyfUNa1SzwIXdOb7F8Mv2w/s=;
        b=sgyLuycEssVFQINXnWoEDQbnkia54HsR12j98jspRrvDNJ7jwSTZnTOb7QvuQK/vUl
         bi3CSpNb8b1Y3hSKH+CqvkM8s6BZYJfo5xOgZDv55Zlw7cgpu0fRSxK2kw8s1zcNPpCR
         hdMB2hEC3OyQtMnaLDbb+RjLZbBw3cC2sSJzSJL4IsapHidsjCHY/f1rGU5iHKEFaCfx
         lW57frwpRDcaFvKrIjGFAb2AbQen7HIwhbU9d2aIBHD9zUL5agMVKM2MMZN1Y8ORbEst
         ErBlFg7m34dXIE2uFZagExZ8aPn8P61/bWwBQuKEEodV43s5bgg6GY/V+69yU404l8UV
         CKCA==
X-Gm-Message-State: AOJu0YxTfgmcKkH4Ml+EmIw2E7RxOlutRd/sLTAbyMFHyBVeJ897mK4I
	HBU2fGqC1Myjnp5pweSz8S3RkgO7lNAXynXSbCA=
X-Google-Smtp-Source: AGHT+IFpaXaKguxX+QoX4tXMfcPd6AMOhSNFJ+rcfbC6yZOr5pKzM1gxfggtNjklpbHXbBt0oT6kyXKTszwYHx7Isdo=
X-Received: by 2002:a17:902:dacf:b0:1d3:d72e:ce33 with SMTP id
 q15-20020a170902dacf00b001d3d72ece33mr4349157plx.107.1703050040181; Tue, 19
 Dec 2023 21:27:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312192310.56367035-oliver.sang@intel.com>
In-Reply-To: <202312192310.56367035-oliver.sang@intel.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 Dec 2023 21:27:07 -0800
Message-ID: <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c: stress-ng.pthread.ops_per_sec
 -84.3% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Christopher Lameter <cl@linux.com>, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 7:41=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> for this commit, we reported
> "[mm]  96db82a66d:  will-it-scale.per_process_ops -95.3% regression"
> in Aug, 2022 when it's in linux-next/master
> https://lore.kernel.org/all/YwIoiIYo4qsYBcgd@xsang-OptiPlex-9020/
>
> later, we reported
> "[mm] f35b5d7d67: will-it-scale.per_process_ops -95.5% regression"
> in Oct, 2022 when it's in linus/master
> https://lore.kernel.org/all/202210181535.7144dd15-yujie.liu@intel.com/
>
> and the commit was reverted finally by
> commit 0ba09b1733878afe838fe35c310715fda3d46428
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Dec 4 12:51:59 2022 -0800
>
> now we noticed it goes into linux-next/master again.
>
> we are not sure if there is an agreement that the benefit of this commit
> has already overweight performance drop in some mirco benchmark.
>
> we also noticed from https://lore.kernel.org/all/20231214223423.1133074-1=
-yang@os.amperecomputing.com/
> that
> "This patch was applied to v6.1, but was reverted due to a regression
> report.  However it turned out the regression was not due to this patch.
> I ping'ed Andrew to reapply this patch, Andrew may forget it.  This
> patch helps promote THP, so I rebased it onto the latest mm-unstable."

IIRC, Huang Ying's analysis showed the regression for will-it-scale
micro benchmark is fine, it was actually reverted due to kernel build
regression with LLVM reported by Nathan Chancellor. Then the
regression was resolved by commit
81e506bec9be1eceaf5a2c654e28ba5176ef48d8 ("mm/thp: check and bail out
if page in deferred queue already"). And this patch did improve kernel
build with GCC by ~3% if I remember correctly.

>
> however, unfortunately, in our latest tests, we still observed below regr=
ession
> upon this commit. just FYI.
>
>
>
> kernel test robot noticed a -84.3% regression of stress-ng.pthread.ops_pe=
r_sec on:

Interesting, wasn't the same regression seen last time? And I'm a
little bit confused about how pthread got regressed. I didn't see the
pthread benchmark do any intensive memory alloc/free operations. Do
the pthread APIs do any intensive memory operations? I saw the
benchmark does allocate memory for thread stack, but it should be just
8K per thread, so it should not trigger what this patch does. With
1024 threads, the thread stacks may get merged into one single VMA (8M
total), but it may do so even though the patch is not applied.

>
>
> commit: 1111d46b5cbad57486e7a3fab75888accac2f072 ("mm: align larger anony=
mous mappings on THP boundaries")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> testcase: stress-ng
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.0=
0GHz (Cascade Lake) with 128G memory
> parameters:
>
>         nr_threads: 1
>         disk: 1HDD
>         testtime: 60s
>         fs: ext4
>         class: os
>         test: pthread
>         cpufreq_governor: performance
>
>
> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
> +------------------+-----------------------------------------------------=
------------------------------------------+
> | testcase: change | stream: stream.triad_bandwidth_MBps -12.1% regressio=
n                                         |
> | test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480=
CTDX (Sapphire Rapids) with 512G memory   |
> | test parameters  | array_size=3D50000000                               =
                                            |
> |                  | cpufreq_governor=3Dperformance                      =
                                            |
> |                  | iterations=3D10x                                    =
                                            |
> |                  | loop=3D100                                          =
                                            |
> |                  | nr_threads=3D25%                                    =
                                            |
> |                  | omp=3Dtrue                                          =
                                            |
> +------------------+-----------------------------------------------------=
------------------------------------------+
> | testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed.Av=
erage.Integer.mb_s -3.5% regression       |
> | test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @=
 3.20GHz (Coffee Lake) with 16G memory    |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                            |
> |                  | option_a=3DAverage                                  =
                                            |
> |                  | option_b=3DInteger                                  =
                                            |
> |                  | test=3Dramspeed-1.4.3                               =
                                            |
> +------------------+-----------------------------------------------------=
------------------------------------------+
> | testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed.Av=
erage.FloatingPoint.mb_s -3.0% regression |
> | test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @=
 3.20GHz (Coffee Lake) with 16G memory    |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                            |
> |                  | option_a=3DAverage                                  =
                                            |
> |                  | option_b=3DFloating Point                           =
                                            |
> |                  | test=3Dramspeed-1.4.3                               =
                                            |
> +------------------+-----------------------------------------------------=
------------------------------------------+
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202312192310.56367035-oliver.san=
g@intel.com
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231219/202312192310.56367035-ol=
iver.sang@intel.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/test/testcase/testtime:
>   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20=
220510.cgz/lkp-csl-d02/pthread/stress-ng/60s
>
> commit:
>   30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
>   1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")
>
> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>   13405796           -65.5%    4620124        cpuidle..usage
>       8.00            +8.2%       8.66 =C4=85  2%  iostat.cpu.system
>       1.61           -60.6%       0.63        iostat.cpu.user
>     597.50 =C4=85 14%     -64.3%     213.50 =C4=85 14%  perf-c2c.DRAM.loc=
al
>       1882 =C4=85 14%     -74.7%     476.83 =C4=85  7%  perf-c2c.HITM.loc=
al
>    3768436           -12.9%    3283395        vmstat.memory.cache
>     355105           -75.7%      86344 =C4=85  3%  vmstat.system.cs
>     385435           -20.7%     305714 =C4=85  3%  vmstat.system.in
>       1.13            -0.2        0.88        mpstat.cpu.all.irq%
>       0.29            -0.2        0.10 =C4=85  2%  mpstat.cpu.all.soft%
>       6.76 =C4=85  2%      +1.1        7.88 =C4=85  2%  mpstat.cpu.all.sy=
s%
>       1.62            -1.0        0.62 =C4=85  2%  mpstat.cpu.all.usr%
>    2234397           -84.3%     350161 =C4=85  5%  stress-ng.pthread.ops
>      37237           -84.3%       5834 =C4=85  5%  stress-ng.pthread.ops_=
per_sec
>     294706 =C4=85  2%     -68.0%      94191 =C4=85  6%  stress-ng.time.in=
voluntary_context_switches
>      41442 =C4=85  2%   +5023.4%    2123284        stress-ng.time.maximum=
_resident_set_size
>    4466457           -83.9%     717053 =C4=85  5%  stress-ng.time.minor_p=
age_faults

The larger RSS and fewer page faults are expected.

>     243.33           +13.5%     276.17 =C4=85  3%  stress-ng.time.percent=
_of_cpu_this_job_got
>     131.64           +27.7%     168.11 =C4=85  3%  stress-ng.time.system_=
time
>      19.73           -82.1%       3.53 =C4=85  4%  stress-ng.time.user_ti=
me

Much less user time. And it seems to match the drop of the pthread metric.

>    7715609           -80.2%    1530125 =C4=85  4%  stress-ng.time.volunta=
ry_context_switches
>     494566           -59.5%     200338 =C4=85  3%  meminfo.Active
>     478287           -61.5%     184050 =C4=85  3%  meminfo.Active(anon)
>      58549 =C4=85 17%   +1532.8%     956006 =C4=85 14%  meminfo.AnonHugeP=
ages
>     424631          +194.9%    1252445 =C4=85 10%  meminfo.AnonPages
>    3677263           -13.0%    3197755        meminfo.Cached
>    5829485 =C4=85  4%     -19.0%    4724784 =C4=85 10%  meminfo.Committed=
_AS
>     692486          +108.6%    1444669 =C4=85  8%  meminfo.Inactive
>     662179          +113.6%    1414338 =C4=85  9%  meminfo.Inactive(anon)
>     182416           -50.2%      90759        meminfo.Mapped
>    4614466           +10.0%    5076604 =C4=85  2%  meminfo.Memused
>       6985           +47.6%      10307 =C4=85  4%  meminfo.PageTables
>     718445           -66.7%     238913 =C4=85  3%  meminfo.Shmem
>      35906           -20.7%      28471 =C4=85  3%  meminfo.VmallocUsed
>    4838522           +25.6%    6075302        meminfo.max_used_kB
>     488.83           -20.9%     386.67 =C4=85  2%  turbostat.Avg_MHz
>      12.95            -2.7       10.26 =C4=85  2%  turbostat.Busy%
>    7156734           -87.2%     919149 =C4=85  4%  turbostat.C1
>      10.59            -8.9        1.65 =C4=85  5%  turbostat.C1%
>    3702647           -55.1%    1663518 =C4=85  2%  turbostat.C1E
>      32.99           -20.6       12.36 =C4=85  3%  turbostat.C1E%
>    1161078           +64.5%    1909611        turbostat.C6
>      44.25           +31.8       76.10        turbostat.C6%
>       0.18           -33.3%       0.12        turbostat.IPC
>   74338573 =C4=85  2%     -33.9%   49159610 =C4=85  4%  turbostat.IRQ
>    1381661           -91.0%     124075 =C4=85  6%  turbostat.POLL
>       0.26            -0.2        0.04 =C4=85 12%  turbostat.POLL%
>      96.15            -5.4%      90.95        turbostat.PkgWatt
>      12.12           +19.3%      14.46        turbostat.RAMWatt
>     119573           -61.5%      46012 =C4=85  3%  proc-vmstat.nr_active_=
anon
>     106168          +195.8%     314047 =C4=85 10%  proc-vmstat.nr_anon_pa=
ges
>      28.60 =C4=85 17%   +1538.5%     468.68 =C4=85 14%  proc-vmstat.nr_an=
on_transparent_hugepages
>     923365           -13.0%     803489        proc-vmstat.nr_file_pages
>     165571          +113.5%     353493 =C4=85  9%  proc-vmstat.nr_inactiv=
e_anon
>      45605           -50.2%      22690        proc-vmstat.nr_mapped
>       1752           +47.1%       2578 =C4=85  4%  proc-vmstat.nr_page_ta=
ble_pages
>     179613           -66.7%      59728 =C4=85  3%  proc-vmstat.nr_shmem
>      21490            -2.4%      20981        proc-vmstat.nr_slab_reclaim=
able
>      28260            -7.3%      26208        proc-vmstat.nr_slab_unrecla=
imable
>     119573           -61.5%      46012 =C4=85  3%  proc-vmstat.nr_zone_ac=
tive_anon
>     165570          +113.5%     353492 =C4=85  9%  proc-vmstat.nr_zone_in=
active_anon
>   17343640           -76.3%    4116748 =C4=85  4%  proc-vmstat.numa_hit
>   17364975           -76.3%    4118098 =C4=85  4%  proc-vmstat.numa_local
>     249252           -66.2%      84187 =C4=85  2%  proc-vmstat.pgactivate
>   27528916          +567.1%  1.836e+08 =C4=85  5%  proc-vmstat.pgalloc_no=
rmal
>    4912427           -79.2%    1019949 =C4=85  3%  proc-vmstat.pgfault
>   27227124          +574.1%  1.835e+08 =C4=85  5%  proc-vmstat.pgfree
>       8728         +3896.4%     348802 =C4=85  5%  proc-vmstat.thp_deferr=
ed_split_page
>       8730         +3895.3%     348814 =C4=85  5%  proc-vmstat.thp_fault_=
alloc
>       8728         +3896.4%     348802 =C4=85  5%  proc-vmstat.thp_split_=
pmd
>     316745           -21.5%     248756 =C4=85  4%  sched_debug.cfs_rq:/.a=
vg_vruntime.avg
>     112735 =C4=85  4%     -34.3%      74061 =C4=85  6%  sched_debug.cfs_r=
q:/.avg_vruntime.min
>       0.49 =C4=85  6%     -17.2%       0.41 =C4=85  8%  sched_debug.cfs_r=
q:/.h_nr_running.stddev
>      12143 =C4=85120%     -99.9%      15.70 =C4=85116%  sched_debug.cfs_r=
q:/.left_vruntime.avg
>     414017 =C4=85126%     -99.9%     428.50 =C4=85102%  sched_debug.cfs_r=
q:/.left_vruntime.max
>      68492 =C4=85125%     -99.9%      78.15 =C4=85106%  sched_debug.cfs_r=
q:/.left_vruntime.stddev
>      41917 =C4=85 24%     -48.3%      21690 =C4=85 57%  sched_debug.cfs_r=
q:/.load.avg
>     176151 =C4=85 30%     -56.9%      75963 =C4=85 57%  sched_debug.cfs_r=
q:/.load.stddev
>       6489 =C4=85 17%     -29.0%       4608 =C4=85 12%  sched_debug.cfs_r=
q:/.load_avg.max
>       4.42 =C4=85 45%     -81.1%       0.83 =C4=85 74%  sched_debug.cfs_r=
q:/.load_avg.min
>       1112 =C4=85 17%     -31.0%     767.62 =C4=85 11%  sched_debug.cfs_r=
q:/.load_avg.stddev
>     316745           -21.5%     248756 =C4=85  4%  sched_debug.cfs_rq:/.m=
in_vruntime.avg
>     112735 =C4=85  4%     -34.3%      74061 =C4=85  6%  sched_debug.cfs_r=
q:/.min_vruntime.min
>       0.49 =C4=85  6%     -17.2%       0.41 =C4=85  8%  sched_debug.cfs_r=
q:/.nr_running.stddev
>      12144 =C4=85120%     -99.9%      15.70 =C4=85116%  sched_debug.cfs_r=
q:/.right_vruntime.avg
>     414017 =C4=85126%     -99.9%     428.50 =C4=85102%  sched_debug.cfs_r=
q:/.right_vruntime.max
>      68492 =C4=85125%     -99.9%      78.15 =C4=85106%  sched_debug.cfs_r=
q:/.right_vruntime.stddev
>      14.25 =C4=85 44%     -76.6%       3.33 =C4=85 58%  sched_debug.cfs_r=
q:/.runnable_avg.min
>      11.58 =C4=85 49%     -77.7%       2.58 =C4=85 58%  sched_debug.cfs_r=
q:/.util_avg.min
>     423972 =C4=85 23%     +59.3%     675379 =C4=85  3%  sched_debug.cpu.a=
vg_idle.avg
>       5720 =C4=85 43%    +439.5%      30864        sched_debug.cpu.avg_id=
le.min
>      99.79 =C4=85  2%     -23.7%      76.11 =C4=85  2%  sched_debug.cpu.c=
lock_task.stddev
>     162475 =C4=85 49%     -95.8%       6813 =C4=85 26%  sched_debug.cpu.c=
urr->pid.avg
>    1061268           -84.0%     170212 =C4=85  4%  sched_debug.cpu.curr->=
pid.max
>     365404 =C4=85 20%     -91.3%      31839 =C4=85 10%  sched_debug.cpu.c=
urr->pid.stddev
>       0.51 =C4=85  3%     -20.1%       0.41 =C4=85  9%  sched_debug.cpu.n=
r_running.stddev
>     311923           -74.2%      80615 =C4=85  2%  sched_debug.cpu.nr_swi=
tches.avg
>     565973 =C4=85  4%     -77.8%     125597 =C4=85 10%  sched_debug.cpu.n=
r_switches.max
>     192666 =C4=85  4%     -70.6%      56695 =C4=85  6%  sched_debug.cpu.n=
r_switches.min
>      67485 =C4=85  8%     -79.9%      13558 =C4=85 10%  sched_debug.cpu.n=
r_switches.stddev
>       2.62          +102.1%       5.30        perf-stat.i.MPKI
>   2.09e+09           -47.6%  1.095e+09 =C4=85  4%  perf-stat.i.branch-ins=
tructions
>       1.56            -0.5        1.01        perf-stat.i.branch-miss-rat=
e%
>   31951200           -60.9%   12481432 =C4=85  2%  perf-stat.i.branch-mis=
ses
>      19.38           +23.7       43.08        perf-stat.i.cache-miss-rate=
%
>   26413597            -5.7%   24899132 =C4=85  4%  perf-stat.i.cache-miss=
es
>  1.363e+08           -58.3%   56906133 =C4=85  4%  perf-stat.i.cache-refe=
rences
>     370628           -75.8%      89743 =C4=85  3%  perf-stat.i.context-sw=
itches
>       1.77           +65.1%       2.92 =C4=85  2%  perf-stat.i.cpi
>  1.748e+10           -21.8%  1.367e+10 =C4=85  2%  perf-stat.i.cpu-cycles
>      61611           -79.1%      12901 =C4=85  6%  perf-stat.i.cpu-migrat=
ions
>     716.97 =C4=85  2%     -17.2%     593.35 =C4=85  2%  perf-stat.i.cycle=
s-between-cache-misses
>       0.12 =C4=85  4%      -0.1        0.05        perf-stat.i.dTLB-load-=
miss-rate%
>    3066100 =C4=85  3%     -81.3%     573066 =C4=85  5%  perf-stat.i.dTLB-=
load-misses
>  2.652e+09           -50.1%  1.324e+09 =C4=85  4%  perf-stat.i.dTLB-loads
>       0.08 =C4=85  2%      -0.0        0.03        perf-stat.i.dTLB-store=
-miss-rate%
>    1168195 =C4=85  2%     -82.9%     199438 =C4=85  5%  perf-stat.i.dTLB-=
store-misses
>  1.478e+09           -56.8%  6.384e+08 =C4=85  3%  perf-stat.i.dTLB-store=
s
>    8080423           -73.2%    2169371 =C4=85  3%  perf-stat.i.iTLB-load-=
misses
>    5601321           -74.3%    1440571 =C4=85  2%  perf-stat.i.iTLB-loads
>  1.028e+10           -49.7%  5.173e+09 =C4=85  4%  perf-stat.i.instructio=
ns
>       1450           +73.1%       2511 =C4=85  2%  perf-stat.i.instructio=
ns-per-iTLB-miss
>       0.61           -35.9%       0.39        perf-stat.i.ipc
>       0.48           -21.4%       0.38 =C4=85  2%  perf-stat.i.metric.GHz
>     616.28           -17.6%     507.69 =C4=85  4%  perf-stat.i.metric.K/s=
ec
>     175.16           -50.8%      86.18 =C4=85  4%  perf-stat.i.metric.M/s=
ec
>      76728           -80.8%      14724 =C4=85  4%  perf-stat.i.minor-faul=
ts
>    5600408           -61.4%    2160997 =C4=85  5%  perf-stat.i.node-loads
>    8873996           +52.1%   13499744 =C4=85  5%  perf-stat.i.node-store=
s
>     112409           -81.9%      20305 =C4=85  4%  perf-stat.i.page-fault=
s
>       2.55           +89.6%       4.83        perf-stat.overall.MPKI

Much more TLB misses.

>       1.51            -0.4        1.13        perf-stat.overall.branch-mi=
ss-rate%
>      19.26           +24.5       43.71        perf-stat.overall.cache-mis=
s-rate%
>       1.70           +56.4%       2.65        perf-stat.overall.cpi
>     665.84           -17.5%     549.51 =C4=85  2%  perf-stat.overall.cycl=
es-between-cache-misses
>       0.12 =C4=85  4%      -0.1        0.04        perf-stat.overall.dTLB=
-load-miss-rate%
>       0.08 =C4=85  2%      -0.0        0.03        perf-stat.overall.dTLB=
-store-miss-rate%
>      59.16            +0.9       60.04        perf-stat.overall.iTLB-load=
-miss-rate%
>       1278           +86.1%       2379 =C4=85  2%  perf-stat.overall.inst=
ructions-per-iTLB-miss
>       0.59           -36.1%       0.38        perf-stat.overall.ipc

Worse IPC and CPI.

>  2.078e+09           -48.3%  1.074e+09 =C4=85  4%  perf-stat.ps.branch-in=
structions
>   31292687           -61.2%   12133349 =C4=85  2%  perf-stat.ps.branch-mi=
sses
>   26057291            -5.9%   24512034 =C4=85  4%  perf-stat.ps.cache-mis=
ses
>  1.353e+08           -58.6%   56072195 =C4=85  4%  perf-stat.ps.cache-ref=
erences
>     365254           -75.8%      88464 =C4=85  3%  perf-stat.ps.context-s=
witches
>  1.735e+10           -22.4%  1.346e+10 =C4=85  2%  perf-stat.ps.cpu-cycle=
s
>      60838           -79.1%      12727 =C4=85  6%  perf-stat.ps.cpu-migra=
tions
>    3056601 =C4=85  4%     -81.5%     565354 =C4=85  4%  perf-stat.ps.dTLB=
-load-misses
>  2.636e+09           -50.7%    1.3e+09 =C4=85  4%  perf-stat.ps.dTLB-load=
s
>    1155253 =C4=85  2%     -83.0%     196581 =C4=85  5%  perf-stat.ps.dTLB=
-store-misses
>  1.473e+09           -57.4%  6.268e+08 =C4=85  3%  perf-stat.ps.dTLB-stor=
es
>    7997726           -73.3%    2131477 =C4=85  3%  perf-stat.ps.iTLB-load=
-misses
>    5521346           -74.3%    1418623 =C4=85  2%  perf-stat.ps.iTLB-load=
s
>  1.023e+10           -50.4%  5.073e+09 =C4=85  4%  perf-stat.ps.instructi=
ons
>      75671           -80.9%      14479 =C4=85  4%  perf-stat.ps.minor-fau=
lts
>    5549722           -61.4%    2141750 =C4=85  4%  perf-stat.ps.node-load=
s
>    8769156           +51.6%   13296579 =C4=85  5%  perf-stat.ps.node-stor=
es
>     110795           -82.0%      19977 =C4=85  4%  perf-stat.ps.page-faul=
ts
>  6.482e+11           -50.7%  3.197e+11 =C4=85  4%  perf-stat.total.instru=
ctions
>       0.00 =C4=85 37%    -100.0%       0.00        perf-sched.sch_delay.a=
vg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_sla=
b_cgroups.allocate_slab
>       0.01 =C4=85 18%   +8373.1%       0.73 =C4=85 49%  perf-sched.sch_de=
lay.avg.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall=
_64
>       0.01 =C4=85 16%   +4600.0%       0.38 =C4=85 24%  perf-sched.sch_de=
lay.avg.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit

More time spent in madvise and munmap. but I'm not sure whether this
is caused by tearing down the address space when exiting the test. If
so it should not count in the regression.

>       0.01 =C4=85204%    -100.0%       0.00        perf-sched.sch_delay.a=
vg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munm=
ap
>       0.01 =C4=85  8%   +3678.9%       0.36 =C4=85 79%  perf-sched.sch_de=
lay.avg.ms.__cond_resched.exit_signals.do_exit.__x64_sys_exit.do_syscall_64
>       0.01 =C4=85 14%     -38.5%       0.00        perf-sched.sch_delay.a=
vg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_e=
mpty_file
>       0.01 =C4=85  5%   +2946.2%       0.26 =C4=85 43%  perf-sched.sch_de=
lay.avg.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exi=
t_mm
>       0.00 =C4=85 14%    +125.0%       0.01 =C4=85 12%  perf-sched.sch_de=
lay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_=
fork_asm
>       0.02 =C4=85170%     -83.0%       0.00        perf-sched.sch_delay.a=
vg.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>       0.00 =C4=85 69%   +6578.6%       0.31 =C4=85  4%  perf-sched.sch_de=
lay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_ran=
ge_single.madvise_vma_behavior
>       0.00          +100.0%       0.00        perf-sched.sch_delay.avg.ms=
.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
>       0.02 =C4=85 86%   +4234.4%       0.65 =C4=85  4%  perf-sched.sch_de=
lay.avg.ms.__cond_resched.zap_page_range_single.madvise_vma_behavior.do_mad=
vise.__x64_sys_madvise
>       0.01 =C4=85  6%   +6054.3%       0.47        perf-sched.sch_delay.a=
vg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
>       0.00 =C4=85 14%    +195.2%       0.01 =C4=85 89%  perf-sched.sch_de=
lay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[un=
known]
>       0.00 =C4=85102%    +340.0%       0.01 =C4=85 85%  perf-sched.sch_de=
lay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
>       0.00          +100.0%       0.00        perf-sched.sch_delay.avg.ms=
.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
>       0.00 =C4=85 11%     +66.7%       0.01 =C4=85 21%  perf-sched.sch_de=
lay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>       0.01 =C4=85 89%   +1096.1%       0.15 =C4=85 30%  perf-sched.sch_de=
lay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_t=
o_user_mode.asm_sysvec_reschedule_ipi
>       0.00          +141.7%       0.01 =C4=85 61%  perf-sched.sch_delay.a=
vg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
>       0.00 =C4=85223%   +9975.0%       0.07 =C4=85203%  perf-sched.sch_de=
lay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_se=
lect
>       0.00 =C4=85 10%    +789.3%       0.04 =C4=85 69%  perf-sched.sch_de=
lay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_e=
poll_wait
>       0.00 =C4=85 31%   +6691.3%       0.26 =C4=85  5%  perf-sched.sch_de=
lay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_=
madvise
>       0.00 =C4=85 28%  +14612.5%       0.59 =C4=85  4%  perf-sched.sch_de=
lay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exi=
t_mm
>       0.00 =C4=85 24%   +4904.2%       0.20 =C4=85  4%  perf-sched.sch_de=
lay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_kil=
lable.lock_mm_and_find_vma
>       0.00 =C4=85 28%    +450.0%       0.01 =C4=85 74%  perf-sched.sch_de=
lay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_k=
illable.__vm_munmap
>       0.00 =C4=85 17%    +984.6%       0.02 =C4=85 79%  perf-sched.sch_de=
lay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.ker=
nel_clone
>       0.00 =C4=85 20%    +231.8%       0.01 =C4=85 89%  perf-sched.sch_de=
lay.avg.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.submit_bi=
o_wait
>       0.00          +350.0%       0.01 =C4=85 16%  perf-sched.sch_delay.a=
vg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>       0.02 =C4=85 16%    +320.2%       0.07 =C4=85  2%  perf-sched.sch_de=
lay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       0.02 =C4=85  2%    +282.1%       0.09 =C4=85  5%  perf-sched.sch_de=
lay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       0.00 =C4=85 14%    -100.0%       0.00        perf-sched.sch_delay.m=
ax.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_sla=
b_cgroups.allocate_slab
>       0.05 =C4=85 35%   +3784.5%       1.92 =C4=85 16%  perf-sched.sch_de=
lay.max.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall=
_64
>       0.29 =C4=85128%    +563.3%       1.92 =C4=85  7%  perf-sched.sch_de=
lay.max.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
>       0.14 =C4=85217%     -99.7%       0.00 =C4=85223%  perf-sched.sch_de=
lay.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm=
_munmap
>       0.03 =C4=85 49%     -74.0%       0.01 =C4=85 51%  perf-sched.sch_de=
lay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>       0.01 =C4=85 54%     -57.4%       0.00 =C4=85 75%  perf-sched.sch_de=
lay.max.ms.__cond_resched.dput.__ns_get_path.ns_get_path.proc_ns_get_link
>       0.12 =C4=85 21%    +873.0%       1.19 =C4=85 60%  perf-sched.sch_de=
lay.max.ms.__cond_resched.exit_signals.do_exit.__x64_sys_exit.do_syscall_64
>       2.27 =C4=85220%     -99.7%       0.01 =C4=85 19%  perf-sched.sch_de=
lay.max.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_sys_s=
etns.do_syscall_64
>       0.02 =C4=85 36%     -54.4%       0.01 =C4=85 55%  perf-sched.sch_de=
lay.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
>       0.04 =C4=85 36%     -77.1%       0.01 =C4=85 31%  perf-sched.sch_de=
lay.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.al=
loc_empty_file
>       0.12 =C4=85 32%   +1235.8%       1.58 =C4=85 31%  perf-sched.sch_de=
lay.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exi=
t_mm
>       2.25 =C4=85218%     -99.3%       0.02 =C4=85 52%  perf-sched.sch_de=
lay.max.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
>       0.01 =C4=85 85%  +19836.4%       2.56 =C4=85  7%  perf-sched.sch_de=
lay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_ran=
ge_single.madvise_vma_behavior
>       0.03 =C4=85 70%     -93.6%       0.00 =C4=85223%  perf-sched.sch_de=
lay.max.ms.__cond_resched.unmap_page_range.zap_page_range_single.madvise_vm=
a_behavior.do_madvise
>       0.10 =C4=85 16%   +2984.2%       3.21 =C4=85  6%  perf-sched.sch_de=
lay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
>       0.01 =C4=85 20%    +883.9%       0.05 =C4=85177%  perf-sched.sch_de=
lay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[un=
known]
>       0.01 =C4=85 15%    +694.7%       0.08 =C4=85123%  perf-sched.sch_de=
lay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>       0.00 =C4=85223%   +6966.7%       0.07 =C4=85199%  perf-sched.sch_de=
lay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_se=
lect
>       0.01 =C4=85 38%   +8384.6%       0.55 =C4=85 72%  perf-sched.sch_de=
lay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.ker=
nel_clone
>       0.01 =C4=85 13%  +12995.7%       1.51 =C4=85103%  perf-sched.sch_de=
lay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>     117.80 =C4=85 56%     -96.4%       4.26 =C4=85 36%  perf-sched.sch_de=
lay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       0.01 =C4=85 68%    +331.9%       0.03        perf-sched.total_sch_d=
elay.average.ms
>       4.14          +242.6%      14.20 =C4=85  4%  perf-sched.total_wait_=
and_delay.average.ms
>     700841           -69.6%     212977 =C4=85  3%  perf-sched.total_wait_=
and_delay.count.ms
>       4.14          +242.4%      14.16 =C4=85  4%  perf-sched.total_wait_=
time.average.ms
>      11.68 =C4=85  8%    +213.3%      36.59 =C4=85 28%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.apparmor_file_alloc_security.security_file_a=
lloc.init_file.alloc_empty_file
>      10.00 =C4=85  2%    +226.1%      32.62 =C4=85 20%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
>      10.55 =C4=85  3%    +259.8%      37.96 =C4=85  7%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
>       9.80 =C4=85 12%    +196.5%      29.07 =C4=85 32%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.dput.pick_link.step_into.open_last_lookups
>       9.80 =C4=85  4%    +234.9%      32.83 =C4=85 14%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
>      10.32 =C4=85  2%    +223.8%      33.42 =C4=85  6%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_opena=
t.do_filp_open
>       8.15 =C4=85 14%    +271.3%      30.25 =C4=85 35%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_=
sys_setns.do_syscall_64
>       9.60 =C4=85  4%    +240.8%      32.73 =C4=85 16%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
>      10.37 =C4=85  4%    +232.0%      34.41 =C4=85 10%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_fi=
le.alloc_empty_file
>       7.32 =C4=85 46%    +269.7%      27.07 =C4=85 49%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_=
folio.shmem_get_folio_gfp.shmem_write_begin
>       9.88          +236.2%      33.23 =C4=85  4%  perf-sched.wait_and_de=
lay.avg.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_=
lru
>       4.44 =C4=85  4%    +379.0%      21.27 =C4=85 18%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_=
from_fork_asm
>      10.05 =C4=85  2%    +235.6%      33.73 =C4=85 11%  perf-sched.wait_a=
nd_delay.avg.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
>       0.03          +462.6%       0.15 =C4=85  6%  perf-sched.wait_and_de=
lay.avg.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>       6.78 =C4=85  4%    +482.1%      39.46 =C4=85  3%  perf-sched.wait_a=
nd_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_ex=
it_to_user_mode.do_syscall_64
>       3.17          +683.3%      24.85 =C4=85  8%  perf-sched.wait_and_de=
lay.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
>      36.64 =C4=85 13%    +244.7%     126.32 =C4=85  6%  perf-sched.wait_a=
nd_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_p=
oll
>       9.81          +302.4%      39.47 =C4=85  4%  perf-sched.wait_and_de=
lay.avg.ms.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigt=
imedwait.do_syscall_64
>       1.05           +48.2%       1.56        perf-sched.wait_and_delay.a=
vg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_madvi=
se
>       0.93           +14.2%       1.06 =C4=85  2%  perf-sched.wait_and_de=
lay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_kil=
lable.lock_mm_and_find_vma
>       9.93          -100.0%       0.00        perf-sched.wait_and_delay.a=
vg.ms.schedule_timeout.ext4_lazyinit_thread.part.0.kthread
>      12.02 =C4=85  3%    +139.8%      28.83 =C4=85  6%  perf-sched.wait_a=
nd_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       6.09 =C4=85  2%    +403.0%      30.64 =C4=85  5%  perf-sched.wait_a=
nd_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      23.17 =C4=85 19%     -83.5%       3.83 =C4=85143%  perf-sched.wait_a=
nd_delay.count.__cond_resched.__alloc_pages.alloc_pages_mpol.shmem_alloc_fo=
lio.shmem_alloc_and_add_folio
>      79.83 =C4=85  9%     -55.1%      35.83 =C4=85 16%  perf-sched.wait_a=
nd_delay.count.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
>      14.83 =C4=85 14%     -59.6%       6.00 =C4=85 56%  perf-sched.wait_a=
nd_delay.count.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>       8.50 =C4=85 17%     -80.4%       1.67 =C4=85 89%  perf-sched.wait_a=
nd_delay.count.__cond_resched.dput.__ns_get_path.ns_get_path.proc_ns_get_li=
nk
>     114.00 =C4=85 14%     -62.4%      42.83 =C4=85 11%  perf-sched.wait_a=
nd_delay.count.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
>      94.67 =C4=85  7%     -48.1%      49.17 =C4=85 13%  perf-sched.wait_a=
nd_delay.count.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
>      59.83 =C4=85 13%     -76.0%      14.33 =C4=85 48%  perf-sched.wait_a=
nd_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.v=
fs_write.ksys_write
>     103.00 =C4=85 12%     -48.1%      53.50 =C4=85 20%  perf-sched.wait_a=
nd_delay.count.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat=
.do_filp_open
>      19.33 =C4=85 16%     -56.0%       8.50 =C4=85 29%  perf-sched.wait_a=
nd_delay.count.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_s=
ys_setns.do_syscall_64
>      68.17 =C4=85 11%     -39.1%      41.50 =C4=85 19%  perf-sched.wait_a=
nd_delay.count.__cond_resched.kmem_cache_alloc.security_file_alloc.init_fil=
e.alloc_empty_file
>      36.67 =C4=85 22%     -79.1%       7.67 =C4=85 46%  perf-sched.wait_a=
nd_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
>     465.50 =C4=85  9%     -47.4%     244.83 =C4=85 11%  perf-sched.wait_a=
nd_delay.count.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_al=
loc_lru
>      14492 =C4=85  3%     -96.3%     533.67 =C4=85 10%  perf-sched.wait_a=
nd_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_f=
rom_fork_asm
>     128.67 =C4=85  7%     -53.5%      59.83 =C4=85 10%  perf-sched.wait_a=
nd_delay.count.__cond_resched.switch_task_namespaces.__do_sys_setns.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe
>       7.67 =C4=85 34%     -80.4%       1.50 =C4=85107%  perf-sched.wait_a=
nd_delay.count.__cond_resched.vunmap_p4d_range.__vunmap_range_noflush.remov=
e_vm_area.vfree
>     147533           -81.0%      28023 =C4=85  5%  perf-sched.wait_and_de=
lay.count.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
>       4394 =C4=85  4%     -78.5%     942.83 =C4=85  7%  perf-sched.wait_a=
nd_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exi=
t_to_user_mode.do_syscall_64
>     228791           -79.3%      47383 =C4=85  4%  perf-sched.wait_and_de=
lay.count.futex_wait_queue.__futex_wait.futex_wait.do_futex
>     368.50 =C4=85  2%     -67.1%     121.33 =C4=85  3%  perf-sched.wait_a=
nd_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_po=
ll
>     147506           -81.0%      28010 =C4=85  5%  perf-sched.wait_and_de=
lay.count.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigti=
medwait.do_syscall_64
>       5387 =C4=85  6%     -16.7%       4488 =C4=85  5%  perf-sched.wait_a=
nd_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read=
.do_madvise
>       8303 =C4=85  2%     -56.9%       3579 =C4=85  5%  perf-sched.wait_a=
nd_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read=
_killable.lock_mm_and_find_vma
>      14.67 =C4=85  7%    -100.0%       0.00        perf-sched.wait_and_de=
lay.count.schedule_timeout.ext4_lazyinit_thread.part.0.kthread
>     370.50 =C4=85141%    +221.9%       1192 =C4=85  5%  perf-sched.wait_a=
nd_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>      24395 =C4=85  2%     -51.2%      11914 =C4=85  6%  perf-sched.wait_a=
nd_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>      31053 =C4=85  2%     -80.5%       6047 =C4=85  5%  perf-sched.wait_a=
nd_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      16.41 =C4=85  2%    +342.7%      72.65 =C4=85 29%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.apparmor_file_alloc_security.security_file_a=
lloc.init_file.alloc_empty_file
>      16.49 =C4=85  3%    +463.3%      92.90 =C4=85 27%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
>      17.32 =C4=85  5%    +520.9%     107.52 =C4=85 14%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
>      15.38 =C4=85  6%    +325.2%      65.41 =C4=85 22%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.dput.pick_link.step_into.open_last_lookups
>      16.73 =C4=85  4%    +456.2%      93.04 =C4=85 11%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
>      17.14 =C4=85  3%    +510.6%     104.68 =C4=85 14%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_opena=
t.do_filp_open
>      15.70 =C4=85  4%    +379.4%      75.25 =C4=85 28%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_=
sys_setns.do_syscall_64
>      15.70 =C4=85  3%    +422.1%      81.97 =C4=85 19%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
>      16.38          +528.4%     102.91 =C4=85 21%  perf-sched.wait_and_de=
lay.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.al=
loc_empty_file
>      45.20 =C4=85 48%    +166.0%     120.23 =C4=85 27%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_=
folio.shmem_get_folio_gfp.shmem_write_begin
>      17.25          +495.5%     102.71 =C4=85  2%  perf-sched.wait_and_de=
lay.max.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_=
lru
>     402.57 =C4=85 15%     -52.8%     189.90 =C4=85 14%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_=
from_fork_asm
>      16.96 =C4=85  4%    +521.3%     105.40 =C4=85 15%  perf-sched.wait_a=
nd_delay.max.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
>      28.45          +517.3%     175.65 =C4=85 14%  perf-sched.wait_and_de=
lay.max.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>      22.49          +628.5%     163.83 =C4=85 16%  perf-sched.wait_and_de=
lay.max.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
>      26.53 =C4=85 30%    +326.9%     113.25 =C4=85 16%  perf-sched.wait_a=
nd_delay.max.ms.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt=
_sigtimedwait.do_syscall_64
>      15.54          -100.0%       0.00        perf-sched.wait_and_delay.m=
ax.ms.schedule_timeout.ext4_lazyinit_thread.part.0.kthread
>       1.67 =C4=85141%    +284.6%       6.44 =C4=85  4%  perf-sched.wait_a=
nd_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>       0.07 =C4=85 34%     -93.6%       0.00 =C4=85105%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.pte_alloc_one.__pt=
e_alloc
>      10.21 =C4=85 15%    +295.8%      40.43 =C4=85 50%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.__fput.__x64_sys_close.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>       3.89 =C4=85 40%     -99.8%       0.01 =C4=85113%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_allo=
c_slab_cgroups.allocate_slab
>      11.67 =C4=85  8%    +213.5%      36.58 =C4=85 28%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.=
init_file.alloc_empty_file
>       9.98 =C4=85  2%    +226.8%      32.61 =C4=85 20%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
>       1.03           +71.2%       1.77 =C4=85 20%  perf-sched.wait_time.a=
vg.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall_64
>       0.06 =C4=85 79%    -100.0%       0.00        perf-sched.wait_time.a=
vg.ms.__cond_resched.down_write.__split_vma.vma_modify.mprotect_fixup
>       0.05 =C4=85 22%    -100.0%       0.00        perf-sched.wait_time.a=
vg.ms.__cond_resched.down_write.vma_expand.mmap_region.do_mmap
>       0.08 =C4=85 82%     -98.2%       0.00 =C4=85223%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.e=
ntry_SYSCALL_64_after_hwframe
>      10.72 =C4=85 10%    +166.9%      28.61 =C4=85 29%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
>      10.53 =C4=85  3%    +260.5%      37.95 =C4=85  7%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
>       9.80 =C4=85 12%    +196.6%      29.06 =C4=85 32%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.dput.pick_link.step_into.open_last_lookups
>       9.80 =C4=85  4%    +235.1%      32.82 =C4=85 14%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
>       9.50 =C4=85 12%    +281.9%      36.27 =C4=85 70%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_w=
rite.ksys_write
>      10.31 =C4=85  2%    +223.9%      33.40 =C4=85  6%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_=
filp_open
>       8.04 =C4=85 15%    +276.1%      30.25 =C4=85 35%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_sys_s=
etns.do_syscall_64
>       9.60 =C4=85  4%    +240.9%      32.72 =C4=85 16%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
>       0.06 =C4=85 66%     -98.3%       0.00 =C4=85223%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.=
__split_vma
>      10.36 =C4=85  4%    +232.1%      34.41 =C4=85 10%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.al=
loc_empty_file
>       0.08 =C4=85 50%     -95.7%       0.00 =C4=85100%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.vma_modi=
fy
>       0.01 =C4=85 49%    -100.0%       0.00        perf-sched.wait_time.a=
vg.ms.__cond_resched.kmem_cache_alloc_node.alloc_vmap_area.__get_vm_area_no=
de.__vmalloc_node_range
>       0.03 =C4=85 73%     -87.4%       0.00 =C4=85145%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.kmem_cache_alloc_node.dup_task_struct.copy_proces=
s.kernel_clone
>       8.01 =C4=85 25%    +238.0%      27.07 =C4=85 49%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio=
.shmem_get_folio_gfp.shmem_write_begin
>       9.86          +237.0%      33.23 =C4=85  4%  perf-sched.wait_time.a=
vg.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
>       4.44 =C4=85  4%    +379.2%      21.26 =C4=85 18%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_=
fork_asm
>      10.03          +236.3%      33.73 =C4=85 11%  perf-sched.wait_time.a=
vg.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>       0.97 =C4=85  8%     -87.8%       0.12 =C4=85221%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.unmap_page_range.zap_page_range_single.madvise_vm=
a_behavior.do_madvise
>       0.02 =C4=85 13%   +1846.8%       0.45 =C4=85 11%  perf-sched.wait_t=
ime.avg.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vm=
i_munmap
>       1.01           +64.7%       1.66        perf-sched.wait_time.avg.ms=
.__cond_resched.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64=
_sys_madvise
>       0.75 =C4=85  4%    +852.1%       7.10 =C4=85  5%  perf-sched.wait_t=
ime.avg.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.[unknown]
>       0.03          +462.6%       0.15 =C4=85  6%  perf-sched.wait_time.a=
vg.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>       0.24 =C4=85  4%     +25.3%       0.30 =C4=85  8%  perf-sched.wait_t=
ime.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>       1.98 =C4=85 15%    +595.7%      13.80 =C4=85 90%  perf-sched.wait_t=
ime.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_t=
o_user_mode.asm_sysvec_apic_timer_interrupt
>       2.78 =C4=85 14%    +444.7%      15.12 =C4=85 16%  perf-sched.wait_t=
ime.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_t=
o_user_mode.asm_sysvec_call_function
>       6.77 =C4=85  4%    +483.0%      39.44 =C4=85  3%  perf-sched.wait_t=
ime.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to=
_user_mode.do_syscall_64
>       3.17          +684.7%      24.85 =C4=85  8%  perf-sched.wait_time.a=
vg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
>      36.64 =C4=85 13%    +244.7%     126.32 =C4=85  6%  perf-sched.wait_t=
ime.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
>       9.79          +303.0%      39.45 =C4=85  4%  perf-sched.wait_time.a=
vg.ms.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigtimedw=
ait.do_syscall_64
>       1.05           +23.8%       1.30        perf-sched.wait_time.avg.ms=
.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_madvise
>       0.86          +101.2%       1.73 =C4=85  3%  perf-sched.wait_time.a=
vg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
>       0.11 =C4=85 21%    +438.9%       0.61 =C4=85 15%  perf-sched.wait_t=
ime.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_k=
illable.__vm_munmap
>       0.32 =C4=85  4%     +28.5%       0.41 =C4=85 13%  perf-sched.wait_t=
ime.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.ker=
nel_clone
>      12.00 =C4=85  3%    +139.6%      28.76 =C4=85  6%  perf-sched.wait_t=
ime.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       6.07 =C4=85  2%    +403.5%      30.56 =C4=85  5%  perf-sched.wait_t=
ime.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       0.38 =C4=85 41%     -98.8%       0.00 =C4=85105%  perf-sched.wait_t=
ime.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.pte_alloc_one.__pt=
e_alloc
>       0.36 =C4=85 34%     -84.3%       0.06 =C4=85200%  perf-sched.wait_t=
ime.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.vma_alloc_folio.do=
_anonymous_page
>       0.36 =C4=85 51%     -92.9%       0.03 =C4=85114%  perf-sched.wait_t=
ime.max.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_=
fault.handle_mm_fault
>      15.98 =C4=85  5%    +361.7%      73.80 =C4=85 23%  perf-sched.wait_t=
ime.max.ms.__cond_resched.__fput.__x64_sys_close.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>       0.51 =C4=85 14%     -92.8%       0.04 =C4=85196%  perf-sched.wait_t=
ime.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.__vmalloc_=
area_node.__vmalloc_node_range
>       8.56 =C4=85 11%     -99.9%       0.01 =C4=85126%  perf-sched.wait_t=
ime.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_allo=
c_slab_cgroups.allocate_slab
>       0.43 =C4=85 32%     -68.2%       0.14 =C4=85119%  perf-sched.wait_t=
ime.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_node_trace.__get_=
vm_area_node.__vmalloc_node_range
>       0.46 =C4=85 20%     -89.3%       0.05 =C4=85184%  perf-sched.wait_t=
ime.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_th=
read_stack_node.dup_task_struct
>      16.40 =C4=85  2%    +342.9%      72.65 =C4=85 29%  perf-sched.wait_t=
ime.max.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.=
init_file.alloc_empty_file
>       0.31 =C4=85 63%     -76.2%       0.07 =C4=85169%  perf-sched.wait_t=
ime.max.ms.__cond_resched.cgroup_css_set_fork.cgroup_can_fork.copy_process.=
kernel_clone
>       0.14 =C4=85 93%    +258.7%       0.49 =C4=85 14%  perf-sched.wait_t=
ime.max.ms.__cond_resched.clear_huge_page.__do_huge_pmd_anonymous_page.__ha=
ndle_mm_fault.handle_mm_fault
>      16.49 =C4=85  3%    +463.5%      92.89 =C4=85 27%  perf-sched.wait_t=
ime.max.ms.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
>       1.09          +171.0%       2.96 =C4=85 10%  perf-sched.wait_time.m=
ax.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall_64
>       1.16 =C4=85  7%    +155.1%       2.97 =C4=85  4%  perf-sched.wait_t=
ime.max.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
>       0.19 =C4=85 78%    -100.0%       0.00        perf-sched.wait_time.m=
ax.ms.__cond_resched.down_write.__split_vma.vma_modify.mprotect_fixup
>       0.33 =C4=85 35%    -100.0%       0.00        perf-sched.wait_time.m=
ax.ms.__cond_resched.down_write.vma_expand.mmap_region.do_mmap
>       0.20 =C4=85101%     -99.3%       0.00 =C4=85223%  perf-sched.wait_t=
ime.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.e=
ntry_SYSCALL_64_after_hwframe
>      17.31 =C4=85  5%    +521.0%     107.51 =C4=85 14%  perf-sched.wait_t=
ime.max.ms.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
>      15.38 =C4=85  6%    +325.3%      65.40 =C4=85 22%  perf-sched.wait_t=
ime.max.ms.__cond_resched.dput.pick_link.step_into.open_last_lookups
>      16.72 =C4=85  4%    +456.6%      93.04 =C4=85 11%  perf-sched.wait_t=
ime.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
>       1.16 =C4=85  2%     +88.7%       2.20 =C4=85 33%  perf-sched.wait_t=
ime.max.ms.__cond_resched.exit_signals.do_exit.__x64_sys_exit.do_syscall_64
>      53.96 =C4=85 32%    +444.0%     293.53 =C4=85109%  perf-sched.wait_t=
ime.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_w=
rite.ksys_write
>      17.13 =C4=85  2%    +511.2%     104.68 =C4=85 14%  perf-sched.wait_t=
ime.max.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_=
filp_open
>      15.69 =C4=85  4%    +379.5%      75.25 =C4=85 28%  perf-sched.wait_t=
ime.max.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_sys_s=
etns.do_syscall_64
>      15.70 =C4=85  3%    +422.2%      81.97 =C4=85 19%  perf-sched.wait_t=
ime.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
>       0.27 =C4=85 80%     -99.6%       0.00 =C4=85223%  perf-sched.wait_t=
ime.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.=
__split_vma
>      16.37          +528.6%     102.90 =C4=85 21%  perf-sched.wait_time.m=
ax.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_e=
mpty_file
>       0.44 =C4=85 33%     -99.1%       0.00 =C4=85104%  perf-sched.wait_t=
ime.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.vma_modi=
fy
>       0.02 =C4=85 83%    -100.0%       0.00        perf-sched.wait_time.m=
ax.ms.__cond_resched.kmem_cache_alloc_node.alloc_vmap_area.__get_vm_area_no=
de.__vmalloc_node_range
>       0.08 =C4=85 83%     -95.4%       0.00 =C4=85147%  perf-sched.wait_t=
ime.max.ms.__cond_resched.kmem_cache_alloc_node.dup_task_struct.copy_proces=
s.kernel_clone
>       1.16 =C4=85  2%    +134.7%       2.72 =C4=85 19%  perf-sched.wait_t=
ime.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exi=
t_mm
>      49.88 =C4=85 25%    +141.0%     120.23 =C4=85 27%  perf-sched.wait_t=
ime.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio=
.shmem_get_folio_gfp.shmem_write_begin
>      17.24          +495.7%     102.70 =C4=85  2%  perf-sched.wait_time.m=
ax.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
>     402.56 =C4=85 15%     -52.8%     189.89 =C4=85 14%  perf-sched.wait_t=
ime.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_=
fork_asm
>      16.96 =C4=85  4%    +521.4%     105.39 =C4=85 15%  perf-sched.wait_t=
ime.max.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
>       1.06          +241.7%       3.61 =C4=85  4%  perf-sched.wait_time.m=
ax.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_range_si=
ngle.madvise_vma_behavior
>       1.07           -88.9%       0.12 =C4=85221%  perf-sched.wait_time.m=
ax.ms.__cond_resched.unmap_page_range.zap_page_range_single.madvise_vma_beh=
avior.do_madvise
>       0.28 =C4=85 27%    +499.0%       1.67 =C4=85 18%  perf-sched.wait_t=
ime.max.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vm=
i_munmap
>       1.21 =C4=85  2%    +207.2%       3.71 =C4=85  3%  perf-sched.wait_t=
ime.max.ms.__cond_resched.zap_page_range_single.madvise_vma_behavior.do_mad=
vise.__x64_sys_madvise
>      13.43 =C4=85 26%     +38.8%      18.64        perf-sched.wait_time.m=
ax.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[u=
nknown]
>      28.45          +517.3%     175.65 =C4=85 14%  perf-sched.wait_time.m=
ax.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>       0.79 =C4=85 10%     +62.2%       1.28 =C4=85 25%  perf-sched.wait_t=
ime.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>      13.22 =C4=85  2%    +317.2%      55.16 =C4=85 35%  perf-sched.wait_t=
ime.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_t=
o_user_mode.asm_sysvec_call_function
>     834.29 =C4=85 28%     -48.5%     429.53 =C4=85 94%  perf-sched.wait_t=
ime.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_t=
o_user_mode.asm_sysvec_reschedule_ipi
>      22.48          +628.6%     163.83 =C4=85 16%  perf-sched.wait_time.m=
ax.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
>      22.74 =C4=85 18%    +398.0%     113.25 =C4=85 16%  perf-sched.wait_t=
ime.max.ms.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigt=
imedwait.do_syscall_64
>       7.72 =C4=85  7%     +80.6%      13.95 =C4=85  2%  perf-sched.wait_t=
ime.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_k=
illable.__vm_munmap
>       0.74 =C4=85  4%     +77.2%       1.31 =C4=85 32%  perf-sched.wait_t=
ime.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.ker=
nel_clone
>       5.01           +14.1%       5.72 =C4=85  2%  perf-sched.wait_time.m=
ax.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
>      44.98           -19.7       25.32 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.secondary_startup_64_no_verify
>      43.21           -19.6       23.65 =C4=85  3%  perf-profile.calltrace=
.cycles-pp.start_secondary.secondary_startup_64_no_verify
>      43.21           -19.6       23.65 =C4=85  3%  perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>      43.18           -19.5       23.63 =C4=85  3%  perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_n=
o_verify
>      40.30           -17.5       22.75 =C4=85  3%  perf-profile.calltrace=
.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.seco=
ndary_startup_64_no_verify
>      41.10           -17.4       23.66 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_=
startup_entry
>      39.55           -17.3       22.24 =C4=85  3%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_=
secondary
>      24.76 =C4=85  2%      -8.5       16.23 =C4=85  3%  perf-profile.call=
trace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_c=
all.do_idle
>       8.68 =C4=85  4%      -6.5        2.22 =C4=85  6%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.intel_idle_irq.cpuidle_ente=
r_state.cpuidle_enter.cpuidle_idle_call
>       7.23 =C4=85  4%      -5.8        1.46 =C4=85  8%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe
>       7.23 =C4=85  4%      -5.8        1.46 =C4=85  8%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       7.11 =C4=85  4%      -5.7        1.39 =C4=85  7%  perf-profile.call=
trace.cycles-pp.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       7.09 =C4=85  4%      -5.7        1.39 =C4=85  7%  perf-profile.call=
trace.cycles-pp.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
>       6.59 =C4=85  3%      -5.1        1.47 =C4=85  7%  perf-profile.call=
trace.cycles-pp.ret_from_fork_asm
>       6.59 =C4=85  3%      -5.1        1.47 =C4=85  7%  perf-profile.call=
trace.cycles-pp.ret_from_fork.ret_from_fork_asm
>       6.59 =C4=85  3%      -5.1        1.47 =C4=85  7%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
>       5.76 =C4=85  2%      -5.0        0.80 =C4=85  9%  perf-profile.call=
trace.cycles-pp.start_thread
>       7.43 =C4=85  2%      -4.9        2.52 =C4=85  7%  perf-profile.call=
trace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_id=
le_call.do_idle
>       5.51 =C4=85  3%      -4.8        0.70 =C4=85  7%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.start_thread
>       5.50 =C4=85  3%      -4.8        0.70 =C4=85  7%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.start_thread
>       5.48 =C4=85  3%      -4.8        0.69 =C4=85  7%  perf-profile.call=
trace.cycles-pp.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.start_thread
>       5.42 =C4=85  3%      -4.7        0.69 =C4=85  7%  perf-profile.call=
trace.cycles-pp.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after=
_hwframe.start_thread
>       5.90 =C4=85  5%      -3.9        2.01 =C4=85  4%  perf-profile.call=
trace.cycles-pp.flush_tlb_mm_range.tlb_finish_mmu.zap_page_range_single.mad=
vise_vma_behavior.do_madvise
>       4.18 =C4=85  5%      -3.8        0.37 =C4=85 71%  perf-profile.call=
trace.cycles-pp.exit_notify.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>       5.76 =C4=85  5%      -3.8        1.98 =C4=85  4%  perf-profile.call=
trace.cycles-pp.on_each_cpu_cond_mask.flush_tlb_mm_range.tlb_finish_mmu.zap=
_page_range_single.madvise_vma_behavior
>       5.04 =C4=85  7%      -3.7        1.32 =C4=85  9%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__clone
>       5.03 =C4=85  7%      -3.7        1.32 =C4=85  9%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__clone
>       5.02 =C4=85  7%      -3.7        1.32 =C4=85  9%  perf-profile.call=
trace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe=
.__clone
>       5.02 =C4=85  7%      -3.7        1.32 =C4=85  9%  perf-profile.call=
trace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_=
after_hwframe.__clone
>       5.62 =C4=85  5%      -3.7        1.96 =C4=85  3%  perf-profile.call=
trace.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.flush_tlb=
_mm_range.tlb_finish_mmu.zap_page_range_single
>       4.03 =C4=85  4%      -3.1        0.92 =C4=85  7%  perf-profile.call=
trace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
>       6.03 =C4=85  5%      -3.1        2.94 =C4=85  3%  perf-profile.call=
trace.cycles-pp.tlb_finish_mmu.zap_page_range_single.madvise_vma_behavior.d=
o_madvise.__x64_sys_madvise
>       3.43 =C4=85  5%      -2.8        0.67 =C4=85 13%  perf-profile.call=
trace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_f=
rom_fork_asm
>       3.43 =C4=85  5%      -2.8        0.67 =C4=85 13%  perf-profile.call=
trace.cycles-pp.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread.ret_fr=
om_fork
>       3.41 =C4=85  5%      -2.7        0.66 =C4=85 13%  perf-profile.call=
trace.cycles-pp.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthre=
ad
>       3.40 =C4=85  5%      -2.7        0.66 =C4=85 13%  perf-profile.call=
trace.cycles-pp.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd.smpboot_th=
read_fn
>       3.67 =C4=85  7%      -2.7        0.94 =C4=85 10%  perf-profile.call=
trace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>       2.92 =C4=85  7%      -2.4        0.50 =C4=85 46%  perf-profile.call=
trace.cycles-pp.stress_pthread
>       2.54 =C4=85  6%      -2.2        0.38 =C4=85 70%  perf-profile.call=
trace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>       2.46 =C4=85  6%      -1.8        0.63 =C4=85 10%  perf-profile.call=
trace.cycles-pp.dup_task_struct.copy_process.kernel_clone.__do_sys_clone.do=
_syscall_64
>       3.00 =C4=85  6%      -1.6        1.43 =C4=85  7%  perf-profile.call=
trace.cycles-pp.__munmap
>       2.96 =C4=85  6%      -1.5        1.42 =C4=85  7%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
>       2.96 =C4=85  6%      -1.5        1.42 =C4=85  7%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
>       2.95 =C4=85  6%      -1.5        1.41 =C4=85  7%  perf-profile.call=
trace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.__munmap
>       2.95 =C4=85  6%      -1.5        1.41 =C4=85  7%  perf-profile.call=
trace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64=
_after_hwframe.__munmap
>       2.02 =C4=85  4%      -1.5        0.52 =C4=85 46%  perf-profile.call=
trace.cycles-pp.__lll_lock_wait
>       1.78 =C4=85  3%      -1.5        0.30 =C4=85100%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lll_lock_wait
>       1.77 =C4=85  3%      -1.5        0.30 =C4=85100%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lll_lock_wai=
t
>       1.54 =C4=85  6%      -1.3        0.26 =C4=85100%  perf-profile.call=
trace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>       2.54 =C4=85  6%      -1.2        1.38 =C4=85  6%  perf-profile.call=
trace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>       2.51 =C4=85  6%      -1.1        1.37 =C4=85  7%  perf-profile.call=
trace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_mun=
map.do_syscall_64
>       1.13            -0.7        0.40 =C4=85 70%  perf-profile.calltrace=
.cycles-pp.exit_mm.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>       1.15 =C4=85  5%      -0.7        0.46 =C4=85 45%  perf-profile.call=
trace.cycles-pp.llist_add_batch.smp_call_function_many_cond.on_each_cpu_con=
d_mask.flush_tlb_mm_range.tlb_finish_mmu
>       1.58 =C4=85  5%      -0.6        0.94 =C4=85  7%  perf-profile.call=
trace.cycles-pp.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.=
__x64_sys_munmap
>       0.99 =C4=85  5%      -0.5        0.51 =C4=85 45%  perf-profile.call=
trace.cycles-pp.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_s=
ysvec_apic_timer_interrupt.cpuidle_enter_state
>       1.01 =C4=85  5%      -0.5        0.54 =C4=85 45%  perf-profile.call=
trace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_ti=
mer_interrupt.cpuidle_enter_state.cpuidle_enter
>       0.82 =C4=85  4%      -0.2        0.59 =C4=85  5%  perf-profile.call=
trace.cycles-pp.default_send_IPI_mask_sequence_phys.smp_call_function_many_=
cond.on_each_cpu_cond_mask.flush_tlb_mm_range.tlb_finish_mmu
>       0.00            +0.5        0.54 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.flush_tlb_func.__flush_smp_call_function_queue.__sysvec_call_fun=
ction.sysvec_call_function.asm_sysvec_call_function
>       0.00            +0.6        0.60 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_rang=
e_single.madvise_vma_behavior
>       0.00            +0.6        0.61 =C4=85  6%  perf-profile.calltrace=
.cycles-pp.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.=
do_vmi_align_munmap
>       0.00            +0.6        0.62 =C4=85  6%  perf-profile.calltrace=
.cycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_m=
unmap.do_vmi_munmap
>       0.53 =C4=85  5%      +0.6        1.17 =C4=85 13%  perf-profile.call=
trace.cycles-pp.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_inte=
rrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>       1.94 =C4=85  2%      +0.7        2.64 =C4=85  9%  perf-profile.call=
trace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt=
.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
>       0.00            +0.7        0.73 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.__mod_memcg_lruvec_state.__mod_lruvec_page_state.page_remove_rma=
p.zap_pte_range.zap_pmd_range
>       0.00            +0.8        0.75 =C4=85 20%  perf-profile.calltrace=
.cycles-pp.__cond_resched.clear_huge_page.__do_huge_pmd_anonymous_page.__ha=
ndle_mm_fault.handle_mm_fault
>       2.02 =C4=85  2%      +0.8        2.85 =C4=85  9%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle=
_enter.cpuidle_idle_call.do_idle
>       0.74 =C4=85  5%      +0.8        1.57 =C4=85 11%  perf-profile.call=
trace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_=
interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       0.00            +0.9        0.90 =C4=85  4%  perf-profile.calltrace=
.cycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_range_single.madvi=
se_vma_behavior.do_madvise
>       0.00            +0.9        0.92 =C4=85 13%  perf-profile.calltrace=
.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_=
highres_handler.__hrtimer_run_queues
>       0.86 =C4=85  4%      +1.0        1.82 =C4=85 10%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic=
_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>       0.86 =C4=85  4%      +1.0        1.83 =C4=85 10%  perf-profile.call=
trace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.a=
sm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
>       0.00            +1.0        0.98 =C4=85  7%  perf-profile.calltrace=
.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.flush_tlb_mm_r=
ange.pmdp_invalidate.__split_huge_pmd_locked
>       0.09 =C4=85223%      +1.0        1.07 =C4=85 11%  perf-profile.call=
trace.cycles-pp.update_process_times.tick_sched_handle.tick_nohz_highres_ha=
ndler.__hrtimer_run_queues.hrtimer_interrupt
>       0.00            +1.0        0.99 =C4=85  6%  perf-profile.calltrace=
.cycles-pp.on_each_cpu_cond_mask.flush_tlb_mm_range.pmdp_invalidate.__split=
_huge_pmd_locked.__split_huge_pmd
>       0.00            +1.0        1.00 =C4=85  7%  perf-profile.calltrace=
.cycles-pp.flush_tlb_mm_range.pmdp_invalidate.__split_huge_pmd_locked.__spl=
it_huge_pmd.zap_pmd_range
>       0.09 =C4=85223%      +1.0        1.10 =C4=85 12%  perf-profile.call=
trace.cycles-pp.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_q=
ueues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
>       0.00            +1.0        1.01 =C4=85  6%  perf-profile.calltrace=
.cycles-pp.pmdp_invalidate.__split_huge_pmd_locked.__split_huge_pmd.zap_pmd=
_range.unmap_page_range
>       0.00            +1.1        1.10 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function.sysvec_ca=
ll_function.asm_sysvec_call_function.native_queued_spin_lock_slowpath
>       0.00            +1.1        1.12 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.__sysvec_call_function.sysvec_call_function.asm_sysvec_call_func=
tion.native_queued_spin_lock_slowpath._raw_spin_lock
>       0.00            +1.2        1.23 =C4=85  4%  perf-profile.calltrace=
.cycles-pp.page_add_anon_rmap.__split_huge_pmd_locked.__split_huge_pmd.zap_=
pmd_range.unmap_page_range
>       0.00            +1.3        1.32 =C4=85  4%  perf-profile.calltrace=
.cycles-pp.sysvec_call_function.asm_sysvec_call_function.native_queued_spin=
_lock_slowpath._raw_spin_lock.__split_huge_pmd
>       0.00            +1.4        1.38 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.__mod_lruvec_page_state.page_remove_rmap.zap_pte_range.zap_pmd_r=
ange.unmap_page_range
>       0.00            +2.4        2.44 =C4=85 10%  perf-profile.calltrace=
.cycles-pp.asm_sysvec_call_function.native_queued_spin_lock_slowpath._raw_s=
pin_lock.__split_huge_pmd.zap_pmd_range
>       0.00            +3.1        3.10 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.page_remove_rmap.zap_pte_range.zap_pmd_range.unmap_page_range.za=
p_page_range_single
>       0.00            +3.5        3.52 =C4=85  5%  perf-profile.calltrace=
.cycles-pp.__split_huge_pmd_locked.__split_huge_pmd.zap_pmd_range.unmap_pag=
e_range.zap_page_range_single
>       0.88 =C4=85  4%      +3.8        4.69 =C4=85  4%  perf-profile.call=
trace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.zap_page_range=
_single.madvise_vma_behavior
>       6.30 =C4=85  6%     +13.5       19.85 =C4=85  7%  perf-profile.call=
trace.cycles-pp.__clone
>       0.00           +16.7       16.69 =C4=85  7%  perf-profile.calltrace=
.cycles-pp.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page.__h=
andle_mm_fault.handle_mm_fault
>       1.19 =C4=85 29%     +17.1       18.32 =C4=85  7%  perf-profile.call=
trace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_pa=
ge_fault.asm_exc_page_fault
>       0.00           +17.6       17.56 =C4=85  7%  perf-profile.calltrace=
.cycles-pp.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.h=
andle_mm_fault.do_user_addr_fault
>       0.63 =C4=85  7%     +17.7       18.35 =C4=85  7%  perf-profile.call=
trace.cycles-pp.asm_exc_page_fault.__clone
>       0.59 =C4=85  5%     +17.8       18.34 =C4=85  7%  perf-profile.call=
trace.cycles-pp.exc_page_fault.asm_exc_page_fault.__clone
>       0.59 =C4=85  5%     +17.8       18.34 =C4=85  7%  perf-profile.call=
trace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__clon=
e
>       0.00           +17.9       17.90 =C4=85  7%  perf-profile.calltrace=
.cycles-pp.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.d=
o_user_addr_fault.exc_page_fault
>       0.36 =C4=85 71%     +18.0       18.33 =C4=85  7%  perf-profile.call=
trace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_p=
age_fault.__clone
>       0.00           +32.0       32.03 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__split_huge_pmd=
.zap_pmd_range.unmap_page_range
>       0.00           +32.6       32.62 =C4=85  2%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.__split_huge_pmd.zap_pmd_range.unmap_page_range.z=
ap_page_range_single
>       0.00           +36.2       36.19 =C4=85  2%  perf-profile.calltrace=
.cycles-pp.__split_huge_pmd.zap_pmd_range.unmap_page_range.zap_page_range_s=
ingle.madvise_vma_behavior
>       7.97 =C4=85  4%     +36.6       44.52 =C4=85  2%  perf-profile.call=
trace.cycles-pp.__madvise
>       7.91 =C4=85  4%     +36.6       44.46 =C4=85  2%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__madvise
>       7.90 =C4=85  4%     +36.6       44.46 =C4=85  2%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
>       7.87 =C4=85  4%     +36.6       44.44 =C4=85  2%  perf-profile.call=
trace.cycles-pp.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.__madvise
>       7.86 =C4=85  4%     +36.6       44.44 =C4=85  2%  perf-profile.call=
trace.cycles-pp.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64=
_after_hwframe.__madvise
>       7.32 =C4=85  4%     +36.8       44.07 =C4=85  2%  perf-profile.call=
trace.cycles-pp.madvise_vma_behavior.do_madvise.__x64_sys_madvise.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>       7.25 =C4=85  4%     +36.8       44.06 =C4=85  2%  perf-profile.call=
trace.cycles-pp.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64=
_sys_madvise.do_syscall_64
>       1.04 =C4=85  4%     +40.0       41.08 =C4=85  2%  perf-profile.call=
trace.cycles-pp.unmap_page_range.zap_page_range_single.madvise_vma_behavior=
.do_madvise.__x64_sys_madvise
>       1.00 =C4=85  3%     +40.1       41.06 =C4=85  2%  perf-profile.call=
trace.cycles-pp.zap_pmd_range.unmap_page_range.zap_page_range_single.madvis=
e_vma_behavior.do_madvise
>      44.98           -19.7       25.32 =C4=85  2%  perf-profile.children.=
cycles-pp.secondary_startup_64_no_verify
>      44.98           -19.7       25.32 =C4=85  2%  perf-profile.children.=
cycles-pp.cpu_startup_entry
>      44.96           -19.6       25.31 =C4=85  2%  perf-profile.children.=
cycles-pp.do_idle
>      43.21           -19.6       23.65 =C4=85  3%  perf-profile.children.=
cycles-pp.start_secondary
>      41.98           -17.6       24.40 =C4=85  2%  perf-profile.children.=
cycles-pp.cpuidle_idle_call
>      41.21           -17.3       23.86 =C4=85  2%  perf-profile.children.=
cycles-pp.cpuidle_enter
>      41.20           -17.3       23.86 =C4=85  2%  perf-profile.children.=
cycles-pp.cpuidle_enter_state
>      12.69 =C4=85  3%     -10.6        2.12 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.do_exit
>      12.60 =C4=85  3%     -10.5        2.08 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__x64_sys_exit
>      24.76 =C4=85  2%      -8.5       16.31 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.intel_idle
>      12.34 =C4=85  2%      -8.4        3.90 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.intel_idle_irq
>       6.96 =C4=85  4%      -5.4        1.58 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.ret_from_fork_asm
>       6.69 =C4=85  4%      -5.2        1.51 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       6.59 =C4=85  3%      -5.1        1.47 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.kthread
>       5.78 =C4=85  2%      -5.0        0.80 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.start_thread
>       4.68 =C4=85  4%      -4.5        0.22 =C4=85 10%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irq
>       5.03 =C4=85  7%      -3.7        1.32 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.__do_sys_clone
>       5.02 =C4=85  7%      -3.7        1.32 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.kernel_clone
>       4.20 =C4=85  5%      -3.7        0.53 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.exit_notify
>       4.67 =C4=85  5%      -3.6        1.10 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.rcu_core
>       4.60 =C4=85  4%      -3.5        1.06 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.rcu_do_batch
>       4.89 =C4=85  5%      -3.4        1.44 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.__do_softirq
>       5.64 =C4=85  3%      -3.2        2.39 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.__schedule
>       6.27 =C4=85  5%      -3.2        3.03 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.flush_tlb_mm_range
>       4.03 =C4=85  4%      -3.1        0.92 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.smpboot_thread_fn
>       6.68 =C4=85  4%      -3.1        3.61 =C4=85  3%  perf-profile.chil=
dren.cycles-pp.tlb_finish_mmu
>       6.04 =C4=85  5%      -3.1        2.99 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.on_each_cpu_cond_mask
>       6.04 =C4=85  5%      -3.0        2.99 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.smp_call_function_many_cond
>       3.77 =C4=85  2%      -3.0        0.73 =C4=85 16%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       7.78            -3.0        4.77 =C4=85  5%  perf-profile.children.=
cycles-pp.asm_sysvec_apic_timer_interrupt
>       3.43 =C4=85  5%      -2.8        0.67 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.run_ksoftirqd
>       3.67 =C4=85  7%      -2.7        0.94 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.copy_process
>       2.80 =C4=85  6%      -2.5        0.34 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.queued_write_lock_slowpath
>       3.41 =C4=85  2%      -2.5        0.96 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.do_futex
>       3.06 =C4=85  5%      -2.4        0.68 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.free_unref_page_commit
>       3.02 =C4=85  5%      -2.4        0.67 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.free_pcppages_bulk
>       2.92 =C4=85  7%      -2.3        0.58 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.stress_pthread
>       3.22 =C4=85  3%      -2.3        0.90 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.__x64_sys_futex
>       2.52 =C4=85  5%      -2.2        0.35 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.release_task
>       2.54 =C4=85  6%      -2.0        0.53 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       3.12 =C4=85  5%      -1.9        1.17 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.free_unref_page
>       2.31 =C4=85  6%      -1.9        0.45 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       2.47 =C4=85  6%      -1.8        0.63 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.dup_task_struct
>       2.19 =C4=85  5%      -1.8        0.41 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.delayed_vfree_work
>       2.14 =C4=85  5%      -1.7        0.40 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.vfree
>       3.19 =C4=85  2%      -1.6        1.58 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.schedule
>       2.06 =C4=85  3%      -1.6        0.46 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__sigtimedwait
>       3.02 =C4=85  6%      -1.6        1.44 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__munmap
>       1.94 =C4=85  4%      -1.6        0.39 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.__unfreeze_partials
>       2.95 =C4=85  6%      -1.5        1.41 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__x64_sys_munmap
>       2.95 =C4=85  6%      -1.5        1.41 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__vm_munmap
>       2.14 =C4=85  3%      -1.5        0.60 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.futex_wait
>       2.08 =C4=85  4%      -1.5        0.60 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.__lll_lock_wait
>       2.04 =C4=85  3%      -1.5        0.56 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.__futex_wait
>       1.77 =C4=85  5%      -1.5        0.32 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.remove_vm_area
>       1.86 =C4=85  5%      -1.4        0.46 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.open64
>       1.74 =C4=85  4%      -1.4        0.37 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__x64_sys_rt_sigtimedwait
>       1.71 =C4=85  4%      -1.4        0.36 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.do_sigtimedwait
>       1.79 =C4=85  5%      -1.3        0.46 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.__x64_sys_openat
>       1.78 =C4=85  5%      -1.3        0.46 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.do_sys_openat2
>       1.61 =C4=85  4%      -1.3        0.32 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.poll_idle
>       1.65 =C4=85  9%      -1.3        0.37 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.pthread_create@@GLIBC_2.2.5
>       1.56 =C4=85  8%      -1.2        0.35 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.alloc_thread_stack_node
>       2.32 =C4=85  3%      -1.2        1.13 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.pick_next_task_fair
>       2.59 =C4=85  6%      -1.2        1.40 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.do_vmi_munmap
>       1.55 =C4=85  4%      -1.2        0.40 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.futex_wait_queue
>       1.37 =C4=85  5%      -1.1        0.22 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.find_unlink_vmap_area
>       2.52 =C4=85  6%      -1.1        1.38 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.do_vmi_align_munmap
>       1.53 =C4=85  5%      -1.1        0.39 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       1.52 =C4=85  5%      -1.1        0.39 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.path_openat
>       1.25 =C4=85  3%      -1.1        0.14 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.sigpending
>       1.58 =C4=85  5%      -1.1        0.50 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       1.29 =C4=85  5%      -1.1        0.21 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.__mprotect
>       1.40 =C4=85  8%      -1.1        0.32 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.__vmalloc_node_range
>       2.06 =C4=85  3%      -1.0        1.02 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.newidle_balance
>       1.04 =C4=85  3%      -1.0        0.08 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.__x64_sys_rt_sigpending
>       1.14 =C4=85  6%      -1.0        0.18 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.__x64_sys_mprotect
>       1.13 =C4=85  6%      -1.0        0.18 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.do_mprotect_pkey
>       1.30 =C4=85  7%      -0.9        0.36 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.wake_up_new_task
>       1.14 =C4=85  9%      -0.9        0.22 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.do_anonymous_page
>       0.95 =C4=85  3%      -0.9        0.04 =C4=85 71%  perf-profile.chil=
dren.cycles-pp.do_sigpending
>       1.24 =C4=85  3%      -0.9        0.34 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.futex_wake
>       1.02 =C4=85  6%      -0.9        0.14 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.mprotect_fixup
>       1.91 =C4=85  2%      -0.9        1.06 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.load_balance
>       1.38 =C4=85  5%      -0.8        0.53 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.select_task_rq_fair
>       1.14 =C4=85  4%      -0.8        0.31 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.__pthread_mutex_unlock_usercnt
>       2.68 =C4=85  3%      -0.8        1.91 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.__flush_smp_call_function_queue
>       1.00 =C4=85  4%      -0.7        0.26 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.flush_smp_call_function_queue
>       1.44 =C4=85  3%      -0.7        0.73 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.find_busiest_group
>       0.81 =C4=85  6%      -0.7        0.10 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.vma_modify
>       1.29 =C4=85  3%      -0.7        0.60 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.exit_mm
>       1.40 =C4=85  3%      -0.7        0.71 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.update_sd_lb_stats
>       0.78 =C4=85  7%      -0.7        0.10 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.__split_vma
>       0.90 =C4=85  8%      -0.7        0.22 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.__vmalloc_area_node
>       0.75 =C4=85  4%      -0.7        0.10 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.__exit_signal
>       1.49 =C4=85  2%      -0.7        0.84 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       0.89 =C4=85  7%      -0.6        0.24 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.find_idlest_cpu
>       1.59 =C4=85  5%      -0.6        0.95 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.unmap_region
>       0.86 =C4=85  3%      -0.6        0.22 =C4=85 26%  perf-profile.chil=
dren.cycles-pp.pthread_cond_timedwait@@GLIBC_2.3.2
>       1.59 =C4=85  3%      -0.6        0.95 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.irq_exit_rcu
>       1.24 =C4=85  3%      -0.6        0.61 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.update_sg_lb_stats
>       0.94 =C4=85  5%      -0.6        0.32 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.do_task_dead
>       0.87 =C4=85  3%      -0.6        0.25 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.perf_iterate_sb
>       0.82 =C4=85  4%      -0.6        0.22 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.sched_ttwu_pending
>       1.14 =C4=85  3%      -0.6        0.54 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.activate_task
>       0.84            -0.6        0.25 =C4=85 10%  perf-profile.children.=
cycles-pp.syscall_exit_to_user_mode
>       0.81 =C4=85  6%      -0.6        0.22 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.find_idlest_group
>       0.75 =C4=85  5%      -0.6        0.18 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.step_into
>       0.74 =C4=85  8%      -0.6        0.18 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.__alloc_pages_bulk
>       0.74 =C4=85  6%      -0.5        0.19 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.update_sg_wakeup_stats
>       0.72 =C4=85  5%      -0.5        0.18 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.pick_link
>       1.06 =C4=85  2%      -0.5        0.52 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       0.77 =C4=85  6%      -0.5        0.23 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.unmap_vmas
>       0.76 =C4=85  2%      -0.5        0.22 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_prepare
>       0.94 =C4=85  2%      -0.5        0.42 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.dequeue_task_fair
>       0.65 =C4=85  5%      -0.5        0.15 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.open_last_lookups
>       1.37 =C4=85  3%      -0.5        0.87 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.llist_add_batch
>       0.70 =C4=85  4%      -0.5        0.22 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.memcpy_orig
>       0.91 =C4=85  4%      -0.5        0.44 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       0.67            -0.5        0.20 =C4=85  8%  perf-profile.children.=
cycles-pp.switch_fpu_return
>       0.88 =C4=85  3%      -0.5        0.42 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       0.91 =C4=85  4%      -0.5        0.45 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       0.77 =C4=85  4%      -0.5        0.32 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.schedule_hrtimeout_range_clock
>       0.63 =C4=85  5%      -0.4        0.20 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.arch_dup_task_struct
>       0.74 =C4=85  3%      -0.4        0.32 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>       0.62 =C4=85  5%      -0.4        0.21 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       0.56            -0.4        0.16 =C4=85  7%  perf-profile.children.=
cycles-pp.restore_fpregs_from_fpstate
>       0.53 =C4=85  4%      -0.4        0.13 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.syscall
>       0.50 =C4=85  9%      -0.4        0.11 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.__get_vm_area_node
>       0.51 =C4=85  3%      -0.4        0.12 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.__slab_free
>       0.52 =C4=85  2%      -0.4        0.14 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.kmem_cache_free
>       0.75 =C4=85  3%      -0.4        0.37 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.exit_mm_release
>       0.50 =C4=85  6%      -0.4        0.12 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.do_send_specific
>       0.74 =C4=85  3%      -0.4        0.37 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.futex_exit_release
>       0.45 =C4=85 10%      -0.4        0.09 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.alloc_vmap_area
>       0.47 =C4=85  3%      -0.4        0.11 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.tgkill
>       0.68 =C4=85 11%      -0.4        0.32 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.__mmap
>       0.48 =C4=85  3%      -0.4        0.13 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64
>       0.76 =C4=85  5%      -0.3        0.41 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.wake_up_q
>       0.42 =C4=85  7%      -0.3        0.08 =C4=85 22%  perf-profile.chil=
dren.cycles-pp.__close
>       0.49 =C4=85  7%      -0.3        0.14 =C4=85 25%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc
>       0.49 =C4=85  9%      -0.3        0.15 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.mas_store_gfp
>       0.46 =C4=85  4%      -0.3        0.12 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.perf_event_task_output
>       0.44 =C4=85 10%      -0.3        0.10 =C4=85 28%  perf-profile.chil=
dren.cycles-pp.pthread_sigqueue
>       0.46 =C4=85  4%      -0.3        0.12 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.link_path_walk
>       0.42 =C4=85  8%      -0.3        0.10 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.proc_ns_get_link
>       0.63 =C4=85 10%      -0.3        0.32 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.vm_mmap_pgoff
>       0.45 =C4=85  4%      -0.3        0.14 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.sched_move_task
>       0.36 =C4=85  8%      -0.3        0.06 =C4=85 49%  perf-profile.chil=
dren.cycles-pp.__x64_sys_close
>       0.46 =C4=85  8%      -0.3        0.17 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.prctl
>       0.65 =C4=85  3%      -0.3        0.35 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.futex_cleanup
>       0.42 =C4=85  7%      -0.3        0.12 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.mas_store_prealloc
>       0.49 =C4=85  5%      -0.3        0.20 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.__rmqueue_pcplist
>       0.37 =C4=85  7%      -0.3        0.08 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.do_tkill
>       0.36 =C4=85 10%      -0.3        0.08 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.ns_get_path
>       0.37 =C4=85  4%      -0.3        0.09 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.setns
>       0.67 =C4=85  3%      -0.3        0.41 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.hrtimer_wakeup
>       0.35 =C4=85  5%      -0.3        0.10 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.__task_pid_nr_ns
>       0.41 =C4=85  5%      -0.3        0.16 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.mas_wr_bnode
>       0.35 =C4=85  4%      -0.3        0.10 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.rcu_cblist_dequeue
>       0.37 =C4=85  5%      -0.2        0.12 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.exit_task_stack_account
>       0.56 =C4=85  4%      -0.2        0.31 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.select_task_rq
>       0.29 =C4=85  6%      -0.2        0.05 =C4=85 46%  perf-profile.chil=
dren.cycles-pp.mas_wr_store_entry
>       0.34 =C4=85  4%      -0.2        0.10 =C4=85 27%  perf-profile.chil=
dren.cycles-pp.perf_event_task
>       0.39 =C4=85  9%      -0.2        0.15 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.__switch_to_asm
>       0.35 =C4=85  5%      -0.2        0.11 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.account_kernel_stack
>       0.30 =C4=85  7%      -0.2        0.06 =C4=85 48%  perf-profile.chil=
dren.cycles-pp.__ns_get_path
>       0.31 =C4=85  9%      -0.2        0.07 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.free_vmap_area_noflush
>       0.31 =C4=85  5%      -0.2        0.08 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.__do_sys_setns
>       0.33 =C4=85  7%      -0.2        0.10 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__free_one_page
>       0.31 =C4=85 11%      -0.2        0.08 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.__pte_alloc
>       0.36 =C4=85  6%      -0.2        0.13 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.switch_mm_irqs_off
>       0.27 =C4=85 12%      -0.2        0.05 =C4=85 71%  perf-profile.chil=
dren.cycles-pp.__fput
>       0.53 =C4=85  9%      -0.2        0.31 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.do_mmap
>       0.27 =C4=85 12%      -0.2        0.05 =C4=85 77%  perf-profile.chil=
dren.cycles-pp.__x64_sys_rt_tgsigqueueinfo
>       0.28 =C4=85  5%      -0.2        0.06 =C4=85 50%  perf-profile.chil=
dren.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.34 =C4=85 10%      -0.2        0.12 =C4=85 29%  perf-profile.chil=
dren.cycles-pp.futex_wait_setup
>       0.27 =C4=85  6%      -0.2        0.06 =C4=85 45%  perf-profile.chil=
dren.cycles-pp.__x64_sys_tgkill
>       0.31 =C4=85  7%      -0.2        0.11 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.__switch_to
>       0.26 =C4=85  8%      -0.2        0.06 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.__call_rcu_common
>       0.33 =C4=85  9%      -0.2        0.13 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.__do_sys_prctl
>       0.28 =C4=85  5%      -0.2        0.08 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.mm_release
>       0.52 =C4=85  2%      -0.2        0.32 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.__get_user_8
>       0.24 =C4=85 10%      -0.2        0.04 =C4=85 72%  perf-profile.chil=
dren.cycles-pp.dput
>       0.25 =C4=85 14%      -0.2        0.05 =C4=85 46%  perf-profile.chil=
dren.cycles-pp.perf_event_mmap
>       0.24 =C4=85  7%      -0.2        0.06 =C4=85 50%  perf-profile.chil=
dren.cycles-pp.mas_walk
>       0.28 =C4=85  6%      -0.2        0.10 =C4=85 24%  perf-profile.chil=
dren.cycles-pp.rmqueue_bulk
>       0.23 =C4=85 15%      -0.2        0.05 =C4=85 46%  perf-profile.chil=
dren.cycles-pp.perf_event_mmap_event
>       0.25 =C4=85 15%      -0.2        0.08 =C4=85 45%  perf-profile.chil=
dren.cycles-pp.___slab_alloc
>       0.20 =C4=85 14%      -0.2        0.03 =C4=85100%  perf-profile.chil=
dren.cycles-pp.lookup_fast
>       0.20 =C4=85 10%      -0.2        0.04 =C4=85 75%  perf-profile.chil=
dren.cycles-pp.memcg_slab_post_alloc_hook
>       0.28 =C4=85  7%      -0.2        0.12 =C4=85 24%  perf-profile.chil=
dren.cycles-pp.prepare_task_switch
>       0.22 =C4=85 11%      -0.2        0.05 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.ttwu_queue_wakelist
>       0.63 =C4=85  5%      -0.2        0.47 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.llist_reverse_order
>       0.25 =C4=85 11%      -0.2        0.09 =C4=85 34%  perf-profile.chil=
dren.cycles-pp.futex_q_lock
>       0.21 =C4=85  6%      -0.2        0.06 =C4=85 47%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc_node
>       0.18 =C4=85 11%      -0.2        0.03 =C4=85100%  perf-profile.chil=
dren.cycles-pp.alloc_empty_file
>       0.19 =C4=85  5%      -0.2        0.04 =C4=85 71%  perf-profile.chil=
dren.cycles-pp.__put_task_struct
>       0.19 =C4=85 15%      -0.2        0.03 =C4=85 70%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_call_function_single
>       0.24 =C4=85  6%      -0.2        0.09 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.___perf_sw_event
>       0.18 =C4=85  7%      -0.2        0.03 =C4=85100%  perf-profile.chil=
dren.cycles-pp.perf_event_fork
>       0.19 =C4=85 11%      -0.1        0.04 =C4=85 71%  perf-profile.chil=
dren.cycles-pp.select_idle_core
>       0.30 =C4=85 11%      -0.1        0.15 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.pte_alloc_one
>       0.25 =C4=85  6%      -0.1        0.11 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       0.20 =C4=85 10%      -0.1        0.06 =C4=85 49%  perf-profile.chil=
dren.cycles-pp.__perf_event_header__init_id
>       0.18 =C4=85 15%      -0.1        0.03 =C4=85101%  perf-profile.chil=
dren.cycles-pp.__radix_tree_lookup
>       0.22 =C4=85 11%      -0.1        0.08 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.mas_spanning_rebalance
>       0.20 =C4=85  9%      -0.1        0.06 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.stress_pthread_func
>       0.18 =C4=85 12%      -0.1        0.04 =C4=85 73%  perf-profile.chil=
dren.cycles-pp.__getpid
>       0.16 =C4=85 13%      -0.1        0.02 =C4=85 99%  perf-profile.chil=
dren.cycles-pp.walk_component
>       0.28 =C4=85  5%      -0.1        0.15 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.update_curr
>       0.25 =C4=85  5%      -0.1        0.11 =C4=85 22%  perf-profile.chil=
dren.cycles-pp.balance_fair
>       0.16 =C4=85  9%      -0.1        0.03 =C4=85100%  perf-profile.chil=
dren.cycles-pp.futex_wake_mark
>       0.16 =C4=85 12%      -0.1        0.04 =C4=85 71%  perf-profile.chil=
dren.cycles-pp.get_futex_key
>       0.17 =C4=85  6%      -0.1        0.05 =C4=85 47%  perf-profile.chil=
dren.cycles-pp.memcg_account_kmem
>       0.25 =C4=85 11%      -0.1        0.12 =C4=85 11%  perf-profile.chil=
dren.cycles-pp._find_next_bit
>       0.15 =C4=85 13%      -0.1        0.02 =C4=85 99%  perf-profile.chil=
dren.cycles-pp.do_open
>       0.20 =C4=85  8%      -0.1        0.08 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.mas_rebalance
>       0.17 =C4=85 13%      -0.1        0.05 =C4=85 45%  perf-profile.chil=
dren.cycles-pp.__memcg_kmem_charge_page
>       0.33 =C4=85  6%      -0.1        0.21 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.select_idle_sibling
>       0.14 =C4=85 11%      -0.1        0.03 =C4=85100%  perf-profile.chil=
dren.cycles-pp.get_user_pages_fast
>       0.18 =C4=85  7%      -0.1        0.07 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.mas_alloc_nodes
>       0.14 =C4=85 11%      -0.1        0.03 =C4=85101%  perf-profile.chil=
dren.cycles-pp.set_task_cpu
>       0.14 =C4=85 12%      -0.1        0.03 =C4=85101%  perf-profile.chil=
dren.cycles-pp.vm_unmapped_area
>       0.38 =C4=85  6%      -0.1        0.27 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.native_sched_clock
>       0.16 =C4=85 10%      -0.1        0.05 =C4=85 47%  perf-profile.chil=
dren.cycles-pp.arch_get_unmapped_area_topdown
>       0.36 =C4=85  9%      -0.1        0.25 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.mmap_region
>       0.23 =C4=85  7%      -0.1        0.12 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.available_idle_cpu
>       0.13 =C4=85 11%      -0.1        0.02 =C4=85 99%  perf-profile.chil=
dren.cycles-pp.internal_get_user_pages_fast
>       0.16 =C4=85 10%      -0.1        0.06 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.get_unmapped_area
>       0.50 =C4=85  7%      -0.1        0.40 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.menu_select
>       0.24 =C4=85  9%      -0.1        0.14 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.rmqueue
>       0.17 =C4=85 14%      -0.1        0.07 =C4=85 26%  perf-profile.chil=
dren.cycles-pp.perf_event_comm
>       0.17 =C4=85 15%      -0.1        0.07 =C4=85 23%  perf-profile.chil=
dren.cycles-pp.perf_event_comm_event
>       0.17 =C4=85 11%      -0.1        0.07 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.pick_next_entity
>       0.13 =C4=85 14%      -0.1        0.03 =C4=85102%  perf-profile.chil=
dren.cycles-pp.perf_output_begin
>       0.23 =C4=85  6%      -0.1        0.13 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_cfs_rq
>       0.14 =C4=85 18%      -0.1        0.04 =C4=85 72%  perf-profile.chil=
dren.cycles-pp.perf_event_comm_output
>       0.21 =C4=85  9%      -0.1        0.12 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       0.16 =C4=85  8%      -0.1        0.06 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.mas_split
>       0.13 =C4=85 14%      -0.1        0.04 =C4=85 71%  perf-profile.chil=
dren.cycles-pp.raw_spin_rq_lock_nested
>       0.13 =C4=85  6%      -0.1        0.04 =C4=85 71%  perf-profile.chil=
dren.cycles-pp.syscall_return_via_sysret
>       0.13 =C4=85  7%      -0.1        0.04 =C4=85 72%  perf-profile.chil=
dren.cycles-pp.mas_topiary_replace
>       0.14 =C4=85  8%      -0.1        0.06 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.mas_preallocate
>       0.16 =C4=85 11%      -0.1        0.07 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.__pick_eevdf
>       0.11 =C4=85 14%      -0.1        0.02 =C4=85 99%  perf-profile.chil=
dren.cycles-pp.mas_empty_area_rev
>       0.25 =C4=85  7%      -0.1        0.17 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.select_idle_cpu
>       0.14 =C4=85 12%      -0.1        0.06 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.cpu_stopper_thread
>       0.14 =C4=85 10%      -0.1        0.06 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.active_load_balance_cpu_stop
>       0.14 =C4=85 14%      -0.1        0.06 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.os_xsave
>       0.18 =C4=85  6%      -0.1        0.11 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.idle_cpu
>       0.17 =C4=85  4%      -0.1        0.10 =C4=85 15%  perf-profile.chil=
dren.cycles-pp.hrtimer_start_range_ns
>       0.11 =C4=85 14%      -0.1        0.03 =C4=85100%  perf-profile.chil=
dren.cycles-pp.__pthread_mutex_lock
>       0.32 =C4=85  5%      -0.1        0.25 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.sched_clock
>       0.11 =C4=85  6%      -0.1        0.03 =C4=85 70%  perf-profile.chil=
dren.cycles-pp.wakeup_preempt
>       0.23 =C4=85  7%      -0.1        0.16 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.update_rq_clock_task
>       0.13 =C4=85  8%      -0.1        0.06 =C4=85 16%  perf-profile.chil=
dren.cycles-pp.local_clock_noinstr
>       0.11 =C4=85 10%      -0.1        0.04 =C4=85 71%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc_bulk
>       0.34 =C4=85  4%      -0.1        0.27 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.sched_clock_cpu
>       0.11 =C4=85  9%      -0.1        0.04 =C4=85 76%  perf-profile.chil=
dren.cycles-pp.avg_vruntime
>       0.15 =C4=85  8%      -0.1        0.08 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.update_cfs_group
>       0.10 =C4=85  8%      -0.1        0.04 =C4=85 71%  perf-profile.chil=
dren.cycles-pp.__kmem_cache_alloc_bulk
>       0.13 =C4=85  8%      -0.1        0.06 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.sched_use_asym_prio
>       0.09 =C4=85 12%      -0.1        0.02 =C4=85 99%  perf-profile.chil=
dren.cycles-pp.getname_flags
>       0.18 =C4=85  9%      -0.1        0.12 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_se
>       0.11 =C4=85  8%      -0.1        0.05 =C4=85 46%  perf-profile.chil=
dren.cycles-pp.place_entity
>       0.08 =C4=85 12%      -0.0        0.02 =C4=85 99%  perf-profile.chil=
dren.cycles-pp.folio_add_lru_vma
>       0.10 =C4=85  7%      -0.0        0.05 =C4=85 46%  perf-profile.chil=
dren.cycles-pp._find_next_and_bit
>       0.10 =C4=85  6%      -0.0        0.06 =C4=85 24%  perf-profile.chil=
dren.cycles-pp.reweight_entity
>       0.03 =C4=85 70%      +0.0        0.08 =C4=85 14%  perf-profile.chil=
dren.cycles-pp.perf_rotate_context
>       0.19 =C4=85 10%      +0.1        0.25 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.irqtime_account_irq
>       0.08 =C4=85 11%      +0.1        0.14 =C4=85 21%  perf-profile.chil=
dren.cycles-pp.perf_mux_hrtimer_handler
>       0.00            +0.1        0.06 =C4=85 14%  perf-profile.children.=
cycles-pp.rcu_pending
>       0.10 =C4=85 17%      +0.1        0.16 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.rebalance_domains
>       0.14 =C4=85 16%      +0.1        0.21 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.downgrade_write
>       0.14 =C4=85 14%      +0.1        0.21 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.down_read_killable
>       0.00            +0.1        0.07 =C4=85 11%  perf-profile.children.=
cycles-pp.free_tail_page_prepare
>       0.02 =C4=85141%      +0.1        0.09 =C4=85 20%  perf-profile.chil=
dren.cycles-pp.rcu_sched_clock_irq
>       0.01 =C4=85223%      +0.1        0.08 =C4=85 25%  perf-profile.chil=
dren.cycles-pp.arch_scale_freq_tick
>       0.55 =C4=85  9%      +0.1        0.62 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.__alloc_pages
>       0.34 =C4=85  5%      +0.1        0.41 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.clock_nanosleep
>       0.00            +0.1        0.08 =C4=85 23%  perf-profile.children.=
cycles-pp.tick_nohz_next_event
>       0.70 =C4=85  2%      +0.1        0.78 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.flush_tlb_func
>       0.14 =C4=85 10%      +0.1        0.23 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.__intel_pmu_enable_all
>       0.07 =C4=85 19%      +0.1        0.17 =C4=85 17%  perf-profile.chil=
dren.cycles-pp.cgroup_rstat_updated
>       0.04 =C4=85 71%      +0.1        0.14 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       0.25 =C4=85  9%      +0.1        0.38 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.down_read
>       0.43 =C4=85  9%      +0.1        0.56 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.get_page_from_freelist
>       0.00            +0.1        0.15 =C4=85  6%  perf-profile.children.=
cycles-pp.vm_normal_page
>       0.31 =C4=85  7%      +0.2        0.46 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.native_flush_tlb_local
>       0.00            +0.2        0.16 =C4=85  8%  perf-profile.children.=
cycles-pp.__tlb_remove_page_size
>       0.28 =C4=85 11%      +0.2        0.46 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.vma_alloc_folio
>       0.00            +0.2        0.24 =C4=85  5%  perf-profile.children.=
cycles-pp._compound_head
>       0.07 =C4=85 16%      +0.2        0.31 =C4=85  6%  perf-profile.chil=
dren.cycles-pp.__mod_node_page_state
>       0.38 =C4=85  5%      +0.2        0.62 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.perf_adjust_freq_unthr_context
>       0.22 =C4=85 12%      +0.2        0.47 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.schedule_preempt_disabled
>       0.38 =C4=85  5%      +0.3        0.64 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.perf_event_task_tick
>       0.00            +0.3        0.27 =C4=85  5%  perf-profile.children.=
cycles-pp.free_swap_cache
>       0.30 =C4=85 10%      +0.3        0.58 =C4=85 10%  perf-profile.chil=
dren.cycles-pp.rwsem_down_read_slowpath
>       0.00            +0.3        0.30 =C4=85  4%  perf-profile.children.=
cycles-pp.free_pages_and_swap_cache
>       0.09 =C4=85 10%      +0.3        0.42 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__mod_lruvec_state
>       0.00            +0.3        0.34 =C4=85  9%  perf-profile.children.=
cycles-pp.deferred_split_folio
>       0.00            +0.4        0.36 =C4=85 13%  perf-profile.children.=
cycles-pp.prep_compound_page
>       0.09 =C4=85 10%      +0.4        0.50 =C4=85  9%  perf-profile.chil=
dren.cycles-pp.free_unref_page_prepare
>       0.00            +0.4        0.42 =C4=85 11%  perf-profile.children.=
cycles-pp.do_huge_pmd_anonymous_page
>       1.67 =C4=85  3%      +0.4        2.12 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.63 =C4=85  3%      +0.5        1.11 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       1.93 =C4=85  3%      +0.5        2.46 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       1.92 =C4=85  3%      +0.5        2.45 =C4=85  8%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       0.73 =C4=85  3%      +0.6        1.31 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.74 =C4=85  3%      +0.6        1.34 =C4=85 11%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       0.20 =C4=85  8%      +0.6        0.83 =C4=85 18%  perf-profile.chil=
dren.cycles-pp.__cond_resched
>       0.78 =C4=85  4%      +0.6        1.43 =C4=85 12%  perf-profile.chil=
dren.cycles-pp.tick_nohz_highres_handler
>       0.12 =C4=85  7%      +0.7        0.81 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.__mod_memcg_lruvec_state
>       0.28 =C4=85  7%      +0.9        1.23 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.release_pages
>       0.00            +1.0        1.01 =C4=85  6%  perf-profile.children.=
cycles-pp.pmdp_invalidate
>       0.35 =C4=85  6%      +1.2        1.56 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.__mod_lruvec_page_state
>       0.30 =C4=85  8%      +1.2        1.53 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.tlb_batch_pages_flush
>       0.00            +1.3        1.26 =C4=85  4%  perf-profile.children.=
cycles-pp.page_add_anon_rmap
>       0.09 =C4=85 11%      +3.1        3.20 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.page_remove_rmap
>       1.60 =C4=85  2%      +3.4        5.04 =C4=85  4%  perf-profile.chil=
dren.cycles-pp.zap_pte_range
>       0.03 =C4=85100%      +3.5        3.55 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.__split_huge_pmd_locked
>      41.36           +11.6       52.92 =C4=85  2%  perf-profile.children.=
cycles-pp.entry_SYSCALL_64_after_hwframe
>      41.22           +11.7       52.88 =C4=85  2%  perf-profile.children.=
cycles-pp.do_syscall_64
>       6.42 =C4=85  6%     +13.5       19.88 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__clone
>       0.82 =C4=85  6%     +16.2       16.98 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.clear_page_erms
>       2.62 =C4=85  5%     +16.4       19.04 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.asm_exc_page_fault
>       2.18 =C4=85  5%     +16.8       18.94 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.exc_page_fault
>       2.06 =C4=85  6%     +16.8       18.90 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.do_user_addr_fault
>       1.60 =C4=85  8%     +17.0       18.60 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.handle_mm_fault
>       1.52 =C4=85  7%     +17.1       18.58 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__handle_mm_fault
>       0.30 =C4=85  7%     +17.4       17.72 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.clear_huge_page
>       0.31 =C4=85  8%     +17.6       17.90 =C4=85  7%  perf-profile.chil=
dren.cycles-pp.__do_huge_pmd_anonymous_page
>      11.66 =C4=85  3%     +22.2       33.89 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       3.29 =C4=85  3%     +30.2       33.46        perf-profile.children.=
cycles-pp._raw_spin_lock
>       0.04 =C4=85 71%     +36.2       36.21 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.__split_huge_pmd
>       8.00 =C4=85  4%     +36.5       44.54 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.__madvise
>       7.87 =C4=85  4%     +36.6       44.44 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.__x64_sys_madvise
>       7.86 =C4=85  4%     +36.6       44.44 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.do_madvise
>       7.32 =C4=85  4%     +36.8       44.07 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.madvise_vma_behavior
>       7.26 =C4=85  4%     +36.8       44.06 =C4=85  2%  perf-profile.chil=
dren.cycles-pp.zap_page_range_single
>       1.78           +39.5       41.30 =C4=85  2%  perf-profile.children.=
cycles-pp.unmap_page_range
>       1.72           +39.6       41.28 =C4=85  2%  perf-profile.children.=
cycles-pp.zap_pmd_range
>      24.76 =C4=85  2%      -8.5       16.31 =C4=85  2%  perf-profile.self=
.cycles-pp.intel_idle
>      11.46 =C4=85  2%      -7.8        3.65 =C4=85  5%  perf-profile.self=
.cycles-pp.intel_idle_irq
>       3.16 =C4=85  7%      -2.1        1.04 =C4=85  6%  perf-profile.self=
.cycles-pp.smp_call_function_many_cond
>       1.49 =C4=85  4%      -1.2        0.30 =C4=85 12%  perf-profile.self=
.cycles-pp.poll_idle
>       1.15 =C4=85  3%      -0.6        0.50 =C4=85  9%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.60 =C4=85  6%      -0.6        0.03 =C4=85100%  perf-profile.self=
.cycles-pp.queued_write_lock_slowpath
>       0.69 =C4=85  4%      -0.5        0.22 =C4=85 20%  perf-profile.self=
.cycles-pp.memcpy_orig
>       0.66 =C4=85  7%      -0.5        0.18 =C4=85 11%  perf-profile.self=
.cycles-pp.update_sg_wakeup_stats
>       0.59 =C4=85  4%      -0.5        0.13 =C4=85  8%  perf-profile.self=
.cycles-pp._raw_spin_lock_irq
>       0.86 =C4=85  3%      -0.4        0.43 =C4=85 12%  perf-profile.self=
.cycles-pp.update_sg_lb_stats
>       0.56            -0.4        0.16 =C4=85  7%  perf-profile.self.cycl=
es-pp.restore_fpregs_from_fpstate
>       0.48 =C4=85  3%      -0.4        0.12 =C4=85 10%  perf-profile.self=
.cycles-pp.__slab_free
>       1.18 =C4=85  2%      -0.4        0.82 =C4=85  3%  perf-profile.self=
.cycles-pp.llist_add_batch
>       0.54 =C4=85  5%      -0.3        0.19 =C4=85  6%  perf-profile.self=
.cycles-pp.__schedule
>       0.47 =C4=85  7%      -0.3        0.18 =C4=85 13%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.34 =C4=85  5%      -0.2        0.09 =C4=85 18%  perf-profile.self=
.cycles-pp.kmem_cache_free
>       0.43 =C4=85  4%      -0.2        0.18 =C4=85 11%  perf-profile.self=
.cycles-pp.update_load_avg
>       0.35 =C4=85  4%      -0.2        0.10 =C4=85 23%  perf-profile.self=
.cycles-pp.rcu_cblist_dequeue
>       0.38 =C4=85  9%      -0.2        0.15 =C4=85 10%  perf-profile.self=
.cycles-pp.__switch_to_asm
>       0.33 =C4=85  5%      -0.2        0.10 =C4=85 16%  perf-profile.self=
.cycles-pp.__task_pid_nr_ns
>       0.36 =C4=85  6%      -0.2        0.13 =C4=85 14%  perf-profile.self=
.cycles-pp.switch_mm_irqs_off
>       0.31 =C4=85  6%      -0.2        0.09 =C4=85  6%  perf-profile.self=
.cycles-pp.__free_one_page
>       0.28 =C4=85  5%      -0.2        0.06 =C4=85 50%  perf-profile.self=
.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.27 =C4=85 13%      -0.2        0.06 =C4=85 23%  perf-profile.self=
.cycles-pp.pthread_create@@GLIBC_2.2.5
>       0.30 =C4=85  7%      -0.2        0.10 =C4=85 19%  perf-profile.self=
.cycles-pp.__switch_to
>       0.27 =C4=85  4%      -0.2        0.10 =C4=85 17%  perf-profile.self=
.cycles-pp.finish_task_switch
>       0.23 =C4=85  7%      -0.2        0.06 =C4=85 50%  perf-profile.self=
.cycles-pp.mas_walk
>       0.22 =C4=85  9%      -0.2        0.05 =C4=85 48%  perf-profile.self=
.cycles-pp.__clone
>       0.63 =C4=85  5%      -0.2        0.46 =C4=85 12%  perf-profile.self=
.cycles-pp.llist_reverse_order
>       0.20 =C4=85  4%      -0.2        0.04 =C4=85 72%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64
>       0.24 =C4=85 10%      -0.1        0.09 =C4=85 19%  perf-profile.self=
.cycles-pp.rmqueue_bulk
>       0.18 =C4=85 13%      -0.1        0.03 =C4=85101%  perf-profile.self=
.cycles-pp.__radix_tree_lookup
>       0.18 =C4=85 11%      -0.1        0.04 =C4=85 71%  perf-profile.self=
.cycles-pp.stress_pthread_func
>       0.36 =C4=85  8%      -0.1        0.22 =C4=85 11%  perf-profile.self=
.cycles-pp.menu_select
>       0.22 =C4=85  4%      -0.1        0.08 =C4=85 19%  perf-profile.self=
.cycles-pp.___perf_sw_event
>       0.20 =C4=85 13%      -0.1        0.07 =C4=85 20%  perf-profile.self=
.cycles-pp.start_thread
>       0.16 =C4=85 13%      -0.1        0.03 =C4=85101%  perf-profile.self=
.cycles-pp.alloc_vmap_area
>       0.17 =C4=85 10%      -0.1        0.04 =C4=85 73%  perf-profile.self=
.cycles-pp.kmem_cache_alloc
>       0.14 =C4=85  9%      -0.1        0.03 =C4=85100%  perf-profile.self=
.cycles-pp.futex_wake
>       0.17 =C4=85  4%      -0.1        0.06 =C4=85 11%  perf-profile.self=
.cycles-pp.dequeue_task_fair
>       0.23 =C4=85  6%      -0.1        0.12 =C4=85 11%  perf-profile.self=
.cycles-pp.available_idle_cpu
>       0.22 =C4=85 13%      -0.1        0.11 =C4=85 12%  perf-profile.self=
.cycles-pp._find_next_bit
>       0.21 =C4=85  7%      -0.1        0.10 =C4=85  6%  perf-profile.self=
.cycles-pp.__rmqueue_pcplist
>       0.37 =C4=85  7%      -0.1        0.26 =C4=85  8%  perf-profile.self=
.cycles-pp.native_sched_clock
>       0.22 =C4=85  7%      -0.1        0.12 =C4=85 21%  perf-profile.self=
.cycles-pp.__update_load_avg_cfs_rq
>       0.19 =C4=85  7%      -0.1        0.10 =C4=85 11%  perf-profile.self=
.cycles-pp.enqueue_entity
>       0.15 =C4=85  5%      -0.1        0.06 =C4=85 45%  perf-profile.self=
.cycles-pp.enqueue_task_fair
>       0.15 =C4=85 11%      -0.1        0.06 =C4=85 17%  perf-profile.self=
.cycles-pp.__pick_eevdf
>       0.13 =C4=85 13%      -0.1        0.05 =C4=85 72%  perf-profile.self=
.cycles-pp.prepare_task_switch
>       0.17 =C4=85 10%      -0.1        0.08 =C4=85  8%  perf-profile.self=
.cycles-pp.update_rq_clock_task
>       0.54 =C4=85  4%      -0.1        0.46 =C4=85  6%  perf-profile.self=
.cycles-pp.__flush_smp_call_function_queue
>       0.14 =C4=85 14%      -0.1        0.06 =C4=85 11%  perf-profile.self=
.cycles-pp.os_xsave
>       0.11 =C4=85 10%      -0.1        0.03 =C4=85 70%  perf-profile.self=
.cycles-pp.try_to_wake_up
>       0.10 =C4=85  8%      -0.1        0.03 =C4=85100%  perf-profile.self=
.cycles-pp.futex_wait
>       0.14 =C4=85  9%      -0.1        0.07 =C4=85 10%  perf-profile.self=
.cycles-pp.update_curr
>       0.18 =C4=85  9%      -0.1        0.11 =C4=85 14%  perf-profile.self=
.cycles-pp.idle_cpu
>       0.11 =C4=85 11%      -0.1        0.04 =C4=85 76%  perf-profile.self=
.cycles-pp.avg_vruntime
>       0.15 =C4=85 10%      -0.1        0.08 =C4=85 14%  perf-profile.self=
.cycles-pp.update_cfs_group
>       0.09 =C4=85  9%      -0.1        0.03 =C4=85100%  perf-profile.self=
.cycles-pp.reweight_entity
>       0.12 =C4=85 13%      -0.1        0.06 =C4=85  8%  perf-profile.self=
.cycles-pp.do_idle
>       0.18 =C4=85 10%      -0.1        0.12 =C4=85 13%  perf-profile.self=
.cycles-pp.__update_load_avg_se
>       0.09 =C4=85 17%      -0.1        0.04 =C4=85 71%  perf-profile.self=
.cycles-pp.cpuidle_idle_call
>       0.10 =C4=85 11%      -0.0        0.06 =C4=85 45%  perf-profile.self=
.cycles-pp.update_rq_clock
>       0.12 =C4=85 15%      -0.0        0.07 =C4=85 16%  perf-profile.self=
.cycles-pp.update_sd_lb_stats
>       0.09 =C4=85  5%      -0.0        0.05 =C4=85 46%  perf-profile.self=
.cycles-pp._find_next_and_bit
>       0.01 =C4=85223%      +0.1        0.08 =C4=85 25%  perf-profile.self=
.cycles-pp.arch_scale_freq_tick
>       0.78 =C4=85  4%      +0.1        0.87 =C4=85  4%  perf-profile.self=
.cycles-pp.default_send_IPI_mask_sequence_phys
>       0.14 =C4=85 10%      +0.1        0.23 =C4=85 13%  perf-profile.self=
.cycles-pp.__intel_pmu_enable_all
>       0.06 =C4=85 46%      +0.1        0.15 =C4=85 19%  perf-profile.self=
.cycles-pp.cgroup_rstat_updated
>       0.19 =C4=85  3%      +0.1        0.29 =C4=85  4%  perf-profile.self=
.cycles-pp.cpuidle_enter_state
>       0.00            +0.1        0.10 =C4=85 11%  perf-profile.self.cycl=
es-pp.__mod_lruvec_state
>       0.00            +0.1        0.11 =C4=85 18%  perf-profile.self.cycl=
es-pp.__tlb_remove_page_size
>       0.00            +0.1        0.12 =C4=85  9%  perf-profile.self.cycl=
es-pp.vm_normal_page
>       0.23 =C4=85  7%      +0.1        0.36 =C4=85  8%  perf-profile.self=
.cycles-pp.perf_adjust_freq_unthr_context
>       0.20 =C4=85  8%      +0.2        0.35 =C4=85  7%  perf-profile.self=
.cycles-pp.__mod_lruvec_page_state
>       1.12 =C4=85  2%      +0.2        1.28 =C4=85  4%  perf-profile.self=
.cycles-pp.zap_pte_range
>       0.31 =C4=85  8%      +0.2        0.46 =C4=85  9%  perf-profile.self=
.cycles-pp.native_flush_tlb_local
>       0.00            +0.2        0.16 =C4=85  5%  perf-profile.self.cycl=
es-pp._compound_head
>       0.06 =C4=85 17%      +0.2        0.26 =C4=85  4%  perf-profile.self=
.cycles-pp.__mod_node_page_state
>       0.00            +0.2        0.24 =C4=85  6%  perf-profile.self.cycl=
es-pp.free_swap_cache
>       0.00            +0.3        0.27 =C4=85 15%  perf-profile.self.cycl=
es-pp.clear_huge_page
>       0.00            +0.3        0.27 =C4=85 11%  perf-profile.self.cycl=
es-pp.deferred_split_folio
>       0.00            +0.4        0.36 =C4=85 13%  perf-profile.self.cycl=
es-pp.prep_compound_page
>       0.05 =C4=85 47%      +0.4        0.43 =C4=85  9%  perf-profile.self=
.cycles-pp.free_unref_page_prepare
>       0.08 =C4=85  7%      +0.5        0.57 =C4=85 23%  perf-profile.self=
.cycles-pp.__cond_resched
>       0.08 =C4=85 12%      +0.5        0.58 =C4=85  5%  perf-profile.self=
.cycles-pp.release_pages
>       0.10 =C4=85 10%      +0.5        0.63 =C4=85  6%  perf-profile.self=
.cycles-pp.__mod_memcg_lruvec_state
>       0.00            +1.1        1.11 =C4=85  7%  perf-profile.self.cycl=
es-pp.__split_huge_pmd_locked
>       0.00            +1.2        1.18 =C4=85  4%  perf-profile.self.cycl=
es-pp.page_add_anon_rmap
>       0.03 =C4=85101%      +1.3        1.35 =C4=85  7%  perf-profile.self=
.cycles-pp.page_remove_rmap
>       0.82 =C4=85  5%     +16.1       16.88 =C4=85  7%  perf-profile.self=
.cycles-pp.clear_page_erms
>      11.65 =C4=85  3%     +20.2       31.88 =C4=85  2%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
>
>
> *************************************************************************=
**************************
> lkp-spr-2sp4: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (S=
apphire Rapids) with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> array_size/compiler/cpufreq_governor/iterations/kconfig/loop/nr_threads/o=
mp/rootfs/tbox_group/testcase:
>   50000000/gcc-12/performance/10x/x86_64-rhel-8.3/100/25%/true/debian-11.=
1-x86_64-20220510.cgz/lkp-spr-2sp4/stream
>
> commit:
>   30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
>   1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")
>
> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      10.50 =C4=85 14%     +55.6%      16.33 =C4=85 16%  perf-c2c.DRAM.loc=
al
>       6724           -11.4%       5954 =C4=85  2%  vmstat.system.cs
>  2.746e+09           +16.7%  3.205e+09 =C4=85  2%  cpuidle..time
>    2771516           +16.0%    3213723 =C4=85  2%  cpuidle..usage
>       0.06 =C4=85  4%      -0.0        0.05 =C4=85  5%  mpstat.cpu.all.so=
ft%
>       0.47 =C4=85  2%      -0.1        0.39 =C4=85  2%  mpstat.cpu.all.sy=
s%
>       0.01 =C4=85 85%   +1700.0%       0.20 =C4=85188%  perf-sched.sch_de=
lay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
>      15.11 =C4=85 13%     -28.8%      10.76 =C4=85 34%  perf-sched.wait_a=
nd_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>      15.09 =C4=85 13%     -30.3%      10.51 =C4=85 38%  perf-sched.wait_t=
ime.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
>    1023952           +13.4%    1161219        meminfo.AnonHugePages
>    1319741           +10.8%    1461995        meminfo.AnonPages
>    1331039           +11.2%    1480149        meminfo.Inactive
>    1330865           +11.2%    1479975        meminfo.Inactive(anon)
>    1266202           +16.0%    1469399 =C4=85  2%  turbostat.C1E
>    1509871           +16.6%    1760853 =C4=85  2%  turbostat.C6
>    3521203           +17.4%    4134075 =C4=85  3%  turbostat.IRQ
>     580.32            -3.8%     558.30        turbostat.PkgWatt
>      77.42           -14.0%      66.60 =C4=85  2%  turbostat.RAMWatt
>     330416           +10.8%     366020        proc-vmstat.nr_anon_pages
>     500.90           +13.4%     567.99        proc-vmstat.nr_anon_transpa=
rent_hugepages
>     333197           +11.2%     370536        proc-vmstat.nr_inactive_ano=
n
>     333197           +11.2%     370536        proc-vmstat.nr_zone_inactiv=
e_anon
>     129879 =C4=85 11%     -46.7%      69207 =C4=85 12%  proc-vmstat.numa_=
pages_migrated
>    3879028            +5.9%    4109180        proc-vmstat.pgalloc_normal
>    3403414            +6.6%    3628929        proc-vmstat.pgfree
>     129879 =C4=85 11%     -46.7%      69207 =C4=85 12%  proc-vmstat.pgmig=
rate_success
>       5763            +9.8%       6327        proc-vmstat.thp_fault_alloc
>     350993           -15.6%     296081 =C4=85  2%  stream.add_bandwidth_M=
Bps
>     349830           -16.1%     293492 =C4=85  2%  stream.add_bandwidth_M=
Bps_harmonicMean
>     333973           -20.5%     265439 =C4=85  3%  stream.copy_bandwidth_=
MBps
>     332930           -21.7%     260548 =C4=85  3%  stream.copy_bandwidth_=
MBps_harmonicMean
>     302788           -16.2%     253817 =C4=85  2%  stream.scale_bandwidth=
_MBps
>     302157           -17.1%     250577 =C4=85  2%  stream.scale_bandwidth=
_MBps_harmonicMean
>    1177276            +9.3%    1286614        stream.time.maximum_residen=
t_set_size
>       5038            +1.1%       5095        stream.time.percent_of_cpu_=
this_job_got
>     694.19 =C4=85  2%     +19.5%     829.85 =C4=85  2%  stream.time.user_=
time
>     339047           -12.1%     298061        stream.triad_bandwidth_MBps
>     338186           -12.4%     296218        stream.triad_bandwidth_MBps=
_harmonicMean
>       8.42 =C4=85100%      -8.4        0.00        perf-profile.calltrace=
.cycles-pp.asm_sysvec_reschedule_ipi
>       8.42 =C4=85100%      -8.4        0.00        perf-profile.calltrace=
.cycles-pp.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
>       8.42 =C4=85100%      -8.4        0.00        perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_=
reschedule_ipi
>       8.42 =C4=85100%      -8.4        0.00        perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_t=
o_user_mode.asm_sysvec_reschedule_ipi
>       8.42 =C4=85100%      -8.4        0.00        perf-profile.calltrace=
.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mo=
de_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
>       8.42 =C4=85100%      -8.4        0.00        perf-profile.calltrace=
.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit=
_to_user_mode_prepare.irqentry_exit_to_user_mode
>       0.84 =C4=85103%      +1.7        2.57 =C4=85 59%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle=
_enter.cpuidle_idle_call.do_idle
>       0.84 =C4=85103%      +1.7        2.57 =C4=85 59%  perf-profile.call=
trace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt=
.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
>       0.31 =C4=85223%      +2.0        2.33 =C4=85 44%  perf-profile.call=
trace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.a=
sm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
>       0.31 =C4=85223%      +2.0        2.33 =C4=85 44%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic=
_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>       3.07 =C4=85 56%      +2.8        5.88 =C4=85 28%  perf-profile.call=
trace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>       8.42 =C4=85100%      -8.4        0.00        perf-profile.children.=
cycles-pp.asm_sysvec_reschedule_ipi
>       8.42 =C4=85100%      -8.1        0.36 =C4=85223%  perf-profile.chil=
dren.cycles-pp.irqentry_exit_to_user_mode
>      12.32 =C4=85 25%      -6.6        5.69 =C4=85 69%  perf-profile.chil=
dren.cycles-pp.vsnprintf
>      12.76 =C4=85 27%      -6.6        6.19 =C4=85 67%  perf-profile.chil=
dren.cycles-pp.seq_printf
>       3.07 =C4=85 56%      +2.8        5.88 =C4=85 28%  perf-profile.chil=
dren.cycles-pp.__x64_sys_exit_group
>      40.11           -11.0%      35.71 =C4=85  2%  perf-stat.i.MPKI
>  1.563e+10           -12.3%  1.371e+10 =C4=85  2%  perf-stat.i.branch-ins=
tructions
>  3.721e+09 =C4=85  2%     -23.2%  2.858e+09 =C4=85  4%  perf-stat.i.cache=
-misses
>  4.471e+09 =C4=85  3%     -22.7%  3.458e+09 =C4=85  4%  perf-stat.i.cache=
-references
>       5970 =C4=85  5%     -15.9%       5021 =C4=85  4%  perf-stat.i.conte=
xt-switches
>       1.66 =C4=85  2%     +15.8%       1.92 =C4=85  2%  perf-stat.i.cpi
>      41.83 =C4=85  4%     +30.6%      54.63 =C4=85  4%  perf-stat.i.cycle=
s-between-cache-misses
>  2.282e+10 =C4=85  2%     -14.5%  1.952e+10 =C4=85  2%  perf-stat.i.dTLB-=
loads
>     572602 =C4=85  3%      -9.2%     519922 =C4=85  5%  perf-stat.i.dTLB-=
store-misses
>  1.483e+10 =C4=85  2%     -15.7%   1.25e+10 =C4=85  2%  perf-stat.i.dTLB-=
stores
>  9.179e+10           -13.7%  7.924e+10 =C4=85  2%  perf-stat.i.instructio=
ns
>       0.61           -13.4%       0.52 =C4=85  2%  perf-stat.i.ipc
>     373.79 =C4=85  4%     -37.8%     232.60 =C4=85  9%  perf-stat.i.metri=
c.K/sec
>     251.45           -13.4%     217.72 =C4=85  2%  perf-stat.i.metric.M/s=
ec
>      21446 =C4=85  3%     -24.1%      16278 =C4=85  8%  perf-stat.i.minor=
-faults
>      15.07 =C4=85  5%      -6.0        9.10 =C4=85 10%  perf-stat.i.node-=
load-miss-rate%
>   68275790 =C4=85  5%     -44.9%   37626128 =C4=85 12%  perf-stat.i.node-=
load-misses
>      21448 =C4=85  3%     -24.1%      16281 =C4=85  8%  perf-stat.i.page-=
faults
>      40.71           -11.3%      36.10 =C4=85  2%  perf-stat.overall.MPKI
>       1.67           +15.3%       1.93 =C4=85  2%  perf-stat.overall.cpi
>      41.07 =C4=85  3%     +30.1%      53.42 =C4=85  4%  perf-stat.overall=
.cycles-between-cache-misses
>       0.00 =C4=85  2%      +0.0        0.00 =C4=85  2%  perf-stat.overall=
.dTLB-store-miss-rate%
>       0.60           -13.2%       0.52 =C4=85  2%  perf-stat.overall.ipc
>      15.19 =C4=85  5%      -6.2        9.03 =C4=85 11%  perf-stat.overall=
.node-load-miss-rate%
>    1.4e+10            -9.3%  1.269e+10        perf-stat.ps.branch-instruc=
tions
>  3.352e+09 =C4=85  3%     -20.9%  2.652e+09 =C4=85  4%  perf-stat.ps.cach=
e-misses
>  4.026e+09 =C4=85  3%     -20.3%  3.208e+09 =C4=85  4%  perf-stat.ps.cach=
e-references
>       4888 =C4=85  4%     -10.8%       4362 =C4=85  3%  perf-stat.ps.cont=
ext-switches
>     206092            +2.1%     210375        perf-stat.ps.cpu-clock
>  1.375e+11            +2.8%  1.414e+11        perf-stat.ps.cpu-cycles
>     258.23 =C4=85  5%      +8.8%     280.85 =C4=85  4%  perf-stat.ps.cpu-=
migrations
>  2.048e+10           -11.7%  1.809e+10 =C4=85  2%  perf-stat.ps.dTLB-load=
s
>  1.333e+10 =C4=85  2%     -13.0%   1.16e+10 =C4=85  2%  perf-stat.ps.dTLB=
-stores
>  8.231e+10           -10.8%  7.342e+10        perf-stat.ps.instructions
>      15755 =C4=85  3%     -16.3%      13187 =C4=85  6%  perf-stat.ps.mino=
r-faults
>   61706790 =C4=85  6%     -43.8%   34699716 =C4=85 11%  perf-stat.ps.node=
-load-misses
>      15757 =C4=85  3%     -16.3%      13189 =C4=85  6%  perf-stat.ps.page=
-faults
>     206092            +2.1%     210375        perf-stat.ps.task-clock
>  1.217e+12            +4.1%  1.267e+12 =C4=85  2%  perf-stat.total.instru=
ctions
>
>
>
> *************************************************************************=
**************************
> lkp-cfl-d1: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz =
(Coffee Lake) with 16G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/tes=
t/testcase:
>   gcc-12/performance/x86_64-rhel-8.3/Average/Integer/debian-x86_64-phoron=
ix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite
>
> commit:
>   30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
>   1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")
>
> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>     232.12 =C4=85  7%     -12.0%     204.18 =C4=85  8%  sched_debug.cfs_r=
q:/.load_avg.stddev
>       6797            -3.3%       6576        vmstat.system.cs
>      15161            -0.9%      15029        vmstat.system.in
>     349927           +44.3%     504820        meminfo.AnonHugePages
>     507807           +27.1%     645169        meminfo.AnonPages
>    1499332           +10.2%    1652612        meminfo.Inactive(anon)
>       8.67 =C4=85 62%    +184.6%      24.67 =C4=85 25%  turbostat.C10
>       1.50            -0.1        1.45        turbostat.C1E%
>       3.30            -3.2%       3.20        turbostat.RAMWatt
>       1.40 =C4=85 14%      -0.3        1.09 =C4=85 13%  perf-profile.call=
trace.cycles-pp.asm_exc_page_fault
>       1.44 =C4=85 12%      -0.3        1.12 =C4=85 13%  perf-profile.chil=
dren.cycles-pp.asm_exc_page_fault
>       0.03 =C4=85141%      +0.1        0.10 =C4=85 30%  perf-profile.chil=
dren.cycles-pp.next_uptodate_folio
>       0.02 =C4=85141%      +0.1        0.10 =C4=85 22%  perf-profile.chil=
dren.cycles-pp.rcu_nocb_flush_deferred_wakeup
>       0.02 =C4=85143%      +0.1        0.10 =C4=85 25%  perf-profile.self=
.cycles-pp.next_uptodate_folio
>       0.01 =C4=85223%      +0.1        0.09 =C4=85 19%  perf-profile.self=
.cycles-pp.rcu_nocb_flush_deferred_wakeup
>      19806            -3.5%      19109        phoronix-test-suite.ramspee=
d.Average.Integer.mb_s
>     283.70            +3.8%     294.50        phoronix-test-suite.time.el=
apsed_time
>     283.70            +3.8%     294.50        phoronix-test-suite.time.el=
apsed_time.max
>     120454            +1.6%     122334        phoronix-test-suite.time.ma=
ximum_resident_set_size
>     281337           -54.8%     127194        phoronix-test-suite.time.mi=
nor_page_faults
>     259.13            +4.1%     269.81        phoronix-test-suite.time.us=
er_time
>     126951           +27.0%     161291        proc-vmstat.nr_anon_pages
>     170.86           +44.3%     246.49        proc-vmstat.nr_anon_transpa=
rent_hugepages
>     355917            -1.0%     352250        proc-vmstat.nr_dirty_backgr=
ound_threshold
>     712705            -1.0%     705362        proc-vmstat.nr_dirty_thresh=
old
>    3265201            -1.1%    3228465        proc-vmstat.nr_free_pages
>     374833           +10.2%     413153        proc-vmstat.nr_inactive_ano=
n
>       1767            +4.8%       1853        proc-vmstat.nr_page_table_p=
ages
>     374833           +10.2%     413153        proc-vmstat.nr_zone_inactiv=
e_anon
>     854665           -34.3%     561406        proc-vmstat.numa_hit
>     854632           -34.3%     561397        proc-vmstat.numa_local
>    5548755            +1.1%    5610598        proc-vmstat.pgalloc_normal
>    1083315           -26.2%     799129        proc-vmstat.pgfault
>     113425            +3.7%     117656        proc-vmstat.pgreuse
>       9025            +7.6%       9714        proc-vmstat.thp_fault_alloc
>       3.38            +0.1        3.45        perf-stat.i.branch-miss-rat=
e%
>  4.135e+08            -3.2%  4.003e+08        perf-stat.i.cache-misses
>  5.341e+08            -2.7%  5.197e+08        perf-stat.i.cache-reference=
s
>       6832            -3.4%       6600        perf-stat.i.context-switche=
s
>       4.06            +3.1%       4.19        perf-stat.i.cpi
>     438639 =C4=85  5%     -18.7%     356730 =C4=85  6%  perf-stat.i.dTLB-=
load-misses
>  1.119e+09            -3.8%  1.077e+09        perf-stat.i.dTLB-loads
>       0.02 =C4=85 15%      -0.0        0.01 =C4=85 26%  perf-stat.i.dTLB-=
store-miss-rate%
>      80407 =C4=85 10%     -63.5%      29387 =C4=85 23%  perf-stat.i.dTLB-=
store-misses
>  7.319e+08            -3.8%  7.043e+08        perf-stat.i.dTLB-stores
>      57.72            +0.8       58.52        perf-stat.i.iTLB-load-miss-=
rate%
>     129846            -3.8%     124973        perf-stat.i.iTLB-load-misse=
s
>     144448            -5.3%     136837        perf-stat.i.iTLB-loads
>  2.389e+09            -3.5%  2.305e+09        perf-stat.i.instructions
>       0.28            -2.9%       0.27        perf-stat.i.ipc
>     220.59            -3.4%     213.11        perf-stat.i.metric.M/sec
>       3610           -31.2%       2483        perf-stat.i.minor-faults
>   49238342            +1.1%   49776834        perf-stat.i.node-loads
>   98106028            -3.1%   95018390        perf-stat.i.node-stores
>       3615           -31.2%       2487        perf-stat.i.page-faults
>       3.65            +3.7%       3.78        perf-stat.overall.cpi
>      21.08            +3.3%      21.79        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.04 =C4=85  5%      -0.0        0.03 =C4=85  6%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.01 =C4=85 10%      -0.0        0.00 =C4=85 23%  perf-stat.overall=
.dTLB-store-miss-rate%
>       0.27            -3.6%       0.26        perf-stat.overall.ipc
>  4.122e+08            -3.2%   3.99e+08        perf-stat.ps.cache-misses
>  5.324e+08            -2.7%  5.181e+08        perf-stat.ps.cache-referenc=
es
>       6809            -3.4%       6580        perf-stat.ps.context-switch=
es
>     437062 =C4=85  5%     -18.7%     355481 =C4=85  6%  perf-stat.ps.dTLB=
-load-misses
>  1.115e+09            -3.8%  1.073e+09        perf-stat.ps.dTLB-loads
>      80134 =C4=85 10%     -63.5%      29283 =C4=85 23%  perf-stat.ps.dTLB=
-store-misses
>  7.295e+08            -3.8%  7.021e+08        perf-stat.ps.dTLB-stores
>     129362            -3.7%     124535        perf-stat.ps.iTLB-load-miss=
es
>     143865            -5.2%     136338        perf-stat.ps.iTLB-loads
>  2.381e+09            -3.5%  2.297e+09        perf-stat.ps.instructions
>       3596           -31.2%       2473        perf-stat.ps.minor-faults
>   49081949            +1.1%   49621463        perf-stat.ps.node-loads
>   97795918            -3.1%   94724831        perf-stat.ps.node-stores
>       3600           -31.2%       2477        perf-stat.ps.page-faults
>
>
>
> *************************************************************************=
**************************
> lkp-cfl-d1: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz =
(Coffee Lake) with 16G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/tes=
t/testcase:
>   gcc-12/performance/x86_64-rhel-8.3/Average/Floating Point/debian-x86_64=
-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite
>
> commit:
>   30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
>   1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")
>
> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>     167.28 =C4=85  5%     -13.1%     145.32 =C4=85  6%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>       6845            -2.5%       6674        vmstat.system.cs
>     351910 =C4=85  2%     +40.2%     493341        meminfo.AnonHugePages
>     505908           +27.2%     643328        meminfo.AnonPages
>    1497656           +10.2%    1650453        meminfo.Inactive(anon)
>      18957 =C4=85 13%     +26.3%      23947 =C4=85 17%  turbostat.C1
>       1.52            -0.0        1.48        turbostat.C1E%
>       3.32            -2.9%       3.23        turbostat.RAMWatt
>      19978            -3.0%      19379        phoronix-test-suite.ramspee=
d.Average.FloatingPoint.mb_s
>     280.71            +3.3%     289.93        phoronix-test-suite.time.el=
apsed_time
>     280.71            +3.3%     289.93        phoronix-test-suite.time.el=
apsed_time.max
>     120465            +1.5%     122257        phoronix-test-suite.time.ma=
ximum_resident_set_size
>     281047           -54.7%     127190        phoronix-test-suite.time.mi=
nor_page_faults
>     257.03            +3.5%     265.95        phoronix-test-suite.time.us=
er_time
>     126473           +27.2%     160831        proc-vmstat.nr_anon_pages
>     171.83 =C4=85  2%     +40.2%     240.89        proc-vmstat.nr_anon_tr=
ansparent_hugepages
>     355973            -1.0%     352304        proc-vmstat.nr_dirty_backgr=
ound_threshold
>     712818            -1.0%     705471        proc-vmstat.nr_dirty_thresh=
old
>    3265800            -1.1%    3228879        proc-vmstat.nr_free_pages
>     374410           +10.2%     412613        proc-vmstat.nr_inactive_ano=
n
>       1770            +4.4%       1848        proc-vmstat.nr_page_table_p=
ages
>     374410           +10.2%     412613        proc-vmstat.nr_zone_inactiv=
e_anon
>     852082           -34.9%     555093        proc-vmstat.numa_hit
>     852125           -34.9%     555018        proc-vmstat.numa_local
>    1078293           -26.6%     791038        proc-vmstat.pgfault
>     112693            +2.9%     116004        proc-vmstat.pgreuse
>       9025            +7.6%       9713        proc-vmstat.thp_fault_alloc
>       3.63 =C4=85  6%      +0.6        4.25 =C4=85  9%  perf-profile.call=
trace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_=
interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       0.25 =C4=85 55%      -0.2        0.08 =C4=85 68%  perf-profile.chil=
dren.cycles-pp.ret_from_fork_asm
>       0.25 =C4=85 55%      -0.2        0.08 =C4=85 68%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       0.23 =C4=85 56%      -0.2        0.07 =C4=85 69%  perf-profile.chil=
dren.cycles-pp.kthread
>       0.14 =C4=85 36%      -0.1        0.05 =C4=85120%  perf-profile.chil=
dren.cycles-pp.do_anonymous_page
>       0.14 =C4=85 35%      -0.1        0.05 =C4=85 76%  perf-profile.chil=
dren.cycles-pp.copy_mc_enhanced_fast_string
>       0.04 =C4=85 72%      +0.0        0.08 =C4=85 19%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       0.04 =C4=85118%      +0.1        0.10 =C4=85 36%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       0.07 =C4=85 79%      +0.1        0.17 =C4=85 21%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       7.99 =C4=85 11%      +1.0        9.02 =C4=85  5%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_apic_timer_interrupt
>       0.23 =C4=85 28%      -0.1        0.14 =C4=85 49%  perf-profile.self=
.cycles-pp.irqentry_exit_to_user_mode
>       0.14 =C4=85 35%      -0.1        0.05 =C4=85 76%  perf-profile.self=
.cycles-pp.copy_mc_enhanced_fast_string
>       0.06 =C4=85 79%      +0.1        0.16 =C4=85 21%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.21 =C4=85 34%      +0.2        0.36 =C4=85 18%  perf-profile.self=
.cycles-pp.ktime_get
>  1.187e+08            -4.6%  1.133e+08        perf-stat.i.branch-instruct=
ions
>       3.36            +0.1        3.42        perf-stat.i.branch-miss-rat=
e%
>    5492420            -3.9%    5275592        perf-stat.i.branch-misses
>  4.148e+08            -2.8%  4.034e+08        perf-stat.i.cache-misses
>  5.251e+08            -2.6%  5.114e+08        perf-stat.i.cache-reference=
s
>       6880            -2.5%       6711        perf-stat.i.context-switche=
s
>       4.30            +2.9%       4.43        perf-stat.i.cpi
>       0.10 =C4=85  7%      -0.0        0.09 =C4=85  2%  perf-stat.i.dTLB-=
load-miss-rate%
>     472268 =C4=85  6%     -19.9%     378489        perf-stat.i.dTLB-load-=
misses
>  8.107e+08            -3.4%  7.831e+08        perf-stat.i.dTLB-loads
>       0.02 =C4=85 16%      -0.0        0.01 =C4=85  2%  perf-stat.i.dTLB-=
store-miss-rate%
>      90535 =C4=85 11%     -59.8%      36371 =C4=85  2%  perf-stat.i.dTLB-=
store-misses
>  5.323e+08            -3.3%  5.145e+08        perf-stat.i.dTLB-stores
>     129981            -3.0%     126061        perf-stat.i.iTLB-load-misse=
s
>     143662            -3.1%     139223        perf-stat.i.iTLB-loads
>  2.253e+09            -3.6%  2.172e+09        perf-stat.i.instructions
>       0.26            -3.2%       0.25        perf-stat.i.ipc
>       4.71 =C4=85  2%      -6.4%       4.41 =C4=85  2%  perf-stat.i.major=
-faults
>     180.03            -3.0%     174.57        perf-stat.i.metric.M/sec
>       3627           -30.8%       2510 =C4=85  2%  perf-stat.i.minor-faul=
ts
>       3632           -30.8%       2514 =C4=85  2%  perf-stat.i.page-fault=
s
>       3.88            +3.6%       4.02        perf-stat.overall.cpi
>      21.08            +2.7%      21.65        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.06 =C4=85  6%      -0.0        0.05        perf-stat.overall.dTLB=
-load-miss-rate%
>       0.02 =C4=85 11%      -0.0        0.01 =C4=85  2%  perf-stat.overall=
.dTLB-store-miss-rate%
>       0.26            -3.5%       0.25        perf-stat.overall.ipc
>  1.182e+08            -4.6%  1.128e+08        perf-stat.ps.branch-instruc=
tions
>    5468166            -4.0%    5251939        perf-stat.ps.branch-misses
>  4.135e+08            -2.7%  4.021e+08        perf-stat.ps.cache-misses
>  5.234e+08            -2.6%  5.098e+08        perf-stat.ps.cache-referenc=
es
>       6859            -2.5%       6685        perf-stat.ps.context-switch=
es
>     470567 =C4=85  6%     -19.9%     377127        perf-stat.ps.dTLB-load=
-misses
>  8.079e+08            -3.4%  7.805e+08        perf-stat.ps.dTLB-loads
>      90221 =C4=85 11%     -59.8%      36239 =C4=85  2%  perf-stat.ps.dTLB=
-store-misses
>  5.305e+08            -3.3%  5.128e+08        perf-stat.ps.dTLB-stores
>     129499            -3.0%     125601        perf-stat.ps.iTLB-load-miss=
es
>     143121            -3.1%     138638        perf-stat.ps.iTLB-loads
>  2.246e+09            -3.6%  2.165e+09        perf-stat.ps.instructions
>       4.69 =C4=85  2%      -6.3%       4.39 =C4=85  2%  perf-stat.ps.majo=
r-faults
>       3613           -30.8%       2500 =C4=85  2%  perf-stat.ps.minor-fau=
lts
>       3617           -30.8%       2504 =C4=85  2%  perf-stat.ps.page-faul=
ts
>
>
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
