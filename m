Content-Type: multipart/mixed; boundary="===============4102283497006104144=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [cpuidle] e132b9b3bc: No primary change, turbostat.%Busy -65.1% change
Date: Mon, 28 Mar 2016 14:22:56 +0800
Message-ID: <20160328062256.GC3882@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4102283497006104144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that turbostat.%Busy -65.1% change with your commit.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit e132b9b3bc7f19e9b158e42b323881d5dee5ecf3 ("cpuidle: menu: use high c=
onfidence factors only when considering polling")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/disk/filesize/fs/iterations/kconfig/nr_directories/nr_files_per_di=
rectory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-4.9/1HDD/5K/btrfs/1x/x86_64-rhel/16d/256fpd/32t/debian-x86_64-2015-02=
-07.cgz/fsyncBeforeClose/lkp-ws02/400M/fsmark

commit: =

  3b99669b75db04e411bb298591224a9e8e4f57fb
  e132b9b3bc7f19e9b158e42b323881d5dee5ecf3

3b99669b75db04e4 e132b9b3bc7f19e9b158e42b32 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    505.00 =C2=B1  7%     +83.6%     927.00 =C2=B1  4%  vmstat.memory.buff
      6392 =C2=B1 35%     +62.4%      10382 =C2=B1  0%  numa-meminfo.node0.=
Mapped
      2646 =C2=B1130%    +226.2%       8631 =C2=B1  0%  numa-meminfo.node0.=
Shmem
      9065 =C2=B1 25%     -44.8%       5008 =C2=B1  1%  numa-meminfo.node1.=
Mapped
     26.78 =C2=B1  1%     -65.1%       9.34 =C2=B1  0%  turbostat.%Busy
    709.50 =C2=B1  1%     -65.2%     246.75 =C2=B1  0%  turbostat.Avg_MHz
     40.46 =C2=B1  1%     +39.7%      56.54 =C2=B1  1%  turbostat.CPU%c1
      1597 =C2=B1 35%     +62.4%       2594 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    661.25 =C2=B1130%    +226.3%       2157 =C2=B1  0%  numa-vmstat.node0.n=
r_shmem
    106.00 =C2=B1 39%    +220.0%     339.25 =C2=B1 61%  numa-vmstat.node0.n=
uma_other
      2266 =C2=B1 25%     -44.8%       1251 =C2=B1  1%  numa-vmstat.node1.n=
r_mapped
 4.795e+08 =C2=B1  4%    +117.9%  1.045e+09 =C2=B1  2%  cpuidle.C1-NHM.time
    463937 =C2=B1  2%     +73.2%     803714 =C2=B1  2%  cpuidle.C1-NHM.usage
 1.699e+08 =C2=B1  3%      -8.6%  1.553e+08 =C2=B1  1%  cpuidle.C1E-NHM.time
 7.062e+08 =C2=B1  0%     -84.0%  1.131e+08 =C2=B1  5%  cpuidle.POLL.time
    440162 =C2=B1  1%     -79.7%      89501 =C2=B1  6%  cpuidle.POLL.usage
      0.00 =C2=B1 -1%      +Inf%       8824 =C2=B1 70%  latency_stats.avg.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_e=
nclosure_data_process.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses]=
.class_interface_register.scsi_register_interface.0xffffffffa0006013.do_one=
_initcall.do_init_module
      0.00 =C2=B1 -1%      +Inf%      12106 =C2=B1 71%  latency_stats.avg.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_g=
et_page2_descriptor.[ses].ses_get_power_status.[ses].ses_enclosure_data_pro=
cess.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses].class_interface_=
register.scsi_register_interface.0xffffffffa0006013
      0.00 =C2=B1 -1%      +Inf%      15174 =C2=B1 70%  latency_stats.max.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_e=
nclosure_data_process.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses]=
.class_interface_register.scsi_register_interface.0xffffffffa0006013.do_one=
_initcall.do_init_module
      0.00 =C2=B1 -1%      +Inf%     108570 =C2=B1 80%  latency_stats.max.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_g=
et_page2_descriptor.[ses].ses_get_power_status.[ses].ses_enclosure_data_pro=
cess.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses].class_interface_=
register.scsi_register_interface.0xffffffffa0006013
      0.00 =C2=B1 -1%      +Inf%      92833 =C2=B1 71%  latency_stats.sum.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_e=
