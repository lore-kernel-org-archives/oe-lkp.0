Content-Type: multipart/mixed; boundary="===============8715416315290837136=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] c3a340f7e7: invalid_opcode:#[##]
Date: Tue, 30 Jun 2020 16:35:04 +0200
Message-ID: <20200630143504.GI117543@hirez.programming.kicks-ass.net>
In-Reply-To: <20200630140231.GW4817@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8715416315290837136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 04:02:31PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 30, 2020 at 03:55:05PM +0200, Rasmus Villemoes wrote:
> =

> > > Consistently so with GCC-4.9. Any other GCC I tried does the sane thi=
ng.
> > =

> > Does that include gcc 4.8, or is it only "anything newer than 4.9"?
> =

> It includes 4.8 :-)
> =

> > so the section it was put in has an alignment of 64. The generated
> > assembly is indeed
> > =

> >         .globl  fair_sched_class
> >         .section        __fair_sched_class,"a",@progbits
> >         .align 64
> > =

> > /me goes brew coffee
> =

> Right.. so I now have the below patch, and with that I get:
> =

> 62931: c1e62c20     0 NOTYPE  GLOBAL DEFAULT    2 __begin_sched_classes
> 65736: c1e62e40   128 OBJECT  GLOBAL DEFAULT    2 stop_sched_class
> 71813: c1e62cc0   128 OBJECT  GLOBAL DEFAULT    2 fair_sched_class
> 78689: c1e62c40   128 OBJECT  GLOBAL DEFAULT    2 idle_sched_class
> 78953: c1e62ec0     0 NOTYPE  GLOBAL DEFAULT    2 __end_sched_classes
> 79090: c1e62d40   128 OBJECT  GLOBAL DEFAULT    2 rt_sched_class
> 79431: c1e62dc0   128 OBJECT  GLOBAL DEFAULT    2 dl_sched_class
> =

> =

> Which has me stumped on __begin_sched_classes being on a 32byte edge
> (and crashes differently due to that).

OK, when I look at defconfig-build/arch/x86/kernel/vmlinux.lds I get:

. =3D ALIGN(32); *(__dummy_sched_class) __begin_sched_classes =3D .;

So I'm thinking the GCC_VERSION thing works for sched.h but not for
arch//x86/kernel/vmlinux.lds.S, lovely. Let me try and figure out why.
--===============8715416315290837136==--

