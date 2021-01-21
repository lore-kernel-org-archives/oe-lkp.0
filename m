Content-Type: multipart/mixed; boundary="===============0155818041671347859=="
MIME-Version: 1.0
From: Chiou, Cooper <cooper.chiou@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915] 04ff178484: phoronix-test-suite.supertuxkart.1024x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second -30.4% regression
Date: Thu, 21 Jan 2021 14:18:25 +0000
Message-ID: <SA2PR11MB49694B1464470425AF44AAAB9DA19@SA2PR11MB4969.namprd11.prod.outlook.com>
In-Reply-To: <20200921092220.GH13157@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0155818041671347859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I run =E2=80=9Cphoronix-test-suite run supertuxkart-1.5.2=E2=80=9D on my CM=
L Ubuntu 18.04.5 LTS device, and compared the fps between patch and origina=
l upstream, there is no any fps performance drop issue. =


        5.10.0-rc3 upstream /  5.10.0-rc3+patch
fps     12.586326           /  12.687711

Best Regards,
Cooper
+886-2-6622-1166

-----Original Message-----
From: kernel test robot <rong.a.chen@intel.com> =

Sent: Monday, September 21, 2020 5:22 PM
To: Chiou, Cooper <cooper.chiou@intel.com>
Cc: intel-gfx(a)lists.freedesktop.org; Chiou, Cooper <cooper.chiou@intel.=
com>; Tseng, William <william.tseng@intel.com>; Nikula, Jani <jani.nikula=
@intel.com>; Chris Wilson <chris@chris-wilson.co.uk>; lkp <lkp@intel.=
com>; Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>; Vivi, Rodr=
igo <rodrigo.vivi@intel.com>; Tvrtko Ursulin <tvrtko.ursulin@linux.inte=
l.com>; Lee, Shawn C <shawn.c.lee@intel.com>; LKML <linux-kernel@vger.k=
ernel.org>; lkp(a)lists.01.org; Huang, Ying <ying.huang@intel.com>; Tang,=
 Feng <feng.tang@intel.com>; Xing, Zhengjun <zhengjun.xing@intel.com>; =
Chen, Guobing <guobing.chen@intel.com>; Chen, Ming A <ming.a.chen@intel=
.com>; Du, Frank <frank.du@intel.com>; Fan, Shuhua <shuhua.fan@intel.co=
m>; Guo, Wangyang <wangyang.guo@intel.com>; Huang, Wenhuan <wenhuan.huang=
@intel.com>; Ji, Jessica <jessica.ji@intel.com>; Kang, Shan <shan.kang(=
a)intel.com>; Li, Guangli <guangli.li@intel.com>; Li, Tiejun <tiejun.li(a=
)intel.com>; Ma, Yu <yu.ma@intel.com>; Mi, Dapeng1 <dapeng1.mi@intel.co=
m>; Sun, Jiebin <jiebin.sun@intel.com>; Xie, Gengxin <gengxin.xie@intel=
.com>; Zhao, Fan <fan.zhao@intel.com>
Subject: [drm/i915] 04ff178484: phoronix-test-suite.supertuxkart.1024x768.F=
ullscreen.Ultimate.1.GranParadisoIsland.frames_per_second -30.4% regression

Greeting,

FYI, we noticed a -30.4% regression of phoronix-test-suite.supertuxkart.102=
4x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second due to com=
mit:


commit: 04ff1784840f5f954a656c7e8795c76467e29128 ("[Intel-gfx] [PATCH] drm/=
i915: Enable WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9")
url: https://github.com/0day-ci/linux/commits/Cooper-Chiou/drm-i915-Enable-=
WaProgramMgsrForCorrectSliceSpecificMmioReads-for-Gen9/20200917-021540
base: git://anongit.freedesktop.org/drm-intel for-linux-next

in testcase: phoronix-test-suite
on test machine: 4 threads Intel(R) Core(TM) i7-7567U CPU @ 3.50GHz with 32=
G memory with following parameters:

	need_x: true
	test: supertuxkart-1.5.2
	option_a: Fullscreen
	option_b: Ultimate
	option_c: 1
	option_d: Gran Paradiso Island [Approximately 275k triangles; advanced gra=
phics]
	cpufreq_governor: performance
	ucode: 0xd6

test-description: The Phoronix Test Suite is the most comprehensive testing=
 and benchmarking platform available that provides an extensible framework =
for which new tests can be easily added.
test-url: http://www.phoronix-test-suite.com/



If you fix the issue, kindly add following tag
Reported-by: kernel test robot <rong.a.chen@intel.com>


Details are as below:
---------------------------------------------------------------------------=
----------------------->


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/need_x/option_a/option_b/option_c/option_=
d/rootfs/tbox_group/test/testcase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/true/Fullscreen/Ultimate/1/Gran Paradis=
o Island [Approximately 275k triangles; advanced graphics]/debian-x86_64-ph=
oronix/lkp-kbl-nuc1/supertuxkart-1.5.2/phoronix-test-suite/0xd6

commit: =

  400d4953f1 ("drm/i915/pll: Centralize PLL_ENABLE register lookup")
  04ff178484 ("drm/i915: Enable WaProgramMgsrForCorrectSliceSpecificMmioRea=
ds for Gen9")

400d4953f1f434d5 04ff1784840f5f954a656c7e879
---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     35.32           -30.4%      24.59        phoronix-test-suite.supertuxk=
art.1024x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second
      3638 =C2=B1 15%     -39.2%       2211 =C2=B1  4%  phoronix-test-suite=
.time.involuntary_context_switches
     32.00           -30.5%      22.25        phoronix-test-suite.time.perc=
ent_of_cpu_this_job_got


                                                                           =
     =

                                                                           =
     =

                                                                           =
     =

  36 +---------------------------------------------------------------------=
-+   =

     |.+.+..+.+.+.+..+.+.+.+.+..+.+.+.+..+.+.+.+.+..+.+.+.+.+..+   +.+..+.+=
.|   =

  34 |-+                                                                   =
 |   =

     |                                                                     =
 |   =

     |                                                                     =
 |   =

  32 |-+                                                                   =
 |   =

     |                                                                     =
 |   =

  30 |-+                                                                   =
 |   =

     |                                                                     =
 |   =

  28 |-+                                                                   =
 |   =

     |                                                                     =
 |   =

     |                                                                     =
 |   =

  26 |-+                                                                   =
 |   =

     | O O  O O O O  O O O O O  O O O O  O O O O O  O O                    =
 |   =

  24 +---------------------------------------------------------------------=
-+   =

                                                                           =
     =

                                                                           =
                                                                           =
          =

              phoronix-test-suite.time.percent_of_cpu_this_job_got         =
     =

                                                                           =
     =

  32 +---------------------------------------------------------------------=
-+   =

     |               +       +.              +      +   +.+.+.             =
 |   =

  30 |-+                                                                   =
 |   =

     |                                                                     =
 |   =

     |                                                                     =
 |   =

  28 |-+                                                                   =
 |   =

     |                                                                     =
 |   =

  26 |-+                                                                   =
 |   =

     |                                                                     =
 |   =

  24 |-+                                                                   =
 |   =

     |                                   O       O                         =
 |   =

     |                                                                     =
 |   =

  22 |-O O  O O   O  O O O O O  O O O O    O O O    O O                    =
 |   =

     |          O                                                          =
 |   =

  20 +---------------------------------------------------------------------=
-+   =

                                                                           =
     =

                                                                           =
     =

[*] bisect-good sample
[O] bisect-bad  sample



Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Rong Chen


--===============0155818041671347859==--

