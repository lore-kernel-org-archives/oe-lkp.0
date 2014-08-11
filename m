Content-Type: multipart/mixed; boundary="===============4354006263518051296=="
MIME-Version: 1.0
From: Kirill Tkhai <tkhai@yandex.ru>
To: lkp@lists.01.org
Subject: Re: [sched] Out of memory: Kill process 2999 (rc) score 9 or sacrifice child
Date: Mon, 11 Aug 2014 10:11:33 +0400
Message-ID: <3568281407737493@web29j.yandex.ru>
In-Reply-To: <20140810152914.GA11947@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4354006263518051296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



10.08.2014, 19:31, "Oleg Nesterov" <oleg@redhat.com>:
> On 08/09, Peter Zijlstra wrote:
>> =C2=A0That would suggest we're failing to do the TASK_DEAD thing properl=
y, and
>> =C2=A0ARGH! bloody obvious why, see the this_rq() comment right before t=
he
>> =C2=A0finish_task_switch() call in context_switch().
>
> Off-topic, but perhaps we can make this a bit more clear?
>
> Hmm. But after I actually did this change I can't understand if it makes
> this more clean or uglifies the code. See the patch below.
>
> OTOH, "int cpu" in __schedule() looks pointless and should die? Both
> rcu_note_context_switch() and wq_worker_sleeping() can use
> raw_smp_processor_id() ? In fact I think wq_worker_sleeping() doesn't
> need the "task" argument too.
>
> And... Doesn't schedule_tail() need preempt_enable() before
> finish_task_switch() ? IOW, shouldn't it do
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#ifndef __ARCH_WANT_UNLOC=
KED_CTXSW
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0preempt_disable();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#endif
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0finish_task_switch();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0post_schedule(rq);
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0preempt_enable();
>
> or I am totally confused?

You're sure, this was discussed here:

https://lkml.org/lkml/2014/2/14/243

--===============4354006263518051296==--

