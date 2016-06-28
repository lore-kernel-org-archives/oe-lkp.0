Content-Type: multipart/mixed; boundary="===============4758734268666501879=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Tue, 28 Jun 2016 14:35:15 -0700
Message-ID: <CA+55aFx1Df57M+vZL=_RTOtUYB7SK-A7Wt29mj0S=YTK6H+bSQ@mail.gmail.com>
In-Reply-To: <CALCETrU90SiCttWhghVfwjp_kii=eB1UuKLQ0_M76JxDjpQNzA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4758734268666501879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 2:21 PM, Andy Lutomirski <luto@amacapital.net> wr=
ote:
>
>  Or are you
> suggesting that we actually make a list somewhere of stacks that are
> nominally unused but are still around for RCU's benefit and then
> scavenge from that lest when we need a new stack?

Yes. We'd have to make our own list (rather than just use the RCU list
itself where everything goes), but..

> If so, that seems considerably more complicated than just adding a refere=
nce count.

Fair enough.

             Linus

--===============4758734268666501879==--

