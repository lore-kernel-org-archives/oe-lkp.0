Content-Type: multipart/mixed; boundary="===============1723658202419167333=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Thu, 28 Jun 2018 08:38:34 +0800
Message-ID: <20180628003834.GH18756@yexl-desktop>
In-Reply-To: <20180627070745.GA9765@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1723658202419167333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/27, Christoph Hellwig wrote:
>On Tue, Jun 26, 2018 at 02:03:38PM +0800, Ye Xiaolong wrote:
>> Hi,
>> =

>> On 06/22, Christoph Hellwig wrote:
>> >Hi Xiaolong,
>> >
>> >can you retest this workload on the following branch:
>> >
>> >    git://git.infradead.org/users/hch/vfs.git remove-get-poll-head
>> >
>> >Gitweb:
>> >
>> >    http://git.infradead.org/users/hch/vfs.git/shortlog/refs/heads/remo=
ve-get-poll-head
>> =

>> Here is the comparison for commit 3deb642f0d and commit 8fbedc1 ("fs: re=
place f_ops->get_poll_head with a static ->f_poll_head pointer") in remove-=
get-poll-head branch.
>
>Especially the boot time ones and others look like they have additional
>changes.
>
>Can you compare the baseline of my tree, which is
>894b8c00 ("Merge tag 'for_v4.18-rc2' of
>git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs") against 8fbe=
dc1
>(("fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer") ?

Update the result:

testcase/path_params/tbox_group/run: will-it-scale/poll2-performance/lkp-sb=
03

894b8c000ae6c106  8fbedc19c94fd25a2b9b327015  =

----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

    404611 =C2=B1  4%         5%     424608        will-it-scale.per_proces=
s_ops
      1489 =C2=B1 21%        28%       1899 =C2=B1 18%  will-it-scale.time.=
voluntary_context_switches
  45828560                    46155690        will-it-scale.workload
      2337                        2342        will-it-scale.time.system_time
       806                         806        will-it-scale.time.percent_of=
_cpu_this_job_got
       310                         310        will-it-scale.time.elapsed_ti=
me
       310                         310        will-it-scale.time.elapsed_ti=
me.max
      4096                        4096        will-it-scale.time.page_size
    233917                      233862        will-it-scale.per_thread_ops
     17196                       17179        will-it-scale.time.minor_page=
_faults
      9901                        9862        will-it-scale.time.maximum_re=
sident_set_size
     14705 =C2=B1  3%                 14397 =C2=B1  4%  will-it-scale.time.=
involuntary_context_switches
       167                         163        will-it-scale.time.user_time
      0.66 =C2=B1 25%       -17%       0.54        will-it-scale.scalability
    120508 =C2=B1 15%        -7%     112098 =C2=B1  5%  interrupts.CAL:Func=
tion_call_interrupts
      1670 =C2=B1  3%        10%       1845 =C2=B1  3%  vmstat.system.cs
     32707                       32635        vmstat.system.in
       121                         122        turbostat.CorWatt
       149                         150        turbostat.PkgWatt
      1573                        1573        turbostat.Avg_MHz
     17.54 =C2=B1 19%                 17.77 =C2=B1 19%  boot-time.kernel_bo=
ot
       824 =C2=B1 12%                   834 =C2=B1 12%  boot-time.idle
     27.45 =C2=B1 12%                 27.69 =C2=B1 12%  boot-time.boot
     16.96 =C2=B1 21%                 16.93 =C2=B1 21%  boot-time.dhcp
      1489 =C2=B1 21%        28%       1899 =C2=B1 18%  time.voluntary_cont=
ext_switches
      2337                        2342        time.system_time
       806                         806        time.percent_of_cpu_this_job_=
got
       310                         310        time.elapsed_time
       310                         310        time.elapsed_time.max
      4096                        4096        time.page_size
     17196                       17179        time.minor_page_faults
      9901                        9862        time.maximum_resident_set_size
     14705 =C2=B1  3%                 14397 =C2=B1  4%  time.involuntary_co=
ntext_switches
       167                         163        time.user_time
     18320               6%      19506 =C2=B1  8%  proc-vmstat.nr_slab_unre=
claimable
      1518 =C2=B1  7%                  1558 =C2=B1 10%  proc-vmstat.numa_hi=
nt_faults
      1387 =C2=B1  8%                  1421 =C2=B1  9%  proc-vmstat.numa_hi=
nt_faults_local
      1873 =C2=B1  5%                  1917 =C2=B1  8%  proc-vmstat.numa_pt=
e_updates
     19987                       20005        proc-vmstat.nr_anon_pages
      8464                        8471        proc-vmstat.nr_kernel_stack
    309815                      310062        proc-vmstat.nr_file_pages
     50828                       50828        proc-vmstat.nr_free_cma
  16065590                    16064831        proc-vmstat.nr_free_pages
   3194669                     3194517        proc-vmstat.nr_dirty_threshold
   1595384                     1595308        proc-vmstat.nr_dirty_backgrou=
nd_threshold
    798886                      797937        proc-vmstat.pgfault
      6510                        6499        proc-vmstat.nr_mapped
    659089                      657491        proc-vmstat.numa_local
    665458                      663786        proc-vmstat.numa_hit
      1037                        1033        proc-vmstat.nr_page_table_pag=
es
    669923                      665906        proc-vmstat.pgfree
    676982                      672385        proc-vmstat.pgalloc_normal
      6368                        6294        proc-vmstat.numa_other
     13013              -7%      12152 =C2=B1 11%  proc-vmstat.nr_slab_recl=
aimable
  51213164 =C2=B1 18%        23%   63014695 =C2=B1 25%  perf-stat.node-loads
  22096136 =C2=B1 28%        20%   26619357 =C2=B1 35%  perf-stat.node-load=
-misses
 2.079e+08 =C2=B1  9%        12%  2.323e+08 =C2=B1 11%  perf-stat.cache-mis=
ses
    515039 =C2=B1  3%        10%     568299 =C2=B1  3%  perf-stat.context-s=
witches
 3.283e+08 =C2=B1 22%        10%  3.622e+08 =C2=B1  5%  perf-stat.iTLB-loads

Thanks,
Xiaolong

--===============1723658202419167333==--

