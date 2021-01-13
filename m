Content-Type: multipart/mixed; boundary="===============0663821624838511493=="
MIME-Version: 1.0
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] e86bb85b1f: stress-ng.utime.ops_per_sec -70.1% regression
Date: Wed, 13 Jan 2021 15:15:09 +0800
Message-ID: <e9a40c36-0d4a-e4ad-cf3d-c83e2017d73d@gmx.com>
In-Reply-To: <20210112152415.GG30747@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0663821624838511493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2021/1/12 =E4=B8=8B=E5=8D=8811:24, kernel test robot wrote:
>
> Greeting,
>
> FYI, we noticed a -70.1% regression of stress-ng.utime.ops_per_sec due to=
 commit:
>
>
> commit: e86bb85b1fec48bcb8dfb79ec9f104d1a38fda78 ("[PATCH] btrfs: make bt=
rfs_dirty_inode() to always reserve metadata space")
> url: https://github.com/0day-ci/linux/commits/Qu-Wenruo/btrfs-make-btrfs_=
dirty_inode-to-always-reserve-metadata-space/20210108-134133
> base: https://git.kernel.org/cgit/linux/kernel/git/kdave/linux.git for-ne=
xt
>
> in testcase: stress-ng
> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 512G memory
> with following parameters:
>
> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 30s
> 	class: filesystem
> 	cpufreq_governor: performance
> 	ucode: 0x5003003
> 	fs: btrfs
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/testcase/testtime/ucode:
>    filesystem/gcc-9/performance/1HDD/btrfs/x86_64-rhel-8.3/10%/debian-10.=
4-x86_64-20200603.cgz/lkp-csl-2sp7/stress-ng/30s/0x5003003
>
> commit:
>    97847e0652 ("Merge branch 'for-next-next-v5.10-20201211' into for-next=
-20201211")
>    e86bb85b1f ("btrfs: make btrfs_dirty_inode() to always reserve metadat=
a space")
>
> 97847e06525b51ea e86bb85b1fec48bcb8dfb79ec9f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>     1098218           -40.4%     654054        stress-ng.access.ops
>       36607           -40.4%      21801        stress-ng.access.ops_per_s=
ec

This is a little interesting.
Although accessing an inode will update its atime, but don't we have
lazy_atime mount option?

>       92962 =C2=B1  2%     -44.1%      51992 =C2=B1  3%  stress-ng.chmod.=
ops
>        3098 =C2=B1  2%     -44.1%       1733 =C2=B1  3%  stress-ng.chmod.=
ops_per_sec
>      936128 =C2=B1  6%     -41.0%     552284        stress-ng.chown.ops
>       31204 =C2=B1  6%     -41.0%      18409        stress-ng.chown.ops_p=
er_sec
>     1939514           -18.5%    1580533        stress-ng.fcntl.ops
>       64650           -18.5%      52684        stress-ng.fcntl.ops_per_sec
>     3705607 =C2=B1  2%     -70.1%    1109769        stress-ng.utime.ops
>      123519 =C2=B1  2%     -70.1%      36992        stress-ng.utime.ops_p=
er_sec

Another interesting part is, only stress-ng is reporting such
regressioin on the commit?
No other report on the commit with different test env? E.g. NVME SSD?

Above operations is affected by such commit, but I'm a little surprised
only one report here.

Just because flushing on HDD is more expensive? If no other test suite
is fine, I would prefer to accept the drop, as it really streamline the
operations.

Thanks,
Qu

>      381.20 =C2=B1  6%     +12.3%     428.27 =C2=B1  9%  sched_debug.cfs_=
rq:/.load_avg.avg
>        6316 =C2=B1 57%     -79.8%       1278 =C2=B1 68%  softirqs.CPU77.B=
LOCK
>       10488 =C2=B1101%     -89.5%       1100 =C2=B1124%  softirqs.CPU78.B=
LOCK
>        5605 =C2=B1 92%     -82.3%     990.50 =C2=B1 32%  softirqs.CPU80.B=
LOCK
>        6094 =C2=B1128%     -89.9%     614.50 =C2=B1 44%  softirqs.CPU92.B=
LOCK
>        4921 =C2=B1  9%     +20.5%       5931 =C2=B1  5%  slabinfo.dmaengi=
ne-unmap-16.active_objs
>        4922 =C2=B1  9%     +20.5%       5933 =C2=B1  5%  slabinfo.dmaengi=
ne-unmap-16.num_objs
>        9818 =C2=B1  5%      -6.9%       9139 =C2=B1  3%  slabinfo.kmalloc=
-rcl-256.active_objs
>       49223 =C2=B1  3%     -18.4%      40177 =C2=B1  3%  slabinfo.radix_t=
ree_node.active_objs
>      903.25 =C2=B1  3%     -18.0%     740.50 =C2=B1  3%  slabinfo.radix_t=
ree_node.active_slabs
>       50620 =C2=B1  3%     -18.0%      41505 =C2=B1  3%  slabinfo.radix_t=
ree_node.num_objs
>      903.25 =C2=B1  3%     -18.0%     740.50 =C2=B1  3%  slabinfo.radix_t=
ree_node.num_slabs
>        9927 =C2=B1  3%      +5.8%      10504        proc-vmstat.nr_active=
_anon
>     6043459 =C2=B1  2%      -2.2%    5911900        proc-vmstat.nr_dirtied
>        1125            -6.1%       1056 =C2=B1  4%  proc-vmstat.nr_dirty
>       20361 =C2=B1  2%      +4.7%      21309        proc-vmstat.nr_shmem
>       66221            -4.3%      63404 =C2=B1  2%  proc-vmstat.nr_slab_r=
eclaimable
>        9927 =C2=B1  3%      +5.8%      10504        proc-vmstat.nr_zone_a=
ctive_anon
>        1225            -5.8%       1154 =C2=B1  3%  proc-vmstat.nr_zone_w=
rite_pending
>    11313111            -2.1%   11072335        proc-vmstat.pgfault
>        0.00          +125.0%       0.00 =C2=B1 19%  perf-sched.sch_delay.=
avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.start_transac=
tion.btrfs_dirty_inode
>        0.01 =C2=B1 13%     -24.5%       0.01 =C2=B1 15%  perf-sched.sch_d=
elay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
>        3.26 =C2=B1 41%     -98.8%       0.04        perf-sched.sch_delay.=
max.ms.rwsem_down_write_slowpath.chmod_common.do_fchmodat.__x64_sys_chmod
>        0.00 =C2=B1 50%    +123.5%       0.01 =C2=B1 24%  perf-sched.sch_d=
elay.max.ms.wait_for_partner.fifo_open.do_dentry_open.path_openat
>        4.77 =C2=B1  6%     -25.7%       3.54        perf-sched.total_sch_=
delay.max.ms
>        0.02 =C2=B1  7%     +19.5%       0.02 =C2=B1  5%  perf-sched.wait_=
and_delay.avg.ms.rwsem_down_write_slowpath.chmod_common.do_fchmodat.__x64_s=
ys_fchmodat
>        1711 =C2=B1 27%     +60.7%       2750 =C2=B1 22%  perf-sched.wait_=
and_delay.count.rwsem_down_write_slowpath.chmod_common.__x64_sys_fchmod.do_=
syscall_64
>        0.03 =C2=B1132%   +2497.6%       0.81 =C2=B1 66%  perf-sched.wait_=
time.avg.ms.preempt_schedule_common._cond_resched.dput.path_put.do_fchmodat
>        0.25 =C2=B1 67%    +243.4%       0.86 =C2=B1 49%  perf-sched.wait_=
time.avg.ms.preempt_schedule_common._cond_resched.kmem_cache_alloc.start_tr=
ansaction.btrfs_dirty_inode
>        0.02 =C2=B1 11%     +28.6%       0.02 =C2=B1 13%  perf-sched.wait_=
time.avg.ms.rwsem_down_write_slowpath.chmod_common.do_fchmodat.__x64_sys_ch=
mod
>        0.27 =C2=B1160%   +1248.5%       3.67 =C2=B1 57%  perf-sched.wait_=
time.max.ms.preempt_schedule_common._cond_resched.dput.path_put.do_fchmodat
>        0.04 =C2=B1165%   +4851.4%       2.17 =C2=B1 99%  perf-sched.wait_=
time.max.ms.preempt_schedule_common._cond_resched.mnt_want_write.chmod_comm=
on.do_fchmodat
>    36969238            -5.8%   34829162 =C2=B1  2%  perf-stat.i.cache-mis=
ses
>   2.009e+09            -2.7%  1.954e+09        perf-stat.i.dTLB-stores
>    12297175 =C2=B1  2%      -6.5%   11500340        perf-stat.i.iTLB-load=
-misses
>        1843            +7.0%       1972 =C2=B1  2%  perf-stat.i.instructi=
ons-per-iTLB-miss
>        8936            -2.2%       8740        perf-stat.i.minor-faults
>      952962            -3.6%     919068        perf-stat.i.node-loads
>     5348157            -7.4%    4950006 =C2=B1  2%  perf-stat.i.node-stor=
e-misses
>        8942            -2.2%       8748        perf-stat.i.page-faults
>        0.00 =C2=B1 20%      +0.0        0.00 =C2=B1 18%  perf-stat.overal=
l.dTLB-store-miss-rate%
>        1263            +6.1%       1339        perf-stat.overall.instruct=
ions-per-iTLB-miss
>    36924576            -5.8%   34784593 =C2=B1  2%  perf-stat.ps.cache-mi=
sses
>   2.003e+09            -2.7%  1.949e+09        perf-stat.ps.dTLB-stores
>    12274047 =C2=B1  2%      -6.5%   11479296        perf-stat.ps.iTLB-loa=
d-misses
>        8880            -2.1%       8694        perf-stat.ps.minor-faults
>      950813            -3.6%     916929        perf-stat.ps.node-loads
>     5343222            -7.5%    4944422 =C2=B1  2%  perf-stat.ps.node-sto=
re-misses
>        8887            -2.1%       8702        perf-stat.ps.page-faults
>       57.00 =C2=B1166%    -100.0%       0.00        interrupts.92:PCI-MSI=
.31981625-edge.i40e-eth0-TxRx-56
>       19339 =C2=B1  7%     +31.3%      25385 =C2=B1 16%  interrupts.CPU13=
.CAL:Function_call_interrupts
>       19917 =C2=B1  5%      +9.7%      21856        interrupts.CPU23.TLB:=
TLB_shootdowns
>       20940 =C2=B1  5%      +9.5%      22935 =C2=B1  4%  interrupts.CPU29=
.CAL:Function_call_interrupts
>        3470 =C2=B1 65%     -96.1%     136.75 =C2=B1  5%  interrupts.CPU29=
.NMI:Non-maskable_interrupts
>        3470 =C2=B1 65%     -96.1%     136.75 =C2=B1  5%  interrupts.CPU29=
.PMI:Performance_monitoring_interrupts
>        2061 =C2=B1160%     -93.5%     134.00 =C2=B1  3%  interrupts.CPU33=
.NMI:Non-maskable_interrupts
>        2061 =C2=B1160%     -93.5%     134.00 =C2=B1  3%  interrupts.CPU33=
.PMI:Performance_monitoring_interrupts
>        3041 =C2=B1 47%     +75.6%       5342 =C2=B1 36%  interrupts.CPU35=
.RES:Rescheduling_interrupts
>        3748 =C2=B1 96%     -96.5%     133.00 =C2=B1  5%  interrupts.CPU40=
.NMI:Non-maskable_interrupts
>        3748 =C2=B1 96%     -96.5%     133.00 =C2=B1  5%  interrupts.CPU40=
.PMI:Performance_monitoring_interrupts
>       21172 =C2=B1  5%     -12.7%      18476 =C2=B1  6%  interrupts.CPU45=
.CAL:Function_call_interrupts
>       56.25 =C2=B1169%    -100.0%       0.00        interrupts.CPU56.92:P=
CI-MSI.31981625-edge.i40e-eth0-TxRx-56
>      122.50 =C2=B1 25%     -34.5%      80.25 =C2=B1 32%  interrupts.CPU56=
.NMI:Non-maskable_interrupts
>      122.50 =C2=B1 25%     -34.5%      80.25 =C2=B1 32%  interrupts.CPU56=
.PMI:Performance_monitoring_interrupts
>       21585 =C2=B1  5%     +13.4%      24479 =C2=B1  5%  interrupts.CPU58=
.TLB:TLB_shootdowns
>        3340 =C2=B1 22%     +76.3%       5888 =C2=B1 48%  interrupts.CPU62=
.RES:Rescheduling_interrupts
>       23969 =C2=B1  5%     +12.5%      26976 =C2=B1 14%  interrupts.CPU66=
.CAL:Function_call_interrupts
>       22832 =C2=B1  5%     +26.5%      28873 =C2=B1 14%  interrupts.CPU69=
.CAL:Function_call_interrupts
>        2329 =C2=B1106%     -66.3%     784.50 =C2=B1150%  interrupts.CPU73=
.NMI:Non-maskable_interrupts
>        2329 =C2=B1106%     -66.3%     784.50 =C2=B1150%  interrupts.CPU73=
.PMI:Performance_monitoring_interrupts
>        3520 =C2=B1 65%     -96.7%     116.00 =C2=B1 27%  interrupts.CPU77=
.NMI:Non-maskable_interrupts
>        3520 =C2=B1 65%     -96.7%     116.00 =C2=B1 27%  interrupts.CPU77=
.PMI:Performance_monitoring_interrupts
>        1570 =C2=B1156%     -93.6%     101.00 =C2=B1 37%  interrupts.CPU81=
.NMI:Non-maskable_interrupts
>        1570 =C2=B1156%     -93.6%     101.00 =C2=B1 37%  interrupts.CPU81=
.PMI:Performance_monitoring_interrupts
>        2501 =C2=B1109%     -95.9%     102.75 =C2=B1 41%  interrupts.CPU88=
.NMI:Non-maskable_interrupts
>        2501 =C2=B1109%     -95.9%     102.75 =C2=B1 41%  interrupts.CPU88=
.PMI:Performance_monitoring_interrupts
>        5208 =C2=B1 44%     -48.6%       2674 =C2=B1 46%  interrupts.CPU9.=
RES:Rescheduling_interrupts
>       20273 =C2=B1 10%     +22.3%      24803 =C2=B1 11%  interrupts.CPU91=
.CAL:Function_call_interrupts
>        1833 =C2=B1158%     -93.6%     117.75 =C2=B1 24%  interrupts.CPU94=
.NMI:Non-maskable_interrupts
>        1833 =C2=B1158%     -93.6%     117.75 =C2=B1 24%  interrupts.CPU94=
.PMI:Performance_monitoring_interrupts
>       47.69 =C2=B1 11%     -27.3       20.39 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.do_faccessat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       20.56 =C2=B1 11%     -12.1        8.50 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.prepare_creds.do_faccessat.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
>       18.78 =C2=B1 11%     -11.9        6.92 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.put_cred_rcu.do_faccessat.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
>        5.42 =C2=B1 12%      -3.8        1.60 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.free_uid.put_cred_rcu.do_faccessat.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>        5.38 =C2=B1 12%      -3.8        1.57 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.refcount_dec_and_lock_irqsave.free_uid.put_cred_rcu.do_fac=
cessat.do_syscall_64
>        5.36 =C2=B1 12%      -3.8        1.56 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.refcount_dec_not_one.refcount_dec_and_lock_irqsave.free_ui=
d.put_cred_rcu.do_faccessat
>        5.32 =C2=B1 11%      -3.1        2.19 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.key_put.put_cred_rcu.do_faccessat.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>        5.17 =C2=B1 11%      -2.4        2.74 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.security_prepare_creds.prepare_creds.do_faccessat.do_sysca=
ll_64.entry_SYSCALL_64_after_hwframe
>        4.77 =C2=B1  8%      -2.3        2.50 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.btrfs_update_inode.btrfs_dirty_inode.btrfs_setattr.notify_=
change.chmod_common
>        3.79 =C2=B1  7%      -2.0        1.84 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.btrfs_delayed_update_inode.btrfs_update_inode.btrfs_dirty_=
inode.btrfs_setattr.notify_change
>        3.54 =C2=B1 12%      -1.8        1.74 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.apparmor_cred_prepare.security_prepare_creds.prepare_creds=
.do_faccessat.do_syscall_64
>        3.49 =C2=B1  9%      -1.8        1.72 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.security_cred_free.put_cred_rcu.do_faccessat.do_syscall_64=
.entry_SYSCALL_64_after_hwframe
>        2.49 =C2=B1  9%      -1.4        1.08 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.apparmor_cred_free.security_cred_free.put_cred_rcu.do_facc=
essat.do_syscall_64
>        3.38 =C2=B1 11%      -1.3        2.04 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.filename_lookup.do_faccessat.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
>        3.25 =C2=B1 11%      -1.3        1.96 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__do_sys_newfstatat.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
>        2.99 =C2=B1 11%      -1.2        1.82 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.path_lookupat.filename_lookup.do_faccessat.do_syscall_64.e=
ntry_SYSCALL_64_after_hwframe
>        1.55 =C2=B1 11%      -1.2        0.39 =C2=B1 57%  perf-profile.cal=
ltrace.cycles-pp.join_transaction.start_transaction.btrfs_dirty_inode.btrfs=
_setattr.notify_change
>        2.89 =C2=B1 10%      -1.1        1.75 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.vfs_statx.__do_sys_newfstatat.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>        2.46 =C2=B1  7%      -1.1        1.33 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.__btrfs_release_delayed_node.btrfs_delayed_update_inode.bt=
rfs_update_inode.btrfs_dirty_inode.btrfs_setattr
>        1.79 =C2=B1 11%      -0.7        1.11 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.link_path_walk.path_lookupat.filename_lookup.do_faccessat.=
do_syscall_64
>        1.57 =C2=B1 11%      -0.7        0.91 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.kmem_cache_alloc.prepare_creds.do_faccessat.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>        1.64 =C2=B1  9%      -0.6        1.00 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.user_path_at_empty.do_faccessat.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>        1.60 =C2=B1  9%      -0.6        0.98 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.getname_flags.user_path_at_empty.do_faccessat.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
>        1.54 =C2=B1  8%      -0.6        0.94 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__kmalloc.security_prepare_creds.prepare_creds.do_faccessa=
t.do_syscall_64
>        1.21 =C2=B1 10%      -0.4        0.77 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.do_facc=
essat.do_syscall_64
>        1.00 =C2=B1 10%      -0.4        0.63 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.filename_lookup.vfs_statx.__do_sys_newfstatat.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
>        0.95 =C2=B1 14%      -0.4        0.58 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.kmem_cache_free.do_faccessat.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
>        0.95 =C2=B1  7%      -0.3        0.61 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.kfree.security_cred_free.put_cred_rcu.do_faccessat.do_sysc=
all_64
>        0.91 =C2=B1 10%      -0.3        0.57 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.__do_sys_newfstata=
t.do_syscall_64
>        0.00            +1.0        0.98 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp._find_next_bit.cpumask_next.__percpu_counter_sum.__reserve_byte=
s.btrfs_reserve_metadata_bytes
>        0.00            +1.6        1.56 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.cpumask_next.__percpu_counter_sum.__reserve_bytes.btrfs_reserve=
_metadata_bytes.btrfs_block_rsv_add
>        0.00            +4.2        4.23 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.__percpu_counter_sum.__reserve_bytes.btrfs_reserve_metadata_byt=
es.btrfs_block_rsv_add.start_transaction
>        0.00           +12.6       12.55 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__reserve_bytes=
.btrfs_reserve_metadata_bytes.btrfs_block_rsv_add
>        0.00           +13.0       13.01 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp._raw_spin_lock.__reserve_bytes.btrfs_reserve_metadata_bytes.btr=
fs_block_rsv_add.start_transaction
>        0.00           +15.3       15.29 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.btrfs_block_rsv=
_release.btrfs_trans_release_metadata.__btrfs_end_transaction
>        0.00           +15.8       15.81 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp._raw_spin_lock.btrfs_block_rsv_release.btrfs_trans_release_meta=
data.__btrfs_end_transaction.btrfs_dirty_inode
>        0.00           +16.0       16.04 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.btrfs_block_rsv_release.btrfs_trans_release_metadata.__btrfs_en=
d_transaction.btrfs_dirty_inode.btrfs_setattr
>        0.00           +16.0       16.05 =C2=B1  3%  perf-profile.calltrac=
e.cycles-pp.btrfs_trans_release_metadata.__btrfs_end_transaction.btrfs_dirt=
y_inode.btrfs_setattr.notify_change
>        0.63 =C2=B1 10%     +16.7       17.34 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__btrfs_end_transaction.btrfs_dirty_inode.btrfs_setattr.no=
tify_change.chmod_common
>        0.00           +18.3       18.27 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.__reserve_bytes.btrfs_reserve_metadata_bytes.btrfs_block_rsv_ad=
d.start_transaction.btrfs_dirty_inode
>        0.00           +18.4       18.39 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.btrfs_reserve_metadata_bytes.btrfs_block_rsv_add.start_transact=
ion.btrfs_dirty_inode.btrfs_setattr
>        2.18 =C2=B1 12%     +18.4       20.61 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.start_transaction.btrfs_dirty_inode.btrfs_setattr.notify_c=
hange.chmod_common
>        0.00           +18.9       18.88 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.btrfs_block_rsv_add.start_transaction.btrfs_dirty_inode.btrfs_s=
etattr.notify_change
>        9.24 =C2=B1 10%     +32.2       41.40 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__x64_sys_fchmod.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
>        9.16 =C2=B1 10%     +32.2       41.36 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.chmod_common.__x64_sys_fchmod.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>        8.30 =C2=B1  9%     +32.6       40.94 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.notify_change.chmod_common.__x64_sys_fchmod.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>        8.09 =C2=B1 10%     +32.7       40.80 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.btrfs_setattr.notify_change.chmod_common.__x64_sys_fchmod.=
do_syscall_64
>        7.74 =C2=B1  9%     +32.8       40.56 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.btrfs_dirty_inode.btrfs_setattr.notify_change.chmod_common=
.__x64_sys_fchmod
>       47.72 =C2=B1 11%     -27.3       20.41 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.do_faccessat
>       20.57 =C2=B1 11%     -12.1        8.51 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.prepare_creds
>       18.81 =C2=B1 11%     -11.9        6.93 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.put_cred_rcu
>        5.42 =C2=B1 12%      -3.8        1.60 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.free_uid
>        5.39 =C2=B1 12%      -3.8        1.58 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.refcount_dec_and_lock_irqsave
>        5.36 =C2=B1 12%      -3.8        1.56 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.refcount_dec_not_one
>        5.34 =C2=B1 11%      -3.1        2.21 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.key_put
>        5.18 =C2=B1 11%      -2.4        2.75 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.security_prepare_creds
>        4.77 =C2=B1  8%      -2.3        2.50 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.btrfs_update_inode
>        3.80 =C2=B1  7%      -2.0        1.84 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.btrfs_delayed_update_inode
>        3.54 =C2=B1 12%      -1.8        1.74 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.apparmor_cred_prepare
>        3.49 =C2=B1  9%      -1.8        1.72 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.security_cred_free
>        4.39 =C2=B1 11%      -1.7        2.68 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.filename_lookup
>        3.93 =C2=B1 11%      -1.5        2.40 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.path_lookupat
>        2.50 =C2=B1  9%      -1.4        1.09 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.apparmor_cred_free
>        3.26 =C2=B1 11%      -1.3        1.96 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__do_sys_newfstatat
>        2.90 =C2=B1 10%      -1.1        1.75 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.vfs_statx
>        2.47 =C2=B1  7%      -1.1        1.34 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__btrfs_release_delayed_node
>        1.55 =C2=B1 11%      -1.1        0.49 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.join_transaction
>        2.37 =C2=B1 11%      -0.9        1.49 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.link_path_walk
>        2.11 =C2=B1 10%      -0.9        1.23 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.kmem_cache_alloc
>        2.13 =C2=B1  9%      -0.8        1.30 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.user_path_at_empty
>        2.08 =C2=B1  9%      -0.8        1.29 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.getname_flags
>        1.17 =C2=B1 12%      -0.7        0.50 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.common_perm_cond
>        1.58 =C2=B1 14%      -0.7        0.92 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.inode_permission
>        1.10 =C2=B1 12%      -0.6        0.46 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.common_perm
>        1.58 =C2=B1  9%      -0.6        0.97 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__kmalloc
>        1.56 =C2=B1 11%      -0.6        0.99 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.strncpy_from_user
>        1.29 =C2=B1 14%      -0.5        0.79 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.kmem_cache_free
>        1.10 =C2=B1 13%      -0.5        0.62 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.mutex_lock
>        0.59 =C2=B1 10%      -0.4        0.14 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.btrfs_get_or_create_delayed_node
>        0.57 =C2=B1 10%      -0.4        0.14 =C2=B1 18%  perf-profile.chi=
ldren.cycles-pp.btrfs_get_delayed_node
>        0.83 =C2=B1 13%      -0.4        0.46 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.generic_permission
>        0.91 =C2=B1 10%      -0.4        0.56 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.walk_component
>        0.96 =C2=B1  7%      -0.4        0.61 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.kfree
>        0.60 =C2=B1 14%      -0.3        0.26 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.security_path_chmod
>        0.65 =C2=B1 10%      -0.3        0.31 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.vfs_getattr
>        0.64 =C2=B1 10%      -0.3        0.30 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.security_inode_getattr
>        0.77 =C2=B1 12%      -0.3        0.46 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.btrfs_update_root_times
>        0.69 =C2=B1  5%      -0.3        0.39 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.mutex_unlock
>        0.65 =C2=B1 12%      -0.3        0.39 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.syscall_return_via_sysret
>        0.70 =C2=B1  9%      -0.3        0.44 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__check_object_size
>        0.62 =C2=B1 12%      -0.3        0.37 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.complete_walk
>        0.51 =C2=B1 12%      -0.3        0.26 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.get_obj_cgroup_from_current
>        0.46 =C2=B1 31%      -0.2        0.22 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.revert_creds
>        0.59 =C2=B1 12%      -0.2        0.36 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.unlazy_walk
>        0.48 =C2=B1 11%      -0.2        0.28 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.obj_cgroup_charge
>        0.58 =C2=B1 10%      -0.2        0.38 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.btrfs_getattr
>        0.52 =C2=B1 10%      -0.2        0.33 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.lookup_fast
>        0.47 =C2=B1 20%      -0.2        0.29 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.btrfs_permission
>        0.33 =C2=B1 12%      -0.2        0.15 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.capable_wrt_inode_uidgid
>        0.46 =C2=B1 12%      -0.2        0.29        perf-profile.children=
.cycles-pp.__legitimize_path
>        0.32 =C2=B1 12%      -0.2        0.14 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.security_capable
>        0.31 =C2=B1 12%      -0.2        0.13 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.apparmor_capable
>        0.32 =C2=B1 12%      -0.2        0.15 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.ns_capable_common
>        0.45 =C2=B1  9%      -0.2        0.28 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.refill_obj_stock
>        0.28 =C2=B1 63%      -0.2        0.12 =C2=B1 27%  perf-profile.chi=
ldren.cycles-pp.map_id_up
>        0.35 =C2=B1 28%      -0.1        0.20 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.cp_new_stat
>        0.42 =C2=B1 10%      -0.1        0.28 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__mod_memcg_lruvec_state
>        0.36 =C2=B1 10%      -0.1        0.23 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.path_put
>        0.35 =C2=B1 10%      -0.1        0.22 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.dput
>        0.35 =C2=B1  9%      -0.1        0.22 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.__d_lookup_rcu
>        0.32 =C2=B1 10%      -0.1        0.19 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.path_init
>        0.36 =C2=B1 14%      -0.1        0.24 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.__entry_text_start
>        0.35 =C2=B1 11%      -0.1        0.23 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.___might_sleep
>        0.32 =C2=B1  9%      -0.1        0.20 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__check_heap_object
>        0.27 =C2=B1 10%      -0.1        0.16 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__list_add_valid
>        0.26 =C2=B1  7%      -0.1        0.16 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.__might_sleep
>        0.23 =C2=B1 15%      -0.1        0.13 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp._cond_resched
>        0.19 =C2=B1 39%      -0.1        0.09 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.fill_stack_inode_item
>        0.23 =C2=B1 14%      -0.1        0.14 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.syscall_enter_from_user_mode
>        0.23 =C2=B1 14%      -0.1        0.15 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__legitimize_mnt
>        0.18 =C2=B1 14%      -0.1        0.10 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.override_creds
>        0.17 =C2=B1 15%      -0.1        0.10 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.__list_del_entry_valid
>        0.18 =C2=B1 13%      -0.1        0.10 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.step_into
>        0.19 =C2=B1 14%      -0.1        0.12 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.lockref_get_not_dead
>        0.20 =C2=B1 10%      -0.1        0.13 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.__mod_memcg_state
>        0.19 =C2=B1 16%      -0.1        0.12 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.rcu_read_unlock_strict
>        0.15 =C2=B1 14%      -0.1        0.09 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.lockref_put_or_lock
>        0.17 =C2=B1 11%      -0.1        0.12 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.memset_erms
>        0.17 =C2=B1 17%      -0.1        0.12 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.syscall_exit_to_user_mode
>        0.16 =C2=B1  7%      -0.1        0.11 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp._copy_to_user
>        0.10 =C2=B1 21%      -0.1        0.04 =C2=B1 58%  perf-profile.chi=
ldren.cycles-pp.mnt_want_write
>        0.11 =C2=B1  9%      -0.0        0.07 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.inode_get_bytes
>        0.11 =C2=B1 18%      -0.0        0.07 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.rcu_all_qs
>        0.11 =C2=B1 16%      -0.0        0.06 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.security_inode_permission
>        0.10            -0.0        0.05 =C2=B1  8%  perf-profile.children=
.cycles-pp.__fget_light
>        0.11 =C2=B1 13%      -0.0        0.07 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.entry_SYSCALL_64_safe_stack
>        0.12 =C2=B1 12%      -0.0        0.08 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.copy_user_enhanced_fast_string
>        0.10 =C2=B1 19%      -0.0        0.07 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__put_cred
>        0.11 =C2=B1 14%      -0.0        0.07 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.btrfs_balance_delayed_items
>        0.09 =C2=B1 14%      -0.0        0.06 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.exit_to_user_mode_prepare
>        0.10 =C2=B1 14%      -0.0        0.08 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__x86_indirect_thunk_rax
>        0.08 =C2=B1 10%      -0.0        0.06 =C2=B1 15%  perf-profile.chi=
ldren.cycles-pp.mntput_no_expire
>        0.21 =C2=B1  6%      +0.1        0.28 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.btrfs_put_transaction
>        0.05 =C2=B1 61%      +0.1        0.15 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp._raw_spin_unlock_irqrestore
>        0.00            +0.2        0.21 =C2=B1 10%  perf-profile.children=
.cycles-pp.find_next_bit
>        0.06 =C2=B1 17%      +0.3        0.38 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock_irqsave
>        0.00            +0.4        0.43 =C2=B1 14%  perf-profile.children=
.cycles-pp.btrfs_get_alloc_profile
>        0.00            +0.5        0.46 =C2=B1 14%  perf-profile.children=
.cycles-pp.calc_available_free_space
>        0.00            +0.5        0.48 =C2=B1  2%  perf-profile.children=
.cycles-pp.btrfs_block_rsv_add_bytes
>        0.00            +0.5        0.48 =C2=B1  8%  perf-profile.children=
.cycles-pp.wait_current_trans
>        0.00            +1.0        1.00 =C2=B1  4%  perf-profile.children=
.cycles-pp._find_next_bit
>        0.00            +1.8        1.77 =C2=B1  4%  perf-profile.children=
.cycles-pp.cpumask_next
>        0.00            +4.2        4.24 =C2=B1  4%  perf-profile.children=
.cycles-pp.__percpu_counter_sum
>        0.00           +16.0       16.04 =C2=B1  3%  perf-profile.children=
.cycles-pp.btrfs_block_rsv_release
>        0.00           +16.0       16.05 =C2=B1  3%  perf-profile.children=
.cycles-pp.btrfs_trans_release_metadata
>        0.64 =C2=B1  9%     +16.7       17.35 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__btrfs_end_transaction
>        0.00           +18.3       18.27 =C2=B1  4%  perf-profile.children=
.cycles-pp.__reserve_bytes
>        0.00           +18.4       18.39 =C2=B1  4%  perf-profile.children=
.cycles-pp.btrfs_reserve_metadata_bytes
>        2.19 =C2=B1 12%     +18.4       20.61 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.start_transaction
>        0.00           +18.9       18.88 =C2=B1  4%  perf-profile.children=
.cycles-pp.btrfs_block_rsv_add
>        0.75 =C2=B1  8%     +27.1       27.88 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.native_queued_spin_lock_slowpath
>        2.32 =C2=B1 10%     +28.3       30.66 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock
>        9.25 =C2=B1 10%     +32.2       41.41 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_fchmod
>        9.16 =C2=B1 10%     +32.2       41.36 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.chmod_common
>        8.31 =C2=B1  9%     +32.6       40.95 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.notify_change
>        8.10 =C2=B1 10%     +32.7       40.80 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.btrfs_setattr
>        7.75 =C2=B1  9%     +32.8       40.56 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.btrfs_dirty_inode
>       13.73 =C2=B1 11%      -8.9        4.81 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.prepare_creds
>        5.33 =C2=B1 12%      -3.8        1.55 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.refcount_dec_not_one
>        4.57 =C2=B1 11%      -3.1        1.42 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.put_cred_rcu
>        5.30 =C2=B1 11%      -3.1        2.19 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.key_put
>        3.53 =C2=B1 12%      -1.8        1.73 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.apparmor_cred_prepare
>        2.48 =C2=B1  9%      -1.4        1.08 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.apparmor_cred_free
>        1.10 =C2=B1 12%      -0.6        0.45 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.common_perm
>        1.04 =C2=B1 14%      -0.5        0.58 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.mutex_lock
>        0.57 =C2=B1 11%      -0.4        0.13 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.btrfs_get_delayed_node
>        1.06 =C2=B1  9%      -0.4        0.63 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.kmem_cache_alloc
>        1.02 =C2=B1 10%      -0.4        0.64 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.link_path_walk
>        0.93 =C2=B1 14%      -0.4        0.55 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.kmem_cache_free
>        0.79 =C2=B1  8%      -0.3        0.48 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.__kmalloc
>        0.69 =C2=B1  5%      -0.3        0.39 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.mutex_unlock
>        0.72 =C2=B1 11%      -0.3        0.46 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.strncpy_from_user
>        0.65 =C2=B1 12%      -0.3        0.39 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.syscall_return_via_sysret
>        0.46 =C2=B1 31%      -0.2        0.22 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.revert_creds
>        0.64 =C2=B1  9%      -0.2        0.40 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.kfree
>        0.60 =C2=B1  9%      -0.2        0.38 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.join_transaction
>        0.41 =C2=B1 11%      -0.2        0.22 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.get_obj_cgroup_from_current
>        0.45 =C2=B1 10%      -0.2        0.27 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.obj_cgroup_charge
>        0.30 =C2=B1 13%      -0.2        0.13 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.apparmor_capable
>        0.44 =C2=B1 20%      -0.2        0.28 =C2=B1 16%  perf-profile.sel=
f.cycles-pp.btrfs_permission
>        0.42 =C2=B1 11%      -0.2        0.27 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.generic_permission
>        0.42 =C2=B1  8%      -0.2        0.27 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.refill_obj_stock
>        0.47 =C2=B1 10%      -0.2        0.32 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.btrfs_getattr
>        0.27 =C2=B1 65%      -0.2        0.12 =C2=B1 25%  perf-profile.sel=
f.cycles-pp.map_id_up
>        0.36 =C2=B1 14%      -0.1        0.23 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.__entry_text_start
>        0.34 =C2=B1 10%      -0.1        0.22 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.__d_lookup_rcu
>        0.38 =C2=B1 11%      -0.1        0.25 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.do_faccessat
>        0.32 =C2=B1 19%      -0.1        0.20 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.inode_permission
>        0.34 =C2=B1 13%      -0.1        0.22 =C2=B1  9%  perf-profile.sel=
f.cycles-pp.___might_sleep
>        0.31 =C2=B1  9%      -0.1        0.20 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.__check_heap_object
>        0.27 =C2=B1 10%      -0.1        0.16 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.__list_add_valid
>        0.28 =C2=B1 11%      -0.1        0.17 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.path_init
>        0.25 =C2=B1  8%      -0.1        0.15 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.__might_sleep
>        0.26 =C2=B1  8%      -0.1        0.16 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.__check_object_size
>        0.23 =C2=B1 16%      -0.1        0.13 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.syscall_enter_from_user_mode
>        0.17 =C2=B1 16%      -0.1        0.09 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.override_creds
>        0.22 =C2=B1 15%      -0.1        0.14 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.__legitimize_mnt
>        0.20 =C2=B1 13%      -0.1        0.12 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.entry_SYSCALL_64_after_hwframe
>        0.14 =C2=B1 18%      -0.1        0.06        perf-profile.self.cyc=
les-pp.btrfs_update_inode
>        0.21 =C2=B1 13%      -0.1        0.13 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.walk_component
>        0.17 =C2=B1 11%      -0.1        0.10 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.step_into
>        0.17 =C2=B1 17%      -0.1        0.10 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.__list_del_entry_valid
>        0.19 =C2=B1 14%      -0.1        0.12 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.lockref_get_not_dead
>        0.20 =C2=B1 10%      -0.1        0.13 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.__mod_memcg_state
>        0.16 =C2=B1 10%      -0.1        0.10 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.lookup_fast
>        0.15 =C2=B1 14%      -0.1        0.08 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.lockref_put_or_lock
>        0.20 =C2=B1 10%      -0.1        0.14 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.__mod_memcg_lruvec_state
>        0.15 =C2=B1 14%      -0.1        0.08 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.filename_lookup
>        0.17 =C2=B1  9%      -0.1        0.11 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.memset_erms
>        0.14 =C2=B1 12%      -0.1        0.08 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.getname_flags
>        0.07 =C2=B1 11%      -0.0        0.03 =C2=B1100%  perf-profile.sel=
f.cycles-pp.dput
>        0.11 =C2=B1 16%      -0.0        0.06 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.security_inode_permission
>        0.15 =C2=B1 15%      -0.0        0.10 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.rcu_read_unlock_strict
>        0.12 =C2=B1 12%      -0.0        0.08 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.copy_user_enhanced_fast_string
>        0.11 =C2=B1 11%      -0.0        0.06 =C2=B1 13%  perf-profile.sel=
f.cycles-pp._cond_resched
>        0.11 =C2=B1 13%      -0.0        0.07 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.entry_SYSCALL_64_safe_stack
>        0.10 =C2=B1  5%      -0.0        0.05 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.__fget_light
>        0.10 =C2=B1 19%      -0.0        0.07 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.path_lookupat
>        0.11 =C2=B1 14%      -0.0        0.07 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.btrfs_balance_delayed_items
>        0.10 =C2=B1 14%      -0.0        0.07 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.__virt_addr_valid
>        0.10 =C2=B1 21%      -0.0        0.06 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.__put_cred
>        0.07 =C2=B1 11%      -0.0        0.04 =C2=B1 60%  perf-profile.sel=
f.cycles-pp.exit_to_user_mode_prepare
>        0.09 =C2=B1 20%      -0.0        0.06 =C2=B1 17%  perf-profile.sel=
f.cycles-pp.notify_change
>        0.07 =C2=B1 12%      -0.0        0.05 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.mntput_no_expire
>        0.21 =C2=B1  6%      +0.1        0.28 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.btrfs_put_transaction
>        0.05 =C2=B1 62%      +0.1        0.13 =C2=B1 11%  perf-profile.sel=
f.cycles-pp._raw_spin_unlock_irqrestore
>        0.00            +0.1        0.12 =C2=B1  5%  perf-profile.self.cyc=
les-pp.btrfs_reserve_metadata_bytes
>        0.00            +0.1        0.14 =C2=B1 13%  perf-profile.self.cyc=
les-pp.btrfs_block_rsv_release
>        0.00            +0.2        0.16 =C2=B1 18%  perf-profile.self.cyc=
les-pp.btrfs_get_alloc_profile
>        0.00            +0.2        0.18 =C2=B1  7%  perf-profile.self.cyc=
les-pp.wait_current_trans
>        0.46 =C2=B1 15%      +0.2        0.64 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.start_transaction
>        0.00            +0.2        0.21 =C2=B1 10%  perf-profile.self.cyc=
les-pp.find_next_bit
>        0.06 =C2=B1 20%      +0.3        0.38 =C2=B1  4%  perf-profile.sel=
f.cycles-pp._raw_spin_lock_irqsave
>        0.00            +0.6        0.57 =C2=B1 14%  perf-profile.self.cyc=
les-pp.__reserve_bytes
>        0.00            +0.6        0.57 =C2=B1  7%  perf-profile.self.cyc=
les-pp.cpumask_next
>        0.36 =C2=B1 12%      +0.6        0.98 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.__btrfs_end_transaction
>        0.00            +1.0        0.99 =C2=B1  4%  perf-profile.self.cyc=
les-pp._find_next_bit
>        1.57 =C2=B1 11%      +1.2        2.77 =C2=B1  6%  perf-profile.sel=
f.cycles-pp._raw_spin_lock
>        0.00            +2.1        2.08 =C2=B1  4%  perf-profile.self.cyc=
les-pp.__percpu_counter_sum
>        0.73 =C2=B1  8%     +27.1       27.79 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.native_queued_spin_lock_slowpath
>
>
>
>                                   stress-ng.access.ops
>
>    1.2e+06 +-------------------------------------------------------------=
----+
>            |     +..+..+..+..  .+..+..+.         .+..  .+..+..+..+..+..+.=
.+  |
>      1e+06 |-+   :           +.                +.    +.                  =
    |
>            |     :                                                       =
    |
>            |    :                                                        =
    |
>     800000 |-+  :                                                        =
    |
>            |    :               O  O  O           O  O  O  O  O  O  O  O =
 O  |
>     600000 |-+O :O  O  O  O  O           O  O  O                         =
    |
>            |   :                                                         =
    |
>     400000 |-+ :                                                         =
    |
>            |   :                                                         =
    |
>            |   :                                                         =
    |
>     200000 |-+:                                                          =
    |
>            |  :                                                          =
    |
>          0 +-------------------------------------------------------------=
----+
>
>
>                              stress-ng.access.ops_per_sec
>
>    40000 +---------------------------------------------------------------=
----+
>          |     +..+..+..+...  .+..+..+.         .+..  .+..+...+..+..+..+.=
.+  |
>    35000 |-+   :            +.                +.    +.                   =
    |
>    30000 |-+   :                                                         =
    |
>          |    :                                                          =
    |
>    25000 |-+  :                                                          =
    |
>          |    :                O  O  O           O  O  O  O   O  O  O  O =
 O  |
>    20000 |-+O :O  O  O  O   O           O  O  O                          =
    |
>          |   :                                                           =
    |
>    15000 |-+ :                                                           =
    |
>    10000 |-+ :                                                           =
    |
>          |   :                                                           =
    |
>     5000 |-+:                                                            =
    |
>          |  :                                                            =
    |
>        0 +---------------------------------------------------------------=
----+
>
>
>                                   stress-ng.chmod.ops
>
>    140000 +--------------------------------------------------------------=
----+
>           |     +..                                                      =
    |
>    120000 |-+   :        +..+..  .+..                                    =
    |
>           |     :  +.. ..      +.    +..          +..   +..   +..        =
    |
>    100000 |-+  :      +                   ..+.. ..    ..    ..   +..     =
    |
>           |    :                        +.     +     +     +        +..+.=
.+  |
>     80000 |-+  :                                                         =
    |
>           |    :                                                         =
    |
>     60000 |-+ :                                      O  O           O    =
    |
>           |  O: O  O  O  O  O  O  O  O  O   O  O  O        O  O  O     O =
 O  |
>     40000 |-+ :                                                          =
    |
>           |   :                                                          =
    |
>     20000 |-+:                                                           =
    |
>           |  :                                                           =
    |
>         0 +--------------------------------------------------------------=
----+
>
>
>                              stress-ng.chmod.ops_per_sec
>
>    4500 +----------------------------------------------------------------=
----+
>         |     +..       +..     .+..                                     =
    |
>    4000 |-+   :        +   +..+.    +..                      +..         =
    |
>    3500 |-+   :  +... +                         .+..  .+..  +            =
    |
>         |    :       +                 +...+..+.    +.     +    +...  .+.=
.+  |
>    3000 |-+  :                                            +         +.   =
    |
>    2500 |-+  :                                                           =
    |
>         |    :                                                           =
    |
>    2000 |-+ :                 O  O  O            O  O  O            O    =
    |
>    1500 |-+O: O  O   O  O  O           O   O  O           O  O  O      O =
 O  |
>         |   :                                                            =
    |
>    1000 |-+ :                                                            =
    |
>     500 |-+:                                                             =
    |
>         |  :                                                             =
    |
>       0 +----------------------------------------------------------------=
----+
>
>
>                                    stress-ng.chown.ops
>
>    1.2e+06 +-------------------------------------------------------------=
----+
>            |     +..+..+..  .+..            +..                          =
    |
>      1e+06 |-+   :        +.    +..  .+.. ..              .+..+..  .+..  =
    |
>            |     :                 +.    +     +..+..+..+.       +.      =
.+  |
>            |    :                                                      +.=
    |
>     800000 |-+  :                                                        =
    |
>            |    :                                                        =
    |
>     600000 |-+O :O              O  O  O           O  O     O           O =
    |
>            |   :    O  O  O  O           O  O  O        O     O  O  O    =
 O  |
>     400000 |-+ :                                                         =
    |
>            |   :                                                         =
    |
>            |   :                                                         =
    |
>     200000 |-+:                                                          =
    |
>            |  :                                                          =
    |
>          0 +-------------------------------------------------------------=
----+
>
>
>                               stress-ng.chown.ops_per_sec
>
>    40000 +---------------------------------------------------------------=
----+
>          |     +..+..+..  ..+..            +..                           =
    |
>    35000 |-+   :        +.     +..  .+.. ..              .+...+..  .+..  =
    |
>    30000 |-+   :                  +.    +     +..+..+..+.        +.      =
.+  |
>          |    :                                                        +.=
    |
>    25000 |-+  :                                                          =
    |
>          |    :                                                          =
    |
>    20000 |-+O :O               O  O  O           O  O     O            O =
    |
>          |   :    O  O  O   O           O  O  O        O      O  O  O    =
 O  |
>    15000 |-+ :                                                           =
    |
>    10000 |-+ :                                                           =
    |
>          |   :                                                           =
    |
>     5000 |-+:                                                            =
    |
>          |  :                                                            =
    |
>        0 +---------------------------------------------------------------=
----+
>
>
>                                    stress-ng.utime.ops
>
>    4.5e+06 +-------------------------------------------------------------=
----+
>            |          .+..+..  .+..  .+..  .+..                          =
    |
>      4e+06 |-+   +..+.       +.    +.    +.               .+..+..+..+..  =
.+  |
>    3.5e+06 |-+   :                             +..+..+..+.             +.=
    |
>            |     :                                                       =
    |
>      3e+06 |-+  :                                                        =
    |
>    2.5e+06 |-+  :                                                        =
    |
>            |    :                                                        =
    |
>      2e+06 |-+  :                                                        =
    |
>    1.5e+06 |-+ :                                                         =
    |
>            |   :                O  O  O           O  O                   =
    |
>      1e+06 |-+O: O  O  O  O  O           O  O  O        O  O  O  O  O  O =
 O  |
>     500000 |-+ :                                                         =
    |
>            |  :                                                          =
    |
>          0 +-------------------------------------------------------------=
----+
>
>
>                               stress-ng.utime.ops_per_sec
>
>    160000 +--------------------------------------------------------------=
----+
>           |          .+..      +..                                       =
    |
>    140000 |-+     .+.    +.. ..     .+..  ..+..                          =
    |
>    120000 |-+   +.          +     +.    +.       .+..  .+..+..+..+..+..  =
.+  |
>           |     :                              +.    +.                +.=
    |
>    100000 |-+  :                                                         =
    |
>           |    :                                                         =
    |
>     80000 |-+  :                                                         =
    |
>           |    :                                                         =
    |
>     60000 |-+ :                                                          =
    |
>     40000 |-+ :                                                          =
    |
>           |  O: O  O  O  O  O  O  O  O  O   O  O  O  O  O  O  O  O  O  O =
 O  |
>     20000 |-+ :                                                          =
    |
>           |  :                                                           =
    |
>         0 +--------------------------------------------------------------=
----+
>
>
> [*] bisect-good sample
> [O] bisect-bad  sample
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Oliver Sang
>
--===============0663821624838511493==--