nclosure_data_process.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses]=
.class_interface_register.scsi_register_interface.0xffffffffa0006013.do_one=
_initcall.do_init_module
      0.00 =C2=B1 -1%      +Inf%     811913 =C2=B1 70%  latency_stats.sum.b=
lk_execute_rq.scsi_execute.scsi_execute_req_flags.ses_recv_diag.[ses].ses_g=
et_page2_descriptor.[ses].ses_get_power_status.[ses].ses_enclosure_data_pro=
cess.[ses].ses_match_to_enclosure.[ses].ses_intf_add.[ses].class_interface_=
register.scsi_register_interface.0xffffffffa0006013
     -9221 =C2=B1-11%     -19.9%      -7385 =C2=B1-11%  sched_debug.cfs_rq:=
/.spread0.avg
    591.90 =C2=B1 62%    +112.9%       1260 =C2=B1 30%  sched_debug.cfs_rq:=
/.spread0.max
    -14064 =C2=B1 -6%     -11.1%     -12500 =C2=B1 -6%  sched_debug.cfs_rq:=
/.spread0.min
    306.42 =C2=B1 40%     -41.9%     178.00 =C2=B1  8%  sched_debug.cpu.loa=
d.max
     75.40 =C2=B1 31%     -33.6%      50.09 =C2=B1 13%  sched_debug.cpu.loa=
d.stddev
    714.67 =C2=B1  1%      -9.9%     644.00 =C2=B1  5%  sched_debug.cpu.nr_=
uninterruptible.max
      1149 =C2=B1  9%     -15.9%     967.25 =C2=B1  3%  slabinfo.avc_xperms=
_node.active_objs
      1149 =C2=B1  9%     -15.9%     967.25 =C2=B1  3%  slabinfo.avc_xperms=
_node.num_objs
      1020 =C2=B1  8%     +28.2%       1308 =C2=B1  3%  slabinfo.btrfs_tran=
s_handle.active_objs
      1020 =C2=B1  8%     +28.2%       1308 =C2=B1  3%  slabinfo.btrfs_tran=
s_handle.num_objs
    351.75 =C2=B1 11%     +39.2%     489.50 =C2=B1  8%  slabinfo.btrfs_tran=
saction.active_objs
    351.75 =C2=B1 11%     +39.2%     489.50 =C2=B1  8%  slabinfo.btrfs_tran=
saction.num_objs
    544.00 =C2=B1 10%     +20.6%     656.00 =C2=B1 12%  slabinfo.kmem_cache=
_node.active_objs
    544.00 =C2=B1 10%     +20.6%     656.00 =C2=B1 12%  slabinfo.kmem_cache=
_node.num_objs


lkp-ws02: Westmere-EP
Memory: 16G




                                 turbostat.Avg_MHz

  800 ++-------------------------------------------------------------------=
-+
      **.****.****.* **.****.****.** *.****.****.****.****.****.** *.  *   =
 |
  700 ++            *               *                             *  ** *.*=
**
      |                                                                    =
 |
  600 ++                                                                   =
 |
      |                                                                    =
 |
  500 ++                                                                   =
 |
      |                                                                    =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  300 ++           OO    O O  O                                            =
 |
      |          O   OO O O  O OO OOOO OOO                                 =
 |
  200 ++                                                                   =
 |
      OO OOOO OOO                                                          =
 |
  100 ++-------------------------------------------------------------------=
-+


                                 turbostat._Busy

  30 ++--------------------------------------------------------------------=
-+
     **.****.****.* **.***.****.*** .***.*  *.****.****.***.****.* *   *   =
 |
     |             *               *      **                      * *.* **.=
**
  25 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  10 ++         O OOOO OOO OOOO                                            =
 |
     |                          OOOO OOO O                                 =
 |
     OO OOOO O O                                                           =
 |
   5 ++-------O------------------------------------------------------------=
-+


                                turbostat.CPU_c1

  65 ++--------------------------------------------------------------------=
-+
     |    O                                                                =
 |
  60 OO OO   O O                                                           =
 |
     |     O  O                                                            =
 |
     |            OOO  OO  O O  OOOO OOO O                                 =
 |
  55 ++         O    O        O                                            =
 |
     |                   O  O                                              =
 |
  50 ++                                                                    =
 |
     |                                                                     =
 |
  45 ++                                                                    =
 |
     |                                                                     =
 |
     **.****.   *. ***.***.****.****.***.* **.****.****.***.****.****.****.=
 |
  40 ++      ***  *                       *                                =
