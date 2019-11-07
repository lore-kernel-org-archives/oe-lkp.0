Content-Type: multipart/mixed; boundary="===============6534532552249664609=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] 10e7071b2f: BUG:kernel_NULL_pointer_dereference, address
Date: Thu, 07 Nov 2019 15:46:39 +0100
Message-ID: <20191107144639.GB4114@hirez.programming.kicks-ass.net>
In-Reply-To: <d94e549d-04de-5b23-c4e0-6c161ec8213e@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6534532552249664609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2019 at 01:51:47PM +0000, Valentin Schneider wrote:
> Using that, the fail is on:
> =

> 	if (need_pull_dl_task(rq, prev)) {
> =

> Which is most likely explained by the above call ending up doing a =

> =

>   dl_prio(prev->prio);
> =

> which doesn't play well with =

> =

>   class->pick_next_task(rq, NULL, NULL);
> =

> =

> Now, this is no longer an issue (I think) with the rest of Peter's series,
> since the above deref is gone with
> =

> 67692435c411 ("sched: Rework pick_next_task() slow-path")
> =

> It would be interesting to know whether LKP found this on a mainline kern=
el
> and bisected it down, or if it stumbled on this while bisecting something
> else.

That seems pausible indeed.
--===============6534532552249664609==--

