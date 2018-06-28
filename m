Content-Type: multipart/mixed; boundary="===============1690696572817115900=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 15:55:35 -0700
Message-ID: <CA+55aFz1PQ86=6xEFM9ajZRoKF7NyAQmf8Gd8qnOOguFieWWbA@mail.gmail.com>
In-Reply-To: <20180628224930.GM30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1690696572817115900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 3:49 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> aio_poll() is not a problem.  It's wakeup callback that is one.

No, it's not a problem either.

The only thing the wakup callback wants to do is to remove the wait queue e=
ntry.

And *that* doesn't need to sleep, and it has absolutely nothing to do
with whether "->poll()" itself sleeps or not.

All that needs to do is "poll_freewait()". Done. In practice, it's
probably only going to be a single free_poll_entry(), but who cares?
The AIO code should handle the "maybe ->poll() added multiple
wait-queues" just fine.

> You are misreading that mess.  What he's trying to do (other than survivi=
ng
> the awful clusterfuck around cancels) is to handle the decision what to
> report to userland right in the wakeup callback.  *That* is what really
> drives the "make the second-pass ->poll() or something similar to it
> non-blocking" (in addition to the fact that it is such in considerable
> majority of instances).

That's just crazy BS.

Just call poll() again when you copy the data to userland (which by
definition can block, again).

Stop the idiotic "let's break poll for stupid AIO reasons, because the
AIO people are morons".

Just make the AIO code do the sane thing.

                  Linus

--===============1690696572817115900==--