**
     |                                                                     =
 |
  35 ++--------------------------------------------------------------------=
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

--===============4102283497006104144==
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
IHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IApkZWZhdWx0
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogZTEzMmI5YjNi
YzdmMTllOWIxNThlNDJiMzIzODgxZDVkZWU1ZWNmMwptb2RlbDogV2VzdG1lcmUtRVAKbWVtb3J5
OiAxNkcKbnJfaGRkX3BhcnRpdGlvbnM6IDEwCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5
LWlkL3Njc2ktMzUwMDBjNTAwKi1wYXJ0MSIKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRp
dGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtV0RDX1dEMTAwMkZBRVgtMDBaM0EwX1dELVdDQVRS
NTQwODU2NC1wYXJ0MyIKY2F0ZWdvcnk6IGJlbmNobWFyawppdGVyYXRpb25zOiAxeApucl90aHJl
YWRzOiAzMnQKZGlzazogMUhERApmczogYnRyZnMKZnMyOiAKZnNtYXJrOgogIGZpbGVzaXplOiA1
SwogIHRlc3Rfc2l6ZTogNDAwTQogIHN5bmNfbWV0aG9kOiBmc3luY0JlZm9yZUNsb3NlCiAgbnJf
ZGlyZWN0b3JpZXM6IDE2ZAogIG5yX2ZpbGVzX3Blcl9kaXJlY3Rvcnk6IDI1NmZwZApxdWV1ZTog
YmlzZWN0CnRlc3Rib3g6IGxrcC13czAyCnRib3hfZ3JvdXA6IGxrcC13czAyCmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wMy0yNyAxNjoyMTowNy44OTI2MDYxNzcgKzA4
OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
egppZDogMDUyZDNiMzBhMTE1ZDE2YzkzMDA5YjQyYzAzMjMxNDA0NGUwZjYwMAp1c2VyOiBsa3AK
aGVhZF9jb21taXQ6IDM5MGZjM2U1OWMzYThkOTkzOGU1OGE3Yzk5NWNhYTM2YmY4Njg5NTgKYmFz
ZV9jb21taXQ6IGI1NjJlNDRmNTA3ZTg2M2M2NzkyOTQ2ZTRlMWIxNDQ5ZmJiYWM4NWQKYnJhbmNo
OiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAzMjAwNwpyZXN1bHRfcm9vdDogIi9yZXN1
bHQvZnNtYXJrLzF4LTMydC0xSERELWJ0cmZzLTVLLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQt
MjU2ZnBkL2xrcC13czAyL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwv
Z2NjLTQuOS9lMTMyYjliM2JjN2YxOWU5YjE1OGU0MmIzMjM4ODFkNWRlZTVlY2YzLzAiCmpvYl9m
aWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXdzMDIvYmlzZWN0X2ZzbWFyay0xeC0zMnQtMUhERC1i
dHJmcy01Sy00MDBNLWZzeW5jQmVmb3JlQ2xvc2UtMTZkLTI1NmZwZC1kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLWUxMzJiOWIzYmM3ZjE5ZTliMTU4ZTQyYjMyMzg4MWQ1
ZGVlNWVjZjMtMjAxNjAzMjctMTE4NTYtMXZlNG9lbi0wLnlhbWwiCm5yX2NwdTogIiQobnByb2Mp
IgptYXhfdXB0aW1lOiA5NjcuMAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1
c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVkdWxlZC9sa3Atd3MwMi9iaXNlY3RfZnNtYXJrLTF4LTMy
dC0xSERELWJ0cmZzLTVLLTQwME0tZnN5bmNCZWZvcmVDbG9zZS0xNmQtMjU2ZnBkLWRlYmlhbi14
ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtZTEzMmI5YjNiYzdmMTllOWIxNThlNDJi
MzIzODgxZDVkZWU1ZWNmMy0yMDE2MDMyNy0xMTg1Ni0xdmU0b2VuLTAueWFtbAotIEFSQ0g9eDg2
XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3Vy
bHktMjAxNjAzMjAwNwotIGNvbW1pdD1lMTMyYjliM2JjN2YxOWU5YjE1OGU0MmIzMjM4ODFkNWRl
ZTVlY2YzCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZTEzMmI5
YjNiYzdmMTllOWIxNThlNDJiMzIzODgxZDVkZWU1ZWNmMy92bWxpbnV6LTQuNS4wLXJjNC0wMDAw
My1nZTEzMmI5YgotIG1heF91cHRpbWU9OTY3Ci0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC9mc21hcmsv
MXgtMzJ0LTFIREQtYnRyZnMtNUstNDAwTS1mc3luY0JlZm9yZUNsb3NlLTE2ZC0yNTZmcGQvbGtw
LXdzMDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2Ux
MzJiOWIzYmM3ZjE5ZTliMTU4ZTQyYjMyMzg4MWQ1ZGVlNWVjZjMvMAotIExLUF9TRVJWRVI9aW5u
Ci0gfC0KICBpcG1pX3dhdGNoZG9nLnN0YXJ0X25vdz0xCgogIGVhcmx5cHJpbnRrPXR0eVMwLDEx
NTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5
c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBz
b2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1k
aXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5
MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIK
bW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZTEzMmI5YjNi
YzdmMTllOWIxNThlNDJiMzIzODgxZDVkZWU1ZWNmMy9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAi
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29z
aW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xr
cC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3ovZnMyLmNneiwvbGtwL2JlbmNobWFya3MvZnNtYXJrLmNneiIKbGludXhfaGVhZGVyc19p
bml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvZTEzMmI5YjNiYzdmMTllOWIx
NThlNDJiMzIzODgxZDVkZWU1ZWNmMy9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtl
cm5lbDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS9lMTMyYjliM2JjN2YxOWU5YjE1
OGU0MmIzMjM4ODFkNWRlZTVlY2YzL3ZtbGludXotNC41LjAtcmM0LTAwMDAzLWdlMTMyYjliIgpk
ZXF1ZXVlX3RpbWU6IDIwMTYtMDMtMjcgMTY6MjY6NTcuNzAzNDA5NjA3ICswODowMApqb2Jfc3Rh
dGU6IGZpbmlzaGVkCmxvYWRhdmc6IDI2LjcyIDExLjk5IDQuNTYgMS8zOTYgNDk1MwpzdGFydF90
aW1lOiAnMTQ1OTA2NzI3NycKZW5kX3RpbWU6ICcxNDU5MDY3NDE4Jwp2ZXJzaW9uOiAiL2xrcC9s
a3AvLnNyYy0yMDE2MDMyNS0yMDU4MTciCg==

