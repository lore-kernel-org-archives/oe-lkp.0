Content-Type: multipart/mixed; boundary="===============7391248453660502608=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Tue, 10 Mar 2020 14:47:34 -0700
Message-ID: <CAHk-=wg8N4fDRC3M21QJokoU+TQrdnv7HqoaFW-Z-ZT8z_Bi7Q@mail.gmail.com>
In-Reply-To: <875zfbvrbm.fsf@notabene.neil.brown.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============7391248453660502608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 2:22 PM NeilBrown <neilb@suse.de> wrote:
>
> A compiler barrier() is probably justified.  Memory barriers delay reads
> and expedite writes so they cannot be needed.

That's not at all guaranteed. Weakly ordered memory things can
actually have odd orderings, and not just "writes delayed, reads done
early". Reads may be delayed too by cache misses, and memory barriers
can thus expedite reads as well (by forcing the missing read to happen
before later non-missing ones).

So don't assume that a memory barrier would only delay reads and
expedite writes. Quite the reverse: assume that there is no ordering
at all unless you impose one with a memory barrier (*).

             Linus

(*) it's a bit more complex than that, in that we do assume that
control dependencies end up gating writes, for example, but those
kinds of implicit ordering things should *not* be what you depend on
in the code unless you're doing some seriously subtle memory ordering
work and comment on it extensively.
--===============7391248453660502608==--

