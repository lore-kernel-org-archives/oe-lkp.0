Content-Type: multipart/mixed; boundary="===============8116344480199718191=="
MIME-Version: 1.0
From: Johannes Berg <johannes@sipsolutions.net>
To: lkp@lists.01.org
Subject: Re: d7be102f29 ("cfg80211: initialize regulatory keys/database later"): kernel BUG at crypto/asymmetric_keys/public_key.c:80!
Date: Mon, 27 Nov 2017 22:52:21 +0100
Message-ID: <1511819541.5456.19.camel@sipsolutions.net>
In-Reply-To: <CA+55aFzviYrQa8Tn-R96nAL8YRv9t-wQfqOWNW05g6_WCWfgAA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8116344480199718191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-11-27 at 21:46 +0000, Linus Torvalds wrote:
> On Sat, Nov 25, 2017 at 7:07 PM, Fengguang Wu <fengguang.wu@intel.com> =
wrote:
> > FYI, we noticed the following commit (built with gcc-4.8):
> > =

> > commit: d7be102f2945a626f55e0501e52bb31ba3e77b81 ("cfg80211: initialize=
 regulatory keys/database later")
> =

> The attached 'dmesg.xz' doesn't actually match the kernel or the
> report. Very odd.
> =

> > [    8.602885] kernel BUG at crypto/asymmetric_keys/public_key.c:80!
> =

> In that reported kernel, that is
> =

>     80          BUG_ON(!sig->digest);
> =

> so the public key signature has no digest.

Yeah. I believe this was fixed by commit 01a95b2141e3 ("cfg80211:
select CRYPTO_SHA256 if needed"), and since that was already on the way
I didn't reply to this report specifically.

> I'm not seeing why it would ever be ok to do BUG_ON() instead of just
> returning an error, though.

That's kinda a good question - here we might fail to load this
certificate, print a key, and then never be able to load the signed
file - but at least we wouldn't crash immediately :-)

johannes

--===============8116344480199718191==--

