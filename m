Content-Type: multipart/mixed; boundary="===============1745118319159145224=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Mon, 03 Jun 2019 09:07:29 -0700
Message-ID: <CAHk-=wgZcrb_vQi5rwpv+=wwG+68SRDY16HcqcMtgPFL_kdfyQ@mail.gmail.com>
In-Reply-To: <CAHk-=wj2t+GK+DGQ7Xy6U7zMf72e7Jkxn4_-kGyfH3WFEoH+YQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1745118319159145224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2019 at 8:55 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I don't believe that it would necessarily help to turn a
> rcu_read_lock() into a compiler barrier, because for the non-preempt
> case rcu_read_lock() doesn't need to actually _do_ anything, and
> anything that matters for the RCU read lock will already be a compiler
> barrier for other reasons (ie a function call that can schedule).

Actually, thinking a bit more about this, and trying to come up with
special cases, I'm not at all convinced.

Even if we don't have preemption enabled, it turns out that we *do*
have things that can cause scheduling without being compiler barriers.

In particular, user accesses are not necessarily full compiler
barriers. One common pattern (x86) is

        asm volatile("call __get_user_%P4"

which explicitly has a "asm volaile" so that it doesn't re-order wrt
other asms (and thus other user accesses), but it does *not* have a
"memory" clobber, because the user access doesn't actually change
kernel memory. Not even if it's a "put_user()".

So we've made those fairly relaxed on purpose. And they might be
relaxed enough that they'd allow re-ordering wrt something that does a
rcu read lock, unless the rcu read lock has some compiler barrier in
it.

IOW, imagine completely made up code like

     get_user(val, ptr)
     rcu_read_lock();
     WRITE_ONCE(state, 1);

and unless the rcu lock has a barrier in it, I actually think that
write to 'state' could migrate to *before* the get_user().

I'm not convinced we have anything that remotely looks like the above,
but I'm actually starting to think that yes, all RCU barriers had
better be compiler barriers.

Because this is very much an example of something where you don't
necessarily need a memory barrier, but there's a code generation
barrier needed because of local ordering requirements. The possible
faulting behavior of "get_user()" must not migrate into the RCU
critical region.

Paul?

So I think the rule really should be: every single form of locking
that has any semantic meaning at all, absolutely needs to be at least
a compiler barrier.

(That "any semantic meaning" weaselwording is because I suspect that
we have locking that truly and intentionally becomes no-ops because
it's based on things that aren't relevant in some configurations. But
generally compiler barriers are really pretty damn cheap, even from a
code generation standpoint, and can help make the resulting code more
legible, so I think we should not try to aggressively remove them
without _very_ good reasons)

                      Linus

--===============1745118319159145224==--

