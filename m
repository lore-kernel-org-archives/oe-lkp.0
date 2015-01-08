Content-Type: multipart/mixed; boundary="===============0786170566078918457=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [null_blk] f2298c0403b:
Date: Thu, 08 Jan 2015 08:52:51 +0800
Message-ID: <1420678371.6201.78.camel@intel.com>
In-Reply-To: <54AD4F98.6070702@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0786170566078918457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-01-07 at 08:24 -0700, Jens Axboe wrote:
> On 01/06/2015 07:33 PM, Huang Ying wrote:
> > FYI, we noticed the below changes on
> >
> > commit f2298c0403b0dfcaef637eba0c02c4a06d7a25ab ("null_blk: multi queue=
 aware block test driver")
> >
> >
> > testbox/testcase/testparams: vm-kbuild-yocto-i386/boot/1
> >
> > 320ae51feed5c2f1  f2298c0403b0dfcaef637eba0c
> > ----------------  --------------------------
> >         fail:runs  %reproduction    fail:runs
> >             |             |             |
> >             :10         100%          10:10    kmsg.VFS:could_not_find_=
a_valid_V7_on_nullb1
> >             :10         100%          10:10    kmsg.VFS:could_not_find_=
a_valid_V7_on_nullb0
> >            1:10         -10%            :10    kmsg.vm86_32:could_not_a=
ccess_userspace_vm86_info
> >
> > vm-kbuild-yocto-i386: qemu-system-i386 -enable-kvm
> > Memory: 320M
> >
> > [    1.971241] mtip32xx Version 1.2.6os3
> > [    1.971311] blk-mq: CPU -> queue map
> > [    1.971312]   CPU 0 -> Queue 0
> > [    1.971314]   CPU 1 -> Queue 0
> > [    1.971628]  nullb0: unknown partition table
> > [    1.971748] blk-mq: CPU -> queue map
> > [    1.971749]   CPU 0 -> Queue 0
> > [    1.971751]   CPU 1 -> Queue 0
> > [    1.972023]  nullb1: unknown partition table
> > [    1.972096] null: module loaded
> > [    1.972131] ibmasm: IBM ASM Service Processor Driver version 1.0 loa=
ded
> >
> > I think this is at least confusing for the end user.
> =

> Sorry, not sure I follow at all. If you're expecting the null block =

> driver to actually store data, then yes, you are going to have a bad =

> time. It's a test tool for storage stack development.

I understand that null block is just for testing.

I just think the message like:

[    1.971628]  nullb0: unknown partition table

may confuse the end user.  They may think there are something wrong.
But it is not.  Is there any way to suppress this?
 =

Best Regards,
Huang, Ying




--===============0786170566078918457==--

