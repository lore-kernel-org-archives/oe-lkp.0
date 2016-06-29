Content-Type: multipart/mixed; boundary="===============8622117800003166614=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Wed, 29 Jun 2016 08:34:01 -0700
Message-ID: <CALCETrUng61Fe2+RSp5r6fsOkcUKDqnf-u39TUrgO76pHMqFsA@mail.gmail.com>
In-Reply-To: <20160628225929.GB8591@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8622117800003166614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 3:59 PM, Oleg Nesterov <oleg@redhat.com> wrote:
> On 06/28, Andy Lutomirski wrote:
>>
>> On Tue, Jun 28, 2016 at 1:12 PM, Oleg Nesterov <oleg@redhat.com> wrote:
>> >
>> > So please forget unless you see another reason for this change.
>> >
>>
>> But I might need to that anyway for procfs to read the the stack,
>> right?  Do you see another way to handle that case?
>
> Well, we could use probe_kernel_text() and recheck tsk->stack !=3D NULL
> after this.
>
> But,
>
>> I'm thinking of adding:
>>
>> void *try_get_task_stack(struct task_struct *tsk);
>> void put_task_stack(struct task_struct *tsk);
>
> Yes, agreed, this looks better.
>
> Oleg.
>

I pushed that change to my tree (seems to work well enough to boot
without warnings as long as I don't unmount XFS, but not particularly
well tested).  Want to refresh your patch on top?

I'll probably have to split the patch to introduce no-op
try_get_task_stack / put_task_stack first so I can avoid breaking
bisection, but the interface shouldn't change unless something's wrong
with it.

--Andy

--===============8622117800003166614==--

