Content-Type: multipart/mixed; boundary="===============4729858782142560546=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 26 Sep 2013 00:33:15 -0700
Message-ID: <20130926003315.2e81bc84.akpm@linux-foundation.org>
In-Reply-To: <5238F252.5070905@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4729858782142560546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Sep 2013 20:22:42 -0400 Peter Hurley <peter@hurleysoftware.com=
> wrote:

> Looking over vmalloc.c, the critical section footprint of the vmap_area_l=
ock
> could definitely be reduced (even nearly eliminated), but that's a projec=
t for
> another day :)

20bafb3d23d10 ("n_tty: Move buffers into n_tty_data") switched a
kmalloc (which is very fast) to a vmalloc (which is very slow) without
so much as mentioning it in the changelog.  This should have been
picked up at review, btw.

Revert that part of the patch and the problem will be solved.

If we are really really worried that a ~9k kmalloc might fail or will
be slow, then implement a fallback to vmalloc() if kmalloc(GFP_NOWARN)
failed.  This kinda sucks, but is practical, but really should only be
done if necessary - ie, if problems with using plain old kmalloc are
demonstrable.

Or just revert all of 20bafb3d23d10 - it was supposed to be a small
performance improvement but turned out to be a significant performance
loss.  Therefore zap.


--===============4729858782142560546==--

