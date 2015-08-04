Content-Type: multipart/mixed; boundary="===============5976925360175756202=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [net] 1fbe4b46cac: WARNING: CPU: 0 PID: 2245 at kernel/sched/core.c:7376 __might_sleep+0x8b/0xa8()
Date: Tue, 04 Aug 2015 18:31:25 +0200
Message-ID: <20150804163125.GA31395@redhat.com>
In-Reply-To: <20150803164958.GA17910@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5976925360175756202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/03, Oleg Nesterov wrote:
>
> Now that I can actually see the code, I think that we should simply remove
> __set_current_state(TASK_RUNNING) and set_current_state(TASK_INTERRUPTIBL=
E).
> But let me re-check this once again tomorrow, I simply can't understand w=
hy
> pktgen_thread_worker() does this.
>
> Unless I am totally confused they could be removed right after ef87979c27=
3a2
> "pktgen: better scheduler friendliness" which in particular changed the m=
ain
> loop to use wait_event(). Then later baac167b "pktgen: avoid expensive
> set_current_state() call in loop" changed the 1st __set_current_state() to
> set RUNNING, and moved the 2nd set_current_state(TASK_INTERRUPTIBLE) outs=
ide
> the main loop for absolutely no reason.

Yes, I am sending the patch. Both set_current_state()'s look obviously unne=
eded,
and afaics we could hit the same warning even without 1fbe4b46caca. At least
pktgen_rem_thread()->remove_proc_entry() can sleep.

Oleg.


--===============5976925360175756202==--

