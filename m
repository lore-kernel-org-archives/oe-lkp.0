Content-Type: multipart/mixed; boundary="===============3819492516382404108=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [NFS] a08a8cd375d: +1.5% will-it-scale.per_process_ops
Date: Mon, 30 Mar 2015 14:29:49 +0800
Message-ID: <1427696989.17170.83.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3819492516382404108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit a08a8cd375db9769588257e7782f6b6b68561b88 ("NFS: Add attribute update=
 barriers to NFS writebacks")


testbox/testcase/testparams: ivb42/will-it-scale/performance-pthread_mutex2

f5062003465c20cf  a08a8cd375db9769588257e778  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

 2.012e+08 =C2=B1  0%      +1.5%  2.042e+08 =C2=B1  0%  will-it-scale.per_p=
rocess_ops
      3.81 =C2=B1  0%      +1.6%       3.88 =C2=B1  0%  turbostat.RAMWatt
       387 =C2=B1  7%     +13.7%        441 =C2=B1  6%  numa-vmstat.node0.n=
r_page_table_pages
      5639 =C2=B1 15%     -15.1%       4788 =C2=B1  0%  meminfo.AnonHugePag=
es
      1552 =C2=B1  7%     +13.7%       1765 =C2=B1  6%  numa-meminfo.node0.=
PageTables
     29.40 =C2=B1 21%     +57.6%      46.32 =C2=B1  3%  perf-profile.cpu-cy=
cles.start_secondary
     10.72 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
     10.72 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.cpu_startup_entry.rest_init.start_kernel.x86_64_start_reservations.x86=
_64_start_kernel
      1.23 =C2=B1 17%     -29.1%       0.87 =C2=B1 19%  perf-profile.cpu-cy=
cles.cmd_record._start.main.__libc_start_main
      1.27 =C2=B1 17%     -29.4%       0.89 =C2=B1 16%  perf-profile.cpu-cy=
cles.main.__libc_start_main
      1.27 =C2=B1 17%     -31.2%       0.87 =C2=B1 19%  perf-profile.cpu-cy=
cles._start.main.__libc_start_main
     25.76 =C2=B1 19%     +66.1%      42.79 =C2=B1  5%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.start_secondary
      1.39 =C2=B1 16%     -30.3%       0.97 =C2=B1 11%  perf-profile.cpu-cy=
cles.__libc_start_main
      1.62 =C2=B1 20%     +52.2%       2.47 =C2=B1 18%  perf-profile.cpu-cy=
cles.ktime_get_update_offsets_now.hrtimer_interrupt.local_apic_timer_interr=
upt.smp_apic_timer_interrupt.apic_timer_interrupt
     28.79 =C2=B1 21%     +60.5%      46.22 =C2=B1  3%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      0.00 =C2=B1  0%      +Inf%       0.81 =C2=B1 36%  perf-profile.cpu-cy=
cles._raw_spin_unlock_irqrestore.update_blocked_averages.rebalance_domains.=
run_rebalance_domains.__do_softirq
     10.72 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.x86_64_start_kernel
     18.38 =C2=B1 16%     +43.4%      26.35 =C2=B1  3%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_s=
econdary
      1.64 =C2=B1 30%     -59.1%       0.67 =C2=B1 46%  perf-profile.cpu-cy=
cles.filemap_map_pages.handle_pte_fault.handle_mm_fault.__do_page_fault.do_=
page_fault
     18.60 =C2=B1 17%     +42.4%      26.49 =C2=B1  4%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secondary
     10.42 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.rest_init.start_kernel.x86_64_start_re=
servations
      9.45 =C2=B1 34%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.smp_reschedule_interrupt.reschedule_interrupt.cpuidle_enter.cpu_startu=
p_entry.rest_init
     10.72 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.x86_64_start_reservations.x86_64_start_kernel
     13.90 =C2=B1  7%     -12.0%      12.22 =C2=B1  4%  perf-profile.cpu-cy=
cles.update_process_times.tick_sched_handle.tick_sched_timer.__run_hrtimer.=
hrtimer_interrupt
     13.92 =C2=B1  2%     -22.7%      10.77 =C2=B1 18%  perf-profile.cpu-cy=
cles.__do_softirq.irq_exit.scheduler_ipi.smp_reschedule_interrupt.reschedul=
e_interrupt
     10.72 =C2=B1 30%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      9.45 =C2=B1 34%    -100.0%       0.00 =C2=B1  0%  perf-profile.cpu-cy=
cles.reschedule_interrupt.cpuidle_enter.cpu_startup_entry.rest_init.start_k=
ernel
   1438772 =C2=B1  8%     +21.2%    1743708 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.min_vruntime
     25049 =C2=B1  3%     +26.4%      31672 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.avg->runnable_avg_sum
        17 =C2=B1 12%    +121.4%         38 =C2=B1 19%  sched_debug.cfs_rq[=
0]:/.runnable_load_avg
       545 =C2=B1  3%     +26.4%        689 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.tg_runnable_contrib
        48 =C2=B1 47%    +147.7%        120 =C2=B1 30%  sched_debug.cfs_rq[=
0]:/.tg_load_contrib
     53474 =C2=B1  7%     +63.0%      87186 =C2=B1  2%  sched_debug.cfs_rq[=
0]:/.exec_clock
        61 =C2=B1  4%     -43.0%         34 =C2=B1  9%  sched_debug.cfs_rq[=
24]:/.runnable_load_avg
   2241502 =C2=B1  4%     -17.8%    1843317 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.min_vruntime
    802666 =C2=B1 24%     -87.6%      99533 =C2=B1 40%  sched_debug.cfs_rq[=
24]:/.spread0
        99 =C2=B1 21%     +51.9%        151 =C2=B1 31%  sched_debug.cfs_rq[=
24]:/.tg_load_contrib
        62 =C2=B1  5%     -44.6%         34 =C2=B1 10%  sched_debug.cfs_rq[=
24]:/.load
       855 =C2=B1  2%     -17.4%        706 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.tg_runnable_contrib
     39223 =C2=B1  2%     -17.4%      32411 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.avg->runnable_avg_sum
    129807 =C2=B1  3%     -26.0%      96066 =C2=B1  2%  sched_debug.cfs_rq[=
24]:/.exec_clock
         1 =C2=B1  0%    +300.0%          4 =C2=B1 50%  sched_debug.cfs_rq[=
39]:/.nr_spread_over
         3 =C2=B1 33%     -66.7%          1 =C2=B1  0%  sched_debug.cfs_rq[=
3]:/.nr_spread_over
        17 =C2=B1 12%    +122.9%         39 =C2=B1 18%  sched_debug.cpu#0.c=
pu_load[0]
     56862 =C2=B1  7%     +58.5%      90118 =C2=B1  2%  sched_debug.cpu#0.n=
r_load_updates
      3783 =C2=B1  6%     +13.9%       4310 =C2=B1  0%  sched_debug.cpu#0.c=
urr->pid
     16708 =C2=B1 18%     -18.4%      13637 =C2=B1  3%  sched_debug.cpu#0.s=
ched_count
      3907 =C2=B1 10%     -24.6%       2945 =C2=B1 11%  sched_debug.cpu#0.t=
twu_local
      5540 =C2=B1  8%     -15.4%       4688 =C2=B1  6%  sched_debug.cpu#0.t=
twu_count
        19 =C2=B1 17%    +182.1%         55 =C2=B1 33%  sched_debug.cpu#0.c=
pu_load[2]
        18 =C2=B1 14%    +159.5%         48 =C2=B1 29%  sched_debug.cpu#0.c=
pu_load[1]
        22 =C2=B1 27%    +181.8%         62 =C2=B1 35%  sched_debug.cpu#0.c=
pu_load[3]
        24 =C2=B1 35%    +175.8%         68 =C2=B1 35%  sched_debug.cpu#0.c=
pu_load[4]
      2253 =C2=B1 11%     -23.0%       1734 =C2=B1  9%  sched_debug.cpu#0.s=
ched_goidle
      3720 =C2=B1  8%     -16.5%       3108 =C2=B1 13%  sched_debug.cpu#13.=
curr->pid
      6862 =C2=B1 10%     -32.1%       4659 =C2=B1 15%  sched_debug.cpu#15.=
nr_switches
      3135 =C2=B1 11%     -36.6%       1987 =C2=B1 15%  sched_debug.cpu#15.=
sched_goidle
        10 =C2=B1  4%     +14.6%         11 =C2=B1  7%  sched_debug.cpu#22.=
cpu_load[4]
        84 =C2=B1 16%     -55.2%         38 =C2=B1 21%  sched_debug.cpu#24.=
cpu_load[3]
        94 =C2=B1 18%     -55.9%         41 =C2=B1 22%  sched_debug.cpu#24.=
cpu_load[4]
    136876 =C2=B1  2%     -20.1%     109402 =C2=B1  2%  sched_debug.cpu#24.=
nr_load_updates
        61 =C2=B1  4%     -43.0%         34 =C2=B1  9%  sched_debug.cpu#24.=
cpu_load[0]
        62 =C2=B1  5%     -44.6%         34 =C2=B1 10%  sched_debug.cpu#24.=
load
      4589 =C2=B1  3%     -10.6%       4101 =C2=B1  0%  sched_debug.cpu#24.=
curr->pid
        65 =C2=B1  6%     -45.8%         35 =C2=B1 15%  sched_debug.cpu#24.=
cpu_load[1]
        75 =C2=B1 13%     -51.2%         37 =C2=B1 20%  sched_debug.cpu#24.=
cpu_load[2]
       411 =C2=B1 29%     +82.3%        749 =C2=B1 46%  sched_debug.cpu#26.=
ttwu_count
       207 =C2=B1 26%    +110.2%        436 =C2=B1 23%  sched_debug.cpu#32.=
ttwu_count
      1027 =C2=B1 37%     -52.7%        486 =C2=B1  2%  sched_debug.cpu#37.=
ttwu_local
      1550 =C2=B1 23%     -41.5%        906 =C2=B1 39%  sched_debug.cpu#42.=
ttwu_count
       773 =C2=B1 21%    +152.1%       1950 =C2=B1 46%  sched_debug.cpu#45.=
ttwu_count
      1664 =C2=B1 10%    +109.2%       3482 =C2=B1 27%  sched_debug.cpu#45.=
nr_switches
       386 =C2=B1 24%    +199.9%       1159 =C2=B1 40%  sched_debug.cpu#45.=
ttwu_local
        10 =C2=B1  8%     +59.5%         16 =C2=B1 36%  sched_debug.cpu#45.=
cpu_load[1]
       699 =C2=B1 10%     +59.6%       1116 =C2=B1 30%  sched_debug.cpu#45.=
sched_goidle
      1678 =C2=B1 10%    +158.7%       4341 =C2=B1 48%  sched_debug.cpu#45.=
sched_count
      2954 =C2=B1  4%     +15.7%       3417 =C2=B1  6%  sched_debug.cpu#47.=
curr->pid

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G




                              will-it-scale.per_process_ops

  2.045e+08 ++------------------------O------------------------------------=
-+
   2.04e+08 ++                           O                         O  O  O =
 O
            |                   O              O     O                     =
 |
  2.035e+08 O+    O  O             O        O     O     O  O               =
 |
   2.03e+08 ++ O             O                                             =
 |
            |           O  O                                 O  O          =
 |
  2.025e+08 ++                                                             =
 |
   2.02e+08 ++                                                             =
 |
  2.015e+08 ++                                                             =
 |
            |                               *..*..*..*                     =
 |
   2.01e+08 ++               *..     .*.. ..                               =
 |
  2.005e+08 ++ *..*..*..*.. :     .*.    *                                 =
 |
            |..             :   *.                                         =
 |
      2e+08 *+             *                                               =
 |
  1.995e+08 ++-------------------------------------------------------------=
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


--===============3819492516382404108==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogcHJl
LXRlc3QKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgdm1zdGF0OiAKICBudW1hLW51bWFzdGF0OiAK
ICBudW1hLXZtc3RhdDogCiAgbnVtYS1tZW1pbmZvOiAKICBwcm9jLXZtc3RhdDogCiAgcHJvYy1z
dGF0OiAKICBtZW1pbmZvOiAKICBzbGFiaW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0
OiAKICBsYXRlbmN5X3N0YXRzOiAKICBzb2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBk
aXNrc3RhdHM6IAogIG5mc3N0YXQ6IAogIGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1
cmJvc3RhdDogCiAgcG1ldGVyOiAKICBzY2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiAxMApkZWZh
dWx0X3dhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdhdGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5v
cjogcGVyZm9ybWFuY2UKY29tbWl0OiAwOWRkMjk1OTJiOWRlOTkyMWQ1NDUxZDE4NzM1ZGRmN2I3
YzQxYzg5Cm1vZGVsOiBJdnl0b3duIEl2eSBCcmlkZ2UtRVAKbnJfY3B1OiA0OAptZW1vcnk6IDY0
Rwpyb290ZnM6IGRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oKcGVyZi1wcm9maWxlOgogIGZy
ZXE6IDgwMAp3aWxsLWl0LXNjYWxlOgogIHRlc3Q6IHB0aHJlYWRfbXV0ZXgyCnRlc3Rib3g6IGl2
YjQyCnRib3hfZ3JvdXA6IGl2YjQyCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTog
MjAxNS0wMy0wOCAyMjoyMzo1MS42MDI1MjgwNDUgKzA4OjAwCmhlYWRfY29tbWl0OiAwOWRkMjk1
OTJiOWRlOTkyMWQ1NDUxZDE4NzM1ZGRmN2I3YzQxYzg5CmJhc2VfY29tbWl0OiA5ZWNjY2EwODQz
MjA1Zjg3YzAwNDA0YjY2MzE4OGI4OGViMjQ4MDUxCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwt
aG91cmx5LTIwMTUwMzA5MDkKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC8wOWRkMjk1OTJi
OWRlOTkyMWQ1NDUxZDE4NzM1ZGRmN2I3YzQxYzg5L3ZtbGludXotNC4wLjAtcmMzLTAxMDMwLWcw
OWRkMjk1Igp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyZXN1bHRfcm9vdDogIi9yZXN1bHQvaXZi
NDIvd2lsbC1pdC1zY2FsZS9wZXJmb3JtYW5jZS1wdGhyZWFkX211dGV4Mi9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsLzA5ZGQyOTU5MmI5ZGU5OTIxZDU0NTFkMTg3MzVk
ZGY3YjdjNDFjODkvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9pdmI0Mi9jeWNsaWNfd2ls
bC1pdC1zY2FsZS1wZXJmb3JtYW5jZS1wdGhyZWFkX211dGV4Mi1kZWJpYW4teDg2XzY0LmNnei14
ODZfNjQtcmhlbC1IRUFELTA5ZGQyOTU5MmI5ZGU5OTIxZDU0NTFkMTg3MzVkZGY3YjdjNDFjODkt
MC0yMDE1MDMwOC00MDkyNS1pd2JkamMueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE1LTAzLTA5IDEz
OjI0OjU0LjIzMzc5MzU1NCArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAyNS4y
NiAxNy4xMSA3LjIwIDEvNDIyIDEwMDg2CnN0YXJ0X3RpbWU6ICcxNDI1ODc4NzQyJwplbmRfdGlt
ZTogJzE0MjU4NzkwNTInCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwMzA5LTEyNTQ0MCIK

--===============3819492516382404108==
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
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgouL3J1bnRlc3QucHkgcHRocmVhZF9tdXRleDIgMjUgYm90aCAxIDEyIDI0IDM2IDQ4
Cg==

--===============3819492516382404108==--

