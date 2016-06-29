Content-Type: multipart/mixed; boundary="===============0265748109262158803=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Wed, 29 Jun 2016 16:33:26 -0700
Message-ID: <CALCETrU2ZjK9Nvtd+dPwRDvV_g3Z3s2eOiJCHEd7D7vXuVEV7Q@mail.gmail.com>
In-Reply-To: <20160628185853.GA3998@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0265748109262158803==
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

I changed save_stack_trace_tsk() to use try_get_task_stack().  I think
that's sufficient to fix this.

--Andy

--===============0265748109262158803==--

