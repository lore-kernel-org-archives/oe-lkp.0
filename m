Content-Type: multipart/mixed; boundary="===============1856217508968902960=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 60f7ed8c7c: will-it-scale.per_thread_ops -5.9% regression
Date: Mon, 15 Oct 2018 15:51:01 +0800
Message-ID: <20181015075101.GE28215@shao2-debian>
In-Reply-To: <20181001092549.GC3913@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1856217508968902960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 01, 2018 at 11:25:49AM +0200, Jan Kara wrote:
> On Sun 30-09-18 12:16:45, Amir Goldstein wrote:
> > On Sun, Sep 30, 2018 at 12:00 PM Amir Goldstein <amir73il@gmail.com> =
wrote:
> > >
> > > On Sun, Sep 30, 2018 at 9:50 AM kernel test robot <rong.a.chen@inte=
l.com> wrote:
> > > >
> > > > Greeting,
> > > >
> > > > FYI, we noticed a -5.9% regression of will-it-scale.per_thread_ops =
due to commit:
> > > >
> > > >
> > > > commit: 60f7ed8c7c4d06aeda448c6da74621552ee739aa ("fsnotify: send p=
ath type events to group with super block marks")
> > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git ma=
ster
> > > >
> > > > in testcase: will-it-scale
> > > > on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20G=
Hz with 64G memory
> > > > with following parameters:
> > > >
> > > >         nr_task: 16
> > > >         mode: thread
> > > >         test: unlink2
> > > >         cpufreq_governor: performance
> > > >
> > > > test-description: Will It Scale takes a testcase and runs it from 1=
 through to n parallel copies to see if the testcase will scale. It builds =
both a process and threads based test in order to see any differences betwe=
en the two.
> > > > test-url: https://github.com/antonblanchard/will-it-scale
> > > >
> > > >
> > > >
> > > > Details are as below:
> > > > -------------------------------------------------------------------=
------------------------------->
> > > >
> > > >
> > > > To reproduce:
> > > >
> > > >         git clone https://github.com/intel/lkp-tests.git
> > > >         cd lkp-tests
> > > >         bin/lkp install job.yaml  # job file is attached in this em=
ail
> > > >         bin/lkp run     job.yaml
> > > >
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/te=
st/testcase:
> > > >   gcc-7/performance/x86_64-rhel-7.2/thread/16/debian-x86_64-2018-04=
-03.cgz/lkp-bdw-ep3d/unlink2/will-it-scale
> > > >
> > > > commit:
> > > >   1e6cb72399 ("fsnotify: add super block object type")
> > > >   60f7ed8c7c ("fsnotify: send path type events to group with super =
block marks")
> > > >
> > >
> > > I have to admit this looks strange.
> > > All this commit does is dereference mnt->mnt.mnt_sb and then
> > > sb->s_fsnotify_mask/sb->s_fsnotify_marks to find that they are zero.
> > > AFAICT there should be no extra contention added by this commit and i=
t's
> > > hard to believe that parallel unlink workload would suffer from this =
change.
> > >
> > > I will try to install lkp-tests to verify this on my own system, but
> > > until proven
> > > otherwise I will regard this as false positive.
> > >
> > =

> > Actually, is it possible to ask for a private test with the following p=
atch
> > to optimize out an unneeded srcu_derefence().
> > This optimization (assuming it is correct) could in fact improve scaling
> > compared to upstream, because there are already 2 calls to
> > fsnotify_first_mark in the code. The blamed commit just adds a 3rd one.
> =

> I'd be surprised if your patch actually changed anything. On x86,
> srcu_dereference(foo) is just READ_ONCE(foo) and that is just a syntactic
> suggar around foo to make sure compiler really fetches the value from
> memory to a register only once... But it's probably worth a try.
> =

> > I am assuming that() in the test there is an fsnotify mount mark (maybe=
 setup
> > by systemd) otherwise, the optimization in line 351 would have not reac=
hed
> > the extra fsnotify_first_mark() call.
> > Can you confirm or disprove the assumption that an fanotify mount mark
> > is present during the test?
> =

> This would be good to know.
> =

> 								Honza
> =


the patch seems not work.

tests: 1
testcase/path_params/tbox_group/run: will-it-scale/16-thread-unlink2-perfor=
mance/lkp-bdw-ep3d

 commit:
   1e6cb72399 ("fsnotify: add super block object type")
   298cd0b2f4 (the below patch)

1e6cb72399fd58b3  298cd0b2f481d9cc2e2cd5bfd3  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

    103.21              -5%      98.54        will-it-scale.time.user_time
     46266              -6%      43516        will-it-scale.time.involuntar=
y_context_switches
     54483              -7%      50610        will-it-scale.per_thread_ops
    871749              -7%     809765        will-it-scale.workload
     81035              -8%      74637        interrupts.CAL:Function_call_=
interrupts
      1507             -10%       1352        vmstat.system.cs
       137              -3%        133        turbostat.PkgWatt
     11.88              -3%      11.48        turbostat.RAMWatt
    103.21              -5%      98.54        time.user_time
     46266              -6%      43516        time.involuntary_context_swit=
ches
      3937              52%       5966        proc-vmstat.nr_zone_inactive_=
anon
      3937              52%       5966        proc-vmstat.nr_inactive_anon
      8101 =C2=B1  7%        25%      10150 =C2=B1  7%  proc-vmstat.nr_shmem
      6766              13%       7643        proc-vmstat.nr_mapped
     18520                       18264        proc-vmstat.nr_slab_reclaimab=
le
      4784                        4718        proc-vmstat.numa_other
     51497              -3%      49951        proc-vmstat.nr_slab_unreclaim=
able
  69383484              -8%   64068164        proc-vmstat.pgalloc_normal
  69362606              -8%   64047064        proc-vmstat.pgfree
  20375718              -8%   18798113        proc-vmstat.numa_hit
  20370933              -8%   18793395        proc-vmstat.numa_local
      3597 =C2=B1 18%      8e+05     759763 =C2=B1 94%  latency_stats.avg.m=
ax
         0            4e+05     398652 =C2=B1137%  latency_stats.avg.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
       610 =C2=B1129%      4e+05     356880 =C2=B1199%  latency_stats.avg.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup.__lookup_slow.lookup_slow.walk_component.pa=
th_lookupat.filename_lookup
         0            7e+03       7305 =C2=B1 82%  latency_stats.avg.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
      4934            1e+06    1039118 =C2=B1104%  latency_stats.max.max
         0            7e+05     678006 =C2=B1159%  latency_stats.max.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
       610 =C2=B1129%      4e+05     356880 =C2=B1199%  latency_stats.max.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup.__lookup_slow.lookup_slow.walk_component.pa=
th_lookupat.filename_lookup
         0            7e+03       7305 =C2=B1 82%  latency_stats.max.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
         0            7e+05     678057 =C2=B1159%  latency_stats.sum.io_sch=
edule.nfs_lock_and_join_requests.nfs_updatepage.nfs_write_end.generic_perfo=
rm_write.nfs_file_write.__vfs_write.vfs_write.ksys_write.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
       610 =C2=B1129%      4e+05     356880 =C2=B1199%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_lookup.nfs_lookup.__lookup_slow.lookup_slow.walk_component.pa=
th_lookupat.filename_lookup
     10126 =C2=B1 27%      2e+04      30936 =C2=B1 67%  latency_stats.sum.d=
o_syslog.kmsg_read.proc_reg_read.__vfs_read.vfs_read.ksys_read.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
         0            7e+03       7305 =C2=B1 82%  latency_stats.sum.rpc_wa=
it_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrapper.n=
fs3_do_create.nfs3_proc_create.nfs_create.path_openat.do_filp_open.do_sys_o=
pen.do_syscall_64
      2357 =C2=B1 62%      2e+03       3954 =C2=B1137%  latency_stats.sum.r=
pc_wait_bit_killable.__rpc_execute.rpc_run_task.rpc_call_sync.nfs3_rpc_wrap=
per.nfs3_proc_getattr.__nfs_revalidate_inode.nfs_do_access.nfs_permission.i=
node_permission.link_path_walk.path_lookupat
      0.02 =C2=B1 10%        38%       0.03 =C2=B1  6%  perf-stat.dTLB-load=
-miss-rate%
 3.025e+08 =C2=B1  8%        34%  4.051e+08 =C2=B1  5%  perf-stat.dTLB-load=
-misses
 1.159e+09 =C2=B1 12%        19%  1.378e+09        perf-stat.iTLB-loads
   6419017               5%    6749627        perf-stat.path-length
 1.603e+12                   1.556e+12        perf-stat.dTLB-loads
 9.269e+11              -7%  8.605e+11        perf-stat.dTLB-stores
      1.36              -9%       1.24        perf-stat.branch-miss-rate%
  3.66e+09              -9%  3.315e+09 =C2=B1  3%  perf-stat.node-store-mis=
ses
 1.546e+10             -10%  1.395e+10        perf-stat.branch-misses
 2.464e+09 =C2=B1  3%       -10%  2.215e+09        perf-stat.node-stores
    452379             -10%     406483        perf-stat.context-switches
 3.376e+10 =C2=B1  8%       -11%  3.011e+10 =C2=B1  7%  perf-stat.cache-mis=
ses
 7.665e+10 =C2=B1  6%       -11%  6.828e+10 =C2=B1  5%  perf-stat.cache-ref=
erences
  6.92e+08 =C2=B1  5%       -14%   5.95e+08 =C2=B1  6%  perf-stat.node-loads
      0.01 =C2=B1  7%       -29%       0.01 =C2=B1  8%  perf-stat.dTLB-stor=
e-miss-rate%
  1.02e+08 =C2=B1  5%       -34%   67414218 =C2=B1  9%  perf-stat.dTLB-stor=
e-misses

Best Regards,
Rong Chen

> > ----
> > diff --git a/fs/notify/fsnotify.c b/fs/notify/fsnotify.c
> > index 422fbc6dffde..8d45d82e09ff 100644
> > --- a/fs/notify/fsnotify.c
> > +++ b/fs/notify/fsnotify.c
> > @@ -246,6 +246,9 @@ static struct fsnotify_mark
> > *fsnotify_first_mark(struct fsnotify_mark_connector
> >         struct fsnotify_mark_connector *conn;
> >         struct hlist_node *node =3D NULL;
> > =

> > +       if (!*connp)
> > +               return NULL;
> > +
> >         conn =3D srcu_dereference(*connp, &fsnotify_mark_srcu);
> >         if (conn)
> >                 node =3D srcu_dereference(conn->list.first, &fsnotify_m=
ark_srcu);
> -- =

> Jan Kara <jack@suse.com>
> SUSE Labs, CR

--===============1856217508968902960==--

