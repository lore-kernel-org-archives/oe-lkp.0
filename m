Content-Type: multipart/mixed; boundary="===============1152911796475089464=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [writeback] f7486eef5e: No primary change, fsmark.time.involuntary_context_switches -35.1%
Date: Tue, 05 Apr 2016 16:46:02 +0800
Message-ID: <20160405084602.GC10110@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1152911796475089464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that fsmark.time.involuntary_context_switches -35.1% change=
 on

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-4.9/performance/1HDD/9B/xfs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_=
64-2015-02-07.cgz/fsyncBeforeClose/lkp-sb02/400M/fsmark

commit: =

  5569d5f86db30a2d202ed57222a177d32a2234b3
  f7486eef5ea239905ed71f2316a40eae757ffed2

5569d5f86db30a2d f7486eef5ea239905ed71f2316 =

---------------- -------------------------- =

       fail:runs  %reproduction    fail:runs
         %stddev     %change         %stddev
             \          |                \  =

    106141 =C2=B1  0%     -35.1%      68920 =C2=B1  0%  fsmark.time.involun=
tary_context_switches
    342173 =C2=B1  0%     +35.8%     464725 =C2=B1  0%  fsmark.time.volunta=
ry_context_switches
    284.90 =C2=B1  4%     -41.7%     166.22 =C2=B1 18%  slabinfo.blkdev_req=
uests.num_objs
    106141 =C2=B1  0%     -35.1%      68920 =C2=B1  0%  time.involuntary_co=
ntext_switches
    342173 =C2=B1  0%     +35.8%     464725 =C2=B1  0%  time.voluntary_cont=
ext_switches
     27.89 =C2=B1 28%     -20.6%      22.16 =C2=B1  2%  turbostat.CPU%c6
      9.13 =C2=B1 11%     +13.2%      10.34 =C2=B1  0%  turbostat.CorWatt
      6.91 =C2=B1 65%     -38.0%       4.28 =C2=B1  5%  turbostat.Pkg%pc6
     12.63 =C2=B1  8%      +9.7%      13.85 =C2=B1  0%  turbostat.PkgWatt
  48250249 =C2=B1  1%    +101.0%   96965425 =C2=B1  1%  cpuidle.C1-SNB.time
     95999 =C2=B1  2%     +69.6%     162769 =C2=B1  0%  cpuidle.C1-SNB.usage
 2.015e+08 =C2=B1  4%     +15.3%  2.325e+08 =C2=B1  1%  cpuidle.C1E-SNB.time
    185631 =C2=B1  4%     +23.7%     229659 =C2=B1  1%  cpuidle.C1E-SNB.usa=
ge
     15292 =C2=B1  2%     +32.4%      20248 =C2=B1  2%  cpuidle.C3-SNB.usage
    563.70 =C2=B1 23%     -23.9%     429.22 =C2=B1  7%  cpuidle.POLL.usage
     38.96 =C2=B1 18%    +183.2%     110.33 =C2=B1 35%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     -4107 =C2=B1 -4%     -64.2%      -1470 =C2=B1-30%  sched_debug.cpu.nr_=
uninterruptible.min
      2469 =C2=B1  3%     -53.6%       1145 =C2=B1 31%  sched_debug.cpu.nr_=
uninterruptible.stddev
     28646 =C2=B1  1%     +45.2%      41602 =C2=B1 34%  sched_debug.cpu.sch=
ed_goidle.avg
     19183 =C2=B1  3%     +74.9%      33552 =C2=B1 33%  sched_debug.cpu.sch=
ed_goidle.min
     16895 =C2=B1  4%     +55.3%      26246 =C2=B1 35%  sched_debug.cpu.ttw=
u_count.min
      0.00 =C2=B1 -1%      +Inf%      19531 =C2=B1  7%  latency_stats.avg.b=
