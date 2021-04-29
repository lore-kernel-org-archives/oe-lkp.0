Content-Type: multipart/mixed; boundary="===============5970207216660439205=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/vunmap] e47110e905: WARNING:at_mm/vmalloc.c:#__vunmap
Date: Thu, 29 Apr 2021 10:31:48 -0700
Message-ID: <CAHk-=wh62h6XXgKqhHnb=LTrmbMcVsV8GhXJvEoceTyHKtdBJA@mail.gmail.com>
In-Reply-To: <20210429075300.GA31265@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5970207216660439205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Backgroudn for Jessica:

    https://lore.kernel.org/lkml/20210423063227.GA17429(a)xsang-OptiPlex-90=
20/

  with some more emails in this thread ]

On Thu, Apr 29, 2021 at 12:36 AM Oliver Sang <oliver.sang@intel.com> wrot=
e:
> >
> > Oh, that's interesting. So only 12 out of 74 runs saw that __vunmap
> > warning, but if I understand your table correctly, there were some
> > _other_ issues in there?
>
> yes, there are.

Yeah, so it really does look like the commit you bisected to changes
timing - and thus just exposes an existing problem.

And it's likely a race condition, and it exposes the existing problem
not just in a new place, but much *MORE*.

The fact that you see something like

    Trying to vfree() bad address (0000000070935066)

means that clearly something has corrupted the the module data in
'struct module *'. Because that should have been a core_layout.base
pointer that was allocated with moodule_alloc(), which is just a
vmalloc wrapper on x86-64.

The allocations in the module handling are somewhat odd (putting it
mildly), with that 'struct module *' actually being a pointer *into*
the module allocation itself, so I suspect there's some race with
del_module() or something, and the reason you bisect to that commit
e47110e90584a22e9980510b00d0dfad3a83354e is that the added
cond_schedule() in the vfree path now exposes exactly that race of two
things trying to free the same module at the same time.

This all *should* be serialized by various subtle things

 - MODULE_STATE_UNFORMED means that modules are bypassed

 - the actual allocation/freeing functions use module_mutex to serialize

 - some lookup functions use RCU to look up a module but should then
only look at things like the symbol arrays etc.

but if somehow del_module() can race with do_init_module() creating a
module halfway and then doing free_module() (or perhaps multiple
module loads of the same module racing and aborting), then I can see
one freeing the underlying module data, and the other one seeing
corrupt 'struct module *' as a result.

I suspect the other oopses are different symptoms of the same bug, and
I wonder if they woudl give more hints about what the "other side" of
the thing is. Like that BUG:unable_to_handle_page_fault_for_address /
canonical_address one that you have multiple hits for on both side of
that commit you bisected to?

Jessica, have you seen any particular problematic module loading
reports that could give other hints about what goes wrong?

             Linus
--===============5970207216660439205==--

