Content-Type: multipart/mixed; boundary="===============3831312702347003706=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] b1f0502d04: INFO:trying_to_register_non-static_key
Date: Sun, 25 Mar 2018 15:10:29 -0700
Message-ID: <alpine.DEB.2.20.1803251510040.80485@chino.kir.corp.google.com>
In-Reply-To: <792c0f75-7e7f-cd81-44ae-4205f6e4affc@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3831312702347003706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Mar 2018, Laurent Dufour wrote:

> I found the root cause of this lockdep warning.
> =

> In mmap_region(), unmap_region() may be called while vma_link() has not b=
een
> called. This happens during the error path if call_mmap() failed.
> =

> The only to fix that particular case is to call
> seqcount_init(&vma->vm_sequence) when initializing the vma in mmap_region=
().
> =


Ack, although that would require a fixup to dup_mmap() as well.

--===============3831312702347003706==--

