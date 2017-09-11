Content-Type: multipart/mixed; boundary="===============0740645371320016906=="
MIME-Version: 1.0
From: Joel Fernandes <joelaf@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/fair] 6d46bd3d97: netperf.Throughput_tps -11.3% regression
Date: Sun, 10 Sep 2017 23:32:30 -0700
Message-ID: <CAJWu+oryGEK7=_R2AU6HaFCJcuS1DjLPgjYGLD7c_gWmGpiO=Q@mail.gmail.com>
In-Reply-To: <1505098524.18240.42.camel@gmx.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0740645371320016906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mike,
Thanks a lot for sharing the history of this.

On Sun, Sep 10, 2017 at 7:55 PM, Mike Galbraith <efault@gmx.de> wrote:
> On Sun, 2017-09-10 at 09:53 -0700, Joel Fernandes wrote:
>>
>> Anyone know what in the netperf test triggers use of the sync flag?
>
> homer:..kernel/linux-master # git grep wake_up_interruptible_sync_poll net
> net/core/sock.c:                wake_up_interruptible_sync_poll(&wq->wait=
, POLLIN | POLLPRI |
> net/core/sock.c:                        wake_up_interruptible_sync_poll(&=
wq->wait, POLLOUT |
> net/sctp/socket.c:              wake_up_interruptible_sync_poll(&wq->wait=
, POLLIN |
> net/smc/smc_rx.c:               wake_up_interruptible_sync_poll(&wq->wait=
, POLLIN | POLLPRI |
> net/tipc/socket.c:              wake_up_interruptible_sync_poll(&wq->wait=
, POLLOUT |
> net/tipc/socket.c:              wake_up_interruptible_sync_poll(&wq->wait=
, POLLIN |
> net/unix/af_unix.c:                     wake_up_interruptible_sync_poll(&=
wq->wait,
> net/unix/af_unix.c:             wake_up_interruptible_sync_poll(&u->peer_=
wait,
>
> The same as metric tons of other stuff.
>
> Once upon a time, we had avg_overlap to help decide whether to wake
> core affine or not, on top of the wake_affine() imbalance constraint,
> but instrumentation showed it to be too error prone, so it had to die.
>  These days, an affine wakeup generally means cache affine, and the
> sync hint gives you a wee bit more chance of migration near to tasty
> hot data being approved.
>
> The sync hint was born back in the bad old days, when communicating
> tasks not sharing L2 may as well have been talking over two tin cans
> and a limp string.  These days, things are oodles better, but truly
> synchronous stuff could still benefit from core affinity (up to hugely
> for very fast/light stuff) if it weren't for all the caveats that can
> lead to tossing concurrency opportunities out the window.

Cool, thanks. For this test I suspect its the other way? I think the
reason why regresses is that the 'nr_running < 2' check is too weak of
a check to prevent sync in all bad situations ('bad' being pulling a
task to a crowded CPU). Could we maybe be having a situation for this
test where if the blocked load a CPU is high (many tasks recently were
running on it and went to sleep), then the nr_running < 2  is a false
positive and in such a scenario we listened to the sync flag when we
shouldn't have?

To make the load check more meaningful, I am thinking if using
wake_affine()'s balance check is a better thing to do than the
'nr_running < 2' check I used in this patch. Then again, since commit
3fed382b46baac ("sched/numa: Implement NUMA node level wake_affine()",
wake_affine() doesn't do balance check for CPUs within a socket so
probably bringing back something like the *old* wake_affine that
checked load between different CPUs within a socket is needed to avoid
a potentially disastrous sync decision?  The commit I refer to was
added with the reason that select_idle_sibling was selecting cores
anywhere within a socket, but with my patch we're more specifically
selecting the waker's CPU on passing the sync flag. Could you share
your thoughts about this?

I will run some tracing on this netperf test and try to understand the
undesirable behavior better as well,

thanks,

-Joel

--===============0740645371320016906==--

