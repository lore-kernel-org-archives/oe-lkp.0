Content-Type: multipart/mixed; boundary="===============4877018188363207049=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/vunmap] e47110e905: WARNING:at_mm/vmalloc.c:#__vunmap
Date: Fri, 23 Apr 2021 10:18:18 -0700
Message-ID: <CAHk-=wg8iAG6bBB+zdoZvZx1XYmyAXrWL0gPs_eTrTt+tXN0Tw@mail.gmail.com>
In-Reply-To: <20210423063227.GA17429@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4877018188363207049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 11:15 PM kernel test robot
<oliver.sang@intel.com> wrote:
>
> commit: e47110e90584a22e9980510b00d0dfad3a83354e ("mm/vunmap: add cond_re=
sched() in vunmap_pmd_range")

Funky. That commit doesn't seem to have anything to do with the oops.

The oops is odd too:

> [  198.731223] WARNING: CPU: 0 PID: 1948 at mm/vmalloc.c:2247 __vunmap (k=
build/src/consumer/mm/vmalloc.c:2247 (discriminator 1))

That's the warning for an unaligned vunmap():

  2247          if (WARN(!PAGE_ALIGNED(addr), "Trying to vfree() bad
address (%p)\n",
  2248                          addr))
  2249                  return;

> [  198.744933] Call Trace:
> [  198.745229] free_module (kbuild/src/consumer/kernel/module.c:2251)

  2248          /* This may be empty, but that's OK */
  2249          module_arch_freeing_init(mod);
  2250          module_memfree(mod->init_layout.base);
  2251          kfree(mod->args);

That's the "module_memfree()" - the return address points to the
return point, which is the next line.

And as far as I can tell, the only thing that assigns anything but
NULL to that init_layout.base is

                ptr =3D module_alloc(mod->init_layout.size);

which uses __vmalloc_node_range() for the allocation.

So absolutely nothing in this report makes sense to me. I suspect it's
some odd memory corruption.

Oliver - how reliable is that bisection?

Does anybody else see what might be up?

            Linus
--===============4877018188363207049==--

