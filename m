Content-Type: multipart/mixed; boundary="===============1734139128531223125=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 5057f55e543: dmesg.BUG:soft_lockup-CPU_stuck_for_s
Date: Mon, 06 Oct 2014 03:57:12 -0700
Message-ID: <20141006105712.GX5015@linux.vnet.ibm.com>
In-Reply-To: <20141006091716.GA1608@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1734139128531223125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2014 at 05:17:16PM +0800, Fengguang Wu wrote:
> On Mon, Oct 06, 2014 at 01:54:56PM +0800, Fengguang Wu wrote:
> > On Mon, Oct 06, 2014 at 01:50:24PM +0800, Fengguang Wu wrote:
> > > Hi Paul,
> > > =

> > > FYI, we noticed a number of ups and downs for commit
> > > =

> > > 5057f55e543b7859cfd26bc281291795eac93f8a ("rcu: Bind RCU grace-period=
 kthreads if NO_HZ_FULL")
> > =

> > Here is an overview of the performance/power/latency/kernel size
> > index. The baseline (71a9b26963f8c2d) number is 100, the larger, the be=
tter.
> > =

> >     96      perf-index  5057f55e543b7859cfd26bc281291795eac93f8a
> >     99     power-index  5057f55e543b7859cfd26bc281291795eac93f8a
> >    101   latency-index  5057f55e543b7859cfd26bc281291795eac93f8a
> >    102      size-index  5057f55e543b7859cfd26bc281291795eac93f8a
> =

> The performance changes seem to have a strong correlation with the
> time.involuntary_context_switches changes.

I bet that if you booted with additional CPUs not in nohz mode that
the numbers of involuntary context switches would come down.  By
default, only CPU 0 is non-nohz, so all of the RCU kthreads get bound
to CPU 0.

							Thanx, Paul

> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28  time.involuntary_context_swit=
ches
> ---------------  -------------------------  -----------------------------=
-------
>    1209498 =C2=B1 1%      -6.5%    1131376 =C2=B1 1%  lkp-a04/netperf/900=
s-200%-TCP_STREAM
>      31677 =C2=B1 0%     +42.5%      45147 =C2=B1 1%  lkp-a05/iperf/300s-=
tcp
>     116081 =C2=B1 0%     +12.5%     130610 =C2=B1 1%  lkp-a06/qperf/600s
>        546 =C2=B124%   +2329.3%      13280 =C2=B1 8%  lkp-sb03/nepim/300s=
-100%-tcp
>        863 =C2=B145%   +1260.1%      11737 =C2=B112%  lkp-sb03/nepim/300s=
-100%-tcp6
>        343 =C2=B118%  +12507.6%      43294 =C2=B1 2%  lkp-sb03/nepim/300s=
-100%-udp6
>        633 =C2=B123%   +1292.7%       8816 =C2=B115%  lkp-sb03/nepim/300s=
-25%-tcp
>        417 =C2=B1 5%   +1714.5%       7572 =C2=B111%  lkp-sb03/nepim/300s=
-25%-tcp6
>        364 =C2=B120%   +9569.9%      35198 =C2=B1 7%  lkp-sb03/nepim/300s=
-25%-udp
>        312 =C2=B1 0%  +12223.0%      38521 =C2=B1 1%  lkp-sb03/nepim/300s=
-25%-udp6
>        308 =C2=B1 0%   +6197.7%      19418 =C2=B1 0%  lkp-sb03/nuttcp/300s
>        418 =C2=B1 4%   +4948.2%      21101 =C2=B1 1%  lkp-sb03/thrulay/30=
0s
>  1.062e+09 =C2=B1 0%      -2.9%  1.031e+09 =C2=B1 0%  lkp-snb01/hackbench=
/50%-threads-pipe
>      18870 =C2=B1 0%    +265.8%      69025 =C2=B1 0%  lkp-snb01/will-it-s=
cale/open2
>      20813 =C2=B1 0%     +95.2%      40618 =C2=B1 0%  xps/ftrace_onoff/5m
> =

> iperf tcp:
> =

>                                  iperf.tcp.sender.bps
> =

>   2.2e+10 ++-----*-*---------*-*-----------------------------------------=
---+
>           |     +   +       +                    .*.              .*     =
   |
>   2.1e+10 ++  .*     +    .*      *.*.*..*.*.  .*   *..      .*.*.  + .*.=
.  |
>           *.*.        *.*.                   *.            .*        *   =
 *.*
>           |                                            *.*.              =
   |
>     2e+10 ++                                                             =
   |
>           |                                                              =
   |
>   1.9e+10 ++                                                             =
   |
>           |                                                              =
   |
>   1.8e+10 ++                      O                                      =
   |
>           |                    O      O      O                           =
   |
>           O    O   O    O           O    O        O                      =
   |
>   1.7e+10 ++O              O O                  O                        =
   |
>           |      O    O                    O                             =
   |
>   1.6e+10 ++-------------------------------------------------------------=
---+
> =

>         [*] bisect-good sample
>         [O] bisect-bad  sample
> =

> =

>                                 iperf.tcp.receiver.bps
> =

>   2.2e+10 ++-----*-*---------*-*-----------------------------------------=
---+
>           |     +   +       +                    .*.              .*     =
   |
>   2.1e+10 ++  .*     +    .*      *.*.*..*.*.  .*   *..      .*.*.  + .*.=
.  |
>           *.*.        *.*.                   *.            .*        *   =
 *.*
>           |                                            *.*.              =
   |
>     2e+10 ++                                                             =
   |
>           |                                                              =
   |
>   1.9e+10 ++                                                             =
   |
>           |                                                              =
   |
>   1.8e+10 ++                      O                                      =
   |
>           |                    O      O      O                           =
   |
>           O    O   O    O           O    O        O                      =
   |
>   1.7e+10 ++O              O O                  O                        =
   |
>           |      O    O                    O                             =
   |
>   1.6e+10 ++-------------------------------------------------------------=
---+
> =

> =

>                           time.involuntary_context_switches
> =

>   10000 ++----------------------------------O----------------------------=
---+
>    9000 ++                                                               =
   |
>         |         O    O   O    O    O    O    O O                       =
   |
>    8000 O+O  O                O    O    O                                =
   |
>    7000 ++     O    O    O                                               =
   |
>         |                                                                =
   |
>    6000 ++                                                               =
   |
>    5000 ++                                                               =
   |
>    4000 ++                                                               =
   |
>         |                                                                =
   |
>    3000 ++                                                               =
   |
>    2000 ++*..*        .*.*                                               =
   *
>         *     +  .*.*.    +  .*.*..*.*.. .*.*..*.*..    .*.*.*.. .*..    =
  +|
>    1000 ++     *.          *.           *           *.*.        *    *.*.=
.* |
>       0 ++---------------------------------------------------------------=
---+
> =

> =

> qperf:
>                           time.involuntary_context_switches
> =

>   25000 ++---------------------------------------------------------------=
---+
>         |                                                                =
   |
>         |                        O    O OO OO O OO                       =
   |
>   20000 O+O  OO    O O  O  O OO O                   O  O O  O OO O O  OO =
OO |
>         |  O     O    O  O                                               =
   O
>         |                                                                =
   |
>   15000 ++                         OO              O  O             O    =
   |
>         |       O                                          O             =
   |
>   10000 ++                                                               =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>    5000 ++                                                               =
   |
>         |.**.* .**.*.* .* .*. *.* .* .*.         *.**.**                 =
   |
>         *     *       *  *   *   *  *   **.**.*.*                        =
   |
>       0 ++---------------------------------------------------------------=
---+
> =

> =

>                                    qperf.udp.send_bw
> =

>   2.2e+09 *+**--*----*--**----**-*-----*-**----*---*---------------------=
---+
>           |    *  **  *    **      **.*     **  *.*  *.**                =
   |
>     2e+09 ++                                                             =
   |
>   1.8e+09 ++                                                             =
   |
>           |                                 O                       O    =
O  O
>   1.6e+09 ++                          O   O  O OO OO O OO OO  O  O     O =
 O |
>           |                            O O                   O  O  O  O  =
   |
>   1.4e+09 ++                                                             =
   |
>           |                                                              =
   |
>   1.2e+09 ++                                                             =
   |
>     1e+09 ++                                                             =
   |
>           | O                                                            =
   |
>     8e+08 O+       O    O  O  O    O                                     =
   |
>           |  O OO O  OO  O  O  O O  O                                    =
   |
>     6e+08 ++-------------------------------------------------------------=
---+
> =

> =

>                                    qperf.udp.recv_bw
> =

>   2.2e+09 *+**--*----*--**----**-*-----*-**----*---*---------------------=
---+
>           |    *  **  *    **      **.*     **  *.*  *.**                =
   |
>     2e+09 ++                                                             =
   |
>   1.8e+09 ++                                                             =
   |
>           |                                                         O    =
O  O
>   1.6e+09 ++                          O   O OO OO OO O OO OO  O  O     O =
 O |
>           |                            O O                   O  O  O  O  =
   |
>   1.4e+09 ++                                                             =
   |
>           |                                                              =
   |
>   1.2e+09 ++                                                             =
   |
>     1e+09 ++                                                             =
   |
>           | O                                                            =
   |
>     8e+08 O+       O    O  O  O    O                                     =
   |
>           |  O OO O  OO  O  O  O O  O                                    =
   |
>     6e+08 ++-------------------------------------------------------------=
---+
> =

> =

> will-it-scale unlink1:
> =

>                            time.voluntary_context_switches
> =

>   40000 ++--O---------O--------------------------------------------------=
---+
>         |          O                                                     =
   |
>   35000 O+     O          O          O  O      O       O                 =
   |
>   30000 ++                   O   O                        O   O      O  O=
   |
>         |                                   O      O             O       =
   O
>   25000 ++                                                               =
   |
>         |                                                                =
   |
>   20000 ++                                                               =
   |
>         |                                                                =
   |
>   15000 ++                                                               =
   |
>   10000 ++                                           ..*..*..            =
   |
>         |            .*...*..*...             .*...*.        .     ..*..*=
...|
>    5000 *+..*..*...*.            *...*..*...*.                *..*.      =
   *
>         |                                                                =
   |
>       0 ++---------------------------------------------------------------=
---+
> =

> =

>                           time.involuntary_context_switches
> =

>   60000 ++---------------------------------------------------------------=
---+
>         |                                      O          O   O      O   =
   |
>   50000 O+  O  O   O  O   O  O   O   O  O   O      O   O         O      O=
   O
>         |                                                                =
   |
>         |                                                                =
   |
>   40000 ++                                                               =
   |
>         |                                                                =
   |
>   30000 ++                                                               =
   |
>         |                                                                =
   |
>   20000 ++                                                               =
   |
>         |                                                                =
   |
>         |                                              *..               =
   |
>   10000 ++                                           ..   *..            =
   |
>         |                                           .        .           =
   |
>       0 *+--*--*---*--*---*--*---*---*--*---*--*---*----------*--*---*--*=
---*
> =

> Thanks,
> Fengguang
> =



--===============1734139128531223125==--

