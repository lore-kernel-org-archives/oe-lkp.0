Content-Type: multipart/mixed; boundary="===============8093949906009435955=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ALSA] 1a414f48d7: WARNING: CPU: 0 PID: 252 at sound/hda/hdac_i915.c:129 pin2port+0x2a/0x40 [snd_hda_core]()
Date: Wed, 16 Mar 2016 15:57:02 +0800
Message-ID: <87io0msvn5.fsf@yhuang-dev.intel.com>
In-Reply-To: <s5h37rqx4me.wl-tiwai@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============8093949906009435955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Takashi Iwai <tiwai@suse.de> writes:

> On Wed, 16 Mar 2016 01:23:15 +0100,
> kernel test robot wrote:
>> =

>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>> commit 1a414f48d7ccb197b61c18888b72327c98171844 ("ALSA: hda - Add a
>> sanity check of pin / port mapping on i915 HDMI/DP")
>
> The question is rather which hardware you're testing.
> Is it a pre-Haswell hardware?

Yes.  It is a pre-Haswell machine.

> If yes, it should be already covered by
> the patch I queued yesterday, so today's tree should work fine.
> So, let me know if this is still seen with the upcoming tree.

Sure.

Best Regards,
Huang, Ying

--===============8093949906009435955==--

