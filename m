Content-Type: multipart/mixed; boundary="===============3974781378138860054=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: inet: frags: Turn fqdir->dead into an int for old Alphas
Date: Fri, 07 Jun 2019 09:19:42 -0700
Message-ID: <CAHk-=wgtY1hNQX9TM=4ono-UJ-hsoFA0OT36ixFWBG2eeO011w@mail.gmail.com>
In-Reply-To: <da5eedfe-92f9-6c50-b9e7-68886047dd25@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3974781378138860054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2019 at 8:26 AM Eric Dumazet <eric.dumazet@gmail.com> wrot=
e:
>
> There is common knowledge among us programmers that bit fields
> (or bool) sharing a common 'word' need to be protected
> with a common lock.
>
> Converting all bit fields to plain int/long would be quite a waste of mem=
ory.

Yeah, and we really don't care about alpha. So 'char' should be safe.

No compiler actually turns a 'bool' in a struct into a bitfield,
afaik, because you're still supposed to be able to take the address of
a boolean.

But on the whole, I do not believe that we should ever use 'bool' in
structures anyway, because it's such a badly defined type. I think
it's 'char' in practice on just about all architectures, but there
really were traditional use cases where 'bool' was int.

But:

 - we shouldn't turn them into 'int' anyway - alpha is dead, and no
sane architecture will make the same mistake anyway. People learnt.

 - we might want to make sure 'bool' really is 'char' in practice, to
double-check that fthe compiler doesn't do anything stupid.

 - bitfields obviously do need locks. 'char' does not.

If there's somebody who really notices the alpha issue in PRACTICE, we
can then bother to fix it. But there is approximately one user, and
it's not a heavy-duty one.

                   Linus

--===============3974781378138860054==--

