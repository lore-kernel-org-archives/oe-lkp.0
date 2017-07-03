Content-Type: multipart/mixed; boundary="===============6716575204975456050=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ALSA] fcc88d91cd: WARNING:at_sound/hda/hdac_i915.c:#snd_hdac_i915_init[snd_hda_core]
Date: Mon, 03 Jul 2017 09:19:25 +0200
Message-ID: <s5hinja2dj6.wl-tiwai@suse.de>
In-Reply-To: <20170703024102.GA7070@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6716575204975456050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 03 Jul 2017 04:41:02 +0200,
kernel test robot wrote:
> =

> =

> FYI, we noticed the following commit:
> =

> commit: fcc88d91cd36d1343a0ccc09444b21f6b0dad2d8 ("ALSA: hda - Bind with =
i915 component before codec binding")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
....
> [   12.300573] WARNING: CPU: 2 PID: 263 at sound/hda/hdac_i915.c:367 snd_=
hdac_i915_init+0x15a/0x17d [snd_hda_core]

This should have been addressed by the later fix
dba9b7b6ca1af60fd21137c18795a81a5652c5ae
    ALSA: hda - Fix doubly initialization of i915 component

Let me know if the issue is still present after that.


thanks,

Takashi

--===============6716575204975456050==--

