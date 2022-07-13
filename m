Content-Type: multipart/mixed; boundary="===============7334021386509408132=="
MIME-Version: 1.0
From: Tianyu Lan <ltykernel@gmail.com>
To: lkp@lists.01.org
Subject: Re: [EXTERNAL] [swiotlb] 44d89f2248: Kernel_panic-not_syncing:swiotlb_init_remap:nslabs=#too_small
Date: Wed, 13 Jul 2022 13:58:38 +0800
Message-ID: <c8edfbd4-afad-c018-daf6-aa2ac1f7b2fe@gmail.com>
In-Reply-To: <Ys43FtIumAsHPn+y@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7334021386509408132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/13/2022 11:08 AM, kernel test robot wrote:
> [You don't often get email from oliver.sang(a)intel.com. Learn why this i=
s important at https://aka.ms/LearnAboutSenderIdentification ]
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 44d89f22489c65400dbf9ed9ad1d18d2ea064b89 ("swiotlb: split up the =
global swiotlb lock")
> git://git.infradead.org/users/hch/misc.git swiotlb-cleanup
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------------------------+--------=
----+------------+
> |                                                               | 4136ce9=
0f0 | 44d89f2248 |
> +---------------------------------------------------------------+--------=
----+------------+
> | boot_successes                                                | 23     =
    | 0          |
> | boot_failures                                                 | 0      =
    | 18         |
> | Kernel_panic-not_syncing:swiotlb_init_remap:nslabs=3D#too_small | 0    =
      | 18         |
> +---------------------------------------------------------------+--------=
----+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [   30.005215][    T0] Unknown kernel command line parameters "RESULT_ROO=
T=3D/result/boot/1/vm-snb/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-k=
unit/gcc-11/44d89f22489c65400dbf9ed9ad1d18d2ea064b89/3 BOOT_IMAGE=3D/pkg/li=
nux/x86_64-rhel-8.3-kunit/gcc-11/44d89f22489c65400dbf9ed9ad1d18d2ea064b89/v=
mlinuz-5.19.0-rc3-00015-g44d89f22489c branch=3Dhch-misc/swiotlb-cleanup job=
=3D/lkp/jobs/scheduled/vm-snb-102/boot-1-debian-11.1-x86_64-20220510.cgz-44=
d89f22489c65400dbf9ed9ad1d18d2ea064b89-20220713-11587-2q30ty-2.yaml user=3D=
lkp ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-8.3-kunit commit=3D44d89f22489c6540=
0dbf9ed9ad1d18d2ea064b89 vmalloc=3D256M max_uptime=3D600 LKP_SERVER=3Dinter=
nal-lkp-server selinux=3D0 softlockup_panic=3D1 prompt_ramdisk=3D0 vga=3Dno=
rmal", will be passed to user space.
> [   30.015899][    T0] Dentry cache hash table entries: 2097152 (order: 1=
2, 16777216 bytes, linear)
> [   30.019270][    T0] Inode-cache hash table entries: 1048576 (order: 11=
, 8388608 bytes, linear)
> [   30.020042][    T0] mem auto-init: stack:off, heap alloc:off, heap fre=
e:off
> [   30.020607][    T0] Stack Depot early init allocating hash table with =
memblock_alloc, 8388608 bytes
> [   30.023950][    T0] Kernel panic - not syncing: swiotlb_init_remap: ns=
labs =3D 0 too small
> [   30.024616][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-rc3=
-00015-g44d89f22489c #1
> [   30.025310][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [   30.026141][    T0] Call Trace:
> [   30.026399][    T0]  <TASK>
> [ 30.026630][ T0] dump_stack_lvl (kbuild/src/consumer/lib/dump_stack.c:10=
7 (discriminator 1))
> [ 30.026992][ T0] panic (kbuild/src/consumer/kernel/panic.c:292)
> [ 30.027301][ T0] ? panic_print_sys_info+0x60/0x60
> [ 30.027770][ T0] ? vclkdev_alloc (kbuild/src/consumer/drivers/iommu/inte=
l/dmar.c:878)
> [   30.028152][    T0]  ? is_uv_system+0x5/0x40
> [   30.028503][    T0]  ? up_write+0x48/0x80
> [   30.028833][    T0]  swiotlb_init_remap+0x36/0x37
> [   30.029221][    T0]  mem_init+0xe/0x13c
> [   30.029538][    T0]  mm_init+0x63/0x81
> [   30.029848][    T0]  start_kernel+0x143/0x39e
> [   30.030206][    T0]  secondary_startup_64_no_verify+0xe0/0xeb
> [   30.030680][    T0]  </TASK>
> =

> =


Thanks for report. The issue is caused by auto merging between
commit44d89f("swiotlb: split up the global swiotlb lock") and commit =

0bf28fc40(swiotlb: panic if nslabs is too small). nslab is checked =

before initialization.

Christoph, do you prefer to update patch "swiotlb: split up the global =

swiotlb lock" or append a fix patch on current brand?

--===============7334021386509408132==--

