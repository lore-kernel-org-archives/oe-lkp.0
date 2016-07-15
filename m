Content-Type: multipart/mixed; boundary="===============5984093268144745955=="
MIME-Version: 1.0
From: Omar Sandoval <osandov@osandov.com>
To: lkp@lists.01.org
Subject: Re: [Btrfs] e5a7b11a5c: shift exponent 32 is too large for 32-bit type 'int'
Date: Thu, 14 Jul 2016 19:35:29 -0700
Message-ID: <20160715023529.GA19948@vader>
In-Reply-To: <20160715015120.GB6978@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5984093268144745955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 09:51:20AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://github.com/0day-ci/linux Omar-Sandoval/Btrfs-fix-extent-buffer-bi=
tmap-tests-on-big-endian-systems/20160713-074511
> commit e5a7b11a5caa8d42fe3fb4ff2d75b6811aeb8eb7 ("Btrfs: fix extent buffe=
r bitmap tests on big-endian systems")
> =

> in testcase: boot
> =

> on test machine: 2 threads qemu-system-x86_64 -enable-kvm -cpu Haswell,+s=
mep,+smap with 1G memory
> =

> caused below changes:
> =

> =

> +------------------------------------------------------------------+-----=
-----+------------+
> |                                                                  | v4.7=
-rc7 | e5a7b11a5c |
> +------------------------------------------------------------------+-----=
-----+------------+
> | boot_successes                                                   | 0   =
     | 0          |
> | boot_failures                                                    | 80  =
     | 8          |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 59=
       | 2          |
> | Mem-Info                                                         | 59  =
     | 2          |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 59  =
     | 2          |
> | backtrace:btrfs_test_extent_io                                   | 35  =
     | 6          |
> | backtrace:init_btrfs_fs                                          | 35  =
     | 6          |
> | backtrace:kernel_init_freeable                                   | 59  =
     | 8          |
> | BUG:kernel_test_oversize                                         | 11  =
     | 4          |
> | backtrace:vfs_write                                              | 24  =
     | 2          |
> | backtrace:SyS_write                                              | 24  =
     | 2          |
> | backtrace:populate_rootfs                                        | 24  =
     | 2          |
> | kernel_BUG_at_mm/filemap.c                                       | 1   =
     |            |
> | invalid_opcode:#[##]PREEMPT_SMP                                  | 1   =
     |            |
> | RIP:unlock_page                                                  | 1   =
     |            |
> | Kernel_panic-not_syncing:Fatal_exception                         | 1   =
     |            |
> | backtrace:kswapd                                                 | 1   =
     |            |
> | BUG:kernel_boot_hang                                             | 9   =
     |            |
> | BUG:kernel_torture_test_oversize                                 | 0   =
     | 2          |
> +------------------------------------------------------------------+-----=
-----+------------+
> =

> =

> =

> [   74.703186] UBSAN: Undefined behaviour in fs/btrfs/tests/extent-io-tes=
ts.c:367:4
> [   74.703359] shift exponent 32 is too large for 32-bit type 'int'
> [   74.703359] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.7.0-rc7-00001-=
ge5a7b11 #1
> [   74.703359] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   74.703359]  00000000ffffffff 0000000000000097 0000000000000001 000000=
0000000001
> [   74.703359]  0000000000000000 0000000000000001 ffff880035143c48 ffffff=
ff82046359
> [   74.703359]  ffffffff813e786b 000000007a4be528 000000007a4be500 000000=
0000000020
> [   74.703359] Call Trace:
> [   74.703359]  [<ffffffff82046359>] dump_stack+0x290/0x3f0
> [   74.703359]  [<ffffffff813e786b>] ? printk+0x5d/0x65
> [   74.703359]  [<ffffffff8212cbd9>] ubsan_epilogue+0x12/0x3f
> [   74.703359]  [<ffffffff8212d61b>] __ubsan_handle_shift_out_of_bounds+0=
x19c/0x1d1
> [   74.703359]  [<ffffffff81ca5a42>] ? extent_buffer_bitmap_set+0x508/0x5=
17
> [   74.703359]  [<ffffffff81e142e6>] __test_eb_bitmaps+0x5f1/0x7a7
> [   74.703359]  [<ffffffff81e142e6>] ? __test_eb_bitmaps+0x5f1/0x7a7
> [   74.703359]  [<ffffffff81e16479>] btrfs_test_extent_io+0x281/0x427
> [   74.703359]  [<ffffffff81d2b075>] ? cleanup_write_cache_enospc+0x88/0x=
88
> [   74.703359]  [<ffffffff8606d299>] init_btrfs_fs+0x926/0xd88
> [   74.703359]  [<ffffffff8606c973>] ? trace_event_define_fields_btrfs_sp=
ace_reservation+0x32f/0x32f
> [   74.703359]  [<ffffffff81000884>] do_one_initcall+0x240/0x4ed
> [   74.703359]  [<ffffffff85fd107c>] kernel_init_freeable+0x3b7/0x628
> [   74.703359]  [<ffffffff83033b7f>] kernel_init+0x1c/0x49c
> [   74.703359]  [<ffffffff830600cf>] ret_from_fork+0x1f/0x40
> [   74.703359]  [<ffffffff83033b63>] ? rest_init+0x2aa/0x2aa
> [   74.703359] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   75.122581] BTRFS: selftest: Extent I/O tests finished
> [   75.123550] BTRFS: selftest: Running btrfs_get_extent tests

Hm, that doesn't make much sense:

365         for (i =3D 0; i < len * BITS_PER_BYTE / 32; i++) {
366                 x =3D (0x19660dULL * (u64)x + 0x3c6ef35fULL) & 0xffffff=
ffU;
367                 for (j =3D 0; j < 32; j++) {
368                         if (x & (1U << j)) {
369                                 bitmap_set(bitmap, i * 32 + j, 1);
370                                 extent_buffer_bitmap_set(eb, 0, i * 32 =
+ j, 1);
371                         }
372                 }
373         }

How are we shifting by 32? I'll try to reproduce this tomorrow, but I
wonder if it's a compiler/UBSAN bug.

-- =

Omar

--===============5984093268144745955==--

