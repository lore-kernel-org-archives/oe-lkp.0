Content-Type: multipart/mixed; boundary="===============2250626824738234044=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 10 Oct 2017 20:14:09 +0200
Message-ID: <20171010181409.74q7gxvahr7vkpia@hirez.programming.kicks-ass.net>
In-Reply-To: <CA+55aFxqRb_rK8Fa_b8zL+jg3p43w81zkt5iWpFFfByY6Rx6vg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2250626824738234044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 09:56:26AM -0700, Linus Torvalds wrote:

> So I think the best model would be something like this:
> =

>  - T1:
>         mutex_lock(&lock)
>         ...
>         mutex_transfer(&lock)
> =

>  - T2:
>         mutex_receive(&lock);
>         ...
>         mutex_unlock(&lock);
> =

> where the "mutex_transfer() -> mutex_receive()" thing really makes it
> obvious that "now thread 1 is transferring the lock to thread 2".

Ah, but that's not at all what cross-release is about. Nobody really
does wonky ownership transfer of mutexes like that (although there might
be someone doing something with semaphores, I didn't check). Its to
allow detecting this deadlock:

	mutex_lock(&lock)
	wait_for_completion(&c);
					mutex_lock(&lock);
					complete(&c);

The completion doesn't have an owner to transfer.

--===============2250626824738234044==--

