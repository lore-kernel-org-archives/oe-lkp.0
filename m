Content-Type: multipart/mixed; boundary="===============1533614546840782322=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [pipe] d60337eff1: phoronix-test-suite.noise-level.0.activity_level 144.0% improvement
Date: Thu, 07 Nov 2019 17:42:18 +0000
Message-ID: <25252.1573148538@warthog.procyon.org.uk>
In-Reply-To: <CAHk-=wiJ+jaT5Ev-wCg7iGNNO_JFUyMDcat0KDdA2b_+n_cZCQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1533614546840782322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > FYI, we noticed a 144.0% improvement of phoronix-test-suite.noise-level=
.0.activity_level due to commit:
> >
> > commit: d60337eff18a3c587832ab8053a567f1da9710d2 ("[RFC PATCH 04/11] pi=
pe: Use head and tail pointers for the ring, not cursor and length [ver #3]=
")
> =

> That sounds nice, but is odd. That commit really shouldn't change
> anything noticeable. David, any idea?

Yeah, it does sound odd - the only thing that springs particularly to mind =
is
that maybe it's an effect of one of the preceding patches that affects the
waitqueue stuff.

TBH, I'm not sure what the Phoronix test suite is actually testing from the
report.  "noise-level-1.1.0" seems more a reporting script than an actual
test.

David

--===============1533614546840782322==--

