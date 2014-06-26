Content-Type: multipart/mixed; boundary="===============1005606390599602032=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] cec017ed87c: -35.9% fileio.requests_per_sec
Date: Thu, 26 Jun 2014 12:10:46 +0800
Message-ID: <20140626041046.GA17188@localhost>
In-Reply-To: <0DA73B5D686AEC4AAEF6054BE04DA1CD11895624@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1005606390599602032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2014 at 10:35:44AM +0800, Du, Yuyang wrote:
> Oh, is it for the CC patchset or just "Remove update_rq_runnable_avg"?
 =

It's comparison for the single patch.

Thanks,
Fengguang


> -----Original Message-----
> From: Wu, Fengguang =

> Sent: Thursday, June 26, 2014 10:26 AM
> To: Du, Yuyang
> Cc: Hansen, Dave; lkp(a)01.org; Chen, Jet
> Subject: Re: [sched] cec017ed87c: -35.9% fileio.requests_per_sec
> =

> Yuyang,
> =

> On Thu, Jun 26, 2014 at 10:20:14AM +0800, Du, Yuyang wrote:
> > Thanks, Fengguang. As what I understand, this is pretty good result, ri=
ght? Only I did not expect to be so big an impact.
>  =

> Unfortunately it looks like a performance regression: the fileio throughp=
ut dropped by 35.9%.
> =

> Thanks,
> Fengguang
> =

> > -----Original Message-----
> > From: Wu, Fengguang
> > Sent: Thursday, June 26, 2014 10:06 AM
> > To: Du, Yuyang
> > Cc: Hansen, Dave; lkp(a)01.org; Chen, Jet
> > Subject: [sched] cec017ed87c: -35.9% fileio.requests_per_sec
> > =

> > Yuyang,
> > =

> > FYI, we noticed the below changes on
> > =

> > git://bee.sh.intel.com/git/ydu19/linux cc-v3-on-3.15-rc8 commit =

