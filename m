Content-Type: multipart/mixed; boundary="===============9028958451562811119=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [iov_iter] 9bd0e337c6: will-it-scale.per_process_ops -4.8% regression
Date: Fri, 04 Dec 2020 11:50:36 +0000
Message-ID: <98237.1607082636@warthog.procyon.org.uk>
In-Reply-To: <CAHk-=wif1iGLiqcsx1YdLS4tN01JuH-MV_oem0duHqskhDTY9A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9028958451562811119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > FYI, we noticed a -4.8% regression of will-it-scale.per_process_ops due=
 to commit:
> =

> Ok, I guess that's bigger than expected, =


Note that it appears to be testing just the first patch and not the whole
series:

| commit: 9bd0e337c633aed3e8ec3c7397b7ae0b8436f163 ("[PATCH 01/29] iov_iter=
: Switch to using a table of operations")

that just adds an indirection table without taking away any of the conditio=
nal
branching.  It seems quite likely, though, that even if you add all the oth=
er
patches, you won't get back enough to make it worth it.

David

--===============9028958451562811119==--

