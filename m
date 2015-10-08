Content-Type: multipart/mixed; boundary="===============0813056020800979519=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [f2fs] 15bec0ff5a: -7.5% fsmark.files_per_sec
Date: Thu, 08 Oct 2015 13:43:55 +0800
Message-ID: <87lhbdx6ck.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0813056020800979519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 15bec0ff5a9ba6d203178fa8772259df6207942a ("f2fs: do not skip dentry =
block writes")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/iterations/nr_=
threads/disk/fs/filesize/test_size/sync_method/nr_directories/nr_files_per_=
directory:
  nhm4/fsmark/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performance/=
1x/32t/1HDD/f2fs/16MB/60G/NoSync/16d/256fpd

commit: =

  1583667acb21aba71a8ba16a5f1596bba1cdbbfa
  15bec0ff5a9ba6d203178fa8772259df6207942a

1583667acb21aba7 15bec0ff5a9ba6d203178fa877 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      9.60 =C2=B1  0%      -7.5%       8.88 =C2=B1  2%  fsmark.files_per_sec
     25828 =C2=B1 14%     +43.3%      37001 =C2=B1  9%  fsmark.time.involun=
tary_context_switches
    346865 =C2=B1  1%      +5.1%     364446 =C2=B1  2%  fsmark.time.volunta=
ry_context_switches
    149762 =C2=B1  1%     -10.8%     133532 =C2=B1  1%  meminfo.Writeback
     25828 =C2=B1 14%     +43.3%      37001 =C2=B1  9%  time.involuntary_co=
ntext_switches
     10567 =C2=B1  0%      -1.4%      10423 =C2=B1  0%  vmstat.system.in
     35272 =C2=B1  1%     +13.7%      40088 =C2=B1  2%  softirqs.BLOCK
     55788 =C2=B1  2%      -9.2%      50649 =C2=B1  2%  softirqs.RCU
     86.40 =C2=B1  0%      +2.9%      88.90 =C2=B1  0%  turbostat.Avg_MHz
     15.04 =C2=B1  4%     +51.2%      22.74 =C2=B1  7%  turbostat.CPU%c6
  95420434 =C2=B1  2%     +11.1%   1.06e+08 =C2=B1  3%  cpuidle.C1-NHM.time
  76306793 =C2=B1  3%     -25.7%   56703791 =C2=B1  6%  cpuidle.C1E-NHM.time
    136043 =C2=B1  3%     +10.9%     150901 =C2=B1  1%  cpuidle.C6-NHM.usage
     85.60 =C2=B1 40%    +149.5%     213.60 =C2=B1 32%  proc-vmstat.allocst=
all
    761.80 =C2=B1114%   +1601.0%      12958 =C2=B1 32%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
     37430 =C2=B1  1%     -10.8%      33381 =C2=B1  1%  proc-vmstat.nr_writ=
eback
      4375 =C2=B1  2%     +45.5%       6367 =C2=B1 10%  proc-vmstat.pgactiv=
ate
    307.90 =C2=B1138%   +4385.4%      13810 =C2=B1 25%  proc-vmstat.pgrotat=
ed
     11195 =C2=B1 43%    +150.1%      27994 =C2=B1 34%  proc-vmstat.pgsteal=
_direct_dma32
    274804 =C2=B1  7%     -13.2%     238436 =C2=B1  6%  sched_debug.cfs_rq[=
1]:/.min_vruntime
      2498 =C2=B1  9%     +44.4%       3607 =C2=B1  5%  sched_debug.cfs_rq[=
4]:/.exec_clock
      2769 =C2=B1  7%     +39.7%       3869 =C2=B1 16%  sched_debug.cfs_rq[=
5]:/.exec_clock
      2667 =C2=B1 12%     +40.3%       3741 =C2=B1  6%  sched_debug.cfs_rq[=
6]:/.exec_clock
      2631 =C2=B1  9%     +43.1%       3765 =C2=B1  7%  sched_debug.cfs_rq[=
7]:/.exec_clock
    -95.80 =C2=B1-32%     +95.2%    -187.00 =C2=B1-30%  sched_debug.cpu#0.n=
r_uninterruptible
     11444 =C2=B1  7%     +57.4%      18012 =C2=B1 46%  sched_debug.cpu#5.n=
r_load_updates
     43.30 =C2=B1 29%    +228.2%     142.10 =C2=B1 27%  sched_debug.cpu#5.n=
r_uninterruptible
      9204 =C2=B1 10%   +3829.2%     361677 =C2=B1193%  sched_debug.cpu#5.t=
twu_local
      0.00 =C2=B1 -1%      +Inf%     726873 =C2=B1 91%  latency_stats.avg.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].ra_meta_pages.[f2fs].build_free_nids=
