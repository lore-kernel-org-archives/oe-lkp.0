Content-Type: multipart/mixed; boundary="===============8897294282455464494=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 94b1b03b51: hackbench.throughput -20% regression
Date: Tue, 25 Jul 2017 11:35:15 +0200
Message-ID: <20170725093515.ho5fiwohepti365y@gmail.com>
In-Reply-To: <CALCETrWJp1zS22SuY4j0z-sy+nvhbH3j_bF4ptEL=B6P4axD7g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8897294282455464494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Andy Lutomirski <luto@kernel.org> wrote:

> > BTW., we could eliminate the MM cpumask twiddling with the following ch=
ange in its
> > definition:
> >
> >  - don't clear the cpumask in the context switch path
> >
> >  - only clear the cpumask if a task is explicitly migrated from one CPU=
 to another
> >    and the current task on the old CPU has a different MM
> >
> > this should not affect correctness (I think ...) - it might create addi=
tional TLB
> > flushes in some patterns where threads that gone idle for a long time, =
but it
> > should auto-clear pretty well on busy systems due to the migration rule
> > (statistically).
> >
> > This should get rid of this high rate of cpumask operations.
> >
> > Doing this only makes sense if we manage to get rid of the mmgrab()/mmd=
rop() dance
> > over context switches that is.
> =

> Just by itself, this would kill performance if there's a task with
> many threads that are mostly all idle (like your average program with
> a thread pool, one thread per cpu, that only becomes non-idle when it
> has work to do) that periodically requires a flush: we'll IPI all
> CPUs.  That scales even worse than the problematic atomic ops here.

So, that could be improved by adding a small additional twist, by clearing =
the mat =

from the first IPI: that IPI, being a slow path in itself, would notice tha=
t no =

flushing is required and could do the clearing.

I.e. this would be more of a 'delayed clearing' operation than a 'no cleari=
ng' =

operation.

I.e. if done reasonably smartly I don't think this optimization would regre=
ss =

typical under-utilized thread pools in a measurable fashion. (Although numb=
ers =

would be required to prove this.)

Thanks,

	Ingo

--===============8897294282455464494==--

