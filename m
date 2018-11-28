Content-Type: multipart/mixed; boundary="===============5956771163802043342=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] locks: fix performance regressions.
Date: Wed, 28 Nov 2018 16:16:17 +0800
Message-ID: <20181128081617.GC21676@shao2-debian>
In-Reply-To: <87k1kyowdf.fsf@notabene.neil.brown.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============5956771163802043342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 28, 2018 at 11:53:48AM +1100, NeilBrown wrote:
> =

> The kernel test robot reported two performance regressions
> caused by recent patches.
> Both appear to related to the global spinlock blocked_lock_lock
> being taken more often.
> =

> This patch avoids taking that lock in the cases tested.
> =

> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Signed-off-by: NeilBrown <neilb@suse.com>
> ---
> =

> Hi Jeff,
>  you might like to merge these back into the patches that introduced
>  the problem.
>  Or you might like me to re-send the series with these merged in,
>  in which case, please ask.
> =

>  And a BIG thank-you to the kernel-test-robot team!!
> =

> Thanks,
> NeilBrown
> =

>  fs/locks.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> =

> diff --git a/fs/locks.c b/fs/locks.c
> index f456cd3d9d50..67519a43e27a 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -444,6 +444,13 @@ static void locks_move_blocks(struct file_lock *new,=
 struct file_lock *fl)
