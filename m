Content-Type: multipart/mixed; boundary="===============2145155990102980663=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/munlock] 237b445401: stress-ng.remap.ops_per_sec -62.6% regression
Date: Fri, 18 Feb 2022 00:49:19 -0800
Message-ID: <7d35c86-77f6-8bf-84a-5c23ff610f4@google.com>
In-Reply-To: <20220218063536.GA4377@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2145155990102980663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Feb 2022, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -62.6% regression of stress-ng.remap.ops_per_sec due to=
 commit:
> =

> =

> commit: 237b4454014d3759acc6459eb329c5e3d55113ed ("[PATCH v2 07/13] mm/mu=
nlock: mlock_pte_range() when mlocking or munlocking")
> url: https://github.com/0day-ci/linux/commits/Hugh-Dickins/mm-munlock-rew=
ork-of-mlock-munlock-page-handling/20220215-104421
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git ee28855a54=
493ce83bc2a3fbe30210be61b57bc7
> patch link: https://lore.kernel.org/lkml/d39f6e4d-aa4f-731a-68ee-e77cdbf1=
d7bb(a)google.com
> =

> in testcase: stress-ng
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU=
 @ 2.60GHz with 128G memory
> with following parameters:
> =

> 	nr_threads: 100%
> 	testtime: 60s
> 	class: memory
> 	test: remap
> 	cpufreq_governor: performance
> 	ucode: 0xd000280
> =

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
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test=
/testcase/testtime/ucode:
>   memory/gcc-9/performance/x86_64-rhel-8.3/100%/debian-10.4-x86_64-202006=
03.cgz/lkp-icl-2sp6/remap/stress-ng/60s/0xd000280
> =

> commit: =

>   c479426e09 ("mm/munlock: maintain page->mlock_count while unevictable")
>   237b445401 ("mm/munlock: mlock_pte_range() when mlocking or munlocking")
> =

> c479426e09c8088d 237b4454014d3759acc6459eb32 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     109459           -62.5%      41003 =C2=B1  2%  stress-ng.remap.ops
>       1823           -62.6%     682.54 =C2=B1  2%  stress-ng.remap.ops_pe=
r_sec
>  2.242e+08           -62.5%   83989157 =C2=B1  2%  stress-ng.time.minor_p=
age_faults
>      30.00 =C2=B1  2%     -61.2%      11.65 =C2=B1  4%  stress-ng.time.us=
er_time

Thanks a lot for trying it out, I did hope that you would find something.

However, IIUC, this by itself is not very interesting:
the comparison is between c479426e09 (06/13) as base and 237b445401?
237b445401 is 07/13, "Fill in missing pieces", where the series gets
to be correct again, after dropping the old implementation and piecing
together the rest of the new implementation.  It's not a surprise that
those tests which need what's added back in 07/13 will get much slower
at this stage.  And later 10/13 brings in a pagevec to speed it up.

What would be much more interesting is to treat the series of 13 as one,
and compare the baseline before any of it against the end of the series:
is that something that the 0day robot can easily do?

But I'll look more closely at the numbers you've provided later today,
numbers that I've snipped off here: there may still be useful things to
learn from them; and maybe I'll try following the instructions you've
supplied, though I probably won't do a good job of following them.

Thanks,
Hugh

--===============2145155990102980663==--

