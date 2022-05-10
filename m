Content-Type: multipart/mixed; boundary="===============0834926963207803527=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Tue, 10 May 2022 12:03:24 -0700
Message-ID: <CAHk-=wiEtdHOeBti66NpSZDQw0KxcU45UNHaO-+Zwbiq3JEu+g@mail.gmail.com>
In-Reply-To: <56474c28-e62a-36b1-257b-9e5ffb11b0e2@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0834926963207803527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 11:47 AM Waiman Long <longman@redhat.com> wrote:>
> Qspinlock still has one head waiter spinning on the lock. This is much
> better than the original ticket spinlock where there will be n waiters
> spinning on the lock.

Oh, absolutely. I'm not saying we should look at going back. I'm more
asking whether maybe we could go even further..

> That is the cost of a cheap unlock. There is no way to eliminate all
> lock spinning unless we use MCS lock directly which will require a
> change in locking API as well as more expensive unlock.

So there's no question that unlock would be more expensive for the
contention case, since it would have to always not only clear the lock
itself, as well as update the noce it points to.

But does it actually require a change in the locking API?

The qspinlock slowpath already always allocates that mcs node (for
some definition of "always" - I am obviously ignoring all the trylock
cases both before and in the slowpath)

But yes, clearly the simply store-release of the current
queued_spin_unlock() wouldn't work as-is, and maybe the cost of
replacing it with something else is much more expensive than any
possible win.

I think the PV case already basically does that - replacing the the
"store release" with a much more complex sequence. No?

         Linus
--===============0834926963207803527==--