>  {
>  	struct file_lock *f;
>  =

> +	/*
> +	 * As ctx->flc_lock is held, new requests cannot be added to
> +	 * ->fl_blocked_requests, so we don't need a lock to check if it
> +	 * is empty.
> +	 */
> +	if (list_empty(&fl->fl_blocked_requests))
> +		return;
>  	spin_lock(&blocked_lock_lock);
>  	list_splice_init(&fl->fl_blocked_requests, &new->fl_blocked_requests);
>  	list_for_each_entry(f, &fl->fl_blocked_requests, fl_blocked_member)
> @@ -749,6 +756,20 @@ int locks_delete_block(struct file_lock *waiter)
>  {
>  	int status =3D -ENOENT;
>  =

> +	/*
> +	 * If fl_blocker is NULL, it won't be set again as this thread
> +	 * "owns" the lock and is the only one that might try to claim
> +	 * the lock.  So it is safe to test fl_blocker locklessly.
> +	 * Also if fl_blocker is NULL, this waiter is not listed on
> +	 * fl_blocked_requests for some lock, so no other request can
> +	 * be added to the list of fl_blocked_requests for this
> +	 * request.  So if fl_blocker is NULL, it is safe to
> +	 * locklessly check if fl_blocked_requests is empty.  If both
> +	 * of these checks succeed, there is no need to take the lock.
> +	 */
> +	if (waiter->fl_blocker =3D=3D NULL &&
> +	    list_empty(&waiter->fl_blocked_requests))
> +		return status;
>  	spin_lock(&blocked_lock_lock);
>  	if (waiter->fl_blocker)
>  		status =3D 0;
> -- =

> 2.14.0.rc0.dirty
> =


FYI, we noticed a 323% improvement of will-it-scale.per_thread_ops due to t=
he patch:

commit: =

  83b381078b ("fs/locks: always delete_block after waiting.")
  8f64e497be ("locks: fix performance regressions.")

83b381078b5ecab0  8f64e497be9929a2d5904c39c4  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

     79.47             334%     344.93        will-it-scale.time.user_time
    140024             323%     592689        will-it-scale.per_thread_ops
   2240400             323%    9483031        will-it-scale.workload
      4736              -6%       4471        will-it-scale.time.system_time
      3998             -60%       1587        will-it-scale.time.involuntar=
y_context_switches
     75812             287%     293376        interrupts.CAL:Function_call_=
interrupts
     49066             263%     178255        vmstat.system.in
      8.51             -39%       5.22        turbostat.RAMWatt
      2061             -72%        570        turbostat.Avg_MHz
     79.47             334%     344.93        time.user_time
      4736              -6%       4471        time.system_time
      3998             -60%       1587        time.involuntary_context_swit=
ches
       688             265%       2512        boot-time.idle
      0.26             205%       0.79        boot-time.smp_boot
     28.89               6%      30.65        boot-time.dhcp
     33.89               4%      35.30        boot-time.boot
      4728             263%      17163        proc-vmstat.numa_other
      6043             118%      13186        proc-vmstat.nr_kernel_stack
     15214              97%      29921        proc-vmstat.nr_slab_unreclaim=
able
     11776              38%      16206        proc-vmstat.nr_slab_reclaimab=
le
     10170 =C2=B1  6%        15%      11733 =C2=B1  4%  proc-vmstat.nr_shmem
    709478               8%     763875        proc-vmstat.pgalloc_normal
    659765               7%     708134        proc-vmstat.numa_hit
      5942               7%       6367        proc-vmstat.nr_zone_inactive_=
anon
      5942               7%       6367        proc-vmstat.nr_inactive_anon
    691445               7%     739402        proc-vmstat.pgfree
    655037               5%     690971        proc-vmstat.numa_local
     66718                       68449        proc-vmstat.nr_zone_active_an=
on
     66718                       68449        proc-vmstat.nr_active_anon
         0            2e+04      15058 =C2=B1 23%  latency_stats.avg.expand=
_files.__alloc_fd.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe
       117 =C2=B1100%      6e+03       5837 =C2=B1139%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup.path_openat.do_filp_open.do_sys_open.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
     55036 =C2=B1172%     -5e+04       5457 =C2=B1137%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_getattr.__nfs_revalidate_inode.nfs_do_access.nfs_permission.i=
node_permission.link_path_walk.path_lookupat
    522081 =C2=B1 50%     -5e+05          0        latency_stats.avg.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
    555545 =C2=B1 37%     -5e+05      17482 =C2=B1  4%  latency_stats.avg.m=
ax
         0            2e+04      15058 =C2=B1 23%  latency_stats.max.expand=
_files.__alloc_fd.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe
       117 =C2=B1100%      6e+03       5837 =C2=B1139%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup.path_openat.do_filp_open.do_sys_open.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
     10792 =C2=B1 99%     -1e+04         87 =C2=B1  4%  latency_stats.max.s=
mp_call_on_cpu.lockup_detector_reconfigure.proc_watchdog_common.proc_sys_ca=
ll_handler.__vfs_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
    485666 =C2=B1173%     -5e+05       9907 =C2=B1136%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_getattr.__nfs_revalidate_inode.nfs_do_access.nfs_permission.i=
node_permission.link_path_walk.path_lookupat
   1381954 =C2=B1 74%     -1e+06          0        latency_stats.max.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
   1842840 =C2=B1 38%     -2e+06      20999 =C2=B1 27%  latency_stats.max.m=
ax
         0            2e+04      15058 =C2=B1 23%  latency_stats.sum.expand=
_files.__alloc_fd.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1551 =C2=B1 16%      1e+04      12817 =C2=B1  3%  latency_stats.sum.r=
dmsr_safe_on_cpu.msr_read.__vfs_read.vfs_read.ksys_pread64.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
       117 =C2=B1100%      6e+03       5837 =C2=B1139%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup.path_openat.do_filp_open.do_sys_open.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
     11267 =C2=B1 96%     -5e+03       5784 =C2=B1 11%  latency_stats.sum.s=
mp_call_on_cpu.lockup_detector_reconfigure.proc_watchdog_common.proc_sys_ca=
ll_handler.__vfs_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
    495208 =C2=B1172%     -4e+05      49005 =C2=B1137%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_getattr.__nfs_revalidate_inode.nfs_do_access.nfs_permission.i=
node_permission.link_path_walk.path_lookupat
   1414713 =C2=B1 71%     -1e+06          0        latency_stats.sum.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
  34149624 =C2=B1  7%      1745%  6.299e+08 =C2=B1 18%  perf-stat.dTLB-load=
-misses
  13536772 =C2=B1 38%      1594%  2.293e+08 =C2=B1 28%  perf-stat.dTLB-stor=
e-misses
      0.00 =C2=B1  8%       833%       0.03 =C2=B1 18%  perf-stat.dTLB-load=
-miss-rate%
 1.403e+09             379%   6.72e+09 =C2=B1 13%  perf-stat.iTLB-load-miss=
es
 2.223e+08 =C2=B1 17%       367%  1.038e+09 =C2=B1 12%  perf-stat.iTLB-loads
 3.337e+11             317%  1.392e+12        perf-stat.dTLB-stores
      0.00 =C2=B1 38%       305%       0.02 =C2=B1 27%  perf-stat.dTLB-stor=
e-miss-rate%
 1.845e+10             182%  5.199e+10 =C2=B1 16%  perf-stat.cache-referenc=
es
 4.642e+09 =C2=B1  3%       175%  1.275e+10 =C2=B1 10%  perf-stat.branch-mi=
sses
 1.185e+12              98%  2.343e+12        perf-stat.dTLB-loads
 4.489e+12              84%  8.272e+12        perf-stat.instructions
      0.30              81%       0.55        perf-stat.ipc
 1.052e+12              70%  1.785e+12        perf-stat.branch-instructions
      0.44 =C2=B1  3%        62%       0.71 =C2=B1 10%  perf-stat.branch-mi=
ss-rate%
     99.86              -4%      95.40        perf-stat.node-load-miss-rate%
     79.75             -44%      44.99 =C2=B1 30%  perf-stat.node-store-mis=
s-rate%
      3.31             -45%       1.83        perf-stat.cpi
   2003878             -56%     872315        perf-stat.path-length
      3201             -61%       1255 =C2=B1 13%  perf-stat.instructions-p=
er-iTLB-miss
      8461 =C2=B1  3%       -96%        313 =C2=B1  9%  perf-stat.cpu-migra=
tions
 4.809e+08             -98%    7583546 =C2=B1 37%  perf-stat.node-stores
 1.706e+09             -98%   25615550 =C2=B1 10%  perf-stat.node-load-miss=
es
 8.018e+09             -99%   52559720 =C2=B1 12%  perf-stat.cache-misses
 1.894e+09            -100%    5768436 =C2=B1 21%  perf-stat.node-store-mis=
ses
     43.45            -100%       0.10 =C2=B1 16%  perf-stat.cache-miss-rat=
e%


Best Regards,
Rong Chen

--===============5956771163802043342==--

