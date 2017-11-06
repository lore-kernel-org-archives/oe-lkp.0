Content-Type: multipart/mixed; boundary="===============3665121293616075264=="
MIME-Version: 1.0
From: Chao Yu <yuchao0@huawei.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [f2fs] cb09c151b6: aim7.jobs-per-min -3.7% regression
Date: Mon, 06 Nov 2017 10:43:01 +0800
Message-ID: <ad6926a1-5665-14da-7e7a-70a9c402ff24@huawei.com>
In-Reply-To: <20171106021219.GU13676@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3665121293616075264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the report. :)

This patch adds unneeded verifying logic, let me drop this anyway.

Thanks,

On 2017/11/6 10:12, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -3.7% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: cb09c151b69ff411ebc78fe8920d8c9e3cf668ba ("f2fs: track ssr valid =
blocks")
> https://git.kernel.org/cgit/linux/kernel/git/chao/linux.git f2fs-dev
> =

> in testcase: aim7
> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz wit=
h 384G memory
> with following parameters:
> =

> 	disk: 1BRD_48G
> 	fs: f2fs
> 	test: sync_disk_rw
> 	load: 600
> 	cpufreq_governor: performance
> =

> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
> =

> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> testcase/path_params/tbox_group/run: aim7/1BRD_48G-f2fs-sync_disk_rw-600-=
performance/lkp-ivb-ep01
> =

> c8cdf95f56a2fba5  cb09c151b69ff411ebc78fe892  =

> ----------------  --------------------------  =

>          %stddev      change         %stddev
>              \          |                \  =

>       3083              -4%       2967        aim7.jobs-per-min
>     120203             101%     241341        aim7.time.involuntary_conte=
xt_switches
>       6889              15%       7952        aim7.time.system_time
>       1167               4%       1213        aim7.time.elapsed_time
>       1167               4%       1213        aim7.time.elapsed_time.max
>  1.845e+08                   1.809e+08        aim7.time.voluntary_context=
_switches
>     184305              -4%     177438        vmstat.io.bo
>     313412              -6%     295875        vmstat.system.cs
>  2.282e+10              36%   3.11e+10 =C2=B1  3%  perf-stat.branch-misses
>       1.71 =C2=B1  3%        19%       2.05 =C2=B1  3%  perf-stat.branch-=
miss-rate%
>  6.145e+12 =C2=B1  5%        16%  7.135e+12 =C2=B1  5%  perf-stat.instruc=
tions
>       2457 =C2=B1  4%        15%       2825 =C2=B1  6%  perf-stat.instruc=
tions-per-iTLB-miss
>  1.295e+12 =C2=B1  3%        14%   1.48e+12 =C2=B1  4%  perf-stat.dTLB-lo=
ads
>  1.334e+12 =C2=B1  5%        14%  1.523e+12 =C2=B1  5%  perf-stat.branch-=
instructions
>  1.141e+13 =C2=B1  4%        10%  1.261e+13 =C2=B1  4%  perf-stat.cpu-cyc=
les
>   48287264               7%   51597919        perf-stat.cpu-migrations
>       0.54               5%       0.57        perf-stat.ipc
>  2.889e+09               4%  3.017e+09        perf-stat.node-load-misses
>    2872009               4%    2982612        perf-stat.minor-faults
>    2872016               4%    2982587        perf-stat.page-faults
>  2.294e+09               3%   2.37e+09        perf-stat.node-store-misses
>  3.664e+08                   3.593e+08        perf-stat.context-switches
>       1.86              -5%       1.77        perf-stat.cpi
> =

> [*] bisect-good sample
> [O] bisect-bad  sample
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Xiaolong
> =



--===============3665121293616075264==--

