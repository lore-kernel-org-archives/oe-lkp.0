Content-Type: multipart/mixed; boundary="===============2671997432572735541=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Fri, 10 Dec 2021 17:01:58 -0800
Message-ID: <CAHk-=wh7Ymejr65Skmxgz12cou44uGhO1YWGoYRYrQTKC5AeYA@mail.gmail.com>
In-Reply-To: <CAG48ez2YE08+vo+E+ZtxeikN4vVCJC+-BrWJUYWb0f0vRA0Uug@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2671997432572735541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 3:30 PM Jann Horn <jannh@google.com> wrote:
>
> One nit: The original implementation is using rcu_dereference_raw()
> because it can run in different contexts, but here plain
> rcu_dereference() would probably be more appropriate?

Well, I actually did that somewhat on purpose.

The RCU locking is right there, so doing the checking seems pointless.

That's particularly true since the whole point of the patch was "this
is truly critical, let's rewrite it to generate basically perfect
code"..

                 Linus
--===============2671997432572735541==--

