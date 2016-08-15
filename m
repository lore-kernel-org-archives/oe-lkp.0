Content-Type: multipart/mixed; boundary="===============8290703405002253850=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 08:22:11 +1000
Message-ID: <20160815222211.GA19025@dastard>
In-Reply-To: <CA+55aFxp+rLehC8c157uRbH459wUC1rRPfCVgvmcq5BrG9gkyg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8290703405002253850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2016 at 10:12:20PM -0700, Linus Torvalds wrote:
> On Aug 14, 2016 10:00 PM, "Dave Chinner" <david@fromorbit.com> wrote:
> >
> > > What does it say if you annotate that _raw_spin_unlock_irqrestore()
> function?
> > ....
> >        =C2=BF
> >        =C2=BF    Disassembly of section load0:
> >        =C2=BF
> >        =C2=BF    ffffffff81e628b0 <load0>:
> >        =C2=BF      nop
> >        =C2=BF      push   %rbp
> >        =C2=BF      mov    %rsp,%rbp
> >        =C2=BF      movb   $0x0,(%rdi)
> >        =C2=BF      nop
> >        =C2=BF      mov    %rsi,%rdi
> >        =C2=BF      push   %rdi
> >        =C2=BF      popfq
> >  99.35 =C2=BF      nop
> =

> Yeah, that's a good disassembly of a non-debug spin unlock, and the symbo=
ls
> are fine, but the profile is not valid. That's an interrupt point, right
> after the popf that enables interiors again.
> =

> I don't know why 'perf' isn't working on your machine, but it clearly
> isn't.
> =

> Has it ever worked on that machine?

It's working the same as it's worked since I started using it many
years ago.

> What cpu is it?

Intel(R) Xeon(R) CPU E5-4620 0 @ 2.20GHz

> Are you running in some
> virtualized environment without performance counters, perhaps?

I've mentioned a couple of times in this thread that I'm testing
inside a VM. It's the same VM I've been running performance tests in
since early 2010. Nobody has complained that the profiles I've
posted are useless before, and not once in all that time have they
been wrong in indicating a spinning lock contention point.

i.e. In previous cases where I've measured double digit CPU usage
numbers in a spin_unlock variant, it's always been a result of
spinlock contention. And fixing the algorithmic problem that lead to
the spinlock showing up in the profile in the first place has always
substantially improved performance and scalability.

As such, I'm always going to treat a locking profile like that as
contention because even if it isn't contending *on my machine*,
that amount of work being done under a spinning lock is /way too
much/ and it *will* cause contention problems with larger machines.

> It's not actually the unlock that is expensive, and there is no contention
> on the lock (if there had been, the numbers would have been entirely
> different for the debug case, which makes locking an order of magnitude
> more expensive). All the cost of everything that happened while interrupts
> were disabled is just accounted to the instruction after they were enabled
> again.

Right, but that does not make the profile data useless, nor you
should shoot the messenger because they weren't supplied with
information you think should have been in the message. The message
still says that the majority of the overhead is in
__remove_mapping(), and it's an excessive amount of work being done
inside the tree_lock with interrupts disabled....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============8290703405002253850==--

