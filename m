Content-Type: multipart/mixed; boundary="===============0975338151210500471=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Mon, 06 Oct 2014 16:24:07 +0000
Message-ID: <20141006162109.GA29890@redhat.com>
In-Reply-To: <20141006091915.GC6758@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0975338151210500471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/06, Peter Zijlstra wrote:
>
> On Mon, Oct 06, 2014 at 02:25:09AM +0200, Oleg Nesterov wrote:
> >
> > Hmm. I specially checked Documentation/memory-barriers.txt,
> >
> >  (*) smp_mb__before_atomic();
> >  (*) smp_mb__after_atomic();
> >
> >      These are for use with atomic (such as add, subtract, increment and
> >      decrement) functions that don't return a value, especially when us=
ed for
> >      reference counting.  These functions do not imply memory barriers.
> >
> >      These are also used for atomic bitop functions that do not return a
> >      value (such as set_bit and clear_bit).
> >                     ^^^^^^^^^^^^^^^^^^^^^
> >
> > Either you or memory-barriers.txt should be fixed ;)

Heh.

> Its in there, just not explicitly. All those functions listed are
> read-modify-write ops, test_bit() is not, its just a read.

OOPS! I was hypnotized by "_bit" suffix, I guess.

Of course, of course, test_bit() must be a plain LOAD in any case, can't
understand what I was thinking about.

So in this particular case kthread_kill() needs smp_mb__AFTER_atomic(),
and "after" applies to set_bit(KTHREAD_SHOULD_STOP).

> --- a/Documentation/memory-barriers.txt
> +++ b/Documentation/memory-barriers.txt
> @@ -1594,12 +1594,9 @@ CPU from reordering them.
>   (*) smp_mb__before_atomic();
>   (*) smp_mb__after_atomic();
>
> -     These are for use with atomic (such as add, subtract, increment and
> -     decrement) functions that don't return a value, especially when use=
d for
> -     reference counting.  These functions do not imply memory barriers.
> -
> -     These are also used for atomic bitop functions that do not return a
> -     value (such as set_bit and clear_bit).
> +     These are for use with atomic/bitop (r-m-w) functions that don't re=
turn
> +     a value (eg. atomic_{add,sub,inc,dec}(), {set,clear}_bit()). These
> +     functions do not imply memory barriers.

Thanks!

Oleg.


--===============0975338151210500471==--

