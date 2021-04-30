Content-Type: multipart/mixed; boundary="===============3991405649195412748=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [signal] 4bad58ebc8: will-it-scale.per_thread_ops -3.3% regression
Date: Fri, 30 Apr 2021 16:13:59 +0800
Message-ID: <20210430081359.GB79529@shbuild999.sh.intel.com>
In-Reply-To: <20210420030837.GB31773@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3991405649195412748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, Apr 20, 2021 at 11:08:37AM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -3.3% regression of will-it-scale.per_thread_ops due to=
 commit:
> =

> =

> commit: 4bad58ebc8bc4f20d89cff95417c9b4674769709 ("signal: Allow tasks to=
 cache one sigqueue struct")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> =

> =

> in testcase: will-it-scale
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: thread
> 	test: futex3
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
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
>         bin/lkp install                job.yaml  # job file is attached i=
n this email
>         bin/lkp split-job --compatible job.yaml
>         bin/lkp run                    compatible-job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-202006=
03.cgz/lkp-csl-2ap2/futex3/will-it-scale/0x5003006
> =

> commit: =

>   69995ebbb9 ("signal: Hand SIGQUEUE_PREALLOC flag to __sigqueue_alloc()")
>   4bad58ebc8 ("signal: Allow tasks to cache one sigqueue struct")
> =

> 69995ebbb9d37173 4bad58ebc8bc4f20d89cff95417 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>  1.273e+09            -3.3%  1.231e+09        will-it-scale.192.threads
>    6630224            -3.3%    6409738        will-it-scale.per_thread_ops
>  1.273e+09            -3.3%  1.231e+09        will-it-scale.workload

We've double checked this, and it seems to be another case of
the code alignment change caused regression change, just like
the other case we debugged " [genirq]  cbe16f35be:
will-it-scale.per_thread_ops -5.2% regression" =


https://lore.kernel.org/lkml/20210428050758.GB52098(a)shbuild999.sh.intel.c=
om/

With the same debug patch of forcing function address 64 bytes
aligned, then commit 4bad58ebc8 will bring no change on this case. =


commit 09c60546f04f "./Makefile: add debug option to enable function
aligned on 32 bytes" only forced 32 bytes align, with thinking 64B
align will occupy more code space, and affect iTLB more. Maybe we
should just extend it to 64B align, as it is for debug only anyway. =


Thanks,
Feng









--===============3991405649195412748==--