lk_wb_wait.blk_queue_bio.generic_make_request.submit_bio._xfs_buf_ioapply.x=
fs_buf_submit.xlog_bdstrat.xlog_sync.xlog_state_release_iclog._xfs_log_forc=
e_lsn.xfs_file_fsync.vfs_fsync_range
      0.00 =C2=B1 -1%      +Inf%      19304 =C2=B1  2%  latency_stats.avg.b=
lk_wb_wait.blk_queue_bio.generic_make_request.submit_bio.xfs_submit_ioend_b=
io.xfs_submit_ioend.xfs_vm_writepages.do_writepages.__filemap_fdatawrite_ra=
nge.filemap_write_and_wait_range.xfs_file_fsync.vfs_fsync_range
     41.10 =C2=B1 20%  +25703.2%      10605 =C2=B1  1%  latency_stats.avg.f=
lush_work.xlog_cil_force_lsn._xfs_log_force_lsn.xfs_file_fsync.vfs_fsync_ra=
nge.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%      49655 =C2=B1  0%  latency_stats.hits.=
blk_wb_wait.blk_queue_bio.generic_make_request.submit_bio.xfs_submit_ioend_=
bio.xfs_submit_ioend.xfs_vm_writepages.do_writepages.__filemap_fdatawrite_r=
ange.filemap_write_and_wait_range.xfs_file_fsync.vfs_fsync_range
    401.30 =C2=B1 13%  +17370.5%      70109 =C2=B1  1%  latency_stats.hits.=
flush_work.xlog_cil_force_lsn._xfs_log_force_lsn.xfs_file_fsync.vfs_fsync_r=
ange.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      1.20 =C2=B1 62%  +8.9e+05%      10737 =C2=B1  5%  latency_stats.hits.=
xlog_cil_force_lsn._xfs_log_force_lsn.xfs_file_fsync.vfs_fsync_range.do_fsy=
nc.SyS_fsync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%     107042 =C2=B1 34%  latency_stats.max.b=
lk_wb_wait.blk_queue_bio.generic_make_request.submit_bio._xfs_buf_ioapply.x=
fs_buf_submit.xlog_bdstrat.xlog_sync.xlog_state_release_iclog._xfs_log_forc=
e_lsn.xfs_file_fsync.vfs_fsync_range
      0.00 =C2=B1 -1%      +Inf%     215477 =C2=B1  7%  latency_stats.max.b=
lk_wb_wait.blk_queue_bio.generic_make_request.submit_bio.xfs_submit_ioend_b=
io.xfs_submit_ioend.xfs_vm_writepages.do_writepages.__filemap_fdatawrite_ra=
nge.filemap_write_and_wait_range.xfs_file_fsync.vfs_fsync_range
    752.00 =C2=B1164%  +17984.7%     135997 =C2=B1 11%  latency_stats.max.f=
lush_work.xlog_cil_force_lsn._xfs_log_force_lsn.xfs_file_fsync.vfs_fsync_ra=
nge.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      0.00 =C2=B1 -1%      +Inf%    1548061 =C2=B1 14%  latency_stats.sum.b=
lk_wb_wait.blk_queue_bio.generic_make_request.submit_bio._xfs_buf_ioapply.x=
fs_buf_submit.xlog_bdstrat.xlog_sync.xlog_state_release_iclog._xfs_log_forc=
e_lsn.xfs_file_fsync.vfs_fsync_range
      0.00 =C2=B1 -1%      +Inf%  9.584e+08 =C2=B1  1%  latency_stats.sum.b=
lk_wb_wait.blk_queue_bio.generic_make_request.submit_bio.xfs_submit_ioend_b=
io.xfs_submit_ioend.xfs_vm_writepages.do_writepages.__filemap_fdatawrite_ra=
nge.filemap_write_and_wait_range.xfs_file_fsync.vfs_fsync_range
     16575 =C2=B1 19%  +4.5e+06%  7.436e+08 =C2=B1  2%  latency_stats.sum.f=
lush_work.xlog_cil_force_lsn._xfs_log_force_lsn.xfs_file_fsync.vfs_fsync_ra=
nge.do_fsync.SyS_fsync.entry_SYSCALL_64_fastpath
      6.10 =C2=B1187%  +8.6e+06%     524627 =C2=B1 26%  latency_stats.sum.x=
