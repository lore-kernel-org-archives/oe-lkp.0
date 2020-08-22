Content-Type: multipart/mixed; boundary="===============2763475931210781395=="
MIME-Version: 1.0
From: Jason Gunthorpe <jgg@nvidia.com>
To: lkp@lists.01.org
Subject: Re: d2f94f97f5 ("RDMA/ucma: Fix locking for ctx->events_reported"): -- System haltedBUG: kernel hang in boot stage
Date: Sat, 22 Aug 2020 20:09:09 -0300
Message-ID: <20200822230909.GE1152540@nvidia.com>
In-Reply-To: <5f3f5a83.MjXkj0e+fMqCb8Om%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2763475931210781395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 01:24:19PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-=
next
> =

> commit d2f94f97f51fda759be8a562068a181f735ecd35
> Author:     Jason Gunthorpe <jgg@nvidia.com>
> AuthorDate: Wed Jul 8 15:54:56 2020 -0300
> Commit:     Leon Romanovsky <leonro@nvidia.com>
> CommitDate: Mon Aug 17 11:07:15 2020 +0300
> =

>     RDMA/ucma: Fix locking for ctx->events_reported
>     =

>     This value is locked under the file->mut, ensure it is held whenever
>     touching it.
>     =

>     The case in ucma_migrate_id() is a race, while in ucma_free_uctx() it=
 is
>     already not possible for the write side to run, the movement is just =
for
>     clarity.
>     =

>     Fixes: 88314e4dda1e ("RDMA/cma: add support for rdma_migrate_id()")
>     Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>     Signed-off-by: Leon Romanovsky <leonro@mellanox.com>
> =

> 097a66c338  RDMA/ucma: Fix the locking of ctx->file
> d2f94f97f5  RDMA/ucma: Fix locking for ctx->events_reported
> +---------------------------------------------+------------+------------+
> |                                             | 097a66c338 | d2f94f97f5 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 30         | 0          |
> | boot_failures                               | 3          | 11         |
> | BUG:kernel_NULL_pointer_dereference,address | 3          |            |
> | System_halted                               | 0          | 11         |
> +---------------------------------------------+------------+------------+
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> Decompressing Linux... =

> =

> ZSTD-compressed data is corrupt
> =

> Linux version 5.9.0-rc1-00029-gd2f94f97f51fd #2
> Command line: root=3D/dev/ram0 hung_task_panic=3D1 debug apic=3Ddebug sys=
rq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 prin=
tk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=
=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.l=
og_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 co=
nsole=3DttyS0,115200 vga=3Dnormal rw link=3D/cephfs/kbuild/run-queue/yocto-=
vm-yocto/i386-randconfig-a006-20200818/leon-rdma:testing:rdma-next:d2f94f97=
f51fda759be8a562068a181f735ecd35:bisect-System_halted/.vmlinuz-d2f94f97f51f=
da759be8a562068a181f735ecd35-20200821100828-1:yocto-vm-yocto-99 branch=3Dle=
on-rdma/testing/rdma-next BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a006-2020=
0818/gcc-9/d2f94f97f51fda759be8a562068a181f735ecd35/vmlinuz-5.9.0-rc1-00029=
-gd2f94f97f51fd rcuperf.shutdown=3D0 watchdog_thresh=3D60
> =

> Kboot worker: lkp-worker24

I think there is no possible way this patch could have caused failure
to decompress?

It is something else?

Jason
--===============2763475931210781395==--

