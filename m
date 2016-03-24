Content-Type: multipart/mixed; boundary="===============6934043258541538263=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [ppdev] e7223f1860: kernel BUG at drivers/base/driver.c:153!
Date: Thu, 24 Mar 2016 15:41:34 +0100
Message-ID: <20160324144134.GH5522@pathway.suse.cz>
In-Reply-To: <20160215115001.GA22934@sudip-pc>
List-Id: <oe-lkp.lists.linux.dev>

--===============6934043258541538263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 2016-02-15 17:20:01, Sudip Mukherjee wrote:
> On Mon, Feb 15, 2016 at 04:20:45PM +0800, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git ch=
ar-misc-testing
> > =

> > commit e7223f18603374d235d8bb0398532323e5f318b9
> > Author:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > AuthorDate: Fri Feb 12 18:33:45 2016 +0530
> > Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > CommitDate: Sun Feb 14 17:43:50 2016 -0800
> > =

> >     ppdev: use new parport device model
> >     =

> >     Modify ppdev driver to use the new parallel port device model.
> >     =

> >     Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> =

> Can you please send the .config file so that i can reproduce in my local
> system and test?
> =

> Ying Huang also sent a similar report after posting the patches. I tried
> his .config and your scripts to reproduce this but was not able to.
> =

> Anyway, this error is not related to this patch, this patch has just
> uncovered this error in parport. And will only happen if ppdev tries to
> register with parport before parport bus is registered.

The problem has been propagated to the Linus' tree for 4.6. I get

[    1.281235] kernel BUG at drivers/base/driver.c:153!
[    1.281924] invalid opcode: 0000 [#1] SMP =

[    1.282560] Modules linked in:
[    1.283095] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 4.5.0-4-default+ #=
2448
[    1.284015] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Bochs 01/01/2011
[    1.284553] task: ffff88013a6a8000 ti: ffff88013a6ac000 task.ti: ffff880=
13a6ac000
[    1.284553] RIP: 0010:[<ffffffff81562a86>]  [<ffffffff81562a86>] driver_=
register+0xd6/0xe0
[    1.284553] RSP: 0000:ffff88013a6afdc0  EFLAGS: 00010246
[    1.284553] RAX: ffffffff81d1f68b RBX: ffffffff81f2af08 RCX: 00000000000=
00000
[    1.284553] RDX: ffffffff81d1f68b RSI: ffffffff81f2e5a0 RDI: ffffffff81f=
2af08
[    1.284553] RBP: ffff88013a6afdd0 R08: 0000000000000000 R09: 00000000000=
00000
[    1.284553] R10: 0000000000000001 R11: 00000000000013bd R12: ffffffff81f=
2aee0
[    1.284553] R13: 0000000000000000 R14: ffffffff8201f353 R15: ffff88013fc=
17558
[    1.284553] FS:  0000000000000000(0000) GS:ffff88013fc80000(0000) knlGS:=
0000000000000000
[    1.284553] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.284553] CR2: 0000000000000000 CR3: 0000000001e06000 CR4: 00000000000=
006e0
[    1.284553] Stack:
[    1.284553]  0000000000000000 ffffffff81f2aee0 ffff88013a6afdf8 ffffffff=
81554c6a
[    1.284553]  ffffffff81d1f68b 00000000b9226c80 ffff8800b91bfce0 ffff8801=
3a6afe10
[    1.284553]  ffffffff8201f3d3 ffffffff81e0b050 ffff88013a6afe80 ffffffff=
810003b8
[    1.284553] Call Trace:
[    1.284553]  [<ffffffff81554c6a>] __parport_register_driver+0x5a/0x150
[    1.284553]  [<ffffffff8201f3d3>] ppdev_init+0x80/0xd1
[    1.284553]  [<ffffffff810003b8>] do_one_initcall+0x88/0x1c0
[    1.284553]  [<ffffffff8108f200>] ? parse_args+0x210/0x3b0
[    1.284553]  [<ffffffff81fd22e1>] kernel_init_freeable+0x1f9/0x289
[    1.284553]  [<ffffffff81fd19b2>] ? set_debug_rodata+0x12/0x12
[    1.284553]  [<ffffffff8190fc4e>] kernel_init+0xe/0x110
[    1.284553]  [<ffffffff8191dc32>] ret_from_fork+0x22/0x50
[    1.284553]  [<ffffffff8190fc40>] ? rest_init+0x130/0x130
[    1.284553] Code: c7 20 f0 cd 81 31 c0 e8 a8 68 c2 ff 48 8b 73 08 eb 8e =
48 8b 33 48 c7 c7 60 f0 cd 81 31 c0 41 bc f0 ff ff ff e8 8b 68 c2 ff eb 91 =
<0f> 0b 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 85 ff 48 89 =

[    1.284553] RIP  [<ffffffff81562a86>] driver_register+0xd6/0xe0
[    1.284553]  RSP <ffff88013a6afdc0>


> Can you please check if the below patch solves the problem:
>
> =

> diff --git a/drivers/parport/share.c b/drivers/parport/share.c
> index 3308427..176b2b6 100644
> --- a/drivers/parport/share.c
> +++ b/drivers/parport/share.c
> @@ -273,6 +273,9 @@ int __parport_register_driver(struct parport_driver *=
drv, struct module *owner,
>  		/* using device model */
>  		int ret;
>  =

> +		if (!parport_bus_type.p)
> +			return -EAGAIN;
> +
>  		/* initialize common driver fields */
>  		drv->driver.name =3D drv->name;
>  		drv->driver.bus =3D &parport_bus_type;
> =

> =

This patch helps. Feel free to use:

Tested-by: Petr Mladek <pmladek@suse.com>

Could we please get the fix into the mainline?

Best Regards,
Petr

--===============6934043258541538263==--

