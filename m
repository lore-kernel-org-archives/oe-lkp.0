Content-Type: multipart/mixed; boundary="===============1284191046016688326=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: d7be102f29 ("cfg80211: initialize regulatory keys/database later"): kernel BUG at crypto/asymmetric_keys/public_key.c:80!
Date: Mon, 27 Nov 2017 23:25:50 +0000
Message-ID: <23794.1511825150@warthog.procyon.org.uk>
In-Reply-To: <CA+55aFzviYrQa8Tn-R96nAL8YRv9t-wQfqOWNW05g6_WCWfgAA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1284191046016688326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> I'm not seeing why it would ever be ok to do BUG_ON() instead of just
> returning an error, though.

This function has a list of requisite parameters for the caller:

	BUG_ON(!pkey);		<-- You need the public key to use,
	BUG_ON(!sig);
	BUG_ON(!sig->digest);	<-- the message digest to check
	BUG_ON(!sig->s);	<-- and you need the signature.

If you fail to obtain any one of these parameters, you can't use this funct=
ion
and you should have errored out before calling this function.  It seems
reasonable for the function to assume that you've provided them - they're k=
ind
of essential to the operation.  If you want, I can just remove the checks
entirely.  Many of the kernel's functions don't perform argument checking, =
but
just assume you've done it right and will oops if you haven't.

I could just return -EINVAL, yes, but I'm not sure that's really the right
thing to do,@least not without printing an error message, since it's a
kernel programming error not a userspace error or data error.

David

--===============1284191046016688326==--

