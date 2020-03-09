Content-Type: multipart/mixed; boundary="===============3632783781957680946=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Mon, 09 Mar 2020 15:53:19 -0400
Message-ID: <3358ab2ca14f51ec36202c9957453c32cba81fad.camel@kernel.org>
In-Reply-To: <1bfba96b4bf0d3ca9a18a2bced3ef3a2a7b44dad.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3632783781957680946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-03-09 at 15:09 -0400, Jeff Layton wrote:
> On Mon, 2020-03-09 at 13:22 -0400, Jeff Layton wrote:
> > On Mon, 2020-03-09 at 08:52 -0700, Linus Torvalds wrote:
> > > On Mon, Mar 9, 2020 at 7:36 AM Jeff Layton <jlayton@kernel.org> wro=
te:
> > > > On Sun, 2020-03-08 at 22:03 +0800, kernel test robot wrote:
> > > > > FYI, we noticed a -96.6% regression of will-it-scale.per_process_=
ops due to commit:
> > > > =

> > > > This is not completely unexpected as we're banging on the global
> > > > blocked_lock_lock now for every unlock. This test just thrashes file
> > > > locks and unlocks without doing anything in between, so the workload
> > > > looks pretty artificial [1].
> > > > =

> > > > It would be nice to avoid the global lock in this codepath, but it
> > > > doesn't look simple to do. I'll keep thinking about it, but for now=
 I'm
> > > > inclined to ignore this result unless we see a problem in more real=
istic
> > > > workloads.
> > > =

> > > That is a _huge_ regression, though.
> > > =

> > > What about something like the attached? Wouldn't that work? And make
> > > the code actually match the old comment about wow "fl_blocker" being
> > > NULL being special.
> > > =

> > > The old code seemed to not know about things like memory ordering eit=
her.
> > > =

> > > Patch is entirely untested, but aims to have that "smp_store_release()
> > > means I'm done and not going to touch it any more", making that
> > > smp_load_acquire() test hopefully be valid as per the comment..
> > =

> > Yeah, something along those lines maybe. I don't think we can use
> > fl_blocker that way though, as the wait_event_interruptible is waiting
> > on it to go to NULL, and the wake_up happens before fl_blocker is
> > cleared.
> > =

> > Maybe we need to mix in some sort of FL_BLOCK_ACTIVE flag and use that
> > instead of testing for !fl_blocker to see whether we can avoid the
> > blocked_lock_lock?
> >   =

> =

> How about something like this instead? (untested other than for
> compilation)
> =

> Basically, this just switches the waiters over to wait for
> fl_blocked_member to go empty. That still happens before the wakeup, so
> it should be ok to wait on that.
> =

> I think we can also eliminate the lockless list_empty check in
> locks_delete_block, as the fl_blocker check should be sufficient now.

Actually, no -- we need to keep that check in. The rest should work
though. I'll do some testing with it and see if the perf issue goes
away.

Thanks,
-- =

Jeff Layton <jlayton@kernel.org>

--===============3632783781957680946==--

