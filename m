Content-Type: multipart/mixed; boundary="===============2471490512968959057=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Mon, 03 Jun 2019 13:24:32 -0700
Message-ID: <CAHk-=whXb-QGZqOZ7S9YdjvQf7FNymzceinzJegvRALqXm3=FQ@mail.gmail.com>
In-Reply-To: <20190603195304.GK28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2471490512968959057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2019 at 12:53 PM Paul E. McKenney <paulmck@linux.ibm.com> =
wrote:
>
> I agree that !PREEMPT rcu_read_lock() would not affect compiler code
> generation, but given that get_user() is a volatile asm, isn't the
> compiler already forbidden from reordering it with the volatile-casted
> WRITE_ONCE() access, even if there was nothing at all between them?
> Or are asms an exception to the rule that volatile executions cannot
> be reordered?

Paul, you MAKE NO SENSE.

What is wrong with you?

I just showed you an example of where rcu_read_lock() needs to be a
compiler barrier, and then you make incoherent noises about
WRITE_ONCE() that do not even exist in that example.

Forget about your READ_ONCE/WRITE_ONCE theories. Herbert already
showed code that doesn't have those accessors, so reality doesn't
match your fevered imagination.

And sometimes it's not even possible, since you can't do a bitfield
access, for exmaple, with READ_ONCE().

> We can of course put them back in,

Stop the craziness. It's not "we can". It is a "we will".

So I will add that barrier, and you need to stop arguing against it
based on specious theoretical arguments that do not match reality. And
we will not ever remove that barrier again. Herbert already pointed to
me having to do this once before in commit 386afc91144b ("spinlocks
and preemption points need to be at least compiler barriers"), and
rcu_read_lock() clearly has at a minimum that same preemption point
issue.

                     Linus

--===============2471490512968959057==--

