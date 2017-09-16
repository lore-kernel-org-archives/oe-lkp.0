Content-Type: multipart/mixed; boundary="===============5703916032268461456=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Sat, 16 Sep 2017 15:02:07 -0700
Message-ID: <CA+55aFyYGHnQU-YYL7o40Z1_+-a+WND8h4i8rWFeTdHs3kax5g@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.20.1709162342560.2105@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============5703916032268461456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2017 at 2:47 PM, Thomas Gleixner <tglx@linutronix.de> wro=
te:
>
> Yes and no. We get more code which uses cpumasks to store state, just like
> I did, and while a lot of the cpumask functions just work as expected a
> subset including for_each_cpu does not. That's confusing at best and I
> rather avoid the hard to debug issues on UP, which probably gets less
> testing anyway.

I certainly agree that the UP situation has changed over the years.

But I'd hate to make all those loops etc (that the compiler can
currently almost always trivially turn into trivial unconditional
non-loops) be sometrhing that ends up testing a bit and having a
conditional.

I wonder if we could have some checking mode or something that at
least makes those things easier to notice.  But I don't see a sane way
to do that statically.

Looking at that patch of yours, it seems to depend on
'watchdog_allowed_mask' having just been initialized as empty, which
is the case that doesn't work well for UP. So there isn't even any
code to trigger on, it would have to be some added warning to all
users that does something along the lines of 'WARN_ON_ONCE(cpumask !=3D
1)'

.. and then hardly anybody would run that configuration anyway.

Annoying.

              Linus

--===============5703916032268461456==--