log_cil_force_lsn._xfs_log_force_lsn.xfs_file_fsync.vfs_fsync_range.do_fsyn=
c.SyS_fsync.entry_SYSCALL_64_fastpath


lkp-sb02: Sandy Bridge-EP
Memory: 4G




                       fsmark.time.voluntary_context_switches

  500000 ++----------------------------------------------------------------=
-+
  450000 OO O  O O O  O OO O OO O OO O OOO OO OOOOOOOOO OOOOO              =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
  350000 *+ *** * **  * ** * *  * ** * **   ***  ******* **** ***.* *******=
**
         |**  : : ::  : :: : :* : :: : : *.*   **       *    *     *       =
 |
  300000 ++   : : ::  : :: : :: : :: : :                                   =
 |
  250000 ++   : : : : : :: : :: : :: : :                                   =
 |
  200000 ++   : : : : : :: : :: : :: : :                                   =
 |
         |     :::: : ::: ::::: ::: ::::                                   =
 |
  150000 ++    : :  :: :  : :  : :  : :                                    =
 |
  100000 ++    : :  :: :  : :  : :  : :                                    =
 |
         |     : :   : :  : :  : :  : :                                    =
 |
   50000 ++    : :   : :  : :  : :  : :                                    =
 |
       0 ++O-OO*O*O--O-O--O-O--O-O--O-O------O---------O-------------------=
-+


                      fsmark.time.involuntary_context_switches

  120000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  100000 ****** * **  * ** * ** * ** * ***.**********************.*********=
**
         |    : : ::  : :: : :: : :: : :                                   =
 |
         |    : : ::  : :: : :: : :: : :                                   =
 |
   80000 ++   : : : : : :: : :: : :: : :                                   =
 |
         OO O :O:O:O: O OO O OO O OO O OOO OO OOOOOOOOO OOOOO              =
 |
   60000 ++   : : : : : :: : :: : :: : :                                   =
 |
         |     :::: : ::: :::: :::: ::::                                   =
 |
   40000 ++    : :  :: :  : :  : :  : :                                    =
 |
         |     : :  :: :  : :  : :  : :                                    =
 |
         |     : :   : :  : :  : :  : :                                    =
 |
   20000 ++    : :   : :  : :  : :  : :                                    =
 |
         |     : :   : :  : :  : :  : :                                    =
 |
       0 ++O-OO*O*O--O-O--O-O--O-O--O-O------O---------O-------------------=
-+



	[*] bisect-good sample
	[O] bisect-bad  sample

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
Xiaolong Ye