.[f2fs].alloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create
      0.00 =C2=B1 -1%      +Inf%     957001 =C2=B1 34%  latency_stats.avg.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].ra_meta_pages.[f2fs].build_free_nids=
.[f2fs].alloc_nid.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs]=
.f2fs_get_block.[f2fs]
      0.00 =C2=B1 -1%      +Inf%     600712 =C2=B1106%  latency_stats.avg.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.f2fs_submit_page_b=
io.[f2fs].get_read_data_page.[f2fs].find_data_page.[f2fs].f2fs_find_entry.[=
f2fs].f2fs_lookup.[f2fs].lookup_real.path_openat.do_filp_open
      0.00 =C2=B1 -1%      +Inf%      60887 =C2=B1 77%  latency_stats.avg.w=
ait_iff_congested.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try_to_=
free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__p=
age_cache_alloc.pagecache_get_page.grab_cache_page_write_begin.f2fs_write_b=
egin.[f2fs]
     83681 =C2=B1 43%    +128.1%     190851 =C2=B1 70%  latency_stats.avg.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2fs_get_bloc=
k.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic_file_write=
_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_write
      0.00 =C2=B1 -1%      +Inf%     339404 =C2=B1117%  latency_stats.avg.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCAL=
L_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     765971 =C2=B1 90%  latency_stats.max.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].ra_meta_pages.[f2fs].build_free_nids=
.[f2fs].alloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create
      0.00 =C2=B1 -1%      +Inf%    1376989 =C2=B1 27%  latency_stats.max.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].ra_meta_pages.[f2fs].build_free_nids=
.[f2fs].alloc_nid.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs]=
.f2fs_get_block.[f2fs]
      0.00 =C2=B1 -1%      +Inf%     808830 =C2=B1126%  latency_stats.max.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.f2fs_submit_page_b=
io.[f2fs].get_read_data_page.[f2fs].find_data_page.[f2fs].f2fs_find_entry.[=
f2fs].f2fs_lookup.[f2fs].lookup_real.path_openat.do_filp_open
      0.00 =C2=B1 -1%      +Inf%      60934 =C2=B1 77%  latency_stats.max.w=
ait_iff_congested.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try_to_=
free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__p=
age_cache_alloc.pagecache_get_page.grab_cache_page_write_begin.f2fs_write_b=
egin.[f2fs]
    113863 =C2=B1265%     -76.8%      26423 =C2=B1 86%  latency_stats.max.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].set_data_blkaddr.[f2fs].reserve_new_block.[f2fs].f2fs_reserve_bl=
ock.[f2fs].get_new_data_page.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2f=
s].vfs_create.path_openat.do_filp_open
      0.00 =C2=B1 -1%      +Inf%     646891 =C2=B1130%  latency_stats.max.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCAL=
L_64_fastpath
   1804998 =C2=B1 87%   +5901.9%  1.083e+08 =C2=B1  9%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.=
path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
    337670 =C2=B1 90%     +85.5%     626367 =C2=B1147%  latency_stats.sum.c=
