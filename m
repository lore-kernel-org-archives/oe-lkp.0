Content-Type: multipart/mixed; boundary="===============4608520666660785800=="
MIME-Version: 1.0
From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm] b1f0502d04: INFO:trying_to_register_non-static_key
Date: Wed, 28 Mar 2018 15:30:08 +0200
Message-ID: <aa6f2ff1-ff67-106a-e0e4-522ac82a7bf0@linux.vnet.ibm.com>
In-Reply-To: <alpine.DEB.2.20.1803251510040.80485@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4608520666660785800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 26/03/2018 00:10, David Rientjes wrote:
> On Wed, 21 Mar 2018, Laurent Dufour wrote:
> =

>> I found the root cause of this lockdep warning.
>>
>> In mmap_region(), unmap_region() may be called while vma_link() has not =
been
>> called. This happens during the error path if call_mmap() failed.
>>
>> The only to fix that particular case is to call
>> seqcount_init(&vma->vm_sequence) when initializing the vma in mmap_regio=
n().
>>
> =

> Ack, although that would require a fixup to dup_mmap() as well.

You're right, I'll fix that too.

Thanks a lot.
Laurent.


--===============4608520666660785800==--

