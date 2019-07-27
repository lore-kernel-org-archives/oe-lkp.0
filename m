Content-Type: multipart/mixed; boundary="===============3321965369218195608=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: [scsi] ae86a1c553: BUG:kernel_NULL_pointer_dereference, address
Date: Sat, 27 Jul 2019 10:15:44 +0800
Message-ID: <20190727021523.GB6926@ming.t460p>
In-Reply-To: <20190725104629.GC3640@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3321965369218195608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your report!

On Thu, Jul 25, 2019 at 06:46:29PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: ae86a1c5530b52dc44a280e78feb0c4eb2dd8595 ("[PATCH V2 2/2] scsi: i=
mplement .cleanup_rq callback")
> url: https://github.com/0day-ci/linux/commits/Ming-Lei/blk-mq-add-callbac=
k-of-cleanup_rq/20190720-133431
> =

> =

> in testcase: blktests
> with following parameters:
> =

> 	disk: 1SSD
> 	test: block-group1
> =

> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
---------------------------------------+------------+------------+
> |                                                                        =
                                       | bd222ca85f | ae86a1c553 |
> +------------------------------------------------------------------------=
---------------------------------------+------------+------------+
> | boot_successes                                                         =
                                       | 0          | 0          |
> | boot_failures                                                          =
                                       | 11         | 14         |
> | BUG:kernel_reboot-without-warning_in_test_stage                        =
                                       | 11         | 1          |
> | BUG:kernel_NULL_pointer_dereference,address                            =
                                       | 0          | 4          |
> | Oops:#[##]                                                             =
                                       | 0          | 4          |
> | RIP:scsi_queue_rq                                                      =
                                       | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception                               =
                                       | 0          | 4          |
> | invoked_oom-killer:gfp_mask=3D0x                                       =
                                         | 0          | 9          |
> | Mem-Info                                                               =
                                       | 0          | 9          |
> | page_allocation_failure:order:#,mode:#(GFP_KERNEL|__GFP_RETRY_MAYFAIL),=
nodemask=3D(null),cpuset=3D/,mems_allowed=3D | 0          | 2          |
> +------------------------------------------------------------------------=
---------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [  140.974865] BUG: kernel NULL pointer dereference, address: 00000000000=
0001c

Yeah, I know this issue, and it has been fixed in either V3 or V4.

Thanks,
Ming

--===============3321965369218195608==--

