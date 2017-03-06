Content-Type: multipart/mixed; boundary="===============6395676705956821076=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [bdi_unregister] 165a5e22fa INFO: task swapper:1 blocked for more than 120 seconds.
Date: Mon, 06 Mar 2017 13:01:23 +0100
Message-ID: <20170306120123.GD14932@quack2.suse.cz>
In-Reply-To: <20170306102733.GC14932@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6395676705956821076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 06-03-17 11:27:33, Jan Kara wrote:
> Hi,
> =

> On Sun 05-03-17 10:21:11, Wu Fengguang wrote:
> > FYI next-20170303 is good while mainline is bad with this error.
> > The attached reproduce-* may help reproduce the issue.
> =

> Thanks for report! So from the stacktrace we are in the path testing
> removal of a device immediately after it has been probed and for some
> reason bdi_unregister() hangs - likely waiting for cgroup-writeback
> references to drop. Given how early this happens my guess is we fail to
> initialize something but for now I don't see how my patch could make a
> difference. I'm trying to reproduce this to be able to debug more...

OK, so after some debugging I think this is yet another problem in SCSI
initialization / destruction code which my patch only makes visible (added
relevant maintainers).

I can reproduce the problem reliably with enabling:

CONFIG_DEBUG_TEST_DRIVER_REMOVE=3Dy
CONFIG_SCSI_DEBUG=3Dm
CONFIG_BLK_CGROUP=3Dy
CONFIG_MEMCG=3Dy
(and thus CONFIG_CGROUP_WRITEBACK=3Dy)

then 'modprobe scsi_debug' is all it takes to reproduce hang. Relevant
kernel messages with some of my debugging added (attached is a patch that
adds those debug messages):

[   58.721765] scsi host0: scsi_debug: version 1.86 [20160430]
[   58.721765]   dev_size_mb=3D8, opts=3D0x0, submit_queues=3D1, statistics=
=3D0
[   58.728946] CGWB init ffff88007fbb2000
[   58.730095] Created sdev ffff880078e1a000
[   58.731611] scsi 0:0:0:0: Direct-Access     Linux    scsi_debug 0186 PQ =
: 0 ANSI: 7
[   58.782246] sd 0:0:0:0: [sda] 16384 512-byte logical blocks: (8.39 MB/8.=
00 MiB)
[   58.789687] sd 0:0:0:0: [sda] Write Protect is off
[   58.791140] sd 0:0:0:0: [sda] Mode Sense: 73 00 10 08
[   58.800879] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 supports DPO and FUA
[   58.893738] sd 0:0:0:0: [sda] Attached SCSI disk
[   58.896808] Unreg1
[   58.897960] Unreg2
[   58.898637] Unreg3
[   58.899100] CGWB ffff88007fbb2000 usage_cnt: 0
[   58.900004] Unreg4
[   58.904976] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[   58.908362] Reusing sdev ffff880078e1a000
[   58.916194] sd 0:0:0:0: [sdb] 16384 512-byte logical blocks: (8.39 MB/8.=
00 MiB)
[   58.923513] sd 0:0:0:0: [sdb] Write Protect is off
[   58.925387] sd 0:0:0:0: [sdb] Mode Sense: 73 00 10 08
[   58.935263] sd 0:0:0:0: [sdb] Write cache: enabled, read cache: enabled,=
 supports DPO and FUA
[   58.983663] sd 0:0:0:0: [sdb] Attached SCSI disk
[   58.985413] Unreg1
[   58.986022] Unreg2
[   58.986776] Unreg3
[   58.987443] CGWB ffff88007fbb2000 usage_cnt: 4294967295

In the above, you can note that 'sdb' reused LUN 0 from the SCSI host. That
is also confirmed by the 'Reusing sdev XY' debug message which I've added
to scsi_probe_and_add_lun(). And IMO that's a bug because you reuse the
scsi_device structure, request_queue & backing_dev_info are already torn do=
wn
at that moment and you just start to use them again. Moreover it seems you
drop the reference to found scsi_device so that will get freed under your
hands.

My patch just made this problem visible as the second call to
bdi_unregister() on the same bdi resulted in underflow of usage_cnt and a
hang...

James, Martin?

								Honza

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> > =

> > commit 165a5e22fafb127ecb5914e12e8c32a1f0d3f820
> > Author:     Jan Kara <jack@suse.cz>
> > AuthorDate: Wed Feb 8 08:05:56 2017 +0100
> > Commit:     Jens Axboe <axboe@fb.com>
> > CommitDate: Thu Mar 2 16:08:35 2017 -0700
> > =

> >      block: Move bdi_unregister() to del_gendisk()
> >      =

> >      Commit 6cd18e711dd8 "block: destroy bdi before blockdev is
> >      unregistered." moved bdi unregistration (at that time through
> >      bdi_destroy()) from blk_release_queue() to blk_cleanup_queue() bec=
ause
> >      it needs to happen before blk_unregister_region() call in del_gend=
isk()
> >      for MD. SCSI though will free up the device number from sd_remove()
> >      called through a maze of callbacks from device_del() in
> >      __scsi_remove_device() before blk_cleanup_queue() and thus similar=
 races
> >      as described in 6cd18e711dd8 can happen for SCSI as well as report=
ed by
> >      Omar [1].
> >      =

> >      Moving bdi_unregister() to del_gendisk() works for MD and fixes the
> >      problem for SCSI since del_gendisk() gets called from sd_remove() =
before
> >      freeing the device number.
> >      =

> >      This also makes device_add_disk() (calling bdi_register_owner()) m=
ore
> >      symmetric with del_gendisk().
> >      =

> >      [1] http://marc.info/?l=3Dlinux-block&m=3D148554717109098&w=3D2
> >      =

> >      Tested-by: Lekshmi Pillai <lekshmicpillai@in.ibm.com>
> >      Acked-by: Tejun Heo <tj@kernel.org>
> >      Signed-off-by: Jan Kara <jack@suse.cz>
> >      Tested-by: Omar Sandoval <osandov@fb.com>
> >      Signed-off-by: Jens Axboe <axboe@fb.com>
> > =

> > 113285b473  blk-mq: ensure that bd->last is always set correctly
> > 165a5e22fa  block: Move bdi_unregister() to del_gendisk()
> > +--------------------------------------------------+------------+------=
------+
> > |                                                  | 113285b473 | 165a5=
e22fa |
> > +--------------------------------------------------+------------+------=
------+
> > | boot_successes                                   | 35         | 0    =
      |
> > | boot_failures                                    | 0          | 15   =
      |
> > | INFO:task_blocked_for_more_than#seconds          | 0          | 15   =
      |
> > | Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 15   =
      |
> > +--------------------------------------------------+------------+------=
------+
> > =

