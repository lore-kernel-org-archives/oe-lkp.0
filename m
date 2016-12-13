Content-Type: multipart/mixed; boundary="===============5943196197079194773=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm-add-vfree_atomic-fix
Date: Tue, 13 Dec 2016 22:21:59 +0300
Message-ID: <3eb4bfa4-ff94-bb5f-095a-3d17d68bf411@virtuozzo.com>
In-Reply-To: <CALCETrVmz5m6+yR-SsY=RTdRkF1UyN3qfRLjpjvor0U6Z=OM3w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5943196197079194773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/13/2016 09:15 PM, Andy Lutomirski wrote:


>>>
>>> But not quite acked by me.  What happened to the vfree code that
>>> causes vfree_deferred to be called in a preemptable context?  That
>>> sounds like a bug.
>>
>> Not sure I understand but the above stack points to a preemptible
>> context (copy_process). My stack was different and it looks preemptible =
as well.
>> free_thread_stack calls vfree_atomic unconditionally. So I am not sure
>> why do you think this is a bug?
>>
>>> (This code doesn't exist in Linus' tree.  What tree does this apply to.)
>>
>> Anyway, now that I am looking at Andrew's tree I can see [1] which
>> doesn't have this_cpu_ptr. So I am not sure where this this_cpu_ptr came
>> from. Maybe the previous version of the patch which has shown up in the
>> linux-next and Andrew has picked up [2] in the meantime. /me confused
>>
>> [1] http://www.ozlabs.org/~akpm/mmotm/broken-out/mm-add-vfree_atomic.pat=
ch
>> [2] http://lkml.kernel.org/r/1481553981-3856-1-git-send-email-aryabinin(=
a)virtuozzo.com
> =

> The underlying issue seems to be that we have this shiny new function
> vfree_atomic() which doesn't work in *non-atomic* context and that we

It does work non-atomic context. It's fixed now.

> have "kernel/fork: use vfree_atomic() to free thread stack" that calls
> vfree_atomic() from non-atomic context.

>From both context actually. Usually task stack is freed from atomic contex=
t:
	http://lkml.kernel.org/r/20161019111541.GQ29358(a)nuc-i3427.alporthouse.com
	http://lkml.kernel.org/r/CALCETrVqjejgpQVUdem8RK3uxdEgfOZy4cOJqJQjCLtBDnJf=
yQ(a)mail.gmail.com

On rare occasions it can be freed from non-atomic context, e.g. error path =
in copy_process().

> I'm not sure what the motivation of the latter patch was, but ISTM we
> should revert it.  TBH I'm not quite sure what the purpose of
> splitting vfree() and vfree_atomic() was, but I'm not seeing any
> reason that the common case of freeing stacks from non-atomic context
> should defer the free instead of just doing it right away.
>
> Andrey, Johannes, why should task stack freeing use vfree_atomic() in
> the first place?

Because vfree() now can sleep and task stack freeing usually done in atomic=
 context.



--===============5943196197079194773==--

