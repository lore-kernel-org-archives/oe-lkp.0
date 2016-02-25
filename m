Content-Type: multipart/mixed; boundary="===============7627213843486997165=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [cpufreq] 8fb47ff100: -3.2% unixbench.score
Date: Thu, 25 Feb 2016 09:14:47 +0800
Message-ID: <87io1dd20o.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7627213843486997165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 8fb47ff100af48034eb11449a81f42af24213987 ("cpufreq: governor: Replac=
e timers with utilization update callbacks")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/kconfig/nr_task/rootfs/tbox_group/test/testcase:
  gcc-4.9/x86_64-rhel/1/debian-x86_64-2015-02-07.cgz/nhm-white/shell1/unixb=
ench

commit: =

  402c43ed2d7433d7a0a4cf2767bedc239f680155
  8fb47ff100af48034eb11449a81f42af24213987

402c43ed2d7433d7 8fb47ff100af48034eb11449a8 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      1555 =C2=B1  0%      -3.2%       1506 =C2=B1  0%  unixbench.score
    286697 =C2=B1  0%      -7.0%     266678 =C2=B1  0%  unixbench.time.invo=
luntary_context_switches
  17730295 =C2=B1  0%      -3.1%   17172749 =C2=B1  0%  unixbench.time.mino=
r_page_faults
    616646 =C2=B1  0%      -3.1%     597250 =C2=B1  0%  unixbench.time.volu=
ntary_context_switches
    288.75 =C2=B1  0%      -3.0%     280.00 =C2=B1  0%  turbostat.Avg_MHz
   1956505 =C2=B1 12%     -39.9%    1176054 =C2=B1  8%  cpuidle.C1E-NHM.time
      7033 =C2=B1  4%     -18.0%       5765 =C2=B1  1%  cpuidle.C1E-NHM.usa=
ge
     14204 =C2=B1  0%      -2.8%      13801 =C2=B1  0%  vmstat.system.cs
      1628 =C2=B1  0%     +43.3%       2332 =C2=B1  0%  vmstat.system.in
      2855 =C2=B1  1%     -11.1%       2538 =C2=B1  1%  sched_debug.cfs_rq:=
/.exec_clock.stddev
     43.25 =C2=B1 19%     -39.3%      26.25 =C2=B1 18%  sched_debug.cfs_rq:=
/.load_avg.2
     20.00 =C2=B1  5%    +135.0%      47.00 =C2=B1 68%  sched_debug.cfs_rq:=
/.load_avg.7
     15987 =C2=B1  3%     -14.5%      13672 =C2=B1  1%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.33 =C2=B1 14%     +38.1%       0.45 =C2=B1  5%  sched_debug.cfs_rq:=
/.nr_running.avg
      2.00 =C2=B1 79%    +450.0%      11.00 =C2=B1 19%  sched_debug.cfs_rq:=
/.runnable_load_avg.2
      5.55 =C2=B1 19%     +34.1%       7.44 =C2=B1 10%  sched_debug.cfs_rq:=
/.runnable_load_avg.avg
    -33720 =C2=B1 -1%     -17.3%     -27894 =C2=B1 -4%  sched_debug.cfs_rq:=
/.spread0.4
    -33413 =C2=B1 -3%     -13.7%     -28847 =C2=B1 -3%  sched_debug.cfs_rq:=
/.spread0.5
    -33146 =C2=B1 -3%     -18.0%     -27185 =C2=B1 -1%  sched_debug.cfs_rq:=
/.spread0.6
    -33527 =C2=B1 -1%     -12.8%     -29230 =C2=B1 -2%  sched_debug.cfs_rq:=
/.spread0.7
    -17639 =C2=B1 -2%     -16.2%     -14779 =C2=B1 -4%  sched_debug.cfs_rq:=
/.spread0.avg
    -34541 =C2=B1 -1%     -14.2%     -29641 =C2=B1 -2%  sched_debug.cfs_rq:=
/.spread0.min
     15990 =C2=B1  3%     -14.5%      13674 =C2=B1  1%  sched_debug.cfs_rq:=
/.spread0.stddev
    708107 =C2=B1 10%     +22.0%     863894 =C2=B1  5%  sched_debug.cpu.avg=
_idle.0
     13049 =C2=B1 44%     -37.5%       8162 =C2=B1 38%  sched_debug.cpu.cur=
r->pid.6
     22214 =C2=B1  0%     -13.1%      19305 =C2=B1  0%  sched_debug.cpu.cur=
r->pid.max
      9922 =C2=B1  4%      -7.6%       9164 =C2=B1  1%  sched_debug.cpu.cur=
r->pid.stddev
     29.00 =C2=B1 12%    +162.1%      76.00 =C2=B1 36%  sched_debug.cpu.loa=
d.2
    124.75 =C2=B1 61%     -63.1%      46.00 =C2=B1 42%  sched_debug.cpu.loa=
d.3
     15.50 =C2=B1 92%    +343.5%      68.75 =C2=B1 59%  sched_debug.cpu.loa=
d.4
     54.67 =C2=B1 33%     +43.6%      78.50 =C2=B1  3%  sched_debug.cpu.loa=
d.7
      0.35 =C2=B1 11%     +28.9%       0.45 =C2=B1 11%  sched_debug.cpu.nr_=
running.avg
      8.52 =C2=B1 15%     +29.7%      11.06 =C2=B1 10%  sched_debug.cpu.nr_=
uninterruptible.stddev
     25833 =C2=B1  0%      +9.4%      28264 =C2=B1  2%  sched_debug.cpu.ttw=
u_local.3
     18030 =C2=B1  2%     +10.7%      19951 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.5
     17450 =C2=B1  1%      +9.8%      19158 =C2=B1  1%  sched_debug.cpu.ttw=
u_local.6


nhm-white: Nehalem
Memory: 6G



                                  unixbench.score

  1560 ++------------------------------------------------------------------=
-+
       |        .*. .*.       .*. .*.*.*.. .*.   .*. .*.*.*. .*.*.*.*.*    =
 |
  1550 *+*.*.*.*   *   *.*.*.*   *        *   *.*   *       *              =
 |
  1540 ++                                                                  =
 |
       |                                                                   =
 |
  1530 ++                                                                  =
 |
       |                                                                   =
 |
  1520 ++                                                                  =
 |
       |                                                                   =
 |
  1510 ++                                                     O O O O O O O=
 |
  1500 ++                                                 O O              =
 O
       O O O O O O O O O     O O                  O O O O                  =
 |
  1490 ++                O O     O O O    O O O O                          =
 |
       |                               O                                   =
 |
  1480 ++------------------------------------------------------------------=
-+


                           unixbench.time.minor_page_faults

  1.78e+07 ++--------------------------------------------------------------=
-+
           |                                                    .**.*.*    =
 |
  1.77e+07 *+*.*.*.*.**.*.*.*.*.*.*.*.*.*.*.**.*.*.*.*.*.*.*.*.*           =
 |
  1.76e+07 ++                                                              =
 |
           |                                                               =
 |
  1.75e+07 ++                                                              =
 |
  1.74e+07 ++                                                              =
 |
           |                                                               =
 |
  1.73e+07 ++                                                              =
 |
  1.72e+07 ++                                                              =
 |
           |                                               O O O OO O O O O=
 O
  1.71e+07 O+O O          O       O                O   O                   =
 |
   1.7e+07 ++    O O OO O     O O                O   O   O                 =
 |
           |                O       O O O O OO O                           =
 |
  1.69e+07 ++--------------------------------------------------------------=
-+


                      unixbench.time.voluntary_context_switches

  620000 ++----------------------------------------------------------------=
-+
         |                                                       .*.       =
 |
  615000 *+*.*.*.*.*.*.*.     .*.*.*.*.*.*.**. .*.*.*.*.*.*.*.*.*   *.*    =
 |
         |               *.*.*                *                            =
 |
         |                                                                 =
 |
  610000 ++                                                                =
 |
         |                                                                 =
 |
  605000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
         |                                                O   O   O        =
 |
         |                                                  O   O   O O O O=
 O
  595000 ++              O       O                O O O O                  =
 |
         O O O O O O O O     O O                O                          =
 |
  590000 ++----------------O-------O-O-O-O-OO-O----------------------------=
-+


                     unixbench.time.involuntary_context_switches

  290000 ++----------------------------------------------------------------=
-+
         *.*.*.*. .*.*.*.*.*.           .*.              .*.   .*.*.*.*    =
 |
  285000 ++      *           *.*.*.*.*.*   **.*.*.*.*.*.*   *.*            =
 |
         |                                                                 =
 |
  280000 ++                                                                =
 |
         |                                                                 =
 |
  275000 ++                                                                =
 |
         |                                                                 =
 |
  270000 ++                                                                =
 |
         |                                                O O O O O   O O O=
 O
  265000 ++                                                         O      =
 |
         O O O   O                                                         =
 |
  260000 ++    O   O O                                                     =
 |
         |             O O O O O O O O O O OO O O O O O O                  =
 |
  255000 ++----------------------------------------------------------------=
-+


                                 vmstat.system.in

  2400 ++------------------------------------------------------------------=
-+
       |                   O                      O O O O O O O O O O O O O=
 O
  2200 O+O O O O O O O O O   O O O O O O  O O O O                          =
 |
       |                                                                   =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1800 ++                                                                  =
 |
       |                                                                   =
 |
  1600 *+*.*.*.*.*.*.*.*.*.*.*.*   *.*        *.*.*   *.*       *.*.*.*    =
 |
       |                        : :   +       :    : :   +      :          =
 |
  1400 ++                       : :    *..*  :     : :    *.*  :           =
 |
       |                         *         : :      *        : :           =
 |
  1200 ++                                  ::                ::            =
 |
       |                                    *                 *            =
 |
  1000 ++------------------------------------------------------------------=
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

--===============7627213843486997165==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdW5peGJlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6
IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3Rh
dDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IApkZWZh
dWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDogOGZiNDdm
ZjEwMGFmNDgwMzRlYjExNDQ5YTgxZjQyYWYyNDIxMzk4Nwptb2RlbDogTmVoYWxlbQptZW1vcnk6
IDZHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1IaXRhY2hpX0hEVDcyMTA1
MFNMQTM2MF9TVEgzRDdNRTBZRU01WS1wYXJ0NQogIC9kZXYvZGlzay9ieS1pZC9hdGEtSGl0YWNo
aV9IRFQ3MjEwNTBTTEEzNjBfU1RIM0Q3TUUwWUVNNVktcGFydDYgL2Rldi9kaXNrL2J5LWlkL2F0
YS1IaXRhY2hpX0hEVDcyMTA1MFNMQTM2MF9TVEgzRDdNRTBZRU01WS1wYXJ0NwogIC9kZXYvZGlz
ay9ieS1pZC9hdGEtSGl0YWNoaV9IRFQ3MjEwNTBTTEEzNjBfU1RIM0Q3TUUwWUVNNVktcGFydDgi
CnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRh
LUhpdGFjaGlfSERUNzIxMDUwU0xBMzYwX1NUSDNEN01FMFlFTTVZLXBhcnQyIgpuZXRjb25zb2xl
X3BvcnQ6IDY2NDcKY2F0ZWdvcnk6IGJlbmNobWFyawpucl90YXNrOiAxCnVuaXhiZW5jaDoKICB0
ZXN0OiBzaGVsbDEKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBuaG0td2hpdGUKdGJveF9ncm91cDog
bmhtLXdoaXRlCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wMi0yNCAy
MjoxMToxMy43NTI3OTk1NTIgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDogZGJmMzVlZWQ0NTcyMDRmYzExNDVjNWY2NDZiODI0
MWE1NDdkYzQ0ZAp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IGMzNDZjYzg3MGE1YjFiNzFlMjFmN2Vi
MjExMGRkN2UyMTAwMzVmOTgKYmFzZV9jb21taXQ6IDgxZjcwYmEyMzNkNWY2NjBlMWVhNWZlMjMy
NjBlZTMyM2FmNWQ1M2EKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAyMjEx
NApyZXN1bHRfcm9vdDogIi9yZXN1bHQvdW5peGJlbmNoLzEtc2hlbGwxL25obS13aGl0ZS9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvOGZiNDdmZjEwMGFm
NDgwMzRlYjExNDQ5YTgxZjQyYWYyNDIxMzk4Ny8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVk
L25obS13aGl0ZS9iaXNlY3RfdW5peGJlbmNoLTEtc2hlbGwxLWRlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oteDg2XzY0LXJoZWwtOGZiNDdmZjEwMGFmNDgwMzRlYjExNDQ5YTgxZjQyYWYyNDIx
Mzk4Ny0yMDE2MDIyNC03NjA5LXp2M2IzNy0wLnlhbWwiCm5yX2NwdTogIiQobnByb2MpIgptYXhf
dXB0aW1lOiAxMDA4LjY5OTk5OTk5OTk5OTkKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9y
YW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbmhtLXdoaXRlL2Jpc2VjdF91bml4
YmVuY2gtMS1zaGVsbDEtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC04
ZmI0N2ZmMTAwYWY0ODAzNGViMTE0NDlhODFmNDJhZjI0MjEzOTg3LTIwMTYwMjI0LTc2MDktenYz
YjM3LTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQtcmhlbAotIGJyYW5jaD1s
aW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjAyMjExNAotIGNvbW1pdD04ZmI0N2ZmMTAwYWY0
ODAzNGViMTE0NDlhODFmNDJhZjI0MjEzOTg3Ci0gQk9PVF9JTUFHRT0vcGtnL2xpbnV4L3g4Nl82
NC1yaGVsL2djYy00LjkvOGZiNDdmZjEwMGFmNDgwMzRlYjExNDQ5YTgxZjQyYWYyNDIxMzk4Ny92
bWxpbnV6LTQuNS4wLXJjMi0wMDAwNC1nOGZiNDdmZgotIG1heF91cHRpbWU9MTAwOAotIFJFU1VM
VF9ST09UPS9yZXN1bHQvdW5peGJlbmNoLzEtc2hlbGwxL25obS13aGl0ZS9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvOGZiNDdmZjEwMGFmNDgwMzRlYjEx
NDQ5YTgxZjQyYWYyNDIxMzk4Ny8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJp
bnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVn
IHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAK
ICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFu
aWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAw
IGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3At
eDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvOGZiNDdmZjEwMGFmNDgwMzRlYjExNDQ5YTgxZjQyYWYyNDIxMzk4Ny9tb2R1bGVzLmNneiIK
Ym1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xr
cC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNv
bmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJv
c3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3Vu
aXhiZW5jaC5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhl
bC9nY2MtNC45LzhmYjQ3ZmYxMDBhZjQ4MDM0ZWIxMTQ0OWE4MWY0MmFmMjQyMTM5ODcvbGludXgt
aGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvOGZiNDdmZjEwMGFmNDgwMzRlYjExNDQ5YTgxZjQyYWYyNDIxMzk4Ny92bWxpbnV6
LTQuNS4wLXJjMi0wMDAwNC1nOGZiNDdmZiIKZGVxdWV1ZV90aW1lOiAyMDE2LTAyLTI0IDIyOjE5
OjU1LjQ2NjE0MDI2MyArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAxLjAzIDAu
NDggMC4xOSAxLzE3MyA3OTYKc3RhcnRfdGltZTogJzE0NTYzMjM2MTgnCmVuZF90aW1lOiAnMTQ1
NjMyMzgwNycKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNjAyMjQtMjA1MDIxIgo=

--===============7627213843486997165==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMi0yNCAyMjoyMDoxOCAuL1J1biBzaGVsbDEgLWMgMQo=

--===============7627213843486997165==--

