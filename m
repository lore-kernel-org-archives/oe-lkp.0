Content-Type: multipart/mixed; boundary="===============1400357851309368865=="
MIME-Version: 1.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: lkp@lists.01.org
Subject: Re: [pipe] 8cefc107ca: BUG:KASAN:slab-out-of-bounds_in_iov_iter_alignment #forregzbot
Date: Tue, 20 Sep 2022 14:25:14 +0200
Message-ID: <a0d08409-6f68-c991-5b56-1af087a03a07@leemhuis.info>
In-Reply-To: <bc0089a3-1e80-f46c-7ec6-577019e34d11@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1400357851309368865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

As per recent general discussions with the 0-day folks, I'm dropping
below regression report from the list of tracked issues, as this report
didn't gain any traction. That for example can happen if the developers
considered the regression of no practical relevance, as they assume it
only materializes in micro-benchmarks, is due to a broken test case, or
some fluke =E2=80=93 and then they often not even reply.

Not sure if that or something else is the reason why this particular
report didn't gain any traction, but I lack the bandwidth to follow-up
on each and every performace regression 0-day bot found and reported. At
the same time I don't want to keep these reports in the list of tracked
issues forever, as that creates noise and makes it harder to spot the
important issues in regzbot's reports and lists. That's why I hereby
remove it:

#regzbot invalid: report from 0-day that didn't get traction; likely of
no relevance, not totally sure

Ciao, Thorsten

On 31.08.22 05:27, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-11):
> =

