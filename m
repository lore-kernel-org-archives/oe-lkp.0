Content-Type: multipart/mixed; boundary="===============1547812191949261457=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Tue, 28 Jun 2016 13:54:43 -0700
Message-ID: <CALCETrXdazkZznTX88EZLVGB-ZFUVEwGMxiGXvN7pPw0WGKoFQ@mail.gmail.com>
In-Reply-To: <20160628201249.GA12471@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1547812191949261457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 1:12 PM, Oleg Nesterov <oleg@redhat.com> wrote:
> On 06/28, Andy Lutomirski wrote:
>>
>> On Tue, Jun 28, 2016 at 11:58 AM, Oleg Nesterov <oleg@redhat.com> wrot=
e:
>> >
>> > Then how (say) proc_pid_stack() can work? If it hits the task which is
>> > alreay dead we are (probably) fine, valid_stack_ptr() should fail iiuc.
>> >
>> > But what if we race with the last schedule() ? "addr =3D *stack" can r=
ead
>> > the already vfree'ed memory, no?
>> >
>> > Looks like print_context_stack/etc need probe_kernel_address or I miss=
ed
>> > something.
>>
>> Yuck.  I suppose I could add a reference count to protect the stack.
>> Would that simplify the kthread code?
>
> Well yes, that is why I asked. So please tell me if you are going to
> do this...
>
> But we can fix kthread code without this hack which we do not need in
> the long term anyway. Unfortunaly we need to cleanup kernel/smpboot.c
> first. And I was going to do this a long ago for quite different reason ;)
>
> So please forget unless you see another reason for this change.
>

But I might need to that anyway for procfs to read the the stack,
right?  Do you see another way to handle that case?

I'm thinking of adding:

void *try_get_task_stack(struct task_struct *tsk);
void put_task_stack(struct task_struct *tsk);

where try_get_task_stack can return NULL.

--Andy

--===============1547812191949261457==--

