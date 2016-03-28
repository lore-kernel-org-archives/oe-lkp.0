Content-Type: multipart/mixed; boundary="===============6787545147414768981=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm] 56a17b8836: No primary change, will-it-scale.time.percent_of_cpu_this_job_got +41.4% change
Date: Mon, 28 Mar 2016 14:17:06 +0800
Message-ID: <20160328061705.GB3882@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6787545147414768981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that will-it-scale.time.percent_of_cpu_this_job_got +41.4% =
change
with your commit.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 56a17b8836398ffab52c00dda8442f1680dc251b ("mm: temporarily mark THP =
broken")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-sbx04/ma=
lloc1/will-it-scale

commit: =

  122afea9626ab3f717b250a8dd3d5ebf57cdb56c
  56a17b8836398ffab52c00dda8442f1680dc251b

122afea9626ab3f7 56a17b8836398ffab52c00dda8 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     78370 =C2=B1  0%      +1.6%      79638 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
     39117 =C2=B1  0%      +7.3%      41971 =C2=B1  0%  will-it-scale.per_t=
hread_ops
     36425 =C2=B1  6%     -74.4%       9327 =C2=B1  0%  will-it-scale.time.=
maximum_resident_set_size
   7633416 =C2=B1  0%     +60.8%   12272010 =C2=B1  0%  will-it-scale.time.=
minor_page_faults
     67.00 =C2=B1  1%     +41.4%      94.75 =C2=B1  0%  will-it-scale.time.=
percent_of_cpu_this_job_got
    200.68 =C2=B1  0%     +38.5%     278.00 =C2=B1  0%  will-it-scale.time.=
system_time
      7.88 =C2=B1  2%     +98.5%      15.65 =C2=B1  1%  will-it-scale.time.=
user_time
   3902893 =C2=B1  5%    +302.9%   15723910 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
    150273 =C2=B1  4%     +34.7%     202476 =C2=B1  8%  softirqs.RCU
     27428 =C2=B1  4%    +277.4%     103508 =C2=B1  0%  vmstat.system.cs
     20080 =C2=B1  3%     +93.3%      38820 =C2=B1  1%  vmstat.system.in
     48628 =C2=B1  2%     -15.6%      41041 =C2=B1  0%  meminfo.Active(anon)
      7893 =C2=B1 15%    -100.0%       0.00 =C2=B1 -1%  meminfo.AnonHugePag=
es
     36334 =C2=B1  3%     -21.2%      28619 =C2=B1  0%  meminfo.AnonPages
     33788 =C2=B1  0%     +17.9%      39840 =C2=B1  0%  numa-vmstat.node0.n=
uma_interleave
      3801 =C2=B1 31%     -46.6%       2028 =C2=B1 36%  numa-vmstat.node1.n=
r_active_anon
    326.25 =C2=B1  3%     -15.9%     274.50 =C2=B1  2%  numa-vmstat.node1.n=
r_alloc_batch
      3693 =C2=B1 10%     -49.3%       1870 =C2=B1 28%  numa-vmstat.node2.n=
r_anon_pages
      0.94 =C2=B1  5%     +11.7%       1.05 =C2=B1  3%  perf-profile.cycles=
.___might_sleep.kmem_cache_alloc.mmap_region.do_mmap.vm_mmap_pgoff
      1.18 =C2=B1  2%     -11.3%       1.04 =C2=B1  1%  perf-profile.cycles=
.___might_sleep.unmap_page_range.unmap_single_vma.unmap_vmas.unmap_region
      1.03 =C2=B1  1%      -7.5%       0.95 =C2=B1  4%  perf-profile.cycles=
.__alloc_pages_nodemask.alloc_pages_current.pte_alloc_one.__pte_alloc.handl=
e_mm_fault
      1.14 =C2=B1  1%      -7.7%       1.05 =C2=B1  3%  perf-profile.cycles=
.alloc_pages_current.pte_alloc_one.__pte_alloc.handle_mm_fault.__do_page_fa=
ult
   1647719 =C2=B1  3%    +271.3%    6117589 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_read_failed.__do_page_fault.do_page_fault.page_fault
   1356059 =C2=B1  5%    +315.7%    5636837 =C2=B1  0%  latency_stats.hits.=
call_rwsem_down_write_failed.vm_munmap.SyS_munmap.entry_SYSCALL_64_fastpath
      8333 =C2=B1 21%     -75.6%       2032 =C2=B1  8%  latency_stats.sum.c=
all_rwsem_down_read_failed.do_exit.do_group_exit.SyS_exit_group.entry_SYSCA=
LL_64_fastpath
     93349 =C2=B1 11%     -71.7%      26423 =C2=B1  7%  latency_stats.sum.c=
all_rwsem_down_read_failed.do_exit.do_group_exit.get_signal.do_signal.exit_=
to_usermode_loop.prepare_exit_to_usermode.retint_user
     92440 =C2=B1 30%     -69.1%      28576 =C2=B1 17%  latency_stats.sum.c=
all_rwsem_down_read_failed.do_exit.do_group_exit.get_signal.do_signal.exit_=
to_usermode_loop.syscall_return_slowpath.int_ret_from_sys_call
    152444 =C2=B1  4%     -67.8%      49052 =C2=B1  3%  latency_stats.sum.c=
all_rwsem_down_write_failed.SyS_mprotect.entry_SYSCALL_64_fastpath
     36425 =C2=B1  6%     -74.4%       9327 =C2=B1  0%  time.maximum_reside=
nt_set_size
   7633416 =C2=B1  0%     +60.8%   12272010 =C2=B1  0%  time.minor_page_fau=
lts
     67.00 =C2=B1  1%     +41.4%      94.75 =C2=B1  0%  time.percent_of_cpu=
_this_job_got
    200.68 =C2=B1  0%     +38.5%     278.00 =C2=B1  0%  time.system_time
      7.88 =C2=B1  2%     +98.5%      15.65 =C2=B1  1%  time.user_time
   3902893 =C2=B1  5%    +302.9%   15723910 =C2=B1  0%  time.voluntary_cont=
ext_switches
    983.75 =C2=B1 31%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node0.=
AnonHugePages
     39941 =C2=B1 10%     -18.2%      32681 =C2=B1  9%  numa-meminfo.node1.=
Active
     15187 =C2=B1 31%     -46.5%       8119 =C2=B1 36%  numa-meminfo.node1.=
Active(anon)
    676.00 =C2=B1 66%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node1.=
AnonHugePages
      5403 =C2=B1 20%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node2.=
AnonHugePages
     14772 =C2=B1 10%     -49.3%       7486 =C2=B1 28%  numa-meminfo.node2.=
AnonPages
    880.75 =C2=B1 48%    -100.0%       0.00 =C2=B1 -1%  numa-meminfo.node3.=
AnonHugePages
     12167 =C2=B1  2%     -15.7%      10260 =C2=B1  0%  proc-vmstat.nr_acti=
ve_anon
      1193 =C2=B1  0%     -11.6%       1054 =C2=B1  1%  proc-vmstat.nr_allo=
c_batch
      9094 =C2=B1  3%     -21.3%       7155 =C2=B1  0%  proc-vmstat.nr_anon=
_pages
  49373529 =C2=B1  1%     -29.1%   35001216 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
 2.245e+08 =C2=B1  0%     -15.2%  1.905e+08 =C2=B1  0%  proc-vmstat.pgalloc=
_normal
 2.739e+08 =C2=B1  0%     -17.7%  2.255e+08 =C2=B1  0%  proc-vmstat.pgfree
    113422 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.thp_fau=
lt_alloc
    113402 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.thp_spl=
it_page
     22.63 =C2=B1  0%      +3.0%      23.32 =C2=B1  0%  turbostat.%Busy
    652.50 =C2=B1  0%      +2.4%     668.00 =C2=B1  0%  turbostat.Avg_MHz
     27.60 =C2=B1  7%     +50.1%      41.43 =C2=B1  0%  turbostat.CPU%c1
      0.75 =C2=B1 21%     -97.7%       0.02 =C2=B1 47%  turbostat.CPU%c3
     49.02 =C2=B1  3%     -28.1%      35.23 =C2=B1  0%  turbostat.CPU%c7
    121.98 =C2=B1  0%      +6.2%     129.50 =C2=B1  0%  turbostat.CorWatt
     37.39 =C2=B1  2%     -19.0%      30.27 =C2=B1  1%  turbostat.Pkg%pc2
    176.87 =C2=B1  0%      +4.2%     184.25 =C2=B1  0%  turbostat.PkgWatt
  70837840 =C2=B1 23%    +157.4%  1.823e+08 =C2=B1  6%  cpuidle.C1-SNB.time
    352446 =C2=B1111%   +1438.3%    5421651 =C2=B1  3%  cpuidle.C1-SNB.usage
  68045347 =C2=B1  7%    +114.8%  1.462e+08 =C2=B1  1%  cpuidle.C1E-SNB.time
    152018 =C2=B1 29%    +932.9%    1570128 =C2=B1  9%  cpuidle.C1E-SNB.usa=
ge
  36961996 =C2=B1 23%    +550.6%  2.405e+08 =C2=B1  5%  cpuidle.C3-SNB.time
     87756 =C2=B1 24%    +762.1%     756587 =C2=B1  4%  cpuidle.C3-SNB.usage
   3624705 =C2=B1  3%    +168.4%    9729062 =C2=B1  0%  cpuidle.C7-SNB.usage
  34086233 =C2=B1 14%     +30.4%   44449058 =C2=B1 13%  cpuidle.POLL.time
     71342 =C2=B1  5%     +92.0%     136968 =C2=B1  3%  cpuidle.POLL.usage
     55973 =C2=B1  3%     +11.6%      62441 =C2=B1  2%  sched_debug.cpu.nr_=
load_updates.avg
     23002 =C2=B1  3%     +14.0%      26212 =C2=B1  1%  sched_debug.cpu.nr_=
load_updates.stddev
     56335 =C2=B1  8%    +286.9%     217982 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
    224611 =C2=B1 21%    +358.7%    1030323 =C2=B1  3%  sched_debug.cpu.nr_=
switches.max
      6852 =C2=B1  4%    +124.6%      15390 =C2=B1 26%  sched_debug.cpu.nr_=
switches.min
     57323 =C2=B1 21%    +405.8%     289971 =C2=B1  2%  sched_debug.cpu.nr_=
switches.stddev
    155999 =C2=B1  2%    +104.1%     318341 =C2=B1  0%  sched_debug.cpu.sch=
ed_count.avg
      7095 =C2=B1  5%    +120.1%      15617 =C2=B1 27%  sched_debug.cpu.sch=
ed_count.min
     27854 =C2=B1  8%    +290.2%     108690 =C2=B1  0%  sched_debug.cpu.sch=
ed_goidle.avg
    111721 =C2=B1 21%    +360.8%     514811 =C2=B1  3%  sched_debug.cpu.sch=
ed_goidle.max
      3125 =C2=B1  6%    +140.9%       7528 =C2=B1 27%  sched_debug.cpu.sch=
ed_goidle.min
     28656 =C2=B1 21%    +406.0%     145007 =C2=B1  2%  sched_debug.cpu.sch=
ed_goidle.stddev
     28531 =C2=B1  8%    +289.8%     111208 =C2=B1  0%  sched_debug.cpu.ttw=
u_count.avg
    113428 =C2=B1 20%    +362.5%     524580 =C2=B1  3%  sched_debug.cpu.ttw=
u_count.max
      2957 =C2=B1 17%    +152.7%       7472 =C2=B1 22%  sched_debug.cpu.ttw=
u_count.min
     29259 =C2=B1 20%    +403.8%     147410 =C2=B1  2%  sched_debug.cpu.ttw=
u_count.stddev


lkp-sbx04: Sandy Bridge-EX
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
Xiaolong Ye

--===============6787545147414768981==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogd2lsbC1pdC1zY2FsZQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRl
LW1vbml0b3IKICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2
bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86
IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZv
OiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0
YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5m
c3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1l
dGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBw
ZXJmb3JtYW5jZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzog
CmNvbW1pdDogNTZhMTdiODgzNjM5OGZmYWI1MmMwMGRkYTg0NDJmMTY4MGRjMjUxYgptb2RlbDog
U2FuZHkgQnJpZGdlLUVYCm5yX2NwdTogNjQKbWVtb3J5OiA2NEcKbnJfc3NkX3BhcnRpdGlvbnM6
IDcKc3NkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLUlOVEVMX1NTRFNDMiotcGFy
dDEiCnN3YXBfcGFydGl0aW9uczogCmNhdGVnb3J5OiBiZW5jaG1hcmsKcGVyZi1wcm9maWxlOgog
IGZyZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IG1hbGxvYzEKcXVldWU6IGJpc2VjdAp0
ZXN0Ym94OiBsa3Atc2J4MDQKdGJveF9ncm91cDogbGtwLXNieDA0Cmtjb25maWc6IHg4Nl82NC1y
aGVsCmVucXVldWVfdGltZTogMjAxNi0wMy0yNyAxODoyMTo0MC42NTM0NDMwNzUgKzA4OjAwCmNv
bXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnegppZDog
ODI5YTU3NzQwNTY5NTU2YzUzNjFjOGRhNmVkMmE0MTYyYjhiODEwNAp1c2VyOiBsa3AKaGVhZF9j
b21taXQ6IGFjNzM2MmM5YTFkMGU2Y2RmMGVjMmY2ZTcxNGUyMTRjZDA4MzhkMTMKYmFzZV9jb21t
aXQ6IGI1NjJlNDRmNTA3ZTg2M2M2NzkyOTQ2ZTRlMWIxNDQ5ZmJiYWM4NWQKYnJhbmNoOiBpbnRl
cm5hbC1leXdhL21hc3RlcgpyZXN1bHRfcm9vdDogIi9yZXN1bHQvd2lsbC1pdC1zY2FsZS9wZXJm
b3JtYW5jZS1tYWxsb2MxL2xrcC1zYngwNC9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4
Nl82NC1yaGVsL2djYy00LjkvNTZhMTdiODgzNjM5OGZmYWI1MmMwMGRkYTg0NDJmMTY4MGRjMjUx
Yi8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1zYngwNC9iaXNlY3Rfd2lsbC1pdC1z
Y2FsZS1wZXJmb3JtYW5jZS1tYWxsb2MxLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2
XzY0LXJoZWwtNTZhMTdiODgzNjM5OGZmYWI1MmMwMGRkYTg0NDJmMTY4MGRjMjUxYi0yMDE2MDMy
Ny0xOTM2Mi14YjIwa3AtMC55YW1sIgptYXhfdXB0aW1lOiAxNTAwCmluaXRyZDogIi9vc2ltYWdl
L2RlYmlhbi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoK
LSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2xrcC1zYngw
NC9iaXNlY3Rfd2lsbC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1tYWxsb2MxLWRlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwtNTZhMTdiODgzNjM5OGZmYWI1MmMwMGRkYTg0NDJm
MTY4MGRjMjUxYi0yMDE2MDMyNy0xOTM2Mi14YjIwa3AtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBr
Y29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWludGVybmFsLWV5d2EvbWFzdGVyCi0gY29tbWl0
PTU2YTE3Yjg4MzYzOThmZmFiNTJjMDBkZGE4NDQyZjE2ODBkYzI1MWIKLSBCT09UX0lNQUdFPS9w
a2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS81NmExN2I4ODM2Mzk4ZmZhYjUyYzAwZGRhODQ0
MmYxNjgwZGMyNTFiL3ZtbGludXotNC40LjAtMDY0MTEtZzU2YTE3YjgKLSBtYXhfdXB0aW1lPTE1
MDAKLSBSRVNVTFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtbWFsbG9j
MS9sa3Atc2J4MDQvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2Mt
NC45LzU2YTE3Yjg4MzYzOThmZmFiNTJjMDBkZGE4NDQyZjE2ODBkYzI1MWIvMAotIExLUF9TRVJW
RVI9aW5uCi0gfDItCgoKICBlYXJseXByaW50az10dHlTMCwxMTUyMDAgc3lzdGVtZC5sb2dfbGV2
ZWw9ZXJyCiAgZGVidWcgYXBpYz1kZWJ1ZyBzeXNycV9hbHdheXNfZW5hYmxlZCByY3VwZGF0ZS5y
Y3VfY3B1X3N0YWxsX3RpbWVvdXQ9MTAwCiAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5t
aV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNr
PTAKICBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbAoKICBydwps
a3BfaW5pdHJkOiAiL2xrcC9sa3AvbGtwLXg4Nl82NC5jZ3oiCm1vZHVsZXNfaW5pdHJkOiAiL3Br
Zy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzU2YTE3Yjg4MzYzOThmZmFiNTJjMDBkZGE4NDQy
ZjE2ODBkYzI1MWIvbW9kdWxlcy5jZ3oiCmJtX2luaXRyZDogIi9vc2ltYWdlL2RlcHMvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei9sa3AuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82
NC0yMDE1LTAyLTA3LmNnei9ydW4taXBjb25maWcuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei90dXJib3N0YXQuY2d6LC9sa3AvYmVuY2htYXJrcy90dXJib3N0
YXQuY2d6LC9vc2ltYWdlL2RlcHMvZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei93aWxsLWl0
LXNjYWxlLmNneiwvbGtwL2JlbmNobWFya3Mvd2lsbC1pdC1zY2FsZS5jZ3osL2xrcC9iZW5jaG1h
cmtzL3dpbGwtaXQtc2NhbGUteDg2XzY0LmNneiIKbGludXhfaGVhZGVyc19pbml0cmQ6ICIvcGtn
L2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNTZhMTdiODgzNjM5OGZmYWI1MmMwMGRkYTg0NDJm
MTY4MGRjMjUxYi9saW51eC1oZWFkZXJzLmNneiIKcmVwZWF0X3RvOiAyCmtlcm5lbDogIi9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS81NmExN2I4ODM2Mzk4ZmZhYjUyYzAwZGRhODQ0MmYx
NjgwZGMyNTFiL3ZtbGludXotNC40LjAtMDY0MTEtZzU2YTE3YjgiCmRlcXVldWVfdGltZTogMjAx
Ni0wMy0yNyAxODozODoyOS40MjkwNDAyNTUgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9h
ZGF2ZzogNDYuMjggMjAuOTYgOC4xOSAxLzY0OCAxMTU0NApzdGFydF90aW1lOiAnMTQ1OTA3NTE5
MycKZW5kX3RpbWU6ICcxNDU5MDc1NTAyJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDMy
NS0yMDU4MTciCg==

--===============6787545147414768981==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0yNyAxODozOTo1MSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMjcgMTg6Mzk6NTEgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUxIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MjcgMTg6Mzk6NTEgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUxIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcg
MTg6Mzk6NTEgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUxIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6
Mzk6NTEgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTEgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTI3IDE4OjM5OjUxIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1
MSBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTEgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTI3IDE4OjM5OjUxIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MSBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcg
MTg6Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6
Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6
NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3
IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6
Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6
NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUzL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTIg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTIgZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTI3IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU2MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMjcgMTg6Mzk6NTIgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTI3
IDE4OjM5OjUyIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2
My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODoz
OTo1MiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0yNyAxODozOTo1MyAuL3J1bnRlc3QucHkgbWFs
bG9jMSAxNiBib3RoIDEgOCAxNiAyNCAzMiA0OCA2NAo=

--===============6787545147414768981==--

