Content-Type: multipart/mixed; boundary="===============9036422111817159521=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [genirq] 755d119a62: 2.7% unixbench.score
Date: Mon, 28 Sep 2015 14:08:09 +0800
Message-ID: <874mifjcty.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9036422111817159521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 755d119a6204974b2005a98549a48a75a7f5010b ("genirq: Simplify irq_data=
_to_desc()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  ivb42/unixbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/performa=
nce/dhry2reg

commit: =

  123236ccacc933daac3b39c5eb1f0011c70d41d8
  755d119a6204974b2005a98549a48a75a7f5010b

123236ccacc933da 755d119a6204974b2005a98549 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      3332 =C2=B1  0%      +2.7%       3423 =C2=B1  0%  unixbench.score
      2911 =C2=B1  0%     -35.2%       1887 =C2=B1 31%  numa-vmstat.node1.n=
r_mapped
     65282 =C2=B1  3%      -9.9%      58822 =C2=B1  6%  numa-meminfo.node1.=
Active
      4566 =C2=B1 19%     -77.9%       1008 =C2=B1173%  numa-meminfo.node1.=
AnonHugePages
    224.43 =C2=B1 22%    +913.2%       2273 =C2=B1139%  sched_debug.cfs_rq[=
10]:/.exec_clock
     14795 =C2=B1 13%    +247.1%      51350 =C2=B1102%  sched_debug.cfs_rq[=
10]:/.min_vruntime
     11.00 =C2=B1 52%     -81.8%       2.00 =C2=B1 93%  sched_debug.cfs_rq[=
10]:/.util_avg
      1.00 =C2=B1 70%    +150.0%       2.50 =C2=B1 20%  sched_debug.cfs_rq[=
19]:/.nr_spread_over
      3.75 =C2=B1 22%     -60.0%       1.50 =C2=B1 74%  sched_debug.cfs_rq[=
2]:/.nr_spread_over
      1803 =C2=B1160%    +168.0%       4831 =C2=B1 47%  sched_debug.cfs_rq[=
32]:/.exec_clock
     19131 =C2=B1114%    +333.1%      82857 =C2=B1 60%  sched_debug.cfs_rq[=
32]:/.min_vruntime
     -9020 =C2=B1-336%    -734.2%      57208 =C2=B1 80%  sched_debug.cfs_rq=
[32]:/.spread0
      6.75 =C2=B1 91%     -90.1%       0.67 =C2=B1141%  sched_debug.cfs_rq[=
42]:/.util_avg
    360.12 =C2=B1  7%    +519.9%       2232 =C2=B1126%  sched_debug.cfs_rq[=
4]:/.exec_clock
    831.25 =C2=B1  6%    +172.8%       2267 =C2=B1 29%  sched_debug.cpu#12.=
ttwu_count
      1673 =C2=B1 43%     -38.5%       1029 =C2=B1 30%  sched_debug.cpu#13.=
ttwu_count
     -1.25 =C2=B1-198%    -260.0%       2.00 =C2=B1154%  sched_debug.cpu#16=
.nr_uninterruptible
      1214 =C2=B1 11%     -47.3%     639.50 =C2=B1 24%  sched_debug.cpu#16.=
ttwu_count
     -3.00 =C2=B1-23%    -150.0%       1.50 =C2=B1137%  sched_debug.cpu#19.=
nr_uninterruptible
      1315 =C2=B1 10%     +81.6%       2388 =C2=B1 18%  sched_debug.cpu#2.t=
twu_count
    701.75 =C2=B1 68%     -73.4%     186.75 =C2=B1 17%  sched_debug.cpu#21.=
ttwu_local
    432.75 =C2=B1 20%    +132.1%       1004 =C2=B1 34%  sched_debug.cpu#27.=
ttwu_count
      4.00 =C2=B1 72%    -156.2%      -2.25 =C2=B1-164%  sched_debug.cpu#3.=
nr_uninterruptible
    907.50 =C2=B1 16%     -20.3%     723.25 =C2=B1  9%  sched_debug.cpu#34.=
nr_switches
    377.50 =C2=B1 13%     -17.0%     313.50 =C2=B1  9%  sched_debug.cpu#34.=
sched_goidle
      1886 =C2=B1129%     -84.2%     299.00 =C2=B1 20%  sched_debug.cpu#34.=
ttwu_count
    165.00 =C2=B1 23%     -29.4%     116.50 =C2=B1  3%  sched_debug.cpu#34.=
ttwu_local
    863.75 =C2=B1 32%    +230.8%       2857 =C2=B1 68%  sched_debug.cpu#37.=
sched_count
    364.00 =C2=B1 30%     +34.3%     488.75 =C2=B1 22%  sched_debug.cpu#37.=
sched_goidle
    160.00 =C2=B1 32%    +235.9%     537.50 =C2=B1 84%  sched_debug.cpu#37.=
ttwu_local
    126.50 =C2=B1  4%     +16.6%     147.50 =C2=B1  5%  sched_debug.cpu#42.=
ttwu_local
    751.00 =C2=B1 10%     +32.0%     991.00 =C2=B1 17%  sched_debug.cpu#45.=
nr_switches
    754.50 =C2=B1 10%     +31.8%     994.25 =C2=B1 17%  sched_debug.cpu#45.=
sched_count
    287.75 =C2=B1 11%     +51.6%     436.25 =C2=B1 22%  sched_debug.cpu#45.=
sched_goidle
     -1.75 =C2=B1-74%    -142.9%       0.75 =C2=B1110%  sched_debug.cpu#5.n=
r_uninterruptible
      4258 =C2=B1 27%     -41.9%       2473 =C2=B1 14%  sched_debug.cpu#6.n=
r_switches
      5247 =C2=B1 16%     -43.5%       2962 =C2=B1 13%  sched_debug.cpu#6.s=
ched_count
      2022 =C2=B1 28%     -44.8%       1116 =C2=B1 15%  sched_debug.cpu#6.s=
ched_goidle
      0.00 =C2=B1  2%      -Inf%      -4.25 =C2=B1-45%  sched_debug.cpu#8.n=
r_uninterruptible


ivb42: Ivytown Ivy Bridge-EP
Memory: 64G




                                  unixbench.score

  3440 ++------------------------------------------------------------------=
-+
       |                                                         O   O  O  =
 |
  3420 O+     O   O             O   O   O      O      O   O  O             =
 |
  3400 ++  O          O                    O       O                       =
 |
       |                 O   O                                             =
 |
  3380 ++                                                                  =
 |
       |                                                                   =
 |
  3360 ++                                                                  =
 |
       *..                                                                 =
 |
  3340 ++ .  .*...*...*..*                         *..  ..*..*...*...*..*..=
.|
  3320 ++  *.             +                      ..   *.                   =
 *
       |                   +                    .                          =
 |
  3300 ++                   +     ..*...*..*...*                           =
 |
       |                     *..*.                                         =
 |
  3280 ++------------------------------------------------------------------=
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

--===============9036422111817159521==
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
LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogMWY5M2U0YTk2
YzkxMDkzNzgyMDRjMTQ3YjNlZWMwZDBlODEwMGZkZQptb2RlbDogSXZ5dG93biBJdnkgQnJpZGdl
LUVQCm5yX2NwdTogNDgKbWVtb3J5OiA2NEcKc3dhcF9wYXJ0aXRpb25zOiBMQUJFTD1TV0FQCnJv
b3Rmc19wYXJ0aXRpb246IExBQkVMPUxLUC1ST09URlMKY2F0ZWdvcnk6IGJlbmNobWFyawp1bml4
YmVuY2g6CiAgdGVzdDogZGhyeTJyZWcKcXVldWU6IGN5Y2xpYwp0ZXN0Ym94OiBpdmI0Mgp0Ym94
X2dyb3VwOiBpdmI0MgprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDkt
MjEgMDc6MjU6MjYuMjY4MjIwMTExICswODowMAppZDogOWM2MTNkNmYzNzk5NGNiNjRhZjkxNjI3
NTAxMTgxMjgyN2I0ZTRhZAp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy00LjkKaGVhZF9jb21taXQ6
IDBlYzA1ODg3MjVhODZlYzVkZTU5OGU2MjFkNDQwODMzYmYwNTM4OTMKYmFzZV9jb21taXQ6IDFm
OTNlNGE5NmM5MTA5Mzc4MjA0YzE0N2IzZWVjMGQwZTgxMDBmZGUKYnJhbmNoOiBsaW51eC1kZXZl
bC9kZXZlbC1ob3VybHktMjAxNTA5MjQwNwprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvMWY5M2U0YTk2YzkxMDkzNzgyMDRjMTQ3YjNlZWMwZDBlODEwMGZkZS92bWxpbnV6
LTQuMy4wLXJjMiIKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9y
b290OiAiL3Jlc3VsdC91bml4YmVuY2gvcGVyZm9ybWFuY2UtZGhyeTJyZWcvaXZiNDIvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzFmOTNlNGE5NmM5MTA5
Mzc4MjA0YzE0N2IzZWVjMGQwZTgxMDBmZGUvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9p
dmI0Mi9jeWNsaWNfdW5peGJlbmNoLXBlcmZvcm1hbmNlLWRocnkycmVnLXg4Nl82NC1yaGVsLUNZ
Q0xJQ19CQVNFLTFmOTNlNGE5NmM5MTA5Mzc4MjA0YzE0N2IzZWVjMGQwZTgxMDBmZGUtMjAxNTA5
MjEtODQxMjQtMTE3aWxpNy0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNS0wOS0yNCAxMTo1OTow
MS4yNzM3NTk5MTEgKzA4OjAwCm1heF91cHRpbWU6IDk0Ni4xMTk5OTk5OTk5OTk5CmluaXRyZDog
Ii9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVy
X2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVk
L2l2YjQyL2N5Y2xpY191bml4YmVuY2gtcGVyZm9ybWFuY2UtZGhyeTJyZWcteDg2XzY0LXJoZWwt
Q1lDTElDX0JBU0UtMWY5M2U0YTk2YzkxMDkzNzgyMDRjMTQ3YjNlZWMwZDBlODEwMGZkZS0yMDE1
MDkyMS04NDEyNC0xMTdpbGk3LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQt
cmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA5MjQwNwotIGNvbW1p
dD0xZjkzZTRhOTZjOTEwOTM3ODIwNGMxNDdiM2VlYzBkMGU4MTAwZmRlCi0gQk9PVF9JTUFHRT0v
cGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMWY5M2U0YTk2YzkxMDkzNzgyMDRjMTQ3YjNl
ZWMwZDBlODEwMGZkZS92bWxpbnV6LTQuMy4wLXJjMgotIG1heF91cHRpbWU9OTQ2Ci0gUkVTVUxU
X1JPT1Q9L3Jlc3VsdC91bml4YmVuY2gvcGVyZm9ybWFuY2UtZGhyeTJyZWcvaXZiNDIvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzFmOTNlNGE5NmM5MTA5
Mzc4MjA0YzE0N2IzZWVjMGQwZTgxMDBmZGUvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBl
YXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBp
Yz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVv
dXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBv
b3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMw
LDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9s
a3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhl
bC9nY2MtNC45LzFmOTNlNGE5NmM5MTA5Mzc4MjA0YzE0N2IzZWVjMGQwZTgxMDBmZGUvbW9kdWxl
cy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9y
dW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2ht
YXJrcy91bml4YmVuY2guY2d6Igpqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDAuNzcgMC41
NyAwLjI0IDEvNTE0IDQ3MjEKc3RhcnRfdGltZTogJzE0NDMwNjcxODQnCmVuZF90aW1lOiAnMTQ0
MzA2NzMxNCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNTA5MjQtMTEwODU5Igo=

--===============9036422111817159521==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgouL1J1biBkaHJ5MnJlZwo=

--===============9036422111817159521==--

