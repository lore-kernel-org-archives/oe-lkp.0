Content-Type: multipart/mixed; boundary="===============8121437550987483434=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Thu, 12 Oct 2017 10:15:33 +0900
Message-ID: <20171012011533.GJ3323@X58A-UD3R>
In-Reply-To: <20171011005605.GF3323@X58A-UD3R>
List-Id: <oe-lkp.lists.linux.dev>

--===============8121437550987483434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 09:56:05AM +0900, Byungchul Park wrote:
> Thank you very much for explaining it in detail.
> =

> But let's shift a viewpoint. Precisely, I didn't want to work on locks
> but *waiters* becasue dependancies causing deadlocks only can be created
> by waiters - nevertheless I have no idea for a better name to my feature.
> =

> Lockdep should also have worked on waiters instead of locks, in the
> strict sense. Having said that, we can work on locks to detect deadlocks
> one way or another, becasue typical locks implicitly include wait
> operations except trylocks, which in turn of course cause other waitings
> once it's acquired successfully, though.
> =

> I mean, all we have to do to detect deadlocks is to identify
> dependencies. *That's all*. IMHO, we don't need to consider "transfering
> and recieving locks" and even lock protection. We only have to focus on
> dependecies by waiters and how to identify dependencies from them.

Lastly, please let me explain one more.

There are many "wait_for_event and event" pairs in kernel. The pairs
build dependencies, and dependencies are the sole cause of deadlocks.

Typical locks roughly have the following two functionalities:

   1. protection - Only goal of this functionality is to prevent other
      accessors from entering a critical section, via making them wait
      or fail, whatever. By preventing it, it provides *ownership* of
      the critical section access.

   2. synchronization - I mean synchroniation between entering/exiting
      points of critical sections. Normally using a "wait_for_event and
      event" pair, it controls the flow under contention, where the
      event is unlock.

What I want to note is that *only* the second one participates in
creating dependencies and deadlocks.

In addition, in wait_for_completion() case, it's an operation exactly
doing only the synchronization. Therefore, of course it's itself a basic
element of dependencies, like the second one of typical locks.

I am afraid and wonder if I successfully delivered my original intention.
Please let me explain it more if not.

Thanks,
Byungchul

> > This is kind of similar to my opinion on the C "volatile" keyword, and
> > why we do not generally use it in the kernel. It's not the *data* that
> > is volatile, because the data itself might be stable or volatile
> > depending on whether you hold a lock or not. It's the _code_access_
> > that is either volatile or not, and rather than using volatile on data
> > structures, we use volatile in code (although not explicitly as such -
> > we hide it inside the accessors like "READ_ONCE()" etc).
> =

> I like it. I agree with you.
> =

> > I agree wholeheartedly that it can often be much more convenient to
> > just mark one particular lock as being special, but at the same time
> > it's really not the lock itself that is interesting, it's the
> > _handoff_ of the lock that is interesting.
> > =

> > And particularly for cross-thread lock/unlock sequences, the hand-over
> > really is special. For a normal lock/unlock sequence, the lock itself
> > is the thing that protects the data. But that is simply not true if
> > you have a cross-thread hand-over of the lock: you also need to make
> > sure that the hand-over itself is safe. That's generally very easy to
> > do, you just make sure that the original owner of the lock has done
> > everything the lock protects and then make the lock available with
> > smp_store_release() and then the receiving end should do
> > smp_load_acquire() to read the lock pointer (or lock transfer status,
> > or whatever). Because *within* a thread, memory ordering is guaranteed
> > on its own. Between two threads? Memory ordering comes into play even
> > when you *hold* the lock.
> =

> I and Peter have handled memory ordering carefully, when identifying
> dependencies between waiters. That was where we have to consider memory
> ordering.
> =

> Thanks,
> Byungchul

--===============8121437550987483434==--

