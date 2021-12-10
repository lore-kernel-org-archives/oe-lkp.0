Content-Type: multipart/mixed; boundary="===============2103243216321291182=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Fri, 10 Dec 2021 13:25:56 -0800
Message-ID: <CAHk-=wg1uxUTmdEYgTcxWGQ-s6vb_V_Jux+Z+qwoAcVGkCTDYA@mail.gmail.com>
In-Reply-To: <CAG48ez1pnatAB095dnbrn9LbuQe4+ENwh-WEW36pM40ozhpruw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2103243216321291182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 12:30 PM Jann Horn <jannh@google.com> wrote:
>
> Oh, and I just realized that your patch probably actually also fixes
> an issue entirely unrelated to unix sockets. __fdget_pos() does this:

Hmm. I was going to say that you're wrong, because that case doesn't
actually have that "offset" thing that the unix domain GC code has,
and a "true zero" reference count is special and will never come back
to life.

But I think you're right - the "close and resurrect" situation wrt the
file count can happen _after_ the __fdget() in __fdget_pos() (where we
have that implicit offset of our own ref), and thus show a false case
of "we're the only user".

So I think you've convinced me - doing it in __fget_files() was the
right thing to do, but I really don't like that 5% regression.

Maybe it's purely on that artificial benchmark, but a multi-threaded
poll loop doesn't sound super-unusual (I think a single-threaded one
is already protected from this all by our "__fget_light()" logic).

Sadly, looking at my gcc code generation, adding that "unlikely()"
does move the "fput_many()" call out to it's own out-of-line code
section, but gcc will still end up doing the stack frame around the
whole function.

So if it's all due to just extra code and stack references due to the
now necessary stack-frame, it doesn't look obvious how to improve on
that.

We could make a special light-weight version of files_lookup_fd_raw(),
I guess. We don't need the *whole* "look it up again".  We don't need
to re-check the array bounds, and we don't need to do the nospec
lookup - we would have triggered a NULL file pointer if that happened
the first time around.

So all we'd need to do is "check that fdt is the same, and check that
fdt->fd[fd] is the same".

                 Linus
--===============2103243216321291182==--

