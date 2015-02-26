Content-Type: multipart/mixed; boundary="===============3931528082738793022=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/ASLR] f47233c2d34: WARNING: CPU: 0 PID: 1 at arch/x86/mm/ioremap.c:63 __ioremap_check_ram+0x445/0x4a0()
Date: Thu, 26 Feb 2015 11:30:40 +0100
Message-ID: <20150226103040.GA3573@pd.tnic>
In-Reply-To: <1424929021.10337.24.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3931528082738793022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 26, 2015 at 01:37:01PM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit f47233c2d34f243ecdaac179c3408a39ff9216a7 ("x86/mm/ASLR: Propagate =
base load address calculation")
> =

> =

> +---------------------------------------------------------+-------+------=
------+
> |                                                         | v3.19 | f4723=
3c2d3 |
> +---------------------------------------------------------+-------+------=
------+
> | boot_successes                                          | 54    | 0    =
      |
> | boot_failures                                           | 10    | 10   =
      |
> | BUG:kernel_test_hang                                    | 10    |      =
      |
> | WARNING:at_arch/x86/mm/ioremap.c:#__ioremap_check_ram() | 0     | 10   =
      |
> | backtrace:create_setup_data_nodes                       | 0     | 10   =
      |
> | backtrace:boot_params_ksysfs_init                       | 0     | 10   =
      |
> | backtrace:kernel_init_freeable                          | 0     | 10   =
      |
> +---------------------------------------------------------+-------+------=
------+
> =

> =

> [    0.490087] NET: Registered protocol family 16
> [    0.498533] cpuidle: using governor menu
> [    0.499891] ------------[ cut here ]------------
> [    0.500021] WARNING: CPU: 0 PID: 1 at arch/x86/mm/ioremap.c:63 __iorem=
ap_check_ram+0x445/0x4a0()
> [    0.501015] ioremap on RAM pfn 0x3416
> [    0.502013] Modules linked in:
> [    0.503017] CPU: 0 PID: 1 Comm: swapper Not tainted 3.19.0-04793-g2c30=
3f7 #3
> [    0.504013] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [    0.505014]  0000000000000009 ffff880012d8bb88 ffffffff81cedc16 ffff88=
0012d8bbc8
> [    0.507424]  ffffffff810dd1a0 0000000000000000 0000000000000001 000000=
0000000001
> [    0.509420]  0000000000003416 0000000000000001 0000000000000001 ffff88=
0012d8bc28
> [    0.511415] Call Trace:
> [    0.512028]  [<ffffffff81cedc16>] dump_stack+0x2e/0x3e
> [    0.513023]  [<ffffffff810dd1a0>] warn_slowpath_common+0xe0/0x160
> [    0.514021]  [<ffffffff810dd316>] warn_slowpath_fmt+0x56/0x60
> [    0.515022]  [<ffffffff8107f4a5>] __ioremap_check_ram+0x445/0x4a0
> [    0.516022]  [<ffffffff8107f060>] ? trace_do_page_fault+0x9b0/0x9b0
> [    0.517020]  [<ffffffff810ec948>] walk_system_ram_range+0x128/0x140
> [    0.518022]  [<ffffffff82d9081f>] ? create_setup_data_nodes+0xd1/0x488
> [    0.519019]  [<ffffffff82d9081f>] ? create_setup_data_nodes+0xd1/0x488
> [    0.520021]  [<ffffffff8107f882>] __ioremap_caller+0x172/0x850
> [    0.521021]  [<ffffffff81080064>] ioremap_cache+0x24/0x30
> [    0.522019]  [<ffffffff82d9081f>] create_setup_data_nodes+0xd1/0x488
> [    0.523023]  [<ffffffff81493c9c>] ? internal_create_group+0x4ac/0x830
> [    0.524020]  [<ffffffff82d90c76>] boot_params_ksysfs_init+0xa0/0xf9
> [    0.525020]  [<ffffffff810005f1>] do_one_initcall+0x371/0x4c0
> [    0.526019]  [<ffffffff82d90bd6>] ? create_setup_data_nodes+0x488/0x488
> [    0.527024]  [<ffffffff82d8afd5>] kernel_init_freeable+0x368/0x4ba
> [    0.528022]  [<ffffffff81ce15d0>] ? rest_init+0x260/0x260
> [    0.529020]  [<ffffffff81ce15e6>] kernel_init+0x16/0x240
> [    0.530023]  [<ffffffff81d0253a>] ret_from_fork+0x7a/0xb0
> [    0.531021]  [<ffffffff81ce15d0>] ? rest_init+0x260/0x260
> [    0.532033] ---[ end trace b6a2b7ddc92922e5 ]---
> [    0.534367] ACPI: bus type PCI registered

thanks for the report.

So, AFAICT, this is caused by ksysfs ioremapping struct setup_data
for a short time so that it can count it and show it in
/sys/kernel/boot_params/setup_data/*

And, of course, the setup_data thing which we're using for kaslr param
passing is RAM and ioremap complains.

And currently I don't have a good idea how to fix it. Perhaps introduce
an ioremap_* something which suppresses the warning as we're going to
iounmap() right afterwards but that's ugly.

Hmmmm.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--

--===============3931528082738793022==--

