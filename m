Content-Type: multipart/mixed; boundary="===============9129850547962510928=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [locking/rwsem] 1b94536f2d: stress-ng.bad-altstack.ops_per_sec -32.7% regression
Date: Fri, 12 Apr 2019 12:43:03 -0400
Message-ID: <40dc40d5-58ff-e5b9-4e33-b0ce08ca0521@redhat.com>
In-Reply-To: <20190412142005.GB24200@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============9129850547962510928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/12/2019 10:20 AM, kernel test robot wrote:
> Greeting,
>
> FYI, we noticed a -32.7% regression of stress-ng.bad-altstack.ops_per_sec=
 due to commit:
>
>
> commit: 1b94536f2debc98260fb17b44f7f262e3336f7e0 ("locking/rwsem: Impleme=
nt lock handoff to prevent lock starvation")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git WIP.locking/core
>
> in testcase: stress-ng
> on test machine: 272 threads Intel(R) Xeon Phi(TM) CPU 7255 @ 1.10GHz wit=
h 112G memory
> with following parameters:
>
> 	nr_threads: 100%
> 	disk: 1HDD
> 	testtime: 5s
> 	class: memory
> 	cpufreq_governor: performance
>
>
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
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/tbox_group=
/testcase/testtime:
>   memory/gcc-7/performance/1HDD/x86_64-rhel-7.6/100%/debian-x86_64-2018-0=
4-03.cgz/lkp-knm02/stress-ng/5s
>
> commit: =

>   1bcfe0e4cb ("locking/rwsem: Improve scalability via a new locking schem=
e")
>   1b94536f2d ("locking/rwsem: Implement lock handoff to prevent lock star=
vation")
>
> 1bcfe0e4cb0efdba 1b94536f2debc98260fb17b44f7 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           1:4          -25%            :4     dmesg.WARNING:at_ip__mutex_=
lock/0x
>            :4           25%           1:4     kmsg.DHCP/BOOTP:Reply_not_f=
or_us_on_eth#,op[#]xid[#]
>          %stddev     %change         %stddev
>              \          |                \  =

>      52766 =C2=B1 19%     -32.8%      35434 =C2=B1  3%  stress-ng.bad-alt=
stack.ops
>      10521 =C2=B1 19%     -32.7%       7081 =C2=B1  3%  stress-ng.bad-alt=
stack.ops_per_sec
>      71472 =C2=B1 16%     -37.1%      44986        stress-ng.stackmmap.ops
>      14281 =C2=B1 16%     -37.0%       9001        stress-ng.stackmmap.op=
s_per_sec

The lock handoff patch does have the side effect of reducing throughput
for better fairness when there is extreme contention on a rwsem. I
believe later patches that enable reader optimistic spinning should
bring back some of the lost performance.

Cheers,
Longman

--===============9129850547962510928==--