all_rwsem_down_read_failed.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_=
page_writeback.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs].f2=
fs_get_block.[f2fs].f2fs_write_begin.[f2fs].generic_perform_write.__generic=
_file_write_iter.generic_file_write_iter.f2fs_file_write_iter.[f2fs].__vfs_=
write
     17619 =C2=B1 18%    +761.1%     151720 =C2=B1 14%  latency_stats.sum.c=
all_rwsem_down_read_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_in=
ode_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_crea=
te.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
    800.10 =C2=B1125%   +7429.5%      60243 =C2=B1 27%  latency_stats.sum.c=
all_rwsem_down_write_failed.get_node_info.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
     18545 =C2=B1 17%    +670.2%     142844 =C2=B1 16%  latency_stats.sum.c=
all_rwsem_down_write_failed.set_node_addr.[f2fs].new_node_page.[f2fs].new_i=
node_page.[f2fs].init_inode_metadata.[f2fs].__f2fs_add_link.[f2fs].f2fs_cre=
ate.[f2fs].vfs_create.path_openat.do_filp_open.do_sys_open.SyS_open
      0.00 =C2=B1 -1%      +Inf%    1001773 =C2=B1 98%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].ra_meta_pages.[f2fs].build_free_nids=
.[f2fs].alloc_nid.[f2fs].f2fs_new_inode.[f2fs].f2fs_create.[f2fs].vfs_create
      0.00 =C2=B1 -1%      +Inf%    3896545 =C2=B1 63%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.__submit_merged_bi=
o.[f2fs].f2fs_submit_merged_bio.[f2fs].ra_meta_pages.[f2fs].build_free_nids=
.[f2fs].alloc_nid.[f2fs].get_dnode_of_data.[f2fs].f2fs_reserve_block.[f2fs]=
.f2fs_get_block.[f2fs]
      0.00 =C2=B1 -1%      +Inf%    1037029 =C2=B1109%  latency_stats.sum.g=
et_request.blk_queue_bio.generic_make_request.submit_bio.f2fs_submit_page_b=
io.[f2fs].get_read_data_page.[f2fs].find_data_page.[f2fs].f2fs_find_entry.[=
f2fs].f2fs_lookup.[f2fs].lookup_real.path_openat.do_filp_open
      0.00 =C2=B1 -1%      +Inf%    1365444 =C2=B1172%  latency_stats.sum.w=
ait_iff_congested.shrink_inactive_list.shrink_lruvec.shrink_zone.do_try_to_=
free_pages.try_to_free_pages.__alloc_pages_nodemask.alloc_pages_current.__p=
age_cache_alloc.pagecache_get_page.grab_cache_page_write_begin.f2fs_write_b=
egin.[f2fs]
 1.318e+08 =C2=B1 62%   +1624.3%  2.272e+09 =C2=B1  9%  latency_stats.sum.w=
ait_on_page_bit.f2fs_wait_on_page_writeback.[f2fs].f2fs_wait_on_page_writeb=
ack.[f2fs].__f2fs_add_link.[f2fs].f2fs_create.[f2fs].vfs_create.path_openat=
.do_filp_open.do_sys_open.SyS_open.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    1314116 =C2=B1111%  latency_stats.sum.w=
ait_on_page_bit.find_data_page.[f2fs].f2fs_find_entry.[f2fs].f2fs_lookup.[f=
2fs].lookup_real.path_openat.do_filp_open.do_sys_open.SyS_open.entry_SYSCAL=
L_64_fastpath


nhm4: Nehalem
Memory: 4G


To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang

