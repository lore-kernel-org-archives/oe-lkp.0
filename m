Content-Type: multipart/mixed; boundary="===============0467317190269244384=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 8236d907ab3: 2% vm-scalability.throughput
Date: Mon, 27 Oct 2014 10:14:25 +0800
Message-ID: <20141027021425.GD27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0467317190269244384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 8236d907ab3411ad452280faa8b26c1347327380 ("sched: Reduce contention =
in update_cfs_rq_blocked_load()")


5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \  =

   8957484 =C2=B1  0%      +1.9%    9123335 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
   8977343 =C2=B1  0%      +2.0%    9152823 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
   8967408            +1.9%    9138067        GEO-MEAN vm-scalability.throu=
ghput

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

      4.05 =C2=B1  5%     -99.0%       0.04 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
      3.95 =C2=B1  4%     -98.9%       0.04 =C2=B1  9%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
      4.00           -99.0%       0.04        GEO-MEAN perf-profile.cpu-cyc=
les.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.ti=
ck_sched_timer

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

      3.88 =C2=B1  4%     -99.5%       0.02 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
      3.83 =C2=B1  2%     -99.5%       0.02 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
      3.85           -99.5%       0.02        GEO-MEAN perf-profile.cpu-cyc=
les.update_cfs_rq_blocked_load.task_tick_fair.scheduler_tick.update_process=
_times.tick_sched_handle

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

        61 =C2=B1 43%     -70.8%         18 =C2=B1 24%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
        61           -70.8%         17        GEO-MEAN sched_debug.cfs_rq[5=
0]:/.tg_load_contrib

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

      7257 =C2=B1 37%    +106.2%      14962 =C2=B1 49%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
      7257          +106.2%      14962        GEO-MEAN sched_debug.cpu#1.sc=
hed_count

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

      0.06 =C2=B1 15%     +96.8%       0.12 =C2=B1 18%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
      0.06           +96.8%       0.12        GEO-MEAN turbostat.%c1

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

       415 =C2=B1 14%     -24.7%        313 =C2=B1 33%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
       415           -24.7%        312        GEO-MEAN slabinfo.blkdev_queu=
e.num_objs

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

      2080 =C2=B1 21%     +78.4%       3711 =C2=B1 44%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
      2080           +78.4%       3711        GEO-MEAN sched_debug.cpu#33.t=
twu_count

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

        58 =C2=B1 39%     +93.1%        112 =C2=B1 34%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
        58           +93.1%        112        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.tg_load_contrib

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

      5708 =C2=B1 13%     -14.8%       4862 =C2=B1 19%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
      5708           -14.8%       4862        GEO-MEAN meminfo.AnonHugePages

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

       487 =C2=B1  9%     +42.3%        693 =C2=B1 14%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
       487           +42.3%        693        GEO-MEAN sched_debug.cpu#20.s=
ched_goidle

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

        15 =C2=B1 10%     +37.3%         20 =C2=B1 12%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
        15           +37.3%         20        GEO-MEAN sched_debug.cpu#26.l=
oad

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

        18 =C2=B1  7%     -19.4%         15 =C2=B1  5%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
        18           -19.4%         15        GEO-MEAN sched_debug.cpu#49.c=
pu_load[3]

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

       231 =C2=B1 14%     -25.0%        173 =C2=B1 20%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
       231           -25.0%        173        GEO-MEAN sched_debug.cpu#58.s=
ched_goidle

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

   1441314 =C2=B1  3%     +26.9%    1829712 =C2=B1  2%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
   1414086 =C2=B1  8%     +23.6%    1747307 =C2=B1  8%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
   1427635           +25.2%    1788034        GEO-MEAN softirqs.RCU

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

        17 =C2=B1  6%     -16.9%         14 =C2=B1  5%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
        17           -16.9%         14        GEO-MEAN sched_debug.cpu#49.c=
pu_load[4]

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

        19 =C2=B1  9%     -16.8%         15 =C2=B1  7%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
        18           -16.8%         15        GEO-MEAN sched_debug.cpu#49.c=
pu_load[2]

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

      1196 =C2=B1  8%     +17.3%       1403 =C2=B1  5%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
      1196           +17.3%       1403        GEO-MEAN sched_debug.cpu#49.s=
ched_goidle

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

     98963 =C2=B1  0%     +52.9%     151281 =C2=B1 38%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
     98963           +52.9%     151281        GEO-MEAN numa-meminfo.node3.F=
ilePages

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

     24740 =C2=B1  0%     +52.9%      37819 =C2=B1 38%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
     24740           +52.9%      37819        GEO-MEAN numa-vmstat.node3.nr=
_file_pages

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

     38000 =C2=B1  1%     +15.9%      44042 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
     38312 =C2=B1  2%     +13.9%      43643 =C2=B1  1%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
     38156           +14.9%      43842        GEO-MEAN proc-vmstat.pgactiva=
te

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

      3.29 =C2=B1  6%     +15.3%       3.80 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
      3.33 =C2=B1  2%     +14.0%       3.79 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
      3.31           +14.7%       3.79        GEO-MEAN perf-profile.cpu-cyc=
les.__drand48_iterate

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

      3.34 =C2=B1  6%     +14.9%       3.83 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
      3.37 =C2=B1  2%     +13.8%       3.84 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
      3.35           +14.3%       3.83        GEO-MEAN perf-profile.cpu-cyc=
les.__nrand48_r

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

     81.57 =C2=B1  0%     +10.8%      90.40 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
     81.61 =C2=B1  0%     +10.8%      90.40 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
     81.59           +10.8%      90.40        GEO-MEAN perf-profile.cpu-cyc=
les.do_unit

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

     39878 =C2=B1  0%      -9.5%      36107 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
     39774 =C2=B1  0%      -9.3%      36061 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
     39826            -9.4%      36084        GEO-MEAN proc-vmstat.nr_shmem

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

    159494 =C2=B1  0%      -9.5%     144409 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
    159156 =C2=B1  0%      -9.3%     144313 =C2=B1  0%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand
    159325            -9.4%     144361        GEO-MEAN meminfo.Shmem

5cd038f53ed9ec7a  8236d907ab3411ad452280faa8  =

----------------  --------------------------  =

    144353 =C2=B1  2%      -3.7%     138984 =C2=B1  2%  lkp-nex06/vm-scalab=
ility/performance-300s-anon-r-rand-mt
    144353            -3.7%     138984        GEO-MEAN time.involuntary_con=
text_switches

lkp-nex06: Nehalem-EX
Memory: 64G




                               vm-scalability.throughput

  9.15e+06 ++--------------------------------------------------------------=
-+
           O  O O  O O  O O    O  O O    O    O    O  O O  O O  O O  O O   =
 |
           |                 O         O    O    O                        O=
 O
   9.1e+06 ++                                                              =
 |
           |                                                               =
 |
           |                                                               =
 |
  9.05e+06 ++                                                              =
 |
           |                                                               =
 |
     9e+06 ++             *..                                              =
 |
           |             :       .*.*..*.  .*.*..                          =
 |
           | .*     .*.. :   *.*.        *.          .*    *.  .*          =
 |
  8.95e+06 *+  +  .*    *                        *.*.  :  +  *.            =
 |
           |    *.                                     : +                 =
 |
           |                                            *                  =
 |
   8.9e+06 ++--------------------------------------------------------------=
-+


                         perf-profile.cpu-cycles.do_unit

  91 ++--------------------------------------------------------------------=
-+
  90 O+ O O  O  O  O O  O  O  O O  O  O  O O  O  O O  O  O  O O  O  O  O O =
 O
     |                                                                     =
 |
  89 ++                                                                    =
 |
  88 ++                                                                    =
 |
     |                                                                     =
 |
  87 ++                                                                    =
 |
  86 ++                                                                    =
 |
  85 ++                                                                    =
 |
     |                                                                     =
 |
  84 ++                                                                    =
 |
  83 ++             .*..  .*..                                             =
 |
     |            .*    *.    *.*..*..*..*.                                =
 |
  82 *+.*.*..  .*.                         *..  .*.  .*..  .*.*            =
 |
  81 ++------*--------------------------------*----*-----*-----------------=
-+




  4.5 ++-------------------------------------------------------------------=
-+
      |    *..                               .*..*..*.*..*..               =
 |
    4 *+. +   *..*.                         *               *..            =
 |
  3.5 ++ *         *..   *..*.            ..                   *           =
 |
      |                ..     *..*..*.*..*                                 =
 |
    3 ++              *                                                    =
 |
  2.5 ++                                                                   =
 |
      |                                                                    =
 |
    2 ++                                                                   =
 |
  1.5 ++                                                                   =
 |
      |                                                                    =
 |
    1 ++                                                                   =
 |
  0.5 ++                                                                   =
 |
      |                                                                    =
 |
    0 O+-O-O--O--O-O--O--O--O-O--O--O-O--O--O-O--O--O-O--O--O--O-O--O--O-O-=
-O




  4.5 ++-------------------------------------------------------------------=
-+
      | .*.  .*..                             *..    .*..                  =
 |
    4 *+   *.                           .*.. +   *..*    *..*..            =
 |
  3.5 ++         *.*..  .*..  *..*..*.*.    *                  *           =
 |
      |               *.     +                                             =
 |
    3 ++                    *                                              =
 |
  2.5 ++                                                                   =
 |
      |                                                                    =
 |
    2 ++                                                                   =
 |
  1.5 ++                                                                   =
 |
      |                                                                    =
 |
    1 ++                                                                   =
 |
  0.5 ++                                                                   =
 |
      |                                                                    =
 |
    0 O+-O-O--O--O-O--O--O--O-O--O--O-O--O--O-O--O--O-O--O--O--O-O--O--O-O-=
-O

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

--===============0467317190269244384==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB2bS1zY2FsYWJpbGl0eQpkZWZhdWx0X21vbml0b3JzOgogIHdhaXQ6IHBy
ZS10ZXN0CiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVtYS1udW1hc3RhdDog
CiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0YXQ6IAogIHByb2Mt
c3RhdDogCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3Rh
dDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAg
ZGlza3N0YXRzOiAKICBlbmVyZ3k6IAogIGNwdWlkbGU6IAogIGNwdWZyZXE6IAogIHR1cmJvc3Rh
dDogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogMTAKICBwbWV0ZXI6IApkZWZhdWx0X3dh
dGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBw
ZXJmb3JtYW5jZQpjb21taXQ6IGYxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3NzVjMzU1
ZTEKbW9kZWw6IE5laGFsZW0tRVgKbWVtb3J5OiA2NEcKbnJfY3B1OiA2NApucl9oZGRfcGFydGl0
aW9uczogMApoZGRfcGFydGl0aW9uczogCnN3YXBfcGFydGl0aW9uczogCnJvb3Rmc19wYXJ0aXRp
b246IApyb290ZnM6IGNsZWFybGludXgteDg2XzY0LmNnegpwZXJmLXByb2ZpbGU6IApydW50aW1l
OiAzMDBzCnNpemU6IAp2bS1zY2FsYWJpbGl0eToKICB0ZXN0OgogIC0gYW5vbi1yLXJhbmQtbXQK
ZW5xdWV1ZV90aW1lOiAyMDE0LTEwLTIwIDE5OjQ3OjI2LjIyNDY1NzE1NSArMDg6MDAKdGVzdGJv
eDogbGtwLW5leDA2CnRib3hfZ3JvdXA6IGxrcC1uZXgwNgprY29uZmlnOiB4ODZfNjQtcmhlbApo
ZWFkX2NvbW1pdDogMDEzZjYwNDUyMTE0Mjk3YmZkMzM5Nzg1NjBmZmE0YWY3ZTg2ZDRhOApiYXNl
X2NvbW1pdDogZjExNDA0MGUzZWE2ZTA3MzcyMzM0YWRlNzVkMWVlMDc3NWMzNTVlMQpicmFuY2g6
IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE0MTAyMDIxCmtlcm5lbDogIi9rZXJuZWwveDg2
XzY0LXJoZWwvZjExNDA0MGUzZWE2ZTA3MzcyMzM0YWRlNzVkMWVlMDc3NWMzNTVlMS92bWxpbnV6
LTMuMTguMC1yYzEtZ2YxMTQwNDAiCnVzZXI6IGxrcApxdWV1ZTogY3ljbGljCnJlc3VsdF9yb290
OiAiL3Jlc3VsdC9sa3AtbmV4MDYvdm0tc2NhbGFiaWxpdHkvcGVyZm9ybWFuY2UtMzAwcy1hbm9u
LXItcmFuZC1tdC9jbGVhcmxpbnV4LXg4Nl82NC5jZ3oveDg2XzY0LXJoZWwvZjExNDA0MGUzZWE2
ZTA3MzcyMzM0YWRlNzVkMWVlMDc3NWMzNTVlMS8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVk
L2xrcC1uZXgwNi9jeWNsaWNfdm0tc2NhbGFiaWxpdHktcGVyZm9ybWFuY2UtMzAwcy1hbm9uLXIt
cmFuZC1tdC1jbGVhcmxpbnV4LXg4Nl82NC5jZ3oteDg2XzY0LXJoZWwtQkFTRS1mMTE0MDQwZTNl
YTZlMDczNzIzMzRhZGU3NWQxZWUwNzc1YzM1NWUxLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0
LTEwLTIwIDIxOjMxOjEzLjkxNjYzODEwMyArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2Fk
YXZnOiA1NC4xMiAzOS44MSAxNy44MyAxLzUyNyAxMDgzMApzdGFydF90aW1lOiAnMTQxMzgxMTk1
MycKZW5kX3RpbWU6ICcxNDEzODEyMjU1Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTAy
MC0yMTMwMDIiCg==

--===============0467317190269244384==
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
bGl0eS10bXAKdHJ1bmNhdGUgLXMgMzM2MDc1Mjg0NDggL3RtcC92bS1zY2FsYWJpbGl0eS5pbWcK
bWtmcy54ZnMgLXEgL3RtcC92bS1zY2FsYWJpbGl0eS5pbWcKbW91bnQgLW8gbG9vcCAvdG1wL3Zt
LXNjYWxhYmlsaXR5LmltZyAvdG1wL3ZtLXNjYWxhYmlsaXR5Ci4vY2FzZS1hbm9uLXItcmFuZC1t
dAouL3VzZW1lbSAtLXJ1bnRpbWUgMzAwIC10IDY0IC0tcmVhZG9ubHkgLS1yYW5kb20gNjg3MTk0
NzY3MzYKdW1vdW50IC90bXAvdm0tc2NhbGFiaWxpdHktdG1wCnVtb3VudCAvdG1wL3ZtLXNjYWxh
YmlsaXR5CnJtIC90bXAvdm0tc2NhbGFiaWxpdHkuaW1nCg==

--===============0467317190269244384==--

