Content-Type: multipart/mixed; boundary="===============3890814377996905258=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [ARM] f9ff907b0af: -100.0% slabinfo.cfq_queue.num_objs
Date: Thu, 29 May 2014 14:00:12 +0800
Message-ID: <20140529060012.GF7412@localhost>
In-Reply-To: <5386BDDB.9010708@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3890814377996905258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Let's ignore this. I don't see meaningful perf/power changes.

On Thu, May 29, 2014 at 12:55:55PM +0800, Jet Chen wrote:
> TO: Rabin Vincent <rabin@rab.in>
> CC: Russell King <rmk+kernel@arm.linux.org.uk>
> CC: LKML <linux-kernel@vger.kernel.org>
> CC: lkp(a)01.org
> =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit f9ff907b0af561dcde4683f7c9f71dc0f41d3be3 ("ARM: 8048/1: fix v7-M s=
etup stack location")
> =

> test case: lkp-st02/dd-write/11HDD-RAID5-cfq-ext4-1dd
> =

>       v3.15-rc6  f9ff907b0af561dcde4683f7c
>   ---------------  -------------------------
>        273 ~ 3%    -100.0%          0 ~ 0%  TOTAL slabinfo.cfq_queue.num_=
objs
>   65541468 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.time
>        273 ~ 3%    -100.0%          0 ~ 0%  TOTAL slabinfo.cfq_queue.acti=
ve_objs
>        969 ~ 8%    -100.0%          0 ~ 0%  TOTAL slabinfo.ip6_dst_cache.=
num_objs
>        948 ~ 8%    -100.0%          0 ~ 0%  TOTAL slabinfo.ip6_dst_cache.=
active_objs
>      12399 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.bdi_dirty_rateli=
mit.md0.balanced_dirty_ratelimit
>      14234 ~ 2%    -100.0%          0 ~ 0%  TOTAL ftrace.bdi_dirty_rateli=
mit.md0.task_ratelimit
>      10649 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.bdi_dirty_rateli=
mit.md0.dirty_ratelimit
>      17409 ~ 2%    -100.0%          0 ~ 0%  TOTAL ftrace.bdi_dirty_rateli=
mit.md0.dirty_rate
>      13787 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.bdi_dirty_rateli=
mit.md0.awrite_bw
>      14464 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.bdi_dirty_rateli=
mit.md0.write_bw
>   65322936 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.bdi_dirty_rateli=
mit.md0.time
>         31 ~ 3%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.dirtied_pause
>         31 ~ 3%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.dirtied
>      14350 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.task_ratelimit
>      10633 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.dirty_ratelimit
>      13720 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.bdi_dirty
>      15220 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.bdi_setpoint
>      13720 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.dirty
>      15251 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.setpoint
>      17638 ~ 1%    -100.0%          0 ~ 0%  TOTAL ftrace.balance_dirty_pa=
ges.md0.limit
>      36455 ~ 0%    +221.6%     117256 ~ 0%  TOTAL proc-vmstat.unevictable=
_pgs_culled
>     986338 ~ 0%     -55.5%     438629 ~ 0%  TOTAL meminfo.Unevictable
>     246584 ~ 0%     -55.5%     109657 ~ 0%  TOTAL proc-vmstat.nr_unevicta=
ble
>      84787 ~20%     -47.1%      44851 ~10%  TOTAL meminfo.DirectMap4k
>   11266582 ~ 1%     -38.7%    6903348 ~ 0%  TOTAL ftrace.writeback_single=
_inode.md0.index
>      10996 ~ 9%     -25.9%       8143 ~14%  TOTAL meminfo.AnonHugePages
>       1127 ~ 2%     +29.8%       1462 ~ 1%  TOTAL slabinfo.ftrace_event_f=
ile.num_objs
>       1127 ~ 2%     +29.8%       1462 ~ 1%  TOTAL slabinfo.ftrace_event_f=
ile.active_objs
>       1.47 ~12%     -20.7%       1.17 ~ 7%  TOTAL perf-profile.cpu-cycles=
.do_get_write_access.jbd2_journal_get_write_access.__ext4_journal_get_write=
_access.ext4_reserve_inode_write.ext4_mark_inode_dirty
>   15826442 ~ 0%     -15.5%   13381229 ~ 0%  TOTAL ftrace.global_dirty_sta=
te.written
>   15944180 ~ 0%     -15.3%   13502162 ~ 0%  TOTAL ftrace.global_dirty_sta=
te.dirtied
>       2906 ~ 1%     +14.0%       3314 ~ 1%  TOTAL slabinfo.shared_policy_=
node.active_objs
>       2906 ~ 1%     +14.0%       3314 ~ 1%  TOTAL slabinfo.shared_policy_=
node.num_objs
>     348891 ~ 0%     +14.4%     399046 ~ 0%  TOTAL ftrace.global_dirty_sta=
te.limit
>     394528 ~ 0%     +11.8%     441163 ~ 0%  TOTAL meminfo.MemFree
>      98671 ~ 0%     +11.8%     110310 ~ 0%  TOTAL proc-vmstat.nr_free_pag=
es
>     400850 ~ 0%     +11.0%     444838 ~ 0%  TOTAL vmstat.memory.free
>     108208 ~ 0%     +11.0%     120084 ~ 0%  TOTAL proc-vmstat.nr_dirty
>     432868 ~ 0%     +11.0%     480357 ~ 0%  TOTAL meminfo.Dirty
>      79363 ~ 1%      -8.9%      72291 ~ 0%  TOTAL proc-vmstat.workingset_=
nodereclaim
>      65550 ~ 2%      -9.1%      59612 ~ 1%  TOTAL softirqs.SCHED
>      12.06 ~ 5%    +530.1%      75.99 ~ 8%  TOTAL iostat.sdd.rrqm/s
>      50.78 ~ 5%    +530.2%     320.04 ~ 8%  TOTAL iostat.sdd.rkB/s
>      12.29 ~ 5%    +520.0%      76.21 ~ 7%  TOTAL iostat.sde.rrqm/s
>      51.66 ~ 5%    +520.9%     320.74 ~ 7%  TOTAL iostat.sde.rkB/s
>      49.28 ~ 6%    +542.9%     316.82 ~ 7%  TOTAL iostat.sdc.rkB/s
>      53.30 ~ 6%    +498.9%     319.26 ~ 7%  TOTAL iostat.sdf.rkB/s
>      12.62 ~ 5%    +496.4%      75.27 ~ 6%  TOTAL iostat.sdg.rrqm/s
>      53.21 ~ 5%    +496.2%     317.20 ~ 6%  TOTAL iostat.sdg.rkB/s
>      12.37 ~ 4%    +509.6%      75.41 ~ 7%  TOTAL iostat.sdh.rrqm/s
>      51.89 ~ 4%    +511.8%     317.47 ~ 7%  TOTAL iostat.sdh.rkB/s
>      12.60 ~ 5%    +500.9%      75.73 ~ 8%  TOTAL iostat.sdi.rrqm/s
>      52.95 ~ 5%    +502.2%     318.87 ~ 8%  TOTAL iostat.sdi.rkB/s
>      12.88 ~ 5%    +491.9%      76.26 ~ 8%  TOTAL iostat.sdj.rrqm/s
>      54.51 ~ 5%    +490.0%     321.59 ~ 8%  TOTAL iostat.sdj.rkB/s
>      12.69 ~ 6%    +501.6%      76.35 ~ 8%  TOTAL iostat.sdk.rrqm/s
>      53.90 ~ 6%    +497.5%     322.02 ~ 8%  TOTAL iostat.sdk.rkB/s
>      12.69 ~ 5%    +501.4%      76.33 ~ 8%  TOTAL iostat.sdl.rrqm/s
>      53.93 ~ 5%    +497.4%     322.15 ~ 8%  TOTAL iostat.sdl.rkB/s
>      50.24 ~ 4%    +536.4%     319.69 ~ 8%  TOTAL iostat.sdb.rkB/s
>      11.94 ~ 4%    +535.0%      75.84 ~ 8%  TOTAL iostat.sdb.rrqm/s
>      11.70 ~ 6%    +542.7%      75.21 ~ 7%  TOTAL iostat.sdc.rrqm/s
>      12.68 ~ 7%    +498.0%      75.82 ~ 7%  TOTAL iostat.sdf.rrqm/s
>        332 ~ 0%     +41.9%        471 ~ 0%  TOTAL iostat.md0.avgrq-sz
>    3616709 ~ 1%     -28.9%    2573038 ~ 1%  TOTAL perf-stat.context-switc=
hes
>      51043 ~ 1%     +10.4%      56342 ~ 3%  TOTAL perf-stat.cpu-migrations
>   6.45e+11 ~ 0%      -6.7%  6.021e+11 ~ 0%  TOTAL perf-stat.dTLB-loads
>        758 ~ 0%      -5.9%        713 ~ 0%  TOTAL iostat.md0.w/s
> =

> Legend:
> 	~XX%    - stddev percent
> 	[+-]XX% - change percent
> =

> =

> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> Thanks,
> Jet
> =


> mdadm -q --create /dev/md0 --chunk=3D256 --level=3Draid5 --raid-devices=
=3D11 --force --assume-clean /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/s=
df1 /dev/sdg1 /dev/sdh1 /dev/sdi1 /dev/sdj1 /dev/sdk1 /dev/sdl1
> echo 1 > /sys/kernel/debug/tracing/events/writeback/balance_dirty_pages/e=
nable
> echo 1 > /sys/kernel/debug/tracing/events/writeback/bdi_dirty_ratelimit/e=
nable
> echo 1 > /sys/kernel/debug/tracing/events/writeback/global_dirty_state/en=
able
> echo 1 > /sys/kernel/debug/tracing/events/writeback/writeback_single_inod=
e/enable
> mkfs -t ext4 -q /dev/md0
> mount -t ext4 /dev/md0 /fs/md0
> dd  if=3D/dev/zero of=3D/fs/md0/zero-1 status=3Dnone &
> sleep 600
> killall -9 dd
> =



--===============3890814377996905258==--

