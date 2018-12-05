Content-Type: multipart/mixed; boundary="===============2258759060413858957=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 14:03:10 -0800
Message-ID: <CAHk-=whi8Ju-cTDL4cYtwuLA7BYgGJYyy6HVMoknZaLHnRc83g@mail.gmail.com>
In-Reply-To: <20181205204034.GB11899@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2258759060413858957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 5, 2018 at 12:40 PM Andrea Arcangeli <aarcange@redhat.com> wr=
ote:
>
> So ultimately we decided that the saner behavior that gives the least
> risk of regression for the short term, until we can do something
> better, was the one that is already applied upstream.

You're ignoring the fact that people *did* report things regressed.

That's the part I find unacceptable. You're saying "we picked
something that minimized regressions".

No it didn't. The regression is present and real, and is on a real
load, not a benchmark.

So that argument is clearly bogus.

I'm going to revert the commit since people apparently seem to be
ignoring this fundamental issue.

Real workloads regressed.  The regressions got reported. Ignoring that
isn't acceptable.

                    Linus

--===============2258759060413858957==--

