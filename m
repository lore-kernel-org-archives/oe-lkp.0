Content-Type: multipart/mixed; boundary="===============0405776811385560684=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: BUG: Bad page map in process python2 pte:10000000000 pmd:17e8be067
Date: Thu, 03 May 2018 07:42:57 -0700
Message-ID: <7d386ba4-85ba-85dd-4f81-4cc984b149dd@intel.com>
In-Reply-To: <CAAuJbeKT1eBxT4Y8FgQBrQcFDU_3R8ad=s_8zsyj+GPiZT7VhQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0405776811385560684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/02/2018 08:20 PM, Huaitong Han wrote:
> =

> kernel: swap_free: Bad swap file entry 1000000000103256
> kernel: BUG: Bad page map in process in:imjournal  pte:8192b1000 pmd:3ff9=
324067
> kernel: addr:00007f920adc5000 vm_flags:080000d1 anon_vma:
> (null) mapping:ffff883fe5284960 index:3f8
> kernel: vma->vm_ops->fault: shmem_fault+0x0/0x1d0
> kernel: vma->vm_file->f_op->mmap: shmem_mmap+0x0/0x30
> kernel: CPU: 5 PID: 9166 Comm: in:imjournal Tainted: G        W  OE
> K------------   3.10.0-514.16.1.el7.x86_64 #1

This looks like an entirely different signature.  There are lots of bits
set in the bad swap entry instead of a single one.  It's also a vintage
RHEL kernel, not mainline.

--===============0405776811385560684==--

