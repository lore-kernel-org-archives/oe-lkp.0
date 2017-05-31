Content-Type: multipart/mixed; boundary="===============9144653241539731199=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm] e2a7dcce31: kernel_BUG_at_arch/x86/mm/tlb.c
Date: Wed, 31 May 2017 08:44:30 -0400
Message-ID: <1496234670.29205.82.camel@redhat.com>
In-Reply-To: <06ab9499-0c74-f2f0-251c-57244360219f@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9144653241539731199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-05-30 at 21:05 -0700, Arjan van de Ven wrote:
> On 5/27/2017 9:56 AM, Andy Lutomirski wrote:
> > On Sat, May 27, 2017 at 9:00 AM, Andy Lutomirski <luto@kernel.org>
> > wrote:
> > > On Sat, May 27, 2017 at 6:31 AM, kernel test robot
> > > <xiaolong.ye@intel.com> wrote:
> > > > =

> > > > FYI, we noticed the following commit:
> > > > =

> > > > commit: e2a7dcce31f10bd7471b4245a6d1f2de344e7adf ("x86/mm:
> > > > Rework lazy TLB to track the actual loaded mm")
> > > > https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git
> > > > x86/tlbflush_cleanup
> > > =

> > > Ugh, there's an unpleasant interaction between this patch and
> > > intel_idle.=C2=A0=C2=A0I suspect that the intel_idle code in question=
 is
> > > either
> > > wrong or pointless, but I want to investigate further.=C2=A0=C2=A0Ing=
o, can
> > > you
> > > hold off on applying this patch?
> > =

> > I think this is what's going on: intel_idle has an optimization and
> > sometimes calls leave_mm().=C2=A0=C2=A0This is a rather expensive way of
> > working
> > around x86 Linux's fairly weak lazy mm handling.=C2=A0=C2=A0It also abu=
ses
> > the
> > whole switch_mm state machine.=C2=A0=C2=A0In particular, there's no gua=
rantee
> > that the mm is actually lazy at the time.=C2=A0=C2=A0The old code didn't
> > care,
> > but the new code can oops.
> > =

> > The short-term fix is to just reorder the code in leave_mm() to
> > avoid the OOPS.
> =

> fwiw the reason the code is in intel_idle is to avoid tlb flush IPIs
> to idle cpus,
> once the cpu goes into a deep enough idle state.=C2=A0=C2=A0In the current
> linux code,
> that is done by no longer having the old TLB live on the CPU, by
> switching to the neutral
> kernel-only set of tlbs.
> =

> If your proposed changes do that (avoid the IPI/wakeup), great!
> (if not, there should be a way to do that)

My patch moves the atomic write from the intel idle
path into the tlb invalidation path, and gets rid of
the IPI.

Shouldn't be too hard to get that on top of Andy's
patches, once those have settled.

https://patchwork.kernel.org/patch/9307541/


--===============9144653241539731199==--

