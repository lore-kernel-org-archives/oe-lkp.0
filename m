Content-Type: multipart/mixed; boundary="===============4083176808167873300=="
MIME-Version: 1.0
From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm] b1f0502d04: INFO:trying_to_register_non-static_key
Date: Wed, 04 Apr 2018 12:19:48 +0200
Message-ID: <147e8be3-2c33-2111-aacc-dc2bb932fa8c@linux.vnet.ibm.com>
In-Reply-To: <alpine.DEB.2.20.1804031748120.27686@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4083176808167873300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/04/2018 02:48, David Rientjes wrote:
> On Wed, 28 Mar 2018, Laurent Dufour wrote:
> =

>> On 26/03/2018 00:10, David Rientjes wrote:
>>> On Wed, 21 Mar 2018, Laurent Dufour wrote:
>>>
>>>> I found the root cause of this lockdep warning.
>>>>
>>>> In mmap_region(), unmap_region() may be called while vma_link() has no=
t been
>>>> called. This happens during the error path if call_mmap() failed.
>>>>
>>>> The only to fix that particular case is to call
>>>> seqcount_init(&vma->vm_sequence) when initializing the vma in mmap_reg=
ion().
>>>>
>>>
>>> Ack, although that would require a fixup to dup_mmap() as well.
>>
>> You're right, I'll fix that too.
>>
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
> =

>  	err =3D insert_vm_struct(mm, vma);
>  	if (err)

No, this not needed because the vma is allocated with kmem_cache_zalloc() so
vm_ref_count is 0, and insert_vm_struc() will later call
__vma_link_rb() which will call seqcount_init().

Furhtermore, in case of error, the vma structure is freed without calling
get_vma() so there is risk of lockdep warning.


--===============4083176808167873300==--

