Content-Type: multipart/mixed; boundary="===============6618803967779739395=="
MIME-Version: 1.0
From: Vincent Guittot <vincent.guittot@linaro.org>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [sched/fair] 4e5160766f: +149% ftq.noise.50% regression
Date: Mon, 12 Dec 2016 14:25:04 +0100
Message-ID: <CAKfTPtA_Wti+Nu5f3wajqJTg35jBwZAn=mD=DUK91Y9GSqH6AQ@mail.gmail.com>
In-Reply-To: <87zik1ya5g.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6618803967779739395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ying,

On 12 December 2016 at 06:43, kernel test robot
<ying.huang@linux.intel.com> wrote:
> Greeting,
>
> FYI, we noticed a 149% regression of ftq.noise.50% due to commit:
>
>
> commit: 4e5160766fcc9f41bbd38bac11f92dce993644aa ("sched/fair: Propagate =
asynchrous detach")
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> in testcase: ftq
> on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz with 8=
G memory
> with following parameters:
>
>         nr_task: 100%
>         samples: 6000ss
>         test: cache
>         freq: 20
>         cpufreq_governor: powersave

Why using powersave ? Are you testing  every governors ?

>
> test-description: The FTQ benchmarks measure hardware and software interf=
erence or 'noise' on a node from the applications perspective.
> test-url: https://github.com/rminnich/ftq

It's a bit difficult to understand exactly what is measured and what
is ftq.noise.50% because this result is not part of the bench which
seems to only record a log of data in a file and ftq.noise.50% seems
to be lkp specific

I have tried to reproduce the lkp test on a debian jessie then a
ubuntu server 16.10 but lkp doesn't seems to install cleanly as there
are some errors:

sudo bin/lkp run     job.yaml
IPMI BMC is not supported on this machine, skip bmc-watchdog setup!
2016-12-12 13:58:39 ./ftq_cache -f 20 -n 6000 -t 8 -a 524288
Start 5088418680237 end 5438443372098 elapsed 350024691861
cyclestart 14236344834332 cycleend 15214154208877 elapsed 977809374545
Avg Cycles(ticks) per ns. is 2.793544; nspercycle is 0.357968
Pre-computed ticks per ns: 2.793541
Sample frequency is 20.000000
ticks per ns 2.79354
chown: utilisateur incorrect: =C2=ABlkp.lkp=C2=BB
chown: utilisateur incorrect: =C2=ABlkp.lkp=C2=BB
wait for background monitors: 9405 9407 oom-killer nfs-hang
curl: (6) Could not resolve host: ftq.time


>
> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
> +------------------+-----------------------------------------------------=
---------------------------+
> | testcase: change | unixbench: unixbench.score 2.7% improvement         =
                           |
> | test machine     | 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz wi=
th 4G memory               |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                             |
> |                  | nr_task=3D100%                                      =
                             |
> |                  | runtime=3D300s                                      =
                             |
> |                  | test=3Dexecl                                        =
                             |
> +------------------+-----------------------------------------------------=
---------------------------+
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> testcase/path_params/tbox_group/run: ftq/100%-6000ss-cache-20-powersave/l=
kp-hsw-d01
>
> 09a43ace1f986b00  4e5160766fcc9f41bbd38bac11
> ----------------  --------------------------
>          %stddev      change         %stddev
>              \          |                \
>        305 =C2=B1 30%       260%       1100 =C2=B1 14%  ftq.noise.75%
>       1386 =C2=B1 19%       149%       3457 =C2=B1  7%  ftq.noise.50%
>       2148 =C2=B1 11%        98%       4257 =C2=B1  4%  ftq.noise.25%
>    3963589                     3898578        ftq.time.involuntary_contex=
t_switches
>
>
>
>                                    ftq.noise.50_
>
>   4000 ++------------O---------------------------------------------------=
---+
>        |                                                           O     =
 O |
>   3500 ++     O             O                        O    O O O          =
   O
>        | O  O      O   O      O O  O O O    O O    O   O         O       =
   |
>        O        O                         O                          O O =
   |
>   3000 ++                                       O                        =
   |
>        |                 O                                               =
   |
>   2500 ++                                                                =
   |
>        |                                                                 =
   |
>   2000 ++                                                                =
   |
>        |    *                  .*                                        =
   |
>        |   + :     *   *      *  +                                       =
   |
>   1500 ++ +  :    + + + +    :    + .*                                   =
   |
>        |.*    *. +   *   *.. :     *  +                                  =
   |
>   1000 *+-------*-----------*----------*---------------------------------=
---+
>
>         [*] bisect-good sample
>         [O] bisect-bad  sample
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
> Thanks,
> Ying Huang

--===============6618803967779739395==--