--===============0813056020800979519==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50
ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAg
YmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAog
IGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0LXdh
dGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogMDI5MzY0NTg1NmVj
NTI3NjM5YjU5MDJmMDIxZmE1YWViYTkzZTMwNQptb2RlbDogTmVoYWxlbQpucl9jcHU6IDgKbWVt
b3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwM0ZC
WVotMDEwRkIwX1dELVdDQVczNjgxMjA0MS1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9k
aXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0wMTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQy
Igpyb290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1XRENfV0QxMDAzRkJZWi0w
MTBGQjBfV0QtV0NBVzM2ODEyMDQxLXBhcnQzIgpuZXRjb25zb2xlX3BvcnQ6IDY2NDkKY2F0ZWdv
cnk6IGJlbmNobWFyawppdGVyYXRpb25zOiAxeApucl90aHJlYWRzOiAzMnQKZGlzazogMUhERApm
czogZjJmcwpmczI6IApmc21hcms6CiAgZmlsZXNpemU6IDE2TUIKICB0ZXN0X3NpemU6IDYwRwog
IHN5bmNfbWV0aG9kOiBOb1N5bmMKICBucl9kaXJlY3RvcmllczogMTZkCiAgbnJfZmlsZXNfcGVy
X2RpcmVjdG9yeTogMjU2ZnBkCnF1ZXVlOiBjeWNsaWMKdGVzdGJveDogbmhtNAp0Ym94X2dyb3Vw
OiBuaG00Cmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0wOS0yOCAxMjoz
ODowMC44NDk0OTM1MTMgKzA4OjAwCmlkOiA0ZGJkNWM2MWFkNmM1M2ZkOGZlYzlhY2ExNWMyNGZj
YTA1YjMxY2E3CnVzZXI6IGxrcApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogMDI5MzY0
NTg1NmVjNTI3NjM5YjU5MDJmMDIxZmE1YWViYTkzZTMwNQpiYXNlX2NvbW1pdDogOWZmZWNiMTAy
ODM1MDgyNjA5MzZiOTYwMjJkNGVlNDNhNzc5OGI0YwpicmFuY2g6IGxpbnV4LW5leHQvbWFzdGVy
Cmtlcm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wMjkzNjQ1ODU2ZWM1Mjc2
MzliNTkwMmYwMjFmYTVhZWJhOTNlMzA1L3ZtbGludXotNC4zLjAtcmMzLW5leHQtMjAxNTA5Mjki
CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1
bHQvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTMydC0xSERELWYyZnMtMTZNQi02MEctTm9TeW5jLTE2
ZC0yNTZmcGQvbmhtNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2dj
Yy00LjkvMDI5MzY0NTg1NmVjNTI3NjM5YjU5MDJmMDIxZmE1YWViYTkzZTMwNS8wIgpqb2JfZmls
ZTogIi9sa3Avc2NoZWR1bGVkL25obTQvY3ljbGljX2ZzbWFyay1wZXJmb3JtYW5jZS0xeC0zMnQt
MUhERC1mMmZzLTE2TUItNjBHLU5vU3luYy0xNmQtMjU2ZnBkLXg4Nl82NC1yaGVsLUNZQ0xJQ19I
RUFELTAyOTM2NDU4NTZlYzUyNzYzOWI1OTAyZjAyMWZhNWFlYmE5M2UzMDUtMjAxNTA5MjgtMTI2
NTkxLTF1cHE5ajYtMC55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDktMzAgMTI6MTA6NDMuMjE2
MTc1NTQwICswODowMAptYXhfdXB0aW1lOiAxNjAwLjA2CmluaXRyZDogIi9vc2ltYWdlL2RlYmlh
bi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290
PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL25obTQvY3ljbGljX2Zz
bWFyay1wZXJmb3JtYW5jZS0xeC0zMnQtMUhERC1mMmZzLTE2TUItNjBHLU5vU3luYy0xNmQtMjU2
ZnBkLXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELTAyOTM2NDU4NTZlYzUyNzYzOWI1OTAyZjAyMWZh
NWFlYmE5M2UzMDUtMjAxNTA5MjgtMTI2NTkxLTF1cHE5ajYtMC55YW1sCi0gQVJDSD14ODZfNjQK
LSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LW5leHQvbWFzdGVyCi0gY29tbWl0
PTAyOTM2NDU4NTZlYzUyNzYzOWI1OTAyZjAyMWZhNWFlYmE5M2UzMDUKLSBCT09UX0lNQUdFPS9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wMjkzNjQ1ODU2ZWM1Mjc2MzliNTkwMmYwMjFm
YTVhZWJhOTNlMzA1L3ZtbGludXotNC4zLjAtcmMzLW5leHQtMjAxNTA5MjkKLSBtYXhfdXB0aW1l
PTE2MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2ZzbWFyay9wZXJmb3JtYW5jZS0xeC0zMnQtMUhE
RC1mMmZzLTE2TUItNjBHLU5vU3luYy0xNmQtMjU2ZnBkL25obTQvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzAyOTM2NDU4NTZlYzUyNzYzOWI1OTAyZjAy
MWZhNWFlYmE5M2UzMDUvMAotIExLUF9TRVJWRVI9aW5uCi0gfC0KICBsaWJhdGEuZm9yY2U9MS41
R2JwcwoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAg
ZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0
YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRv
Zz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25z
b2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJk
OiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94
ODZfNjQtcmhlbC9nY2MtNC45LzAyOTM2NDU4NTZlYzUyNzYzOWI1OTAyZjAyMWZhNWFlYmE5M2Uz
MDUvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9v
c2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mcy5jZ3osL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzMi5jZ3osL2xrcC9iZW5jaG1hcmtz
L2ZzbWFyay5jZ3oiCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMjYuOTQgMjUuMTcgMTMu
MDAgMS8xNTYgNzA2NQpzdGFydF90aW1lOiAnMTQ0MzU4NjI3MicKZW5kX3RpbWU6ICcxNDQzNTg2
NzUzJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE1MDkzMC0xMTMxMDYiCg==

