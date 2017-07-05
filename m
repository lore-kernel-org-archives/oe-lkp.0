Content-Type: multipart/mixed; boundary="===============2769488718954297866=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ALSA] fcc88d91cd: WARNING:at_sound/hda/hdac_i915.c:#snd_hdac_i915_init[snd_hda_core]
Date: Wed, 05 Jul 2017 14:48:07 +0800
Message-ID: <20170705064807.GC24144@yexl-desktop>
In-Reply-To: <s5hinja2dj6.wl-tiwai@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2769488718954297866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/03, Takashi Iwai wrote:
>On Mon, 03 Jul 2017 04:41:02 +0200,
>kernel test robot wrote:
>> =

>> =

>> FYI, we noticed the following commit:
>> =

>> commit: fcc88d91cd36d1343a0ccc09444b21f6b0dad2d8 ("ALSA: hda - Bind with=
 i915 component before codec binding")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>....
>> [   12.300573] WARNING: CPU: 2 PID: 263 at sound/hda/hdac_i915.c:367 snd=
_hdac_i915_init+0x15a/0x17d [snd_hda_core]
>
>This should have been addressed by the later fix
>dba9b7b6ca1af60fd21137c18795a81a5652c5ae
>    ALSA: hda - Fix doubly initialization of i915 component
>
>Let me know if the issue is still present after that.
>

This WARNING is gone with for above commit.

Thanks,
Xiaolong

>
>thanks,
>
>Takashi

--===============2769488718954297866==--

