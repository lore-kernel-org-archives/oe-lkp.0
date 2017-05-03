Content-Type: multipart/mixed; boundary="===============6764862838540400166=="
MIME-Version: 1.0
From: Chen, Yu C <yu.c.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86 tsc_msr] 4fc5437c15: suspend.CPU_ON_1 -67% improvement
Date: Wed, 03 May 2017 08:45:36 +0000
Message-ID: <36DF59CE26D8EE47B0655C516E9CE6405F02C473@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <20170503083419.GC28430@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6764862838540400166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The branch of =

git://bee.sh.intel.com/git/power/linux.git yu
is a trial branch, with some unreleased-yet patches,
 might be helpful to do a normal cpu offline/online
operation(besides suspend to mem).
It looks like using tsc calibration on ivb could also get a different
tsc freq than the previous default PIT method.

-----Original Message-----
From: lkp-robot-request(a)eclists.intel.com [mailto:lkp-robot-request(a)ecl=
ists.intel.com] On Behalf Of Ye, Xiaolong
Sent: Wednesday, May 3, 2017 4:34 PM
To: Brown, Len <len.brown@intel.com>
Cc: lkp(a)01.org; Zhang, Rui <rui.zhang@intel.com>; Chen, Yu C <yu.c.chen=
@intel.com>
Subject: [lkp-robot] [x86 tsc_msr] 4fc5437c15: suspend.CPU_ON_1 -67% improv=
ement


Greeting,

FYI, we noticed a -67% improvement of suspend.CPU_ON_1 due to commit:


commit: 4fc5437c15077521a3d261572a8b740285e35f3b ("x86 tsc_msr: Extend to i=
nclude Intel Core Architecture") git://bee.sh.intel.com/git/power/linux.git=
 yu

in testcase: suspend
on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G =
memory with following parameters:

	runtime: 300s
	iterations: 10x
	presync: presync
	mode: mem




Details are as below:
---------------------------------------------------------------------------=
----------------------->


To reproduce:

        git clone https://github.com/01org/lkp-tests.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml

testcase/path_params/tbox_group/run: suspend/300s-10x-presync-mem/lkp-ivb-d=
02

c08e611b7d0169b5  4fc5437c15077521a3d261572a
----------------  --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

      1.53               7%       1.63        suspend.dpm_resume_early
      1.96               3%       2.02        suspend.CPU_OFF_1
     13.46                       13.63        suspend.dpm_resume_noirq
      2.98             -67%       0.98        suspend.CPU_ON_1
      2.91             -71%       0.84        suspend.CPU_ON_2
      2.99             -72%       0.85        suspend.CPU_ON_3



                                 suspend.CPU_ON_1

    3 ++*-*----*-*-*----*---*-*-*-*----*-*-*-*--*-*-*-*-*--*-*-*-*-*-*--*-*=
-*
      | : :    :   :    :   :     :    :                                   =
 |
  2.5 ++: :    :   :    :   :     :    :                                   =
 |
      | :  :   :   :   ::   :      :   :                                   =
 |
      |:   :  :     :  : : :       :  :                                    =
 |
    2 ++   :  :     :  : : :       :  :                                    =
 |
      |:   :  :     :  : : :       :  :                                    =
 |
  1.5 ++    : :     :  : : :        : :                                    =
 |
      |:    : :     : :  : :        : :                                    =
 |
    1 O+O O :O:O O  :O:  : :O O   O : :O O O O  O O O O                    =
 |
      |:    : :     : :  : :        : :                                    =
 |
      |     ::       ::   :         ::                                     =
 |
  0.5 ++     :       :    :          :                                     =
 |
      |      :       :    :          :                                     =
 |
    0 *+-----*-----O-*--O-O-----O----O-------------------------------------=
-+


                                 suspend.CPU_ON_2

    3 ++-----------*-------------------------------------------------*----*=
-*
      | *.*    *.* :    *   *.*.*.*    *.*.*.*..*.*.*.*.*..*.*.*.*.*    *  =
 |
  2.5 ++: :    :   :    :   :     :    :                                   =
 |
      | : :    :   :    :   :     :    :                                   =
 |
      | :  :   :    :  ::   :      :   :                                   =
 |
    2 ++   :  :     :  : : :       :  :                                    =
 |
      |:   :  :     :  : : :       :  :                                    =
 |
  1.5 ++   :  :     :  : : :       :  :                                    =
 |
      |:    : :     : :  : :        : :                                    =
 |
    1 ++    : :     : :  : :        : :                                    =
 |
      O:O O :O:O O  :O:  : :O O   O : :O O O O  O O O O                    =
 |
      |     ::       ::   :         ::                                     =
 |
  0.5 ++     :       :    :          :                                     =
 |
      |      :       :    :          :                                     =
 |
    0 *+-----*-----O-*--O-O-----O----O-------------------------------------=
-+


                                 suspend.CPU_ON_3

  3.5 ++-------------------------------------------------------------------=
-+
      |                                                                    =
 |
    3 ++*.*    *.       *   *.*. .*    *.*.*.*..*.*. .*.*..*.*.*.*. .*..*.*=
.*
      | : :    : *.*    :   :   * :    :            *              *       =
 |
  2.5 ++:  :   :   :    :   :      :   :                                   =
 |
      | :  :   :   :   : :  :      :   :                                   =
 |
    2 ++   :  :     :  : : :       :  :                                    =
 |
      |:   :  :     :  : : :       :  :                                    =
 |
  1.5 ++    : :     :  : : :        : :                                    =
 |
      |:    : :     : :  : :        : :                                    =
 |
    1 O+O O :O:     : :  : :O     O : :                                    =
 |
      |:    : :O O  :O:   ::  O     : :O O O O  O O O O                    =
 |
  0.5 ++     :       ::   :          :                                     =
 |
      |      :       :    :          :                                     =
 |
    0 *+-----*-----O-*--O-O-----O----O-------------------------------------=
-+

  [*] bisect-good sample
  [O] bisect-bad  sample


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed for informational purposes only. Any difference in system hardware or so=
ftware design or configuration may affect actual performance.


Thanks,
Xiaolong

--===============6764862838540400166==--

