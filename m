Content-Type: multipart/mixed; boundary="===============0705456987520918579=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Mon, 27 Jun 2016 10:28:23 +0200
Message-ID: <20160627082823.GW30154@twins.programming.kicks-ass.net>
In-Reply-To: <CALCETrVZUJdVNdt3W9_o6EO_BjeO1V8JtQ+aig=zkR5xukeZhg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0705456987520918579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 26, 2016 at 10:22:32PM -0700, Andy Lutomirski wrote:
> kthread_stop is *sick*.
> =

>     struct kthread self;
> =

> ...
> =

>     current->vfork_done =3D &self.exited;
> =

> ...
> =

>     do_exit(ret);
> =

> And then some other thread goes and waits for the completion, which is
> *on the stack*, which, in any sane world (e.g. with my series
> applied), is long gone by then.

cute

> Is there seriously no way to directly wait for a struct task_struct to
> exit?  Could we, say, kmalloc the completion (or maybe even the whole
> struct kthread)

I suppose the easiest is to merge struct kthread into struct
kthread_create_info, and maybe union some bits if we're really worried
about size.

> and (ick!) hang it off ->vfork_done?

This... cleanup is going to be somewhat icky.

--===============0705456987520918579==--

