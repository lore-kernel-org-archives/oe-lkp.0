Content-Type: multipart/mixed; boundary="===============2653111189265493487=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Sat, 16 Sep 2017 10:55:53 -0700
Message-ID: <CA+55aFywjZemU8rN-C5uL3C-0CjQmKz3cfW5u3dJSaZtJJE_7A@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.20.1709161850010.2105@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============2653111189265493487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2017 at 10:35 AM, Thomas Gleixner <tglx@linutronix.de> wr=
ote:
>
> Don't bother. I found it already. On UP we have:
>
> #define for_each_cpu(cpu, mask)               \
>         for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
>
> which is a total fail as it breaks any code which uses for_each_cpu() or
> any of the other variants on UP by assuming that all cpumask have bit 0
> set.

It's fairly fundamental. UP assumes that all CPU masks are always that
"one CPU set". Not just here - everywhere.

I guess we could somehow try to move away from that, but really, the
assumption of fixed masks ends up simplifying the code generation a
lot, so it made tons of sense back when UP was a primary target.

So it's an approach that is somewhat historical, but I'm not sure it's
worth re-visiting that old decision. People should simply not expect
to traverse over empty masks in anything that is UP.

So I suspect your perf fix is the right one, and maybe we could/should
just make people more aware of the empty cpumask issue with UP.

            Linus

--===============2653111189265493487==--

