Content-Type: multipart/mixed; boundary="===============7395617086774441024=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [ext4] 71d4f7d0321: -49.6% xfstests.generic.274.seconds
Date: Fri, 22 Aug 2014 09:52:23 +0800
Message-ID: <20140822015223.GA11430@localhost>
In-Reply-To: <20140821143006.GA19943@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7395617086774441024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2014 at 10:30:06PM +0800, Fengguang Wu wrote:
> Hi Ted,
> =

> We noticed increased xfstests 274's test speed and the first good
> commit is 71d4f7d032149b935a26eb3ff85c6c837f3714e1 ("ext4: remove
> metadata reservation checks").
> =

> test case: snb-drag/xfstests/4HDD-ext4-generic-slow2
> snb-drag is a Sandy Bridge PC with 6G memory.
> =

> d5e03cbb0c88cd1  71d4f7d032149b935a26eb3ff =

> ---------------  ------------------------- =

>         51 =C2=B1 2%     -49.6%         25 =C2=B1 1%  TOTAL xfstests.gene=
ric.274.seconds
>        817 =C2=B1 1%      -3.0%        792 =C2=B1 1%  TOTAL time.elapsed_=
time
> =

>                           xfstests.generic.274.seconds
> =

>   60 ++------------------------------------------------------------------=
---+
>      |                                                                   =
   |
>   55 ++         .*..*..             *..               *..                =
   |
>      |       .*.       .          ..                ..                   =
   |
>   50 *+.*..*.           *..*..*..*     *..*..*..*..*     *               =
   |
>      |                                                                   =
   |
>   45 ++                                                                  =
   |
>      |                                                                   =
   |
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
>   25 O+-O--O--O--O--O---O--O--O--O--O--O--O--O--O--O--O--O---O--O--O--O--=
O--O
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample

This is sweet, got another improvement:

testbox/testcase/testparams: snb-drag/xfstests/4HDD-ext4-generic-mid

d5e03cbb0c88cd1  71d4f7d032149b935a26eb3ff  =

---------------  -------------------------  =

        45 =C2=B1 4%     -50.2%         22 =C2=B1 7%  xfstests.generic.256.=
seconds
   7044859 =C2=B1 2%      -7.0%    6553446 =C2=B1 0%  time.minor_page_faults
     36156 =C2=B1 2%      -7.0%      33638 =C2=B1 0%  time.involuntary_cont=
ext_switches
    171551 =C2=B1 1%      -4.8%     163312 =C2=B1 0%  time.voluntary_contex=
t_switches
       436 =C2=B1 1%      -5.7%        411 =C2=B1 0%  time.elapsed_time

                           time.voluntary_context_switches

  176000 ++----------------------------------------------------------------=
-+
         |                   *        *..         *..                      =
 |
  174000 ++       *..      .. :      :   *..*    :   *                     =
 |
  172000 ++     ..     .*.*   :      :       +   :    +                    =
 |
         *..*..*     *.        :    :         + :      +  .*               =
 |
  170000 ++                    :  .*           *        *.                 =
 |                                                                   =

  168000 ++                     *.                                         =
 |
         |                                                                 =
 |
  166000 ++                                                                =
 |
  164000 ++                     O                                  O       =
 |
         |                   O     O  O     O     O  O  O       O     O  O =
 O
  162000 ++ O        O  O O                                O O             =
 |
  160000 O+                              O     O                           =
 |
         |     O  O                                                        =
 |
  158000 ++----------------------------------------------------------------=
-+


                          xfstests.generic.256.seconds

  60 ++-----------------------------*--------------------------------------=
-+
     |                             : :                                     =
 |
  55 ++                            : :                                     =
 |
  50 ++                           :   :                                    =
 |
     | .*..                     .*    :     .*..                           =
 |
  45 *+    *..  .*..*...*..*..*.       : .*.      .*..  .*                 =
 |
     |        *.                       *.       *.    *.                   =
 |
  40 ++                                                                    =
 |
     |                                                                     =
 |
  35 ++                                                                    =
 |
  30 ++                                                                    =
 |
     |                                                                     =
 |
  25 ++                                                  O         O       =
 |
     O  O     O  O      O  O           O     O     O         O  O     O  O =
 |
  20 ++----O--------O---------O--O--O-----O-----O-----O--------------------=
-O

Thanks,
Fengguang

--===============7395617086774441024==--

