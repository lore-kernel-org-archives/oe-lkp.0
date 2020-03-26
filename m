Content-Type: multipart/mixed; boundary="===============9151158958360735435=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] fd4d9c7d0c: stress-ng.switch.ops_per_sec -30.5% regression
Date: Thu, 26 Mar 2020 09:57:45 -0700
Message-ID: <CAHk-=wi2c3UcK4fjUR2nM-7iUOAyQijq9ETfQHaN0WwFh2Bm9A@mail.gmail.com>
In-Reply-To: <20200326055723.GL11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============9151158958360735435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 10:57 PM kernel test robot
<rong.a.chen@intel.com> wrote:
>
> FYI, we noticed a -30.5% regression of stress-ng.switch.ops_per_sec due t=
o commit:
>
> commit: fd4d9c7d0c71866ec0c2825189ebd2ce35bd95b8 ("mm: slub: add missing =
TID bump in kmem_cache_alloc_bulk()")

This looks odd.

I would not expect the update of c->tid to have that noticeable an
impact, even on a big machine that might be close to some scaling
limit.

It doesn't add any expensive atomic ops, and while it _could_ make a
percpu cacheline dirty, I think that cacheline should already be dirty
anyway under any load where this is noticeable. Plus this should be a
relatively cold path anyway.

So mind humoring me, and double-check that regression?

Of course, it might be another "just magic cache placement" detail
where code moved enough to make a difference.

Or maybe it really ends up causing new tid mismatches and we end up
failing the fast path in slub as a result. But looking at the stats
that changed in your message doesn't make me go "yeah, that looks like
a slub difference".

So before we look more at this, I'd like to make sure that the
regression is actually real, and not noise.

Please?

             Linus
--===============9151158958360735435==--

