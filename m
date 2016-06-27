Content-Type: multipart/mixed; boundary="===============8189007093703695716=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Mon, 27 Jun 2016 10:16:05 -0700
Message-ID: <CA+55aFy3YLnP21S1G1j9EPTq56H=MB-RoQmX+obri4is+Dr+dQ@mail.gmail.com>
In-Reply-To: <CALCETrVZUJdVNdt3W9_o6EO_BjeO1V8JtQ+aig=zkR5xukeZhg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8189007093703695716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 26, 2016 at 10:22 PM, Andy Lutomirski <luto@kernel.org> wrote:
>
> kthread_stop is *sick*.
>
>     struct kthread self;
>
>
>     current->vfork_done =3D &self.exited;
>
>
>     do_exit(ret);
>
> And then some other thread goes and waits for the completion, which is
> *on the stack*, which, in any sane world (e.g. with my series
> applied), is long gone by then.

Yeah. To be fair, that used to work. And the waiter does actually get
a reference to the task struct, and with the lifetime of the stack
historically being the same as the task struct, it was even being
fairly careful about it.

But yes, it's disgusting, and doesn't work in the new world order, and
I think it should be fairly easy to fix. Although getting the lifetime
right for a separately allocated "struct kthread_struct" might be a
bit exciting.

                 Linus

--===============8189007093703695716==--

