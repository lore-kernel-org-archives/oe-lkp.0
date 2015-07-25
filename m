Content-Type: multipart/mixed; boundary="===============7216981177960946205=="
MIME-Version: 1.0
From: Konstantin Khlebnikov <koct9i@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched/preempt] 103637a5b94: 12.4% fsmark.app_overhead, -1.4% fsmark.files_per_sec
Date: Sat, 25 Jul 2015 19:32:03 +0300
Message-ID: <CALYGNiNtLYwts6mu5-yTZTJ_7-FDym=bbtzUv-pmX5yhHWfRuA@mail.gmail.com>
In-Reply-To: <87si8cahvi.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7216981177960946205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I guess that's because of cond_resched_lock() usage in nfs_scan_commit_list=
().
My patch fixes cond_resched_lock() which never worked since v3.13.

On Sat, Jul 25, 2015 at 9:09 AM, kernel test robot <ying.huang@intel.com>=
 wrote:
> FYI, we noticed the below changes on
>
> git://internal_merge_and_test_tree revert-103637a5b947af7e6abb8d19b341acf=
f6fbf1ec3-103637a5b947af7e6abb8d19b341acff6fbf1ec3
> commit 103637a5b947af7e6abb8d19b341acff6fbf1ec3 ("sched/preempt: Fix cond=
_resched_lock() and cond_resched_softirq()")
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/n=
r_threads/disk/fs/fs2/filesize/test_size/sync_method/nr_directories/nr_file=
s_per_directory:
>   nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performanc=
e/1x/32t/1HDD/f2fs/nfsv4/9B/400M/fsyncBeforeClose/16d/256fpd
>
> commit:
>   834b9279b37ad019272ff140497b1e07ab52d124
>   103637a5b947af7e6abb8d19b341acff6fbf1ec3
>
> 834b9279b37ad019 103637a5b947af7e6abb8d19b3
> ---------------- --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>   10808007 =C2=B1  2%     +12.4%   12147111 =C2=B1  3%  fsmark.app_overhe=
ad
>     348.95 =C2=B1  0%      -1.4%     343.95 =C2=B1  0%  fsmark.files_per_=
sec
>     292.92 =C2=B1  0%      +1.8%     298.06 =C2=B1  0%  fsmark.time.elaps=
ed_time
>     292.92 =C2=B1  0%      +1.8%     298.06 =C2=B1  0%  fsmark.time.elaps=
ed_time.max
>     103928 =C2=B1  0%     +13.9%     118415 =C2=B1  0%  fsmark.time.invol=
untary_context_switches
>     468477 =C2=B1  0%      -2.2%     458135 =C2=B1  0%  fsmark.time.volun=
tary_context_switches
>     103928 =C2=B1  0%     +13.9%     118415 =C2=B1  0%  time.involuntary_=
context_switches
>      16609 =C2=B1  0%      -2.1%      16267 =C2=B1  0%  vmstat.system.in
>    4527868 =C2=B1  2%     +25.9%    5698416 =C2=B1  2%  latency_stats.sum=
.rpc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_syn=
c_sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4=
].nfs4_proc_lookup.[nfsv4].nfs_lookup_revalidate.nfs4_lookup_revalidate.loo=
kup_dcache.__lookup_hash
>  2.317e+09 =C2=B1  0%      +5.5%  2.444e+09 =C2=B1  0%  latency_stats.sum=
.rpc_wait_bit_killable.__rpc_wait_for_completion_task.nfs4_run_open_task.[n=
fsv4]._nfs4_open_and_get_state.[nfsv4].nfs4_do_open.[nfsv4].nfs4_atomic_ope=
n.[nfsv4].nfs_atomic_open.path_openat.do_filp_open.do_sys_open.SyS_open.ent=
ry_SYSCALL_64_fastpath
>  1.548e+09 =C2=B1  0%      +2.9%  1.593e+09 =C2=B1  0%  latency_stats.sum=
.wait_on_page_bit.filemap_fdatawait_range.filemap_write_and_wait_range.nfs4=
_file_fsync.[nfsv4].vfs_fsync_range.do_fsync.SyS_fsync.entry_SYSCALL_64_fas=
tpath
>  3.399e+08 =C2=B1  1%     +19.0%  4.043e+08 =C2=B1  2%  cpuidle.C1-NHM.ti=
me
>   82737781 =C2=B1  0%     +24.8%  1.032e+08 =C2=B1  0%  cpuidle.C1E-NHM.t=
ime
>     141228 =C2=B1  0%     +23.4%     174263 =C2=B1  0%  cpuidle.C1E-NHM.u=
sage
>     128964 =C2=B1154%    +209.1%     398639 =C2=B1 26%  cpuidle.POLL.time
>       3.47 =C2=B1  0%      -2.5%       3.38 =C2=B1  0%  turbostat.%Busy
>     110.25 =C2=B1  0%      -2.0%     108.00 =C2=B1  0%  turbostat.Avg_MHz
>      32.94 =C2=B1  0%     +14.4%      37.69 =C2=B1  1%  turbostat.CPU%c1
>      32.26 =C2=B1  1%     -11.3%      28.62 =C2=B1  1%  turbostat.CPU%c3
>      -2795 =C2=B1 -9%     -19.2%      -2258 =C2=B1 -4%  sched_debug.cfs_r=
q[1]:/.spread0
>       3273 =C2=B1  4%     +29.9%       4250 =C2=B1 10%  sched_debug.cfs_r=
q[5]:/.avg->runnable_avg_sum
>      70.25 =C2=B1  4%     +29.5%      91.00 =C2=B1 10%  sched_debug.cfs_r=
q[5]:/.tg_runnable_contrib
>      -2687 =C2=B1  0%     -14.1%      -2308 =C2=B1 -2%  sched_debug.cpu#0=
.nr_uninterruptible
>     333314 =C2=B1 74%     -46.7%     177695 =C2=B1  3%  sched_debug.cpu#0=
.ttwu_count
>     318.25 =C2=B1 11%     -41.3%     186.75 =C2=B1  6%  sched_debug.cpu#1=
.nr_uninterruptible
>     331.50 =C2=B1  9%     -16.0%     278.50 =C2=B1 11%  sched_debug.cpu#2=
.nr_uninterruptible
>     172.25 =C2=B1 21%     +63.6%     281.75 =C2=B1 14%  sched_debug.cpu#3=
.nr_uninterruptible
>     753.75 =C2=B1  2%     +38.7%       1045 =C2=B1  4%  sched_debug.cpu#4=
.nr_uninterruptible
>     839497 =C2=B1169%     -98.0%      16681 =C2=B1  1%  sched_debug.cpu#4=
.ttwu_local
>     392.00 =C2=B1  3%     -50.6%     193.50 =C2=B1 12%  sched_debug.cpu#5=
.nr_uninterruptible
>      12.50 =C2=B1 35%    +272.0%      46.50 =C2=B1 73%  sched_debug.cpu#6=
.cpu_load[0]
>     385.00 =C2=B1  7%     -53.0%     181.00 =C2=B1  8%  sched_debug.cpu#6=
.nr_uninterruptible
>     362.00 =C2=B1  2%     -53.8%     167.25 =C2=B1 15%  sched_debug.cpu#7=
.nr_uninterruptible
>
>
> nhm4: Nehalem
> Memory: 4G
>
>
>                                fsmark.files_per_sec
>
>   352 *+-*-------------------------*-----*--*----------------------------=
---+
>   351 ++    *..                  .. :   :    :                           =
   |
