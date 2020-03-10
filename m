Content-Type: multipart/mixed; boundary="===============2901969440033167942=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Tue, 10 Mar 2020 18:07:42 -0400
Message-ID: <0066a9f150a55c13fcc750f6e657deae4ebdef97.camel@kernel.org>
In-Reply-To: <CAHk-=wg8N4fDRC3M21QJokoU+TQrdnv7HqoaFW-Z-ZT8z_Bi7Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2901969440033167942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-10 at 14:47 -0700, Linus Torvalds wrote:
> On Tue, Mar 10, 2020 at 2:22 PM NeilBrown <neilb@suse.de> wrote:
> > A compiler barrier() is probably justified.  Memory barriers delay reads
> > and expedite writes so they cannot be needed.
> =

> That's not at all guaranteed. Weakly ordered memory things can
> actually have odd orderings, and not just "writes delayed, reads done
> early". Reads may be delayed too by cache misses, and memory barriers
> can thus expedite reads as well (by forcing the missing read to happen
> before later non-missing ones).
> =

> So don't assume that a memory barrier would only delay reads and
> expedite writes. Quite the reverse: assume that there is no ordering
> at all unless you impose one with a memory barrier (*).
> =

>              Linus
> =

> (*) it's a bit more complex than that, in that we do assume that
> control dependencies end up gating writes, for example, but those
> kinds of implicit ordering things should *not* be what you depend on
> in the code unless you're doing some seriously subtle memory ordering
> work and comment on it extensively.

Good point. I too prefer code that's understandable by mere mortals.

Given that, and the fact that Neil pointed out that yangerkun's latest
patch would reintroduce the original race, I'm leaning back toward the
patch Neil sent yesterday. It relies solely on spinlocks, and so doesn't
have the subtle memory-ordering requirements of the others.

I did some cursory testing with it and it seems to fix the performance
regression. If you guys are OK with this patch, and Neil can send an
updated changelog, I'll get it into -next and we can get this sorted
out.

Thanks,

-------------------8<-------------------

[PATCH] locks: reintroduce locks_delete_block shortcut
---
 fs/locks.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/fs/locks.c b/fs/locks.c
index 426b55d333d5..8aa04d5ac8b3 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -735,11 +735,13 @@ static void __locks_wake_up_blocks(struct file_lock *=
blocker)
 =

 		waiter =3D list_first_entry(&blocker->fl_blocked_requests,
 					  struct file_lock, fl_blocked_member);
+		spin_lock(&waiter->fl_wait.lock);
 		__locks_delete_block(waiter);
 		if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
 			waiter->fl_lmops->lm_notify(waiter);
 		else
-			wake_up(&waiter->fl_wait);
+			wake_up_locked(&waiter->fl_wait);
+		spin_unlock(&waiter->fl_wait.lock);
 	}
 }
 =

@@ -753,6 +755,31 @@ int locks_delete_block(struct file_lock *waiter)
 {
 	int status =3D -ENOENT;
 =

+	/*
+	 * If fl_blocker is NULL, it won't be set again as this thread
+	 * "owns" the lock and is the only one that might try to claim
+	 * the lock.  So it is safe to test fl_blocker locklessly.
+	 * Also if fl_blocker is NULL, this waiter is not listed on
+	 * fl_blocked_requests for some lock, so no other request can
+	 * be added to the list of fl_blocked_requests for this
+	 * request.  So if fl_blocker is NULL, it is safe to
+	 * locklessly check if fl_blocked_requests is empty.  If both
+	 * of these checks succeed, there is no need to take the lock.
+	 * However, some other thread might have only *just* set
+	 * fl_blocker to NULL and it about to send a wakeup on
+	 * fl_wait, so we mustn't return too soon or we might free waiter
+	 * before that wakeup can be sent.  So take the fl_wait.lock
+	 * to serialize with the wakeup in __locks_wake_up_blocks().
+	 */
+	if (waiter->fl_blocker =3D=3D NULL) {
+		spin_lock(&waiter->fl_wait.lock);
+		if (waiter->fl_blocker =3D=3D NULL &&
+		    list_empty(&waiter->fl_blocked_requests)) {
+			spin_unlock(&waiter->fl_wait.lock);
+			return status;
+		}
+		spin_unlock(&waiter->fl_wait.lock);
+	}
 	spin_lock(&blocked_lock_lock);
 	if (waiter->fl_blocker)
 		status =3D 0;
-- =

2.24.1


--===============2901969440033167942==--

