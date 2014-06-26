Content-Type: multipart/mixed; boundary="===============7451010360236667752=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 7c66b15f870: +1.8% turbostat.Pkg_W
Date: Wed, 25 Jun 2014 19:10:23 -0700
Message-ID: <20140626021023.GO4603@linux.vnet.ibm.com>
In-Reply-To: <20140626013308.GA12239@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7451010360236667752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2014 at 09:33:08AM +0800, Fengguang Wu wrote:
> Hi Paul,
> =

> We noticed increased power consumption in our internal merge commit.
> It's not a direct evidence, however in the hope you can see any
> obvious clues. :)

Hello, Fengguang,

This particular branch is obsolete, and has been replaced by commit
4a81e8328d37 (Reduce overhead of cond_resched() checks for RCU).

Just out of curiosity, how do you measure the power consumption?

							Thanx, Paul

> git://internal_merge_and_test_tree devel-hourly-2014062315
> commit 7c66b15f8704703f6861faa246387342f7a05108 ("Merge 'rcu/rcu_cond_res=
ched.2014.06.20c' into devel-hourly-2014062315")
> =

> Merge sequence is:
> =

> 7c66b15 Merge 'rcu/rcu_cond_resched.2014.06.20c' into devel-hourly-201406=
2315
> db47b74 Merge 'ipvs-next/master' into devel-hourly-2014062315
> ca8d737 Merge 'regulator/topic/ab8500' into devel-hourly-2014062315
> aee9255 Merge 'renesas/devel' into devel-hourly-2014062315
> af18816 Merge 'vireshk/tick/lowres-go-tickless' into devel-hourly-2014062=
315
> 3cf94bc1 Merge 'vireshk/tick/ONESHOT-STOPPED' into devel-hourly-2014062315
> 94ae897 Merge 'asoc/topic/tlv320aic32x4' into devel-hourly-2014062315
> 28ef1ff Merge 'tianyu/dep_support' into devel-hourly-2014062315
> f04bc00 Merge 'robclark/msm-next' into devel-hourly-2014062315
> 03f1b1e Merge 'net/master' into devel-hourly-2014062315
> a1a9b33 Merge 'spi/fix/qup' into devel-hourly-2014062315
> 45bf5db Merge 'renesas/next' into devel-hourly-2014062315
> fb20fce Merge 'asoc/for-next' into devel-hourly-2014062315
> a385be7 Merge 'asoc/topic/samsung' into devel-hourly-2014062315
> 1a9f804 0day base guard for 'devel-hourly-2014062315'
> a497c3b Linux 3.16-rc2
> =

> test case: brickland3/vm-scalability/300s-anon-rx-seq-mt
> =

> db47b74b78e1623  7c66b15f8704703f6861faa24  =

> ---------------  -------------------------  =

>       0.73 ~ 7%     -13.4%       0.64 ~ 6%  TOTAL turbostat.%c1
>       1499 ~ 5%     +11.6%       1672 ~ 2%  TOTAL slabinfo.sock_inode_cac=
he.num_objs
>       1499 ~ 5%     +11.6%       1672 ~ 2%  TOTAL slabinfo.sock_inode_cac=
he.active_objs
>       4.36 ~ 1%      -8.1%       4.01 ~ 1%  TOTAL turbostat.%c6
>      11782 ~ 1%      +8.0%      12726 ~ 2%  TOTAL time.involuntary_contex=
t_switches
>       2848 ~ 0%      +4.8%       2983 ~ 0%  TOTAL time.user_time
>      24.26 ~ 0%      +4.4%      25.33 ~ 0%  TOTAL time.elapsed_time
>        402 ~ 0%      +2.0%        410 ~ 0%  TOTAL turbostat.Cor_W
>        469 ~ 0%      +1.8%        477 ~ 0%  TOTAL turbostat.Pkg_W
> =

> c8bb7487275a9b7  7c66b15f8704703f6861faa24
> ---------------  -------------------------
>  2.047e+08 ~ 0%      -5.2%  1.942e+08 ~ 0%  TOTAL vm-scalability.throughp=
ut
>      58629 ~11%     +25.1%      73348 ~13%  TOTAL numa-numastat.node3.loc=
al_node
>      58670 ~11%     +25.1%      73387 ~13%  TOTAL numa-numastat.node3.num=
a_hit
>         41 ~ 6%     -12.6%         36 ~ 1%  TOTAL numa-numastat.node2.oth=
er_node
>     493777 ~ 2%     -12.7%     431077 ~ 3%  TOTAL proc-vmstat.pgfault
>     386476 ~ 1%     -10.1%     347456 ~ 2%  TOTAL proc-vmstat.pgalloc_nor=
mal
>     366616 ~ 2%      -9.6%     331587 ~ 2%  TOTAL proc-vmstat.numa_hit
>     366489 ~ 2%      -9.6%     331475 ~ 2%  TOTAL proc-vmstat.numa_local
>      11970 ~ 2%      +6.3%      12726 ~ 2%  TOTAL time.involuntary_contex=
t_switches
>       2829 ~ 0%      +5.5%       2983 ~ 0%  TOTAL time.user_time
>      24.02 ~ 0%      +5.5%      25.33 ~ 0%  TOTAL time.elapsed_time
>        402 ~ 0%      +2.0%        410 ~ 0%  TOTAL turbostat.Cor_W
>        469 ~ 0%      +1.7%        477 ~ 0%  TOTAL turbostat.Pkg_W
> =

> Legend:
> 	~XX%    - stddev percent
> 	[+-]XX% - change percent
> =

> =

>                                   time.user_time
> =

>   3000 ++----------------------------------------------------------------=
---+
>   2980 ++O O O O     O   O   O O O O   O  O O                            =
   |
>        |         O O   O   O         O                                   =
   |
>   2960 O+                                                                =
   |
>   2940 ++                                                                =
   |
>        |                                                                 =
   |
>   2920 ++                                                                =
   |
>   2900 ++                                                                =
   |
>   2880 ++                                                                =
   |
>        |                                                                 =
   |
>   2860 ++        *. .*.   .*.                                   *.   .*. =
   |
>   2840 ++       +  *   *.*   *.                                +  *.*   *=
.  |
>        *.   .*.*               *.*.*.*.*..*.*.*. .*.*.*.*.*.*.*          =
 *.*
>   2820 ++*.*                                    *                        =
   |
>   2800 ++----------------------------------------------------------------=
---+
> =

> =

>                                  time.elapsed_time
> =

>     29 ++----------------------------------------------------------------=
---+
>   28.5 O+                                                                =
   |
>        |                                                                 =
   |
>     28 ++                                                                =
   |
>   27.5 ++                                                                =
   |
>     27 ++                                                                =
   |
>   26.5 ++                                                                =
   |
>        |                                                                 =
   |
>     26 ++                                                                =
   |
>   25.5 ++O O O O O O O   O O O O O O O O  O O                            =
   |
>     25 ++              O                                                 =
   |
>   24.5 ++                                                                =
   |
>        |    .*. .*.*.*.*.*.*.*.                                .*.*.*.*.*=
.  |
>     24 *+*.*   *               *.*.*.*.*..*.*.*.*.*.*.*.*.*.*.*          =
 *.*
>   23.5 ++----------------------------------------------------------------=
---+
> =

> =

>                                vm-scalability.throughput
> =

>   2.06e+08 ++*-*---------------------------------*-----------------------=
---+
>            *    +                 *.*.*.*.*.**.*   *.*.*.*.*.*.*         =
 *.|
>   2.04e+08 ++    *.*.            +                              +        =
+  *
>            |         **.*.*.*.*.*                                **.*.*.*=
   |
>   2.02e+08 ++                                                            =
   |
>            |                                                             =
   |
>      2e+08 ++                                                            =
   |
>            |                                                             =
   |
>   1.98e+08 ++                                                            =
   |
>            |                                                             =
   |
>   1.96e+08 O+                                                            =
   |
>            | O       OO   O                                              =
   |
>   1.94e+08 ++  O O O    O   O O O O O O O O OO                           =
   |
>            |                                                             =
   |
>   1.92e+08 ++------------------------------------------------------------=
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
> =



--===============7451010360236667752==--

