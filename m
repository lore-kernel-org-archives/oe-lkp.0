Content-Type: multipart/mixed; boundary="===============8615787312279447014=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Mon, 27 Jun 2016 16:54:44 +0200
Message-ID: <20160627145443.GA17145@redhat.com>
In-Reply-To: <CALCETrVZUJdVNdt3W9_o6EO_BjeO1V8JtQ+aig=zkR5xukeZhg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8615787312279447014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/26, Andy Lutomirski wrote:
>
> kthread_stop is *sick*.
>
>     struct kthread self;
>
> ...
>
>     current->vfork_done =3D &self.exited;
>
> ...
>
>     do_exit(ret);
>
> And then some other thread goes and waits for the completion, which is
> *on the stack*, which, in any sane world (e.g. with my series
> applied), is long gone by then.

Yes, I forgot this when we discussed the problems with ti->flags/etc...

> But this is broken even without any changes: since when is gcc
> guaranteed to preserve the stack contents when a function ends with a
> sibling call, let alone with a __noreturn call?

I don't know if gcc can actually drop the stack frame in this case,
but even if it can this looks fixeable.

> Is there seriously no way to directly wait for a struct task_struct to
> exit?  Could we, say, kmalloc the completion (or maybe even the whole
> struct kthread) and (ick!) hang it off ->vfork_done?

Sure we can... And yes, I think we need to alloc the whole struct kthread.
Just another (unfortunate) complication, the current code is simple.

And probably kthread/kthread_stop should switch to task_work_exit().

Oleg.


--===============8615787312279447014==--

