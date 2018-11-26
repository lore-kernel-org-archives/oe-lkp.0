Content-Type: multipart/mixed; boundary="===============2587676023390422074=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: lkp@lists.01.org
Subject: Re: [ALSA] 3a6d1980fe: kernel_BUG_at_mm/page_alloc.c
Date: Mon, 26 Nov 2018 09:17:32 +0100
Message-ID: <s5hr2f86yn7.wl-tiwai@suse.de>
In-Reply-To: <20181126002805.GI18977@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2587676023390422074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Nov 2018 01:28:05 +0100,
kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 3a6d1980fe96dbbfe3ae58db0048867f5319cdbf ("ALSA: Replace snd_mall=
oc_pages() and snd_free_pages() with standard helpers")
> https://git.kernel.org/cgit/linux/kernel/git/tiwai/sound.git for-next
....
> [  174.830284] kernel BUG at mm/page_alloc.c:2850!

OK, this seem to be an issue about using __GFP_COMP and
alloc_pages_exact().  I didn't hit this while testing locally maybe
just because I used the buffer size in power-of-two casually.

I dropped the patch until we sort this out.


thanks,

Takashi

--===============2587676023390422074==--

