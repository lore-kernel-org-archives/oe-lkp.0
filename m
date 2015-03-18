Content-Type: multipart/mixed; boundary="===============7511788818575644631=="
MIME-Version: 1.0
From: Filipe Manana <fdmanana@suse.com>
To: lkp@lists.01.org
Subject: Re: [Btrfs] 3a8b36f3780: -62.6% fileio.requests_per_sec
Date: Wed, 18 Mar 2015 10:05:58 +0000
Message-ID: <55094E06.2070004@suse.com>
In-Reply-To: <1426666837.5570.36.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7511788818575644631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 03/18/2015 08:20 AM, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 3a8b36f378060d20062a0918e99fae39ff077bf0 ("Btrfs: fix data loss in=
 the fast fsync path")
> =

> =

> testbox/testcase/testparams: lkp-sb02/fileio/performance-600s-100%-1HDD-b=
trfs-64G-1024f-rndwr-sync
> =

> f5c0a122800c301e  3a8b36f378060d20062a0918e9  =

> ----------------  --------------------------  =

>          %stddev     %change         %stddev
>              \          |                \  =

>      45.33 =C2=B1  0%     -62.6%      16.94 =C2=B1  0%  fileio.requests_p=
er_sec
>     138983 =C2=B1  0%     +15.1%     160000 =C2=B1  0%  fileio.time.volun=
tary_context_switches
>      16035 =C2=B1  0%     +13.0%      18124 =C2=B1  0%  fileio.time.invol=
untary_context_switches
>    2504328 =C2=B1  0%      -7.2%    2324488 =C2=B1  0%  fileio.time.file_=
system_outputs
>       1.35 =C2=B1  1%      +2.8%       1.38 =C2=B1  0%  turbostat.CorWatt
>       0.77 =C2=B1  6%     +34.6%       1.03 =C2=B1  3%  turbostat.Pkg%pc3
>    7224199 =C2=B1 22%     -26.7%    5298697 =C2=B1 12%  cpuidle.C1-SNB.ti=
me
>    8377756 =C2=B1  1%     +15.7%    9690687 =C2=B1  4%  cpuidle.C3-SNB.ti=
me
>      16035 =C2=B1  0%     +13.0%      18124 =C2=B1  0%  time.involuntary_=
context_switches
>     138983 =C2=B1  0%     +15.1%     160000 =C2=B1  0%  time.voluntary_co=
ntext_switches
>      45941 =C2=B1  0%     +11.0%      50983 =C2=B1  0%  softirqs.BLOCK
>      35635 =C2=B1  2%     +13.7%      40524 =C2=B1  2%  softirqs.RCU
>      26255 =C2=B1  1%     +10.5%      29017 =C2=B1  0%  softirqs.SCHED
>      50650 =C2=B1  2%     +11.3%      56371 =C2=B1  0%  softirqs.TIMER
>       3448 =C2=B1  0%      +1.6%       3503 =C2=B1  0%  vmstat.io.bo
>       4010 =C2=B1  0%      +2.7%       4119 =C2=B1  0%  vmstat.system.cs
>     294711 =C2=B1  1%     -17.1%     244365 =C2=B1  0%  meminfo.Active
>     275793 =C2=B1  2%     -18.1%     225971 =C2=B1  0%  meminfo.Active(fi=
le)
>      53614 =C2=B1  6%     +27.6%      68412 =C2=B1 15%  meminfo.DirectMap=
4k
>       3781 =C2=B1  0%     -46.9%       2006 =C2=B1  0%  meminfo.Dirty
>      47786 =C2=B1  0%     -14.7%      40780 =C2=B1  0%  meminfo.SReclaima=
ble
>      66047 =C2=B1  0%     -10.7%      58973 =C2=B1  0%  meminfo.Slab
>      68947 =C2=B1  2%     -18.1%      56492 =C2=B1  0%  proc-vmstat.nr_ac=
tive_file
>     337110 =C2=B1  0%     -10.0%     303330 =C2=B1  0%  proc-vmstat.nr_di=
rtied
>        944 =C2=B1  0%     -46.9%        501 =C2=B1  0%  proc-vmstat.nr_di=
rty
>      11946 =C2=B1  0%     -14.7%      10195 =C2=B1  0%  proc-vmstat.nr_sl=
ab_reclaimable
>     335424 =C2=B1  0%      -9.7%     302754 =C2=B1  0%  proc-vmstat.nr_wr=
itten
>      55839 =C2=B1  3%     -15.0%      47438 =C2=B1  0%  proc-vmstat.pgact=
ivate
>       1142 =C2=B1  5%     -16.2%        957 =C2=B1 17%  slabinfo.btrfs_de=
layed_ref_head.active_objs
>       1146 =C2=B1  5%     -16.0%        962 =C2=B1 17%  slabinfo.btrfs_de=
layed_ref_head.num_objs
>       1246 =C2=B1  6%     -29.4%        880 =C2=B1 15%  slabinfo.btrfs_de=
layed_tree_ref.active_objs
>       1246 =C2=B1  6%     -29.4%        880 =C2=B1 15%  slabinfo.btrfs_de=
layed_tree_ref.num_objs
>       2037 =C2=B1  2%     +60.0%       3260 =C2=B1  1%  slabinfo.btrfs_ex=
tent_buffer.num_objs
>       2023 =C2=B1  2%     +60.7%       3250 =C2=B1  1%  slabinfo.btrfs_ex=
tent_buffer.active_objs
>      13307 =C2=B1  0%     -57.7%       5634 =C2=B1  0%  slabinfo.btrfs_ex=
tent_state.num_objs
>        260 =C2=B1  0%     -57.8%        110 =C2=B1  0%  slabinfo.btrfs_ex=
tent_state.num_slabs
>      13292 =C2=B1  0%     -57.6%       5634 =C2=B1  0%  slabinfo.btrfs_ex=
tent_state.active_objs
>        260 =C2=B1  0%     -57.8%        110 =C2=B1  0%  slabinfo.btrfs_ex=
tent_state.active_slabs
>        713 =C2=B1  1%     -51.2%        348 =C2=B1  1%  slabinfo.btrfs_or=
dered_extent.active_objs
>        718 =C2=B1  1%     -48.1%        373 =C2=B1  1%  slabinfo.btrfs_or=
dered_extent.num_objs
>      26930 =C2=B1  0%     -57.1%      11557 =C2=B1  0%  slabinfo.btrfs_pa=
th.num_objs
>        961 =C2=B1  0%     -57.1%        412 =C2=B1  0%  slabinfo.btrfs_pa=
th.active_slabs
>        961 =C2=B1  0%     -57.1%        412 =C2=B1  0%  slabinfo.btrfs_pa=
th.num_slabs
>      26930 =C2=B1  0%     -57.1%      11557 =C2=B1  0%  slabinfo.btrfs_pa=
th.active_objs
>        789 =C2=B1  4%     -48.5%        406 =C2=B1  0%  slabinfo.ext4_ext=
ent_status.num_objs
>        789 =C2=B1  4%     -48.5%        406 =C2=B1  0%  slabinfo.ext4_ext=
ent_status.active_objs
>      26083 =C2=B1  0%     -28.3%      18697 =C2=B1  0%  slabinfo.radix_tr=
ee_node.num_objs
>      26083 =C2=B1  0%     -28.3%      18697 =C2=B1  0%  slabinfo.radix_tr=
ee_node.active_objs
>        931 =C2=B1  0%     -28.3%        667 =C2=B1  0%  slabinfo.radix_tr=
ee_node.active_slabs
>        931 =C2=B1  0%     -28.3%        667 =C2=B1  0%  slabinfo.radix_tr=
ee_node.num_slabs
>          4 =C2=B1 38%    +129.4%          9 =C2=B1 31%  sched_debug.cfs_r=
q[0]:/.runnable_load_avg
>         17 =C2=B1 32%     -54.9%          8 =C2=B1 45%  sched_debug.cfs_r=
q[3]:/.runnable_load_avg
>        385 =C2=B1 14%     -25.3%        287 =C2=B1 17%  sched_debug.cfs_r=
q[3]:/.load
>      51947 =C2=B1  3%     +15.4%      59938 =C2=B1  3%  sched_debug.cpu#0=
.nr_load_updates
>     200860 =C2=B1  5%     +11.6%     224079 =C2=B1  4%  sched_debug.cpu#1=
.ttwu_local
>      47218 =C2=B1  2%      +7.4%      50701 =C2=B1  2%  sched_debug.cpu#1=
.nr_load_updates
>          5 =C2=B1 37%    +105.0%         10 =C2=B1 26%  sched_debug.cpu#1=
.cpu_load[1]
>     226755 =C2=B1  4%     +11.4%     252611 =C2=B1  4%  sched_debug.cpu#1=
.ttwu_count
>       2500 =C2=B1 34%     -45.6%       1360 =C2=B1 33%  sched_debug.cpu#3=
.curr->pid
>        385 =C2=B1 14%     -25.8%        285 =C2=B1 16%  sched_debug.cpu#3=
.load
> =

> testbox/testcase/testparams: bay/fileio/performance-600s-100%-1HDD-btrfs-=
64G-1024f-rndrw-sync
> =

> f5c0a122800c301e  3a8b36f378060d20062a0918e9  =

> ----------------  --------------------------  =

>      62.17 =C2=B1  0%     -64.6%      22.03 =C2=B1  0%  fileio.requests_p=
er_sec
>     712336 =C2=B1  0%     -64.2%     255005 =C2=B1  0%  fileio.time.file_=
system_inputs
>     712336 =C2=B1  0%     -64.2%     255005 =C2=B1  0%  time.file_system_=
inputs
>       0.73 =C2=B1  3%     -21.1%       0.58 =C2=B1  3%  time.user_time
>      46562 =C2=B1  0%     +29.5%      60303 =C2=B1  1%  softirqs.RCU
>      57662 =C2=B1  0%     +16.7%      67299 =C2=B1  0%  softirqs.SCHED
>        259 =C2=B1  0%     -64.3%         92 =C2=B1  0%  vmstat.io.bi
>       3638 =C2=B1  1%     -10.1%       3272 =C2=B1  2%  meminfo.Dirty
>        432 =C2=B1  8%     -25.8%        320 =C2=B1 28%  proc-vmstat.alloc=
stall
>        253 =C2=B1  9%     -21.9%        197 =C2=B1 19%  proc-vmstat.compa=
ct_fail
>        506 =C2=B1  8%     -17.8%        416 =C2=B1 14%  proc-vmstat.compa=
ct_stall
>      11262 =C2=B1  3%     -20.1%       8996 =C2=B1  2%  proc-vmstat.kswap=
d_low_wmark_hit_quickly
>        910 =C2=B1  1%     -10.5%        815 =C2=B1  0%  proc-vmstat.nr_di=
rty
>      17652 =C2=B1  2%     -16.0%      14833 =C2=B1  3%  proc-vmstat.pageo=
utrun
>      59446 =C2=B1  0%     -20.2%      47455 =C2=B1  0%  proc-vmstat.pgact=
ivate
>     169701 =C2=B1  0%     +11.5%     189186 =C2=B1  5%  proc-vmstat.pgmig=
rate_success
>     355946 =C2=B1  0%     -64.2%     127593 =C2=B1  0%  proc-vmstat.pgpgin
>      27402 =C2=B1  7%     -23.9%      20844 =C2=B1 29%  proc-vmstat.pgste=
al_direct_dma32
>       4868 =C2=B1  0%     -56.8%       2104 =C2=B1  1%  proc-vmstat.worki=
ngset_refault
>       1624 =C2=B1  3%      -5.7%       1530 =C2=B1  1%  slabinfo.Acpi-Par=
seExt.active_objs
>       1624 =C2=B1  3%      -5.7%       1530 =C2=B1  1%  slabinfo.Acpi-Par=
seExt.num_objs
>       1009 =C2=B1  6%     -28.6%        720 =C2=B1 17%  slabinfo.btrfs_de=
layed_data_ref.active_objs
>       1016 =C2=B1  6%     -28.5%        726 =C2=B1 16%  slabinfo.btrfs_de=
layed_data_ref.num_objs
>        849 =C2=B1  0%     -10.3%        761 =C2=B1  4%  slabinfo.btrfs_de=
layed_ref_head.active_objs
>        851 =C2=B1  0%      -9.9%        767 =C2=B1  4%  slabinfo.btrfs_de=
layed_ref_head.num_objs
>      10883 =C2=B1  1%     -47.5%       5709 =C2=B1  4%  slabinfo.btrfs_ex=
tent_state.num_objs
>        213 =C2=B1  1%     -47.6%        111 =C2=B1  4%  slabinfo.btrfs_ex=
tent_state.num_slabs
>      10794 =C2=B1  1%     -48.6%       5551 =C2=B1  3%  slabinfo.btrfs_ex=
tent_state.active_objs
>        213 =C2=B1  1%     -47.6%        111 =C2=B1  4%  slabinfo.btrfs_ex=
tent_state.active_slabs
>       6596 =C2=B1  0%     -58.5%       2735 =C2=B1  1%  slabinfo.btrfs_pa=
th.num_objs
>        235 =C2=B1  0%     -58.6%         97 =C2=B1  1%  slabinfo.btrfs_pa=
th.active_slabs
>        235 =C2=B1  0%     -58.6%         97 =C2=B1  1%  slabinfo.btrfs_pa=
th.num_slabs
>       6592 =C2=B1  0%     -58.6%       2731 =C2=B1  1%  slabinfo.btrfs_pa=
th.active_objs
>       5055 =C2=B1  6%      -9.0%       4601 =C2=B1  2%  slabinfo.kmalloc-=
32.num_objs
>       5055 =C2=B1  6%      -9.0%       4601 =C2=B1  2%  slabinfo.kmalloc-=
32.active_objs
>       1512 =C2=B1  2%     -12.2%       1328 =C2=B1  5%  slabinfo.kmalloc-=
96.num_objs
>       1512 =C2=B1  2%     -12.2%       1328 =C2=B1  5%  slabinfo.kmalloc-=
96.active_objs
>        459 =C2=B1  2%     -16.8%        382 =C2=B1  6%  sched_debug.cfs_r=
q[0]:/.blocked_load_avg
>        478 =C2=B1  1%     -15.6%        403 =C2=B1  5%  sched_debug.cfs_r=
q[0]:/.tg_load_contrib
>         49 =C2=B1  7%      -9.1%         45 =C2=B1 11%  sched_debug.cfs_r=
q[3]:/.tg_runnable_contrib
>       2337 =C2=B1  6%      -9.9%       2106 =C2=B1 11%  sched_debug.cfs_r=
q[3]:/.avg->runnable_avg_sum
>      25079 =C2=B1  3%     -10.1%      22542 =C2=B1  4%  sched_debug.cfs_r=
q[3]:/.exec_clock
>         28 =C2=B1 17%     -35.7%         18 =C2=B1  9%  sched_debug.cfs_r=
q[3]:/.nr_spread_over
>     499222 =C2=B1 12%     -59.7%     201330 =C2=B1 40%  sched_debug.cpu#0=
.sched_goidle
>    1018389 =C2=B1 12%     -58.2%     425747 =C2=B1 37%  sched_debug.cpu#0=
.nr_switches
>      90529 =C2=B1  4%     -17.6%      74603 =C2=B1  8%  sched_debug.cpu#0=
.nr_load_updates
>     513982 =C2=B1 13%     -56.9%     221386 =C2=B1 36%  sched_debug.cpu#0=
.ttwu_count
>    1019018 =C2=B1 12%     -58.2%     426387 =C2=B1 37%  sched_debug.cpu#0=
.sched_count
>        320 =C2=B1  3%     -14.3%        274 =C2=B1 13%  sched_debug.cpu#0=
.load
>     323974 =C2=B1 21%    +131.6%     750473 =C2=B1 12%  sched_debug.cpu#1=
.sched_count
>     323373 =C2=B1 21%    +131.9%     749837 =C2=B1 12%  sched_debug.cpu#1=
.nr_switches
>      89555 =C2=B1 46%    +230.0%     295518 =C2=B1 16%  sched_debug.cpu#1=
.ttwu_local
>         13 =C2=B1 30%     +59.0%         20 =C2=B1  8%  sched_debug.cpu#1=
.cpu_load[2]
>          8 =C2=B1 41%    +111.8%         18 =C2=B1 12%  sched_debug.cpu#1=
.cpu_load[4]
>      68535 =C2=B1  4%     +22.2%      83732 =C2=B1  1%  sched_debug.cpu#1=
.nr_load_updates
>         10 =C2=B1 33%     +84.1%         19 =C2=B1  9%  sched_debug.cpu#1=
.cpu_load[3]
>     160382 =C2=B1 16%    +122.7%     357238 =C2=B1 12%  sched_debug.cpu#1=
.ttwu_count
>     151508 =C2=B1 22%    +140.8%     364820 =C2=B1 12%  sched_debug.cpu#1=
.sched_goidle
>     388481 =C2=B1  2%     -42.8%     222376 =C2=B1 46%  sched_debug.cpu#2=
.ttwu_local
>      87970 =C2=B1  3%      -6.8%      81971 =C2=B1  6%  sched_debug.cpu#2=
.nr_load_updates
>     452753 =C2=B1  3%     -37.3%     283785 =C2=B1 36%  sched_debug.cpu#2=
.ttwu_count
>     916511 =C2=B1  5%     -36.7%     580526 =C2=B1 36%  sched_debug.cpu#2=
.nr_switches
>     917118 =C2=B1  5%     -36.6%     581168 =C2=B1 36%  sched_debug.cpu#2=
.sched_count
>     448592 =C2=B1  5%     -37.9%     278755 =C2=B1 38%  sched_debug.cpu#2=
.sched_goidle
>     140376 =C2=B1  7%    +179.3%     392097 =C2=B1 28%  sched_debug.cpu#3=
.sched_goidle
>      68344 =C2=B1  2%     +24.1%      84790 =C2=B1  8%  sched_debug.cpu#3=
.nr_load_updates
>      78592 =C2=B1 33%    +335.3%     342125 =C2=B1 33%  sched_debug.cpu#3=
.ttwu_local
>     300663 =C2=B1  7%    +168.1%     806077 =C2=B1 27%  sched_debug.cpu#3=
.sched_count
>     149690 =C2=B1 12%    +182.2%     422447 =C2=B1 26%  sched_debug.cpu#3=
.ttwu_count
>     300054 =C2=B1  7%    +168.5%     805498 =C2=B1 27%  sched_debug.cpu#3=
.nr_switches
> =

> testbox/testcase/testparams: bay/fileio/performance-600s-100%-1HDD-btrfs-=
64G-1024f-rndwr-sync
> =

> f5c0a122800c301e  3a8b36f378060d20062a0918e9  =

> ----------------  --------------------------  =

>       1.32 =C2=B1  6%   +8834.3%     117.71 =C2=B1171%  fileio.request_la=
tency_max_ms
>      44.70 =C2=B1  0%     -56.7%      19.35 =C2=B1  0%  fileio.requests_p=
er_sec
>     156010 =C2=B1  0%     +38.4%     215846 =C2=B1  0%  fileio.time.volun=
tary_context_switches
>    2663864 =C2=B1  0%      -6.2%    2499112 =C2=B1  0%  fileio.time.file_=
system_outputs
>     156010 =C2=B1  0%     +38.4%     215846 =C2=B1  0%  time.voluntary_co=
ntext_switches
>      39761 =C2=B1  1%     +22.5%      48712 =C2=B1  2%  softirqs.RCU
>      37048 =C2=B1  1%     +17.1%      43380 =C2=B1  2%  softirqs.SCHED
>      52147 =C2=B1  1%     +15.3%      60140 =C2=B1  1%  softirqs.TIMER
>       2142 =C2=B1  0%      +4.6%       2239 =C2=B1  0%  vmstat.system.in
>       4067 =C2=B1  0%      +5.9%       4307 =C2=B1  0%  vmstat.system.cs
>     315172 =C2=B1  0%     -13.9%     271267 =C2=B1  0%  meminfo.Active
>     296097 =C2=B1  0%     -14.5%     253063 =C2=B1  0%  meminfo.Active(fi=
le)
>       3678 =C2=B1  0%     -42.1%       2131 =C2=B1  1%  meminfo.Dirty
>      47204 =C2=B1  0%     -14.5%      40351 =C2=B1  0%  meminfo.SReclaima=
ble
>      64571 =C2=B1  0%     -10.7%      57634 =C2=B1  0%  meminfo.Slab
>      74024 =C2=B1  0%     -14.5%      63263 =C2=B1  0%  proc-vmstat.nr_ac=
tive_file
>        919 =C2=B1  0%     -42.1%        532 =C2=B1  1%  proc-vmstat.nr_di=
rty
>      11801 =C2=B1  0%     -14.5%      10087 =C2=B1  0%  proc-vmstat.nr_sl=
ab_reclaimable
>      59906 =C2=B1  0%     -25.1%      44895 =C2=B1  0%  proc-vmstat.pgact=
ivate
>       1971 =C2=B1  5%      -8.0%       1814 =C2=B1  3%  slabinfo.anon_vma=
.active_objs
>       1971 =C2=B1  5%      -8.0%       1814 =C2=B1  3%  slabinfo.anon_vma=
.num_objs
>       1759 =C2=B1  7%     -17.1%       1457 =C2=B1  5%  slabinfo.btrfs_de=
layed_data_ref.active_objs
>       1768 =C2=B1  7%     -17.2%       1464 =C2=B1  5%  slabinfo.btrfs_de=
layed_data_ref.num_objs
>       1081 =C2=B1 15%     -41.9%        628 =C2=B1 11%  slabinfo.btrfs_de=
layed_tree_ref.active_objs
>       1082 =C2=B1 15%     -41.9%        628 =C2=B1 11%  slabinfo.btrfs_de=
layed_tree_ref.num_objs
>       2313 =C2=B1  1%     -21.9%       1805 =C2=B1  0%  slabinfo.btrfs_ex=
tent_buffer.num_objs
>       2301 =C2=B1  1%     -22.1%       1792 =C2=B1  0%  slabinfo.btrfs_ex=
tent_buffer.active_objs
>      13162 =C2=B1  0%     -51.8%       6341 =C2=B1  0%  slabinfo.btrfs_ex=
tent_state.num_objs
>        257 =C2=B1  0%     -51.9%        123 =C2=B1  0%  slabinfo.btrfs_ex=
tent_state.num_slabs
>      13152 =C2=B1  0%     -51.8%       6341 =C2=B1  0%  slabinfo.btrfs_ex=
tent_state.active_objs
>        257 =C2=B1  0%     -51.9%        123 =C2=B1  0%  slabinfo.btrfs_ex=
tent_state.active_slabs
>        715 =C2=B1  0%     -46.2%        385 =C2=B1  5%  slabinfo.btrfs_or=
dered_extent.active_objs
>        720 =C2=B1  0%     -43.4%        408 =C2=B1  5%  slabinfo.btrfs_or=
dered_extent.num_objs
>      26591 =C2=B1  0%     -51.4%      12924 =C2=B1  0%  slabinfo.btrfs_pa=
th.num_objs
>        949 =C2=B1  0%     -51.4%        461 =C2=B1  0%  slabinfo.btrfs_pa=
th.active_slabs
>        949 =C2=B1  0%     -51.4%        461 =C2=B1  0%  slabinfo.btrfs_pa=
th.num_slabs
>      26591 =C2=B1  0%     -51.4%      12924 =C2=B1  0%  slabinfo.btrfs_pa=
th.active_objs
>        670 =C2=B1  8%     -39.2%        407 =C2=B1  0%  slabinfo.ext4_ext=
ent_status.num_objs
>        670 =C2=B1  8%     -39.2%        407 =C2=B1  0%  slabinfo.ext4_ext=
ent_status.active_objs
>        503 =C2=B1  6%     -13.2%        437 =C2=B1  8%  slabinfo.mnt_cach=
e.active_objs
>        522 =C2=B1  7%     -13.4%        452 =C2=B1  6%  slabinfo.mnt_cach=
e.num_objs
>      26243 =C2=B1  0%     -26.8%      19212 =C2=B1  0%  slabinfo.radix_tr=
ee_node.num_objs
>      26243 =C2=B1  0%     -26.8%      19212 =C2=B1  0%  slabinfo.radix_tr=
ee_node.active_objs
>        937 =C2=B1  0%     -26.8%        685 =C2=B1  0%  slabinfo.radix_tr=
ee_node.active_slabs
>        937 =C2=B1  0%     -26.8%        685 =C2=B1  0%  slabinfo.radix_tr=
ee_node.num_slabs
> =

> lkp-sb02: Sandy Bridge-EP
> Memory: 4G
> =

> bay: Pentium D
> Memory: 2G
> =

> =

> =

> =

>                              fileio.requests_per_sec
> =

>   50 ++------------------------------------------------------------------=
---+
>      |                                                                   =
   |
>   45 *+.*..*...*..*..*..*...*..*..*..*...*..*..*..*..*...*..*..*..*...*..=
*..*
>   40 ++                                                                  =
   |
>      |                                                                   =
   |
>   35 ++                                                                  =
   |
>      |                                                                   =
   |
>   30 ++                                                                  =
   |
>      |                                                                   =
   |
>   25 ++                                                                  =
   |
>   20 ++                                                                  =
   |
>      O         O        O   O     O                                      =
   |
>   15 ++ O  O      O            O     O   O  O  O  O  O   O  O  O         =
   |
>      |                                                                   =
   |
>   10 ++--------------O---------------------------------------------------=
---+
> =

> =

>                             fileio.time.file_system_outputs
> =

>   2.6e+06 ++-------------------------------------------------------------=
---+
>   2.5e+06 *+.*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..=
*..*
>           |                                                              =
   |
>   2.4e+06 O+ O  O  O        O  O           O     O           O  O        =
   |
>   2.3e+06 ++          O           O  O  O     O     O  O  O              =
   |
>   2.2e+06 ++                                                             =
   |
>   2.1e+06 ++                                                             =
   |
>           |                                                              =
   |
>     2e+06 ++                                                             =
   |
>   1.9e+06 ++                                                             =
   |
>   1.8e+06 ++                                                             =
   |
>   1.7e+06 ++                                                             =
   |
>           |                                                              =
   |
>   1.6e+06 ++             O                                               =
   |
>   1.5e+06 ++-------------------------------------------------------------=
---+
> =

> =

>                              proc-vmstat.nr_active_file
> =

>   75000 ++---------------------------------------------------------------=
---+
>         |                                                                =
   |
>   70000 ++                                                              .=
*..|
>         *..*..*..*..*..*...*..*..*..*..*..*..*..  .*..  .*...*..*..*..*. =
   *
>         |                                       *.    *.                 =
   |
>   65000 ++                                                               =
   |
>         |                                                                =
   |
>   60000 ++                                                               =
   |
>         |                              O              O                  =
   |
>   55000 O+ O  O  O  O      O  O  O  O     O  O  O  O     O   O  O        =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>   50000 ++             O                                                 =
   |
>         |                                                                =
   |
>   45000 ++---------------------------------------------------------------=
---+
> =

> =

>                                proc-vmstat.nr_dirty
> =

>   1000 ++----------------------------------------------------------------=
---+
>        *..*..*..*...*..*..*..*..*..*..*...  .*..  .*..  .*..*..*...*..*..=
*..*
>    900 ++                                 *.    *.    *.                 =
   |
>        |                                                                 =
   |
>    800 ++                                                                =
   |
>        |                                                                 =
   |
>    700 ++                                                                =
   |
>        |                                                                 =
   |
>    600 ++                                                                =
   |
>        |                                                                 =
   |
>    500 O+ O  O  O   O     O  O  O  O  O   O  O  O  O  O  O  O  O         =
   |
>        |                                                                 =
   |
>    400 ++              O                                                 =
   |
>        |                                                                 =
   |
>    300 ++----------------------------------------------------------------=
---+
> =

> =

>                            proc-vmstat.nr_slab_reclaimable
> =

>   12000 ++--------------------------*--*-----*-----*-----*---*-----*--*--=
---*
>         |                         ..      *.     ..    ..       *.       =
*. |
>         *..*..*..*..*..*...*..*..*              *     *                  =
   |
>   11500 ++                                                               =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>   11000 ++                                                               =
   |
>         |                                                                =
   |
>   10500 ++                                                               =
   |
>         |                                                                =
   |
>         |                                 O  O  O  O  O  O   O  O        =
   |
>   10000 ++    O               O                                          =
   |
>         O  O     O  O      O     O  O  O                                 =
   |
>         |                                                                =
   |
>    9500 ++-------------O-------------------------------------------------=
---+
> =

> =

>                                proc-vmstat.nr_dirtied
> =

>   340000 *+-*--*--*--*--*--*--*--*--*--*---*--*--*--*--*--*--*--*--*--*--=
*--*
>          |                                                               =
   |
>   320000 ++                                                              =
   |
>          |                 O                                             =
   |
>   300000 O+ O  O  O  O        O  O  O  O   O  O  O  O  O  O  O  O        =
   |
>          |                                                               =
   |
>   280000 ++                                                              =
   |
>          |                                                               =
   |
>   260000 ++                                                              =
   |
>          |                                                               =
   |
>   240000 ++                                                              =
   |
>          |                                                               =
   |
>   220000 ++                                                              =
   |
>          |                                                               =
   |
>   200000 ++-------------O------------------------------------------------=
---+
> =

> =

>                                proc-vmstat.nr_written
> =

>   340000 ++-*-----*--------*------------------*--*--*--*-----*--*--*--*--=
---*
>          *.    *.    *..*.    *..*..*..*...*.             *.             =
*. |
>   320000 ++                                                              =
   |
>          |                                                               =
   |
>   300000 O+ O  O  O  O     O  O  O  O  O   O  O  O  O  O  O  O  O        =
   |
>          |                                                               =
   |
>   280000 ++                                                              =
   |
>          |                                                               =
   |
>   260000 ++                                                              =
   |
>          |                                                               =
   |
>   240000 ++                                                              =
   |
>          |                                                               =
   |
>   220000 ++                                                              =
   |
>          |                                                               =
   |
>   200000 ++-------------O------------------------------------------------=
---+
> =

> =

>                                proc-vmstat.pgactivate
> =

>   60000 ++---------------------------------------------------------------=
*--+
>         |                                                              ..=
   |
>   55000 *+.*..*..*..*..*...*..*..*..*..*..*..*..*..*..*..*...*..*..*..*  =
   *
>         |                                                                =
   |
>   50000 ++                                                               =
   |
>         O  O  O  O  O         O  O  O  O  O  O  O  O  O  O   O  O        =
   |
>   45000 ++                 O                                             =
   |
>         |                                                                =
   |
>   40000 ++                                                               =
   |
>         |                                                                =
   |
>   35000 ++                                                               =
   |
>         |                                                                =
   |
>   30000 ++             O                                                 =
   |
>         |                                                                =
   |
>   25000 ++---------------------------------------------------------------=
---+
> =

> =

>                                    meminfo.Active
> =

>   310000 ++--------------------------------------------------------------=
---+
>   300000 ++                                                              =
*..|
>          | .*..*..*..*..              .*...  .*..         *..          ..=
   *
>   290000 *+             *..*..*..*..*.     *.      .*.. ..   *..*..*..*  =
   |
>   280000 ++                                      *.    *                 =
   |
>          |                                                               =
   |
>   270000 ++                                                              =
   |
>   260000 ++                                                              =
   |
>   250000 ++                                                              =
   |
>          O  O  O  O  O        O  O  O  O   O  O  O  O  O  O  O  O        =
   |
>   240000 ++                O                                             =
   |
>   230000 ++                                                              =
   |
>          |                                                               =
   |
>   220000 ++             O                                                =
   |
>   210000 ++--------------------------------------------------------------=
---+
> =

> =

>                                 meminfo.Active(file)
> =

>   290000 ++--------------------------------------------------------------=
---+
>   280000 ++                                                              =
*..|
>          | .*..*..*..*..*..*..*..*..*..*...  .*..         *..*..       ..=
   *
>   270000 *+                                *.    *..*.. ..      *..*..*  =
   |
>   260000 ++                                            *                 =
   |
>          |                                                               =
   |
>   250000 ++                                                              =
   |
>   240000 ++                                                              =
   |
>   230000 ++                                                              =
   |
>          O  O  O  O  O        O  O  O  O   O  O  O  O  O  O  O  O        =
   |
>   220000 ++                O                                             =
   |
>   210000 ++                                                              =
   |
>          |                                                               =
   |
>   200000 ++             O                                                =
   |
>   190000 ++--------------------------------------------------------------=
---+
> =

> =

>                                    meminfo.Dirty
> =

>   4000 ++----------------------------------------------------------------=
---+
>        *..*..*..*...*..*..*..*..*..*..*...  .*..        .*..*..*...*..*..=
*..*
>        |                                  *.    *..*..*.                 =
   |
>   3500 ++                                                                =
   |
>        |                                                                 =
   |
>        |                                                                 =
   |
>   3000 ++                                                                =
   |
>        |                                                                 =
   |
>   2500 ++                                                                =
   |
>        |                                                                 =
   |
>        |                                                                 =
   |
>   2000 O+ O  O  O   O     O  O  O  O  O   O  O  O  O  O  O  O  O         =
   |
>        |                                                                 =
   |
>        |                                                                 =
   |
>   1500 ++--------------O-------------------------------------------------=
---+
> =

> =

>                                     meminfo.Slab
> =

>   67000 ++---------------------------------------------------------------=
---+
>   66000 ++                          *..*..  .*..   *..     ..*..  .*..  .=
*..*
>         |                         ..      *.     ..     .*.     *.    *. =
   |
>   65000 *+.*..*..*..*..*...*..*..*              *     *.                 =
   |
>   64000 ++                                                               =
   |
>   63000 ++                                                               =
   |
>   62000 ++                                                               =
   |
>         |                                                                =
   |
>   61000 ++                                                               =
   |
>   60000 ++                                                               =
   |
>   59000 ++                       O        O  O  O  O  O  O   O  O        =
   |
>   58000 ++ O  O               O        O                                 =
   |
>         O        O  O      O        O                                    =
   |
>   57000 ++             O                                                 =
   |
>   56000 ++---------------------------------------------------------------=
---+
> =

> =

>                                 meminfo.SReclaimable
> =

>   48000 ++--------------------------*--*-----*-----*-----*---*-----*--*--=
---*
>   47000 ++                        ..      *.     ..    ..       *.       =
*. |
>         *..*..*..*..*..*...*..*..*              *     *                  =
   |
>   46000 ++                                                               =
   |
>   45000 ++                                                               =
   |
>         |                                                                =
   |
>   44000 ++                                                               =
   |
>   43000 ++                                                               =
   |
>   42000 ++                                                               =
   |
>         |                                                                =
   |
>   41000 ++                                O  O  O  O  O  O   O  O        =
   |
>   40000 ++    O               O                                          =
   |
>         O  O     O  O      O     O  O  O                                 =
   |
>   39000 ++                                                               =
   |
>   38000 ++-------------O-------------------------------------------------=
---+
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

> 	apt-get install ruby
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml

Hi, thanks for this.

However this doesn't make sense to me.
This commit only touches btrfs' fsync handler and the test uses sysbench
without passing --file-fsync-freq to it, which means sysbench will never
do fsyncs according to its man page (default for fsync frequency is 0).

Or maybe I missed something?

thanks


> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Ying Huang
> =

> =

> =

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
>=20

--===============7511788818575644631==--