>       |        .                .    :  :     :                          =
   |
>   350 ++        *..           .*     : :      :                          =
   |
>   349 ++           *..*..*..*.        *        *...*..*..*               =
   |
>       |                                                                  =
   |
>   348 ++                                                                 =
   |
>   347 ++                                                                 =
   |
>   346 ++                                                                 =
   |
>       O     O               O  O      O     O         O           O      =
   |
>   345 ++ O                                                     O         =
   O
>   344 ++              O  O         O                                     =
   |
>       |                                                                  =
   |
>   343 ++        O  O                     O     O   O     O  O         O  =
O  |
>   342 ++-----------------------------------------------------------------=
---+
>
>
>                              fsmark.time.elapsed_time
>
>   299 ++-----------------------------------------------------------------=
---+
>       |         O  O                     O     O   O     O  O         O  =
O  |
>   298 ++ O            O  O         O        O         O        O  O      =
   O
>   297 O+                    O  O      O                                  =
   |
>       |     O                                                            =
   |
>   296 ++                                                                 =
   |
>   295 ++                                                                 =
   |
>       |                                                                  =
   |
>   294 ++           *..*..                                                =
   |
>   293 ++         ..      *..                   *...*..*..                =
   |
>       *..   *...*           *..*...  .*..     +          *               =
   |