--===============1152911796475089464==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogZnNtYXJrCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3RhdDog
CiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJv
Yy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAogIHNs
YWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAog
IHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDog
CiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAog
IHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1h
bmNlCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0
OiBmNzQ4NmVlZjVlYTIzOTkwNWVkNzFmMjMxNmE0MGVhZTc1N2ZmZWQyCm1vZGVsOiBTYW5keSBC
cmlkZ2UtRVAKbWVtb3J5OiA0RwpoZGRfcGFydGl0aW9uczogIi9kZXYvZGlzay9ieS1pZC9hdGEt
SERUNzIyNTE2RExBMzgwX1ZEU0QxRFRDRUtZQUVKLXBhcnQyIgpzd2FwX3BhcnRpdGlvbnM6IApy
b290ZnNfcGFydGl0aW9uOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1IRFQ3MjI1MTZETEEzODBfVkRT
RDFEVENFS1lBRUotcGFydDEiCmNhdGVnb3J5OiBiZW5jaG1hcmsKaXRlcmF0aW9uczogMXgKbnJf
dGhyZWFkczogMzJ0CmRpc2s6IDFIREQKZnM6IHhmcwpmczI6IApmc21hcms6CiAgZmlsZXNpemU6
IDlCCiAgdGVzdF9zaXplOiA0MDBNCiAgc3luY19tZXRob2Q6IGZzeW5jQmVmb3JlQ2xvc2UKICBu
cl9kaXJlY3RvcmllczogMTZkCiAgbnJfZmlsZXNfcGVyX2RpcmVjdG9yeTogMjU2ZnBkCnF1ZXVl
OiBiaXNlY3QKdGVzdGJveDogbGtwLXNiMDIKdGJveF9ncm91cDogbGtwLXNiMDIKa2NvbmZpZzog
eDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTA0LTAzIDE2OjA1OjU3Ljc0MDA2MjIyMSAr
MDg6MDAKY29tcGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcu
Y2d6CmlkOiBiNjQ4ODJhN2MzZDZmMzliZmRhNjJlYjkzYmFkZDBlNzdkNzcxMDE1CnVzZXI6IGxr
cApoZWFkX2NvbW1pdDogZmZjOTVlMzlmYmQzYWM0M2JhYjE4OWUwYjA0YWJjMzczZjRlNTBhOQpi
YXNlX2NvbW1pdDogZjU1NTMyYTBjMGI4YmI2MTQ4ZjRlMDc4NTNiODc2ZWY3M2JjNjljYQpicmFu
Y2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDQwMjIxCnJlc3VsdF9yb290OiAiL3Jl
c3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgtMzJ0LTFIREQteGZzLTlCLTQwME0tZnN5bmNCZWZv
cmVDbG9zZS0xNmQtMjU2ZnBkL2xrcC1zYjAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ov
eDg2XzY0LXJoZWwvZ2NjLTQuOS9mNzQ4NmVlZjVlYTIzOTkwNWVkNzFmMjMxNmE0MGVhZTc1N2Zm
ZWQyLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXNiMDIvYmlzZWN0X2ZzbWFyay1w
ZXJmb3JtYW5jZS0xeC0zMnQtMUhERC14ZnMtOUItNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0y
NTZmcGQtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC1mNzQ4NmVlZjVl
YTIzOTkwNWVkNzFmMjMxNmE0MGVhZTc1N2ZmZWQyLTIwMTYwNDAzLTg3OTYxLW9sNHoxYi0wLnlh
bWwiCm5yX2NwdTogIiQobnByb2MpIgptYXhfdXB0aW1lOiA4NjMuODc5OTk5OTk5OTk5OQppbml0
cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxv
YWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVk
dWxlZC9sa3Atc2IwMi9iaXNlY3RfZnNtYXJrLXBlcmZvcm1hbmNlLTF4LTMydC0xSERELXhmcy05
Qi00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC1kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6LXg4Nl82NC1yaGVsLWY3NDg2ZWVmNWVhMjM5OTA1ZWQ3MWYyMzE2YTQwZWFlNzU3ZmZl
ZDItMjAxNjA0MDMtODc5NjEtb2w0ejFiLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14
ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjA0MDIyMQot
IGNvbW1pdD1mNzQ4NmVlZjVlYTIzOTkwNWVkNzFmMjMxNmE0MGVhZTc1N2ZmZWQyCi0gQk9PVF9J
TUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZjc0ODZlZWY1ZWEyMzk5MDVlZDcx
ZjIzMTZhNDBlYWU3NTdmZmVkMi92bWxpbnV6LTQuNi4wLXJjMS0wMDAwOS1nZjc0ODZlZQotIG1h
eF91cHRpbWU9ODYzCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9mc21hcmsvcGVyZm9ybWFuY2UtMXgt
MzJ0LTFIREQteGZzLTlCLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkL2xrcC1zYjAy
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9mNzQ4NmVl
ZjVlYTIzOTkwNWVkNzFmMjMxNmE0MGVhZTc1N2ZmZWQyLzAKLSBMS1BfU0VSVkVSPWlubgotIHwy
LQoKCiAgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRl
YnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFs
bF90aW1lb3V0PTEwMAogIHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9
cGFuaWMgb29wcz1wYW5pYyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29s
ZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDog
Ii9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2
XzY0LXJoZWwvZ2NjLTQuOS9mNzQ4NmVlZjVlYTIzOTkwNWVkNzFmMjMxNmE0MGVhZTc1N2ZmZWQy
L21vZHVsZXMuY2d6IgpibV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3ovbGtwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovcnVuLWlwY29uZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3ovdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3Np
bWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMuY2d6LC9vc2ltYWdlL2Rl
cHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mczIuY2d6LC9sa3AvYmVuY2htYXJrcy9m
c21hcmsuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwv
Z2NjLTQuOS9mNzQ4NmVlZjVlYTIzOTkwNWVkNzFmMjMxNmE0MGVhZTc1N2ZmZWQyL2xpbnV4LWhl
YWRlcnMuY2d6IgpyZXBlYXRfdG86IDUKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9n
Y2MtNC45L2Y3NDg2ZWVmNWVhMjM5OTA1ZWQ3MWYyMzE2YTQwZWFlNzU3ZmZlZDIvdm1saW51ei00
LjYuMC1yYzEtMDAwMDktZ2Y3NDg2ZWUiCmRlcXVldWVfdGltZTogMjAxNi0wNC0wMyAxNjowNzox
NC42Mjg3NTQyOTIgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMjguNDAgMTAu
ODggMy45OSAxLzE1MCAyNTAwCnN0YXJ0X3RpbWU6ICcxNDU5NjcwODY4JwplbmRfdGltZTogJzE0
NTk2NzA5ODgnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwNDAxLTIzMTUwOCIK

