Content-Type: multipart/mixed; boundary="===============0014826752421525101=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 9092c71bb7: blogbench.write_score -12.3% regression
Date: Wed, 20 Jun 2018 11:51:28 +0800
Message-ID: <878t7ai08v.fsf@yhuang-dev.intel.com>
In-Reply-To: <87h8m6m9ld.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0014826752421525101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ping * 3

"Huang, Ying" <ying.huang@intel.com> writes:

> Ping again ...
>
> "Huang, Ying" <ying.huang@intel.com> writes:
>
>> Ping...
>>
>> "Huang, Ying" <ying.huang@intel.com> writes:
>>
>>> Hi, Josef,
>>>
>>> Do you have time to take a look at the regression?
>>>
>>> kernel test robot <xiaolong.ye@intel.com> writes:
>>>
>>>> Greeting,
>>>>
>>>> FYI, we noticed a -12.3% regression of blogbench.write_score and a +9.=
6% improvement
>>>> of blogbench.read_score due to commit:
>>>>
>>>>
>>>> commit: 9092c71bb724dba2ecba849eae69e5c9d39bd3d2 ("mm: use sc->priorit=
y for slab shrink targets")
>>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>>
>>>> in testcase: blogbench
>>>> on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with=
 8G memory
>>>> with following parameters:
>>>>
>>>> 	disk: 1SSD
>>>> 	fs: btrfs
>>>> 	cpufreq_governor: performance
>>>>
>>>> test-description: Blogbench is a portable filesystem benchmark that tr=
ies to reproduce the load of a real-world busy file server.
>>>> test-url: https://www.pureftpd.org/project/blogbench
>>>>
>>>>
>>>>
>>>> Details are as below:
>>>> ----------------------------------------------------------------------=
---------------------------->
>>>>
>>>>
>>>> To reproduce:
>>>>
>>>>         git clone https://github.com/intel/lkp-tests.git
>>>>         cd lkp-tests
>>>>         bin/lkp install job.yaml  # job file is attached in this email
>>>>         bin/lkp run     job.yaml
>>>>
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> compiler/cpufreq_governor/disk/fs/kconfig/rootfs/tbox_group/testcase:
>>>>   gcc-7/performance/1SSD/btrfs/x86_64-rhel-7.2/debian-x86_64-2016-08-3=
1.cgz/lkp-bdw-de1/blogbench
>>>>
>>>> commit: =

>>>>   fcb2b0c577 ("mm: show total hugetlb memory consumption in /proc/memi=
nfo")
>>>>   9092c71bb7 ("mm: use sc->priority for slab shrink targets")
>>>>
>>>> fcb2b0c577f145c7 9092c71bb724dba2ecba849eae =

>>>> ---------------- -------------------------- =

>>>>          %stddev     %change         %stddev
>>>>              \          |                \  =

>>>>       3256           -12.3%       2854        blogbench.write_score
>>>>    1235237   2%      +9.6%    1354163        blogbench.read_score
>>>>   28050912           -10.1%   25212230        blogbench.time.file_syst=
em_outputs
>>>>    6481995   3%     +25.0%    8105320   2%  blogbench.time.involuntary=
_context_switches
>>>>     906.00           +13.7%       1030        blogbench.time.percent_o=
f_cpu_this_job_got
>>>>       2552           +14.0%       2908        blogbench.time.system_ti=
me
>>>>     173.80            +8.4%     188.32        blogbench.time.user_time
>>>>   19353936            +3.6%   20045728        blogbench.time.voluntary=
_context_switches
>>>>    8719514           +13.0%    9850451        softirqs.RCU
>>>>       2.97   5%      -0.7        2.30   3%  mpstat.cpu.idle%
>>>>      24.92            -6.5       18.46        mpstat.cpu.iowait%
>>>>       0.65   2%      +0.1        0.75        mpstat.cpu.soft%
>>>>      67.76            +6.7       74.45        mpstat.cpu.sys%
>>>>      50206           -10.7%      44858        vmstat.io.bo
>>>>      49.25            -9.1%      44.75   2%  vmstat.procs.b
>>>>     224125            -1.8%     220135        vmstat.system.cs
>>>>      48903           +10.7%      54134        vmstat.system.in
>>>>    3460654           +10.8%    3834883        meminfo.Active
>>>>    3380666           +11.0%    3752872        meminfo.Active(file)
>>>>    1853849           -17.4%    1530415        meminfo.Inactive
>>>>    1836507           -17.6%    1513054        meminfo.Inactive(file)
>>>>     551311           -10.3%     494265        meminfo.SReclaimable
>>>>     196525           -12.6%     171775        meminfo.SUnreclaim
>>>>     747837           -10.9%     666040        meminfo.Slab
>>>>  8.904e+08           -24.9%  6.683e+08        cpuidle.C1.time
>>>>   22971020           -12.8%   20035820        cpuidle.C1.usage
>>>>  2.518e+08   3%     -31.7%   1.72e+08        cpuidle.C1E.time
>>>>     821393   2%     -33.3%     548003        cpuidle.C1E.usage
>>>>   75460078   2%     -23.3%   57903768   2%  cpuidle.C3.time
>>>>     136506   3%     -25.3%     101956   3%  cpuidle.C3.usage
>>>>   56892498   4%     -23.3%   43608427   4%  cpuidle.C6.time
>>>>      85034   3%     -33.9%      56184   3%  cpuidle.C6.usage
>>>>   24373567           -24.5%   18395538        cpuidle.POLL.time
>>>>     449033   2%     -10.8%     400493        cpuidle.POLL.usage
>>>>       1832            +9.3%       2002        turbostat.Avg_MHz
>>>>   22967645           -12.8%   20032521        turbostat.C1
>>>>      18.43            -4.6       13.85        turbostat.C1%
>>>>     821328   2%     -33.3%     547948        turbostat.C1E
>>>>       5.21   3%      -1.6        3.56        turbostat.C1E%
>>>>     136377   3%     -25.3%     101823   3%  turbostat.C3
>>>>       1.56   2%      -0.4        1.20   3%  turbostat.C3%
>>>>      84404   3%     -34.0%      55743   3%  turbostat.C6
>>>>       1.17   4%      -0.3        0.90   4%  turbostat.C6%
>>>>      25.93           -26.2%      19.14        turbostat.CPU%c1
>>>>       0.12   3%     -19.1%       0.10   9%  turbostat.CPU%c3
>>>>   14813304           +10.7%   16398388        turbostat.IRQ
>>>>      38.19            +3.6%      39.56        turbostat.PkgWatt
>>>>       4.51            +4.5%       4.71        turbostat.RAMWatt
>>>>    8111200  13%     -63.2%    2986242  48%  proc-vmstat.compact_daemon=
_free_scanned
>>>>    1026719  30%     -81.2%     193485  30%  proc-vmstat.compact_daemon=
_migrate_scanned
>>>>       2444  21%     -63.3%     897.50  20%  proc-vmstat.compact_daemon=
_wake
>>>>    8111200  13%     -63.2%    2986242  48%  proc-vmstat.compact_free_s=
canned
>>>>     755491  32%     -81.6%     138856  28%  proc-vmstat.compact_isolat=
ed
>>>>    1026719  30%     -81.2%     193485  30%  proc-vmstat.compact_migrat=
e_scanned
>>>>     137.75  34%  +2.8e+06%    3801062   2%  proc-vmstat.kswapd_inodest=
eal
>>>>       6749  20%     -53.6%       3131  12%  proc-vmstat.kswapd_low_wma=
rk_hit_quickly
>>>>     844991           +11.2%     939487        proc-vmstat.nr_active_fi=
le
>>>>    3900576           -10.5%    3490567        proc-vmstat.nr_dirtied
>>>>     459789           -17.8%     377930        proc-vmstat.nr_inactive_=
file
>>>>     137947           -10.3%     123720        proc-vmstat.nr_slab_recl=
aimable
>>>>      49165           -12.6%      42989        proc-vmstat.nr_slab_unre=
claimable
>>>>       1382  11%     -26.2%       1020  20%  proc-vmstat.nr_writeback
>>>>    3809266           -10.7%    3403350        proc-vmstat.nr_written
>>>>     844489           +11.2%     938974        proc-vmstat.nr_zone_acti=
ve_file
>>>>     459855           -17.8%     378121        proc-vmstat.nr_zone_inac=
tive_file
>>>>       7055  18%     -52.0%       3389  11%  proc-vmstat.pageoutrun
>>>>   33764911   2%     +21.3%   40946445        proc-vmstat.pgactivate
>>>>   42044161   2%     +12.1%   47139065        proc-vmstat.pgdeactivate
>>>>      92153  20%     -69.1%      28514  24%  proc-vmstat.pgmigrate_succ=
ess
>>>>   15212270           -10.7%   13591573        proc-vmstat.pgpgout
>>>>   42053817   2%     +12.1%   47151755        proc-vmstat.pgrefill
>>>>      11297 107%   +1025.4%     127138  21%  proc-vmstat.pgscan_direct
>>>>   19930162           -24.0%   15141439        proc-vmstat.pgscan_kswapd
>>>>   19423629           -24.0%   14758807        proc-vmstat.pgsteal_kswa=
pd
>>>>   10868768          +184.8%   30950752        proc-vmstat.slabs_scanned
>>>
>>> The slab scan number increased a lot.
>>>
>>>>    3361780   3%     -22.9%    2593327   3%  proc-vmstat.workingset_act=
ivate
>>>>    4994722   2%     -43.2%    2835020   2%  proc-vmstat.workingset_ref=
ault
>>>>     316427            -9.3%     286844        slabinfo.Acpi-Namespace.=
active_objs
>>>>       3123            -9.4%       2829        slabinfo.Acpi-Namespace.=
active_slabs
>>>>     318605            -9.4%     288623        slabinfo.Acpi-Namespace.=
num_objs
>>>>       3123            -9.4%       2829        slabinfo.Acpi-Namespace.=
num_slabs
>>>>     220514           -40.7%     130747        slabinfo.btrfs_delayed_n=
ode.active_objs
>>>>       9751           -25.3%       7283        slabinfo.btrfs_delayed_n=
ode.active_slabs
>>>>     263293           -25.3%     196669        slabinfo.btrfs_delayed_n=
ode.num_objs
>>>>       9751           -25.3%       7283        slabinfo.btrfs_delayed_n=
ode.num_slabs
>>>>       6383   8%     -12.0%       5615   2%  slabinfo.btrfs_delayed_ref=
_head.num_objs
>>>>       9496           +15.5%      10969        slabinfo.btrfs_extent_bu=
ffer.active_objs
>>>>       9980           +20.5%      12022        slabinfo.btrfs_extent_bu=
ffer.num_objs
>>>>     260933           -10.7%     233136        slabinfo.btrfs_extent_ma=
p.active_objs
>>>>       9392           -10.6%       8396        slabinfo.btrfs_extent_ma=
p.active_slabs
>>>>     263009           -10.6%     235107        slabinfo.btrfs_extent_ma=
p.num_objs
>>>>       9392           -10.6%       8396        slabinfo.btrfs_extent_ma=
p.num_slabs
>>>>     271938           -10.3%     243802        slabinfo.btrfs_inode.act=
ive_objs
>>>>       9804           -10.6%       8768        slabinfo.btrfs_inode.act=
ive_slabs
>>>>     273856           -10.4%     245359        slabinfo.btrfs_inode.num=
_objs
>>>>       9804           -10.6%       8768        slabinfo.btrfs_inode.num=
_slabs
>>>>       7085   5%      -5.5%       6692   2%  slabinfo.btrfs_path.num_ob=
js
>>>>     311936           -16.4%     260797        slabinfo.dentry.active_o=
bjs
>>>>       7803            -9.6%       7058        slabinfo.dentry.active_s=
labs
>>>>     327759            -9.6%     296439        slabinfo.dentry.num_objs
>>>>       7803            -9.6%       7058        slabinfo.dentry.num_slabs
>>>>       2289           -23.3%       1755   6%  slabinfo.proc_inode_cache=
.active_objs
>>>>       2292           -19.0%       1856   6%  slabinfo.proc_inode_cache=
.num_objs
>>>>     261546           -12.3%     229485        slabinfo.radix_tree_node=
.active_objs
>>>>       9404           -11.9%       8288        slabinfo.radix_tree_node=
.active_slabs
>>>>     263347           -11.9%     232089        slabinfo.radix_tree_node=
.num_objs
>>>>       9404           -11.9%       8288        slabinfo.radix_tree_node=
.num_slabs
>>>
>>> The slab size decreased with the new commit.
>>>
>>> From perf-profile result,
>>>
>>>      26.81 =C2=B1  2%      -6.5       20.35 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.secondary_startup_64
>>>      24.48 =C2=B1  2%      -5.8       18.73        perf-profile.calltra=
ce.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>>>      24.48 =C2=B1  2%      -5.8       18.73        perf-profile.calltra=
ce.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>>>      24.48 =C2=B1  2%      -5.8       18.73        perf-profile.calltra=
ce.cycles-pp.start_secondary.secondary_startup_64
>>>      22.80 =C2=B1  2%      -5.5       17.30 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_secon=
dary.secondary_startup_64
>>>      20.20 =C2=B1  2%      -4.3       15.85        perf-profile.calltra=
ce.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.start=
_secondary
>>>      23.03 =C2=B1  2%      -2.6       20.42        perf-profile.calltra=
ce.cycles-pp.sys_rename.entry_SYSCALL_64_fastpath
>>>      17.02 =C2=B1  2%      -1.8       15.17 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.btrfs_rename.vfs_rename.sys_rename.entry_SYSCALL_64_fastp=
ath
>>>      17.03 =C2=B1  2%      -1.8       15.19 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.vfs_rename.sys_rename.entry_SYSCALL_64_fastpath
>>>      13.70 =C2=B1  2%      -1.2       12.47 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.__btrfs_unlink_inode.btrfs_rename.vfs_rename.sys_rename.e=
ntry_SYSCALL_64_fastpath
>>>       5.06 =C2=B1  3%      -1.1        3.96 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.btrfs_async_run_delayed_root.normal_work_helper.process_o=
ne_work.worker_thread.kthread
>>>       7.37 =C2=B1  4%      -0.9        6.49 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp._raw_spin_lock_irqsave.finish_wait.btrfs_tree_lock.btrfs_=
lock_root_node.btrfs_search_slot
>>>       7.32 =C2=B1  4%      -0.9        6.45 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.f=
inish_wait.btrfs_tree_lock.btrfs_lock_root_node
>>>       1.54 =C2=B1  4%      -0.7        0.81 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.poll_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.s=
tart_secondary
>>>       2.33 =C2=B1  2%      -0.7        1.62 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.do_idle.cpu_startup_entry.start_kernel.secondary_startup_=
64
>>>       2.33 =C2=B1  2%      -0.7        1.62 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.cpu_startup_entry.start_kernel.secondary_startup_64
>>>       2.33 =C2=B1  2%      -0.7        1.62 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.start_kernel.secondary_startup_64
>>>       2.23 =C2=B1  3%      -0.7        1.53 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter_state.do_idle.cpu_startup_entry.start_kerne=
l.secondary_startup_64
>>>       2.13 =C2=B1  2%      -0.7        1.46 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.intel_idle.cpuidle_enter_state.do_idle.cpu_startup_entry.=
start_kernel
>>>       5.59            -0.7        4.94 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.__dentry_kill.dput.sys_rename.entry_SYSCALL_64_fastpath
>>>       5.60            -0.7        4.94 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.dput.sys_rename.entry_SYSCALL_64_fastpath
>>>       6.96            -0.7        6.31 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.btrfs_del_inode_ref.__btrfs_unlink_inode.btrfs_rename.vfs_rena=
me.sys_rename
>>>       5.59            -0.7        4.94 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.evict.__dentry_kill.dput.sys_rename.entry_SYSCALL_64_fastpath
>>>       5.58            -0.6        4.94 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.btrfs_evict_inode.evict.__dentry_kill.dput.sys_rename
>>>       6.94 =C2=B1  2%      -0.6        6.30 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.btrfs_search_slot.btrfs_del_inode_ref.__btrfs_unlink_inod=
e.btrfs_rename.vfs_rename
>>>       6.66 =C2=B1  4%      -0.6        6.10 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.btrfs_search_slot.btrfs_lookup_dir_item.__btrfs_unlink_in=
ode.btrfs_rename.vfs_rename
>>>       6.66 =C2=B1  4%      -0.6        6.10 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.btrfs_lookup_dir_item.__btrfs_unlink_inode.btrfs_rename.v=
fs_rename.sys_rename
>>> 3.38 =C2=B1 3% -0.5 2.84 =C2=B1 3%
>> perf-profile.calltrace.cycles-pp.btrfs_search_slot.btrfs_delete_delayed_=
items.btrfs_async_run_delayed_root.normal_work_helper.process_one_work
>>>       3.40 =C2=B1  3%      -0.5        2.86 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.btrfs_delete_delayed_items.btrfs_async_run_delayed_root.n=
ormal_work_helper.process_one_work.worker_thread
>>>       7.30 =C2=B1  4%      -0.4        6.86 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.bt=
rfs_lookup_dir_item.__btrfs_unlink_inode
>>>       1.18 =C2=B1  4%      -0.4        0.76 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__btrfs_update_delayed_inode.btrfs_async_run_delayed_root=
.normal_work_helper.process_one_work.worker_thread
>>> 1.16 =C2=B1 4% -0.4 0.74 =C2=B1 2%
>> perf-profile.calltrace.cycles-pp.btrfs_lookup_inode.__btrfs_update_delay=
ed_inode.btrfs_async_run_delayed_root.normal_work_helper.process_one_work
>>>       5.96 =C2=B1  2%      -0.4        5.54 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.bt=
rfs_del_inode_ref.__btrfs_unlink_inode
>>>       5.96 =C2=B1  2%      -0.4        5.54 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_del_inode_re=
f.__btrfs_unlink_inode.btrfs_rename
>>> 1.16 =C2=B1 4% -0.4 0.74 =C2=B1 2%
>> perf-profile.calltrace.cycles-pp.btrfs_search_slot.btrfs_lookup_inode.__=
btrfs_update_delayed_inode.btrfs_async_run_delayed_root.normal_work_helper
>>> 2.95 =C2=B1 3% -0.4 2.54 =C2=B1 3%
>> perf-profile.calltrace.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.bt=
rfs_search_slot.btrfs_delete_delayed_items.btrfs_async_run_delayed_root
>>> 2.95 =C2=B1 3% -0.4 2.54 =C2=B1 3%
>> perf-profile.calltrace.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.=
btrfs_delete_delayed_items.btrfs_async_run_delayed_root.normal_work_helper
>>>       0.94 =C2=B1  2%      -0.3        0.59 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.shrink_inactive_list.shrink_node_memcg.shrink_node.kswapd=
.kthread
>>>       1.25            -0.3        0.91 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.shrink_node_memcg.shrink_node.kswapd.kthread.ret_from_fork
>>>       0.84 =C2=B1  2%      -0.3        0.52 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.shrink_page_list.shrink_inactive_list.shrink_node_memcg.s=
hrink_node.kswapd
>>>       1.01            -0.3        0.71 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.btrfs_create.path_openat.do_filp_open.do_sys_open.entry_SYSCAL=
L_64_fastpath
>>> 0.58 =C2=B1 4% -0.2 0.34 =C2=B1 70%
> perf-profile.calltrace.cycles-pp.queued_write_lock_slowpath.btrfs_tree_lo=
ck.btrfs_lock_root_node.btrfs_search_slot.btrfs_delete_delayed_items
>>>       1.73 =C2=B1  2%      -0.2        1.50 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.finish_wait.btrfs_tree_lock.btrfs_lock_root_node.btrfs_se=
arch_slot.btrfs_del_inode_ref
>>>       1.67 =C2=B1  4%      -0.2        1.44 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.finish_wait.btrfs_tree_lock.btrfs_lock_root_node.btrfs_se=
arch_slot.btrfs_lookup_dir_item
>>>       1.89            -0.2        1.67 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.btrfs_commit_inode_delayed_inode.btrfs_evict_inode.evict.__den=
try_kill.dput
>>>       1.88            -0.2        1.66 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.__btrfs_update_delayed_inode.btrfs_commit_inode_delayed_inode.=
btrfs_evict_inode.evict.__dentry_kill
>>>       1.90            -0.2        1.68 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.btrfs_truncate_inode_items.btrfs_evict_inode.evict.__dentry_ki=
ll.dput
>>>       1.78            -0.2        1.57 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.btrfs_search_slot.btrfs_del_orphan_item.btrfs_orphan_del.btrfs=
_evict_inode.evict
>>>       1.88            -0.2        1.67 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.btrfs_search_slot.btrfs_truncate_inode_items.btrfs_evict_inode=
.evict.__dentry_kill
>>>       1.78            -0.2        1.57 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.btrfs_orphan_del.btrfs_evict_inode.evict.__dentry_kill.dput
>>>       1.78            -0.2        1.57 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.btrfs_del_orphan_item.btrfs_orphan_del.btrfs_evict_inode.evict=
.__dentry_kill
>>> 1.87 -0.2 1.66 =C2=B1 2%
>> perf-profile.calltrace.cycles-pp.btrfs_search_slot.btrfs_lookup_inode.__=
btrfs_update_delayed_inode.btrfs_commit_inode_delayed_inode.btrfs_evict_ino=
de
>>>       1.87            -0.2        1.66 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.btrfs_lookup_inode.__btrfs_update_delayed_inode.btrfs_commit_i=
node_delayed_inode.btrfs_evict_inode.evict
>>> 0.75 =C2=B1 11% -0.2 0.57 =C2=B1 7%
>> perf-profile.calltrace.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_ro=
ot_node.btrfs_search_slot.btrfs_lookup_file_extent.__btrfs_drop_extents
>>> 0.75 =C2=B1 11% -0.2 0.57 =C2=B1 7%
>> perf-profile.calltrace.cycles-pp.btrfs_read_lock_root_node.btrfs_search_=
slot.btrfs_lookup_file_extent.__btrfs_drop_extents.insert_reserved_file_ext=
ent
>>>       1.39 =C2=B1  3%      -0.2        1.23 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.prepare_to_wait_event.btrfs_tree_lock.btrfs_lock_root_nod=
e.btrfs_search_slot.btrfs_delete_delayed_items
>>>       1.84            -0.2        1.68 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.__btrfs_unlink_inode.btrfs_unlink_inode.btrfs_rename.vfs_renam=
e.sys_rename
>>>       1.84            -0.2        1.68 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.btrfs_unlink_inode.btrfs_rename.vfs_rename.sys_rename.entry_SY=
SCALL_64_fastpath
>>>       1.62            -0.2        1.46 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_truncate_inode_it=
ems.btrfs_evict_inode.evict
>>>       0.87 =C2=B1  5%      -0.2        0.72 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.finish_wait.btrfs_tree_lock.btrfs_lock_root_node.btrfs_se=
arch_slot.btrfs_delete_delayed_items
>>>       1.81            -0.2        1.66 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.btrfs_search_slot.btrfs_lookup_dir_item.__btrfs_unlink_inode.b=
trfs_unlink_inode.btrfs_rename
>>>       1.81            -0.2        1.66 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.btrfs_lookup_dir_item.__btrfs_unlink_inode.btrfs_unlink_inode.=
btrfs_rename.vfs_rename
>>>       1.62            -0.2        1.46 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.btrfs_t=
runcate_inode_items.btrfs_evict_inode
>>>       1.69 =C2=B1  2%      -0.1        1.55 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.end_bio_extent_readpage.normal_work_helper.process_one_wo=
rk.worker_thread.kthread
>>>       1.58            -0.1        1.44 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.btrfs_l=
ookup_inode.__btrfs_update_delayed_inode
>>> 1.58 -0.1 1.44 =C2=B1 2%
>> perf-profile.calltrace.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.=
btrfs_lookup_inode.__btrfs_update_delayed_inode.btrfs_commit_inode_delayed_=
inode
>>> 2.89 =C2=B1 3% -0.1 2.77 =C2=B1 2%
>> perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.queued=
_write_lock_slowpath.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot
>>>       1.51            -0.1        1.39 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.btrfs_d=
el_orphan_item.btrfs_orphan_del
>>>       1.51            -0.1        1.39 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_del_orphan_item.b=
trfs_orphan_del.btrfs_evict_inode
>>>       0.94            -0.1        0.82        perf-profile.calltrace.cy=
cles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_s=
tartup_64
>>>       0.93            -0.1        0.81        perf-profile.calltrace.cy=
cles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>>>       1.52            -0.1        1.44 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_lookup_dir_item._=
_btrfs_unlink_inode.btrfs_unlink_inode
>>>       0.71 =C2=B1  3%      -0.1        0.66 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.prepare_to_wait_event.btrfs_tree_lock.btrfs_lock_root_nod=
e.btrfs_search_slot.btrfs_truncate_inode_items
>>>       0.60 =C2=B1  2%      -0.0        0.56 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.=
__wake_up_common.wake_up_page_bit
>>>       1.61 =C2=B1  2%      +0.1        1.67 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.kswapd.kthread.ret_from_fork
>>>       1.61 =C2=B1  2%      +0.1        1.67 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.shrink_node.kswapd.kthread.ret_from_fork
>>>       0.55            +0.1        0.68 =C2=B1  4%  perf-profile.calltra=
ce.cycles-pp.find_get_entry.pagecache_get_page.generic_file_read_iter.__vfs=
_read.vfs_read
>>>       0.57            +0.1        0.70 =C2=B1  4%  perf-profile.calltra=
ce.cycles-pp.pagecache_get_page.generic_file_read_iter.__vfs_read.vfs_read.=
sys_read
>>>       0.59 =C2=B1  3%      +0.3        0.87        perf-profile.calltra=
ce.cycles-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.t=
twu_do_activate.try_to_wake_up
>>>       1.29 =C2=B1  3%      +0.3        1.58        perf-profile.calltra=
ce.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremove_w=
ake_function.__wake_up_common
>>> 0.54 +0.3 0.83 =C2=B1 2%
>> perf-profile.calltrace.cycles-pp.queued_read_lock_slowpath.btrfs_tree_re=
ad_lock.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_file_extent
>>> 0.84 +0.3 1.18 =C2=B1 3%
>> perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_s=
pin_lock_irqsave.prepare_to_wait_event.btrfs_tree_read_lock.btrfs_read_lock=
_root_node
>>>       0.71 =C2=B1  4%      +0.3        1.05        perf-profile.calltra=
ce.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wak=
e_up_common.__wake_up_common_lock
>>> 0.86 +0.4 1.21 =C2=B1 3%
>> perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_=
event.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_search_slot
>>> 0.90 +0.4 1.28 =C2=B1 3%
> perf-profile.calltrace.cycles-pp.prepare_to_wait_event.btrfs_tree_read_lo=
ck.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_dir_item
>>> 0.35 =C2=B1 71% +0.4 0.79 =C2=B1 3%
>> perf-profile.calltrace.cycles-pp.queued_read_lock_slowpath.btrfs_tree_re=
ad_lock.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_inode
>>>       0.98 =C2=B1  4%      +0.4        1.41 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_sear=
ch_slot.btrfs_lookup_inode.btrfs_iget
>>>       0.98 =C2=B1  5%      +0.4        1.43 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_=
inode.btrfs_iget.btrfs_lookup_dentry
>>>       0.94 =C2=B1  3%      +0.4        1.39        perf-profile.calltra=
ce.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wak=
e_up_common_lock.btrfs_clear_path_blocking
>>>       0.96 =C2=B1  3%      +0.5        1.42        perf-profile.calltra=
ce.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_loc=
k.btrfs_clear_path_blocking.btrfs_search_slot
>>>       1.05 =C2=B1  2%      +0.5        1.52 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_sear=
ch_slot.btrfs_lookup_file_extent.btrfs_get_extent
>>>       1.06 =C2=B1  3%      +0.5        1.53 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_=
file_extent.btrfs_get_extent.__do_readpage
>>>       0.97 =C2=B1  3%      +0.5        1.45        perf-profile.calltra=
ce.cycles-pp.__wake_up_common.__wake_up_common_lock.btrfs_clear_path_blocki=
ng.btrfs_search_slot.btrfs_lookup_dir_item
>>> 0.62 =C2=B1 4% +0.5 1.13
>> perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.queued=
_read_lock_slowpath.btrfs_clear_lock_blocking_rw.btrfs_clear_path_blocking.=
btrfs_search_slot
>>> 0.65 =C2=B1 4% +0.5 1.19
>> perf-profile.calltrace.cycles-pp.queued_read_lock_slowpath.btrfs_clear_l=
ock_blocking_rw.btrfs_clear_path_blocking.btrfs_search_slot.btrfs_lookup_di=
r_item
>>>       0.17 =C2=B1141%      +0.6        0.73        perf-profile.calltra=
ce.cycles-pp.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entit=
y.enqueue_task_fair.ttwu_do_activate
>>>       0.00            +0.6        0.57 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.task_work_run.exit_to_usermode_loop.syscall_return_slowpath.en=
try_SYSCALL_64_fastpath
>>>       0.00            +0.6        0.59 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.exit_to_usermode_loop.syscall_return_slowpath.entry_SYSCALL_64=
_fastpath
>>>       0.00            +0.6        0.60 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.syscall_return_slowpath.entry_SYSCALL_64_fastpath
>>> 0.56 =C2=B1 4% +0.6 1.17
>> perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_common=
_lock.btrfs_clear_path_blocking.btrfs_search_slot.btrfs_lookup_file_extent
>>>       1.17            +0.6        1.78 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp._raw_spin_lock_irqsave.finish_wait.btrfs_tree_read_lock.btrfs_=
read_lock_root_node.btrfs_search_slot
>>> 1.16 +0.6 1.77 =C2=B1 2%
>> perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_s=
pin_lock_irqsave.finish_wait.btrfs_tree_read_lock.btrfs_read_lock_root_node
>>>       1.18            +0.6        1.80 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.finish_wait.btrfs_tree_read_lock.btrfs_read_lock_root_node.btr=
fs_search_slot.btrfs_lookup_dir_item
>>>       0.57 =C2=B1  7%      +0.6        1.21 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_common_lock.btrfs_clear_=
path_blocking.btrfs_search_slot.btrfs_lookup_inode
>>> 0.75 =C2=B1 4% +0.6 1.38
>> perf-profile.calltrace.cycles-pp.btrfs_clear_lock_blocking_rw.btrfs_clea=
r_path_blocking.btrfs_search_slot.btrfs_lookup_dir_item.btrfs_lookup_dentry
>>>       1.95            +0.7        2.61        perf-profile.calltrace.cy=
cles-pp.copy_user_enhanced_fast_string.copyout.copy_page_to_iter.generic_fi=
le_read_iter.__vfs_read
>>>       1.96            +0.7        2.62        perf-profile.calltrace.cy=
cles-pp.copyout.copy_page_to_iter.generic_file_read_iter.__vfs_read.vfs_read
>>>       0.00            +0.7        0.70        perf-profile.calltrace.cy=
cles-pp.__save_stack_trace.save_stack_trace_tsk.__account_scheduler_latency=
.enqueue_entity.enqueue_task_fair
>>>       2.10            +0.7        2.80        perf-profile.calltrace.cy=
cles-pp.copy_page_to_iter.generic_file_read_iter.__vfs_read.vfs_read.sys_re=
ad
>>>       0.85 =C2=B1  5%      +0.7        1.58        perf-profile.calltra=
ce.cycles-pp.__wake_up_common_lock.btrfs_clear_path_blocking.btrfs_search_s=
lot.btrfs_lookup_file_extent.btrfs_get_extent
>>>       0.84 =C2=B1  6%      +0.7        1.57        perf-profile.calltra=
ce.cycles-pp.__wake_up_common_lock.btrfs_clear_path_blocking.btrfs_search_s=
lot.btrfs_lookup_inode.btrfs_iget
>>>       0.00            +0.8        0.75 =C2=B1  4%  perf-profile.calltra=
ce.cycles-pp.super_cache_scan.shrink_slab.shrink_node.kswapd.kthread
>>>       0.00            +0.8        0.75 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.shrink_slab.shrink_node.kswapd.kthread.ret_from_fork
>>>       1.07 =C2=B1  5%      +0.9        1.98 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.btrfs_clear_path_blocking.btrfs_search_slot.btrfs_lookup_=
file_extent.btrfs_get_extent.__do_readpage
>>>       1.09 =C2=B1  7%      +0.9        2.01 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.btrfs_clear_path_blocking.btrfs_search_slot.btrfs_lookup_=
inode.btrfs_iget.btrfs_lookup_dentry
>>>       4.90 =C2=B1  2%      +1.3        6.19        perf-profile.calltra=
ce.cycles-pp.__do_page_cache_readahead.ondemand_readahead.generic_file_read=
_iter.__vfs_read.vfs_read
>>>       4.90 =C2=B1  2%      +1.3        6.20        perf-profile.calltra=
ce.cycles-pp.ondemand_readahead.generic_file_read_iter.__vfs_read.vfs_read.=
sys_read
>>>       4.44 =C2=B1  2%      +1.3        5.74        perf-profile.calltra=
ce.cycles-pp.extent_readpages.__do_page_cache_readahead.ondemand_readahead.=
generic_file_read_iter.__vfs_read
>>>       2.87 =C2=B1  3%      +1.4        4.29        perf-profile.calltra=
ce.cycles-pp.__extent_readpages.extent_readpages.__do_page_cache_readahead.=
ondemand_readahead.generic_file_read_iter
>>>       2.22 =C2=B1  4%      +1.4        3.65        perf-profile.calltra=
ce.cycles-pp.btrfs_lookup_file_extent.btrfs_get_extent.__do_readpage.__exte=
nt_readpages.extent_readpages
>>>       2.22 =C2=B1  4%      +1.4        3.65        perf-profile.calltra=
ce.cycles-pp.btrfs_search_slot.btrfs_lookup_file_extent.btrfs_get_extent.__=
do_readpage.__extent_readpages
>>>       2.27 =C2=B1  6%      +1.4        3.72        perf-profile.calltra=
ce.cycles-pp.btrfs_lookup_inode.btrfs_iget.btrfs_lookup_dentry.btrfs_lookup=
.path_openat
>>>       2.27 =C2=B1  6%      +1.4        3.72        perf-profile.calltra=
ce.cycles-pp.btrfs_search_slot.btrfs_lookup_inode.btrfs_iget.btrfs_lookup_d=
entry.btrfs_lookup
>>>       2.72 =C2=B1  3%      +1.4        4.17        perf-profile.calltra=
ce.cycles-pp.__do_readpage.__extent_readpages.extent_readpages.__do_page_ca=
che_readahead.ondemand_readahead
>>>       2.33 =C2=B1  4%      +1.5        3.79        perf-profile.calltra=
ce.cycles-pp.btrfs_get_extent.__do_readpage.__extent_readpages.extent_readp=
ages.__do_page_cache_readahead
>>> 2.38 +1.6 3.95
>> perf-profile.calltrace.cycles-pp.queued_read_lock_slowpath.btrfs_tree_re=
ad_lock.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_dir_item
>>>       2.63 =C2=B1  6%      +1.7        4.33        perf-profile.calltra=
ce.cycles-pp.btrfs_iget.btrfs_lookup_dentry.btrfs_lookup.path_openat.do_fil=
p_open
>>> 1.68 =C2=B1 4% +2.1 3.79
>> perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_common=
_lock.btrfs_clear_path_blocking.btrfs_search_slot.btrfs_lookup_dir_item
>>>       8.66            +2.2       10.90        perf-profile.calltrace.cy=
cles-pp.generic_file_read_iter.__vfs_read.vfs_read.sys_read.entry_SYSCALL_6=
4_fastpath
>>>       8.71            +2.3       10.97        perf-profile.calltrace.cy=
cles-pp.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
>>>       8.85            +2.3       11.15        perf-profile.calltrace.cy=
cles-pp.vfs_read.sys_read.entry_SYSCALL_64_fastpath
>>>       9.02            +2.3       11.33        perf-profile.calltrace.cy=
cles-pp.sys_read.entry_SYSCALL_64_fastpath
>>>       2.71 =C2=B1  3%      +2.6        5.35        perf-profile.calltra=
ce.cycles-pp.__wake_up_common_lock.btrfs_clear_path_blocking.btrfs_search_s=
lot.btrfs_lookup_dir_item.btrfs_lookup_dentry
>>>       4.63            +2.7        7.29        perf-profile.calltrace.cy=
cles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_search_slot.bt=
rfs_lookup_dir_item.btrfs_lookup_dentry
>>>       4.65            +2.7        7.32        perf-profile.calltrace.cy=
cles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_dir_item.b=
trfs_lookup_dentry.btrfs_lookup
>>> 1.94 =C2=B1 2% +2.8 4.77
>> perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.queued=
_read_lock_slowpath.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_se=
arch_slot
>>> 2.81 =C2=B1 4% +3.3 6.15
>> perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_s=
pin_lock_irqsave.__wake_up_common_lock.btrfs_clear_path_blocking.btrfs_sear=
ch_slot
>>>       3.58 =C2=B1  2%      +3.4        6.98        perf-profile.calltra=
ce.cycles-pp.btrfs_clear_path_blocking.btrfs_search_slot.btrfs_lookup_dir_i=
tem.btrfs_lookup_dentry.btrfs_lookup
>>>       8.69            +6.3       15.03        perf-profile.calltrace.cy=
cles-pp.btrfs_search_slot.btrfs_lookup_dir_item.btrfs_lookup_dentry.btrfs_l=
ookup.path_openat
>>>       8.75            +6.4       15.12        perf-profile.calltrace.cy=
cles-pp.btrfs_lookup_dir_item.btrfs_lookup_dentry.btrfs_lookup.path_openat.=
do_filp_open
>>>      47.34            +8.1       55.46        perf-profile.calltrace.cy=
cles-pp.entry_SYSCALL_64_fastpath
>>>      11.47            +8.1       19.60        perf-profile.calltrace.cy=
cles-pp.btrfs_lookup.path_openat.do_filp_open.do_sys_open.entry_SYSCALL_64_=
fastpath
>>>      11.46            +8.1       19.59        perf-profile.calltrace.cy=
cles-pp.btrfs_lookup_dentry.btrfs_lookup.path_openat.do_filp_open.do_sys_op=
en
>>>      13.90            +8.3       22.20        perf-profile.calltrace.cy=
cles-pp.path_openat.do_filp_open.do_sys_open.entry_SYSCALL_64_fastpath
>>>      13.91            +8.3       22.22        perf-profile.calltrace.cy=
cles-pp.do_filp_open.do_sys_open.entry_SYSCALL_64_fastpath
>>>      14.13            +8.4       22.52        perf-profile.calltrace.cy=
cles-pp.do_sys_open.entry_SYSCALL_64_fastpath
>>>
>>> The cycles for dentry lookup increased much too.  Is this the reason why
>>> write score decreased?
>>>
>>> If you need more information, please let me know.
>>>
>>> Best Regards,
>>> Huang, Ying
>>>
>>>>    1140424  12%     +40.2%    1598980  14%  sched_debug.cfs_rq:/.MIN_v=
runtime.max
>>>>     790.55           +13.0%     893.20   3%  sched_debug.cfs_rq:/.exec=
_clock.stddev
>>>>    1140425  12%     +40.2%    1598982  14%  sched_debug.cfs_rq:/.max_v=
runtime.max
>>>>       0.83  10%     +21.5%       1.00   8%  sched_debug.cfs_rq:/.nr_ru=
nning.avg
>>>>       3.30  99%    +266.3%      12.09  13%  sched_debug.cfs_rq:/.remov=
ed.load_avg.avg
>>>>     153.02  97%    +266.6%     560.96  13%  sched_debug.cfs_rq:/.remov=
ed.runnable_sum.avg
>>>>     569.93 102%    +173.2%       1556  14%  sched_debug.cfs_rq:/.remov=
ed.runnable_sum.stddev
>>>>       1.42  60%    +501.5%       8.52  34%  sched_debug.cfs_rq:/.remov=
ed.util_avg.avg
>>>>      19.88  59%    +288.9%      77.29  16%  sched_debug.cfs_rq:/.remov=
ed.util_avg.max
>>>>       5.05  58%    +342.3%      22.32  22%  sched_debug.cfs_rq:/.remov=
ed.util_avg.stddev
>>>>     791.44   3%     +47.7%       1168   8%  sched_debug.cfs_rq:/.util_=
avg.avg
>>>>       1305   6%     +33.2%       1738   5%  sched_debug.cfs_rq:/.util_=
avg.max
>>>>     450.25  11%     +66.2%     748.17  14%  sched_debug.cfs_rq:/.util_=
avg.min
>>>>     220.82   8%     +21.1%     267.46   5%  sched_debug.cfs_rq:/.util_=
avg.stddev
>>>>     363118  11%     -23.8%     276520  11%  sched_debug.cpu.avg_idle.a=
vg
>>>>     726003   8%     -30.8%     502313   4%  sched_debug.cpu.avg_idle.m=
ax
>>>>     202629   3%     -32.2%     137429  18%  sched_debug.cpu.avg_idle.s=
tddev
>>>>      31.96  28%     +54.6%      49.42  14%  sched_debug.cpu.cpu_load[3=
].min
>>>>      36.21  25%     +64.0%      59.38   6%  sched_debug.cpu.cpu_load[4=
].min
>>>>       1007   5%     +20.7%       1216   7%  sched_debug.cpu.curr->pid.=
avg
>>>>       4.50   5%     +14.8%       5.17   5%  sched_debug.cpu.nr_running=
.max
>>>>    2476195           -11.8%    2185022        sched_debug.cpu.nr_switc=
hes.max
>>>>     212888           -26.6%     156172   3%  sched_debug.cpu.nr_switch=
es.stddev
>>>>       3570   2%     -58.7%       1474   2%  sched_debug.cpu.nr_uninter=
ruptible.max
>>>>    -803.67           -28.7%    -573.38        sched_debug.cpu.nr_unint=
erruptible.min
>>>>       1004   2%     -50.4%     498.55   3%  sched_debug.cpu.nr_uninter=
ruptible.stddev
>>>>    2478809           -11.7%    2189310        sched_debug.cpu.sched_co=
unt.max
>>>>     214130           -26.5%     157298   3%  sched_debug.cpu.sched_cou=
nt.stddev
>>>>     489430   2%     -16.6%     408309   2%  sched_debug.cpu.sched_goid=
le.avg
>>>>     724333   2%     -28.2%     520263   2%  sched_debug.cpu.sched_goid=
le.max
>>>>     457611           -18.1%     374746   3%  sched_debug.cpu.sched_goi=
dle.min
>>>>      62957   2%     -47.4%      33138   3%  sched_debug.cpu.sched_goid=
le.stddev
>>>>     676053   2%     -15.4%     571816   2%  sched_debug.cpu.ttwu_local=
.max
>>>>      42669   3%     +22.3%      52198        sched_debug.cpu.ttwu_loca=
l.min
>>>>     151873   2%     -18.3%     124118   2%  sched_debug.cpu.ttwu_local=
.stddev
>>>>
>>>>
>>>>                                                                       =
          =

>>>>                                blogbench.write_score                  =
          =

>>>>                                                                       =
          =

>>>>   3300 +-+------------------------------------------------------------=
------+   =

>>>>   3250 +-+          +.       .+   +. .+  :      : :        +.   .+ .+.=
+.+. .|   =

>>>>        |:    +.   .+  +.+.+.+  + +  +    :   +. : :    +. +  +.+  +   =
    + |   =

>>>>   3200 +-+  +  +.+              +         : +  +   :  +  +            =
      |   =

>>>>   3150 +-+.+                              ++       +.+                =
      |   =

>>>>   3100 +-+                                                            =
      |   =

>>>>   3050 +-+                                                            =
      |   =

>>>>        |                                                              =
      |   =

>>>>   3000 +-+                                                            =
      |   =

>>>>   2950 +-+                    O   O                                   =
      |   =

>>>>   2900 +-O     O   O                  O                               =
      |   =

>>>>   2850 +-+       O  O   O O O   O       O OO O   O   O                =
      |   =

>>>>        |   O                        O          O   O                  =
      |   =

>>>>   2800 O-+   O        O                                               =
      |   =

>>>>   2750 +-+------------------------------------------------------------=
------+   =

>>>>                                                                       =
          =

>>>>                                                                       =
                                                                           =
               =

>>>> [*] bisect-good sample
>>>> [O] bisect-bad  sample
>>>>
>>>>
>>>>
>>>> Disclaimer:
>>>> Results have been estimated based on internal Intel analysis and are p=
rovided
>>>> for informational purposes only. Any difference in system hardware or =
software
>>>> design or configuration may affect actual performance.
>>>>
>>>>
>>>> Thanks,
>>>> Xiaolong
>>> _______________________________________________
>>> LKP mailing list
>>> LKP(a)lists.01.org
>>> https://lists.01.org/mailman/listinfo/lkp
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============0014826752421525101==--

