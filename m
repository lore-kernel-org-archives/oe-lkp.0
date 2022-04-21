Content-Type: multipart/mixed; boundary="===============8986047307692544370=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fs/pipe] 5a519c8fe4: WARNING:at_mm/page_alloc.c:#__alloc_pages
Date: Thu, 21 Apr 2022 12:28:20 -0700
Message-ID: <CAHk-=wjdCtgtQPZPTigMMniZaoMA_tHDu3EMBVM3w1GH5X+cOw@mail.gmail.com>
In-Reply-To: <CAHk-=wgSW3gB1=rf3atv=3Xvn0pNBtKUKJ2VF81ue-xagS7F4w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8986047307692544370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 9:30 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The pipe part sounds like a horrible hacky thing.
>
> I also assume you already tried that, and hit some performance issues.
> But it does sound like the better interface, more directly what you
> want.
>
> So what are the problems with using process_vm_readv?

Actually, I take that back.

Don't use pipes.

Don't use process_vm_readv().

Use the system call we already have for "snapshot the current VM".

It's called "fork()". It's cheap, it's efficient, and it snapshots the
whole VM in one go. No stupid extra buffers in pipes, no crazy things
like that.

So just make your pre-dump code do a simple fork(), let the parent
continue, and then do the dumping in the child at whatever pace you
want.

In fact, you might just leave the child process alone, and let it _be_
that pre-dump.

You can create a new snapshot every once in a while, and kill the
previous snapshot, if you want to keep the snapshot close to the
target, and then use the memory tracking to track what has changed
since.

And you might not want to use plain "fork()", but instead some kind of
"clone()" variant. You might want to use CLONE_PARENT and some
non-SIGCHLD exit signal to basically hide the snapshot image from the
thing you are snapshotting.

Anyway, the "use vmsplice to a pipe to create a snapshot" sounds just
insane when you have a very traditional system call that is all about
snapshotting the process.

Maybe a new CLONE_xyz flag could be added to make that memory tracking
integrate better or whatever.

Any showstoppers?

                         Linus
--===============8986047307692544370==--

