Content-Type: multipart/mixed; boundary="===============2950280708678263069=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [futex] 65d8fc777f: +25.6% will-it-scale.per_process_ops
Date: Mon, 29 Feb 2016 16:36:38 +0800
Message-ID: <871t7vzze1.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2950280708678263069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 65d8fc777f6dcfee12785c057a6b57f679641c90 ("futex: Remove requirement=
 for lock_page() in get_futex_key()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sbx04/fu=
tex1/will-it-scale

commit: =

  8ad7b378d0d016309014cae0f640434bca7b5e11
  65d8fc777f6dcfee12785c057a6b57f679641c90

8ad7b378d0d01630 65d8fc777f6dcfee12785c057a =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   5076304 =C2=B1  0%     +25.6%    6374220 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
   1194117 =C2=B1  0%     +14.4%    1366153 =C2=B1  1%  will-it-scale.per_t=
hread_ops
      0.58 =C2=B1  0%      -2.0%       0.57 =C2=B1  0%  will-it-scale.scala=
bility
      6820 =C2=B1  0%     -19.6%       5483 =C2=B1 15%  meminfo.AnonHugePag=
es
      2652 =C2=B1  5%     -10.4%       2375 =C2=B1  2%  vmstat.system.cs
      2848 =C2=B1 32%    +141.2%       6870 =C2=B1 65%  numa-meminfo.node1.=
Active(anon)
      2832 =C2=B1 31%     +57.6%       4465 =C2=B1 27%  numa-meminfo.node1.=
AnonPages
     15018 =C2=B1 12%     -23.3%      11515 =C2=B1 15%  numa-meminfo.node2.=
AnonPages
      1214 =C2=B1 14%     -22.8%     936.75 =C2=B1 20%  numa-meminfo.node3.=
PageTables
    712.25 =C2=B1 32%    +141.2%       1718 =C2=B1 65%  numa-vmstat.node1.n=
r_active_anon
    708.25 =C2=B1 31%     +57.7%       1116 =C2=B1 27%  numa-vmstat.node1.n=
r_anon_pages
      3754 =C2=B1 12%     -23.3%       2879 =C2=B1 15%  numa-vmstat.node2.n=
r_anon_pages
    304.75 =C2=B1 14%     -23.1%     234.50 =C2=B1 20%  numa-vmstat.node3.n=
r_page_table_pages
      3.53 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.___might_sleep.__might_sleep.get_futex_key.futex_wake.do_futex
      4.34 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.__might_sleep.get_futex_key.futex_wake.do_futex.sys_futex
      1.27 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.__wake_up_bit.unlock_page.get_futex_key.futex_wake.do_futex
      4.36 =C2=B1  1%     +29.6%       5.65 =C2=B1  1%  perf-profile.cycles=
.drop_futex_key_refs.isra.12.futex_wake.do_futex.sys_futex.entry_SYSCALL_64=
_fastpath
      6.69 =C2=B1  1%     +28.1%       8.57 =C2=B1  0%  perf-profile.cycles=
.entry_SYSCALL_64
      6.73 =C2=B1  0%     +30.6%       8.79 =C2=B1  0%  perf-profile.cycles=
.entry_SYSCALL_64_after_swapgs
     74.21 =C2=B1  0%     -11.0%      66.06 =C2=B1  0%  perf-profile.cycles=
.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
     59.05 =C2=B1  0%     -21.4%      46.40 =C2=B1  0%  perf-profile.cycles=
.get_futex_key.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      4.12 =C2=B1  0%     +78.5%       7.36 =C2=B1  1%  perf-profile.cycles=
.get_futex_key_refs.isra.11.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_=
fastpath
      2.27 =C2=B1  3%     +24.1%       2.82 =C2=B1  4%  perf-profile.cycles=
.get_user_pages_fast.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastpath
     26.95 =C2=B1  0%     +30.0%      35.04 =C2=B1  1%  perf-profile.cycles=
.get_user_pages_fast.get_futex_key.futex_wake.do_futex.sys_futex
     13.43 =C2=B1  0%     +27.2%      17.09 =C2=B1  1%  perf-profile.cycles=
.gup_pte_range.gup_pud_range.get_user_pages_fast.get_futex_key.futex_wake
     19.66 =C2=B1  1%     +28.4%      25.24 =C2=B1  0%  perf-profile.cycles=
.gup_pud_range.get_user_pages_fast.get_futex_key.futex_wake.do_futex
      4.33 =C2=B1  1%     +37.0%       5.93 =C2=B1  4%  perf-profile.cycles=
.hash_futex.do_futex.sys_futex.entry_SYSCALL_64_fastpath
     13.59 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.unlock_page.get_futex_key.futex_wake.do_futex.sys_futex
     15160 =C2=B1 19%     -34.8%       9883 =C2=B1  0%  sched_debug.cfs_rq:=
/.exec_clock.min
     27.25 =C2=B1 15%     -37.6%      17.00 =C2=B1  8%  sched_debug.cfs_rq:=
/.load_avg.7
     21.00 =C2=B1 38%     -27.4%      15.25 =C2=B1  2%  sched_debug.cpu.cpu=
_load[2].1
     21.00 =C2=B1 38%     -27.4%      15.25 =C2=B1  2%  sched_debug.cpu.cpu=
_load[3].1
     21.00 =C2=B1 38%     -27.4%      15.25 =C2=B1  2%  sched_debug.cpu.cpu=
_load[4].1
      1790 =C2=B1  0%     +42.4%       2549 =C2=B1 45%  sched_debug.cpu.cur=
r->pid.21
     50033 =C2=B1  4%      -6.8%      46622 =C2=B1  4%  sched_debug.cpu.nr_=
load_updates.29
      4398 =C2=B1 42%    +103.5%       8949 =C2=B1 23%  sched_debug.cpu.nr_=
switches.11
      7452 =C2=B1 34%    +111.3%      15744 =C2=B1 54%  sched_debug.cpu.nr_=
switches.20
      3739 =C2=B1 13%    +213.5%      11723 =C2=B1 40%  sched_debug.cpu.nr_=
switches.23
      1648 =C2=B1 53%     +96.5%       3239 =C2=B1 63%  sched_debug.cpu.nr_=
switches.51
      0.25 =C2=B1519%   -1300.0%      -3.00 =C2=B1-52%  sched_debug.cpu.nr_=
uninterruptible.24
      8632 =C2=B1 16%     -32.5%       5823 =C2=B1 19%  sched_debug.cpu.sch=
ed_count.1
      5091 =C2=B1 36%    +137.5%      12092 =C2=B1 31%  sched_debug.cpu.sch=
ed_count.11
     12453 =C2=B1 90%     -74.6%       3159 =C2=B1 24%  sched_debug.cpu.sch=
ed_count.2
      7782 =C2=B1 32%    +118.2%      16977 =C2=B1 46%  sched_debug.cpu.sch=
ed_count.20
      2665 =C2=B1 48%     -49.8%       1337 =C2=B1 30%  sched_debug.cpu.sch=
ed_count.32
      1365 =C2=B1 11%     -14.0%       1174 =C2=B1  3%  sched_debug.cpu.sch=
ed_count.45
      1693 =C2=B1 51%    +147.7%       4193 =C2=B1 42%  sched_debug.cpu.sch=
ed_count.51
      5023 =C2=B1 57%     -51.5%       2434 =C2=B1 43%  sched_debug.cpu.sch=
ed_count.57
      1705 =C2=B1 16%    +129.6%       3915 =C2=B1 48%  sched_debug.cpu.sch=
ed_goidle.23
    536.25 =C2=B1 14%     -18.7%     435.75 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.45
      1228 =C2=B1 19%     -27.3%     892.50 =C2=B1 17%  sched_debug.cpu.sch=
ed_goidle.5
      1919 =C2=B1 55%     +88.5%       3617 =C2=B1 37%  sched_debug.cpu.ttw=
u_count.11
      7699 =C2=B1 35%     -43.7%       4335 =C2=B1 43%  sched_debug.cpu.ttw=
u_count.24
      5380 =C2=B1 36%     -45.6%       2926 =C2=B1 18%  sched_debug.cpu.ttw=
u_count.30
    563.25 =C2=B1 20%    +140.3%       1353 =C2=B1 38%  sched_debug.cpu.ttw=
u_local.11
      4297 =C2=B1 46%     -49.1%       2186 =C2=B1 39%  sched_debug.cpu.ttw=
u_local.24
      2828 =C2=B1 47%     -47.8%       1475 =C2=B1 34%  sched_debug.cpu.ttw=
u_local.27
      3243 =C2=B1 36%     -54.3%       1482 =C2=B1 32%  sched_debug.cpu.ttw=
u_local.30
    199.25 =C2=B1  6%    +100.6%     399.75 =C2=B1 32%  sched_debug.cpu.ttw=
u_local.44
      1158 =C2=B1 64%     -67.3%     379.00 =C2=B1 46%  sched_debug.cpu.ttw=
u_local.54
    242.25 =C2=B1 21%     +51.0%     365.75 =C2=B1 19%  sched_debug.cpu.ttw=
u_local.55
      1009 =C2=B1 26%     -50.8%     496.50 =C2=B1 44%  sched_debug.cpu.ttw=
u_local.59
      1736 =C2=B1 53%     -67.8%     559.25 =C2=B1 22%  sched_debug.cpu.ttw=
u_local.9


lkp-sbx04: Sandy Bridge-EX
Memory: 64G


   perf-profile.cycles.futex_wake.do_futex.sys_futex.entry_SYSCALL_64_fastp=
ath

  76 ++--------------------------------------------------------------------=
-+
     |                                                                     =
 |
  74 ++   .*..        .*..*..*..     .*..    .*..  .*..  .*..  .*..*..*..* =
 |
     *..*.    *..*..*.          *..*.    *.*.    *.    *.    *.            =
 |
     |                                                                     =
 |
  72 ++                                                                    =
 |
     |                                                                     =
 |
  70 ++                                                                    =
 |
     |                                                                     =
 |
  68 ++                                                                    =
 |
     |                                                                     =
 |
     |                          O  O  O    O  O  O  O     O  O     O  O    =
 |
  66 O+                                  O             O        O        O =
 O
     |  O  O  O  O     O  O  O                                             =
 |
  64 ++-------------O------------------------------------------------------=
-+



                             will-it-scale.per_process_ops

  6.6e+06 O+----O-O--O-----------------------------------------------------=
-+
          |  O          O  O O  O                                          =
 |
  6.4e+06 ++                       O  O O  O  O  O O  O  O  O O  O  O  O O =
 O
          |                                                                =
 |
  6.2e+06 ++                                                               =
 |
    6e+06 ++                                                               =
 |
          |                                                                =
 |
  5.8e+06 ++                                                               =
 |
          |                                                                =
 |
  5.6e+06 ++                                                               =
 |
  5.4e+06 ++                                                               =
 |
          |                                                                =
 |
  5.2e+06 ++                                                               =
 |
          *..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.*..*..*..*.* =
 |
    5e+06 ++---------------------------------------------------------------=
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

--===============2950280708678263069==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2
bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86
IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZv
OiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0
YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5m
c3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1l
dGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBw
ZXJmb3JtYW5jZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzog
CmNvbW1pdDogNjVkOGZjNzc3ZjZkY2ZlZTEyNzg1YzA1N2E2YjU3ZjY3OTY0MWM5MAptb2RlbDog
U2FuZHkgQnJpZGdlLUVYCm5yX2NwdTogNjQKbWVtb3J5OiA2NEcKbnJfc3NkX3BhcnRpdGlvbnM6
IDcKc3NkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUlOVEVMX1NTRFNDMiotcGFy
dDEiCnN3YXBfcGFydGl0aW9uczogCmNhdGVnb3J5OiBiZW5jaG1hcmsKcGVyZi1wcm9maWxlOgog
IGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IGZ1dGV4MQpxdWV1ZTogYmlzZWN0CnRl
c3Rib3g6IGxrcC1zYngwNAp0Ym94X2dyb3VwOiBsa3Atc2J4MDQKa2NvbmZpZzogeDg2XzY0LXJo
ZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTAyLTI4IDIzOjQ1OjUyLjE5OTE2NTU2MyArMDg6MDAKY29t
cGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiA2
YjJjMmJkNzQ0ZGQ4OTgwMDk2NDhjYjgyZGU3ZTBiYTc3ZGUzM2YxCnVzZXI6IGxrcApoZWFkX2Nv
bW1pdDogZWQ1MjBjMzI3YzQyNTllYzA4YjE2NzcwMjMwODdmNjU4MzI5Yjk2MQpiYXNlX2NvbW1p
dDogODFmNzBiYTIzM2Q1ZjY2MGUxZWE1ZmUyMzI2MGVlMzIzYWY1ZDUzYQpicmFuY2g6IGxpbnV4
LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDIyODExCnJlc3VsdF9yb290OiAiL3Jlc3VsdC93aWxs
LWl0LXNjYWxlL3BlcmZvcm1hbmNlLWZ1dGV4MS9sa3Atc2J4MDQvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzY1ZDhmYzc3N2Y2ZGNmZWUxMjc4NWMwNTdh
NmI1N2Y2Nzk2NDFjOTAvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3Atc2J4MDQvYmlz
ZWN0X3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2UtZnV0ZXgxLWRlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oteDg2XzY0LXJoZWwtNjVkOGZjNzc3ZjZkY2ZlZTEyNzg1YzA1N2E2YjU3ZjY3OTY0
MWM5MC0yMDE2MDIyOC0yMzY1MC0xN2M0cWMxLTAueWFtbCIKbWF4X3VwdGltZTogMTUwMAppbml0
cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNneiIKYm9vdGxv
YWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3NjaGVk
dWxlZC9sa3Atc2J4MDQvYmlzZWN0X3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2UtZnV0ZXgxLWRl
Ymlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNjVkOGZjNzc3ZjZkY2ZlZTEy
Nzg1YzA1N2E2YjU3ZjY3OTY0MWM5MC0yMDE2MDIyOC0yMzY1MC0xN2M0cWMxLTAueWFtbAotIEFS
Q0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZl
bC1ob3VybHktMjAxNjAyMjgxMQotIGNvbW1pdD02NWQ4ZmM3NzdmNmRjZmVlMTI3ODVjMDU3YTZi
NTdmNjc5NjQxYzkwCi0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00Ljkv
NjVkOGZjNzc3ZjZkY2ZlZTEyNzg1YzA1N2E2YjU3ZjY3OTY0MWM5MC92bWxpbnV6LTQuNS4wLXJj
My0wMDIzNS1nNjVkOGZjNwotIG1heF91cHRpbWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQv
d2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS1mdXRleDEvbGtwLXNieDA0L2RlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS82NWQ4ZmM3NzdmNmRjZmVlMTI3ODVj
MDU3YTZiNTdmNjc5NjQxYzkwLzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmlu
dGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcg
c3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAog
IHBhbmljPS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5p
YyBsb2FkX3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAg
Y29uc29sZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14
ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQu
OS82NWQ4ZmM3NzdmNmRjZmVlMTI3ODVjMDU3YTZiNTdmNjc5NjQxYzkwL21vZHVsZXMuY2d6Igpi
bV9pbml0cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtw
LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29u
ZmlnLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9z
dGF0LmNneiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovd2lsbC1pdC1zY2FsZS5jZ3osL2xrcC9iZW5jaG1hcmtz
L3dpbGwtaXQtc2NhbGUuY2d6LC9sa3AvYmVuY2htYXJrcy93aWxsLWl0LXNjYWxlLXg4Nl82NC5j
Z3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45
LzY1ZDhmYzc3N2Y2ZGNmZWUxMjc4NWMwNTdhNmI1N2Y2Nzk2NDFjOTAvbGludXgtaGVhZGVycy5j
Z3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00Ljkv
NjVkOGZjNzc3ZjZkY2ZlZTEyNzg1YzA1N2E2YjU3ZjY3OTY0MWM5MC92bWxpbnV6LTQuNS4wLXJj
My0wMDIzNS1nNjVkOGZjNyIKZGVxdWV1ZV90aW1lOiAyMDE2LTAyLTI4IDIzOjQ2OjMzLjkzODkx
NTE3OCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiA0NS4yNyAyMC4xMiA3Ljg0
IDIvNjQ5IDExNTU5CnN0YXJ0X3RpbWU6ICcxNDU2Njc0NDQ1JwplbmRfdGltZTogJzE0NTY2NzQ3
NTQnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTYwMjI2LTE5NDkwOCIK

--===============2950280708678263069==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDIt
MjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjgg
MjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6
NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0Nzoy
NCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjgg
MjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6
NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6
MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4
IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6
NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6
MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAy
LTI4IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU2MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDItMjggMjM6NDc6MjQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAyLTI4
IDIzOjQ3OjI0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0
NzoyNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMi0yOCAyMzo0NzoyNSAuL3J1bnRlc3QucHkgZnV0
ZXgxIDE2IGJvdGggMSA4IDE2IDI0IDMyIDQ4IDY0Cg==

--===============2950280708678263069==--

