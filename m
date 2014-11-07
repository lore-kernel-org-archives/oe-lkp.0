Content-Type: multipart/mixed; boundary="===============6937817616482162786=="
MIME-Version: 1.0
From: LKP <lkp@01.org>
To: lkp@lists.01.org
Subject: [x86_64,entry] f04e05b81e4: -62.7% time.user_time
Date: Fri, 07 Nov 2014 14:00:40 +0800
Message-ID: <20141107060040.GD30507@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6937817616482162786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry
commit f04e05b81e4d9ae88bee379f12176f551a24394a ("x86_64,entry: Use sysret =
to return to userspace when possible")


f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  testbox/testcase/testparams
----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     24.09 =C2=B1  4%     -62.7%       8.99 =C2=B1  3%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
     24.09           -62.7%       8.99        GEO-MEAN time.user_time

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

      1571 =C2=B1  1%     -13.5%       1359 =C2=B1  0%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
      1571           -13.5%       1359        GEO-MEAN vmstat.system.cs

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

       276 =C2=B1  0%      +5.5%        291 =C2=B1  0%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
       276            +5.5%        291        GEO-MEAN time.system_time

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  ---------------------------
       430 =C2=B1 36%     -36.0%        275 =C2=B1 39%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
       430           -36.0%        275        GEO-MEAN sched_debug.cpu#38.t=
twu_count

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

  52761811 =C2=B1 29%     -54.7%   23885493 =C2=B1 11%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
  52761811           -54.7%   23885493        GEO-MEAN cpuidle.C1E-NHM.time

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

     21939 =C2=B1  8%     +42.6%      31283 =C2=B1 23%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
     21939           +42.6%      31283        GEO-MEAN numa-meminfo.node1.S=
Unreclaim

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

      5484 =C2=B1  8%     +40.3%       7694 =C2=B1 22%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
      5484           +40.3%       7694        GEO-MEAN numa-vmstat.node1.nr=
_slab_unreclaimable

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

     34004 =C2=B1  2%     +69.9%      57781 =C2=B1  4%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
     34004           +69.9%      57781        GEO-MEAN slabinfo.kmalloc-256=
.active_objs

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

      1075 =C2=B1  2%     +68.8%       1815 =C2=B1  4%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
      1074           +68.8%       1814        GEO-MEAN slabinfo.kmalloc-256=
.active_slabs

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

      1075 =C2=B1  2%     +68.8%       1815 =C2=B1  4%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
      1074           +68.8%       1814        GEO-MEAN slabinfo.kmalloc-256=
.num_slabs

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

     34415 =C2=B1  2%     +68.8%      58099 =C2=B1  4%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
     34415           +68.8%      58099        GEO-MEAN slabinfo.kmalloc-256=
.num_objs

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

     32500 =C2=B1  7%     +31.0%      42586 =C2=B1 17%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
     32500           +31.0%      42586        GEO-MEAN numa-meminfo.node1.S=
lab

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

     73657 =C2=B1  1%     -23.4%      56388 =C2=B1  3%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
     73657           -23.4%      56388        GEO-MEAN softirqs.RCU

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

     10427 =C2=B1 14%     -16.8%       8675 =C2=B1  6%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
     10427           -16.8%       8675        GEO-MEAN sched_debug.cfs_rq[0=
]:/.exec_clock

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

     24242 =C2=B1  8%     +18.4%      28696 =C2=B1 12%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
     24242           +18.4%      28696        GEO-MEAN numa-meminfo.node3.A=
ctive

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

      2076 =C2=B1  7%     +12.1%       2328 =C2=B1  2%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
      2076           +12.1%       2327        GEO-MEAN numa-meminfo.node2.K=
ernelStack

f2ee9bebb99dd4a4  f04e05b81e4d9ae88bee379f12  =

----------------  --------------------------  =

   1139198 =C2=B1  5%      -6.6%    1063912 =C2=B1  0%  lkp-wsx02/aim9/perf=
ormance-300s-creat-clo
   1139198            -6.6%    1063912        GEO-MEAN proc-vmstat.pgfault

lkp-wsx02: Westmere-EX
Memory: 128G




                                 time.user_time

  26 ++-----------------*----------------*--------*------------------------=
-+
     | .*..*...  .*..*.     *..*..*.. ..      .*.          .*..*..   .*..*.=
.|
  24 *+        *.                    *      *.       *...*.        ..      =
 *
  22 ++                                                           *        =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
  18 ++                                                                    =
 |
     |                                                                     =
 |
  16 ++                                                                    =
 |
  14 ++                                                                    =
 |
     |                                                                     =
 |
  12 ++                                                                    =
 |
  10 ++                                                                    =
 |
     O     O         O  O      O  O                  O   O  O     O        =
 |
   8 ++-O------O--O---------O--------O---O--O--O--O------------O-----------=
-+


                                 time.system_time

  294 ++-------------------------------------------------------------------=
-+
  292 ++        O           O         O  O  O  O   O                       =
 |
      O  O  O      O  O  O     O   O                  O  O  O  O  O        =
 |
  290 ++                                                                   =
 |
  288 ++                                                                   =
 |
      |                                                                    =
 |
  286 ++                                                                   =
 |
  284 ++                                                                   =
 |
  282 ++                                                                   =
 |
      |                                                                    =
 |
  280 ++                                                                   =
 |
  278 ++                                                          *..      =
 |
      *..     ..*..                  .*..   *..      .*..*..    ..   .     =
.*
  276 ++ *..*.     *..*..*..*..*...*.     ..   *...*.       *..*      *..*.=
 |
  274 ++---------------------------------*---------------------------------=
-+


                                    softirqs.RCU

  80000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  75000 ++               ..*..*..*..              .*..      .*..   *..     =
 |
        *..*..*..*..  .*.           *..*..  .*..*.    *.. ..     ..   *..*.=
.*
        |           *.                    *.             *      *          =
 |
  70000 ++                                                                 =
 |
        |                                                                  =
 |
  65000 ++                                                                 =
 |
        |                                                                  =
 |
  60000 ++                                                   O             =
 |
        |                                                                  =
 |
        |  O        O         O           O     O     O  O                 =
 |
  55000 O+    O  O     O   O     O  O  O     O     O            O  O       =
 |
        |                                                                  =
 |
  50000 ++-----------------------------------------------------------------=
-+


                          slabinfo.kmalloc-256.active_objs

  70000 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
  65000 ++                          O  O                                   =
 |
  60000 ++    O                  O        O  O  O  O  O  O                 =
 |
        O  O     O  O  O   O                                 O     O       =
 |
  55000 ++                                                                 =
 |
        |                     O                                 O          =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  45000 ++                                                                 =
 |
  40000 ++                                                                 =
 |
        |          .*..                                                    =
 |
  35000 ++.*..  .*.    *..    *..*..        .*..     .*..*...  .*..     .*.=
.*
        *.    *.          . ..      *..*..*.    *..*.        *.    *..*.   =
 |
  30000 ++-----------------*-----------------------------------------------=
-+


                            slabinfo.kmalloc-256.num_objs

  70000 ++-----------------------------------------------------------------=
-+
        |                              O                                   =
 |
  65000 ++                          O                                      =
 |
  60000 ++    O  O               O        O  O  O  O  O  O                 =
 |
        O  O        O  O   O                                 O     O       =
 |
  55000 ++                                                                 =
 |
        |                     O                                 O          =
 |
  50000 ++                                                                 =
 |
        |                                                                  =
 |
  45000 ++                                                                 =
 |
  40000 ++                                                                 =
 |
        |          .*..                                                    =
 |
  35000 *+.*..  .*.    *...  .*..*..        .*..     .*..*...*..*..*..  .*.=
.*
        |     *.           *.       *..*..*.    *..*.                 *.   =
 |
  30000 ++-----------------------------------------------------------------=
-+


                         slabinfo.kmalloc-256.active_slabs

  2200 ++------------------------------------------------------------------=
-+
       |                              O                                    =
 |
  2000 ++                          O         O     O                       =
 |
       |     O  O      O  O     O         O     O     O  O                 =
 |
  1800 O+ O         O                                       O      O       =
 |
       |                                                       O           =
 |
  1600 ++                    O                                             =
 |
       |                                                                   =
 |
  1400 ++                                                                  =
 |
       |                                                                   =
 |
  1200 ++       *...*..                                                    =
 |
       *..*.. ..       *..  .*..*..  .*...*..*..     .*..*..*..*...*..  .*.=
.*
  1000 ++    *            *.       *.           *..*.                 *.   =
 |
       |                                                                   =
 |
   800 ++------------------------------------------------------------------=
-+


                          slabinfo.kmalloc-256.num_slabs

  2200 ++------------------------------------------------------------------=
-+
       |                              O                                    =
 |
  2000 ++                          O         O     O                       =
 |
       |     O  O      O  O     O         O     O     O  O                 =
 |
  1800 O+ O         O                                       O      O       =
 |
       |                                                       O           =
 |
  1600 ++                    O                                             =
 |
       |                                                                   =
 |
  1400 ++                                                                  =
 |
       |                                                                   =
 |
  1200 ++       *...*..                                                    =
 |
       *..*.. ..       *..  .*..*..  .*...*..*..     .*..*..*..*...*..  .*.=
.*
  1000 ++    *            *.       *.           *..*.                 *.   =
 |
       |                                                                   =
 |
   800 ++------------------------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby ruby-oj
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

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============6937817616482162786==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBhaW05CmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QKICB1
cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZt
c3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAKICBt
ZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRl
bmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6
IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRfZGVidWc6CiAg
ICBpbnRlcnZhbDogMTAKZGVmYXVsdF93YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRv
ZzogCmNwdWZyZXFfZ292ZXJub3I6Ci0gcGVyZm9ybWFuY2UKY29tbWl0OiA3YzEzMGNlODZkMzE2
OWZiMDc4ZWEzNmQyMzUxYTliYzUzOTRmN2JmCm1vZGVsOiBXZXN0bWVyZS1FWAptZW1vcnk6IDEy
OEcKbnJfY3B1OiA4MApucl9oZGRfcGFydGl0aW9uczogMApoZGRfcGFydGl0aW9uczogCnN3YXBf
cGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRpb246IAphaW05OgogIHRlc3R0aW1lOiAzMDBzCiAg
dGVzdDoKICAtIGNyZWF0LWNsbwplbnF1ZXVlX3RpbWU6IDIwMTQtMTEtMDUgMTY6Mjk6MzYuMDUw
MjQ2NzI4ICswODowMAp0ZXN0Ym94OiBsa3Atd3N4MDIKdGJveF9ncm91cDogbGtwLXdzeDAyCmtj
b25maWc6IHg4Nl82NC1yaGVsCmhlYWRfY29tbWl0OiA3YzEzMGNlODZkMzE2OWZiMDc4ZWEzNmQy
MzUxYTliYzUzOTRmN2JmCmJhc2VfY29tbWl0OiAwZGYxZjI0ODdkMmYwZDA0NzAzZjE0MjgxM2Q1
MzYxNWQ2MmExZGE0CmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTQxMTA1MjIK
a2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC83YzEzMGNlODZkMzE2OWZiMDc4ZWEzNmQyMzUx
YTliYzUzOTRmN2JmL3ZtbGludXotMy4xOC4wLXJjMy13bC1hdGgtZzdjMTMwY2UiCnVzZXI6IGxr
cApxdWV1ZTogY3ljbGljCnJvb3RmczogZGViaWFuLXg4Nl82NC5jZ3oKcmVzdWx0X3Jvb3Q6ICIv
cmVzdWx0L2xrcC13c3gwMi9haW05L3BlcmZvcm1hbmNlLTMwMHMtY3JlYXQtY2xvL2RlYmlhbi14
ODZfNjQuY2d6L3g4Nl82NC1yaGVsLzdjMTMwY2U4NmQzMTY5ZmIwNzhlYTM2ZDIzNTFhOWJjNTM5
NGY3YmYvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3Atd3N4MDIvY3ljbGljX2FpbTkt
cGVyZm9ybWFuY2UtMzAwcy1jcmVhdC1jbG8teDg2XzY0LXJoZWwtSEVBRC03YzEzMGNlODZkMzE2
OWZiMDc4ZWEzNmQyMzUxYTliYzUzOTRmN2JmLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0LTEx
LTA2IDAxOjE2OjE4LjI1MzU4OTk1MyArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZn
OiAwLjkxIDAuNzIgMC4zNCAxLzYzMyAxMzM2MApzdGFydF90aW1lOiAnMTQxNTIwNzg5NicKZW5k
X3RpbWU6ICcxNDE1MjA4MTk2Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTEwNS0yMjE5
NTMiCg==

--===============6937817616482162786==
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
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Ny9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzAv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzMvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzYvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK

--===============6937817616482162786==--

