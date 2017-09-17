Content-Type: multipart/mixed; boundary="===============0825731325179702042=="
MIME-Version: 1.0
From: Joel Fernandes <joelaf@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] 6d46bd3d97: netperf.Throughput_tps -11.3% regression
Date: Sun, 17 Sep 2017 14:41:33 -0700
Message-ID: <CAJWu+opuZm78fvftWY-TZuRtz9khiqqVnpp2e+BGtF7c0WpuLw@mail.gmail.com>
In-Reply-To: <1505666869.15333.110.camel@gmx.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0825731325179702042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Sun, Sep 17, 2017 at 9:47 AM, Mike Galbraith <efault@gmx.de> wrote:
> On Sat, 2017-09-16 at 23:42 -0700, Joel Fernandes wrote:
>>
>> Yes I understand. However with my 'strong sync' patch, such a
>> balancing check could be useful which is what I was trying to do in a
>> different way in my patch - but it could be that my way is not good
>> enough and potentially the old wake_affine check could help here
>
> Help how?  The old wake_affine() check contained zero concurrency
> information, it served to exclude excessive stacking, defeating the
> purpose of SMP.  A truly synchronous wakeup has absolutely nothing to
> do with load balance in the general case: you can neither generate nor
> cure an imbalance by replacing one (nice zero) task with another.  The
> mere existence of a load based braking mechanism speaks volumes.

This is the part I didn't get.. you said "neither generate an
imbalance", it is possible that a CPU with a high blocked load but
just happen to be running 1 task at the time and did a sync wake up
for another task. In this case dragging the task onto the waker's CPU
might hurt it since it will face more competition than if it were
woken up on its previous CPU which is possibly lighty loaded than the
waker's CPU?

Also the other thing I didn't fully get is why is concurrency a
discussion point here, in this case A wakes up B and goes to sleep,
and then B wakes up A. They never run concurrently. Could you let me
know what I am missing?

>> On systems with SMT, it may make more sense for
>> > sync wakeups to look for idle threads of the same
>> > core, than to have the woken task end up on the
>> > same thread, and wait for the current task to stop
>> > running.
>>
>> I am ok with additionally doing an select_idle_smt for the SMT cases.
>> However Mike shows that it doesn't necessarily cause a performance
>> improvement. But if there is consensus on checking for idle SMT
>> threads, then I'm Ok with doing that.
>
> select_idle_sibling() used to check thread first, that was changed to
> core first for performance reasons.

Oh I see. Ok.

>> > "Strong sync" wakeups like you propose would also
>> > change the semantics of wake_wide() and potentially
>> > other bits of code...
>> >
>>
>> I understand, I am not very confident that wake_wide does the right
>> thing anyway. Atleast for Android, wake_wide doesn't seem to mirror
>> the most common usecase of display pipeline well. It seems that we
>> have cases where the 'flip count' is really high and causes wake_wide
>> all the time and sends us straight to the wake up slow path causing
>> regressions in Android benchmarks.
>
> Hm.  It didn't pull those counts out of the vacuum, it measured them.
>  It definitely does not force Android into the full balance path, that
> is being done by Android developers, as SD_BALANCE_WAKE is off by
> default.  It was briefly on by default, but was quickly turned back off
> because it... induced performance regressions.
>
> In any case, if you have cause to believe that wake_wide() is causing
> you grief, why the heck are you bending up the sync hint?

So its not just wake_wide causing the grief, even select_idle_sibling
doesn't seem to be doing the right thing. We really don't want to wake
up a task on an idle CPU if the current CPU is a better candidate.
Binder microbenchmarks should that (as you can see in the results in
this patch) it performs better to wake up on the current CPU (no wake
up from idle latency on a sibling etc). Perhaps we should fix
select_idle_sibling to also consider latency of CPU to come out of
idle? Using the sync hint was/is a way on the product kernel to
prevent both these paths. On current products, sync is ignored though
if the system is in an "overutilized" state (any of the CPUs are more
than 80% utilized) but otherwise the sync is used as a hard flag. This
is all probably wrong though - considering the concurrency point you
brought up..

>> Atleast with the sync flag, the caller provides a meaningful
>> indication and I think making that flag stronger / more preferred than
>> wake_wide makes sense from that perspective since its not a signal
>> that's guessed, but is rather an input request.
>
> Sort of, if you disregard the history I mentioned...
>
> https://www.youtube.com/watch?v=3DYho1Eydh1mM :)

No no, definitely not disregarding anything :) - just trying to make
sense of it all (and the history). Thanks so much for sharing it and
all the current/previous discussion.

>
> Lacking solid concurrency information to base your decision on, you'll
> end up robbing Peter to pay Paul forever, you absolutely will stack
> non-synchronous tasks, inducing needless latency hits and injuring
> scalability.  We've been down that road.  $subject was a very small
> sample of what lies down this path <bang bang bang>.

Ok. That is pretty scary. I am going to spend some time first go
through all the previous emails in this and other threads on the
balance flag usages and try to work on a solution after that. I will
probably start to document somewhere all the usecases for my own
sanity :)

thanks,

- Joel

--===============0825731325179702042==--

