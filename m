Content-Type: multipart/mixed; boundary="===============8212756272723233205=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/platform/UV] 71854cb812: will-it-scale.per_thread_ops -2.3% regression
Date: Mon, 31 Oct 2016 13:41:01 +0800
Message-ID: <20161031054101.b27mjyr46b3r2tbp@wfg-t540p.sh.intel.com>
In-Reply-To: <alpine.DEB.2.20.1610280030460.4913@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============8212756272723233205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

It's been a big challenge that we'll occasionally run into such bisect
whose data show clear changes, however cannot be easily explained by
looking at the code logic.

On Fri, Oct 28, 2016 at 12:37:45AM +0200, Thomas Gleixner wrote:
>On Thu, 27 Oct 2016, Ye Xiaolong wrote:
>> Yes, this is weird, the per_thread_ops change is small and should be run
>> to run variation, the actual significant change is will-it-scale.time.us=
er_time
>> -27% decrease, but the patch seems not relevant, we can't interpret it. =
:(
>>
>> We've tried to queue the jobs (4 times) for
>> 71854cb812ec23bfe5f63d52217e6b9e6cb901f5 and v4.9-rc1 with new kconfig
>> (added CONFIG_DEBUG_INFO_REDUCED), and result shows user_time change is
>> quite stable.
>
>>         v4.9-rc1 71854cb812ec23bfe5f63d5221
>> ---------------- --------------------------
>>          %stddev     %change         %stddev
>>              \          |                \
>>    1670068 =C2=B1  0%      -3.8%    1606650 =C2=B1  1%  will-it-scale.pe=
r_thread_ops
>>       9749 =C2=B1  2%   +1328.0%     139222 =C2=B1105%  will-it-scale.ti=
me.involuntary_context_switches
>
>	     	     		  ^^^^^^ This is massive
>
>I have no explanation for this either, but you really should try to figure
>out what's going on here.

Xiaolong, how about doing a small debug patch (a WARN_ONCE() line may
be enough) to verify whether the code path is executed?

It'd also help to compare vmlinux according to Thomas' reasoning:

>The only difference between plain rc1 and rc + this patch is the resulting
>text size and therefor some other unrelated stuff moving to different
>places in memory which has some yet to figure out side effects.

Yeah that's possible.

>From bisect POV, the below graphs show the user_time and system_time
are clearly and consistently different before/after commit 71854cb812.
So this commit must impacted something.

Legend:
        [*] bisect good samples (eg. tests run on commits before 71854cb812)
        [o] bisect bad samples  (eg. tests run on commits  since 71854cb812)

                          will-it-scale.time.user_time

  85 ++--------------------------------------------------------------------=
-+
     | .*.*..      .*..*.    .*..*.       .*.. .*..*.       .*             =
 |
  80 *+      *.*..*      *..*      *..*..*    *      *..*.*.               =
 |
     |                                                                     =
 |
     |                                                                     =
 |
  75 ++                                                                    =
 |
     |                                                                     =
 |
  70 ++                                                                    =
 |
     |                                                                     =
 |
  65 ++                                                                    =
 |
     |                                                                     =
 |
     |    O    O                                                           =
 |
  60 O+ O    O           O       O O  O  O    O      O  O O  O O  O O  O O =
 O
     |            O O  O    O O            O    O  O                       =
 |
  55 ++--------------------------------------------------------------------=
-+



                          will-it-scale.time.system_time

  1010 ++------------------------------------------------------------------=
-+
       |                                                                   =
 |
  1005 ++          O  O O    O  O           O O  O O                       =
 |
       O O    O            O      O  O O  O           O O  O O  O O  O O  O=
 O
       |    O    O                                                         =
 |
  1000 ++                                                                  =
 |
       |                                                                   =
 |
   995 ++                                                                  =
 |
       |                                                                   =
 |
   990 ++                                                                  =
 |
       |                                                                   =
 |
       |                                                                   =
 |
   985 ++                                                                  =
 |
       *.    .*..*.*..    .*.*..    .*.*..*. .*..    .*.*..*.              =
 |
   980 ++*--*---------*-*-------*-*---------*----*-*---------*-------------=
-+


The voluntary_context_switches increase looks obvious, too, though not
as consistent:

                    will-it-scale.time.voluntary_context_switches

  160000 ++----------------------------------------------------------------=
-+
         |                       O                                         =
 |
  150000 ++                                                                =
 |
         |                                                                 =
 |
  140000 ++          O         O           O                               =
 |
         |                         O  O O                                  =
 |
  130000 ++            O                                                   =
 |
         | O                                      O O                      =
 |
  120000 ++     O .*                   .*..    O        .*                 =
 |
         O   .O.*. O+             .*..*      O     .*.*.  +O  O      O O   =
 |
  110000 *+*.        *.       .*.*         *. .*..*        *..  O O       O=
 O
         |             *..*.*.               *        O  O    *            =
 |
  100000 ++                 O                                              =
 |
         |                O                                                =
 |
   90000 ++----------------------------------------------------------------=
-+


So do the branch misses:

                                perf-stat.branch-misses

  6.5e+09 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    6e+09 ++               O O                                             =
 |
  5.5e+09 ++                                                               =
 |
          |                                                                =
 |
    5e+09 ++                                                               =
 |
          O O    O                                                         =
 |
  4.5e+09 ++   O   O  O O                                                  =
 |
          |                                                                =
 |
    4e+09 ++                             O O           O O  O O O  O O O  O=
 O
  3.5e+09 ++                                                               =
 |
          |                                  O      O                      =
 |
    3e+09 *+*..      .*.*..*.*.*..*.O O   .*.*..O.O.       .*.*            =
 |
          |    *.*.*.          O  O *.*..*          *..*.*.                =
 |
  2.5e+09 ++---------------------------------------------------------------=
-+


                            perf-stat.branch-miss-rate%

   0.6 ++------------------O-----------------------------------------------=
-+
       |                O                                                  =
 |
  0.55 ++                                                                  =
 |
       |                                                                   =
 |
   0.5 ++                                                                  =
 |
       O O    O    O                                                       =
 |
  0.45 ++   O    O    O                                                    =
 |
       |                                                                   =
 |
   0.4 ++                                 O             O       O         O=
 |
       |                               O              O    O O    O  O O   =
 O
  0.35 ++                                                                  =
 |
       |                                           O                       =
 |
   0.3 *+*..      .*..*.*..*.*..*.O  O   .*.O.O..O.       .*.*             =
 |
       |    *.*..*           O  O *..*.*.          *..*.*.                 =
 |
  0.25 ++------------------------------------------------------------------=
-+

Regards,
Fengguang

--===============8212756272723233205==--

