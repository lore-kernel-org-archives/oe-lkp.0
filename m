Content-Type: multipart/mixed; boundary="===============8774988502762776692=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Thu, 19 Mar 2020 16:10:12 -0400
Message-ID: <815c83462125f350b61163f682fb674e515e954e.camel@kernel.org>
In-Reply-To: <CAHk-=whAWFw5vZB-krqUteHuAYCYypKG6683WEydOynBizpixQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8774988502762776692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-19 at 12:35 -0700, Linus Torvalds wrote:
> On Thu, Mar 19, 2020 at 12:24 PM Jeff Layton <jlayton@kernel.org> wrote:
> > > If you have other things, send me a pull request, otherwise just let
> > > me know and I'll apply the patch directly.
> > =

> > That's it for now.
> =

> Lol. You confused me with your question of whether I wanted a pull
> request or not.
> =

> I had already applied the patch as dcf23ac3e846 ("locks: reinstate
> locks_delete_block optimization") yesterday ;)
> =


Sorry about that! I did a pull this morning and didn't see it, you must
have pushed afterward. Thanks again for picking it up.

-- =

Jeff Layton <jlayton@kernel.org>

--===============8774988502762776692==--

