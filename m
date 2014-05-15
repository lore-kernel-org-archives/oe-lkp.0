Content-Type: multipart/mixed; boundary="===============6144435886954056834=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [uprobes/x86] 8ad8e9d3fd6: -7.5% aim7.2000.jobs-per-min, -45.7% turbostat.%c1
Date: Thu, 15 May 2014 14:33:32 +0200
Message-ID: <20140515123332.GA15139@redhat.com>
In-Reply-To: <53743B03.7030404@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6144435886954056834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jet,

On 05/15, Jet Chen wrote:
>
> we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 8ad8e9d3fd64f101eed6652964670672d699e563 ("uprobes/x86: Introduce =
uprobe_xol_ops and arch_uprobe->ops")
>
> Test case: lkp-snb01/aim7/signal_test
>
> 34e7317d6ae8f61  8ad8e9d3fd64f101eed665296
> ---------------  -------------------------
>     230689 ~ 0%      -7.5%     213485 ~ 0%  TOTAL aim7.2000.jobs-per-min
>       0.51 ~30%     -45.7%       0.28 ~10%  TOTAL turbostat.%c1
>        430 ~17%     +27.8%        549 ~15%  TOTAL vmstat.procs.r
>       0.83 ~14%     +38.1%       1.15 ~12%  TOTAL perf-profile.cpu-cycles=
.copy_pte_range.copy_page_range.copy_process.do_fork.sys_clone
>     106076 ~ 4%     +22.4%     129816 ~ 3%  TOTAL softirqs.RCU
>      12117 ~ 6%      -9.9%      10914 ~ 6%  TOTAL slabinfo.kmalloc-256.ac=
tive_objs
>      32163 ~17%     +39.4%      44824 ~12%  TOTAL time.voluntary_context_=
switches
>     276487 ~ 1%     +16.5%     322091 ~ 1%  TOTAL time.involuntary_contex=
t_switches
>      83.14 ~ 0%     +13.3%      94.21 ~ 0%  TOTAL time.user_time
>     108800 ~ 2%      +9.4%     119014 ~ 3%  TOTAL time.minor_page_faults
>       1255 ~ 0%      +9.9%       1379 ~ 0%  TOTAL time.system_time
>       6774 ~ 1%      +8.8%       7373 ~ 1%  TOTAL vmstat.system.cs
>      52.15 ~ 0%      +8.0%      56.34 ~ 0%  TOTAL time.elapsed_time
>      25185 ~ 0%      +2.4%      25784 ~ 0%  TOTAL vmstat.system.in
>      79.23 ~ 0%      +2.0%      80.80 ~ 0%  TOTAL turbostat.%c0
>       2567 ~ 0%      +1.9%       2615 ~ 0%  TOTAL time.percent_of_cpu_thi=
s_job_got
>        112 ~ 0%      +1.3%        113 ~ 0%  TOTAL turbostat.Cor_W
>        138 ~ 0%      +1.0%        139 ~ 0%  TOTAL turbostat.Pkg_W

Cough... this looks simply impossible ;)

Not only this patch "obviously can not" cause any noticable difference
performance-wise, the code changed by this patch is not executed unless
you play with uprobes?

Oleg.


--===============6144435886954056834==--

