Content-Type: multipart/mixed; boundary="===============1734329750713249137=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: 7457c0da02 [ 0.733186] BUG: KASAN: unknown-crash in unwind_next_frame
Date: Mon, 08 Jul 2019 15:36:21 +0200
Message-ID: <20190708133621.GJ3402@hirez.programming.kicks-ass.net>
In-Reply-To: <CACT4Y+aJYy-aRCAArTEsTKSz1NPE2JONk68P67qPb=7iun3uwQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1734329750713249137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2019 at 01:04:18PM +0200, Dmitry Vyukov wrote:
> On Mon, Jul 8, 2019 at 12:55 PM Peter Zijlstra <peterz@infradead.org> w=
rote:
> > On Mon, Jul 08, 2019 at 08:47:29AM +0800, kernel test robot wrote:

> > >     x86/alternatives: Add int3_emulate_call() selftest

> > > [    0.726834] CPU: GenuineIntel Intel Core Processor (Haswell) (fami=
ly: 0x6, model: 0x3c, stepping: 0x1)
> > > [    0.728007] Spectre V2 : Spectre mitigation: kernel not compiled w=
ith retpoline; no mitigation available!
> > > [    0.728009] Speculative Store Bypass: Vulnerable
> > > [    0.729969] MDS: Vulnerable: Clear CPU buffers attempted, no micro=
code
> > > [    0.732269] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [    0.733186] BUG: KASAN: unknown-crash in unwind_next_frame+0x3f6/0=
x490
> >
> > This is a bit of a puzzle; I'm not sure what KASAN is trying to tell us
> > here, also isn't the unwinder expected to go off into the weeds at times
> > and 'expected' to cope with that? I'm also very much unsure how the
> > fingered commit would lead to this, the below splat is in a lockdep
> > unwind from completely unrealted code (pageattr).
> >
> > Josh, Andrey, any clues?
> =

> +kasan-dev(a)googlegroups.com
> =

> Frame pointer unwinder is supposed to be precise for the current task,
> it should not touch random memory. This is thoroughly tested. If we
> start giving up on this property, we will open door for lots of bugs.
> Don't know about ORC, I guess it also meant to be precise, but we just
> never stressed it.
> I don't see what unwinder is involved here.

The config that came with had:

  CONFIG_UNWINDER_FRAME_POINTER=3Dy

So that should, according to what you say, be solid.

Now, the fingered commit will unconditionally trigger the idtentry
create_gap logic; and since this splat is *right* after
alternative_instructions(), which does the int3_selftest(), this could
maybe indicate some stack corruption.

	check_bugs()
	  alternative_instructions()
	    int3_selftest();
	    stop_nmi()
	    apply_aternatives()
	    ...
	    restart_nmi()
	  set_memory_4k()
	    ...
	      *SPLAT*

Still, what does KASAN want to tell us here? AFAICT there's 2 separate
conditions under which it states "unknown-crash", and I'm not sure I
understand either one of them. In one case the memory has shadow memory,
the other not.

--===============1734329750713249137==--

