Content-Type: multipart/mixed; boundary="===============0700545885763946437=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Sat, 04 Oct 2014 10:44:59 +0200
Message-ID: <20141004084459.GU10583@worktop.programming.kicks-ass.net>
In-Reply-To: <20141003175654.GA14952@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0700545885763946437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2014 at 07:56:54PM +0200, Oleg Nesterov wrote:
> Or. perhaps we can change wait_woken
> =

> 	-	set_current_state(mode);
> 	+	if (mode)
> 	+		set_current_state(mode);
> =

> =

> then rfcomm_run() can do
> =

> 	for (;;) {
> 		rfcomm_process_sessions();
> =

> 		set_current_state(TASK_INTERRUPTIBLE);
> 		if (kthread_should_stop())
> 			break;
> 		wait_woken(0);
> 	}
> =

> Or perhaps we can split wait_woken() into 2 helpers,
> =

> 	static inline long wait_woken(wq, mode, timeout)
> 	{
> 		set_current_state(mode);
> 		schedule_woken(wq, timeout); // does the rest
> 	}
> =

> to avoid "mode =3D=3D 0" hack; rfcomm_run() should use schedule_woken().
> =

> What do you think?

Clever, I'm not entirely sure which I prefer, I think I'm leaning
towards the first one with the !mode hack, but let me sit on that for a
little while.

--===============0700545885763946437==--