> commit: 8cefc107ca54c8b06438b7dc9cc08bc0a11d5b98 ("pipe: Use head and
> tail pointers for the ring, not cursor and length")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: xfstests
> version: xfstests-x86_64-c1144bf-1_20220808
> with following parameters:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0disk: 6HDD
> =C2=A0=C2=A0=C2=A0=C2=A0fs: btrfs
> =C2=A0=C2=A0=C2=A0=C2=A0test: btrfs-group-21
> =

> test-description: xfstests is a regression test suite for xfs and other
> files ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @
> 3.40GHz (Haswell) with 8G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> [=C2=A0=C2=A0 94.464594][ T8860] BTRFS: device fsid
> 69c7bcba-33c9-484e-9d7e-7441a9dda3c6 devid 1 transid 5 /dev/loop0
> [=C2=A0=C2=A0 94.484786][T10999] BTRFS info (device loop0): disk space ca=
ching is
> enabled
> [=C2=A0=C2=A0 94.492786][T10999] BTRFS info (device loop0): has skinny ex=
tents
> [=C2=A0=C2=A0 94.499803][T10999] BTRFS info (device loop0): flagging fs w=
ith big
> metadata feature
> [=C2=A0=C2=A0 94.513599][T10999] BTRFS info (device loop0): enabling ssd
> optimizations
> [=C2=A0=C2=A0 94.521806][T10999] BTRFS info (device loop0): checking UUID=
 tree
> [=C2=A0=C2=A0 94.707069][ T9438] BTRFS: device fsid
> 69c7bcba-33c9-484e-9d7e-7441a9dda3c6 devid 1 transid 7 /dev/loop0
> [=C2=A0=C2=A0 94.750396][T11032]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=C2=A0=C2=A0 94.759245][T11032] BUG: KASAN: slab-out-of-bounds in
> iov_iter_alignment+0x493/0x600
> [=C2=A0=C2=A0 94.767978][T11032] Read of size 4 at addr ffff8882171847c0 =
by task
> loop0/11032
> [=C2=A0=C2=A0 94.776222][T11032]
> [=C2=A0=C2=A0 94.779325][T11032] CPU: 2 PID: 11032 Comm: loop0 Not tainted
> 5.4.0-rc2-00004-g8cefc107ca54c #1
> [=C2=A0=C2=A0 94.788997][T11032] Hardware name: Dell Inc. OptiPlex 9020/0=
DNKMN,
> BIOS A05 12/05/2013
> [=C2=A0=C2=A0 94.797908][T11032] Call Trace:
> [=C2=A0=C2=A0 94.802003][T11032]=C2=A0 dump_stack+0x5b/0xa0
> [=C2=A0=C2=A0 94.806977][T11032]=C2=A0 print_address_description+0x1f/0x2=
80
> [=C2=A0=C2=A0 94.814376][T11032]=C2=A0 __kasan_report.cold+0x7a/0xd4
> [=C2=A0=C2=A0 94.820115][T11032]=C2=A0 ? generic_file_buffered_read+0xdc0=
/0x1ac0
> [=C2=A0=C2=A0 94.826908][T11032]=C2=A0 ? iov_iter_alignment+0x493/0x600
> [=C2=A0=C2=A0 94.832893][T11032]=C2=A0 kasan_report+0xe/0x12
> [=C2=A0=C2=A0 94.837903][T11032]=C2=A0 iov_iter_alignment+0x493/0x600
> [=C2=A0=C2=A0 94.843756][T11032]=C2=A0 ? current_time+0x72/0x240
> [=C2=A0=C2=A0 94.849117][T11032]=C2=A0 btrfs_direct_IO+0x1df/0xa40 [btrfs]
> [=C2=A0=C2=A0 94.855360][T11032]=C2=A0 ? atime_needs_update+0x1d0/0x540
> [=C2=A0=C2=A0 94.861285][T11032]=C2=A0 ? may_destroy_subvol+0x580/0x580 [=
btrfs]
> [=C2=A0=C2=A0 94.867889][T11032]=C2=A0 ? touch_atime+0xcb/0x280
> [=C2=A0=C2=A0 94.873096][T11032]=C2=A0 ? filemap_check_errors+0x50/0x100
> [=C2=A0=C2=A0 94.879106][T11032]=C2=A0 generic_file_read_iter+0x1e8/0x480
> [=C2=A0=C2=A0 94.885189][T11032]=C2=A0 lo_rw_aio+0x9e2/0xe80 [loop]
> [=C2=A0=C2=A0 94.890755][T11032]=C2=A0 ? __switch_to_asm+0x40/0x70
> [=C2=A0=C2=A0 94.896227][T11032]=C2=A0 ? __switch_to_asm+0x34/0x70
> [=C2=A0=C2=A0 94.901722][T11032]=C2=A0 ? __switch_to_asm+0x40/0x70
> [=C2=A0=C2=A0 94.907179][T11032]=C2=A0 ? lo_read_simple+0x640/0x640 [loop]
> [=C2=A0=C2=A0 94.913307][T11032]=C2=A0 ? __switch_to_asm+0x40/0x70
> [=C2=A0=C2=A0 94.918775][T11032]=C2=A0 ? __switch_to_asm+0x34/0x70
> [=C2=A0=C2=A0 94.924237][T11032]=C2=A0 ? __switch_to_asm+0x40/0x70
> [=C2=A0=C2=A0 94.929681][T11032]=C2=A0 ? __switch_to_asm+0x40/0x70
> [=C2=A0=C2=A0 94.935123][T11032]=C2=A0 ? __switch_to_asm+0x34/0x70
> [=C2=A0=C2=A0 94.940538][T11032]=C2=A0 ? __switch_to_asm+0x40/0x70
> [=C2=A0=C2=A0 94.945943][T11032]=C2=A0 ? __switch_to_asm+0x34/0x70
> [=C2=A0=C2=A0 94.951303][T11032]=C2=A0 ? __switch_to_asm+0x40/0x70
> [=C2=A0=C2=A0 94.956692][T11032]=C2=A0 ? __switch_to_asm+0x34/0x70
> [=C2=A0=C2=A0 94.962079][T11032]=C2=A0 ? __switch_to_asm+0x40/0x70
> [=C2=A0=C2=A0 94.967432][T11032]=C2=A0 ? __switch_to_asm+0x34/0x70
> [=C2=A0=C2=A0 94.972796][T11032]=C2=A0 ? kthread_worker_fn+0x212/0x700
> [=C2=A0=C2=A0 94.978434][T11032]=C2=A0 do_req_filebacked+0x6d6/0x940 [loo=
p]
> [=C2=A0=C2=A0 94.984557][T11032]=C2=A0 ? __switch_to_asm+0x34/0x70
> [=C2=A0=C2=A0 94.989908][T11032]=C2=A0 ? __schedule+0x5de/0x1180
> [=C2=A0=C2=A0 94.995042][T11032]=C2=A0 ? lo_read_transfer+0x740/0x740 [lo=
op]
> [=C2=A0=C2=A0 95.001159][T11032]=C2=A0 ? io_schedule_timeout+0x180/0x180
> [=C2=A0=C2=A0 95.006991][T11032]=C2=A0 ? _raw_spin_lock_irq+0x82/0xd2
> [=C2=A0=C2=A0 95.012577][T11032]=C2=A0 ? kthread_worker_fn+0x212/0x700
> [=C2=A0=C2=A0 95.018174][T11032]=C2=A0 loop_queue_work+0xd0/0x200 [loop]
> [=C2=A0=C2=A0 95.024000][T11032]=C2=A0 kthread_worker_fn+0x195/0x700
> [=C2=A0=C2=A0 95.029411][T11032]=C2=A0 ? __wake_up_common+0x110/0x600
> [=C2=A0=C2=A0 95.034946][T11032]=C2=A0 ? kthread_destroy_worker+0xc0/0xc0
> [=C2=A0=C2=A0 95.040797][T11032]=C2=A0 ? __kthread_parkme+0xbd/0x1c0
> [=C2=A0=C2=A0 95.046169][T11032]=C2=A0 ? loop_info64_to_compat+0x6c0/0x6c=
0 [loop]
> [=C2=A0=C2=A0 95.052699][T11032]=C2=A0 kthread+0x337/0x440
> [=C2=A0=C2=A0 95.057216][T11032]=C2=A0 ? __kthread_bind_mask+0xc0/0xc0
> [=C2=A0=C2=A0 95.062765][T11032]=C2=A0 ret_from_fork+0x35/0x40
> [=C2=A0=C2=A0 95.067602][T11032]
> [=C2=A0=C2=A0 95.070314][T11032] Allocated by task 9438:
> [=C2=A0=C2=A0 95.075030][T11032]=C2=A0 save_stack+0x1b/0x80
> [=C2=A0=C2=A0 95.079589][T11032]=C2=A0 __kasan_kmalloc+0xc2/0x100
> [=C2=A0=C2=A0 95.085713][T11032]=C2=A0 kmem_cache_alloc+0xb8/0x240
> [=C2=A0=C2=A0 95.090888][T11032]=C2=A0 mempool_alloc+0x103/0x300
> [=C2=A0=C2=A0 95.095912][T11032]=C2=A0 bio_alloc_bioset+0x198/0x4c0
> [=C2=A0=C2=A0 95.101168][T11032]=C2=A0 mpage_alloc+0x30/0x240
> [=C2=A0=C2=A0 95.105893][T11032]=C2=A0 do_mpage_readpage+0x1081/0x1d40
> [=C2=A0=C2=A0 95.111397][T11032]=C2=A0 mpage_readpages+0x23f/0x500
> [=C2=A0=C2=A0 95.116560][T11032]=C2=A0 read_pages+0x102/0x500
> [=C2=A0=C2=A0 95.121892][T11032]=C2=A0 __do_page_cache_readahead+0x316/0x=
3c0
> [=C2=A0=C2=A0 95.127928][T11032]=C2=A0 force_page_cache_readahead+0x19a/0=
x300
> [=C2=A0=C2=A0 95.134015][T11032]=C2=A0 generic_file_buffered_read+0x7e6/0=
x1ac0
> [=C2=A0=C2=A0 95.140188][T11032]=C2=A0 new_sync_read+0x3f1/0x700
> [=C2=A0=C2=A0 95.145180][T11032]=C2=A0 vfs_read+0x14e/0x340
> [=C2=A0=C2=A0 95.149733][T11032]=C2=A0 ksys_read+0xed/0x1c0
> [=C2=A0=C2=A0 95.154260][T11032]=C2=A0 do_syscall_64+0x9a/0x1c0
> [=C2=A0=C2=A0 95.159137][T11032]=C2=A0 entry_SYSCALL_64_after_hwframe+0x4=
4/0xa9
> [=C2=A0=C2=A0 95.165412][T11032]
> [=C2=A0=C2=A0 95.168118][T11032] Freed by task 0:
> [=C2=A0=C2=A0 95.172227][T11032]=C2=A0 save_stack+0x1b/0x80
> [=C2=A0=C2=A0 95.176815][T11032]=C2=A0 __kasan_slab_free+0x12e/0x180
> [=C2=A0=C2=A0 95.182158][T11032]=C2=A0 kmem_cache_free+0x8a/0x300
> [=C2=A0=C2=A0 95.187288][T11032]=C2=A0 blk_update_request+0x2c2/0x1000
> [=C2=A0=C2=A0 95.192862][T11032]=C2=A0 scsi_end_request+0x70/0x480
> [=C2=A0=C2=A0 95.198075][T11032]=C2=A0 scsi_io_completion+0x175/0x3c0
> [=C2=A0=C2=A0 95.203573][T11032]=C2=A0 blk_done_softirq+0x218/0x340
> [=C2=A0=C2=A0 95.208932][T11032]=C2=A0 __do_softirq+0x1ac/0x6ff
> [=C2=A0=C2=A0 95.213925][T11032]
> [=C2=A0=C2=A0 95.216756][T11032] The buggy address belongs to the object =
at
> ffff888217184700
> [=C2=A0=C2=A0 95.216756][T11032]=C2=A0 which belongs to the cache bio-0 o=
f size 192
> [=C2=A0=C2=A0 95.231456][T11032] The buggy address is located 0 bytes to =
the right of
> [=C2=A0=C2=A0 95.231456][T11032]=C2=A0 192-byte region [ffff888217184700,
> ffff8882171847c0)
> [=C2=A0=C2=A0 95.246252][T11032] The buggy address belongs to the page:
> [=C2=A0=C2=A0 95.252390][T11032] page:ffffea00085c6100 refcount:1 mapcoun=
t:0
> mapping:ffff8881a778e000 index:0x0 compound_mapcount: 0
> [=C2=A0=C2=A0 95.263922][T11032] flags: 0x17ffffc0010200(slab|head)
> [=C2=A0=C2=A0 95.269787][T11032] raw: 0017ffffc0010200 0000000000000000
> 0000000100000001 ffff8881a778e000
> [=C2=A0=C2=A0 95.278978][T11032] raw: 0000000000000000 0000000080200020
> 00000001ffffffff 0000000000000000
> [=C2=A0=C2=A0 95.288164][T11032] page dumped because: kasan: bad access d=
etected
> [=C2=A0=C2=A0 95.295190][T11032]
> [=C2=A0=C2=A0 95.298132][T11032] Memory state around the buggy address:
> [=C2=A0=C2=A0 95.304350][T11032]=C2=A0 ffff888217184680: fb fb fb fb fb f=
b fb fb fc fc
> fc fc fc fc fc fc
> [=C2=A0=C2=A0 95.313069][T11032]=C2=A0 ffff888217184700: 00 00 00 00 00 0=
0 00 00 00 00
> 00 00 00 00 00 00
> [=C2=A0=C2=A0 95.321773][T11032] >ffff888217184780: 00 00 00 00 00 00 00 =
00 fc fc
> fc fc fc fc fc fc
> [=C2=A0=C2=A0 95.330449][T11032]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> [=C2=A0=C2=A0 95.337238][T11032]=C2=A0 ffff888217184800: fb fb fb fb fb f=
b fb fb fb fb
> fb fb fb fb fb fb
> [=C2=A0=C2=A0 95.345956][T11032]=C2=A0 ffff888217184880: fb fb fb fb fb f=
b fb fb fc fc
> fc fc fc fc fc fc
> [=C2=A0=C2=A0 95.354680][T11032]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=C2=A0=C2=A0 95.363378][T11032] Disabling lock debugging due to kernel t=
aint
> [=C2=A0=C2=A0 95.376123][T11041] BTRFS info (device loop0): disk space ca=
ching is
> enabled
> [=C2=A0=C2=A0 95.384125][T11041] BTRFS info (device loop0): has skinny ex=
tents
> [=C2=A0=C2=A0 95.403358][T11041] BTRFS info (device loop0): enabling ssd
> optimizations
> [=C2=A0=C2=A0 95.551044][T11069] BTRFS info (device loop1): disk space ca=
ching is
> enabled
> [=C2=A0=C2=A0 95.558972][T11069] BTRFS info (device loop1): has skinny ex=
tents
> [=C2=A0=C2=A0 95.565934][T11069] BTRFS info (device loop1): flagging fs w=
ith big
> metadata feature
> [=C2=A0=C2=A0 95.579741][T11069] BTRFS info (device loop1): enabling ssd
> optimizations
> [=C2=A0=C2=A0 95.587894][T11069] BTRFS info (device loop1): checking UUID=
 tree
