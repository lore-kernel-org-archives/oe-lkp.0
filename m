Content-Type: multipart/mixed; boundary="===============6206797260572460984=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [xen/spinlock] e0fc17a9363: +24.6% aim9.dir_rtns_1.ops_per_sec
Date: Mon, 29 Sep 2014 14:19:27 +0800
Message-ID: <20140929061927.GA7320@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6206797260572460984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

We are glad to find that your patch increases the aim9 test
performance by up to +24.6%!

e0fc17a936334c08b2729fff87168c03fdecf5b6 ("xen/spinlock: Don't enable them =
unconditionally.")

test case: brickland3/aim9/5s-all

brickland3 is an Ivy Bridge-EX with 512G memory.

c0914e61660fa7d  e0fc17a936334c08b2729fff8 =

---------------  ------------------------- =

  10401445 =C2=B1 0%     +24.6%   12958400 =C2=B1 0%  TOTAL aim9.dir_rtns_1=
.ops_per_sec
    494461 =C2=B1 5%      +8.0%     534028 =C2=B1 1%  TOTAL aim9.link_test.=
ops_per_sec
   1840820 =C2=B1 0%      +4.5%    1924528 =C2=B1 0%  TOTAL aim9.fifo_test.=
ops_per_sec
   1251672 =C2=B1 0%      +5.0%    1314071 =C2=B1 0%  TOTAL aim9.dgram_pipe=
.ops_per_sec
   1097240 =C2=B1 1%      +5.0%    1152480 =C2=B1 0%  TOTAL aim9.signal_tes=
t.ops_per_sec
   1407192 =C2=B1 0%      +4.8%    1474424 =C2=B1 0%  TOTAL aim9.stream_pip=
e.ops_per_sec
   1898068 =C2=B1 1%      +4.7%    1987232 =C2=B1 0%  TOTAL aim9.pipe_cpy.o=
ps_per_sec
   1298388 =C2=B1 1%      +3.5%    1343704 =C2=B1 0%  TOTAL aim9.shared_mem=
ory.ops_per_sec
     64202 =C2=B1 0%      -3.2%      62178 =C2=B1 1%  TOTAL aim9.misc_rtns_=
1.ops_per_sec
    -12622 =C2=B1-16%     +32.4%     -16710 =C2=B1-14%  TOTAL sched_debug.c=
fs_rq[116]:/.spread0
     -1977 =C2=B1-26%     -59.3%       -805 =C2=B1-42%  TOTAL cpuidle.C3-IV=
B.usage
    -13457 =C2=B1-8%     +19.2%     -16045 =C2=B1-17%  TOTAL sched_debug.cf=
s_rq[14]:/.spread0
     -7867 =C2=B1-42%     +61.3%     -12692 =C2=B1-10%  TOTAL sched_debug.c=
fs_rq[18]:/.spread0
        -4 =C2=B1-27%     -36.4%         -2 =C2=B1-34%  TOTAL sched_debug.c=
pu#19.nr_uninterruptible
    -12763 =C2=B1-8%     +19.1%     -15202 =C2=B1-10%  TOTAL sched_debug.cf=
s_rq[24]:/.spread0
    -13552 =C2=B1-8%     +20.5%     -16333 =C2=B1-14%  TOTAL sched_debug.cf=
s_rq[97]:/.spread0
         1 =C2=B1 0%    -100.0%          0 =C2=B1 0%  TOTAL sched_debug.cfs=
_rq[105]:/.nr_spread_over
      1857 =C2=B148%     -69.7%        563 =C2=B120%  TOTAL sched_debug.cfs=
_rq[97]:/.min_vruntime
       111 =C2=B144%     -73.0%         30 =C2=B142%  TOTAL sched_debug.cfs=
_rq[4]:/.blocked_load_avg
       160 =C2=B148%     -60.5%         63 =C2=B126%  TOTAL sched_debug.cpu=
#104.sched_goidle
      1288 =C2=B137%     -58.1%        540 =C2=B137%  TOTAL sched_debug.cfs=
_rq[67]:/.min_vruntime
       988 =C2=B136%     -49.7%        497 =C2=B146%  TOTAL sched_debug.cpu=
#55.ttwu_count
       114 =C2=B120%     -59.4%         46 =C2=B124%  TOTAL sched_debug.cfs=
_rq[48]:/.tg_load_contrib
       101 =C2=B116%     -54.2%         46 =C2=B124%  TOTAL sched_debug.cfs=
_rq[48]:/.blocked_load_avg
     32.50 =C2=B141%     -52.7%      15.37 =C2=B140%  TOTAL sched_debug.cfs=
_rq[66]:/.exec_clock
        38 =C2=B129%     -39.3%         23 =C2=B143%  TOTAL sched_debug.cfs=
_rq[44]:/.avg->runnable_avg_sum
       469 =C2=B124%     -40.5%        279 =C2=B147%  TOTAL sched_debug.cpu=
#26.ttwu_local
      1754 =C2=B134%    +113.5%       3744 =C2=B114%  TOTAL sched_debug.cpu=
#40.sched_count
       123 =C2=B127%     -49.9%         62 =C2=B136%  TOTAL sched_debug.cfs=
_rq[47]:/.blocked_load_avg
       151 =C2=B112%     -40.8%         89 =C2=B131%  TOTAL sched_debug.cpu=
#93.ttwu_count
        68 =C2=B144%     -49.6%         34 =C2=B127%  TOTAL sched_debug.cfs=
_rq[50]:/.avg->runnable_avg_sum
      5584 =C2=B120%     +40.0%       7818 =C2=B118%  TOTAL sched_debug.cpu=
#84.nr_load_updates
       411 =C2=B130%     -36.1%        262 =C2=B124%  TOTAL sched_debug.cpu=
#23.ttwu_local
      1655 =C2=B133%     -45.4%        903 =C2=B132%  TOTAL sched_debug.cpu=
#2.sched_goidle
      3341 =C2=B133%     -45.0%       1836 =C2=B131%  TOTAL sched_debug.cpu=
#2.nr_switches
      8488 =C2=B111%     +24.1%      10538 =C2=B113%  TOTAL sched_debug.cpu=
#10.nr_load_updates
        19 =C2=B1 7%     +25.0%         24 =C2=B112%  TOTAL sched_debug.cpu=
#114.ttwu_local
      8752 =C2=B113%     +23.9%      10842 =C2=B111%  TOTAL sched_debug.cpu=
#8.nr_load_updates
        24 =C2=B110%     -16.9%         20 =C2=B1 9%  TOTAL sched_debug.cpu=
#68.ttwu_local
       901 =C2=B138%     -46.5%        482 =C2=B140%  TOTAL sched_debug.cpu=
#62.sched_goidle
      1862 =C2=B137%     -43.9%       1045 =C2=B135%  TOTAL sched_debug.cpu=
#62.nr_switches
     14555 =C2=B1 7%     +13.4%      16512 =C2=B1 8%  TOTAL sched_debug.cpu=
#106.nr_load_updates
      5433 =C2=B110%     +20.4%       6542 =C2=B1 5%  TOTAL sched_debug.cpu=
#0.ttwu_local

                             aim9.signal_test.ops_per_sec

  1.16e+06 O+-O----O----------------------O-------O----O--O-O--O--O----O-O-=
-+
           |    O    O     O O  O O  O  O    O O                           =
 |
  1.14e+06 ++           O                            O              O      =
 O
           |                                                               =
 |
           |                                                               =
 |
  1.12e+06 ++                                                              =
 |
           |            *..*.    .*..*..       *..*..*.*..*.*..*..*        =
 |
   1.1e+06 ++          :     *..*       *.*.. :                   :        =
 |
           |           :                      :                    :       =
 |
  1.08e+06 *+.  *..   :                      *                     :       =
 |
           |   +   *.*                                             :       =
 |
           |  *                                                     :      =
 |
  1.06e+06 ++                                                       *      =
 |
           |                                                               =
 |
  1.04e+06 ++--------------------------------------------------------------=
-+


                              aim9.dir_rtns_1.ops_per_sec

   1.4e+07 ++--------------------------------------------------------------=
-+
           |            O  O      O          O O  O  O O  O O  O           =
 |
  1.35e+07 ++                        O                                     =
 |
   1.3e+07 ++      O O       O  O                                      O O =
 |
           O  O O                       O O                       O O      =
 O
  1.25e+07 ++                                                              =
 |
           |                                                               =
 |
   1.2e+07 ++                                                              =
 |
           |                                                               =
 |
  1.15e+07 ++                                                              =
 |
   1.1e+07 ++                                                              =
 |
           |                                                               =
 |
  1.05e+07 *+.*.*..*.*..*..*.          .*.*..*.*..*..         .*..         =
 |
           |                 *..*.*..*.              *.*..*.*.    *.*      =
 |
     1e+07 ++--------------------------------------------------------------=
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

--===============6206797260572460984==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBhaW05CmRlZmF1bHRfbW9uaXRvcnM6CiAgd2F0Y2gtb29tOiAKICB3YWl0
OiBwcmUtdGVzdAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0
YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBw
cm9jLXN0YXQ6IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2Nr
X3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6
IAogIGRpc2tzdGF0czogCiAgZW5lcmd5OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxOiAKICB0dXJi
b3N0YXQ6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVyOiAKbW9kZWw6
IEJyaWNrbGFuZCBJdnkgQnJpZGdlLUVYCm5yX2NwdTogMTIwCm1lbW9yeTogNTEyRwpoZGRfcGFy
dGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCmFpbTk6CiAgdGVzdHRpbWU6IDVzCiAgdGVzdDoK
ICAtIGFsbApicmFuY2g6IGxpbnVzL21hc3Rlcgpjb21taXQ6IDE5NTgzY2E1ODRkNmY1NzQzODRl
MTdmZTc2MTNkZmFlYWRjZGM0YTYKcmVwZWF0X3RvOiAzCmVucXVldWVfdGltZTogMjAxNC0wOS0y
NSAyMTo1NjoxNS4wNjk1MzkzMjIgKzA4OjAwCnRlc3Rib3g6IGJyaWNrbGFuZDMKa2NvbmZpZzog
eDg2XzY0LXJoZWwKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC8xOTU4M2NhNTg0ZDZmNTc0
Mzg0ZTE3ZmU3NjEzZGZhZWFkY2RjNGE2L3ZtbGludXotMy4xNi4wIgp1c2VyOiBsa3AKcXVldWU6
IHdmZwpyZXN1bHRfcm9vdDogIi9yZXN1bHQvYnJpY2tsYW5kMy9haW05LzVzLWFsbC9kZWJpYW4t
eDg2XzY0LmNnei94ODZfNjQtcmhlbC8xOTU4M2NhNTg0ZDZmNTc0Mzg0ZTE3ZmU3NjEzZGZhZWFk
Y2RjNGE2LzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvYnJpY2tsYW5kMy93ZmdfYWltOS01
cy1hbGwteDg2XzY0LXJoZWwtMTk1ODNjYTU4NGQ2ZjU3NDM4NGUxN2ZlNzYxM2RmYWVhZGNkYzRh
Ni0yLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNC0wOS0yNSAyMjozNTowMy41NTgxMjE4MjggKzA4
OjAwCmhpc3RvcnlfdGltZTogMzUxLjM2CmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMC45
NiAwLjY5IDAuMzIgMS85NjkgMzU4NTcKc3RhcnRfdGltZTogJzE0MTE2NTU3ODUnCmVuZF90aW1l
OiAnMTQxMTY1NjA4NScKdmVyc2lvbjogIi9sa3AvbGtwLy5zcmMtMjAxNDA5MjUtMjEyOTEwIgo=

--===============6206797260572460984==--

