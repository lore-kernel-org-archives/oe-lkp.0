Content-Type: multipart/mixed; boundary="===============0844165565722697470=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [cpuidle] b67bb65b9d: No primary result change, -33.1% turbostat.%Busy
Date: Tue, 22 Mar 2016 10:59:24 +0800
Message-ID: <20160322025924.GB19091@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0844165565722697470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that turbostat.%Busy -33.1% change with your commit.

https://github.com/0day-ci/linux Rik-van-Riel/cpuidle-use-high-confidence-f=
actors-only-when-considering-polling/20160317-001521
commit b67bb65b9de2d3c070073028aeb30cca6c6790a7 ("cpuidle: use high confide=
nce factors only when considering polling")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testc=
ase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/1T/lkp-=
hsx04/msync-mt/vm-scalability

commit: =

  v4.5-rc7
  b67bb65b9de2d3c070073028aeb30cca6c6790a7

        v4.5-rc7 b67bb65b9de2d3c070073028ae =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1383 =C2=B1 16%     +30.2%       1801 =C2=B1 10%  meminfo.Writeback
    341.25 =C2=B1 17%     +30.9%     446.75 =C2=B1 12%  proc-vmstat.nr_writ=
eback
      1190 =C2=B1 14%     +59.8%       1902 =C2=B1 31%  numa-vmstat.node1.n=
r_anon_pages
     79284 =C2=B1 17%     -65.8%      27126 =C2=B1 56%  numa-vmstat.node3.n=
r_inactive_anon
      0.00 =C2=B1 -1%      +Inf%      20587 =C2=B1147%  latency_stats.max.b=
t_get.blk_mq_get_tag.__blk_mq_alloc_request.blk_mq_map_request.blk_sq_make_=
request.generic_make_request.submit_bio.xfs_submit_ioend_bio.xfs_submit_ioe=
nd.xfs_vm_writepage.__writepage.write_cache_pages
      0.00 =C2=B1 -1%      +Inf%    2597215 =C2=B1130%  latency_stats.sum.b=
t_get.blk_mq_get_tag.__blk_mq_alloc_request.blk_mq_map_request.blk_sq_make_=
request.generic_make_request.submit_bio.xfs_submit_ioend_bio.xfs_submit_ioe=
nd.xfs_vm_writepage.__writepage.write_cache_pages
    311599 =C2=B1 52%   +3095.5%    9957231 =C2=B1167%  latency_stats.sum.w=
ait_on_page_bit.__filemap_fdatawait_range.filemap_fdatawait_range.filemap_w=
rite_and_wait_range.xfs_file_fsync.vfs_fsync_range.SyS_msync.entry_SYSCALL_=
64_fastpath
      3622 =C2=B1 38%     -84.8%     551.50 =C2=B1 74%  numa-meminfo.node0.=
AnonHugePages
      4754 =C2=B1 14%     +60.2%       7615 =C2=B1 31%  numa-meminfo.node1.=
AnonPages
    317153 =C2=B1 17%     -65.8%     108519 =C2=B1 56%  numa-meminfo.node3.=
Inactive(anon)
 4.011e+09 =C2=B1  2%    +234.2%  1.341e+10 =C2=B1  0%  cpuidle.C1-HSW.time
  20612300 =C2=B1  3%    +256.1%   73396067 =C2=B1  0%  cpuidle.C1-HSW.usage
  8.54e+09 =C2=B1  0%     -98.9%   94559307 =C2=B1 67%  cpuidle.POLL.time
  27143032 =C2=B1  0%     -98.5%     397406 =C2=B1  2%  cpuidle.POLL.usage
     19.34 =C2=B1  0%     -33.1%      12.94 =C2=B1  0%  turbostat.%Busy
    559.50 =C2=B1  0%     -33.1%     374.25 =C2=B1  0%  turbostat.Avg_MHz
     57.66 =C2=B1  0%     +12.3%      64.75 =C2=B1  0%  turbostat.CPU%c1
    372.25 =C2=B1  0%      -4.7%     354.77 =C2=B1  0%  turbostat.PkgWatt


lkp-hsx04: Brickland Haswell-EX
Memory: 512G


                                 turbostat.Avg_MHz

  580 ++-------------------------------------------------------------------=
-+
  560 *+.*..*...*..*..*..*..*..*...*..*..*..*..*...*..*..*..*..*..*...*..*.=
.*
      |                                                                    =
 |
  540 ++                                                                   =
 |
  520 ++                                                                   =
 |
  500 ++                                                                   =
 |
  480 ++                                                                   =
 |
      |                                                                    =
 |
  460 ++                                                                   =
 |
  440 ++                                                                   =
 |
  420 ++                                                                   =
 |
  400 ++                                                                   =
 |
      |                                                                    =
 |
  380 O+ O  O   O  O  O  O  O  O   O  O  O  O  O   O  O  O  O  O  O   O    =
 |
  360 ++-------------------------------------------------------------------=
-+


                                 turbostat._Busy

  20 ++--------------------------------------------------------------------=
-+
     *..*..*...*..*..*..*...*..*..*..*...*..*..*..*..*...*..*..*..*...*..*.=
.*
  19 ++                                                                    =
 |
  18 ++                                                                    =
 |
     |                                                                     =
 |
  17 ++                                                                    =
 |
     |                                                                     =
 |
  16 ++                                                                    =
 |
     |                                                                     =
 |
  15 ++                                                                    =
 |
  14 ++                                                                    =
 |
     |                                                                     =
 |
  13 O+ O  O   O  O  O  O   O  O  O  O   O  O  O  O  O   O  O  O  O   O    =
 |
     |                                                                     =
 |
  12 ++--------------------------------------------------------------------=
-+


                                turbostat.CPU_c1

  66 ++--------------------------------------------------------------------=
-+
     O     O                                                               =
 |
  65 ++ O      O  O  O  O   O  O  O  O   O  O  O  O  O   O  O  O  O   O    =
 |
  64 ++                                                                    =
 |
     |                                                                     =
 |
  63 ++                                                                    =
 |
  62 ++                                                                    =
 |
     |                                                                     =
 |
  61 ++                                                                    =
 |
  60 ++                                                                    =
 |
     |                                                                     =
 |
  59 ++                                                                    =
 |
  58 ++                                                                    =
 |
     *..*..*...*..*..*..*...*..*..*..*...*..*..*..*..*...*..*..*..*...*..*.=
.*
  57 ++--------------------------------------------------------------------=
-+


                                 turbostat.PkgWatt

  374 ++-------------------------------------------------------------------=
-+
  372 *+.*..                         .*..*..     ..*..*..*..  .*..*...*..  =
.*
      |     *...*..*..*..*..*..*...*.       *..*.           *.           *.=
 |
  370 ++                                                                   =
 |
  368 ++                                                                   =
 |
      |                                                                    =
 |
  366 ++                                                                   =
 |
  364 ++                                                                   =
 |
  362 ++                                                                   =
 |
      |                                                                    =
 |
  360 ++                                                                   =
 |
  358 ++                                                                   =
 |
      O                                                                    =
 |
  356 ++ O  O   O  O  O  O  O  O   O     O  O      O  O        O  O        =
 |
  354 ++------------------------------O--------O---------O--O---------O----=
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

--===============0844165565722697470==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdm0tc2NhbGFiaWxpdHkKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0
ZS1tb25pdG9yCiAga21zZzogCiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIGhlYXJ0YmVhdDogCiAg
dm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZv
OiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5m
bzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9z
dGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBu
ZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBt
ZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjog
cGVyZm9ybWFuY2UKZGVmYXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6
IApjb21taXQ6IGI2N2JiNjViOWRlMmQzYzA3MDA3MzAyOGFlYjMwY2NhNmM2NzkwYTcKbW9kZWw6
IEJyaWNrbGFuZCBIYXN3ZWxsLUVYCm5yX2NwdTogMTIwCm1lbW9yeTogNTEyRwpucl9zc2RfcGFy
dGl0aW9uczogMQpzc2RfcGFydGl0aW9uczogIi9kZXYvbnZtZTBuMXAxIgpzd2FwX3BhcnRpdGlv
bnM6IApyb290ZnNfcGFydGl0aW9uOiAKcG1ldGVyX3NlcnZlcjogbGtwLXN0MDEKcG1ldGVyX2Rl
dmljZTogeW9rb2dhd2Etd3QzMTAKY2F0ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2ZpbGU6IApy
dW50aW1lOiAzMDBzCnNpemU6IDFUCnZtLXNjYWxhYmlsaXR5OgogIHRlc3Q6IG1zeW5jLW10CnF1
ZXVlOiBiaXNlY3QKdGVzdGJveDogbGtwLWhzeDA0CnRib3hfZ3JvdXA6IGxrcC1oc3gwNAprY29u
ZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDMtMjEgMTE6NDE6MDkuODE1MTQ5
NTY3ICswODowMApjb21waWxlcjogZ2NjLTQuOQpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oKaWQ6IDAwMmM4ZTFkMzY1OGU1Y2Q4OTc4YWQwNTUyZWU3ZmU1NDNmNjRhZjAKdXNl
cjogbGtwCmhlYWRfY29tbWl0OiBjZDFhOGFmMDlmMjUwNTRmMDFjMGYwNmRjZDQzZDk5YTMxOTZl
YjBjCmJhc2VfY29tbWl0OiBiNTYyZTQ0ZjUwN2U4NjNjNjc5Mjk0NmU0ZTFiMTQ0OWZiYmFjODVk
CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMzIwMTUKcmVzdWx0X3Jvb3Q6
ICIvcmVzdWx0L3ZtLXNjYWxhYmlsaXR5L3BlcmZvcm1hbmNlLTMwMHMtMVQtbXN5bmMtbXQvbGtw
LWhzeDA0L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS9i
NjdiYjY1YjlkZTJkM2MwNzAwNzMwMjhhZWIzMGNjYTZjNjc5MGE3LzAiCmpvYl9maWxlOiAiL2xr
cC9zY2hlZHVsZWQvbGtwLWhzeDA0L2Jpc2VjdF92bS1zY2FsYWJpbGl0eS1wZXJmb3JtYW5jZS0z
MDBzLTFULW1zeW5jLW10LWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwt
YjY3YmI2NWI5ZGUyZDNjMDcwMDczMDI4YWViMzBjY2E2YzY3OTBhNy0yMDE2MDMyMS03OTU0NC13
eG8xdnEtMC55YW1sIgptYXhfdXB0aW1lOiAxNTAwCmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9k
ZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9k
ZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1oc3gwNC9iaXNlY3Rf
dm0tc2NhbGFiaWxpdHktcGVyZm9ybWFuY2UtMzAwcy0xVC1tc3luYy1tdC1kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLWI2N2JiNjViOWRlMmQzYzA3MDA3MzAyOGFlYjMw
Y2NhNmM2NzkwYTctMjAxNjAzMjEtNzk1NDQtd3hvMXZxLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0g
a2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAx
NjAzMjAxNQotIGNvbW1pdD1iNjdiYjY1YjlkZTJkM2MwNzAwNzMwMjhhZWIzMGNjYTZjNjc5MGE3
Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvYjY3YmI2NWI5ZGUy
ZDNjMDcwMDczMDI4YWViMzBjY2E2YzY3OTBhNy92bWxpbnV6LTQuNS4wLXJjNy0wMDAwMS1nYjY3
YmI2NQotIG1heF91cHRpbWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvdm0tc2NhbGFiaWxp
dHkvcGVyZm9ybWFuY2UtMzAwcy0xVC1tc3luYy1tdC9sa3AtaHN4MDQvZGViaWFuLXg4Nl82NC0y
MDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45L2I2N2JiNjViOWRlMmQzYzA3MDA3MzAy
OGFlYjMwY2NhNmM2NzkwYTcvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50
az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBz
eXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAg
cGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmlj
IGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBj
b25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4
Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45
L2I2N2JiNjViOWRlMmQzYzA3MDA3MzAyOGFlYjMwY2NhNmM2NzkwYTcvbW9kdWxlcy5jZ3oiCmJt
X2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3Au
Y2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25m
aWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0
YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy92bS1z
Y2FsYWJpbGl0eS5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQt
cmhlbC9nY2MtNC45L2I2N2JiNjViOWRlMmQzYzA3MDA3MzAyOGFlYjMwY2NhNmM2NzkwYTcvbGlu
dXgtaGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1y
aGVsL2djYy00LjkvYjY3YmI2NWI5ZGUyZDNjMDcwMDczMDI4YWViMzBjY2E2YzY3OTBhNy92bWxp
bnV6LTQuNS4wLXJjNy0wMDAwMS1nYjY3YmI2NSIKZGVxdWV1ZV90aW1lOiAyMDE2LTAzLTIxIDEx
OjQ1OjIwLjY0MTcwNTk2MSArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA4LjA0
IDcxLjUzIDcyLjAxIDEvMTM5NiAzMjA3OQpzdGFydF90aW1lOiAnMTQ1ODUzMTk4NScKZW5kX3Rp
bWU6ICcxNDU4NTMyODg0Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDMxOC0xNTUwMTIi
Cg==

--===============0844165565722697470==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAxL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTIvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyNi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMxL2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM3L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTQvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0y
MSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNDIvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0y
MSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE2L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAx
MTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTgv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE5L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2
OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0
IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMy9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0y
MSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMxL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzMi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAx
MTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM0L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzNS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0
NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzOC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0Njoy
NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTQwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTQ2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEg
MTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ5
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0
NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTEvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0Njoy
NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTQvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTcvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTYxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Mi9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEg
MTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY0
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NS9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6
NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY3L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6
MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTczL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzgvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTc5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIx
IDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1ODEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6
NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgyL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6
MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1ODcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTIxIDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU5Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTk0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIx
IDExOjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDMtMjEgMTE6NDY6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTIxIDEx
OjQ2OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5OC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yMSAxMTo0NjoyNCBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDMtMjEgMTE6NDY6MjUgbW91bnQgLXQgdG1wZnMgLW8gc2l6ZT0xMDAlIHZtLXNj
YWxhYmlsaXR5LXRtcCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcAoyMDE2LTAzLTIxIDExOjQ2OjI1
IHRydW5jYXRlIC1zIDU0MDkyMTk0MjAxNiAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2Fs
YWJpbGl0eS5pbWcKMjAxNi0wMy0yMSAxMTo0NjoyNSBta2ZzLnhmcyAtcSAvdG1wL3ZtLXNjYWxh
YmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS5pbWcKMjAxNi0wMy0yMSAxMTo0NjoyNSBtb3VudCAt
byBsb29wIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5LmltZyAvdG1wL3Zt
LXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eQoyMDE2LTAzLTIxIDExOjQ2OjI1IC4vY2Fz
ZS1tc3luYy1tdAoyMDE2LTAzLTIxIDExOjQ2OjI1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxp
dHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAx
Ni0wMy0yMSAxMTo0NjoyNSAuL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1w
L3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1w
cmVhbGxvYyAtLW9wZW4tcncgMTg3ODIwMTE4NwoyMDE2LTAzLTIxIDExOjQ3OjQwIC4vY2FzZS1t
c3luYy1tdAoyMDE2LTAzLTIxIDExOjQ3OjQwIHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHkt
dG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0w
My0yMSAxMTo0Nzo0MCAuL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3Zt
LXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVh
bGxvYyAtLW9wZW4tcncgMTg3ODIwMTE4NwoyMDE2LTAzLTIxIDExOjQ4OjU1IC4vY2FzZS1tc3lu
Yy1tdAoyMDE2LTAzLTIxIDExOjQ4OjU1IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1w
L3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0y
MSAxMTo0ODo1NSAuL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNj
YWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxv
YyAtLW9wZW4tcncgMTg3ODIwMTE4NwoyMDE2LTAzLTIxIDExOjUwOjA5IC4vY2FzZS1tc3luYy1t
dAoyMDE2LTAzLTIxIDExOjUwOjA5IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3Zt
LXNjYWxhYmlsaXR5L3NwYXJzZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0yMSAx
MTo1MDowOSAuL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNjYWxh
YmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxvYyAt
LW9wZW4tcncgMTg3ODIwMTE4NwoyMDE2LTAzLTIxIDExOjUxOjIyIC4vY2FzZS1tc3luYy1tdAoy
MDE2LTAzLTIxIDExOjUxOjIyIHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNj
YWxhYmlsaXR5L3NwYXJzZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0yMSAxMTo1
MToyMiAuL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNjYWxhYmls
aXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxvYyAtLW9w
ZW4tcncgMTg3ODIwMTE4NwoyMDE2LTAzLTIxIDExOjUyOjM3IC4vY2FzZS1tc3luYy1tdAoyMDE2
LTAzLTIxIDExOjUyOjM3IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxh
YmlsaXR5L3NwYXJzZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0yMSAxMTo1Mjoz
NyAuL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNjYWxhYmlsaXR5
LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxvYyAtLW9wZW4t
cncgMTg3ODIwMTE4NwoyMDE2LTAzLTIxIDExOjUzOjUyIC4vY2FzZS1tc3luYy1tdAoyMDE2LTAz
LTIxIDExOjUzOjUyIHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmls
aXR5L3NwYXJzZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0yMSAxMTo1Mzo1MiAu
L3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRt
cC92bS1zY2FsYWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxvYyAtLW9wZW4tcncg
MTg3ODIwMTE4NwoyMDE2LTAzLTIxIDExOjU1OjA3IC4vY2FzZS1tc3luYy1tdAoyMDE2LTAzLTIx
IDExOjU1OjA3IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5
L3NwYXJzZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0yMSAxMTo1NTowNyAuL3Vz
ZW1lbSAtLXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92
bS1zY2FsYWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxvYyAtLW9wZW4tcncgMTg3
ODIwMTE4NwoyMDE2LTAzLTIxIDExOjU2OjIyIC4vY2FzZS1tc3luYy1tdAoyMDE2LTAzLTIxIDEx
OjU2OjIyIHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3Nw
YXJzZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0yMSAxMTo1NjoyMiAuL3VzZW1l
bSAtLXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1z
Y2FsYWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxvYyAtLW9wZW4tcncgMTg3ODIw
MTE4NwoyMDE2LTAzLTIxIDExOjU3OjM3IC4vY2FzZS1tc3luYy1tdAoyMDE2LTAzLTIxIDExOjU3
OjM3IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJz
ZS1tc3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0yMSAxMTo1NzozNyAuL3VzZW1lbSAt
LXJ1bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2Fs
YWJpbGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxvYyAtLW9wZW4tcncgMTg3ODIwMTE4
NwoyMDE2LTAzLTIxIDExOjU4OjUzIC4vY2FzZS1tc3luYy1tdAoyMDE2LTAzLTIxIDExOjU4OjUz
IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1t
c3luYy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0yMSAxMTo1ODo1MyAuL3VzZW1lbSAtLXJ1
bnRpbWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJp
bGl0eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxvYyAtLW9wZW4tcncgMTg3ODIwMTE4Nwoy
MDE2LTAzLTIxIDEyOjAwOjA5IC4vY2FzZS1tc3luYy1tdAoyMDE2LTAzLTIxIDEyOjAwOjA5IHRy
dW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1tc3lu
Yy1tdCAtcyA1NDA5MjE5NDIwMTYKMjAxNi0wMy0yMSAxMjowMDowOSAuL3VzZW1lbSAtLXJ1bnRp
bWUgMzAwIC1TIC10IDE0NCAtZiAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0
eS9zcGFyc2UtbXN5bmMtbXQgLUYgLS1wcmVhbGxvYyAtLW9wZW4tcncgMTg3ODIwMTE4NwoyMDE2
LTAzLTIxIDEyOjAxOjI0IHVtb3VudCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJp
bGl0eQoyMDE2LTAzLTIxIDEyOjAxOjI0IHJtIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNj
YWxhYmlsaXR5LmltZwoyMDE2LTAzLTIxIDEyOjAxOjI0IHVtb3VudCAvdG1wL3ZtLXNjYWxhYmls
aXR5LXRtcAo=

--===============0844165565722697470==--

