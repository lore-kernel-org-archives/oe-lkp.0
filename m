Content-Type: multipart/mixed; boundary="===============0990428881138549403=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Tue, 28 Jun 2016 22:12:50 +0200
Message-ID: <20160628201249.GA12471@redhat.com>
In-Reply-To: <CALCETrXP7S2JWFBswPtOrafPcugkM0+k-aWPbd_wjJd+iaiJ_Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0990428881138549403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/28, Andy Lutomirski wrote:
>
> On Tue, Jun 28, 2016 at 11:58 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > Then how (say) proc_pid_stack() can work? If it hits the task which is
> > alreay dead we are (probably) fine, valid_stack_ptr() should fail iiuc.
> >
> > But what if we race with the last schedule() ? "addr =3D *stack" can re=
ad
> > the already vfree'ed memory, no?
> >
> > Looks like print_context_stack/etc need probe_kernel_address or I missed
> > something.
>
> Yuck.  I suppose I could add a reference count to protect the stack.
> Would that simplify the kthread code?

Well yes, that is why I asked. So please tell me if you are going to
do this...

But we can fix kthread code without this hack which we do not need in
the long term anyway. Unfortunaly we need to cleanup kernel/smpboot.c
first. And I was going to do this a long ago for quite different reason ;)

So please forget unless you see another reason for this change.

Oleg.


--===============0990428881138549403==--

