Content-Type: multipart/mixed; boundary="===============3344213431531035989=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 1924638bd2: vm-scalability.throughput -38.1% regression
Date: Thu, 14 Apr 2016 10:19:59 +0800
Message-ID: <20160414021958.GC13954@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3344213431531035989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed vm-scalability.throughput -38.1% regression on

git://bee.sh.intel.com/git/ydu19/tip flat_hierarchy_v2
commit 1924638bd249198512411221bc695f6c0fbf312a ("sched/fair: Drop out inco=
mplete current period when sched averages accrue")


commit: =

  36312635c6190a9fb44ac2bfdf10ff83aa9feaba
  1924638bd249198512411221bc695f6c0fbf312a

36312635c6190a9f 1924638bd249198512411221bc
---------------- --------------------------
         %stddev     %change         %stddev
             \          |                \
    761258 =C2=B1  1%     -38.1%     471305 =C2=B1  0%  vm-scalability.thro=
ughput
     30766 =C2=B1  3%     -69.8%       9282 =C2=B1  1%  vm-scalability.time=
.involuntary_context_switches
  50850461 =C2=B1  1%     -38.1%   31490987 =C2=B1  0%  vm-scalability.time=
.minor_page_faults
      1137 =C2=B1  0%     -23.1%     875.00 =C2=B1  1%  vm-scalability.time=
.percent_of_cpu_this_job_got
      3396 =C2=B1  0%     -24.7%       2557 =C2=B1  1%  vm-scalability.time=
.system_time
     87.00 =C2=B1  0%     +22.8%     106.83 =C2=B1  0%  vm-scalability.time=
.user_time
  55338718 =C2=B1  1%     -44.3%   30844608 =C2=B1  0%  vm-scalability.time=
.voluntary_context_switches
    291952 =C2=B1  8%     -25.6%     217211 =C2=B1  2%  numa-numastat.node0=
.local_node
    304311 =C2=B1  6%     -23.5%     232662 =C2=B1  1%  numa-numastat.node0=
.numa_hit
    737976 =C2=B1  6%     -17.7%     607289 =C2=B1  5%  softirqs.RCU
   1243583 =C2=B1  1%     -10.0%    1119594 =C2=B1  0%  softirqs.SCHED
   1566834 =C2=B1  0%     -12.9%    1364168 =C2=B1  0%  vmstat.memory.cache
     11.25 =C2=B1 11%     -35.6%       7.25 =C2=B1 15%  vmstat.procs.r
    346168 =C2=B1  1%     -41.4%     202800 =C2=B1  0%  vmstat.system.cs
     19722 =C2=B1  2%     -27.7%      14267 =C2=B1  1%  vmstat.system.in
      6.05 =C2=B1  0%     -19.9%       4.85 =C2=B1  1%  turbostat.%Busy
    155.75 =C2=B1  0%     -23.1%     119.75 =C2=B1  1%  turbostat.Avg_MHz
      2.57 =C2=B1  3%     -84.6%       0.40 =C2=B1 44%  turbostat.CPU%c3
     24.62 =C2=B1  4%     -58.5%      10.23 =C2=B1  1%  turbostat.Pkg%pc2
    105.98 =C2=B1  0%     +12.7%     119.44 =C2=B1  0%  turbostat.RAMWatt
    208886 =C2=B1  2%     -11.5%     184766 =C2=B1  2%  meminfo.Active
    110089 =C2=B1  5%     -22.8%      84937 =C2=B1  5%  meminfo.Active(anon)
   2055197 =C2=B1  1%     +13.3%    2328473 =C2=B1  0%  meminfo.Committed_AS
    199489 =C2=B1  1%     -36.5%     126774 =C2=B1  0%  meminfo.PageTables
    669070 =C2=B1  1%     -26.3%     493214 =C2=B1  0%  meminfo.SUnreclaim
    747414 =C2=B1  1%     -23.7%     570415 =C2=B1  0%  meminfo.Slab
    623.00 =C2=B1 26%     +39.5%     869.00 =C2=B1  5%  time.file_system_in=
puts
     30766 =C2=B1  3%     -69.8%       9282 =C2=B1  1%  time.involuntary_co=
ntext_switches
  50850461 =C2=B1  1%     -38.1%   31490987 =C2=B1  0%  time.minor_page_fau=
lts
      1137 =C2=B1  0%     -23.1%     875.00 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
      3396 =C2=B1  0%     -24.7%       2557 =C2=B1  1%  time.system_time
     87.00 =C2=B1  0%     +22.8%     106.83 =C2=B1  0%  time.user_time
  55338718 =C2=B1  1%     -44.3%   30844608 =C2=B1  0%  time.voluntary_cont=
ext_switches
 4.371e+08 =C2=B1  8%     -94.1%   25888597 =C2=B1 79%  cpuidle.C1-BDW.time
   1701176 =C2=B1  6%     -94.5%      94192 =C2=B1  1%  cpuidle.C1-BDW.usage
 3.255e+09 =C2=B1  2%     -99.1%   29911492 =C2=B1 10%  cpuidle.C1E-BDW.time
  13009780 =C2=B1  4%     -99.8%      20037 =C2=B1  6%  cpuidle.C1E-BDW.usa=
ge
 1.833e+09 =C2=B1  2%     -90.0%  1.825e+08 =C2=B1 40%  cpuidle.C3-BDW.time
   7018257 =C2=B1  2%     -96.6%     239993 =C2=B1 30%  cpuidle.C3-BDW.usage
 4.987e+10 =C2=B1  0%     +11.2%  5.545e+10 =C2=B1  0%  cpuidle.C6-BDW.time
  48862155 =C2=B1  1%     -14.9%   41602974 =C2=B1  2%  cpuidle.C6-BDW.usage
     27520 =C2=B1  5%     -22.8%      21233 =C2=B1  5%  proc-vmstat.nr_acti=
ve_anon
     49872 =C2=B1  1%     -36.5%      31691 =C2=B1  0%  proc-vmstat.nr_page=
_table_pages
    167264 =C2=B1  1%     -26.3%     123301 =C2=B1  0%  proc-vmstat.nr_slab=
_unreclaimable
      1942 =C2=B1  4%     +16.2%       2256 =C2=B1  4%  proc-vmstat.numa_hi=
nt_faults
     29024 =C2=B1  6%     -27.0%      21183 =C2=B1  2%  proc-vmstat.pgactiv=
ate
      6436 =C2=B1  5%     -26.9%       4703 =C2=B1 12%  proc-vmstat.pgalloc=
_dma32
   1256452 =C2=B1  0%     -10.4%    1125377 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
  51707765 =C2=B1  1%     -37.5%   32331204 =C2=B1  0%  proc-vmstat.pgfault
   1105486 =C2=B1  4%     -10.6%     988169 =C2=B1  3%  proc-vmstat.pgfree
      3192 =C2=B1  5%     -30.0%       2233 =C2=B1  7%  slabinfo.UNIX.activ=
e_objs
      3192 =C2=B1  5%     -30.0%       2233 =C2=B1  7%  slabinfo.UNIX.num_o=
bjs
      7586 =C2=B1  2%     -12.5%       6636 =C2=B1  1%  slabinfo.files_cach=
e.active_objs
      7586 =C2=B1  2%     -12.5%       6636 =C2=B1  1%  slabinfo.files_cach=
e.num_objs
     12639 =C2=B1  1%     -12.5%      11065 =C2=B1  1%  slabinfo.pid.active=
_objs
     12639 =C2=B1  1%     -12.5%      11065 =C2=B1  1%  slabinfo.pid.num_ob=
js
      5888 =C2=B1  4%     -21.9%       4598 =C2=B1  7%  slabinfo.sock_inode=
_cache.active_objs
      5888 =C2=B1  4%     -21.9%       4598 =C2=B1  7%  slabinfo.sock_inode=
_cache.num_objs
   2529959 =C2=B1  1%     -37.4%    1584447 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_objs
     57499 =C2=B1  1%     -37.4%      36010 =C2=B1  0%  slabinfo.vm_area_st=
ruct.active_slabs
   2529980 =C2=B1  1%     -37.4%    1584462 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_objs
     57499 =C2=B1  1%     -37.4%      36010 =C2=B1  0%  slabinfo.vm_area_st=
ruct.num_slabs



                              vm-scalability.throughput

  850000 ++----------------------------------------------------------------=
-+
         |                                                                 =
 |
  800000 *+*..*.*..      .*.*..             .*.      .*..    .*.*.         =
 |
         |         *.*.*.      *.*.*..*.*..*   *..*.*    *.*.     *..*.*..*=
.|
  750000 ++                                                                =
 *
  700000 ++                                                                =
 |
         |                                                                 =
 |
  650000 ++                                                                =
 |
         |                                                                 =
 |
  600000 ++                                                                =
 |
  550000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         O O  O O  O O O  O O                     O O O  O O  O O O  O O  O=
 O
  450000 ++--------------------O-O-O--O-O--O-O-O---------------------------=
-+


                           vm-scalability.time.user_time

  130 ++-------------------------------------------------------------------=
-+
  125 ++                  O                                                =
 |
      O  O O  O O  O O                                                     =
 |
  120 ++                O                                                  =
 |
  115 ++                                                                   =
 |
      |                                            O         O             =
 |
  110 ++                                         O    O O  O    O O  O     =
 O
  105 ++                     O O  O O  O O  O O                        O  O=
 |
  100 ++                                                                   =
 |
      |                                                                    =
 |
   95 ++                                                                   =
 |
   90 ++                                   .*.       .*.  .*.*..*.         =
 |
      *..*.*..*.*.. .*..*.*..*.*..*.*..*.*.   *..*.*.   *.        *..*.*..*=
.*
   85 ++           *                                                       =
 |
   80 ++-------------------------------------------------------------------=
-+


                          vm-scalability.time.system_time

  3600 ++------------------------------------------------------------------=
-+
       *.  .*.*..           .*.. .*..      .*.       .*.       .*.         =
 |
  3400 ++*.      *.*..*.*..*    *    *.*..*   *..*.*.   *..*.*.   *..*.*..*=
.*
  3200 ++                                                                  =
 |
       |                                                                   =
 |
  3000 ++                                                                  =
 |
       |                                                                   =
 |
  2800 ++                                                                  =
 |
       |                                                                   =
 |
  2600 ++                                        O         O         O O  O=
 O
  2400 ++                                          O  O O    O  O O        =
 |
       |                O    O                                             =
 |
  2200 O+O  O O  O O            O O  O O  O O O                            =
 |
       |              O    O                                               =
 |
  2000 ++------------------------------------------------------------------=
-+


                  vm-scalability.time.percent_of_cpu_this_job_got

  1200 ++------------------------------------------------------------------=
-+
  1150 *+  .*.*..           .*.. .*..      .*.       .*.    .*..*.         =
 |
       | *.      *.*..*.*..*    *    *.*..*   *..*.*.   *..*      *..*.*..*=
.*
  1100 ++                                                                  =
 |
  1050 ++                                                                  =
 |
       |                                                                   =
 |
  1000 ++                                                                  =
 |
   950 ++                                                                  =
 |
   900 ++                                                                  =
 |
       |                                         O         O         O O  O=
 O
   850 ++                                          O  O O    O  O O        =
 |
   800 ++               O                                                  =
 |
       O O  O O  O O         O  O O  O O  O O O                            =
 |
   750 ++             O    O                                               =
 |
   700 ++------------------------------------------------------------------=
-+


                         vm-scalability.time.minor_page_faults

  5.5e+07 ++---------------------------------------------------------------=
-+
          *.*..           .*.*.                              .*.*..        =
 |
          |    *.*.*.. .*.     *..*.*.*..*.*.*.. .*.*..*.  .*      *.*.*..*=
.|
    5e+07 ++          *                         *        *.                =
 *
          |                                                                =
 |
          |                                                                =
 |
  4.5e+07 ++                                                               =
 |
          |                                                                =
 |
    4e+07 ++                                                               =
 |
          |                                                                =
 |
          |                                                                =
 |
  3.5e+07 ++                                                               =
 |
          |                                                                =
 |
          O O  O O O  O O  O O                    O O  O O  O O O  O O O  O=
 O
    3e+07 ++-------------------O--O-O-O--O-O-O--O--------------------------=
-+


                    vm-scalability.time.voluntary_context_switches

    6e+07 ++---------------*-----------------------------------------------=
-+
          *.*..*.*.*..   ..  *.             .*..      .*.  .*.*.*..        =
 |
  5.5e+07 ++          *.*      *..*.*.*..*.*    *.*.*.   *.        *.*.*..*=
.*
          |                                                                =
 |
    5e+07 ++                                                               =
 |
          |                                                                =
 |
  4.5e+07 ++                                                               =
 |
          |                                                                =
 |
    4e+07 ++                                                               =
 |
          |                                                                =
 |
  3.5e+07 ++                                                               =
 |
          O O  O O O  O O  O O                      O         O            =
 |
    3e+07 ++                   O  O O O  O O O  O O    O O  O   O  O O O  O=
 O
          |                                                                =
 |
  2.5e+07 ++---------------------------------------------------------------=
-+


                  vm-scalability.time.involuntary_context_switches

  35000 ++-----------------------------------------------------------------=
-+
        *.*..                           *.      .*..                   *.. =
 |
  30000 ++   *.           .*..        ..  *.*..*    *.*..*.*.*..*.*.. +   *=
.*
        |      *..*.*..*.*    *.*..*.*                               *     =
 |
        |                                                                  =
 |
  25000 ++                                                                 =
 |
        |                                                                  =
 |
  20000 ++                                                                 =
 |
        |                                                                  =
 |
  15000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
  10000 O+O  O O  O O  O O O  O O  O O  O O O  O O  O O  O O O  O O  O O  O=
 O
        |                                                                  =
 |
   5000 ++-----------------------------------------------------------------=
-+

Test machine: lkp-bdw-ex2

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
yexl

--===============3344213431531035989==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogdm0tc2NhbGFiaWxpdHkKZGVmYXVsdC1tb25pdG9yczoKICB3YWl0OiBhY3RpdmF0
ZS1tb25pdG9yCiAga21zZzogCiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIGhlYXJ0YmVhdDogCiAg
dm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZv
OiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5m
bzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9z
dGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBu
ZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBt
ZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjog
cGVyZm9ybWFuY2UKZGVmYXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6
IApjb21taXQ6IDE5MjQ2MzhiZDI0OTE5ODUxMjQxMTIyMWJjNjk1ZjZjMGZiZjMxMmEKbW9kZWw6
IEJyb2Fkd2VsbC1FWAptZW1vcnk6IDUxMkcKbnJfY3B1OiAxNjAKaGRkX3BhcnRpdGlvbnM6IApz
d2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9uOiAKY2F0ZWdvcnk6IGJlbmNobWFyawpw
ZXJmLXByb2ZpbGU6IApydW50aW1lOiAzMDBzCnNpemU6IAp2bS1zY2FsYWJpbGl0eToKICB0ZXN0
OiBzbWFsbC1hbGxvY3MtbXQKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3AtYmR3LWV4Mgp0Ym94
X2dyb3VwOiBsa3AtYmR3LWV4MgprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIw
MTYtMDQtMTMgMTE6NDI6MjIuNTcxNzQ1NDk4ICswODowMApjb21waWxlcjogZ2NjLTQuOQpyb290
ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKaWQ6IDZmYzNjNDRmOWIyYTU4MWE2NTdh
MjcxYWU0M2JlYzM1MmNkOTQ3YTAKdXNlcjogbGtwCmhlYWRfY29tbWl0OiBkMTYxZDgxNDZlNGMz
MTI0MTg0NDkwYWNlOTUxYzhjZmUzNTcyYTk4CmJhc2VfY29tbWl0OiBiZjE2MjAwNjg5MTE4ZDE5
ZGUxYjhkMmEzYzMxNGZjMjFmNWRjN2JiCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5
LTIwMTYwNDEyMTgKcmVzdWx0X3Jvb3Q6ICIvcmVzdWx0L3ZtLXNjYWxhYmlsaXR5L3BlcmZvcm1h
bmNlLTMwMHMtc21hbGwtYWxsb2NzLW10L2xrcC1iZHctZXgyL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS8xOTI0NjM4YmQyNDkxOTg1MTI0MTEyMjFiYzY5
NWY2YzBmYmYzMTJhLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hlZHVsZWQvbGtwLWJkdy1leDIvYmlz
ZWN0X3ZtLXNjYWxhYmlsaXR5LXBlcmZvcm1hbmNlLTMwMHMtc21hbGwtYWxsb2NzLW10LWRlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtMTkyNDYzOGJkMjQ5MTk4NTEyNDEx
MjIxYmM2OTVmNmMwZmJmMzEyYS0yMDE2MDQxMy04NzU1LTE0MHZhbWEtMC55YW1sIgptYXhfdXB0
aW1lOiAxNTAwCmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0g
am9iPS9sa3Avc2NoZWR1bGVkL2xrcC1iZHctZXgyL2Jpc2VjdF92bS1zY2FsYWJpbGl0eS1wZXJm
b3JtYW5jZS0zMDBzLXNtYWxsLWFsbG9jcy1tdC1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6
LXg4Nl82NC1yaGVsLTE5MjQ2MzhiZDI0OTE5ODUxMjQxMTIyMWJjNjk1ZjZjMGZiZjMxMmEtMjAx
NjA0MTMtODc1NS0xNDB2YW1hLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2NvbmZpZz14ODZfNjQt
cmhlbAotIGJyYW5jaD1saW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjA0MTIxOAotIGNvbW1p
dD0xOTI0NjM4YmQyNDkxOTg1MTI0MTEyMjFiYzY5NWY2YzBmYmYzMTJhCi0gQk9PVF9JTUFHRT0v
cGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMTkyNDYzOGJkMjQ5MTk4NTEyNDExMjIxYmM2
OTVmNmMwZmJmMzEyYS92bWxpbnV6LTQuNi4wLXJjMi0wMDA4Ni1nMTkyNDYzOAotIG1heF91cHRp
bWU9MTUwMAotIFJFU1VMVF9ST09UPS9yZXN1bHQvdm0tc2NhbGFiaWxpdHkvcGVyZm9ybWFuY2Ut
MzAwcy1zbWFsbC1hbGxvY3MtbXQvbGtwLWJkdy1leDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzE5MjQ2MzhiZDI0OTE5ODUxMjQxMTIyMWJjNjk1ZjZj
MGZiZjMxMmEvMAotIExLUF9TRVJWRVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwx
MTUyMDAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdh
eXNfZW5hYmxlZCByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEg
c29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFt
ZGlzaz0yIHByb21wdF9yYW1kaXNrPTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0
eTAgdmdhPW5vcm1hbAoKICBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oi
Cm1vZHVsZXNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzE5MjQ2Mzhi
ZDI0OTE5ODUxMjQxMTIyMWJjNjk1ZjZjMGZiZjMxMmEvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDog
Ii9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2lt
YWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9v
c2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9s
a3AvYmVuY2htYXJrcy90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy92bS1zY2FsYWJpbGl0
eS5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2Mt
NC45LzE5MjQ2MzhiZDI0OTE5ODUxMjQxMTIyMWJjNjk1ZjZjMGZiZjMxMmEvbGludXgtaGVhZGVy
cy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvMTkyNDYzOGJkMjQ5MTk4NTEyNDExMjIxYmM2OTVmNmMwZmJmMzEyYS92bWxpbnV6LTQuNi4w
LXJjMi0wMDA4Ni1nMTkyNDYzOCIKZGVxdWV1ZV90aW1lOiAyMDE2LTA0LTEzIDExOjUyOjUwLjIx
OTQ4MTEzNSArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAxNDguNjUgMTE1Ljg3
IDUyLjI1IDEvMTg1OSAxMjg1MApzdGFydF90aW1lOiAnMTQ2MDUxOTY0NycKZW5kX3RpbWU6ICcx
NDYwNTE5OTUyJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDQxMy0xMDU3MTEiCg==

--===============3344213431531035989==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAxL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTIvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyMy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyNi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTI3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUxMjgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQt
MTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMxL2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQt
MTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM0L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQt
MTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTM3L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxMzgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQt
MTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTQvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0x
MyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNDIvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0x
MyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNDUvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0x
MyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNDgvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTE0OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0x
MyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1MC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEz
IDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUx
NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1My9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTU0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEz
IDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUx
NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1Ni9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEz
IDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUx
NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1OS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMg
MTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE2
MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTYxL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNjIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMg
MTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTY0L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNjUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMg
MTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE2
Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTY3L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNjgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMg
MTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE2
OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTcvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTE3MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAx
MTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTcx
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNzIvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTE3My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAx
MTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTc0
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNzUvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTE3Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAx
MTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTc3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNzgvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTE3OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAx
MTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTgv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4MC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTgxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDEx
OjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxODIv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4My9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTg0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDEx
OjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxODUv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4Ni9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTg3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDEx
OjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxODgv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4OS9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6
NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE5MC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTkxL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0
OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2
IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMy9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0x
MyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMxL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzMi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAx
MTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM0L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzNS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1
NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzOC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDow
NiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTQwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQt
MTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTQ2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMg
MTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ5
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1
NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTEvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDow
NiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTQvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTcvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQt
MTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTYxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Mi9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMg
MTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY0
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NS9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6
NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY3L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6
MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTczL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzgvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTc5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEz
IDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1ODEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6
NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgyL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6
MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1ODcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTEzIDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU5Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTk0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEz
IDExOjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTEzIDEx
OjU0OjA2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5OC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0xMyAxMTo1NDowNiBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCjIwMTYtMDQtMTMgMTE6NTQ6MDcgbW91bnQgLXQgdG1wZnMgLW8gc2l6ZT0xMDAlIHZtLXNj
YWxhYmlsaXR5LXRtcCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcAoyMDE2LTA0LTEzIDExOjU0OjA3
IHRydW5jYXRlIC1zIDU0MDkxODU1MDUyOCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2Fs
YWJpbGl0eS5pbWcKMjAxNi0wNC0xMyAxMTo1NDowNyBta2ZzLnhmcyAtcSAvdG1wL3ZtLXNjYWxh
YmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS5pbWcKMjAxNi0wNC0xMyAxMTo1NDowOCBtb3VudCAt
byBsb29wIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5LmltZyAvdG1wL3Zt
LXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eQoyMDE2LTA0LTEzIDExOjU0OjA4IC4vY2Fz
ZS1zbWFsbC1hbGxvY3MtbXQKMjAxNi0wNC0xMyAxMTo1NDowOCAuL3VzZW1lbSAtLXJ1bnRpbWUg
MzAwIC10IDE5MiAtLXJlYWRvbmx5IC0tdW5pdCA0MDk2MCAyMjkwNjQ5MjI0NQoyMDE2LTA0LTEz
IDExOjU5OjEyIHVtb3VudCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eQoy
MDE2LTA0LTEzIDExOjU5OjEyIHJtIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmls
aXR5LmltZwoyMDE2LTA0LTEzIDExOjU5OjEyIHVtb3VudCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRt
cAo=

--===============3344213431531035989==--

