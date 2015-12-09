Content-Type: multipart/mixed; boundary="===============0987082803913319432=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: lkp@lists.01.org
Subject: Re: [ALSA] 6603249dcd: kmsg.snd_hda_intel#:#:#b.#:failed_to_add_i915_component_master(-#)
Date: Wed, 09 Dec 2015 07:39:02 +0100
Message-ID: <s5hy4d4yvll.wl-tiwai@suse.de>
In-Reply-To: <878u54chg9.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0987082803913319432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 09 Dec 2015 06:35:34 +0100,
kernel test robot wrote:
> =

> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Takashi-Sakamoto/ALSA-oxfw-refactoring-a=
nd-merging-scs1x-module/20151206-122843
> commit 6603249dcdbb6aab0b726bdf372d6f20c0d2d611 ("ALSA: hda - Enable audi=
o component for old Intel PCH devices")
> =

> We found the following new message in kernel log after your commit.
> =

> [    9.672121] snd_hda_intel 0000:00:1b.0: failed to add i915 component m=
aster (-19)
> =

> Thanks,
> Ying Huang

The error message can be ignored.  In anyway, I already have a fix
patch to avoid this.


thanks,

Takashi

--===============0987082803913319432==--