> [=C2=A0=C2=A0 95.813369][T11103] BTRFS info (device loop0): disk space ca=
ching is
> enabled
> [=C2=A0=C2=A0 95.821286][T11103] BTRFS info (device loop0): has skinny ex=
tents
> [=C2=A0=C2=A0 95.834962][T11103] BTRFS info (device loop0): enabling ssd
> optimizations
> [=C2=A0=C2=A0 95.951085][T11132] BTRFS: device fsid
> 69c7bcba-33c9-484e-9d7e-7441a9dda3c6 devid 1 transid 9 /dev/loop0
> [=C2=A0=C2=A0 95.971297][T11132] BTRFS info (device loop0): disk space ca=
ching is
> enabled
> [=C2=A0=C2=A0 95.979241][T11132] BTRFS info (device loop0): has skinny ex=
tents
> [=C2=A0=C2=A0 95.992721][T11132] BTRFS info (device loop0): enabling ssd
> optimizations
> [=C2=A0=C2=A0 96.020891][ T9438] BTRFS warning (device loop0): duplicate =
device
> fsid:devid for 69c7bcba-33c9-484e-9d7e-7441a9dda3c6:1 old:/dev/loop0
> new:/dev/loop1
> [=C2=A0=C2=A0 96.036297][T11157] BTRFS warning (device loop0): duplicate =
device
> fsid:devid for 69c7bcba-33c9-484e-9d7e-7441a9dda3c6:1 old:/dev/loop0
> new:/dev/loop1
> [=C2=A0=C2=A0 96.176083][T11159] BTRFS: device fsid
> a03b6786-417c-4664-b28f-f1992a86ad7c devid 1 transid 7 /dev/sda2
> [=C2=A0=C2=A0 96.502141][T11186] BTRFS info (device sdb1): disk space cac=
hing is
> enabled
> [=C2=A0=C2=A0 96.510169][T11186] BTRFS info (device sdb1): has skinny ext=
ents
> [=C2=A0=C2=A0 96.550613][=C2=A0 T422] btrfs/219=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 _check_dmesg: something found in
> dmesg (see /lkp/benchmarks/xfstests/results//btrfs/219.dmesg)
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/disk/fs/test:
> =C2=A0
> lkp-hsw-d01/xfstests/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3-func=
/gcc-11/6HDD/btrfs/btrfs-group-21
> =

> commit:
> =C2=A0 f94df9890e98f2 ("Add wake_up_interruptible_sync_poll_locked()")
> =C2=A0 8cefc107ca54c8 ("pipe: Use head and tail pointers for the ring, not
> cursor and length")
> =

> f94df9890e98f209 8cefc107ca54c8b06438b7dc9cc
> ---------------- ---------------------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=C2=A0=
=C2=A0=C2=A0 fail:runs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :12=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 12:12=C2=A0=C2=A0=C2=A0 xfstests.btrfs.219.fail
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :12=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 92%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11:12=C2=A0=C2=A0=C2=A0
> dmesg.BUG:KASAN:slab-out-of-bounds_in_iov_iter_alignment
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <yujie.liu@intel.com>
> =

> =

> To reproduce:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com/i=
ntel/lkp-tests.git
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp install job.yaml=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # job file is =
attached
> in this email
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --compatible=
 job.yaml # generate the yaml file
> for lkp run
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp run generated-yam=
l-file
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any failure t=
hat blocks the test,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.lkp and /lk=
p dir to run from a clean state.
> =

> =

> #regzbot introduced: 8cefc107ca
>=20
--===============1400357851309368865==--

