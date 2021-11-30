Content-Type: multipart/mixed; boundary="===============1311393490887795075=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] bad77c375e: stress-ng.fallocate.ops_per_sec -10.0% regression
Date: Tue, 30 Nov 2021 14:46:06 +0800
Message-ID: <96fa41bb-7e9f-ae47-bf34-accef5c36fa8@linux.intel.com>
In-Reply-To: <36dc5f38-f8ec-591a-8efa-b3bd607ac06e@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1311393490887795075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

    Do you have time to look at this? It still existed in v5.16-rc3. Thanks

On 9/3/2021 3:40 PM, Xing Zhengjun wrote:
> Hi Dave,
> =

>  =C2=A0=C2=A0 Do you have time to look at this? Thanks.
> =

> On 9/2/2021 3:27 PM, kernel test robot wrote:
>>
>>
>> Greeting,
>>
>> FYI, we noticed a -10.0% regression of stress-ng.fallocate.ops_per_sec =

>> due to commit:
>>
>>
>> commit: bad77c375e8de6c776c848e443f7dc2d0d909be5 ("xfs: CIL checkpoint =

>> flushes caches unconditionally")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>>
>> in testcase: stress-ng
>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ =

>> 2.10GHz with 512G memory
>> with following parameters:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0nr_threads: 10%
>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
>> =C2=A0=C2=A0=C2=A0=C2=A0testtime: 60s
>> =C2=A0=C2=A0=C2=A0=C2=A0fs: xfs
>> =C2=A0=C2=A0=C2=A0=C2=A0class: filesystem
>> =C2=A0=C2=A0=C2=A0=C2=A0test: fallocate
>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x5003006
>>
>>
>> In addition to that, the commit also has significant impact on the =

>> following tests:
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
--------------------------> =

>>
>>
>>
>> To reproduce:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://githu=
b.com/intel/lkp-tests.git
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 job.yaml=C2=A0 # job file is =

>> attached in this email
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --com=
patible job.yaml=C2=A0 # generate the yaml =

>> file for lkp run
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 generated-yaml-file
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =

>>
>> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_g=
roup/test/testcase/testtime/ucode: =

>>
>>    =

>> filesystem/gcc-9/performance/1HDD/xfs/x86_64-rhel-8.3/10%/debian-10.4-x8=
6_64-20200603.cgz/lkp-csl-2sp7/fallocate/stress-ng/60s/0x5003006 =

>>
>>
>> commit:
>> =C2=A0=C2=A0 0431d926b3 ("xfs: async blkdev cache flush")
>> =C2=A0=C2=A0 bad77c375e ("xfs: CIL checkpoint flushes caches uncondition=
ally")
>>
>> 0431d926b399d74f bad77c375e8de6c776c848e443f
>> ---------------- ---------------------------
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=
=A0=C2=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %st=
ddev
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0 618.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -10.0%=C2=A0=C2=A0=C2=A0=C2=A0 556.67 =C2=B1=C2=A0 2%=
=C2=A0 stress-ng.fallocate.ops
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.31=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -10.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.28 =
=C2=B1=C2=A0 2%  =

>> stress-ng.fallocate.ops_per_sec
>> =C2=A0=C2=A0=C2=A0=C2=A0 111618=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -5.7%=C2=A0=C2=A0=C2=A0=C2=A0 105270        =

>> stress-ng.time.voluntary_context_switches
>> =C2=A0=C2=A0=C2=A0=C2=A0 502.67 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 =
+52.0%=C2=A0=C2=A0=C2=A0=C2=A0 763.83 =C2=B1 47%  =

>> interrupts.CPU44.CAL:Function_call_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.10 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=
=A0=C2=A0 -25.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.57=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 iostat.cpu.iowait
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.16 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.62=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mpstat.cpu.all.iowait%
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 11%=C2=A0=C2=A0=C2=A0=
=C2=A0 +45.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 34%  =

>> perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork
>> =C2=A0=C2=A0=C2=A0=C2=A0 151.00 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 +20.2=
%=C2=A0=C2=A0=C2=A0=C2=A0 181.50 =C2=B1=C2=A0 7%  =

>> perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6749=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 7178        =

>> perf-stat.i.context-switches
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6640=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 7063        =

>> perf-stat.ps.context-switches
>> =C2=A0=C2=A0=C2=A0=C2=A0 353877=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -1.4%=C2=A0=C2=A0=C2=A0=C2=A0 348924=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgfree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 39122=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -15.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33221=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.pgpgout
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1225 =C2=B1 14%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -9.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1115=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 turbostat.Bzy_MHz
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 86.82 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0 =
-10.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 77.83=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 turbostat.PkgWatt
>> =C2=A0=C2=A0=C2=A0=C2=A0 602.83=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -15.1%=C2=A0=C2=A0=C2=A0=C2=A0 511.83=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstat.io.bo
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6953=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +6.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 7376=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmstat.system.cs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.70 =C2=B1 =
13%  =

>> perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_=
queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_in=
terrupt =

>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 22%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 23%=
  =

>> perf-profile.children.cycles-pp.wait_for_completion
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 17%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 64%=
  =

>> perf-profile.children.cycles-pp.submit_bio
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 17%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 64%=
  =

>> perf-profile.children.cycles-pp.submit_bio_noacct
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.40 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.74 =C2=B1 =
12%  =

>> perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
>>
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 stress-ng.fallocate.ops_per_sec
>> =C2=A0=C2=A0 12 =

>> +----------------------------------------------------------------------+
>>       =

>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 10 |.+.++.+.+.+  =

>> +.+.+.++.+.+.++.+.+.+.++.+.+.++.+.+.++.+.+.+.++.+.+.++.+.|
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O O=C2=A0=C2=A0 OO O O O =

>> OO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 OO O=C2=A0=C2=A0 :O :=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O O    =

>> O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 8 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O :=C2=A0 : O O O=
O O O=C2=A0 O O O O OO =

>> O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : =

>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 6 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : =

>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |           =

>> ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 4 |-+         =

>> ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |           =

>> ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |           =

>> ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 2 |-+         =

>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |           =

>> :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 0 =

>> +----------------------------------------------------------------------+
>> [*] bisect-good sample
>> [O] bisect-bad=C2=A0 sample
>>
>>
>>
>>
>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are =

>> provided
>> for informational purposes only. Any difference in system hardware or =

>> software
>> design or configuration may affect actual performance.
>>
>>
>> ---
>> 0DAY/LKP+ Test Infrastructure=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Open Sou=
rce Technology =

>> Center
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Intel =

>> Corporation
>>
>> Thanks,
>> Oliver Sang
>>
> =


-- =

Zhengjun Xing
--===============1311393490887795075==--

