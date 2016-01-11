Content-Type: multipart/mixed; boundary="===============4947836633674068886=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] printk: clear console_may_schedule on panic flushing
Date: Mon, 11 Jan 2016 13:59:51 -0800
Message-ID: <20160111135951.b5f81c02c6d2054164f618af@linux-foundation.org>
In-Reply-To: <20160111184348.GF1898@mtj.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4947836633674068886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Jan 2016 13:43:48 -0500 Tejun Heo <tj@kernel.org> wrote:

> Commit "printk: do cond_resched() between lines while outputting to
> consoles" made console flushing perform cond_resched() after each line
> if the context allows as determined by whether the console lock was
> acquired with console_lock().  The condition is carried in
> console_may_schedule.
> =

> During panic, console lock status is ignored and the messages are
> forcifully flushed which is implemented by performing
> console_trylock(); console_unlock(); sequence ignoring whether trylock
> succeeds or fails.  This means that the emergency flushing, after
> trylock failure, may enter flushing path with console_may_schedule set
> from the actual holder.
> =

> As a system may panic from any context, this can lead to
> cond_resched() being invoked from a non-sleepable context triggering
> an extra warning dump while panicking which is noisy and can be
> confusing.  Besides, even when panicking from a sleepable context, we
> don't want to be yielding during emergency message dumping.
> =

> Currently, the emergency dumping is opencoded in panic().  This patch
> replaces the open coded implementation with a new function,
> console_flush_on_panic() and makes it explicitly clear
> console_may_schedule before starting the emergency flushing.
> =


Got that, thanks.  Because the patch has significant information
content I'd normally make it a standalone thing, but as it's destined
for -stable I think I'll scrunch it into
printk-do-cond_resched-between-lines-while-outputting-to-consoles.patch
and merge the changelogs.

You didn't comment on Sergey's observations
(https://lkml.org/lkml/2015/12/2/1192), but I'm believing this is
a separate issue and that this patch is still good.


--===============4947836633674068886==--

