Content-Type: multipart/mixed; boundary="===============7159251595155453946=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [clear_page] 0ad07c8104 BUG: unable to handle kernel NULL pointer dereference at 0000000000000040
Date: Mon, 20 Feb 2017 10:35:51 +0100
Message-ID: <20170220093551.crucsscnh5zvd2si@pd.tnic>
In-Reply-To: <20170220030352.fksjiy6ktuxwtvdg@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7159251595155453946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 11:03:52AM +0800, Fengguang Wu wrote:
> We actually already test LKML patch in that way (Xiaolong maintains
> this feature). Nevertheless if developers specify "base-commit:" it
> could help eliminate the guessing works by the dumb robot. We'll
> appreciate if the "base-commit:" or "base-patchid:" tags are listed
> in the patches, especially in some non-obvious situations.

Can I specify multiple base commits for testing stable backports?

For example

base-commit: v4.9.11, v4.4.50, v3.10.105,...

> Such tags could be regarded as "explicit" test requests, where we could
> send "BUILD COMPLETE" emails as a response (comparing to our normal
> LKML patch tests, which only build regressions will trigger an email
> notification).

Yap, similar to those you guys sent when a new branch on k.org has been
tested.

Btw, can we make the format layout this way:

patch

---

<0day bot tags>

---

so that when we send it to lkml, it doesn't interfere with review by
slapping the tags at the beginning of the patch?

Also, should we CC some special mailing list which the 0day bot parses
or lkml is enough?

Cool stuff.

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============7159251595155453946==--

