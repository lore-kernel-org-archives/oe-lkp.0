Content-Type: multipart/mixed; boundary="===============0949385308984698200=="
MIME-Version: 1.0
From: Chao Yu <chao2.yu@samsung.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] b9d777b85f: No primary result change, +18023.3% latency_stats.sum.call_rwsem_down_read_failed.f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write.vfs_writ
Date: Thu, 14 Jan 2016 11:50:35 +0800
Message-ID: <011401d14e7e$d4900870$7db01950$@samsung.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0949385308984698200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

> -----Original Message-----
> From: kernel test robot [mailto:ying.huang(a)linux.intel.com]
> Sent: Thursday, January 14, 2016 10:53 AM
> To: Jaegeuk Kim
> Cc: lkp(a)01.org; LKML; Chao Yu
> Subject: [lkp] [f2fs] b9d777b85f: No primary result change, +18023.3%
> latency_stats.sum.call_rwsem_down_read_failed.f2fs_write_begin.[f2fs].gen=
eric_perform_writ
> e.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.=
[f2fs].__vfs_writ
> e.vfs_write.Sy
> =

> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs dev-test
> commit b9d777b85ff1ff79a1173190317b25bebc404ab4 ("f2fs: check inline_data=
 flag at converting
> time")
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/disk/filesize/fs/iterations/kconfig/nr_directories/nr_files_per_=
directory/nr_thre
> ads/rootfs/sync_method/tbox_group/test_size/testcase:
> =

> gcc-4.9/1HDD/16MB/f2fs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-2015-0=
2-07.cgz/NoSync/n
> hm4/60G/fsmark
> =

> commit:
>   74fd8d9927ef08db30a85f131a124152aeba66c7
>   b9d777b85ff1ff79a1173190317b25bebc404ab4
> =

> 74fd8d9927ef08db b9d777b85ff1ff79a117319031
> ---------------- --------------------------
>          %stddev     %change         %stddev
>              \          |                \
>      10.00 =C2=B1  0%     -10.0%       9.00 =C2=B1  0%  fsmark.time.perce=
nt_of_cpu_this_job_got
>      10.00 =C2=B1  0%     -10.0%       9.00 =C2=B1  0%  time.percent_of_c=
pu_this_job_got
>       2.35 =C2=B1  0%      -3.7%       2.26 =C2=B1  0%  turbostat.%Busy
>      67.30 =C2=B1  0%      -4.5%      64.30 =C2=B1  0%  turbostat.Avg_MHz
>       2116 =C2=B1  1%     -98.7%      27.20 =C2=B1110%  proc-vmstat.kswap=
d_inodesteal
>     191431 =C2=B1  0%     +18.2%     226316 =C2=B1  0%  proc-vmstat.slabs=
_scanned
>      56566 =C2=B1  0%     +21.3%      68612 =C2=B1  0%  proc-vmstat.worki=
ngset_nodereclaim
>    1176917 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%
> latency_stats.avg.call_rwsem_down_read_failed.f2fs_convert_inline_inode.[=
f2fs].f2fs_write_
> begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file=
_write_iter.f2fs_
> file_write_iter.[f2fs].__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_f=
astpath
>      62312 =C2=B1 55%   +1577.8%    1045503 =C2=B1 11%
> latency_stats.avg.call_rwsem_down_read_failed.f2fs_write_begin.[f2fs].gen=
eric_perform_writ
> e.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.=
[f2fs].__vfs_writ
> e.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
>      11969 =C2=B1  8%    -100.0%       0.00 =C2=B1 -1%
> latency_stats.hits.call_rwsem_down_read_failed.get_node_info.[f2fs].read_=
node_page.[f2fs].
> get_node_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f=
2fs].generic_perf
> orm_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_wri=
te_iter.[f2fs].__
> vfs_write.vfs_write
>    1773702 =C2=B1  7%    -100.0%       0.00 =C2=B1 -1%
> latency_stats.max.call_rwsem_down_read_failed.f2fs_convert_inline_inode.[=
f2fs].f2fs_write_
> begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file=
_write_iter.f2fs_
> file_write_iter.[f2fs].__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_f=
astpath
>  3.041e+08 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%

Thanks for your report!

Looks like sum of latency caused by f2fs_lock_op was transferred from
f2fs_convert_inline_inode into f2fs_write_begin.

f2fs_convert_inline_inode:
3.041e+08 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%
f2fs_write_begin
1743538 =C2=B1 56%  +18023.3%   3.16e+08 =C2=B1  3%

Thanks,

> latency_stats.sum.call_rwsem_down_read_failed.f2fs_convert_inline_inode.[=
f2fs].f2fs_write_
> begin.[f2fs].generic_perform_write.__generic_file_write_iter.generic_file=
_write_iter.f2fs_
> file_write_iter.[f2fs].__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_f=
astpath
>     163413 =C2=B1112%    +165.9%     434477 =C2=B1147%
> latency_stats.sum.call_rwsem_down_read_failed.f2fs_wait_on_page_writeback=
.[f2fs].f2fs_wait
> _on_page_writeback.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2=
fs].f2fs_get_bloc
> k.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_wri=
te_iter.generic_f
> ile_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
>     788095 =C2=B1164%     -60.4%     312194 =C2=B1122%
> latency_stats.sum.call_rwsem_down_read_failed.f2fs_wait_on_page_writeback=
.[f2fs].f2fs_wait
> _on_page_writeback.[f2fs].update_inode.[f2fs].sync_inode_page.[f2fs].rese=
rve_new_block.[f2
> fs].f2fs_reserve_block.[f2fs].f2fs_get_block.[f2fs].f2fs_write_begin.[f2f=
s].generic_perfor
> m_write.__generic_file_write_iter.generic_file_write_iter
>    1743538 =C2=B1 56%  +18023.3%   3.16e+08 =C2=B1  3%
> latency_stats.sum.call_rwsem_down_read_failed.f2fs_write_begin.[f2fs].gen=
eric_perform_writ
> e.__generic_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.=
[f2fs].__vfs_writ
> e.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
>    1677147 =C2=B1  9%    -100.0%       0.00 =C2=B1 -1%
> latency_stats.sum.call_rwsem_down_read_failed.get_node_info.[f2fs].read_n=
ode_page.[f2fs].g
> et_node_page.[f2fs].f2fs_convert_inline_inode.[f2fs].f2fs_write_begin.[f2=
fs].generic_perfo
> rm_write.__generic_file_write_iter.generic_file_write_iter.f2fs_file_writ=
e_iter.[f2fs].__v
> fs_write.vfs_write
> =

> =

> nhm4: Nehalem
> Memory: 4G
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Ying Huang


--===============0949385308984698200==--

