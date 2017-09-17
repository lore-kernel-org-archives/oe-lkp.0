Content-Type: multipart/mixed; boundary="===============5316053765003270968=="
MIME-Version: 1.0
From: Joel Fernandes <joelaf@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] 6d46bd3d97: netperf.Throughput_tps -11.3% regression
Date: Sat, 16 Sep 2017 23:42:33 -0700
Message-ID: <CAJWu+orNk7vnZRi5gdLOQxjBS4kKZ3vSkp1-=xOd+qMaiG08VA@mail.gmail.com>
In-Reply-To: <1505404603.12821.19.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5316053765003270968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rik,

On Thu, Sep 14, 2017 at 8:56 AM, Rik van Riel <riel@redhat.com> wrote:
> On Sun, 2017-09-10 at 23:32 -0700, Joel Fernandes wrote:
>>
>> To make the load check more meaningful, I am thinking if using
>> wake_affine()'s balance check is a better thing to do than the
>> 'nr_running < 2' check I used in this patch. Then again, since commit
>> 3fed382b46baac ("sched/numa: Implement NUMA node level
>> wake_affine()",
>> wake_affine() doesn't do balance check for CPUs within a socket so
>> probably bringing back something like the *old* wake_affine that
>> checked load between different CPUs within a socket is needed to
>> avoid
>> a potentially disastrous sync decision?
>
> This is because regardless of whether or not we did
> an affine wakeup, the code called select_idle_sibling
> within that socket, anyway.
>
> In other words, the behavior for within-socket
> wakeups was not substantially different with or
> without an affine wakeup.
>
> All that changed is which CPU select_idle_sibling
> starts searching at, and that only if the woken
> task's previous CPU is not idle.

Yes I understand. However with my 'strong sync' patch, such a
balancing check could be useful which is what I was trying to do in a
different way in my patch - but it could be that my way is not good
enough and potentially the old wake_affine check could help here - I
thought of spending some time next week after LPC travel to
reintroduce the old wake_affine and monitor this signal with some
tracing for the regressing netperf usecase.

>>  The commit I refer to was
>> added with the reason that select_idle_sibling was selecting cores
>> anywhere within a socket, but with my patch we're more specifically
>> selecting the waker's CPU on passing the sync flag. Could you share
>> your thoughts about this?
>
> On systems with SMT, it may make more sense for
> sync wakeups to look for idle threads of the same
> core, than to have the woken task end up on the
> same thread, and wait for the current task to stop
> running.

I am ok with additionally doing an select_idle_smt for the SMT cases.
However Mike shows that it doesn't necessarily cause a performance
improvement. But if there is consensus on checking for idle SMT
threads, then I'm Ok with doing that.

>
> "Strong sync" wakeups like you propose would also
> change the semantics of wake_wide() and potentially
> other bits of code...
>

I understand, I am not very confident that wake_wide does the right
thing anyway. Atleast for Android, wake_wide doesn't seem to mirror
the most common usecase of display pipeline well. It seems that we
have cases where the 'flip count' is really high and causes wake_wide
all the time and sends us straight to the wake up slow path causing
regressions in Android benchmarks.

Atleast with the sync flag, the caller provides a meaningful
indication and I think making that flag stronger / more preferred than
wake_wide makes sense from that perspective since its not a signal
that's guessed, but is rather an input request.

thanks,

-Joel

--===============5316053765003270968==--

