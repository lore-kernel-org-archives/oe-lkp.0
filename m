Content-Type: multipart/mixed; boundary="===============3016699989416838006=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: 7457c0da02 [ 0.733186] BUG: KASAN: unknown-crash in unwind_next_frame
Date: Mon, 08 Jul 2019 12:07:12 -0500
Message-ID: <20190708170712.kxlnz5fid7pkd3uw@treble>
In-Reply-To: <18ae1fd5-a4fb-7f3f-6ae6-cfa2b15c312b@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3016699989416838006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 08, 2019 at 07:43:18PM +0300, Andrey Ryabinin wrote:
> =

> =

> On 7/8/19 1:55 PM, Peter Zijlstra wrote:
> > On Mon, Jul 08, 2019 at 08:47:29AM +0800, kernel test robot wrote:
> =

> =

> =

> >>
> >> [    0.726834] CPU: GenuineIntel Intel Core Processor (Haswell) (famil=
y: 0x6, model: 0x3c, stepping: 0x1)
> >> [    0.728007] Spectre V2 : Spectre mitigation: kernel not compiled wi=
th retpoline; no mitigation available!
> >> [    0.728009] Speculative Store Bypass: Vulnerable
> >> [    0.729969] MDS: Vulnerable: Clear CPU buffers attempted, no microc=
ode
> >> [    0.732269] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [    0.733186] BUG: KASAN: unknown-crash in unwind_next_frame+0x3f6/0x=
490
> > =

> > This is a bit of a puzzle; I'm not sure what KASAN is trying to tell us
> > here, also isn't the unwinder expected to go off into the weeds at times
> > and 'expected' to cope with that? I'm also very much unsure how the
> > fingered commit would lead to this, the below splat is in a lockdep
> > unwind from completely unrealted code (pageattr).
> > =

> > Josh, Andrey, any clues?
> > =

> >> [    0.734146] Read of size 8 at addr ffffffff84007db0 by task swapper=
/0
> =

> ....
> >> [    0.739959] =

> >> [    0.739959] Memory state around the buggy address:
> >> [    0.739959]  ffffffff84007c80: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 f1 f1 f1
> >> [    0.739959]  ffffffff84007d00: f1 00 00 00 00 00 00 00 00 00 f2 f2 =
f2 f3 f3 f3
> >> [    0.739959] >ffffffff84007d80: f3 79 be 52 49 79 be 00 00 00 00 00 =
00 00 00 f1
> =

> =

> This looks like KASAN's shadow memory corruption, someone somehow
> corrupted [((0xffffffff84007d88 >> 3) + 0xdffffc0000000000),
> ((0xffffffff84007db0 >> 3) + 0xdffffc0000000000)] which contains "79
> be 52 49 79 be" now, instead of zeroes (most likely it should be
> zeroes).

I recreated with the attached script.  It looks like the unwinder
encountered a corrupt frame pointer on the stack.  The unwinder thought
it was an "encoded" pt_regs pointer because it had bit 1 set, so it then
tried to read the embedded pt_regs (which wasn't actually there) on the
same stack, apparently causing the kasan error.

So, IIUC, the unwinder isn't trying to access memory beyond the stack
page, it's just trying to access memory in the middle of a stack frame,
which KASAN is flagging.  So the unwinder bounds checks don't seem to be
broken.  It isn't doing a "bad" memory access per se.

However... what I can't yet explain is why the original unwind failed,
but then the KASAN unwind succeeded.  With a corrupt frame pointer, the
KASAN unwind should have stopped early and fallen back to the "guess"
unwind, so the KASAN unwind should have had a lot of '?' entries.

So something doesn't quite add up, but at first glance it does seem to
be some kind of stack corruption, and the call emulation code is looking
quite guilty.

I can dig more into it later today.

-- =

Josh

--===============3016699989416838006==--

