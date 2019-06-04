Content-Type: multipart/mixed; boundary="===============2242970726756638777=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Tue, 04 Jun 2019 09:04:55 -0700
Message-ID: <CAHk-=wgGnCw==uY8radrB+Tg_CEmzOtwzyjfMkuh7JmqFh+jzQ@mail.gmail.com>
In-Reply-To: <Pine.LNX.4.44L0.1906041026570.1731-100000@iolanthe.rowland.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2242970726756638777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2019 at 7:44 AM Alan Stern <stern@rowland.harvard.edu> wro=
te:
>
> Even if you don't think the compiler will ever do this, the C standard
> gives compilers the right to invent read accesses if a plain (i.e.,
> non-atomic and non-volatile) write is present.

Note that for the kernel, it's not like we go strictly by what the
standard says anyway.

The reason for the "read for write" thing is that obviously you
sometimes have broken architectures (*cough*alpha*cough*) that need to
do some common writes are read-maskmodify-write accesses, and for
bitfields you obviously *always* have that issue.

In general, a sane compiler (as opposed to "we just read the
standard") had better not add random reads, because people might have
some mappings be write-only when the hardware supports it.

And we do generally expect sanity from our compilers, and will add
compiler flags to disable bad behavior if required - even if said
behavior would be "technically allowed by the standard".

> (Incidentally, regardless of whether the compiler will ever do this, I
> have seen examples in the kernel where people did exactly this
> manually, in order to avoid dirtying a cache line unnecessarily.)

I really hope and expect that this is not something that the compiler ever =
does.

If a compiler turns "x =3D y" into if (x !=3D y) x =3D y" (like we do
manually at times, as you say), that compiler is garbage that we
cannot use for the kernel. It would break things like "smp_wmb()"
ordering guarantees, I'm pretty sure.

And as always, if we're doing actively stupid things, and the compiler
then turns our stupid code into something we don't expect, the
corollary is that then it's on _us_. IOW, if we do

    if (x !=3D 1) {
         ...
    }
    x =3D 1;

and the compiler goes "oh, we already checked that 'x =3D=3D 1'" and moves
that "unconditional" 'x =3D 1' into the conditional section like

    if (x !=3D 1) {
        ..
        x =3D 1;
    }

then that's not something we can then complain about.

So our expectation is that the compiler is _sane_, not that it's some
"C as assembler".  Adding spurious reads is not ok. But if we already
had reads in the code and the compiler combines them with other ops,
that's on us.

End result: in general, we do expect that the compiler turns a regular
assignment into a single plain write when that's what the code does,
and does not add extra logic over and beyond that.

In fact, the alpha port was always subtly buggy exactly because of the
"byte write turns into a read-and-masked-write", even if I don't think
anybody ever noticed (we did fix cases where people _did_ notice,
though, and we might still have some cases where we use 'int' for
booleans because of alpha issues.).

So I don't technically disagree with anything you say, I just wanted
to point out that as far as the kernel is concerned, we do have higher
quality expectations from the compiler than just "technically valid
according to the C standard".

                   Linus

--===============2242970726756638777==--

