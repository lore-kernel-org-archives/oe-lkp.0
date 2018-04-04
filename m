Content-Type: multipart/mixed; boundary="===============5888257125555738039=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] b1f0502d04: INFO:trying_to_register_non-static_key
Date: Wed, 04 Apr 2018 14:53:51 -0700
Message-ID: <alpine.DEB.2.20.1804041451220.152749@chino.kir.corp.google.com>
In-Reply-To: <147e8be3-2c33-2111-aacc-dc2bb932fa8c@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5888257125555738039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Apr 2018, Laurent Dufour wrote:

> > I also think the following is needed:
> > =

> > diff --git a/fs/exec.c b/fs/exec.c
> > --- a/fs/exec.c
> > +++ b/fs/exec.c
> > @@ -312,6 +312,10 @@ static int __bprm_mm_init(struct linux_binprm *bpr=
m)
> >  	vma->vm_flags =3D VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE=
_SETUP;
> >  	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> >  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> > +#ifdef CONFIG_SPECULATIVE_PAGE_FAULT
> > +	seqcount_init(&vma->vm_sequence);
> > +	atomic_set(&vma->vm_ref_count, 0);
> > +#endif
> > =

> >  	err =3D insert_vm_struct(mm, vma);
> >  	if (err)
> =

> No, this not needed because the vma is allocated with kmem_cache_zalloc()=
 so
> vm_ref_count is 0, and insert_vm_struc() will later call
> __vma_link_rb() which will call seqcount_init().
> =

> Furhtermore, in case of error, the vma structure is freed without calling
> get_vma() so there is risk of lockdep warning.
> =


Perhaps you're working from a different tree than I am, or you fixed the =

lockdep warning differently when adding to dup_mmap() and mmap_region().

I got the following two lockdep errors.

I fixed it locally by doing the seqcount_init() and atomic_set() =

everywhere a vma could be initialized.

INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 12 PID: 1 Comm: init Not tainted
Call Trace:
 [<ffffffff8b12026f>] dump_stack+0x67/0x98
 [<ffffffff8a92b616>] register_lock_class+0x1e6/0x4e0
 [<ffffffff8a92cfe9>] __lock_acquire+0xb9/0x1710
 [<ffffffff8a92ef3a>] lock_acquire+0xba/0x200
 [<ffffffff8aa827df>] mprotect_fixup+0x10f/0x310
 [<ffffffff8aade3fd>] setup_arg_pages+0x12d/0x230
 [<ffffffff8ab4564a>] load_elf_binary+0x44a/0x1740
 [<ffffffff8aadde9b>] search_binary_handler+0x9b/0x1e0
 [<ffffffff8ab44e96>] load_script+0x206/0x270
 [<ffffffff8aadde9b>] search_binary_handler+0x9b/0x1e0
 [<ffffffff8aae0355>] do_execveat_common.isra.32+0x6b5/0x9d0
 [<ffffffff8aae069c>] do_execve+0x2c/0x30
 [<ffffffff8a80047b>] run_init_process+0x2b/0x30
 [<ffffffff8b1358d4>] kernel_init+0x54/0x110
 [<ffffffff8b2001ca>] ret_from_fork+0x3a/0x50

and

INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 21 PID: 1926 Comm: mkdir Not tainted
Call Trace:
 [<ffffffff985202af>] dump_stack+0x67/0x98
 [<ffffffff97d2b616>] register_lock_class+0x1e6/0x4e0
 [<ffffffff97d2cfe9>] __lock_acquire+0xb9/0x1710
 [<ffffffff97d2ef3a>] lock_acquire+0xba/0x200
 [<ffffffff97e73c09>] unmap_page_range+0x89/0xaa0
 [<ffffffff97e746af>] unmap_single_vma+0x8f/0x100
 [<ffffffff97e74a1b>] unmap_vmas+0x4b/0x90
 [<ffffffff97e7f833>] exit_mmap+0xa3/0x1c0
 [<ffffffff97cc1b23>] mmput+0x73/0x120
 [<ffffffff97ccbacd>] do_exit+0x2bd/0xd60
 [<ffffffff97ccc5b7>] SyS_exit+0x17/0x20
 [<ffffffff97c01f1d>] do_syscall_64+0x6d/0x1a0
 [<ffffffff9860005a>] entry_SYSCALL_64_after_hwframe+0x26/0x9b

I think it would just be better to generalize vma allocation to initialize =

certain fields and init both spf fields properly for =

CONFIG_SPECULATIVE_PAGE_FAULT.  It's obviously too delicate as is.

--===============5888257125555738039==--

