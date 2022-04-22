Content-Type: multipart/mixed; boundary="===============8936616857890607122=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fs/pipe] 5a519c8fe4: WARNING:at_mm/page_alloc.c:#__alloc_pages
Date: Fri, 22 Apr 2022 10:23:36 -0700
Message-ID: <CAHk-=wj8OCHqYkB2hVQ2FG6n5g4R0H3eetzbo9NrHooY1-4pwg@mail.gmail.com>
In-Reply-To: <CANaxB-zDKVtGTRrqh4SpPKS96Ux6s01BL3BdAe-ZY_9HWSX9dw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8936616857890607122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 10:23 PM Andrei Vagin <avagin@gmail.com> wrote:
>
> The big advantage of vmsplice is that it can attach real user pages into
> a pipe and then any following changes of these pages by the process
> don't trigger any allocations and extra copies of data. vmsplice in this
> case is fast. After splicing pages to pipes, we resume a process and
> splice pages from pipes to a socket or a file.  The whole process of
> dumping process pages is zero-copy.

Hmm. What happens if you just use /proc/<pid>/mem?

That just takes a reference to the tsk->mm. No page copies at all.
After that you can do anything you want to that mm.

Well, anything a /proc/<pid>/mm fd allows, which is mainly read and
write. But it stays around for as long as you keep it open, and
fundamentally stays coherent with that mm, because it *is* that mm.

And it doesn't affect anything else, because all it literally has is
that mm_struct pointer.

            Linus
--===============8936616857890607122==--

