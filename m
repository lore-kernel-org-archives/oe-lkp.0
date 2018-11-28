Content-Type: multipart/mixed; boundary="===============5044296036287430978=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] locks: fix performance regressions.
Date: Wed, 28 Nov 2018 17:17:30 +0800
Message-ID: <20181128091730.GD21676@shao2-debian>
In-Reply-To: <87k1kyowdf.fsf@notabene.neil.brown.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============5044296036287430978==
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


FYI, the performance recovered back, we didn't find any regression between =
the two commits.

commit: =

  48a7a13ff3 ("locks: use properly initialized file_lock when unlocking.")
  8f64e497be ("locks: fix performance regressions.")

48a7a13ff31f0728  8f64e497be9929a2d5904c39c4  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

     33.56 =C2=B1  3%         5%      35.30        boot-time.boot
     10497 =C2=B1  3%        12%      11733 =C2=B1  4%  proc-vmstat.nr_shmem
     67392                       68449        proc-vmstat.nr_zone_active_an=
on
     67392                       68449        proc-vmstat.nr_active_anon
     16303                       16206        proc-vmstat.nr_slab_reclaimab=
le
     30602                       29921        proc-vmstat.nr_slab_unreclaim=
able
         0            9e+03       9009 =C2=B1 80%  latency_stats.avg.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
         0            6e+03       5837 =C2=B1139%  latency_stats.avg.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_proc_lookup.nfs_lookup.path_openat.do_filp_open.do_sys_open.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
       149 =C2=B1 17%      5e+03       5457 =C2=B1137%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_getattr.__nfs_revalidate_inode.nfs_do_access.nfs_permission.i=
node_permission.link_path_walk.path_lookupat
       175 =C2=B1 29%      4e+03       3807 =C2=B1136%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup.__lookup_slow.lookup_slow.walk_component.pa=
th_lookupat.filename_lookup
     52868 =C2=B1110%     -4e+04      17482 =C2=B1  4%  latency_stats.avg.m=
ax
     45055 =C2=B1141%     -5e+04          0        latency_stats.avg.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
       227 =C2=B1 10%      1e+04       9907 =C2=B1136%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_getattr.__nfs_revalidate_inode.nfs_do_access.nfs_permission.i=
node_permission.link_path_walk.path_lookupat
         0            9e+03       9367 =C2=B1 78%  latency_stats.max.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
         0            6e+03       5837 =C2=B1139%  latency_stats.max.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_proc_lookup.nfs_lookup.path_openat.do_filp_open.do_sys_open.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
       175 =C2=B1 29%      4e+03       3807 =C2=B1136%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup.__lookup_slow.lookup_slow.walk_component.pa=
th_lookupat.filename_lookup
     98043 =C2=B1124%     -8e+04      20999 =C2=B1 27%  latency_stats.max.m=
ax
     90059 =C2=B1141%     -9e+04          0        latency_stats.max.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      1251 =C2=B1 23%      5e+04      49005 =C2=B1137%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_getattr.__nfs_revalidate_inode.nfs_do_access.nfs_permission.i=
node_permission.link_path_walk.path_lookupat
         0            1e+04      12061 =C2=B1 70%  latency_stats.sum.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
         0            6e+03       5837 =C2=B1139%  latency_stats.sum.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_proc_lookup.nfs_lookup.path_openat.do_filp_open.do_sys_open.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
       175 =C2=B1 29%      4e+03       3807 =C2=B1136%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup.__lookup_slow.lookup_slow.walk_component.pa=
th_lookupat.filename_lookup
     90111 =C2=B1141%     -9e+04          0        latency_stats.sum.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe


Best Regards,
Rong Chen

--===============5044296036287430978==--

