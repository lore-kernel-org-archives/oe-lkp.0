Content-Type: multipart/mixed; boundary="===============2306629711831436885=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ppdev] e7223f1860: kernel BUG at drivers/base/driver.c:153!
Date: Fri, 25 Mar 2016 09:12:26 -0700
Message-ID: <CA+55aFwBajpyGXHbRA79xfDJ449nX+38M6gwxwEw-A2ES4MHYQ@mail.gmail.com>
In-Reply-To: <20160324144134.GH5522@pathway.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2306629711831436885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2016 at 7:41 AM, Petr Mladek <pmladek@suse.com> wrote:
>
> Could we please get the fix into the mainline?

I've reverted the offending original commit for now. The fix I see
seems questionable - just ignoring the parport registration will get
rid of the oops, but drivers shouldn't be testing that "p" value
anyway, and it also fundamentally seems to just drop the parport
registration on the floor, so it doesn't seem like a real fix anyway.

So reverting the whole mess seems like the right thing. It's triply
the right thing when it's over a month since the original report, and
this shit made it into my kernel anyway.

Not acceptable.

             Linus

--===============2306629711831436885==--

