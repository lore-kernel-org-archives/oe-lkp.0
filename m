Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FC910EA
	for <oe-lkp@lists.linux.dev>; Tue, 18 Jul 2023 06:43:28 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-483ad06a37aso1612052e0c.1
        for <oe-lkp@lists.linux.dev>; Mon, 17 Jul 2023 23:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689662608; x=1692254608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs4/JN+SGNglqVl0BTUsPvR4Ahoeq7bs9fb0psotYic=;
        b=MjSzjRDMVbyHP/sz4x9Vn7NLCDapM1/273TL8Brv7T7A0Td5aFXdPxioRlcDtCIsKj
         9VfwvqDG1A4UgY/HMzv8TvyjkFK2E1+ixKV6arj5DCPCyUQZxsGnx0+xL3L3/Vn/OFFe
         I7soTwRisPAT+4JotHNdSsarFaWJmWKN66GQfSJX3q1jpU32HTAL4vKK0pU+e3xlX2qM
         5xRim21RFxqHV6+SABthRUso0tEgk/sJzuHKEtUJ/uFsL5maC7Oee/NWxP0ylWgphFvX
         jSSppZ/gRCsRvmljxKrLrHndoCCi991vi2Mc4ai4paKrCmvyb1F/F7isr3CpiIb5V7Js
         TZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689662608; x=1692254608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs4/JN+SGNglqVl0BTUsPvR4Ahoeq7bs9fb0psotYic=;
        b=EyTGTbNqb0F+u+kZ0au+FDvrQ0UIG/EzhoykP1heqJIwWNUxm3cv/gphw0nzY+z6BB
         rRgg2MTxdWrAuH/SL/Bznc/xuw4mS5aKBgI96J8Dm8MYynYEkGRbcL9Oc0shi6+YS8mE
         ZJ/3LX7QnR5+m6AB7mVfxJFHFa6Xe0rThjn6nEN10n2jUmmfVqlFqAhNhDIfnuvvMQwu
         aewmcxfcMwkaeNoaK/TVOssa0YzL4Vqu8igjI0BwDHZoojtoF+2tDKRM4a9oha9EagFC
         YKpO3aG/3eWqk0dl8IM00ZppVClp64sfWMIKPXrcTKr0iZzWVxHI+P+qCvpQMUaE7qnV
         EWQQ==
X-Gm-Message-State: ABy/qLYwRmJAV72QHG+kC6uNQzeg5VP51junz+pcsf7VxIxzLF071cju
	nPclHrIFYFEC1YZ/h9ST5AqFh5vsyOl9YWc9t1U=
X-Google-Smtp-Source: APBJJlECDZiAdfMX1ZEgZezkS2XZ5MVclKTltxBlDZR8n7Y1OfKrGksOQmnXceuV1rgMZfZSfqcCR/4fa4NxysKHwI0=
X-Received: by 2002:a05:6122:4301:b0:477:4872:7f9d with SMTP id
 cp1-20020a056122430100b0047748727f9dmr349746vkb.4.1689662607607; Mon, 17 Jul
 2023 23:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230628095740.589893-1-jaypatel@linux.ibm.com> <202307172140.3b34825a-oliver.sang@intel.com>
