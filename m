Content-Type: multipart/mixed; boundary="===============3220657103307455214=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 14:12:35 -0800
Message-ID: <alpine.DEB.2.21.1812051411210.9633@chino.kir.corp.google.com>
In-Reply-To: <CAHk-=whi8Ju-cTDL4cYtwuLA7BYgGJYyy6HVMoknZaLHnRc83g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3220657103307455214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Linus Torvalds wrote:

> > So ultimately we decided that the saner behavior that gives the least
> > risk of regression for the short term, until we can do something
> > better, was the one that is already applied upstream.
> =

> You're ignoring the fact that people *did* report things regressed.
> =

> That's the part I find unacceptable. You're saying "we picked
> something that minimized regressions".
> =

> No it didn't. The regression is present and real, and is on a real
> load, not a benchmark.
> =

> So that argument is clearly bogus.
> =

> I'm going to revert the commit since people apparently seem to be
> ignoring this fundamental issue.
> =

> Real workloads regressed.  The regressions got reported. Ignoring that
> isn't acceptable.
> =


Please allow me to prepare my v2 because it's not a clean revert due to =

the follow-up 89c83fb539f9 ("mm, thp: consolidate THP gfp handling into =

alloc_hugepage_direct_gfpmask") and will incorporate the feedback from =

Michal to not change anything outside of the thp fault path.

--===============3220657103307455214==--

