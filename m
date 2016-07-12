Content-Type: multipart/mixed; boundary="===============6131067358026418176=="
MIME-Version: 1.0
From: Ding, ChiX <chix.ding@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915/vlv] ff6eee6113: WARNING: CPU: 0 PID: 194 at drivers/gpu/drm/i915/intel_uncore.c:803 __unclaimed_reg_debug+0x6d/0x80 [i915]
Date: Tue, 12 Jul 2016 16:34:36 +0000
Message-ID: <FBBD98403E9C0B4AA00BFB8657163F851A4821A0@IRSMSX108.ger.corp.intel.com>
In-Reply-To: <20160712021159.GA5148@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6131067358026418176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi there
I have been assigned to aother project and no longer work on this anymore.

Thanks,
Chi

-----Original Message-----
From: lkp-request(a)eclists.intel.com [mailto:lkp-request(a)eclists.intel.c=
om] On Behalf Of Ye, Xiaolong
Sent: Tuesday, July 12, 2016 4:12 AM
To: Maarten Lankhorst
Cc: Wu, Fengguang; Ding, ChiX; LKML; lkp(a)01.org
Subject: [lkp] [drm/i915/vlv] ff6eee6113: WARNING: CPU: 0 PID: 194 at drive=
rs/gpu/drm/i915/intel_uncore.c:803 __unclaimed_reg_debug+0x6d/0x80 [i915]


FYI, we noticed the following commit:

