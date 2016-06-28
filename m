Content-Type: multipart/mixed; boundary="===============6818046744107769297=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Tue, 28 Jun 2016 20:58:54 +0200
Message-ID: <20160628185853.GA3998@redhat.com>
In-Reply-To: <20160627170010.GA21628@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6818046744107769297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/27, Oleg Nesterov wrote:
>
> On 06/27, Andy Lutomirski wrote:
> >
> > Want to send a patch?  I could do it, but you understand this code
> > much better than I do.
>
> Well, I'll try to do this tomorrow unless you do it.

I have cloned luto/linux.git to see if kthread_stop() can pin ->stack
somehow, but it seems this is not possible, finish_task_switch() does
free_thread_stack() unconditionally.

Then how (say) proc_pid_stack() can work? If it hits the task which is
alreay dead we are (probably) fine, valid_stack_ptr() should fail iiuc.

But what if we race with the last schedule() ? "addr =3D *stack" can read
the already vfree'ed memory, no?

Looks like print_context_stack/etc need probe_kernel_address or I missed
something.

Oleg.


--===============6818046744107769297==--

