Content-Type: multipart/mixed; boundary="===============6660006230710245366=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [blk] 47e0fb461f: BUG:unable_to_handle_kernel
Date: Sat, 21 Oct 2017 09:39:30 -0700
Message-ID: <20171021163930.GV1302522@devbig577.frc2.facebook.com>
In-Reply-To: <20171013005113.GU26196@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6660006230710245366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

(cc'ing Greg and quoting whole body)

Greg, didn't we fix this some months ago?  It looks like the issue
where the hot unplug test code triggers detach before async probe is
flushed.

Thanks.

On Fri, Oct 13, 2017 at 08:51:13AM +0800, Ye Xiaolong wrote:
> On 10/09, Tejun Heo wrote:
> >Hello,
> >
> >On Sat, Sep 30, 2017 at 01:21:13PM -0700, Linus Torvalds wrote:
> >> Tejun, any ideas? The original report is at
> >> =

> >>    https://lkml.org/lkml/2017/9/20/939
> >> =

> >> in case you don't see it in your inbox from lkml.
> >
> >So, in the full log, there is an earlier warning.
> >
> > [   60.198729] ------------[ cut here ]------------
> > [   60.199708] WARNING: CPU: 0 PID: 1 at drivers/ata/libata-core.c:6533=
 ata_host_detach+0x65/0xef
> > [   60.201642] CPU: 0 PID: 1 Comm: swapper Tainted: G S              4.=
12.0-rc5-00126-g47e0fb46 #1
> > [   60.203370] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.9.3-20161025_171302-gandalf 04/01/2014
> > [   60.205276] task: d9b10040 task.stack: d9b0a000
> > [   60.206377] EIP: ata_host_detach+0x65/0xef
> > [   60.207254] EFLAGS: 00210246 CPU: 0
> > [   60.208051] EAX: fffffffd EBX: d5f80000 ECX: 00000000 EDX: d57d6a80
> > [   60.209158] ESI: 00200282 EDI: 00000000 EBP: d9b0be70 ESP: d9b0be60
> > [   60.210262]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> > [   60.211264] CR0: 80050033 CR2: 00000000 CR3: 02a75000 CR4: 001406b0
> > [   60.212370] Call Trace:
> > [   60.213060]  ata_pci_remove_one+0xe/0x10
> > [   60.213914]  piix_remove_one+0x25/0x28
> > [   60.214750]  pci_device_remove+0x1c/0x44
> > [   60.215607]  driver_probe_device+0x188/0x34d
> > [   60.216501]  __driver_attach+0x64/0xb4
> > [   60.217341]  bus_for_each_dev+0x4f/0x63
> > [   60.218175]  driver_attach+0x14/0x16
> > [   60.218988]  ? driver_probe_device+0x34d/0x34d
> > [   60.219895]  bus_add_driver+0xba/0x1d4
> > [   60.220721]  driver_register+0x6e/0xa0
> > [   60.221562]  __pci_register_driver+0x28/0x2b
> > [   60.222465]  ? pdc_sata_pci_driver_init+0x16/0x16
> > [   60.223406]  piix_init+0x14/0x24
> > [   60.224178]  do_one_initcall+0x89/0x12d
> > [   60.225016]  ? parse_args+0x102/0x298
> > [   60.225915] sd 1:0:0:0: [sda] 16384 512-byte logical blocks: (8.39 M=
B/8.00 MiB)
> > [   60.227523]  kernel_init_freeable+0xec/0x168
> > [   60.228421]  ? rest_init+0x6a/0x6a
> > [   60.229225]  kernel_init+0x8/0xcb
> > [   60.230003]  ret_from_fork+0x19/0x30
> >
> >It looks like somebody is trying to detach the device while async
> >probing is in progress, making later async operations free-after-use.
> >There was a driver core driver detach autotest feature which
> >incorrectly invoked driver detach while async probes are in progress
> >and this looks like that.  This has already been fixed.  Xialong, can
> >you repro this on the latest kernel?
> =

> I can reproduce this warning on commit ff5abbe799e29099695cb8b5b2f198dd8b=
8bdf26
> for 5 times run. See dmesg attached.
> =

> Thanks,
> Xialong
> >
> >Thanks.
> >
> >-- =

> >tejun



-- =

tejun

--===============6660006230710245366==--

