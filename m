Content-Type: multipart/mixed; boundary="===============8429616686674172303=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Fri, 13 Mar 2020 20:31:36 -0500
Message-ID: <f000e352d9e103b3ade3506aac225920420d2323.camel@kernel.org>
In-Reply-To: <CAHk-=wj5jOYxjZSUNu_jdJ0zafRS66wcD-4H0vpQS=a14rS8jw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8429616686674172303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-12 at 09:07 -0700, Linus Torvalds wrote:
> On Wed, Mar 11, 2020 at 9:42 PM NeilBrown <neilb@suse.de> wrote:
> > It seems that test_and_set_bit_lock() is the preferred way to handle
> > flags when memory ordering is important
> =

> That looks better.
> =

> The _preferred_ way is actually the one I already posted: do a
> "smp_store_release()" to store the flag (like a NULL pointer), and a
> smp_load_acquire() to load it.
> =

> That's basically optimal on most architectures (all modern ones -
> there are bad architectures from before people figured out that
> release/acquire is better than separate memory barriers), not needing
> any atomics and only minimal memory ordering.
> =

> I wonder if a special flags value (keeping it "unsigned int" to avoid
> the issue Jeff pointed out) might be acceptable?
> =

> IOW, could we do just
> =

>         smp_store_release(&waiter->fl_flags, FL_RELEASED);
> =

> to say that we're done with the lock? Or do people still look at and
> depend on the flag values at that point?

I think nlmsvc_grant_block does. We could probably work around it
there, but we'd need to couple this change with some clear
documentation to make it clear that you can't rely on fl_flags after
locks_delete_block returns.

If avoiding new locks is preferred here (and I'm fine with that), then
maybe we should just go with the patch you sent originally (along with
changing the waiters to wait on fl_blocked_member going empty instead
of the fl_blocker going NULL)?

-- =

Jeff Layton <jlayton@kernel.org>

--===============8429616686674172303==--

