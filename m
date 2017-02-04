Content-Type: multipart/mixed; boundary="===============9206653038370845092=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [scsi, block] 0dba1314d4: WARNING:at_fs/sysfs/dir.c:#sysfs_warn_dup
Date: Sat, 04 Feb 2017 12:36:14 -0800
Message-ID: <CAPcyv4j0syAsinM-KbeefKysJhM9zt6kvrX=0c2HrtPV_tRAHQ@mail.gmail.com>
In-Reply-To: <20170204070936.GE12121@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============9206653038370845092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 3, 2017 at 11:09 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> commit: 0dba1314d4f81115dce711292ec7981d17231064 ("scsi, block: fix dupli=
cate bdi name registration crashes")
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for=
-4.11/next
>
> in testcase: boot
>
> on test machine: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap -m=
 360M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +----------------------------------------------+------------+------------+
> |                                              | efa7c9f97e | 0dba1314d4 |
> +----------------------------------------------+------------+------------+
> | boot_successes                               | 0          | 0          |
> | boot_failures                                | 6          | 6          |
> | WARNING:at_include/linux/kref.h:#kobject_get | 6          | 6          |
> | BUG:workqueue_lockup-pool                    | 2          |            |
> | WARNING:at_fs/sysfs/dir.c:#sysfs_warn_dup    | 0          | 6          |
> +----------------------------------------------+------------+------------+
>
>
>
> [    8.820258] ------------[ cut here ]------------
> [    8.821188] WARNING: CPU: 0 PID: 1 at fs/sysfs/dir.c:31 sysfs_warn_dup=
+0x58/0x70
> [    8.822994] sysfs: cannot create duplicate filename '/class/scsi_disk/=
0:0:0:0'
> [    8.824567] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.=
10.0-rc5-00097-g0dba131 #1
> [    8.826275] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [    8.828156] Call Trace:
> [    8.828851]  dump_stack+0x79/0xa4
> [    8.829628]  __warn+0xd2/0xf0
> [    8.830372]  ? sysfs_warn_dup+0x58/0x70
> [    8.831211]  warn_slowpath_fmt+0x36/0x40
> [    8.832054]  sysfs_warn_dup+0x58/0x70
> [    8.832865]  sysfs_do_create_link_sd+0x9e/0xb0
> [    8.833844]  sysfs_create_link+0x20/0x40
> [    8.834714]  device_add+0x218/0x610
> [    8.835511]  ? kvasprintf_const+0x49/0x60
> [    8.836352]  ? kobject_set_name_vargs+0x62/0x80
> [    8.837253]  sd_probe+0x31a/0x390
> [    8.838027]  ? _raw_spin_unlock+0x1d/0x30
> [    8.838884]  driver_probe_device+0x190/0x4a0
> [    8.839751]  __device_attach_driver+0x6f/0x100
> [    8.840736]  ? klist_next+0x6e/0x100
> [    8.841538]  ? __driver_attach+0xf0/0xf0
> [    8.842383]  bus_for_each_drv+0x47/0x80
> [    8.843226]  __device_attach+0xa8/0x120
> [    8.844062]  ? __driver_attach+0xf0/0xf0
> [    8.844902]  device_initial_probe+0xd/0x10
> [    8.845754]  bus_probe_device+0x77/0x80
> [    8.846593]  device_add+0x320/0x610
> [    8.847387]  scsi_sysfs_add_sdev+0x85/0x2b0
> [    8.848246]  ? scsi_attach_vpd+0x1f9/0x210
> [    8.849103]  scsi_probe_and_add_lun+0xd44/0xe70
> [    8.850021]  __scsi_scan_target+0xd8/0x690
> [    8.850918]  ? __pm_runtime_resume+0x37/0x80
> [    8.852124]  scsi_scan_channel+0x8f/0xb0
> [    8.852977]  scsi_scan_host_selected+0x100/0x180
> [    8.853885]  do_scsi_scan_host+0x8a/0x90
> [    8.854733]  scsi_scan_host+0x15a/0x1a0
> [    8.855562]  sdebug_driver_probe+0x14f/0x3d0
> [    8.856435]  ? _raw_spin_unlock+0x1d/0x30
> [    8.857270]  ? devices_kset_move_last+0x71/0xc0
> [    8.858170]  ? sysfs_create_link+0x20/0x40
> [    8.859057]  driver_probe_device+0xd4/0x4a0
> [    8.859924]  __device_attach_driver+0x6f/0x100
> [    8.860814]  ? klist_next+0x6e/0x100
> [    8.861619]  ? __driver_attach+0xf0/0xf0
> [    8.862470]  bus_for_each_drv+0x47/0x80
> [    8.863298]  __device_attach+0xa8/0x120
> [    8.864131]  ? __driver_attach+0xf0/0xf0
> [    8.864975]  device_initial_probe+0xd/0x10
> [    8.865831]  bus_probe_device+0x77/0x80
> [    8.866704]  device_add+0x320/0x610
> [    8.867497]  ? pm_runtime_init+0xea/0xf0
> [    8.868326]  device_register+0x12/0x20
> [    8.869146]  sdebug_add_adapter+0xda/0x1e0
> [    8.870002]  ? driver_register+0x83/0xe0
> [    8.870847]  scsi_debug_init+0x5a0/0x6eb
> [    8.871686]  ? kobject_uevent+0xa/0x10
> [    8.872507]  ? driver_register+0x83/0xe0
> [    8.873336]  ? scsi_register_driver+0xf/0x20
> [    8.874218]  ? init_ch_module+0x9d/0x9d
> [    8.875088]  do_one_initcall+0x7b/0x132
> [    8.875918]  ? kernel_init_freeable+0xe7/0x188
> [    8.876807]  kernel_init_freeable+0x10a/0x188
> [    8.877690]  ? rest_init+0xb0/0xb0
> [    8.878482]  kernel_init+0xb/0x100
> [    8.879262]  ? schedule_tail+0xc/0x70
> [    8.880076]  ? rest_init+0xb0/0xb0
> [    8.880861]  ret_from_fork+0x21/0x2c
> [    8.881688] ---[ end trace 62a20110376b9cdf ]---
>
>
> To reproduce:
>
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email

These reproduction steps don't work for me.  I also notice that 0day
is picking up on a later error, the real error is that we register to
scsi devices with the same name:

--===============9206653038370845092==--

