Content-Type: multipart/mixed; boundary="===============4508246328352847384=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 2d033d5c0d4: +225.2% iperf.tcp.sender.bps
Date: Sun, 29 Jun 2014 15:47:00 -0700
Message-ID: <20140629224700.GT4603@linux.vnet.ibm.com>
In-Reply-To: <20140629151544.GA11875@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4508246328352847384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2014 at 11:15:44PM +0800, Fengguang Wu wrote:
> Hi Paul,
> =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/n=
ext
> commit 2d033d5c0d424b7029abd0fc82e940ebc318fd89 ("rcu: Bind grace-period =
kthreads to non-NO_HZ_FULL CPUs")

Nice!  Clearly outlines the hazards of providing too few housekeeping CPUs,
I would guess.

							Thanx, Paul

> test case: bens/iperf/300s-tcp
> =

> e17adc3f20bc9a1  2d033d5c0d424b7029abd0fc8  =

> ---------------  -------------------------  =

>  7.011e+09 ~ 1%    +225.2%   2.28e+10 ~ 2%  TOTAL iperf.tcp.sender.bps
>  7.011e+09 ~ 1%    +225.2%   2.28e+10 ~ 2%  TOTAL iperf.tcp.receiver.bps
>   15620691 ~ 1%    +224.3%   50663012 ~ 2%  TOTAL proc-vmstat.pgalloc_nor=
mal
>   62969722 ~ 1%    +224.3%  2.042e+08 ~ 2%  TOTAL proc-vmstat.pgfree
>   47347349 ~ 1%    +224.3%  1.535e+08 ~ 2%  TOTAL proc-vmstat.pgalloc_dma=
32
>    4996590 ~ 1%    +218.9%   15933563 ~ 3%  TOTAL softirqs.NET_RX
>    8084072 ~ 1%    +218.4%   25739055 ~ 2%  TOTAL proc-vmstat.numa_hit
>    8084072 ~ 1%    +218.4%   25739055 ~ 2%  TOTAL proc-vmstat.numa_local
>      28676 ~ 2%     -47.5%      15059 ~11%  TOTAL softirqs.RCU
>      99756 ~ 2%     +76.0%     175606 ~ 2%  TOTAL softirqs.SCHED
>        562 ~11%     +50.9%        848 ~17%  TOTAL slabinfo.proc_inode_cac=
he.active_objs
>        620 ~ 8%     +38.7%        860 ~15%  TOTAL slabinfo.proc_inode_cac=
he.num_objs
>     271905 ~ 4%     +17.4%     319216 ~ 0%  TOTAL softirqs.TIMER
>       1117 ~ 1%      -9.1%       1015 ~ 2%  TOTAL proc-vmstat.pgactivate
>       9049 ~11%     -94.6%        485 ~26%  TOTAL time.involuntary_contex=
t_switches
>      23233 ~ 1%     +72.1%      39979 ~ 2%  TOTAL vmstat.system.cs
>      13078 ~ 1%     +69.1%      22117 ~ 1%  TOTAL vmstat.system.in
> =

> Legend:
> 	~XX%    - stddev percent
> 	[+-]XX% - change percent
> =

> =

>                                  iperf.tcp.sender.bps
> =

>   2.4e+10 ++----O-----O-----------O--------------O-----O--------O-----O--=
---+
>           |        O     O  O  O     O  O                    O           =
O  |
>   2.2e+10 O+ O                             O                       O     =
   |
>     2e+10 ++                                  O                          =
   |
>           |                                                              =
   |
>   1.8e+10 ++                                                             =
   |
>   1.6e+10 ++                                        O     O              =
   |
>           |                                                              =
   |
>   1.4e+10 ++                                                             =
   |
>   1.2e+10 ++                                                             =
   |
>           |                                                              =
   |
>     1e+10 ++                                                             =
   |
>     8e+09 ++                                                             =
   |
>           *..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..=
*..*
>     6e+09 ++-------------------------------------------------------------=
---+
> =

> =

>                                 iperf.tcp.receiver.bps
> =

>   2.4e+10 ++----O-----O-----------O--------------O-----O--------O-----O--=
---+
>           |        O     O  O  O     O  O                    O           =
O  |
>   2.2e+10 O+ O                             O                       O     =
   |
>     2e+10 ++                                  O                          =
   |
>           |                                                              =
   |
>   1.8e+10 ++                                                             =
   |
>   1.6e+10 ++                                        O     O              =
   |
>           |                                                              =
   |
>   1.4e+10 ++                                                             =
   |
>   1.2e+10 ++                                                             =
   |
>           |                                                              =
   |
>     1e+10 ++                                                             =
   |
>     8e+09 ++                                                             =
   |
>           *..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..*..=
*..*
>     6e+09 ++-------------------------------------------------------------=
---+
> =

> =

>                           time.involuntary_context_switches
> =

>   14000 ++---------------------------------------------------------------=
---+
>         |                                                                =
   |
>   12000 *+.        .*..  ..*..*..  .*..                                  =
   |
>         |    .*..*.    *.        *.                                      =
   |
>   10000 ++ *.                          *..*..  .*..*..*..  ..*..*..      =
   *
>         |                                    *.          *.          .*..=
 ..|
>    8000 ++                                                         *.    =
*  |
>         |                                                                =
   |
>    6000 ++                                                               =
   |
>         |                                                                =
   |
>    4000 ++                                                               =
   |
>         |                                                                =
   |
>    2000 ++                                                               =
   |
>         |                                          O     O         O     =
O  |
>       0 O+-O--O--O--O--O---O--O--O--O--O--O--O--O-----O------O--O-----O--=
---+
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
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
> Fengguang

> ./iperf3 -s
> ./iperf3 -t 300 -f M -J -c 127.0.0.1


--===============4508246328352847384==--