In-Reply-To: <202307172140.3b34825a-oliver.sang@intel.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Tue, 18 Jul 2023 15:43:16 +0900
Message-ID: <CAB=+i9QY99=NzQugoMCdbEwkCKJObxx4DwWXwNjMqyMRYrgOHA@mail.gmail.com>
Subject: Re: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
To: kernel test robot <oliver.sang@intel.com>
Cc: Jay Patel <jaypatel@linux.ibm.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-mm@kvack.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com, cl@linux.com, penberg@kernel.org, rientjes@google.com, 
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	aneesh.kumar@linux.ibm.com, tsahu@linux.ibm.com, piyushs@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 10:41=E2=80=AFPM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -12.5% regression of hackbench.throughput on:
>
>
> commit: a0fd217e6d6fbd23e91f8796787b621e7d576088 ("[PATCH] [RFC PATCH v2]=
mm/slub: Optimize slub memory usage")
> url: https://github.com/intel-lab-lkp/linux/commits/Jay-Patel/mm-slub-Opt=
imize-slub-memory-usage/20230628-180050
> base: git://git.kernel.org/cgit/linux/kernel/git/vbabka/slab.git for-next
> patch link: https://lore.kernel.org/all/20230628095740.589893-1-jaypatel@=
linux.ibm.com/
> patch subject: [PATCH] [RFC PATCH v2]mm/slub: Optimize slub memory usage
>
> testcase: hackbench
> test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00=
GHz (Ice Lake) with 256G memory
> parameters:
>
>         nr_threads: 100%
>         iterations: 4
>         mode: process
>         ipc: socket
>         cpufreq_governor: performance
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202307172140.3b34825a-oliver.san=
g@intel.com
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
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
> commit:
>   7bc162d5cc ("Merge branches 'slab/for-6.5/prandom', 'slab/for-6.5/slab_=
no_merge' and 'slab/for-6.5/slab-deprecate' into slab/for-next")
>   a0fd217e6d ("mm/slub: Optimize slub memory usage")
>
> 7bc162d5cc4de5c3 a0fd217e6d6fbd23e91f8796787
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>     222503 =C4=85 86%    +108.7%     464342 =C4=85 58%  numa-meminfo.node=
1.Active
>     222459 =C4=85 86%    +108.7%     464294 =C4=85 58%  numa-meminfo.node=
1.Active(anon)
>      55573 =C4=85 85%    +108.0%     115619 =C4=85 58%  numa-vmstat.node1=
.nr_active_anon
>      55573 =C4=85 85%    +108.0%     115618 =C4=85 58%  numa-vmstat.node1=
.nr_zone_active_anon

I'm quite baffled while reading this.
How did changing slab order calculation double the number of active anon pa=
ges?
I doubt two experiments were performed on the same settings.

>    1377834 =C4=85  2%     -10.7%    1230013        sched_debug.cpu.nr_swi=
tches.avg
>    1218144 =C4=85  2%     -13.3%    1055659 =C4=85  2%  sched_debug.cpu.n=
r_switches.min
>    3047631 =C4=85  2%     -13.2%    2646560        vmstat.system.cs
>     561797           -13.8%     484137        vmstat.system.in
>     280976 =C4=85 66%    +122.6%     625459 =C4=85 52%  meminfo.Active
>     280881 =C4=85 66%    +122.6%     625365 =C4=85 52%  meminfo.Active(an=
on)
>     743351 =C4=85  4%      -9.7%     671534 =C4=85  6%  meminfo.AnonPages
>       1.36            -0.1        1.21        mpstat.cpu.all.irq%
>       0.04 =C4=85  4%      -0.0        0.03 =C4=85  4%  mpstat.cpu.all.so=
ft%
>       5.38            -0.8        4.58        mpstat.cpu.all.usr%
>       0.26           -11.9%       0.23        turbostat.IPC
>     160.93           -19.3      141.61        turbostat.PKG_%
>      60.48            -8.9%      55.10        turbostat.RAMWatt
>      70049 =C4=85 68%    +124.5%     157279 =C4=85 52%  proc-vmstat.nr_ac=
tive_anon
>     185963 =C4=85  4%      -9.8%     167802 =C4=85  6%  proc-vmstat.nr_an=
on_pages
>      37302            -1.2%      36837        proc-vmstat.nr_slab_reclaim=
able
>      70049 =C4=85 68%    +124.5%     157279 =C4=85 52%  proc-vmstat.nr_zo=
ne_active_anon
>    1101451           +12.0%    1233638        proc-vmstat.unevictable_pgs=
_scanned
>     477310           -12.5%     417480        hackbench.throughput
>     464064           -12.0%     408333        hackbench.throughput_avg
>     477310           -12.5%     417480        hackbench.throughput_best
>     435294            -9.5%     394098        hackbench.throughput_worst
>     131.28           +13.4%     148.89        hackbench.time.elapsed_time
>     131.28           +13.4%     148.89        hackbench.time.elapsed_time=
.max
>   90404617            -5.2%   85662614 =C4=85  2%  hackbench.time.involun=
tary_context_switches
>      15342           +15.0%      17642        hackbench.time.system_time
>     866.32            -3.2%     838.32        hackbench.time.user_time
>  4.581e+10           -11.2%  4.069e+10        perf-stat.i.branch-instruct=
ions
>       0.45            +0.1        0.56        perf-stat.i.branch-miss-rat=
e%
>  2.024e+08           +11.8%  2.263e+08        perf-stat.i.branch-misses
>      21.49            -1.1       20.42        perf-stat.i.cache-miss-rate=
%
>  4.202e+08           -16.6%  3.505e+08        perf-stat.i.cache-misses
>  1.935e+09           -11.5%  1.711e+09        perf-stat.i.cache-reference=
s
>    3115707 =C4=85  2%     -13.9%    2681887        perf-stat.i.context-sw=
itches
>       1.31           +13.2%       1.48        perf-stat.i.cpi
>     375155 =C4=85  3%     -16.3%     314001 =C4=85  2%  perf-stat.i.cpu-m=
igrations
>  6.727e+10           -11.2%  5.972e+10        perf-stat.i.dTLB-loads
>  4.169e+10           -12.2%  3.661e+10        perf-stat.i.dTLB-stores
>  2.465e+11           -11.4%  2.185e+11        perf-stat.i.instructions
>       0.77           -11.8%       0.68        perf-stat.i.ipc
>     818.18 =C4=85  5%     +61.8%       1323 =C4=85  2%  perf-stat.i.metri=
c.K/sec
>       1225           -11.6%       1083        perf-stat.i.metric.M/sec
>      11341 =C4=85  4%     -12.6%       9916 =C4=85  4%  perf-stat.i.minor=
-faults
>   1.27e+08           -13.2%  1.102e+08        perf-stat.i.node-load-misse=
s
>    3376198           -15.4%    2855906        perf-stat.i.node-loads
>   72756698           -22.9%   56082330        perf-stat.i.node-store-miss=
es
>    4118986 =C4=85  2%     -19.3%    3322276        perf-stat.i.node-store=
s
>      11432 =C4=85  3%     -12.6%       9991 =C4=85  4%  perf-stat.i.page-=
faults
>       0.44            +0.1        0.56        perf-stat.overall.branch-mi=
ss-rate%
>      21.76            -1.3       20.49        perf-stat.overall.cache-mis=
s-rate%
>       1.29           +13.5%       1.47        perf-stat.overall.cpi
>     755.39           +21.1%     914.82        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.77           -11.9%       0.68        perf-stat.overall.ipc
>  4.546e+10           -11.0%  4.046e+10        perf-stat.ps.branch-instruc=
tions
>  2.006e+08           +12.0%  2.246e+08        perf-stat.ps.branch-misses
>  4.183e+08           -16.8%   3.48e+08        perf-stat.ps.cache-misses
>  1.923e+09           -11.7%  1.699e+09        perf-stat.ps.cache-referenc=
es
>    3073921 =C4=85  2%     -13.9%    2647497        perf-stat.ps.context-s=
witches
>     367849 =C4=85  3%     -16.1%     308496 =C4=85  2%  perf-stat.ps.cpu-=
migrations
>  6.683e+10           -11.2%  5.938e+10        perf-stat.ps.dTLB-loads
>  4.144e+10           -12.2%  3.639e+10        perf-stat.ps.dTLB-stores
>  2.447e+11           -11.2%  2.172e+11        perf-stat.ps.instructions
>      10654 =C4=85  4%     -11.5%       9428 =C4=85  4%  perf-stat.ps.mino=
r-faults
>  1.266e+08           -13.5%  1.095e+08        perf-stat.ps.node-load-miss=
es
>    3361116           -15.6%    2836863        perf-stat.ps.node-loads
>   72294146           -23.1%   55573600        perf-stat.ps.node-store-mis=
ses
>    4043240 =C4=85  2%     -19.4%    3258771        perf-stat.ps.node-stor=
es
>      10734 =C4=85  4%     -11.6%       9494 =C4=85  4%  perf-stat.ps.page=
-faults

<...>

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
>
