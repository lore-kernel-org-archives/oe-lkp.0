Content-Type: multipart/mixed; boundary="===============1710426707369500034=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 19:27:52 -0700
Message-ID: <CA+55aFxx5sU=y1ec4NjTqH61qwKVWd4oRu1tMZovQRKENBBsmA@mail.gmail.com>
In-Reply-To: <20160812005442.GN19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============1710426707369500034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 5:54 PM, Dave Chinner <david@fromorbit.com> wrote:
>
> So, removing mark_page_accessed() made the spinlock contention
> *worse*.
>
>   36.51%  [kernel]  [k] _raw_spin_unlock_irqrestore
>    6.27%  [kernel]  [k] copy_user_generic_string
>    3.73%  [kernel]  [k] _raw_spin_unlock_irq
>    3.55%  [kernel]  [k] get_page_from_freelist
>    1.97%  [kernel]  [k] do_raw_spin_lock
>    1.72%  [kernel]  [k] __block_commit_write.isra.30

I don't recall having ever seen the mapping tree_lock as a contention
point before, but it's not like I've tried that load either. So it
might be a regression (going back long, I suspect), or just an unusual
load that nobody has traditionally tested much.

Single-threaded big file write one page at a time, was it?

The mapping tree lock has been around forever (it used to be a rw-lock
long long ago), but I wonder if we might have moved more stuff into it
(memory accounting comes to mind) causing much worse contention or
something.

Hmm. Just for fun, I googled "tree_lock contention". It's shown up
before - back in 2006, and it was you hitting it back then too.

There was an even older one (related to AIM7, interesting) which was
what caused the tree_lock to become a rw-lock back in 2005 (but then
Nick Piggin made it a spinlock again in 2008).

So it's not unheard of, but it certainly hasn't been a big issue.

That's the only obvious ones I found (apart from some btrfs issues,
but btrfs has a completely different notion of tree locking, so those
are not about the same thing).

                 Linus

--===============1710426707369500034==--

