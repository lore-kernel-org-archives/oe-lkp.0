Content-Type: multipart/mixed; boundary="===============2582826432559539979=="
MIME-Version: 1.0
From: Chiou, Cooper <cooper.chiou@intel.com>
To: lkp@lists.01.org
Subject: Re: [Intel-gfx] [drm/i915] 04ff178484: phoronix-test-suite.supertuxkart.1024x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second -30.4% regression
Date: Wed, 17 Feb 2021 06:56:17 +0000
Message-ID: <SA2PR11MB49698E6D1BB060243754CC939D869@SA2PR11MB4969.namprd11.prod.outlook.com>
In-Reply-To: <20210208004544.GA1712029@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2582826432559539979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi upstream committee, =


Please consider to merge this patch which resolved VP8 hardware encoding GP=
U hang critical issue on Gen9 sku, and there is no performance regression o=
n this fix.

Best Regards,
Cooper

-----Original Message-----
From: kernel test robot <rong.a.chen@intel.com> =

Sent: Monday, February 8, 2021 8:46 AM
To: Chiou, Cooper <cooper.chiou@intel.com>
Cc: Tang, Feng <feng.tang@intel.com>; Li, Tiejun <tiejun.li@intel.com>;=
 Chris Wilson <chris@chris-wilson.co.uk>; Du, Frank <frank.du@intel.com=
>; Chen, Guobing <guobing.chen@intel.com>; Tseng, William <william.tseng(=
a)intel.com>; Xie, Gengxin <gengxin.xie@intel.com>; Fan, Shuhua <shuhua.f=
an@intel.com>; Zhao, Fan <fan.zhao@intel.com>; Huang, Ying <ying.huang(=
a)intel.com>; Kang, Shan <shan.kang@intel.com>; Xing, Zhengjun <zhengjun.=
xing@intel.com>; Huang, Wenhuan <wenhuan.huang@intel.com>; Nikula, Jani=
 <jani.nikula@intel.com>; intel-gfx(a)lists.freedesktop.org; lkp(a)lists.=
01.org; Chen, Ming A <ming.a.chen@intel.com>; Ma, Yu <yu.ma@intel.com>;=
 Ji, Jessica <jessica.ji@intel.com>; Li, Guangli <guangli.li@intel.com>=
; Guo, Wangyang <wangyang.guo@intel.com>; Mi, Dapeng1 <dapeng1.mi@intel=
.com>; LKML <linux-kernel@vger.kernel.org>; Sun, Jiebin <jiebin.sun@int=
el.com>
Subject: Re: [Intel-gfx] [drm/i915] 04ff178484: phoronix-test-suite.supertu=
xkart.1024x768.Fullscreen.Ultimate.1.GranParadisoIsland.frames_per_second -=
30.4% regression

Hi all,

The problem can't be reproduced after test environment changed, there's no =
regression found on this patch now, we don't know yet why it caused a regre=
ssion in September 2020, but we'll continue to root cause.

Best Regards,
Rong Chen

--===============2582826432559539979==--

