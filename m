Content-Type: multipart/mixed; boundary="===============2755441427864602971=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Tue, 26 Jun 2018 14:03:38 +0800
Message-ID: <20180626060338.GU12146@yexl-desktop>
In-Reply-To: <20180622150251.GA12802@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2755441427864602971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 06/22, Christoph Hellwig wrote:
>Hi Xiaolong,
>
>can you retest this workload on the following branch:
>
>    git://git.infradead.org/users/hch/vfs.git remove-get-poll-head
>
>Gitweb:
>
>    http://git.infradead.org/users/hch/vfs.git/shortlog/refs/heads/remove-=
get-poll-head

Here is the comparison for commit 3deb642f0d and commit 8fbedc1 ("fs: repla=
ce f_ops->get_poll_head with a static ->f_poll_head pointer") in remove-get=
-poll-head branch.

3deb642f0de4c14f  8fbedc19c94fd25a2b9b327015  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

    457120              -7%     424608        will-it-scale.per_process_ops
    238978                      233862        will-it-scale.per_thread_ops
      1755 =C2=B1 13%         8%       1899 =C2=B1 18%  will-it-scale.time.=
voluntary_context_switches
      2332                        2342        will-it-scale.time.system_time
       310                         310        will-it-scale.time.elapsed_ti=
me
       310                         310        will-it-scale.time.elapsed_ti=
me.max
      4096                        4096        will-it-scale.time.page_size
      0.54                        0.54        will-it-scale.scalability
       807                         806        will-it-scale.time.percent_of=
_cpu_this_job_got
     17218                       17179        will-it-scale.time.minor_page=
_faults
      9931                        9862        will-it-scale.time.maximum_re=
sident_set_size
       173              -6%        163        will-it-scale.time.user_time
  49024375              -6%   46155690        will-it-scale.workload
     17818 =C2=B1 10%       -19%      14397 =C2=B1  4%  will-it-scale.time.=
involuntary_context_switches
    116842 =C2=B1 12%        -4%     112098 =C2=B1  5%  interrupts.CAL:Func=
tion_call_interrupts
     32735                       32635        vmstat.system.in
      2112 =C2=B1  7%       -13%       1845 =C2=B1  3%  vmstat.system.cs
       150                         150        turbostat.PkgWatt
       123                         122        turbostat.CorWatt
      1573                        1573        turbostat.Avg_MHz
     15.73              13%      17.77 =C2=B1 19%  boot-time.kernel_boot
     15.07              12%      16.93 =C2=B1 21%  boot-time.dhcp
       771               8%        834 =C2=B1 12%  boot-time.idle
     25.69               8%      27.69 =C2=B1 12%  boot-time.boot
      1755 =C2=B1 13%         8%       1899 =C2=B1 18%  time.voluntary_cont=
ext_switches
      2332                        2342        time.system_time
       310                         310        time.elapsed_time
       310                         310        time.elapsed_time.max
      4096                        4096        time.page_size
       807                         806        time.percent_of_cpu_this_job_=
got
     17218                       17179        time.minor_page_faults
      9931                        9862        time.maximum_resident_set_size
       173              -6%        163        time.user_time
     17818 =C2=B1 10%       -19%      14397 =C2=B1  4%  time.involuntary_co=
ntext_switches
    428813 =C2=B1  9%        57%     672385        proc-vmstat.pgalloc_norm=
al
     41736 =C2=B1 15%        22%      50828        proc-vmstat.nr_free_cma
     18116               8%      19506 =C2=B1  8%  proc-vmstat.nr_slab_unre=
claimable
      1029                        1033        proc-vmstat.nr_page_table_pag=
es
      8453                        8471        proc-vmstat.nr_kernel_stack
      6486                        6499        proc-vmstat.nr_mapped
   3193607                     3194517        proc-vmstat.nr_dirty_threshold
   1594853                     1595308        proc-vmstat.nr_dirty_backgrou=
nd_threshold
  16061877                    16064831        proc-vmstat.nr_free_pages
     20009                       20005        proc-vmstat.nr_anon_pages
      6303                        6294        proc-vmstat.numa_other
    799772                      797937        proc-vmstat.pgfault
    667803                      665906        proc-vmstat.pgfree
    666440                      663786        proc-vmstat.numa_hit
    660136                      657491        proc-vmstat.numa_local
    313125                      310062        proc-vmstat.nr_file_pages
      1941 =C2=B1  5%                  1917 =C2=B1  8%  proc-vmstat.numa_pt=
e_updates
      1448 =C2=B1  7%                  1421 =C2=B1  9%  proc-vmstat.numa_hi=
nt_faults_local
      1596 =C2=B1  6%                  1558 =C2=B1 10%  proc-vmstat.numa_hi=
nt_faults
     12893              -6%      12152 =C2=B1 11%  proc-vmstat.nr_slab_recl=
aimable
     22885            -100%          0        proc-vmstat.nr_indirectly_rec=
laimable
    245443 =C2=B1 16%      -100%          0        proc-vmstat.pgalloc_mova=
ble
  19861107 =C2=B1 14%        34%   26619357 =C2=B1 35%  perf-stat.node-load=
-misses
  51734389 =C2=B1  5%        22%   63014695 =C2=B1 25%  perf-stat.node-loads
 1.924e+09 =C2=B1  3%        21%   2.32e+09 =C2=B1  5%  perf-stat.iTLB-load=
-misses
 2.342e+09 =C2=B1  8%        15%  2.695e+09 =C2=B1  4%  perf-stat.cache-ref=
erences
 3.251e+08 =C2=B1  7%        11%  3.622e+08 =C2=B1  5%  perf-stat.iTLB-loads
 2.106e+08 =C2=B1  4%        10%  2.323e+08 =C2=B1 11%  perf-stat.cache-mis=
ses
      0.74               7%       0.79        perf-stat.cpi
 1.605e+08 =C2=B1  7%         6%  1.703e+08 =C2=B1  6%  perf-stat.node-stor=
es
  50804799 =C2=B1 16%         5%   53535896 =C2=B1 18%  perf-stat.node-stor=
e-misses
     27.63 =C2=B1  8%         5%      29.07 =C2=B1  8%  perf-stat.node-load=
-miss-rate%
     85.55                       86.49        perf-stat.iTLB-load-miss-rate%
      0.25                        0.25        perf-stat.branch-miss-rate%
    778741                      776946        perf-stat.minor-faults
    778753                      776948        perf-stat.page-faults
     23.93 =C2=B1  9%                 23.75 =C2=B1 12%  perf-stat.node-stor=
e-miss-rate%
      9117 =C2=B1  4%                  8969 =C2=B1  4%  perf-stat.cpu-migra=
tions
  1.59e+13              -4%  1.533e+13        perf-stat.cpu-cycles
    439328 =C2=B1  3%        -5%     419250 =C2=B1  5%  perf-stat.path-leng=
th
      9.05 =C2=B1  8%        -5%       8.62 =C2=B1  9%  perf-stat.cache-mis=
s-rate%
      0.44 =C2=B1 39%        -6%       0.42 =C2=B1 31%  perf-stat.dTLB-load=
-miss-rate%
      1.35              -7%       1.26        perf-stat.ipc
 3.294e+12 =C2=B1  3%        -9%  2.988e+12 =C2=B1  3%  perf-stat.dTLB-stor=
es
 5.451e+12 =C2=B1  4%       -10%  4.905e+12 =C2=B1  4%  perf-stat.dTLB-loads
 4.667e+12 =C2=B1  3%       -10%  4.195e+12 =C2=B1  4%  perf-stat.branch-in=
structions
 2.154e+13 =C2=B1  3%       -10%  1.935e+13 =C2=B1  4%  perf-stat.instructi=
ons
 1.161e+10 =C2=B1  4%       -10%  1.043e+10 =C2=B1  5%  perf-stat.branch-mi=
sses
 2.401e+10 =C2=B1 34%       -13%  2.093e+10 =C2=B1 36%  perf-stat.dTLB-load=
-misses
    653927 =C2=B1  8%       -13%     568299 =C2=B1  3%  perf-stat.context-s=
witches
     11203 =C2=B1  4%       -26%       8344        perf-stat.instructions-p=
er-iTLB-miss
      0.02 =C2=B1 41%       -50%       0.01 =C2=B1 47%  perf-stat.dTLB-stor=
e-miss-rate%
 7.557e+08 =C2=B1 37%       -53%  3.521e+08 =C2=B1 49%  perf-stat.dTLB-stor=
e-misses

Thanks,
Xiaolong

--===============2755441427864602971==--

