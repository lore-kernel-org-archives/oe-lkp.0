Content-Type: multipart/mixed; boundary="===============6189710979882280659=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: lkp@lists.01.org
Subject: Re: [ALSA] 3103d80b8a8: kernel BUG at drivers/base/driver.c:152!
Date: Tue, 17 Mar 2015 17:29:22 +0100
Message-ID: <s5hd247h9jx.wl-tiwai@suse.de>
In-Reply-To: <1426561859.1126.12.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6189710979882280659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

At Tue, 17 Mar 2015 11:10:59 +0800,
Huang Ying wrote:
> =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/hda-r=
egmap
> commit 3103d80b8a89f1797e87d7265f9b389a0db4ccd8 ("ALSA: hda - Make snd_hd=
a_bus_type public")

Thanks for reporting.  This has been already fixed in the later patch
in the branch,

commit f7512194342491f6d5c71d9dd14793786192b725
    ALSA: hda - Fix panic at booting with built-in HDA driver


Takashi

--===============6189710979882280659==--

