Content-Type: multipart/mixed; boundary="===============7791018435743084058=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sun, 14 Aug 2016 18:37:33 -0700
Message-ID: <CA+55aFy8-biqTbDwwTqOPALAD+WN_PgDBK6HPTxTRiVgj5bA8Q@mail.gmail.com>
In-Reply-To: <20160815004826.GW19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============7791018435743084058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2016 at 5:48 PM, Dave Chinner <david@fromorbit.com> wrote:
>>
>> Does this attached patch help your contention numbers?
>
> No. If anything, it makes it worse. Without the patch, I was
> measuring 36-37% in _raw_spin_unlock_irqrestore. With the patch, it
> is 42-43%. Write throughtput is the same at ~505MB/s.

Not helping any I can see, but I don't see how it could hurt...

Did you perhaps test it together with the other patches that improved
xfs performance? If other things improve, then I'd expect the
contention to get worse.

Not that it matters. Clearly that patch isn't even a stop-gap solution.

> There's a couple of interesting things showing up in the profile:
>
>   41.64%  [kernel]  [k] _raw_spin_unlock_irqrestore

Actually, you didn't point this one out, but *this* is the real kicker.

There's no way a *unlock* should show up that high. It's not spinning.
It's doing a single store and a pushq/popfq sequence.

Sure, it's going to take a cross-node cachemiss in the presence of
contention, but even then it should never be more expensive than the
locking side - which will *also* do the node changes.

So there's something really odd in your profile. I don't think that's valid.

Maybe your symbol table came from a old kernel, and functions moved
around enough that the profile attributions ended up bogus.

I suspect it's actually supposed to be _raw_spin_lock_irqrestore()
which is right next to that function. Although I'd actually expect
that if it's lock contention, you should see the contention mostly in
queued_spin_lock_slowpath().

Unless you have spinlock debugging turned on, in which case your
contention is all from *that*. That's possible, of course.

>    7.92%  [kernel]  [k] copy_user_generic_string
>    5.87%  [kernel]  [k] _raw_spin_unlock_irq
>    3.18%  [kernel]  [k] do_raw_spin_lock
>    2.51%  [kernel]  [k] cancel_dirty_page         <<<<<<<<<<<<<<<
...
> Why are we even calling into cancel_dirty_page() if the page isn't
> dirty? xfs_vm_release_page() won't let dirty pages through to
> try_to_free_buffers(), so all this is just pure overhead for XFS.

See above: there's something screwy with your profile, you should
check that first. Maybe it's not actually cancel_dirty_page() but
something close-by.

(Although I don't see anything closeby normally, so even if the
spin_unlock_irq is bogus, I think *that* part may be incorrect.

Anyway, the reason you'd get cancel_dirty_page() is either due to
truncate, or due to try_to_free_buffers() having dropped the buffers
successfully because the filesystem had already written them out, but
the page is still marked dirty.

> FWIW, this is not under the mapping->tree_lock, but the profile shows
> that reclaiming bufferheads is roughly 20% of all the work kswapd is
> doing.

Well, that may not actually be wrong. That's the most expensive part
of reclaiming memory.

But please double-check your profile, because something is seriously
wrong in it.

            Linus

--===============7791018435743084058==--

