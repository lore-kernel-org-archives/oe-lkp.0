Content-Type: multipart/mixed; boundary="===============1094003829529996331=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915] 04ff178484: phoronix-test-suite.supertuxkart.1024x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second -30.4% regression
Date: Fri, 22 Jan 2021 11:35:33 +0800
Message-ID: <84fda94a-7c98-06fe-95a4-7107521446fd@intel.com>
In-Reply-To: <SA2PR11MB49694B1464470425AF44AAAB9DA19@SA2PR11MB4969.namprd11.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1094003829529996331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/21/2021 10:18 PM, Chiou, Cooper wrote:
> I run =E2=80=9Cphoronix-test-suite run supertuxkart-1.5.2=E2=80=9D on my =
CML Ubuntu 18.04.5 LTS device, and compared the fps between patch and origi=
nal upstream, there is no any fps performance drop issue.
>
>          5.10.0-rc3 upstream /  5.10.0-rc3+patch
> fps     12.586326           /  12.687711
We have tested it before, the fps is 35.32 and 24.59=C2=A0 for the followin=
g =

two commits, but your test result is about 12 fps,=C2=A0 is it reasonable?=
=C2=A0 I =

guess something in your setup drop both performances for the two tests =

you have run.

commit:
   400d4953f1 ("drm/i915/pll: Centralize PLL_ENABLE register lookup")
   04ff178484 ("drm/i915: Enable WaProgramMgsrForCorrectSliceSpecificMmioRe=
ads for Gen9")

400d4953f1f434d5 04ff1784840f5f954a656c7e879
---------------- ---------------------------
          %stddev     %change         %stddev
              \          |                \
      35.32           -30.4%      24.59        phoronix-test-suite.supertux=
kart.1024x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second
       3638 =C2=B1 15%     -39.2%       2211 =C2=B1  4%  phoronix-test-suit=
e.time.involuntary_context_switches
      32.00           -30.5%      22.25        phoronix-test-suite.time.per=
cent_of_cpu_this_job_got

>
> Best Regards,
> Cooper
> +886-2-6622-1166
>
> -----Original Message-----
> From: kernel test robot <rong.a.chen@intel.com>
> Sent: Monday, September 21, 2020 5:22 PM
> To: Chiou, Cooper <cooper.chiou@intel.com>
> Cc: intel-gfx(a)lists.freedesktop.org; Chiou, Cooper <cooper.chiou@inte=
l.com>; Tseng, William <william.tseng@intel.com>; Nikula, Jani <jani.niku=
la@intel.com>; Chris Wilson <chris@chris-wilson.co.uk>; lkp <lkp@inte=
l.com>; Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>; Vivi, Ro=
drigo <rodrigo.vivi@intel.com>; Tvrtko Ursulin <tvrtko.ursulin@linux.in=
tel.com>; Lee, Shawn C <shawn.c.lee@intel.com>; LKML <linux-kernel@vger=
.kernel.org>; lkp(a)lists.01.org; Huang, Ying <ying.huang@intel.com>; Tan=
g, Feng <feng.tang@intel.com>; Xing, Zhengjun <zhengjun.xing@intel.com>=
; Chen, Guobing <guobing.chen@intel.com>; Chen, Ming A <ming.a.chen@int=
el.com>; Du, Frank <frank.du@intel.com>; Fan, Shuhua <shuhua.fan@intel.=
com>; Guo, Wangyang <wangyang.guo@intel.com>; Huang, Wenhuan <wenhuan.hua=
ng@intel.com>; Ji, Jessica <jessica.ji@intel.com>; Kang, Shan <shan.kan=
g@intel.com>; Li, Guangli <guangli.li@intel.com>; Li, Tiejun <tiejun.li=
@intel.com>; Ma, Yu <yu.ma@intel.com>; Mi, Dapeng1 <dapeng1.mi@intel.=
com>; Sun, Jiebin <jiebin.sun@intel.com>; Xie, Gengxin <gengxin.xie@int=
el.com>; Zhao, Fan <fan.zhao@intel.com>
> Subject: [drm/i915] 04ff178484: phoronix-test-suite.supertuxkart.1024x768=
.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second -30.4% regressi=
on
>
> Greeting,
>
> FYI, we noticed a -30.4% regression of phoronix-test-suite.supertuxkart.1=
024x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second due to c=
ommit:
>
>
> commit: 04ff1784840f5f954a656c7e8795c76467e29128 ("[Intel-gfx] [PATCH] dr=
m/i915: Enable WaProgramMgsrForCorrectSliceSpecificMmioReads for Gen9")
> url: https://github.com/0day-ci/linux/commits/Cooper-Chiou/drm-i915-Enabl=
e-WaProgramMgsrForCorrectSliceSpecificMmioReads-for-Gen9/20200917-021540
> base: git://anongit.freedesktop.org/drm-intel for-linux-next
>
> in testcase: phoronix-test-suite
> on test machine: 4 threads Intel(R) Core(TM) i7-7567U CPU @ 3.50GHz with =
32G memory with following parameters:
>
> 	need_x: true
> 	test: supertuxkart-1.5.2
> 	option_a: Fullscreen
> 	option_b: Ultimate
> 	option_c: 1
> 	option_d: Gran Paradiso Island [Approximately 275k triangles; advanced g=
raphics]
> 	cpufreq_governor: performance
> 	ucode: 0xd6
>
> test-description: The Phoronix Test Suite is the most comprehensive testi=
ng and benchmarking platform available that provides an extensible framewor=
k for which new tests can be easily added.
> test-url: http://www.phoronix-test-suite.com/
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/need_x/option_a/option_b/option_c/optio=
n_d/rootfs/tbox_group/test/testcase/ucode:
>    gcc-9/performance/x86_64-rhel-8.3/true/Fullscreen/Ultimate/1/Gran Para=
diso Island [Approximately 275k triangles; advanced graphics]/debian-x86_64=
-phoronix/lkp-kbl-nuc1/supertuxkart-1.5.2/phoronix-test-suite/0xd6
>
> commit:
>    400d4953f1 ("drm/i915/pll: Centralize PLL_ENABLE register lookup")
>    04ff178484 ("drm/i915: Enable WaProgramMgsrForCorrectSliceSpecificMmio=
Reads for Gen9")
>
> 400d4953f1f434d5 04ff1784840f5f954a656c7e879
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>       35.32           -30.4%      24.59        phoronix-test-suite.supert=
uxkart.1024x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second
>        3638 =C2=B1 15%     -39.2%       2211 =C2=B1  4%  phoronix-test-su=
ite.time.involuntary_context_switches
>       32.00           -30.5%      22.25        phoronix-test-suite.time.p=
ercent_of_cpu_this_job_got
>
>
>                                                                          =
        =

>                                                                          =
        =

>                                                                          =
        =

>    36 +------------------------------------------------------------------=
----+
>       |.+.+..+.+.+.+..+.+.+.+.+..+.+.+.+..+.+.+.+.+..+.+.+.+.+..+   +.+..=
+.+.|
>    34 |-+                                                                =
    |
>       |                                                                  =
    |
>       |                                                                  =
    |
>    32 |-+                                                                =
    |
>       |                                                                  =
    |
>    30 |-+                                                                =
    |
>       |                                                                  =
    |
>    28 |-+                                                                =
    |
>       |                                                                  =
    |
>       |                                                                  =
    |
>    26 |-+                                                                =
    |
>       | O O  O O O O  O O O O O  O O O O  O O O O O  O O                 =
    |
>    24 +------------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                phoronix-test-suite.time.percent_of_cpu_this_job_got
>                                                                          =
        =

>    32 +------------------------------------------------------------------=
----+
>       |               +       +.              +      +   +.+.+.          =
    |
>    30 |-+                                                                =
    |
>       |                                                                  =
    |
>       |                                                                  =
    |
>    28 |-+                                                                =
    |
>       |                                                                  =
    |
>    26 |-+                                                                =
    |
>       |                                                                  =
    |
>    24 |-+                                                                =
    |
>       |                                   O       O                      =
    |
>       |                                                                  =
    |
>    22 |-O O  O O   O  O O O O O  O O O O    O O O    O O                 =
    |
>       |          O                                                       =
    |
>    20 +------------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
        =

> [*] bisect-good sample
> [O] bisect-bad  sample
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Rong Chen
>
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing


--===============1094003829529996331==--

