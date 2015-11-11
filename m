Content-Type: multipart/mixed; boundary="===============8518755734107431408=="
MIME-Version: 1.0
From: Jens Axboe <axboe@fb.com>
To: lkp@lists.01.org
Subject: Re: [directio] 15c4f638f3: WARNING: CPU: 3 PID: 8363 at kernel/sched/core.c:7533 __might_sleep+0x9f/0xb0()
Date: Wed, 11 Nov 2015 08:44:09 -0700
Message-ID: <56436249.1080004@fb.com>
In-Reply-To: <87mvulm7qy.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8518755734107431408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/10/2015 10:21 PM, kernel test robot wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 15c4f638f3d41bae52105ca4c0c8760afbcbeaab ("directio: add block pol=
ling support")
>
>
> +-------------------------------------------------+------------+---------=
---+
> |                                                 | a0fa9647a5 | 15c4f638=
f3 |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 16         | 17      =
   |
> | boot_failures                                   | 0          | 12      =
   |
> | WARNING:at_kernel/sched/core.c:#__might_sleep() | 0          | 11      =
   |
> | backtrace:vfs_read                              | 0          | 3       =
   |
> | backtrace:SyS_read                              | 0          | 3       =
   |
> | BUG:kernel_test_crashed                         | 0          | 1       =
   |
> +-------------------------------------------------+------------+---------=
---+
>
>
> [   32.952193] BTRFS: creating UUID tree
> [   53.739325] random: nonblocking pool is initialized
> [  151.793376] ------------[ cut here ]------------
> [  151.794683] WARNING: CPU: 3 PID: 8363 at kernel/sched/core.c:7533 __mi=
ght_sleep+0x9f/0xb0()
> [  151.796521] do not call blocking ops when !TASK_RUNNING; state=3D2 set=
 at [<ffffffff8122522b>] do_blockdev_direct_IO+0x126b/0x2c20
> [  151.798498] Modules linked in: btrfs xor raid6_pq dm_mod rpcsec_gss_kr=
b5 auth_rpcgss nfsv4 dns_resolver sg sr_mod cdrom ata_generic pata_acpi ppd=
ev snd_pcm snd_timer snd soundcore serio_raw pcspkr parport_pc parport flop=
py acpi_cpufreq ata_piix libata i2c_piix4
> [  151.804351] CPU: 3 PID: 8363 Comm: dd Not tainted 4.3.0-06686-g15c4f63=
 #1
> [  151.805524] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [  151.806800] ------------[ cut here ]------------
> [  151.806820] WARNING: CPU: 0 PID: 8412 at kernel/sched/core.c:7533 __mi=
ght_sleep+0x9f/0xb0()
> [  151.806824] do not call blocking ops when !TASK_RUNNING; state=3D2 set=
 at [<ffffffff8122522b>] do_blockdev_direct_IO+0x126b/0x2c20
> [  151.806834] Modules linked in: btrfs xor raid6_pq dm_mod rpcsec_gss_kr=
b5 auth_rpcgss nfsv4 dns_resolver sg sr_mod cdrom ata_generic pata_acpi ppd=
ev snd_pcm snd_timer snd soundcore serio_raw pcspkr parport_pc parport flop=
py acpi_cpufreq ata_piix libata i2c_piix4
> [  151.815996]  ffffffff81b9a8e8 ffff88003ef738d0 ffffffff81409c82 ffff88=
003ef73918
> [  151.817824]  ffff88003ef73908 ffffffff81078f56 ffffffff81b91568 000000=
00000004a7
> [  151.819567] ------------[ cut here ]------------
> [  151.819573] WARNING: CPU: 2 PID: 8435 at kernel/sched/core.c:7533 __mi=
ght_sleep+0x9f/0xb0()
> [  151.819576] do not call blocking ops when !TASK_RUNNING; state=3D2 set=
 at [<ffffffff8122522b>] do_blockdev_direct_IO+0x126b/0x2c20
> [  151.819589] Modules linked in: btrfs xor raid6_pq dm_mod rpcsec_gss_kr=
b5 auth_rpcgss nfsv4 dns_resolver sg sr_mod cdrom ata_generic pata_acpi ppd=
ev snd_pcm snd_timer snd soundcore serio_raw pcspkr parport_pc parport flop=
py acpi_cpufreq ata_piix libata i2c_piix4
> [  151.828384]  0000000000000000 ffff88003ef73a48 ffff88007ddb0000 ffff88=
003ef73968
> [  151.830244] Call Trace:
> [  151.830953]  [<ffffffff81409c82>] dump_stack+0x4b/0x69
> [  151.831946]  [<ffffffff81078f56>] warn_slowpath_common+0x86/0xc0
> [  151.832969]  [<ffffffff81078fdc>] warn_slowpath_fmt+0x4c/0x50
> [  151.833976]  [<ffffffff8122522b>] ? do_blockdev_direct_IO+0x126b/0x2c20
> [  151.835088]  [<ffffffff8122522b>] ? do_blockdev_direct_IO+0x126b/0x2c20
> [  151.836195]  [<ffffffff8109da9f>] __might_sleep+0x9f/0xb0
> [  151.837169]  [<ffffffff81063d2a>] __do_page_fault+0x15a/0x410
> [  151.838166]  [<ffffffff810640a3>] trace_do_page_fault+0x43/0x110
> [  151.839214]  [<ffffffff8105d76a>] do_async_page_fault+0x1a/0xa0
> [  151.840268]  [<ffffffff818bd3f8>] async_page_fault+0x28/0x30
> [  151.841260]  [<ffffffff81225257>] ? do_blockdev_direct_IO+0x1297/0x2c20
> [  151.842420]  [<ffffffffa0273300>] ? btrfs_page_exists_in_range+0xe0/0x=
e0 [btrfs]
> [  151.843956]  [<ffffffffa026cdc0>] ? finish_ordered_fn+0x20/0x20 [btrfs]
> [  151.845034]  [<ffffffff81226c23>] __blockdev_direct_IO+0x43/0x50
> [  151.846082]  [<ffffffffa026cdc0>] ? finish_ordered_fn+0x20/0x20 [btrfs]
> [  151.847191]  [<ffffffffa026646a>] btrfs_direct_IO+0x1aa/0x310 [btrfs]
> [  151.848255]  [<ffffffffa026cdc0>] ? finish_ordered_fn+0x20/0x20 [btrfs]
> [  151.849372]  [<ffffffff8116ccb8>] generic_file_read_iter+0x488/0x5b0
> [  151.850466]  [<ffffffff8117b1b7>] ? lru_cache_add_active_or_unevictabl=
e+0x27/0x90
> [  151.852036]  [<ffffffff811e6697>] __vfs_read+0xa7/0xd0
> [  151.852960]  [<ffffffff811e6c86>] vfs_read+0x86/0x130
> [  151.853911]  [<ffffffff811e7a36>] SyS_read+0x46/0xa0
> [  151.854872]  [<ffffffff818bb1ee>] entry_SYSCALL_64_fastpath+0x12/0x71
> [  151.855935] ---[ end trace cce58b9a28c7a964 ]---
> [  151.855938] CPU: 0 PID: 8412 Comm: dd Not tainted 4.3.0-06686-g15c4f63=
 #1

That's a known issue for that commit, it's fixed later in the series. =

Does it still trigger as-of commit c1c534609fe8?

-- =

Jens Axboe


--===============8518755734107431408==--

