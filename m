Content-Type: multipart/mixed; boundary="===============0546581714913979734=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Tue, 10 May 2022 15:46:46 -0400
Message-ID: <149d85f2-8561-cfac-3447-425d6a4b8014@redhat.com>
In-Reply-To: <CAHk-=wiEtdHOeBti66NpSZDQw0KxcU45UNHaO-+Zwbiq3JEu+g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0546581714913979734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/10/22 15:03, Linus Torvalds wrote:
> On Tue, May 10, 2022 at 11:47 AM Waiman Long <longman@redhat.com> wrote=
:>
>> Qspinlock still has one head waiter spinning on the lock. This is much
>> better than the original ticket spinlock where there will be n waiters
>> spinning on the lock.
> Oh, absolutely. I'm not saying we should look at going back. I'm more
> asking whether maybe we could go even further..

We can probably go a bit further, but there will be cost associated with it.

>> That is the cost of a cheap unlock. There is no way to eliminate all
>> lock spinning unless we use MCS lock directly which will require a
>> change in locking API as well as more expensive unlock.
> So there's no question that unlock would be more expensive for the
> contention case, since it would have to always not only clear the lock
> itself, as well as update the noce it points to.
>
> But does it actually require a change in the locking API?

Of course, it is not always necessary to change the locking API.


>
> The qspinlock slowpath already always allocates that mcs node (for
> some definition of "always" - I am obviously ignoring all the trylock
> cases both before and in the slowpath)
>
> But yes, clearly the simply store-release of the current
> queued_spin_unlock() wouldn't work as-is, and maybe the cost of
> replacing it with something else is much more expensive than any
> possible win.
At the minimum, we need to do a read to determine if the lock is =

contended and also a write to clear the lock bit. An atomic write after =

read is expensive. There is also a possibility of race with non-atomic =

read-write. Moreover, the tail stored in the lock can tell you the queue =

tail, not its current head. So there is no easy way to notify the =

current head waiter to acquire the lock. The only thing I can think of =

is to do some kind of proportional backoff for the head waiter by slowly =

increasing the time gap with successive spinning attempts on the lock =

over time with the cost of an increased lock acquisition latency.
> I think the PV case already basically does that - replacing the the
> "store release" with a much more complex sequence. No?

That is true for pvqspinlock as the unlock is an atomic operation with =

increased cost. The original pv ticket spinlock that is now replaced by =

pvqspinlock has similar expensive unlock due to the nature of reading =

the lock to find out if the head waiter vCPU may have been preempted.

Cheers,
Longman

--===============0546581714913979734==--