https://github.com/0day-ci/linux Chi-Ding/drm-i915-Remove-unused-parameters=
-from-intel_plane_wm_parameters/20160623-210225
commit ff6eee61132377c1fcf44fec29ecc7560a2a9df0 ("drm/i915/vlv: Add interme=
diate field in intel_crtc_wm_state and handlers for two-level watermark")

in testcase: autotest
with following parameters: test=3Dcyclictest

on test machine: 2 threads Minnowboard Max with 2G memory

caused below changes:


<4>[   44.549007] ------------[ cut here ]------------
<4>[   44.549234] WARNING: CPU: 0 PID: 194 at drivers/gpu/drm/i915/intel_un=
core.c:803 __unclaimed_reg_debug+0x6d/0x80 [i915]
<4>[   44.549241] Unclaimed register detected after reading register 0x1f00=
30
<4>[   44.549313] Modules linked in: sd_mod coretemp kvm_intel kvm irqbypas=
s crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel i915 aesni=
_intel snd_hda_intel lrw gf128mul glue_helper ablk_helper cryptd video snd_=
hda_codec drm_kms_helper syscopyarea snd_hda_core s
ysfillrect pcspkr usb_storage snd_hwdep sysimgblt fb_sys_fops snd_pcm snd_t=
imer snd shpchp soundcore drm
<4>[   44.549323] CPU: 0 PID: 194 Comm: kworker/u2:2 Not tainted 4.7.0-rc2-=
00666-gff6eee6 #1
<4>[   44.549340] Workqueue: events_unbound async_run_entry_fn
<4>[   44.549354]  0000000000000000 ffff8800774f35b8 ffffffff81432c4a ffff8=
800774f3608
<4>[   44.549364]  0000000000000000 ffff8800774f35f8 ffffffff8107d681 00000=
323a01f4c2b
<4>[   44.549374]  00000000001f0030 0000000000000000 0000000000000001 ffff8=
80077a30000
<4>[   44.549376] Call Trace:
<4>[   44.549392]  [<ffffffff81432c4a>] dump_stack+0x63/0x89
<4>[   44.549401]  [<ffffffff8107d681>] __warn+0xd1/0xf0
<4>[   44.549410]  [<ffffffff8107d6ef>] warn_slowpath_fmt+0x4f/0x60
<4>[   44.549423]  [<ffffffff810b3996>] ? update_curr+0x66/0x180
<4>[   44.549433]  [<ffffffff810b3996>] ? update_curr+0x66/0x180
<4>[   44.549634]  [<ffffffffa01f4c7d>] __unclaimed_reg_debug+0x6d/0x80 [i9=
15]
<4>[   44.549830]  [<ffffffffa01f5e24>] vlv_read32+0x284/0x2c0 [i915]
<4>[   44.550010]  [<ffffffffa01aad44>] vlv_pipe_set_fifo_size+0xa4/0x2b0 [=
i915]
<4>[   44.550190]  [<ffffffffa01b0ac4>] vlv_update_wm+0x614/0x6e0 [i915]
<4>[   44.550201]  [<ffffffff810b53a5>] ? put_prev_entity+0x35/0x840
<4>[   44.550213]  [<ffffffff8102c74b>] ? __switch_to+0x29b/0x5b0
<4>[   44.550395]  [<ffffffffa01b0cbd>] vlv_initial_watermarks+0x8d/0xa0 [i=
915]
<4>[   44.550594]  [<ffffffffa021c30a>] intel_pre_plane_update+0x11a/0x1b0 =
[i915]
<4>[   44.550795]  [<ffffffffa021cb3b>] intel_atomic_commit_tail+0x2cb/0x11=
10 [i915]
<4>[   44.550806]  [<ffffffff810c2022>] ? complete_all+0x42/0x50
<4>[   44.550818]  [<ffffffff810a38f9>] ? __might_sleep+0x49/0x80
<4>[   44.551018]  [<ffffffffa021dd24>] intel_atomic_commit+0x3a4/0x530 [i9=
15]
<4>[   44.551117]  [<ffffffffa001f800>] ? drm_atomic_check_only+0xd0/0x640 =
[drm]
<4>[   44.551207]  [<ffffffffa0020277>] ? drm_atomic_add_affected_connector=
s+0x27/0xf0 [drm]
<4>[   44.551297]  [<ffffffffa001fda7>] drm_atomic_commit+0x37/0x60 [drm]
<4>[   44.551345]  [<ffffffffa013924c>] restore_fbdev_mode+0x14c/0x270 [drm=
_kms_helper]
<4>[   44.551389]  [<ffffffffa013abf3>] drm_fb_helper_restore_fbdev_mode_un=
locked+0x33/0x80 [drm_kms_helper]
<4>[   44.551432]  [<ffffffffa013ac6d>] drm_fb_helper_set_par+0x2d/0x50 [dr=
m_kms_helper]
<4>[   44.551475]  [<ffffffffa013ab78>] drm_fb_helper_hotplug_event+0xa8/0x=
f0 [drm_kms_helper]
<4>[   44.551518]  [<ffffffffa013ac16>] drm_fb_helper_restore_fbdev_mode_un=
locked+0x56/0x80 [drm_kms_helper]
<4>[   44.551561]  [<ffffffffa013ac6d>] drm_fb_helper_set_par+0x2d/0x50 [dr=
m_kms_helper]
<4>[   44.551766]  [<ffffffffa0236afa>] intel_fbdev_set_par+0x1a/0x60 [i915]
<4>[   44.551778]  [<ffffffff814a6413>] fbcon_init+0x533/0x5a0
<4>[   44.551790]  [<ffffffff8153e84a>] visual_init+0xca/0x130
<4>[   44.551800]  [<ffffffff81540cc7>] do_bind_con_driver+0x167/0x3a0
<4>[   44.551812]  [<ffffffff8154122f>] do_take_over_console+0x12f/0x1a0
<4>[   44.551822]  [<ffffffff814a16e7>] do_fbcon_takeover+0x57/0xb0
<4>[   44.551831]  [<ffffffff814a6e8d>] fbcon_event_notify+0x64d/0x750
<4>[   44.551844]  [<ffffffff8109ddda>] notifier_call_chain+0x4a/0x70
<4>[   44.551855]  [<ffffffff8109e127>] __blocking_notifier_call_chain+0x47=
/0x60
<4>[   44.551866]  [<ffffffff8109e156>] blocking_notifier_call_chain+0x16/0=
x20
<4>[   44.551876]  [<ffffffff814ac6db>] fb_notifier_call_chain+0x1b/0x20
<4>[   44.551887]  [<ffffffff814ae8bb>] register_framebuffer+0x24b/0x330
<4>[   44.551932]  [<ffffffffa013aec8>] drm_fb_helper_initial_config+0x238/=
0x3c0 [drm_kms_helper]
<4>[   44.552130]  [<ffffffffa0237d68>] intel_fbdev_initial_config+0x18/0x3=
0 [i915]
<4>[   44.552140]  [<ffffffff8109f87a>] async_run_entry_fn+0x4a/0x140
<4>[   44.552149]  [<ffffffff810969b8>] process_one_work+0x158/0x460
<4>[   44.552158]  [<ffffffff8109761e>] worker_thread+0x4e/0x4c0
<4>[   44.552167]  [<ffffffff810975d0>] ? rescuer_thread+0x350/0x350
<4>[   44.552175]  [<ffffffff810975d0>] ? rescuer_thread+0x350/0x350
<4>[   44.552185]  [<ffffffff8109cbc4>] kthread+0xd4/0xf0
<4>[   44.552199]  [<ffffffff819177ff>] ret_from_fork+0x1f/0x40
<4>[   44.552209]  [<ffffffff8109caf0>] ? kthread_park+0x60/0x60
<4>[   44.552216] ---[ end trace 1395d82281f53585 ]---



To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml



Thanks,
Xiaolong
--------------------------------------------------------------
Intel Research and Development Ireland Limited
Registered in Ireland
Registered Office: Collinstown Industrial Park, Leixlip, County Kildare
Registered Number: 308263


This e-mail and any attachments may contain confidential material for the s=
ole
use of the intended recipient(s). Any review or distribution by others is
strictly prohibited. If you are not the intended recipient, please contact =
the
sender and delete all copies.


--===============6131067358026418176==--

