Content-Type: multipart/mixed; boundary="===============6361309611023103884=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 2bf1ec0ff0: stress-ng.mknod.ops_per_sec -45.4% regression
Date: Thu, 09 Sep 2021 15:07:35 +0800
Message-ID: <ec35eb2e-a488-ecfe-22c6-bf86d7eef145@intel.com>
In-Reply-To: <a149d14e-48e0-bad9-4283-e560f03a941f@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6361309611023103884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On 9/3/2021 3:43 PM, Xing Zhengjun wrote:
> Hi Dave,
> =

> =C2=A0=C2=A0 Do you have time to look at this? Thanks.
> =

> On 8/4/2021 10:38 PM, kernel test robot wrote:
>>
>>
>> Greeting,
>>
>> FYI, we noticed a -45.4% regression of stress-ng.mknod.ops_per_sec due t=
o commit:
>>
>>
>> commit: 2bf1ec0ff067ff8f692d261b29c713f3583f7e2a ("xfs: log forces imply=
 data device cache flushes")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

We noticed the commit 2bf1ec0ff067ff8f692d261b29c713f3583f7e2a is actually a
fix to the race introduced by commit eef983ffeae7a1cdde8c3338155ae2dd74b862=
1b.

Then we did a test for stress-ng.mknod.ops_per_sec between commit:
  eef983ffeae7a1cdde8c3338155ae2dd74b8621b
and its parent commit:
  3468bb1ca6e8840789e13c7b9d8b0c556b4fbe79

We got:
commit: =

  3468bb1ca6e8840789e13c7b9d8b0c556b4fbe79
  eef983ffeae7a1cdde8c3338155ae2dd74b8621b

3468bb1ca6e88407 eef983ffeae7a1cdde8c3338155 =

---------------- --------------------------- =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

        112:1          456%         117:1     dmesg.timestamp:last
        103:1          553%         109:1     kmsg.timestamp:last
          1:1            0%           1:1     pmeter.pmeter.fail
          1:1            0%           1:1     stress-ng.mknod.pass
         %stddev     %change         %stddev
             \          |                \  =

     47979           +80.6%      86655        stress-ng.mknod.ops
    799.29           +80.6%       1443        stress-ng.mknod.ops_per_sec

It's like commit eef983ffeae7a1cdde8c3338155ae2dd74b8621b bought 80%
performance gain. But it introduced race issue.

Commit 2bf1ec0ff067ff8f692d261b29c713f3583f7e2a fixed the race issue
and lost about 50% performance gain. Suppose we still have 30%
performance gain with race issue fixed. So it's still a good change.

We will close this report.


Regards
Yin, Fengwei

>>
>>
>> in testcase: stress-ng
>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2=
.10GHz with 512G memory
>> with following parameters:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0nr_threads: 10%
>> =C2=A0=C2=A0=C2=A0=C2=A0disk: 1HDD
>> =C2=A0=C2=A0=C2=A0=C2=A0testtime: 60s
>> =C2=A0=C2=A0=C2=A0=C2=A0fs: xfs
>> =C2=A0=C2=A0=C2=A0=C2=A0class: filesystem
>> =C2=A0=C2=A0=C2=A0=C2=A0test: mknod
>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x5003006
>>
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>>
>>
>> To reproduce:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://githu=
b.com/intel/lkp-tests.git
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp install=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 job.yaml=C2=A0 # job file is attached in this email
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --com=
patible job.yaml=C2=A0 # generate the yaml file for lkp run
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp run=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 generated-yaml-file
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_g=
roup/test/testcase/testtime/ucode:
>> =C2=A0=C2=A0 filesystem/gcc-9/performance/1HDD/xfs/x86_64-rhel-8.3/10%/d=
ebian-10.4-x86_64-20200603.cgz/lkp-csl-2sp7/mknod/stress-ng/60s/0x5003006
>>
>> commit:
>> =C2=A0=C2=A0 45eddb4140 ("xfs: factor out forced iclog flushes")
>> =C2=A0=C2=A0 2bf1ec0ff0 ("xfs: log forces imply data device cache flushe=
s")
>>
>> 45eddb414047c366 2bf1ec0ff067ff8f692d261b29c
>> ---------------- ---------------------------
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=
=A0=C2=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %st=
ddev
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 87135=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -45.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 47612=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng.mknod.ops
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1451=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -45.4%=C2=A0=C2=A0=C2=A0=C2=A0 793.24=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng.mknod.ops_per_sec
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 23.00 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=
=C2=A0 -51.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.17 =C2=B1 12%=C2=A0 stress-n=
g.time.percent_of_cpu_this_job_got
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.80 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=
=C2=A0 -50.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.80 =C2=B1=C2=A0 8%=C2=
=A0 stress-ng.time.system_time
>> =C2=A0=C2=A0=C2=A0=C2=A0 211458 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 =
-62.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 79605 =C2=B1 14%=C2=A0 stress-ng.time.=
voluntary_context_switches
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mpstat.cpu.all.sys%
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13993 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0 -38.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8659=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 softirqs.BLOCK
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27747=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -2.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27103=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_slab_reclaimable
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 76223 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=
=C2=A0 -57.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32548 =C2=B1=C2=A0 5%=C2=A0 pro=
c-vmstat.pgpgout
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1170 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=
=A0=C2=A0 -57.3%=C2=A0=C2=A0=C2=A0=C2=A0 500.17 =C2=B1=C2=A0 5%=C2=A0 vmsta=
t.io.bo
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10752=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -47.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5624 =
=C2=B1=C2=A0 6%=C2=A0 vmstat.system.cs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32820=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -34.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21499=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.kmalloc-rcl-64.active_objs
>> =C2=A0=C2=A0=C2=A0=C2=A0 512.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -34.6%=C2=A0=C2=A0=C2=A0=C2=A0 335.50=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.kmalloc-rcl-64.active_slabs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32836=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -34.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21508=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.kmalloc-rcl-64.num_objs
>> =C2=A0=C2=A0=C2=A0=C2=A0 512.67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -34.6%=C2=A0=C2=A0=C2=A0=C2=A0 335.50=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 slabinfo.kmalloc-rcl-64.num_slabs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24913 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0 -42.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14251=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 interrupts.315:PCI-MSI.376832-edge.ahci[0000:00:17.0]
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 71844 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=
=C2=A0 -19.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 57564 =C2=B1=C2=A0 3%=C2=A0 int=
errupts.CAL:Function_call_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0 206.50 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0 -42.9=
%=C2=A0=C2=A0=C2=A0=C2=A0 118.00 =C2=B1 41%=C2=A0 interrupts.CPU1.NMI:Non-m=
askable_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0 206.50 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0 -42.9=
%=C2=A0=C2=A0=C2=A0=C2=A0 118.00 =C2=B1 41%=C2=A0 interrupts.CPU1.PMI:Perfo=
rmance_monitoring_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0 173.17 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 -31.7=
%=C2=A0=C2=A0=C2=A0=C2=A0 118.33 =C2=B1 38%=C2=A0 interrupts.CPU2.NMI:Non-m=
askable_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0 173.17 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 -31.7=
%=C2=A0=C2=A0=C2=A0=C2=A0 118.33 =C2=B1 38%=C2=A0 interrupts.CPU2.PMI:Perfo=
rmance_monitoring_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0 189.83 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0 -40.6=
%=C2=A0=C2=A0=C2=A0=C2=A0 112.83 =C2=B1 25%=C2=A0 interrupts.CPU49.NMI:Non-=
maskable_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0 189.83 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0 -40.6=
%=C2=A0=C2=A0=C2=A0=C2=A0 112.83 =C2=B1 25%=C2=A0 interrupts.CPU49.PMI:Perf=
ormance_monitoring_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0 181.67 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0 -38.3=
%=C2=A0=C2=A0=C2=A0=C2=A0 112.17 =C2=B1 24%=C2=A0 interrupts.CPU50.NMI:Non-=
maskable_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0 181.67 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0 -38.3=
%=C2=A0=C2=A0=C2=A0=C2=A0 112.17 =C2=B1 24%=C2=A0 interrupts.CPU50.PMI:Perf=
ormance_monitoring_interrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1895 =C2=B1 16%=C2=A0=C2=A0=C2=A0=
=C2=A0 -32.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1274 =C2=B1 20%=C2=A0 int=
errupts.RES:Rescheduling_interrupts
>> =C2=A0 3.127e+08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -12.2%=C2=A0 2.=
746e+08 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.branch-instructions
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10683=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -49.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5364 =
=C2=B1=C2=A0 6%=C2=A0 perf-stat.i.context-switches
>> =C2=A0 3.866e+08 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -14.2%=C2=A0 3.=
318e+08 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.dTLB-loads
>> =C2=A0 1.949e+08 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -14.7%=C2=A0 1.=
662e+08 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.dTLB-stores
>> =C2=A0 1.538e+09 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -12.4%=C2=A0 1.=
348e+09 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.instructions
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.31 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=
=A0=C2=A0 -13.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.04 =C2=B1=C2=A0 3%=
=C2=A0 perf-stat.i.metric.M/sec
>> =C2=A0=C2=A0=C2=A0=C2=A0 127426 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -32.6=
%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 85864 =C2=B1=C2=A0 9%=C2=A0 perf-stat.i.nod=
e-load-misses
>> =C2=A0 3.078e+08 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -12.2%=C2=A0 2.=
702e+08 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.branch-instructions
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10512=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -49.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5279 =
=C2=B1=C2=A0 6%=C2=A0 perf-stat.ps.context-switches
>> =C2=A0 3.805e+08 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -14.2%=C2=A0 3.=
265e+08 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.dTLB-loads
>> =C2=A0 1.918e+08 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -14.7%=C2=A0 1.=
635e+08 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.dTLB-stores
>> =C2=A0 1.514e+09 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -12.4%=C2=A0 1.=
327e+09 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.instructions
>> =C2=A0=C2=A0=C2=A0=C2=A0 125399 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -32.6=
%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 84480 =C2=B1=C2=A0 9%=C2=A0 perf-stat.ps.no=
de-load-misses
>> =C2=A0 9.563e+10 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -12.3%=C2=A0 8.=
383e+10 =C2=B1=C2=A0 3%=C2=A0 perf-stat.total.instructions
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.31 =C2=B1 20%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -3.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.45 =C2=B1 25%=
=C2=A0 perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.30 =C2=B1 20%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -3.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.45 =C2=B1 25%=
=C2=A0 perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.35 =C2=B1 19%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 25%=
=C2=A0 perf-profile.calltrace.cycles-pp.__x64_sys_sync.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.35 =C2=B1 19%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 25%=
=C2=A0 perf-profile.calltrace.cycles-pp.ksys_sync.__x64_sys_sync.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.08 =C2=B1 19%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 72%=
=C2=A0 perf-profile.calltrace.cycles-pp.iterate_supers.ksys_sync.__x64_sys_=
sync.do_syscall_64.entry_SYSCALL_64_after_hwframe
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.85 =C2=B1 25%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.14 =C2=B1 31%=
=C2=A0 perf-profile.calltrace.cycles-pp.do_mknodat.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1106%=
=C2=A0 perf-profile.calltrace.cycles-pp.xfs_inactive_ifree.xfs_inactive.xfs=
_fs_destroy_inode.destroy_inode.do_unlinkat
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.08 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.46 =C2=B1 77%=
=C2=A0 perf-profile.calltrace.cycles-pp.destroy_inode.do_unlinkat.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.05 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 77%=
=C2=A0 perf-profile.calltrace.cycles-pp.xfs_fs_destroy_inode.destroy_inode.=
do_unlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1 78%=
=C2=A0 perf-profile.calltrace.cycles-pp.xfs_inactive.xfs_fs_destroy_inode.d=
estroy_inode.do_unlinkat.do_syscall_64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.89 =C2=B1 17%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1=C2=
=A0 9%=C2=A0 perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_fro=
m_fork
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.21 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.45 =C2=B1=
=C2=A0 7%=C2=A0 perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler._=
_hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_=
apic_timer_interrupt
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.13 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.16 =C2=B1=C2=A0=
 6%=C2=A0 perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_int=
errupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec=
_apic_timer_interrupt
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.35 =C2=B1 19%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 25%=
=C2=A0 perf-profile.children.cycles-pp.__x64_sys_sync
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.35 =C2=B1 19%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 25%=
=C2=A0 perf-profile.children.cycles-pp.ksys_sync
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.09 =C2=B1 19%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.65 =C2=B1 25%=
=C2=A0 perf-profile.children.cycles-pp.iterate_supers
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.25 =C2=B1 18%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.14 =C2=B1 26%=
=C2=A0 perf-profile.children.cycles-pp._raw_spin_lock
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.40 =C2=B1 25%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1 54%=
=C2=A0 perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.85 =C2=B1 25%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.14 =C2=B1 31%=
=C2=A0 perf-profile.children.cycles-pp.do_mknodat
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.08 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.55 =C2=B1 43%=
=C2=A0 perf-profile.children.cycles-pp.destroy_inode
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.05 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 42%=
=C2=A0 perf-profile.children.cycles-pp.xfs_fs_destroy_inode
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 43%=
=C2=A0 perf-profile.children.cycles-pp.xfs_inactive
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1 44%=
=C2=A0 perf-profile.children.cycles-pp.xfs_inactive_ifree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.93 =C2=B1 21%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1 24%=
=C2=A0 perf-profile.children.cycles-pp.__schedule
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 25%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 76%=
=C2=A0 perf-profile.children.cycles-pp.pick_next_task_fair
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.05 =C2=B1 20%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.69 =C2=B1 13%=
=C2=A0 perf-profile.children.cycles-pp.find_busiest_group
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.66 =C2=B1 19%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1 30%=
=C2=A0 perf-profile.children.cycles-pp.schedule
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.00 =C2=B1 20%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.65 =C2=B1 13%=
=C2=A0 perf-profile.children.cycles-pp.update_sd_lb_stats
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1 20%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 31%=
=C2=A0 perf-profile.children.cycles-pp.xfs_ifree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.89 =C2=B1 17%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1=C2=
=A0 9%=C2=A0 perf-profile.children.cycles-pp.worker_thread
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1 26%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 45%=
=C2=A0 perf-profile.children.cycles-pp.newidle_balance
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 39%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 35%=
=C2=A0 perf-profile.children.cycles-pp.xfs_fs_sync_fs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 49%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 29%=
=C2=A0 perf-profile.children.cycles-pp.xfs_log_force
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1 29%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1 56%=
=C2=A0 perf-profile.children.cycles-pp.schedule_timeout
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 60%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 50%=
=C2=A0 perf-profile.children.cycles-pp.xfs_inobt_get_rec
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.38 =C2=B1 19%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 30%=
=C2=A0 perf-profile.children.cycles-pp.xfs_btree_lookup
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.42 =C2=B1 14%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 35%=
=C2=A0 perf-profile.children.cycles-pp.xfs_check_agi_freecount
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 37%=
=C2=A0 perf-profile.children.cycles-pp.xfs_btree_lookup_get_block
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 30%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 39%=
=C2=A0 perf-profile.children.cycles-pp.iterate_bdevs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33 =C2=B1 28%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 20%=
=C2=A0 perf-profile.children.cycles-pp.try_to_wake_up
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 31%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 23%=
=C2=A0 perf-profile.children.cycles-pp.schedule_idle
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 36%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1102%=
=C2=A0 perf-profile.children.cycles-pp.__down
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 35%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 73%=
=C2=A0 perf-profile.children.cycles-pp.xfs_buf_lock
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 36%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 73%=
=C2=A0 perf-profile.children.cycles-pp.down
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 39%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 52%=
=C2=A0 perf-profile.children.cycles-pp.xfs_iunlink_remove
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 28%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 43%=
=C2=A0 perf-profile.children.cycles-pp.xfs_buf_item_release
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 33%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 35%=
=C2=A0 perf-profile.children.cycles-pp.xfs_difree_inobt
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 16%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1104%=
=C2=A0 perf-profile.children.cycles-pp._xfs_trans_bjoin
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 30%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 80%=
=C2=A0 perf-profile.children.cycles-pp.wait_for_completion
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 53%=
=C2=A0 perf-profile.children.cycles-pp.up
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 33%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 81%=
=C2=A0 perf-profile.children.cycles-pp.xfs_difree_finobt
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 27%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 19%=
=C2=A0 perf-profile.children.cycles-pp.xfs_trans_alloc
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 29%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 72%=
=C2=A0 perf-profile.children.cycles-pp.xfs_log_reserve
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 77%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 34%=
=C2=A0 perf-profile.children.cycles-pp.balance_fair
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 79%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 31%=
=C2=A0 perf-profile.children.cycles-pp.smpboot_thread_fn
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1 16%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.72 =C2=B1 11%=
=C2=A0 perf-profile.children.cycles-pp.update_rq_clock
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.24 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.52 =C2=B1=
=C2=A0 4%=C2=A0 perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.31 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.40 =C2=B1=C2=A0=
 5%=C2=A0 perf-profile.children.cycles-pp.__hrtimer_run_queues
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.30 =C2=B1 18%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 54%=
=C2=A0 perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 21%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1 20%=
=C2=A0 perf-profile.self.cycles-pp.__percpu_counter_sum
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.43 =C2=B1 25%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 45%=
=C2=A0 perf-profile.self.cycles-pp.down_read
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.72 =C2=B1 13%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.47 =C2=B1 12%=
=C2=A0 perf-profile.self.cycles-pp.update_sd_lb_stats
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35 =C2=B1 15%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.43 =C2=B1 13%=
=C2=A0 perf-profile.self.cycles-pp.irqtime_account_irq
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 60%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 18%=
=C2=A0 perf-profile.self.cycles-pp.timerqueue_del
>>
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng.time.system_time
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 20 +------------------------=
----------------------------------------------+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 18 |-+=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 ::=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=
 ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +..=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .+=C2=A0 :=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 16 |-+=C2=A0=C2=A0=C2=A0 : : :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +.=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 +=
=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |:=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 ::=C2=
=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 +=C2=A0 :=C2=A0 +=C2=A0 : : :=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0 .. +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
>> =C2=A0=C2=A0 14 |:+=C2=A0 +=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 :=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .+.=C2=A0=C2=A0 .+=C2=A0=C2=A0=C2=
=A0=C2=A0 + :=C2=A0=C2=A0 + : : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +.+=C2=A0=
=C2=A0=C2=A0 +.=C2=A0=C2=A0 .+.|
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | +.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 :=C2=A0 +.+.+.+=C2=A0=C2=A0 +.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +.+=
=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 12 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 10 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 8 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=
=C2=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0 O=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | O O=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=
=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0 O O=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 6 +--------------------------------------------------=
--------------------+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng.t=
ime.percent_of_cpu_this_job_got
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 35 +------------------------=
----------------------------------------------+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=
=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 30 |-+=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0 ::=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=
 ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +..=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0=C2=A0 +=C2=A0=C2=A0 +.+=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |:=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0 ::=C2=
=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : +=C2=A0=C2=A0=
 : : :=C2=A0=C2=A0=C2=A0=C2=A0 :=C2=A0=C2=A0 .. :=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 25 |:+=C2=A0 .+=C2=A0=C2=A0 +=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 :=C2=A0=C2=A0 +. :=C2=A0 +. : : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :.+=
=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | +.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 :=C2=A0 +.+.+.+.+.+.+.+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=
=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +.+.+.+.|
>> =C2=A0=C2=A0 20 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 :=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ::=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 15 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 :=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=
=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | O O O O O=C2=A0 O O O O O=C2=A0=C2=A0 O=
=C2=A0=C2=A0 O=C2=A0=C2=A0 O=C2=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0 O O=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 10 +-------------------------------------------------------=
---------------+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 stress-ng.time.voluntary_context_switches
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 260000 +--------------------=
----------------------------------------------+
>> =C2=A0=C2=A0 240000 |-+=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 + :=C2=A0 +.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .+. .+.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 220000 |++.+.+=C2=A0 : +=C2=A0 +.=C2=A0=C2=A0 .+.=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + + +.+. .+.+=C2=A0=C2=A0 +.+=C2=A0=
=C2=A0 +=C2=A0=C2=A0 +. .+. .+.|
>> =C2=A0=C2=A0 200000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=
=A0=C2=A0=C2=A0 +.+=C2=A0=C2=A0 +. .+. .+=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 +=
=C2=A0=C2=A0=C2=A0 + +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 +=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 180000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 160000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 140000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> =C2=A0=C2=A0 120000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 100000 |-O=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=
=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=
=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 80000 |-+ O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O O O=C2=A0=C2=A0 O O=C2=A0=C2=
=A0 OO=C2=A0=C2=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0 O=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 60000 +----------------------------------------------=
--------------------+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ress-ng.mknod.ops
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 95000 +---------------------=
----------------------------------------------+
>> =C2=A0=C2=A0 90000 |-+=C2=A0=C2=A0=C2=A0 .+. .+.=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .+. .+.=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |.+.+.+=C2=A0=C2=A0 +=
=C2=A0=C2=A0 +.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+=C2=A0=C2=A0 +=C2=A0=C2=
=A0 +. .+.+.+.|
>> =C2=A0=C2=A0 85000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 80000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> =C2=A0=C2=A0 75000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 70000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 65000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> =C2=A0=C2=A0 60000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 55000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> =C2=A0=C2=A0 50000 |-O O O O O O O O O O O O O O O O O O O O O O O O O=
=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |
>> =C2=A0=C2=A0 45000 +----------------------------------------------------=
---------------+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stress-ng.mknod.ops_per_sec
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 1600 +----------------------=
----------------------------------------------+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .+.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .+. .+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 1500 |.+.+.+=C2=A0=C2=A0 +.+.+.+.+.+. .+.+.+.+.+..+.+.+.+.+=
.+.+.+.+=C2=A0=C2=A0 +=C2=A0 +=C2=A0=C2=A0 .+.+.+.|
>> =C2=A0=C2=A0 1400 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +.+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> =C2=A0=C2=A0 1300 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 1200 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> =C2=A0=C2=A0 1100 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0 1000 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> =C2=A0=C2=A0=C2=A0 900 |-+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 800 |-+=C2=A0=C2=A0 O O=C2=A0=C2=A0 O O O=C2=A0=C2=A0=
=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0 O O O=C2=A0=C2=A0=C2=A0=C2=A0 O=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | O O=C2=A0=C2=A0=C2=A0=C2=A0=
 O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0 O O O=C2=
=A0=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 O O=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0 700 +------------------------------------------------=
--------------------+
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [*] bise=
ct-good sample
>> [O] bisect-bad=C2=A0 sample
>>
>>
>>
>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>>
>>
>> ---
>> 0DAY/LKP+ Test Infrastructure=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Open Sou=
rce Technology Center
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Intel Corporation
>>
>> Thanks,
>> Oliver Sang
>>
>=20
--===============6361309611023103884==--

