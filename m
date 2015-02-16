Content-Type: multipart/mixed; boundary="===============7898173802784171837=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [sched] BUG: kernel boot hang
Date: Mon, 16 Feb 2015 13:34:47 -0500
Message-ID: <20150216133447.50135132@gandalf.local.home>
In-Reply-To: <20150216182235.GA20614@lerouge>
List-Id: <oe-lkp.lists.linux.dev>

--===============7898173802784171837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Feb 2015 19:22:38 +0100
Frederic Weisbecker <fweisbec@gmail.com> wrote:
 =

> Huang Ying hasn't yet reported a Tested-by but I could reproduce (with bo=
th function and function_graph tracers btw)
> and the patch fixed it.

Ah right, it's not the recursion from the function tracer that kills
us, it's the recursion from the preempt_enable_notrace() that does...

preempt_schedule_common()
  --> traced
     preempt_disable_notrace();
     preempt_enable_notrace();
     (see's NEED_RESCHED set)
	preempt_schedule_context();
	    preempt_schedule_common();
		--> traced

etc, etc till boom.

-- Steve


--===============7898173802784171837==--

