Content-Type: multipart/mixed; boundary="===============3388911905379638967=="
MIME-Version: 1.0
From: Andrei Vagin <avagin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [fs/pipe] 5a519c8fe4: WARNING:at_mm/page_alloc.c:#__alloc_pages
Date: Thu, 21 Apr 2022 08:35:41 -0700
Message-ID: <CANaxB-yVLCSHAi3QKMYzsSDRYC5Wz05iWx8yrb57cbiJ__5ThA@mail.gmail.com>
In-Reply-To: <CAHk-=wi6pJhsWLd7t9wEtq5tWh_2O61cSLk-wCgLwFrjW6+jbw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3388911905379638967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 12:07 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Apr 20, 2022 at 12:37 AM kernel test robot
> <oliver.sang@intel.com> wrote:
> >
> > commit: 5a519c8fe4d6 ("fs/pipe: use kvcalloc to allocate a pipe_buffer =
array")
> >
> > [   32.170781][ T3729] WARNING: The mand mount option has been deprecat=
ed and
> > [   32.170781][ T3729]          and is ignored by this kernel. Remove t=
he mand
> > [   32.170781][ T3729]          option from the mount to silence this w=
arning.
>
> Heh. Not that warning.
>
> This warning:
>
> > [ 224.552771][ T3730] WARNING: CPU: 1 PID: 3730 at mm/page_alloc.c:5364=
 __alloc_pages (mm/page_alloc.c:5364)
>
> That's just the
>
>   5363          if (unlikely(order >=3D MAX_ORDER)) {
>   5364                  WARN_ON_ONCE(!(gfp & __GFP_NOWARN));
>   5365                  return NULL;
>   5366          }
>
> so somebody is doing a big allocation that will fail, and doesn't use
> __GFP_NOWARN.
>
> That someone being iter_file_splice_write():
>
> > [ 224.567299][ T3730] kmalloc_order (include/linux/gfp.h:572 include/li=
nux/gfp.h:595 include/linux/gfp.h:609 mm/slab_common.c:944)
> > [ 224.567707][ T3730] kmalloc_order_trace (mm/slab_common.c:960)
> > [ 224.568173][ T3730] __kmalloc (include/linux/slab.h:510 mm/slub.c:441=
3)
> > [ 224.568571][ T3730] iter_file_splice_write (include/linux/slab.h:? in=
clude/linux/slab.h:652 fs/splice.c:628)
> > [ 224.570060][ T3730] do_splice (fs/splice.c:767 fs/splice.c:1079)
> > [ 224.572386][ T3730] __ia32_sys_splice (fs/splice.c:1144 fs/splice.c:1=
350 fs/splice.c:1332 fs/splice.c:1332)
>
> and that's the
>
>         int nbufs =3D pipe->max_usage;
>         struct bio_vec *array =3D kcalloc(nbufs, sizeof(struct bio_vec),
>                                         GFP_KERNEL);
>
> thing, and no, using __GFP_NOWARN here isn't what we'd want to do,
> because the code in question has no fallback (it will just return
> -ENOMEM).
>
> Now, technically, returning -ENOMEM is a "fallback", but not really.
> It just means the kernel won't crash, it doesn't mean that this is
> acceptable behavior.
>
> Basically, that commit 5a519c8fe4d6 made it possible to create a pipe
> that is effectively "too large to be used". It used to be that such a
> pipe could never be created before, because the 'pipe->bufs' resizing
> allocation used to be
>
>         bufs =3D kcalloc(nr_slots, sizeof(*bufs),
>                        GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
>
> and 'sizeof(struct pipe_buffer)' is bigger than 'sizeof(struct
> bio_vec)', so if the resizing was successful, then the pipe buffer
> count was guaranteed to be smaller than what that file_splice code
> would use.
>
> So it really does look like this whole "allow the pipe size to grow
> almost unlimited" change was a fundamental mistake. It has these kinds
> of subtle issues.
>
> I'm inclined to revert commit 5a519c8fe4d6 - doing multiple iterations
> really shouldn't be so expensive, and this shows that the whole "try
> to do it in one big go" is fundamentally broken.
>
> Could 'iter_file_splice_write()' be changed to limit it some way? Yes.
>
> Could it be changed to use kvcalloc() too? Yes again.
>
> But I'm not convinced that some odd corner-case CRIU optimization is
> worth this kind of pain.

Sorry for the inconvenience. This change is critical for the live
(iterative) migration scenario. For this case, we have the pre-dump
operation that dumps processes memory without freezing processes. The
memory tracker is used to detect what pages have been changed from the
previous iterations. The pre-dump operation requires being able to grub
process pages with minimal process downtime. We use pipes for that. CRIU
injects a parasite code to a target process, vmsplice-s memory to pipes,
resumes the process, and dumps pages from pipes while the process
continues doing its job. Right now, we can do reliably pipes with the 3MB
capacity (1 << PAGE_ALLOC_COSTLY_ORDER) * PAGE_SIZE / sizeof(struct
kernel_pipe_buffer).
It means that 1000 pipes allow us to dump only 3GB of memory.
The operation of injecting/curing parasite code from the
process is expensive and requires freezing a process. This is why we
want to maximize the load that we can carry on for each iteration. And I
am not sure that we can solve this problem without any kernel changes.
For us, it is the optimization of the often used code path. I know CRIU its=
elf
is an odd corner case, but anyway it would be good if we can find a solutio=
n.

We made another attempt to solve the problem by introducing
process_vmsplice https://lkml.org/lkml/2018/1/9/32. It is stuck with a
very similar explanation:

> All seems fairly straightforward.  The big question is: do we know
> that people will actually use this, and get sufficient value from it
> to justify its addition?

Thanks,
Andrei


>
>                       Linus
--===============3388911905379638967==--

