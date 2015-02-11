Content-Type: multipart/mixed; boundary="===============4636986606390690114=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: 答复: [sched/fair] 638476007d1: +1.1% unixbench.score
Date: Wed, 11 Feb 2015 15:31:09 +0800
Message-ID: <1423639869.5968.100.camel@intel.com>
In-Reply-To: <OFEBA1B6A8.09949E7B-ON48257DE9.002832A3-48257DE9.0028DBF8@zte.com.cn>
List-Id: <oe-lkp.lists.linux.dev>

--===============4636986606390690114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-02-11 at 15:25 +0800, pang.xunlei(a)zte.com.cn wrote:
> Hello,
> =

> Does "+1.1% unixbench.score" mean better or worse?
> =

> Anyway, this is a load bug fix, does can affect the load balancing =

> behavior a little.

I think this means something better :)

Best Regards,
Huang, Ying

> Regards,
> Xunlei
> =

> =

> =

> Huang Ying <ying.huang@intel.com> =

> 2015-02-09 =E4=B8=8A=E5=8D=88 11:27
> =

> =E6=94=B6=E4=BB=B6=E4=BA=BA
> Xunlei Pang <pang.xunlei@linaro.org>, =

> =E6=8A=84=E9=80=81
> Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, =
LKP =

> ML <lkp@01.org>
> =E4=B8=BB=E9=A2=98
> [LKP] [sched/fair] 638476007d1: +1.1% unixbench.score
> =

> =

> =

> =

> =

