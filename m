Content-Type: multipart/mixed; boundary="===============6804966760516707662=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/writeback] e5dbd33218: will-it-scale.per_process_ops -3.8% regression
Date: Wed, 28 Apr 2021 14:15:15 +0800
Message-ID: <e4ea454c-aa68-24de-709b-9fee462e3dcf@linux.intel.com>
In-Reply-To: <20210423124753.GA235567@casper.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6804966760516707662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

On 4/23/2021 8:47 PM, Matthew Wilcox wrote:
> On Fri, Apr 23, 2021 at 01:46:01PM +0800, kernel test robot wrote:
>> FYI, we noticed a -3.8% regression of will-it-scale.per_process_ops due =
to commit:
>> commit: e5dbd33218bd8d87ab69f730ab90aed5fab7eb26 ("mm/writeback: Add wai=
t_on_page_writeback_killable")
> That commit just adds a function.  It doesn't add any callers.  It must
> just be moving something around ...

The micro benchmark like will-it-scale is sensitive to the alignments =

(text/data), so I apply the data align debug patch and re-test, the =

regression reduced to -1.5%.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/nr_task/mode/test/cpufreq_gover=
nor/ucode:
lkp-csl-2sp9/will-it-scale/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3-=
ge5dbd33218bd-no-dynamic/gcc-9/16/process/mmap2/performance/0x5003006

commit:
 =C2=A0 a142a3781e3dc0c03a48688cac619c2684eed18f (fs/cachefiles: Remove =

wait_bit_key layout dependency)
 =C2=A0 86460bf788cb360a14811fadb3f94f9765ba5a23 (mm/writeback: Add =

wait_on_page_writeback_killable)

a142a3781e3dc0c0 86460bf788cb360a14811fadb3f
---------------- ---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
 =C2=A0=C2=A0 9089952=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.5%=C2=A0=C2=A0=C2=A0 8953838 will-it-scale.16.processes
 =C2=A0=C2=A0=C2=A0 568121=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -1.5%=C2=A0=C2=A0=C2=A0=C2=A0 559614 will-it-scale.per_p=
rocess_ops
 =C2=A0=C2=A0 9089952=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -1.5%=C2=A0=C2=A0=C2=A0 8953838=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 will-it-scale.workload

>> 39f985c8f667c80a e5dbd33218bd8d87ab69f730ab9
>> ---------------- ---------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>     9359770            -3.8%    9001769        will-it-scale.16.processes
>>      584985            -3.8%     562610        will-it-scale.per_process=
_ops
>>     9359770            -3.8%    9001769        will-it-scale.workload
>>       15996            -1.2%      15811        proc-vmstat.nr_kernel_sta=
ck
>>       23577 =C2=B1 10%     +18.5%      27937 =C2=B1  7%  softirqs.CPU48.=
SCHED
>>        5183 =C2=B1 41%     +47.2%       7630 =C2=B1  7%  interrupts.CPU1=
.NMI:Non-maskable_interrupts
>>        5183 =C2=B1 41%     +47.2%       7630 =C2=B1  7%  interrupts.CPU1=
.PMI:Performance_monitoring_interrupts
>>       54.33 =C2=B1 12%     +18.4%      64.33 =C2=B1  7%  perf-sched.wait=
_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.const=
prop.0.do_sys_poll
>>      153.34 =C2=B1 24%     -45.9%      83.00 =C2=B1 25%  perf-sched.wait=
_and_delay.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>      153.33 =C2=B1 24%     -45.9%      82.99 =C2=B1 25%  perf-sched.wait=
_time.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>   2.424e+10            -3.8%  2.332e+10        perf-stat.i.branch-instru=
ctions
>>        0.47            +3.7%       0.48        perf-stat.i.cpi
>>   2.529e+10            -4.0%  2.428e+10        perf-stat.i.dTLB-loads
>>    1.15e+10            -3.8%  1.106e+10        perf-stat.i.dTLB-stores
>>    54249733            -4.8%   51627939        perf-stat.i.iTLB-load-mis=
ses
>>   1.004e+11            -3.8%  9.661e+10        perf-stat.i.instructions
>>        2.15            -3.6%       2.07        perf-stat.i.ipc
>>      693.66            -3.9%     666.70        perf-stat.i.metric.M/sec
>>        0.46            +3.7%       0.48        perf-stat.overall.cpi
>>        2.15            -3.6%       2.08        perf-stat.overall.ipc
>>   2.416e+10            -3.8%  2.324e+10        perf-stat.ps.branch-instr=
uctions
>>    2.52e+10            -4.0%  2.419e+10        perf-stat.ps.dTLB-loads
>>   1.146e+10            -3.8%  1.102e+10        perf-stat.ps.dTLB-stores
>>    54065825            -4.8%   51454019        perf-stat.ps.iTLB-load-mi=
sses
>>   1.001e+11            -3.8%  9.628e+10        perf-stat.ps.instructions
>>   3.025e+13            -3.9%  2.908e+13        perf-stat.total.instructi=
ons
>>        0.89 =C2=B1 14%      -0.1        0.77 =C2=B1 11%  perf-profile.ca=
lltrace.cycles-pp.atime_needs_update.touch_atime.shmem_mmap.mmap_region.do_=
mmap
>>        0.14 =C2=B1 13%      -0.1        0.04 =C2=B1 71%  perf-profile.ch=
ildren.cycles-pp.common_mmap
>>        0.61 =C2=B1 12%      -0.1        0.52 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.common_file_perm
>>        0.21 =C2=B1  8%      -0.0        0.17 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.vma_set_page_prot
>>        0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.blocking_notifier_call_chain
>>        0.12 =C2=B1 14%      -0.0        0.09 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.get_mmap_base
>>        0.09 =C2=B1  8%      -0.0        0.07 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.vm_pgprot_modify
>>        0.13 =C2=B1 15%      +0.1        0.19 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.cap_capable
>>        0.03 =C2=B1102%      +0.1        0.12 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.munmap(a)plt
>>        0.14 =C2=B1 13%      +0.1        0.24 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.testcase
>>        0.33 =C2=B1 10%      -0.1        0.23 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.cap_vm_enough_memory
>>        0.13 =C2=B1 11%      -0.1        0.03 =C2=B1100%  perf-profile.se=
lf.cycles-pp.common_mmap
>>        0.48 =C2=B1 12%      -0.1        0.41 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.common_file_perm
>>        0.49 =C2=B1 12%      -0.1        0.43 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.vm_area_alloc
>>        0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.blocking_notifier_call_chain
>>        0.12 =C2=B1 13%      -0.0        0.09 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.get_mmap_base
>>        0.11 =C2=B1  8%      +0.0        0.16 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.__x64_sys_munmap
>>        0.11 =C2=B1 14%      +0.1        0.18 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.cap_capable
>>        0.12 =C2=B1 11%      +0.1        0.20 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.testcase
>>        0.01 =C2=B1223%      +0.1        0.11 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.munmap(a)plt
> I'm struggling to see anything in that that says anything other than
> "we did 3-4% less work".  Maybe someone else has something useful to
> say about it?
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing

--===============6804966760516707662==--

