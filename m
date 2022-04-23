Content-Type: multipart/mixed; boundary="===============4950323925302872719=="
MIME-Version: 1.0
From: Andrei Vagin <avagin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fs/pipe] 5a519c8fe4: WARNING:at_mm/page_alloc.c:#__alloc_pages
Date: Sat, 23 Apr 2022 13:23:27 -0700
Message-ID: <CANaxB-whArowHWaWsFMJf6B4idPabAmJNawzk9FdokNQ-1xrSA@mail.gmail.com>
In-Reply-To: <CAHk-=wj8OCHqYkB2hVQ2FG6n5g4R0H3eetzbo9NrHooY1-4pwg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4950323925302872719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 10:23 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Apr 21, 2022 at 10:23 PM Andrei Vagin <avagin@gmail.com> wrote:
> >
> > The big advantage of vmsplice is that it can attach real user pages into
> > a pipe and then any following changes of these pages by the process
> > don't trigger any allocations and extra copies of data. vmsplice in this
> > case is fast. After splicing pages to pipes, we resume a process and
> > splice pages from pipes to a socket or a file.  The whole process of
> > dumping process pages is zero-copy.
>
> Hmm. What happens if you just use /proc/<pid>/mem?
>
> That just takes a reference to the tsk->mm. No page copies at all.
> After that you can do anything you want to that mm.
>
> Well, anything a /proc/<pid>/mm fd allows, which is mainly read and
> write. But it stays around for as long as you keep it open, and
> fundamentally stays coherent with that mm, because it *is* that mm.
>
> And it doesn't affect anything else, because all it literally has is
> that mm_struct pointer.

I think the main reason for using vmsplice&splice was zero-copy. I wrote
a small benchmark to compare /proc/pid/mem, process_vm_readv, and
vmsplice. This benchmark emulates how criu dumps memory. It creates a
child process and dumps its memory into a file. The code is here:
https://github.com/avagin/procmem.

Here are results from my laptop:
$ ./procmem [CMD] [DUMP FILE] [BUF_SIZE] [MEM_SIZE]

$ ./procmem splice /tmp/procmem.out 1048576 2147483648
ok 4877 MB/sec
ok 4733 MB/sec
ok 4777 MB/sec
ok 4766 MB/sec
ok 4821 MB/sec
ok 4777 MB/sec
ok 4798 MB/sec
ok 4798 MB/sec
ok 4798 MB/sec
ok 4798 MB/sec

$ ./procmem mem /tmp/procmem.out 1048576 2147483648
ok 3236 MB/sec
ok 2651 MB/sec
ok 3216 MB/sec
ok 3211 MB/sec
ok 3216 MB/sec
ok 3206 MB/sec
ok 3211 MB/sec
ok 3216 MB/sec
ok 3206 MB/sec
ok 3211 MB/sec

$ ./procmem process_vm_readv /tmp/procmem.out  1048576 2147483648
ok 3833 MB/sec
ok 3075 MB/sec
ok 3792 MB/sec
ok 3792 MB/sec
ok 3819 MB/sec
ok 3813 MB/sec
ok 3819 MB/sec
ok 3806 MB/sec
ok 3799 MB/sec
ok 3813 MB/sec

vmsplice & splice  is the best. /proc/pid/mem is 30% slower.
process_vm_readv is 20% slower.

Thanks,
Andrei
--===============4950323925302872719==--