> =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> commit 638476007d13534b2ed4134bf0279ef44071140b ("sched/fair: Fix the =

> dealing with decay_count in __synchronize_entity_decay()")
> =

> It appears that your patch cause CPU usage increased a little, so that =

> unixbench score increased.
> =

> testbox/testcase/testparams: nhm-white/unixbench/spawn
> =

> 7f1a169b88f513e3  638476007d13534b2ed4134bf0 =

> ----------------  -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \ =

>     268908 =C2=B1  0%      +4.6%     281320 =C2=B1  0% =

> unixbench.time.involuntary_context_switches
>  1.147e+08 =C2=B1  0%      +1.5%  1.164e+08 =C2=B1  0% =

> unixbench.time.minor_page_faults
>       3607 =C2=B1  0%      +1.1%       3648 =C2=B1  0%  unixbench.score
>        324 =C2=B1  0%      +1.2%        328 =C2=B1  0% =

> unixbench.time.percent_of_cpu_this_job_got
>        633 =C2=B1  0%      +1.2%        641 =C2=B1  0%  unixbench.time.sy=
stem_time
>      54100 =C2=B1  3%     +51.0%      81705 =C2=B1 21% =

> sched_debug.cpu#4.ttwu_local
>      65678 =C2=B1  7%     +49.5%      98187 =C2=B1 16% =

> sched_debug.cpu#6.ttwu_local
>       5624 =C2=B1 31%     +52.1%       8553 =C2=B1 11% sched_debug.cpu#6.=
curr->pid
>         58 =C2=B1 20%     +37.6%         80 =C2=B1  7% =

> sched_debug.cfs_rq[3]:/.runnable_load_avg
>         61 =C2=B1 10%     +22.5%         74 =C2=B1 14% =

> sched_debug.cpu#2.cpu_load[3]
>     218479 =C2=B1  5%     +15.4%     252190 =C2=B1  5% =

> sched_debug.cpu#6.ttwu_count
>        102 =C2=B1 17%     -19.3%         82 =C2=B1 10% =

> sched_debug.cpu#4.cpu_load[2]
>     423974 =C2=B1  4%     +15.6%     490072 =C2=B1  5%  sched_debug.cpu#5=
.avg_idle
>         62 =C2=B1  4%     +16.9%         72 =C2=B1  9% =

> sched_debug.cpu#2.cpu_load[4]
>     152298 =C2=B1  2%      +9.7%     167037 =C2=B1  3% =

> sched_debug.cfs_rq[5]:/.min_vruntime
>     156795 =C2=B1  1%     +11.3%     174544 =C2=B1  1% =

> sched_debug.cfs_rq[7]:/.min_vruntime
>     155535 =C2=B1  3%     +11.8%     173813 =C2=B1  2% =

> sched_debug.cfs_rq[6]:/.min_vruntime
>       9231 =C2=B1  0%      +1.3%       9348 =C2=B1  0%  vmstat.system.in
> =

> nhm-white: Nehalem
> Memory: 6G
> =

> =

>                             unixbench.time.system_time
> =

>   643 =

> ++---------------------------------------------------------------O----+
>   642 ++                    O                                   O  O
>       O O  O O  O O O  O O    O  O   O  O O  O   O  O O    O  O   O O |
>   641 ++                           O           O         O           O  |
>   640 ++  |
>       |  |
>   639 ++  |
>   638 ++  |
>   637 ++  |
>       |  |
>   636 ++  |
>   635 ++         .*  |
>       *.*.. .*..*  +         .*.. .*.*..  *  |
>   634 ++   *        *..*.*..*    *       +  |
>   633 =

> ++--------------------------------*-----------------------------------+
> =

> =

>                      unixbench.time.involuntary_context_switches
> =

>   286000 =

> ++-----------------------------------------------------------------+
>   284000 ++                                                 O  |
>          |                                                    O    O  |
>   282000 ++                                                          O O  =

> O
>   280000 O+O    O          O      O      O  O   O  O O    O     O O |
>          |    O      O O O           O O      O        O  |
>   278000 ++       O           O O  |
>   276000 ++  |
>   274000 ++  |
>          |  |
>   272000 ++  |
>   270000 ++  .*.*.              *.*..      .*  |
>          *.*.     *..*. .*     :     *.*.*.  |
>   268000 ++            *  +    :  |
>   266000 =

> ++----------------*--*---------------------------------------------+
> =

> =

>                        kmsg.tsc:Fast_TSC_calibration_failed
> =

>     1 =

> ++-------------------------------------O--------O---------------------+
>       |  |
>       |  |
>   0.8 ++  |
>       |  |
>       |  |
>   0.6 ++  |
>       |  |
>   0.4 ++  |
>       |  |
>       |  |
>   0.2 ++  |
>       |  |
>       |  |
>     0 =

> O+O--O-O--O-O-O--O-O--O-O--O-O-O--O-O----O-O--O----O-O--O-O-O--O-O--O-O
> =

>         [*] bisect-good sample
>         [O] bisect-bad  sample
> =

> To reproduce:
> =

>         apt-get install ruby ruby-oj
>         git clone =

> git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
>         cd lkp-tests
>         bin/setup-local job.yaml # the job file attached in this email
>         bin/run-local   job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are =

> provided
> for informational purposes only. Any difference in system hardware or =

> software
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Huang, Ying
> =

> =

> [=E9=99=84=E4=BB=B6 "job.yaml" =E8=A2=AB =E5=BA=9E=E8=AE=AD=E7=A3=8A10110=
855/user/zte_ltd =E5=88=A0=E9=99=A4][=E9=99=84=E4=BB=B6 "reproduce" =E8=A2=
=AB =

> =E5=BA=9E=E8=AE=AD=E7=A3=8A10110855/user/zte_ltd =E5=88=A0=E9=99=A4
> ]_______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> =

> =

> =

> --------------------------------------------------------
> ZTE Information Security Notice: The information contained in this mail (=
and any attachment transmitted herewith) is privileged and confidential and=
 is intended for the exclusive use of the addressee(s).  If you are not an =
intended recipient, any disclosure, reproduction, distribution or other dis=
semination or use of the information contained is strictly prohibited.  If =
you have received this mail in error, please delete it and notify us immedi=
ately.
> --------------------------------------------------------
> ZTE Information Security Notice: The information contained in this mail (=
and any attachment transmitted herewith) is privileged and confidential and=
 is intended for the exclusive use of the addressee(s).  If you are not an =
intended recipient, any disclosure, reproduction, distribution or other dis=
semination or use of the information contained is strictly prohibited.  If =
you have received this mail in error, please delete it and notify us immedi=
ately.
> --------------------------------------------------------
> ZTE Information Security Notice: The information contained in this mail (=
and any attachment transmitted herewith) is privileged and confidential and=
 is intended for the exclusive use of the addressee(s).  If you are not an =
intended recipient, any disclosure, reproduction, distribution or other dis=
semination or use of the information contained is strictly prohibited.  If =
you have received this mail in error, please delete it and notify us immedi=
ately.



--===============4636986606390690114==--

