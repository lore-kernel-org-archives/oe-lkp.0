Content-Type: multipart/mixed; boundary="===============6004077397814013697=="
MIME-Version: 1.0
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: lkp@lists.01.org
Subject: Re: [init/initramfs.c] e7cb072eb9: invoked_oom-killer:gfp_mask=0x
Date: Fri, 11 Jun 2021 11:20:18 +0200
Message-ID: <db82c1c9-edfe-6ee2-c403-d6740e8c46c6@rasmusvillemoes.dk>
In-Reply-To: <20210611084817.GB26476@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6004077397814013697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/06/2021 10.48, Oliver Sang wrote:
> hi Rasmus,
> =

> On Tue, Jun 08, 2021 at 09:42:58AM +0200, Rasmus Villemoes wrote:
>> On 07/06/2021 16.44, kernel test robot wrote:
>>>


>> Also, I don't have 16G to give to a virtual machine. I tried running the
>> bzImage with that modules.cgz under qemu with some naive parameters just
>> to get some output [1], but other than failing because there's no rootfs
>> to mount (as expected), I only managed to make it fail when providing
>> too little memory (the .cgz is around 70M, decompressed about 200M -
>> giving '-m 1G' to qemu works fine). You mention the vmalloc=3D argument,
>> but I can't make the decompression fail when passing either vmalloc=3D12=
8M
>> or vmalloc=3D512M or no vmalloc=3D at all.
> =

> sorry about this. we also tried to follow exactly above steps to test on
> some local machine (8G memory), but cannot reproduce. we are analyzing
> what's the diference in our automaion run in test cluster, which reproduc=
ed
> the issue consistently. will update you when we have findings.

OK. It's really odd that providing the VM with _more_ memory makes it
fail (other then the obvious failure in the other direction when there's
simply not enough memory for the unpacked initramfs itself). But
unfortunately that also sounds like I won't be able to reproduce with
the HW I have.

>> As an extra data point, what happens if you add initramfs_async=3D0 to t=
he
>> command line?
> =

> yes, we tested this before sending out the report. the issue gone
> if initramfs_async=3D0 is added.

Hm. Sounds like some initcall after rootfs_initcall time must
allocate/hog a lot of memory, perhaps with some heuristic depending on
how much is available.

Can you try with initcall_debug=3D1? I think that should produce a lot of
output, hopefully that would make it possible to see which initcalls
have been done just prior to (or while) the initramfs unpacking hits ENOMEM.

Thanks,
Rasmus
--===============6004077397814013697==--

