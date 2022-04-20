Content-Type: multipart/mixed; boundary="===============2539260640916112645=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fs/pipe] 5a519c8fe4: WARNING:at_mm/page_alloc.c:#__alloc_pages
Date: Wed, 20 Apr 2022 12:07:40 -0700
Message-ID: <CAHk-=wi6pJhsWLd7t9wEtq5tWh_2O61cSLk-wCgLwFrjW6+jbw@mail.gmail.com>
In-Reply-To: <20220420073717.GD16310@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2539260640916112645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 12:37 AM kernel test robot
<oliver.sang@intel.com> wrote:
>
> commit: 5a519c8fe4d6 ("fs/pipe: use kvcalloc to allocate a pipe_buffer ar=
ray")
>
> [   32.170781][ T3729] WARNING: The mand mount option has been deprecated=
 and
> [   32.170781][ T3729]          and is ignored by this kernel. Remove the=
 mand
> [   32.170781][ T3729]          option from the mount to silence this war=
ning.

Heh. Not that warning.

This warning:

> [ 224.552771][ T3730] WARNING: CPU: 1 PID: 3730 at mm/page_alloc.c:5364 _=
_alloc_pages (mm/page_alloc.c:5364)

That's just the

  5363          if (unlikely(order >=3D MAX_ORDER)) {
  5364                  WARN_ON_ONCE(!(gfp & __GFP_NOWARN));
  5365                  return NULL;
  5366          }

so somebody is doing a big allocation that will fail, and doesn't use
__GFP_NOWARN.

That someone being iter_file_splice_write():

> [ 224.567299][ T3730] kmalloc_order (include/linux/gfp.h:572 include/linu=
x/gfp.h:595 include/linux/gfp.h:609 mm/slab_common.c:944)
> [ 224.567707][ T3730] kmalloc_order_trace (mm/slab_common.c:960)
> [ 224.568173][ T3730] __kmalloc (include/linux/slab.h:510 mm/slub.c:4413)
> [ 224.568571][ T3730] iter_file_splice_write (include/linux/slab.h:? incl=
ude/linux/slab.h:652 fs/splice.c:628)
> [ 224.570060][ T3730] do_splice (fs/splice.c:767 fs/splice.c:1079)
> [ 224.572386][ T3730] __ia32_sys_splice (fs/splice.c:1144 fs/splice.c:135=
0 fs/splice.c:1332 fs/splice.c:1332)

and that's the

        int nbufs =3D pipe->max_usage;
        struct bio_vec *array =3D kcalloc(nbufs, sizeof(struct bio_vec),
                                        GFP_KERNEL);

thing, and no, using __GFP_NOWARN here isn't what we'd want to do,
because the code in question has no fallback (it will just return
-ENOMEM).

Now, technically, returning -ENOMEM is a "fallback", but not really.
It just means the kernel won't crash, it doesn't mean that this is
acceptable behavior.

Basically, that commit 5a519c8fe4d6 made it possible to create a pipe
that is effectively "too large to be used". It used to be that such a
pipe could never be created before, because the 'pipe->bufs' resizing
allocation used to be

        bufs =3D kcalloc(nr_slots, sizeof(*bufs),
                       GFP_KERNEL_ACCOUNT | __GFP_NOWARN);

and 'sizeof(struct pipe_buffer)' is bigger than 'sizeof(struct
bio_vec)', so if the resizing was successful, then the pipe buffer
count was guaranteed to be smaller than what that file_splice code
would use.

So it really does look like this whole "allow the pipe size to grow
almost unlimited" change was a fundamental mistake. It has these kinds
of subtle issues.

I'm inclined to revert commit 5a519c8fe4d6 - doing multiple iterations
really shouldn't be so expensive, and this shows that the whole "try
to do it in one big go" is fundamentally broken.

Could 'iter_file_splice_write()' be changed to limit it some way? Yes.

Could it be changed to use kvcalloc() too? Yes again.

But I'm not convinced that some odd corner-case CRIU optimization is
worth this kind of pain.

                      Linus
--===============2539260640916112645==--

