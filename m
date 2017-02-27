Content-Type: multipart/mixed; boundary="===============8563537671028672723=="
MIME-Version: 1.0
From: Matthew Wilcox <mawilcox@microsoft.com>
To: lkp@lists.01.org
Subject: Re: 84e26daf36: BUG: kernel reboot-without-warning in boot stage
Date: Mon, 27 Feb 2017 21:28:07 +0000
Message-ID: <SN1PR21MB00457E33940C5C57A3664ECACB570@SN1PR21MB0045.namprd21.prod.outlook.com>
In-Reply-To: <58b3f6a7.CyhVwPcXO7KF3xSI%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8563537671028672723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: kernel test robot [mailto:fengguang.wu(a)intel.com]
> =

> dedab4f65c  Merge 'jss-tpmdd/tabrm-v3' into devel-spot-201702270715
> 20e85d3670  ida: Move ida_bitmap to a percpu variable
> 84e26daf36  Merge 'dax/fd-alloc' into devel-spot-201702270715
> +-------------------------------------------------+------------+---------=
---+------------+
> |                                                 | dedab4f65c | 20e85d36=
70 | 84e26daf36 |
> +-------------------------------------------------+------------+---------=
---+------------+
> | boot_successes                                  | 88         | 82      =
   | 0          |
> | boot_failures                                   | 4          | 0       =
   | 48         |
> | IP-Config:Auto-configuration_of_network_failed  | 4          |         =
   |            |
> | BUG:kernel_reboot-without-warning_in_boot_stage | 0          | 0       =
   | 48
> |
> +-------------------------------------------------+------------+---------=
---+------------+
> =

> [    0.000000] BRK [0x05884000, 0x05884fff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x1fcc6000-0x1ffcffff]
> [    0.000000] ACPI: Early table checksum verification disabled
> =


Thanks for reporting this.  I don't know quite how to proceed from here; th=
e modified kernel boots for me just fine.  The code we modified shouldn't e=
ven be called this early -- it's around file descriptor handling, and I don=
't think we even get a file descriptor this early in boot.

Can you share the ramdisk that you're booting the kernel with?


--===============8563537671028672723==--

