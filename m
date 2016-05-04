Content-Type: multipart/mixed; boundary="===============2282756665777480727=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm, vmscan] 6963dd6128: vm-scalability.throughput -3.3% regression
Date: Wed, 04 May 2016 10:51:47 +0800
Message-ID: <20160504025147.GB3752@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2282756665777480727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed vm-scalability.throughput -3.3% regression with the followi=
ng commit:

https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux mm-vmscan-node-lr=
u-v5r9
commit 6963dd61283e853c4e17eb6c120fc595f3644638 ("mm, vmscan: Begin reclaim=
ing pages on a per-node basis")

on test machine: lkp-sb02:  threads Sandy Bridge-EP with 4G memory


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/300s/lkp-sb0=
2/lru-file-readonce/vm-scalability

commit: =

  4365c69d07757b4f26cb23d4213be619269642b8
  6963dd61283e853c4e17eb6c120fc595f3644638

4365c69d07757b4f 6963dd61283e853c4e17eb6c12 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   6128518 =C2=B1  0%      -3.3%    5924537 =C2=B1  0%  vm-scalability.thro=
ughput
    205895 =C2=B1  3%    +634.7%    1512732 =C2=B1  1%  vm-scalability.time=
.involuntary_context_switches
    314.00 =C2=B1  0%      -2.4%     306.50 =C2=B1  0%  vm-scalability.time=
.percent_of_cpu_this_job_got
    916.83 =C2=B1  0%      -2.4%     895.21 =C2=B1  0%  vm-scalability.time=
.system_time
    106053 =C2=B1  6%     +29.9%     137776 =C2=B1  1%  softirqs.RCU
    205895 =C2=B1  3%    +634.7%    1512732 =C2=B1  1%  time.involuntary_co=
ntext_switches
      3572 =C2=B1 23%    +290.8%      13963 =C2=B1  1%  vmstat.system.cs
     10102 =C2=B1 59%     +90.7%      19268 =C2=B1  6%  cpuidle.C1E-SNB.usa=
ge
     18650 =C2=B1150%     -92.7%       1361 =C2=B1  6%  cpuidle.C6-SNB.usage
      2364 =C2=B1  3%     +40.6%       3322 =C2=B1  1%  meminfo.Active(anon)
     71205 =C2=B1  7%     -14.4%      60965 =C2=B1  3%  meminfo.DirectMap4k
     36.17 =C2=B1 29%     +18.0%      42.68 =C2=B1  0%  turbostat.CorWatt
     40.26 =C2=B1 26%     +16.4%      46.88 =C2=B1  0%  turbostat.PkgWatt
     39566 =C2=B1  0%     -10.8%      35289 =C2=B1  0%  slabinfo.dentry.act=
ive_objs
      1852 =C2=B1  2%     -66.0%     629.50 =C2=B1 28%  slabinfo.proc_inode=
_cache.active_objs
      1908 =C2=B1  4%     -61.1%     743.25 =C2=B1 27%  slabinfo.proc_inode=
_cache.num_objs
    366.53 =C2=B1  8%     -18.0%     300.58 =C2=B1 10%  sched_debug.cfs_rq:=
/.load.stddev
     10247 =C2=B1 33%     +54.8%      15858 =C2=B1 13%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
     -8727 =C2=B1-83%    +251.1%     -30642 =C2=B1-35%  sched_debug.cfs_rq:=
/.spread0.min
     10247 =C2=B1 33%     +54.8%      15859 =C2=B1 13%  sched_debug.cfs_rq:=
/.spread0.stddev
    442302 =C2=B1 30%     -51.6%     214062 =C2=B1 17%  sched_debug.cpu.avg=
_idle.avg
    611019 =C2=B1 17%     -36.6%     387365 =C2=B1 23%  sched_debug.cpu.avg=
_idle.max
    337551 =C2=B1 39%     -66.5%     113210 =C2=B1  8%  sched_debug.cpu.avg=
_idle.min
      0.60 =C2=B1  6%     -19.2%       0.48 =C2=B1  5%  sched_debug.cpu.nr_=
running.stddev
    191526 =C2=B1 27%    +175.2%     527070 =C2=B1  0%  sched_debug.cpu.nr_=
switches.avg
    208823 =C2=B1 25%    +167.9%     559430 =C2=B1  3%  sched_debug.cpu.nr_=
switches.max
    173499 =C2=B1 28%    +186.7%     497478 =C2=B1  0%  sched_debug.cpu.nr_=
switches.min
     13313 =C2=B1 30%     +79.3%      23868 =C2=B1 35%  sched_debug.cpu.nr_=
switches.stddev
    265997 =C2=B1  9%    +107.6%     552287 =C2=B1  1%  proc-vmstat.allocst=
all
    759089 =C2=B1 36%     -93.1%      52705 =C2=B1173%  proc-vmstat.compact=
_free_scanned
     11241 =C2=B1 67%     -99.9%       8.25 =C2=B1173%  proc-vmstat.compact=
_isolated
      6959 =C2=B1 56%     -99.9%       8.25 =C2=B1173%  proc-vmstat.compact=
_migrate_scanned
    128.25 =C2=B1 44%    +385.8%     623.00 =C2=B1  5%  proc-vmstat.kswapd_=
high_wmark_hit_quickly
    604.25 =C2=B1  7%     +35.9%     821.00 =C2=B1  0%  proc-vmstat.nr_allo=
c_batch
 3.475e+08 =C2=B1  0%     -83.4%   57704068 =C2=B1  6%  proc-vmstat.pgalloc=
_dma32
 1.127e+08 =C2=B1  1%    +243.5%   3.87e+08 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
      5549 =C2=B1 68%    -100.0%       0.25 =C2=B1173%  proc-vmstat.pgmigra=
te_success

  52969115 =C2=B1  9%     -99.6%     224089 =C2=B1  2%  proc-vmstat.pgscan_=
direct
  4.06e+08 =C2=B1  1%      +9.2%  4.434e+08 =C2=B1  0%  proc-vmstat.pgscan_=
kswapd
  52906329 =C2=B1  9%     -99.6%     224088 =C2=B1  2%  proc-vmstat.pgsteal=
_direct
 4.059e+08 =C2=B1  1%      +9.2%  4.433e+08 =C2=B1  0%  proc-vmstat.pgsteal=
_kswapd
     10.60 =C2=B1  2%     +19.9%      12.71 =C2=B1  6%  perf-profile.cycles=
.__alloc_pages_nodemask.alloc_pages_current.__page_cache_alloc.__do_page_ca=
che_readahead.ondemand_readahead
      5.55 =C2=B1  6%     +50.9%       8.37 =C2=B1 10%  perf-profile.cycles=
.__alloc_pages_slowpath.constprop.102.__alloc_pages_nodemask.alloc_pages_cu=
rrent.__page_cache_alloc.__do_page_cache_readahead
      0.00 =C2=B1 -1%      +Inf%       4.30 =C2=B1  1%  perf-profile.cycles=
.__list_del_entry.isolate_lru_pages.shrink_inactive_list.shrink_zone_memcg.=
shrink_node
      3.87 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.__list_del_entry.isolate_lru_pages.shrink_inactive_list.shrink_zone_memcg.=
shrink_zone
      1.12 =C2=B1 12%     -33.2%       0.75 =C2=B1  4%  perf-profile.cycles=
.__list_del_entry.list_del.__rmqueue.get_page_from_freelist.__alloc_pages_n=
odemask
     11.18 =C2=B1  1%     +18.1%      13.20 =C2=B1  6%  perf-profile.cycles=
.__page_cache_alloc.__do_page_cache_readahead.ondemand_readahead.page_cache=
_async_readahead.generic_file_read_iter
      1.04 =C2=B1  1%     -15.6%       0.88 =C2=B1  3%  perf-profile.cycles=
.__radix_tree_create.__add_to_page_cache_locked.add_to_page_cache_lru.mpage=
_readpages.xfs_vm_readpages
      0.00 =C2=B1 -1%      +Inf%       5.00 =C2=B1  0%  perf-profile.cycles=
.__remove_mapping.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.s=
hrink_node
      5.88 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.__remove_mapping.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.s=
hrink_zone
      1.61 =C2=B1 10%     -25.0%       1.21 =C2=B1  4%  perf-profile.cycles=
.__rmqueue.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_curren=
t.__page_cache_alloc
      0.00 =C2=B1 -1%      +Inf%       2.66 =C2=B1 18%  perf-profile.cycles=
._raw_spin_lock.list_lru_count_one.super_cache_count.shrink_slab.shrink_node
      1.19 =C2=B1  3%     -27.2%       0.86 =C2=B1  2%  perf-profile.cycles=
._raw_spin_lock_irqsave.__remove_mapping.shrink_page_list.shrink_inactive_l=
ist.shrink_zone_memcg
     11.00 =C2=B1  1%     +18.4%      13.03 =C2=B1  6%  perf-profile.cycles=
.alloc_pages_current.__page_cache_alloc.__do_page_cache_readahead.ondemand_=
readahead.page_cache_async_readahead
      2.84 =C2=B1  6%    +103.6%       5.78 =C2=B1 17%  perf-profile.cycles=
.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_page=
s_nodemask.alloc_pages_current
      0.00 =C2=B1 -1%      +Inf%       7.12 =C2=B1  2%  perf-profile.cycles=
.free_hot_cold_page_list.shrink_page_list.shrink_inactive_list.shrink_zone_=
memcg.shrink_node
      6.66 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.free_hot_cold_page_list.shrink_page_list.shrink_inactive_list.shrink_zone_=
memcg.shrink_zone
      5.23 =C2=B1  1%     +10.7%       5.79 =C2=B1  1%  perf-profile.cycles=
.free_pcppages_bulk.free_hot_cold_page.free_hot_cold_page_list.shrink_page_=
list.shrink_inactive_list
      4.39 =C2=B1  5%     -16.0%       3.68 =C2=B1  2%  perf-profile.cycles=
.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_current.__page_c=
ache_alloc.__do_page_cache_readahead
      1.68 =C2=B1  7%     +12.5%       1.89 =C2=B1  5%  perf-profile.cycles=
.get_page_from_freelist.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc=
_pages_current.__page_cache_alloc
      0.00 =C2=B1 -1%      +Inf%       5.64 =C2=B1  1%  perf-profile.cycles=
.isolate_lru_pages.isra.52.shrink_inactive_list.shrink_zone_memcg.shrink_no=
de.kswapd
      4.95 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.isolate_lru_pages.isra.52.shrink_inactive_list.shrink_zone_memcg.shrink_zo=
ne.kswapd
      1.17 =C2=B1 12%     -29.2%       0.83 =C2=B1  4%  perf-profile.cycles=
.list_del.__rmqueue.get_page_from_freelist.__alloc_pages_nodemask.alloc_pag=
es_current
      0.00 =C2=B1 -1%      +Inf%       3.07 =C2=B1 19%  perf-profile.cycles=
.list_lru_count_one.super_cache_count.shrink_slab.shrink_node.do_try_to_fre=
e_pages
      0.00 =C2=B1 -1%      +Inf%      21.54 =C2=B1  1%  perf-profile.cycles=
.shrink_inactive_list.shrink_zone_memcg.shrink_node.kswapd.kthread
      2.48 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try_to_free_pages.tr=
y_to_free_pages
     19.70 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.shrink_inactive_list.shrink_zone_memcg.shrink_zone.kswapd.kthread
      0.00 =C2=B1 -1%      +Inf%       5.30 =C2=B1 17%  perf-profile.cycles=
.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.=
__alloc_pages_nodemask
      0.00 =C2=B1 -1%      +Inf%      22.54 =C2=B1  1%  perf-profile.cycles=
.shrink_node.kswapd.kthread.ret_from_fork
      0.00 =C2=B1 -1%      +Inf%      15.28 =C2=B1  1%  perf-profile.cycles=
.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.shrink_node.kswapd
      1.79 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.shrink_zone.do_try=
_to_free_pages
     14.18 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.shrink_page_list.shrink_inactive_list.shrink_zone_memcg.shrink_zone.kswapd
      0.00 =C2=B1 -1%      +Inf%       4.77 =C2=B1 17%  perf-profile.cycles=
.shrink_slab.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pag=
es_slowpath
      2.82 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.shrink_zone.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.=
__alloc_pages_nodemask
     20.79 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.shrink_zone.kswapd.kthread.ret_from_fork
      0.00 =C2=B1 -1%      +Inf%      21.68 =C2=B1  1%  perf-profile.cycles=
.shrink_zone_memcg.shrink_node.kswapd.kthread.ret_from_fork
      2.58 =C2=B1  6%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.shrink_zone_memcg.shrink_zone.do_try_to_free_pages.try_to_free_pages.__all=
oc_pages_slowpath
     19.84 =C2=B1  0%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles=
.shrink_zone_memcg.shrink_zone.kswapd.kthread.ret_from_fork
      0.00 =C2=B1 -1%      +Inf%       3.46 =C2=B1 18%  perf-profile.cycles=
.super_cache_count.shrink_slab.shrink_node.do_try_to_free_pages.try_to_free=
_pages
      2.85 =C2=B1  6%    +103.7%       5.80 =C2=B1 17%  perf-profile.cycles=
.try_to_free_pages.__alloc_pages_slowpath.__alloc_pages_nodemask.alloc_page=
s_current.__page_cache_alloc
      1.61 =C2=B1  1%     -21.4%       1.27 =C2=B1  1%  perf-profile.cycles=
.unlock_page.do_mpage_readpage.mpage_readpages.xfs_vm_readpages.__do_page_c=
ache_readahead


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
Xiaolong

--===============2282756665777480727==
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
IApjb21taXQ6IDY5NjNkZDYxMjgzZTg1M2M0ZTE3ZWI2YzEyMGZjNTk1ZjM2NDQ2MzgKbW9kZWw6
IFNhbmR5IEJyaWRnZS1FUAptZW1vcnk6IDRHCmhkZF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5
LWlkL2F0YS1IRFQ3MjI1MTZETEEzODBfVkRTRDFEVENFS1lBRUotcGFydDIiCnN3YXBfcGFydGl0
aW9uczogCnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRhLUhEVDcyMjUxNkRM
QTM4MF9WRFNEMURUQ0VLWUFFSi1wYXJ0MSIKY2F0ZWdvcnk6IGJlbmNobWFyawpwZXJmLXByb2Zp
bGU6IApydW50aW1lOiAzMDBzCnNpemU6IAp2bS1zY2FsYWJpbGl0eToKICB0ZXN0OiBscnUtZmls
ZS1yZWFkb25jZQpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGxrcC1zYjAyCnRib3hfZ3JvdXA6IGxr
cC1zYjAyCmtjb25maWc6IHg4Nl82NC1yaGVsCmVucXVldWVfdGltZTogMjAxNi0wNC0zMCAxNzoy
MTo0Mi43NzgzODg4NzIgKzA4OjAwCmNvbXBpbGVyOiBnY2MtNC45CnJvb3RmczogZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnegppZDogNzI0ZTFjMjA5ZGI1MDA2NjIxODhhMzYwODg0ZGYxMTYw
YjE0NWI2Mgp1c2VyOiBsa3AKaGVhZF9jb21taXQ6IDc2NmMwYjgxYzdmZWFhN2I2YjBlZDUyMGVl
YTcxYWMxYmNhMmI4OWUKYmFzZV9jb21taXQ6IDAyZGEyZDcyMTc0YzYxOTg4ZWI0NDU2YjUzZjQw
NWUzZWJkZWJjZTQKYnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNjA0MjUxNgpy
ZXN1bHRfcm9vdDogIi9yZXN1bHQvdm0tc2NhbGFiaWxpdHkvcGVyZm9ybWFuY2UtMzAwcy1scnUt
ZmlsZS1yZWFkb25jZS9sa3Atc2IwMi9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3g4Nl82
NC1yaGVsL2djYy00LjkvNjk2M2RkNjEyODNlODUzYzRlMTdlYjZjMTIwZmM1OTVmMzY0NDYzOC8w
Igpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2xrcC1zYjAyL2Jpc2VjdF92bS1zY2FsYWJpbGl0
eS1wZXJmb3JtYW5jZS0zMDBzLWxydS1maWxlLXJlYWRvbmNlLWRlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oteDg2XzY0LXJoZWwtNjk2M2RkNjEyODNlODUzYzRlMTdlYjZjMTIwZmM1OTVmMzY0
NDYzOC0yMDE2MDQzMC0xMDA4Ni0xdm9pMXg4LTAueWFtbCIKbnJfY3B1OiAiJChucHJvYykiCm1h
eF91cHRpbWU6IDE1MDAKaW5pdHJkOiAiL29zaW1hZ2UvZGViaWFuL2RlYmlhbi14ODZfNjQtMjAx
NS0wMi0wNy5jZ3oiCmJvb3Rsb2FkZXJfYXBwZW5kOgotIHJvb3Q9L2Rldi9yYW0wCi0gdXNlcj1s
a3AKLSBqb2I9L2xrcC9zY2hlZHVsZWQvbGtwLXNiMDIvYmlzZWN0X3ZtLXNjYWxhYmlsaXR5LXBl
cmZvcm1hbmNlLTMwMHMtbHJ1LWZpbGUtcmVhZG9uY2UtZGViaWFuLXg4Nl82NC0yMDE1LTAyLTA3
LmNnei14ODZfNjQtcmhlbC02OTYzZGQ2MTI4M2U4NTNjNGUxN2ViNmMxMjBmYzU5NWYzNjQ0NjM4
LTIwMTYwNDMwLTEwMDg2LTF2b2kxeDgtMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4
Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDQyNTE2Ci0g
Y29tbWl0PTY5NjNkZDYxMjgzZTg1M2M0ZTE3ZWI2YzEyMGZjNTk1ZjM2NDQ2MzgKLSBCT09UX0lN
QUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82OTYzZGQ2MTI4M2U4NTNjNGUxN2Vi
NmMxMjBmYzU5NWYzNjQ0NjM4L3ZtbGludXotNC42LjAtcmMzLTAwMDMyLWc2OTYzZGQ2Ci0gbWF4
X3VwdGltZT0xNTAwCi0gUkVTVUxUX1JPT1Q9L3Jlc3VsdC92bS1zY2FsYWJpbGl0eS9wZXJmb3Jt
YW5jZS0zMDBzLWxydS1maWxlLXJlYWRvbmNlL2xrcC1zYjAyL2RlYmlhbi14ODZfNjQtMjAxNS0w
Mi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS82OTYzZGQ2MTI4M2U4NTNjNGUxN2ViNmMxMjBm
YzU5NWYzNjQ0NjM4LzAKLSBMS1BfU0VSVkVSPWlubgotIHwyLQoKCiAgZWFybHlwcmludGs9dHR5
UzAsMTE1MjAwIHN5c3RlbWQubG9nX2xldmVsPWVycgogIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFf
YWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAogIHBhbmlj
PS0xIHNvZnRsb2NrdXBfcGFuaWM9MSBubWlfd2F0Y2hkb2c9cGFuaWMgb29wcz1wYW5pYyBsb2Fk
X3JhbWRpc2s9MiBwcm9tcHRfcmFtZGlzaz0wCiAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29s
ZT10dHkwIHZnYT1ub3JtYWwKCiAgcncKbGtwX2luaXRyZDogIi9sa3AvbGtwL2xrcC14ODZfNjQu
Y2d6Igptb2R1bGVzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS82OTYz
ZGQ2MTI4M2U4NTNjNGUxN2ViNmMxMjBmYzU5NWYzNjQ0NjM4L21vZHVsZXMuY2d6IgpibV9pbml0
cmQ6ICIvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovbGtwLmNneiwv
b3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovcnVuLWlwY29uZmlnLmNn
eiwvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3ovdHVyYm9zdGF0LmNn
eiwvbGtwL2JlbmNobWFya3MvdHVyYm9zdGF0LmNneiwvbGtwL2JlbmNobWFya3Mvdm0tc2NhbGFi
aWxpdHkuY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cvbGludXgveDg2XzY0LXJoZWwv
Z2NjLTQuOS82OTYzZGQ2MTI4M2U4NTNjNGUxN2ViNmMxMjBmYzU5NWYzNjQ0NjM4L2xpbnV4LWhl
YWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9n
Y2MtNC45LzY5NjNkZDYxMjgzZTg1M2M0ZTE3ZWI2YzEyMGZjNTk1ZjM2NDQ2Mzgvdm1saW51ei00
LjYuMC1yYzMtMDAwMzItZzY5NjNkZDYiCmRlcXVldWVfdGltZTogMjAxNi0wNC0zMCAxODoxMzoy
OC4yMjc1NDY1MzcgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogNC42OSAzLjIz
IDEuNDMgMS8xMjcgNDY2OApzdGFydF90aW1lOiAnMTQ2MjAxMTIzOCcKZW5kX3RpbWU6ICcxNDYy
MDExNTM5Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDQyOS0yMzU2NTkiCg==

--===============2282756665777480727==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0zMCAxODoxMzo1NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0zMCAxODoxMzo1NyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0zMCAxODoxMzo1NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
NC0zMCAxODoxMzo1NyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0zMCAxODoxMzo1OCBtb3VudCAt
dCB0bXBmcyAtbyBzaXplPTEwMCUgdm0tc2NhbGFiaWxpdHktdG1wIC90bXAvdm0tc2NhbGFiaWxp
dHktdG1wCjIwMTYtMDQtMzAgMTg6MTM6NTggdHJ1bmNhdGUgLXMgNDA1MzgzOTg3MiAvdG1wL3Zt
LXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS5pbWcKMjAxNi0wNC0zMCAxODoxMzo1OCBt
a2ZzLnhmcyAtcSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS5pbWcKMjAx
Ni0wNC0zMCAxODoxMzo1OCBtb3VudCAtbyBsb29wIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3Zt
LXNjYWxhYmlsaXR5LmltZyAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eQoy
MDE2LTA0LTMwIDE4OjEzOjU4IC4vY2FzZS1scnUtZmlsZS1yZWFkb25jZQoyMDE2LTA0LTMwIDE4
OjEzOjU4IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3Nw
YXJzZS1scnUtZmlsZS1yZWFkb25jZS0xIC1zIDEwOTk1MTE2Mjc3NzYKMjAxNi0wNC0zMCAxODox
Mzo1OCB0cnVuY2F0ZSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS9zcGFy
c2UtbHJ1LWZpbGUtcmVhZG9uY2UtMiAtcyAxMDk5NTExNjI3Nzc2CjIwMTYtMDQtMzAgMTg6MTM6
NTggdHJ1bmNhdGUgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkvc3BhcnNl
LWxydS1maWxlLXJlYWRvbmNlLTMgLXMgMTA5OTUxMTYyNzc3NgoyMDE2LTA0LTMwIDE4OjEzOjU4
IHRydW5jYXRlIC90bXAvdm0tc2NhbGFiaWxpdHktdG1wL3ZtLXNjYWxhYmlsaXR5L3NwYXJzZS1s
cnUtZmlsZS1yZWFkb25jZS00IC1zIDEwOTk1MTE2Mjc3NzYKMjAxNi0wNC0zMCAxODoxODo1OSB1
bW91bnQgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAvdm0tc2NhbGFiaWxpdHkKMjAxNi0wNC0zMCAx
ODoxODo1OSBybSAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcC92bS1zY2FsYWJpbGl0eS5pbWcKMjAx
Ni0wNC0zMCAxODoxODo1OSB1bW91bnQgL3RtcC92bS1zY2FsYWJpbGl0eS10bXAK

--===============2282756665777480727==--