--===============4102283497006104144==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yNyAxNjoyNzo1NiBta2ZzIC10IGJ0cmZzIC9kZXYvc2RkMQoyMDE2LTAzLTI3IDE2
OjI3OjU2IG1vdW50IC10IGJ0cmZzIC9kZXYvc2RkMSAvZnMvc2RkMQoyMDE2LTAzLTI3IDE2OjI3
OjU3IC4vZnNfbWFyayAtZCAvZnMvc2RkMS8xIC1kIC9mcy9zZGQxLzIgLWQgL2ZzL3NkZDEvMyAt
ZCAvZnMvc2RkMS80IC1kIC9mcy9zZGQxLzUgLWQgL2ZzL3NkZDEvNiAtZCAvZnMvc2RkMS83IC1k
IC9mcy9zZGQxLzggLWQgL2ZzL3NkZDEvOSAtZCAvZnMvc2RkMS8xMCAtZCAvZnMvc2RkMS8xMSAt
ZCAvZnMvc2RkMS8xMiAtZCAvZnMvc2RkMS8xMyAtZCAvZnMvc2RkMS8xNCAtZCAvZnMvc2RkMS8x
NSAtZCAvZnMvc2RkMS8xNiAtZCAvZnMvc2RkMS8xNyAtZCAvZnMvc2RkMS8xOCAtZCAvZnMvc2Rk
MS8xOSAtZCAvZnMvc2RkMS8yMCAtZCAvZnMvc2RkMS8yMSAtZCAvZnMvc2RkMS8yMiAtZCAvZnMv
c2RkMS8yMyAtZCAvZnMvc2RkMS8yNCAtZCAvZnMvc2RkMS8yNSAtZCAvZnMvc2RkMS8yNiAtZCAv
ZnMvc2RkMS8yNyAtZCAvZnMvc2RkMS8yOCAtZCAvZnMvc2RkMS8yOSAtZCAvZnMvc2RkMS8zMCAt
ZCAvZnMvc2RkMS8zMSAtZCAvZnMvc2RkMS8zMiAtRCAxNiAtTiAyNTYgLW4gMjU2MCAtTCAxIC1T
IDEgLXMgNTEyMAo=

--===============4102283497006104144==--

