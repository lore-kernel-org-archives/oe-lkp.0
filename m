Content-Type: multipart/mixed; boundary="===============1108557973698072920=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Mon, 27 Jun 2016 08:44:09 -0700
Message-ID: <CALCETrX0po3cEaOFByNsTLf-f_j=VxhzOLPfxOA3oP=NLVTGBg@mail.gmail.com>
In-Reply-To: <20160627145443.GA17145@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1108557973698072920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 7:54 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> On 06/26, Andy Lutomirski wrote:
>>
>> kthread_stop is *sick*.
>>
>>     struct kthread self;
>>
>> ...
>>
>>     current->vfork_done =3D &self.exited;
>>
>> ...
>>
>>     do_exit(ret);
>>
>> And then some other thread goes and waits for the completion, which is
>> *on the stack*, which, in any sane world (e.g. with my series
>> applied), is long gone by then.
>
> Yes, I forgot this when we discussed the problems with ti->flags/etc...
>
>> But this is broken even without any changes: since when is gcc
>> guaranteed to preserve the stack contents when a function ends with a
>> sibling call, let alone with a __noreturn call?
>
> I don't know if gcc can actually drop the stack frame in this case,
> but even if it can this looks fixeable.
>
>> Is there seriously no way to directly wait for a struct task_struct to
>> exit?  Could we, say, kmalloc the completion (or maybe even the whole
>> struct kthread) and (ick!) hang it off ->vfork_done?
>
> Sure we can... And yes, I think we need to alloc the whole struct kthread.
> Just another (unfortunate) complication, the current code is simple.
>
> And probably kthread/kthread_stop should switch to task_work_exit().

Want to send a patch?  I could do it, but you understand this code
much better than I do.

--===============1108557973698072920==--

