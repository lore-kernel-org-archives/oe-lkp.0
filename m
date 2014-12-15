Content-Type: multipart/mixed; boundary="===============2938438908944606931=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [genirq] c291ee62216:
Date: Mon, 15 Dec 2014 15:07:28 +0800
Message-ID: <1418627248.5745.186.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2938438908944606931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/urgent
commit c291ee622165cb2c8d4e7af63fffd499354a23be ("genirq: Prevent proc race=
 against freeing of irq descriptors")

testbox/testcase/testparams: lkp-nex04/netperf/performance-300s-200%-SCTP_S=
TREAM

3a5dc1fafb016560  c291ee622165cb2c8d4e7af63f  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

        16 =C2=B1 44%     -73.1%          4 =C2=B1 36%  sched_debug.cfs_rq[=
32]:/.tg_runnable_contrib
         1 =C2=B1  0%    +175.0%          2 =C2=B1 15%  sched_debug.cfs_rq[=
53]:/.nr_spread_over
       814 =C2=B1 41%     -70.5%        240 =C2=B1 37%  sched_debug.cfs_rq[=
32]:/.avg->runnable_avg_sum
       136 =C2=B1 35%    +104.6%        278 =C2=B1 26%  sched_debug.cpu#5.c=
urr->pid
      4149 =C2=B1  8%    +140.6%       9981 =C2=B1 22%  sched_debug.cfs_rq[=
35]:/.min_vruntime
      5151 =C2=B1 28%     +97.3%      10166 =C2=B1 19%  sched_debug.cfs_rq[=
58]:/.min_vruntime
      4897 =C2=B1 15%     +86.8%       9149 =C2=B1 23%  sched_debug.cfs_rq[=
41]:/.min_vruntime
      5001 =C2=B1  8%    +100.2%      10011 =C2=B1  6%  sched_debug.cfs_rq[=
62]:/.min_vruntime
       990 =C2=B1 25%    +103.7%       2017 =C2=B1 49%  sched_debug.cfs_rq[=
16]:/.exec_clock
       106 =C2=B1 40%     +65.1%        175 =C2=B1 26%  sched_debug.cfs_rq[=
37]:/.tg_load_contrib
      4649 =C2=B1 14%    +122.4%      10338 =C2=B1 24%  sched_debug.cfs_rq[=
43]:/.min_vruntime
      4432 =C2=B1  9%     +97.2%       8742 =C2=B1 15%  sched_debug.cfs_rq[=
54]:/.min_vruntime
      1011 =C2=B1 16%     +80.0%       1820 =C2=B1 36%  sched_debug.cfs_rq[=
23]:/.exec_clock
        10 =C2=B1 22%     -41.9%          6 =C2=B1 17%  sched_debug.cfs_rq[=
11]:/.tg_runnable_contrib
         2 =C2=B1 19%     +77.8%          4 =C2=B1 30%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
      5093 =C2=B1  4%     +81.3%       9232 =C2=B1 18%  sched_debug.cfs_rq[=
56]:/.min_vruntime
       193 =C2=B1 26%     -39.5%        117 =C2=B1 45%  sched_debug.cfs_rq[=
38]:/.tg_load_contrib
      5340 =C2=B1  7%     +89.5%      10118 =C2=B1 13%  sched_debug.cfs_rq[=
48]:/.min_vruntime
      6055 =C2=B1 35%     +48.9%       9017 =C2=B1 13%  sched_debug.cfs_rq[=
40]:/.min_vruntime
      4871 =C2=B1 13%     +78.7%       8702 =C2=B1 24%  sched_debug.cfs_rq[=
57]:/.min_vruntime
      4374 =C2=B1 13%     +76.7%       7729 =C2=B1 19%  sched_debug.cfs_rq[=
45]:/.min_vruntime
      5321 =C2=B1 13%     +74.7%       9297 =C2=B1 22%  sched_debug.cfs_rq[=
59]:/.min_vruntime
      4738 =C2=B1 12%    +104.0%       9668 =C2=B1  6%  sched_debug.cfs_rq[=
37]:/.min_vruntime
      5426 =C2=B1  7%     +80.9%       9817 =C2=B1  2%  sched_debug.cfs_rq[=
51]:/.min_vruntime
      5067 =C2=B1 18%     +96.8%       9974 =C2=B1 22%  sched_debug.cfs_rq[=
55]:/.min_vruntime
      5318 =C2=B1  6%     +64.7%       8757 =C2=B1 26%  sched_debug.cfs_rq[=
42]:/.min_vruntime
      5160 =C2=B1 11%     +87.9%       9696 =C2=B1  5%  sched_debug.cfs_rq[=
53]:/.min_vruntime
      5208 =C2=B1  8%     +81.0%       9429 =C2=B1 13%  sched_debug.cfs_rq[=
50]:/.min_vruntime
      4395 =C2=B1 26%     +78.9%       7865 =C2=B1  8%  sched_debug.cfs_rq[=
32]:/.min_vruntime
      5596 =C2=B1 41%     +65.5%       9264 =C2=B1 19%  sched_debug.cfs_rq[=
49]:/.min_vruntime
       540 =C2=B1 21%     -37.9%        336 =C2=B1 11%  sched_debug.cfs_rq[=
11]:/.avg->runnable_avg_sum
       102 =C2=B1 39%     +61.9%        165 =C2=B1 24%  sched_debug.cfs_rq[=
37]:/.blocked_load_avg
      4916 =C2=B1  7%     +77.5%       8726 =C2=B1 11%  sched_debug.cfs_rq[=
38]:/.min_vruntime
       307 =C2=B1  6%     +84.3%        567 =C2=B1 31%  sched_debug.cfs_rq[=
54]:/.exec_clock
      5541 =C2=B1 11%     +75.9%       9746 =C2=B1  4%  sched_debug.cfs_rq[=
60]:/.min_vruntime
      5250 =C2=B1 22%     +72.3%       9049 =C2=B1 13%  sched_debug.cfs_rq[=
36]:/.min_vruntime
       285 =C2=B1  2%     +64.6%        470 =C2=B1 17%  sched_debug.cfs_rq[=
37]:/.exec_clock
        27 =C2=B1 42%    +102.7%         55 =C2=B1 36%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
        28 =C2=B1 40%     +98.3%         57 =C2=B1 35%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      5523 =C2=B1 14%     +65.3%       9129 =C2=B1  9%  sched_debug.cfs_rq[=
52]:/.min_vruntime
      1424 =C2=B1 13%     +81.7%       2588 =C2=B1 41%  sched_debug.cpu#50.=
sched_count
       282 =C2=B1  6%     +59.0%        448 =C2=B1 10%  sched_debug.cfs_rq[=
43]:/.exec_clock
       114 =C2=B1 18%     +80.1%        206 =C2=B1 16%  sched_debug.cfs_rq[=
48]:/.blocked_load_avg
       285 =C2=B1  6%     +48.3%        424 =C2=B1  9%  sched_debug.cfs_rq[=
35]:/.exec_clock
       865 =C2=B1 13%     -34.0%        571 =C2=B1 21%  sched_debug.cpu#55.=
sched_goidle
       162 =C2=B1 18%     -35.1%        105 =C2=B1 13%  sched_debug.cfs_rq[=
54]:/.blocked_load_avg
      2017 =C2=B1 11%     -29.1%       1431 =C2=B1 16%  sched_debug.cpu#55.=
nr_switches
      2047 =C2=B1 11%     -28.5%       1464 =C2=B1 16%  sched_debug.cpu#55.=
sched_count
       302 =C2=B1 14%     -20.0%        242 =C2=B1 14%  sched_debug.cpu#53.=
ttwu_local
       303 =C2=B1 10%     +73.7%        527 =C2=B1 38%  sched_debug.cfs_rq[=
60]:/.exec_clock
       286 =C2=B1 15%     +32.1%        378 =C2=B1 13%  sched_debug.cfs_rq[=
45]:/.exec_clock
       127 =C2=B1 22%     +64.6%        210 =C2=B1 17%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
       171 =C2=B1 14%     -29.3%        121 =C2=B1 10%  sched_debug.cfs_rq[=
54]:/.tg_load_contrib
        92 =C2=B1 42%     +72.4%        159 =C2=B1 19%  sched_debug.cfs_rq[=
58]:/.blocked_load_avg
  16297106 =C2=B1  4%     +27.5%   20771822 =C2=B1  5%  cpuidle.C1-NHM.time
       453 =C2=B1 37%     +47.9%        670 =C2=B1  8%  sched_debug.cfs_rq[=
31]:/.avg->runnable_avg_sum
         8 =C2=B1 43%     +54.3%         13 =C2=B1  8%  sched_debug.cfs_rq[=
31]:/.tg_runnable_contrib
       318 =C2=B1 10%     +67.0%        531 =C2=B1 42%  sched_debug.cfs_rq[=
55]:/.exec_clock
      1496 =C2=B1 14%     +37.8%       2061 =C2=B1 13%  sched_debug.cpu#37.=
sched_count
      1466 =C2=B1 15%     +37.8%       2019 =C2=B1 13%  sched_debug.cpu#37.=
nr_switches
       977 =C2=B1 14%     +73.2%       1692 =C2=B1 49%  sched_debug.cfs_rq[=
28]:/.exec_clock
       830 =C2=B1  6%     +22.0%       1013 =C2=B1  9%  sched_debug.cpu#45.=
ttwu_count
       613 =C2=B1 17%     +42.8%        876 =C2=B1 16%  sched_debug.cpu#37.=
sched_goidle
      8839 =C2=B1  7%     -11.4%       7828 =C2=B1 10%  sched_debug.cpu#3.t=
twu_count
    116654 =C2=B1  6%     -12.7%     101799 =C2=B1  5%  meminfo.DirectMap4k
      1041 =C2=B1  6%     +34.3%       1399 =C2=B1 27%  sched_debug.cfs_rq[=
29]:/.exec_clock
      6.66 =C2=B1 20%    +175.2%      18.32 =C2=B1  2%  time.system_time
     16.79 =C2=B1  7%     -48.0%       8.73 =C2=B1  1%  time.user_time
         7 =C2=B1  0%     +17.9%          8 =C2=B1  5%  time.percent_of_cpu=
_this_job_got
     98436 =C2=B1  0%      +1.6%     100045 =C2=B1  0%  time.voluntary_cont=
ext_switches

lkp-nex04: Nehalem-EX
Memory: 256G


                           time.voluntary_context_switches

  100500 ++----------------------------------------------------------------=
-+
         O       O                    O          O                         =
 |
         |  O                            O          O                      =
 |
  100000 ++           O  O  O O     O          O                           =
 |
         |    O                  O          O          O                   =
 |
         |          O                                                      =
 |
   99500 ++                                                                =
 |
         |                                                                 =
 |
   99000 ++                                                                =
 |
         |                                                                 =
 |
         |                                                                 =
 |
   98500 ++        .*.*..                          .*.. .*..    .*..*..    =
 |
         *..*.*..*.      *..*.*..*..*.*..*..*..*.*.    *    *..*       *.*.=
.*
         |                                                                 =
 |
   98000 ++----------------------------------------------------------------=
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


Thanks,
Fengguang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============2938438908944606931==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBuZXRwZXJmCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJlLXRlc3QK
ICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1h
LXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OiAK
ICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBs
YXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3Rh
dHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRfZGVidWc6
CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3YXRjaC1v
b206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpjb21taXQ6
IDA1N2IxNjk5N2Q3N2EyM2E0ZGQyYjhlOGE5YmQ1NjY1NmFmYWM4NmQKbW9kZWw6IE5laGFsZW0t
RVgKbWVtb3J5OiAyNTZHCm5yX3NzZF9wYXJ0aXRpb25zOiA2CnNzZF9wYXJ0aXRpb25zOiAiL2Rl
di9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0QqcGFydDEiCnN3YXBfcGFydGl0aW9uczogIi9kZXYv
ZGlzay9ieS1pZC9hdGEtV0RDX1dEMTBFQVJTLTAwWTVCMV9XRC1XQ0FWNUYwNTkwNzQtcGFydDIi
CnJ1bnRpbWU6IDMwMHMKbnJfdGhyZWFkczoKLSAyMDAlCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4
MDAKbmV0cGVyZjoKICB0ZXN0OgogIC0gU0NUUF9TVFJFQU0KdGVzdGJveDogbGtwLW5leDA0CnRi
b3hfZ3JvdXA6IGxrcC1uZXgwNAprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIw
MTQtMTItMTQgMDA6NTI6MTEuODg2NTI1MzIyICswODowMApoZWFkX2NvbW1pdDogMDU3YjE2OTk3
ZDc3YTIzYTRkZDJiOGU4YTliZDU2NjU2YWZhYzg2ZApiYXNlX2NvbW1pdDogYjI3NzZiZjcxNDli
ZGRkMWY0MTYxZjE0Zjc5NTIwZjE3ZmMxZDcxZApicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhv
dXJseS0yMDE0MTIxNDAwCmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJoZWwvMDU3YjE2OTk3ZDc3
YTIzYTRkZDJiOGU4YTliZDU2NjU2YWZhYzg2ZC92bWxpbnV6LTMuMTguMC1nMDU3YjE2OSIKdXNl
cjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LmNnegpyZXN1bHRfcm9v
dDogIi9yZXN1bHQvbGtwLW5leDA0L25ldHBlcmYvcGVyZm9ybWFuY2UtMzAwcy0yMDAlLVNDVFBf
U1RSRUFNL2RlYmlhbi14ODZfNjQuY2d6L3g4Nl82NC1yaGVsLzA1N2IxNjk5N2Q3N2EyM2E0ZGQy
YjhlOGE5YmQ1NjY1NmFmYWM4NmQvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtbmV4
MDQvY3ljbGljX25ldHBlcmYtcGVyZm9ybWFuY2UtMzAwcy0yMDAlLVNDVFBfU1RSRUFNLXg4Nl82
NC1yaGVsLUhFQUQtMDU3YjE2OTk3ZDc3YTIzYTRkZDJiOGU4YTliZDU2NjU2YWZhYzg2ZC0wLnlh
bWwiCmRlcXVldWVfdGltZTogMjAxNC0xMi0xNCAwODo1MDoxMS4zODc2ODgzNTEgKzA4OjAwCmpv
Yl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMC4xNiAwLjIyIDAuMTQgMi81MjYgMTMwNjgKc3Rh
cnRfdGltZTogJzE0MTg1MTgyODMnCmVuZF90aW1lOiAnMTQxODUxODU4NicKdmVyc2lvbjogIi9s
a3AvbGtwLy5zcmMtMjAxNDEyMTQtMDUyMzU0Igo=

--===============2938438908944606931==
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
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm5ldHNl
cnZlcgpuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBf
U1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFN
IC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJm
IC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1D
IC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFND
VFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMw
MApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RS
RUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1j
IC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10
IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1s
IDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBf
U1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFN
IC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJm
IC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1D
IC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFND
VFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMw
MApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RS
RUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1j
IC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10
IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1s
IDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBf
U1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFN
IC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJm
IC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1D
IC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFND
VFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMw
MApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RS
RUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1j
IC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10
IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1s
IDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBf
U1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFN
IC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJm
IC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1D
IC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFND
VFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMw
MApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RS
RUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1j
IC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10
IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1s
IDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBf
U1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFN
IC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJm
IC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1D
IC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFND
VFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMw
MApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RS
RUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1j
IC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10
IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1s
IDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBf
U1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFN
IC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJm
IC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1D
IC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFND
VFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMw
MApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RS
RUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRw
ZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1j
IC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10
IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1s
IDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBf
U1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApu
ZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFN
IC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJm
IC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1D
IC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFND
VFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMw
MApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RS
RUFNIC1jIC1DIC1sIDMwMApuZXRwZXJmIC10IFNDVFBfU1RSRUFNIC1jIC1DIC1sIDMwMAo=

--===============2938438908944606931==--

