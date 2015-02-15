Content-Type: multipart/mixed; boundary="===============5153081391703514638=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [sched] BUG: kernel boot hang
Date: Sun, 15 Feb 2015 13:18:07 -0500
Message-ID: <20150215131807.30c1808c@grimm.local.home>
In-Reply-To: <20150215154620.GC8838@lerouge>
List-Id: <oe-lkp.lists.linux.dev>

--===============5153081391703514638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Feb 2015 16:46:22 +0100
Frederic Weisbecker <fweisbec@gmail.com> wrote:

> On Sun, Feb 15, 2015 at 03:43:28PM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > commit a18b5d01819235629289212ad428a5ee2b40f0d9 ("sched: Fix missing pr=
eemption opportunity")

Looks to be something new (not in my tree).

/me checks out linux-next

> =

> Huang,
> =

> Can you please test the following patch and check if it still crashes?
> =

> Thanks.
> =

> =

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c017a5f..a6d4d6c 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2879,7 +2879,7 @@ void __sched schedule_preempt_disabled(void)
>  	preempt_disable();
>  }
>  =

> -static void preempt_schedule_common(void)
> +static void __sched notrace preempt_schedule_common(void)
>  {
>  	do {
>  		preempt_count_add(PREEMPT_ACTIVE);

Ah, since I added better recursion protection code in function tracer
this didn't break that. But unfortunately, function graph tracer
doesn't have that protection.

If it traces between preempt_schedule() and where it sets
PREEMPT_ACTIVE, it can indeed go into an infinite recursion. Yeah,
preempt_schedule_common() should be notrace, at least until we change
function_graph to have that recursion protection.

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve


--===============5153081391703514638==--

