Content-Type: multipart/mixed; boundary="===============6927050281876534808=="
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Sat, 11 Dec 2021 00:29:32 +0100
Message-ID: <CAG48ez2YE08+vo+E+ZtxeikN4vVCJC+-BrWJUYWb0f0vRA0Uug@mail.gmail.com>
In-Reply-To: <CAHk-=wh5iFv1MOx6r8zyGYkYGfgfxqcPSrUDwfuOCdis+VR+BQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6927050281876534808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 10:59 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Dec 10, 2021 at 1:25 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > We could make a special light-weight version of files_lookup_fd_raw(),
> > I guess. We don't need the *whole* "look it up again".  We don't need
> > to re-check the array bounds, and we don't need to do the nospec
> > lookup - we would have triggered a NULL file pointer if that happened
> > the first time around.
> >
> > So all we'd need to do is "check that fdt is the same, and check that
> > fdt->fd[fd] is the same".
>
> This is an ENTIRELY UNTESTED patch to do that.
>
> It basically rewrites __fget_files() from scratch: it really wants to
> do the fd array lookup by hand, in order to cache the intermediate fdt
> pointer, and in order to cache the intermediate speculation-safe fd
> array index etc.
>
> It's not a very complicated function, and rewriting it actually cleans
> up the loop to not need the ugly goto.
>
> I made it use a helper wrapper function for the rcu locking, so that
> the "meat" of the function can just use plain "return NULL" for the
> error cases.
>
> However, not only is it entirely untested, this rewrite also means
> that gcc has now decided that the result is so simple and clear that
> it will inline it into all the callers.
>
> I guess that's a good sign - writing the code in a way that makes the
> compiler say "now it's so trivial that it should be inlined" is
> certainly not a bad thing. But it makes it hard to really compare the
> asm.
>
> I did try a version with "noinline" just to make it more comparable,
> and hey, it all looked sane to me there too.
>
> I added more comments about what is going on.
>
> Again - this is UNTESTED. I've looked at the code, I've looked at the
> diff, and I've looked at the code it generates. It all looks fine to
> me. But I've looked at it so much that I suspect that I'd be entirely
> blind to any completely obvious bug by now.
>
> Comments?

One nit: The original implementation is using rcu_dereference_raw()
because it can run in different contexts, but here plain
rcu_dereference() would probably be more appropriate?

(I was wondering for a bit whether we should also change the
get_mm_exe_file() path, but I guess that's fine because it can only
ever happen for regular executable files and currently there's also no
path to pull out the mm->exe_file and use it for some other syscall?)

> Oliver, does this make any difference in the performance department?
>
>                  Linus
--===============6927050281876534808==--

