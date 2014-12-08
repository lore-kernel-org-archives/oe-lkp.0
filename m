Content-Type: multipart/mixed; boundary="===============1729610889270880709=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] kthread: kthread_bind fails to enforce CPU affinity (fixes kernel BUG at kernel/smpboot.c:134!)
Date: Mon, 08 Dec 2014 09:34:08 +0100
Message-ID: <20141208083408.GA8023@gmail.com>
In-Reply-To: <1418009221-12719-1-git-send-email-anton@samba.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1729610889270880709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Anton Blanchard <anton@samba.org> wrote:

> I have a busy ppc64le KVM box where guests sometimes hit the =

> infamous "kernel BUG at kernel/smpboot.c:134!" issue during =

> boot:
> =

> BUG_ON(td->cpu !=3D smp_processor_id());
> =

> Basically a per CPU hotplug thread scheduled on the wrong CPU. The oops
> output confirms it:
> =

> CPU: 0
> Comm: watchdog/130
> =

> The issue is in kthread_bind where we set the cpus_allowed =

> mask, but do not touch task_thread_info(p)->cpu. The scheduler =

> assumes the previously scheduled CPU is in the cpus_allowed =

> mask, but in this case we are moving a thread to another CPU so =

> it is not.
> =

> We used to call set_task_cpu which sets =

> task_thread_info(p)->cpu (in fact kthread_bind still has a =

> comment suggesting this). That was removed in e2912009fb7b =

> ("sched: Ensure set_task_cpu() is never called on blocked =

> tasks").
> =

> Since we cannot call set_task_cpu (the task is in a sleeping =

> state), just do an explicit set of task_thread_info(p)->cpu.

So we cannot call set_task_cpu() because in the normal life time =

of a task the ->cpu value gets set on wakeup. So if a task is =

blocked right now, and its affinity changes, it ought to get a =

correct ->cpu selected on wakeup. The affinity mask and the =

current value of ->cpu getting out of sync is thus 'normal'.

(Check for example how set_cpus_allowed_ptr() works: we first set =

the new allowed mask, then do we migrate the task away if =

necessary.)

In the kthread_bind() case this is explicitly assumed: it only =

calls do_set_cpus_allowed().

But obviously the bug triggers in kernel/smpboot.c, and that =

assert shows a real bug - and your patch makes the assert go =

away, so the question is, how did the kthread get woken up and =

put on a runqueue without its ->cpu getting set?

One possibility is a generic scheduler bug in ttwu(), resulting =

in ->cpu not getting set properly. If this was the case then =

other places would be blowing up as well, and I don't think we =

are seeing this currently, especially not over such a long =

timespan.

Another possibility would be that kthread_bind()'s assumption =

that the task is inactive is false: if the task activates when we =

think it's blocked and we just hotplug-migrate it away while its =

running (setting its td->cpu?), the assert could trigger I think =

- and the patch would make the assert go away.

A third possibility would be, if this is a freshly created =

thread, some sort of initialization race - either in the kthread =

or in the scheduler code.

Weird.

Thanks,

	Ingo

--===============1729610889270880709==--

