Content-Type: multipart/mixed; boundary="===============8226606068630122043=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 12:31:14 -0700
Message-ID: <CA+55aFyPUpd3tWVqbTVXGKjMb42+g-9MCfvjXLpb0RGSOW8sbA@mail.gmail.com>
In-Reply-To: <20180628181727.GH30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============8226606068630122043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 11:17 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> As for what can be salvaged out of the whole mess,
>         * probably the most serious lesson is that INDIRECT CALLS ARE
> COSTLY NOW and shouldn't be used lightly.

Note that this has always been true, it's just _way_ more obvious now.

Indirect calls are costly not just because of the nasty 20+ cycle cost
of the stupid spectre overhead (which hopefully will be a thing of the
past in a few years as people upgrade), but because they are a pretty
basic barrier to optimization, both for compilers but also just for
_people_.

Look at a lot of vfs optimization we've done, like all the name
hashing optimization etc. We basically fall flat on our face if a
filesystem implements its own name hash function, not _just_ because
of the cost of the indirect function call, but because it suddenly
means that the filesystem is doing its own thing and all the clever
work we did to integrate name hashing with copying the name no longer
works.

So I really want to avoid indirect calls. And when they *do* happen, I
want to avoid the model where people think of them as low-level object
accessor functions - the C++ disease. I want indirect function calls
to make sense at a higher level, and do some real operation.

End result: I really despised the new poll() model. Yes, the
performance report was what made me *notice*, but then when I looked
at the code I went "No". Using an indirect call as some low-level
accessor function really is fundamentally wrong. Don't do it. It's
badly designed.

Out VFS operations are _high-level_ operations, where we do one single
call for a whole "read()" operation. "->poll()" used to be the same.
The new "->get_poll_head()" and "->poll_mask()" was just bad, bad,
bad.

>         * having an optional pointer to wait_queue_head in struct file
> is probably a good idea; a lot of ->poll() instances do have the same
> form.  Even if sockets do not (and I'm not all that happy about the
> solution in the latest series), the instances that do are common and
> important enough.

Right. I don't hate the poll wait-queue pointer. That said, I do hope
that we can simply write things so as to not even need it.

>         * a *LOT* of ->poll() instances only block in __pollwait()
> called (indirectly) on the first pass.

They are *all* supposed to do it.

The whole idea with "->poll()" is that the model of operation is:

 -  add_wait_queue() and return state on the first pass

 - on subsequent passes (or if somebody else already returned a state
that means we already know we're not going to wait), the poll table is
NULL, so you *CANNOT* add_wait_queue again, so you just return state.

Additionally, once _anybody_ has returned a "I already have the
event", we also clear the poll table queue, so subsequent accesses
will purely be for returning the poll state.

So I don't understand why you're asking for annotation. The whole "you
add yourself to the poll table" is *fundamentally* only done on the
first pass. You should never do it for later passes.

> How much do you intend to revert?  Untangling just the ->poll()-related
> parts from the rest of changes in fs/aio.c will be unpleasant; we might
> end up reverting the whole tail of the series and redoing the things
> that are not poll-related on top of the revert... ;-/

I pushed out my revert. It was fairly straightforward, it just
reverted all the poll_mask/get_poll_head changes, and the aio code
that depended on them.

Btw, I really don't understand the "aio has a race". The old poll()
interface was fundamentally race-free. There simply *is* no way to
race on it, exactly because of the whole "add yourself to the wait
queue first, then ask for state afterwards" model.  The model may be
_odd_, but it has literally worked well for a quarter century exactly
because it's really simple and fundamentally cannot have races.

So I think it's the aio code that needs fixing, not the polling code.

I do want that explanation for why AIO is _so_ special that it can
introduce a race in poll().

Because I suspect it's not so special, and it's just buggy. Maybe
Christoph didn't understand the two-phase model (how you call ->poll()
_twice_ - first to add yourself to the queue, later to check status).
Or maybe AIO interfaces are just shit (again!) and don't work right.

                   Linus

--===============8226606068630122043==--