--===============0813056020800979519==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgpta2ZzIC10IGYyZnMgL2Rldi9zZGExCm1vdW50IC10IGYyZnMgL2Rldi9z
ZGExIC9mcy9zZGExCi4vZnNfbWFyayAtZCAvZnMvc2RhMS8xIC1kIC9mcy9zZGExLzIgLWQgL2Zz
L3NkYTEvMyAtZCAvZnMvc2RhMS80IC1kIC9mcy9zZGExLzUgLWQgL2ZzL3NkYTEvNiAtZCAvZnMv
c2RhMS83IC1kIC9mcy9zZGExLzggLWQgL2ZzL3NkYTEvOSAtZCAvZnMvc2RhMS8xMCAtZCAvZnMv
c2RhMS8xMSAtZCAvZnMvc2RhMS8xMiAtZCAvZnMvc2RhMS8xMyAtZCAvZnMvc2RhMS8xNCAtZCAv
ZnMvc2RhMS8xNSAtZCAvZnMvc2RhMS8xNiAtZCAvZnMvc2RhMS8xNyAtZCAvZnMvc2RhMS8xOCAt
ZCAvZnMvc2RhMS8xOSAtZCAvZnMvc2RhMS8yMCAtZCAvZnMvc2RhMS8yMSAtZCAvZnMvc2RhMS8y
MiAtZCAvZnMvc2RhMS8yMyAtZCAvZnMvc2RhMS8yNCAtZCAvZnMvc2RhMS8yNSAtZCAvZnMvc2Rh
MS8yNiAtZCAvZnMvc2RhMS8yNyAtZCAvZnMvc2RhMS8yOCAtZCAvZnMvc2RhMS8yOSAtZCAvZnMv
c2RhMS8zMCAtZCAvZnMvc2RhMS8zMSAtZCAvZnMvc2RhMS8zMiAtRCAxNiAtTiAyNTYgLW4gMTIw
IC1MIDEgLVMgMCAtcyAxNjc3NzIxNgo=

--===============0813056020800979519==--

