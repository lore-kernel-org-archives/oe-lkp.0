Content-Type: multipart/mixed; boundary="===============6236780685103091088=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [vmstat] 7cc36bbddde: +2.6% will-it-scale.scalability -28.7% time.involuntary_context_switches
Date: Fri, 19 Dec 2014 12:50:02 +0800
Message-ID: <1418964602.26403.23.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6236780685103091088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 7cc36bbddde5cd0c98f0c06e3304ab833d662565 ("vmstat: on-demand vmstat =
workers V8")


testbox/testcase/testparams: lkp-sbx04/will-it-scale/performance-pread2

f0d6d1f6ff6f8525  7cc36bbddde5cd0c98f0c06e33  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      0.00 =C2=B1  1%      +2.6%       0.00 =C2=B1  1%  will-it-scale.scala=
bility
    533566 =C2=B1  0%      -1.2%     527362 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
    486263 =C2=B1  0%      -0.9%     481764 =C2=B1  0%  will-it-scale.per_t=
hread_ops
       355 =C2=B1 14%    +163.0%        933 =C2=B1 37%  sched_debug.cpu#20.=
curr->pid
         6 =C2=B1 34%    +148.0%         15 =C2=B1 11%  sched_debug.cfs_rq[=
52]:/.load
     11214 =C2=B1 48%     -55.6%       4973 =C2=B1 14%  sched_debug.cfs_rq[=
11]:/.exec_clock
         5 =C2=B1 31%     -55.0%          2 =C2=B1 48%  sched_debug.cpu#5.c=
pu_load[1]
     88729 =C2=B1 46%     -53.2%      41487 =C2=B1  3%  sched_debug.cfs_rq[=
11]:/.min_vruntime
       408 =C2=B1 34%     -56.8%        176 =C2=B1  3%  sched_debug.cpu#43.=
ttwu_local
         7 =C2=B1 34%    +114.3%         15 =C2=B1 12%  sched_debug.cpu#52.=
load
        13 =C2=B1 46%     +70.4%         23 =C2=B1 26%  sched_debug.cpu#43.=
load
         4 =C2=B1 17%    +105.3%          9 =C2=B1 19%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
      6562 =C2=B1 25%    +120.1%      14443 =C2=B1 16%  sched_debug.cfs_rq[=
7]:/.exec_clock
         3 =C2=B1 22%     -46.7%          2 =C2=B1  0%  sched_debug.cfs_rq[=
28]:/.blocked_load_avg
     68456 =C2=B1 17%     -39.7%      41302 =C2=B1 47%  sched_debug.cfs_rq[=
46]:/.spread0
       187 =C2=B1 15%     -38.2%        115 =C2=B1 18%  sched_debug.cpu#40.=
ttwu_local
       941 =C2=B1 25%     +76.9%       1665 =C2=B1 19%  sched_debug.cpu#52.=
curr->pid
        11 =C2=B1  3%    +104.4%         23 =C2=B1 49%  sched_debug.cfs_rq[=
48]:/.tg_load_contrib
       534 =C2=B1 20%     +87.9%       1003 =C2=B1 48%  sched_debug.cpu#6.t=
twu_local
     51437 =C2=B1 28%     +55.8%      80132 =C2=B1 19%  sched_debug.cfs_rq[=
8]:/.min_vruntime
     14311 =C2=B1 23%     +67.2%      23936 =C2=B1 24%  sched_debug.cpu#22.=
sched_goidle
         9 =C2=B1  8%     -35.9%          6 =C2=B1 26%  sched_debug.cpu#39.=
cpu_load[4]
     14113 =C2=B1 24%     +66.8%      23537 =C2=B1 25%  sched_debug.cpu#22.=
ttwu_count
     28742 =C2=B1 23%     +66.8%      47938 =C2=B1 24%  sched_debug.cpu#22.=
nr_switches
         7 =C2=B1 17%     -27.6%          5 =C2=B1 20%  sched_debug.cpu#42.=
cpu_load[0]
     58556 =C2=B1 16%     -32.5%      39547 =C2=B1  4%  sched_debug.cfs_rq[=
12]:/.min_vruntime
       199 =C2=B1  9%     -37.1%        125 =C2=B1 12%  sched_debug.cpu#46.=
ttwu_local
    161308 =C2=B1 28%     -45.6%      87699 =C2=B1 30%  sched_debug.cpu#2.s=
ched_goidle
    322838 =C2=B1 28%     -45.6%     175601 =C2=B1 30%  sched_debug.cpu#2.n=
r_switches
       188 =C2=B1  8%     -30.3%        131 =C2=B1 11%  sched_debug.cpu#47.=
ttwu_local
    330608 =C2=B1 31%     -46.5%     176795 =C2=B1 29%  sched_debug.cpu#2.s=
ched_count
       407 =C2=B1 12%     +39.7%        568 =C2=B1 10%  sched_debug.cpu#30.=
ttwu_local
        75 =C2=B1 21%     +31.5%         99 =C2=B1 19%  sched_debug.cfs_rq[=
8]:/.tg_runnable_contrib
         9 =C2=B1 15%     -33.3%          6 =C2=B1 11%  sched_debug.cpu#36.=
cpu_load[1]
      3494 =C2=B1 21%     +31.0%       4578 =C2=B1 18%  sched_debug.cfs_rq[=
8]:/.avg->runnable_avg_sum
       304 =C2=B1  9%     -28.7%        217 =C2=B1  9%  sched_debug.cpu#39.=
ttwu_local
       118 =C2=B1 10%     -25.2%         88 =C2=B1 11%  sched_debug.cpu#48.=
ttwu_local
    171927 =C2=B1 32%     -45.5%      93673 =C2=B1 34%  sched_debug.cpu#2.t=
twu_count
     68928 =C2=B1 14%     -41.9%      40061 =C2=B1 46%  sched_debug.cfs_rq[=
40]:/.spread0
         9 =C2=B1 11%     -33.3%          6 =C2=B1 17%  sched_debug.cpu#38.=
cpu_load[4]
         9 =C2=B1 15%     -25.6%          7 =C2=B1 15%  sched_debug.cpu#38.=
cpu_load[3]
       537 =C2=B1 15%     -28.3%        385 =C2=B1 14%  sched_debug.cpu#9.t=
twu_local
      2694 =C2=B1 15%     -21.5%       2116 =C2=B1  6%  sched_debug.cfs_rq[=
16]:/.avg->runnable_avg_sum
        58 =C2=B1 15%     -21.1%         45 =C2=B1  6%  sched_debug.cfs_rq[=
16]:/.tg_runnable_contrib
      0.05 =C2=B1  8%     +33.3%       0.07 =C2=B1 10%  turbostat.%c3
    130948 =C2=B1 11%     -40.3%      78138 =C2=B1 47%  sched_debug.cfs_rq[=
39]:/.spread0
       282 =C2=B1 10%     -22.1%        220 =C2=B1  7%  sched_debug.cpu#38.=
ttwu_local
     20679 =C2=B1 18%     -26.9%      15120 =C2=B1 17%  numa-meminfo.node2.=
Active(anon)
      5170 =C2=B1 18%     -26.9%       3778 =C2=B1 17%  numa-vmstat.node2.n=
r_active_anon
     36499 =C2=B1  4%     -24.1%      27721 =C2=B1  8%  sched_debug.cfs_rq[=
39]:/.exec_clock
    259406 =C2=B1  8%     -19.7%     208230 =C2=B1 10%  sched_debug.cfs_rq[=
39]:/.min_vruntime
       125 =C2=B1  5%     -20.5%         99 =C2=B1 14%  sched_debug.cpu#55.=
ttwu_local
        23 =C2=B1 10%     -26.1%         17 =C2=B1 19%  sched_debug.cfs_rq[=
44]:/.load
     82250 =C2=B1  9%     -20.9%      65029 =C2=B1 11%  sched_debug.cfs_rq[=
2]:/.min_vruntime
     80988 =C2=B1  8%     +17.1%      94812 =C2=B1  7%  meminfo.DirectMap4k
        47 =C2=B1 10%     +15.3%         54 =C2=B1  8%  sched_debug.cfs_rq[=
20]:/.tg_runnable_contrib
        73 =C2=B1  7%     -22.9%         56 =C2=B1  8%  sched_debug.cpu#63.=
ttwu_local
     46694 =C2=B1  4%     +29.7%      60558 =C2=B1  7%  sched_debug.cpu#7.n=
r_load_updates
      2205 =C2=B1  9%     +15.1%       2539 =C2=B1  8%  sched_debug.cfs_rq[=
20]:/.avg->runnable_avg_sum
       772 =C2=B1 10%     -17.6%        636 =C2=B1  4%  sched_debug.cpu#33.=
ttwu_local
      1.64 =C2=B1  3%     +21.3%       1.98 =C2=B1 10%  perf-profile.cpu-cy=
cles.copy_user_generic_string.copy_page_to_iter.shmem_file_read_iter.new_sy=
nc_read.vfs_read
       140 =C2=B1 25%     -34.4%         92 =C2=B1  9%  sched_debug.cpu#54.=
ttwu_local
      1.27 =C2=B1  4%     -14.0%       1.09 =C2=B1  9%  perf-profile.cpu-cy=
cles.put_page.shmem_file_read_iter.new_sync_read.vfs_read.sys_pread64
      1.72 =C2=B1  7%     -14.8%       1.46 =C2=B1  9%  perf-profile.cpu-cy=
cles.find_get_entry.find_lock_entry.shmem_getpage_gfp.shmem_file_read_iter.=
new_sync_read
       251 =C2=B1  1%     -17.8%        206 =C2=B1 11%  sched_debug.cfs_rq[=
39]:/.tg_runnable_contrib
     11533 =C2=B1  1%     -17.7%       9492 =C2=B1 11%  sched_debug.cfs_rq[=
39]:/.avg->runnable_avg_sum
    649966 =C2=B1  7%     +20.0%     779700 =C2=B1  5%  sched_debug.cpu#36.=
ttwu_count
      3.99 =C2=B1  2%     +20.4%       4.80 =C2=B1  7%  perf-profile.cpu-cy=
cles.__wake_up_common.__wake_up.__wake_up_bit.unlock_page.shmem_file_read_i=
ter
    613256 =C2=B1  9%      -9.5%     555274 =C2=B1 10%  sched_debug.cpu#26.=
avg_idle
       554 =C2=B1 22%     +55.5%        862 =C2=B1 39%  sched_debug.cpu#3.t=
twu_local
         8 =C2=B1  4%     +51.4%         13 =C2=B1 33%  sched_debug.cfs_rq[=
25]:/.tg_load_contrib
    637300 =C2=B1  8%     +15.3%     734754 =C2=B1  5%  sched_debug.cpu#36.=
sched_goidle
   1275355 =C2=B1  8%     +15.3%    1470926 =C2=B1  5%  sched_debug.cpu#36.=
sched_count
   1274943 =C2=B1  8%     +15.3%    1469761 =C2=B1  5%  sched_debug.cpu#36.=
nr_switches
    101711 =C2=B1  5%     -13.8%      87699 =C2=B1  7%  sched_debug.cpu#39.=
nr_load_updates
       374 =C2=B1 19%     -31.5%        256 =C2=B1 13%  sched_debug.cpu#32.=
ttwu_local
    249095 =C2=B1  6%     -14.2%     213769 =C2=B1  7%  sched_debug.cfs_rq[=
38]:/.min_vruntime
     34404 =C2=B1  5%     -15.9%      28935 =C2=B1  8%  sched_debug.cfs_rq[=
38]:/.exec_clock
     44719 =C2=B1  5%     -11.1%      39771 =C2=B1  6%  sched_debug.cpu#62.=
nr_load_updates
      1.06 =C2=B1  6%     +13.5%       1.20 =C2=B1  6%  perf-profile.cpu-cy=
cles.wake_bit_function.__wake_up.__wake_up_bit.unlock_page.shmem_file_read_=
iter
     11248 =C2=B1  5%     -13.2%       9765 =C2=B1  9%  sched_debug.cfs_rq[=
38]:/.avg->runnable_avg_sum
      2425 =C2=B1 14%     +18.9%       2883 =C2=B1  7%  sched_debug.cfs_rq[=
19]:/.exec_clock
       245 =C2=B1  5%     -13.0%        213 =C2=B1  9%  sched_debug.cfs_rq[=
38]:/.tg_runnable_contrib
       129 =C2=B1  3%     -21.3%        101 =C2=B1 10%  sched_debug.cpu#53.=
ttwu_local
     41965 =C2=B1  9%     -13.8%      36182 =C2=B1  5%  numa-meminfo.node2.=
Active
      4000 =C2=B1  0%     -11.1%       3554 =C2=B1  7%  proc-vmstat.nr_shmem
     16003 =C2=B1  0%     -11.1%      14220 =C2=B1  7%  meminfo.Shmem
        94 =C2=B1  3%     +10.6%        104 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.tg_runnable_contrib
      5773 =C2=B1 11%     -15.2%       4893 =C2=B1  6%  numa-vmstat.node1.n=
r_slab_unreclaimable
      4366 =C2=B1  3%     +10.4%       4818 =C2=B1  4%  sched_debug.cfs_rq[=
41]:/.avg->runnable_avg_sum
     23094 =C2=B1 11%     -15.2%      19576 =C2=B1  6%  numa-meminfo.node1.=
SUnreclaim
     55562 =C2=B1  4%     -11.5%      49192 =C2=B1 10%  sched_debug.cpu#2.n=
r_load_updates
     32616 =C2=B1  3%     -10.2%      29304 =C2=B1  8%  sched_debug.cpu#61.=
ttwu_count
    667746 =C2=B1 13%     +21.4%     810334 =C2=B1  3%  sched_debug.cpu#34.=
ttwu_count
     34230 =C2=B1  6%     -11.2%      30408 =C2=B1  2%  numa-meminfo.node1.=
Slab
      1835 =C2=B1  2%     +12.1%       2057 =C2=B1  6%  numa-meminfo.node1.=
KernelStack
      4589 =C2=B1  1%     -28.7%       3271 =C2=B1  2%  time.involuntary_co=
ntext_switches
       359 =C2=B1  3%      +5.2%        378 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
      1105 =C2=B1  3%      +5.2%       1163 =C2=B1  0%  time.system_time

lkp-sbx04: Sandy Bridge-EX
Memory: 64G




                         time.involuntary_context_switches

  5000 ++------------------------------------------------------------------=
-+
  4500 ++*.*.*.*.*.*. .*.*.*. .*.*.*.*.*. *.*.*.*                          =
 |
       *             *       *           *                                 =
 |
  4000 ++                                                                  =
 |
  3500 O+O O O   O     O O O     O O                                       =
 |
       |       O   O O       O O     O O OO O   O O   O O O O O O O O O O O=
 O
  3000 ++                                                                  =
 |
  2500 ++                                                                  =
 |
  2000 ++                                                                  =
 |
       |                                                                   =
 |
  1500 ++                                                                  =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   500 ++                                                                  =
 |
     0 ++-------------------------------------O-----O----------------------=
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
Huang, Ying


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============6236780685103091088==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3RhdDogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dhdGNoZG9nczoKICB3
YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpj
b21taXQ6IGIyNzc2YmY3MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQKbW9kZWw6IFNh
bmR5IEJyaWRnZS1FWApucl9jcHU6IDY0Cm1lbW9yeTogNjRHCm5yX3NzZF9wYXJ0aXRpb25zOiA0
CnNzZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzJDVzI0MEEz
X0NWQ1YyMDQzMCotcGFydDEiCnN3YXBfcGFydGl0aW9uczogCnBlcmYtcHJvZmlsZToKICBmcmVx
OiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0OgogIC0gcHJlYWQyCnRlc3Rib3g6IGxrcC1zYngw
NAp0Ym94X2dyb3VwOiBsa3Atc2J4MDQKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1l
OiAyMDE0LTEyLTA4IDE0OjM1OjA4LjAyNDI2MjU4MiArMDg6MDAKaGVhZF9jb21taXQ6IDY4ODhk
ZjI1ZmIxYjQ0NjM3OGIwZWE5ZWE5NzhjMThmNDkyZjRlZTEKYmFzZV9jb21taXQ6IGIyNzc2YmY3
MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZl
bC1ob3VybHktMjAxNDEyMDgxMQprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsL2IyNzc2YmY3
MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQvdm1saW51ei0zLjE4LjAtZ2IyNzc2YmYi
CnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJvb3RmczogZGViaWFuLXg4Nl82NC5jZ3oKcmVzdWx0
X3Jvb3Q6ICIvcmVzdWx0L2xrcC1zYngwNC93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLXByZWFk
Mi9kZWJpYW4teDg2XzY0LmNnei94ODZfNjQtcmhlbC9iMjc3NmJmNzE0OWJkZGQxZjQxNjFmMTRm
Nzk1MjBmMTdmYzFkNzFkLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLXNieDA0L2N5
Y2xpY193aWxsLWl0LXNjYWxlLXBlcmZvcm1hbmNlLXByZWFkMi14ODZfNjQtcmhlbC1CQVNFLWIy
Nzc2YmY3MTQ5YmRkZDFmNDE2MWYxNGY3OTUyMGYxN2ZjMWQ3MWQtMC55YW1sIgpkZXF1ZXVlX3Rp
bWU6IDIwMTQtMTItMDggMTc6MjM6NDMuMTA3MDQxNTM4ICswODowMApqb2Jfc3RhdGU6IGZpbmlz
aGVkCmxvYWRhdmc6IDQzLjQzIDIxLjA4IDguMzIgMS81MzAgMTM5NDkKc3RhcnRfdGltZTogJzE0
MTgwMzA2NzUnCmVuZF90aW1lOiAnMTQxODAzMDk4NCcKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMt
MjAxNDEyMDYtMDYwMjE5Igo=

--===============6236780685103091088==
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
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vcnVu
dGVzdC5weSBwcmVhZDIgMTYgMSA4IDE2IDI0IDMyIDQ4IDY0Cg==

--===============6236780685103091088==--