> > cec017ed87c7e5298fabaf1718f4f3c0fada0adb ("Remove =

> > update_rq_runnable_avg")
> > =

> > Test case: snb-drag/fileio/600s-100%-1HDD-xfs-64G-1024f-seqrewr-sync
> > =

> >       v3.15-rc8  cec017ed87c7e5298fabaf171
> > ---------------  -------------------------
> >       6522 ~ 0%     -35.9%       4183 ~ 0%  TOTAL fileio.requests_per_s=
ec
> >      26744 ~11%     -87.8%       3251 ~ 0%  TOTAL proc-vmstat.workingse=
t_nodereclaim
> >     117412 ~ 0%     -74.7%      29747 ~ 0%  TOTAL proc-vmstat.slabs_sca=
nned
> >       1833 ~ 3%     -63.8%        664 ~ 5%  TOTAL proc-vmstat.kswapd_hi=
gh_wmark_hit_quickly
> >       2959 ~ 2%     -45.6%       1610 ~ 2%  TOTAL proc-vmstat.pageoutrun
> >    7158189 ~ 0%     -39.1%    4359933 ~ 0%  TOTAL proc-vmstat.pgsteal_k=
swapd_dma32
> >    7225747 ~ 0%     -39.0%    4410503 ~ 0%  TOTAL proc-vmstat.pgsteal_k=
swapd_normal
> >    7202579 ~ 0%     -38.8%    4406846 ~ 0%  TOTAL proc-vmstat.pgscan_ks=
wapd_dma32
> >    7272151 ~ 0%     -38.7%    4461197 ~ 0%  TOTAL proc-vmstat.pgscan_ks=
wapd_normal
> >    3305425 ~ 0%     -37.9%    2052786 ~ 0%  TOTAL cpuidle.C1-SNB.usage
> >   15453350 ~ 0%     -36.5%    9816203 ~ 0%  TOTAL proc-vmstat.nr_written
> >   15454708 ~ 0%     -36.6%    9790561 ~ 0%  TOTAL proc-vmstat.pgfree
> >   61898955 ~ 0%     -36.4%   39352814 ~ 0%  TOTAL proc-vmstat.pgpgout
> >      62643 ~ 0%     -35.9%      40129 ~ 0%  TOTAL softirqs.BLOCK
> >   15654950 ~ 0%     -35.9%   10040787 ~ 0%  TOTAL proc-vmstat.nr_dirtied
> >   16729217 ~ 0%     -33.9%   11065396 ~ 0%  TOTAL proc-vmstat.numa_hit
> >   16729217 ~ 0%     -33.9%   11065396 ~ 0%  TOTAL proc-vmstat.numa_local
> >    8354814 ~ 0%     -33.8%    5534438 ~ 0%  TOTAL proc-vmstat.pgalloc_d=
ma32
> >    8419660 ~ 0%     -33.8%    5575636 ~ 0%  TOTAL proc-vmstat.pgalloc_n=
ormal
> >   42342300 ~ 3%     -31.0%   29195355 ~ 3%  TOTAL cpuidle.C3-SNB.time
> >   40089990 ~ 3%     -28.1%   28834724 ~ 2%  TOTAL cpuidle.C1E-SNB.time
> >      26312 ~ 3%     -27.6%      19054 ~ 2%  TOTAL cpuidle.C3-SNB.usage
> >      38112 ~ 3%     -19.3%      30755 ~ 1%  TOTAL cpuidle.C1E-SNB.usage
> >       1122 ~ 1%     +11.2%       1248 ~ 3%  TOTAL proc-vmstat.pgactivate
> >     330418 ~ 4%     -11.7%     291792 ~ 1%  TOTAL cpuidle.C6-SNB.usage
> >        650 ~11%     +69.8%       1103 ~ 0%  TOTAL iostat.sda.w_await
> >        650 ~11%     +69.8%       1103 ~ 0%  TOTAL iostat.sda.await
> >    3540598 ~ 0%     -35.9%    2269116 ~ 0%  TOTAL time.voluntary_contex=
t_switches
> >  1.252e+08 ~ 0%     -35.9%   80326643 ~ 0%  TOTAL time.file_system_outp=
uts
> >      94546 ~11%     -31.3%      64935 ~ 0%  TOTAL iostat.sda.wkB/s
> >        186 ~11%     -31.3%        128 ~ 0%  TOTAL iostat.sda.w/s
> >      94678 ~11%     -31.3%      65072 ~ 0%  TOTAL vmstat.io.bo
> >      50.09 ~ 0%     -34.6%      32.75 ~ 0%  TOTAL time.system_time
> >      11273 ~11%     -29.4%       7964 ~ 0%  TOTAL vmstat.system.cs
> >       1.56 ~11%     -27.8%       1.12 ~ 0%  TOTAL iostat.sda.wrqm/s
> >     131.77 ~11%      +8.1%     142.40 ~ 0%  TOTAL iostat.sda.avgqu-sz
> >        662 ~14%      -9.0%        602 ~ 0%  TOTAL time.elapsed_time
> > =

> > Legend:
> > 	~XX%    - stddev percent
> > 	[+-]XX% - change percent
> > =

> > =

> >                                 time.system_time
> > =

> >   55 ++----------------------------------------------------------------=
-----+
> >      |                                                                 =
     |
> >   50 *+...*...*....*....*....*...*                                     =
     |
> >   45 ++                                                                =
     |
> >      |                                                                 =
     |
> >   40 ++                                                                =
     |
> >      |                                                                 =
     |
> >   35 ++                                                                =
     |
> >      |                       O   O    O    O    O   O    O    O    O   =
O    O
> >   30 ++                                                                =
     |
> >   25 ++                                                                =
     |
> >      |                                                                 =
     |
> >   20 ++                                                                =
     |
> >      O    O   O    O    O                                              =
     |
> >   15 =

> > ++--------------------------------------------------------------------
> > -+
> > =

> > =

> >                             time.voluntary_context_switches
> > =

> >     4e+06 ++-----------------------------------------------------------=
-----+
> >           |                                                            =
     |
> >   3.5e+06 *+..*....*...*....*...*...*                                  =
     |
> >     3e+06 ++                                                           =
     |
> >           |                                                            =
     |
> >   2.5e+06 ++                                                           =
     |
> >           |                     O   O    O   O    O   O   O    O   O   =
 O   O
> >     2e+06 ++                                                           =
     |
> >           |                                                            =
     |
> >   1.5e+06 ++                                                           =
     |
> >     1e+06 ++                                                           =
     |
> >           |                                                            =
     |
> >    500000 ++                                                           =
     |
> >           O   O    O   O    O                                          =
     |
> >         0 =

> > ++----------------------------------------------------------------+
> > =

> > =

> >                                time.file_system_outputs
> > =

> >    1.3e+08 ++----------------------------------------------------------=
-----+
> >   1.25e+08 *+..*....*...*...*....*...*                                 =
     |
> >            |                                                           =
     |
> >    1.2e+08 ++                                                          =
     |
> >   1.15e+08 ++                                                          =
     |
> >            |                                                           =
     |
> >    1.1e+08 ++                                                          =
     |
> >   1.05e+08 ++                                                          =
     |
> >      1e+08 ++                                                          =
     |
> >            |                                                           =
     |
> >    9.5e+07 ++                                                          =
     |
> >      9e+07 ++                                                          =
     |
> >            |                                                           =
     |
> >    8.5e+07 ++                                                          =
     |
> >      8e+07 =

> > O+--O----O---O---O----O---O---O----O---O---O----O---O---O----O---O
> > =

> > =

> >                               fileio.requests_per_sec
> > =

> >   7000 ++--------------------------------------------------------------=
-----+
> >        |                                                               =
     |
> >   6500 *+...*...*....*...*....*....*                                   =
     |
> >        |                                                               =
     |
> >        |                                                               =
     |
> >   6000 ++                                                              =
     |
> >        |                                                               =
     |
> >   5500 ++                                                              =
     |
> >        |                                                               =
     |
> >   5000 ++                                                              =
     |
> >        |                                                               =
     |
> >        |                                                               =
     |
> >   4500 ++                                                              =
     |
> >        O    O   O    O   O    O    O   O    O   O    O    O   O    O   =
O    O
> >   4000 =

> > ++-------------------------------------------------------------------+
> > =

> > =

> >                                  iostat.sda.await
> > =

> >   1200 ++--------------------------------------------------------------=
-----+
> >        |                                                               =
     |
> >   1100 O+   O   O    O   O    O    O   O    O   O    O    O   O    O   =
O    O
> >   1000 ++                                                              =
     |
> >        |                                                               =
     |
> >    900 ++                                                              =
     |
> >        |                                                               =
     |
> >    800 ++                                                              =
     |
> >        |                                                               =
     |
> >    700 ++ ..*...*....*...*.        *                                   =
     |
> >    600 *+.                 ..     .                                    =
     |
> >        |                     .  ..                                     =
     |
> >    500 ++                      .                                       =
     |
> >        |                      *                                        =
     |
> >    400 =

> > ++-------------------------------------------------------------------+
> > =

> > =

> >                                 iostat.sda.w_await
> > =

> >   1200 ++--------------------------------------------------------------=
-----+
> >        |                                                               =
     |
> >   1100 O+   O   O    O   O    O    O   O    O   O    O    O   O    O   =
O    O
> >   1000 ++                                                              =
     |
> >        |                                                               =
     |
> >    900 ++                                                              =
     |
> >        |                                                               =
     |
> >    800 ++                                                              =
     |
> >        |                                                               =
     |
> >    700 ++ ..*...*....*...*.        *                                   =
     |
> >    600 *+.                 ..     .                                    =
     |
> >        |                     .  ..                                     =
     |
> >    500 ++                      .                                       =
     |
> >        |                      *                                        =
     |
> >    400 =

> > ++-------------------------------------------------------------------+
> > =

> > =

> > 	[*] bisect-good sample
> > 	[O] bisect-bad  sample
> > =

> > =

> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided for informational purposes only. Any difference in system hardware o=
r software design or configuration may affect actual performance.
> > =

> > Thanks,
> > Fengguang

--===============1005606390599602032==--

