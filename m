Content-Type: multipart/mixed; boundary="===============5473159643678649569=="
MIME-Version: 1.0
From: Xishi Qiu <qiuxishi@huawei.com>
To: lkp@lists.01.org
Subject: Re: [mm] 6f25a14a70: will-it-scale.scalability -4.0% regression
Date: Thu, 07 Apr 2016 10:40:06 +0800
Message-ID: <5705C886.90708@huawei.com>
In-Reply-To: <20160407010657.GB12139@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5473159643678649569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2016/4/7 9:06, kernel test robot wrote:

> FYI, we noticed that will-it-scale.scalability -4.0% regression on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 6f25a14a7053b69917e2ebea0d31dd444cd31fd5 ("mm: fix invalid node in=
 alloc_migrate_target()")
> =


alloc_migrate_target() is called from cma or mem-offline.
I have no idea what's the relation between these, any ideas?

Thanks,
Xishi Qiu

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-ivb-d0=
3/pthread_mutex1/will-it-scale
> =

> commit: =

>   969e8d7e47f93ef693028667480558de8f70523f
>   6f25a14a7053b69917e2ebea0d31dd444cd31fd5
> =

> 969e8d7e47f93ef6 6f25a14a7053b69917e2ebea0d =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>          %stddev     %change         %stddev
>              \          |                \  =

>  2.032e+08 =C2=B1  0%      -1.6%      2e+08 =C2=B1  0%  will-it-scale.per=
_process_ops
>       0.83 =C2=B1  0%      -4.0%       0.79 =C2=B1  0%  will-it-scale.sca=
lability
>     214103 =C2=B1 14%     -20.2%     170884 =C2=B1 14%  sched_debug.cpu.t=
twu_count.stddev
>       3789 =C2=B1  7%     -10.3%       3398 =C2=B1  6%  slabinfo.anon_vma=
_chain.active_objs
>       4660 =C2=B1  5%      +7.7%       5019 =C2=B1  2%  vmstat.system.in
> =

> =

> lkp-ivb-d03: Ivy Bridge
> Memory: 4G
> =

> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
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
> Xiaolong Ye




--===============5473159643678649569==--

