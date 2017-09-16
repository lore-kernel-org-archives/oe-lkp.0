Content-Type: multipart/mixed; boundary="===============1721171037283101991=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: d57108d4f6 ("watchdog/core: Get rid of the thread .."): BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
Date: Sat, 16 Sep 2017 20:12:29 +0200
Message-ID: <alpine.DEB.2.20.1709162005270.2105@nanos>
In-Reply-To: <CA+55aFywjZemU8rN-C5uL3C-0CjQmKz3cfW5u3dJSaZtJJE_7A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1721171037283101991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 16 Sep 2017, Linus Torvalds wrote:
> On Sat, Sep 16, 2017 at 10:35 AM, Thomas Gleixner <tglx@linutronix.de> =
wrote:
> >
> > Don't bother. I found it already. On UP we have:
> >
> > #define for_each_cpu(cpu, mask)               \
> >         for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
> >
> > which is a total fail as it breaks any code which uses for_each_cpu() or
> > any of the other variants on UP by assuming that all cpumask have bit 0
> > set.
> =

> It's fairly fundamental. UP assumes that all CPU masks are always that
> "one CPU set". Not just here - everywhere.
> =

> I guess we could somehow try to move away from that, but really, the
> assumption of fixed masks ends up simplifying the code generation a
> lot, so it made tons of sense back when UP was a primary target.
>
> So it's an approach that is somewhat historical, but I'm not sure it's
> worth re-visiting that old decision. People should simply not expect
> to traverse over empty masks in anything that is UP.
>
> So I suspect your perf fix is the right one, and maybe we could/should
> just make people more aware of the empty cpumask issue with UP.

Right, I just got a bit frightened as I really was not aware about that
'opmtimization' which means that so far I just was lucky not to trip over
it.

Thanks,

	tglx



--===============1721171037283101991==--

