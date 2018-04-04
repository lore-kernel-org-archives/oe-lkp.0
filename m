Content-Type: multipart/mixed; boundary="===============7634280089214479289=="
MIME-Version: 1.0
From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm] b1f0502d04: INFO:trying_to_register_non-static_key
Date: Wed, 04 Apr 2018 12:28:44 +0200
Message-ID: <964ecdb1-3a2a-96b5-5a9c-5c12f874ea84@linux.vnet.ibm.com>
In-Reply-To: <alpine.DEB.2.20.1804031802110.50064@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7634280089214479289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/04/2018 03:03, David Rientjes wrote:
> On Tue, 3 Apr 2018, David Rientjes wrote:
> =

>>>>> I found the root cause of this lockdep warning.
>>>>>
>>>>> In mmap_region(), unmap_region() may be called while vma_link() has n=
ot been
>>>>> called. This happens during the error path if call_mmap() failed.
>>>>>
>>>>> The only to fix that particular case is to call
>>>>> seqcount_init(&vma->vm_sequence) when initializing the vma in mmap_re=
gion().
>>>>>
>>>>
>>>> Ack, although that would require a fixup to dup_mmap() as well.
>>>
>>> You're right, I'll fix that too.
>>>
>>
>> I also think the following is needed:
>>
>> diff --git a/fs/exec.c b/fs/exec.c
>> --- a/fs/exec.c
>> +++ b/fs/exec.c
>> @@ -312,6 +312,10 @@ static int __bprm_mm_init(struct linux_binprm *bprm)
>>  	vma->vm_flags =3D VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_=
SETUP;
>>  	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
>> +#ifdef CONFIG_SPECULATIVE_PAGE_FAULT
>> +	seqcount_init(&vma->vm_sequence);
>> +	atomic_set(&vma->vm_ref_count, 0);
>> +#endif
>>  =

>>  	err =3D insert_vm_struct(mm, vma);
>>  	if (err)
>>
> =

> Ugh, I think there are a number of other places where this is needed as =

> well in mm/mmap.c.  I think it would be better to just create a new =

> alloc_vma(unsigned long flags) that all vma allocators can use and for =

> CONFIG_SPECULATIVE_PAGE_FAULT will initialize the seqcount_t and atomic_t.
> =


I don't think this is really needed, most of the time the vma structure is
allocated cleared and is then link to rb tree via vma_link.

The only case generating a locked warning is when the vma is referenced in =
the
error path before being linked in the mm tree and that is not usual.


--===============7634280089214479289==--

