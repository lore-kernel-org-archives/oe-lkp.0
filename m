Content-Type: multipart/mixed; boundary="===============0669119953934710134=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Mon, 27 Jun 2016 19:00:10 +0200
Message-ID: <20160627170010.GA21628@redhat.com>
In-Reply-To: <CALCETrX0po3cEaOFByNsTLf-f_j=VxhzOLPfxOA3oP=NLVTGBg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0669119953934710134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/27, Andy Lutomirski wrote:
>
> On Mon, Jun 27, 2016 at 7:54 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> >> Is there seriously no way to directly wait for a struct task_struct to
> >> exit?  Could we, say, kmalloc the completion (or maybe even the whole
> >> struct kthread) and (ick!) hang it off ->vfork_done?
> >
> > Sure we can... And yes, I think we need to alloc the whole struct kthre=
ad.
> > Just another (unfortunate) complication, the current code is simple.
> >
> > And probably kthread/kthread_stop should switch to task_work_exit().
>
> Want to send a patch?  I could do it, but you understand this code
> much better than I do.

Well, I'll try to do this tomorrow unless you do it.

The problem is not the wait_for_completion(vfork_done) in kthread_stop(),
we can avoid this immediately if we change it to use task_work_add().

The problem is to_live_kthread(). And damn, it seems to me that in the
long term we can simpy kill "struct kthread" altogether. All we need is
kthread_data() and this is just a pointer. flags,cpu,parked should go
into smp_hotplug_thread.

But this needs changes, so meanwhile we will have to kmalloc() it and
free in free_task().

Or perhaps you can simply move "struct kthread" into task_struct as as
temporary/ugly but trivial fix, then we can think more.

Oleg.


--===============0669119953934710134==--

