Content-Type: multipart/mixed; boundary="===============3283056345925191400=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [memcg] a8c49af3be: hackbench.throughput -13.7% regression
Date: Wed, 27 Apr 2022 10:52:59 +0800
Message-ID: <43598597-72e1-6750-9bee-031fd463fc3b@intel.com>
In-Reply-To: <20220420055807.GA16310@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3283056345925191400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yosry,

On 4/20/2022 1:58 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -13.7% regression of hackbench.throughput due to commit:
> =

> =

> commit: a8c49af3be5f0b4e105ef678bcf14ef102c270be ("memcg: add per-memcg t=
otal kernel memory stat")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: hackbench
> on test machine: 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CPU @ =
2.50GHz with 128G memory
> with following parameters:
> =

> 	nr_threads: 100%
> 	iterations: 4
> 	mode: process
> 	ipc: socket
> 	cpufreq_governor: performance
> 	ucode: 0x7002402
> =

> test-description: Hackbench is both a benchmark and a stress test for the=
 Linux kernel scheduler.
> test-url: https://github.com/linux-test-project/ltp/blob/master/testcases=
/kernel/sched/cfs-scheduler/hackbench.c
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
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/t=
box_group/testcase/ucode:
>   gcc-11/performance/socket/4/x86_64-rhel-8.3/process/100%/debian-10.4-x8=
6_64-20200603.cgz/lkp-cpl-4sp1/hackbench/0x7002402
> =

> commit: =

>   086f694a75 ("memcg: replace in_interrupt() with !in_task()")
>   a8c49af3be ("memcg: add per-memcg total kernel memory stat")
> =

> 086f694a75e1a283 a8c49af3be5f0b4e105ef678bcf =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     146519           -13.7%     126397        hackbench.throughput
>     465.89           +16.0%     540.43        hackbench.time.elapsed_time
>     465.89           +16.0%     540.43        hackbench.time.elapsed_time=
.max
>  1.365e+08          +134.1%  3.195e+08 =C2=B1  4%  hackbench.time.involun=
tary_context_switches
>    1081515            -1.2%    1068489        hackbench.time.minor_page_f=
aults
>      64911           +16.3%      75465        hackbench.time.system_time

Just FYI.

If I comment out one line added by the commit <a8c49af3be> :
static void memcg_account_kmem(struct mem_cgroup *memcg, int nr_pages)
{
        /* mod_memcg_state(memcg, MEMCG_KMEM, nr_pages); */  <--- comment o=
ut this line.
        if (!cgroup_subsys_on_dfl(memory_cgrp_subsys)) {
                if (nr_pages > 0)
                        page_counter_charge(&memcg->kmem, nr_pages);
                else
                        page_counter_uncharge(&memcg->kmem, -nr_pages);
        }
}

The regression is almost gone:

086f694a75e1a283 9ff9ec89a6dcf39f901ff0a84fd
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
       7632:13      -44932%        1791:3     dmesg.timestamp:last
          1:13          -8%            :3     kmsg.common_interrupt:#No_irq=
_handler_for_vector
          2:13         -20%            :3     kmsg.timestamp:common_interru=
pt:#No_irq_handler_for_vector
       4072:13      -24827%         844:3     kmsg.timestamp:last
         %stddev     %change         %stddev
             \          |                \
    144327 =C2=B1  3%      -1.9%     141594 =C2=B1  5%  hackbench.throughput
                      regression dropped to -1.9% from -13.7%

    473.44 =C2=B1  3%      +1.9%     482.23 =C2=B1  5%  hackbench.time.elap=
sed_time


Regards
Yin, Fengwei
--===============3283056345925191400==--