--===============1152911796475089464==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0wMyAxNjowNzo0NiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0wMyAxNjowNzo0NiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0wMyAxNjowNzo0NiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NC0wMyAxNjowNzo0NiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0wMyAxNjowNzo0NiBta2ZzIC10
IHhmcyAvZGV2L3NkYTIKMjAxNi0wNC0wMyAxNjowNzo0NyBtb3VudCAtdCB4ZnMgLW8gbm9iYXJy
aWVyLGlub2RlNjQgL2Rldi9zZGEyIC9mcy9zZGEyCjIwMTYtMDQtMDMgMTY6MDc6NDggLi9mc19t
YXJrIC1kIC9mcy9zZGEyLzEgLWQgL2ZzL3NkYTIvMiAtZCAvZnMvc2RhMi8zIC1kIC9mcy9zZGEy
LzQgLWQgL2ZzL3NkYTIvNSAtZCAvZnMvc2RhMi82IC1kIC9mcy9zZGEyLzcgLWQgL2ZzL3NkYTIv
OCAtZCAvZnMvc2RhMi85IC1kIC9mcy9zZGEyLzEwIC1kIC9mcy9zZGEyLzExIC1kIC9mcy9zZGEy
LzEyIC1kIC9mcy9zZGEyLzEzIC1kIC9mcy9zZGEyLzE0IC1kIC9mcy9zZGEyLzE1IC1kIC9mcy9z
ZGEyLzE2IC1kIC9mcy9zZGEyLzE3IC1kIC9mcy9zZGEyLzE4IC1kIC9mcy9zZGEyLzE5IC1kIC9m
cy9zZGEyLzIwIC1kIC9mcy9zZGEyLzIxIC1kIC9mcy9zZGEyLzIyIC1kIC9mcy9zZGEyLzIzIC1k
IC9mcy9zZGEyLzI0IC1kIC9mcy9zZGEyLzI1IC1kIC9mcy9zZGEyLzI2IC1kIC9mcy9zZGEyLzI3
IC1kIC9mcy9zZGEyLzI4IC1kIC9mcy9zZGEyLzI5IC1kIC9mcy9zZGEyLzMwIC1kIC9mcy9zZGEy
LzMxIC1kIC9mcy9zZGEyLzMyIC1EIDE2IC1OIDI1NiAtbiAzMjAwIC1MIDEgLVMgMSAtcyA5Cg==

--===============1152911796475089464==--

