Content-Type: multipart/mixed; boundary="===============7457558934930950773=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: [x86, irq, ACPI] 5fcb864ef90: -3.3%(vm-scalability.throughput) +12.9%(turbostat.%c0)
Date: Mon, 24 Nov 2014 10:51:41 +0800
Message-ID: <20141124025141.GA7310@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7457558934930950773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

We noticed the below changes on(NOTE: I'm not sure the bisect is correct
or not, here I report it out JFYI).

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 5fcb864ef90df093d964171539c87ffa0ab49f0f ("x86, irq, ACPI: Implement=
 interfaces to support ACPI based IOAPIC hot-removal")


testbox/testcase/testparams: lkp-nex06/vm-scalability/performance-300s-smal=
l-allocs-mt

ff6213974cd90e1e  5fcb864ef90df093d964171539  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :5           20%           1:5     kmsg.CE:hpet_increased_min_de=
lta_ns_to#nsec
         %stddev     %change         %stddev
             \          |                \  =

    315326 =C2=B1  0%      -3.3%     304841 =C2=B1  0%  vm-scalability.thro=
ughput
     11.82 =C2=B1  0%     +12.9%      13.34 =C2=B1  0%  turbostat.%c0
      1.34 =C2=B1  0%      +9.4%       1.46 =C2=B1  0%  turbostat.GHz
        12 =C2=B1 47%     +78.7%         21 =C2=B1 32%  sched_debug.cfs_rq[=
29]:/.load
       113 =C2=B1 26%     +86.3%        212 =C2=B1 28%  sched_debug.cfs_rq[=
39]:/.tg_load_contrib
       106 =C2=B1 28%     +89.5%        202 =C2=B1 30%  sched_debug.cfs_rq[=
39]:/.blocked_load_avg
        66 =C2=B1 23%    +120.6%        145 =C2=B1 29%  sched_debug.cfs_rq[=
40]:/.blocked_load_avg
        70 =C2=B1 23%    +113.0%        150 =C2=B1 29%  sched_debug.cfs_rq[=
40]:/.tg_load_contrib
     10145 =C2=B1 23%     -38.3%       6255 =C2=B1 35%  numa-meminfo.node1.=
AnonPages
      2535 =C2=B1 23%     -38.3%       1564 =C2=B1 35%  numa-vmstat.node1.n=
r_anon_pages
       605 =C2=B1 16%     -22.0%        471 =C2=B1  5%  sched_debug.cpu#58.=
nr_uninterruptible
     58904 =C2=B1  7%     -13.8%      50762 =C2=B1  7%  sched_debug.cfs_rq[=
0]:/.min_vruntime
    481299 =C2=B1  8%     -13.4%     416975 =C2=B1  7%  sched_debug.cpu#0.s=
ched_count
    409009 =C2=B1 11%     -15.7%     344638 =C2=B1  2%  sched_debug.cpu#4.s=
ched_count
     52022 =C2=B1 10%     -16.1%      43623 =C2=B1  2%  sched_debug.cfs_rq[=
4]:/.min_vruntime
        68 =C2=B1  3%     -12.2%         60 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.tg_runnable_contrib
      3175 =C2=B1  3%     -12.1%       2791 =C2=B1  3%  sched_debug.cfs_rq[=
4]:/.avg->runnable_avg_sum
     50060 =C2=B1  6%     -12.3%      43914 =C2=B1  4%  sched_debug.cfs_rq[=
29]:/.min_vruntime
      1751 =C2=B1 12%     -15.5%       1480 =C2=B1  6%  sched_debug.cpu#63.=
nr_uninterruptible
      2967 =C2=B1  6%     -13.7%       2562 =C2=B1  4%  sched_debug.cfs_rq[=
37]:/.avg->runnable_avg_sum
        63 =C2=B1  6%     -13.8%         55 =C2=B1  4%  sched_debug.cfs_rq[=
37]:/.tg_runnable_contrib
      1.07 =C2=B1  2%     -10.9%       0.95 =C2=B1  3%  perf-profile.cpu-cy=
cles.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      1.64 =C2=B1  2%      -8.4%       1.50 =C2=B1  4%  perf-profile.cpu-cy=
cles.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_se=
condary
     35173 =C2=B1  5%      -9.1%      31983 =C2=B1  3%  sched_debug.cfs_rq[=
56]:/.min_vruntime
      1.41 =C2=B1  2%      -8.3%       1.29 =C2=B1  4%  perf-profile.cpu-cy=
cles.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.=
cpu_startup_entry.start_secondary
      1.63 =C2=B1  1%      -9.3%       1.48 =C2=B1  3%  perf-profile.cpu-cy=
cles.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
     45161 =C2=B1 11%     -12.8%      39358 =C2=B1  4%  sched_debug.cfs_rq[=
25]:/.min_vruntime
     39201 =C2=B1  5%     +17.3%      45969 =C2=B1 18%  sched_debug.cfs_rq[=
8]:/.min_vruntime
  21071502 =C2=B1  0%      -3.3%   20379730 =C2=B1  0%  time.minor_page_fau=
lts
       299 =C2=B1  0%      -3.1%        290 =C2=B1  0%  time.user_time
  21763267 =C2=B1  0%      -3.3%   21055329 =C2=B1  0%  time.voluntary_cont=
ext_switches
    142199 =C2=B1  0%      -3.1%     137732 =C2=B1  0%  vmstat.system.cs
       737 =C2=B1  0%      -2.1%        721 =C2=B1  1%  time.system_time
       341 =C2=B1  0%      -2.5%        333 =C2=B1  0%  time.percent_of_cpu=
_this_job_got

lkp-nex06: Nehalem-EX
Memory: 64G




                                   turbostat.%c0

    14 ++------------------------------------------------------------------=
-+
       |                                                    O              =
 |
       |                      O  O   O  O  O                               =
 |
  13.5 O+           O                         O   O  O  O         O  O     =
 |
       |  O   O        O                                       O         O =
 |
       |         O         O                                               =
 O
    13 ++                                                                  =
 |
       |                                                                   =
 |
  12.5 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
    12 *+.*...*..     .*...                                                =
 |
       |         *..*.     *..  .*...*..*..*..*...  .*..*                  =
 |
       |                      *.                  *.                       =
 |
  11.5 ++------------------------------------------------------------------=
-+


                                   turbostat.GHz

  1.48 ++------------------------------------------------------------------=
-+
       O            O  O      O  O   O  O  O  O   O         O     O        =
 |
  1.46 ++ O   O  O         O                         O  O      O     O   O =
 O
  1.44 ++                                                                  =
 |
       |                                                                   =
 |
  1.42 ++                                                                  =
 |
       |                                                                   =
 |
   1.4 ++                                                                  =
 |
       |                                                                   =
 |
  1.38 ++                                                                  =
 |
  1.36 ++                                                                  =
 |
       |                                                                   =
 |
  1.34 ++             .*...*..            .*..*...  .*..                   =
 |
       *..*...*..*..*.        *..*...*..*.        *.    *                  =
 |
  1.32 ++------------------------------------------------------------------=
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

	--yliu

--===============7457558934930950773==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB2bS1zY2FsYWJpbGl0eQpkZWZhdWx0X21vbml0b3JzOgogIHdhaXQ6IHBy
ZS10ZXN0CiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVtYS1udW1hc3RhdDog
CiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0YXQ6IAogIHByb2Mt
c3RhdDogCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3Rh
dDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAg
ZGlza3N0YXRzOiAKICBjcHVpZGxlOiAKICBjcHVmcmVxOiAKICB0dXJib3N0YXQ6IAogIHNjaGVk
X2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCmRlZmF1bHRfd2F0Y2hkb2dzOgogIHdhdGNoLW9vbTog
CiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOgotIHBlcmZvcm1hbmNlCmNvbW1pdDogYTAz
NzAxZTAwYTg0Njk2Zjc1ZTk2NGU5YmJmZDY1Zjg3N2MxNGE3OQptb2RlbDogTmVoYWxlbS1FWApt
ZW1vcnk6IDY0Rwpucl9jcHU6IDY0Cm5yX2hkZF9wYXJ0aXRpb25zOiAwCmhkZF9wYXJ0aXRpb25z
OiAKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCnJvb3RmczogY2xlYXJsaW51
eC14ODZfNjQtMjAxNDExMDUuY2d6CnBlcmYtcHJvZmlsZTogCnJ1bnRpbWU6IDMwMHMKc2l6ZTog
CnZtLXNjYWxhYmlsaXR5OgogIHRlc3Q6CiAgLSBzbWFsbC1hbGxvY3MtbXQKdGVzdGJveDogbGtw
LW5leDA2CnRib3hfZ3JvdXA6IGxrcC1uZXgwNgprY29uZmlnOiB4ODZfNjQtcmhlbApoZWFkX2Nv
bW1pdDogYTAzNzAxZTAwYTg0Njk2Zjc1ZTk2NGU5YmJmZDY1Zjg3N2MxNGE3OQpiYXNlX2NvbW1p
dDogMjA2YzVmNjBhM2Q5MDJiYzRiNTZkYWIyZGUzZTg4ZGU1ZWIwNjEwOApicmFuY2g6IGxpbnV4
LWRldmVsL2RldmVsLWhvdXJseS0yMDE0MTExNjA4Cmtlcm5lbDogIi9rZXJuZWwveDg2XzY0LXJo
ZWwvYTAzNzAxZTAwYTg0Njk2Zjc1ZTk2NGU5YmJmZDY1Zjg3N2MxNGE3OS92bWxpbnV6LTMuMTgu
MC1yYzQtZ2EwMzcwMWUiCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJlc3VsdF9yb290OiAiL3Jl
c3VsdC9sa3AtbmV4MDYvdm0tc2NhbGFiaWxpdHkvcGVyZm9ybWFuY2UtMzAwcy1zbWFsbC1hbGxv
Y3MtbXQvY2xlYXJsaW51eC14ODZfNjQtMjAxNDExMDUuY2d6L3g4Nl82NC1yaGVsL2EwMzcwMWUw
MGE4NDY5NmY3NWU5NjRlOWJiZmQ2NWY4NzdjMTRhNzkvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVk
dWxlZC9sa3AtbmV4MDYvY3ljbGljX3ZtLXNjYWxhYmlsaXR5LXBlcmZvcm1hbmNlLTMwMHMtc21h
bGwtYWxsb2NzLW10LWNsZWFybGludXgteDg2XzY0LmNnei14ODZfNjQtcmhlbC1IRUFELWEwMzcw
MWUwMGE4NDY5NmY3NWU5NjRlOWJiZmQ2NWY4NzdjMTRhNzktMC55YW1sIgpkZXF1ZXVlX3RpbWU6
IDIwMTQtMTEtMTYgMTI6MDQ6MDUuOTMwNjc2NDc1ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVk
CmxvYWRhdmc6IDUzLjk0IDM5LjQxIDE3LjU4IDEvNTMxIDExMTA5CnN0YXJ0X3RpbWU6ICcxNDE2
MTM5NTM0JwplbmRfdGltZTogJzE0MTYxMzk4MzcnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIw
MTQxMTE2LTEyMDAyMiIK

--===============7457558934930950773==
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
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm1vdW50
IC10IHRtcGZzIC1vIHNpemU9MTAwJSB2bS1zY2FsYWJpbGl0eS10bXAgL3RtcC92bS1zY2FsYWJp
bGl0eS10bXAKdHJ1bmNhdGUgLXMgMzM2MDc0MTM3NjAgL3RtcC92bS1zY2FsYWJpbGl0eS5pbWcK
bWtmcy54ZnMgLXEgL3RtcC92bS1zY2FsYWJpbGl0eS5pbWcKbW91bnQgLW8gbG9vcCAvdG1wL3Zt
LXNjYWxhYmlsaXR5LmltZyAvdG1wL3ZtLXNjYWxhYmlsaXR5Ci4vY2FzZS1zbWFsbC1hbGxvY3Mt
bXQKLi91c2VtZW0gLS1ydW50aW1lIDMwMCAtdCA2NCAtLXJlYWRvbmx5IC0tdW5pdCA0MDk2MCA2
ODcxOTQ3NjczNgp1bW91bnQgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAKdW1vdW50IC90bXAvdm0t
c2NhbGFiaWxpdHkKcm0gL3RtcC92bS1zY2FsYWJpbGl0eS5pbWcK

--===============7457558934930950773==--

