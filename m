Content-Type: multipart/mixed; boundary="===============5666628711190830438=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched] Out of memory: Kill process 2999 (rc) score 9 or sacrifice child
Date: Sat, 09 Aug 2014 21:24:17 +0200
Message-ID: <20140809192417.GA32704@redhat.com>
In-Reply-To: <20140809184616.GQ9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5666628711190830438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/09, Peter Zijlstra wrote:
>
> That would suggest we're failing to do the TASK_DEAD thing properly, and
> ARGH! bloody obvious why, see the this_rq() comment right before the
> finish_task_switch() call in context_switch().

Heh ;) and a similar comment in __schedule() after context_switch().

rq->dead_task or something similar should work I guess, but i should be
nullified before finish_lock_switch()...

Oleg.


--===============5666628711190830438==--

