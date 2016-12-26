Content-Type: multipart/mixed; boundary="===============7125737558680085007=="
MIME-Version: 1.0
From: Matthew Wilcox <mawilcox@microsoft.com>
To: lkp@lists.01.org
Subject: Re: [idr] d13fbbcb97 WARNING: CPU: 0 PID: 1 at lib/idr.c:327 ida_remove
Date: Mon, 26 Dec 2016 14:48:52 +0000
Message-ID: <BY2PR21MB00368FE53C4EB7C28CC03464CB960@BY2PR21MB0036.namprd21.prod.outlook.com>
In-Reply-To: <20161222035544.vdokg6ikut434alq@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7125737558680085007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang!  Thanks for this, but two things:

 - I'd already received the email on Sunday from the test robot and had com=
mitted a patch to fix it a few days before you sent this email, so this ema=
il tricked me into thinking I hadn't fixed the bug.  I should have checked =
the git commit ID, so that's my fault.

 - This email doesn=E2=80=99t contain a method for reproducing the problem;=
 I notice most of your other emails include a paragraph about git cloning a=
nd exactly what to type ... for those of us who don't use qemu very often, =
that's helpful.  Particularly with this bug which is sensitive not just to =
hardware configuration (so I wasn't seeing it on real hardware), but also f=
ilesystem layout (!)

Thanks for all the great work you do with lkp/0-day.  It's found probably f=
ive real bugs for me in the last month, even occasional misfires like this =
one don't detract from its usefulness.

> -----Original Message-----
> From: Fengguang Wu [mailto:fengguang.wu(a)intel.com]
> Sent: Wednesday, December 21, 2016 10:56 PM
> To: Matthew Wilcox <mawilcox@microsoft.com>
> Cc: LKP <lkp@01.org>
> Subject: [idr] d13fbbcb97 WARNING: CPU: 0 PID: 1 at lib/idr.c:327 ida_rem=
ove
> =

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.infradead.org/users/willy/linux-dax.git idr-2016-12-16
> =

> commit d13fbbcb97c36334c73c8c67b96c895381563d01
> Author:     Matthew Wilcox <mawilcox@microsoft.com>
> AuthorDate: Sat Dec 17 17:32:00 2016 -0500
> Commit:     Matthew Wilcox <mawilcox@microsoft.com>
> CommitDate: Sat Dec 17 17:32:00 2016 -0500
> =

>      idr: Handle exceptional entries anywhere
> =

>      My original idea was to only use an exceptional entry at the root of=
 the
>      tree, and to expand the entry into a bitmap whenever any bit anywhere
>      beyond BITS_PER_LONG - 2 was set.  But that's more complex than just
>      supporting exceptional entries anywhere in the tree, as the new test
>      case demonstrates.  Also, the new code never fails to allocate an IDA
>      where the previous one could require more memory to be allocated.  I=
'll
>      merge this with the previous patch before submission.
> =

>      Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>
> =

> +----------------------------------+------------+------------+-----------=
-+
> |                                  | 3d145dc3ef | d13fbbcb97 | d13fbbcb97=
 |
> +----------------------------------+------------+------------+-----------=
-+
> | boot_successes                   | 63         | 0          | 0         =
 |
> | boot_failures                    | 0          | 13         | 13        =
 |
> | WARNING:at_lib/idr.c:#ida_remove | 0          | 13         | 13        =
 |
> +----------------------------------+------------+------------+-----------=
-+
> =

> [    0.937484] ACPI: bus type PCI registered
> [    0.938160] PCI: Using configuration type 1 for base access
> [    0.961748] ------------[ cut here ]------------
> [    0.962357] WARNING: CPU: 0 PID: 1 at lib/idr.c:327
> ida_remove+0xd2/0x120
> [    0.963362] ida_remove called for id=3D1026 which is not allocated.
> [    0.964173] Modules linked in:
> [    0.964617] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.9.0-rc8-mm1-
> 00334-gd13fbbc #169
> [    0.965705] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.9.3-20161025_171302-gandalf 04/01/2014
> [    0.985103] Call Trace:
> [    0.985471]  dump_stack+0x58/0x79
> [    0.985961]  __warn+0xf5/0x110
> [    0.986430]  ? ida_remove+0xd2/0x120
> =

> git bisect start d13fbbcb97c36334c73c8c67b96c895381563d01
> 026142ac445639730830629002e24a7083a2763c --
> git bisect good 4cfaeffbcf091d1ef08bb7f1eb6bb4d89d1c60aa  # 20:13     22+
> 0  ida: Move ida_bitmap to a percpu variable
> git bisect good bbf727264b396b28c3c9143d56be93bfe334c609  # 20:22     21+
> 0  radix tree test suite: Reduce kernel.h
> git bisect good 57b4ccae27adaed954f03e3323bc20e0493c0f00  # 20:32     22+
> 0  radix tree test suite: Remove bitops.h
> git bisect good 217a1be9f02affd94610f749ea2e988ac9242493  # 20:44     22+
> 0  radix tree test suite: More decluttering kernel.h
> git bisect good 3d145dc3ef3317f0fd7270a95d76aebbcf7e1eac  # 20:54     22+
> 0  ida: Use exceptional entries for small IDAs
> # first bad commit: [d13fbbcb97c36334c73c8c67b96c895381563d01] idr:
> Handle exceptional entries anywhere
> git bisect good 3d145dc3ef3317f0fd7270a95d76aebbcf7e1eac  # 20:55     60+
> 0  ida: Use exceptional entries for small IDAs
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad d13fbbcb97c36334c73c8c67b96c895381563d01  # 21:04      0-
> 44  idr: Handle exceptional entries anywhere
> # extra tests on HEAD of dax/idr-2016-12-16
> git bisect  bad d13fbbcb97c36334c73c8c67b96c895381563d01  # 21:04      0-
> 13  idr: Handle exceptional entries anywhere
> # extra tests on tree/branch dax/idr-2016-12-16
> git bisect  bad d13fbbcb97c36334c73c8c67b96c895381563d01  # 21:04      0-
> 13  idr: Handle exceptional entries anywhere
> # extra tests with first bad commit reverted
> git bisect good db0520019ffe348e50259bc311f526e40f7a9db3  # 21:16     65+
> 0  Revert "idr: Handle exceptional entries anywhere"
> # extra tests on tree/branch linus/master
> git bisect good 52f40e9d657cc126b766304a5dd58ad73b02ff46  # 21:19     61+
> 9  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
> # extra tests on tree/branch linux-next/master
> git bisect good bf579a3afa46c74b7e89930974ba119d4c76bab2  # 21:27     66+
> 10  Add linux-next specific files for 20161216
> =

> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.=
01.or
> g%2Fpipermail%2Flkp&data=3D02%7C01%7Cmawilcox%40microsoft.com%7C32b
> ca53899fc40062d2c08d42a1e7115%7C72f988bf86f141af91ab2d7cd011db47
> %7C1%7C0%7C636179759029394271&sdata=3D4a02AvKDzMmwiFHeqpckYimhh
> eV02Q%2FwiVSGY2rSRHc%3D&reserved=3D0                          Intel Corpo=
ration

--===============7125737558680085007==--

