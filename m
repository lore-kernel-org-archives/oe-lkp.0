Content-Type: multipart/mixed; boundary="===============8012853132041140267=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [net] 1fbe4b46cac: WARNING: CPU: 0 PID: 2245 at kernel/sched/core.c:7376 __might_sleep+0x8b/0xa8()
Date: Mon, 03 Aug 2015 18:49:58 +0200
Message-ID: <20150803164958.GA17910@redhat.com>
In-Reply-To: <20150730212020.GA8185@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8012853132041140267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/30, Oleg Nesterov wrote:
>
> Thanks!
>
> I am travelling, I'll send the trivial fix on Monday.
>
> Just in case, this is not a bug, we only need to shut up the warning and =
we
> even have the special macro for that. I forgot its name, and I don't have=
 the
> kernel sources right now.

Now that I can actually see the code, I think that we should simply remove
__set_current_state(TASK_RUNNING) and set_current_state(TASK_INTERRUPTIBLE).
But let me re-check this once again tomorrow, I simply can't understand why
pktgen_thread_worker() does this.

Unless I am totally confused they could be removed right after ef87979c273a2
"pktgen: better scheduler friendliness" which in particular changed the main
loop to use wait_event(). Then later baac167b "pktgen: avoid expensive
set_current_state() call in loop" changed the 1st __set_current_state() to
set RUNNING, and moved the 2nd set_current_state(TASK_INTERRUPTIBLE) outside
the main loop for absolutely no reason.

Oleg.


--===============8012853132041140267==--