>   292 ++  ..                       *.    *.. +                           =
   |
>   291 ++ *                                  *                            =
   |
>       |                                                                  =
   |
>   290 ++-----------------------------------------------------------------=
---+
>
>
>                            fsmark.time.elapsed_time.max
>
>   299 ++-----------------------------------------------------------------=
---+
>       |         O  O                     O     O   O     O  O         O  =
O  |
>   298 ++ O            O  O         O        O         O        O  O      =
   O
>   297 O+                    O  O      O                                  =
   |
>       |     O                                                            =
   |
>   296 ++                                                                 =
   |
>   295 ++                                                                 =
   |
>       |                                                                  =
   |
>   294 ++           *..*..                                                =
   |
>   293 ++         ..      *..                   *...*..*..                =
   |
>       *..   *...*           *..*...  .*..     +          *               =
   |
>   292 ++  ..                       *.    *.. +                           =
   |
>   291 ++ *                                  *                            =
   |
>       |                                                                  =
   |
>   290 ++-----------------------------------------------------------------=
---+
>
>
>                        fsmark.time.voluntary_context_switches
>
>   470000 ++--------------------------------*-----------------------------=
---+
>          |                          *..*.     *..  .*..*..*              =
   |
>   468000 *+.*..*..  .*..*..*..    ..             *.                      =
   |
>   466000 ++       *.            .*                                       =
   |
>          |                    *.                                         =
   |
>   464000 ++                                                              =
   |
>          |                                                               =
   |
>   462000 ++                                                              =
   |
>          |                                                               =
   |
>   460000 ++                                                              =
   |
>   458000 ++                                            O  O  O  O  O  O  =
O  O
>          |        O  O     O  O  O  O  O            O                    =
   |
>   456000 O+ O  O        O                  O  O  O                       =
   |
>          |                                                               =
   |
>   454000 ++--------------------------------------------------------------=
---+
>
>
>                       fsmark.time.involuntary_context_switches
>
>   120000 ++--------------------------------------------------------------=
---+
>          |                                             O  O     O  O  O  =
   O
>   118000 O+ O        O           O               O  O        O           =
O  |
>   116000 ++    O  O     O  O  O     O  O   O  O                          =
   |
>          |                                                               =
   |
>   114000 ++                                                              =
   |
>   112000 ++                                                              =
   |
>          |                                                               =
   |
>   110000 ++                                                              =
   |
>   108000 ++                                                              =
   |
>          |                                                               =
   |
>   106000 ++                                                              =
   |
>   104000 *+.*..*..*..*..           .*..*...*..*..     .*..*              =
   |
>          |              *..*..*..*.              *..*.                   =
   |
>   102000 ++--------------------------------------------------------------=
---+
>
>
>                           time.involuntary_context_switches
>
>   120000 ++--------------------------------------------------------------=
---+
>          |                                             O  O     O  O  O  =
   O
>   118000 O+ O        O           O               O  O        O           =
O  |
>   116000 ++    O  O     O  O  O     O  O   O  O                          =
   |
>          |                                                               =
   |
>   114000 ++                                                              =
   |
>   112000 ++                                                              =
   |
>          |                                                               =
   |
>   110000 ++                                                              =
   |
>   108000 ++                                                              =
   |
>          |                                                               =
   |
>   106000 ++                                                              =
   |
>   104000 *+.*..*..*..*..           .*..*...*..*..     .*..*              =
   |
>          |              *..*..*..*.              *..*.                   =
   |
>   102000 ++--------------------------------------------------------------=
---+
>
>
>         [*] bisect-good sample
>         [O] bisect-bad  sample
>
> To reproduce:
>
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
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
> Ying Huang

--===============7216981177960946205==--

