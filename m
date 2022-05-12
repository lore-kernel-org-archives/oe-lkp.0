Content-Type: multipart/mixed; boundary="===============3397865548315708193=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Thu, 12 May 2022 11:49:53 -0700
Message-ID: <CAHk-=wiyjnKiCZyou+fHYi7tNh1FC-BYy_kubusd+jrkDRsExA@mail.gmail.com>
In-Reply-To: <20220512110634.712057e4663ecc5f697bf185@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3397865548315708193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 11:06 AM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Thu, 12 May 2022 10:42:09 -0700 Linus Torvalds <torvalds@linux-found=
ation.org> wrote:
> >
> > In a perfect world, somebody would fix the locking to just not have as
> > much contention. But assuming that isn't an option, maybe somebody
> > should just look at that 'struct zone' layout a bit more.
>
> (hopefully adds linux-mm to cc)

So I suspect the people who do re-layout would have to be the intel
people who actually see the regression.

Because the exact rules are quite complicated, and currently the
comments about the layout don't really help much.

For example, the "Read-mostly fields" comment doesn't necessarily mean
that the fields in question should be kept away from the lock.

Even if they are mostly read-only, if they are only read *under* the
lock (because the lock still is what serializes them), then putting
them in the same cacheline as the lock certainly won't hurt.

And the same is actually true of things that are actively written to:
if they are written to under the lock, being in the same cacheline as
the lock can be a *good* thing, since then you have only one dirty
cacheline.

It only becomes a problem when (a) the lock is contended (so you get
the bouncing from other lockers trying to get it) _and_ (b) the
writing is fairly intense (so you get active bouncing back-and-forth,
not just one or two bounces).

And so to actually do any real analysis, you probably have to have
multiple sockets, because without numbers to guide you to exactly
_which_ writes are problematic, you're bound to get the heuristic
wrong.

And to make the issue even murkier, this whole thread is mixing up two
different regressions that may not have all that much in common (ie
the subject line is about one thing, but then we have that whole
page_fault1 process mode results, and it's not clear that they have
anything really to do with each other - just different examples of
cache sensitivity).

                   Linus
--===============3397865548315708193==--

