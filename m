Content-Type: multipart/mixed; boundary="===============2307476909384962351=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Wed, 29 Jun 2016 00:59:29 +0200
Message-ID: <20160628225929.GB8591@redhat.com>
In-Reply-To: <CALCETrXdazkZznTX88EZLVGB-ZFUVEwGMxiGXvN7pPw0WGKoFQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2307476909384962351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/28, Andy Lutomirski wrote:
>
> On Tue, Jun 28, 2016 at 1:12 PM, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > So please forget unless you see another reason for this change.
> >
>
> But I might need to that anyway for procfs to read the the stack,
> right?  Do you see another way to handle that case?

Well, we could use probe_kernel_text() and recheck tsk->stack !=3D NULL
after this.

But,

> I'm thinking of adding:
>
> void *try_get_task_stack(struct task_struct *tsk);
> void put_task_stack(struct task_struct *tsk);

Yes, agreed, this looks better.

Oleg.


--===============2307476909384962351==--

