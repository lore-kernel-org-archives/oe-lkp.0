Content-Type: multipart/mixed; boundary="===============4846324295577640179=="
MIME-Version: 1.0
From: Joel Fernandes <joelaf@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] 6d46bd3d97: netperf.Throughput_tps -11.3% regression
Date: Sun, 24 Sep 2017 16:46:06 -0700
Message-ID: <CAJWu+orAycWQgCOiDaW62Du08hYDRs+EhGMEKD_+F1RfF_P=GA@mail.gmail.com>
In-Reply-To: <1505712615.20558.127.camel@gmx.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4846324295577640179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Sun, Sep 17, 2017 at 10:30 PM, Mike Galbraith <efault@gmx.de> wrote:
> On Sun, 2017-09-17 at 14:41 -0700, Joel Fernandes wrote:
>> Hi Mike,
>>
>> On Sun, Sep 17, 2017 at 9:47 AM, Mike Galbraith <efault@gmx.de> wrote:
>> > On Sat, 2017-09-16 at 23:42 -0700, Joel Fernandes wrote:
>> >>
>> >> Yes I understand. However with my 'strong sync' patch, such a
>> >> balancing check could be useful which is what I was trying to do in a
>> >> different way in my patch - but it could be that my way is not good
>> >> enough and potentially the old wake_affine check could help here
>> >
>> > Help how?  The old wake_affine() check contained zero concurrency
>> > information, it served to exclude excessive stacking, defeating the
>> > purpose of SMP.  A truly synchronous wakeup has absolutely nothing to
>> > do with load balance in the general case: you can neither generate nor
>> > cure an imbalance by replacing one (nice zero) task with another.  The
>> > mere existence of a load based braking mechanism speaks volumes.
>>
>> This is the part I didn't get.. you said "neither generate an
>> imbalance", it is possible that a CPU with a high blocked load but
>> just happen to be running 1 task at the time and did a sync wake up
>> for another task. In this case dragging the task onto the waker's CPU
>> might hurt it since it will face more competition than if it were
>> woken up on its previous CPU which is possibly lighty loaded than the
>> waker's CPU?
>
> Sure, a preexisting imbalance, but what does that have to do with
> generic pass the baton behavior, and knowing whether pull will result
> in a performance win or loss?  In the overloaded and imbalanced case, a
> lower load number on this/that CPU means little in and of itself wrt
> latency expectations... the wakee may or may not be next in line, may
> or may not be able to cut the line (preempt).

In my patch, I used nr_running =3D=3D 1, so if waker slept immediately,
then wakee would be next in line. I guess this is the part I
misunderstood - that I assumed for all cases the sync waker sleeps
immediately, even though it does in the binder use cases. We have
control over the binder userspace bits that sleep immediately since
its part of the framework - user apps don't decide whether to stay
awake or not - the framework will put them to sleep since any progress
can happen only after waiting for the transaction to return. However
this assumption may not be true for other users of the regular sync
flag as you pointed :-/.

Just for completeness sake, I wanted to mention how we have a patch
similar to this on the Pixel product and works real well for all the
usecases we care about:
https://android.googlesource.com/kernel/msm.git/+/android-msm-marlin-3.18-o=
reo-r6/kernel/sched/fair.c#5678
It will probably not work well if someone tried to run netperf or
other usecases where waker doesn't sleep immediately and is definitely
not mainlinable considering the wreckage in $SUBJECT.

>
>> Also the other thing I didn't fully get is why is concurrency a
>> discussion point here, in this case A wakes up B and goes to sleep,
>> and then B wakes up A. They never run concurrently. Could you let me
>> know what I am missing?
>
> If waker does not IMMEDIATELY sleep, and you wake CPU affine, you toss
> the time interval between wakeup and context switch out the window, the
> wakee could have already been executing elsewhere when the waker gets
> around to getting the hell out of the way.
>
> The point I'm belaboring here is that we had that load check and more,
> and it proved insufficient.  Yeah, pipe-test absolutely loves running
> on one CPU, but who cares, pipe-test is an overhead measurement tool,
> NOT a benchmark, those try to emulate the real world.

Ok.

> Hell, take two large footprint tasks, and let them exchange data
> briefly via pipe.. what would make it a wonderful idea to pull these
> tasks together each and every time they did that?  Because pipe-test
> can thus play super fast ping-pong with itself?  Obviously not.

Yes, I agree with you.

[..]
>>
>> >> > "Strong sync" wakeups like you propose would also
>> >> > change the semantics of wake_wide() and potentially
>> >> > other bits of code...doesn't make much sense for
>> >> >
>> >>
>> >> I understand, I am not very confident that wake_wide does the right
>> >> thing anyway. Atleast for Android, wake_wide doesn't seem to mirror
>> >> the most common usecase of display pipeline well. It seems that we
>> >> have cases where the 'flip count' is really high and causes wake_wide
>> >> all the time and sends us straight to the wake up slow path causing
>> >> regressions in Android benchmarks.
>> >
>> > Hm.  It didn't pull those counts out of the vacuum, it measured them.
>> >  It definitely does not force Android into the full balance path, that
>> > is being done by Android developers, as SD_BALANCE_WAKE is off by
>> > default.  It was briefly on by default, but was quickly turned back off
>> > because it... induced performance regressions.
>> >
>> > In any case, if you have cause to believe that wake_wide() is causing
>> > you grief, why the heck are you bending up the sync hint?
>>
>> So its not just wake_wide causing the grief, even select_idle_sibling
>> doesn't seem to be doing the right thing. We really don't want to wake
>> up a task on an idle CPU if the current CPU is a better candidate.
>
> That is the nut, defining better candidate is not so trivial.  Lacking
> concrete knowledge (omniscience?), you're always gambling, betting on
> concurrency potential existing is much safer than betting against it if
> your prime directive is to maximize utilization.

Ok so I think then reusing the sync flag for binder in mainline
doesn't make much sense and we could define a new flag that indicates
the waker will sleep immediately and call it WF_HSYNC (as in hard
sync) - since in the binder case we have this knowledge that waker is
going to sleep waiting for the transaction to finish.. I think the
mistake I did was trying to change the semantic of the original sync
flag which cannot assume that the waker sleeps immediately.

>> Binder microbenchmarks should that (as you can see in the results in
>> this patch) it performs better to wake up on the current CPU (no wake
>> up from idle latency on a sibling etc). Perhaps we should fix
>> select_idle_sibling to also consider latency of CPU to come out of
>> idle?
>
> That would add complexity.  If you're gonna do that, you may as well go
> the extra mile, nuke it, and unify the full balance path instead.

Ok, I agree its not a good idea to make the fast path any slower just for t=
his.

>>  Using the sync hint was/is a way on the product kernel to
>> prevent both these paths. On current products, sync is ignored though
>> if the system is in an "overutilized" state (any of the CPUs are more
>> than 80% utilized) but otherwise the sync is used as a hard flag. This
>> is all probably wrong though - considering the concurrency point you
>> brought up..
>
> My experience with this space was that it's remarkably easy to wreck
> performance, why I was inspired to bang on podium with shoe.  I'm not
> trying to discourage your explorations, merely passing along a well
> meant "Danger Will Robinson".

Thanks for the guidance, and sharing your knowledge/experience about this,

regards,

- Joel

--===============4846324295577640179==--

