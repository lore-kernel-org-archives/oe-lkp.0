Content-Type: multipart/mixed; boundary="===============9129066825265816563=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: 1ca163afb6 ("irda: move net/irda/ to drivers/staging/irda/net/"): BUG: unable to handle kernel NULL pointer dereference at 00000004
Date: Tue, 29 Aug 2017 11:13:06 +0200
Message-ID: <20170829091306.GA9337@kroah.com>
In-Reply-To: <59a52d1f.kK0w8jJmSLyVANxU%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9129066825265816563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2017 at 05:00:15PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue.git d=
ev-queue
> =

> commit 1ca163afb6fd569b6efdc221954177cba5a02cbc
> Author:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> AuthorDate: Sun Aug 27 17:03:31 2017 +0200
> Commit:     David S. Miller <davem@davemloft.net>
> CommitDate: Mon Aug 28 16:42:56 2017 -0700
> =

>     irda: move net/irda/ to drivers/staging/irda/net/
>     =

>     It's time to get rid of IRDA.  It's long been broken, and no one seems
>     to use it anymore.  So move it to staging and after a while, we can
>     delete it from there.
>     =

>     To start, move the network irda core from net/irda to
>     drivers/staging/irda/net/
>     =

>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
> =

> 9d8c7e5a87  Merge branch 'dpaa_eth-rss'
> 1ca163afb6  irda: move net/irda/ to drivers/staging/irda/net/
> 3cfc4a120a  ixgbe: add error checks when initializing the PHY
> +-----------------------------------------------------+------------+-----=
-------+------------+
> |                                                     | 9d8c7e5a87 | 1ca1=
63afb6 | 3cfc4a120a |
> +-----------------------------------------------------+------------+-----=
-------+------------+
> | boot_successes                                      | 2          | 0   =
       | 0          |
> | boot_failures                                       | 57         | 26  =
       | 12         |
> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page | 55         |     =
       |            |
> | EIP:note_page                                       | 55         |     =
       |            |
> | invoked_oom-killer:gfp_mask=3D0x                      | 1          |   =
         |            |
> | Mem-Info                                            | 1          |     =
       |            |
> | IP-Config:Auto-configuration_of_network_failed      | 2          |     =
       |            |
> | BUG:unable_to_handle_kernel                         | 0          | 26  =
       | 12         |
> | Oops:#[##]                                          | 0          | 26  =
       | 12         |
> | EIP:dev_add_pack                                    | 0          | 26  =
       | 12         |
> | Kernel_panic-not_syncing:Fatal_exception            | 0          | 26  =
       | 12         |
> | BUG:kernel_in_stage                                 | 0          | 2   =
       |            |
> +-----------------------------------------------------+------------+-----=
-------+------------+
> =

> [    0.124299] SCSI subsystem initialized
> [    0.125024] libata version 3.00 loaded.
> [    0.125494] media: Linux media interface: v0.10
> [    0.126015] Linux video capture interface: v2.00
> [    0.126582] NET: Registered protocol family 23
> [    0.127010] BUG: unable to handle kernel NULL pointer dereference at 0=
0000004

Ouch, will fix this, thanks.

greg k-h

--===============9129066825265816563==--

