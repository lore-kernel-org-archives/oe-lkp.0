Content-Type: multipart/mixed; boundary="===============5573585314110285843=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/migrate] 9eeb73028c: stress-ng.memhotplug.ops_per_sec -53.8% regression
Date: Mon, 06 Sep 2021 09:53:39 +0800
Message-ID: <87y28aii58.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <20210905135932.GE15026@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5573585314110285843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed a -53.8% regression of stress-ng.memhotplug.ops_per_sec d=
ue to commit:
>
>
> commit: 9eeb73028cfb54eb06efe87c50cc014d3f1ff43e ("[patch 174/212] mm/mig=
rate: update node demotion order on hotplug events")
> url: https://github.com/0day-ci/linux/commits/Andrew-Morton/ia64-fix-typo=
-in-a-comment/20210903-065028
>
>
> in testcase: stress-ng
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.=
10GHz with 192G memory
> with following parameters:
>
> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 60s
> 	fs: ext4
> 	class: os
> 	test: memhotplug
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
>

Because we added some operations during online/offline CPU, it's
expected that the performance of online/offline CPU will decrease.  In
most cases, the performance of CPU hotplug isn't a big problem.  But
then I remembers that the performance of the CPU hotplug may influence
suspend/resume performance :-(

It appears that it is easy and reasonable to enclose the added
operations inside #ifdef CONFIG_NUMA.  Is this sufficient to restore the
performance of suspend/resume?

Best Regards,
Huang, Ying
--===============5573585314110285843==--

