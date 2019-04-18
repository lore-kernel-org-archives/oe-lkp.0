Content-Type: multipart/mixed; boundary="===============3694528678734539680=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: lkp@lists.01.org
Subject: Re: [ALSA] feb689025f: WARNING:possible_recursive_locking_detected
Date: Thu, 18 Apr 2019 07:16:27 +0200
Message-ID: <s5ha7gnriz8.wl-tiwai@suse.de>
In-Reply-To: <20190418002257.r26cy2z6iku7pris@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3694528678734539680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Apr 2019 02:22:57 +0200,
kernel test robot wrote:
> =

> =

> FYI, we noticed the following commit (built with gcc-5):
> =

> commit: feb689025fbb6f0aa6297d3ddf97de945ea4ad32 ("ALSA: seq: Protect in-=
kernel ioctl calls with mutex")
> https://git.kernel.org/cgit/linux/kernel/git/tiwai/sound.git for-next

FYI, the patch was already reverted in the later commit and fixed
differently.  Sorry for the inconvenience.


Takashi

--===============3694528678734539680==--

