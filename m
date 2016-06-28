Content-Type: multipart/mixed; boundary="===============0680103815876576935=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Tue, 28 Jun 2016 12:12:48 -0700
Message-ID: <CALCETrXP7S2JWFBswPtOrafPcugkM0+k-aWPbd_wjJd+iaiJ_Q@mail.gmail.com>
In-Reply-To: <20160628185853.GA3998@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0680103815876576935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 11:58 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> On 06/27, Oleg Nesterov wrote:
>>
>> On 06/27, Andy Lutomirski wrote:
>> >
>> > Want to send a patch?  I could do it, but you understand this code
>> > much better than I do.
>>
>> Well, I'll try to do this tomorrow unless you do it.
>
> I have cloned luto/linux.git to see if kthread_stop() can pin ->stack
> somehow, but it seems this is not possible, finish_task_switch() does
> free_thread_stack() unconditionally.
>
> Then how (say) proc_pid_stack() can work? If it hits the task which is
> alreay dead we are (probably) fine, valid_stack_ptr() should fail iiuc.
>
> But what if we race with the last schedule() ? "addr =3D *stack" can read
> the already vfree'ed memory, no?
>
> Looks like print_context_stack/etc need probe_kernel_address or I missed
> something.

Yuck.  I suppose I could add a reference count to protect the stack.
Would that simplify the kthread code?

It's too bad that all the kthread users use get_task_struct instead
of, say get_kthread (which doesn't exist).

--Andy

>
> Oleg.
>



-- =

Andy Lutomirski
AMA Capital Management, LLC

--===============0680103815876576935==--

