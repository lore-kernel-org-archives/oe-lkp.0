Content-Type: multipart/mixed; boundary="===============3590297211616509977=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 94b1b03b51: hackbench.throughput -20% regression
Date: Mon, 24 Jul 2017 08:20:02 -0700
Message-ID: <CALCETrWJp1zS22SuY4j0z-sy+nvhbH3j_bF4ptEL=B6P4axD7g@mail.gmail.com>
In-Reply-To: <20170724092819.os6uomz4i2et47ul@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3590297211616509977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 2:28 AM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Peter Zijlstra <peterz@infradead.org> wrote:
>
>> On Mon, Jul 24, 2017 at 11:09:33AM +0200, Ingo Molnar wrote:
>> >
>> > * Andy Lutomirski <luto@kernel.org> wrote:
>> >
>> > > AFAICT this is a regression running hackbench with 56 * 40 threads on
>> > > 112 CPUs.  The performance numbers are odd -- it looks like only 10
>> > > CPUs worth of work are happening, so the system is 90% or so idle.
>> > > I'm not sure why.
>> > >
>> > > I suspect this is hitting the nasty case that Rik thought of: on
>> > > transition to and from idle, we're doing cpumask_clear() and
>> > > cpumask_set() respecitvely on a per-mm bitmask, causing false sharin=
g.
>> > > This is merely a worsening of an existing problem that we do mmgrab()
>> > > and mmdrop() in the scheduler to keep track of the reference counts.
>> > > IOW our performance is generally awful on NUMA or other big systems
>> > > with mms with many threads on many CPUs that are constantly going id=
le
>> > > and un-idle.
>> > >
>> > > Do we care for the purpose of the PCID series?  This is a bit of a
>> > > weird corner case.
>> >
>> > By historical track record I'd take hackbench regressions with a grain=
 of salt
>> > (it's a very timing sensitive benchmark and it's also very noisy), unl=
ess you can
>> > reproduce it locally and robustly.
>>
>> The 'thread mode' numbers are actually fairly stable, and this is what
>> 0-day uses. We've fixed a bunch of these recently, see for example:
>>
>>   1ad3aaf3fcd2 ("sched/core: Implement new approach to scale select_idle=
_cpu()")
>>
>> And that fixed real workload visible regressions as well.
>>
>> But yes, hackbench is a bit of a weird thing, but most times it ends up
>> someone somewhere gets hurt if we break it.
>
> Ok.
>
> BTW., don't we also have this performance problem when context switching =
between
> threads of the same MM - mmgrab() of the next MM (which is the same as the
> current), and then mmdrop()-ing it a few (hundred) cycles later?
>
> I.e. this scalability limit does not only affect idle switching (which ca=
n be
> argued to be secondary), but fully utilized systems as well (which is not=
 a
> secondary concern at all).

Yes, but the latter case at least has no regression, since the
behavior is identical with and without the patch.

> BTW., we could eliminate the MM cpumask twiddling with the following chan=
ge in its
> definition:
>
>  - don't clear the cpumask in the context switch path
>
>  - only clear the cpumask if a task is explicitly migrated from one CPU t=
o another
>    and the current task on the old CPU has a different MM
>
> this should not affect correctness (I think ...) - it might create additi=
onal TLB
> flushes in some patterns where threads that gone idle for a long time, bu=
t it
> should auto-clear pretty well on busy systems due to the migration rule
> (statistically).
>
> This should get rid of this high rate of cpumask operations.
>
> Doing this only makes sense if we manage to get rid of the mmgrab()/mmdro=
p() dance
> over context switches that is.

Just by itself, this would kill performance if there's a task with
many threads that are mostly all idle (like your average program with
a thread pool, one thread per cpu, that only becomes non-idle when it
has work to do) that periodically requires a flush: we'll IPI all
CPUs.  That scales even worse than the problematic atomic ops here.
We could plausibly work around this by reading all the new
cpu_tlbstate stuff to figure out which CPUs really need flushes, but
that's not wonderful from a scaling PoV either.

I'd rather see an attempt to make the data structures scale for real.
Maybe we could split it into a mask and refcounts per NUMA node, but
allocating those data structures could be ugly.  We could also
plausibly do something like this per cpu:

struct cpu_mm_user {
  struct cpu_mm_user *prev;
  struct cpu_mm_user *next;
  struct mm_struct *mm;
  int cpu;
};

and then, for each mm, store the head of a doubly-linked list of these
things.  We'd have to manipulate the list with nasty atomics and maybe
even nasty cmpxchg16b instructions, but it could make the access
pattern much friendlier.

Other ideas welcome.

--===============3590297211616509977==--

