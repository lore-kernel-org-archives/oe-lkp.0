Content-Type: multipart/mixed; boundary="===============3317418465238868215=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: lkp@lists.01.org
Subject: Re: [ALSA] 1a414f48d7: WARNING: CPU: 0 PID: 252 at sound/hda/hdac_i915.c:129 pin2port+0x2a/0x40 [snd_hda_core]()
Date: Wed, 16 Mar 2016 08:29:29 +0100
Message-ID: <s5h37rqx4me.wl-tiwai@suse.de>
In-Reply-To: <87bn6fz2x8.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3317418465238868215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Mar 2016 01:23:15 +0100,
kernel test robot wrote:
> =

> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 1a414f48d7ccb197b61c18888b72327c98171844 ("ALSA: hda - Add a sanit=
y check of pin / port mapping on i915 HDMI/DP")

The question is rather which hardware you're testing.
Is it a pre-Haswell hardware?  If yes, it should be already covered by
the patch I queued yesterday, so today's tree should work fine.
So, let me know if this is still seen with the upcoming tree.


thanks,

Takashi

--===============3317418465238868215==--

