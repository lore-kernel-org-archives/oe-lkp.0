Content-Type: multipart/mixed; boundary="===============7633903553695602314=="
MIME-Version: 1.0
From: Chao Yu <yuchao0@huawei.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] 089842de57: aim7.jobs-per-min 15.4% improvement
Date: Wed, 12 Dec 2018 11:23:23 +0800
Message-ID: <0ca4f51d-e63f-d4a1-38fb-46ba3eff81a7@huawei.com>
In-Reply-To: <4710ed66-d50b-0b49-1360-5b60e84b0215@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7633903553695602314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2018/12/12 11:01, Rong Chen wrote:
> =

> =

> On 12/11/2018 06:12 PM, Chao Yu wrote:
>> Hi all,
>>
>> The commit only clean up codes which are unused currently, so why we can
>> improve performance with it? could you retest to make sure?
> =

> Hi Chao,
> =

> the improvement is exist in 0day environment.

Hi Rong,

Logically, the deleted codes are dead, and removal of them shouldn't impact
any flows.

Instead, I expect below patch can improve performance in some cases:

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=
=3Ddev-test&id=3D1e771e83ce26d0ba2ce6c7df7effb7822f032c4a

So I suspect there is problem in current test result, not sure the problem
is in test suit or test environment.

Any thoughts?

Thanks,

> =

> =E2=9E=9C=C2=A0 job cat =

> /result/aim7/4BRD_12G-RAID1-f2fs-disk_rw-3000-performance/lkp-ivb-ep01/de=
bian-x86_64-2018-04-03.cgz/x86_64-rhel-7.2/gcc-7/089842de5750f434aa016eb23f=
3d3a3a151083bd/*/aim7.json =

> | grep -A1 min\"
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 111406.82
> --
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 110851.09
> --
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 111399.93
> --
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 110327.92
> --
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 110321.16
> =

> =E2=9E=9C=C2=A0 job cat =

> /result/aim7/4BRD_12G-RAID1-f2fs-disk_rw-3000-performance/lkp-ivb-ep01/de=
bian-x86_64-2018-04-03.cgz/x86_64-rhel-7.2/gcc-7/d6c66cd19ef322fe0d51ba09ce=
1b7f386acab04a/*/aim7.json =

