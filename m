Content-Type: multipart/mixed; boundary="===============7817954983145202215=="
MIME-Version: 1.0
From: kernel test robot <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: [mm/vmstat] 6cdb18ad98: -8.5% will-it-scale.per_thread_ops
Date: Wed, 06 Jan 2016 11:20:55 +0800
Message-ID: <8760z7fl60.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7817954983145202215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 6cdb18ad98a49f7e9b95d538a0614cde827404b8 ("mm/vmstat: fix overflow i=
n mod_zone_page_state()")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/ivb42/pread1=
/will-it-scale

commit: =

  cc28d6d80f6ab494b10f0e2ec949eacd610f66e3
  6cdb18ad98a49f7e9b95d538a0614cde827404b8

cc28d6d80f6ab494 6cdb18ad98a49f7e9b95d538a0 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2733943 =C2=B1  0%      -8.5%    2502129 =C2=B1  0%  will-it-scale.per_t=
hread_ops
      3410 =C2=B1  0%      -2.0%       3343 =C2=B1  0%  will-it-scale.time.=
system_time
    340.08 =C2=B1  0%     +19.7%     406.99 =C2=B1  0%  will-it-scale.time.=
user_time
  69882822 =C2=B1  2%     -24.3%   52926191 =C2=B1  5%  cpuidle.C1-IVT.time
    340.08 =C2=B1  0%     +19.7%     406.99 =C2=B1  0%  time.user_time
    491.25 =C2=B1  6%     -17.7%     404.25 =C2=B1  7%  numa-vmstat.node0.n=
r_alloc_batch
      2799 =C2=B1 20%     -36.6%       1776 =C2=B1  0%  numa-vmstat.node0.n=
r_mapped
    630.00 =C2=B1140%    +244.4%       2169 =C2=B1  1%  numa-vmstat.node1.n=
r_inactive_anon
      6440 =C2=B1 11%     -15.5%       5440 =C2=B1 16%  numa-vmstat.node1.n=
r_slab_reclaimable
     11204 =C2=B1 20%     -36.6%       7106 =C2=B1  0%  numa-meminfo.node0.=
Mapped
      1017 =C2=B1173%    +450.3%       5598 =C2=B1 15%  numa-meminfo.node1.=
AnonHugePages
      2521 =C2=B1140%    +244.1%       8678 =C2=B1  1%  numa-meminfo.node1.=
Inactive(anon)
     25762 =C2=B1 11%     -15.5%      21764 =C2=B1 16%  numa-meminfo.node1.=
SReclaimable
     70103 =C2=B1  9%      -9.8%      63218 =C2=B1  9%  numa-meminfo.node1.=
Slab
      2.29 =C2=B1  3%     +32.8%       3.04 =C2=B1  4%  perf-profile.cycles=
-pp.atime_needs_update.touch_atime.shmem_file_read_iter.__vfs_read.vfs_read
      1.10 =C2=B1  3%     -27.4%       0.80 =C2=B1  5%  perf-profile.cycles=
-pp.current_fs_time.atime_needs_update.touch_atime.shmem_file_read_iter.__v=
fs_read
      2.33 =C2=B1  2%     -13.0%       2.02 =C2=B1  3%  perf-profile.cycles=
-pp.fput.entry_SYSCALL_64_fastpath
      0.89 =C2=B1  2%     +29.6%       1.15 =C2=B1  7%  perf-profile.cycles=
-pp.fsnotify.vfs_read.sys_pread64.entry_SYSCALL_64_fastpath
      2.85 =C2=B1  2%     +45.4%       4.14 =C2=B1  5%  perf-profile.cycles=
-pp.touch_atime.shmem_file_read_iter.__vfs_read.vfs_read.sys_pread64
     63939 =C2=B1  0%     +17.9%      75370 =C2=B1 15%  sched_debug.cfs_rq:=
/.exec_clock.25
     72.50 =C2=B1 73%     -63.1%      26.75 =C2=B1 19%  sched_debug.cfs_rq:=
/.load_avg.1
     34.00 =C2=B1 62%     -61.8%      13.00 =C2=B1 12%  sched_debug.cfs_rq:=
/.load_avg.14
     18.00 =C2=B1 11%     -11.1%      16.00 =C2=B1 10%  sched_debug.cfs_rq:=
/.load_avg.20
     14.75 =C2=B1 41%    +122.0%      32.75 =C2=B1 26%  sched_debug.cfs_rq:=
/.load_avg.25
    278.88 =C2=B1 11%     +18.8%     331.25 =C2=B1  7%  sched_debug.cfs_rq:=
/.load_avg.max
     51.89 =C2=B1 11%     +13.6%      58.97 =C2=B1  4%  sched_debug.cfs_rq:=
/.load_avg.stddev
      7.25 =C2=B1  5%    +255.2%      25.75 =C2=B1 53%  sched_debug.cfs_rq:=
/.runnable_load_avg.25
     28.50 =C2=B1  1%     +55.3%      44.25 =C2=B1 46%  sched_debug.cfs_rq:=
/.runnable_load_avg.7
     72.50 =C2=B1 73%     -63.1%      26.75 =C2=B1 19%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.1
     34.00 =C2=B1 62%     -61.8%      13.00 =C2=B1 12%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.14
     18.00 =C2=B1 11%     -11.1%      16.00 =C2=B1 10%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.20
     14.75 =C2=B1 41%    +122.0%      32.75 =C2=B1 25%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.25
    279.29 =C2=B1 11%     +19.1%     332.67 =C2=B1  7%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.max
     52.01 =C2=B1 11%     +13.8%      59.18 =C2=B1  4%  sched_debug.cfs_rq:=
/.tg_load_avg_contrib.stddev
    359.50 =C2=B1  6%     +41.5%     508.75 =C2=B1 22%  sched_debug.cfs_rq:=
/.util_avg.25
    206.25 =C2=B1 16%     -13.1%     179.25 =C2=B1 11%  sched_debug.cfs_rq:=
/.util_avg.40
    688.75 =C2=B1  1%     +18.5%     816.00 =C2=B1  1%  sched_debug.cfs_rq:=
/.util_avg.7
    953467 =C2=B1  1%     -17.9%     782518 =C2=B1 10%  sched_debug.cpu.avg=
_idle.5
      9177 =C2=B1 43%     +73.9%      15957 =C2=B1 29%  sched_debug.cpu.nr_=
switches.13
      7365 =C2=B1 19%     -35.4%       4755 =C2=B1 11%  sched_debug.cpu.nr_=
switches.20
     12203 =C2=B1 28%     -62.2%       4608 =C2=B1  9%  sched_debug.cpu.nr_=
switches.22
      1868 =C2=B1 49%     -51.1%     913.50 =C2=B1 27%  sched_debug.cpu.nr_=
switches.27
      2546 =C2=B1 56%     -70.0%     763.00 =C2=B1 18%  sched_debug.cpu.nr_=
switches.28
      3003 =C2=B1 78%     -77.9%     663.00 =C2=B1 18%  sched_debug.cpu.nr_=
switches.33
      1820 =C2=B1 19%     +68.0%       3058 =C2=B1 33%  sched_debug.cpu.nr_=
switches.8
     -4.00 =C2=B1-35%    -156.2%       2.25 =C2=B1 85%  sched_debug.cpu.nr_=
uninterruptible.11
      4.00 =C2=B1133%    -187.5%      -3.50 =C2=B1-24%  sched_debug.cpu.nr_=
uninterruptible.17
      1.75 =C2=B1 74%    -214.3%      -2.00 =C2=B1-127%  sched_debug.cpu.nr=
_uninterruptible.25
      0.00 =C2=B1  2%      +Inf%       4.00 =C2=B1 39%  sched_debug.cpu.nr_=
uninterruptible.26
      2.50 =C2=B1 44%    -110.0%      -0.25 =C2=B1-591%  sched_debug.cpu.nr=
_uninterruptible.27
      1.33 =C2=B1154%    -287.5%      -2.50 =C2=B1-72%  sched_debug.cpu.nr_=
uninterruptible.32
     -1.00 =C2=B1-244%    -250.0%       1.50 =C2=B1251%  sched_debug.cpu.nr=
_uninterruptible.45
      3.50 =C2=B1 82%    -135.7%      -1.25 =C2=B1-66%  sched_debug.cpu.nr_=
uninterruptible.46
     -4.50 =C2=B1-40%    -133.3%       1.50 =C2=B1242%  sched_debug.cpu.nr_=
uninterruptible.6
     -3.00 =C2=B1-78%    -433.3%      10.00 =C2=B1150%  sched_debug.cpu.nr_=
uninterruptible.7
     10124 =C2=B1 39%     +65.8%      16783 =C2=B1 23%  sched_debug.cpu.sch=
ed_count.13
     12833 =C2=B1 23%     -54.6%       5823 =C2=B1 32%  sched_debug.cpu.sch=
ed_count.22
      1934 =C2=B1 48%     -49.8%     971.00 =C2=B1 26%  sched_debug.cpu.sch=
ed_count.27
      3065 =C2=B1 76%     -76.2%     728.25 =C2=B1 16%  sched_debug.cpu.sch=
ed_count.33
      2098 =C2=B1 24%    +664.1%      16030 =C2=B1126%  sched_debug.cpu.sch=
ed_count.5
      4653 =C2=B1 33%     +83.4%       8536 =C2=B1 25%  sched_debug.cpu.sch=
ed_goidle.15
      5061 =C2=B1 41%     -61.1%       1968 =C2=B1 13%  sched_debug.cpu.sch=
ed_goidle.22
    834.75 =C2=B1 57%     -60.2%     332.00 =C2=B1 35%  sched_debug.cpu.sch=
ed_goidle.27
    719.00 =C2=B1 71%     -63.3%     264.00 =C2=B1 19%  sched_debug.cpu.sch=
ed_goidle.28
    943.25 =C2=B1115%     -76.3%     223.25 =C2=B1 21%  sched_debug.cpu.sch=
ed_goidle.33
      2520 =C2=B1 26%    +112.4%       5353 =C2=B1 19%  sched_debug.cpu.ttw=
u_count.13
      5324 =C2=B1 22%     -49.7%       2679 =C2=B1 45%  sched_debug.cpu.ttw=
u_count.22
      2926 =C2=B1 38%    +231.1%       9690 =C2=B1 37%  sched_debug.cpu.ttw=
u_count.23
    277.25 =C2=B1 18%    +166.7%     739.50 =C2=B1 83%  sched_debug.cpu.ttw=
u_count.27
      1247 =C2=B1 61%     -76.6%     292.25 =C2=B1 11%  sched_debug.cpu.ttw=
u_count.28
    751.75 =C2=B1 22%    +183.9%       2134 =C2=B1  9%  sched_debug.cpu.ttw=
u_count.3
      6405 =C2=B1 97%     -75.9%       1542 =C2=B1 48%  sched_debug.cpu.ttw=
u_count.41
      5582 =C2=B1104%     -76.2%       1327 =C2=B1 55%  sched_debug.cpu.ttw=
u_count.43
      3201 =C2=B1 26%     -75.1%     796.75 =C2=B1 18%  sched_debug.cpu.ttw=
u_local.22


ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

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
Ying Huang

--===============7817954983145202215==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1h
LW51bWFzdGF0OiAKICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3Rh
dDogCiAgcHJvYy1zdGF0OgogICAgaW50ZXJ2YWw6IDEwCiAgbWVtaW5mbzogCiAgc2xhYmluZm86
IAogIGludGVycnVwdHM6IAogIGxvY2tfc3RhdDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGly
cXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAgZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVp
ZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRf
ZGVidWc6CiAgICBpbnRlcnZhbDogNjAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKZGVm
YXVsdC13YXRjaGRvZ3M6CiAgb29tLWtpbGxlcjogCiAgd2F0Y2hkb2c6IApjb21taXQ6IDZjZGIx
OGFkOThhNDlmN2U5Yjk1ZDUzOGEwNjE0Y2RlODI3NDA0YjgKbW9kZWw6IEl2eXRvd24gSXZ5IEJy
aWRnZS1FUApucl9jcHU6IDQ4Cm1lbW9yeTogNjRHCnN3YXBfcGFydGl0aW9uczogTEFCRUw9U1dB
UApyb290ZnNfcGFydGl0aW9uOiBMQUJFTD1MS1AtUk9PVEZTCmNhdGVnb3J5OiBiZW5jaG1hcmsK
cGVyZi1wcm9maWxlOgogIGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IHByZWFkMQpx
dWV1ZTogYmlzZWN0CnRlc3Rib3g6IGl2YjQyCnRib3hfZ3JvdXA6IGl2YjQyCmtjb25maWc6IHg4
Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wMS0wNSAwNTowMDo0MC41MTE3NDQ2NDEgKzA4
OjAwCmlkOiAzNzRlNjA1ZDNjYmYxMDI5NDEwMzFkZTY2NDBiOWVkZjQyNGU1NDA5CnVzZXI6IGxr
cApjb21waWxlcjogZ2NjLTQuOQpoZWFkX2NvbW1pdDogZjQzNjZhYWQxOGI1MzFjZjE1MDU3Zjcw
ZTNjZWEwOWZlZjg4YzMxMApiYXNlX2NvbW1pdDogMTY4MzA5ODU1YTdkMWUxNmRiNzUxZTljNjQ3
MTE5ZmUyZDJkYzg3OApicmFuY2g6IGludGVybmFsLWV5d2EvbWFzdGVyCnJvb3RmczogZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvd2lsbC1pdC1zY2Fs
ZS9wZXJmb3JtYW5jZS1wcmVhZDEvaXZiNDIvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94
ODZfNjQtcmhlbC9nY2MtNC45LzZjZGIxOGFkOThhNDlmN2U5Yjk1ZDUzOGEwNjE0Y2RlODI3NDA0
YjgvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9pdmI0Mi9iaXNlY3Rfd2lsbC1pdC1zY2Fs
ZS1wZXJmb3JtYW5jZS1wcmVhZDEtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQt
cmhlbC02Y2RiMThhZDk4YTQ5ZjdlOWI5NWQ1MzhhMDYxNGNkZTgyNzQwNGI4LTIwMTYwMTA1LTQ0
MzM0LTJjZHczaS0wLnlhbWwiCm1heF91cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGVi
aWFuL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJv
b3Q9L2Rldi9yYW0wCi0gdXNlcj1sa3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvaXZiNDIvYmlzZWN0
X3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2UtcHJlYWQxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0w
Ny5jZ3oteDg2XzY0LXJoZWwtNmNkYjE4YWQ5OGE0OWY3ZTliOTVkNTM4YTA2MTRjZGU4Mjc0MDRi
OC0yMDE2MDEwNS00NDMzNC0yY2R3M2ktMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4
Nl82NC1yaGVsCi0gYnJhbmNoPWludGVybmFsLWV5d2EvbWFzdGVyCi0gY29tbWl0PTZjZGIxOGFk
OThhNDlmN2U5Yjk1ZDUzOGEwNjE0Y2RlODI3NDA0YjgKLSBCT09UX0lNQUdFPS9wa2cvbGludXgv
eDg2XzY0LXJoZWwvZ2NjLTQuOS82Y2RiMThhZDk4YTQ5ZjdlOWI5NWQ1MzhhMDYxNGNkZTgyNzQw
NGI4L3ZtbGludXotNC40LjAtcmM3LTAwMDEzLWc2Y2RiMThhCi0gbWF4X3VwdGltZT0xNTAwCi0g
UkVTVUxUX1JPT1Q9L3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLXByZWFkMS9pdmI0
Mi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNmNkYjE4
YWQ5OGE0OWY3ZTliOTVkNTM4YTA2MTRjZGU4Mjc0MDRiOC8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8
Mi0KCgogIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBk
ZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3Rh
bGxfdGltZW91dD0xMDAKICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9n
PXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNv
bGU9dHR5UzAsMTE1MjAwIGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6
ICIvbGtwL2xrcC9sa3AteDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4
Nl82NC1yaGVsL2djYy00LjkvNmNkYjE4YWQ5OGE0OWY3ZTliOTVkNTM4YTA2MTRjZGU4Mjc0MDRi
OC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIw
MTUtMDItMDcuY2d6L2xrcC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDIt
MDcuY2d6L3J1bi1pcGNvbmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUt
MDItMDcuY2d6L3R1cmJvc3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL2xr
cC9iZW5jaG1hcmtzL3dpbGwtaXQtc2NhbGUuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82Y2RiMThhZDk4YTQ5ZjdlOWI5NWQ1MzhhMDYx
NGNkZTgyNzQwNGI4L2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzZjZGIxOGFkOThhNDlmN2U5Yjk1ZDUzOGEwNjE0
Y2RlODI3NDA0Yjgvdm1saW51ei00LjQuMC1yYzctMDAwMTMtZzZjZGIxOGEiCmRlcXVldWVfdGlt
ZTogMjAxNi0wMS0wNSAwNTowNjo0Ni40MzQzMTQ4NjIgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNo
ZWQKbG9hZGF2ZzogMzguNTUgMTguNDYgNy4yOCAxLzUwNiA5Mjk4CnN0YXJ0X3RpbWU6ICcxNDUx
OTQxNjUwJwplbmRfdGltZTogJzE0NTE5NDE5NjAnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIw
MTYwMTA0LTE2NTIwNCIK

--===============7817954983145202215==
Content-Type: application/x-sh
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.sh"

MjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDEtMDUgMDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEt
MDUgMDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDUg
MDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6
MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6MDc6MjkgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoy
OSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDUg
MDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6
MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6MDc6
MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAx
LTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMS0wNSAwNTowNzoyOSBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDEtMDUgMDU6MDc6MjkgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1
IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3
OjI5IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAxLTA1IDA1OjA3OjI5IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAxLTA1IDA1OjA3OjMwIC4vcnVudGVzdC5weSBwcmVhZDEgMjUgYm90aCAxIDEyIDI0IDM2
IDQ4Cg==

--===============7817954983145202215==--

