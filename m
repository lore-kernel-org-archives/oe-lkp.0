Content-Type: multipart/mixed; boundary="===============7698070834550997428=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [usb] 56aa45adcc5: Fixed: WARNING: at kernel/mutex.c:199 mutex_lock_nested+0x121/0x349()
Date: Mon, 29 Jun 2015 08:30:57 +0800
Message-ID: <1435537857.12618.18.camel@intel.com>
In-Reply-To: <20150626160101.GA10056@saruman.tx.rr.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7698070834550997428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-06-26 at 11:01 -0500, Felipe Balbi wrote:
> Hi,
> =

> On Fri, Jun 26, 2015 at 10:32:30AM +0800, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =

> > master
> > commit 56aa45adcc5b793369e535a4b7177f1c7314b577 ("usb: gadget: make =

> > usb functions to load before gadget driver")
> > =

> > This commit fixed an warning as below:
> > =

> > [    8.571726] ------------[ cut here ]------------
> > [    8.572786] WARNING: at kernel/mutex.c:199 =

> > mutex_lock_nested+0x121/0x349()
> > [    8.572786] Hardware name: Standard PC (i440FX + PIIX, 1996)
> > [    8.572786] Pid: 1, comm: swapper/0 Not tainted 3.9.0-rc1-00006
> > -gfe2a429 #884
> > [    8.572786] Call Trace:
> > [    8.572786]  [<ffffffff81064ed2>] warn_slowpath_common+0x77/0x91
> > [    8.572786]  [<ffffffff81064fb3>] warn_slowpath_null+0x15/0x17
> > [    8.572786]  [<ffffffff81b8cbc3>] mutex_lock_nested+0x121/0x349
> > [    8.572786]  [<ffffffff810106f8>] ? sched_clock+0x9/0xd
> > [    8.572786]  [<ffffffff8108b161>] ? sched_clock_local+0x11/0x78
> > [    8.572786]  [<ffffffff81810ffb>] ? =

> > gserial_alloc_line+0x2a/0x1c0
> > [    8.572786]  [<ffffffff81810ffb>] gserial_alloc_line+0x2a/0x1c0
> > [    8.572786]  [<ffffffff81810ffb>] ? =

> > gserial_alloc_line+0x2a/0x1c0
> > [    8.572786]  [<ffffffff825867f7>] acm_ms_bind+0x2d/0x7ab
> > [    8.572786]  [<ffffffff81b8da18>] ? mutex_unlock+0x9/0xb
> > [    8.572786]  [<ffffffff81164e29>] ? sysfs_addrm_finish+0x16/0x52
> > [    8.572786]  [<ffffffff81163e5d>] ? =

> > sysfs_add_file_mode+0xa8/0xdc
> > [    8.572786]  [<ffffffff81163e9e>] ? sysfs_add_file+0xd/0xf
> > [    8.572786]  [<ffffffff81163ec3>] ? sysfs_create_file+0x23/0x25
> > [    8.572786]  [<ffffffff814a9079>] ? device_create_file+0x14/0x16
> > [    8.572786]  [<ffffffff81806c6e>] ? =

> > composite_dev_prepare+0xb0/0xe9
> > [    8.572786]  [<ffffffff81806e73>] composite_bind+0x9c/0x166
> > [    8.572786]  [<ffffffff825867b8>] ? m66592_probe+0x418/0x418
> > [    8.572786]  [<ffffffff8180476f>] udc_bind_to_driver+0x25/0xa6
> > [    8.572786]  [<ffffffff825867b8>] ? m66592_probe+0x418/0x418
> > [    8.572786]  [<ffffffff81804dd1>] =

> > usb_gadget_probe_driver+0x75/0x88
> > [    8.572786]  [<ffffffff81806fca>] usb_composite_probe+0x8d/0x8f
> > [    8.572786]  [<ffffffff825867c8>] init+0x10/0x12
> > [    8.572786]  [<ffffffff8254ae3e>] do_one_initcall+0x7a/0x13d
> > [    8.572786]  [<ffffffff8254b079>] =

> > kernel_init_freeable+0x178/0x1fb
> > [    8.572786]  [<ffffffff81b6c473>] ? rest_init+0xb7/0xb7
> > [    8.572786]  [<ffffffff81b6c47c>] kernel_init+0x9/0xd1
> > [    8.572786]  [<ffffffff81b910bc>] ret_from_fork+0x7c/0xb0
> > [    8.572786]  [<ffffffff81b6c473>] ? rest_init+0xb7/0xb7
> > [    8.572786] ---[ end trace 220a440ac161c663 ]---
> =

> This warning is not available on your dmesg.xz

As I said above, the commit FIXED the warning as abvoe in
prev_dmesg.xz.

Best Regards,
Huang, Ying

> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/x86_64 3.9.0-rc1 Kernel Configuration
> =

> 3.9 ??
> =



--===============7698070834550997428==--

