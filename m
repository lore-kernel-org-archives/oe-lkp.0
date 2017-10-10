Content-Type: multipart/mixed; boundary="===============9027360494381523905=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 10 Oct 2017 11:38:34 -0700
Message-ID: <CA+55aFzcw=6PPgzquEVOgv8NMpyYVz+2-d8JzCOJA2_SxjnC8A@mail.gmail.com>
In-Reply-To: <20171010181409.74q7gxvahr7vkpia@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============9027360494381523905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 11:14 AM, Peter Zijlstra <peterz@infradead.org> w=
rote:
>
> Ah, but that's not at all what cross-release is about. Nobody really
> does wonky ownership transfer of mutexes like that (although there might
> be someone doing something with semaphores, I didn't check). Its to
> allow detecting this deadlock:
>
>         mutex_lock(&lock)
>         wait_for_completion(&c);
>                                         mutex_lock(&lock);
>                                         complete(&c);
>
> The completion doesn't have an owner to transfer.

Well, it really does. The "init_completion()" would be the original
owner (essentially the same as a "lock()"), then it has a transfer,
and then a receive, and then "complete()" is basically the unlock
elsewhere.

Of course, right now that transfer and receive is entirely implicit,
so you don't really see it anywhere. And for completions, the whole
_point_ is that transfer, so ..

The "wait_for_completion()" is then a normal lock operation (no
transfer there - it's just trying to get the lock again).

                Linus

--===============9027360494381523905==--

