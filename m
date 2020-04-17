Content-Type: multipart/mixed; boundary="===============3192814289668534362=="
MIME-Version: 1.0
From: Bob Liu <bob.liu@oracle.com>
To: lkp@lists.01.org
Subject: Re: [scsi] a2ab7a1a38: WARNING:at_kernel/workqueue.c:#workqueue_sysfs_register
Date: Fri, 17 Apr 2020 12:58:12 +0800
Message-ID: <ff48bfdb-e8d4-58ec-8318-6fedd93488d8@oracle.com>
In-Reply-To: <20200417032305.GC26326@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3192814289668534362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/17/20 11:23 AM, kernel test robot wrote:
> Greeting,
> > FYI, we noticed the following commit (built with gcc-7):
> =

> commit: a2ab7a1a38f4448a65b92bb1089f4feeb66f2015 ("[PATCH] scsi: iscsi: r=
egister sysfs for iscsi workqueue")
> url: https://urldefense.com/v3/__https://github.com/0day-ci/linux/commits=
/Bob-Liu/scsi-iscsi-register-sysfs-for-iscsi-workqueue/20200416-103108__;!!=
GqivPVa7Brio!Jjn2aP2TksliGs__LTE_GWRKPf7Vaiffy8tHW75AVPbDpSMnIP8aYAX9TnD7Vw=
$ =

> base: https://urldefense.com/v3/__https://git.kernel.org/cgit/linux/kerne=
l/git/mkp/scsi.git__;!!GqivPVa7Brio!Jjn2aP2TksliGs__LTE_GWRKPf7Vaiffy8tHW75=
AVPbDpSMnIP8aYAVNDDBj1g$  for-next
> =


Thanks, let me check how to workaround this. =


> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------------------+------------+-=
-----------+
> |                                                         | 1e4ffb8344 | =
a2ab7a1a38 |
> +---------------------------------------------------------+------------+-=
-----------+
> | boot_successes                                          | 16         | =
0          |
> | boot_failures                                           | 0          | =
12         |
> | WARNING:at_kernel/workqueue.c:#workqueue_sysfs_register | 0          | =
11         |
> | RIP:workqueue_sysfs_register                            | 0          | =
11         |
> | BUG:kernel_hang_in_boot_stage                           | 0          | =
1          |
> +---------------------------------------------------------+------------+-=
-----------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> [    6.127134] WARNING: CPU: 1 PID: 1 at kernel/workqueue.c:5642 workqueu=
e_sysfs_register+0x18/0x103
> [    6.128910] Modules linked in:
> [    6.128910] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc1-00026-=
ga2ab7a1a38f44 #1
> [    6.128910] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [    6.128910] RIP: 0010:workqueue_sysfs_register+0x18/0x103
> [    6.128910] Code: 00 48 89 d8 74 05 e8 38 51 fe ff 48 83 c4 48 5b 5d c=
3 66 66 66 66 90 41 57 41 56 41 55 41 54 55 53 f6 87 02 01 00 00 08 74 0d <=
0f> 0b 41 bd ea ff ff ff e9 d0 00 00 00 48 89 fd bf e8 02 00 00 41
> [    6.128910] RSP: 0000:ffffc90000013d80 EFLAGS: 00010202
> [    6.128910] RAX: 0000000000000000 RBX: ffff88820bf61a00 RCX: 000000000=
0000000
> [    6.128910] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88820=
bf61a00
> [    6.128910] RBP: ffffc90000013e48 R08: 000000000000000c R09: ffff88820=
befdc10
> [    6.128910] R10: ffff888226031080 R11: ffff88822a550800 R12: 000000000=
0000000
> [    6.128910] R13: ffff88820bf61a20 R14: ffff88820bf61a10 R15: ffff88820=
bf61ab0
> [    6.128910] FS:  0000000000000000(0000) GS:ffff88823fd00000(0000) knlG=
S:0000000000000000
> [    6.128910] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    6.128910] CR2: 00000000ffaddf14 CR3: 000000000280a000 CR4: 000000000=
00406e0
> [    6.128910] Call Trace:
> [    6.128910]  alloc_workqueue+0x36c/0x41f
> [    6.128910]  ? rdinit_setup+0x2b/0x2b
> [    6.128910]  ? fc_transport_init+0x8e/0x8e
> [    6.128910]  iscsi_transport_init+0x141/0x20b
> [    6.128910]  ? iscsi_free_session+0x6b/0x6b
> [    6.128910]  do_one_initcall+0x9d/0x1c0
> [    6.128910]  kernel_init_freeable+0x1e3/0x246
> [    6.128910]  ? rest_init+0xc6/0xc6
> [    6.128910]  kernel_init+0xa/0xff
> [    6.128910]  ret_from_fork+0x3a/0x50
> [    6.128910] ---[ end trace 4d791dec3fcee1ed ]---
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.7.0-rc1-00026-ga2ab7a1a38f44 .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage
> =

>         git clone https://urldefense.com/v3/__https://github.com/intel/lk=
p-tests.git__;!!GqivPVa7Brio!Jjn2aP2TksliGs__LTE_GWRKPf7Vaiffy8tHW75AVPbDpS=
MnIP8aYAVgkKitTA$ =

>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> lkp
>=20

--===============3192814289668534362==--

