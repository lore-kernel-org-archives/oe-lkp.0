Content-Type: multipart/mixed; boundary="===============8816368010085482418=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Tue, 28 Jun 2016 14:21:29 -0700
Message-ID: <CALCETrU90SiCttWhghVfwjp_kii=eB1UuKLQ0_M76JxDjpQNzA@mail.gmail.com>
In-Reply-To: <CA+55aFxzdFxUUCSDgt_5cPdL1NxS9GDtHOkPkwOui6PTuqEj+g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8816368010085482418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 2:14 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Jun 28, 2016 at 1:54 PM, Andy Lutomirski <luto@amacapital.net> =
wrote:
>>
>> But I might need to that anyway for procfs to read the the stack,
>> right?  Do you see another way to handle that case?
>
> I think the other way to handle the kernel stack reading would be to
> simply make the stack freeing be RCU-delayed, and use the RCU list
> itself as the stack cache.
>
> That way reading the stack is ok in a RCU context, although you might
> end up reading a stack that has been re-used.
>
> Would that work for people?

I don't think I understand your proposal.  We already delay freeing
the stack for RCU.  If we continue doing it, then, under workloads
like my benchmark, the RCU list gets quite large.  Or are you
suggesting that we actually make a list somewhere of stacks that are
nominally unused but are still around for RCU's benefit and then
scavenge from that lest when we need a new stack?  If so, that seems
considerably more complicated than just adding a reference count.

Also, my inner security nerd says that letting /proc potentially read
the wrong process's stack is bad news.

--===============8816368010085482418==--

