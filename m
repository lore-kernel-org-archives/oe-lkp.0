Content-Type: multipart/mixed; boundary="===============5310667119248059510=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [SKL BOOT FAILURE unless idle=nomwait (was Re] 256126a34c: +6.5% blogbench.write_score
Date: Wed, 16 Mar 2016 14:52:33 +0800
Message-ID: <20160316065233.GC28484@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5310667119248059510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that blogbench.write_score +6.5% improvement on

https://github.com/0day-ci/linux Rik-van-Riel/cpuidle-use-predicted_us-not-=
interactivity_req-to-consider-polling/20160312-043358
commit 256126a34c2a087a2a9900c2c7ac9a7c4f5e54e4 ("SKL BOOT FAILURE unless i=
dle=3Dnomwait (was Re: PROBLEM: Cpufreq constantly keeps frequency at maxim=
um on 4.5-rc4)")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/rootfs/tbox_group/testcase:
  gcc-4.9/performance/1SSD/xfs/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp=
-bdw01/blogbench

commit: =

  e6a4261e5a9e3ff89a4667afd6a314352654e2ef
  256126a34c2a087a2a9900c2c7ac9a7c4f5e54e4

e6a4261e5a9e3ff8 256126a34c2a087a2a9900c2c7 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

  53652546 =C2=B1  1%      +5.6%   56637238 =C2=B1  1%  blogbench.time.file=
_system_outputs
    632330 =C2=B1  1%      -5.5%     597814 =C2=B1  1%  blogbench.time.invo=
luntary_context_switches
      4861 =C2=B1 55%     -40.8%       2880 =C2=B1  2%  blogbench.time.maxi=
mum_resident_set_size
    206.67 =C2=B1  0%      -4.4%     197.50 =C2=B1  0%  blogbench.time.perc=
ent_of_cpu_this_job_got
    584.62 =C2=B1  0%      -4.6%     557.91 =C2=B1  0%  blogbench.time.syst=
em_time
   4176142 =C2=B1  0%      -1.7%    4105578 =C2=B1  0%  blogbench.time.volu=
ntary_context_switches
      7471 =C2=B1  1%      +6.5%       7955 =C2=B1  1%  blogbench.write_sco=
re
      2646 =C2=B1  8%     +36.9%       3623 =C2=B1 14%  meminfo.Writeback
    107366 =C2=B1  1%      +5.1%     112827 =C2=B1  0%  vmstat.io.bo
     28583 =C2=B1  0%      +0.9%      28837 =C2=B1  1%  vmstat.system.cs
     85.70 =C2=B1  0%     -31.3%      58.88 =C2=B1  0%  turbostat.%Busy
      1881 =C2=B1  0%     -31.3%       1292 =C2=B1  0%  turbostat.Avg_MHz
     13.83 =C2=B1  0%    +193.9%      40.66 =C2=B1  0%  turbostat.CPU%c1
      6.24 =C2=B1  0%     -13.4%       5.40 =C2=B1  0%  turbostat.CorWatt
      8.11 =C2=B1  0%      -7.7%       7.48 =C2=B1  0%  turbostat.PkgWatt
 1.392e+08 =C2=B1  0%    +233.4%  4.639e+08 =C2=B1  0%  cpuidle.C1-BDW.time
    448770 =C2=B1  2%    +494.6%    2668387 =C2=B1  1%  cpuidle.C1-BDW.usage
    250762 =C2=B1 12%     -22.2%     195098 =C2=B1 15%  cpuidle.C6-BDW.time
   1002396 =C2=B1 24%     -37.6%     625501 =C2=B1 14%  cpuidle.C7s-BDW.time
 3.056e+08 =C2=B1  2%     -99.9%     220778 =C2=B1 33%  cpuidle.POLL.time
   2048094 =C2=B1  1%     -98.9%      22873 =C2=B1  8%  cpuidle.POLL.usage
     90.78 =C2=B1  8%     -23.4%      69.52 =C2=B1 20%  sched_debug.cfs_rq:=
/.util_avg.stddev
     -9028 =C2=B1 -1%     -29.9%      -6332 =C2=B1 -6%  sched_debug.cpu.nr_=
uninterruptible.0
      3003 =C2=B1  9%     -35.5%       1938 =C2=B1 18%  sched_debug.cpu.nr_=
uninterruptible.1
      4372 =C2=B1  6%     -24.9%       3281 =C2=B1  7%  sched_debug.cpu.nr_=
uninterruptible.2
      1725 =C2=B1 14%     -31.4%       1183 =C2=B1 17%  sched_debug.cpu.nr_=
uninterruptible.3
      4393 =C2=B1  6%     -24.4%       3319 =C2=B1  7%  sched_debug.cpu.nr_=
uninterruptible.max
     -9031 =C2=B1 -1%     -29.8%      -6335 =C2=B1 -6%  sched_debug.cpu.nr_=
uninterruptible.min
      5320 =C2=B1  1%     -29.2%       3766 =C2=B1  6%  sched_debug.cpu.nr_=
uninterruptible.stddev
    142568 =C2=B1  9%     +23.0%     175340 =C2=B1 13%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
    184381 =C2=B1  7%     +19.0%     219502 =C2=B1 11%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
    288558 =C2=B1  3%     -15.7%     243178 =C2=B1  9%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
    764.33 =C2=B1  8%     +27.9%     977.25 =C2=B1 10%  proc-vmstat.nr_writ=
eback
    330124 =C2=B1  8%     +20.7%     398369 =C2=B1 12%  proc-vmstat.pageout=
run
    244293 =C2=B1  2%     -15.9%     205562 =C2=B1  6%  proc-vmstat.pgrotat=
ed
   1777197 =C2=B1  3%      +9.6%    1948586 =C2=B1  7%  proc-vmstat.pgscan_=
direct_dma32
    751311 =C2=B1  3%      +9.8%     824826 =C2=B1  7%  proc-vmstat.pgscan_=
direct_normal
   1699363 =C2=B1  3%     +10.2%    1872550 =C2=B1  6%  proc-vmstat.pgsteal=
_direct_dma32
    714246 =C2=B1  3%     +10.5%     788950 =C2=B1  7%  proc-vmstat.pgsteal=
_direct_normal
    348656 =C2=B1  3%      +4.4%     364123 =C2=B1  5%  proc-vmstat.working=
set_nodereclaim

lkp-bdw01: Broadwell ULT
Memory: 4G



                                   cpuidle.POLL.time

  3.5e+08 ++---------------------------------------------------------------=
-+
          |    .* .**                   *. **.       * .**.                =
 |
    3e+08 ++ **  *   *.**.**.**.**   *.*  *   *   *.* *    **.**.***.**.*  =
**
          |  :                   :   :        :   :                     :  =
:|
  2.5e+08 ++ :                   :   :        :   :                     :  =
:|
          |  :                   :   :        :   :                     :  =
:|
    2e+08 ++:                    :   :        :   :                     : :=
 |
          | :                    :   :        :   :                     : :=
 |
  1.5e+08 ++:                     :  :         :  :                      ::=
 |
          | :                     : :          : :                       ::=
 |
    1e+08 ++:                     : :          : :                       ::=
 |
          | :                     : :          : :                       ::=
 |
    5e+07 ++                      : :          : :                       : =
 |
          |:                      : :          : :                       : =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO-OO-O-------*-*-----------------------*-=
-+


                                  cpuidle.POLL.usage

  2.5e+06 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
          |   *.**.*  .*         *    .**.**       .***.*    .*   * .**.*  =
*|
    2e+06 ++ *      **  *.**.**.*:   *      *.*   *      *.**  *.* *    :  =
:*
          |  :                   :   :        :   :                     :  =
:|
          |  :                   :   :        :   :                     :  =
:|
  1.5e+06 ++:                    :   :        :   :                     : :=
 |
          | :                    :   :        :   :                     : :=
 |
    1e+06 ++:                     :  :        :   :                      ::=
 |
          | :                     : :          : :                       ::=
 |
          | :                     : :          : :                       ::=
 |
   500000 ++:                     : :          : :                       ::=
 |
          |:                      : :          : :                       : =
 |
          |:                      : :          : :                       : =
 |
        0 OO-OO-OO-OOO-OO-OO-OO-OOO-OO-O-------*-*-----------------------*-=
-+


                                  cpuidle.C1-BDW.time

    5e+08 ++---------------------------------------------------------------=
-+
  4.5e+08 OO OO OO OOO OO OO OO OOO OO O                                   =
 |
          |                                                                =
 |
    4e+08 ++                                                               =
 |
  3.5e+08 ++                                                               =
 |
          |                                                                =
 |
    3e+08 ++                                                               =
 |
  2.5e+08 ++                                                               =
 |
    2e+08 ++                                                               =
 |
          |                                                                =
 |
  1.5e+08 ++ **.**.***.**.**.**.**   *.**.***.*   *.***.**.**.**.***.**.*  =
**
    1e+08 ++ :                   :   :        :   :                     :  =
:|
          | :                     :  :         :  :                      ::=
 |
    5e+07 ++:                     : :          : :                       ::=
 |
        0 **----------------------*-*----------*-*-----------------------*-=
-+


                                 cpuidle.C1-BDW.usage

    3e+06 ++---------------------------------------------------------------=
-+
          |        O O O  O     OO   O O                                   =
 |
  2.5e+06 OO OO OO  O   O  O OO   O O                                      =
 |
          |                                                                =
 |
          |                                                                =
 |
    2e+06 ++                                                               =
 |
          |                                                                =
 |
  1.5e+06 ++                                                               =
 |
          |                                                                =
 |
    1e+06 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
   500000 ++ **.**.***.**.**.**.**   *.**.***.*   *.***.**.**.**.***.**.*  =
**
          | +                     :  :         :  :                      :+=
 |
        0 **----------------------*-*----------*-*-----------------------*-=
-+


                                 turbostat.Avg_MHz

  2000 ++------------------------------------------------------------------=
-+
  1800 ++ *.**.**.**.**.**.**.**    **.**.**.*   *.**.**.**.**.**.**.**.*  =
**
       |  :                    :    :        :   :                      :  =
:|
  1600 ++ :                    :    :        :   :                      :  =
:|
  1400 ++ :                    :    :        :   :                      :  =
:|
       O OO OO OO OO OO OO OO OO:OO:OO       :   :                      : :=
 |
  1200 ++ :                     :  :         :   :                      : :=
 |
  1000 ++ :                     :  :         :   :                      : :=
 |
   800 ++:                      :  :          : :                        ::=
 |
       | :                      :  :          : :                        ::=
 |
   600 ++:                      :  :          : :                        ::=
 |
   400 ++:                       ::           : :                        : =
 |
       | :                       ::           : :                        : =
 |
   200 ++:                       ::           : :                        : =
 |
     0 *+*-----------------------**-----------*-*------------------------*-=
-+


                                 turbostat._Busy

  90 ++--------------------------------------------------------------------=
-+
     |  *.**.**.**.**.*.**.**.*   *.**.*.**.*   *.**.**.**.*.**.**.**.**  *=
.*
  80 ++ :                     :   :         :   :                      :  :=
 |
  70 ++ :                     :   :         :   :                      :  :=
 |
     |  :                     :   :         :   :                      :  :=
 |
  60 O+OO OO OO OO OO O OO OO OO OO O       :   :                       : :=
 |
  50 ++ :                     :   :         :   :                       : :=
 |
     |  :                     :   :         :   :                       : :=
 |
  40 ++:                       : :           : :                        :: =
 |
  30 ++:                       : :           : :                        :: =
 |
     | :                       : :           : :                        :: =
 |
  20 ++:                       : :           : :                         : =
 |
  10 ++:                       : :           : :                         : =
 |
     | :                       : :           : :                         : =
 |
   0 *+*-----------------------*-*-----------*-*-------------------------*-=
-+


                                turbostat.CPU_c1

  45 ++--------------------------------------------------------------------=
-+
     O OO  O OO  O O  O  O OO OO OO O                                      =
 |
  40 ++   O     O   O   O                                                  =
 |
  35 ++                                                                    =
 |
     |                                                                     =
 |
  30 ++                                                                    =
 |
  25 ++                                                                    =
 |
     |                                                                     =
 |
  20 ++                                                                    =
 |
  15 ++                                                   .*.*             =
 |
     |  *.**.**.**.**.*.**.**.*   *.**.*.**.*   *.**.**.**    *.**.**.**  *=
.*
  10 ++ :                     :   :         :   :                       : :=
 |
   5 ++ :                      :  :          :  :                       : :=
 |
     | :                       : :           : :                         : =
 |
   0 *+*-----------------------*-*-----------*-*-------------------------*-=
-+


                                turbostat.PkgWatt

  9 ++---------------------------------------------------------------------=
-+
    |  *.**.**.*.**.**.**.**.*    **.**.*.**    **.*.**.**.**.**.*.**.**  *=
.*
  8 O+OO OO OO O OO OO OO OO O OO OO       :    :                      :  :=
 |
  7 ++ :                     :    :        :    :                      :  :=
 |
    |  :                     :    :        :    :                      :  :=
 |
  6 ++ :                      :  :          :  :                        : :=
 |
  5 ++ :                      :  :          :  :                        : :=
 |
    |  :                      :  :          :  :                        : :=
 |
  4 ++:                       :  :          :  :                        :: =
 |
  3 ++:                       :  :          :  :                        :: =
 |
    | :                       :  :          :  :                        :: =
 |
  2 ++:                        ::            ::                          : =
 |
  1 ++:                        ::            ::                          : =
 |
    | :                        ::            ::                          : =
 |
  0 *+*------------------------**------------**--------------------------*-=
-+


                                turbostat.CorWatt

  7 ++---------------------------------------------------------------------=
-+
    |                *.                                        *.          =
.*
  6 ++ *.**.**.*.**.*  **.**.*    **.**.*.**    **.*.**.**.**.*  *.**.**  *=
 |
    O OO OO OO O OO OO OO OO O OO OO       :    :                      :  :=
 |
  5 ++ :                     :    :        :    :                      :  :=
 |
    |  :                      :   :         :   :                       : :=
 |
  4 ++ :                      :  :          :  :                        : :=
 |
    |  :                      :  :          :  :                        : :=
 |
  3 ++ :                      :  :          :  :                        : :=
 |
    | :                       :  :          :  :                        :: =
 |
  2 ++:                       :  :          :  :                        :: =
 |
    | :                        : :           : :                         : =
 |
  1 ++:                        ::            ::                          : =
 |
    | :                        ::            ::                          : =
 |
  0 *+*------------------------**------------**--------------------------*-=
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
Xiaolong Ye.

--===============5310667119248059510==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogYmxvZ2JlbmNoCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9u
aXRvcgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3Rh
dDogCiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAg
cHJvYy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAog
IHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6
IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3Rh
dDogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6
IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZv
cm1hbmNlCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29t
bWl0OiAyNTYxMjZhMzRjMmEwODdhMmE5OTAwYzJjN2FjOWE3YzRmNWU1NGU0Cm1vZGVsOiBCcm9h
ZHdlbGwgVUxUCm5yX2NwdTogNAptZW1vcnk6IDRHCm5yX3NzZF9wYXJ0aXRpb25zOiAxCnNzZF9w
YXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1JTlRFTF9TU0RTQzJDVzEyMEEzX0NWQ1Yy
NTI1MDVZRjEyMEJHTi1wYXJ0MSIKcm9vdGZzX3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9h
dGEtSU5URUxfU1NEU0MyQ1cxMjBBM19DVkNWMjUyNTA1WUYxMjBCR04tcGFydDIiCmNhdGVnb3J5
OiBiZW5jaG1hcmsKZGlzazogMVNTRApmczogeGZzCmJsb2diZW5jaDogCnF1ZXVlOiBiaXNlY3QK
dGVzdGJveDogbGtwLWJkdzAxCnRib3hfZ3JvdXA6IGxrcC1iZHcwMQprY29uZmlnOiB4ODZfNjQt
cmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDMtMTQgMTA6MDU6MDYuOTI4NzUwNTcyICswODowMApj
b21waWxlcjogZ2NjLTQuOQpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKaWQ6
IGZiNTk5YjJlNDQ4MjJiNzg4ZDkyM2EwOTA4ODI0ZTdkZmU4MmU4NjUKdXNlcjogbGtwCmhlYWRf
Y29tbWl0OiBlMWVlZjZlOWMyN2QyNGYzOThkYzcxZTRmYjEzZWJiNmUyYTEzZjYwCmJhc2VfY29t
bWl0OiBmNmNlZGU1YjQ5ZTgyMmViYzQxYTA5OWZlNDFhYjQ5ODlmNjRlMmNiCmJyYW5jaDogbGlu
dXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMzEzMTgKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L2Js
b2diZW5jaC9wZXJmb3JtYW5jZS0xU1NELXhmcy9sa3AtYmR3MDEvZGViaWFuLXg4Nl82NC0yMDE1
LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzI1NjEyNmEzNGMyYTA4N2EyYTk5MDBjMmM3
YWM5YTdjNGY1ZTU0ZTQvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9sa3AtYmR3MDEvYmlz
ZWN0X2Jsb2diZW5jaC1wZXJmb3JtYW5jZS0xU1NELXhmcy1kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6LXg4Nl82NC1yaGVsLTI1NjEyNmEzNGMyYTA4N2EyYTk5MDBjMmM3YWM5YTdjNGY1ZTU0
ZTQtMjAxNjAzMTQtMjAwMTUtMWJ3emUyZS0wLnlhbWwiCm1heF91cHRpbWU6IDI2MTMuMzU5OTk5
OTk5OTk5Nwppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpv
Yj0vbGtwL3NjaGVkdWxlZC9sa3AtYmR3MDEvYmlzZWN0X2Jsb2diZW5jaC1wZXJmb3JtYW5jZS0x
U1NELXhmcy1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTI1NjEyNmEz
NGMyYTA4N2EyYTk5MDBjMmM3YWM5YTdjNGY1ZTU0ZTQtMjAxNjAzMTQtMjAwMTUtMWJ3emUyZS0w
LnlhbWwKLSBBUkNIPXg4Nl82NAotIGtjb25maWc9eDg2XzY0LXJoZWwKLSBicmFuY2g9bGludXgt
ZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMzEzMTgKLSBjb21taXQ9MjU2MTI2YTM0YzJhMDg3YTJh
OTkwMGMyYzdhYzlhN2M0ZjVlNTRlNAotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhl
bC9nY2MtNC45LzI1NjEyNmEzNGMyYTA4N2EyYTk5MDBjMmM3YWM5YTdjNGY1ZTU0ZTQvdm1saW51
ei00LjUuMC1yYzctMDAxODgtZzI1NjEyNmEKLSBtYXhfdXB0aW1lPTI2MTMKLSBSRVNVTFRfUk9P
VD0vcmVzdWx0L2Jsb2diZW5jaC9wZXJmb3JtYW5jZS0xU1NELXhmcy9sa3AtYmR3MDEvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzI1NjEyNmEzNGMyYTA4
N2EyYTk5MDBjMmM3YWM5YTdjNGY1ZTU0ZTQvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBl
YXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBp
Yz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVv
dXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBv
b3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMw
LDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9s
a3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhl
bC9nY2MtNC45LzI1NjEyNmEzNGMyYTA4N2EyYTk5MDBjMmM3YWM5YTdjNGY1ZTU0ZTQvbW9kdWxl
cy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9y
dW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNn
ei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9vc2ltYWdlL2Rl
cHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9mcy5jZ3osL2xrcC9iZW5jaG1hcmtzL2Js
b2diZW5jaC5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhl
bC9nY2MtNC45LzI1NjEyNmEzNGMyYTA4N2EyYTk5MDBjMmM3YWM5YTdjNGY1ZTU0ZTQvbGludXgt
aGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVs
L2djYy00LjkvMjU2MTI2YTM0YzJhMDg3YTJhOTkwMGMyYzdhYzlhN2M0ZjVlNTRlNC92bWxpbnV6
LTQuNS4wLXJjNy0wMDE4OC1nMjU2MTI2YSIKZGVxdWV1ZV90aW1lOiAyMDE2LTAzLTE0IDEwOjEw
OjI0LjU4NzY5MTg1NiArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAxMDEuMjcg
NjUuODEgMjguNTAgMS8yMTMgNDczMQpzdGFydF90aW1lOiAnNTc1Mjg4ODc2OScKZW5kX3RpbWU6
ICc1NzUyODg5MDcwJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDMxMS0xODM2MTIiCg==

--===============5310667119248059510==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjE1Mi0wNC0yMCAxNjozOToxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjE1Mi0wNC0yMCAxNjozOToxNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjE1Mi0wNC0yMCAxNjozOToxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjE1Mi0w
NC0yMCAxNjozOToxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjE1Mi0wNC0yMCAxNjozOToxNCBta2ZzIC10
IHhmcyAvZGV2L3NkYTEKMjE1Mi0wNC0yMCAxNjozOToyOCBtb3VudCAtdCB4ZnMgLW8gbm9iYXJy
aWVyLGlub2RlNjQgL2Rldi9zZGExIC9mcy9zZGExCjIxNTItMDQtMjAgMTY6Mzk6MjkgLi9ibG9n
YmVuY2ggLWQgL2ZzL3NkYTEK

--===============5310667119248059510==--

