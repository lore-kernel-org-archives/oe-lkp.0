Content-Type: multipart/mixed; boundary="===============1755534442110006369=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 5b710f34e1: kernel BUG at mm/usercopy.c:75!
Date: Wed, 17 Aug 2016 09:14:51 -0700
Message-ID: <CA+55aFw2Hxyavo5unZuu8YkNbsSwC1G5dSsrWYpNSq3kFnRWHg@mail.gmail.com>
In-Reply-To: <57b455f0.PBbMwoqYXi+gB2ZE%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1755534442110006369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2016 at 5:17 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> [  177.875629] usercopy: kernel memory overwrite attempt detected to 8002=
8f40 (<spans multiple pages>) (512 bytes)

Ugh. This is a bug in the memory access hardening code.

I think it's this:

                        err =3D __copy_from_user(&fpu->state.xsave,
                                               buf_fx, state_size);

where it's copying the xsave area into the kernel buffer. That fpu
buffer is part of the thread structure:

                struct fpu *fpu =3D &tsk->thread.fpu;

and the thread struct allocation is two pages at 80028000:

> [  178.037761] task: 80028000 ti: 8002a000 task.ti: 8002a000

So yes, it "crosses" the page from 80028000 to 80029000, but the task
allocation is fine, at 80028000-8002a000.

The check_heap_object() code is simply buggy. It does seem to try to
handle this, by handling compound pages:

        /* Allow if start and end are inside the same compound page. */
        endpage =3D virt_to_head_page(end);
        if (likely(endpage =3D=3D page))
                return NULL;

but compound pages are about the mapping of hugepages, not about
simple multi-order allocations like the task structure (or slab
entries).

In other words, it looks like the memory hardening is simply broken
for any case that doesn't use kmalloc(), but instead just allocates
non-order-0 pages directly. Which is certainly _rare_, but not unheard
of.

I'm not sure how to fix it.The low-level page allocator does *not*
mark orders anywhere.

I suspect we should just get rid of the page-crosser checking, because
it's unsolvable.

                  Linus

--===============1755534442110006369==--

