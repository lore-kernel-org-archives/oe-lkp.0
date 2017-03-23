Content-Type: multipart/mixed; boundary="===============1868663327359432230=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [locking/spinlock/debug] bc88c10d7e: [No primary change] unixbench.lock_stat.&rq->lock.contentions +331%
Date: Thu, 23 Mar 2017 09:05:06 +0800
Message-ID: <20170323010506.GA12482@yexl-desktop>
In-Reply-To: <b9248a4a-f25d-70ee-5ead-2b7e87e04e24@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1868663327359432230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/22, Waiman Long wrote:
>On 03/22/2017 01:11 AM, kernel test robot wrote:
>> Greeting,
>>
>> There is no primary kpi change in this test, below is the data collected=
 through multiple monitors running background just for your information.
>>
>>
>> commit: bc88c10d7e6900916f5e1ba3829d66a9de92b633 ("locking/spinlock/debu=
g: Remove spinlock lockup detection code")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: unixbench
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap=
 -smp 2 -m 2G
>> with following parameters:
>>
>> 	runtime: 300s
>> 	nr_task: 1
>> 	test: spawn
>>
>> test-description: UnixBench is the original BYTE UNIX benchmark suite ai=
ms to test performance of Unix-like system.
>> test-url: https://github.com/kdlucas/byte-unixbench
>>
>>
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>>
>>
>> To reproduce:
>>
>>         git clone https://github.com/01org/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached i=
n this email
>>
>> testcase/path_params/tbox_group/run: unixbench/300s-1-spawn/vm-kbuild-2G
>>
>> f9af456a61ecfbef  bc88c10d7e6900916f5e1ba382  =

>> ----------------  --------------------------  =

>>          %stddev      change         %stddev
>>              \          |                \  =

>>         44              -4%         42        unixbench.time.percent_of_=
cpu_this_job_got
>>        145              -5%        138        unixbench.time.system_time
>>       5349 =C2=B1  6%       331%      23032 =C2=B1 13%  lock_stat.&rq->l=
ock.contentions
>>
>
>The spinlock related config parameters are:
>
>CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
>CONFIG_QUEUED_SPINLOCKS=3Dy
># CONFIG_PARAVIRT_SPINLOCKS is not set
>CONFIG_DEBUG_SPINLOCK=3Dy
>
>DEBUG_SPINLOCK is set but PARAVIRT_SPINLOCKS is not. Patch bc88c10d will
>replace the unfair debug spinlock with a fare one. A fair lock may not
>fare well in a VM depending on how often the vCPUs are preempted. So the
>slowdown is expected and the number will be similar to that with
>DEBUG_SPINLOCK off. It is not really a problem.

Thanks for clarification.

>
>Cheers,
>Longman

--===============1868663327359432230==--

