Content-Type: multipart/mixed; boundary="===============6661439993533696739=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched] 177672afd93: -40.9% dbench.throughput-MB/sec
Date: Sat, 05 Apr 2014 22:16:42 +0800
Message-ID: <20140405141642.GB13106@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============6661439993533696739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tim,

Up to now, the system catches one regression in

git://bee.sh.intel.com/git/wfg/linux-devel.git tim-idle-load-balance
commit 177672afd93461854abe26c05bd549647efc09db ("sched: Reduce the rate of=
 idle load balancing")

test case: nhm8/micro/dbench/100%

          v3.14  177672afd93461854abe26c05  =

---------------  -------------------------  =

      8214 ~ 0%     -40.9%       4854 ~ 0%  TOTAL dbench.throughput-MB/sec
    443685 ~ 0%    +156.5%    1138160 ~20%  TOTAL softirqs.RCU
      3.38 ~ 0%     -52.1%       1.62 ~ 0%  TOTAL turbostat.GHz
     81260 ~ 1%     -42.7%      46534 ~ 1%  TOTAL slabinfo.kmalloc-256.acti=
ve_objs
       280 ~23%     +85.4%        520 ~12%  TOTAL cpuidle.C3-NHM.usage
      2556 ~ 1%     -42.6%       1467 ~ 1%  TOTAL slabinfo.kmalloc-256.num_=
slabs
      2556 ~ 1%     -42.6%       1467 ~ 1%  TOTAL slabinfo.kmalloc-256.acti=
ve_slabs
     81822 ~ 1%     -42.6%      46982 ~ 1%  TOTAL slabinfo.kmalloc-256.num_=
objs
      8.34 ~ 0%     -42.2%       4.82 ~ 1%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.generic_file_buffered_write.__generic_file_aio_writ=
e.generic_file_aio_write.do_sync_write
     17.87 ~ 0%     -42.6%      10.26 ~ 0%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.generic_file_aio_read.do_sync_read.vfs_read.sys_pre=
ad64
   7029777 ~ 0%     -40.8%    4164671 ~ 0%  TOTAL proc-vmstat.pgactivate
      0.78 ~ 1%     +41.2%       1.10 ~ 1%  TOTAL perf-profile.cpu-cycles.f=
illdir.dcache_readdir.iterate_dir.sys_getdents.system_call_fastpath
      0.75 ~ 2%     +42.9%       1.07 ~ 1%  TOTAL perf-profile.cpu-cycles.s=
trchr(a)plt
     91820 ~ 0%     -25.1%      68743 ~ 0%  TOTAL slabinfo.dentry.active_ob=
js
      2234 ~ 0%     -25.0%       1675 ~ 0%  TOTAL slabinfo.dentry.num_slabs
      2234 ~ 0%     -25.0%       1675 ~ 0%  TOTAL slabinfo.dentry.active_sl=
abs
     93857 ~ 0%     -25.0%      70409 ~ 0%  TOTAL slabinfo.dentry.num_objs
      1.48 ~ 1%     +34.2%       1.98 ~ 0%  TOTAL perf-profile.cpu-cycles.c=
opy_user_generic_string.dcache_readdir.iterate_dir.sys_getdents.system_call=
_fastpath
      0.82 ~ 5%     +31.9%       1.08 ~ 4%  TOTAL perf-profile.cpu-cycles._=
_d_lookup_rcu.lookup_fast.link_path_walk.path_lookupat.filename_lookup
      9908 ~ 1%     -21.3%       7798 ~ 0%  TOTAL proc-vmstat.nr_slab_unrec=
laimable
     39507 ~ 0%     -21.4%      31047 ~ 0%  TOTAL meminfo.SUnreclaim
        61 ~ 1%     -20.1%         49 ~ 2%  TOTAL turbostat.CTMP
      0.85 ~ 2%     +22.9%       1.04 ~ 1%  TOTAL perf-profile.cpu-cycles.c=
lose
      1.31 ~ 1%     +22.9%       1.61 ~ 1%  TOTAL perf-profile.cpu-cycles.l=
ink_path_walk.path_lookupat.filename_lookup.user_path_at_empty.user_path_at
     92159 ~ 0%     -16.6%      76833 ~ 0%  TOTAL meminfo.Slab
     14061 ~ 4%     +20.9%      16994 ~ 1%  TOTAL interrupts.RES
      1.45 ~ 1%     +16.9%       1.69 ~ 0%  TOTAL perf-profile.cpu-cycles._=
raw_spin_lock.dcache_readdir.iterate_dir.sys_getdents.system_call_fastpath
     13180 ~ 0%     -13.1%      11451 ~ 0%  TOTAL proc-vmstat.nr_slab_recla=
imable
     52651 ~ 0%     -13.0%      45786 ~ 0%  TOTAL meminfo.SReclaimable
      3096 ~ 0%     +15.6%       3581 ~ 0%  TOTAL time.user_time
      5514 ~ 0%      -8.9%       5023 ~ 0%  TOTAL time.system_time
    225997 ~ 0%      +3.1%     233003 ~ 1%  TOTAL time.involuntary_context_=
switches

Legend:
	~XX%    - stddev percent
	[+-]XX% - change percent


                                   time.user_time

   3600 ++-------------O-------O------O------------------------------------=
-+
        O       O                                                          =
 |
   3500 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   3400 ++                                                                 =
 |
        |                                                                  =
 |
   3300 ++                                                                 =
 |
        |                                                                  =
 |
   3200 ++                                                                 =
 |
        |                                                                  =
 |
        *.......                          ....*......                   ...=
.*
   3100 ++      *......*.......*......*...           *.......*......*...   =
 |
        |                                                                  =
 |
   3000 ++-----------------------------------------------------------------=
-+


                                  time.system_time

   5600 ++-----------------------------------------------------------------=
-+
        |                                                                  =
 |
   5500 ++  ....*......*.......*......*.......*......*.......*......*......=
.*
        *...                                                               =
 |
        |                                                                  =
 |
   5400 ++                                                                 =
 |
        |                                                                  =
 |
   5300 ++                                                                 =
 |
        |                                                                  =
 |
   5200 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   5100 ++                                                                 =
 |
        O       O                     O                                    =
 |
   5000 ++-------------O-------O-------------------------------------------=
-+


                              dbench.throughput-MB/sec

   8500 ++-----------------------------------------------------------------=
-+
        *.......*......*.......*......*.......*......*.......*......*......=
.*
   8000 ++                                                                 =
 |
   7500 ++                                                                 =
 |
        |                                                                  =
 |
   7000 ++                                                                 =
 |
        |                                                                  =
 |
   6500 ++                                                                 =
 |
        |                                                                  =
 |
   6000 ++                                                                 =
 |
   5500 ++                                                                 =
 |
        |                                                                  =
 |
   5000 ++                                                                 =
 |
        O       O      O       O      O                                    =
 |
   4500 ++-----------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

Thanks,
Fengguang

--===============6661439993533696739==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZGJlbmNoIDEyIC1jIC91c3Ivc2hhcmUvZGJlbmNoL2NsaWVudC50eHQK

--===============6661439993533696739==--

