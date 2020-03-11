Content-Type: multipart/mixed; boundary="===============1160800885152872587=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Wed, 11 Mar 2020 07:52:23 -0500
Message-ID: <9ff6eee403d293dd069935ca6979f72131fe5217.camel@kernel.org>
In-Reply-To: <f9db707f-74ef-9439-1aec-e1ce8234888e@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1160800885152872587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-03-11 at 09:57 +0800, yangerkun wrote:

[snip]

> =

> On 2020/3/11 5:01, NeilBrown wrote:
> > =

> > I think this patch contains an assumption which is not justified.  It
> > assumes that if a wait_event completes without error, then the wake_up()
> > must have happened.  I don't think that is correct.
> > =

> > In the patch that caused the recent regression, the race described
> > involved a signal arriving just as __locks_wake_up_blocks() was being
> > called on another thread.
> > So the waiting process was woken by a signal *after* ->fl_blocker was s=
et
> > to NULL, and *before* the wake_up().  If wait_event_interruptible()
> > finds that the condition is true, it will report success whether there
> > was a signal or not.
> Neil and Jeff, Hi,
> =

> But after this, like in flock_lock_inode_wait, we will go another =

> flock_lock_inode. And the flock_lock_inode it may return =

> -ENOMEM/-ENOENT/-EAGAIN/0.
> =

> - 0: If there is a try lock, it means that we have call =

> locks_move_blocks, and fl->fl_blocked_requests will be NULL, no need to =

> wake up at all. If there is a unlock, no one call wait for me, no need =

> to wake up too.
> =

> - ENOENT: means we are doing unlock, no one will wait for me, no need to =

> wake up.
> =

> - ENOMEM: since last time we go through flock_lock_inode someone may =

> wait for me, so for this error, we need to wake up them.
> =

> - EAGAIN: since we has go through flock_lock_inode before, these may =

> never happen because FL_SLEEP will not lose.
> =

> So the assumption may be ok and for some error case we need to wake up =

> someone may wait for me before(the reason for the patch "cifs: call =

> locks_delete_block for all error case in cifs_posix_lock_set"). If I am =

> wrong, please point out!
> =

> =


That's the basic dilemma. We need to know whether we'll need to delete
the block before taking the blocked_lock_lock.

Your most recent patch used the return code from the wait to determine
this, but that's not 100% reliable (as Neil pointed out). Could we try
to do this by doing the delete only when we get certain error codes?
Maybe, but that's a bit fragile-sounding.

Neil's most recent patch used presence on the fl_blocked_requests list
to determine whether to take the lock, but that relied on some very
subtle memory ordering. We could of course do that, but that's a bit
brittle too.

That's the main reason I'm leaning toward the patch Neil sent
originally and that uses the fl_wait.lock. The existing alternate lock
managers (nfsd and lockd) don't use fl_wait at all, so I don't think
doing that will cause any issues.

-- =

Jeff Layton <jlayton@kernel.org>

--===============1160800885152872587==--

