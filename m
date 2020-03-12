Content-Type: multipart/mixed; boundary="===============2275028266393868266=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Thu, 12 Mar 2020 09:07:49 -0700
Message-ID: <CAHk-=wj5jOYxjZSUNu_jdJ0zafRS66wcD-4H0vpQS=a14rS8jw@mail.gmail.com>
In-Reply-To: <87o8t2tc9s.fsf@notabene.neil.brown.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============2275028266393868266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 9:42 PM NeilBrown <neilb@suse.de> wrote:
>
> It seems that test_and_set_bit_lock() is the preferred way to handle
> flags when memory ordering is important

That looks better.

The _preferred_ way is actually the one I already posted: do a
"smp_store_release()" to store the flag (like a NULL pointer), and a
smp_load_acquire() to load it.

That's basically optimal on most architectures (all modern ones -
there are bad architectures from before people figured out that
release/acquire is better than separate memory barriers), not needing
any atomics and only minimal memory ordering.

I wonder if a special flags value (keeping it "unsigned int" to avoid
the issue Jeff pointed out) might be acceptable?

IOW, could we do just

        smp_store_release(&waiter->fl_flags, FL_RELEASED);

to say that we're done with the lock? Or do people still look at and
depend on the flag values at that point?

                Linus
--===============2275028266393868266==--

