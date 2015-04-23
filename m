Content-Type: multipart/mixed; boundary="===============0620072632105889147=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [RAID5] 878ee679279: -1.8% vmstat.io.bo, +40.5% perf-stat.LLC-load-misses
Date: Thu, 23 Apr 2015 14:55:59 +0800
Message-ID: <1429772159.25120.9.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0620072632105889147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://neil.brown.name/md for-next
commit 878ee6792799e2f88bdcac329845efadb205252f ("RAID5: batch adjacent ful=
l stripe write")


testbox/testcase/testparams: lkp-st02/dd-write/300-5m-11HDD-RAID5-cfq-xfs-1=
dd

a87d7f782b47e030  878ee6792799e2f88bdcac3298  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

     59035 =C2=B1  0%     +18.4%      69913 =C2=B1  1%  softirqs.SCHED
      1330 =C2=B1 10%     +17.4%       1561 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
      1330 =C2=B1 10%     +17.4%       1561 =C2=B1  4%  slabinfo.kmalloc-51=
2.active_objs
    305908 =C2=B1  0%      -1.8%     300427 =C2=B1  0%  vmstat.io.bo
         1 =C2=B1  0%    +100.0%          2 =C2=B1  0%  vmstat.procs.r
      8266 =C2=B1  1%     -15.7%       6968 =C2=B1  0%  vmstat.system.cs
     14819 =C2=B1  0%      -2.1%      14503 =C2=B1  0%  vmstat.system.in
     18.20 =C2=B1  6%     +10.2%      20.05 =C2=B1  4%  perf-profile.cpu-cy=
cles.raid_run_ops.handle_stripe.handle_active_stripes.raid5d.md_thread
      1.94 =C2=B1  9%     +90.6%       3.70 =C2=B1  9%  perf-profile.cpu-cy=
cles.async_xor.raid_run_ops.handle_stripe.handle_active_stripes.raid5d
      0.00 =C2=B1  0%      +Inf%      25.18 =C2=B1  3%  perf-profile.cpu-cy=
cles.handle_active_stripes.isra.45.raid5d.md_thread.kthread.ret_from_fork
      0.00 =C2=B1  0%      +Inf%      14.14 =C2=B1  4%  perf-profile.cpu-cy=
cles.async_copy_data.isra.42.raid_run_ops.handle_stripe.handle_active_strip=
es.raid5d
      1.79 =C2=B1  7%    +102.9%       3.64 =C2=B1  9%  perf-profile.cpu-cy=
cles.xor_blocks.async_xor.raid_run_ops.handle_stripe.handle_active_stripes
      3.09 =C2=B1  4%     -10.8%       2.76 =C2=B1  4%  perf-profile.cpu-cy=
cles.get_active_stripe.make_request.md_make_request.generic_make_request.su=
bmit_bio
      0.80 =C2=B1 14%     +28.1%       1.02 =C2=B1 10%  perf-profile.cpu-cy=
cles.mutex_lock.xfs_file_buffered_aio_write.xfs_file_write_iter.new_sync_wr=
ite.vfs_write
     14.78 =C2=B1  6%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.async_copy_data.isra.38.raid_run_ops.handle_stripe.handle_active_strip=
es.raid5d
     25.68 =C2=B1  4%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.handle_active_stripes.isra.41.raid5d.md_thread.kthread.ret_from_fork
      1.23 =C2=B1  5%    +140.0%       2.96 =C2=B1  7%  perf-profile.cpu-cy=
cles.xor_sse_5_pf64.xor_blocks.async_xor.raid_run_ops.handle_stripe
      2.62 =C2=B1  6%     -95.6%       0.12 =C2=B1 33%  perf-profile.cpu-cy=
cles.analyse_stripe.handle_stripe.handle_active_stripes.raid5d.md_thread
      0.96 =C2=B1  9%     +17.5%       1.12 =C2=B1  2%  perf-profile.cpu-cy=
cles.xfs_ilock.xfs_file_buffered_aio_write.xfs_file_write_iter.new_sync_wri=
te.vfs_write
 1.461e+10 =C2=B1  0%      -5.3%  1.384e+10 =C2=B1  1%  perf-stat.L1-dcache=
-load-misses
 3.688e+11 =C2=B1  0%      -2.7%   3.59e+11 =C2=B1  0%  perf-stat.L1-dcache=
-loads
 1.124e+09 =C2=B1  0%     -27.7%  8.125e+08 =C2=B1  0%  perf-stat.L1-dcache=
-prefetches
 2.767e+10 =C2=B1  0%      -1.8%  2.717e+10 =C2=B1  0%  perf-stat.L1-dcache=
-store-misses
 2.352e+11 =C2=B1  0%      -2.8%  2.287e+11 =C2=B1  0%  perf-stat.L1-dcache=
-stores
 6.774e+09 =C2=B1  0%      -2.3%   6.62e+09 =C2=B1  0%  perf-stat.L1-icache=
-load-misses
 5.571e+08 =C2=B1  0%     +40.5%  7.826e+08 =C2=B1  1%  perf-stat.LLC-load-=
misses
 6.263e+09 =C2=B1  0%     -13.7%  5.407e+09 =C2=B1  1%  perf-stat.LLC-loads
 1.914e+11 =C2=B1  0%      -4.2%  1.833e+11 =C2=B1  0%  perf-stat.branch-in=
structions
 1.145e+09 =C2=B1  2%      -5.6%  1.081e+09 =C2=B1  0%  perf-stat.branch-lo=
ad-misses
 1.911e+11 =C2=B1  0%      -4.3%  1.829e+11 =C2=B1  0%  perf-stat.branch-lo=
ads
 1.142e+09 =C2=B1  2%      -5.1%  1.083e+09 =C2=B1  0%  perf-stat.branch-mi=
sses
 1.218e+09 =C2=B1  0%     +19.8%   1.46e+09 =C2=B1  0%  perf-stat.cache-mis=
ses
 2.118e+10 =C2=B1  0%      -5.2%  2.007e+10 =C2=B1  0%  perf-stat.cache-ref=
erences
   2510308 =C2=B1  1%     -15.7%    2115410 =C2=B1  0%  perf-stat.context-s=
witches
     39623 =C2=B1  0%     +22.1%      48370 =C2=B1  1%  perf-stat.cpu-migra=
tions
 4.179e+08 =C2=B1 40%    +165.7%  1.111e+09 =C2=B1 35%  perf-stat.dTLB-load=
-misses
 3.684e+11 =C2=B1  0%      -2.5%  3.592e+11 =C2=B1  0%  perf-stat.dTLB-loads
 1.232e+08 =C2=B1 15%     +62.5%  2.002e+08 =C2=B1 27%  perf-stat.dTLB-stor=
e-misses
 2.348e+11 =C2=B1  0%      -2.5%  2.288e+11 =C2=B1  0%  perf-stat.dTLB-stor=
es
   3577297 =C2=B1  2%      +8.7%    3888986 =C2=B1  1%  perf-stat.iTLB-load=
-misses
 1.035e+12 =C2=B1  0%      -3.5%  9.988e+11 =C2=B1  0%  perf-stat.iTLB-loads
 1.036e+12 =C2=B1  0%      -3.7%  9.978e+11 =C2=B1  0%  perf-stat.instructi=
ons
       594 =C2=B1 30%    +130.3%       1369 =C2=B1 13%  sched_debug.cfs_rq[=
0]:/.blocked_load_avg
        17 =C2=B1 10%     -28.2%         12 =C2=B1 23%  sched_debug.cfs_rq[=
0]:/.nr_spread_over
       210 =C2=B1 21%     +42.1%        298 =C2=B1 28%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
      9676 =C2=B1 21%     +42.1%      13754 =C2=B1 28%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
       772 =C2=B1 25%    +116.5%       1672 =C2=B1  9%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
      8402 =C2=B1  9%     +83.3%      15405 =C2=B1 11%  sched_debug.cfs_rq[=
0]:/.tg_load_avg
      8356 =C2=B1  9%     +82.8%      15272 =C2=B1 11%  sched_debug.cfs_rq[=
1]:/.tg_load_avg
       968 =C2=B1 25%    +100.8%       1943 =C2=B1 14%  sched_debug.cfs_rq[=
1]:/.blocked_load_avg
     16242 =C2=B1  9%     -22.2%      12643 =C2=B1 14%  sched_debug.cfs_rq[=
1]:/.avg->runnable_avg_sum
       353 =C2=B1  9%     -22.1%        275 =C2=B1 14%  sched_debug.cfs_rq[=
1]:/.tg_runnable_contrib
      1183 =C2=B1 23%     +77.7%       2102 =C2=B1 12%  sched_debug.cfs_rq[=
1]:/.tg_load_contrib
       181 =C2=B1  8%     -31.4%        124 =C2=B1 26%  sched_debug.cfs_rq[=
2]:/.tg_runnable_contrib
      8364 =C2=B1  8%     -31.3%       5745 =C2=B1 26%  sched_debug.cfs_rq[=
2]:/.avg->runnable_avg_sum
      8297 =C2=B1  9%     +81.7%      15079 =C2=B1 12%  sched_debug.cfs_rq[=
2]:/.tg_load_avg
     30439 =C2=B1 13%     -45.2%      16681 =C2=B1 26%  sched_debug.cfs_rq[=
2]:/.exec_clock
     39735 =C2=B1 14%     -48.3%      20545 =C2=B1 29%  sched_debug.cfs_rq[=
2]:/.min_vruntime
      8231 =C2=B1 10%     +82.2%      15000 =C2=B1 12%  sched_debug.cfs_rq[=
3]:/.tg_load_avg
      1210 =C2=B1 14%    +110.3%       2546 =C2=B1 30%  sched_debug.cfs_rq[=
4]:/.tg_load_contrib
      8188 =C2=B1 10%     +82.8%      14964 =C2=B1 12%  sched_debug.cfs_rq[=
4]:/.tg_load_avg
      8132 =C2=B1 10%     +83.1%      14890 =C2=B1 12%  sched_debug.cfs_rq[=
5]:/.tg_load_avg
       749 =C2=B1 29%    +205.9%       2292 =C2=B1 34%  sched_debug.cfs_rq[=
5]:/.blocked_load_avg
       963 =C2=B1 30%    +169.9%       2599 =C2=B1 33%  sched_debug.cfs_rq[=
5]:/.tg_load_contrib
     37791 =C2=B1 32%     -38.6%      23209 =C2=B1 13%  sched_debug.cfs_rq[=
6]:/.min_vruntime
       693 =C2=B1 25%    +132.2%       1609 =C2=B1 29%  sched_debug.cfs_rq[=
6]:/.blocked_load_avg
     10838 =C2=B1 13%     -39.2%       6587 =C2=B1 13%  sched_debug.cfs_rq[=
6]:/.avg->runnable_avg_sum
     29329 =C2=B1 27%     -33.2%      19577 =C2=B1 10%  sched_debug.cfs_rq[=
6]:/.exec_clock
       235 =C2=B1 14%     -39.7%        142 =C2=B1 14%  sched_debug.cfs_rq[=
6]:/.tg_runnable_contrib
      8085 =C2=B1 10%     +83.6%      14848 =C2=B1 12%  sched_debug.cfs_rq[=
6]:/.tg_load_avg
       839 =C2=B1 25%    +128.5%       1917 =C2=B1 18%  sched_debug.cfs_rq[=
6]:/.tg_load_contrib
      8051 =C2=B1 10%     +83.6%      14779 =C2=B1 12%  sched_debug.cfs_rq[=
7]:/.tg_load_avg
       156 =C2=B1 34%     +97.9%        309 =C2=B1 19%  sched_debug.cpu#0.c=
pu_load[4]
       160 =C2=B1 25%     +64.0%        263 =C2=B1 16%  sched_debug.cpu#0.c=
pu_load[2]
       156 =C2=B1 32%     +83.7%        286 =C2=B1 17%  sched_debug.cpu#0.c=
pu_load[3]
       164 =C2=B1 20%     -35.1%        106 =C2=B1 31%  sched_debug.cpu#2.c=
pu_load[0]
       249 =C2=B1 15%     +80.2%        449 =C2=B1 10%  sched_debug.cpu#4.c=
pu_load[3]
       231 =C2=B1 11%    +101.2%        466 =C2=B1 13%  sched_debug.cpu#4.c=
pu_load[2]
       217 =C2=B1 14%    +189.9%        630 =C2=B1 38%  sched_debug.cpu#4.c=
pu_load[0]
     71951 =C2=B1  5%     +21.6%      87526 =C2=B1  7%  sched_debug.cpu#4.n=
r_load_updates
       214 =C2=B1  8%    +146.1%        527 =C2=B1 27%  sched_debug.cpu#4.c=
pu_load[1]
       256 =C2=B1 17%     +75.7%        449 =C2=B1 13%  sched_debug.cpu#4.c=
pu_load[4]
       209 =C2=B1 23%     +98.3%        416 =C2=B1 48%  sched_debug.cpu#5.c=
pu_load[2]
     68024 =C2=B1  2%     +18.8%      80825 =C2=B1  1%  sched_debug.cpu#5.n=
r_load_updates
       217 =C2=B1 26%     +74.9%        380 =C2=B1 45%  sched_debug.cpu#5.c=
pu_load[3]
       852 =C2=B1 21%     -38.3%        526 =C2=B1 22%  sched_debug.cpu#6.c=
urr->pid

lkp-st02: Core2
Memory: 8G




                                perf-stat.cache-misses

  1.6e+09 O+-----O--O---O--O---O-------------------------------------------=
-+
          |                       O   O  O   O  O   O  O   O  O   O        =
 |
  1.4e+09 ++                                                               =
 |
  1.2e+09 *+.*...*      *..*      *      *...*..*...*..*...*..*...*..*...*.=
.*
          |      :      :  :      :      :                                 =
 |
    1e+09 ++      :    :    :    : :    :                                  =
 |
          |       :    :    :    : :    :                                  =
 |
    8e+08 ++      :    :    :    : :    :                                  =
 |
          |       :   :      :   :  :   :                                  =
 |
    6e+08 ++       :  :      :  :   :  :                                   =
 |
    4e+08 ++       : :        : :    : :                                   =
 |
          |        : :        : :    : :                                   =
 |
    2e+08 ++       : :        : :    : :                                   =
 |
          |         :          :      :                                    =
 |
        0 ++-O------*----------*------*------------------------------------=
-+


                            perf-stat.L1-dcache-prefetches

  1.2e+09 ++---------------------------------------------------------------=
-+
          *..*...*      *..*      *        ..*..  ..*..*...*..*...*..*...*.=
.*
    1e+09 ++     :      :  :      :      *.     *.                         =
 |
          |      :     :    :     ::     :                                 =
 |
          |       :    :    :    : :     :                        O        =
 |
    8e+08 O+     O: O  :O  O:  O :O:  O :O   O  O   O  O   O  O            =
 |
          |       :   :      :   :  :   :                                  =
 |
    6e+08 ++      :   :      :   :  :   :                                  =
 |
          |        :  :      :  :   :   :                                  =
 |
    4e+08 ++       :  :      :  :   :  :                                   =
 |
          |        : :        : :    : :                                   =
 |
          |        : :        : :    : :                                   =
 |
    2e+08 ++        ::        ::     : :                                   =
 |
          |         :          :      :                                    =
 |
        0 ++-O------*----------*------*------------------------------------=
-+


                              perf-stat.LLC-load-misses

  1e+09 ++-----------------------------------------------------------------=
-+
  9e+08 O+     O   O  O   O  O                                             =
 |
        |                        O   O  O   O                              =
 |
  8e+08 ++                                     O   O   O  O   O  O         =
 |
  7e+08 ++                                                                 =
 |
        |                                                                  =
 |
  6e+08 *+..*..*      *...*      *      *...*..*...*...*..*...*..*...*..*..=
.*
  5e+08 ++      :     :   :      ::     :                                  =
 |
  4e+08 ++      :    :     :    : :    :                                   =
 |
        |        :   :     :    :  :   :                                   =
 |
  3e+08 ++       :   :      :  :   :   :                                   =
 |
  2e+08 ++        : :       :  :    : :                                    =
 |
        |         : :       : :     : :                                    =
 |
  1e+08 ++         :         ::      :                                     =
 |
      0 ++--O------*---------*-------*-------------------------------------=
-+


                              perf-stat.context-switches

    3e+06 ++---------------------------------------------------------------=
-+
          |                              *...*..*...                       =
 |
  2.5e+06 *+.*...*      *..*      *      :          *..*...  .*...*..*...  =
.*
          |      :      :  :      :      :                 *.            *.=
 |
          O      O: O  :O  O:  O  ::    :       O   O  O   O  O   O        =
 |
    2e+06 ++      :    :    :    :O:  O :O   O                             =
 |
          |       :    :    :    : :    :                                  =
 |
  1.5e+06 ++      :   :      :   :  :   :                                  =
 |
          |        :  :      :   :  :  :                                   =
 |
    1e+06 ++       :  :      :  :   :  :                                   =
 |
          |        : :        : :    : :                                   =
 |
          |        : :        : :    : :                                   =
 |
   500000 ++        ::        : :    ::                                    =
 |
          |         :          :      :                                    =
 |
        0 ++-O------*----------*------*------------------------------------=
-+


                                  vmstat.system.cs

  10000 ++-----------------------------------------------------------------=
-+
   9000 ++                              *...*..                            =
 |
        *...*..*      *...*      *      :      *...*...*..  ..*..*...*..  .=
.*
   8000 ++     :      :   :      :      :                 *.            *. =
 |
   7000 O+     O:  O  O   O: O  : :    :       O   O   O  O   O  O         =
 |
        |       :    :     :    :O:  O :O   O                              =
 |
   6000 ++      :    :     :    : :    :                                   =
 |
   5000 ++       :   :     :   :   :   :                                   =
 |
   4000 ++       :   :      :  :   :  :                                    =
 |
        |        :  :       :  :   :  :                                    =
 |
   3000 ++        : :       : :     : :                                    =
 |
   2000 ++        : :       : :     : :                                    =
 |
        |         : :        ::     ::                                     =
 |
   1000 ++         :         :       :                                     =
 |
      0 ++--O------*---------*-------*-------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
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
Ying Huang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com


--===============0620072632105889147==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBkZC13cml0ZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IHByZS10ZXN0
CiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVt
YS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDog
CiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAg
bGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0
YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0
YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogMTAKZGVmYXVsdC13
YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJub3I6IApj
b21taXQ6IGExYTcxY2M0YzBhNTNlMjlmZTI3Y2VkZTkzOTJiMGFkODE2ZWU5NTYKbW9kZWw6IENv
cmUyCm1lbW9yeTogOEcKbnJfaGRkX3BhcnRpdGlvbnM6IDEyCndhaXRfZGlza3NfdGltZW91dDog
MzAwCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL3Njc2ktMzUwMDBjNTAwMD8/Pz8/
Pz8iCnN3YXBfcGFydGl0aW9uczogCnJ1bnRpbWU6IDVtCmRpc2s6IDExSERECm1kOiBSQUlENQpp
b3NjaGVkOiBjZnEKZnM6IHhmcwpmczI6IAptb25pdG9yczoKICBwZXJmLXN0YXQ6IAogIHBlcmYt
cHJvZmlsZTogCiAgZnRyYWNlOgogICAgZXZlbnRzOiBiYWxhbmNlX2RpcnR5X3BhZ2VzIGJkaV9k
aXJ0eV9yYXRlbGltaXQgZ2xvYmFsX2RpcnR5X3N0YXRlIHdyaXRlYmFja19zaW5nbGVfaW5vZGUK
bnJfdGhyZWFkczogMWRkCmRkOiAKdGVzdGJveDogbGtwLXN0MDIKdGJveF9ncm91cDogbGtwLXN0
MDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE1LTA0LTE5IDExOjU5OjU4
LjEyMDA2MzEyMCArMDg6MDAKaGVhZF9jb21taXQ6IGExYTcxY2M0YzBhNTNlMjlmZTI3Y2VkZTkz
OTJiMGFkODE2ZWU5NTYKYmFzZV9jb21taXQ6IDM5YTg4MDQ0NTVmYjIzZjA5MTU3MzQxZDNiYTdk
YjZkN2FlNmVlNzYKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNTA0MjAxNApr
ZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsL2ExYTcxY2M0YzBhNTNlMjlmZTI3Y2VkZTkzOTJi
MGFkODE2ZWU5NTYvdm1saW51ei00LjAuMC0wOTEwOS1nYTFhNzFjYyIKdXNlcjogbGtwCnF1ZXVl
OiBjeWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290
OiAiL3Jlc3VsdC9sa3Atc3QwMi9kZC13cml0ZS8zMDAtNW0tMTFIREQtUkFJRDUtY2ZxLXhmcy0x
ZGQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9hMWE3MWNjNGMwYTUz
ZTI5ZmUyN2NlZGU5MzkyYjBhZDgxNmVlOTU2LzAiCkxLUF9TRVJWRVI6IGlubgpqb2JfZmlsZTog
Ii9sa3Avc2NoZWR1bGVkL2xrcC1zdDAyL2N5Y2xpY19kZC13cml0ZS0zMDAtNW0tMTFIREQtUkFJ
RDUtY2ZxLXhmcy0xZGQteDg2XzY0LXJoZWwtSEVBRC1hMWE3MWNjNGMwYTUzZTI5ZmUyN2NlZGU5
MzkyYjBhZDgxNmVlOTU2LTAtMjAxNTA0MTktMzUwMjItMTdkZGFnMi55YW1sIgpkZXF1ZXVlX3Rp
bWU6IDIwMTUtMDQtMjAgMTY6MTc6NDYuNjM1MzIzMDc3ICswODowMApucl9jcHU6ICIkKG5wcm9j
KSIKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oi
CmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xr
cC9zY2hlZHVsZWQvbGtwLXN0MDIvY3ljbGljX2RkLXdyaXRlLTMwMC01bS0xMUhERC1SQUlENS1j
ZnEteGZzLTFkZC14ODZfNjQtcmhlbC1IRUFELWExYTcxY2M0YzBhNTNlMjlmZTI3Y2VkZTkzOTJi
MGFkODE2ZWU5NTYtMC0yMDE1MDQxOS0zNTAyMi0xN2RkYWcyLnlhbWwKLSBBUkNIPXg4Nl82NAot
IGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIw
MTUwNDIwMTQKLSBjb21taXQ9YTFhNzFjYzRjMGE1M2UyOWZlMjdjZWRlOTM5MmIwYWQ4MTZlZTk1
NgotIEJPT1RfSU1BR0U9L2tlcm5lbC94ODZfNjQtcmhlbC9hMWE3MWNjNGMwYTUzZTI5ZmUyN2Nl
ZGU5MzkyYjBhZDgxNmVlOTU2L3ZtbGludXotNC4wLjAtMDkxMDktZ2ExYTcxY2MKLSBSRVNVTFRf
Uk9PVD0vcmVzdWx0L2xrcC1zdDAyL2RkLXdyaXRlLzMwMC01bS0xMUhERC1SQUlENS1jZnEteGZz
LTFkZC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2ExYTcxY2M0YzBh
NTNlMjlmZTI3Y2VkZTkzOTJiMGFkODE2ZWU5NTYvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoK
ICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgcmQudWRldi5sb2ctcHJpb3JpdHk9ZXJyIHN5c3Rl
bWQubG9nX3RhcmdldD1qb3VybmFsIHN5c3RlbWQubG9nX2xldmVsPXdhcm5pbmcKICBkZWJ1ZyBh
cGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGlt
ZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmlj
IG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5
UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3Cm1heF91cHRpbWU6IDE1MDAK
bGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQuY2d6Igptb2R1bGVzX2luaXRyZDogIi9r
ZXJuZWwveDg2XzY0LXJoZWwvYTFhNzFjYzRjMGE1M2UyOWZlMjdjZWRlOTM5MmIwYWQ4MTZlZTk1
Ni9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1h
Z2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2ZzLmNneiwvb3NpbWFnZS9kZXBz
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovZnMyLmNneiIKam9iX3N0YXRlOiBmaW5pc2hl
ZApsb2FkYXZnOiAxLjYwIDEuMzYgMC42MyAxLzE0NSA1ODU5CnN0YXJ0X3RpbWU6ICcxNDI5NTE3
OTI3JwplbmRfdGltZTogJzE0Mjk1MTgyMjknCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUw
NDE4LTE0MjIyMyIKdGltZV9kZWx0YTogJzE0Mjk1MTc4ODEuMzYyODQ5MTY1Jwo=

--===============0620072632105889147==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

bWRhZG0gLS1zdG9wIC9kZXYvbWQwCm1kYWRtIC1xIC0tY3JlYXRlIC9kZXYvbWQwIC0tY2h1bms9
MjU2IC0tbGV2ZWw9cmFpZDUgLS1yYWlkLWRldmljZXM9MTEgLS1mb3JjZSAtLWFzc3VtZS1jbGVh
biAvZGV2L3NkYiAvZGV2L3NkZyAvZGV2L3NkaSAvZGV2L3NkaCAvZGV2L3NkbCAvZGV2L3NkZiAv
ZGV2L3NkbSAvZGV2L3NkayAvZGV2L3NkZCAvZGV2L3NkZSAvZGV2L3NkYwpta2ZzIC10IHhmcyAv
ZGV2L21kMAptb3VudCAtdCB4ZnMgLW8gbm9iYXJyaWVyLGlub2RlNjQgL2Rldi9tZDAgL2ZzL21k
MAplY2hvIDEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy93cml0ZWJhY2svYmFs
YW5jZV9kaXJ0eV9wYWdlcy9lbmFibGUKZWNobyAxID4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2lu
Zy9ldmVudHMvd3JpdGViYWNrL2JkaV9kaXJ0eV9yYXRlbGltaXQvZW5hYmxlCmVjaG8gMSA+IC9z
eXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL3dyaXRlYmFjay9nbG9iYWxfZGlydHlfc3Rh
dGUvZW5hYmxlCmVjaG8gMSA+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL3dyaXRl
YmFjay93cml0ZWJhY2tfc2luZ2xlX2lub2RlL2VuYWJsZQpkZCAgaWY9L2Rldi96ZXJvIG9mPS9m
cy9tZDAvemVyby0xIHN0YXR1cz1ub3hmZXIgJgpzbGVlcCAzMDAKa2lsbGFsbCAtOSBkZAo=

--===============0620072632105889147==--

