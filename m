Content-Type: multipart/mixed; boundary="===============7305699596371746268=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] printk: clear console_may_schedule on panic flushing
Date: Tue, 12 Jan 2016 22:50:59 +0900
Message-ID: <20160112135059.GA670@swordfish>
In-Reply-To: <20160111135951.b5f81c02c6d2054164f618af@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7305699596371746268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (01/11/16 13:59), Andrew Morton wrote:
> > Commit "printk: do cond_resched() between lines while outputting to
> > consoles" made console flushing perform cond_resched() after each line
> > if the context allows as determined by whether the console lock was
> > acquired with console_lock().  The condition is carried in
> > console_may_schedule.
> > =

> > During panic, console lock status is ignored and the messages are
> > forcifully flushed which is implemented by performing
> > console_trylock(); console_unlock(); sequence ignoring whether trylock
> > succeeds or fails.  This means that the emergency flushing, after
> > trylock failure, may enter flushing path with console_may_schedule set
> > from the actual holder.
> > =

> > As a system may panic from any context, this can lead to
> > cond_resched() being invoked from a non-sleepable context triggering
> > an extra warning dump while panicking which is noisy and can be
> > confusing.  Besides, even when panicking from a sleepable context, we
> > don't want to be yielding during emergency message dumping.
> > =

> > Currently, the emergency dumping is opencoded in panic().  This patch
> > replaces the open coded implementation with a new function,
> > console_flush_on_panic() and makes it explicitly clear
> > console_may_schedule before starting the emergency flushing.
> > =

> =

> Got that, thanks.  Because the patch has significant information
> content I'd normally make it a standalone thing, but as it's destined
> for -stable I think I'll scrunch it into
> printk-do-cond_resched-between-lines-while-outputting-to-consoles.patch
> and merge the changelogs.
> =

> You didn't comment on Sergey's observations
> (https://lkml.org/lkml/2015/12/2/1192), but I'm believing this is
> a separate issue and that this patch is still good.

Thanks for Cc-ing.

Yes, this problem is different.


FWIW,
what I ended up implementing in my private builds is a bit different
thing -- I added a new console_panic_mode() function which basically
calls zap_locks(). The reason I did it this way was that console_unlock()
can potentially have other locks in it some day, not just `console_sem'.
For example, like in one of Jan's deferred printk implementations. Sort
of a defensive move to avoid possible problems.

	-ss

--===============7305699596371746268==--

