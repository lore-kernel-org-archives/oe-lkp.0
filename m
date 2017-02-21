Content-Type: multipart/mixed; boundary="===============1821538249184568396=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [hrtimer] 336a9cde10 WARNING: CPU: 1 PID: 1 at kernel/time/hrtimer.c:1090 hrtimer_init
Date: Tue, 21 Feb 2017 13:31:19 +0800
Message-ID: <20170221053119.GA17556@yexl-desktop>
In-Reply-To: <20170221022351.GD10024@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1821538249184568396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/21, Ye Xiaolong wrote:
>Hi, fengguang
>On 02/20, Thomas Gleixner wrote:
>>On Tue, 21 Feb 2017, Fengguang Wu wrote:
>>
>>> Hi Marc,
>>> =

>>> FYI here is another bisect result. The attached reproduce-* script can
>>> be used to reproduce the bug.
>>
>>Again. This is a problem in the calling code The WARN_ON merily shows the
>>wreckage in the caller. Marc sent you a patch already...
>
>I'm verifying the fix patch.

Marc's workaround patch fixed this warning.

Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>

Thanks,
Xiaolong
>
>Thanks,
>Xiaolong
>>
>>> [   11.409712]  hrtimer_init+0x11f/0x199
>>> [   11.410666]  ? mac80211_hwsim_get_tsf+0x1d/0x1d
>>> [   11.411766]  tasklet_hrtimer_init+0x1b/0x4f
>>> [   11.412802]  mac80211_hwsim_new_radio+0x7fe/0x916
>>> [   11.413935]  ? set_debug_rodata+0x12/0x12
>>> [   11.414904]  init_mac80211_hwsim+0x138/0x29f
>>> [   11.415822]  ? rndis_wlan_driver_init+0x1b/0x1b
>>> [   11.416775]  do_one_initcall+0x90/0x142
>>> [   11.417632]  ? set_debug_rodata+0x12/0x12
>>> [   11.418511]  kernel_init_freeable+0x1cb/0x258
>>> [   11.419433]  ? rest_init+0x13b/0x13b
>>> [   11.420233]  kernel_init+0xe/0xf5
>>> [   11.421006]  ret_from_fork+0x2a/0x40
>>> [   11.421838] ---[ end trace 9c23eceab0d16aa5 ]---
>>> [   11.423540] ieee80211 phy1: Selected rate control algorithm 'minstre=
l_ht'
>_______________________________________________
>LKP mailing list
>LKP(a)lists.01.org
>https://lists.01.org/mailman/listinfo/lkp

--===============1821538249184568396==--

