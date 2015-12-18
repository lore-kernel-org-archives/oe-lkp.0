Content-Type: multipart/mixed; boundary="===============3577388056318577373=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [scheduler] a13869ace4: No primary result change, -4.3% unixbench.time.system_time
Date: Fri, 18 Dec 2015 16:14:34 +0800
Message-ID: <8760zw5g2d.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3577388056318577373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://github.com/0day-ci/linux Yuyang-Du/sched-Fix-new-task-s-load-avg-re=
moved-from-source-CPU-in/20151216-154529
commit a13869ace4e73d0aa7e54f5c2066d8445acb1c97 ("PELT initial task load an=
d wake_up_new_task()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/ivb42/shel=
l1/unixbench

commit: =

  aa0b7ae06387d40a988ce16a189082dee6e570bc
  a13869ace4e73d0aa7e54f5c2066d8445acb1c97

aa0b7ae06387d40a a13869ace4e73d0aa7e54f5c20 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    140.50 =C2=B1  0%      -2.5%     137.00 =C2=B1  0%  unixbench.time.perc=
ent_of_cpu_this_job_got
    191.28 =C2=B1  0%      -4.3%     183.09 =C2=B1  0%  unixbench.time.syst=
em_time
   1043479 =C2=B1  0%      -1.3%    1029838 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
     22549 =C2=B1  0%      -4.6%      21509 =C2=B1  0%  vmstat.system.cs
     31759 =C2=B1  6%      -8.1%      29176 =C2=B1  1%  meminfo.Active(anon)
      5638 =C2=B1 11%     +65.4%       9323 =C2=B1  1%  meminfo.PageTables
    721.75 =C2=B1 23%     +62.9%       1176 =C2=B1  7%  numa-vmstat.node0.n=
r_page_table_pages
    753.50 =C2=B1 34%     +51.5%       1141 =C2=B1  7%  numa-vmstat.node1.n=
r_page_table_pages
      7939 =C2=B1  6%      -8.3%       7284 =C2=B1  1%  proc-vmstat.nr_acti=
ve_anon
      1410 =C2=B1 11%     +65.4%       2332 =C2=B1  1%  proc-vmstat.nr_page=
_table_pages
      2918 =C2=B1 24%     +61.7%       4719 =C2=B1  7%  numa-meminfo.node0.=
PageTables
      3943 =C2=B1  7%     -17.7%       3245 =C2=B1  7%  numa-meminfo.node1.=
KernelStack
      3001 =C2=B1 33%     +52.7%       4583 =C2=B1  7%  numa-meminfo.node1.=
PageTables
    165448 =C2=B1  4%     -11.9%     145739 =C2=B1  1%  softirqs.RCU
    162832 =C2=B1  0%     -21.2%     128362 =C2=B1  0%  softirqs.SCHED
    360205 =C2=B1  1%     -28.7%     256686 =C2=B1  0%  softirqs.TIMER
     37.47 =C2=B1  1%     +18.5%      44.40 =C2=B1  0%  turbostat.CPU%c1
     59.49 =C2=B1  0%     -11.7%      52.56 =C2=B1  0%  turbostat.CPU%c6
      2.02 =C2=B1 12%     -22.0%       1.57 =C2=B1 10%  turbostat.Pkg%pc2
 1.415e+09 =C2=B1  1%     +30.9%  1.853e+09 =C2=B1  1%  cpuidle.C1-IVT.time
      3219 =C2=B1  2%     +71.3%       5517 =C2=B1  3%  cpuidle.C1E-IVT.usa=
ge
   2502248 =C2=B1  9%    +118.3%    5461426 =C2=B1  6%  cpuidle.C3-IVT.time
      5183 =C2=B1  1%    +136.8%      12276 =C2=B1  3%  cpuidle.C3-IVT.usage
    994519 =C2=B1148%    -100.0%       0.00 =C2=B1 -1%  latency_stats.avg.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
    162402 =C2=B1127%     -96.6%       5547 =C2=B1150%  latency_stats.avg.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
    994519 =C2=B1148%    -100.0%       0.00 =C2=B1 -1%  latency_stats.max.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1238838 =C2=B1117%     -98.3%      21437 =C2=B1147%  latency_stats.max.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
    994519 =C2=B1148%    -100.0%       0.00 =C2=B1 -1%  latency_stats.sum.n=
fs_wait_on_request.nfs_updatepage.nfs_write_end.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter.nfs_file_write.__vfs_write.vfs=
_write.SyS_write.entry_SYSCALL_64_fastpath
   1241267 =C2=B1117%     -97.2%      34234 =C2=B1144%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_keep_errors.syn=
c_inodes_sb.sync_inodes_one_sb.iterate_supers.sys_sync.entry_SYSCALL_64_fas=
tpath
     16226 =C2=B1  4%     +11.3%      18055 =C2=B1  1%  slabinfo.kmalloc-19=
2.active_objs
     16320 =C2=B1  4%     +11.5%      18203 =C2=B1  1%  slabinfo.kmalloc-19=
2.num_objs
      8573 =C2=B1  5%      -8.0%       7887 =C2=B1  1%  slabinfo.kmalloc-96=
.active_objs
      8622 =C2=B1  5%      -8.0%       7929 =C2=B1  1%  slabinfo.kmalloc-96=
.num_objs
    446.25 =C2=B1 16%     -28.6%     318.75 =C2=B1  6%  slabinfo.kmem_cache=
.active_objs
    446.25 =C2=B1 16%     -28.6%     318.75 =C2=B1  6%  slabinfo.kmem_cache=
.num_objs
    605.00 =C2=B1 15%     -26.4%     445.00 =C2=B1  6%  slabinfo.kmem_cache=
_node.active_objs
    624.00 =C2=B1 15%     -25.6%     464.00 =C2=B1  5%  slabinfo.kmem_cache=
_node.num_objs

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

                                  cpuidle.C1-IVT.time

  2.1e+09 ++---------------------------------------------------------------=
-+
          |   O                                                            =
 |
    2e+09 O+    O O   O      O                                             =
 |
  1.9e+09 ++O       O   O  O   O                                           =
 |
          |                      O   O   O   O   O                         =
 |
  1.8e+09 ++                       O   O   O   O   O                       =
 |
          |                                                                =
 |
  1.7e+09 ++                                                               =
 |
          |                                                                =
 |
  1.6e+09 ++                                                               =
 |
  1.5e+09 ++                                                               =
 |
          |                                         .*.    .*.     .*.     =
 |
  1.4e+09 ++*.*.*.*. .*.*..*.*.*.*.*.*.*.*.*.*.*.*.*   *.*.   *.*.*   *.*.*=
.*
          *         *                                                      =
 |
  1.3e+09 ++---------------------------------------------------------------=
-+


                                cpuidle.C3-IVT.usage

  14000 ++-----------------------------------------------------------------=
-+
  13000 ++                              O       O                          =
 |
        |                      O    O       O                              =
 |
  12000 ++                            O   O   O    O                       =
 |
  11000 ++O   O        O          O                                        =
 |
        O   O    O O       O                                               =
 |
  10000 ++           O   O   O                                             =
 |
   9000 ++                                                                 =
 |
   8000 ++                                                                 =
 |
        |                                                                  =
 |
   7000 ++                                                                 =
 |
   6000 ++                                                .*.              =
 |
        |.*.*.*..*.*. .*.*.*.*.*..*.*.*.*.*.*.*.*..*.*.*.*   *.*.*..*.*.*. =
.*
   5000 *+           *                                                    *=
 |
   4000 ++-----------------------------------------------------------------=
-+


                            unixbench.time.system_time

  192 *+*------------------------------------------------------------------=
-+
  191 ++  *..*.*.*. .*..*.*. .*.*.*..*.*. .*.  .*. .*.*.*..*.*.*.*. .*..*.*=
.*
      |            *        *            *   *.   *                *       =
 |
  190 ++                                                                   =
 |
  189 ++                                                                   =
 |
      |                                                                    =
 |
  188 ++                                                                   =
 |
  187 ++                                                                   =
 |
  186 ++                                                                   =
 |
      |                                                                    =
 |
  185 ++                                                                   =
 |
  184 ++                                                                   =
 |
      |   O  O                  O    O O     O  O                          =
 |
  183 O+O      O O O O  O O O O   O      O O      O                        =
 |
  182 ++-------------------------------------------------------------------=
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
Ying Huang

--===============3577388056318577373==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVt
YXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAK
ICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAg
aW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczog
CiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6
IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5jZQpkZWZhdWx0
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogYTEzODY5YWNl
NGU3M2QwYWE3ZTU0ZjVjMjA2NmQ4NDQ1YWNiMWM5Nwptb2RlbDogSXZ5dG93biBJdnkgQnJpZGdl
LUVQCm5yX2NwdTogNDgKbWVtb3J5OiA2NEcKc3dhcF9wYXJ0aXRpb25zOiBMQUJFTD1TV0FQCnJv
b3Rmc19wYXJ0aXRpb246IExBQkVMPUxLUC1ST09URlMKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90
YXNrOiAxCnVuaXhiZW5jaDoKICB0ZXN0OiBzaGVsbDEKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBp
dmI0Mgp0Ym94X2dyb3VwOiBpdmI0MgprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6
IDIwMTUtMTItMTggMDk6NTY6NDMuMjA2MzA5NDk4ICswODowMAppZDogNTdiNGI3OTJmZDAxMmNj
ZDM4MGUxMjA1ZjNjYzQwNTA5ZDUzZDBiZQp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVh
ZF9jb21taXQ6IDhkZmQ1NGMwNzMxNGYyZTBkNjQ4NThlZDg3MDFkODQ2MzI0MGFhZTEKYmFzZV9j
b21taXQ6IDlmOTQ5OWFlOGU2NDE1Y2VmYzRmZTBhOTZhZDBlMjc4NjQzNTNjODkKYnJhbmNoOiBs
aW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTEyMTcxMwpyb290ZnM6IGRlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3VuaXhiZW5jaC9wZXJmb3JtYW5j
ZS0xLXNoZWxsMS9pdmI0Mi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVs
L2djYy00LjkvYTEzODY5YWNlNGU3M2QwYWE3ZTU0ZjVjMjA2NmQ4NDQ1YWNiMWM5Ny8wIgpqb2Jf
ZmlsZTogIi9sa3Avc2NoZWR1bGVkL2l2YjQyL2Jpc2VjdF91bml4YmVuY2gtcGVyZm9ybWFuY2Ut
MS1zaGVsbDEtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC1hMTM4Njlh
Y2U0ZTczZDBhYTdlNTRmNWMyMDY2ZDg0NDVhY2IxYzk3LTIwMTUxMjE4LTMwNjMzLTV6ODBsbi0w
LnlhbWwiCm1heF91cHRpbWU6IDE4OTEuODQwMDAwMDAwMDAwMQppbml0cmQ6ICIvb3NpbWFnZS9k
ZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0g
cm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9pdmI0Mi9iaXNl
Y3RfdW5peGJlbmNoLXBlcmZvcm1hbmNlLTEtc2hlbGwxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oteDg2XzY0LXJoZWwtYTEzODY5YWNlNGU3M2QwYWE3ZTU0ZjVjMjA2NmQ4NDQ1YWNiMWM5
Ny0yMDE1MTIxOC0zMDYzMy01ejgwbG4tMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4
Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MTIxNzEzCi0g
Y29tbWl0PWExMzg2OWFjZTRlNzNkMGFhN2U1NGY1YzIwNjZkODQ0NWFjYjFjOTcKLSBCT09UX0lN
QUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9hMTM4NjlhY2U0ZTczZDBhYTdlNTRm
NWMyMDY2ZDg0NDVhY2IxYzk3L3ZtbGludXotNC40LjAtcmMyLTAwMDM3LWdhMTM4NjlhCi0gbWF4
X3VwdGltZT0xODkxCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC91bml4YmVuY2gvcGVyZm9ybWFuY2Ut
MS1zaGVsbDEvaXZiNDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9n
Y2MtNC45L2ExMzg2OWFjZTRlNzNkMGFhN2U1NGY1YzIwNjZkODQ0NWFjYjFjOTcvMAotIExLUF9T
RVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2df
bGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0
ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0x
IG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1k
aXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBy
dwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAi
L3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2ExMzg2OWFjZTRlNzNkMGFhN2U1NGY1YzIw
NjZkODQ0NWFjYjFjOTcvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJi
b3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy91bml4YmVuY2guY2d6IgpyZXBlYXRfdG86IDIKa2Vy
bmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45L2ExMzg2OWFjZTRlNzNkMGFhN2U1
NGY1YzIwNjZkODQ0NWFjYjFjOTcvdm1saW51ei00LjQuMC1yYzItMDAwMzctZ2ExMzg2OWEiCmRl
cXVldWVfdGltZTogMjAxNS0xMi0xOCAxMDowMjozMS4xNjQ2OTg1NzEgKzA4OjAwCmpvYl9zdGF0
ZTogZmluaXNoZWQKbG9hZGF2ZzogMS4zOSAwLjkwIDAuMzkgMS81MTcgMTAzOTEzCnN0YXJ0X3Rp
bWU6ICcxNDUwNDA0MTk0JwplbmRfdGltZTogJzE0NTA0MDQzODMnCnZlcnNpb246ICIvbGtwL2xr
cC8uc3JjLTIwMTUxMjE4LTA5MzQ1NyIK

--===============3577388056318577373==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUt
MTItMTggMTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTIt
MTggMTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMTgg
MTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMTggMTA6
MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMTggMTA6MDM6MTMgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzox
MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMTggMTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMTggMTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1
LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMTggMTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEy
LTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMTgg
MTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMTggMTA6
MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMTggMTA6MDM6
MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTUtMTItMTggMTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1
LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTUtMTItMTggMTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEy
LTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNS0xMi0xOCAxMDowMzoxMyBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTUtMTItMTggMTA6MDM6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4
IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAz
OjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE1LTEyLTE4IDEwOjAzOjEzIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE1LTEyLTE4IDEwOjAzOjE0IC4vUnVuIHNoZWxsMSAtYyAxCg==

--===============3577388056318577373==--

