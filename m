Content-Type: multipart/mixed; boundary="===============1173187338701620294=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [ALSA] f2c5784f827: snd_hda_codec_hdmi hdaudioC1D0: Unable to sync register 0x4f0009. -5
Date: Thu, 12 Mar 2015 12:01:04 +0800
Message-ID: <20150312040104.GB12618@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1173187338701620294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

We noticed the below dmesg errors on

git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/hda-reg=
map
commit f2c5784f82792221990f708dff42a71a4a51b721 ("ALSA: hda - Use regmap fo=
r amp accesses")

<6>[   17.709789] snd_hda_intel 0000:02:00.1: Disabling MSI
<6>[   17.710115] snd_hda_intel 0000:02:00.1: Handle VGA-switcheroo audio c=
lient
<6>[   17.748128] snd_hda_codec_realtek hdaudioC0D2: autoconfig for ALC898:=
 line_outs=3D3 (0x14/0x15/0x16/0x0/0x0) type:line
<6>[   17.748729] snd_hda_codec_realtek hdaudioC0D2:    speaker_outs=3D0 (0=
x0/0x0/0x0/0x0/0x0)
<6>[   17.749253] snd_hda_codec_realtek hdaudioC0D2:    hp_outs=3D1 (0x1b/0=
x0/0x0/0x0/0x0)
<6>[   17.749735] snd_hda_codec_realtek hdaudioC0D2:    mono: mono_out=3D0x0
<6>[   17.750102] snd_hda_codec_realtek hdaudioC0D2:    dig-out=3D0x1e/0x0
<6>[   17.750456] snd_hda_codec_realtek hdaudioC0D2:    inputs:
<6>[   17.750788] snd_hda_codec_realtek hdaudioC0D2:      Front Mic=3D0x19
<6>[   17.751140] snd_hda_codec_realtek hdaudioC0D2:      Rear Mic=3D0x18
<6>[   17.751494] snd_hda_codec_realtek hdaudioC0D2:      Line=3D0x1a
<6>[   17.765185] input: HDA Intel PCH Front Mic as /devices/pci0000:00/000=
0:00:1b.0/sound/card0/input2
<6>[   17.765787] input: HDA Intel PCH Rear Mic as /devices/pci0000:00/0000=
:00:1b.0/sound/card0/input3
<6>[   17.765845] input: HDA Intel PCH Line as /devices/pci0000:00/0000:00:=
1b.0/sound/card0/input4
<6>[   17.765895] input: HDA Intel PCH Line Out Front as /devices/pci0000:0=
0/0000:00:1b.0/sound/card0/input5
<6>[   17.765958] input: HDA Intel PCH Line Out Surround as /devices/pci000=
0:00/0000:00:1b.0/sound/card0/input6
<6>[   17.765999] input: HDA Intel PCH Line Out CLFE as /devices/pci0000:00=
/0000:00:1b.0/sound/card0/input7
<6>[   17.766041] input: HDA Intel PCH Front Headphone as /devices/pci0000:=
00/0000:00:1b.0/sound/card0/input8
<6>[   17.896645] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/=
0000:00:02.0/0000:02:00.1/sound/card1/input9
<6>[   17.897272] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/=
0000:00:02.0/0000:02:00.1/sound/card1/input10
<6>[   17.897914] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/=
0000:00:02.0/0000:02:00.1/sound/card1/input11
<6>[   17.898581] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/=
0000:00:02.0/0000:02:00.1/sound/card1/input12
<3>[   17.919298] snd_hda_codec_hdmi hdaudioC1D0: Unable to sync register 0=
x4f0009. -5
<3>[   17.929749] snd_hda_codec_realtek hdaudioC0D2: Unable to sync registe=
r 0x2f000a. -5
<3>[   17.930271] snd_hda_codec_realtek hdaudioC0D2: Unable to sync registe=
r 0x2f000a. -5

It's almost 100% reproducible:

testbox/testcase/testparams: lituya/will-it-scale/performance-writeseek3

74b67c48b10486f1  f2c5784f82792221990f708dff  =

----------------  --------------------------  =

       fail:runs  %reproduction    fail:runs
           |             |             |    =

           :10         100%          10:10    kmsg.snd_hda_codec_hdmi_hdaud=
ioC1D0:Unable_to_sync_register
           :10         100%          10:10    kmsg.snd_hda_codec_realtek_hd=
audioC0D2:Unable_to_sync_register

testbox/testcase/testparams: avoton3/netperf/performance-300s-200%-TCP_RR

74b67c48b10486f1  f2c5784f82792221990f708dff  =

----------------  --------------------------  =

           :20          95%          19:20    kmsg.snd_hda_codec_hdmi_hdaud=
ioC0D0:Unable_to_sync_register

Thanks,
Fengguang Wu

--===============1173187338701620294==--

