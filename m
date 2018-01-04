Content-Type: multipart/mixed; boundary="===============1417960035501871479=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [lkp-robot] [workqueue] 5c0338c687: blogbench.write_score -21.2% regression
Date: Thu, 04 Jan 2018 13:57:21 +0800
Message-ID: <20180104055721.GE23834@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1417960035501871479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Greeting,

FYI, we noticed a -21.2% regression of blogbench.write_score due to commit:


commit: 5c0338c68706be53b3dc472e4308961c36e4ece1 ("workqueue: restore WQ_UN=
BOUND/max_active=3D=3D1 to be ordered")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

in testcase: blogbench
on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 8G m=
emory
with following parameters:

	disk: 1SSD
	fs: btrfs
	cpufreq_governor: performance

test-description: Blogbench is a portable filesystem benchmark that tries t=
o reproduce the load of a real-world busy file server.
test-url: https://www.pureftpd.org/project/blogbench


Details are as below:
---------------------------------------------------------------------------=
----------------------->


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/rootfs/tbox_group/testcase:
  gcc-6/performance/1SSD/btrfs/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz=
/lkp-bdw-de1/blogbench

commit: =

  74cbd96bc2 ("Merge tag 'md/4.13-rc2' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/shli/md")
  5c0338c687 ("workqueue: restore WQ_UNBOUND/max_active=3D=3D1 to be ordere=
d")

74cbd96bc2e00f5d 5c0338c68706be53b3dc472e43 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      3974           -21.2%       3131 =C2=B1  4%  blogbench.write_score
   1608428 =C2=B1  2%      +9.7%    1764811 =C2=B1  6%  blogbench.read_score
 1.043e+08           -58.0%   43770754 =C2=B1 19%  blogbench.time.file_syst=
em_inputs
  33045282           -23.0%   25456502 =C2=B1  4%  blogbench.time.file_syst=
em_outputs
   1889747           -51.2%     922952        blogbench.time.involuntary_co=
ntext_switches
      1066            -9.1%     969.60 =C2=B1  4%  blogbench.time.percent_o=
f_cpu_this_job_got
      3058            -9.6%       2764 =C2=B1  4%  blogbench.time.system_ti=
me
  20367518 =C2=B1  2%     -58.2%    8523363 =C2=B1 17%  blogbench.time.volu=
ntary_context_switches
     56387 =C2=B1  6%      -9.4%      51101 =C2=B1  2%  interrupts.CAL:Func=
tion_call_interrupts
    599681 =C2=B1  2%     -42.0%     347640 =C2=B1 14%  softirqs.SCHED
     21.79 =C2=B1  3%      +6.4       28.17 =C2=B1 10%  mpstat.cpu.iowait%
      0.02 =C2=B1 22%      +0.2        0.23 =C2=B1 15%  mpstat.cpu.soft%
      3.08 =C2=B1  5%      +0.6        3.72 =C2=B1  6%  mpstat.cpu.usr%
     63227 =C2=B1  3%     +13.0%      71434 =C2=B1  6%  meminfo.CmaFree
   1915913 =C2=B1  4%     -25.3%    1431623 =C2=B1  4%  meminfo.Inactive
   1897786 =C2=B1  4%     -25.5%    1413549 =C2=B1  4%  meminfo.Inactive(fi=
le)
   1269568 =C2=B1  4%     +27.1%    1613730 =C2=B1  9%  meminfo.MemFree
      8434 =C2=B1  5%     -55.9%       3719 =C2=B1 18%  iostat.sda.r/s
    168471 =C2=B1  5%     -56.9%      72537 =C2=B1 19%  iostat.sda.rkB/s
     10.68 =C2=B1  8%     -37.2%       6.70 =C2=B1 11%  iostat.sda.rrqm/s
    732.25 =C2=B1  5%     -30.4%     509.76 =C2=B1  2%  iostat.sda.w/s
      1748 =C2=B1  4%     -18.2%       1429 =C2=B1  5%  iostat.sda.wrqm/s
 8.165e+08 =C2=B1  2%     -20.7%  6.477e+08 =C2=B1 14%  cpuidle.C1.time
  26339770 =C2=B1  2%     -59.2%   10742045 =C2=B1 18%  cpuidle.C1.usage
 1.775e+08 =C2=B1  6%    +236.0%  5.962e+08 =C2=B1  6%  cpuidle.C1E.time
    607354 =C2=B1  4%     +51.8%     921820 =C2=B1  9%  cpuidle.C1E.usage
    134897 =C2=B1 25%     -38.6%      82860 =C2=B1 15%  cpuidle.C3.usage
    518720 =C2=B1  2%     -60.1%     207069 =C2=B1 19%  cpuidle.POLL.usage
    168530 =C2=B1  5%     -56.9%      72617 =C2=B1 19%  vmstat.io.bi
     57048 =C2=B1  5%     -22.2%      44397 =C2=B1  4%  vmstat.io.bo
    429.10 =C2=B1  5%     +21.2%     520.20 =C2=B1  8%  vmstat.memory.buff
   1289089 =C2=B1  4%     +26.6%    1631377 =C2=B1  8%  vmstat.memory.free
     40.40 =C2=B1  4%     -17.6%      33.30 =C2=B1 11%  vmstat.procs.b
    207214 =C2=B1  5%     -34.2%     136272 =C2=B1  9%  vmstat.system.cs
     27043 =C2=B1  2%     -26.6%      19840 =C2=B1  3%  vmstat.system.in
    216066 =C2=B1  3%     +12.8%     243680 =C2=B1  2%  slabinfo.btrfs_dela=
yed_node.active_objs
     11273 =C2=B1  4%     -27.3%       8194 =C2=B1  3%  slabinfo.btrfs_exte=
nt_buffer.active_objs
     11710 =C2=B1  4%     -26.2%       8636 =C2=B1  3%  slabinfo.btrfs_exte=
nt_buffer.num_objs
      5056 =C2=B1  3%     -12.2%       4441 =C2=B1  6%  slabinfo.btrfs_orde=
red_extent.active_objs
      5187 =C2=B1  3%     -11.9%       4568 =C2=B1  6%  slabinfo.btrfs_orde=
red_extent.num_objs
     19452 =C2=B1 10%     +66.7%      32428 =C2=B1  8%  slabinfo.kmalloc-25=
6.active_objs
    624.40 =C2=B1  9%     +65.7%       1034 =C2=B1  8%  slabinfo.kmalloc-25=
6.active_slabs
     19996 =C2=B1  9%     +65.7%      33129 =C2=B1  8%  slabinfo.kmalloc-25=
6.num_objs
    624.40 =C2=B1  9%     +65.7%       1034 =C2=B1  8%  slabinfo.kmalloc-25=
6.num_slabs
 6.933e+11            -7.8%  6.395e+11 =C2=B1  2%  perf-stat.branch-instruc=
tions
      0.62            -0.1        0.47 =C2=B1  4%  perf-stat.branch-miss-ra=
te%
 4.329e+09           -30.0%  3.032e+09 =C2=B1  2%  perf-stat.branch-misses
  64545297 =C2=B1  2%     -35.9%   41378261 =C2=B1  9%  perf-stat.context-s=
witches
 9.103e+12            -8.0%  8.376e+12 =C2=B1  3%  perf-stat.cpu-cycles
   6729558 =C2=B1  3%     -72.4%    1858286 =C2=B1 17%  perf-stat.cpu-migra=
tions
     26.24 =C2=B1  5%     +23.6       49.83 =C2=B1  9%  perf-stat.iTLB-load=
-miss-rate%
 4.122e+08 =C2=B1  7%     +26.5%  5.214e+08 =C2=B1  5%  perf-stat.iTLB-load=
-misses
 1.157e+09 =C2=B1  2%     -54.2%  5.302e+08 =C2=B1 14%  perf-stat.iTLB-loads
      8459 =C2=B1  7%     -24.3%       6399 =C2=B1  5%  perf-stat.instructi=
ons-per-iTLB-miss
      0.38            +4.4%       0.40        perf-stat.ipc
    319949 =C2=B1  5%      -3.9%     307528        perf-stat.minor-faults
    319952 =C2=B1  5%      -3.9%     307494        perf-stat.page-faults
  84255382 =C2=B1  9%     -95.6%    3708415 =C2=B1 83%  proc-vmstat.compact=
_daemon_free_scanned
   1829109 =C2=B1 18%     -97.6%      44241 =C2=B1 93%  proc-vmstat.compact=
_daemon_migrate_scanned
      1059 =C2=B1 11%     -92.8%      75.90 =C2=B1100%  proc-vmstat.compact=
_daemon_wake
  84255382 =C2=B1  9%     -95.6%    3708415 =C2=B1 83%  proc-vmstat.compact=
_free_scanned
    781008 =C2=B1 21%     -98.8%       9090 =C2=B1 89%  proc-vmstat.compact=
_isolated
   1829109 =C2=B1 18%     -97.6%      44241 =C2=B1 93%  proc-vmstat.compact=
_migrate_scanned
    179.80 =C2=B1  9%     -40.8%     106.50 =C2=B1 16%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
     22499 =C2=B1 62%    -100.0%       5.50 =C2=B1125%  proc-vmstat.kswapd_=
inodesteal
      4237 =C2=B1  8%     -83.2%     710.60 =C2=B1 28%  proc-vmstat.kswapd_=
low_wmark_hit_quickly
   4539912           -24.2%    3441760 =C2=B1  4%  proc-vmstat.nr_dirtied
    316909 =C2=B1  4%     +27.1%     402889 =C2=B1  9%  proc-vmstat.nr_free=
_pages
    474932 =C2=B1  4%     -25.5%     353600 =C2=B1  4%  proc-vmstat.nr_inac=
tive_file
    207449 =C2=B1 14%     -54.1%      95277 =C2=B1 24%  proc-vmstat.nr_vmsc=
an_immediate_reclaim
   4442638           -24.2%    3366510 =C2=B1  4%  proc-vmstat.nr_written
    474994 =C2=B1  4%     -25.5%     353713 =C2=B1  4%  proc-vmstat.nr_zone=
_inactive_file
  20945924           -35.0%   13606065 =C2=B1  7%  proc-vmstat.numa_hit
  20945924           -35.0%   13606065 =C2=B1  7%  proc-vmstat.numa_local
      4632 =C2=B1  7%     -75.8%       1119 =C2=B1 18%  proc-vmstat.pageout=
run
  26805123 =C2=B1  2%     -35.6%   17261359 =C2=B1  6%  proc-vmstat.pgactiv=
ate
   6702031           -15.2%    5684286 =C2=B1  4%  proc-vmstat.pgalloc_dma32
  17277542           -27.9%   12464886 =C2=B1  4%  proc-vmstat.pgalloc_norm=
al
  31715903 =C2=B1  2%     -39.0%   19354510 =C2=B1  8%  proc-vmstat.pgdeact=
ivate
  22331249           -26.4%   16425277 =C2=B1  5%  proc-vmstat.pgfree
     62247 =C2=B1  8%     -94.5%       3437 =C2=B1 76%  proc-vmstat.pgmigra=
te_success
  52404647           -58.0%   22020215 =C2=B1 19%  proc-vmstat.pgpgin
  17745601           -24.2%   13447782 =C2=B1  4%  proc-vmstat.pgpgout
  31724465 =C2=B1  2%     -39.0%   19363354 =C2=B1  8%  proc-vmstat.pgrefill
    229386 =C2=B1 12%     -48.0%     119203 =C2=B1 28%  proc-vmstat.pgrotat=
ed
  16121910           -54.1%    7392371 =C2=B1 17%  proc-vmstat.pgscan_kswapd
  15714718           -54.8%    7109527 =C2=B1 17%  proc-vmstat.pgsteal_kswa=
pd
   8744243           -55.3%    3910348 =C2=B1 18%  proc-vmstat.slabs_scanned
   1941347 =C2=B1 11%     -75.0%     485169 =C2=B1 26%  proc-vmstat.working=
set_activate
   3087977 =C2=B1 13%     -76.7%     718263 =C2=B1 28%  proc-vmstat.working=
set_refault


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Xiaolong

--===============1417960035501871479==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCgojISBqb2JzL2Jsb2diZW5jaC0xc3NkLnlhbWwKc3VpdGU6IGJsb2diZW5jaAp0ZXN0Y2Fz
ZTogYmxvZ2JlbmNoCmNhdGVnb3J5OiBiZW5jaG1hcmsKZGlzazogMVNTRApmczogYnRyZnMKYmxv
Z2JlbmNoOiAKam9iX29yaWdpbjogIi9sa3AvbGtwLy5zcmMtMjAxNzA3MjEtMTMzNTQyL2FsbG90
L2N5Y2xpYzpsaW51eC1kZXZlbDpkZXZlbC1ob3VybHkvbGtwLWJkdy1kZTEvYmxvZ2JlbmNoLTFz
c2QueWFtbCIKCiMhIHF1ZXVlIG9wdGlvbnMKcXVldWU6IGJpc2VjdAp0ZXN0Ym94OiBsa3AtYmR3
LWRlMQp0Ym94X2dyb3VwOiBsa3AtYmR3LWRlMQpzdWJtaXRfaWQ6IDU5NzM0NzBiMGI5YTkzNjMx
NTg0YTdkMApqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1iZHctZGUxL2Jsb2diZW5jaC0x
U1NELWJ0cmZzLXBlcmZvcm1hbmNlLWRlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3otNWMwMzM4
YzY4NzA2YmU1M2IzZGM0NzJlNDMwODk2MWMzNmU0ZWNlMS0yMDE3MDcyMi0yNTM2NS02Yjh6Z2It
MC55YW1sIgppZDogZDNlN2RhMDYxMzU1OWI5NGQ3YTk5ZWIzMGU4MDM1Mjg1OWJkZDdiYwoKIyEg
aG9zdHMvbGtwLWJkdy1kZTEKbW9kZWw6IEJyb2Fkd2VsbC1ERQpucl9jcHU6IDE2Cm1lbW9yeTog
OEcKc3NkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUlOVEVMX1NTRFNDMkJCNDgw
RzZfQlRXQTYwNzUwMTJUNDgwRkdOIgpzd2FwX3BhcnRpdGlvbnM6IApyb290ZnNfcGFydGl0aW9u
OiAKa2VybmVsX2NtZGxpbmU6IGNvbnNvbGU9dHR5UzEsMTE1MjAwIGNvbnNvbGU9dHR5MApicmFu
ZDogSW50ZWwoUikgWGVvbihSKSBDUFUgRC0xNTQxIEAgMi4xMEdIegoKIyEgaW5jbHVkZS9jYXRl
Z29yeS9iZW5jaG1hcmsKa21zZzogCmlvc3RhdDogCmhlYXJ0YmVhdDogCnZtc3RhdDogCm51bWEt
bnVtYXN0YXQ6IApudW1hLXZtc3RhdDogCm51bWEtbWVtaW5mbzogCnByb2Mtdm1zdGF0OiAKcHJv
Yy1zdGF0OiAKbWVtaW5mbzogCnNsYWJpbmZvOiAKaW50ZXJydXB0czogCmxvY2tfc3RhdDogCmxh
dGVuY3lfc3RhdHM6IApzb2Z0aXJxczogCmJkaV9kZXZfbWFwcGluZzogCmRpc2tzdGF0czogCm5m
c3N0YXQ6IApjcHVpZGxlOiAKY3B1ZnJlcS1zdGF0czogCnR1cmJvc3RhdDogCnNjaGVkX2RlYnVn
OiAKcGVyZi1zdGF0OiAKbXBzdGF0OiAKcGVyZi1wcm9maWxlOiAKCiMhIGluY2x1ZGUvY2F0ZWdv
cnkvQUxMCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCgojISBpbmNsdWRlL2Rpc2svbnJf
c3NkCm5lZWRfa2NvbmZpZzoKLSBDT05GSUdfQkxLX0RFVl9TRAotIENPTkZJR19TQ1NJCi0gQ09O
RklHX0JMT0NLPXkKLSBDT05GSUdfU0FUQV9BSENJCi0gQ09ORklHX1NBVEFfQUhDSV9QTEFURk9S
TQotIENPTkZJR19BVEEKLSBDT05GSUdfUENJPXkKLSBDT05GSUdfQlRSRlNfRlMKCiMhIGluY2x1
ZGUvcXVldWUvY3ljbGljCmNvbW1pdDogNWMwMzM4YzY4NzA2YmU1M2IzZGM0NzJlNDMwODk2MWMz
NmU0ZWNlMQoKIyEgaW5jbHVkZS9mcy9idHJmcwoKIyEgZGVmYXVsdCBwYXJhbXMKa2NvbmZpZzog
eDg2XzY0LXJoZWwtNy4yCmNvbXBpbGVyOiBnY2MtNgpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAx
Ni0wOC0zMS5jZ3oKZW5xdWV1ZV90aW1lOiAyMDE3LTA3LTIyIDIwOjM3OjMzLjIxMTAyNDg1MyAr
MDg6MDAKX2lkOiA1OTczNDcwYjBiOWE5MzYzMTU4NGE3ZDAKX3J0OiAiL3Jlc3VsdC9ibG9nYmVu
Y2gvMVNTRC1idHJmcy1wZXJmb3JtYW5jZS9sa3AtYmR3LWRlMS9kZWJpYW4teDg2XzY0LTIwMTYt
MDgtMzEuY2d6L3g4Nl82NC1yaGVsLTcuMi9nY2MtNi81YzAzMzhjNjg3MDZiZTUzYjNkYzQ3MmU0
MzA4OTYxYzM2ZTRlY2UxIgoKIyEgc2NoZWR1bGUgb3B0aW9ucwp1c2VyOiBsa3AKaGVhZF9jb21t
aXQ6IGRkNWUzMTdiMzdjNjg3Y2Y2OTZiNTRiMTE0ODU1OWVjMDk2ODJkMTgKYmFzZV9jb21taXQ6
IDU3NzFhOGMwODg4MGNkY2EzYmZiNGEzZmM2ZDMwOWQ2YmJhMjA4NzcKYnJhbmNoOiBsaW51eC1k
ZXZlbC9kZXZlbC1ob3VybHktMjAxNzA3MjIwNwpyZXN1bHRfcm9vdDogIi9yZXN1bHQvYmxvZ2Jl
bmNoLzFTU0QtYnRyZnMtcGVyZm9ybWFuY2UvbGtwLWJkdy1kZTEvZGViaWFuLXg4Nl82NC0yMDE2
LTA4LTMxLmNnei94ODZfNjQtcmhlbC03LjIvZ2NjLTYvNWMwMzM4YzY4NzA2YmU1M2IzZGM0NzJl
NDMwODk2MWMzNmU0ZWNlMS8wIgpMS1BfU0VSVkVSOiBpbm4KbWF4X3VwdGltZTogMzIzMi45OApp
bml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNneiIKYm9v
dGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAotIGpvYj0vbGtwL3Nj
aGVkdWxlZC9sa3AtYmR3LWRlMS9ibG9nYmVuY2gtMVNTRC1idHJmcy1wZXJmb3JtYW5jZS1kZWJp
YW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6LTVjMDMzOGM2ODcwNmJlNTNiM2RjNDcyZTQzMDg5NjFj
MzZlNGVjZTEtMjAxNzA3MjItMjUzNjUtNmI4emdiLTAueWFtbAotIEFSQ0g9eDg2XzY0Ci0ga2Nv
bmZpZz14ODZfNjQtcmhlbC03LjIKLSBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIw
MTcwNzIyMDcKLSBjb21taXQ9NWMwMzM4YzY4NzA2YmU1M2IzZGM0NzJlNDMwODk2MWMzNmU0ZWNl
MQotIEJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC03LjIvZ2NjLTYvNWMwMzM4YzY4
NzA2YmU1M2IzZGM0NzJlNDMwODk2MWMzNmU0ZWNlMS92bWxpbnV6LTQuMTMuMC1yYzEtMDAwNjAt
ZzVjMDMzOGMKLSBjb25zb2xlPXR0eVMxLDExNTIwMCBjb25zb2xlPXR0eTAKLSBtYXhfdXB0aW1l
PTMyMzIKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L2Jsb2diZW5jaC8xU1NELWJ0cmZzLXBlcmZvcm1h
bmNlL2xrcC1iZHctZGUxL2RlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3oveDg2XzY0LXJoZWwt
Ny4yL2djYy02LzVjMDMzOGM2ODcwNmJlNTNiM2RjNDcyZTQzMDg5NjFjMzZlNGVjZTEvMAotIExL
UF9TRVJWRVI9aW5uCi0gZGVidWcKLSBhcGljPWRlYnVnCi0gc3lzcnFfYWx3YXlzX2VuYWJsZWQK
LSByY3VwZGF0ZS5yY3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCi0gbmV0LmlmbmFtZXM9MAotIHBy
aW50ay5kZXZrbXNnPW9uCi0gcGFuaWM9LTEKLSBzb2Z0bG9ja3VwX3BhbmljPTEKLSBubWlfd2F0
Y2hkb2c9cGFuaWMKLSBvb3BzPXBhbmljCi0gbG9hZF9yYW1kaXNrPTIKLSBwcm9tcHRfcmFtZGlz
az0wCi0gZHJiZC5taW5vcl9jb3VudD04Ci0gZWFybHlwcmludGs9dHR5UzEsMTE1MjAwCi0gc3lz
dGVtZC5sb2dfbGV2ZWw9ZXJyCi0gY29uc29sZT10dHlTMSwxMTUyMDAKLSBjb25zb2xlPXR0eTAK
LSBydwpsa3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJk
OiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC03LjIvZ2NjLTYvNWMwMzM4YzY4NzA2YmU1M2IzZGM0
NzJlNDMwODk2MWMzNmU0ZWNlMS9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVw
cy9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L2xrcF8yMDE3LTA1LTAxLmNneiwvb3NpbWFn
ZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3ovcnN5bmMtcm9vdGZzXzIwMTYtMTEt
MTUuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE2LTA4LTMxLmNnei9ydW4taXBj
b25maWdfMjAxNi0xMS0xNS5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTYtMDgt
MzEuY2d6L2ZzXzIwMTYtMTEtMTUuY2d6LC9vc2ltYWdlL3BrZy9kZWJpYW4teDg2XzY0LTIwMTYt
MDgtMzEuY2d6L2Jsb2diZW5jaC14ODZfNjRfMjAxNi0wOS0wMS5jZ3osL29zaW1hZ2UvZGVwcy9k
ZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L2lvc3RhdF8yMDE2LTExLTE1LmNneiwvb3NpbWFn
ZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNi0wOC0zMS5jZ3ovdHVyYm9zdGF0XzIwMTYtMTEtMTUu
Y2d6LC9vc2ltYWdlL3BrZy9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L3R1cmJvc3RhdC14
ODZfNjQtZDUyNTZiMl8yMDE3LTA2LTIwLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQt
MjAxNi0wOC0zMS5jZ3ovcGVyZl8yMDE3LTA3LTA3LmNneiwvb3NpbWFnZS9wa2cvZGViaWFuLXg4
Nl82NC0yMDE2LTA4LTMxLmNnei9wZXJmLXg4Nl82NC1hZjNjOGQ5ODUwOGRfMjAxNy0wNy0xMC5j
Z3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTYtMDgtMzEuY2d6L2h3XzIwMTYtMTEt
MTUuY2d6IgpzaXRlOiBpbm4KCiMhIC9sa3AvbGtwLy5zcmMtMjAxNzA3MjEtMTMzNTQyL2luY2x1
ZGUvc2l0ZS9pbm4KTEtQX0NHSV9QT1JUOiA4MApMS1BfQ0lGU19QT1JUOiAxMzkKb29tLWtpbGxl
cjogCndhdGNoZG9nOiAKCiMhIHJ1bnRpbWUgc3RhdHVzCnJlcGVhdF90bzogNQoKIyEgdXNlciBv
dmVycmlkZXMKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC03LjIvZ2NjLTYvNWMwMzM4
YzY4NzA2YmU1M2IzZGM0NzJlNDMwODk2MWMzNmU0ZWNlMS92bWxpbnV6LTQuMTMuMC1yYzEtMDAw
NjAtZzVjMDMzOGMiCmRlcXVldWVfdGltZTogMjAxNy0wNy0yMiAyMDo0MjoyOC40OTY1NzY4ODkg
KzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogJzEzMC4wMicK

--===============1417960035501871479==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZG1zZXR1cCByZW1vdmVfYWxsCndpcGVmcyAtYSAtLWZvcmNlIC9kZXYvc2RhCm1rZnMgLXQgYnRy
ZnMgL2Rldi9zZGEKbWtkaXIgLXAgL2ZzL3NkYQptb3VudCAtdCBidHJmcyAvZGV2L3NkYSAvZnMv
c2RhCgpmb3IgY3B1X2RpciBpbiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHVbMC05XSoKZG8K
CW9ubGluZV9maWxlPSIkY3B1X2RpciIvb25saW5lCglbIC1mICIkb25saW5lX2ZpbGUiIF0gJiYg
WyAiJChjYXQgIiRvbmxpbmVfZmlsZSIpIiAtZXEgMCBdICYmIGNvbnRpbnVlCgoJZmlsZT0iJGNw
dV9kaXIiL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoJWyAtZiAiJGZpbGUiIF0gJiYgZWNobyAi
JHNjYWxpbmdfZ292ZXJub3IiID4gIiRmaWxlIgpkb25lCgouL2Jsb2diZW5jaCAtZCAvZnMvc2Rh
Cg==

--===============1417960035501871479==--

