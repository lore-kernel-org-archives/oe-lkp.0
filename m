Content-Type: multipart/mixed; boundary="===============4928518501358530361=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 04 Oct 2017 09:15:55 -0500
Message-ID: <20171004141555.pu7ibzydvpc52ys3@treble>
In-Reply-To: <20171004092052.ioixdexrsbbwvetr@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4928518501358530361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2017 at 11:20:52AM +0200, Peter Zijlstra wrote:
> On Tue, Oct 03, 2017 at 07:18:24PM +0200, Ingo Molnar wrote:
> > Yes, I'll do that tomorrow. I was always a bit unhappy about cross-rele=
ase,
> > because it breaks the 'owner task owns the lock' model.
> =

> Still, you can get real deadlocks with completions...
> =

> > Plus I don't think we found that many real bugs with it
> =

> Every bug found is one less bug. It did find a few.

It also found a bunch of unwinder bugs ;-)

-- =

Josh

--===============4928518501358530361==--