> > [  187.365491] rcu_preempt: wait state: 1 ->state: 0x1
> > [  187.366039] rcu_sched: wait state: 1 ->state: 0x1
> > [  187.366039] rcu_sched: wait state: 1 ->state: 0x1
> > [  187.366564] rcu_bh: wait state: 1 ->state: 0x1
> > [  187.366564] rcu_bh: wait state: 1 ->state: 0x1
> > [  243.680303] INFO: task swapper:1 blocked for more than 120 seconds.
> > [  243.680303] INFO: task swapper:1 blocked for more than 120 seconds.
> > [  243.682035]       Not tainted 4.10.0-11089-g165a5e2 #2
> > [  243.682035]       Not tainted 4.10.0-11089-g165a5e2 #2
> > [  243.683000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this message.
> > [  243.683000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disab=
les this message.
> > [  243.684306] swapper         D    0     1      0 0x00000000
> > [  243.684306] swapper         D    0     1      0 0x00000000
> > [  243.685246] Call Trace:
> > [  243.685246] Call Trace:
> > [  243.685650]  __schedule+0x31a/0xc00
> > [  243.685650]  __schedule+0x31a/0xc00
> > [  243.686236]  schedule+0x7b/0x170
> > [  243.686236]  schedule+0x7b/0x170
> > [  243.686803]  bdi_unregister+0x3a3/0x430
> > [  243.686803]  bdi_unregister+0x3a3/0x430
> > [  243.687447]  ? woken_wake_function+0x40/0x40
> > [  243.687447]  ? woken_wake_function+0x40/0x40
> > [  243.688150]  del_gendisk+0x232/0x370
> > [  243.688150]  del_gendisk+0x232/0x370
> > [  243.688721]  sd_remove+0x97/0x140
> > [  243.688721]  sd_remove+0x97/0x140
> > [  243.689260]  device_release_driver_internal+0x4b8/0x4d0
> > [  243.689260]  device_release_driver_internal+0x4b8/0x4d0
> > [  243.690065]  device_release_driver+0x1a/0x30
> > [  243.690065]  device_release_driver+0x1a/0x30
> > [  243.690928]  bus_remove_device+0x15a/0x1f0
> > [  243.690928]  bus_remove_device+0x15a/0x1f0
> > [  243.691558]  device_del+0x34d/0x5a0
> > [  243.691558]  device_del+0x34d/0x5a0
> > [  243.692155]  ? kobject_put+0xf6/0x1d0
> > [  243.692155]  ? kobject_put+0xf6/0x1d0
> > [  243.692700]  __scsi_remove_device+0x1a3/0x1c0
> > [  243.692700]  __scsi_remove_device+0x1a3/0x1c0
> > [  243.693665]  scsi_forget_host+0xb7/0x120
> > [  243.693665]  scsi_forget_host+0xb7/0x120
> > [  243.694301]  scsi_remove_host+0xf1/0x300
> > [  243.694301]  scsi_remove_host+0xf1/0x300
> > [  243.694973]  sdebug_driver_remove+0x34/0x120
> > [  243.694973]  sdebug_driver_remove+0x34/0x120
> > [  243.695621]  ? devices_kset_move_last+0x9d/0x100
> > [  243.695621]  ? devices_kset_move_last+0x9d/0x100
> > [  243.696430]  driver_probe_device+0x172/0x6b0
> > [  243.696430]  driver_probe_device+0x172/0x6b0
> > [  243.697413]  __device_attach_driver+0x15d/0x1d0
> > [  243.697413]  __device_attach_driver+0x15d/0x1d0
> > [  243.698460]  ? __driver_attach+0x1b0/0x1b0
> > [  243.698460]  ? __driver_attach+0x1b0/0x1b0
> > [  243.699111]  bus_for_each_drv+0xb1/0x110
> > [  243.699111]  bus_for_each_drv+0xb1/0x110
> > [  243.699856]  __device_attach+0x14d/0x210
> > [  243.699856]  __device_attach+0x14d/0x210
> > [  243.700643]  ? __driver_attach+0x1b0/0x1b0
> > [  243.700643]  ? __driver_attach+0x1b0/0x1b0
> > [  243.701362]  device_initial_probe+0x1b/0x30
> > [  243.701362]  device_initial_probe+0x1b/0x30
> > [  243.701886]  bus_probe_device+0xe5/0x100
> > [  243.701886]  bus_probe_device+0xe5/0x100
> > [  243.702447]  device_add+0x822/0xc20
> > [  243.702447]  device_add+0x822/0xc20
> > [  243.702879]  ? pm_runtime_init+0x125/0x140
> > [  243.702879]  ? pm_runtime_init+0x125/0x140
> > [  243.703366]  device_register+0x2e/0x40
> > [  243.703366]  device_register+0x2e/0x40
> > [  243.703823]  sdebug_add_adapter+0x144/0x2e0
> > [  243.703823]  sdebug_add_adapter+0x144/0x2e0
> > [  243.704381]  ? kobject_uevent+0x18/0x30
> > [  243.704381]  ? kobject_uevent+0x18/0x30
> > [  243.704881]  scsi_debug_init+0x955/0xb9d
> > [  243.704881]  scsi_debug_init+0x955/0xb9d
> > [  243.705372]  ? init_sg+0x1a9/0x212
> > [  243.705372]  ? init_sg+0x1a9/0x212
> > [  243.705763]  ? init_sg+0x212/0x212
> > [  243.705763]  ? init_sg+0x212/0x212
> > [  243.706166]  do_one_initcall+0x5d/0x2b0
> > [  243.706166]  do_one_initcall+0x5d/0x2b0
> > [  243.706634]  ? parse_args+0x44e/0x710
> > [  243.706634]  ? parse_args+0x44e/0x710
> > [  243.707059]  ? kernel_init_freeable+0x20b/0x3ab
> > [  243.707059]  ? kernel_init_freeable+0x20b/0x3ab
> > [  243.707569]  kernel_init_freeable+0x23c/0x3ab
> > [  243.707569]  kernel_init_freeable+0x23c/0x3ab
> > [  243.708076]  ? rest_init+0x270/0x270
> > [  243.708076]  ? rest_init+0x270/0x270
> > [  243.708543]  kernel_init+0x16/0x250
> > [  243.708543]  kernel_init+0x16/0x250
> > [  243.708978]  ret_from_fork+0x21/0x30
> > [  243.708978]  ret_from_fork+0x21/0x30
> > [  243.709399] =

> > [  243.709399] Showing all locks held in the system:
> > [  243.709399] =

> > [  243.709399] Showing all locks held in the system:
> > [  243.710265] 3 locks held by swapper/1:
> > [  243.710265] 3 locks held by swapper/1:
> > [  243.710785]  #0:  (&dev->mutex){......}, at: [<987efeb8>] __device_a=
ttach+0x28/0x210
> > [  243.710785]  #0:  (&dev->mutex){......}, at: [<987efeb8>] __device_a=
ttach+0x28/0x210
> > [  243.711670]  #1:  (&shost->scan_mutex){+.+.+.}, at: [<9883cac1>] scs=
i_remove_host+0x21/0x300
> > [  243.711670]  #1:  (&shost->scan_mutex){+.+.+.}, at: [<9883cac1>] scs=
i_remove_host+0x21/0x300
> > [  243.712674]  #2:  (&dev->mutex){......}, at: [<987f0d94>] device_rel=
ease_driver_internal+0x54/0x4d0
> > [  243.712674]  #2:  (&dev->mutex){......}, at: [<987f0d94>] device_rel=
ease_driver_internal+0x54/0x4d0
> > [  243.713807] 2 locks held by khungtaskd/13:
> > [  243.713807] 2 locks held by khungtaskd/13:
> > [  243.714297]  #0:  (rcu_read_lock){......}, at: [<97f5f626>] watchdog=
+0x126/0x8c0
> > [  243.714297]  #0:  (rcu_read_lock){......}, at: [<97f5f626>] watchdog=
+0x126/0x8c0
> > [  243.715168]  #1:  (tasklist_lock){.+.+..}, at: [<97ee6d62>] debug_sh=
ow_all_locks+0x52/0x320
> > [  243.715168]  #1:  (tasklist_lock){.+.+..}, at: [<97ee6d62>] debug_sh=
ow_all_locks+0x52/0x320
> > [  243.716128] =

> > [  243.716128] =

> > [  243.716372] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > [  243.716372] =

> > [  243.716372] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > [  243.716372] =

> > [  243.717191] Kernel panic - not syncing: hung_task: blocked tasks
> > [  243.717191] Kernel panic - not syncing: hung_task: blocked tasks
> > [  243.717889] CPU: 0 PID: 13 Comm: khungtaskd Not tainted 4.10.0-11089=
-g165a5e2 #2
> > [  243.717889] CPU: 0 PID: 13 Comm: khungtaskd Not tainted 4.10.0-11089=
-g165a5e2 #2
> > [  243.718742] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.9.3-20161025_171302-gandalf 04/01/2014
> > [  243.718742] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.9.3-20161025_171302-gandalf 04/01/2014
> > [  243.719871] Call Trace:
> > [  243.719871] Call Trace:
> > [  243.720185]  dump_stack+0x32/0x43
> > [  243.720185]  dump_stack+0x32/0x43
> > [  243.720185]  panic+0x135/0x408
> > [  243.720185]  panic+0x135/0x408
> > [  243.720185]  watchdog+0x6d3/0x8c0
> > [  243.720185]  watchdog+0x6d3/0x8c0
> > [  243.720185]  kthread+0x151/0x1d0
> > [  243.720185]  kthread+0x151/0x1d0
> > [  243.720185]  ? hung_task_panic+0x20/0x20
> > [  243.720185]  ? hung_task_panic+0x20/0x20
> > [  243.720185]  ? kthread_worker_fn+0x220/0x220
> > [  243.720185]  ? kthread_worker_fn+0x220/0x220
> > [  243.720185]  ret_from_fork+0x21/0x30
> > [  243.720185]  ret_from_fork+0x21/0x30
> > [  243.720185] Kernel Offset: 0x16e00000 from 0x81000000 (relocation ra=
nge: 0x80000000-0xa07dffff)
> > [  243.720185] Kernel Offset: 0x16e00000 from 0x81000000 (relocation ra=
nge: 0x80000000-0xa07dffff)
> > =

> > =

> >                                                           # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> > git bisect start 0724f5d8ca3a89134a8c248aa4c311ce43d53512 c470abd4fde40=
ea6a0846a2beab642a578c0b8cd --
> > git bisect  bad 304f9c7ff9aabc9a3cec12bf88f29d24139ac370  # 14:12  B   =
   0     4   15   0  Merge 'linux-review/Roger-Quadros/Revert-usb-gadget-uv=
c-Add-missing-call-for-additional-setup-data/20170303-232925' into devel-sp=
ot-201703040603
> > git bisect  bad a28ca518ffc36daf89550978066ad20094c19e51  # 14:33  B   =
   0     8   22   3  Merge 'linux-review/Arushi-Singhal/staging-speakup-Ali=
gnment-match-open-parenthesis/20170304-030809' into devel-spot-201703040603
> > git bisect  bad 93354ede964ded2791d3b573635d538b14590545  # 14:55  B   =
   0     4   15   0  Merge 'linux-review/Georgios-Emmanouil/Staging-wilc100=
0-wilc_sdio-Modified-comment-style-to-preferred-kernel-comment-style/201703=
04-050826' into devel-spot-201703040603
> > git bisect  bad 402decdec94a2e4e2635ef662e57f6217a305d81  # 15:36  B   =
   0    11   22   0  Merge 'linux-review/Heiner-Kallweit/staging-fbtft-impr=
ove-a-syslog-message-in-fbtft_register_framebuffer/20170304-054107' into de=
vel-spot-201703040603
> > git bisect  bad 1735b51c4dda1ca7f2c239c4b790c3c638281f54  # 15:53  B   =
   0     6   17   0  Merge 'block/for-linus' into devel-spot-201703040603
> > git bisect good cf5f16969d36dfa64e92cf19594b94de0c381519  # 16:05  G   =
  11     0    0   0  0day base guard for 'devel-spot-201703040603'
> > git bisect good caa59428971d5ad81d19512365c9ba580d83268c  # 16:23  G   =
  11     0    0   0  Merge tag 'staging-4.11-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/gregkh/staging
> > git bisect good d5500a074741b78b7f778b4ab3415d5ecdcda0a7  # 16:48  G   =
  11     0    0   0  Merge tag 'usercopy-v4.11-rc1.fix' of git://git.kernel=
.org/pub/scm/linux/kernel/git/kees/linux
> > git bisect good 7067739df23ffd641ca99c967830e0ed2ba39eab  # 17:13  G   =
  11     0    0   0  Merge branch 'i2c/for-4.11' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/wsa/linux
> > git bisect good b2deee2dc06db7cdf99b84346e69bdb9db9baa85  # 17:47  G   =
  11     0    0   0  Merge tag 'ceph-for-4.11-rc1' of git://github.com/ceph=
/ceph-client
> > git bisect good 010426079ec1228a7f980d2eef766a84c0f9241a  # 18:03  G   =
  11     0    0   0  sched/headers: Prepare for new header dependencies bef=
ore moving more code to <linux/sched/mm.h>
> > git bisect good 3f80dd67c367878aaad16e458eebc3c8980bb841  # 18:28  G   =
  11     0    0   0  Merge tag 'acpi-extra-4.11-rc1' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/rafael/linux-pm
> > git bisect good e26512fea5bcd6602dbf02a551ed073cd4529449  # 18:42  G   =
  10     0    0   0  sched/headers: Remove <linux/cred.h> inclusion from <l=
inux/sched.h>
> > git bisect good 78769912f680fc0a79a67e798a0ae76f07e63a7b  # 19:08  G   =
  11     0    0   0  Merge tag 'linux-kselftest-4.11-rc1-urgent_fix' of git=
://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
> > git bisect good 1827adb11ad26b2290dc9fe2aaf54976b2439865  # 19:21  G   =
  11     0    0   0  Merge branch 'WIP.sched-core-for-linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect  bad 165a5e22fafb127ecb5914e12e8c32a1f0d3f820  # 19:39  B   =
   0    11   22   0  block: Move bdi_unregister() to del_gendisk()
> > git bisect good 6a8a21546507a3ec88e81c2ec927a3fb63efa8ff  # 19:55  G   =
  11     0    0   0  nbd: stop leaking sockets
> > git bisect good e02898b423802b1f3a3aaa7f16e896da069ba8f7  # 20:36  G   =
  11     0    0   0  loop: fix LO_FLAGS_PARTSCAN hang
> > git bisect good 7b36a7189fc320f0b783dd51bd1f541db56cfbdd  # 20:53  G   =
  11     0    0   0  block: don't call ioc_exit_icq() with the queue lock h=
eld for blk-mq
> > git bisect good 113285b473824922498d07d7f82459507b9792eb  # 21:37  G   =
  11     0    0   0  blk-mq: ensure that bd->last is always set correctly
> > # first bad commit: [165a5e22fafb127ecb5914e12e8c32a1f0d3f820] block: M=
ove bdi_unregister() to del_gendisk()
> > git bisect good 113285b473824922498d07d7f82459507b9792eb  # 21:41  G   =
  31     0    0   0  blk-mq: ensure that bd->last is always set correctly
> > # extra tests with CONFIG_DEBUG_INFO_REDUCED
> > git bisect  bad 165a5e22fafb127ecb5914e12e8c32a1f0d3f820  # 22:16  B   =
   0    10   22   1  block: Move bdi_unregister() to del_gendisk()
> > # extra tests on HEAD of linux-devel/devel-spot-201703040603
> > git bisect  bad 0724f5d8ca3a89134a8c248aa4c311ce43d53512  # 22:16  B   =
   0    39   55   2  0day head guard for 'devel-spot-201703040603'
> > # extra tests on tree/branch linus/master
> > git bisect  bad 0710f3ff91ecc4a715db6e4d0690472b13c4dac6  # 22:42  B   =
   0     7   18   0  Merge branch 'work.misc' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/viro/vfs
> > # extra tests with first bad commit reverted
> > git bisect good 8b222187187cd9372d0d1ee036f1966e142bbd42  # 23:09  G   =
  10     0    0   0  Revert "block: Move bdi_unregister() to del_gendisk()"
> > # extra tests on tree/branch linux-next/master
> > git bisect good c0b7b2b33bd17f7155956d0338ce92615da686c9  # 23:28  G   =
  11     0    0   0  Add linux-next specific files for 20170303
> > =

> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology =
Center
> > https://lists.01.org/pipermail/lkp                          Intel Corpo=
ration
> =

> =

> > #!/bin/bash
> > =

> > kernel=3D$1
> > initrd=3Dquantal-core-i386.cgz
> > =

> > wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw=
/master/initrd/$initrd
> > =

> > kvm=3D(
> > 	qemu-system-x86_64
> > 	-enable-kvm
> > 	-cpu kvm64
> > 	-kernel $kernel
> > 	-initrd $initrd
> > 	-m 512
> > 	-smp 2
> > 	-device e1000,netdev=3Dnet0
> > 	-netdev user,id=3Dnet0
> > 	-boot order=3Dnc
> > 	-no-reboot
> > 	-watchdog i6300esb
> > 	-watchdog-action debug
> > 	-rtc base=3Dlocaltime
> > 	-serial stdio
> > 	-display none
> > 	-monitor null
> > )
> > =

> > append=3D(
> > 	root=3D/dev/ram0
> > 	hung_task_panic=3D1
> > 	debug
> > 	apic=3Ddebug
> > 	sysrq_always_enabled
> > 	rcupdate.rcu_cpu_stall_timeout=3D100
> > 	net.ifnames=3D0
> > 	printk.devkmsg=3Don
> > 	panic=3D-1
> > 	softlockup_panic=3D1
> > 	nmi_watchdog=3Dpanic
> > 	oops=3Dpanic
> > 	load_ramdisk=3D2
> > 	prompt_ramdisk=3D0
> > 	drbd.minor_count=3D8
> > 	systemd.log_level=3Derr
> > 	ignore_loglevel
> > 	earlyprintk=3DttyS0,115200
> > 	console=3DttyS0,115200
> > 	console=3Dtty0
> > 	vga=3Dnormal
> > 	rw
> > 	drbd.minor_count=3D8
> > )
> > =

> > "${kvm[@]}" -append "${append[*]}"
> =

> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/i386 4.10.0 Kernel Configuration
> > #
> > # CONFIG_64BIT is not set
> > CONFIG_X86_32=3Dy
> > CONFIG_X86=3Dy
> > CONFIG_INSTRUCTION_DECODER=3Dy
> > CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> > CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
> > CONFIG_LOCKDEP_SUPPORT=3Dy
> > CONFIG_STACKTRACE_SUPPORT=3Dy
> > CONFIG_MMU=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS_MIN=3D8
> > CONFIG_ARCH_MMAP_RND_BITS_MAX=3D16
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> > CONFIG_NEED_DMA_MAP_STATE=3Dy
> > CONFIG_NEED_SG_DMA_LENGTH=3Dy
> > CONFIG_GENERIC_ISA_DMA=3Dy
> > CONFIG_GENERIC_BUG=3Dy
> > CONFIG_GENERIC_HWEIGHT=3Dy
> > CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> > CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> > CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> > CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> > CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> > CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> > CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> > CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> > CONFIG_X86_32_LAZY_GS=3Dy
> > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > CONFIG_FIX_EARLYCON_MEM=3Dy
> > CONFIG_PGTABLE_LEVELS=3D3
> > CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> > CONFIG_CONSTRUCTORS=3Dy
> > CONFIG_IRQ_WORK=3Dy
> > CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> > CONFIG_THREAD_INFO_IN_TASK=3Dy
> > =

> > #
> > # General setup
> > #
> > CONFIG_BROKEN_ON_SMP=3Dy
> > CONFIG_INIT_ENV_ARG_LIMIT=3D32
> > CONFIG_CROSS_COMPILE=3D""
> > # CONFIG_COMPILE_TEST is not set
> > CONFIG_LOCALVERSION=3D""
> > CONFIG_LOCALVERSION_AUTO=3Dy
> > CONFIG_HAVE_KERNEL_GZIP=3Dy
> > CONFIG_HAVE_KERNEL_BZIP2=3Dy
> > CONFIG_HAVE_KERNEL_LZMA=3Dy
> > CONFIG_HAVE_KERNEL_XZ=3Dy
> > CONFIG_HAVE_KERNEL_LZO=3Dy
> > CONFIG_HAVE_KERNEL_LZ4=3Dy
> > # CONFIG_KERNEL_GZIP is not set
> > # CONFIG_KERNEL_BZIP2 is not set
> > # CONFIG_KERNEL_LZMA is not set
> > # CONFIG_KERNEL_XZ is not set
> > CONFIG_KERNEL_LZO=3Dy
> > # CONFIG_KERNEL_LZ4 is not set
> > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> > # CONFIG_SWAP is not set
> > # CONFIG_SYSVIPC is not set
> > # CONFIG_POSIX_MQUEUE is not set
> > CONFIG_CROSS_MEMORY_ATTACH=3Dy
> > CONFIG_FHANDLE=3Dy
> > # CONFIG_USELIB is not set
> > # CONFIG_AUDIT is not set
> > CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> > =

> > #
> > # IRQ subsystem
> > #
> > CONFIG_GENERIC_IRQ_PROBE=3Dy
> > CONFIG_GENERIC_IRQ_SHOW=3Dy
> > CONFIG_GENERIC_IRQ_CHIP=3Dy
> > CONFIG_IRQ_DOMAIN=3Dy
> > # CONFIG_IRQ_DOMAIN_DEBUG is not set
> > CONFIG_IRQ_FORCED_THREADING=3Dy
> > CONFIG_SPARSE_IRQ=3Dy
> > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> > CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> > =

> > #
> > # Timers subsystem
> > #
> > CONFIG_TICK_ONESHOT=3Dy
> > CONFIG_HZ_PERIODIC=3Dy
> > # CONFIG_NO_HZ_IDLE is not set
> > # CONFIG_NO_HZ is not set
> > CONFIG_HIGH_RES_TIMERS=3Dy
> > =

> > #
> > # CPU/Task time and stats accounting
> > #
> > CONFIG_TICK_CPU_ACCOUNTING=3Dy
> > # CONFIG_IRQ_TIME_ACCOUNTING is not set
> > # CONFIG_BSD_PROCESS_ACCT is not set
> > # CONFIG_TASKSTATS is not set
> > =

> > #
> > # RCU Subsystem
> > #
> > CONFIG_PREEMPT_RCU=3Dy
> > CONFIG_RCU_EXPERT=3Dy
> > CONFIG_SRCU=3Dy
> > CONFIG_TASKS_RCU=3Dy
> > CONFIG_RCU_STALL_COMMON=3Dy
> > CONFIG_RCU_FANOUT=3D32
> > CONFIG_RCU_FANOUT_LEAF=3D16
> > CONFIG_TREE_RCU_TRACE=3Dy
> > # CONFIG_RCU_BOOST is not set
> > CONFIG_RCU_KTHREAD_PRIO=3D0
> > # CONFIG_RCU_NOCB_CPU is not set
> > CONFIG_BUILD_BIN2C=3Dy
> > CONFIG_IKCONFIG=3Dy
> > CONFIG_IKCONFIG_PROC=3Dy
> > CONFIG_LOG_BUF_SHIFT=3D17
> > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> > CONFIG_CGROUPS=3Dy
> > CONFIG_PAGE_COUNTER=3Dy
> > CONFIG_MEMCG=3Dy
> > CONFIG_BLK_CGROUP=3Dy
> > # CONFIG_DEBUG_BLK_CGROUP is not set
> > CONFIG_CGROUP_WRITEBACK=3Dy
> > CONFIG_CGROUP_SCHED=3Dy
> > CONFIG_FAIR_GROUP_SCHED=3Dy
> > CONFIG_CFS_BANDWIDTH=3Dy
> > CONFIG_RT_GROUP_SCHED=3Dy
> > CONFIG_CGROUP_PIDS=3Dy
> > # CONFIG_CGROUP_RDMA is not set
> > # CONFIG_CGROUP_FREEZER is not set
> > # CONFIG_CPUSETS is not set
> > CONFIG_CGROUP_DEVICE=3Dy
> > # CONFIG_CGROUP_CPUACCT is not set
> > CONFIG_CGROUP_PERF=3Dy
> > # CONFIG_CGROUP_BPF is not set
> > CONFIG_CGROUP_DEBUG=3Dy
> > CONFIG_SOCK_CGROUP_DATA=3Dy
> > # CONFIG_CHECKPOINT_RESTORE is not set
> > # CONFIG_NAMESPACES is not set
> > CONFIG_SCHED_AUTOGROUP=3Dy
> > # CONFIG_SYSFS_DEPRECATED is not set
> > # CONFIG_RELAY is not set
> > CONFIG_BLK_DEV_INITRD=3Dy
> > CONFIG_INITRAMFS_SOURCE=3D""
> > CONFIG_RD_GZIP=3Dy
> > # CONFIG_RD_BZIP2 is not set
> > CONFIG_RD_LZMA=3Dy
> > # CONFIG_RD_XZ is not set
> > # CONFIG_RD_LZO is not set
> > # CONFIG_RD_LZ4 is not set
> > CONFIG_INITRAMFS_COMPRESSION=3D".gz"
> > CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> > # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> > CONFIG_SYSCTL=3Dy
> > CONFIG_ANON_INODES=3Dy
> > CONFIG_HAVE_UID16=3Dy
> > CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > CONFIG_BPF=3Dy
> > CONFIG_EXPERT=3Dy
> > CONFIG_UID16=3Dy
> > CONFIG_MULTIUSER=3Dy
> > CONFIG_SGETMASK_SYSCALL=3Dy
> > CONFIG_SYSFS_SYSCALL=3Dy
> > # CONFIG_SYSCTL_SYSCALL is not set
> > # CONFIG_POSIX_TIMERS is not set
> > CONFIG_KALLSYMS=3Dy
> > CONFIG_KALLSYMS_ALL=3Dy
> > # CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
> > CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> > CONFIG_PRINTK=3Dy
> > CONFIG_PRINTK_NMI=3Dy
> > CONFIG_BUG=3Dy
> > CONFIG_PCSPKR_PLATFORM=3Dy
> > # CONFIG_BASE_FULL is not set
> > CONFIG_FUTEX=3Dy
> > CONFIG_EPOLL=3Dy
> > CONFIG_SIGNALFD=3Dy
> > CONFIG_TIMERFD=3Dy
> > CONFIG_EVENTFD=3Dy
> > CONFIG_BPF_SYSCALL=3Dy
> > CONFIG_SHMEM=3Dy
> > # CONFIG_AIO is not set
> > # CONFIG_ADVISE_SYSCALLS is not set
> > # CONFIG_USERFAULTFD is not set
> > CONFIG_PCI_QUIRKS=3Dy
> > # CONFIG_MEMBARRIER is not set
> > CONFIG_EMBEDDED=3Dy
> > CONFIG_HAVE_PERF_EVENTS=3Dy
> > CONFIG_PERF_USE_VMALLOC=3Dy
> > # CONFIG_PC104 is not set
> > =

> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=3Dy
> > CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> > # CONFIG_VM_EVENT_COUNTERS is not set
> > # CONFIG_COMPAT_BRK is not set
> > # CONFIG_SLAB is not set
> > # CONFIG_SLUB is not set
> > CONFIG_SLOB=3Dy
> > # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> > # CONFIG_PROFILING is not set
> > CONFIG_KEXEC_CORE=3Dy
> > CONFIG_HAVE_OPROFILE=3Dy
> > CONFIG_OPROFILE_NMI_TIMER=3Dy
> > CONFIG_KPROBES=3Dy
> > # CONFIG_JUMP_LABEL is not set
> > # CONFIG_UPROBES is not set
> > # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> > CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> > CONFIG_KRETPROBES=3Dy
> > CONFIG_HAVE_IOREMAP_PROT=3Dy
> > CONFIG_HAVE_KPROBES=3Dy
> > CONFIG_HAVE_KRETPROBES=3Dy
> > CONFIG_HAVE_OPTPROBES=3Dy
> > CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> > CONFIG_HAVE_NMI=3Dy
> > CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> > CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> > CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> > CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > CONFIG_HAVE_CLK=3Dy
> > CONFIG_HAVE_DMA_API_DEBUG=3Dy
> > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > CONFIG_HAVE_PERF_REGS=3Dy
> > CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> > CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> > CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> > CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> > CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> > CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> > CONFIG_HAVE_GCC_PLUGINS=3Dy
> > # CONFIG_GCC_PLUGINS is not set
> > CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> > # CONFIG_CC_STACKPROTECTOR is not set
> > CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> > # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> > # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> > CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> > CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> > CONFIG_MODULES_USE_ELF_REL=3Dy
> > CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> > CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> > CONFIG_HAVE_EXIT_THREAD=3Dy
> > CONFIG_ARCH_MMAP_RND_BITS=3D8
> > CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> > # CONFIG_HAVE_ARCH_HASH is not set
> > CONFIG_ISA_BUS_API=3Dy
> > CONFIG_CLONE_BACKWARDS=3Dy
> > CONFIG_OLD_SIGSUSPEND3=3Dy
> > CONFIG_OLD_SIGACTION=3Dy
> > # CONFIG_CPU_NO_EFFICIENT_FFS is not set
> > # CONFIG_HAVE_ARCH_VMAP_STACK is not set
> > # CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
> > # CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
> > CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> > CONFIG_STRICT_KERNEL_RWX=3Dy
> > CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> > CONFIG_STRICT_MODULE_RWX=3Dy
> > =

> > #
> > # GCOV-based kernel profiling
> > #
> > CONFIG_GCOV_KERNEL=3Dy
> > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> > CONFIG_GCOV_PROFILE_ALL=3Dy
> > CONFIG_GCOV_FORMAT_AUTODETECT=3Dy
> > # CONFIG_GCOV_FORMAT_3_4 is not set
> > # CONFIG_GCOV_FORMAT_4_7 is not set
> > CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> > CONFIG_RT_MUTEXES=3Dy
> > CONFIG_BASE_SMALL=3D1
> > CONFIG_MODULES=3Dy
> > # CONFIG_MODULE_FORCE_LOAD is not set
> > # CONFIG_MODULE_UNLOAD is not set
> > # CONFIG_MODVERSIONS is not set
> > # CONFIG_MODULE_SRCVERSION_ALL is not set
> > # CONFIG_MODULE_SIG is not set
> > CONFIG_MODULE_COMPRESS=3Dy
> > CONFIG_MODULE_COMPRESS_GZIP=3Dy
> > # CONFIG_MODULE_COMPRESS_XZ is not set
> > CONFIG_TRIM_UNUSED_KSYMS=3Dy
> > CONFIG_MODULES_TREE_LOOKUP=3Dy
> > CONFIG_BLOCK=3Dy
> > # CONFIG_LBDAF is not set
> > CONFIG_BLK_SCSI_REQUEST=3Dy
> > CONFIG_BLK_DEV_BSG=3Dy
> > CONFIG_BLK_DEV_BSGLIB=3Dy
> > CONFIG_BLK_DEV_INTEGRITY=3Dy
> > # CONFIG_BLK_DEV_ZONED is not set
> > # CONFIG_BLK_DEV_THROTTLING is not set
> > CONFIG_BLK_CMDLINE_PARSER=3Dy
> > CONFIG_BLK_WBT=3Dy
> > # CONFIG_BLK_WBT_SQ is not set
> > # CONFIG_BLK_WBT_MQ is not set
> > CONFIG_BLK_DEBUG_FS=3Dy
> > # CONFIG_BLK_SED_OPAL is not set
> > =

> > #
> > # Partition Types
> > #
> > # CONFIG_PARTITION_ADVANCED is not set
> > CONFIG_MSDOS_PARTITION=3Dy
> > CONFIG_EFI_PARTITION=3Dy
> > CONFIG_BLK_MQ_PCI=3Dy
> > =

> > #
> > # IO Schedulers
> > #
> > CONFIG_IOSCHED_NOOP=3Dy
> > CONFIG_IOSCHED_DEADLINE=3Dm
> > CONFIG_IOSCHED_CFQ=3Dm
> > CONFIG_CFQ_GROUP_IOSCHED=3Dy
> > CONFIG_DEFAULT_NOOP=3Dy
> > CONFIG_DEFAULT_IOSCHED=3D"noop"
> > CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> > CONFIG_ASN1=3Dy
> > CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> > CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> > # CONFIG_FREEZER is not set
> > =

> > #
> > # Processor type and features
> > #
> > CONFIG_ZONE_DMA=3Dy
> > # CONFIG_SMP is not set
> > CONFIG_X86_FEATURE_NAMES=3Dy
> > # CONFIG_X86_FAST_FEATURE_TESTS is not set
> > # CONFIG_GOLDFISH is not set
> > CONFIG_INTEL_RDT_A=3Dy
> > CONFIG_X86_EXTENDED_PLATFORM=3Dy
> > # CONFIG_X86_GOLDFISH is not set
> > # CONFIG_X86_INTEL_LPSS is not set
> > # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> > CONFIG_IOSF_MBI=3Dm
> > CONFIG_IOSF_MBI_DEBUG=3Dy
> > # CONFIG_X86_RDC321X is not set
> > # CONFIG_X86_32_IRIS is not set
> > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > CONFIG_HYPERVISOR_GUEST=3Dy
> > CONFIG_PARAVIRT=3Dy
> > # CONFIG_PARAVIRT_DEBUG is not set
> > CONFIG_KVM_GUEST=3Dy
> > # CONFIG_KVM_DEBUG_FS is not set
> > # CONFIG_LGUEST_GUEST is not set
> > # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> > CONFIG_PARAVIRT_CLOCK=3Dy
> > CONFIG_NO_BOOTMEM=3Dy
> > # CONFIG_M486 is not set
> > # CONFIG_M586 is not set
> > # CONFIG_M586TSC is not set
> > CONFIG_M586MMX=3Dy
> > # CONFIG_M686 is not set
> > # CONFIG_MPENTIUMII is not set
> > # CONFIG_MPENTIUMIII is not set
> > # CONFIG_MPENTIUMM is not set
> > # CONFIG_MPENTIUM4 is not set
> > # CONFIG_MK6 is not set
> > # CONFIG_MK7 is not set
> > # CONFIG_MK8 is not set
> > # CONFIG_MCRUSOE is not set
> > # CONFIG_MEFFICEON is not set
> > # CONFIG_MWINCHIPC6 is not set
> > # CONFIG_MWINCHIP3D is not set
> > # CONFIG_MELAN is not set
> > # CONFIG_MGEODEGX1 is not set
> > # CONFIG_MGEODE_LX is not set
> > # CONFIG_MCYRIXIII is not set
> > # CONFIG_MVIAC3_2 is not set
> > # CONFIG_MVIAC7 is not set
> > # CONFIG_MCORE2 is not set
> > # CONFIG_MATOM is not set
> > CONFIG_X86_GENERIC=3Dy
> > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> > CONFIG_X86_L1_CACHE_SHIFT=3D6
> > CONFIG_X86_PPRO_FENCE=3Dy
> > CONFIG_X86_F00F_BUG=3Dy
> > CONFIG_X86_ALIGNMENT_16=3Dy
> > CONFIG_X86_INTEL_USERCOPY=3Dy
> > CONFIG_X86_TSC=3Dy
> > CONFIG_X86_CMPXCHG64=3Dy
> > CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> > # CONFIG_PROCESSOR_SELECT is not set
> > CONFIG_CPU_SUP_INTEL=3Dy
> > CONFIG_CPU_SUP_CYRIX_32=3Dy
> > CONFIG_CPU_SUP_AMD=3Dy
> > CONFIG_CPU_SUP_CENTAUR=3Dy
> > CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> > CONFIG_CPU_SUP_UMC_32=3Dy
> > CONFIG_HPET_TIMER=3Dy
> > CONFIG_DMI=3Dy
> > CONFIG_SWIOTLB=3Dy
> > CONFIG_IOMMU_HELPER=3Dy
> > CONFIG_NR_CPUS=3D1
> > # CONFIG_PREEMPT_NONE is not set
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > CONFIG_PREEMPT=3Dy
> > CONFIG_PREEMPT_COUNT=3Dy
> > # CONFIG_X86_UP_APIC is not set
> > # CONFIG_X86_MCE is not set
> > =

> > #
> > # Performance monitoring
> > #
> > CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> > CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> > CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> > CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> > # CONFIG_X86_LEGACY_VM86 is not set
> > # CONFIG_VM86 is not set
> > CONFIG_X86_16BIT=3Dy
> > CONFIG_X86_ESPFIX32=3Dy
> > CONFIG_TOSHIBA=3Dm
> > CONFIG_I8K=3Dm
> > # CONFIG_X86_REBOOTFIXUPS is not set
> > CONFIG_MICROCODE=3Dy
> > # CONFIG_MICROCODE_INTEL is not set
> > # CONFIG_MICROCODE_AMD is not set
> > CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> > CONFIG_X86_MSR=3Dm
> > CONFIG_X86_CPUID=3Dm
> > # CONFIG_NOHIGHMEM is not set
> > # CONFIG_HIGHMEM4G is not set
> > CONFIG_HIGHMEM64G=3Dy
> > # CONFIG_VMSPLIT_3G is not set
> > CONFIG_VMSPLIT_2G=3Dy
> > # CONFIG_VMSPLIT_1G is not set
> > CONFIG_PAGE_OFFSET=3D0x80000000
> > CONFIG_HIGHMEM=3Dy
> > CONFIG_X86_PAE=3Dy
> > CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> > CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> > CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> > CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> > CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_ILLEGAL_POINTER_VALUE=3D0
> > CONFIG_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_FLATMEM_MANUAL=3Dy
> > # CONFIG_SPARSEMEM_MANUAL is not set
> > CONFIG_FLATMEM=3Dy
> > CONFIG_FLAT_NODE_MEM_MAP=3Dy
> > CONFIG_SPARSEMEM_STATIC=3Dy
> > CONFIG_HAVE_MEMBLOCK=3Dy
> > CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> > CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> > # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> > CONFIG_SPLIT_PTLOCK_CPUS=3D4
> > CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> > CONFIG_MEMORY_BALLOON=3Dy
> > # CONFIG_BALLOON_COMPACTION is not set
> > CONFIG_COMPACTION=3Dy
> > CONFIG_MIGRATION=3Dy
> > CONFIG_PHYS_ADDR_T_64BIT=3Dy
> > # CONFIG_BOUNCE is not set
> > CONFIG_VIRT_TO_BUS=3Dy
> > # CONFIG_KSM is not set
> > CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> > CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> > # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> > CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> > CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
> > CONFIG_NEED_PER_CPU_KM=3Dy
> > # CONFIG_CLEANCACHE is not set
> > # CONFIG_CMA is not set
> > # CONFIG_ZPOOL is not set
> > CONFIG_ZBUD=3Dy
> > CONFIG_ZSMALLOC=3Dy
> > CONFIG_PGTABLE_MAPPING=3Dy
> > # CONFIG_ZSMALLOC_STAT is not set
> > CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> > CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> > CONFIG_IDLE_PAGE_TRACKING=3Dy
> > # CONFIG_X86_PMEM_LEGACY is not set
> > CONFIG_HIGHPTE=3Dy
> > # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> > CONFIG_X86_RESERVE_LOW=3D64
> > # CONFIG_MATH_EMULATION is not set
> > # CONFIG_MTRR is not set
> > # CONFIG_ARCH_RANDOM is not set
> > # CONFIG_X86_SMAP is not set
> > CONFIG_X86_INTEL_MPX=3Dy
> > # CONFIG_EFI is not set
> > # CONFIG_SECCOMP is not set
> > CONFIG_HZ_100=3Dy
> > # CONFIG_HZ_250 is not set
> > # CONFIG_HZ_300 is not set
> > # CONFIG_HZ_1000 is not set
> > CONFIG_HZ=3D100
> > CONFIG_SCHED_HRTICK=3Dy
> > CONFIG_KEXEC=3Dy
> > # CONFIG_CRASH_DUMP is not set
> > CONFIG_PHYSICAL_START=3D0x1000000
> > CONFIG_RELOCATABLE=3Dy
> > CONFIG_RANDOMIZE_BASE=3Dy
> > CONFIG_X86_NEED_RELOCS=3Dy
> > CONFIG_PHYSICAL_ALIGN=3D0x200000
> > # CONFIG_COMPAT_VDSO is not set
> > # CONFIG_CMDLINE_BOOL is not set
> > CONFIG_MODIFY_LDT_SYSCALL=3Dy
> > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> > =

> > #
> > # Power management and ACPI options
> > #
> > # CONFIG_SUSPEND is not set
> > CONFIG_PM=3Dy
> > CONFIG_PM_DEBUG=3Dy
> > # CONFIG_PM_ADVANCED_DEBUG is not set
> > CONFIG_PM_CLK=3Dy
> > CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> > CONFIG_ACPI=3Dy
> > CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> > CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> > # CONFIG_ACPI_DEBUGGER is not set
> > # CONFIG_ACPI_PROCFS_POWER is not set
> > CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> > # CONFIG_ACPI_EC_DEBUGFS is not set
> > CONFIG_ACPI_AC=3Dy
> > CONFIG_ACPI_BATTERY=3Dy
> > CONFIG_ACPI_BUTTON=3Dy
> > # CONFIG_ACPI_VIDEO is not set
> > CONFIG_ACPI_FAN=3Dy
> > # CONFIG_ACPI_DOCK is not set
> > CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> > CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> > CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> > CONFIG_ACPI_PROCESSOR=3Dy
> > # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> > CONFIG_ACPI_THERMAL=3Dy
> > CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> > # CONFIG_ACPI_CUSTOM_DSDT is not set
> > CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> > CONFIG_ACPI_TABLE_UPGRADE=3Dy
> > # CONFIG_ACPI_DEBUG is not set
> > # CONFIG_ACPI_PCI_SLOT is not set
> > CONFIG_X86_PM_TIMER=3Dy
> > # CONFIG_ACPI_CONTAINER is not set
> > # CONFIG_ACPI_SBS is not set
> > # CONFIG_ACPI_HED is not set
> > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> > # CONFIG_ACPI_NFIT is not set
> > CONFIG_HAVE_ACPI_APEI=3Dy
> > CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> > # CONFIG_ACPI_APEI is not set
> > # CONFIG_DPTF_POWER is not set
> > # CONFIG_PMIC_OPREGION is not set
> > # CONFIG_ACPI_CONFIGFS is not set
> > # CONFIG_SFI is not set
> > =

> > #
> > # CPU Frequency scaling
> > #
> > # CONFIG_CPU_FREQ is not set
> > =

> > #
> > # CPU Idle
> > #
> > CONFIG_CPU_IDLE=3Dy
> > CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> > # CONFIG_CPU_IDLE_GOV_MENU is not set
> > # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> > CONFIG_INTEL_IDLE=3Dy
> > =

> > #
> > # Bus options (PCI etc.)
> > #
> > CONFIG_PCI=3Dy
> > # CONFIG_PCI_GOBIOS is not set
> > # CONFIG_PCI_GOMMCONFIG is not set
> > # CONFIG_PCI_GODIRECT is not set
> > CONFIG_PCI_GOANY=3Dy
> > CONFIG_PCI_BIOS=3Dy
> > CONFIG_PCI_DIRECT=3Dy
> > CONFIG_PCI_MMCONFIG=3Dy
> > CONFIG_PCI_DOMAINS=3Dy
> > # CONFIG_PCI_CNB20LE_QUIRK is not set
> > # CONFIG_PCIEPORTBUS is not set
> > CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> > # CONFIG_PCI_MSI is not set
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> > # CONFIG_PCI_STUB is not set
> > # CONFIG_PCI_IOV is not set
> > # CONFIG_PCI_PRI is not set
> > # CONFIG_PCI_PASID is not set
> > CONFIG_PCI_LABEL=3Dy
> > # CONFIG_HOTPLUG_PCI is not set
> > =

> > #
> > # DesignWare PCI Core Support
> > #
> > =

> > #
> > # PCI host controller drivers
> > #
> > CONFIG_ISA_BUS=3Dy
> > CONFIG_ISA_DMA_API=3Dy
> > CONFIG_ISA=3Dy
> > # CONFIG_EISA is not set
> > # CONFIG_SCx200 is not set
> > CONFIG_ALIX=3Dy
> > CONFIG_NET5501=3Dy
> > # CONFIG_GEOS is not set
> > CONFIG_AMD_NB=3Dy
> > CONFIG_PCCARD=3Dy
> > CONFIG_PCMCIA=3Dm
> > # CONFIG_PCMCIA_LOAD_CIS is not set
> > CONFIG_CARDBUS=3Dy
> > =

> > #
> > # PC-card bridges
> > #
> > # CONFIG_YENTA is not set
> > # CONFIG_PD6729 is not set
> > # CONFIG_I82092 is not set
> > CONFIG_I82365=3Dm
> > CONFIG_TCIC=3Dm
> > CONFIG_PCMCIA_PROBE=3Dy
> > CONFIG_PCCARD_NONSTATIC=3Dy
> > # CONFIG_RAPIDIO is not set
> > CONFIG_X86_SYSFB=3Dy
> > =

> > #
> > # Executable file formats / Emulations
> > #
> > CONFIG_BINFMT_ELF=3Dy
> > CONFIG_ELFCORE=3Dy
> > CONFIG_BINFMT_SCRIPT=3Dy
> > CONFIG_HAVE_AOUT=3Dy
> > # CONFIG_BINFMT_AOUT is not set
> > CONFIG_BINFMT_MISC=3Dm
> > # CONFIG_COREDUMP is not set
> > CONFIG_COMPAT_32=3Dy
> > CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> > CONFIG_NET=3Dy
> > CONFIG_NET_INGRESS=3Dy
> > =

> > #
> > # Networking options
> > #
> > CONFIG_PACKET=3Dm
> > CONFIG_PACKET_DIAG=3Dm
> > CONFIG_UNIX=3Dy
> > # CONFIG_UNIX_DIAG is not set
> > CONFIG_XFRM=3Dy
> > CONFIG_XFRM_ALGO=3Dy
> > CONFIG_XFRM_USER=3Dy
> > CONFIG_XFRM_SUB_POLICY=3Dy
> > CONFIG_XFRM_MIGRATE=3Dy
> > # CONFIG_XFRM_STATISTICS is not set
> > CONFIG_XFRM_IPCOMP=3Dm
> > CONFIG_NET_KEY=3Dy
> > # CONFIG_NET_KEY_MIGRATE is not set
> > CONFIG_INET=3Dy
> > CONFIG_IP_MULTICAST=3Dy
> > # CONFIG_IP_ADVANCED_ROUTER is not set
> > CONFIG_IP_PNP=3Dy
> > CONFIG_IP_PNP_DHCP=3Dy
> > # CONFIG_IP_PNP_BOOTP is not set
> > # CONFIG_IP_PNP_RARP is not set
> > # CONFIG_NET_IPIP is not set
> > CONFIG_NET_IPGRE_DEMUX=3Dy
> > CONFIG_NET_IP_TUNNEL=3Dy
> > CONFIG_NET_IPGRE=3Dm
> > # CONFIG_NET_IPGRE_BROADCAST is not set
> > # CONFIG_IP_MROUTE is not set
> > # CONFIG_SYN_COOKIES is not set
> > CONFIG_NET_UDP_TUNNEL=3Dy
> > CONFIG_NET_FOU=3Dm
> > CONFIG_NET_FOU_IP_TUNNELS=3Dy
> > # CONFIG_INET_AH is not set
> > CONFIG_INET_ESP=3Dy
> > # CONFIG_INET_ESP_OFFLOAD is not set
> > CONFIG_INET_IPCOMP=3Dm
> > CONFIG_INET_XFRM_TUNNEL=3Dm
> > CONFIG_INET_TUNNEL=3Dm
> > # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> > # CONFIG_INET_XFRM_MODE_TUNNEL is not set
> > CONFIG_INET_XFRM_MODE_BEET=3Dm
> > CONFIG_INET_DIAG=3Dm
> > CONFIG_INET_TCP_DIAG=3Dm
> > CONFIG_INET_UDP_DIAG=3Dm
> > CONFIG_INET_RAW_DIAG=3Dm
> > CONFIG_INET_DIAG_DESTROY=3Dy
> > CONFIG_TCP_CONG_ADVANCED=3Dy
> > CONFIG_TCP_CONG_BIC=3Dy
> > CONFIG_TCP_CONG_CUBIC=3Dy
> > # CONFIG_TCP_CONG_WESTWOOD is not set
> > # CONFIG_TCP_CONG_HTCP is not set
> > # CONFIG_TCP_CONG_HSTCP is not set
> > CONFIG_TCP_CONG_HYBLA=3Dm
> > CONFIG_TCP_CONG_VEGAS=3Dy
> > CONFIG_TCP_CONG_NV=3Dm
> > CONFIG_TCP_CONG_SCALABLE=3Dm
> > CONFIG_TCP_CONG_LP=3Dy
> > # CONFIG_TCP_CONG_VENO is not set
> > CONFIG_TCP_CONG_YEAH=3Dy
> > CONFIG_TCP_CONG_ILLINOIS=3Dy
> > # CONFIG_TCP_CONG_DCTCP is not set
> > CONFIG_TCP_CONG_CDG=3Dy
> > # CONFIG_TCP_CONG_BBR is not set
> > # CONFIG_DEFAULT_BIC is not set
> > # CONFIG_DEFAULT_CUBIC is not set
> > CONFIG_DEFAULT_VEGAS=3Dy
> > # CONFIG_DEFAULT_CDG is not set
> > # CONFIG_DEFAULT_RENO is not set
> > CONFIG_DEFAULT_TCP_CONG=3D"vegas"
> > # CONFIG_TCP_MD5SIG is not set
> > CONFIG_IPV6=3Dy
> > # CONFIG_IPV6_ROUTER_PREF is not set
> > # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> > CONFIG_INET6_AH=3Dy
> > CONFIG_INET6_ESP=3Dy
> > # CONFIG_INET6_ESP_OFFLOAD is not set
> > # CONFIG_INET6_IPCOMP is not set
> > # CONFIG_IPV6_MIP6 is not set
> > # CONFIG_IPV6_ILA is not set
> > # CONFIG_INET6_XFRM_TUNNEL is not set
> > CONFIG_INET6_TUNNEL=3Dy
> > # CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
> > CONFIG_INET6_XFRM_MODE_TUNNEL=3Dm
> > CONFIG_INET6_XFRM_MODE_BEET=3Dm
> > CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=3Dm
> > CONFIG_IPV6_VTI=3Dm
> > # CONFIG_IPV6_SIT is not set
> > CONFIG_IPV6_TUNNEL=3Dy
> > CONFIG_IPV6_GRE=3Dm
> > CONFIG_IPV6_FOU=3Dm
> > CONFIG_IPV6_FOU_TUNNEL=3Dm
> > CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> > CONFIG_IPV6_SUBTREES=3Dy
> > # CONFIG_IPV6_MROUTE is not set
> > CONFIG_IPV6_SEG6_LWTUNNEL=3Dy
> > # CONFIG_IPV6_SEG6_INLINE is not set
> > CONFIG_IPV6_SEG6_HMAC=3Dy
> > CONFIG_NETWORK_SECMARK=3Dy
> > CONFIG_NET_PTP_CLASSIFY=3Dy
> > CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> > CONFIG_NETFILTER=3Dy
> > CONFIG_NETFILTER_DEBUG=3Dy
> > # CONFIG_NETFILTER_ADVANCED is not set
> > =

> > #
> > # Core Netfilter Configuration
> > #
> > CONFIG_NETFILTER_INGRESS=3Dy
> > CONFIG_NETFILTER_NETLINK=3Dy
> > CONFIG_NETFILTER_NETLINK_LOG=3Dy
> > CONFIG_NF_CONNTRACK=3Dm
> > CONFIG_NF_LOG_COMMON=3Dy
> > # CONFIG_NF_LOG_NETDEV is not set
> > # CONFIG_NF_CONNTRACK_SECMARK is not set
> > CONFIG_NF_CONNTRACK_PROCFS=3Dy
> > # CONFIG_NF_CONNTRACK_FTP is not set
> > CONFIG_NF_CONNTRACK_IRC=3Dm
> > CONFIG_NF_CONNTRACK_BROADCAST=3Dm
> > CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
> > # CONFIG_NF_CONNTRACK_SIP is not set
> > CONFIG_NF_CT_NETLINK=3Dm
> > CONFIG_NETFILTER_NETLINK_GLUE_CT=3Dy
> > CONFIG_NF_TABLES=3Dm
> > CONFIG_NF_TABLES_INET=3Dm
> > CONFIG_NF_TABLES_NETDEV=3Dm
> > CONFIG_NFT_EXTHDR=3Dm
> > CONFIG_NFT_META=3Dm
> > CONFIG_NFT_RT=3Dm
> > CONFIG_NFT_NUMGEN=3Dm
> > CONFIG_NFT_CT=3Dm
> > # CONFIG_NFT_SET_RBTREE is not set
> > CONFIG_NFT_SET_HASH=3Dm
> > # CONFIG_NFT_SET_BITMAP is not set
> > CONFIG_NFT_COUNTER=3Dm
> > CONFIG_NFT_LOG=3Dm
> > CONFIG_NFT_LIMIT=3Dm
> > # CONFIG_NFT_NAT is not set
> > CONFIG_NFT_OBJREF=3Dm
> > CONFIG_NFT_QUOTA=3Dm
> > CONFIG_NFT_REJECT=3Dm
> > CONFIG_NFT_REJECT_INET=3Dm
> > # CONFIG_NFT_COMPAT is not set
> > CONFIG_NFT_HASH=3Dm
> > CONFIG_NFT_FIB=3Dm
> > CONFIG_NFT_FIB_INET=3Dm
> > CONFIG_NF_DUP_NETDEV=3Dm
> > CONFIG_NFT_DUP_NETDEV=3Dm
> > CONFIG_NFT_FWD_NETDEV=3Dm
> > CONFIG_NETFILTER_XTABLES=3Dm
> > =

> > #
> > # Xtables combined modules
> > #
> > # CONFIG_NETFILTER_XT_MARK is not set
> > =

> > #
> > # Xtables targets
> > #
> > CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
> > CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
> > CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
> > # CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
> > =

> > #
> > # Xtables matches
> > #
> > # CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
> > CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
> > CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
> > CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
> > CONFIG_IP_SET=3Dy
> > CONFIG_IP_SET_MAX=3D256
> > CONFIG_IP_SET_BITMAP_IP=3Dm
> > CONFIG_IP_SET_BITMAP_IPMAC=3Dm
> > CONFIG_IP_SET_BITMAP_PORT=3Dm
> > CONFIG_IP_SET_HASH_IP=3Dy
> > CONFIG_IP_SET_HASH_IPMARK=3Dm
> > CONFIG_IP_SET_HASH_IPPORT=3Dm
> > CONFIG_IP_SET_HASH_IPPORTIP=3Dy
> > CONFIG_IP_SET_HASH_IPPORTNET=3Dm
> > CONFIG_IP_SET_HASH_IPMAC=3Dy
> > # CONFIG_IP_SET_HASH_MAC is not set
> > # CONFIG_IP_SET_HASH_NETPORTNET is not set
> > CONFIG_IP_SET_HASH_NET=3Dy
> > CONFIG_IP_SET_HASH_NETNET=3Dy
> > CONFIG_IP_SET_HASH_NETPORT=3Dm
> > CONFIG_IP_SET_HASH_NETIFACE=3Dy
> > # CONFIG_IP_SET_LIST_SET is not set
> > CONFIG_IP_VS=3Dm
> > CONFIG_IP_VS_IPV6=3Dy
> > CONFIG_IP_VS_DEBUG=3Dy
> > CONFIG_IP_VS_TAB_BITS=3D12
> > =

> > #
> > # IPVS transport protocol load balancing support
> > #
> > CONFIG_IP_VS_PROTO_TCP=3Dy
> > # CONFIG_IP_VS_PROTO_UDP is not set
> > # CONFIG_IP_VS_PROTO_AH_ESP is not set
> > # CONFIG_IP_VS_PROTO_ESP is not set
> > # CONFIG_IP_VS_PROTO_AH is not set
> > # CONFIG_IP_VS_PROTO_SCTP is not set
> > =

> > #
> > # IPVS scheduler
> > #
> > # CONFIG_IP_VS_RR is not set
> > CONFIG_IP_VS_WRR=3Dm
> > CONFIG_IP_VS_LC=3Dm
> > CONFIG_IP_VS_WLC=3Dm
> > CONFIG_IP_VS_FO=3Dm
> > CONFIG_IP_VS_OVF=3Dm
> > # CONFIG_IP_VS_LBLC is not set
> > CONFIG_IP_VS_LBLCR=3Dm
> > # CONFIG_IP_VS_DH is not set
> > CONFIG_IP_VS_SH=3Dm
> > CONFIG_IP_VS_SED=3Dm
> > # CONFIG_IP_VS_NQ is not set
> > =

> > #
> > # IPVS SH scheduler
> > #
> > CONFIG_IP_VS_SH_TAB_BITS=3D8
> > =

> > #
> > # IPVS application helper
> > #
> > CONFIG_IP_VS_NFCT=3Dy
> > =

> > #
> > # IP: Netfilter Configuration
> > #
> > # CONFIG_NF_DEFRAG_IPV4 is not set
> > # CONFIG_NF_CONNTRACK_IPV4 is not set
> > CONFIG_NF_SOCKET_IPV4=3Dy
> > CONFIG_NF_TABLES_IPV4=3Dm
> > # CONFIG_NFT_CHAIN_ROUTE_IPV4 is not set
> > CONFIG_NFT_REJECT_IPV4=3Dm
> > CONFIG_NFT_DUP_IPV4=3Dm
> > CONFIG_NFT_FIB_IPV4=3Dm
> > CONFIG_NF_TABLES_ARP=3Dm
> > CONFIG_NF_DUP_IPV4=3Dm
> > CONFIG_NF_LOG_ARP=3Dy
> > CONFIG_NF_LOG_IPV4=3Dm
> > CONFIG_NF_REJECT_IPV4=3Dm
> > # CONFIG_IP_NF_IPTABLES is not set
> > =

> > #
> > # IPv6: Netfilter Configuration
> > #
> > # CONFIG_NF_DEFRAG_IPV6 is not set
> > # CONFIG_NF_CONNTRACK_IPV6 is not set
> > CONFIG_NF_SOCKET_IPV6=3Dm
> > CONFIG_NF_TABLES_IPV6=3Dm
> > CONFIG_NFT_CHAIN_ROUTE_IPV6=3Dm
> > CONFIG_NFT_REJECT_IPV6=3Dm
> > CONFIG_NFT_DUP_IPV6=3Dm
> > CONFIG_NFT_FIB_IPV6=3Dm
> > CONFIG_NF_DUP_IPV6=3Dm
> > CONFIG_NF_REJECT_IPV6=3Dm
> > CONFIG_NF_LOG_IPV6=3Dm
> > CONFIG_IP6_NF_IPTABLES=3Dm
> > # CONFIG_IP6_NF_MATCH_IPV6HEADER is not set
> > CONFIG_IP6_NF_FILTER=3Dm
> > # CONFIG_IP6_NF_TARGET_REJECT is not set
> > CONFIG_IP6_NF_MANGLE=3Dm
> > CONFIG_IP6_NF_RAW=3Dm
> > CONFIG_IP_DCCP=3Dy
> > CONFIG_INET_DCCP_DIAG=3Dm
> > =

> > #
> > # DCCP CCIDs Configuration
> > #
> > # CONFIG_IP_DCCP_CCID2_DEBUG is not set
> > # CONFIG_IP_DCCP_CCID3 is not set
> > =

> > #
> > # DCCP Kernel Hacking
> > #
> > CONFIG_IP_DCCP_DEBUG=3Dy
> > # CONFIG_NET_DCCPPROBE is not set
> > CONFIG_IP_SCTP=3Dy
> > # CONFIG_NET_SCTPPROBE is not set
> > # CONFIG_SCTP_DBG_OBJCNT is not set
> > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
> > CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE=3Dy
> > CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> > # CONFIG_SCTP_COOKIE_HMAC_SHA1 is not set
> > CONFIG_INET_SCTP_DIAG=3Dm
> > # CONFIG_RDS is not set
> > # CONFIG_TIPC is not set
> > # CONFIG_ATM is not set
> > CONFIG_L2TP=3Dy
> > # CONFIG_L2TP_DEBUGFS is not set
> > CONFIG_L2TP_V3=3Dy
> > CONFIG_L2TP_IP=3Dy
> > CONFIG_L2TP_ETH=3Dy
> > CONFIG_MRP=3Dy
> > # CONFIG_BRIDGE is not set
> > CONFIG_VLAN_8021Q=3Dy
> > # CONFIG_VLAN_8021Q_GVRP is not set
> > CONFIG_VLAN_8021Q_MVRP=3Dy
> > CONFIG_DECNET=3Dy
> > # CONFIG_DECNET_ROUTER is not set
> > CONFIG_LLC=3Dy
> > CONFIG_LLC2=3Dm
> > CONFIG_IPX=3Dy
> > # CONFIG_IPX_INTERN is not set
> > # CONFIG_ATALK is not set
> > # CONFIG_X25 is not set
> > CONFIG_LAPB=3Dy
> > CONFIG_PHONET=3Dm
> > CONFIG_6LOWPAN=3Dm
> > CONFIG_6LOWPAN_DEBUGFS=3Dy
> > # CONFIG_6LOWPAN_NHC is not set
> > CONFIG_IEEE802154=3Dy
> > CONFIG_IEEE802154_NL802154_EXPERIMENTAL=3Dy
> > # CONFIG_IEEE802154_SOCKET is not set
> > CONFIG_IEEE802154_6LOWPAN=3Dm
> > # CONFIG_MAC802154 is not set
> > CONFIG_NET_SCHED=3Dy
> > =

> > #
> > # Queueing/Scheduling
> > #
> > CONFIG_NET_SCH_CBQ=3Dy
> > CONFIG_NET_SCH_HTB=3Dm
> > CONFIG_NET_SCH_HFSC=3Dm
> > CONFIG_NET_SCH_PRIO=3Dm
> > CONFIG_NET_SCH_MULTIQ=3Dm
> > CONFIG_NET_SCH_RED=3Dy
> > CONFIG_NET_SCH_SFB=3Dy
> > CONFIG_NET_SCH_SFQ=3Dm
> > # CONFIG_NET_SCH_TEQL is not set
> > # CONFIG_NET_SCH_TBF is not set
> > # CONFIG_NET_SCH_GRED is not set
> > CONFIG_NET_SCH_DSMARK=3Dm
> > CONFIG_NET_SCH_NETEM=3Dy
> > # CONFIG_NET_SCH_DRR is not set
> > # CONFIG_NET_SCH_MQPRIO is not set
> > CONFIG_NET_SCH_CHOKE=3Dm
> > CONFIG_NET_SCH_QFQ=3Dy
> > CONFIG_NET_SCH_CODEL=3Dy
> > CONFIG_NET_SCH_FQ_CODEL=3Dm
> > CONFIG_NET_SCH_FQ=3Dy
> > CONFIG_NET_SCH_HHF=3Dy
> > CONFIG_NET_SCH_PIE=3Dy
> > CONFIG_NET_SCH_PLUG=3Dy
> > =

> > #
> > # Classification
> > #
> > CONFIG_NET_CLS=3Dy
> > CONFIG_NET_CLS_BASIC=3Dy
> > CONFIG_NET_CLS_TCINDEX=3Dm
> > # CONFIG_NET_CLS_ROUTE4 is not set
> > # CONFIG_NET_CLS_FW is not set
> > # CONFIG_NET_CLS_U32 is not set
> > CONFIG_NET_CLS_RSVP=3Dy
> > CONFIG_NET_CLS_RSVP6=3Dm
> > CONFIG_NET_CLS_FLOW=3Dy
> > CONFIG_NET_CLS_CGROUP=3Dy
> > CONFIG_NET_CLS_BPF=3Dy
> > CONFIG_NET_CLS_FLOWER=3Dy
> > CONFIG_NET_CLS_MATCHALL=3Dy
> > # CONFIG_NET_EMATCH is not set
> > # CONFIG_NET_CLS_ACT is not set
> > CONFIG_NET_SCH_FIFO=3Dy
> > CONFIG_DCB=3Dy
> > CONFIG_DNS_RESOLVER=3Dy
> > # CONFIG_BATMAN_ADV is not set
> > # CONFIG_OPENVSWITCH is not set
> > CONFIG_VSOCKETS=3Dm
> > CONFIG_VIRTIO_VSOCKETS=3Dm
> > CONFIG_VIRTIO_VSOCKETS_COMMON=3Dm
> > CONFIG_NETLINK_DIAG=3Dm
> > CONFIG_MPLS=3Dy
> > # CONFIG_NET_MPLS_GSO is not set
> > CONFIG_MPLS_ROUTING=3Dm
> > CONFIG_MPLS_IPTUNNEL=3Dm
> > # CONFIG_HSR is not set
> > CONFIG_NET_SWITCHDEV=3Dy
> > # CONFIG_NET_L3_MASTER_DEV is not set
> > # CONFIG_NET_NCSI is not set
> > CONFIG_CGROUP_NET_PRIO=3Dy
> > CONFIG_CGROUP_NET_CLASSID=3Dy
> > CONFIG_NET_RX_BUSY_POLL=3Dy
> > CONFIG_BQL=3Dy
> > =

> > #
> > # Network testing
> > #
> > # CONFIG_NET_PKTGEN is not set
> > # CONFIG_NET_TCPPROBE is not set
> > CONFIG_HAMRADIO=3Dy
> > =

> > #
> > # Packet Radio protocols
> > #
> > CONFIG_AX25=3Dm
> > # CONFIG_AX25_DAMA_SLAVE is not set
> > CONFIG_NETROM=3Dm
> > # CONFIG_ROSE is not set
> > =

> > #
> > # AX.25 network device drivers
> > #
> > # CONFIG_MKISS is not set
> > # CONFIG_6PACK is not set
> > # CONFIG_BPQETHER is not set
> > CONFIG_DMASCC=3Dm
> > CONFIG_SCC=3Dm
> > # CONFIG_SCC_DELAY is not set
> > CONFIG_SCC_TRXECHO=3Dy
> > # CONFIG_BAYCOM_SER_FDX is not set
> > # CONFIG_BAYCOM_SER_HDX is not set
> > CONFIG_BAYCOM_PAR=3Dm
> > CONFIG_BAYCOM_EPP=3Dm
> > # CONFIG_YAM is not set
> > CONFIG_CAN=3Dy
> > CONFIG_CAN_RAW=3Dm
> > CONFIG_CAN_BCM=3Dm
> > # CONFIG_CAN_GW is not set
> > =

> > #
> > # CAN Device Drivers
> > #
> > CONFIG_CAN_VCAN=3Dy
> > # CONFIG_CAN_SLCAN is not set
> > # CONFIG_CAN_DEV is not set
> > # CONFIG_CAN_DEBUG_DEVICES is not set
> > CONFIG_IRDA=3Dy
> > =

> > #
> > # IrDA protocols
> > #
> > CONFIG_IRLAN=3Dm
> > # CONFIG_IRCOMM is not set
> > CONFIG_IRDA_ULTRA=3Dy
> > =

> > #
> > # IrDA options
> > #
> > # CONFIG_IRDA_CACHE_LAST_LSAP is not set
> > # CONFIG_IRDA_FAST_RR is not set
> > CONFIG_IRDA_DEBUG=3Dy
> > =

> > #
> > # Infrared-port device drivers
> > #
> > =

> > #
> > # SIR device drivers
> > #
> > # CONFIG_IRTTY_SIR is not set
> > =

> > #
> > # Dongle support
> > #
> > CONFIG_KINGSUN_DONGLE=3Dm
> > CONFIG_KSDAZZLE_DONGLE=3Dy
> > CONFIG_KS959_DONGLE=3Dy
> > =

> > #
> > # FIR device drivers
> > #
> > CONFIG_USB_IRDA=3Dy
> > # CONFIG_SIGMATEL_FIR is not set
> > CONFIG_NSC_FIR=3Dy
> > CONFIG_WINBOND_FIR=3Dy
> > # CONFIG_TOSHIBA_FIR is not set
> > CONFIG_SMC_IRCC_FIR=3Dy
> > CONFIG_ALI_FIR=3Dy
> > # CONFIG_VLSI_FIR is not set
> > CONFIG_VIA_FIR=3Dy
> > CONFIG_MCS_FIR=3Dy
> > CONFIG_BT=3Dy
> > # CONFIG_BT_BREDR is not set
> > # CONFIG_BT_LE is not set
> > CONFIG_BT_LEDS=3Dy
> > # CONFIG_BT_SELFTEST is not set
> > CONFIG_BT_DEBUGFS=3Dy
> > =

> > #
> > # Bluetooth device drivers
> > #
> > # CONFIG_BT_HCIBTUSB is not set
> > # CONFIG_BT_HCIBTSDIO is not set
> > # CONFIG_BT_HCIUART is not set
> > # CONFIG_BT_HCIBCM203X is not set
> > # CONFIG_BT_HCIBFUSB is not set
> > CONFIG_BT_HCIDTL1=3Dm
> > CONFIG_BT_HCIBT3C=3Dm
> > CONFIG_BT_HCIBLUECARD=3Dm
> > CONFIG_BT_HCIBTUART=3Dm
> > # CONFIG_BT_HCIVHCI is not set
> > CONFIG_BT_MRVL=3Dm
> > CONFIG_BT_MRVL_SDIO=3Dm
> > CONFIG_AF_RXRPC=3Dm
> > CONFIG_AF_RXRPC_IPV6=3Dy
> > # CONFIG_AF_RXRPC_INJECT_LOSS is not set
> > CONFIG_AF_RXRPC_DEBUG=3Dy
> > # CONFIG_RXKAD is not set
> > # CONFIG_AF_KCM is not set
> > # CONFIG_STREAM_PARSER is not set
> > CONFIG_FIB_RULES=3Dy
> > # CONFIG_WIRELESS is not set
> > CONFIG_WIMAX=3Dm
> > CONFIG_WIMAX_DEBUG_LEVEL=3D8
> > CONFIG_RFKILL=3Dy
> > CONFIG_RFKILL_LEDS=3Dy
> > # CONFIG_RFKILL_INPUT is not set
> > # CONFIG_RFKILL_GPIO is not set
> > CONFIG_NET_9P=3Dm
> > # CONFIG_NET_9P_VIRTIO is not set
> > CONFIG_NET_9P_DEBUG=3Dy
> > CONFIG_CAIF=3Dm
> > CONFIG_CAIF_DEBUG=3Dy
> > CONFIG_CAIF_NETDEV=3Dm
> > CONFIG_CAIF_USB=3Dm
> > CONFIG_CEPH_LIB=3Dy
> > # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> > CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> > # CONFIG_NFC is not set
> > # CONFIG_PSAMPLE is not set
> > # CONFIG_NET_IFE is not set
> > CONFIG_LWTUNNEL=3Dy
> > # CONFIG_LWTUNNEL_BPF is not set
> > CONFIG_DST_CACHE=3Dy
> > CONFIG_GRO_CELLS=3Dy
> > # CONFIG_NET_DEVLINK is not set
> > CONFIG_MAY_USE_DEVLINK=3Dy
> > =

> > #
> > # Device Drivers
> > #
> > =

> > #
> > # Generic Driver Options
> > #
> > # CONFIG_UEVENT_HELPER is not set
> > CONFIG_DEVTMPFS=3Dy
> > # CONFIG_DEVTMPFS_MOUNT is not set
> > # CONFIG_STANDALONE is not set
> > # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> > CONFIG_FW_LOADER=3Dy
> > # CONFIG_FIRMWARE_IN_KERNEL is not set
> > CONFIG_EXTRA_FIRMWARE=3D""
> > CONFIG_FW_LOADER_USER_HELPER=3Dy
> > # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> > CONFIG_WANT_DEV_COREDUMP=3Dy
> > CONFIG_ALLOW_DEV_COREDUMP=3Dy
> > CONFIG_DEV_COREDUMP=3Dy
> > # CONFIG_DEBUG_DRIVER is not set
> > CONFIG_DEBUG_DEVRES=3Dy
> > CONFIG_DEBUG_TEST_DRIVER_REMOVE=3Dy
> > # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> > # CONFIG_SYS_HYPERVISOR is not set
> > # CONFIG_GENERIC_CPU_DEVICES is not set
> > CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> > CONFIG_REGMAP=3Dy
> > CONFIG_REGMAP_I2C=3Dy
> > CONFIG_REGMAP_SPMI=3Dm
> > CONFIG_REGMAP_MMIO=3Dy
> > CONFIG_REGMAP_IRQ=3Dy
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > # CONFIG_DMA_FENCE_TRACE is not set
> > =

> > #
> > # Bus devices
> > #
> > CONFIG_CONNECTOR=3Dy
> > CONFIG_PROC_EVENTS=3Dy
> > CONFIG_MTD=3Dm
> > # CONFIG_MTD_TESTS is not set
> > CONFIG_MTD_REDBOOT_PARTS=3Dm
> > CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> > CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> > CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
> > CONFIG_MTD_CMDLINE_PARTS=3Dm
> > CONFIG_MTD_AR7_PARTS=3Dm
> > =

> > #
> > # User Modules And Translation Layers
> > #
> > CONFIG_MTD_BLKDEVS=3Dm
> > CONFIG_MTD_BLOCK=3Dm
> > CONFIG_MTD_BLOCK_RO=3Dm
> > # CONFIG_FTL is not set
> > CONFIG_NFTL=3Dm
> > # CONFIG_NFTL_RW is not set
> > CONFIG_INFTL=3Dm
> > # CONFIG_RFD_FTL is not set
> > CONFIG_SSFDC=3Dm
> > CONFIG_SM_FTL=3Dm
> > # CONFIG_MTD_OOPS is not set
> > CONFIG_MTD_PARTITIONED_MASTER=3Dy
> > =

> > #
> > # RAM/ROM/Flash chip drivers
> > #
> > CONFIG_MTD_CFI=3Dm
> > CONFIG_MTD_JEDECPROBE=3Dm
> > CONFIG_MTD_GEN_PROBE=3Dm
> > CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> > CONFIG_MTD_CFI_NOSWAP=3Dy
> > # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> > # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> > # CONFIG_MTD_CFI_GEOMETRY is not set
> > CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> > CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> > CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> > # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> > # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> > # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> > CONFIG_MTD_CFI_I1=3Dy
> > CONFIG_MTD_CFI_I2=3Dy
> > # CONFIG_MTD_CFI_I4 is not set
> > # CONFIG_MTD_CFI_I8 is not set
> > CONFIG_MTD_OTP=3Dy
> > # CONFIG_MTD_CFI_INTELEXT is not set
> > # CONFIG_MTD_CFI_AMDSTD is not set
> > CONFIG_MTD_CFI_STAA=3Dm
> > CONFIG_MTD_CFI_UTIL=3Dm
> > CONFIG_MTD_RAM=3Dm
> > CONFIG_MTD_ROM=3Dm
> > # CONFIG_MTD_ABSENT is not set
> > =

> > #
> > # Mapping drivers for chip access
> > #
> > # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> > # CONFIG_MTD_PHYSMAP is not set
> > CONFIG_MTD_AMD76XROM=3Dm
> > CONFIG_MTD_ICHXROM=3Dm
> > # CONFIG_MTD_ESB2ROM is not set
> > # CONFIG_MTD_CK804XROM is not set
> > # CONFIG_MTD_SCB2_FLASH is not set
> > # CONFIG_MTD_NETtel is not set
> > CONFIG_MTD_L440GX=3Dm
> > # CONFIG_MTD_INTEL_VR_NOR is not set
> > # CONFIG_MTD_PLATRAM is not set
> > =

> > #
> > # Self-contained MTD device drivers
> > #
> > # CONFIG_MTD_PMC551 is not set
> > CONFIG_MTD_SLRAM=3Dm
> > CONFIG_MTD_PHRAM=3Dm
> > CONFIG_MTD_MTDRAM=3Dm
> > CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> > CONFIG_MTDRAM_ERASE_SIZE=3D128
> > CONFIG_MTD_BLOCK2MTD=3Dm
> > =

> > #
> > # Disk-On-Chip Device Drivers
> > #
> > # CONFIG_MTD_DOCG3 is not set
> > CONFIG_MTD_NAND_ECC=3Dm
> > # CONFIG_MTD_NAND_ECC_SMC is not set
> > # CONFIG_MTD_NAND is not set
> > CONFIG_MTD_ONENAND=3Dm
> > CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> > # CONFIG_MTD_ONENAND_GENERIC is not set
> > # CONFIG_MTD_ONENAND_OTP is not set
> > CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> > =

> > #
> > # LPDDR & LPDDR2 PCM memory drivers
> > #
> > CONFIG_MTD_LPDDR=3Dm
> > CONFIG_MTD_QINFO_PROBE=3Dm
> > # CONFIG_MTD_SPI_NOR is not set
> > # CONFIG_MTD_UBI is not set
> > # CONFIG_OF is not set
> > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> > CONFIG_PARPORT=3Dm
> > # CONFIG_PARPORT_PC is not set
> > # CONFIG_PARPORT_GSC is not set
> > CONFIG_PARPORT_AX88796=3Dm
> > CONFIG_PARPORT_1284=3Dy
> > CONFIG_PARPORT_NOT_PC=3Dy
> > CONFIG_PNP=3Dy
> > # CONFIG_PNP_DEBUG_MESSAGES is not set
> > =

> > #
> > # Protocols
> > #
> > # CONFIG_ISAPNP is not set
> > # CONFIG_PNPBIOS is not set
> > CONFIG_PNPACPI=3Dy
> > CONFIG_BLK_DEV=3Dy
> > # CONFIG_BLK_DEV_NULL_BLK is not set
> > # CONFIG_BLK_DEV_FD is not set
> > # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> > # CONFIG_ZRAM is not set
> > # CONFIG_BLK_CPQ_CISS_DA is not set
> > # CONFIG_BLK_DEV_DAC960 is not set
> > # CONFIG_BLK_DEV_UMEM is not set
> > # CONFIG_BLK_DEV_COW_COMMON is not set
> > # CONFIG_BLK_DEV_LOOP is not set
> > # CONFIG_BLK_DEV_DRBD is not set
> > # CONFIG_BLK_DEV_NBD is not set
> > # CONFIG_BLK_DEV_SX8 is not set
> > # CONFIG_BLK_DEV_RAM is not set
> > # CONFIG_CDROM_PKTCDVD is not set
> > # CONFIG_ATA_OVER_ETH is not set
> > # CONFIG_VIRTIO_BLK is not set
> > # CONFIG_BLK_DEV_HD is not set
> > # CONFIG_BLK_DEV_RBD is not set
> > # CONFIG_BLK_DEV_RSXX is not set
> > CONFIG_NVME_CORE=3Dy
> > # CONFIG_BLK_DEV_NVME is not set
> > CONFIG_BLK_DEV_NVME_SCSI=3Dy
> > CONFIG_NVME_FABRICS=3Dy
> > CONFIG_NVME_FC=3Dy
> > CONFIG_NVME_TARGET=3Dm
> > CONFIG_NVME_TARGET_LOOP=3Dm
> > # CONFIG_NVME_TARGET_FC is not set
> > =

> > #
> > # Misc devices
> > #
> > # CONFIG_SENSORS_LIS3LV02D is not set
> > CONFIG_AD525X_DPOT=3Dm
> > CONFIG_AD525X_DPOT_I2C=3Dm
> > CONFIG_DUMMY_IRQ=3Dm
> > # CONFIG_IBM_ASM is not set
> > # CONFIG_PHANTOM is not set
> > # CONFIG_SGI_IOC4 is not set
> > # CONFIG_TIFM_CORE is not set
> > # CONFIG_ICS932S401 is not set
> > # CONFIG_ENCLOSURE_SERVICES is not set
> > # CONFIG_HP_ILO is not set
> > CONFIG_APDS9802ALS=3Dm
> > CONFIG_ISL29003=3Dm
> > CONFIG_ISL29020=3Dm
> > CONFIG_SENSORS_TSL2550=3Dm
> > CONFIG_SENSORS_BH1770=3Dm
> > CONFIG_SENSORS_APDS990X=3Dy
> > # CONFIG_HMC6352 is not set
> > # CONFIG_DS1682 is not set
> > # CONFIG_PCH_PHUB is not set
> > # CONFIG_USB_SWITCH_FSA9480 is not set
> > CONFIG_SRAM=3Dy
> > CONFIG_PANEL=3Dm
> > CONFIG_PANEL_PARPORT=3D0
> > CONFIG_PANEL_PROFILE=3D5
> > CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> > CONFIG_PANEL_BOOT_MESSAGE=3D""
> > CONFIG_C2PORT=3Dm
> > # CONFIG_C2PORT_DURAMAR_2150 is not set
> > =

> > #
> > # EEPROM support
> > #
> > CONFIG_EEPROM_AT24=3Dy
> > # CONFIG_EEPROM_LEGACY is not set
> > CONFIG_EEPROM_MAX6875=3Dm
> > # CONFIG_EEPROM_93CX6 is not set
> > # CONFIG_EEPROM_IDT_89HPESX is not set
> > # CONFIG_CB710_CORE is not set
> > =

> > #
> > # Texas Instruments shared transport line discipline
> > #
> > # CONFIG_TI_ST is not set
> > # CONFIG_SENSORS_LIS3_I2C is not set
> > =

> > #
> > # Altera FPGA firmware download module
> > #
> > # CONFIG_ALTERA_STAPL is not set
> > # CONFIG_INTEL_MEI is not set
> > # CONFIG_INTEL_MEI_ME is not set
> > # CONFIG_INTEL_MEI_TXE is not set
> > # CONFIG_VMWARE_VMCI is not set
> > =

> > #
> > # Intel MIC Bus Driver
> > #
> > =

> > #
> > # SCIF Bus Driver
> > #
> > =

> > #
> > # VOP Bus Driver
> > #
> > =

> > #
> > # Intel MIC Host Driver
> > #
> > =

> > #
> > # Intel MIC Card Driver
> > #
> > =

> > #
> > # SCIF Driver
> > #
> > =

> > #
> > # Intel MIC Coprocessor State Management (COSM) Drivers
> > #
> > =

> > #
> > # VOP Driver
> > #
> > CONFIG_ECHO=3Dm
> > # CONFIG_CXL_BASE is not set
> > # CONFIG_CXL_AFU_DRIVER_OPS is not set
> > CONFIG_HAVE_IDE=3Dy
> > # CONFIG_IDE is not set
> > =

> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=3Dy
> > CONFIG_RAID_ATTRS=3Dy
> > CONFIG_SCSI=3Dy
> > CONFIG_SCSI_DMA=3Dy
> > CONFIG_SCSI_NETLINK=3Dy
> > # CONFIG_SCSI_MQ_DEFAULT is not set
> > CONFIG_SCSI_PROC_FS=3Dy
> > =

> > #
> > # SCSI support type (disk, tape, CD-ROM)
> > #
> > CONFIG_BLK_DEV_SD=3Dy
> > # CONFIG_CHR_DEV_ST is not set
> > CONFIG_CHR_DEV_OSST=3Dy
> > # CONFIG_BLK_DEV_SR is not set
> > CONFIG_CHR_DEV_SG=3Dy
> > CONFIG_CHR_DEV_SCH=3Dm
> > # CONFIG_SCSI_CONSTANTS is not set
> > # CONFIG_SCSI_LOGGING is not set
> > # CONFIG_SCSI_SCAN_ASYNC is not set
> > =

> > #
> > # SCSI Transports
> > #
> > CONFIG_SCSI_SPI_ATTRS=3Dy
> > CONFIG_SCSI_FC_ATTRS=3Dy
> > # CONFIG_SCSI_ISCSI_ATTRS is not set
> > CONFIG_SCSI_SAS_ATTRS=3Dy
> > CONFIG_SCSI_SAS_LIBSAS=3Dm
> > CONFIG_SCSI_SAS_ATA=3Dy
> > CONFIG_SCSI_SAS_HOST_SMP=3Dy
> > # CONFIG_SCSI_SRP_ATTRS is not set
> > CONFIG_SCSI_LOWLEVEL=3Dy
> > # CONFIG_ISCSI_TCP is not set
> > CONFIG_ISCSI_BOOT_SYSFS=3Dm
> > # CONFIG_SCSI_CXGB3_ISCSI is not set
> > # CONFIG_SCSI_CXGB4_ISCSI is not set
> > # CONFIG_SCSI_BNX2_ISCSI is not set
> > # CONFIG_SCSI_BNX2X_FCOE is not set
> > # CONFIG_BE2ISCSI is not set
> > # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> > # CONFIG_SCSI_HPSA is not set
> > # CONFIG_SCSI_3W_9XXX is not set
> > # CONFIG_SCSI_3W_SAS is not set
> > # CONFIG_SCSI_ACARD is not set
> > CONFIG_SCSI_AHA152X=3Dy
> > # CONFIG_SCSI_AHA1542 is not set
> > # CONFIG_SCSI_AACRAID is not set
> > # CONFIG_SCSI_AIC7XXX is not set
> > # CONFIG_SCSI_AIC79XX is not set
> > # CONFIG_SCSI_AIC94XX is not set
> > # CONFIG_SCSI_MVSAS is not set
> > # CONFIG_SCSI_MVUMI is not set
> > # CONFIG_SCSI_DPT_I2O is not set
> > CONFIG_SCSI_ADVANSYS=3Dy
> > # CONFIG_SCSI_ARCMSR is not set
> > # CONFIG_SCSI_ESAS2R is not set
> > # CONFIG_MEGARAID_NEWGEN is not set
> > # CONFIG_MEGARAID_LEGACY is not set
> > # CONFIG_MEGARAID_SAS is not set
> > # CONFIG_SCSI_MPT3SAS is not set
> > # CONFIG_SCSI_MPT2SAS is not set
> > # CONFIG_SCSI_SMARTPQI is not set
> > CONFIG_SCSI_UFSHCD=3Dy
> > # CONFIG_SCSI_UFSHCD_PCI is not set
> > CONFIG_SCSI_UFSHCD_PLATFORM=3Dm
> > CONFIG_SCSI_UFS_DWC_TC_PLATFORM=3Dm
> > # CONFIG_SCSI_HPTIOP is not set
> > CONFIG_SCSI_BUSLOGIC=3Dm
> > # CONFIG_SCSI_FLASHPOINT is not set
> > # CONFIG_VMWARE_PVSCSI is not set
> > CONFIG_LIBFC=3Dm
> > CONFIG_LIBFCOE=3Dm
> > # CONFIG_FCOE is not set
> > # CONFIG_FCOE_FNIC is not set
> > # CONFIG_SCSI_SNIC is not set
> > # CONFIG_SCSI_DMX3191D is not set
> > CONFIG_SCSI_EATA=3Dm
> > CONFIG_SCSI_EATA_TAGGED_QUEUE=3Dy
> > # CONFIG_SCSI_EATA_LINKED_COMMANDS is not set
> > CONFIG_SCSI_EATA_MAX_TAGS=3D16
> > CONFIG_SCSI_FUTURE_DOMAIN=3Dm
> > CONFIG_SCSI_GDTH=3Dm
> > # CONFIG_SCSI_ISCI is not set
> > CONFIG_SCSI_GENERIC_NCR5380=3Dy
> > # CONFIG_SCSI_IPS is not set
> > # CONFIG_SCSI_INITIO is not set
> > # CONFIG_SCSI_INIA100 is not set
> > # CONFIG_SCSI_NCR53C406A is not set
> > # CONFIG_SCSI_STEX is not set
> > # CONFIG_SCSI_SYM53C8XX_2 is not set
> > # CONFIG_SCSI_IPR is not set
> > CONFIG_SCSI_QLOGIC_FAS=3Dm
> > # CONFIG_SCSI_QLOGIC_1280 is not set
> > # CONFIG_SCSI_QLA_FC is not set
> > # CONFIG_SCSI_QLA_ISCSI is not set
> > # CONFIG_SCSI_LPFC is not set
> > CONFIG_SCSI_SYM53C416=3Dy
> > # CONFIG_SCSI_DC395x is not set
> > # CONFIG_SCSI_AM53C974 is not set
> > # CONFIG_SCSI_NSP32 is not set
> > # CONFIG_SCSI_WD719X is not set
> > CONFIG_SCSI_DEBUG=3Dy
> > # CONFIG_SCSI_PMCRAID is not set
> > # CONFIG_SCSI_PM8001 is not set
> > # CONFIG_SCSI_BFA_FC is not set
> > CONFIG_SCSI_VIRTIO=3Dm
> > # CONFIG_SCSI_CHELSIO_FCOE is not set
> > # CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
> > CONFIG_SCSI_DH=3Dy
> > # CONFIG_SCSI_DH_RDAC is not set
> > # CONFIG_SCSI_DH_HP_SW is not set
> > CONFIG_SCSI_DH_EMC=3Dm
> > # CONFIG_SCSI_DH_ALUA is not set
> > # CONFIG_SCSI_OSD_INITIATOR is not set
> > CONFIG_ATA=3Dm
> > # CONFIG_ATA_NONSTANDARD is not set
> > # CONFIG_ATA_VERBOSE_ERROR is not set
> > CONFIG_ATA_ACPI=3Dy
> > # CONFIG_SATA_ZPODD is not set
> > # CONFIG_SATA_PMP is not set
> > =

> > #
> > # Controllers with non-SFF native interface
> > #
> > # CONFIG_SATA_AHCI is not set
> > # CONFIG_SATA_AHCI_PLATFORM is not set
> > # CONFIG_SATA_INIC162X is not set
> > # CONFIG_SATA_ACARD_AHCI is not set
> > # CONFIG_SATA_SIL24 is not set
> > # CONFIG_ATA_SFF is not set
> > CONFIG_MD=3Dy
> > CONFIG_BLK_DEV_MD=3Dy
> > # CONFIG_MD_AUTODETECT is not set
> > # CONFIG_MD_LINEAR is not set
> > # CONFIG_MD_RAID0 is not set
> > CONFIG_MD_RAID1=3Dy
> > CONFIG_MD_RAID10=3Dy
> > CONFIG_MD_RAID456=3Dy
> > CONFIG_MD_MULTIPATH=3Dy
> > CONFIG_MD_FAULTY=3Dm
> > # CONFIG_MD_CLUSTER is not set
> > # CONFIG_BCACHE is not set
> > CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> > CONFIG_BLK_DEV_DM=3Dy
> > # CONFIG_DM_MQ_DEFAULT is not set
> > # CONFIG_DM_DEBUG is not set
> > CONFIG_DM_BUFIO=3Dy
> > # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
> > CONFIG_DM_BIO_PRISON=3Dm
> > CONFIG_DM_PERSISTENT_DATA=3Dm
> > CONFIG_DM_CRYPT=3Dy
> > CONFIG_DM_SNAPSHOT=3Dy
> > # CONFIG_DM_THIN_PROVISIONING is not set
> > # CONFIG_DM_CACHE is not set
> > CONFIG_DM_ERA=3Dm
> > CONFIG_DM_MIRROR=3Dy
> > CONFIG_DM_LOG_USERSPACE=3Dy
> > CONFIG_DM_RAID=3Dy
> > CONFIG_DM_ZERO=3Dm
> > CONFIG_DM_MULTIPATH=3Dm
> > CONFIG_DM_MULTIPATH_QL=3Dm
> > CONFIG_DM_MULTIPATH_ST=3Dm
> > CONFIG_DM_DELAY=3Dm
> > CONFIG_DM_UEVENT=3Dy
> > CONFIG_DM_FLAKEY=3Dm
> > CONFIG_DM_VERITY=3Dm
> > # CONFIG_DM_VERITY_FEC is not set
> > CONFIG_DM_SWITCH=3Dy
> > # CONFIG_DM_LOG_WRITES is not set
> > CONFIG_TARGET_CORE=3Dm
> > CONFIG_TCM_IBLOCK=3Dm
> > # CONFIG_TCM_FILEIO is not set
> > CONFIG_TCM_PSCSI=3Dm
> > CONFIG_TCM_USER2=3Dm
> > CONFIG_LOOPBACK_TARGET=3Dm
> > CONFIG_TCM_FC=3Dm
> > # CONFIG_ISCSI_TARGET is not set
> > # CONFIG_FUSION is not set
> > =

> > #
> > # IEEE 1394 (FireWire) support
> > #
> > # CONFIG_FIREWIRE is not set
> > # CONFIG_FIREWIRE_NOSY is not set
> > CONFIG_MACINTOSH_DRIVERS=3Dy
> > # CONFIG_MAC_EMUMOUSEBTN is not set
> > # CONFIG_NETDEVICES is not set
> > CONFIG_NVM=3Dy
> > # CONFIG_NVM_DEBUG is not set
> > # CONFIG_NVM_RRPC is not set
> > =

> > #
> > # Input device support
> > #
> > CONFIG_INPUT=3Dy
> > CONFIG_INPUT_LEDS=3Dm
> > # CONFIG_INPUT_FF_MEMLESS is not set
> > # CONFIG_INPUT_POLLDEV is not set
> > # CONFIG_INPUT_SPARSEKMAP is not set
> > # CONFIG_INPUT_MATRIXKMAP is not set
> > =

> > #
> > # Userland interfaces
> > #
> > CONFIG_INPUT_MOUSEDEV=3Dy
> > CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> > CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> > CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> > # CONFIG_INPUT_JOYDEV is not set
> > # CONFIG_INPUT_EVDEV is not set
> > # CONFIG_INPUT_EVBUG is not set
> > =

> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=3Dy
> > # CONFIG_KEYBOARD_ADC is not set
> > # CONFIG_KEYBOARD_ADP5520 is not set
> > # CONFIG_KEYBOARD_ADP5588 is not set
> > # CONFIG_KEYBOARD_ADP5589 is not set
> > CONFIG_KEYBOARD_ATKBD=3Dy
> > # CONFIG_KEYBOARD_QT1070 is not set
> > # CONFIG_KEYBOARD_QT2160 is not set
> > # CONFIG_KEYBOARD_LKKBD is not set
> > # CONFIG_KEYBOARD_GPIO is not set
> > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > # CONFIG_KEYBOARD_TCA6416 is not set
> > # CONFIG_KEYBOARD_TCA8418 is not set
> > # CONFIG_KEYBOARD_MATRIX is not set
> > # CONFIG_KEYBOARD_LM8323 is not set
> > # CONFIG_KEYBOARD_LM8333 is not set
> > # CONFIG_KEYBOARD_MAX7359 is not set
> > # CONFIG_KEYBOARD_MCS is not set
> > # CONFIG_KEYBOARD_MPR121 is not set
> > # CONFIG_KEYBOARD_NEWTON is not set
> > # CONFIG_KEYBOARD_OPENCORES is not set
> > # CONFIG_KEYBOARD_SAMSUNG is not set
> > # CONFIG_KEYBOARD_STOWAWAY is not set
> > # CONFIG_KEYBOARD_SUNKBD is not set
> > # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > # CONFIG_KEYBOARD_CROS_EC is not set
> > CONFIG_INPUT_MOUSE=3Dy
> > CONFIG_MOUSE_PS2=3Dy
> > CONFIG_MOUSE_PS2_ALPS=3Dy
> > CONFIG_MOUSE_PS2_BYD=3Dy
> > CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> > CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> > CONFIG_MOUSE_PS2_CYPRESS=3Dy
> > CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> > CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> > # CONFIG_MOUSE_PS2_ELANTECH is not set
> > # CONFIG_MOUSE_PS2_SENTELIC is not set
> > # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> > CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> > # CONFIG_MOUSE_PS2_VMMOUSE is not set
> > # CONFIG_MOUSE_SERIAL is not set
> > # CONFIG_MOUSE_APPLETOUCH is not set
> > # CONFIG_MOUSE_BCM5974 is not set
> > # CONFIG_MOUSE_CYAPA is not set
> > # CONFIG_MOUSE_ELAN_I2C is not set
> > # CONFIG_MOUSE_INPORT is not set
> > # CONFIG_MOUSE_LOGIBM is not set
> > # CONFIG_MOUSE_PC110PAD is not set
> > # CONFIG_MOUSE_VSXXXAA is not set
> > # CONFIG_MOUSE_GPIO is not set
> > # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> > # CONFIG_MOUSE_SYNAPTICS_USB is not set
> > # CONFIG_INPUT_JOYSTICK is not set
> > # CONFIG_INPUT_TABLET is not set
> > # CONFIG_INPUT_TOUCHSCREEN is not set
> > # CONFIG_INPUT_MISC is not set
> > # CONFIG_RMI4_CORE is not set
> > =

> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> > CONFIG_SERIO_I8042=3Dy
> > CONFIG_SERIO_SERPORT=3Dy
> > CONFIG_SERIO_CT82C710=3Dy
> > # CONFIG_SERIO_PARKBD is not set
> > # CONFIG_SERIO_PCIPS2 is not set
> > CONFIG_SERIO_LIBPS2=3Dy
> > CONFIG_SERIO_RAW=3Dy
> > CONFIG_SERIO_ALTERA_PS2=3Dm
> > CONFIG_SERIO_PS2MULT=3Dm
> > # CONFIG_SERIO_ARC_PS2 is not set
> > CONFIG_USERIO=3Dy
> > CONFIG_GAMEPORT=3Dy
> > CONFIG_GAMEPORT_NS558=3Dm
> > # CONFIG_GAMEPORT_L4 is not set
> > # CONFIG_GAMEPORT_EMU10K1 is not set
> > # CONFIG_GAMEPORT_FM801 is not set
> > =

> > #
> > # Character devices
> > #
> > CONFIG_TTY=3Dy
> > # CONFIG_VT is not set
> > CONFIG_UNIX98_PTYS=3Dy
> > CONFIG_LEGACY_PTYS=3Dy
> > CONFIG_LEGACY_PTY_COUNT=3D256
> > # CONFIG_SERIAL_NONSTANDARD is not set
> > # CONFIG_NOZOMI is not set
> > # CONFIG_N_GSM is not set
> > # CONFIG_TRACE_SINK is not set
> > CONFIG_DEVMEM=3Dy
> > # CONFIG_DEVKMEM is not set
> > =

> > #
> > # Serial drivers
> > #
> > CONFIG_SERIAL_EARLYCON=3Dy
> > CONFIG_SERIAL_8250=3Dy
> > CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> > CONFIG_SERIAL_8250_PNP=3Dy
> > # CONFIG_SERIAL_8250_FINTEK is not set
> > CONFIG_SERIAL_8250_CONSOLE=3Dy
> > CONFIG_SERIAL_8250_DMA=3Dy
> > CONFIG_SERIAL_8250_PCI=3Dy
> > CONFIG_SERIAL_8250_EXAR=3Dy
> > # CONFIG_SERIAL_8250_CS is not set
> > CONFIG_SERIAL_8250_NR_UARTS=3D4
> > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > # CONFIG_SERIAL_8250_EXTENDED is not set
> > # CONFIG_SERIAL_8250_FSL is not set
> > # CONFIG_SERIAL_8250_DW is not set
> > # CONFIG_SERIAL_8250_RT288X is not set
> > CONFIG_SERIAL_8250_LPSS=3Dy
> > CONFIG_SERIAL_8250_MID=3Dy
> > # CONFIG_SERIAL_8250_MOXA is not set
> > =

> > #
> > # Non-8250 serial port support
> > #
> > # CONFIG_SERIAL_UARTLITE is not set
> > CONFIG_SERIAL_CORE=3Dy
> > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > # CONFIG_SERIAL_JSM is not set
> > # CONFIG_SERIAL_SCCNXP is not set
> > # CONFIG_SERIAL_SC16IS7XX is not set
> > # CONFIG_SERIAL_TIMBERDALE is not set
> > # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> > # CONFIG_SERIAL_ALTERA_UART is not set
> > # CONFIG_SERIAL_PCH_UART is not set
> > # CONFIG_SERIAL_ARC is not set
> > # CONFIG_SERIAL_RP2 is not set
> > # CONFIG_SERIAL_FSL_LPUART is not set
> > # CONFIG_SERIAL_DEV_BUS is not set
> > # CONFIG_TTY_PRINTK is not set
> > # CONFIG_PRINTER is not set
> > # CONFIG_PPDEV is not set
> > # CONFIG_VIRTIO_CONSOLE is not set
> > # CONFIG_IPMI_HANDLER is not set
> > CONFIG_HW_RANDOM=3Dm
> > CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> > CONFIG_HW_RANDOM_INTEL=3Dm
> > CONFIG_HW_RANDOM_AMD=3Dm
> > CONFIG_HW_RANDOM_GEODE=3Dm
> > CONFIG_HW_RANDOM_VIA=3Dm
> > CONFIG_HW_RANDOM_VIRTIO=3Dm
> > # CONFIG_HW_RANDOM_TPM is not set
> > CONFIG_NVRAM=3Dy
> > CONFIG_DTLK=3Dy
> > # CONFIG_R3964 is not set
> > # CONFIG_APPLICOM is not set
> > # CONFIG_SONYPI is not set
> > =

> > #
> > # PCMCIA character devices
> > #
> > # CONFIG_SYNCLINK_CS is not set
> > # CONFIG_CARDMAN_4000 is not set
> > # CONFIG_CARDMAN_4040 is not set
> > CONFIG_SCR24X=3Dm
> > # CONFIG_MWAVE is not set
> > CONFIG_PC8736x_GPIO=3Dm
> > CONFIG_NSC_GPIO=3Dm
> > CONFIG_RAW_DRIVER=3Dy
> > CONFIG_MAX_RAW_DEVS=3D256
> > # CONFIG_HPET is not set
> > # CONFIG_HANGCHECK_TIMER is not set
> > CONFIG_TCG_TPM=3Dm
> > # CONFIG_TCG_TIS is not set
> > CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> > CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> > # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> > CONFIG_TCG_NSC=3Dm
> > # CONFIG_TCG_ATMEL is not set
> > CONFIG_TCG_INFINEON=3Dm
> > # CONFIG_TCG_CRB is not set
> > # CONFIG_TCG_VTPM_PROXY is not set
> > CONFIG_TCG_TIS_ST33ZP24=3Dm
> > CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> > CONFIG_TELCLOCK=3Dy
> > CONFIG_DEVPORT=3Dy
> > # CONFIG_XILLYBUS is not set
> > =

> > #
> > # I2C support
> > #
> > CONFIG_I2C=3Dy
> > CONFIG_ACPI_I2C_OPREGION=3Dy
> > CONFIG_I2C_BOARDINFO=3Dy
> > # CONFIG_I2C_COMPAT is not set
> > # CONFIG_I2C_CHARDEV is not set
> > CONFIG_I2C_MUX=3Dy
> > =

> > #
> > # Multiplexer I2C Chip support
> > #
> > CONFIG_I2C_MUX_GPIO=3Dy
> > CONFIG_I2C_MUX_PCA9541=3Dm
> > # CONFIG_I2C_MUX_PCA954x is not set
> > CONFIG_I2C_MUX_REG=3Dm
> > CONFIG_I2C_MUX_MLXCPLD=3Dm
> > # CONFIG_I2C_HELPER_AUTO is not set
> > CONFIG_I2C_SMBUS=3Dm
> > =

> > #
> > # I2C Algorithms
> > #
> > CONFIG_I2C_ALGOBIT=3Dy
> > CONFIG_I2C_ALGOPCF=3Dm
> > CONFIG_I2C_ALGOPCA=3Dm
> > =

> > #
> > # I2C Hardware Bus support
> > #
> > =

> > #
> > # PC SMBus host controller drivers
> > #
> > # CONFIG_I2C_ALI1535 is not set
> > # CONFIG_I2C_ALI1563 is not set
> > # CONFIG_I2C_ALI15X3 is not set
> > # CONFIG_I2C_AMD756 is not set
> > # CONFIG_I2C_AMD8111 is not set
> > # CONFIG_I2C_I801 is not set
> > # CONFIG_I2C_ISCH is not set
> > # CONFIG_I2C_ISMT is not set
> > # CONFIG_I2C_PIIX4 is not set
> > # CONFIG_I2C_NFORCE2 is not set
> > # CONFIG_I2C_SIS5595 is not set
> > # CONFIG_I2C_SIS630 is not set
> > # CONFIG_I2C_SIS96X is not set
> > # CONFIG_I2C_VIA is not set
> > # CONFIG_I2C_VIAPRO is not set
> > =

> > #
> > # ACPI drivers
> > #
> > # CONFIG_I2C_SCMI is not set
> > =

> > #
> > # I2C system bus drivers (mostly embedded / system-on-chip)
> > #
> > CONFIG_I2C_CBUS_GPIO=3Dm
> > # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> > # CONFIG_I2C_DESIGNWARE_PCI is not set
> > # CONFIG_I2C_EG20T is not set
> > # CONFIG_I2C_EMEV2 is not set
> > CONFIG_I2C_GPIO=3Dm
> > # CONFIG_I2C_KEMPLD is not set
> > CONFIG_I2C_OCORES=3Dm
> > CONFIG_I2C_PCA_PLATFORM=3Dm
> > # CONFIG_I2C_PXA_PCI is not set
> > CONFIG_I2C_SIMTEC=3Dm
> > CONFIG_I2C_XILINX=3Dy
> > =

> > #
> > # External I2C/SMBus adapter drivers
> > #
> > # CONFIG_I2C_DIOLAN_U2C is not set
> > CONFIG_I2C_DLN2=3Dy
> > CONFIG_I2C_PARPORT=3Dm
> > # CONFIG_I2C_PARPORT_LIGHT is not set
> > CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> > # CONFIG_I2C_TAOS_EVM is not set
> > CONFIG_I2C_TINY_USB=3Dm
> > =

> > #
> > # Other I2C/SMBus bus drivers
> > #
> > # CONFIG_I2C_ELEKTOR is not set
> > # CONFIG_I2C_PCA_ISA is not set
> > # CONFIG_I2C_CROS_EC_TUNNEL is not set
> > # CONFIG_SCx200_ACB is not set
> > CONFIG_I2C_STUB=3Dm
> > CONFIG_I2C_SLAVE=3Dy
> > CONFIG_I2C_SLAVE_EEPROM=3Dy
> > # CONFIG_I2C_DEBUG_CORE is not set
> > # CONFIG_I2C_DEBUG_ALGO is not set
> > # CONFIG_I2C_DEBUG_BUS is not set
> > # CONFIG_SPI is not set
> > CONFIG_SPMI=3Dy
> > # CONFIG_HSI is not set
> > =

> > #
> > # PPS support
> > #
> > CONFIG_PPS=3Dy
> > # CONFIG_PPS_DEBUG is not set
> > CONFIG_NTP_PPS=3Dy
> > =

> > #
> > # PPS clients support
> > #
> > # CONFIG_PPS_CLIENT_KTIMER is not set
> > # CONFIG_PPS_CLIENT_LDISC is not set
> > CONFIG_PPS_CLIENT_PARPORT=3Dm
> > # CONFIG_PPS_CLIENT_GPIO is not set
> > =

> > #
> > # PPS generators support
> > #
> > =

> > #
> > # PTP clock support
> > #
> > =

> > #
> > # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional cloc=
ks.
> > #
> > # CONFIG_PTP_1588_CLOCK_PCH is not set
> > CONFIG_GPIOLIB=3Dy
> > CONFIG_GPIO_ACPI=3Dy
> > CONFIG_GPIOLIB_IRQCHIP=3Dy
> > CONFIG_DEBUG_GPIO=3Dy
> > CONFIG_GPIO_SYSFS=3Dy
> > CONFIG_GPIO_GENERIC=3Dy
> > CONFIG_GPIO_MAX730X=3Dy
> > =

> > #
> > # Memory mapped GPIO drivers
> > #
> > # CONFIG_GPIO_AMDPT is not set
> > # CONFIG_GPIO_AXP209 is not set
> > CONFIG_GPIO_DWAPB=3Dm
> > # CONFIG_GPIO_EXAR is not set
> > CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> > # CONFIG_GPIO_ICH is not set
> > # CONFIG_GPIO_LYNXPOINT is not set
> > # CONFIG_GPIO_MOCKUP is not set
> > # CONFIG_GPIO_VX855 is not set
> > =

> > #
> > # Port-mapped I/O GPIO drivers
> > #
> > CONFIG_GPIO_104_DIO_48E=3Dm
> > CONFIG_GPIO_104_IDIO_16=3Dm
> > CONFIG_GPIO_104_IDI_48=3Dy
> > # CONFIG_GPIO_F7188X is not set
> > CONFIG_GPIO_GPIO_MM=3Dm
> > CONFIG_GPIO_IT87=3Dm
> > # CONFIG_GPIO_SCH is not set
> > # CONFIG_GPIO_SCH311X is not set
> > CONFIG_GPIO_WS16C48=3Dm
> > =

> > #
> > # I2C GPIO expanders
> > #
> > CONFIG_GPIO_ADP5588=3Dy
> > # CONFIG_GPIO_ADP5588_IRQ is not set
> > CONFIG_GPIO_MAX7300=3Dy
> > CONFIG_GPIO_MAX732X=3Dy
> > CONFIG_GPIO_MAX732X_IRQ=3Dy
> > CONFIG_GPIO_PCA953X=3Dy
> > CONFIG_GPIO_PCA953X_IRQ=3Dy
> > CONFIG_GPIO_PCF857X=3Dm
> > CONFIG_GPIO_TPIC2810=3Dm
> > =

> > #
> > # MFD GPIO expanders
> > #
> > # CONFIG_GPIO_ADP5520 is not set
> > CONFIG_GPIO_DA9055=3Dy
> > # CONFIG_GPIO_DLN2 is not set
> > CONFIG_GPIO_KEMPLD=3Dy
> > CONFIG_GPIO_LP3943=3Dm
> > CONFIG_GPIO_LP873X=3Dm
> > CONFIG_GPIO_PALMAS=3Dy
> > # CONFIG_GPIO_RC5T583 is not set
> > CONFIG_GPIO_TPS6586X=3Dy
> > # CONFIG_GPIO_TPS65910 is not set
> > # CONFIG_GPIO_TWL6040 is not set
> > # CONFIG_GPIO_UCB1400 is not set
> > CONFIG_GPIO_WM8994=3Dm
> > =

> > #
> > # PCI GPIO expanders
> > #
> > # CONFIG_GPIO_AMD8111 is not set
> > # CONFIG_GPIO_BT8XX is not set
> > # CONFIG_GPIO_ML_IOH is not set
> > # CONFIG_GPIO_PCH is not set
> > # CONFIG_GPIO_PCI_IDIO_16 is not set
> > # CONFIG_GPIO_RDC321X is not set
> > =

> > #
> > # SPI or I2C GPIO expanders
> > #
> > =

> > #
> > # USB GPIO expanders
> > #
> > CONFIG_W1=3Dy
> > CONFIG_W1_CON=3Dy
> > =

> > #
> > # 1-wire Bus Masters
> > #
> > # CONFIG_W1_MASTER_MATROX is not set
> > # CONFIG_W1_MASTER_DS2490 is not set
> > # CONFIG_W1_MASTER_DS2482 is not set
> > CONFIG_W1_MASTER_DS1WM=3Dy
> > CONFIG_W1_MASTER_GPIO=3Dy
> > =

> > #
> > # 1-wire Slaves
> > #
> > # CONFIG_W1_SLAVE_THERM is not set
> > CONFIG_W1_SLAVE_SMEM=3Dy
> > # CONFIG_W1_SLAVE_DS2405 is not set
> > CONFIG_W1_SLAVE_DS2408=3Dy
> > # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> > CONFIG_W1_SLAVE_DS2413=3Dm
> > # CONFIG_W1_SLAVE_DS2406 is not set
> > # CONFIG_W1_SLAVE_DS2423 is not set
> > # CONFIG_W1_SLAVE_DS2431 is not set
> > # CONFIG_W1_SLAVE_DS2433 is not set
> > CONFIG_W1_SLAVE_DS2760=3Dy
> > # CONFIG_W1_SLAVE_DS2780 is not set
> > CONFIG_W1_SLAVE_DS2781=3Dy
> > CONFIG_W1_SLAVE_DS28E04=3Dy
> > CONFIG_W1_SLAVE_BQ27000=3Dy
> > # CONFIG_POWER_AVS is not set
> > # CONFIG_POWER_RESET is not set
> > CONFIG_POWER_SUPPLY=3Dy
> > # CONFIG_POWER_SUPPLY_DEBUG is not set
> > # CONFIG_PDA_POWER is not set
> > # CONFIG_GENERIC_ADC_BATTERY is not set
> > # CONFIG_TEST_POWER is not set
> > # CONFIG_BATTERY_DS2760 is not set
> > # CONFIG_BATTERY_DS2780 is not set
> > # CONFIG_BATTERY_DS2781 is not set
> > # CONFIG_BATTERY_DS2782 is not set
> > # CONFIG_BATTERY_SBS is not set
> > # CONFIG_CHARGER_SBS is not set
> > # CONFIG_BATTERY_BQ27XXX is not set
> > # CONFIG_AXP288_FUEL_GAUGE is not set
> > # CONFIG_BATTERY_MAX17040 is not set
> > # CONFIG_BATTERY_MAX17042 is not set
> > # CONFIG_CHARGER_PCF50633 is not set
> > # CONFIG_CHARGER_ISP1704 is not set
> > # CONFIG_CHARGER_MAX8903 is not set
> > # CONFIG_CHARGER_LP8727 is not set
> > # CONFIG_CHARGER_LP8788 is not set
> > # CONFIG_CHARGER_GPIO is not set
> > # CONFIG_CHARGER_MAX77693 is not set
> > # CONFIG_CHARGER_BQ2415X is not set
> > # CONFIG_CHARGER_BQ24190 is not set
> > # CONFIG_CHARGER_BQ24257 is not set
> > # CONFIG_CHARGER_BQ24735 is not set
> > # CONFIG_CHARGER_BQ25890 is not set
> > # CONFIG_CHARGER_SMB347 is not set
> > # CONFIG_CHARGER_TPS65090 is not set
> > # CONFIG_CHARGER_TPS65217 is not set
> > # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> > # CONFIG_BATTERY_RT5033 is not set
> > # CONFIG_CHARGER_RT9455 is not set
> > # CONFIG_AXP20X_POWER is not set
> > CONFIG_HWMON=3Dm
> > CONFIG_HWMON_VID=3Dm
> > # CONFIG_HWMON_DEBUG_CHIP is not set
> > =

> > #
> > # Native drivers
> > #
> > # CONFIG_SENSORS_ABITUGURU is not set
> > # CONFIG_SENSORS_ABITUGURU3 is not set
> > # CONFIG_SENSORS_AD7414 is not set
> > # CONFIG_SENSORS_AD7418 is not set
> > # CONFIG_SENSORS_ADM1021 is not set
> > # CONFIG_SENSORS_ADM1025 is not set
> > CONFIG_SENSORS_ADM1026=3Dm
> > CONFIG_SENSORS_ADM1029=3Dm
> > CONFIG_SENSORS_ADM1031=3Dm
> > CONFIG_SENSORS_ADM9240=3Dm
> > # CONFIG_SENSORS_ADT7410 is not set
> > CONFIG_SENSORS_ADT7411=3Dm
> > # CONFIG_SENSORS_ADT7462 is not set
> > # CONFIG_SENSORS_ADT7470 is not set
> > # CONFIG_SENSORS_ADT7475 is not set
> > CONFIG_SENSORS_ASC7621=3Dm
> > # CONFIG_SENSORS_K8TEMP is not set
> > # CONFIG_SENSORS_K10TEMP is not set
> > # CONFIG_SENSORS_FAM15H_POWER is not set
> > # CONFIG_SENSORS_APPLESMC is not set
> > CONFIG_SENSORS_ASB100=3Dm
> > # CONFIG_SENSORS_ATXP1 is not set
> > CONFIG_SENSORS_DS620=3Dm
> > CONFIG_SENSORS_DS1621=3Dm
> > CONFIG_SENSORS_DELL_SMM=3Dm
> > # CONFIG_SENSORS_DA9055 is not set
> > # CONFIG_SENSORS_I5K_AMB is not set
> > CONFIG_SENSORS_F71805F=3Dm
> > # CONFIG_SENSORS_F71882FG is not set
> > CONFIG_SENSORS_F75375S=3Dm
> > # CONFIG_SENSORS_FSCHMD is not set
> > CONFIG_SENSORS_FTSTEUTATES=3Dm
> > CONFIG_SENSORS_GL518SM=3Dm
> > # CONFIG_SENSORS_GL520SM is not set
> > # CONFIG_SENSORS_G760A is not set
> > # CONFIG_SENSORS_G762 is not set
> > CONFIG_SENSORS_GPIO_FAN=3Dm
> > # CONFIG_SENSORS_HIH6130 is not set
> > CONFIG_SENSORS_IIO_HWMON=3Dm
> > # CONFIG_SENSORS_I5500 is not set
> > CONFIG_SENSORS_CORETEMP=3Dm
> > CONFIG_SENSORS_IT87=3Dm
> > # CONFIG_SENSORS_JC42 is not set
> > # CONFIG_SENSORS_POWR1220 is not set
> > CONFIG_SENSORS_LINEAGE=3Dm
> > CONFIG_SENSORS_LTC2945=3Dm
> > CONFIG_SENSORS_LTC2990=3Dm
> > CONFIG_SENSORS_LTC4151=3Dm
> > CONFIG_SENSORS_LTC4215=3Dm
> > CONFIG_SENSORS_LTC4222=3Dm
> > CONFIG_SENSORS_LTC4245=3Dm
> > CONFIG_SENSORS_LTC4260=3Dm
> > CONFIG_SENSORS_LTC4261=3Dm
> > CONFIG_SENSORS_MAX16065=3Dm
> > CONFIG_SENSORS_MAX1619=3Dm
> > # CONFIG_SENSORS_MAX1668 is not set
> > CONFIG_SENSORS_MAX197=3Dm
> > CONFIG_SENSORS_MAX6639=3Dm
> > CONFIG_SENSORS_MAX6642=3Dm
> > CONFIG_SENSORS_MAX6650=3Dm
> > # CONFIG_SENSORS_MAX6697 is not set
> > CONFIG_SENSORS_MAX31790=3Dm
> > CONFIG_SENSORS_MCP3021=3Dm
> > CONFIG_SENSORS_TC654=3Dm
> > CONFIG_SENSORS_MENF21BMC_HWMON=3Dm
> > # CONFIG_SENSORS_LM63 is not set
> > CONFIG_SENSORS_LM73=3Dm
> > # CONFIG_SENSORS_LM75 is not set
> > CONFIG_SENSORS_LM77=3Dm
> > CONFIG_SENSORS_LM78=3Dm
> > # CONFIG_SENSORS_LM80 is not set
> > CONFIG_SENSORS_LM83=3Dm
> > # CONFIG_SENSORS_LM85 is not set
> > # CONFIG_SENSORS_LM87 is not set
> > CONFIG_SENSORS_LM90=3Dm
> > CONFIG_SENSORS_LM92=3Dm
> > # CONFIG_SENSORS_LM93 is not set
> > CONFIG_SENSORS_LM95234=3Dm
> > CONFIG_SENSORS_LM95241=3Dm
> > # CONFIG_SENSORS_LM95245 is not set
> > CONFIG_SENSORS_PC87360=3Dm
> > # CONFIG_SENSORS_PC87427 is not set
> > CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> > # CONFIG_SENSORS_NCT6683 is not set
> > CONFIG_SENSORS_NCT6775=3Dm
> > CONFIG_SENSORS_NCT7802=3Dm
> > CONFIG_SENSORS_NCT7904=3Dm
> > CONFIG_SENSORS_PCF8591=3Dm
> > CONFIG_PMBUS=3Dm
> > CONFIG_SENSORS_PMBUS=3Dm
> > CONFIG_SENSORS_ADM1275=3Dm
> > CONFIG_SENSORS_LM25066=3Dm
> > CONFIG_SENSORS_LTC2978=3Dm
> > CONFIG_SENSORS_LTC3815=3Dm
> > CONFIG_SENSORS_MAX16064=3Dm
> > CONFIG_SENSORS_MAX20751=3Dm
> > CONFIG_SENSORS_MAX34440=3Dm
> > CONFIG_SENSORS_MAX8688=3Dm
> > CONFIG_SENSORS_TPS40422=3Dm
> > # CONFIG_SENSORS_UCD9000 is not set
> > CONFIG_SENSORS_UCD9200=3Dm
> > CONFIG_SENSORS_ZL6100=3Dm
> > # CONFIG_SENSORS_SHT15 is not set
> > CONFIG_SENSORS_SHT21=3Dm
> > CONFIG_SENSORS_SHT3x=3Dm
> > # CONFIG_SENSORS_SHTC1 is not set
> > # CONFIG_SENSORS_SIS5595 is not set
> > CONFIG_SENSORS_DME1737=3Dm
> > # CONFIG_SENSORS_EMC1403 is not set
> > # CONFIG_SENSORS_EMC2103 is not set
> > CONFIG_SENSORS_EMC6W201=3Dm
> > CONFIG_SENSORS_SMSC47M1=3Dm
> > CONFIG_SENSORS_SMSC47M192=3Dm
> > CONFIG_SENSORS_SMSC47B397=3Dm
> > CONFIG_SENSORS_SCH56XX_COMMON=3Dm
> > CONFIG_SENSORS_SCH5627=3Dm
> > CONFIG_SENSORS_SCH5636=3Dm
> > # CONFIG_SENSORS_STTS751 is not set
> > CONFIG_SENSORS_SMM665=3Dm
> > # CONFIG_SENSORS_ADC128D818 is not set
> > CONFIG_SENSORS_ADS1015=3Dm
> > CONFIG_SENSORS_ADS7828=3Dm
> > # CONFIG_SENSORS_AMC6821 is not set
> > # CONFIG_SENSORS_INA209 is not set
> > # CONFIG_SENSORS_INA2XX is not set
> > CONFIG_SENSORS_INA3221=3Dm
> > # CONFIG_SENSORS_TC74 is not set
> > CONFIG_SENSORS_THMC50=3Dm
> > CONFIG_SENSORS_TMP102=3Dm
> > CONFIG_SENSORS_TMP103=3Dm
> > CONFIG_SENSORS_TMP108=3Dm
> > CONFIG_SENSORS_TMP401=3Dm
> > CONFIG_SENSORS_TMP421=3Dm
> > CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> > # CONFIG_SENSORS_VIA686A is not set
> > CONFIG_SENSORS_VT1211=3Dm
> > # CONFIG_SENSORS_VT8231 is not set
> > CONFIG_SENSORS_W83781D=3Dm
> > CONFIG_SENSORS_W83791D=3Dm
> > # CONFIG_SENSORS_W83792D is not set
> > # CONFIG_SENSORS_W83793 is not set
> > CONFIG_SENSORS_W83795=3Dm
> > # CONFIG_SENSORS_W83795_FANCTRL is not set
> > # CONFIG_SENSORS_W83L785TS is not set
> > CONFIG_SENSORS_W83L786NG=3Dm
> > # CONFIG_SENSORS_W83627HF is not set
> > # CONFIG_SENSORS_W83627EHF is not set
> > =

> > #
> > # ACPI drivers
> > #
> > # CONFIG_SENSORS_ACPI_POWER is not set
> > # CONFIG_SENSORS_ATK0110 is not set
> > CONFIG_THERMAL=3Dy
> > CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> > # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> > CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=3Dy
> > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> > CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> > CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> > CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> > CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> > CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> > # CONFIG_THERMAL_EMULATION is not set
> > CONFIG_INTEL_POWERCLAMP=3Dm
> > CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dm
> > CONFIG_INTEL_SOC_DTS_THERMAL=3Dm
> > =

> > #
> > # ACPI INT340X thermal drivers
> > #
> > # CONFIG_INT340X_THERMAL is not set
> > # CONFIG_INTEL_PCH_THERMAL is not set
> > CONFIG_GENERIC_ADC_THERMAL=3Dm
> > CONFIG_WATCHDOG=3Dy
> > CONFIG_WATCHDOG_CORE=3Dy
> > CONFIG_WATCHDOG_NOWAYOUT=3Dy
> > CONFIG_WATCHDOG_SYSFS=3Dy
> > =

> > #
> > # Watchdog Device Drivers
> > #
> > # CONFIG_SOFT_WATCHDOG is not set
> > CONFIG_DA9055_WATCHDOG=3Dm
> > CONFIG_DA9063_WATCHDOG=3Dm
> > CONFIG_DA9062_WATCHDOG=3Dm
> > # CONFIG_MENF21BMC_WATCHDOG is not set
> > # CONFIG_WDAT_WDT is not set
> > CONFIG_XILINX_WATCHDOG=3Dm
> > CONFIG_ZIIRAVE_WATCHDOG=3Dm
> > # CONFIG_CADENCE_WATCHDOG is not set
> > # CONFIG_DW_WATCHDOG is not set
> > CONFIG_MAX63XX_WATCHDOG=3Dy
> > CONFIG_ACQUIRE_WDT=3Dy
> > CONFIG_ADVANTECH_WDT=3Dm
> > # CONFIG_ALIM1535_WDT is not set
> > # CONFIG_ALIM7101_WDT is not set
> > # CONFIG_EBC_C384_WDT is not set
> > # CONFIG_F71808E_WDT is not set
> > # CONFIG_SP5100_TCO is not set
> > CONFIG_SBC_FITPC2_WATCHDOG=3Dm
> > # CONFIG_EUROTECH_WDT is not set
> > CONFIG_IB700_WDT=3Dm
> > # CONFIG_IBMASR is not set
> > CONFIG_WAFER_WDT=3Dm
> > # CONFIG_I6300ESB_WDT is not set
> > # CONFIG_IE6XX_WDT is not set
> > # CONFIG_ITCO_WDT is not set
> > CONFIG_IT8712F_WDT=3Dy
> > CONFIG_IT87_WDT=3Dy
> > # CONFIG_HP_WATCHDOG is not set
> > CONFIG_KEMPLD_WDT=3Dy
> > CONFIG_SC1200_WDT=3Dm
> > CONFIG_PC87413_WDT=3Dy
> > # CONFIG_NV_TCO is not set
> > # CONFIG_60XX_WDT is not set
> > # CONFIG_SBC8360_WDT is not set
> > # CONFIG_SBC7240_WDT is not set
> > CONFIG_CPU5_WDT=3Dy
> > CONFIG_SMSC_SCH311X_WDT=3Dy
> > CONFIG_SMSC37B787_WDT=3Dy
> > # CONFIG_VIA_WDT is not set
> > # CONFIG_W83627HF_WDT is not set
> > CONFIG_W83877F_WDT=3Dm
> > # CONFIG_W83977F_WDT is not set
> > # CONFIG_MACHZ_WDT is not set
> > CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> > # CONFIG_NI903X_WDT is not set
> > # CONFIG_NIC7018_WDT is not set
> > CONFIG_MEN_A21_WDT=3Dm
> > =

> > #
> > # ISA-based Watchdog Cards
> > #
> > # CONFIG_PCWATCHDOG is not set
> > CONFIG_MIXCOMWD=3Dy
> > # CONFIG_WDT is not set
> > =

> > #
> > # PCI-based Watchdog Cards
> > #
> > # CONFIG_PCIPCWATCHDOG is not set
> > # CONFIG_WDTPCI is not set
> > =

> > #
> > # USB-based Watchdog Cards
> > #
> > CONFIG_USBPCWATCHDOG=3Dm
> > =

> > #
> > # Watchdog Pretimeout Governors
> > #
> > CONFIG_WATCHDOG_PRETIMEOUT_GOV=3Dy
> > # CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP is not set
> > CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=3Dy
> > CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=3Dy
> > CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dy
> > CONFIG_SSB_POSSIBLE=3Dy
> > =

> > #
> > # Sonics Silicon Backplane
> > #
> > # CONFIG_SSB is not set
> > CONFIG_BCMA_POSSIBLE=3Dy
> > =

> > #
> > # Broadcom specific AMBA
> > #
> > CONFIG_BCMA=3Dm
> > CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > CONFIG_BCMA_HOST_PCI=3Dy
> > CONFIG_BCMA_HOST_SOC=3Dy
> > CONFIG_BCMA_DRIVER_PCI=3Dy
> > CONFIG_BCMA_SFLASH=3Dy
> > # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> > # CONFIG_BCMA_DRIVER_GPIO is not set
> > CONFIG_BCMA_DEBUG=3Dy
> > =

> > #
> > # Multifunction device drivers
> > #
> > CONFIG_MFD_CORE=3Dy
> > # CONFIG_MFD_CS5535 is not set
> > CONFIG_MFD_AS3711=3Dy
> > CONFIG_PMIC_ADP5520=3Dy
> > # CONFIG_MFD_AAT2870_CORE is not set
> > # CONFIG_MFD_BCM590XX is not set
> > CONFIG_MFD_AXP20X=3Dm
> > CONFIG_MFD_AXP20X_I2C=3Dm
> > CONFIG_MFD_CROS_EC=3Dm
> > CONFIG_MFD_CROS_EC_I2C=3Dm
> > # CONFIG_PMIC_DA903X is not set
> > # CONFIG_MFD_DA9052_I2C is not set
> > CONFIG_MFD_DA9055=3Dy
> > CONFIG_MFD_DA9062=3Dy
> > CONFIG_MFD_DA9063=3Dm
> > # CONFIG_MFD_DA9150 is not set
> > CONFIG_MFD_DLN2=3Dy
> > # CONFIG_MFD_MC13XXX_I2C is not set
> > # CONFIG_HTC_PASIC3 is not set
> > # CONFIG_HTC_I2CPLD is not set
> > # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> > # CONFIG_LPC_ICH is not set
> > # CONFIG_LPC_SCH is not set
> > # CONFIG_INTEL_SOC_PMIC is not set
> > # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> > # CONFIG_MFD_INTEL_LPSS_PCI is not set
> > # CONFIG_MFD_JANZ_CMODIO is not set
> > CONFIG_MFD_KEMPLD=3Dy
> > CONFIG_MFD_88PM800=3Dm
> > CONFIG_MFD_88PM805=3Dy
> > # CONFIG_MFD_88PM860X is not set
> > # CONFIG_MFD_MAX14577 is not set
> > CONFIG_MFD_MAX77693=3Dm
> > CONFIG_MFD_MAX77843=3Dy
> > # CONFIG_MFD_MAX8907 is not set
> > # CONFIG_MFD_MAX8925 is not set
> > # CONFIG_MFD_MAX8997 is not set
> > CONFIG_MFD_MAX8998=3Dy
> > CONFIG_MFD_MT6397=3Dm
> > CONFIG_MFD_MENF21BMC=3Dm
> > # CONFIG_MFD_VIPERBOARD is not set
> > # CONFIG_MFD_RETU is not set
> > CONFIG_MFD_PCF50633=3Dy
> > CONFIG_PCF50633_ADC=3Dm
> > CONFIG_PCF50633_GPIO=3Dy
> > CONFIG_UCB1400_CORE=3Dm
> > # CONFIG_MFD_RDC321X is not set
> > # CONFIG_MFD_RTSX_PCI is not set
> > CONFIG_MFD_RT5033=3Dy
> > CONFIG_MFD_RTSX_USB=3Dm
> > CONFIG_MFD_RC5T583=3Dy
> > CONFIG_MFD_SEC_CORE=3Dy
> > # CONFIG_MFD_SI476X_CORE is not set
> > CONFIG_MFD_SM501=3Dm
> > # CONFIG_MFD_SM501_GPIO is not set
> > CONFIG_MFD_SKY81452=3Dy
> > # CONFIG_MFD_SMSC is not set
> > CONFIG_ABX500_CORE=3Dy
> > # CONFIG_AB3100_CORE is not set
> > CONFIG_MFD_SYSCON=3Dy
> > CONFIG_MFD_TI_AM335X_TSCADC=3Dm
> > CONFIG_MFD_LP3943=3Dm
> > CONFIG_MFD_LP8788=3Dy
> > CONFIG_MFD_PALMAS=3Dy
> > # CONFIG_TPS6105X is not set
> > # CONFIG_TPS65010 is not set
> > CONFIG_TPS6507X=3Dy
> > # CONFIG_MFD_TPS65086 is not set
> > CONFIG_MFD_TPS65090=3Dy
> > CONFIG_MFD_TPS65217=3Dm
> > CONFIG_MFD_TI_LP873X=3Dy
> > # CONFIG_MFD_TPS65218 is not set
> > CONFIG_MFD_TPS6586X=3Dy
> > CONFIG_MFD_TPS65910=3Dy
> > # CONFIG_MFD_TPS65912_I2C is not set
> > CONFIG_MFD_TPS80031=3Dy
> > # CONFIG_TWL4030_CORE is not set
> > CONFIG_TWL6040_CORE=3Dy
> > CONFIG_MFD_WL1273_CORE=3Dy
> > CONFIG_MFD_LM3533=3Dy
> > # CONFIG_MFD_TIMBERDALE is not set
> > # CONFIG_MFD_TMIO is not set
> > # CONFIG_MFD_VX855 is not set
> > # CONFIG_MFD_ARIZONA_I2C is not set
> > CONFIG_MFD_WM8400=3Dy
> > # CONFIG_MFD_WM831X_I2C is not set
> > # CONFIG_MFD_WM8350_I2C is not set
> > CONFIG_MFD_WM8994=3Dm
> > # CONFIG_REGULATOR is not set
> > CONFIG_MEDIA_SUPPORT=3Dy
> > =

> > #
> > # Multimedia core support
> > #
> > # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> > # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> > CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> > CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> > CONFIG_MEDIA_SDR_SUPPORT=3Dy
> > # CONFIG_MEDIA_RC_SUPPORT is not set
> > CONFIG_MEDIA_CEC_SUPPORT=3Dy
> > CONFIG_MEDIA_CEC_DEBUG=3Dy
> > CONFIG_MEDIA_CEC_EDID=3Dy
> > CONFIG_MEDIA_CONTROLLER=3Dy
> > # CONFIG_MEDIA_CONTROLLER_DVB is not set
> > CONFIG_VIDEO_DEV=3Dy
> > CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> > CONFIG_VIDEO_V4L2=3Dy
> > CONFIG_VIDEO_ADV_DEBUG=3Dy
> > # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> > CONFIG_V4L2_FLASH_LED_CLASS=3Dm
> > CONFIG_DVB_CORE=3Dy
> > # CONFIG_DVB_NET is not set
> > # CONFIG_TTPCI_EEPROM is not set
> > CONFIG_DVB_MAX_ADAPTERS=3D16
> > # CONFIG_DVB_DYNAMIC_MINORS is not set
> > # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> > =

> > #
> > # Media drivers
> > #
> > # CONFIG_MEDIA_USB_SUPPORT is not set
> > # CONFIG_MEDIA_PCI_SUPPORT is not set
> > # CONFIG_DVB_PLATFORM_DRIVERS is not set
> > =

> > #
> > # Supported MMC/SDIO adapters
> > #
> > CONFIG_SMS_SDIO_DRV=3Dy
> > CONFIG_RADIO_ADAPTERS=3Dy
> > CONFIG_RADIO_SI470X=3Dy
> > CONFIG_USB_SI470X=3Dy
> > # CONFIG_RADIO_SI4713 is not set
> > # CONFIG_USB_MR800 is not set
> > # CONFIG_USB_DSBR is not set
> > # CONFIG_RADIO_MAXIRADIO is not set
> > # CONFIG_RADIO_SHARK is not set
> > # CONFIG_RADIO_SHARK2 is not set
> > CONFIG_USB_KEENE=3Dy
> > # CONFIG_USB_RAREMONO is not set
> > CONFIG_USB_MA901=3Dy
> > # CONFIG_RADIO_TEA5764 is not set
> > CONFIG_RADIO_SAA7706H=3Dy
> > CONFIG_RADIO_TEF6862=3Dy
> > CONFIG_RADIO_WL1273=3Dy
> > =

> > #
> > # Texas Instruments WL128x FM driver (ST based)
> > #
> > # CONFIG_V4L_RADIO_ISA_DRIVERS is not set
> > CONFIG_MEDIA_COMMON_OPTIONS=3Dy
> > =

> > #
> > # common driver options
> > #
> > CONFIG_CYPRESS_FIRMWARE=3Dm
> > CONFIG_SMS_SIANO_MDTV=3Dy
> > =

> > #
> > # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> > #
> > CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> > CONFIG_MEDIA_ATTACH=3Dy
> > =

> > #
> > # Audio decoders, processors and mixers
> > #
> > =

> > #
> > # RDS decoders
> > #
> > =

> > #
> > # Video decoders
> > #
> > =

> > #
> > # Video and audio decoders
> > #
> > =

> > #
> > # Video encoders
> > #
> > =

> > #
> > # Camera sensor devices
> > #
> > =

> > #
> > # Flash devices
> > #
> > =

> > #
> > # Video improvement chips
> > #
> > =

> > #
> > # Audio/Video compression chips
> > #
> > =

> > #
> > # Miscellaneous helper chips
> > #
> > =

> > #
> > # Sensors used on soc_camera driver
> > #
> > CONFIG_MEDIA_TUNER=3Dy
> > CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> > CONFIG_MEDIA_TUNER_TDA8290=3Dy
> > CONFIG_MEDIA_TUNER_TDA827X=3Dy
> > CONFIG_MEDIA_TUNER_TDA18271=3Dy
> > CONFIG_MEDIA_TUNER_TDA9887=3Dy
> > CONFIG_MEDIA_TUNER_TEA5761=3Dy
> > CONFIG_MEDIA_TUNER_TEA5767=3Dy
> > CONFIG_MEDIA_TUNER_MT20XX=3Dy
> > CONFIG_MEDIA_TUNER_XC2028=3Dy
> > CONFIG_MEDIA_TUNER_XC5000=3Dy
> > CONFIG_MEDIA_TUNER_XC4000=3Dy
> > CONFIG_MEDIA_TUNER_MC44S803=3Dy
> > =

> > #
> > # Multistandard (satellite) frontends
> > #
> > =

> > #
> > # Multistandard (cable + terrestrial) frontends
> > #
> > =

> > #
> > # DVB-S (satellite) frontends
> > #
> > =

> > #
> > # DVB-T (terrestrial) frontends
> > #
> > # CONFIG_DVB_AS102_FE is not set
> > # CONFIG_DVB_GP8PSK_FE is not set
> > =

> > #
> > # DVB-C (cable) frontends
> > #
> > =

> > #
> > # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> > #
> > =

> > #
> > # ISDB-T (terrestrial) frontends
> > #
> > =

> > #
> > # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> > #
> > =

> > #
> > # Digital terrestrial only tuners/PLL
> > #
> > =

> > #
> > # SEC control devices for DVB-S
> > #
> > =

> > #
> > # Tools to develop new frontends
> > #
> > # CONFIG_DVB_DUMMY_FE is not set
> > =

> > #
> > # Graphics support
> > #
> > # CONFIG_AGP is not set
> > CONFIG_VGA_ARB=3Dy
> > CONFIG_VGA_ARB_MAX_GPUS=3D16
> > # CONFIG_VGA_SWITCHEROO is not set
> > # CONFIG_DRM is not set
> > =

> > #
> > # ACP (Audio CoProcessor) Configuration
> > #
> > # CONFIG_DRM_LIB_RANDOM is not set
> > =

> > #
> > # Frame buffer Devices
> > #
> > # CONFIG_FB is not set
> > CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> > CONFIG_LCD_CLASS_DEVICE=3Dm
> > CONFIG_LCD_PLATFORM=3Dm
> > CONFIG_BACKLIGHT_CLASS_DEVICE=3Dm
> > CONFIG_BACKLIGHT_GENERIC=3Dm
> > CONFIG_BACKLIGHT_LM3533=3Dm
> > # CONFIG_BACKLIGHT_APPLE is not set
> > CONFIG_BACKLIGHT_PM8941_WLED=3Dm
> > CONFIG_BACKLIGHT_SAHARA=3Dm
> > CONFIG_BACKLIGHT_ADP5520=3Dm
> > CONFIG_BACKLIGHT_ADP8860=3Dm
> > CONFIG_BACKLIGHT_ADP8870=3Dm
> > CONFIG_BACKLIGHT_PCF50633=3Dm
> > CONFIG_BACKLIGHT_LM3639=3Dm
> > CONFIG_BACKLIGHT_SKY81452=3Dm
> > # CONFIG_BACKLIGHT_TPS65217 is not set
> > CONFIG_BACKLIGHT_AS3711=3Dm
> > CONFIG_BACKLIGHT_GPIO=3Dm
> > # CONFIG_BACKLIGHT_LV5207LP is not set
> > CONFIG_BACKLIGHT_BD6107=3Dm
> > # CONFIG_VGASTATE is not set
> > CONFIG_SOUND=3Dm
> > CONFIG_SOUND_OSS_CORE=3Dy
> > CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
> > CONFIG_SND=3Dm
> > CONFIG_SND_TIMER=3Dm
> > CONFIG_SND_PCM=3Dm
> > CONFIG_SND_DMAENGINE_PCM=3Dm
> > CONFIG_SND_HWDEP=3Dm
> > CONFIG_SND_RAWMIDI=3Dm
> > CONFIG_SND_JACK=3Dy
> > CONFIG_SND_JACK_INPUT_DEV=3Dy
> > CONFIG_SND_SEQUENCER=3Dm
> > CONFIG_SND_SEQ_DUMMY=3Dm
> > CONFIG_SND_OSSEMUL=3Dy
> > CONFIG_SND_MIXER_OSS=3Dm
> > CONFIG_SND_PCM_OSS=3Dm
> > CONFIG_SND_PCM_OSS_PLUGINS=3Dy
> > # CONFIG_SND_PCM_TIMER is not set
> > # CONFIG_SND_SEQUENCER_OSS is not set
> > # CONFIG_SND_HRTIMER is not set
> > CONFIG_SND_DYNAMIC_MINORS=3Dy
> > CONFIG_SND_MAX_CARDS=3D32
> > # CONFIG_SND_SUPPORT_OLD_API is not set
> > CONFIG_SND_PROC_FS=3Dy
> > CONFIG_SND_VERBOSE_PROCFS=3Dy
> > # CONFIG_SND_VERBOSE_PRINTK is not set
> > # CONFIG_SND_DEBUG is not set
> > CONFIG_SND_VMASTER=3Dy
> > CONFIG_SND_DMA_SGBUF=3Dy
> > CONFIG_SND_RAWMIDI_SEQ=3Dm
> > # CONFIG_SND_OPL3_LIB_SEQ is not set
> > # CONFIG_SND_OPL4_LIB_SEQ is not set
> > # CONFIG_SND_SBAWE_SEQ is not set
> > # CONFIG_SND_EMU10K1_SEQ is not set
> > CONFIG_SND_MPU401_UART=3Dm
> > CONFIG_SND_VX_LIB=3Dm
> > CONFIG_SND_AC97_CODEC=3Dm
> > CONFIG_SND_DRIVERS=3Dy
> > # CONFIG_SND_PCSP is not set
> > # CONFIG_SND_DUMMY is not set
> > CONFIG_SND_ALOOP=3Dm
> > CONFIG_SND_VIRMIDI=3Dm
> > # CONFIG_SND_MTPAV is not set
> > CONFIG_SND_MTS64=3Dm
> > CONFIG_SND_SERIAL_U16550=3Dm
> > CONFIG_SND_MPU401=3Dm
> > CONFIG_SND_PORTMAN2X4=3Dm
> > # CONFIG_SND_AC97_POWER_SAVE is not set
> > # CONFIG_SND_ISA is not set
> > CONFIG_SND_PCI=3Dy
> > # CONFIG_SND_AD1889 is not set
> > # CONFIG_SND_ALS300 is not set
> > # CONFIG_SND_ALS4000 is not set
> > # CONFIG_SND_ALI5451 is not set
> > # CONFIG_SND_ASIHPI is not set
> > # CONFIG_SND_ATIIXP is not set
> > # CONFIG_SND_ATIIXP_MODEM is not set
> > # CONFIG_SND_AU8810 is not set
> > # CONFIG_SND_AU8820 is not set
> > # CONFIG_SND_AU8830 is not set
> > # CONFIG_SND_AW2 is not set
> > # CONFIG_SND_AZT3328 is not set
> > # CONFIG_SND_BT87X is not set
> > # CONFIG_SND_CA0106 is not set
> > # CONFIG_SND_CMIPCI is not set
> > # CONFIG_SND_OXYGEN is not set
> > # CONFIG_SND_CS4281 is not set
> > # CONFIG_SND_CS46XX is not set
> > # CONFIG_SND_CS5530 is not set
> > # CONFIG_SND_CS5535AUDIO is not set
> > # CONFIG_SND_CTXFI is not set
> > # CONFIG_SND_DARLA20 is not set
> > # CONFIG_SND_GINA20 is not set
> > # CONFIG_SND_LAYLA20 is not set
> > # CONFIG_SND_DARLA24 is not set
> > # CONFIG_SND_GINA24 is not set
> > # CONFIG_SND_LAYLA24 is not set
> > # CONFIG_SND_MONA is not set
> > # CONFIG_SND_MIA is not set
> > # CONFIG_SND_ECHO3G is not set
> > # CONFIG_SND_INDIGO is not set
> > # CONFIG_SND_INDIGOIO is not set
> > # CONFIG_SND_INDIGODJ is not set
> > # CONFIG_SND_INDIGOIOX is not set
> > # CONFIG_SND_INDIGODJX is not set
> > # CONFIG_SND_EMU10K1 is not set
> > # CONFIG_SND_EMU10K1X is not set
> > # CONFIG_SND_ENS1370 is not set
> > # CONFIG_SND_ENS1371 is not set
> > # CONFIG_SND_ES1938 is not set
> > # CONFIG_SND_ES1968 is not set
> > # CONFIG_SND_FM801 is not set
> > # CONFIG_SND_HDSP is not set
> > # CONFIG_SND_HDSPM is not set
> > # CONFIG_SND_ICE1712 is not set
> > # CONFIG_SND_ICE1724 is not set
> > # CONFIG_SND_INTEL8X0 is not set
> > # CONFIG_SND_INTEL8X0M is not set
> > # CONFIG_SND_KORG1212 is not set
> > # CONFIG_SND_LOLA is not set
> > # CONFIG_SND_LX6464ES is not set
> > # CONFIG_SND_MAESTRO3 is not set
> > # CONFIG_SND_MIXART is not set
> > # CONFIG_SND_NM256 is not set
> > # CONFIG_SND_PCXHR is not set
> > # CONFIG_SND_RIPTIDE is not set
> > # CONFIG_SND_RME32 is not set
> > # CONFIG_SND_RME96 is not set
> > # CONFIG_SND_RME9652 is not set
> > # CONFIG_SND_SE6X is not set
> > # CONFIG_SND_SIS7019 is not set
> > # CONFIG_SND_SONICVIBES is not set
> > # CONFIG_SND_TRIDENT is not set
> > # CONFIG_SND_VIA82XX is not set
> > # CONFIG_SND_VIA82XX_MODEM is not set
> > # CONFIG_SND_VIRTUOSO is not set
> > # CONFIG_SND_VX222 is not set
> > # CONFIG_SND_YMFPCI is not set
> > =

> > #
> > # HD-Audio
> > #
> > # CONFIG_SND_HDA_INTEL is not set
> > CONFIG_SND_HDA_PREALLOC_SIZE=3D64
> > # CONFIG_SND_USB is not set
> > CONFIG_SND_PCMCIA=3Dy
> > CONFIG_SND_VXPOCKET=3Dm
> > # CONFIG_SND_PDAUDIOCF is not set
> > CONFIG_SND_SOC=3Dm
> > CONFIG_SND_SOC_AC97_BUS=3Dy
> > CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
> > CONFIG_SND_SOC_AMD_ACP=3Dm
> > CONFIG_SND_ATMEL_SOC=3Dm
> > # CONFIG_SND_DESIGNWARE_I2S is not set
> > =

> > #
> > # SoC Audio for Freescale CPUs
> > #
> > =

> > #
> > # Common SoC Audio options for Freescale CPUs:
> > #
> > CONFIG_SND_SOC_FSL_ASRC=3Dm
> > CONFIG_SND_SOC_FSL_SAI=3Dm
> > CONFIG_SND_SOC_FSL_SSI=3Dm
> > # CONFIG_SND_SOC_FSL_SPDIF is not set
> > CONFIG_SND_SOC_FSL_ESAI=3Dm
> > # CONFIG_SND_SOC_IMX_AUDMUX is not set
> > # CONFIG_SND_SOC_IMG is not set
> > # CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH is not set
> > # CONFIG_SND_SOC_INTEL_BXT_RT298_MACH is not set
> > # CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH is not set
> > # CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH is not set
> > # CONFIG_SND_SOC_INTEL_SKL_RT286_MACH is not set
> > CONFIG_SND_SOC_XTFPGA_I2S=3Dm
> > CONFIG_SND_SOC_I2C_AND_SPI=3Dm
> > =

> > #
> > # CODEC drivers
> > #
> > CONFIG_SND_SOC_AC97_CODEC=3Dm
> > # CONFIG_SND_SOC_ADAU1701 is not set
> > # CONFIG_SND_SOC_ADAU7002 is not set
> > CONFIG_SND_SOC_AK4554=3Dm
> > CONFIG_SND_SOC_AK4613=3Dm
> > CONFIG_SND_SOC_AK4642=3Dm
> > # CONFIG_SND_SOC_AK5386 is not set
> > CONFIG_SND_SOC_ALC5623=3Dm
> > CONFIG_SND_SOC_BT_SCO=3Dm
> > # CONFIG_SND_SOC_CS35L32 is not set
> > CONFIG_SND_SOC_CS35L33=3Dm
> > CONFIG_SND_SOC_CS35L34=3Dm
> > CONFIG_SND_SOC_CS42L42=3Dm
> > CONFIG_SND_SOC_CS42L51=3Dm
> > CONFIG_SND_SOC_CS42L51_I2C=3Dm
> > # CONFIG_SND_SOC_CS42L52 is not set
> > # CONFIG_SND_SOC_CS42L56 is not set
> > CONFIG_SND_SOC_CS42L73=3Dm
> > CONFIG_SND_SOC_CS4265=3Dm
> > # CONFIG_SND_SOC_CS4270 is not set
> > CONFIG_SND_SOC_CS4271=3Dm
> > CONFIG_SND_SOC_CS4271_I2C=3Dm
> > CONFIG_SND_SOC_CS42XX8=3Dm
> > CONFIG_SND_SOC_CS42XX8_I2C=3Dm
> > # CONFIG_SND_SOC_CS4349 is not set
> > # CONFIG_SND_SOC_CS53L30 is not set
> > # CONFIG_SND_SOC_ES8328_I2C is not set
> > CONFIG_SND_SOC_GTM601=3Dm
> > # CONFIG_SND_SOC_INNO_RK3036 is not set
> > CONFIG_SND_SOC_MAX98504=3Dm
> > CONFIG_SND_SOC_MAX9860=3Dm
> > CONFIG_SND_SOC_MSM8916_WCD_ANALOG=3Dm
> > CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=3Dm
> > CONFIG_SND_SOC_PCM1681=3Dm
> > CONFIG_SND_SOC_PCM179X=3Dm
> > CONFIG_SND_SOC_PCM179X_I2C=3Dm
> > CONFIG_SND_SOC_PCM3168A=3Dm
> > CONFIG_SND_SOC_PCM3168A_I2C=3Dm
> > # CONFIG_SND_SOC_PCM512x_I2C is not set
> > # CONFIG_SND_SOC_RT5616 is not set
> > CONFIG_SND_SOC_RT5631=3Dm
> > # CONFIG_SND_SOC_RT5677_SPI is not set
> > # CONFIG_SND_SOC_SGTL5000 is not set
> > CONFIG_SND_SOC_SIRF_AUDIO_CODEC=3Dm
> > CONFIG_SND_SOC_SPDIF=3Dm
> > CONFIG_SND_SOC_SSM2602=3Dm
> > CONFIG_SND_SOC_SSM2602_I2C=3Dm
> > CONFIG_SND_SOC_SSM4567=3Dm
> > CONFIG_SND_SOC_STA32X=3Dm
> > CONFIG_SND_SOC_STA350=3Dm
> > CONFIG_SND_SOC_STI_SAS=3Dm
> > # CONFIG_SND_SOC_TAS2552 is not set
> > CONFIG_SND_SOC_TAS5086=3Dm
> > CONFIG_SND_SOC_TAS571X=3Dm
> > CONFIG_SND_SOC_TAS5720=3Dm
> > CONFIG_SND_SOC_TFA9879=3Dm
> > CONFIG_SND_SOC_TLV320AIC23=3Dm
> > CONFIG_SND_SOC_TLV320AIC23_I2C=3Dm
> > # CONFIG_SND_SOC_TLV320AIC31XX is not set
> > # CONFIG_SND_SOC_TLV320AIC3X is not set
> > # CONFIG_SND_SOC_TS3A227E is not set
> > CONFIG_SND_SOC_WM8510=3Dm
> > # CONFIG_SND_SOC_WM8523 is not set
> > # CONFIG_SND_SOC_WM8580 is not set
> > CONFIG_SND_SOC_WM8711=3Dm
> > # CONFIG_SND_SOC_WM8728 is not set
> > CONFIG_SND_SOC_WM8731=3Dm
> > # CONFIG_SND_SOC_WM8737 is not set
> > # CONFIG_SND_SOC_WM8741 is not set
> > CONFIG_SND_SOC_WM8750=3Dm
> > CONFIG_SND_SOC_WM8753=3Dm
> > # CONFIG_SND_SOC_WM8776 is not set
> > # CONFIG_SND_SOC_WM8804_I2C is not set
> > CONFIG_SND_SOC_WM8903=3Dm
> > CONFIG_SND_SOC_WM8960=3Dm
> > # CONFIG_SND_SOC_WM8962 is not set
> > # CONFIG_SND_SOC_WM8974 is not set
> > CONFIG_SND_SOC_WM8978=3Dm
> > CONFIG_SND_SOC_WM8985=3Dm
> > # CONFIG_SND_SOC_NAU8540 is not set
> > CONFIG_SND_SOC_NAU8810=3Dm
> > # CONFIG_SND_SOC_TPA6130A2 is not set
> > CONFIG_SND_SIMPLE_CARD_UTILS=3Dm
> > CONFIG_SND_SIMPLE_CARD=3Dm
> > # CONFIG_SND_X86 is not set
> > CONFIG_SOUND_PRIME=3Dm
> > # CONFIG_SOUND_MSNDCLAS is not set
> > # CONFIG_SOUND_MSNDPIN is not set
> > CONFIG_SOUND_OSS=3Dm
> > # CONFIG_SOUND_TRACEINIT is not set
> > # CONFIG_SOUND_DMAP is not set
> > # CONFIG_SOUND_VMIDI is not set
> > CONFIG_SOUND_TRIX=3Dm
> > # CONFIG_SOUND_MSS is not set
> > CONFIG_SOUND_MPU401=3Dm
> > CONFIG_SOUND_PAS=3Dm
> > CONFIG_SOUND_PSS=3Dm
> > CONFIG_PSS_MIXER=3Dy
> > # CONFIG_PSS_HAVE_BOOT is not set
> > CONFIG_SOUND_SB=3Dm
> > # CONFIG_SOUND_YM3812 is not set
> > # CONFIG_SOUND_UART6850 is not set
> > CONFIG_SOUND_AEDSP16=3Dm
> > CONFIG_SC6600=3Dy
> > CONFIG_SC6600_JOY=3Dy
> > CONFIG_SC6600_CDROM=3D4
> > CONFIG_SC6600_CDROMBASE=3D0
> > CONFIG_SOUND_KAHLUA=3Dm
> > CONFIG_AC97_BUS=3Dm
> > =

> > #
> > # HID support
> > #
> > CONFIG_HID=3Dy
> > # CONFIG_HID_BATTERY_STRENGTH is not set
> > # CONFIG_HIDRAW is not set
> > # CONFIG_UHID is not set
> > CONFIG_HID_GENERIC=3Dy
> > =

> > #
> > # Special HID drivers
> > #
> > # CONFIG_HID_A4TECH is not set
> > # CONFIG_HID_ACRUX is not set
> > # CONFIG_HID_APPLE is not set
> > # CONFIG_HID_APPLEIR is not set
> > # CONFIG_HID_AUREAL is not set
> > # CONFIG_HID_BELKIN is not set
> > # CONFIG_HID_BETOP_FF is not set
> > # CONFIG_HID_CHERRY is not set
> > # CONFIG_HID_CHICONY is not set
> > # CONFIG_HID_CORSAIR is not set
> > # CONFIG_HID_PRODIKEYS is not set
> > # CONFIG_HID_CMEDIA is not set
> > # CONFIG_HID_CP2112 is not set
> > # CONFIG_HID_CYPRESS is not set
> > # CONFIG_HID_DRAGONRISE is not set
> > # CONFIG_HID_EMS_FF is not set
> > # CONFIG_HID_ELECOM is not set
> > # CONFIG_HID_ELO is not set
> > # CONFIG_HID_EZKEY is not set
> > # CONFIG_HID_GEMBIRD is not set
> > # CONFIG_HID_GFRM is not set
> > # CONFIG_HID_HOLTEK is not set
> > # CONFIG_HID_GT683R is not set
> > # CONFIG_HID_KEYTOUCH is not set
> > # CONFIG_HID_KYE is not set
> > # CONFIG_HID_UCLOGIC is not set
> > # CONFIG_HID_WALTOP is not set
> > # CONFIG_HID_GYRATION is not set
> > # CONFIG_HID_ICADE is not set
> > # CONFIG_HID_TWINHAN is not set
> > # CONFIG_HID_KENSINGTON is not set
> > # CONFIG_HID_LCPOWER is not set
> > # CONFIG_HID_LED is not set
> > # CONFIG_HID_LENOVO is not set
> > # CONFIG_HID_LOGITECH is not set
> > # CONFIG_HID_MAGICMOUSE is not set
> > # CONFIG_HID_MAYFLASH is not set
> > # CONFIG_HID_MICROSOFT is not set
> > # CONFIG_HID_MONTEREY is not set
> > # CONFIG_HID_MULTITOUCH is not set
> > # CONFIG_HID_NTRIG is not set
> > # CONFIG_HID_ORTEK is not set
> > # CONFIG_HID_PANTHERLORD is not set
> > # CONFIG_HID_PENMOUNT is not set
> > # CONFIG_HID_PETALYNX is not set
> > # CONFIG_HID_PICOLCD is not set
> > # CONFIG_HID_PLANTRONICS is not set
> > # CONFIG_HID_PRIMAX is not set
> > # CONFIG_HID_ROCCAT is not set
> > # CONFIG_HID_SAITEK is not set
> > # CONFIG_HID_SAMSUNG is not set
> > # CONFIG_HID_SONY is not set
> > # CONFIG_HID_SPEEDLINK is not set
> > # CONFIG_HID_STEELSERIES is not set
> > # CONFIG_HID_SUNPLUS is not set
> > # CONFIG_HID_RMI is not set
> > # CONFIG_HID_GREENASIA is not set
> > # CONFIG_HID_SMARTJOYPLUS is not set
> > # CONFIG_HID_TIVO is not set
> > # CONFIG_HID_TOPSEED is not set
> > # CONFIG_HID_THINGM is not set
> > # CONFIG_HID_THRUSTMASTER is not set
> > # CONFIG_HID_UDRAW_PS3 is not set
> > # CONFIG_HID_WACOM is not set
> > # CONFIG_HID_WIIMOTE is not set
> > # CONFIG_HID_XINMO is not set
> > # CONFIG_HID_ZEROPLUS is not set
> > # CONFIG_HID_ZYDACRON is not set
> > # CONFIG_HID_SENSOR_HUB is not set
> > # CONFIG_HID_ALPS is not set
> > =

> > #
> > # USB HID support
> > #
> > CONFIG_USB_HID=3Dy
> > # CONFIG_HID_PID is not set
> > # CONFIG_USB_HIDDEV is not set
> > =

> > #
> > # I2C HID support
> > #
> > # CONFIG_I2C_HID is not set
> > CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> > CONFIG_USB_SUPPORT=3Dy
> > CONFIG_USB_COMMON=3Dy
> > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > CONFIG_USB=3Dy
> > # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> > =

> > #
> > # Miscellaneous USB options
> > #
> > # CONFIG_USB_DEFAULT_PERSIST is not set
> > # CONFIG_USB_DYNAMIC_MINORS is not set
> > CONFIG_USB_OTG=3Dy
> > # CONFIG_USB_OTG_WHITELIST is not set
> > CONFIG_USB_OTG_BLACKLIST_HUB=3Dy
> > CONFIG_USB_OTG_FSM=3Dy
> > CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dm
> > CONFIG_USB_MON=3Dy
> > # CONFIG_USB_WUSB_CBAF is not set
> > =

> > #
> > # USB Host Controller Drivers
> > #
> > CONFIG_USB_C67X00_HCD=3Dy
> > CONFIG_USB_XHCI_HCD=3Dy
> > CONFIG_USB_XHCI_PCI=3Dy
> > CONFIG_USB_XHCI_PLATFORM=3Dy
> > CONFIG_USB_EHCI_HCD=3Dm
> > CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> > CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> > CONFIG_USB_EHCI_PCI=3Dm
> > CONFIG_USB_EHCI_HCD_PLATFORM=3Dm
> > # CONFIG_USB_OXU210HP_HCD is not set
> > CONFIG_USB_ISP116X_HCD=3Dm
> > CONFIG_USB_ISP1362_HCD=3Dm
> > # CONFIG_USB_FOTG210_HCD is not set
> > # CONFIG_USB_OHCI_HCD is not set
> > # CONFIG_USB_UHCI_HCD is not set
> > CONFIG_USB_SL811_HCD=3Dy
> > CONFIG_USB_SL811_HCD_ISO=3Dy
> > # CONFIG_USB_SL811_CS is not set
> > CONFIG_USB_R8A66597_HCD=3Dm
> > CONFIG_USB_HCD_BCMA=3Dm
> > # CONFIG_USB_HCD_TEST_MODE is not set
> > =

> > #
> > # USB Device Class drivers
> > #
> > # CONFIG_USB_ACM is not set
> > CONFIG_USB_PRINTER=3Dm
> > # CONFIG_USB_WDM is not set
> > CONFIG_USB_TMC=3Dy
> > =

> > #
> > # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> > #
> > =

> > #
> > # also be needed; see USB_STORAGE Help for more info
> > #
> > # CONFIG_USB_STORAGE is not set
> > =

> > #
> > # USB Imaging devices
> > #
> > CONFIG_USB_MDC800=3Dm
> > CONFIG_USB_MICROTEK=3Dy
> > CONFIG_USBIP_CORE=3Dm
> > CONFIG_USBIP_VHCI_HCD=3Dm
> > CONFIG_USBIP_VHCI_HC_PORTS=3D8
> > CONFIG_USBIP_VHCI_NR_HCS=3D1
> > CONFIG_USBIP_HOST=3Dm
> > CONFIG_USBIP_VUDC=3Dm
> > CONFIG_USBIP_DEBUG=3Dy
> > CONFIG_USB_MUSB_HDRC=3Dm
> > # CONFIG_USB_MUSB_HOST is not set
> > # CONFIG_USB_MUSB_GADGET is not set
> > CONFIG_USB_MUSB_DUAL_ROLE=3Dy
> > =

> > #
> > # Platform Glue Layer
> > #
> > =

> > #
> > # MUSB DMA mode
> > #
> > # CONFIG_MUSB_PIO_ONLY is not set
> > CONFIG_USB_DWC3=3Dy
> > CONFIG_USB_DWC3_HOST=3Dy
> > =

> > #
> > # Platform Glue Driver Support
> > #
> > CONFIG_USB_DWC3_PCI=3Dy
> > # CONFIG_USB_DWC2 is not set
> > CONFIG_USB_CHIPIDEA=3Dm
> > CONFIG_USB_CHIPIDEA_PCI=3Dm
> > # CONFIG_USB_CHIPIDEA_UDC is not set
> > CONFIG_USB_CHIPIDEA_HOST=3Dy
> > # CONFIG_USB_CHIPIDEA_ULPI is not set
> > CONFIG_USB_ISP1760=3Dm
> > CONFIG_USB_ISP1761_UDC=3Dy
> > # CONFIG_USB_ISP1760_HOST_ROLE is not set
> > CONFIG_USB_ISP1760_GADGET_ROLE=3Dy
> > # CONFIG_USB_ISP1760_DUAL_ROLE is not set
> > =

> > #
> > # USB port drivers
> > #
> > CONFIG_USB_USS720=3Dm
> > # CONFIG_USB_SERIAL is not set
> > =

> > #
> > # USB Miscellaneous drivers
> > #
> > # CONFIG_USB_EMI62 is not set
> > # CONFIG_USB_EMI26 is not set
> > # CONFIG_USB_ADUTUX is not set
> > CONFIG_USB_SEVSEG=3Dy
> > CONFIG_USB_RIO500=3Dm
> > # CONFIG_USB_LEGOTOWER is not set
> > CONFIG_USB_LCD=3Dm
> > CONFIG_USB_CYPRESS_CY7C63=3Dm
> > CONFIG_USB_CYTHERM=3Dy
> > CONFIG_USB_IDMOUSE=3Dm
> > # CONFIG_USB_FTDI_ELAN is not set
> > CONFIG_USB_APPLEDISPLAY=3Dm
> > # CONFIG_USB_SISUSBVGA is not set
> > CONFIG_USB_LD=3Dy
> > CONFIG_USB_TRANCEVIBRATOR=3Dm
> > CONFIG_USB_IOWARRIOR=3Dy
> > CONFIG_USB_TEST=3Dm
> > CONFIG_USB_EHSET_TEST_FIXTURE=3Dy
> > CONFIG_USB_ISIGHTFW=3Dm
> > # CONFIG_USB_YUREX is not set
> > CONFIG_USB_EZUSB_FX2=3Dm
> > # CONFIG_USB_HUB_USB251XB is not set
> > # CONFIG_USB_HSIC_USB3503 is not set
> > CONFIG_USB_HSIC_USB4604=3Dy
> > CONFIG_USB_LINK_LAYER_TEST=3Dy
> > # CONFIG_USB_CHAOSKEY is not set
> > # CONFIG_UCSI is not set
> > =

> > #
> > # USB Physical Layer drivers
> > #
> > CONFIG_USB_PHY=3Dy
> > CONFIG_NOP_USB_XCEIV=3Dm
> > # CONFIG_USB_GPIO_VBUS is not set
> > CONFIG_USB_ISP1301=3Dy
> > CONFIG_USB_GADGET=3Dm
> > CONFIG_USB_GADGET_DEBUG=3Dy
> > # CONFIG_USB_GADGET_VERBOSE is not set
> > # CONFIG_USB_GADGET_DEBUG_FILES is not set
> > # CONFIG_USB_GADGET_DEBUG_FS is not set
> > CONFIG_USB_GADGET_VBUS_DRAW=3D2
> > CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> > =

> > #
> > # USB Peripheral Controller
> > #
> > # CONFIG_USB_FOTG210_UDC is not set
> > CONFIG_USB_GR_UDC=3Dm
> > # CONFIG_USB_R8A66597 is not set
> > # CONFIG_USB_PXA27X is not set
> > CONFIG_USB_MV_UDC=3Dm
> > CONFIG_USB_MV_U3D=3Dm
> > # CONFIG_USB_M66592 is not set
> > CONFIG_USB_BDC_UDC=3Dm
> > =

> > #
> > # Platform Support
> > #
> > CONFIG_USB_BDC_PCI=3Dm
> > # CONFIG_USB_AMD5536UDC is not set
> > CONFIG_USB_NET2272=3Dm
> > CONFIG_USB_NET2272_DMA=3Dy
> > # CONFIG_USB_NET2280 is not set
> > # CONFIG_USB_GOKU is not set
> > # CONFIG_USB_EG20T is not set
> > CONFIG_USB_DUMMY_HCD=3Dm
> > CONFIG_USB_LIBCOMPOSITE=3Dm
> > CONFIG_USB_F_SS_LB=3Dm
> > CONFIG_USB_U_ETHER=3Dm
> > CONFIG_USB_F_ECM=3Dm
> > CONFIG_USB_F_SUBSET=3Dm
> > CONFIG_USB_F_MASS_STORAGE=3Dm
> > CONFIG_USB_F_FS=3Dm
> > CONFIG_USB_F_UAC2=3Dm
> > CONFIG_USB_F_MIDI=3Dm
> > CONFIG_USB_F_HID=3Dm
> > CONFIG_USB_F_PRINTER=3Dm
> > CONFIG_USB_F_TCM=3Dm
> > # CONFIG_USB_CONFIGFS is not set
> > CONFIG_USB_ZERO=3Dm
> > CONFIG_USB_ZERO_HNPTEST=3Dy
> > CONFIG_USB_AUDIO=3Dm
> > # CONFIG_GADGET_UAC1 is not set
> > CONFIG_USB_ETH=3Dm
> > # CONFIG_USB_ETH_RNDIS is not set
> > # CONFIG_USB_ETH_EEM is not set
> > # CONFIG_USB_G_NCM is not set
> > # CONFIG_USB_GADGETFS is not set
> > CONFIG_USB_FUNCTIONFS=3Dm
> > # CONFIG_USB_FUNCTIONFS_ETH is not set
> > # CONFIG_USB_FUNCTIONFS_RNDIS is not set
> > CONFIG_USB_FUNCTIONFS_GENERIC=3Dy
> > CONFIG_USB_MASS_STORAGE=3Dm
> > CONFIG_USB_GADGET_TARGET=3Dm
> > # CONFIG_USB_G_SERIAL is not set
> > CONFIG_USB_MIDI_GADGET=3Dm
> > CONFIG_USB_G_PRINTER=3Dm
> > # CONFIG_USB_CDC_COMPOSITE is not set
> > # CONFIG_USB_G_NOKIA is not set
> > # CONFIG_USB_G_ACM_MS is not set
> > # CONFIG_USB_G_MULTI is not set
> > CONFIG_USB_G_HID=3Dm
> > # CONFIG_USB_G_DBGP is not set
> > # CONFIG_USB_G_WEBCAM is not set
> > # CONFIG_USB_LED_TRIG is not set
> > CONFIG_USB_ULPI_BUS=3Dm
> > # CONFIG_UWB is not set
> > CONFIG_MMC=3Dy
> > CONFIG_MMC_DEBUG=3Dy
> > CONFIG_MMC_BLOCK=3Dm
> > CONFIG_MMC_BLOCK_MINORS=3D8
> > # CONFIG_MMC_BLOCK_BOUNCE is not set
> > # CONFIG_SDIO_UART is not set
> > CONFIG_MMC_TEST=3Dy
> > =

> > #
> > # MMC/SD/SDIO Host Controller Drivers
> > #
> > CONFIG_MMC_SDHCI=3Dm
> > # CONFIG_MMC_SDHCI_PCI is not set
> > # CONFIG_MMC_SDHCI_ACPI is not set
> > # CONFIG_MMC_SDHCI_PLTFM is not set
> > CONFIG_MMC_WBSD=3Dy
> > # CONFIG_MMC_TIFM_SD is not set
> > # CONFIG_MMC_SDRICOH_CS is not set
> > # CONFIG_MMC_CB710 is not set
> > # CONFIG_MMC_VIA_SDMMC is not set
> > # CONFIG_MMC_VUB300 is not set
> > CONFIG_MMC_USHC=3Dm
> > # CONFIG_MMC_USDHI6ROL0 is not set
> > CONFIG_MMC_REALTEK_USB=3Dm
> > # CONFIG_MMC_TOSHIBA_PCI is not set
> > CONFIG_MMC_MTK=3Dy
> > CONFIG_MEMSTICK=3Dm
> > # CONFIG_MEMSTICK_DEBUG is not set
> > =

> > #
> > # MemoryStick drivers
> > #
> > CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> > CONFIG_MSPRO_BLOCK=3Dm
> > CONFIG_MS_BLOCK=3Dm
> > =

> > #
> > # MemoryStick Host Controller Drivers
> > #
> > # CONFIG_MEMSTICK_TIFM_MS is not set
> > # CONFIG_MEMSTICK_JMICRON_38X is not set
> > # CONFIG_MEMSTICK_R592 is not set
> > # CONFIG_MEMSTICK_REALTEK_USB is not set
> > CONFIG_NEW_LEDS=3Dy
> > CONFIG_LEDS_CLASS=3Dm
> > CONFIG_LEDS_CLASS_FLASH=3Dm
> > # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> > =

> > #
> > # LED drivers
> > #
> > # CONFIG_LEDS_LM3530 is not set
> > CONFIG_LEDS_LM3533=3Dm
> > CONFIG_LEDS_LM3642=3Dm
> > # CONFIG_LEDS_PCA9532 is not set
> > # CONFIG_LEDS_GPIO is not set
> > CONFIG_LEDS_LP3944=3Dm
> > # CONFIG_LEDS_LP3952 is not set
> > CONFIG_LEDS_LP55XX_COMMON=3Dm
> > CONFIG_LEDS_LP5521=3Dm
> > CONFIG_LEDS_LP5523=3Dm
> > # CONFIG_LEDS_LP5562 is not set
> > CONFIG_LEDS_LP8501=3Dm
> > CONFIG_LEDS_LP8788=3Dm
> > CONFIG_LEDS_LP8860=3Dm
> > # CONFIG_LEDS_CLEVO_MAIL is not set
> > CONFIG_LEDS_PCA955X=3Dm
> > CONFIG_LEDS_PCA963X=3Dm
> > CONFIG_LEDS_BD2802=3Dm
> > # CONFIG_LEDS_INTEL_SS4200 is not set
> > # CONFIG_LEDS_LT3593 is not set
> > CONFIG_LEDS_ADP5520=3Dm
> > # CONFIG_LEDS_TCA6507 is not set
> > CONFIG_LEDS_TLC591XX=3Dm
> > CONFIG_LEDS_LM355x=3Dm
> > CONFIG_LEDS_OT200=3Dm
> > CONFIG_LEDS_MENF21BMC=3Dm
> > =

> > #
> > # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID=
_THINGM)
> > #
> > CONFIG_LEDS_BLINKM=3Dm
> > CONFIG_LEDS_USER=3Dm
> > # CONFIG_LEDS_NIC78BX is not set
> > =

> > #
> > # LED Triggers
> > #
> > CONFIG_LEDS_TRIGGERS=3Dy
> > CONFIG_LEDS_TRIGGER_TIMER=3Dy
> > # CONFIG_LEDS_TRIGGER_ONESHOT is not set
> > # CONFIG_LEDS_TRIGGER_DISK is not set
> > CONFIG_LEDS_TRIGGER_MTD=3Dy
> > # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
> > # CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
> > # CONFIG_LEDS_TRIGGER_CPU is not set
> > CONFIG_LEDS_TRIGGER_GPIO=3Dm
> > CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> > =

> > #
> > # iptables trigger is under Netfilter config (LED target)
> > #
> > CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> > CONFIG_LEDS_TRIGGER_CAMERA=3Dm
> > CONFIG_LEDS_TRIGGER_PANIC=3Dy
> > CONFIG_ACCESSIBILITY=3Dy
> > # CONFIG_INFINIBAND is not set
> > CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> > CONFIG_EDAC_SUPPORT=3Dy
> > # CONFIG_EDAC is not set
> > CONFIG_RTC_LIB=3Dy
> > CONFIG_RTC_MC146818_LIB=3Dy
> > CONFIG_RTC_CLASS=3Dy
> > # CONFIG_RTC_HCTOSYS is not set
> > CONFIG_RTC_SYSTOHC=3Dy
> > CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
> > # CONFIG_RTC_DEBUG is not set
> > =

> > #
> > # RTC interfaces
> > #
> > # CONFIG_RTC_INTF_SYSFS is not set
> > CONFIG_RTC_INTF_PROC=3Dy
> > # CONFIG_RTC_INTF_DEV is not set
> > CONFIG_RTC_DRV_TEST=3Dm
> > =

> > #
> > # I2C RTC drivers
> > #
> > # CONFIG_RTC_DRV_88PM80X is not set
> > CONFIG_RTC_DRV_ABB5ZES3=3Dy
> > # CONFIG_RTC_DRV_ABX80X is not set
> > CONFIG_RTC_DRV_DS1307=3Dm
> > CONFIG_RTC_DRV_DS1307_HWMON=3Dy
> > # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> > CONFIG_RTC_DRV_DS1374=3Dm
> > # CONFIG_RTC_DRV_DS1374_WDT is not set
> > CONFIG_RTC_DRV_DS1672=3Dy
> > # CONFIG_RTC_DRV_LP8788 is not set
> > CONFIG_RTC_DRV_MAX6900=3Dy
> > # CONFIG_RTC_DRV_MAX8998 is not set
> > CONFIG_RTC_DRV_RS5C372=3Dm
> > CONFIG_RTC_DRV_ISL1208=3Dm
> > # CONFIG_RTC_DRV_ISL12022 is not set
> > CONFIG_RTC_DRV_X1205=3Dy
> > # CONFIG_RTC_DRV_PCF8523 is not set
> > CONFIG_RTC_DRV_PCF85063=3Dm
> > CONFIG_RTC_DRV_PCF8563=3Dm
> > CONFIG_RTC_DRV_PCF8583=3Dm
> > # CONFIG_RTC_DRV_M41T80 is not set
> > CONFIG_RTC_DRV_BQ32K=3Dm
> > # CONFIG_RTC_DRV_PALMAS is not set
> > CONFIG_RTC_DRV_TPS6586X=3Dm
> > CONFIG_RTC_DRV_TPS65910=3Dy
> > CONFIG_RTC_DRV_TPS80031=3Dm
> > CONFIG_RTC_DRV_RC5T583=3Dy
> > # CONFIG_RTC_DRV_S35390A is not set
> > CONFIG_RTC_DRV_FM3130=3Dy
> > # CONFIG_RTC_DRV_RX8010 is not set
> > CONFIG_RTC_DRV_RX8581=3Dy
> > CONFIG_RTC_DRV_RX8025=3Dy
> > CONFIG_RTC_DRV_EM3027=3Dm
> > # CONFIG_RTC_DRV_RV8803 is not set
> > CONFIG_RTC_DRV_S5M=3Dy
> > =

> > #
> > # SPI RTC drivers
> > #
> > CONFIG_RTC_I2C_AND_SPI=3Dy
> > =

> > #
> > # SPI and I2C RTC drivers
> > #
> > CONFIG_RTC_DRV_DS3232=3Dy
> > CONFIG_RTC_DRV_PCF2127=3Dm
> > CONFIG_RTC_DRV_RV3029C2=3Dm
> > CONFIG_RTC_DRV_RV3029_HWMON=3Dy
> > =

> > #
> > # Platform RTC drivers
> > #
> > # CONFIG_RTC_DRV_CMOS is not set
> > CONFIG_RTC_DRV_DS1286=3Dm
> > # CONFIG_RTC_DRV_DS1511 is not set
> > CONFIG_RTC_DRV_DS1553=3Dm
> > CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
> > # CONFIG_RTC_DRV_DS1685 is not set
> > # CONFIG_RTC_DRV_DS1689 is not set
> > # CONFIG_RTC_DRV_DS17285 is not set
> > # CONFIG_RTC_DRV_DS17485 is not set
> > CONFIG_RTC_DRV_DS17885=3Dy
> > # CONFIG_RTC_DS1685_PROC_REGS is not set
> > CONFIG_RTC_DS1685_SYSFS_REGS=3Dy
> > CONFIG_RTC_DRV_DS1742=3Dm
> > # CONFIG_RTC_DRV_DS2404 is not set
> > CONFIG_RTC_DRV_DA9055=3Dm
> > CONFIG_RTC_DRV_DA9063=3Dy
> > CONFIG_RTC_DRV_STK17TA8=3Dm
> > # CONFIG_RTC_DRV_M48T86 is not set
> > CONFIG_RTC_DRV_M48T35=3Dm
> > CONFIG_RTC_DRV_M48T59=3Dm
> > # CONFIG_RTC_DRV_MSM6242 is not set
> > CONFIG_RTC_DRV_BQ4802=3Dy
> > # CONFIG_RTC_DRV_RP5C01 is not set
> > # CONFIG_RTC_DRV_V3020 is not set
> > CONFIG_RTC_DRV_PCF50633=3Dy
> > =

> > #
> > # on-CPU RTC drivers
> > #
> > # CONFIG_RTC_DRV_MT6397 is not set
> > =

> > #
> > # HID Sensor RTC drivers
> > #
> > # CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
> > CONFIG_DMADEVICES=3Dy
> > # CONFIG_DMADEVICES_DEBUG is not set
> > =

> > #
> > # DMA Devices
> > #
> > CONFIG_DMA_ENGINE=3Dy
> > CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> > CONFIG_DMA_ACPI=3Dy
> > # CONFIG_INTEL_IDMA64 is not set
> > # CONFIG_PCH_DMA is not set
> > CONFIG_QCOM_HIDMA_MGMT=3Dy
> > CONFIG_QCOM_HIDMA=3Dy
> > CONFIG_DW_DMAC_CORE=3Dy
> > CONFIG_DW_DMAC=3Dy
> > # CONFIG_DW_DMAC_PCI is not set
> > CONFIG_HSU_DMA=3Dy
> > =

> > #
> > # DMA Clients
> > #
> > CONFIG_ASYNC_TX_DMA=3Dy
> > CONFIG_DMATEST=3Dy
> > =

> > #
> > # DMABUF options
> > #
> > CONFIG_SYNC_FILE=3Dy
> > CONFIG_SW_SYNC=3Dy
> > # CONFIG_AUXDISPLAY is not set
> > CONFIG_UIO=3Dy
> > # CONFIG_UIO_CIF is not set
> > # CONFIG_UIO_PDRV_GENIRQ is not set
> > CONFIG_UIO_DMEM_GENIRQ=3Dm
> > # CONFIG_UIO_AEC is not set
> > # CONFIG_UIO_SERCOS3 is not set
> > # CONFIG_UIO_PCI_GENERIC is not set
> > # CONFIG_UIO_NETX is not set
> > CONFIG_UIO_PRUSS=3Dm
> > # CONFIG_UIO_MF624 is not set
> > CONFIG_VIRT_DRIVERS=3Dy
> > CONFIG_VIRTIO=3Dy
> > =

> > #
> > # Virtio drivers
> > #
> > # CONFIG_VIRTIO_PCI is not set
> > CONFIG_VIRTIO_BALLOON=3Dm
> > # CONFIG_VIRTIO_INPUT is not set
> > # CONFIG_VIRTIO_MMIO is not set
> > =

> > #
> > # Microsoft Hyper-V guest support
> > #
> > # CONFIG_STAGING is not set
> > # CONFIG_X86_PLATFORM_DEVICES is not set
> > CONFIG_PMC_ATOM=3Dy
> > CONFIG_CHROME_PLATFORMS=3Dy
> > CONFIG_CHROMEOS_LAPTOP=3Dy
> > CONFIG_CHROMEOS_PSTORE=3Dm
> > CONFIG_CROS_EC_CHARDEV=3Dm
> > CONFIG_CROS_EC_LPC=3Dm
> > CONFIG_CROS_EC_PROTO=3Dy
> > # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> > CONFIG_CLKDEV_LOOKUP=3Dy
> > CONFIG_HAVE_CLK_PREPARE=3Dy
> > CONFIG_COMMON_CLK=3Dy
> > =

> > #
> > # Common Clock Framework
> > #
> > # CONFIG_COMMON_CLK_SI5351 is not set
> > # CONFIG_COMMON_CLK_CDCE706 is not set
> > # CONFIG_COMMON_CLK_CS2000_CP is not set
> > # CONFIG_COMMON_CLK_S2MPS11 is not set
> > # CONFIG_CLK_TWL6040 is not set
> > # CONFIG_COMMON_CLK_NXP is not set
> > # CONFIG_COMMON_CLK_PALMAS is not set
> > # CONFIG_COMMON_CLK_PXA is not set
> > # CONFIG_COMMON_CLK_PIC32 is not set
> > =

> > #
> > # Hardware Spinlock drivers
> > #
> > =

> > #
> > # Clock Source drivers
> > #
> > CONFIG_CLKSRC_I8253=3Dy
> > CONFIG_CLKEVT_I8253=3Dy
> > CONFIG_I8253_LOCK=3Dy
> > CONFIG_CLKBLD_I8253=3Dy
> > # CONFIG_ATMEL_PIT is not set
> > # CONFIG_SH_TIMER_CMT is not set
> > # CONFIG_SH_TIMER_MTU2 is not set
> > # CONFIG_SH_TIMER_TMU is not set
> > # CONFIG_EM_TIMER_STI is not set
> > # CONFIG_MAILBOX is not set
> > CONFIG_IOMMU_SUPPORT=3Dy
> > =

> > #
> > # Generic IOMMU Pagetable Support
> > #
> > =

> > #
> > # Remoteproc drivers
> > #
> > CONFIG_REMOTEPROC=3Dy
> > =

> > #
> > # Rpmsg drivers
> > #
> > =

> > #
> > # SOC (System On Chip) specific Drivers
> > #
> > =

> > #
> > # Broadcom SoC drivers
> > #
> > # CONFIG_SUNXI_SRAM is not set
> > CONFIG_SOC_TI=3Dy
> > # CONFIG_SOC_ZTE is not set
> > CONFIG_PM_DEVFREQ=3Dy
> > =

> > #
> > # DEVFREQ Governors
> > #
> > CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> > # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> > CONFIG_DEVFREQ_GOV_POWERSAVE=3Dm
> > CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> > # CONFIG_DEVFREQ_GOV_PASSIVE is not set
> > =

> > #
> > # DEVFREQ Drivers
> > #
> > # CONFIG_PM_DEVFREQ_EVENT is not set
> > CONFIG_EXTCON=3Dy
> > =

> > #
> > # Extcon Device Drivers
> > #
> > CONFIG_EXTCON_ADC_JACK=3Dy
> > # CONFIG_EXTCON_AXP288 is not set
> > CONFIG_EXTCON_GPIO=3Dy
> > # CONFIG_EXTCON_INTEL_INT3496 is not set
> > CONFIG_EXTCON_MAX3355=3Dm
> > # CONFIG_EXTCON_MAX77693 is not set
> > # CONFIG_EXTCON_MAX77843 is not set
> > # CONFIG_EXTCON_PALMAS is not set
> > CONFIG_EXTCON_QCOM_SPMI_MISC=3Dy
> > CONFIG_EXTCON_RT8973A=3Dy
> > # CONFIG_EXTCON_SM5502 is not set
> > CONFIG_EXTCON_USB_GPIO=3Dm
> > # CONFIG_MEMORY is not set
> > CONFIG_IIO=3Dy
> > CONFIG_IIO_BUFFER=3Dy
> > CONFIG_IIO_BUFFER_CB=3Dy
> > CONFIG_IIO_KFIFO_BUF=3Dy
> > CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> > CONFIG_IIO_CONFIGFS=3Dy
> > CONFIG_IIO_TRIGGER=3Dy
> > CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> > CONFIG_IIO_SW_DEVICE=3Dy
> > CONFIG_IIO_SW_TRIGGER=3Dy
> > =

> > #
> > # Accelerometers
> > #
> > # CONFIG_BMA180 is not set
> > CONFIG_BMC150_ACCEL=3Dy
> > CONFIG_BMC150_ACCEL_I2C=3Dy
> > CONFIG_DA280=3Dy
> > # CONFIG_DA311 is not set
> > CONFIG_DMARD09=3Dm
> > CONFIG_DMARD10=3Dm
> > CONFIG_IIO_ST_ACCEL_3AXIS=3Dm
> > CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dm
> > CONFIG_KXSD9=3Dy
> > # CONFIG_KXSD9_I2C is not set
> > CONFIG_KXCJK1013=3Dy
> > CONFIG_MC3230=3Dy
> > CONFIG_MMA7455=3Dm
> > CONFIG_MMA7455_I2C=3Dm
> > # CONFIG_MMA7660 is not set
> > # CONFIG_MMA8452 is not set
> > CONFIG_MMA9551_CORE=3Dy
> > # CONFIG_MMA9551 is not set
> > CONFIG_MMA9553=3Dy
> > CONFIG_MXC4005=3Dy
> > CONFIG_MXC6255=3Dy
> > # CONFIG_STK8312 is not set
> > # CONFIG_STK8BA50 is not set
> > =

> > #
> > # Analog to digital converters
> > #
> > CONFIG_AD7291=3Dy
> > CONFIG_AD799X=3Dy
> > CONFIG_AXP288_ADC=3Dm
> > # CONFIG_HX711 is not set
> > CONFIG_INA2XX_ADC=3Dm
> > CONFIG_LP8788_ADC=3Dm
> > # CONFIG_LTC2485 is not set
> > # CONFIG_MAX1363 is not set
> > # CONFIG_MCP3422 is not set
> > CONFIG_NAU7802=3Dm
> > CONFIG_PALMAS_GPADC=3Dy
> > CONFIG_QCOM_SPMI_IADC=3Dm
> > # CONFIG_QCOM_SPMI_VADC is not set
> > CONFIG_STX104=3Dy
> > CONFIG_TI_ADC081C=3Dm
> > CONFIG_TI_ADS1015=3Dm
> > CONFIG_TI_AM335X_ADC=3Dm
> > =

> > #
> > # Amplifiers
> > #
> > =

> > #
> > # Chemical Sensors
> > #
> > CONFIG_ATLAS_PH_SENSOR=3Dm
> > CONFIG_IAQCORE=3Dy
> > CONFIG_VZ89X=3Dm
> > CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dm
> > CONFIG_IIO_CROS_EC_SENSORS=3Dm
> > =

> > #
> > # Hid Sensor IIO Common
> > #
> > CONFIG_IIO_MS_SENSORS_I2C=3Dy
> > =

> > #
> > # SSP Sensor Common
> > #
> > CONFIG_IIO_ST_SENSORS_I2C=3Dy
> > CONFIG_IIO_ST_SENSORS_CORE=3Dy
> > =

> > #
> > # Counters
> > #
> > # CONFIG_104_QUAD_8 is not set
> > =

> > #
> > # Digital to analog converters
> > #
> > CONFIG_AD5064=3Dm
> > CONFIG_AD5380=3Dy
> > CONFIG_AD5446=3Dy
> > # CONFIG_AD5593R is not set
> > CONFIG_CIO_DAC=3Dy
> > # CONFIG_M62332 is not set
> > # CONFIG_MAX517 is not set
> > # CONFIG_MCP4725 is not set
> > =

> > #
> > # IIO dummy driver
> > #
> > CONFIG_IIO_SIMPLE_DUMMY=3Dm
> > # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> > # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
> > =

> > #
> > # Frequency Synthesizers DDS/PLL
> > #
> > =

> > #
> > # Clock Generator/Distribution
> > #
> > =

> > #
> > # Phase-Locked Loop (PLL) frequency synthesizers
> > #
> > =

> > #
> > # Digital gyroscope sensors
> > #
> > CONFIG_BMG160=3Dy
> > CONFIG_BMG160_I2C=3Dy
> > # CONFIG_MPU3050_I2C is not set
> > CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> > CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> > CONFIG_ITG3200=3Dy
> > =

> > #
> > # Health Sensors
> > #
> > =

> > #
> > # Heart Rate Monitors
> > #
> > # CONFIG_AFE4404 is not set
> > # CONFIG_MAX30100 is not set
> > =

> > #
> > # Humidity sensors
> > #
> > CONFIG_AM2315=3Dy
> > CONFIG_DHT11=3Dm
> > CONFIG_HDC100X=3Dm
> > CONFIG_HTS221=3Dy
> > CONFIG_HTS221_I2C=3Dy
> > CONFIG_HTU21=3Dm
> > CONFIG_SI7005=3Dm
> > CONFIG_SI7020=3Dm
> > =

> > #
> > # Inertial measurement units
> > #
> > CONFIG_BMI160=3Dy
> > CONFIG_BMI160_I2C=3Dy
> > CONFIG_KMX61=3Dm
> > # CONFIG_INV_MPU6050_I2C is not set
> > # CONFIG_IIO_ST_LSM6DSX is not set
> > =

> > #
> > # Light sensors
> > #
> > # CONFIG_ACPI_ALS is not set
> > # CONFIG_ADJD_S311 is not set
> > CONFIG_AL3320A=3Dy
> > # CONFIG_APDS9300 is not set
> > CONFIG_APDS9960=3Dm
> > # CONFIG_BH1750 is not set
> > CONFIG_BH1780=3Dm
> > CONFIG_CM32181=3Dm
> > CONFIG_CM3232=3Dy
> > # CONFIG_CM3323 is not set
> > # CONFIG_CM36651 is not set
> > # CONFIG_GP2AP020A00F is not set
> > # CONFIG_SENSORS_ISL29018 is not set
> > CONFIG_ISL29125=3Dm
> > CONFIG_JSA1212=3Dy
> > CONFIG_RPR0521=3Dm
> > CONFIG_SENSORS_LM3533=3Dm
> > # CONFIG_LTR501 is not set
> > CONFIG_MAX44000=3Dy
> > # CONFIG_OPT3001 is not set
> > CONFIG_PA12203001=3Dy
> > CONFIG_SI1145=3Dy
> > # CONFIG_STK3310 is not set
> > # CONFIG_TCS3414 is not set
> > CONFIG_TCS3472=3Dm
> > CONFIG_SENSORS_TSL2563=3Dy
> > CONFIG_TSL2583=3Dy
> > CONFIG_TSL4531=3Dm
> > CONFIG_US5182D=3Dy
> > CONFIG_VCNL4000=3Dm
> > # CONFIG_VEML6070 is not set
> > =

> > #
> > # Magnetometer sensors
> > #
> > CONFIG_AK8975=3Dm
> > # CONFIG_AK09911 is not set
> > # CONFIG_BMC150_MAGN_I2C is not set
> > # CONFIG_MAG3110 is not set
> > CONFIG_MMC35240=3Dy
> > # CONFIG_IIO_ST_MAGN_3AXIS is not set
> > # CONFIG_SENSORS_HMC5843_I2C is not set
> > =

> > #
> > # Inclinometer sensors
> > #
> > =

> > #
> > # Triggers - standalone
> > #
> > CONFIG_IIO_HRTIMER_TRIGGER=3Dm
> > CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> > CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dy
> > CONFIG_IIO_SYSFS_TRIGGER=3Dm
> > =

> > #
> > # Digital potentiometers
> > #
> > # CONFIG_DS1803 is not set
> > # CONFIG_MCP4531 is not set
> > # CONFIG_TPL0102 is not set
> > =

> > #
> > # Digital potentiostats
> > #
> > CONFIG_LMP91000=3Dy
> > =

> > #
> > # Pressure sensors
> > #
> > CONFIG_ABP060MG=3Dm
> > CONFIG_BMP280=3Dy
> > CONFIG_BMP280_I2C=3Dy
> > # CONFIG_IIO_CROS_EC_BARO is not set
> > # CONFIG_HP03 is not set
> > # CONFIG_MPL115_I2C is not set
> > # CONFIG_MPL3115 is not set
> > CONFIG_MS5611=3Dm
> > CONFIG_MS5611_I2C=3Dm
> > CONFIG_MS5637=3Dm
> > # CONFIG_IIO_ST_PRESS is not set
> > # CONFIG_T5403 is not set
> > # CONFIG_HP206C is not set
> > CONFIG_ZPA2326=3Dy
> > CONFIG_ZPA2326_I2C=3Dy
> > =

> > #
> > # Lightning sensors
> > #
> > =

> > #
> > # Proximity and distance sensors
> > #
> > # CONFIG_LIDAR_LITE_V2 is not set
> > # CONFIG_SX9500 is not set
> > # CONFIG_SRF08 is not set
> > =

> > #
> > # Temperature sensors
> > #
> > CONFIG_MLX90614=3Dy
> > # CONFIG_TMP006 is not set
> > # CONFIG_TMP007 is not set
> > CONFIG_TSYS01=3Dy
> > # CONFIG_TSYS02D is not set
> > # CONFIG_NTB is not set
> > # CONFIG_VME_BUS is not set
> > # CONFIG_PWM is not set
> > CONFIG_ARM_GIC_MAX_NR=3D1
> > CONFIG_IPACK_BUS=3Dy
> > # CONFIG_BOARD_TPCI200 is not set
> > # CONFIG_SERIAL_IPOCTAL is not set
> > CONFIG_RESET_CONTROLLER=3Dy
> > # CONFIG_RESET_ATH79 is not set
> > # CONFIG_RESET_BERLIN is not set
> > # CONFIG_RESET_LPC18XX is not set
> > # CONFIG_RESET_MESON is not set
> > # CONFIG_RESET_PISTACHIO is not set
> > # CONFIG_RESET_SOCFPGA is not set
> > # CONFIG_RESET_STM32 is not set
> > # CONFIG_RESET_SUNXI is not set
> > CONFIG_TI_SYSCON_RESET=3Dm
> > # CONFIG_RESET_ZYNQ is not set
> > # CONFIG_RESET_TEGRA_BPMP is not set
> > CONFIG_FMC=3Dm
> > CONFIG_FMC_FAKEDEV=3Dm
> > CONFIG_FMC_TRIVIAL=3Dm
> > CONFIG_FMC_WRITE_EEPROM=3Dm
> > CONFIG_FMC_CHARDEV=3Dm
> > =

> > #
> > # PHY Subsystem
> > #
> > CONFIG_GENERIC_PHY=3Dy
> > # CONFIG_PHY_PXA_28NM_HSIC is not set
> > # CONFIG_PHY_PXA_28NM_USB2 is not set
> > CONFIG_BCM_KONA_USB2_PHY=3Dm
> > # CONFIG_PHY_QCOM_USB_HS is not set
> > # CONFIG_PHY_QCOM_USB_HSIC is not set
> > CONFIG_PHY_TUSB1210=3Dm
> > # CONFIG_POWERCAP is not set
> > # CONFIG_MCB is not set
> > =

> > #
> > # Performance monitor support
> > #
> > CONFIG_RAS=3Dy
> > # CONFIG_THUNDERBOLT is not set
> > =

> > #
> > # Android
> > #
> > # CONFIG_ANDROID is not set
> > # CONFIG_LIBNVDIMM is not set
> > CONFIG_DEV_DAX=3Dy
> > CONFIG_NR_DEV_DAX=3D32768
> > CONFIG_NVMEM=3Dy
> > CONFIG_STM=3Dy
> > # CONFIG_STM_DUMMY is not set
> > CONFIG_STM_SOURCE_CONSOLE=3Dy
> > # CONFIG_STM_SOURCE_HEARTBEAT is not set
> > CONFIG_INTEL_TH=3Dm
> > # CONFIG_INTEL_TH_PCI is not set
> > # CONFIG_INTEL_TH_GTH is not set
> > # CONFIG_INTEL_TH_STH is not set
> > # CONFIG_INTEL_TH_MSU is not set
> > CONFIG_INTEL_TH_PTI=3Dm
> > # CONFIG_INTEL_TH_DEBUG is not set
> > =

> > #
> > # FPGA Configuration Support
> > #
> > CONFIG_FPGA=3Dy
> > =

> > #
> > # FSI support
> > #
> > # CONFIG_FSI is not set
> > =

> > #
> > # Firmware Drivers
> > #
> > CONFIG_EDD=3Dm
> > # CONFIG_EDD_OFF is not set
> > CONFIG_FIRMWARE_MEMMAP=3Dy
> > # CONFIG_DELL_RBU is not set
> > CONFIG_DCDBAS=3Dy
> > CONFIG_DMIID=3Dy
> > CONFIG_DMI_SYSFS=3Dm
> > CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> > # CONFIG_ISCSI_IBFT_FIND is not set
> > # CONFIG_FW_CFG_SYSFS is not set
> > # CONFIG_GOOGLE_FIRMWARE is not set
> > # CONFIG_EFI_DEV_PATH_PARSER is not set
> > =

> > #
> > # Tegra firmware driver
> > #
> > =

> > #
> > # File systems
> > #
> > CONFIG_DCACHE_WORD_ACCESS=3Dy
> > CONFIG_EXT2_FS=3Dy
> > # CONFIG_EXT2_FS_XATTR is not set
> > CONFIG_EXT3_FS=3Dy
> > CONFIG_EXT3_FS_POSIX_ACL=3Dy
> > CONFIG_EXT3_FS_SECURITY=3Dy
> > CONFIG_EXT4_FS=3Dy
> > CONFIG_EXT4_FS_POSIX_ACL=3Dy
> > CONFIG_EXT4_FS_SECURITY=3Dy
> > CONFIG_EXT4_ENCRYPTION=3Dy
> > CONFIG_EXT4_FS_ENCRYPTION=3Dy
> > CONFIG_EXT4_DEBUG=3Dy
> > CONFIG_JBD2=3Dy
> > CONFIG_JBD2_DEBUG=3Dy
> > CONFIG_FS_MBCACHE=3Dy
> > CONFIG_REISERFS_FS=3Dy
> > # CONFIG_REISERFS_CHECK is not set
> > # CONFIG_REISERFS_PROC_INFO is not set
> > CONFIG_REISERFS_FS_XATTR=3Dy
> > CONFIG_REISERFS_FS_POSIX_ACL=3Dy
> > # CONFIG_REISERFS_FS_SECURITY is not set
> > CONFIG_JFS_FS=3Dm
> > CONFIG_JFS_POSIX_ACL=3Dy
> > CONFIG_JFS_SECURITY=3Dy
> > # CONFIG_JFS_DEBUG is not set
> > # CONFIG_JFS_STATISTICS is not set
> > CONFIG_OCFS2_FS=3Dy
> > CONFIG_OCFS2_FS_O2CB=3Dy
> > CONFIG_OCFS2_FS_USERSPACE_CLUSTER=3Dy
> > # CONFIG_OCFS2_FS_STATS is not set
> > CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> > CONFIG_OCFS2_DEBUG_FS=3Dy
> > CONFIG_BTRFS_FS=3Dy
> > # CONFIG_BTRFS_FS_POSIX_ACL is not set
> > CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> > # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> > # CONFIG_BTRFS_DEBUG is not set
> > # CONFIG_BTRFS_ASSERT is not set
> > CONFIG_NILFS2_FS=3Dy
> > CONFIG_F2FS_FS=3Dm
> > # CONFIG_F2FS_STAT_FS is not set
> > # CONFIG_F2FS_FS_XATTR is not set
> > CONFIG_F2FS_CHECK_FS=3Dy
> > CONFIG_F2FS_FAULT_INJECTION=3Dy
> > # CONFIG_FS_DAX is not set
> > CONFIG_FS_POSIX_ACL=3Dy
> > CONFIG_EXPORTFS=3Dy
> > CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> > CONFIG_FILE_LOCKING=3Dy
> > # CONFIG_MANDATORY_FILE_LOCKING is not set
> > CONFIG_FS_ENCRYPTION=3Dy
> > CONFIG_FSNOTIFY=3Dy
> > CONFIG_DNOTIFY=3Dy
> > CONFIG_INOTIFY_USER=3Dy
> > # CONFIG_FANOTIFY is not set
> > CONFIG_QUOTA=3Dy
> > CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> > # CONFIG_PRINT_QUOTA_WARNING is not set
> > CONFIG_QUOTA_DEBUG=3Dy
> > CONFIG_QUOTA_TREE=3Dy
> > # CONFIG_QFMT_V1 is not set
> > # CONFIG_QFMT_V2 is not set
> > CONFIG_QUOTACTL=3Dy
> > CONFIG_AUTOFS4_FS=3Dm
> > CONFIG_FUSE_FS=3Dy
> > # CONFIG_CUSE is not set
> > # CONFIG_OVERLAY_FS is not set
> > =

> > #
> > # Caches
> > #
> > CONFIG_FSCACHE=3Dm
> > # CONFIG_FSCACHE_STATS is not set
> > # CONFIG_FSCACHE_HISTOGRAM is not set
> > CONFIG_FSCACHE_DEBUG=3Dy
> > # CONFIG_FSCACHE_OBJECT_LIST is not set
> > CONFIG_CACHEFILES=3Dm
> > CONFIG_CACHEFILES_DEBUG=3Dy
> > # CONFIG_CACHEFILES_HISTOGRAM is not set
> > =

> > #
> > # CD-ROM/DVD Filesystems
> > #
> > CONFIG_ISO9660_FS=3Dy
> > # CONFIG_JOLIET is not set
> > # CONFIG_ZISOFS is not set
> > # CONFIG_UDF_FS is not set
> > =

> > #
> > # DOS/FAT/NT Filesystems
> > #
> > CONFIG_FAT_FS=3Dy
> > CONFIG_MSDOS_FS=3Dm
> > CONFIG_VFAT_FS=3Dy
> > CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> > CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> > CONFIG_FAT_DEFAULT_UTF8=3Dy
> > CONFIG_NTFS_FS=3Dy
> > CONFIG_NTFS_DEBUG=3Dy
> > CONFIG_NTFS_RW=3Dy
> > =

> > #
> > # Pseudo filesystems
> > #
> > CONFIG_PROC_FS=3Dy
> > # CONFIG_PROC_KCORE is not set
> > CONFIG_PROC_SYSCTL=3Dy
> > CONFIG_PROC_PAGE_MONITOR=3Dy
> > CONFIG_PROC_CHILDREN=3Dy
> > CONFIG_KERNFS=3Dy
> > CONFIG_SYSFS=3Dy
> > CONFIG_TMPFS=3Dy
> > # CONFIG_TMPFS_POSIX_ACL is not set
> > # CONFIG_TMPFS_XATTR is not set
> > # CONFIG_HUGETLBFS is not set
> > # CONFIG_HUGETLB_PAGE is not set
> > CONFIG_CONFIGFS_FS=3Dy
> > # CONFIG_MISC_FILESYSTEMS is not set
> > CONFIG_NETWORK_FILESYSTEMS=3Dy
> > CONFIG_NFS_FS=3Dm
> > CONFIG_NFS_V2=3Dm
> > CONFIG_NFS_V3=3Dm
> > # CONFIG_NFS_V3_ACL is not set
> > CONFIG_NFS_V4=3Dm
> > # CONFIG_NFS_SWAP is not set
> > # CONFIG_NFS_V4_1 is not set
> > # CONFIG_NFS_FSCACHE is not set
> > # CONFIG_NFS_USE_LEGACY_DNS is not set
> > CONFIG_NFS_USE_KERNEL_DNS=3Dy
> > # CONFIG_NFSD is not set
> > CONFIG_GRACE_PERIOD=3Dm
> > CONFIG_LOCKD=3Dm
> > CONFIG_LOCKD_V4=3Dy
> > CONFIG_NFS_COMMON=3Dy
> > CONFIG_SUNRPC=3Dm
> > CONFIG_SUNRPC_GSS=3Dm
> > CONFIG_RPCSEC_GSS_KRB5=3Dm
> > # CONFIG_SUNRPC_DEBUG is not set
> > CONFIG_CEPH_FS=3Dy
> > CONFIG_CEPH_FS_POSIX_ACL=3Dy
> > CONFIG_CIFS=3Dm
> > # CONFIG_CIFS_STATS is not set
> > # CONFIG_CIFS_WEAK_PW_HASH is not set
> > CONFIG_CIFS_UPCALL=3Dy
> > # CONFIG_CIFS_XATTR is not set
> > # CONFIG_CIFS_DEBUG is not set
> > # CONFIG_CIFS_DFS_UPCALL is not set
> > CONFIG_CIFS_SMB2=3Dy
> > # CONFIG_CIFS_SMB311 is not set
> > # CONFIG_CIFS_FSCACHE is not set
> > CONFIG_NCP_FS=3Dy
> > # CONFIG_NCPFS_PACKET_SIGNING is not set
> > # CONFIG_NCPFS_IOCTL_LOCKING is not set
> > CONFIG_NCPFS_STRONG=3Dy
> > CONFIG_NCPFS_NFS_NS=3Dy
> > CONFIG_NCPFS_OS2_NS=3Dy
> > # CONFIG_NCPFS_SMALLDOS is not set
> > # CONFIG_NCPFS_NLS is not set
> > # CONFIG_NCPFS_EXTRAS is not set
> > CONFIG_CODA_FS=3Dm
> > # CONFIG_AFS_FS is not set
> > # CONFIG_9P_FS is not set
> > CONFIG_NLS=3Dy
> > CONFIG_NLS_DEFAULT=3D"iso8859-1"
> > CONFIG_NLS_CODEPAGE_437=3Dm
> > CONFIG_NLS_CODEPAGE_737=3Dy
> > CONFIG_NLS_CODEPAGE_775=3Dy
> > # CONFIG_NLS_CODEPAGE_850 is not set
> > # CONFIG_NLS_CODEPAGE_852 is not set
> > CONFIG_NLS_CODEPAGE_855=3Dy
> > CONFIG_NLS_CODEPAGE_857=3Dy
> > CONFIG_NLS_CODEPAGE_860=3Dy
> > # CONFIG_NLS_CODEPAGE_861 is not set
> > # CONFIG_NLS_CODEPAGE_862 is not set
> > CONFIG_NLS_CODEPAGE_863=3Dy
> > CONFIG_NLS_CODEPAGE_864=3Dm
> > CONFIG_NLS_CODEPAGE_865=3Dy
> > # CONFIG_NLS_CODEPAGE_866 is not set
> > CONFIG_NLS_CODEPAGE_869=3Dy
> > CONFIG_NLS_CODEPAGE_936=3Dm
> > CONFIG_NLS_CODEPAGE_950=3Dy
> > # CONFIG_NLS_CODEPAGE_932 is not set
> > CONFIG_NLS_CODEPAGE_949=3Dy
> > CONFIG_NLS_CODEPAGE_874=3Dm
> > CONFIG_NLS_ISO8859_8=3Dm
> > CONFIG_NLS_CODEPAGE_1250=3Dy
> > # CONFIG_NLS_CODEPAGE_1251 is not set
> > CONFIG_NLS_ASCII=3Dm
> > CONFIG_NLS_ISO8859_1=3Dm
> > # CONFIG_NLS_ISO8859_2 is not set
> > CONFIG_NLS_ISO8859_3=3Dy
> > CONFIG_NLS_ISO8859_4=3Dm
> > # CONFIG_NLS_ISO8859_5 is not set
> > # CONFIG_NLS_ISO8859_6 is not set
> > CONFIG_NLS_ISO8859_7=3Dm
> > # CONFIG_NLS_ISO8859_9 is not set
> > CONFIG_NLS_ISO8859_13=3Dm
> > CONFIG_NLS_ISO8859_14=3Dm
> > CONFIG_NLS_ISO8859_15=3Dm
> > CONFIG_NLS_KOI8_R=3Dm
> > # CONFIG_NLS_KOI8_U is not set
> > # CONFIG_NLS_MAC_ROMAN is not set
> > CONFIG_NLS_MAC_CELTIC=3Dm
> > # CONFIG_NLS_MAC_CENTEURO is not set
> > # CONFIG_NLS_MAC_CROATIAN is not set
> > CONFIG_NLS_MAC_CYRILLIC=3Dy
> > # CONFIG_NLS_MAC_GAELIC is not set
> > CONFIG_NLS_MAC_GREEK=3Dm
> > # CONFIG_NLS_MAC_ICELAND is not set
> > CONFIG_NLS_MAC_INUIT=3Dy
> > CONFIG_NLS_MAC_ROMANIAN=3Dm
> > # CONFIG_NLS_MAC_TURKISH is not set
> > # CONFIG_NLS_UTF8 is not set
> > CONFIG_DLM=3Dy
> > CONFIG_DLM_DEBUG=3Dy
> > =

> > #
> > # Kernel hacking
> > #
> > CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> > =

> > #
> > # printk and dmesg options
> > #
> > CONFIG_PRINTK_TIME=3Dy
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> > # CONFIG_BOOT_PRINTK_DELAY is not set
> > # CONFIG_DYNAMIC_DEBUG is not set
> > =

> > #
> > # Compile-time checks and compiler options
> > #
> > # CONFIG_DEBUG_INFO is not set
> > # CONFIG_ENABLE_WARN_DEPRECATED is not set
> > # CONFIG_ENABLE_MUST_CHECK is not set
> > CONFIG_FRAME_WARN=3D1024
> > CONFIG_STRIP_ASM_SYMS=3Dy
> > # CONFIG_READABLE_ASM is not set
> > # CONFIG_UNUSED_SYMBOLS is not set
> > CONFIG_PAGE_OWNER=3Dy
> > CONFIG_DEBUG_FS=3Dy
> > CONFIG_HEADERS_CHECK=3Dy
> > # CONFIG_DEBUG_SECTION_MISMATCH is not set
> > CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> > CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> > CONFIG_FRAME_POINTER=3Dy
> > CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> > CONFIG_MAGIC_SYSRQ=3Dy
> > CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> > CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> > CONFIG_DEBUG_KERNEL=3Dy
> > =

> > #
> > # Memory Debugging
> > #
> > CONFIG_PAGE_EXTENSION=3Dy
> > # CONFIG_DEBUG_PAGEALLOC is not set
> > CONFIG_PAGE_POISONING=3Dy
> > # CONFIG_PAGE_POISONING_NO_SANITY is not set
> > # CONFIG_PAGE_POISONING_ZERO is not set
> > # CONFIG_DEBUG_RODATA_TEST is not set
> > CONFIG_DEBUG_OBJECTS=3Dy
> > # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> > # CONFIG_DEBUG_OBJECTS_FREE is not set
> > CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> > CONFIG_DEBUG_OBJECTS_WORK=3Dy
> > CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> > CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
> > CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > # CONFIG_DEBUG_KMEMLEAK is not set
> > # CONFIG_DEBUG_STACK_USAGE is not set
> > CONFIG_DEBUG_VM=3Dy
> > # CONFIG_DEBUG_VM_VMACACHE is not set
> > CONFIG_DEBUG_VM_RB=3Dy
> > # CONFIG_DEBUG_VM_PGFLAGS is not set
> > CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> > CONFIG_DEBUG_VIRTUAL=3Dy
> > # CONFIG_DEBUG_MEMORY_INIT is not set
> > CONFIG_DEBUG_HIGHMEM=3Dy
> > CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> > CONFIG_DEBUG_STACKOVERFLOW=3Dy
> > CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> > # CONFIG_DEBUG_SHIRQ is not set
> > =

> > #
> > # Debug Lockups and Hangs
> > #
> > # CONFIG_LOCKUP_DETECTOR is not set
> > CONFIG_DETECT_HUNG_TASK=3Dy
> > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> > CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> > CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D1
> > CONFIG_WQ_WATCHDOG=3Dy
> > CONFIG_PANIC_ON_OOPS=3Dy
> > CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > CONFIG_PANIC_TIMEOUT=3D0
> > CONFIG_SCHED_DEBUG=3Dy
> > # CONFIG_SCHED_INFO is not set
> > # CONFIG_SCHEDSTATS is not set
> > # CONFIG_SCHED_STACK_END_CHECK is not set
> > CONFIG_DEBUG_TIMEKEEPING=3Dy
> > CONFIG_DEBUG_PREEMPT=3Dy
> > =

> > #
> > # Lock Debugging (spinlocks, mutexes, etc...)
> > #
> > CONFIG_DEBUG_RT_MUTEXES=3Dy
> > CONFIG_DEBUG_SPINLOCK=3Dy
> > CONFIG_DEBUG_MUTEXES=3Dy
> > CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> > CONFIG_DEBUG_LOCK_ALLOC=3Dy
> > CONFIG_PROVE_LOCKING=3Dy
> > CONFIG_LOCKDEP=3Dy
> > # CONFIG_LOCK_STAT is not set
> > # CONFIG_DEBUG_LOCKDEP is not set
> > CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> > CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> > CONFIG_LOCK_TORTURE_TEST=3Dm
> > # CONFIG_WW_MUTEX_SELFTEST is not set
> > CONFIG_TRACE_IRQFLAGS=3Dy
> > CONFIG_STACKTRACE=3Dy
> > # CONFIG_DEBUG_KOBJECT is not set
> > # CONFIG_DEBUG_KOBJECT_RELEASE is not set
> > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > CONFIG_DEBUG_LIST=3Dy
> > CONFIG_DEBUG_PI_LIST=3Dy
> > CONFIG_DEBUG_SG=3Dy
> > # CONFIG_DEBUG_NOTIFIERS is not set
> > CONFIG_DEBUG_CREDENTIALS=3Dy
> > =

> > #
> > # RCU Debugging
> > #
> > CONFIG_PROVE_RCU=3Dy
> > CONFIG_PROVE_RCU_REPEATEDLY=3Dy
> > # CONFIG_SPARSE_RCU_POINTER is not set
> > CONFIG_TORTURE_TEST=3Dy
> > # CONFIG_RCU_PERF_TEST is not set
> > CONFIG_RCU_TORTURE_TEST=3Dy
> > # CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT is not set
> > # CONFIG_RCU_TORTURE_TEST_SLOW_INIT is not set
> > CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP=3Dy
> > CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP_DELAY=3D3
> > CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> > CONFIG_RCU_TRACE=3Dy
> > # CONFIG_RCU_EQS_DEBUG is not set
> > CONFIG_DEBUG_WQ_FORCE_RR_CPU=3Dy
> > # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> > CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> > CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> > CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=3Dm
> > CONFIG_FAULT_INJECTION=3Dy
> > CONFIG_FAIL_PAGE_ALLOC=3Dy
> > # CONFIG_FAIL_MAKE_REQUEST is not set
> > CONFIG_FAIL_IO_TIMEOUT=3Dy
> > CONFIG_FAIL_FUTEX=3Dy
> > # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
> > # CONFIG_LATENCYTOP is not set
> > CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> > CONFIG_HAVE_FUNCTION_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> > CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> > CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> > CONFIG_TRACE_CLOCK=3Dy
> > CONFIG_TRACING_SUPPORT=3Dy
> > # CONFIG_FTRACE is not set
> > =

> > #
> > # Runtime Testing
> > #
> > # CONFIG_LKDTM is not set
> > # CONFIG_TEST_LIST_SORT is not set
> > # CONFIG_TEST_SORT is not set
> > # CONFIG_KPROBES_SANITY_TEST is not set
> > # CONFIG_BACKTRACE_SELF_TEST is not set
> > # CONFIG_RBTREE_TEST is not set
> > CONFIG_INTERVAL_TREE_TEST=3Dm
> > CONFIG_PERCPU_TEST=3Dm
> > # CONFIG_ATOMIC64_SELFTEST is not set
> > # CONFIG_ASYNC_RAID6_TEST is not set
> > CONFIG_TEST_HEXDUMP=3Dy
> > CONFIG_TEST_STRING_HELPERS=3Dm
> > # CONFIG_TEST_KSTRTOX is not set
> > CONFIG_TEST_PRINTF=3Dm
> > CONFIG_TEST_BITMAP=3Dm
> > CONFIG_TEST_UUID=3Dm
> > CONFIG_TEST_RHASHTABLE=3Dy
> > CONFIG_TEST_HASH=3Dm
> > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > # CONFIG_DMA_API_DEBUG is not set
> > # CONFIG_TEST_LKM is not set
> > CONFIG_TEST_USER_COPY=3Dm
> > CONFIG_TEST_BPF=3Dm
> > CONFIG_TEST_FIRMWARE=3Dy
> > # CONFIG_TEST_UDELAY is not set
> > # CONFIG_MEMTEST is not set
> > CONFIG_TEST_STATIC_KEYS=3Dm
> > # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> > # CONFIG_SAMPLES is not set
> > CONFIG_HAVE_ARCH_KGDB=3Dy
> > # CONFIG_KGDB is not set
> > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> > # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> > CONFIG_UBSAN=3Dy
> > # CONFIG_UBSAN_SANITIZE_ALL is not set
> > # CONFIG_UBSAN_ALIGNMENT is not set
> > CONFIG_UBSAN_NULL=3Dy
> > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> > CONFIG_STRICT_DEVMEM=3Dy
> > # CONFIG_IO_STRICT_DEVMEM is not set
> > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > CONFIG_EARLY_PRINTK=3Dy
> > # CONFIG_EARLY_PRINTK_DBGP is not set
> > CONFIG_X86_PTDUMP_CORE=3Dy
> > CONFIG_X86_PTDUMP=3Dm
> > # CONFIG_DEBUG_WX is not set
> > CONFIG_DOUBLEFAULT=3Dy
> > # CONFIG_DEBUG_TLBFLUSH is not set
> > # CONFIG_IOMMU_STRESS is not set
> > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > # CONFIG_X86_DECODER_SELFTEST is not set
> > CONFIG_IO_DELAY_TYPE_0X80=3D0
> > CONFIG_IO_DELAY_TYPE_0XED=3D1
> > CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> > CONFIG_IO_DELAY_TYPE_NONE=3D3
> > CONFIG_IO_DELAY_0X80=3Dy
> > # CONFIG_IO_DELAY_0XED is not set
> > # CONFIG_IO_DELAY_UDELAY is not set
> > # CONFIG_IO_DELAY_NONE is not set
> > CONFIG_DEFAULT_IO_DELAY_TYPE=3D0
> > CONFIG_DEBUG_BOOT_PARAMS=3Dy
> > # CONFIG_CPA_DEBUG is not set
> > # CONFIG_OPTIMIZE_INLINING is not set
> > CONFIG_DEBUG_ENTRY=3Dy
> > # CONFIG_X86_DEBUG_FPU is not set
> > # CONFIG_PUNIT_ATOM_DEBUG is not set
> > =

> > #
> > # Security options
> > #
> > CONFIG_KEYS=3Dy
> > # CONFIG_PERSISTENT_KEYRINGS is not set
> > # CONFIG_BIG_KEYS is not set
> > CONFIG_TRUSTED_KEYS=3Dm
> > CONFIG_ENCRYPTED_KEYS=3Dm
> > # CONFIG_KEY_DH_OPERATIONS is not set
> > CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> > # CONFIG_SECURITY is not set
> > CONFIG_SECURITYFS=3Dy
> > CONFIG_HAVE_ARCH_HARDENED_USERCOPY=3Dy
> > # CONFIG_STATIC_USERMODEHELPER is not set
> > CONFIG_DEFAULT_SECURITY_DAC=3Dy
> > CONFIG_DEFAULT_SECURITY=3D""
> > CONFIG_XOR_BLOCKS=3Dy
> > CONFIG_ASYNC_CORE=3Dy
> > CONFIG_ASYNC_MEMCPY=3Dy
> > CONFIG_ASYNC_XOR=3Dy
> > CONFIG_ASYNC_PQ=3Dy
> > CONFIG_ASYNC_RAID6_RECOV=3Dy
> > CONFIG_CRYPTO=3Dy
> > =

> > #
> > # Crypto core or helper
> > #
> > CONFIG_CRYPTO_ALGAPI=3Dy
> > CONFIG_CRYPTO_ALGAPI2=3Dy
> > CONFIG_CRYPTO_AEAD=3Dy
> > CONFIG_CRYPTO_AEAD2=3Dy
> > CONFIG_CRYPTO_BLKCIPHER=3Dy
> > CONFIG_CRYPTO_BLKCIPHER2=3Dy
> > CONFIG_CRYPTO_HASH=3Dy
> > CONFIG_CRYPTO_HASH2=3Dy
> > CONFIG_CRYPTO_RNG=3Dy
> > CONFIG_CRYPTO_RNG2=3Dy
> > CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> > CONFIG_CRYPTO_AKCIPHER2=3Dy
> > CONFIG_CRYPTO_AKCIPHER=3Dy
> > CONFIG_CRYPTO_KPP2=3Dy
> > CONFIG_CRYPTO_KPP=3Dy
> > CONFIG_CRYPTO_ACOMP2=3Dy
> > CONFIG_CRYPTO_RSA=3Dy
> > CONFIG_CRYPTO_DH=3Dy
> > # CONFIG_CRYPTO_ECDH is not set
> > CONFIG_CRYPTO_MANAGER=3Dy
> > CONFIG_CRYPTO_MANAGER2=3Dy
> > # CONFIG_CRYPTO_USER is not set
> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> > CONFIG_CRYPTO_GF128MUL=3Dy
> > CONFIG_CRYPTO_NULL=3Dy
> > CONFIG_CRYPTO_NULL2=3Dy
> > CONFIG_CRYPTO_WORKQUEUE=3Dy
> > CONFIG_CRYPTO_CRYPTD=3Dy
> > CONFIG_CRYPTO_MCRYPTD=3Dm
> > CONFIG_CRYPTO_AUTHENC=3Dy
> > # CONFIG_CRYPTO_TEST is not set
> > CONFIG_CRYPTO_ABLK_HELPER=3Dy
> > CONFIG_CRYPTO_SIMD=3Dy
> > CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> > CONFIG_CRYPTO_ENGINE=3Dm
> > =

> > #
> > # Authenticated Encryption with Associated Data
> > #
> > CONFIG_CRYPTO_CCM=3Dm
> > CONFIG_CRYPTO_GCM=3Dm
> > CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> > CONFIG_CRYPTO_SEQIV=3Dy
> > CONFIG_CRYPTO_ECHAINIV=3Dy
> > =

> > #
> > # Block modes
> > #
> > CONFIG_CRYPTO_CBC=3Dy
> > CONFIG_CRYPTO_CTR=3Dy
> > CONFIG_CRYPTO_CTS=3Dy
> > CONFIG_CRYPTO_ECB=3Dy
> > CONFIG_CRYPTO_LRW=3Dy
> > CONFIG_CRYPTO_PCBC=3Dm
> > CONFIG_CRYPTO_XTS=3Dy
> > CONFIG_CRYPTO_KEYWRAP=3Dm
> > =

> > #
> > # Hash modes
> > #
> > CONFIG_CRYPTO_CMAC=3Dy
> > CONFIG_CRYPTO_HMAC=3Dy
> > CONFIG_CRYPTO_XCBC=3Dy
> > # CONFIG_CRYPTO_VMAC is not set
> > =

> > #
> > # Digest
> > #
> > CONFIG_CRYPTO_CRC32C=3Dy
> > CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> > CONFIG_CRYPTO_CRC32=3Dm
> > CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> > CONFIG_CRYPTO_CRCT10DIF=3Dy
> > CONFIG_CRYPTO_GHASH=3Dy
> > CONFIG_CRYPTO_POLY1305=3Dy
> > CONFIG_CRYPTO_MD4=3Dm
> > CONFIG_CRYPTO_MD5=3Dy
> > # CONFIG_CRYPTO_MICHAEL_MIC is not set
> > # CONFIG_CRYPTO_RMD128 is not set
> > CONFIG_CRYPTO_RMD160=3Dy
> > # CONFIG_CRYPTO_RMD256 is not set
> > # CONFIG_CRYPTO_RMD320 is not set
> > CONFIG_CRYPTO_SHA1=3Dy
> > CONFIG_CRYPTO_SHA256=3Dy
> > CONFIG_CRYPTO_SHA512=3Dy
> > # CONFIG_CRYPTO_SHA3 is not set
> > # CONFIG_CRYPTO_TGR192 is not set
> > CONFIG_CRYPTO_WP512=3Dm
> > =

> > #
> > # Ciphers
> > #
> > CONFIG_CRYPTO_AES=3Dy
> > # CONFIG_CRYPTO_AES_TI is not set
> > CONFIG_CRYPTO_AES_586=3Dy
> > CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> > # CONFIG_CRYPTO_ANUBIS is not set
> > CONFIG_CRYPTO_ARC4=3Dy
> > # CONFIG_CRYPTO_BLOWFISH is not set
> > CONFIG_CRYPTO_CAMELLIA=3Dy
> > CONFIG_CRYPTO_CAST_COMMON=3Dm
> > # CONFIG_CRYPTO_CAST5 is not set
> > CONFIG_CRYPTO_CAST6=3Dm
> > CONFIG_CRYPTO_DES=3Dy
> > CONFIG_CRYPTO_FCRYPT=3Dm
> > CONFIG_CRYPTO_KHAZAD=3Dy
> > CONFIG_CRYPTO_SALSA20=3Dy
> > CONFIG_CRYPTO_SALSA20_586=3Dm
> > CONFIG_CRYPTO_CHACHA20=3Dy
> > CONFIG_CRYPTO_SEED=3Dm
> > CONFIG_CRYPTO_SERPENT=3Dy
> > CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> > CONFIG_CRYPTO_TEA=3Dy
> > # CONFIG_CRYPTO_TWOFISH is not set
> > CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
> > CONFIG_CRYPTO_TWOFISH_586=3Dm
> > =

> > #
> > # Compression
> > #
> > CONFIG_CRYPTO_DEFLATE=3Dm
> > # CONFIG_CRYPTO_LZO is not set
> > CONFIG_CRYPTO_842=3Dm
> > # CONFIG_CRYPTO_LZ4 is not set
> > CONFIG_CRYPTO_LZ4HC=3Dm
> > =

> > #
> > # Random Number Generation
> > #
> > CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> > CONFIG_CRYPTO_DRBG_MENU=3Dy
> > CONFIG_CRYPTO_DRBG_HMAC=3Dy
> > # CONFIG_CRYPTO_DRBG_HASH is not set
> > CONFIG_CRYPTO_DRBG_CTR=3Dy
> > CONFIG_CRYPTO_DRBG=3Dy
> > CONFIG_CRYPTO_JITTERENTROPY=3Dy
> > CONFIG_CRYPTO_USER_API=3Dm
> > # CONFIG_CRYPTO_USER_API_HASH is not set
> > CONFIG_CRYPTO_USER_API_SKCIPHER=3Dm
> > CONFIG_CRYPTO_USER_API_RNG=3Dm
> > CONFIG_CRYPTO_USER_API_AEAD=3Dm
> > CONFIG_CRYPTO_HASH_INFO=3Dy
> > CONFIG_CRYPTO_HW=3Dy
> > CONFIG_CRYPTO_DEV_PADLOCK=3Dm
> > # CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
> > # CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
> > # CONFIG_CRYPTO_DEV_GEODE is not set
> > # CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
> > # CONFIG_CRYPTO_DEV_CCP is not set
> > # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> > # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> > # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> > # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> > # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> > # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> > CONFIG_CRYPTO_DEV_VIRTIO=3Dm
> > CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> > CONFIG_X509_CERTIFICATE_PARSER=3Dy
> > CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> > =

> > #
> > # Certificates for signature checking
> > #
> > CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> > CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> > CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
> > CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
> > # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> > CONFIG_HAVE_KVM=3Dy
> > CONFIG_VIRTUALIZATION=3Dy
> > # CONFIG_KVM is not set
> > # CONFIG_VHOST_NET is not set
> > CONFIG_VHOST_SCSI=3Dm
> > CONFIG_VHOST_VSOCK=3Dm
> > CONFIG_VHOST=3Dm
> > CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> > # CONFIG_LGUEST is not set
> > # CONFIG_BINARY_PRINTF is not set
> > =

> > #
> > # Library routines
> > #
> > CONFIG_RAID6_PQ=3Dy
> > CONFIG_BITREVERSE=3Dy
> > # CONFIG_HAVE_ARCH_BITREVERSE is not set
> > CONFIG_RATIONAL=3Dy
> > CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> > CONFIG_GENERIC_STRNLEN_USER=3Dy
> > CONFIG_GENERIC_NET_UTILS=3Dy
> > CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> > CONFIG_GENERIC_PCI_IOMAP=3Dy
> > CONFIG_GENERIC_IOMAP=3Dy
> > CONFIG_GENERIC_IO=3Dy
> > CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> > CONFIG_CRC_CCITT=3Dy
> > CONFIG_CRC16=3Dy
> > CONFIG_CRC_T10DIF=3Dy
> > # CONFIG_CRC_ITU_T is not set
> > CONFIG_CRC32=3Dy
> > # CONFIG_CRC32_SELFTEST is not set
> > CONFIG_CRC32_SLICEBY8=3Dy
> > # CONFIG_CRC32_SLICEBY4 is not set
> > # CONFIG_CRC32_SARWATE is not set
> > # CONFIG_CRC32_BIT is not set
> > CONFIG_CRC7=3Dm
> > CONFIG_LIBCRC32C=3Dy
> > CONFIG_CRC8=3Dm
> > # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> > CONFIG_RANDOM32_SELFTEST=3Dy
> > CONFIG_842_COMPRESS=3Dm
> > CONFIG_842_DECOMPRESS=3Dm
> > CONFIG_ZLIB_INFLATE=3Dy
> > CONFIG_ZLIB_DEFLATE=3Dy
> > CONFIG_LZO_COMPRESS=3Dy
> > CONFIG_LZO_DECOMPRESS=3Dy
> > CONFIG_LZ4HC_COMPRESS=3Dm
> > CONFIG_LZ4_DECOMPRESS=3Dm
> > # CONFIG_XZ_DEC is not set
> > # CONFIG_XZ_DEC_BCJ is not set
> > CONFIG_DECOMPRESS_GZIP=3Dy
> > CONFIG_DECOMPRESS_LZMA=3Dy
> > CONFIG_GENERIC_ALLOCATOR=3Dy
> > CONFIG_INTERVAL_TREE=3Dy
> > CONFIG_RADIX_TREE_MULTIORDER=3Dy
> > CONFIG_ASSOCIATIVE_ARRAY=3Dy
> > CONFIG_HAS_IOMEM=3Dy
> > CONFIG_HAS_IOPORT_MAP=3Dy
> > CONFIG_HAS_DMA=3Dy
> > # CONFIG_DMA_NOOP_OPS is not set
> > # CONFIG_DMA_VIRT_OPS is not set
> > CONFIG_CHECK_SIGNATURE=3Dy
> > CONFIG_DQL=3Dy
> > CONFIG_GLOB=3Dy
> > CONFIG_GLOB_SELFTEST=3Dy
> > CONFIG_NLATTR=3Dy
> > CONFIG_CLZ_TAB=3Dy
> > # CONFIG_CORDIC is not set
> > CONFIG_DDR=3Dy
> > CONFIG_IRQ_POLL=3Dy
> > CONFIG_MPILIB=3Dy
> > CONFIG_OID_REGISTRY=3Dy
> > # CONFIG_SG_SPLIT is not set
> > CONFIG_SG_POOL=3Dy
> > CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> > CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy
> > CONFIG_STACKDEPOT=3Dy
> > CONFIG_SBITMAP=3Dy
> =

> -- =

> Jan Kara <jack@suse.com>
> SUSE Labs, CR
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============6395676705956821076==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="debug.diff"

ZGlmZiAtLWdpdCBhL2Jsb2NrL2dlbmhkLmMgYi9ibG9jay9nZW5oZC5jCmluZGV4IGIyNmE1ZWEx
MTVkMC4uZDA2YmE3ZTczMWE0IDEwMDY0NAotLS0gYS9ibG9jay9nZW5oZC5jCisrKyBiL2Jsb2Nr
L2dlbmhkLmMKQEAgLTY2Miw2ICs2NjIsNyBAQCB2b2lkIGRlbF9nZW5kaXNrKHN0cnVjdCBnZW5k
aXNrICpkaXNrKQogCXN0cnVjdCBkaXNrX3BhcnRfaXRlciBwaXRlcjsKIAlzdHJ1Y3QgaGRfc3Ry
dWN0ICpwYXJ0OwogCisJV0FSTl9PTighKGRpc2stPmZsYWdzICYgR0VOSERfRkxfVVApKTsKIAli
bGtfaW50ZWdyaXR5X2RlbChkaXNrKTsKIAlkaXNrX2RlbF9ldmVudHMoZGlzayk7CiAKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc2NzaS9zY3NpX3NjYW4uYyBiL2RyaXZlcnMvc2NzaS9zY3NpX3NjYW4u
YwppbmRleCA2ZjcxMjhmNDljMzAuLjdkOTg3ZGNiOGZlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
Y3NpL3Njc2lfc2Nhbi5jCisrKyBiL2RyaXZlcnMvc2NzaS9zY3NpX3NjYW4uYwpAQCAtMTA3Myw2
ICsxMDczLDcgQEAgc3RhdGljIGludCBzY3NpX3Byb2JlX2FuZF9hZGRfbHVuKHN0cnVjdCBzY3Np
X3RhcmdldCAqc3RhcmdldCwKIAkgKi8KIAlzZGV2ID0gc2NzaV9kZXZpY2VfbG9va3VwX2J5X3Rh
cmdldChzdGFyZ2V0LCBsdW4pOwogCWlmIChzZGV2KSB7CisJCXByaW50aygiUmV1c2luZyBzZGV2
ICVwXG4iLCBzZGV2KTsKIAkJaWYgKHJlc2NhbiAhPSBTQ1NJX1NDQU5fSU5JVElBTCB8fCAhc2Nz
aV9kZXZpY2VfY3JlYXRlZChzZGV2KSkgewogCQkJU0NTSV9MT0dfU0NBTl9CVVMoMywgc2Rldl9w
cmludGsoS0VSTl9JTkZPLCBzZGV2LAogCQkJCSJzY3NpIHNjYW46IGRldmljZSBleGlzdHMgb24g
JXNcbiIsCkBAIC0xMDg5LDggKzEwOTAsMTAgQEAgc3RhdGljIGludCBzY3NpX3Byb2JlX2FuZF9h
ZGRfbHVuKHN0cnVjdCBzY3NpX3RhcmdldCAqc3RhcmdldCwKIAkJCXJldHVybiBTQ1NJX1NDQU5f
TFVOX1BSRVNFTlQ7CiAJCX0KIAkJc2NzaV9kZXZpY2VfcHV0KHNkZXYpOwotCX0gZWxzZQorCX0g
ZWxzZSB7CiAJCXNkZXYgPSBzY3NpX2FsbG9jX3NkZXYoc3RhcmdldCwgbHVuLCBob3N0ZGF0YSk7
CisJCXByaW50aygiQ3JlYXRlZCBzZGV2ICVwXG4iLCBzZGV2KTsKKwl9CiAJaWYgKCFzZGV2KQog
CQlnb3RvIG91dDsKIApkaWZmIC0tZ2l0IGEvbW0vYmFja2luZy1kZXYuYyBiL21tL2JhY2tpbmct
ZGV2LmMKaW5kZXggNmQ4NjFkMDkwZTlmLi42YzE3MjA5OWFhMjMgMTAwNjQ0Ci0tLSBhL21tL2Jh
Y2tpbmctZGV2LmMKKysrIGIvbW0vYmFja2luZy1kZXYuYwpAQCAtNDk2LDYgKzQ5Niw3IEBAIHN0
YXRpYyB2b2lkIGNnd2JfcmVsZWFzZV93b3JrZm4oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQog
CXdiX2V4aXQod2IpOwogCWtmcmVlX3JjdSh3YiwgcmN1KTsKIAorCXByaW50aygiQ0dXQiByZWxl
YXNlISAlcFxuIiwgYmRpKTsKIAlpZiAoYXRvbWljX2RlY19hbmRfdGVzdCgmYmRpLT51c2FnZV9j
bnQpKQogCQl3YWtlX3VwX2FsbCgmY2d3Yl9yZWxlYXNlX3dhaXQpOwogfQpAQCAtNjY4LDYgKzY2
OSw3IEBAIHN0YXRpYyBpbnQgY2d3Yl9iZGlfaW5pdChzdHJ1Y3QgYmFja2luZ19kZXZfaW5mbyAq
YmRpKQogewogCWludCByZXQ7CiAKKwlwcmludGsoIkNHV0IgaW5pdCAlcFxuIiwgYmRpKTsKIAlJ
TklUX1JBRElYX1RSRUUoJmJkaS0+Y2d3Yl90cmVlLCBHRlBfQVRPTUlDKTsKIAliZGktPmNnd2Jf
Y29uZ2VzdGVkX3RyZWUgPSBSQl9ST09UOwogCWF0b21pY19zZXQoJmJkaS0+dXNhZ2VfY250LCAx
KTsKQEAgLTcwOSw2ICs3MTEsNyBAQCBzdGF0aWMgdm9pZCBjZ3diX2JkaV9kZXN0cm95KHN0cnVj
dCBiYWNraW5nX2Rldl9pbmZvICpiZGkpCiAJICogYWxsIGNnd2IncyBhbmQgY2d3Yl9jb25nZXN0
ZWQncyBldmVyIGNyZWF0ZWQgb24gQGJkaS4KIAkgKi8KIAlhdG9taWNfZGVjKCZiZGktPnVzYWdl
X2NudCk7CisJcHJpbnRrKCJDR1dCICVwIHVzYWdlX2NudDogJXVcbiIsIGJkaSwgYXRvbWljX3Jl
YWQoJmJkaS0+dXNhZ2VfY250KSk7CiAJd2FpdF9ldmVudChjZ3diX3JlbGVhc2Vfd2FpdCwgIWF0
b21pY19yZWFkKCZiZGktPnVzYWdlX2NudCkpOwogfQogCkBAIC04NzcsMTAgKzg4MCwxNSBAQCBz
dGF0aWMgdm9pZCBiZGlfcmVtb3ZlX2Zyb21fbGlzdChzdHJ1Y3QgYmFja2luZ19kZXZfaW5mbyAq
YmRpKQogCiB2b2lkIGJkaV91bnJlZ2lzdGVyKHN0cnVjdCBiYWNraW5nX2Rldl9pbmZvICpiZGkp
CiB7CisJV0FSTl9PTighdGVzdF9iaXQoV0JfcmVnaXN0ZXJlZCwgJmJkaS0+d2Iuc3RhdGUpKTsK
IAkvKiBtYWtlIHN1cmUgbm9ib2R5IGZpbmRzIHVzIG9uIHRoZSBiZGlfbGlzdCBhbnltb3JlICov
CisJcHJpbnRrKCJVbnJlZzFcbiIpOwogCWJkaV9yZW1vdmVfZnJvbV9saXN0KGJkaSk7CisJcHJp
bnRrKCJVbnJlZzJcbiIpOwogCXdiX3NodXRkb3duKCZiZGktPndiKTsKKwlwcmludGsoIlVucmVn
M1xuIik7CiAJY2d3Yl9iZGlfZGVzdHJveShiZGkpOworCXByaW50aygiVW5yZWc0XG4iKTsKIAog
CWlmIChiZGktPmRldikgewogCQliZGlfZGVidWdfdW5yZWdpc3RlcihiZGkpOwo=

--===============6395676705956821076==--

