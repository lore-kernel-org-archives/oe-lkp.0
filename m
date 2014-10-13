Content-Type: multipart/mixed; boundary="===============2069978689410071423=="
MIME-Version: 1.0
From: Ville Syrjälä <ville.syrjala@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915] 5ba60fc3d71: dmesg.WARNING:at_drivers/gpu/drm/i915/intel_pm.c:sandybridge_pcode_write_i915()
Date: Mon, 13 Oct 2014 13:18:50 +0300
Message-ID: <20141013101850.GA4284@intel.com>
In-Reply-To: <20141011052935.GE21803@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2069978689410071423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 11, 2014 at 01:29:35PM +0800, Fengguang Wu wrote:
> FYI, we noticed the below changes on
> =

> git://gitorious.org/vsyrjala/linux cdclk_3
> commit 5ba60fc3d719988a404d35a3e46f109bea643fef ("drm/i915: BDW cdclk cha=
nge support")
> =

> =

<snip>
> [   13.959092] WARNING: CPU: 0 PID: 75 at drivers/gpu/drm/i915/intel_pm.c=
:6231 sandybridge_pcode_write+0x171/0x190 [i915]()
> [   13.959112] Modules linked in: snd_hda_intel i915 snd_hda_controller s=
nd_hda_codec snd_hwdep snd_pcm drm_kms_helper snd_timer snd winbond_cir drm=
 soundcore ahci libahci rc_core pcspkr i2c_i801 libata parport_pc parport i=
2c_hid sdhci_acpi sdhci mmc_core video dw_dmac dw_dmac_core acpi_pad
> [   13.959115] CPU: 0 PID: 75 Comm: kworker/u16:1 Not tainted 3.17.0-rc7-=
g5ba60fc #1
> [   13.959116] Hardware name: Intel Corporation Broadwell Client platform=
/WhiteTip Mountain 1, BIOS BDW-E1R1.86C.0079.R00.1406020127 06/02/2014
> [   13.959122] Workqueue: events_unbound async_run_entry_fn
> [   13.959126]  0000000000000009 ffff880092cbb850 ffffffff818570a6 000000=
0000000000
> [   13.959129]  ffff880092cbb888 ffffffff8106ef1d ffff88014d380000 000000=
0000000000
> [   13.959131]  0000000000000018 ffff88014dc862f0 ffff88014d380000 ffff88=
0092cbb898
> [   13.959132] Call Trace:
> [   13.959137]  [<ffffffff818570a6>] dump_stack+0x4d/0x66
> [   13.959142]  [<ffffffff8106ef1d>] warn_slowpath_common+0x7d/0xa0
> [   13.959145]  [<ffffffff8106effa>] warn_slowpath_null+0x1a/0x20
> [   13.959173]  [<ffffffffa0213a51>] sandybridge_pcode_write+0x171/0x190 =
[i915]
> [   13.959212]  [<ffffffffa0267926>] haswell_modeset_global_resources+0x1=
96/0x4a0 [i915]

Thanks for the report. Seems I forgot to grab the relevant lock here.
Fixed patches pushed to cdclk_4 branch.

-- =

Ville Syrj=C3=A4l=C3=A4
Intel OTC

--===============2069978689410071423==--

