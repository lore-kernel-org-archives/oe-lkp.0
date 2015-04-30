Content-Type: multipart/mixed; boundary="===============7622012414703510118=="
MIME-Version: 1.0
From: Yuanhan Liu <yuanhan.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [RAID5] 878ee679279: -1.8% vmstat.io.bo, +40.5% perf-stat.LLC-load-misses
Date: Thu, 30 Apr 2015 14:25:23 +0800
Message-ID: <20150430062523.GA25995@yliu-dev.sh.intel.com>
In-Reply-To: <20150424121559.321677ce@notabene.brown>
List-Id: <oe-lkp.lists.linux.dev>

--===============7622012414703510118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2015 at 12:15:59PM +1000, NeilBrown wrote:
> On Thu, 23 Apr 2015 14:55:59 +0800 Huang Ying <ying.huang@intel.com> wr=
ote:
> =

> > FYI, we noticed the below changes on
> > =

> > git://neil.brown.name/md for-next
> > commit 878ee6792799e2f88bdcac329845efadb205252f ("RAID5: batch adjacent=
 full stripe write")
> =

> Hi,
>  is there any chance that you could explain what some of this means?
> There is lots of data and some very pretty graphs, but no explanation.

Hi Neil,

(Sorry for late response: Ying is on vacation)

I guess you can simply ignore this report, as I already reported to you
month ago that this patch made fsmark performs better in most cases:

    https://lists.01.org/pipermail/lkp/2015-March/002411.html

> =

> Which numbers are "good", which are "bad"?  Which is "worst".
> What do the graphs really show? and what would we like to see in them?
> =

> I think it is really great that you are doing this testing and reporting =
the
> results.  It's just so sad that I completely fail to understand them.

Sorry, it's our bad to make them hard to understand as well as
to report a duplicate one(well, the commit hash is different ;).

We might need take some time to make those data understood easier.

	--yliu

> =

> > =

> > =

> > testbox/testcase/testparams: lkp-st02/dd-write/300-5m-11HDD-RAID5-cfq-x=
fs-1dd
> > =

> > a87d7f782b47e030  878ee6792799e2f88bdcac3298  =

> > ----------------  --------------------------  =

> >          %stddev     %change         %stddev
> >              \          |                \  =

> >      59035 =C2=B1  0%     +18.4%      69913 =C2=B1  1%  softirqs.SCHED
> >       1330 =C2=B1 10%     +17.4%       1561 =C2=B1  4%  slabinfo.kmallo=
c-512.num_objs
> >       1330 =C2=B1 10%     +17.4%       1561 =C2=B1  4%  slabinfo.kmallo=
c-512.active_objs
> >     305908 =C2=B1  0%      -1.8%     300427 =C2=B1  0%  vmstat.io.bo
> >          1 =C2=B1  0%    +100.0%          2 =C2=B1  0%  vmstat.procs.r
> >       8266 =C2=B1  1%     -15.7%       6968 =C2=B1  0%  vmstat.system.cs
> >      14819 =C2=B1  0%      -2.1%      14503 =C2=B1  0%  vmstat.system.in
> >      18.20 =C2=B1  6%     +10.2%      20.05 =C2=B1  4%  perf-profile.cp=
u-cycles.raid_run_ops.handle_stripe.handle_active_stripes.raid5d.md_thread
> >       1.94 =C2=B1  9%     +90.6%       3.70 =C2=B1  9%  perf-profile.cp=
u-cycles.async_xor.raid_run_ops.handle_stripe.handle_active_stripes.raid5d
> >       0.00 =C2=B1  0%      +Inf%      25.18 =C2=B1  3%  perf-profile.cp=
u-cycles.handle_active_stripes.isra.45.raid5d.md_thread.kthread.ret_from_fo=
rk
> >       0.00 =C2=B1  0%      +Inf%      14.14 =C2=B1  4%  perf-profile.cp=
u-cycles.async_copy_data.isra.42.raid_run_ops.handle_stripe.handle_active_s=
tripes.raid5d
> >       1.79 =C2=B1  7%    +102.9%       3.64 =C2=B1  9%  perf-profile.cp=
u-cycles.xor_blocks.async_xor.raid_run_ops.handle_stripe.handle_active_stri=
pes
> >       3.09 =C2=B1  4%     -10.8%       2.76 =C2=B1  4%  perf-profile.cp=
u-cycles.get_active_stripe.make_request.md_make_request.generic_make_reques=
t.submit_bio
> >       0.80 =C2=B1 14%     +28.1%       1.02 =C2=B1 10%  perf-profile.cp=
u-cycles.mutex_lock.xfs_file_buffered_aio_write.xfs_file_write_iter.new_syn=
c_write.vfs_write
> >      14.78 =C2=B1  6%    -100.0%       0.00 =C2=B1  0%  perf-profile.cp=
u-cycles.async_copy_data.isra.38.raid_run_ops.handle_stripe.handle_active_s=
tripes.raid5d
> >      25.68 =C2=B1  4%    -100.0%       0.00 =C2=B1  0%  perf-profile.cp=
u-cycles.handle_active_stripes.isra.41.raid5d.md_thread.kthread.ret_from_fo=
rk
> >       1.23 =C2=B1  5%    +140.0%       2.96 =C2=B1  7%  perf-profile.cp=
u-cycles.xor_sse_5_pf64.xor_blocks.async_xor.raid_run_ops.handle_stripe
> >       2.62 =C2=B1  6%     -95.6%       0.12 =C2=B1 33%  perf-profile.cp=
u-cycles.analyse_stripe.handle_stripe.handle_active_stripes.raid5d.md_thread
> >       0.96 =C2=B1  9%     +17.5%       1.12 =C2=B1  2%  perf-profile.cp=
u-cycles.xfs_ilock.xfs_file_buffered_aio_write.xfs_file_write_iter.new_sync=
_write.vfs_write
> >  1.461e+10 =C2=B1  0%      -5.3%  1.384e+10 =C2=B1  1%  perf-stat.L1-dc=
ache-load-misses
> >  3.688e+11 =C2=B1  0%      -2.7%   3.59e+11 =C2=B1  0%  perf-stat.L1-dc=
ache-loads
> >  1.124e+09 =C2=B1  0%     -27.7%  8.125e+08 =C2=B1  0%  perf-stat.L1-dc=
ache-prefetches
> >  2.767e+10 =C2=B1  0%      -1.8%  2.717e+10 =C2=B1  0%  perf-stat.L1-dc=
ache-store-misses
> >  2.352e+11 =C2=B1  0%      -2.8%  2.287e+11 =C2=B1  0%  perf-stat.L1-dc=
ache-stores
> >  6.774e+09 =C2=B1  0%      -2.3%   6.62e+09 =C2=B1  0%  perf-stat.L1-ic=
ache-load-misses
> >  5.571e+08 =C2=B1  0%     +40.5%  7.826e+08 =C2=B1  1%  perf-stat.LLC-l=
oad-misses
> >  6.263e+09 =C2=B1  0%     -13.7%  5.407e+09 =C2=B1  1%  perf-stat.LLC-l=
oads
> >  1.914e+11 =C2=B1  0%      -4.2%  1.833e+11 =C2=B1  0%  perf-stat.branc=
h-instructions
> >  1.145e+09 =C2=B1  2%      -5.6%  1.081e+09 =C2=B1  0%  perf-stat.branc=
h-load-misses
> >  1.911e+11 =C2=B1  0%      -4.3%  1.829e+11 =C2=B1  0%  perf-stat.branc=
h-loads
> >  1.142e+09 =C2=B1  2%      -5.1%  1.083e+09 =C2=B1  0%  perf-stat.branc=
h-misses
> >  1.218e+09 =C2=B1  0%     +19.8%   1.46e+09 =C2=B1  0%  perf-stat.cache=
-misses
> >  2.118e+10 =C2=B1  0%      -5.2%  2.007e+10 =C2=B1  0%  perf-stat.cache=
-references
> >    2510308 =C2=B1  1%     -15.7%    2115410 =C2=B1  0%  perf-stat.conte=
xt-switches
> >      39623 =C2=B1  0%     +22.1%      48370 =C2=B1  1%  perf-stat.cpu-m=
igrations
> >  4.179e+08 =C2=B1 40%    +165.7%  1.111e+09 =C2=B1 35%  perf-stat.dTLB-=
load-misses
> >  3.684e+11 =C2=B1  0%      -2.5%  3.592e+11 =C2=B1  0%  perf-stat.dTLB-=
loads
> >  1.232e+08 =C2=B1 15%     +62.5%  2.002e+08 =C2=B1 27%  perf-stat.dTLB-=
store-misses
> >  2.348e+11 =C2=B1  0%      -2.5%  2.288e+11 =C2=B1  0%  perf-stat.dTLB-=
stores
> >    3577297 =C2=B1  2%      +8.7%    3888986 =C2=B1  1%  perf-stat.iTLB-=
load-misses
> >  1.035e+12 =C2=B1  0%      -3.5%  9.988e+11 =C2=B1  0%  perf-stat.iTLB-=
loads
> >  1.036e+12 =C2=B1  0%      -3.7%  9.978e+11 =C2=B1  0%  perf-stat.instr=
uctions
> >        594 =C2=B1 30%    +130.3%       1369 =C2=B1 13%  sched_debug.cfs=
_rq[0]:/.blocked_load_avg
> >         17 =C2=B1 10%     -28.2%         12 =C2=B1 23%  sched_debug.cfs=
_rq[0]:/.nr_spread_over
> >        210 =C2=B1 21%     +42.1%        298 =C2=B1 28%  sched_debug.cfs=
_rq[0]:/.tg_runnable_contrib
> >       9676 =C2=B1 21%     +42.1%      13754 =C2=B1 28%  sched_debug.cfs=
_rq[0]:/.avg->runnable_avg_sum
> >        772 =C2=B1 25%    +116.5%       1672 =C2=B1  9%  sched_debug.cfs=
_rq[0]:/.tg_load_contrib
> >       8402 =C2=B1  9%     +83.3%      15405 =C2=B1 11%  sched_debug.cfs=
_rq[0]:/.tg_load_avg
> >       8356 =C2=B1  9%     +82.8%      15272 =C2=B1 11%  sched_debug.cfs=
_rq[1]:/.tg_load_avg
> >        968 =C2=B1 25%    +100.8%       1943 =C2=B1 14%  sched_debug.cfs=
_rq[1]:/.blocked_load_avg
> >      16242 =C2=B1  9%     -22.2%      12643 =C2=B1 14%  sched_debug.cfs=
_rq[1]:/.avg->runnable_avg_sum
> >        353 =C2=B1  9%     -22.1%        275 =C2=B1 14%  sched_debug.cfs=
_rq[1]:/.tg_runnable_contrib
> >       1183 =C2=B1 23%     +77.7%       2102 =C2=B1 12%  sched_debug.cfs=
_rq[1]:/.tg_load_contrib
> >        181 =C2=B1  8%     -31.4%        124 =C2=B1 26%  sched_debug.cfs=
_rq[2]:/.tg_runnable_contrib
> >       8364 =C2=B1  8%     -31.3%       5745 =C2=B1 26%  sched_debug.cfs=
_rq[2]:/.avg->runnable_avg_sum
> >       8297 =C2=B1  9%     +81.7%      15079 =C2=B1 12%  sched_debug.cfs=
_rq[2]:/.tg_load_avg
> >      30439 =C2=B1 13%     -45.2%      16681 =C2=B1 26%  sched_debug.cfs=
_rq[2]:/.exec_clock
> >      39735 =C2=B1 14%     -48.3%      20545 =C2=B1 29%  sched_debug.cfs=
_rq[2]:/.min_vruntime
> >       8231 =C2=B1 10%     +82.2%      15000 =C2=B1 12%  sched_debug.cfs=
_rq[3]:/.tg_load_avg
> >       1210 =C2=B1 14%    +110.3%       2546 =C2=B1 30%  sched_debug.cfs=
_rq[4]:/.tg_load_contrib
> >       8188 =C2=B1 10%     +82.8%      14964 =C2=B1 12%  sched_debug.cfs=
_rq[4]:/.tg_load_avg
> >       8132 =C2=B1 10%     +83.1%      14890 =C2=B1 12%  sched_debug.cfs=
_rq[5]:/.tg_load_avg
> >        749 =C2=B1 29%    +205.9%       2292 =C2=B1 34%  sched_debug.cfs=
_rq[5]:/.blocked_load_avg
> >        963 =C2=B1 30%    +169.9%       2599 =C2=B1 33%  sched_debug.cfs=
_rq[5]:/.tg_load_contrib
> >      37791 =C2=B1 32%     -38.6%      23209 =C2=B1 13%  sched_debug.cfs=
_rq[6]:/.min_vruntime
> >        693 =C2=B1 25%    +132.2%       1609 =C2=B1 29%  sched_debug.cfs=
_rq[6]:/.blocked_load_avg
> >      10838 =C2=B1 13%     -39.2%       6587 =C2=B1 13%  sched_debug.cfs=
_rq[6]:/.avg->runnable_avg_sum
> >      29329 =C2=B1 27%     -33.2%      19577 =C2=B1 10%  sched_debug.cfs=
_rq[6]:/.exec_clock
> >        235 =C2=B1 14%     -39.7%        142 =C2=B1 14%  sched_debug.cfs=
_rq[6]:/.tg_runnable_contrib
> >       8085 =C2=B1 10%     +83.6%      14848 =C2=B1 12%  sched_debug.cfs=
_rq[6]:/.tg_load_avg
> >        839 =C2=B1 25%    +128.5%       1917 =C2=B1 18%  sched_debug.cfs=
_rq[6]:/.tg_load_contrib
> >       8051 =C2=B1 10%     +83.6%      14779 =C2=B1 12%  sched_debug.cfs=
_rq[7]:/.tg_load_avg
> >        156 =C2=B1 34%     +97.9%        309 =C2=B1 19%  sched_debug.cpu=
#0.cpu_load[4]
> >        160 =C2=B1 25%     +64.0%        263 =C2=B1 16%  sched_debug.cpu=
#0.cpu_load[2]
> >        156 =C2=B1 32%     +83.7%        286 =C2=B1 17%  sched_debug.cpu=
#0.cpu_load[3]
> >        164 =C2=B1 20%     -35.1%        106 =C2=B1 31%  sched_debug.cpu=
#2.cpu_load[0]
> >        249 =C2=B1 15%     +80.2%        449 =C2=B1 10%  sched_debug.cpu=
#4.cpu_load[3]
> >        231 =C2=B1 11%    +101.2%        466 =C2=B1 13%  sched_debug.cpu=
#4.cpu_load[2]
> >        217 =C2=B1 14%    +189.9%        630 =C2=B1 38%  sched_debug.cpu=
#4.cpu_load[0]
> >      71951 =C2=B1  5%     +21.6%      87526 =C2=B1  7%  sched_debug.cpu=
#4.nr_load_updates
> >        214 =C2=B1  8%    +146.1%        527 =C2=B1 27%  sched_debug.cpu=
#4.cpu_load[1]
> >        256 =C2=B1 17%     +75.7%        449 =C2=B1 13%  sched_debug.cpu=
#4.cpu_load[4]
> >        209 =C2=B1 23%     +98.3%        416 =C2=B1 48%  sched_debug.cpu=
#5.cpu_load[2]
> >      68024 =C2=B1  2%     +18.8%      80825 =C2=B1  1%  sched_debug.cpu=
#5.nr_load_updates
> >        217 =C2=B1 26%     +74.9%        380 =C2=B1 45%  sched_debug.cpu=
#5.cpu_load[3]
> >        852 =C2=B1 21%     -38.3%        526 =C2=B1 22%  sched_debug.cpu=
#6.curr->pid
> > =

> > lkp-st02: Core2
> > Memory: 8G
> > =

> > =

> > =

> > =

> >                                 perf-stat.cache-misses
> > =

> >   1.6e+09 O+-----O--O---O--O---O---------------------------------------=
-----+
> >           |                       O   O  O   O  O   O  O   O  O   O    =
     |
> >   1.4e+09 ++                                                           =
     |
> >   1.2e+09 *+.*...*      *..*      *      *...*..*...*..*...*..*...*..*.=
..*..*
> >           |      :      :  :      :      :                             =
     |
> >     1e+09 ++      :    :    :    : :    :                              =
     |
> >           |       :    :    :    : :    :                              =
     |
> >     8e+08 ++      :    :    :    : :    :                              =
     |
> >           |       :   :      :   :  :   :                              =
     |
> >     6e+08 ++       :  :      :  :   :  :                               =
     |
> >     4e+08 ++       : :        : :    : :                               =
     |
> >           |        : :        : :    : :                               =
     |
> >     2e+08 ++       : :        : :    : :                               =
     |
> >           |         :          :      :                                =
     |
> >         0 ++-O------*----------*------*--------------------------------=
-----+
> > =

> > =

> >                             perf-stat.L1-dcache-prefetches
> > =

> >   1.2e+09 ++-----------------------------------------------------------=
-----+
> >           *..*...*      *..*      *        ..*..  ..*..*...*..*...*..*.=
..*..*
> >     1e+09 ++     :      :  :      :      *.     *.                     =
     |
> >           |      :     :    :     ::     :                             =
     |
> >           |       :    :    :    : :     :                        O    =
     |
> >     8e+08 O+     O: O  :O  O:  O :O:  O :O   O  O   O  O   O  O        =
     |
> >           |       :   :      :   :  :   :                              =
     |
> >     6e+08 ++      :   :      :   :  :   :                              =
     |
> >           |        :  :      :  :   :   :                              =
     |
> >     4e+08 ++       :  :      :  :   :  :                               =
     |
> >           |        : :        : :    : :                               =
     |
> >           |        : :        : :    : :                               =
     |
> >     2e+08 ++        ::        ::     : :                               =
     |
> >           |         :          :      :                                =
     |
> >         0 ++-O------*----------*------*--------------------------------=
-----+
> > =

> > =

> >                               perf-stat.LLC-load-misses
> > =

> >   1e+09 ++-------------------------------------------------------------=
-----+
> >   9e+08 O+     O   O  O   O  O                                         =
     |
> >         |                        O   O  O   O                          =
     |
> >   8e+08 ++                                     O   O   O  O   O  O     =
     |
> >   7e+08 ++                                                             =
     |
> >         |                                                              =
     |
> >   6e+08 *+..*..*      *...*      *      *...*..*...*...*..*...*..*...*.=
.*...*
> >   5e+08 ++      :     :   :      ::     :                              =
     |
> >   4e+08 ++      :    :     :    : :    :                               =
     |
> >         |        :   :     :    :  :   :                               =
     |
> >   3e+08 ++       :   :      :  :   :   :                               =
     |
> >   2e+08 ++        : :       :  :    : :                                =
     |
> >         |         : :       : :     : :                                =
     |
> >   1e+08 ++         :         ::      :                                 =
     |
> >       0 ++--O------*---------*-------*---------------------------------=
-----+
> > =

> > =

> >                               perf-stat.context-switches
> > =

> >     3e+06 ++-----------------------------------------------------------=
-----+
> >           |                              *...*..*...                   =
     |
> >   2.5e+06 *+.*...*      *..*      *      :          *..*...  .*...*..*.=
..  .*
> >           |      :      :  :      :      :                 *.          =
  *. |
> >           O      O: O  :O  O:  O  ::    :       O   O  O   O  O   O    =
     |
> >     2e+06 ++      :    :    :    :O:  O :O   O                         =
     |
> >           |       :    :    :    : :    :                              =
     |
> >   1.5e+06 ++      :   :      :   :  :   :                              =
     |
> >           |        :  :      :   :  :  :                               =
     |
> >     1e+06 ++       :  :      :  :   :  :                               =
     |
> >           |        : :        : :    : :                               =
     |
> >           |        : :        : :    : :                               =
     |
> >    500000 ++        ::        : :    ::                                =
     |
> >           |         :          :      :                                =
     |
> >         0 ++-O------*----------*------*--------------------------------=
-----+
> > =

> > =

> >                                   vmstat.system.cs
> > =

> >   10000 ++-------------------------------------------------------------=
-----+
> >    9000 ++                              *...*..                        =
     |
> >         *...*..*      *...*      *      :      *...*...*..  ..*..*...*.=
.  ..*
> >    8000 ++     :      :   :      :      :                 *.           =
 *.  |
> >    7000 O+     O:  O  O   O: O  : :    :       O   O   O  O   O  O     =
     |
> >         |       :    :     :    :O:  O :O   O                          =
     |
> >    6000 ++      :    :     :    : :    :                               =
     |
> >    5000 ++       :   :     :   :   :   :                               =
     |
> >    4000 ++       :   :      :  :   :  :                                =
     |
> >         |        :  :       :  :   :  :                                =
     |
> >    3000 ++        : :       : :     : :                                =
     |
> >    2000 ++        : :       : :     : :                                =
     |
> >         |         : :        ::     ::                                 =
     |
> >    1000 ++         :         :       :                                 =
     |
> >       0 ++--O------*---------*-------*---------------------------------=
-----+
> > =

> > =

> > 	[*] bisect-good sample
> > 	[O] bisect-bad  sample
> > =

> > To reproduce:
> > =

> > 	apt-get install ruby
> > 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.=
git
> > 	cd lkp-tests
> > 	bin/setup-local job.yaml # the job file attached in this email
> > 	bin/run-local   job.yaml
> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> > =

> > =

> > Thanks,
> > Ying Huang
> > =

> =




--===============7622012414703510118==--

