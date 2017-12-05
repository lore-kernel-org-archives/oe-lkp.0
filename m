Content-Type: multipart/mixed; boundary="===============9018730132445012933=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs/locks] 52306e882f: stress-ng.lockofd.ops_per_sec -11% regression
Date: Tue, 05 Dec 2017 13:57:47 +0800
Message-ID: <20171205055746.GA13514@intel.com>
In-Reply-To: <20171108072233.GA3816@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9018730132445012933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2017 at 03:22:33PM +0800, Aaron Lu wrote:
> On Thu, Sep 28, 2017 at 04:02:23PM +0800, kernel test robot wrote:
> > =

> > Greeting,
> > =

> > FYI, we noticed a -11% regression of stress-ng.lockofd.ops_per_sec due =
to commit:
> > =

> > =

> > commit: 52306e882f77d3fd73f91435c41373d634acc5d2 ("fs/locks: Use alloca=
tion rather than the stack in fcntl_getlk()")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> It's been a while, I wonder what do you think of this regression?
> =

> The test stresses byte-range locks AFAICS and since the commit uses
> dynamic allocation instead of stack for the 'struct file_lock', it sounds
> natural the performance regressed for this test.
> =

> Now the question is, do we care about the performance regression here?

Appreciated it if you can share your opinion on this, thanks.

Regards,
Aaron
 =

> Feel free to let me know if you need any other data.
> =

> Thanks for your time.
> =

> > in testcase: stress-ng
> > on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz w=
ith 128G memory
> > with following parameters:
> > =

> > 	testtime: 1s
> > 	class: filesystem
> > 	cpufreq_governor: performance
> > =

> > =

> > =

> > =

> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->
> > =

> > =

> > To reproduce:
> > =

> >         git clone https://github.com/intel/lkp-tests.git
> >         cd lkp-tests
> >         bin/lkp install job.yaml  # job file is attached in this email
> >         bin/lkp run     job.yaml
> > =

> > testcase/path_params/tbox_group/run: stress-ng/1s-filesystem-performanc=
e/lkp-bdw-ep6
> > =

> >        v4.13-rc1  52306e882f77d3fd73f91435c4  =

> > ----------------  --------------------------  =

> >          %stddev      change         %stddev
> >              \          |                \  =

> >  1.219e+08             -11%   1.09e+08        stress-ng.lockofd.ops_per=
_sec
> >  1.229e+08             -10%  1.103e+08        stress-ng.locka.ops_per_s=
ec
> >  1.233e+08             -10%  1.105e+08        stress-ng.locka.ops
> >  1.223e+08             -11%  1.093e+08        stress-ng.lockofd.ops
> >    1061237              10%    1168476        stress-ng.eventfd.ops
> >    1061205              10%    1168414        stress-ng.eventfd.ops_per=
_sec
> >    2913174               9%    3163165        stress-ng.time.voluntary_=
context_switches
> >      89.90              -4%      86.58        stress-ng.time.user_time
> >      26510              -6%      24822        stress-ng.io.ops
> >      26489              -6%      24798        stress-ng.io.ops_per_sec
> >     885499 =C2=B1 14%        18%    1042236        perf-stat.cpu-migrat=
ions
> >  2.537e+08              10%  2.783e+08        perf-stat.node-store-miss=
es
> >    1067830 =C2=B1  4%         8%    1154877 =C2=B1  3%  perf-stat.page-=
faults
> >    5384755 =C2=B1  4%         7%    5747689        perf-stat.context-sw=
itches
> >      32.28               7%      34.42 =C2=B1  3%  perf-stat.node-store=
-miss-rate%
> >      12245 =C2=B1110%     -7e+03       5367 =C2=B1 29%  latency_stats.a=
vg.call_usermodehelper_exec.__request_module.get_fs_type.do_mount.SyS_mount=
.entry_SYSCALL_64_fastpath
> >     311261 =C2=B1173%     -3e+05      11702 =C2=B1100%  latency_stats.a=
vg.tty_release_struct.tty_release.__fput.____fput.task_work_run.exit_to_use=
rmode_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpath
> >       1472 =C2=B1 60%      4e+03       5144 =C2=B1 97%  latency_stats.m=
ax.sync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_=
64_fastpath
> >        225 =C2=B1 39%      3e+03       3698 =C2=B1132%  latency_stats.m=
ax.rpc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv=
4].__nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].=
__put_nfs_open_context.nfs_file_clear_open_context.nfs_file_release.__fput.=
____fput.task_work_run
> >        228 =C2=B1 34%      3e+03       3103 =C2=B1159%  latency_stats.m=
ax.rpc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.=
[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.[nfsv4].nfs4_file_open.[nfsv4=
].do_dentry_open.vfs_open.path_openat.do_filp_open.do_sys_open.SyS_open
> >        270 =C2=B1 24%      3e+03       3110 =C2=B1162%  latency_stats.m=
ax.io_schedule.wait_on_page_bit_common.__filemap_fdatawait_range.filemap_wr=
ite_and_wait_range.nfs_file_fsync.vfs_fsync_range.vfs_fsync.nfs4_file_flush=
.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
> >      12245 =C2=B1110%     -7e+03       5367 =C2=B1 29%  latency_stats.m=
ax.call_usermodehelper_exec.__request_module.get_fs_type.do_mount.SyS_mount=
.entry_SYSCALL_64_fastpath
> >     927506 =C2=B1173%     -9e+05      11702 =C2=B1100%  latency_stats.m=
ax.tty_release_struct.tty_release.__fput.____fput.task_work_run.exit_to_use=
rmode_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpath
> >       7892 =C2=B1 54%      3e+04      33793 =C2=B1131%  latency_stats.s=
um.sync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_=
64_fastpath
> >      12030 =C2=B1109%      2e+04      33536 =C2=B1136%  latency_stats.s=
um.autofs4_wait.autofs4_mount_wait.autofs4_d_manage.follow_managed.lookup_f=
ast.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
> >      14311 =C2=B1 15%      7e+03      21729 =C2=B1116%  latency_stats.s=
um.call_rwsem_down_read_failed.page_lock_anon_vma_read.rmap_walk_anon.rmap_=
walk.try_to_unmap.migrate_pages.migrate_misplaced_page.__handle_mm_fault.ha=
ndle_mm_fault.__do_page_fault.do_page_fault.page_fault
> >       8095 =C2=B1 22%      7e+03      15421 =C2=B1 79%  latency_stats.s=
um.call_rwsem_down_read_failed.rmap_walk_anon.rmap_walk.remove_migration_pt=
es.migrate_pages.migrate_misplaced_page.__handle_mm_fault.handle_mm_fault._=
_do_page_fault.do_page_fault.page_fault
> >        495 =C2=B1 39%      7e+03       7470 =C2=B1131%  latency_stats.s=
um.rpc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_do_close.[nfsv=
4].__nfs4_close.[nfsv4].nfs4_close_sync.[nfsv4].nfs4_close_context.[nfsv4].=
__put_nfs_open_context.nfs_file_clear_open_context.nfs_file_release.__fput.=
____fput.task_work_run
> >       3449 =C2=B1 18%      7e+03      10001 =C2=B1 68%  latency_stats.s=
um.io_schedule.wait_on_page_bit_common.__filemap_fdatawait_range.filemap_fd=
atawait_keep_errors.sync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sy=
nc.entry_SYSCALL_64_fastpath
> >        378 =C2=B1123%      6e+03       6438 =C2=B1109%  latency_stats.s=
um.io_schedule.__lock_page.find_lock_entry.shmem_getpage_gfp.shmem_fault.__=
do_fault.__handle_mm_fault.handle_mm_fault.__do_page_fault.do_page_fault.pa=
ge_fault
> >        386 =C2=B1 34%      3e+03       3242 =C2=B1153%  latency_stats.s=
um.rpc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.=
[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_open.[nfsv4].nfs4_file_open.[nfsv4=
].do_dentry_open.vfs_open.path_openat.do_filp_open.do_sys_open.SyS_open
> >        413 =C2=B1 19%      3e+03       3256 =C2=B1156%  latency_stats.s=
um.io_schedule.wait_on_page_bit_common.__filemap_fdatawait_range.filemap_wr=
ite_and_wait_range.nfs_file_fsync.vfs_fsync_range.vfs_fsync.nfs4_file_flush=
.[nfsv4].filp_close.do_dup2.SyS_dup2.entry_SYSCALL_64_fastpath
> >       2874 =C2=B1173%     -3e+03          0        latency_stats.sum.ca=
ll_rwsem_down_write_failed.do_unlinkat.SyS_unlink.entry_SYSCALL_64_fastpath
> >       3683 =C2=B1172%     -4e+03          5 =C2=B1100%  latency_stats.s=
um.call_rwsem_down_read_failed.lookup_slow.walk_component.path_lookupat.fil=
ename_lookup.user_path_at_empty.SyS_chmod.entry_SYSCALL_64_fastpath
> >      12245 =C2=B1110%     -7e+03       5367 =C2=B1 29%  latency_stats.s=
um.call_usermodehelper_exec.__request_module.get_fs_type.do_mount.SyS_mount=
.entry_SYSCALL_64_fastpath
> >       7320 =C2=B1136%     -7e+03          0        latency_stats.sum.ca=
ll_rwsem_down_write_failed.do_truncate.do_sys_ftruncate.SyS_ftruncate.entry=
_SYSCALL_64_fastpath
> >      52297 =C2=B1124%     -3e+04      26320 =C2=B1 16%  latency_stats.s=
um.call_rwsem_down_read_failed.lookup_slow.walk_component.link_path_walk.pa=
th_parentat.filename_parentat.do_unlinkat.SyS_unlink.entry_SYSCALL_64_fastp=
ath
> >      64452 =C2=B1 83%     -3e+04      31383 =C2=B1 30%  latency_stats.s=
um.call_rwsem_down_write_failed.do_rmdir.SyS_rmdir.entry_SYSCALL_64_fastpath
> >    1867567 =C2=B1173%     -2e+06      11702 =C2=B1100%  latency_stats.s=
um.tty_release_struct.tty_release.__fput.____fput.task_work_run.exit_to_use=
rmode_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpath
> > =

> > =

> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> > =

> > =

> > Thanks,
> > Xiaolong

--===============9018730132445012933==--

