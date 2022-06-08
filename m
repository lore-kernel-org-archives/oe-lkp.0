Content-Type: multipart/mixed; boundary="===============5612017229350534043=="
MIME-Version: 1.0
From: Willy Tarreau <w@1wt.eu>
To: lkp@lists.01.org
Subject: Re: [tcp] e926147618: stress-ng.icmp-flood.ops_per_sec -8.7% regression
Date: Wed, 08 Jun 2022 08:48:22 +0200
Message-ID: <20220608064822.GC7547@1wt.eu>
In-Reply-To: <20220608060802.GA22428@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5612017229350534043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 02:08:02PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -8.7% regression of stress-ng.icmp-flood.ops_per_sec du=
e to commit:
> =

> =

> commit: e9261476184be1abd486c9434164b2acbe0ed6c2 ("tcp: dynamically alloc=
ate the perturb table used by source ports")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: stress-ng
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU=
 @ 2.60GHz with 128G memory
> with following parameters:
> =

> 	nr_threads: 100%
> 	testtime: 60s
> 	class: network
> 	test: icmp-flood
> 	cpufreq_governor: performance
> 	ucode: 0xd000331
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
>   network/gcc-11/performance/x86_64-rhel-8.3/100%/debian-10.4-x86_64-2020=
0603.cgz/lkp-icl-2sp6/icmp-flood/stress-ng/60s/0xd000331
> =

> commit: =

>   ca7af04025 ("tcp: add small random increments to the source port")
>   e926147618 ("tcp: dynamically allocate the perturb table used by source=
 ports")
> =

> ca7af0402550f9a0 e9261476184be1abd486c943416 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>  5.847e+08            -8.7%  5.337e+08        stress-ng.icmp-flood.ops
>    9745088            -8.7%    8894785        stress-ng.icmp-flood.ops_pe=
r_sec
(...)

I don't know much what to think about it, to be honest. We anticipated
a possible very tiny slowdown by moving the table from static to dynamic,
though that was not observed at all during extensive tests on real
hardware. But it was not acceptable to keep too large a table as static
anyway.

>     102391 =C2=B1  2%      -8.1%      94064        stress-ng.time.involun=
tary_context_switches
>       3069 =C2=B1  2%      -9.6%       2775 =C2=B1  4%  stress-ng.time.pe=
rcent_of_cpu_this_job_got
>       1857 =C2=B1  2%      -9.3%       1685 =C2=B1  4%  stress-ng.time.sy=
stem_time
>      47.67 =C2=B1  4%     -20.9%      37.70 =C2=B1  5%  stress-ng.time.us=
er_time

Not sure what to think about these variations, nor how they may be related.

Thanks,
Willy
--===============5612017229350534043==--

