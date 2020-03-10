Content-Type: multipart/mixed; boundary="===============0351703515831474557=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Tue, 10 Mar 2020 15:31:10 -0700
Message-ID: <CAHk-=whUgeZGcs5YAfZa07BYKNDCNO=xr4wT6JLATJTpX0bjGg@mail.gmail.com>
In-Reply-To: <0066a9f150a55c13fcc750f6e657deae4ebdef97.camel@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0351703515831474557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 3:07 PM Jeff Layton <jlayton@kernel.org> wrote:
>
> Given that, and the fact that Neil pointed out that yangerkun's latest
> patch would reintroduce the original race, I'm leaning back toward the
> patch Neil sent yesterday. It relies solely on spinlocks, and so doesn't
> have the subtle memory-ordering requirements of the others.

It has subtle locking changes, though.

It now calls the "->lm_notify()" callback with the wait queue spinlock held.

is that ok? It's not obvious. Those functions take other spinlocks,
and wake up other things. See for example nlmsvc_notify_blocked()..
Yes, it was called under the blocked_lock_lock spinlock before too,
but now there's an _additional_ spinlock, and it must not call
"wake_up(&waiter->fl_wait))" in the callback, for example, because it
already holds the lock on that wait queue.

Maybe that is never done. I don't know the callbacks.

I was really hoping that the simple memory ordering of using that
smp_store_release -> smp_load_acquire using fl_blocker would be
sufficient. That's a particularly simple and efficient ordering.

Oh well. If you want to go that spinlock way, it needs to document why
it's safe to do a callback under it.

                  Linus
--===============0351703515831474557==--

