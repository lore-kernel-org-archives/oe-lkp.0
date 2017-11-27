Content-Type: multipart/mixed; boundary="===============2268569665150719950=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d7be102f29 ("cfg80211: initialize regulatory keys/database later"): kernel BUG at crypto/asymmetric_keys/public_key.c:80!
Date: Mon, 27 Nov 2017 13:46:15 -0800
Message-ID: <CA+55aFzviYrQa8Tn-R96nAL8YRv9t-wQfqOWNW05g6_WCWfgAA@mail.gmail.com>
In-Reply-To: <20171126030718.x4yu4s7ozzegu5cy@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2268569665150719950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2017 at 7:07 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> FYI, we noticed the following commit (built with gcc-4.8):
>
> commit: d7be102f2945a626f55e0501e52bb31ba3e77b81 ("cfg80211: initialize r=
egulatory keys/database later")

The attached 'dmesg.xz' doesn't actually match the kernel or the
report. Very odd.

> [    8.602885] kernel BUG at crypto/asymmetric_keys/public_key.c:80!

In that reported kernel, that is

    80          BUG_ON(!sig->digest);

so the public key signature has no digest.

> [    8.607873] Call Trace:
> [    8.607873]  x509_check_for_self_signed+0xbe/0xf0
> [    8.607873]  x509_cert_parse+0x130/0x190
> [    8.607873]  x509_key_preparse+0x23/0x1a0
> [    8.607873]  asymmetric_key_preparse+0x4a/0x80
> [    8.607873]  key_create_or_update+0x122/0x430
> [    8.607873]  regulatory_init_db+0xfe/0x1c2
> [    8.607873]  do_one_initcall+0x4c/0x1a0
> [    8.607873]  kernel_init_freeable+0x111/0x195
> [    8.607873]  kernel_init+0xa/0xf0
> [    8.607873]  ret_from_fork+0x24/0x30
> [    8.607873] Code: c1 48 8b 7d 20 4c 89 f6 e8 97 e0 35 00 85 c0 b8 7f f=
f ff ff 44 0f 45 e8 eb c1 b8 ea ff ff ff e9 7d fe ff ff e8 7b 69 e5 ff 0f 0=
b <0f> 0b 0f 0b 0f 0b 41 bd f4 ff ff ff e9 57 fe ff ff 0f 1f 84 00
> [    8.607873] RIP: public_key_verify_signature+0x267/0x280 RSP: ffffc900=
0000bbd8

I'm not seeing why it would ever be ok to do BUG_ON() instead of just
returning an error, though.

DavidH?

                 Linus

--===============2268569665150719950==--

