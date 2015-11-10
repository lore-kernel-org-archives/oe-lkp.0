Content-Type: multipart/mixed; boundary="===============7322469855986735971=="
MIME-Version: 1.0
From: Jens Axboe <axboe@fb.com>
To: lkp@lists.01.org
Subject: Re: [directio] fccce5610a: WARNING: CPU: 0 PID: 4493 at kernel/sched/core.c:7533 __might_sleep+0x60/0x7c()
Date: Tue, 10 Nov 2015 10:16:30 -0700
Message-ID: <5642266E.4020301@fb.com>
In-Reply-To: <87egfyd308.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7322469855986735971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/09/2015 07:03 PM, kernel test robot wrote:
> FYI, we noticed the below changes on
>
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for=
-4.4/io-poll
> commit fccce5610a68137c8e974d51719a81344b16750b ("directio: add block pol=
ling support")
>
>
> [ 1667.891609] WARNING: CPU: 0 PID: 4493 at kernel/sched/core.c:7533 __mi=
ght_sleep+0x60/0x7c()
> [ 1667.893783] do not call blocking ops when !TASK_RUNNING; state=3D2 set=
 at [<ffffffff8122e49e>] do_blockdev_direct_IO+0xad5/0xc03
> [ 1667.903111] Modules linked in:
> [ 1667.903913] CPU: 0 PID: 4493 Comm: xfs_io Tainted: G        W       4.=
3.0-06686-gfccce56 #1
> [ 1667.906139] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [ 1667.908049]  0000000000000000 ffff88001c183880 ffffffff81734662 ffff88=
001c1838c8
> [ 1667.909852]  ffff88001c1838b8 ffffffff810d77de ffffffff810f9564 ffffff=
ff83a72b20
> [ 1667.911666]  00000000000004a7 0000000000000000 0000000000000014 ffff88=
001c183920
> [ 1667.920421] Call Trace:
> [ 1667.921097]  [<ffffffff81734662>] dump_stack+0x4b/0x63
> [ 1667.922112]  [<ffffffff810d77de>] warn_slowpath_common+0x99/0xb2
> [ 1667.923521]  [<ffffffff810f9564>] ? __might_sleep+0x60/0x7c
> [ 1667.924878]  [<ffffffff810d783f>] warn_slowpath_fmt+0x48/0x50
> [ 1667.926234]  [<ffffffff8122e49e>] ? do_blockdev_direct_IO+0xad5/0xc03
> [ 1667.936206]  [<ffffffff8122e49e>] ? do_blockdev_direct_IO+0xad5/0xc03
> [ 1667.937509]  [<ffffffff810f9564>] __might_sleep+0x60/0x7c
> [ 1667.938777]  [<ffffffff810964af>] __do_page_fault+0x24d/0x412
> [ 1667.942327]  [<ffffffff810967e6>] trace_do_page_fault+0x14b/0x1ee
> [ 1667.943889]  [<ffffffff81090d9a>] do_async_page_fault+0x31/0x63
> [ 1667.946861]  [<ffffffff82e15938>] async_page_fault+0x28/0x30
> [ 1667.947989]  [<ffffffff8122e4d0>] ? do_blockdev_direct_IO+0xb07/0xc03
> [ 1667.951321]  [<ffffffff811145f5>] ? __lock_acquire+0x65b/0xdee
> [ 1667.952486]  [<ffffffff815f768f>] ? btrfs_page_exists_in_range+0x1ce/0=
x1ce
> [ 1667.957004]  [<ffffffff815f2627>] ? finish_ordered_fn+0x17/0x17
> [ 1667.958410]  [<ffffffff8122e5fd>] __blockdev_direct_IO+0x31/0x33
> [ 1667.962900]  [<ffffffff8122e5fd>] ? __blockdev_direct_IO+0x31/0x33
> [ 1667.966229]  [<ffffffff815f2627>] ? finish_ordered_fn+0x17/0x17
> [ 1667.967416]  [<ffffffff815ed4db>] btrfs_direct_IO+0x1b6/0x252
> [ 1667.970738]  [<ffffffff815f2627>] ? finish_ordered_fn+0x17/0x17
> [ 1667.974253]  [<ffffffff811a5d02>] generic_file_direct_write+0xb3/0x128
> [ 1667.975749]  [<ffffffff815fcf32>] btrfs_file_write_iter+0x22c/0x40e
> [ 1667.980342]  [<ffffffff81111312>] ? __lock_is_held+0x3c/0x57
> [ 1667.981579]  [<ffffffff811fbec1>] __vfs_write+0x7c/0xa5
> [ 1667.984778]  [<ffffffff811fc662>] vfs_write+0xa0/0xeb
> [ 1667.985853]  [<ffffffff811fcf7b>] SyS_pwrite64+0x65/0x84
> [ 1668.008257]  [<ffffffff82e13732>] entry_SYSCALL_64_fastpath+0x12/0x76

Thanks, fixed:

http://git.kernel.dk/cgit/linux-block/commit/?h=3Dfor-4.4/io-poll&id=3Dc1c5=
34609fe8a859f9c8108a5591e6e8a97e34d1

-- =

Jens Axboe


--===============7322469855986735971==--

