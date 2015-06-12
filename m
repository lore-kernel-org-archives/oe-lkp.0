Content-Type: multipart/mixed; boundary="===============9198260378434836270=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [rcu] cd73ca21cd2: No primary result change, +47.6% aim7.time.involuntary_context_switches
Date: Fri, 12 Jun 2015 10:32:09 +0800
Message-ID: <1434076329.18774.61.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9198260378434836270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit cd73ca21cd2bb3711b8d80ba74c90d37ef15fe4d ("rcu: Force wakeup of rcu_=
gp_kthread at grace-period end")


testcase/path_params/tbox_group: aim7/performance-100-fork_test/lkp-a03

3382adbc1bb8c80e  cd73ca21cd2bb3711b8d80ba74  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

    205760 =C2=B1  2%     +47.6%     303763 =C2=B1  1%  aim7.time.involunta=
ry_context_switches
       215 =C2=B1  1%     +24.7%        268 =C2=B1 22%  sched_debug.cfs_rq[=
2]:/.load
    205760 =C2=B1  2%     +47.6%     303763 =C2=B1  1%  time.involuntary_co=
ntext_switches
    366314 =C2=B1  1%     +32.8%     486545 =C2=B1  3%  softirqs.RCU
      1493 =C2=B1  2%     +17.1%       1749 =C2=B1  2%  slabinfo.kmalloc-12=
8.num_objs
      1374 =C2=B1  1%     +20.5%       1656 =C2=B1  2%  slabinfo.kmalloc-12=
8.active_objs
      4511 =C2=B1  0%      +7.5%       4850 =C2=B1  0%  vmstat.system.in
      7806 =C2=B1  0%      +5.9%       8264 =C2=B1  1%  vmstat.system.cs
       335 =C2=B1 13%     +30.2%        436 =C2=B1 12%  latency_stats.avg.c=
all_rwsem_down_write_failed.copy_process.do_fork.SyS_clone.system_call_fast=
path
      1266 =C2=B1  1%     +18.6%       1501 =C2=B1  0%  latency_stats.avg.d=
o_wait.SyS_wait4.system_call_fastpath
       188 =C2=B1 18%     +27.9%        241 =C2=B1 19%  latency_stats.avg.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
       955 =C2=B1  9%     -29.6%        672 =C2=B1 17%  latency_stats.avg.c=
all_rwsem_down_write_failed.anon_vma_clone.anon_vma_fork.copy_process.do_fo=
rk.SyS_clone.system_call_fastpath
       211 =C2=B1  3%     -11.1%        188 =C2=B1  4%  latency_stats.avg.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
      1109 =C2=B1  8%     -24.0%        842 =C2=B1 18%  latency_stats.avg.c=
all_rwsem_down_write_failed.anon_vma_fork.copy_process.do_fork.SyS_clone.sy=
stem_call_fastpath
         3 =C2=B1  0%     -33.3%          2 =C2=B1  0%  latency_stats.hits.=
rpc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_sync=
_sequence.[nfsv4]._nfs4_proc_getattr.[nfsv4].nfs4_proc_getattr.[nfsv4].__nf=
s_revalidate_inode.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat
         3 =C2=B1  0%     -33.3%          2 =C2=B1  0%  latency_stats.hits.=
wait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.filemap_write_an=
d_wait.nfs_wb_all.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat.SYSC_=
newfstat.SyS_newfstat.system_call_fastpath
      1853 =C2=B1  1%      +8.4%       2009 =C2=B1  2%  latency_stats.hits.=
do_wait.SyS_wait4.system_call_fastpath
        59 =C2=B1 11%     +14.6%         68 =C2=B1  2%  latency_stats.hits.=
call_rwsem_down_write_failed.cgroup_post_fork.copy_process.do_fork.SyS_clon=
e.system_call_fastpath
     28538 =C2=B1 10%     -18.5%      23253 =C2=B1  5%  latency_stats.max.c=
all_rwsem_down_write_failed.anon_vma_clone.anon_vma_fork.copy_process.do_fo=
rk.SyS_clone.system_call_fastpath
     32316 =C2=B1 17%     -17.6%      26627 =C2=B1  6%  latency_stats.max.c=
all_rwsem_down_write_failed.anon_vma_fork.copy_process.do_fork.SyS_clone.sy=
stem_call_fastpath
   2347345 =C2=B1  2%     +28.6%    3019561 =C2=B1  3%  latency_stats.sum.d=
o_wait.SyS_wait4.system_call_fastpath
      3596 =C2=B1 10%     +20.5%       4333 =C2=B1  6%  latency_stats.sum.w=
ait_on_page_bit_killable.__lock_page_or_retry.filemap_fault.__do_fault.hand=
le_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
   1335990 =C2=B1 12%     +49.7%    2000350 =C2=B1 12%  latency_stats.sum.c=
all_rwsem_down_write_failed.copy_process.do_fork.SyS_clone.system_call_fast=
path
  13375861 =C2=B1 15%     -29.6%    9420979 =C2=B1 27%  latency_stats.sum.c=
all_rwsem_down_write_failed.anon_vma_clone.anon_vma_fork.copy_process.do_fo=
rk.SyS_clone.system_call_fastpath
   1291678 =C2=B1  4%     -10.6%    1155232 =C2=B1  3%  latency_stats.sum.p=
ipe_wait.pipe_read.__vfs_read.vfs_read.SyS_read.system_call_fastpath
       567 =C2=B1 18%     +27.8%        725 =C2=B1 19%  latency_stats.sum.s=
ync_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.system_call_fastpa=
th
      1343 =C2=B1  5%     -29.4%        948 =C2=B1  5%  latency_stats.sum.w=
ait_on_page_bit.filemap_fdatawait_range.filemap_fdatawait.filemap_write_and=
_wait.nfs_wb_all.nfs_getattr.vfs_getattr_nosec.vfs_getattr.vfs_fstat.SYSC_n=
ewfstat.SyS_newfstat.system_call_fastpath

lkp-a03: Atom
Memory: 8G




                                    softirqs.RCU

  520000 ++----------------------------------------------------------------=
-+
         |                                                        O        =
 |
  500000 O+   O  O    O O                       O         O                =
 |
  480000 ++ O      O       O  O O  O    O  O      O  O O                   =
 |
         |                           O       O               O O           =
 |
  460000 ++                                                                =
 |
  440000 ++                                                                =
 |
         |                                                                 =
 |
  420000 ++                                                                =
 |
  400000 ++                                                                =
 |
         |                              *..                                =
 |
  380000 ++                           ..                  *.. .*..         =
 |
  360000 ++  .*.. .*.. .*..*..*.*..*.*     *.*..*.*..   ..   *    *.*.. .*.=
.*
         *..*    *    *                              *.*               *   =
 |
  340000 ++----------------------------------------------------------------=
-+


                       aim7.time.involuntary_context_switches

  320000 ++----------------------------------------------------------------=
-+
         |            O O            O  O  O O         O  O       O        =
 |
  300000 O+ O O  O         O    O               O O  O       O O           =
 |
         |                    O    O                                       =
 |
  280000 ++        O                                                       =
 |
         |                                                                 =
 |
  260000 ++                                                                =
 |
         |                                                                 =
 |
  240000 ++                                                                =
 |
         |                                                                 =
 |
  220000 ++                                                                =
 |
         | .*.*..      .*..*..*.  .*.*..*.. .*.. .*..*.  .*..*.*.. .*..*.  =
 |
  200000 *+      *.*..*         *.         *    *      *.         *      *.=
.*
         |                                                                 =
 |
  180000 ++----------------------------------------------------------------=
-+


                          time.involuntary_context_switches

  320000 ++----------------------------------------------------------------=
-+
         |            O O            O  O  O O         O  O       O        =
 |
  300000 O+ O O  O         O    O               O O  O       O O           =
 |
         |                    O    O                                       =
 |
  280000 ++        O                                                       =
 |
         |                                                                 =
 |
  260000 ++                                                                =
 |
         |                                                                 =
 |
  240000 ++                                                                =
 |
         |                                                                 =
 |
  220000 ++                                                                =
 |
         | .*.*..      .*..*..*.  .*.*..*.. .*.. .*..*.  .*..*.*.. .*..*.  =
 |
  200000 *+      *.*..*         *.         *    *      *.         *      *.=
.*
         |                                                                 =
 |
  180000 ++----------------------------------------------------------------=
-+


                                 vmstat.system.in

  4900 ++---------------------------O--------------------------------------=
-+
       O  O         O     O    O       O  O O    O  O  O    O  O           =
 |
  4850 ++   O  O  O    O    O     O            O         O       O         =
 |
  4800 ++                                                                  =
 |
       |                                                                   =
 |
  4750 ++                                                                  =
 |
  4700 ++                                                                  =
 |
       |                                                                   =
 |
  4650 ++                                                                  =
 |
  4600 ++                                                                  =
 |
       |                                                                   =
 |
  4550 ++                                               .*..*..    .*..    =
 |
  4500 *+.*.     .*.  .*..*.*..  .*.*..*..*.*..*.*..*..*       *.*.    *.  =
.*
       |    *..*.   *.         *.                                        *.=
 |
  4450 ++------------------------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Ying Huang
-------------------------------------
lkp(a)eclists.intel.com
https://eclists.intel.com/sympa/info/lkp
Unsubscribe by sending email to sympa(a)eclists.intel.com with subject "Uns=
ubscribe lkp"


--===============9198260378434836270==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCnRlc3RjYXNlOiBhaW03CmRlZmF1
bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1z
dGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAK
ICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzog
CiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0
czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNz
dGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRl
cjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogNjAKZGVmYXVsdC13YXRjaGRvZ3M6CiAg
d2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCmNv
bW1pdDogNTQ4OTZmMjdkZDVjN2U4M2MzN2M4NWViMTA5M2YxNDU0M2FmMmJmYQptb2RlbDogQXRv
bQptZW1vcnk6IDhHCnNzZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9T
U0RTQzJDVzI0MEEzX0NWQ1YyNDA1MDE1NTI0MENHTi1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAK
YWltNzoKICBsb2FkOiAxMDAKICB0ZXN0OiBmb3JrX3Rlc3QKdGVzdGJveDogbGtwLWEwMwp0Ym94
X2dyb3VwOiBsa3AtYTAzCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNS0w
Ni0xMCAxMDo1NjozNi45MzA0NjA2NDcgKzA4OjAwCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCmNv
bXBpbGVyOiBnY2MtNC45CmhlYWRfY29tbWl0OiA1NDg5NmYyN2RkNWM3ZTgzYzM3Yzg1ZWIxMDkz
ZjE0NTQzYWYyYmZhCmJhc2VfY29tbWl0OiBkNGE0Zjc1Y2Q4ZjI5Y2Q5NDY0YTVhMzJlOTIyNGE5
MTU3MWQ2NjQ5CmJyYW5jaDogbmV4dC9tYXN0ZXIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45LzU0ODk2ZjI3ZGQ1YzdlODNjMzdjODVlYjEwOTNmMTQ1NDNhZjJiZmEvdm1s
aW51ei00LjEuMC1yYzctbmV4dC0yMDE1MDYxMCIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9haW03L3BlcmZvcm1hbmNlLTEwMC1mb3Jr
X3Rlc3QvbGtwLWEwMy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2dj
Yy00LjkvNTQ4OTZmMjdkZDVjN2U4M2MzN2M4NWViMTA5M2YxNDU0M2FmMmJmYS8wIgpqb2JfZmls
ZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1hMDMvY3ljbGljX2FpbTctcGVyZm9ybWFuY2UtMTAwLWZv
cmtfdGVzdC14ODZfNjQtcmhlbC1DWUNMSUNfSEVBRC01NDg5NmYyN2RkNWM3ZTgzYzM3Yzg1ZWIx
MDkzZjE0NTQzYWYyYmZhLTAtMjAxNTA2MTAtODU1Ni0xNG1zOGpxLnlhbWwiCmRlcXVldWVfdGlt
ZTogMjAxNS0wNi0xMSAwNjoxOTo1Ni4wNjY0MDczOTAgKzA4OjAwCm5yX2NwdTogIiQobnByb2Mp
IgptYXhfdXB0aW1lOiAxNDk1Ljg5OTk5OTk5OTk5OTkKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFu
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9
L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLWEwMy9jeWNsaWNf
YWltNy1wZXJmb3JtYW5jZS0xMDAtZm9ya190ZXN0LXg4Nl82NC1yaGVsLUNZQ0xJQ19IRUFELTU0
ODk2ZjI3ZGQ1YzdlODNjMzdjODVlYjEwOTNmMTQ1NDNhZjJiZmEtMC0yMDE1MDYxMC04NTU2LTE0
bXM4anEueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1u
ZXh0L21hc3RlcgotIGNvbW1pdD01NDg5NmYyN2RkNWM3ZTgzYzM3Yzg1ZWIxMDkzZjE0NTQzYWYy
YmZhCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNTQ4OTZmMjdk
ZDVjN2U4M2MzN2M4NWViMTA5M2YxNDU0M2FmMmJmYS92bWxpbnV6LTQuMS4wLXJjNy1uZXh0LTIw
MTUwNjEwCi0gbWF4X3VwdGltZT0xNDk1Ci0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9haW03L3BlcmZv
cm1hbmNlLTEwMC1mb3JrX3Rlc3QvbGtwLWEwMy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
L3g4Nl82NC1yaGVsL2djYy00LjkvNTQ4OTZmMjdkZDVjN2U4M2MzN2M4NWViMTA5M2YxNDU0M2Fm
MmJmYS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIw
MCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19l
bmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0
bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNr
PTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2
Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9k
dWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNTQ4OTZmMjdkZDVj
N2U4M2MzN2M4NWViMTA5M2YxNDU0M2FmMmJmYS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9i
ZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL2FpbTcteDg2XzY0LmNneiIK
am9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA3Ni4xNyA2Ni4xNiAzMS4zNSAxLzEwOSAzMjUx
CnN0YXJ0X3RpbWU6ICcxNDMzOTc0ODYwJwplbmRfdGltZTogJzE0MzM5NzUyMjUnCnZlcnNpb246
ICIvbGtwL2xrcC8uc3JjLTIwMTUwNjExLTAyMTI0MiIK

--===============9198260378434836270==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCg==

--===============9198260378434836270==--

