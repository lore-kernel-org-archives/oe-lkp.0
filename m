Content-Type: multipart/mixed; boundary="===============7340293149418283085=="
MIME-Version: 1.0
From: Andreas Grünbacher <andreas.gruenbacher@gmail.com>
To: lkp@lists.01.org
Subject: Re: [selinux] 5d226df4ed: -10.1% unixbench.score
Date: Mon, 04 Jan 2016 23:27:59 +0100
Message-ID: <CAHpGcMJzMYqStQ0c0ib-8FdV2hwv44HQVpYzasttBVLxhhPy+w@mail.gmail.com>
In-Reply-To: <87twn32v0p.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7340293149418283085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2015-12-28 2:59 GMT+01:00 kernel test robot <ying.huang@linux.intel.com>:
> FYI, we noticed the below changes on
>
> git://git.infradead.org/users/pcmoore/selinux stable-4.5
> commit 5d226df4edfa0eb1e689e7ac2741cf261ff7cbf1 ("selinux: Revalidate inv=
alid inode security labels")
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/ivb42/pi=
pe/unixbench
>
> commit:
>   6f3be9f562e3027c77bc4482ccf2cea8600a7f74
>   5d226df4edfa0eb1e689e7ac2741cf261ff7cbf1
>
> 6f3be9f562e3027c 5d226df4edfa0eb1e689e7ac27
> ---------------- --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       2086 =C2=B1  0%     -10.1%       1876 =C2=B1  0%  unixbench.score
>       7.79 =C2=B1  0%     -10.2%       7.00 =C2=B1  1%  time.user_time
>      33404 =C2=B1117%   +9470.5%    3196941 =C2=B1173%  latency_stats.max=
.wait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_f=
astpath
>      18934 =C2=B1 34%     -82.8%       3252 =C2=B1 73%  latency_stats.sum=
.rpc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_syn=
c_sequence.[nfsv4]._nfs4_proc_access.[nfsv4].nfs4_proc_access.[nfsv4].nfs_d=
o_access.nfs_permission.__inode_permission.inode_permission.link_path_walk
>      57519 =C2=B1100%   +5478.5%    3208706 =C2=B1172%  latency_stats.sum=
.wait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_f=
astpath
>      13414 =C2=B1 33%     +49.4%      20036 =C2=B1  8%  numa-meminfo.node=
0.Active(anon)
>      13399 =C2=B1 33%     +49.0%      19963 =C2=B1  7%  numa-meminfo.node=
0.AnonPages
>      11624 =C2=B1 38%     -52.7%       5495 =C2=B1 18%  numa-meminfo.node=
1.Active(anon)
>      11518 =C2=B1 38%     -52.6%       5457 =C2=B1 17%  numa-meminfo.node=
1.AnonPages
>       1641 =C2=B1 50%     -53.8%     757.75 =C2=B1 15%  numa-meminfo.node=
1.PageTables
>       3353 =C2=B1 33%     +49.2%       5004 =C2=B1  8%  numa-vmstat.node0=
.nr_active_anon
>       3349 =C2=B1 33%     +49.0%       4991 =C2=B1  7%  numa-vmstat.node0=
.nr_anon_pages
>       2904 =C2=B1 38%     -52.7%       1374 =C2=B1 18%  numa-vmstat.node1=
.nr_active_anon
>       2878 =C2=B1 38%     -52.6%       1365 =C2=B1 17%  numa-vmstat.node1=
.nr_anon_pages
>     410.00 =C2=B1 50%     -53.9%     189.00 =C2=B1 15%  numa-vmstat.node1=
.nr_page_table_pages
>      14760 =C2=B1  2%    +207.2%      45336 =C2=B1 65%  numa-vmstat.node1=
.numa_other
>
>
> ivb42: Ivytown Ivy Bridge-EP
> Memory: 64G
>
>
>
>                                   unixbench.score
>
>   2150 ++----------------------------------------------------------------=
---+
>        |                                                                 =
   |
>   2100 ++              .*..*.*..                                         =
   |
>        |          .*..*         *.*..*.                   .*.*..*.*      =
   |
>        *.*..*.*..*                     *..*.*.*..*.*..*.*.               =
   |
>   2050 ++                                                                =
   |
>        |                                                                 =
   |
>   2000 ++                                                                =
   |
>        |                                                                 =
   |
>   1950 ++                                                                =
   |
>        |                                                                 =
   |
>        O O  O O  O      O    O  O O  O O  O O O                          =
   |
>   1900 ++          O  O    O                     O O  O O  O O  O O      =
   |
>        |                                                             O O =
 O O
>   1850 ++----------------------------------------------------------------=
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

--===============7340293149418283085==--