> | grep -A1 min\"
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 97082.14
> --
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 95959.06
> --
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 95959.06
> --
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 95851.75
> --
>  =C2=A0 "aim7.jobs-per-min": [
>  =C2=A0=C2=A0=C2=A0 96946.19
> =

> Best Regards,
> Rong Chen
> =

>>
>> Thanks,
>>
>> On 2018/12/11 17:59, kernel test robot wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a 15.4% improvement of aim7.jobs-per-min due to commit:
>>>
>>>
>>> commit: 089842de5750f434aa016eb23f3d3a3a151083bd ("f2fs: remove codes o=
f unused wio_mutex")
>>> https://git.kernel.org/cgit/linux/kernel/git/jaegeuk/f2fs.git dev-test
>>>
>>> in testcase: aim7
>>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz w=
ith 384G memory
>>> with following parameters:
>>>
>>> 	disk: 4BRD_12G
>>> 	md: RAID1
>>> 	fs: f2fs
>>> 	test: disk_rw
>>> 	load: 3000
>>> 	cpufreq_governor: performance
>>>
>>> test-description: AIM7 is a traditional UNIX system level benchmark sui=
te which is used to test and measure the performance of multiuser system.
>>> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
>>>
>>> In addition to that, the commit also has significant impact on the foll=
owing tests:
>>>
>>> +------------------+---------------------------------------------------=
--------------------+
>>> | testcase: change | aim7: aim7.jobs-per-min 8.8% improvement          =
                    |
>>> | test machine     | 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00G=
Hz with 384G memory |
>>> | test parameters  | cpufreq_governor=3Dperformance                    =
                      |
>>> |                  | disk=3D4BRD_12G                                   =
                      |
>>> |                  | fs=3Df2fs                                         =
                      |
>>> |                  | load=3D3000                                       =
                      |
>>> |                  | md=3DRAID1                                        =
                      |
>>> |                  | test=3Ddisk_rr                                    =
                      |
>>> +------------------+---------------------------------------------------=
--------------------+
>>>
>>>
>>> Details are as below:
>>> -----------------------------------------------------------------------=
--------------------------->
>>>
>>>
>>> To reproduce:
>>>
>>>          git clone https://github.com/intel/lkp-tests.git
>>>          cd lkp-tests
>>>          bin/lkp install job.yaml  # job file is attached in this email
>>>          bin/lkp run     job.yaml
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/tes=
t/testcase:
>>>    gcc-7/performance/4BRD_12G/f2fs/x86_64-rhel-7.2/3000/RAID1/debian-x8=
6_64-2018-04-03.cgz/lkp-ivb-ep01/disk_rw/aim7
>>>
>>> commit:
>>>    d6c66cd19e ("f2fs: fix count of seg_freed to make sec_freed correct")
>>>    089842de57 ("f2fs: remove codes of unused wio_mutex")
>>>
>>> d6c66cd19ef322fe 089842de5750f434aa016eb23f
>>> ---------------- --------------------------
>>>           %stddev     %change         %stddev
>>>               \          |                \
>>>       96213           +15.4%     110996        aim7.jobs-per-min
>>>      191.50 =C2=B1  3%     -15.1%     162.52        aim7.time.elapsed_t=
ime
>>>      191.50 =C2=B1  3%     -15.1%     162.52        aim7.time.elapsed_t=
ime.max
>>>     1090253 =C2=B1  2%     -17.5%     899165        aim7.time.involunta=
ry_context_switches
>>>      176713            -7.5%     163478        aim7.time.minor_page_fau=
lts
>>>        6882           -14.6%       5875        aim7.time.system_time
>>>      127.97            +4.7%     134.00        aim7.time.user_time
>>>      760923            +7.1%     814632        aim7.time.voluntary_cont=
ext_switches
>>>       78499 =C2=B1  2%     -11.2%      69691        interrupts.CAL:Func=
tion_call_interrupts
>>>     3183861 =C2=B1  4%     -16.7%    2651390 =C2=B1  4%  softirqs.TIMER
>>>      191.54 =C2=B1 13%     +45.4%     278.59 =C2=B1 12%  iostat.md0.w/s
>>>        6118 =C2=B1  3%     +16.5%       7126 =C2=B1  2%  iostat.md0.wkB=
/s
>>>      151257 =C2=B1  2%     -10.1%     135958 =C2=B1  2%  meminfo.AnonHu=
gePages
>>>       46754 =C2=B1  3%     +14.0%      53307 =C2=B1  3%  meminfo.max_us=
ed_kB
>>>        0.03 =C2=B1 62%      -0.0        0.01 =C2=B1 78%  mpstat.cpu.sof=
t%
>>>        1.73 =C2=B1  3%      +0.4        2.13 =C2=B1  3%  mpstat.cpu.usr%
>>>    16062961 =C2=B1  2%     -12.1%   14124403 =C2=B1  2%  turbostat.IRQ
>>>        0.76 =C2=B1 37%     -71.8%       0.22 =C2=B1 83%  turbostat.Pkg%=
pc6
>>>        9435 =C2=B1  7%     -18.1%       7730 =C2=B1  4%  turbostat.SMI
>>>        6113 =C2=B1  3%     +16.5%       7120 =C2=B1  2%  vmstat.io.bo
>>>       11293 =C2=B1  2%     +12.3%      12688 =C2=B1  2%  vmstat.system.=
cs
>>>       81879 =C2=B1  2%      +2.5%      83951        vmstat.system.in
>>>        2584            -4.4%       2469 =C2=B1  2%  proc-vmstat.nr_acti=
ve_file
>>>        2584            -4.4%       2469 =C2=B1  2%  proc-vmstat.nr_zone=
_active_file
>>>       28564 =C2=B1  4%     -23.6%      21817 =C2=B1 12%  proc-vmstat.nu=
ma_hint_faults
>>>       10958 =C2=B1  5%     -43.9%       6147 =C2=B1 26%  proc-vmstat.nu=
ma_hint_faults_local
>>>      660531 =C2=B1  3%     -10.7%     590059 =C2=B1  2%  proc-vmstat.pg=
fault
>>>        1191 =C2=B1  7%     -16.5%     995.25 =C2=B1 12%  slabinfo.UNIX.=
active_objs
>>>        1191 =C2=B1  7%     -16.5%     995.25 =C2=B1 12%  slabinfo.UNIX.=
num_objs
>>>       10552 =C2=B1  4%      -7.8%       9729        slabinfo.ext4_io_en=
d.active_objs
>>>       10552 =C2=B1  4%      -7.8%       9729        slabinfo.ext4_io_en=
d.num_objs
>>>       18395           +12.3%      20656 =C2=B1  8%  slabinfo.kmalloc-32=
.active_objs
>>>       18502 =C2=B1  2%     +12.3%      20787 =C2=B1  8%  slabinfo.kmall=
oc-32.num_objs
>>>   1.291e+12           -12.3%  1.131e+12        perf-stat.branch-instruc=
tions
>>>        0.66            +0.1        0.76 =C2=B1  3%  perf-stat.branch-mi=
ss-rate%
>>>   1.118e+10 =C2=B1  4%      -7.5%  1.034e+10        perf-stat.cache-mis=
ses
>>>   2.772e+10 =C2=B1  8%      -6.6%  2.589e+10        perf-stat.cache-ref=
erences
>>>     2214958            -3.6%    2136237        perf-stat.context-switch=
es
>>>        3.95 =C2=B1  2%      -5.8%       3.72        perf-stat.cpi
>>>    2.24e+13           -16.4%  1.873e+13        perf-stat.cpu-cycles
>>>   1.542e+12           -10.4%  1.382e+12        perf-stat.dTLB-loads
>>>        0.18 =C2=B1  6%      +0.0        0.19 =C2=B1  4%  perf-stat.dTLB=
-store-miss-rate%
>>>   5.667e+12           -11.3%  5.029e+12        perf-stat.instructions
>>>        5534           -13.1%       4809 =C2=B1  6%  perf-stat.instructi=
ons-per-iTLB-miss
>>>        0.25 =C2=B1  2%      +6.1%       0.27        perf-stat.ipc
>>>      647970 =C2=B1  2%     -10.7%     578955 =C2=B1  2%  perf-stat.mino=
r-faults
>>>   2.783e+09 =C2=B1 18%     -17.8%  2.288e+09 =C2=B1  4%  perf-stat.node=
-loads
>>>   5.706e+09 =C2=B1  2%      -5.2%  5.407e+09        perf-stat.node-stor=
e-misses
>>>   7.693e+09            -4.4%  7.352e+09        perf-stat.node-stores
>>>      647979 =C2=B1  2%     -10.7%     578955 =C2=B1  2%  perf-stat.page=
-faults
>>>       70960 =C2=B1 16%     -26.6%      52062        sched_debug.cfs_rq:=
/.exec_clock.avg
>>>       70628 =C2=B1 16%     -26.7%      51787        sched_debug.cfs_rq:=
/.exec_clock.min
>>>       22499 =C2=B1  3%     -10.5%      20133 =C2=B1  3%  sched_debug.cf=
s_rq:/.load.avg
>>>        7838 =C2=B1 23%     -67.6%       2536 =C2=B1 81%  sched_debug.cf=
s_rq:/.load.min
>>>      362.19 =C2=B1 12%     +58.3%     573.50 =C2=B1 25%  sched_debug.cf=
s_rq:/.load_avg.max
>>>     3092960 =C2=B1 16%     -28.5%    2211400        sched_debug.cfs_rq:=
/.min_vruntime.avg
>>>     3244162 =C2=B1 15%     -27.0%    2367437 =C2=B1  2%  sched_debug.cf=
s_rq:/.min_vruntime.max
>>>     2984299 =C2=B1 16%     -28.9%    2121271        sched_debug.cfs_rq:=
/.min_vruntime.min
>>>        0.73 =C2=B1  4%     -65.7%       0.25 =C2=B1 57%  sched_debug.cf=
s_rq:/.nr_running.min
>>>        0.12 =C2=B1 13%    +114.6%       0.26 =C2=B1  9%  sched_debug.cf=
s_rq:/.nr_running.stddev
>>>        8.44 =C2=B1 23%     -36.8%       5.33 =C2=B1 15%  sched_debug.cf=
s_rq:/.nr_spread_over.max
>>>        1.49 =C2=B1 21%     -29.6%       1.05 =C2=B1  7%  sched_debug.cf=
s_rq:/.nr_spread_over.stddev
>>>       16.53 =C2=B1 20%     -38.8%      10.12 =C2=B1 23%  sched_debug.cf=
s_rq:/.runnable_load_avg.avg
>>>       15259 =C2=B1  7%     -33.3%      10176 =C2=B1 22%  sched_debug.cf=
s_rq:/.runnable_weight.avg
>>>      796.65 =C2=B1 93%     -74.8%     200.68 =C2=B1 17%  sched_debug.cf=
s_rq:/.util_est_enqueued.avg
>>>      669258 =C2=B1  3%     -13.3%     580068        sched_debug.cpu.avg=
_idle.avg
>>>      116020 =C2=B1 12%     -21.4%      91239        sched_debug.cpu.clo=
ck.avg
>>>      116076 =C2=B1 12%     -21.4%      91261        sched_debug.cpu.clo=
ck.max
>>>      115967 =C2=B1 12%     -21.3%      91215        sched_debug.cpu.clo=
ck.min
>>>      116020 =C2=B1 12%     -21.4%      91239        sched_debug.cpu.clo=
ck_task.avg
>>>      116076 =C2=B1 12%     -21.4%      91261        sched_debug.cpu.clo=
ck_task.max
>>>      115967 =C2=B1 12%     -21.3%      91215        sched_debug.cpu.clo=
ck_task.min
>>>       15.41 =C2=B1  4%     -32.0%      10.48 =C2=B1 24%  sched_debug.cp=
u.cpu_load[0].avg
>>>       15.71 =C2=B1  6%     -26.6%      11.53 =C2=B1 22%  sched_debug.cp=
u.cpu_load[1].avg
>>>       16.20 =C2=B1  8%     -22.9%      12.49 =C2=B1 21%  sched_debug.cp=
u.cpu_load[2].avg
>>>       16.92 =C2=B1  7%     -21.2%      13.33 =C2=B1 21%  sched_debug.cp=
u.cpu_load[3].avg
>>>        2650 =C2=B1  6%     -15.6%       2238 =C2=B1  3%  sched_debug.cp=
u.curr->pid.avg
>>>        1422 =C2=B1  8%     -68.5%     447.42 =C2=B1 57%  sched_debug.cp=
u.curr->pid.min
>>>        7838 =C2=B1 23%     -67.6%       2536 =C2=B1 81%  sched_debug.cp=
u.load.min
>>>       86066 =C2=B1 14%     -26.3%      63437        sched_debug.cpu.nr_=
load_updates.min
>>>        3.97 =C2=B1 88%     -70.9%       1.15 =C2=B1 10%  sched_debug.cp=
u.nr_running.avg
>>>        0.73 =C2=B1  4%     -65.7%       0.25 =C2=B1 57%  sched_debug.cp=
u.nr_running.min
>>>        1126 =C2=B1 16%     -27.6%     816.02 =C2=B1  9%  sched_debug.cp=
u.sched_count.stddev
>>>        1468 =C2=B1 16%     +31.1%       1925 =C2=B1  5%  sched_debug.cp=
u.sched_goidle.avg
>>>        1115 =C2=B1 16%     +37.8%       1538 =C2=B1  4%  sched_debug.cp=
u.sched_goidle.min
>>>        3979 =C2=B1 13%     -27.4%       2888 =C2=B1  5%  sched_debug.cp=
u.ttwu_local.max
>>>      348.96 =C2=B1  8%     -26.3%     257.16 =C2=B1 13%  sched_debug.cp=
u.ttwu_local.stddev
>>>      115966 =C2=B1 12%     -21.3%      91214        sched_debug.cpu_clk
>>>      113505 =C2=B1 12%     -21.8%      88773        sched_debug.ktime
>>>      116416 =C2=B1 12%     -21.3%      91663        sched_debug.sched_c=
lk
>>>        0.26 =C2=B1100%      +0.3        0.57 =C2=B1  6%  perf-profile.c=
alltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
>>>        0.29 =C2=B1100%      +0.4        0.66 =C2=B1  5%  perf-profile.c=
alltrace.cycles-pp.find_get_entry.pagecache_get_page.f2fs_write_begin.gener=
ic_perform_write.__generic_file_write_iter
>>>        0.67 =C2=B1 65%      +0.4        1.11        perf-profile.calltr=
ace.cycles-pp.copy_user_enhanced_fast_string.copyin.iov_iter_copy_from_user=
_atomic.generic_perform_write.__generic_file_write_iter
>>>        0.69 =C2=B1 65%      +0.5        1.14        perf-profile.calltr=
ace.cycles-pp.copyin.iov_iter_copy_from_user_atomic.generic_perform_write._=
_generic_file_write_iter.f2fs_file_write_iter
>>>        1.07 =C2=B1 57%      +0.5        1.61 =C2=B1  5%  perf-profile.c=
alltrace.cycles-pp.pagecache_get_page.f2fs_write_begin.generic_perform_writ=
e.__generic_file_write_iter.f2fs_file_write_iter
>>>        0.79 =C2=B1 64%      +0.5        1.33        perf-profile.calltr=
ace.cycles-pp.iov_iter_copy_from_user_atomic.generic_perform_write.__generi=
c_file_write_iter.f2fs_file_write_iter.__vfs_write
>>>        0.73 =C2=B1 63%      +0.6        1.32 =C2=B1  3%  perf-profile.c=
alltrace.cycles-pp.syscall_return_via_sysret
>>>        0.81 =C2=B1 63%      +0.6        1.43 =C2=B1  3%  perf-profile.c=
alltrace.cycles-pp.entry_SYSCALL_64
>>>        0.06 =C2=B1 58%      +0.0        0.09 =C2=B1  4%  perf-profile.c=
hildren.cycles-pp.__pagevec_lru_add_fn
>>>        0.05 =C2=B1 58%      +0.0        0.09 =C2=B1 13%  perf-profile.c=
hildren.cycles-pp.down_write_trylock
>>>        0.06 =C2=B1 58%      +0.0        0.10 =C2=B1  4%  perf-profile.c=
hildren.cycles-pp.__x64_sys_write
>>>        0.07 =C2=B1 58%      +0.0        0.11 =C2=B1  3%  perf-profile.c=
hildren.cycles-pp.account_page_dirtied
>>>        0.04 =C2=B1 57%      +0.0        0.09 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.account_page_cleaned
>>>        0.06 =C2=B1 58%      +0.0        0.10 =C2=B1  7%  perf-profile.c=
hildren.cycles-pp.free_pcppages_bulk
>>>        0.10 =C2=B1 58%      +0.1        0.15 =C2=B1  6%  perf-profile.c=
hildren.cycles-pp.page_mapping
>>>        0.09 =C2=B1 57%      +0.1        0.14 =C2=B1  7%  perf-profile.c=
hildren.cycles-pp.__lru_cache_add
>>>        0.10 =C2=B1 57%      +0.1        0.15 =C2=B1  9%  perf-profile.c=
hildren.cycles-pp.__might_sleep
>>>        0.12 =C2=B1 58%      +0.1        0.19 =C2=B1  3%  perf-profile.c=
hildren.cycles-pp.set_page_dirty
>>>        0.08 =C2=B1 64%      +0.1        0.15 =C2=B1 10%  perf-profile.c=
hildren.cycles-pp.dquot_claim_space_nodirty
>>>        0.06 =C2=B1 61%      +0.1        0.13 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.percpu_counter_add_batch
>>>        0.18 =C2=B1 57%      +0.1        0.27 =C2=B1  2%  perf-profile.c=
hildren.cycles-pp.iov_iter_fault_in_readable
>>>        0.17 =C2=B1 57%      +0.1        0.26 =C2=B1  2%  perf-profile.c=
hildren.cycles-pp.__set_page_dirty_nobuffers
>>>        0.09 =C2=B1 57%      +0.1        0.18 =C2=B1 27%  perf-profile.c=
hildren.cycles-pp.free_unref_page_list
>>>        0.16 =C2=B1 58%      +0.1        0.30 =C2=B1 18%  perf-profile.c=
hildren.cycles-pp.__pagevec_release
>>>        0.30 =C2=B1 57%      +0.1        0.43 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.add_to_page_cache_lru
>>>        0.17 =C2=B1 58%      +0.1        0.31 =C2=B1 16%  perf-profile.c=
hildren.cycles-pp.release_pages
>>>        0.29 =C2=B1 58%      +0.2        0.45 =C2=B1  7%  perf-profile.c=
hildren.cycles-pp.selinux_file_permission
>>>        0.38 =C2=B1 57%      +0.2        0.58 =C2=B1  6%  perf-profile.c=
hildren.cycles-pp.security_file_permission
>>>        0.78 =C2=B1 57%      +0.3        1.12        perf-profile.childr=
en.cycles-pp.copy_user_enhanced_fast_string
>>>        0.80 =C2=B1 57%      +0.3        1.15        perf-profile.childr=
en.cycles-pp.copyin
>>>        0.92 =C2=B1 57%      +0.4        1.34        perf-profile.childr=
en.cycles-pp.iov_iter_copy_from_user_atomic
>>>        0.98 =C2=B1 54%      +0.5        1.43 =C2=B1  3%  perf-profile.c=
hildren.cycles-pp.entry_SYSCALL_64
>>>        0.98 =C2=B1 53%      +0.5        1.50 =C2=B1  3%  perf-profile.c=
hildren.cycles-pp.syscall_return_via_sysret
>>>        1.64 =C2=B1 57%      +0.8        2.45 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.pagecache_get_page
>>>        0.04 =C2=B1 57%      +0.0        0.06        perf-profile.self.c=
ycles-pp.__pagevec_lru_add_fn
>>>        0.04 =C2=B1 58%      +0.0        0.07 =C2=B1  7%  perf-profile.s=
elf.cycles-pp.release_pages
>>>        0.05 =C2=B1 58%      +0.0        0.08 =C2=B1 15%  perf-profile.s=
elf.cycles-pp._cond_resched
>>>        0.04 =C2=B1 58%      +0.0        0.08 =C2=B1  6%  perf-profile.s=
elf.cycles-pp.ksys_write
>>>        0.05 =C2=B1 58%      +0.0        0.09 =C2=B1 13%  perf-profile.s=
elf.cycles-pp.down_write_trylock
>>>        0.09 =C2=B1 58%      +0.1        0.14 =C2=B1  9%  perf-profile.s=
elf.cycles-pp.page_mapping
>>>        0.01 =C2=B1173%      +0.1        0.07 =C2=B1  7%  perf-profile.s=
elf.cycles-pp.__fdget_pos
>>>        0.11 =C2=B1 57%      +0.1        0.17 =C2=B1  7%  perf-profile.s=
elf.cycles-pp.entry_SYSCALL_64_after_hwframe
>>>        0.05 =C2=B1 59%      +0.1        0.12 =C2=B1  5%  perf-profile.s=
elf.cycles-pp.percpu_counter_add_batch
>>>        0.12 =C2=B1 58%      +0.1        0.19 =C2=B1  4%  perf-profile.s=
elf.cycles-pp.iov_iter_copy_from_user_atomic
>>>        0.17 =C2=B1 57%      +0.1        0.24 =C2=B1  4%  perf-profile.s=
elf.cycles-pp.generic_perform_write
>>>        0.17 =C2=B1 58%      +0.1        0.26 =C2=B1  2%  perf-profile.s=
elf.cycles-pp.iov_iter_fault_in_readable
>>>        0.19 =C2=B1 57%      +0.1        0.30 =C2=B1  2%  perf-profile.s=
elf.cycles-pp.f2fs_set_data_page_dirty
>>>        0.18 =C2=B1 58%      +0.1        0.30 =C2=B1  4%  perf-profile.s=
elf.cycles-pp.pagecache_get_page
>>>        0.27 =C2=B1 57%      +0.1        0.41 =C2=B1  4%  perf-profile.s=
elf.cycles-pp.do_syscall_64
>>>        0.40 =C2=B1 57%      +0.2        0.62 =C2=B1  5%  perf-profile.s=
elf.cycles-pp.find_get_entry
>>>        0.77 =C2=B1 57%      +0.3        1.11        perf-profile.self.c=
ycles-pp.copy_user_enhanced_fast_string
>>>        0.96 =C2=B1 54%      +0.5        1.43 =C2=B1  3%  perf-profile.s=
elf.cycles-pp.entry_SYSCALL_64
>>>        0.98 =C2=B1 53%      +0.5        1.50 =C2=B1  2%  perf-profile.s=
elf.cycles-pp.syscall_return_via_sysret
>>>        0.72 =C2=B1 59%      +0.5        1.26 =C2=B1 10%  perf-profile.s=
elf.cycles-pp.f2fs_lookup_extent_cache
>>>
>>>
>>>                                                                        =
          =

>>>                                    aim7.jobs-per-min
>>>                                                                        =
          =

>>>    114000 +-+----------------------------------------------------------=
------+
>>>    112000 +-+     O                                                    =
      |
>>>           O    O       O    O    O    O                    O  O O      =
      |
>>>    110000 +-+       O    O     O    O    O              O          O   =
      |
>>>    108000 +-+                                                          =
      |
>>>           |                                 O O  O O  O                =
      |
>>>    106000 +-+O                                                         =
      |
>>>    104000 +-+                                                          =
      |
>>>    102000 +-+                                                          =
      |
>>>           |                                                            =
      |
>>>    100000 +-+                                                          =
      |
>>>     98000 +-+                                                          =
      |
>>>           |.. .+..+.+..    .+.. .+.. .+..+..+.+.. .+..+.+..+..+.+..  +.=
.     |
>>>     96000 +-++          .+.    +    +            +                  +  =
 +.+..|
>>>     94000 +-+----------------------------------------------------------=
------+
>>>                                                                        =
          =

>>>                                                                        =
                                                                           =
               =

>>>                                 aim7.time.system_time
>>>                                                                        =
          =

>>>    7200 +-+------------------------------------------------------------=
------+
>>>         |                                                              =
      |
>>>    7000 +-+         .+..     +..                                 .+..  =
      |
>>>         | .+.     .+    +.. +     .+.     .+.  .+.     .+.     .+      =
.+.+..|
>>>    6800 +-+  +..+.         +    +.   +..+.   +.   +..+.   +..+.      +.=
      |
>>>         |                                                              =
      |
>>>    6600 +-+                                                            =
      |
>>>         |                                                              =
      |
>>>    6400 +-+                                                            =
      |
>>>         |  O                                                           =
      |
>>>    6200 +-+                                                            =
      |
>>>         |                                  O O  O O  O                 =
      |
>>>    6000 +-+                  O     O                    O              =
      |
>>>         O    O     O O  O  O         O  O                    O  O O    =
      |
>>>    5800 +-+-----O---------------O-------------------------O------------=
------+
>>>                                                                        =
          =

>>>                                                                        =
                                                                           =
               =

>>>                                aim7.time.elapsed_time
>>>                                                                        =
          =

>>>    205 +-+-------------------------------------------------------------=
------+
>>>        |                                                               =
   :: |
>>>    200 +-+                                                             =
  : : |
>>>    195 +-+                                                             =
  :  :|
>>>        |           .+..                                           +..  =
 :   :|
>>>    190 +-++.     .+    +..  .+.  .+..    .+.. .+..    .+..       +     =
.+    |
>>>    185 +-+  +..+.         +.   +.    +.+.    +    +..+    +..+..+    +.=
      |
>>>        |                                                               =
      |
>>>    180 +-+                                                             =
      |
>>>    175 +-+                                                             =
      |
>>>        |  O                                                            =
      |
>>>    170 +-+                                   O    O  O                 =
      |
>>>    165 +-+                        O       O    O                       =
      |
>>>        O    O     O O  O  O  O O     O O               O  O  O  O O    =
      |
>>>    160 +-+-----O-------------------------------------------------------=
------+
>>>                                                                        =
          =

>>>                                                                        =
                                                                           =
               =

>>>                              aim7.time.elapsed_time.max
>>>                                                                        =
          =

>>>    205 +-+-------------------------------------------------------------=
------+
>>>        |                                                               =
   :: |
>>>    200 +-+                                                             =
  : : |
>>>    195 +-+                                                             =
  :  :|
>>>        |           .+..                                           +..  =
 :   :|
>>>    190 +-++.     .+    +..  .+.  .+..    .+.. .+..    .+..       +     =
.+    |
>>>    185 +-+  +..+.         +.   +.    +.+.    +    +..+    +..+..+    +.=
      |
>>>        |                                                               =
      |
>>>    180 +-+                                                             =
      |
>>>    175 +-+                                                             =
      |
>>>        |  O                                                            =
      |
>>>    170 +-+                                   O    O  O                 =
      |
>>>    165 +-+                        O       O    O                       =
      |
>>>        O    O     O O  O  O  O O     O O               O  O  O  O O    =
      |
>>>    160 +-+-----O-------------------------------------------------------=
------+
>>>                                                                        =
          =

>>>                                                                        =
                                                                           =
               =

>>>                          aim7.time.involuntary_context_switches
>>>                                                                        =
          =

>>>    1.15e+06 +-+--------------------------------------------------------=
------+
>>>             |                   +..                                    =
    + |
>>>     1.1e+06 +-++     .+.. .+.. +    .+..    .+.  .+     .+..    .+.    =
   : +|
>>>             |.  +  .+    +    +    +     .+.   +.  +  .+    +.+.   +..+=
   :  |
>>>             |    +.                     +           +.                 =
+ :   |
>>>    1.05e+06 +-+                                                        =
 +    |
>>>             |                                                          =
      |
>>>       1e+06 +-+                                                        =
      |
>>>             |                                                          =
      |
>>>      950000 +-+                                                        =
      |
>>>             |                                          O               =
      |
>>>             O  O O    O         O    O    O              O         O   =
      |
>>>      900000 +-+          O O  O         O    O O  O O       O O  O     =
      |
>>>             |       O              O                                   =
      |
>>>      850000 +-+--------------------------------------------------------=
------+
>>>                                                                        =
          =

>>>                                                                        =
          =

>>> [*] bisect-good sample
>>> [O] bisect-bad  sample
>>>
>>> ***********************************************************************=
****************************
>>> lkp-ivb-ep01: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz with=
 384G memory
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/tes=
t/testcase:
>>>    gcc-7/performance/4BRD_12G/f2fs/x86_64-rhel-7.2/3000/RAID1/debian-x8=
6_64-2018-04-03.cgz/lkp-ivb-ep01/disk_rr/aim7
>>>
>>> commit:
>>>    d6c66cd19e ("f2fs: fix count of seg_freed to make sec_freed correct")
>>>    089842de57 ("f2fs: remove codes of unused wio_mutex")
>>>
>>> d6c66cd19ef322fe 089842de5750f434aa016eb23f
>>> ---------------- --------------------------
>>>         fail:runs  %reproduction    fail:runs
>>>             |             |             |
>>>             :4           50%           2:4     dmesg.WARNING:at#for_ip_=
interrupt_entry/0x
>>>             :4           25%           1:4     kmsg.DHCP/BOOTP:Reply_no=
t_for_us_on_eth#,op[#]xid[#]
>>>             :4           25%           1:4     kmsg.IP-Config:Reopening=
_network_devices
>>>           %stddev     %change         %stddev
>>>               \          |                \
>>>      102582            +8.8%     111626        aim7.jobs-per-min
>>>      176.57            -8.5%     161.64        aim7.time.elapsed_time
>>>      176.57            -8.5%     161.64        aim7.time.elapsed_time.m=
ax
>>>     1060618           -12.5%     927723        aim7.time.involuntary_co=
ntext_switches
>>>        6408            -8.9%       5839        aim7.time.system_time
>>>      785554            +4.5%     820987        aim7.time.voluntary_cont=
ext_switches
>>>     1077477            -9.5%     975130 =C2=B1  2%  softirqs.RCU
>>>      184.77 =C2=B1  6%     +41.2%     260.90 =C2=B1 11%  iostat.md0.w/s
>>>        6609 =C2=B1  2%      +9.6%       7246        iostat.md0.wkB/s
>>>        0.00 =C2=B1 94%      +0.0        0.02 =C2=B1 28%  mpstat.cpu.sof=
t%
>>>        1.89 =C2=B1  4%      +0.3        2.15 =C2=B1  3%  mpstat.cpu.usr%
>>>        6546 =C2=B1 19%     -49.1%       3328 =C2=B1 63%  numa-numastat.=
node0.other_node
>>>        1470 =C2=B1 86%    +222.9%       4749 =C2=B1 45%  numa-numastat.=
node1.other_node
>>>      959.75 =C2=B1  8%     +16.8%       1120 =C2=B1  7%  slabinfo.UNIX.=
active_objs
>>>      959.75 =C2=B1  8%     +16.8%       1120 =C2=B1  7%  slabinfo.UNIX.=
num_objs
>>>       38.35            +3.2%      39.57 =C2=B1  2%  turbostat.RAMWatt
>>>        8800 =C2=B1  2%     -10.7%       7855 =C2=B1  3%  turbostat.SMI
>>>      103925 =C2=B1 27%     -59.5%      42134 =C2=B1 61%  numa-meminfo.n=
ode0.AnonHugePages
>>>       14267 =C2=B1 61%     -54.9%       6430 =C2=B1 76%  numa-meminfo.n=
ode0.Inactive(anon)
>>>       52220 =C2=B1 18%    +104.0%     106522 =C2=B1 40%  numa-meminfo.n=
ode1.AnonHugePages
>>>        6614 =C2=B1  2%      +9.6%       7248        vmstat.io.bo
>>>      316.00 =C2=B1  2%     -15.4%     267.25 =C2=B1  8%  vmstat.procs.r
>>>       12256 =C2=B1  2%      +6.9%      13098        vmstat.system.cs
>>>        2852 =C2=B1  3%     +12.5%       3208 =C2=B1  3%  numa-vmstat.no=
de0.nr_active_file
>>>        3566 =C2=B1 61%     -54.9%       1607 =C2=B1 76%  numa-vmstat.no=
de0.nr_inactive_anon
>>>        2852 =C2=B1  3%     +12.4%       3207 =C2=B1  3%  numa-vmstat.no=
de0.nr_zone_active_file
>>>        3566 =C2=B1 61%     -54.9%       1607 =C2=B1 76%  numa-vmstat.no=
de0.nr_zone_inactive_anon
>>>       95337            +2.3%      97499        proc-vmstat.nr_active_an=
on
>>>        5746 =C2=B1  2%      +4.3%       5990        proc-vmstat.nr_acti=
ve_file
>>>       89732            +2.0%      91532        proc-vmstat.nr_anon_pages
>>>       95337            +2.3%      97499        proc-vmstat.nr_zone_acti=
ve_anon
>>>        5746 =C2=B1  2%      +4.3%       5990        proc-vmstat.nr_zone=
_active_file
>>>       10407 =C2=B1  4%     -49.3%       5274 =C2=B1 52%  proc-vmstat.nu=
ma_hint_faults_local
>>>      615058            -6.0%     578344 =C2=B1  2%  proc-vmstat.pgfault
>>>   1.187e+12            -8.7%  1.084e+12        perf-stat.branch-instruc=
tions
>>>        0.65 =C2=B1  3%      +0.0        0.70 =C2=B1  2%  perf-stat.bran=
ch-miss-rate%
>>>     2219706            -2.5%    2164425        perf-stat.context-switch=
es
>>>   2.071e+13           -10.0%  1.864e+13        perf-stat.cpu-cycles
>>>      641874            -2.7%     624703        perf-stat.cpu-migrations
>>>   1.408e+12            -7.3%  1.305e+12        perf-stat.dTLB-loads
>>>    39182891 =C2=B1  4%    +796.4%  3.512e+08 =C2=B1150%  perf-stat.iTLB=
-loads
>>>   5.184e+12            -8.0%   4.77e+12        perf-stat.instructions
>>>        5035 =C2=B1  2%     -14.1%       4325 =C2=B1 13%  perf-stat.inst=
ructions-per-iTLB-miss
>>>      604219            -6.2%     566725        perf-stat.minor-faults
>>>   4.962e+09            -2.7%  4.827e+09        perf-stat.node-stores
>>>      604097            -6.2%     566730        perf-stat.page-faults
>>>      110.81 =C2=B1 13%     +25.7%     139.25 =C2=B1  8%  sched_debug.cf=
s_rq:/.load_avg.stddev
>>>       12.76 =C2=B1 74%    +114.6%      27.39 =C2=B1 38%  sched_debug.cf=
s_rq:/.removed.load_avg.avg
>>>       54.23 =C2=B1 62%     +66.2%      90.10 =C2=B1 17%  sched_debug.cf=
s_rq:/.removed.load_avg.stddev
>>>      585.18 =C2=B1 74%    +115.8%       1262 =C2=B1 38%  sched_debug.cf=
s_rq:/.removed.runnable_sum.avg
>>>        2489 =C2=B1 62%     +66.9%       4153 =C2=B1 17%  sched_debug.cf=
s_rq:/.removed.runnable_sum.stddev
>>>       11909 =C2=B1 10%     +44.7%      17229 =C2=B1 18%  sched_debug.cf=
s_rq:/.runnable_weight.avg
>>>        1401 =C2=B1  2%     +36.5%       1913 =C2=B1  5%  sched_debug.cp=
u.sched_goidle.avg
>>>        2350 =C2=B1  2%     +21.9%       2863 =C2=B1  5%  sched_debug.cp=
u.sched_goidle.max
>>>        1082 =C2=B1  5%     +39.2%       1506 =C2=B1  4%  sched_debug.cp=
u.sched_goidle.min
>>>        7327           +14.7%       8401 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.avg
>>>        5719 =C2=B1  3%     +18.3%       6767 =C2=B1  2%  sched_debug.cp=
u.ttwu_count.min
>>>        1518 =C2=B1  3%     +15.6%       1755 =C2=B1  3%  sched_debug.cp=
u.ttwu_local.min
>>>       88.70            -1.0       87.65        perf-profile.calltrace.c=
ycles-pp.generic_perform_write.__generic_file_write_iter.f2fs_file_write_it=
er.__vfs_write.vfs_write
>>>       54.51            -1.0       53.48        perf-profile.calltrace.c=
ycles-pp._raw_spin_lock.f2fs_inode_dirtied.f2fs_mark_inode_dirty_sync.f2fs_=
write_end.generic_perform_write
>>>       54.55            -1.0       53.53        perf-profile.calltrace.c=
ycles-pp.f2fs_mark_inode_dirty_sync.f2fs_write_end.generic_perform_write.__=
generic_file_write_iter.f2fs_file_write_iter
>>>       56.32            -1.0       55.30        perf-profile.calltrace.c=
ycles-pp.f2fs_write_end.generic_perform_write.__generic_file_write_iter.f2f=
s_file_write_iter.__vfs_write
>>>       54.54            -1.0       53.53        perf-profile.calltrace.c=
ycles-pp.f2fs_inode_dirtied.f2fs_mark_inode_dirty_sync.f2fs_write_end.gener=
ic_perform_write.__generic_file_write_iter
>>>       88.93            -1.0       87.96        perf-profile.calltrace.c=
ycles-pp.__generic_file_write_iter.f2fs_file_write_iter.__vfs_write.vfs_wri=
te.ksys_write
>>>       89.94            -0.8       89.14        perf-profile.calltrace.c=
ycles-pp.f2fs_file_write_iter.__vfs_write.vfs_write.ksys_write.do_syscall_64
>>>       90.01            -0.8       89.26        perf-profile.calltrace.c=
ycles-pp.__vfs_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>>>       90.72            -0.7       90.00        perf-profile.calltrace.c=
ycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>>       90.59            -0.7       89.87        perf-profile.calltrace.c=
ycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>>       13.32            -0.3       13.01        perf-profile.calltrace.c=
ycles-pp._raw_spin_lock.f2fs_inode_dirtied.f2fs_mark_inode_dirty_sync.f2fs_=
reserve_new_blocks.f2fs_reserve_block
>>>       13.33            -0.3       13.01        perf-profile.calltrace.c=
ycles-pp.f2fs_inode_dirtied.f2fs_mark_inode_dirty_sync.f2fs_reserve_new_blo=
cks.f2fs_reserve_block.f2fs_get_block
>>>       13.33            -0.3       13.01        perf-profile.calltrace.c=
ycles-pp.f2fs_mark_inode_dirty_sync.f2fs_reserve_new_blocks.f2fs_reserve_bl=
ock.f2fs_get_block.f2fs_write_begin
>>>       13.26            -0.3       12.94        perf-profile.calltrace.c=
ycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.f2fs_inode_dirtied=
.f2fs_mark_inode_dirty_sync.f2fs_reserve_new_blocks
>>>        1.30 =C2=B1  2%      +0.1        1.40 =C2=B1  2%  perf-profile.c=
alltrace.cycles-pp.entry_SYSCALL_64
>>>        2.20 =C2=B1  6%      +0.2        2.40 =C2=B1  3%  perf-profile.c=
alltrace.cycles-pp.generic_file_read_iter.__vfs_read.vfs_read.ksys_read.do_=
syscall_64
>>>        2.28 =C2=B1  5%      +0.2        2.52 =C2=B1  5%  perf-profile.c=
alltrace.cycles-pp.__vfs_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>>>        2.85 =C2=B1  4%      +0.3        3.16 =C2=B1  5%  perf-profile.c=
alltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_=
hwframe
>>>        2.97 =C2=B1  4%      +0.3        3.31 =C2=B1  5%  perf-profile.c=
alltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>>       88.74            -1.0       87.70        perf-profile.children.cy=
cles-pp.generic_perform_write
>>>       56.33            -1.0       55.31        perf-profile.children.cy=
cles-pp.f2fs_write_end
>>>       88.95            -1.0       87.98        perf-profile.children.cy=
cles-pp.__generic_file_write_iter
>>>       89.95            -0.8       89.15        perf-profile.children.cy=
cles-pp.f2fs_file_write_iter
>>>       90.03            -0.8       89.28        perf-profile.children.cy=
cles-pp.__vfs_write
>>>       90.73            -0.7       90.02        perf-profile.children.cy=
cles-pp.ksys_write
>>>       90.60            -0.7       89.89        perf-profile.children.cy=
cles-pp.vfs_write
>>>        0.22 =C2=B1  5%      -0.1        0.17 =C2=B1 19%  perf-profile.c=
hildren.cycles-pp.f2fs_invalidate_page
>>>        0.08 =C2=B1 10%      +0.0        0.10 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.page_mapping
>>>        0.09            +0.0        0.11 =C2=B1  7%  perf-profile.childr=
en.cycles-pp.__cancel_dirty_page
>>>        0.06 =C2=B1  6%      +0.0        0.09 =C2=B1 28%  perf-profile.c=
hildren.cycles-pp.read_node_page
>>>        0.10 =C2=B1  4%      +0.0        0.14 =C2=B1 14%  perf-profile.c=
hildren.cycles-pp.current_time
>>>        0.07 =C2=B1 12%      +0.0        0.11 =C2=B1  9%  perf-profile.c=
hildren.cycles-pp.percpu_counter_add_batch
>>>        0.00            +0.1        0.05        perf-profile.children.cy=
cles-pp.__x64_sys_write
>>>        0.38 =C2=B1  3%      +0.1        0.43 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.selinux_file_permission
>>>        0.55 =C2=B1  4%      +0.1        0.61 =C2=B1  4%  perf-profile.c=
hildren.cycles-pp.security_file_permission
>>>        1.30            +0.1        1.40 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.entry_SYSCALL_64
>>>        2.21 =C2=B1  6%      +0.2        2.41 =C2=B1  3%  perf-profile.c=
hildren.cycles-pp.generic_file_read_iter
>>>        2.29 =C2=B1  6%      +0.2        2.53 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.__vfs_read
>>>        2.86 =C2=B1  4%      +0.3        3.18 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.vfs_read
>>>        2.99 =C2=B1  4%      +0.3        3.32 =C2=B1  5%  perf-profile.c=
hildren.cycles-pp.ksys_read
>>>        0.37            -0.1        0.24 =C2=B1 23%  perf-profile.self.c=
ycles-pp.__get_node_page
>>>        0.21 =C2=B1  3%      -0.1        0.15 =C2=B1 16%  perf-profile.s=
elf.cycles-pp.f2fs_invalidate_page
>>>        0.07 =C2=B1  5%      +0.0        0.09 =C2=B1 11%  perf-profile.s=
elf.cycles-pp.page_mapping
>>>        0.06 =C2=B1 11%      +0.0        0.08 =C2=B1  8%  perf-profile.s=
elf.cycles-pp.vfs_read
>>>        0.07 =C2=B1  7%      +0.0        0.10 =C2=B1 21%  perf-profile.s=
elf.cycles-pp.__generic_file_write_iter
>>>        0.06 =C2=B1 14%      +0.0        0.10 =C2=B1 10%  perf-profile.s=
elf.cycles-pp.percpu_counter_add_batch
>>>        0.20 =C2=B1 11%      +0.0        0.25 =C2=B1 12%  perf-profile.s=
elf.cycles-pp.selinux_file_permission
>>>        0.05 =C2=B1  8%      +0.1        0.11 =C2=B1 52%  perf-profile.s=
elf.cycles-pp.__vfs_read
>>>        0.33 =C2=B1  9%      +0.1        0.41 =C2=B1  9%  perf-profile.s=
elf.cycles-pp.f2fs_lookup_extent_cache
>>>        1.30            +0.1        1.40 =C2=B1  2%  perf-profile.self.c=
ycles-pp.entry_SYSCALL_64
>>>
>>>
>>>
>>>
>>>
>>> Disclaimer:
>>> Results have been estimated based on internal Intel analysis and are pr=
ovided
>>> for informational purposes only. Any difference in system hardware or s=
oftware
>>> design or configuration may affect actual performance.
>>>
>>>
>>> Thanks,
>>> Rong Chen
>>>
>> _______________________________________________
>> LKP mailing list
>> LKP(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/lkp
> =

> =

> .
> =



--===============7633903553695602314==--

