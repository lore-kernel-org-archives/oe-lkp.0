Content-Type: multipart/mixed; boundary="===============8689034001461553804=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] b1f0502d04: INFO:trying_to_register_non-static_key
Date: Tue, 03 Apr 2018 18:03:22 -0700
Message-ID: <alpine.DEB.2.20.1804031802110.50064@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.20.1804031748120.27686@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8689034001461553804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Apr 2018, David Rientjes wrote:

> > >> I found the root cause of this lockdep warning.
> > >>
> > >> In mmap_region(), unmap_region() may be called while vma_link() has =
not been
> > >> called. This happens during the error path if call_mmap() failed.
> > >>
> > >> The only to fix that particular case is to call
> > >> seqcount_init(&vma->vm_sequence) when initializing the vma in mmap_r=
egion().
> > >>
> > > =

> > > Ack, although that would require a fixup to dup_mmap() as well.
> > =

> > You're right, I'll fix that too.
> > =

> =

> I also think the following is needed:
> =

> diff --git a/fs/exec.c b/fs/exec.c
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -312,6 +312,10 @@ static int __bprm_mm_init(struct linux_binprm *bprm)
>  	vma->vm_flags =3D VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_S=
ETUP;
>  	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> +#ifdef CONFIG_SPECULATIVE_PAGE_FAULT
> +	seqcount_init(&vma->vm_sequence);
> +	atomic_set(&vma->vm_ref_count, 0);
> +#endif
>  =

>  	err =3D insert_vm_struct(mm, vma);
>  	if (err)
> =


Ugh, I think there are a number of other places where this is needed as =

well in mm/mmap.c.  I think it would be better to just create a new =

alloc_vma(unsigned long flags) that all vma allocators can use and for =

CONFIG_SPECULATIVE_PAGE_FAULT will initialize the seqcount_t and atomic_t.

--===============8689034001461553804==--

