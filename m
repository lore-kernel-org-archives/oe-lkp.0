Content-Type: multipart/mixed; boundary="===============1523135293474137474=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 60f7ed8c7c: will-it-scale.per_thread_ops -5.9% regression
Date: Thu, 18 Oct 2018 17:22:59 +0800
Message-ID: <20181018092259.GE16117@shao2-debian>
In-Reply-To: <CAOQ4uxi-xfukNt0dHMrjokcXJ9keeaD9Xx9Q4DHRv_SH_YcQXQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1523135293474137474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 15, 2018 at 03:26:13PM +0300, Amir Goldstein wrote:
> On Mon, Oct 15, 2018 at 12:27 PM Amir Goldstein <amir73il@gmail.com> wr=
ote:
> >
> > On Mon, Oct 15, 2018 at 10:50 AM Rong Chen <rong.a.chen@intel.com> wr=
ote:
> > [...]
> > > the patch seems not work.
> > >
> > > tests: 1
> > > testcase/path_params/tbox_group/run: will-it-scale/16-thread-unlink2-=
performance/lkp-bdw-ep3d
> > >
> > >  commit:
> > >    1e6cb72399 ("fsnotify: add super block object type")
> > >    298cd0b2f4 (the below patch)
> > >
> > > 1e6cb72399fd58b3  298cd0b2f481d9cc2e2cd5bfd3
> > > ----------------  --------------------------
> > >          %stddev      change         %stddev
> > >              \          |                \
> > >     103.21              -5%      98.54        will-it-scale.time.user=
_time
> > >      46266              -6%      43516        will-it-scale.time.invo=
luntary_context_switches
> > >      54483              -7%      50610        will-it-scale.per_threa=
d_ops
> > >     871749              -7%     809765        will-it-scale.workload
> >
> > Thanks for testing my patch. As Jan commented, it is not surprising
> > that the patch
> > makes no difference.
> >
> > I would like to clarify a few things about how you ran the test before
> > I continue to
> > investigate:
> >
> > 1. When I ran the workload I saw that it writes files to whatever files=
ystem is
> >     mounted on /tmp. Can I assume you have tmpfs mounted at /tmp?
yes, it's tmpfs

> >
> > 2. Can you confirm that there is no fanotify mount mark on the /tmp mou=
nt?
> >     for example:
> > # ls -l /proc/*/fd/*|grep fanotify
> > lrwx------ 1 root root 64 Oct 15 08:36 /proc/3927/fd/3 -> anon_inode:[f=
anotify]
> > # grep fanotify.mnt_id /proc/3927/fdinfo/3
> > fanotify mnt_id:33 mflags:0 mask:3b ignored_mask:0
> > # grep ^$(( 0x33 )) /proc/3927/mountinfo
> > 51 16 0:27 / /tmp rw,relatime shared:18 - tmpfs tmpfs rw
no fanotify mount

> >
> > 3. I saw that LKP caches the results for a specific commit
> >     (i.e. 1e6cb72399 ("fsnotify: add super block object type")).
> > Did you use cached results when comparing to patch or did you re-run the
> > test with the "good" commit? The reason I am asking is because
> > sometimes performance result may differ between boots even with no
> > kernel code change.
> > Where all the "good" bisect samples taken from the same boot/machine?
> > or different boots/machines?
from the same boot/machine, the only difference is the commit.

> >
> > 4. If this regression is reliably reproduced, then our best bet is on t=
he
> > cost of access to s_fsnotify_{marks,mask} fields.
> > The patch below moves those frequently accessed fields near the
> > frequently accessed fields s_time_gran,s_writers and moves
> > the seldom accessed fields s_id,s_uuid further away.
> > Could you please try this patch?
> >
> =

> Better test this patch instead. It does a bit more re-organizing.
> If this works well for 16-thread-unlink2 workload, could you please
> also run it through other workloads to see if it improves them as well?
> and does not degrade them...


the patch looks good.

tests: 1
testcase/path_params/tbox_group/run: will-it-scale/16-thread-unlink2-perfor=
mance/lkp-bdw-ep3d

1e6cb72399fd58b3  bfb397545bb4d4bbca5ffb5e52  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

     81035              -8%      74707        interrupts.CAL:Function_call_=
interrupts
       137                         135        turbostat.PkgWatt
      1507              -8%       1382        vmstat.system.cs
    452379              -8%     414960        perf-stat.context-switches
  1.02e+08 =C2=B1  5%       -17%   84231388 =C2=B1  7%  perf-stat.dTLB-stor=
