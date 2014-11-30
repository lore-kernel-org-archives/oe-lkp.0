Content-Type: multipart/mixed; boundary="===============1038315115049995990=="
MIME-Version: 1.0
From: Takashi Iwai <tiwai@suse.de>
To: lkp@lists.01.org
Subject: Re: [alsa/virmidi] BUG: unable to handle kernel NULL pointer dereference at 000002a0
Date: Sun, 30 Nov 2014 20:19:02 +0100
Message-ID: <s5h7fyca449.wl-tiwai@suse.de>
In-Reply-To: <20141130185019.GA12359@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1038315115049995990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

At Sun, 30 Nov 2014 10:50:19 -0800,
Fengguang Wu wrote:
At Sun, 30 Nov 2014 10:50:19 -0800,
Fengguang Wu wrote:
> =

> Hi Kyle,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
> =

> commit 316638a5030a04bb3259dcbca0632281001a4b24
> Author:     Kyle Chamberlin <kylechamberlin@project20million.org>
> AuthorDate: Fri Nov 28 13:59:56 2014 -0500
> Commit:     Takashi Iwai <tiwai@suse.de>
> CommitDate: Sat Nov 29 21:34:47 2014 +0100
> =

>     ALSA: virmidi: fixed code style issues
>     =

>     Fixed some minor code style issues and also removed some
>     assignments inside of if conditionals.
>     =

>     Signed-off-by: Kyle Chamberlin <kylechamberlin@project20million.org>
>     Signed-off-by: Takashi Iwai <tiwai@suse.de>
> =

> In particular, this chunk introduced the behavior change:
> =

> -       if ((err =3D snd_card_register(card)) =3D=3D 0) {
> +       err =3D snd_card_register(card);
> +       if (err) {

Doh, it's an obvious error.  Sorry for overlooking it at review.

Fixed now in sound git tree as below.


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: virmidi: Fix wrong error check

While rewriting the code in the previous commit [316638a5030a: ALSA:
virmidi: fixed code style issues], the error check was wrongly
converted.  This resulted an Oops.

Fixes: 316638a5030a ('ALSA: virmidi: fixed code style issues')
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/virmidi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/virmidi.c b/sound/drivers/virmidi.c
index 0af88d926793..d28d8706443c 100644
--- a/sound/drivers/virmidi.c
+++ b/sound/drivers/virmidi.c
@@ -121,7 +121,7 @@ static int snd_virmidi_probe(struct platform_device *de=
vptr)
 	sprintf(card->longname, "Virtual MIDI Card %i", dev + 1);
 =

 	err =3D snd_card_register(card);
-	if (err) {
+	if (!err) {
 		platform_set_drvdata(devptr, card);
 		return 0;
 	}
-- =

2.1.3


--===============1038315115049995990==--

