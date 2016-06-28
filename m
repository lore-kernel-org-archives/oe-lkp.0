Content-Type: multipart/mixed; boundary="===============0576004223521400378=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Tue, 28 Jun 2016 14:40:53 -0700
Message-ID: <CA+55aFwiVYfFfTjN5j-C6cwA1z3hkCaq7A+hqaW4dG4Yon4Saw@mail.gmail.com>
In-Reply-To: <CA+55aFx1Df57M+vZL=_RTOtUYB7SK-A7Wt29mj0S=YTK6H+bSQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0576004223521400378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 2:35 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Jun 28, 2016 at 2:21 PM, Andy Lutomirski <luto@amacapital.net> =
wrote:
>
>> If so, that seems considerably more complicated than just adding a refer=
ence count.
>
> Fair enough.

Ahh, and if you put the reference count just in the task_struct (next
to the ->stack pointer), then I guess that's particularly trivial.

Then try_get_task_stack(tsk) becomes

     void *try_get_task_stack(struct task_struct *tsk)
     {
          void *stack =3D tsk->stack;
          if (!atomic_inc_not_zero(&tsk->stackref))
               stack =3D NULL;
          return stack;
     }

ok, color me convinced.

               Linus

--===============0576004223521400378==--