e-misses
      0.01 =C2=B1  7%       -20%       0.01 =C2=B1  7%  perf-stat.dTLB-stor=
e-miss-rate%
      3937              52%       5968        proc-vmstat.nr_zone_inactive_=
anon
      3937              52%       5968        proc-vmstat.nr_inactive_anon
      8101 =C2=B1  7%        17%       9456 =C2=B1  7%  proc-vmstat.nr_shmem
      6766              13%       7662        proc-vmstat.nr_mapped
     18520                       18807        proc-vmstat.nr_slab_reclaimab=
le
      4784                        4724        proc-vmstat.numa_other
         0            9e+05     917236 =C2=B1119%  latency_stats.avg.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      3597 =C2=B1 18%      9e+05     919831 =C2=B1118%  latency_stats.avg.m=
ax
       269 =C2=B1 81%      8e+03       8196 =C2=B1217%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup_revalidate.lookup_fast.walk_component.link_=
path_walk.path_lookupat.filename_lookup
         0            7e+03       6926 =C2=B1185%  latency_stats.avg.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
         0            9e+05     929948 =C2=B1116%  latency_stats.max.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
      4934            9e+05     932944 =C2=B1116%  latency_stats.max.max
       300 =C2=B1 86%      2e+04      16025 =C2=B1222%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup_revalidate.lookup_fast.walk_component.link_=
path_walk.path_lookupat.filename_lookup
         0            7e+03       6926 =C2=B1185%  latency_stats.max.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
         0            1e+06    1209492 =C2=B1123%  latency_stats.sum.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
     10126 =C2=B1 27%      2e+04      32104 =C2=B1 72%  latency_stats.sum.d=
o_syslog.kmsg_read.proc_reg_read.__vfs_read.vfs_read.ksys_read.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
       663 =C2=B1113%      2e+04      16393 =C2=B1217%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup_revalidate.lookup_fast.walk_component.link_=
path_walk.path_lookupat.filename_lookup
         0            7e+03       6926 =C2=B1185%  latency_stats.sum.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
      2357 =C2=B1 62%      3e+03       5243 =C2=B1123%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_getattr.__nfs_revalidate_inode.nfs_do_access.nfs_permission.i=
node_permission.link_path_walk.path_lookupat

Best Regards,
Rong Chen


> =

> Thanks,
> Amir.
> =

> ---
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 25a449f37bb1..baec0b3ff53f 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1393,17 +1393,24 @@ struct super_block {
> =

>         struct sb_writers       s_writers;
> =

> +       /* START frequently accessed fields block */
> +       void                    *s_fs_info;     /* Filesystem private inf=
o */
> +
> +       /* Granularity of c/m/atime in ns (cannot be worse than a second)=
 */
> +       u32                     s_time_gran;
> +#ifdef CONFIG_FSNOTIFY
> +       __u32                   s_fsnotify_mask;
> +       struct fsnotify_mark_connector __rcu    *s_fsnotify_marks;
> +#endif
> +       /* END frequently accessed fields block */
> +
> +       /* START seldom accessed fields block */
>         char                    s_id[32];       /* Informational name */
>         uuid_t                  s_uuid;         /* UUID */
> =

> -       void                    *s_fs_info;     /* Filesystem private inf=
o */
>         unsigned int            s_max_links;
>         fmode_t                 s_mode;
> =

> -       /* Granularity of c/m/atime in ns.
> -          Cannot be worse than a second */
> -       u32                s_time_gran;
> -
>         /*
>          * The next field is for VFS *only*. No filesystems have any busi=
ness
>          * even looking at it. You had been warned.
> @@ -1415,6 +1422,7 @@ struct super_block {
>          * in /proc/mounts will be "type.subtype"
>          */
>         char *s_subtype;
> +       /* END seldom accessed fields block */
> =

>         const struct dentry_operations *s_d_op; /* default d_op for dentr=
ies */
> =

> @@ -1464,11 +1472,6 @@ struct super_block {
> =

>         spinlock_t              s_inode_wblist_lock;
>         struct list_head        s_inodes_wb;    /* writeback inodes */
> -
> -#ifdef CONFIG_FSNOTIFY
> -       __u32                   s_fsnotify_mask;
> -       struct fsnotify_mark_connector __rcu    *s_fsnotify_marks;
> -#endif
>  } __randomize_layout;

--===============1523135293474137474==--

