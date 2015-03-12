Content-Type: multipart/mixed; boundary="===============3146192957260522033=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: lkp@lists.01.org
Subject: Re: [ALSA] f2c5784f827: snd_hda_codec_hdmi hdaudioC1D0: Unable to sync register 0x4f0009. -5
Date: Thu, 12 Mar 2015 07:29:32 +0100
Message-ID: <s5hmw3in2yb.wl-tiwai@suse.de>
In-Reply-To: <20150312040104.GB12618@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3146192957260522033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

At Thu, 12 Mar 2015 12:01:04 +0800,
Fengguang Wu wrote:
> =

> Hi Takashi,
> =

> We noticed the below dmesg errors on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/hda-r=
egmap
> commit f2c5784f82792221990f708dff42a71a4a51b721 ("ALSA: hda - Use regmap =
for amp accesses")
> =

> <6>[   17.709789] snd_hda_intel 0000:02:00.1: Disabling MSI
> <6>[   17.710115] snd_hda_intel 0000:02:00.1: Handle VGA-switcheroo audio=
 client
> <6>[   17.748128] snd_hda_codec_realtek hdaudioC0D2: autoconfig for ALC89=
8: line_outs=3D3 (0x14/0x15/0x16/0x0/0x0) type:line
> <6>[   17.748729] snd_hda_codec_realtek hdaudioC0D2:    speaker_outs=3D0 =
(0x0/0x0/0x0/0x0/0x0)
> <6>[   17.749253] snd_hda_codec_realtek hdaudioC0D2:    hp_outs=3D1 (0x1b=
/0x0/0x0/0x0/0x0)
> <6>[   17.749735] snd_hda_codec_realtek hdaudioC0D2:    mono: mono_out=3D=
0x0
> <6>[   17.750102] snd_hda_codec_realtek hdaudioC0D2:    dig-out=3D0x1e/0x0
> <6>[   17.750456] snd_hda_codec_realtek hdaudioC0D2:    inputs:
> <6>[   17.750788] snd_hda_codec_realtek hdaudioC0D2:      Front Mic=3D0x19
> <6>[   17.751140] snd_hda_codec_realtek hdaudioC0D2:      Rear Mic=3D0x18
> <6>[   17.751494] snd_hda_codec_realtek hdaudioC0D2:      Line=3D0x1a
> <6>[   17.765185] input: HDA Intel PCH Front Mic as /devices/pci0000:00/0=
000:00:1b.0/sound/card0/input2
> <6>[   17.765787] input: HDA Intel PCH Rear Mic as /devices/pci0000:00/00=
00:00:1b.0/sound/card0/input3
> <6>[   17.765845] input: HDA Intel PCH Line as /devices/pci0000:00/0000:0=
0:1b.0/sound/card0/input4
> <6>[   17.765895] input: HDA Intel PCH Line Out Front as /devices/pci0000=
:00/0000:00:1b.0/sound/card0/input5
> <6>[   17.765958] input: HDA Intel PCH Line Out Surround as /devices/pci0=
000:00/0000:00:1b.0/sound/card0/input6
> <6>[   17.765999] input: HDA Intel PCH Line Out CLFE as /devices/pci0000:=
00/0000:00:1b.0/sound/card0/input7
> <6>[   17.766041] input: HDA Intel PCH Front Headphone as /devices/pci000=
0:00/0000:00:1b.0/sound/card0/input8
> <6>[   17.896645] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:0=
0/0000:00:02.0/0000:02:00.1/sound/card1/input9
> <6>[   17.897272] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:0=
0/0000:00:02.0/0000:02:00.1/sound/card1/input10
> <6>[   17.897914] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:0=
0/0000:00:02.0/0000:02:00.1/sound/card1/input11
> <6>[   17.898581] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:0=
0/0000:00:02.0/0000:02:00.1/sound/card1/input12
> <3>[   17.919298] snd_hda_codec_hdmi hdaudioC1D0: Unable to sync register=
 0x4f0009. -5
> <3>[   17.929749] snd_hda_codec_realtek hdaudioC0D2: Unable to sync regis=
ter 0x2f000a. -5
> <3>[   17.930271] snd_hda_codec_realtek hdaudioC0D2: Unable to sync regis=
ter 0x2f000a. -5

This is a known bug of regmap, and the fix was already submitted to
Mark, found on linux-next:
    commit 4ceba98d3fe204c59e5f63c4d834b45dcfe789f0
        regmap: Skip read-only registers in regcache_sync()

Once when it's merged to Linus tree, I'll either rebase my branch or
merge the fix.


thanks,

Takashi

--===============3146192957260522033==--

