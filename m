Content-Type: multipart/mixed; boundary="===============9032978437936243607=="
MIME-Version: 1.0
From: Jessica Yu <jeyu@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm/vunmap] e47110e905: WARNING:at_mm/vmalloc.c:#__vunmap
Date: Mon, 03 May 2021 16:43:05 +0200
Message-ID: <YJAL+cxa3p2q5zOu@gunter>
In-Reply-To: <CAHk-=wh62h6XXgKqhHnb=LTrmbMcVsV8GhXJvEoceTyHKtdBJA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9032978437936243607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+++ Linus Torvalds [29/04/21 10:31 -0700]:
>[ Backgroudn for Jessica:
>
>    https://lore.kernel.org/lkml/20210423063227.GA17429(a)xsang-OptiPlex-9=
020/
>
>  with some more emails in this thread ]
>
>On Thu, Apr 29, 2021 at 12:36 AM Oliver Sang <oliver.sang@intel.com> wro=
te:
>> >
>> > Oh, that's interesting. So only 12 out of 74 runs saw that __vunmap
>> > warning, but if I understand your table correctly, there were some
>> > _other_ issues in there?
>>
>> yes, there are.
>
>Yeah, so it really does look like the commit you bisected to changes
>timing - and thus just exposes an existing problem.
>
>And it's likely a race condition, and it exposes the existing problem
>not just in a new place, but much *MORE*.
>
>The fact that you see something like
>
>    Trying to vfree() bad address (0000000070935066)
>
>means that clearly something has corrupted the the module data in
>'struct module *'. Because that should have been a core_layout.base
>pointer that was allocated with moodule_alloc(), which is just a
>vmalloc wrapper on x86-64.
>
>The allocations in the module handling are somewhat odd (putting it
>mildly), with that 'struct module *' actually being a pointer *into*
>the module allocation itself, so I suspect there's some race with
>del_module() or something, and the reason you bisect to that commit
>e47110e90584a22e9980510b00d0dfad3a83354e is that the added
>cond_schedule() in the vfree path now exposes exactly that race of two
>things trying to free the same module at the same time.
>
>This all *should* be serialized by various subtle things
>
> - MODULE_STATE_UNFORMED means that modules are bypassed
>
> - the actual allocation/freeing functions use module_mutex to serialize
>
> - some lookup functions use RCU to look up a module but should then
>only look at things like the symbol arrays etc.
>
>but if somehow del_module() can race with do_init_module() creating a
>module halfway and then doing free_module() (or perhaps multiple
>module loads of the same module racing and aborting), then I can see
>one freeing the underlying module data, and the other one seeing
>corrupt 'struct module *' as a result.

The situation is bizarre to me. From the call trace:

[  198.744933] Call Trace:
[  198.745229] free_module (kbuild/src/consumer/kernel/module.c:2251)
[  198.745629] do_init_module (kbuild/src/consumer/kernel/module.c:3705)
[  198.746054] ? rcu_read_lock_bh_held (kbuild/src/consumer/kernel/rcu/upda=
te.c:131)
[  198.746576] load_module (kbuild/src/consumer/kernel/module.c:3968)

This tells me that we were in the middle of loading a module and hit one of=
 the
error conditions in do_init_module() - either the kmalloc() call failed or =
the
module init function returned an error and now we've landed in the error pa=
th
of do_init_module(), hence the call to free_module().

But if we failed here, this also means the module never made it to the LIVE
state - it was COMING, then immediately GOING. There is a liveness check in
delete_module(), so any calls to delete_module() on this module should have
returned -EBUSY. So module removal operations should not even be touching t=
his
module. Multiple module loads of the same name should have blocked while
waiting for this module to finish loading or fail loading.

Sorry I could not be more immediately helpful here, I will have to
stare at the error report a bit more and chew through some possible
race scenarios and get back to you on this..

--===============9032978437936243607==--

