Content-Type: multipart/mixed; boundary="===============8900215754650806104=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 11 Oct 2017 09:56:05 +0900
Message-ID: <20171011005605.GF3323@X58A-UD3R>
In-Reply-To: <CA+55aFzBfOcmqK2cZoAwfCpcQB22YF4HusUk9pGB1B17foTN5w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8900215754650806104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 09:22:26AM -0700, Linus Torvalds wrote:
> On Mon, Oct 9, 2017 at 10:48 PM, Byungchul Park <byungchul.park@lge.com=
> wrote:
> >>
> >> The place where the release is done should simply be special.
> >>
> >> Because we should *not* encourage the whole "acquire by one context,
> >> release by another" as being something normal and "just set the flag
> >> to let lockdep know".
> >
> > Could you explain it more? Please let me apply what you point out. Now,
> > I don't understand your intention.
> =

> I really would like to see the sites that do cross-thread lock/unlock
> pairs themselves be annotated.
> =

> So when you lock in one thread, and then unlock in another, I'd
> actually prefer to see something like
> =

>  - T1:
>         lock_mutex_cross();
> =

>  - T2:
>         unlock_mutex_cross();
> =

> to make it very explicit that *these* particular lock/unlock
> operations are the fancy ones.
> =

> So instead of associating the "special status" with the _data_, I'd
> much rather associate it with the _code_.
> =

> See what I'm saying?

Thank you very much for explaining it in detail.

But let's shift a viewpoint. Precisely, I didn't want to work on locks
but *waiters* becasue dependancies causing deadlocks only can be created
by waiters - nevertheless I have no idea for a better name to my feature.

Lockdep should also have worked on waiters instead of locks, in the
strict sense. Having said that, we can work on locks to detect deadlocks
one way or another, becasue typical locks implicitly include wait
operations except trylocks, which in turn of course cause other waitings
once it's acquired successfully, though.

I mean, all we have to do to detect deadlocks is to identify
dependencies. *That's all*. IMHO, we don't need to consider "transfering
and recieving locks" and even lock protection. We only have to focus on
dependecies by waiters and how to identify dependencies from them.

> This is kind of similar to my opinion on the C "volatile" keyword, and
> why we do not generally use it in the kernel. It's not the *data* that
> is volatile, because the data itself might be stable or volatile
> depending on whether you hold a lock or not. It's the _code_access_
> that is either volatile or not, and rather than using volatile on data
> structures, we use volatile in code (although not explicitly as such -
> we hide it inside the accessors like "READ_ONCE()" etc).

I like it. I agree with you.

> I agree wholeheartedly that it can often be much more convenient to
> just mark one particular lock as being special, but at the same time
> it's really not the lock itself that is interesting, it's the
> _handoff_ of the lock that is interesting.
> =

> And particularly for cross-thread lock/unlock sequences, the hand-over
> really is special. For a normal lock/unlock sequence, the lock itself
> is the thing that protects the data. But that is simply not true if
> you have a cross-thread hand-over of the lock: you also need to make
> sure that the hand-over itself is safe. That's generally very easy to
> do, you just make sure that the original owner of the lock has done
> everything the lock protects and then make the lock available with
> smp_store_release() and then the receiving end should do
> smp_load_acquire() to read the lock pointer (or lock transfer status,
> or whatever). Because *within* a thread, memory ordering is guaranteed
> on its own. Between two threads? Memory ordering comes into play even
> when you *hold* the lock.

I and Peter have handled memory ordering carefully, when identifying
dependencies between waiters. That was where we have to consider memory
ordering.

Thanks,
Byungchul

--===============8900215754650806104==--

