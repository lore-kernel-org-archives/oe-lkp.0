Content-Type: multipart/mixed; boundary="===============5832782185356785045=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86/entry_32] aa93e2ad74: BUG:soft_lockup-CPU##stuck_for#s![systemd-logind:#]
Date: Wed, 12 Jan 2022 11:25:53 +0100
Message-ID: <Yd6ssarpDknV1r9z@hirez.programming.kicks-ass.net>
In-Reply-To: <Yd4u2rVVSdpEpwwM@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5832782185356785045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 01:28:58AM +0000, Sean Christopherson wrote:
> On Tue, Jan 11, 2022, Peter Zijlstra wrote:
> > On Thu, Jan 06, 2022 at 04:35:23PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed the following commit (built with clang-14):
> > > =

> > > commit: aa93e2ad7464ffb90155a5ffdde963816f86d5dc ("x86/entry_32: Remo=
ve .fixup usage")
> > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/core
> > > =

> > > in testcase: kernel-selftests
> > > version: =

> > > with following parameters:
> > > =

> > > 	group: x86
> > > =

> > =

> > It would be very useful if this thing would also say which of the many
> > x86 selftests fails... it appears to be: ldt_gdt_32.
> > =

> > The below fixes it, but I'm still not entirely sure what the actual
> > problem is, although Andy did find a bug in that the exception handler
> > should do: *(ss:esp) =3D 0, adding ss-base (using insn_get_seg_base())
> > doesn't seem to cure things.
> =

> Because I was curious...
> =

> The issue is that PARANOID_EXIT_TO_KERNEL_MODE in the handle_exception_re=
turn
> path overwrites the entry stack data with the task stack data, restoring =
the "bad"
> segment value.

Oh gawd... that's terrible, and yes, that now makes perfect sense.

However did you find that?
--===============5832782185356785045==--

