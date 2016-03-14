Content-Type: multipart/mixed; boundary="===============8488188022428173259=="
MIME-Version: 1.0
From: Yang, Libin <libin.yang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ALSA] ca53fbf3a6: WARNING: CPU: 0 PID: 151 at sound/hda/hdac_i915.c:129 pin2port+0x2a/0x40 [snd_hda_core]()
Date: Mon, 14 Mar 2016 12:02:39 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D1904681A1B@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <s5hh9g9y14o.wl-tiwai@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8488188022428173259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

> -----Original Message-----
> From: Takashi Iwai [mailto:tiwai(a)suse.de]
> Sent: Monday, March 14, 2016 3:23 PM
> To: kernel test robot
> Cc: lkp(a)01.org; LKML; Wu, Fengguang; Yang, Libin; Lin, Mengdong
> Subject: Re: [lkp] [ALSA] ca53fbf3a6: WARNING: CPU: 0 PID: 151 at
> sound/hda/hdac_i915.c:129 pin2port+0x2a/0x40 [snd_hda_core]()
> =

> On Mon, 14 Mar 2016 01:50:45 +0100,
> kernel test robot wrote:
> >
> > FYI, we noticed the below changes on
> >
> > https://github.com/0day-ci/linux Takashi-Iwai/ALSA-hda-Add-a-sanity-
> check-of-pin-port-mapping-on-i915-HDMI-DP/20160310-225740
> > commit ca53fbf3a609b6831222078af9ddbecbf76fddce ("ALSA: hda -
> Add a sanity check of pin / port mapping on i915 HDMI/DP")
> >
> >
> > [   14.546058] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops
> i915_audio_component_bind_ops [i915])
> > [   14.549740] fbcon: inteldrmfb (fb0) is primary device
> > [   14.553691] ------------[ cut here ]------------
> > [   14.553707] WARNING: CPU: 0 PID: 151 at
> sound/hda/hdac_i915.c:129 pin2port+0x2a/0x40 [snd_hda_core]()
> =

> Does your tree contain the commit
>   2f791908a70e95768596f5bb9e6de4f441d7bf13
>       drm/i915: Fix bogus dig_port_map[] assignment for pre-HSW
> ?
> =

> The commit above should cover it even for HSW.
> =

> If it's already included, then it's really a bug, and the warning is
> exactly for catching such a bug.  The HD-audio driver expects that the
> valid audio ports are only from port B to port D while i915 driver
> assigns a different one.  I suspect that the current assumption is too
> naive and broken for SKL and later in this regard.
> =

> Libin, Mengdong, could you check whether the audio port mapping rule
> is still valid?  At least, a wrong port-A mapping could be reproduced
> even on a HSW laptop with DP-MST dock when I boot without eDP
> (e.g. video=3DeDP-1:d option).

We checked with HW before, and the mapping should be right.
What's the problem now? I will check with our HW and gfx team.

Regards,
Libin

> =

> =

> thanks,
> =

> Takashi

--===============8488188022428173259==--

