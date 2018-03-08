Content-Type: multipart/mixed; boundary="===============2153979379602290448=="
MIME-Version: 1.0
From: Paul Blakey <paulb@mellanox.com>
To: lkp@lists.01.org
Subject: Re: [test_rhashtable] 499ac3b60f: WARNING:suspicious_RCU_usage
Date: Thu, 08 Mar 2018 11:55:35 +0000
Message-ID: <AM4PR05MB1636C51E3A5E5FF50DD9CF26CFDF0@AM4PR05MB1636.eurprd05.prod.outlook.com>
In-Reply-To: <20180308030834.vwi7ts2hzcalecs5@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============2153979379602290448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks! Sent a fix

-----Original Message-----
From: kernel test robot [mailto:fengguang.wu(a)intel.com] =

Sent: Thursday, March 8, 2018 5:09 AM
To: Paul Blakey <paulb@mellanox.com>
Cc: lkp(a)01.org
Subject: [test_rhashtable] 499ac3b60f: WARNING:suspicious_RCU_usage


FYI, we noticed the following commit (built with gcc-7):

commit: 499ac3b60f657dae82055fc81c7b01e6242ac9bc ("test_rhashtable: add tes=
t case for rhltable with duplicate objects")
2018-03-08 11:08:21

in testcase: trinity
with following parameters:

	runtime: 300s

test-description: Trinity is a linux system call fuzz tester.
test-url: http://codemonkey.org.uk/projects/trinity/


on test machine: qemu-system-x86_64 -enable-kvm -m 512M

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):


+--------------------------------------------------------------------+-----=
-------+------------+
|                                                                    | d3dc=
f8eb61 | 499ac3b60f |
+--------------------------------------------------------------------+-----=
-------+------------+
| boot_successes                                                     | 37  =
       | 0          |
| boot_failures                                                      | 0   =
       | 17         |
| WARNING:suspicious_RCU_usage                                       | 0   =
       | 17         |
| lib/test_rhashtable.c:#suspicious_rcu_dereference_protected()usage | 0   =
       | 17         |
+--------------------------------------------------------------------+-----=
-------+------------+



[    7.054591] WARNING: suspicious RCU usage
[    7.055068] 4.16.0-rc4-00130-g499ac3b #2 Not tainted
[    7.055630] -----------------------------
[    7.056154] lib/test_rhashtable.c:502 suspicious rcu_dereference_protect=
ed() usage!
[    7.057181] =

[    7.057181] other info that might help us debug this:
[    7.057181] =

[    7.058040] =

[    7.058040] rcu_scheduler_active =3D 2, debug_locks =3D 1
[    7.058749] no locks held by swapper/0/1.
[    7.059025] =

[    7.059025] stack backtrace:
[    7.059339] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc4-00130-g=
499ac3b #2
[    7.059869] Call Trace:
[    7.060067]  dump_stack+0xb7/0x107
[    7.060112]  print_ht+0x8f/0x35d
[    7.060112]  ? check_chain_key+0x7c/0xc1
[    7.060112]  test_insert_dup+0x13b/0x1ce
[    7.060112]  ? ___siphash_aligned+0x2b/0x2b
[    7.060112]  ? jhash+0x1bb/0x1bb
[    7.060112]  ? my_hashfn+0x1a/0x1a
[    7.060112]  ? rhashtable_walk_peek+0x78/0x78
[    7.060112]  test_rht_init+0x6f8/0x1212
[    7.060112]  ? ___siphash_aligned+0x2b/0x2b
[    7.060112]  ? ___siphash_aligned+0x2b/0x2b
[    7.060112]  ? initcall_blacklisted+0xb0/0xd3
[    7.060112]  ? kstrtoll+0x9a/0xbc
[    7.060112]  ? kstrtos8+0x69/0x89
[    7.060112]  ? test_insert_dup+0x1ce/0x1ce
[    7.060112]  ? do_early_param+0xb9/0xb9
[    7.060112]  do_one_initcall+0xaa/0x17d
[    7.060112]  ? do_early_param+0xb9/0xb9
[    7.060112]  kernel_init_freeable+0x124/0x1d9
[    7.060112]  ? rest_init+0xc5/0xc5
[    7.060112]  kernel_init+0xb/0x147
[    7.060112]  ? rest_init+0xc5/0xc5
[    7.060112]  ret_from_fork+0x24/0x30
[    7.066452] =

[    7.066570] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    7.066850] WARNING: suspicious RCU usage
[    7.067126] 4.16.0-rc4-00130-g499ac3b #2 Not tainted
[    7.067476] -----------------------------
[    7.067765] lib/test_rhashtable.c:507 suspicious rcu_dereference_protect=
ed() usage!
[    7.068445] =

[    7.068445] other info that might help us debug this:
[    7.068445] =

[    7.069012] =

[    7.069012] rcu_scheduler_active =3D 2, debug_locks =3D 1
[    7.069475] no locks held by swapper/0/1.
[    7.069755] =

[    7.069755] stack backtrace:
[    7.070057] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc4-00130-g=
499ac3b #2
[    7.070572] Call Trace:
[    7.070756]  dump_stack+0xb7/0x107
[    7.070996]  print_ht+0xf4/0x35d
[    7.071224]  ? check_chain_key+0x7c/0xc1
[    7.071498]  test_insert_dup+0x13b/0x1ce
[    7.071777]  ? ___siphash_aligned+0x2b/0x2b
[    7.072133]  ? jhash+0x1bb/0x1bb
[    7.072371]  ? my_hashfn+0x1a/0x1a
[    7.072434]  ? rhashtable_walk_peek+0x78/0x78
[    7.072434]  test_rht_init+0x6f8/0x1212
[    7.072434]  ? ___siphash_aligned+0x2b/0x2b
[    7.072434]  ? ___siphash_aligned+0x2b/0x2b
[    7.072434]  ? initcall_blacklisted+0xb0/0xd3
[    7.072434]  ? kstrtoll+0x9a/0xbc
[    7.072434]  ? kstrtos8+0x69/0x89
[    7.072434]  ? test_insert_dup+0x1ce/0x1ce
[    7.072434]  ? do_early_param+0xb9/0xb9
[    7.072434]  do_one_initcall+0xaa/0x17d
[    7.072434]  ? do_early_param+0xb9/0xb9
[    7.072434]  kernel_init_freeable+0x124/0x1d9
[    7.072434]  ? rest_init+0xc5/0xc5
[    7.072434]  kernel_init+0xb/0x147
[    7.072434]  ? rest_init+0xc5/0xc5
[    7.072434]  ret_from_fork+0x24/0x30
[    7.077127] =

[    7.077241] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    7.077537] WARNING: suspicious RCU usage
[    7.077828] 4.16.0-rc4-00130-g499ac3b #2 Not tainted
[    7.078176] -----------------------------
[    7.078462] lib/test_rhashtable.c:508 suspicious rcu_dereference_protect=
ed() usage!
[    7.079126] =

[    7.079126] other info that might help us debug this:
[    7.079126] =

[    7.079687] =

[    7.079687] rcu_scheduler_active =3D 2, debug_locks =3D 1
[    7.080226] no locks held by swapper/0/1.
[    7.080515] =

[    7.080515] stack backtrace:
[    7.080831] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc4-00130-g=
499ac3b #2
[    7.081354] Call Trace:
[    7.081545]  dump_stack+0xb7/0x107
[    7.081789]  print_ht+0x15e/0x35d
[    7.082023]  ? check_chain_key+0x7c/0xc1
[    7.082296]  test_insert_dup+0x13b/0x1ce
[    7.082569]  ? ___siphash_aligned+0x2b/0x2b
[    7.082933]  ? jhash+0x1bb/0x1bb
[    7.083160]  ? my_hashfn+0x1a/0x1a
[    7.083397]  ? rhashtable_walk_peek+0x78/0x78
[    7.083721]  test_rht_init+0x6f8/0x1212
[    7.083997]  ? ___siphash_aligned+0x2b/0x2b
[    7.084191]  ? ___siphash_aligned+0x2b/0x2b
[    7.084191]  ? initcall_blacklisted+0xb0/0xd3
[    7.084191]  ? kstrtoll+0x9a/0xbc
[    7.084191]  ? kstrtos8+0x69/0x89
[    7.084191]  ? test_insert_dup+0x1ce/0x1ce
[    7.084191]  ? do_early_param+0xb9/0xb9
[    7.084191]  do_one_initcall+0xaa/0x17d
[    7.084191]  ? do_early_param+0xb9/0xb9
[    7.084191]  kernel_init_freeable+0x124/0x1d9
[    7.084191]  ? rest_init+0xc5/0xc5
[    7.084191]  kernel_init+0xb/0x147
[    7.084191]  ? rest_init+0xc5/0xc5
[    7.084191]  ret_from_fork+0x24/0x30
[    7.087970] =

[    7.088099] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    7.088386] WARNING: suspicious RCU usage
[    7.088671] 4.16.0-rc4-00130-g499ac3b #2 Not tainted
[    7.089026] -----------------------------
[    7.089313] lib/test_rhashtable.c:519 suspicious rcu_dereference_protect=
ed() usage!
[    7.089969] =

[    7.089969] other info that might help us debug this:
[    7.089969] =

[    7.090509] =

[    7.090509] rcu_scheduler_active =3D 2, debug_locks =3D 1
[    7.090955] no locks held by swapper/0/1.
[    7.091230] =

[    7.091230] stack backtrace:
[    7.091549] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc4-00130-g=
499ac3b #2
[    7.092083] Call Trace:
[    7.092091]  dump_stack+0xb7/0x107
[    7.092091]  print_ht+0x1f0/0x35d
[    7.092091]  test_insert_dup+0x13b/0x1ce
[    7.092091]  ? ___siphash_aligned+0x2b/0x2b
[    7.092091]  ? jhash+0x1bb/0x1bb
[    7.092091]  ? my_hashfn+0x1a/0x1a
[    7.092091]  ? rhashtable_walk_peek+0x78/0x78
[    7.092091]  test_rht_init+0x6f8/0x1212
[    7.092091]  ? ___siphash_aligned+0x2b/0x2b
[    7.092091]  ? ___siphash_aligned+0x2b/0x2b
[    7.092091]  ? initcall_blacklisted+0xb0/0xd3
[    7.092091]  ? kstrtoll+0x9a/0xbc
[    7.092091]  ? kstrtos8+0x69/0x89
[    7.092091]  ? test_insert_dup+0x1ce/0x1ce
[    7.092091]  ? do_early_param+0xb9/0xb9
[    7.092091]  do_one_initcall+0xaa/0x17d
[    7.092091]  ? do_early_param+0xb9/0xb9
[    7.092091]  kernel_init_freeable+0x124/0x1d9
[    7.092091]  ? rest_init+0xc5/0xc5
[    7.092091]  kernel_init+0xb/0x147
[    7.092091]  ? rest_init+0xc5/0xc5
[    7.092091]  ret_from_fork+0x24/0x30
[    7.098472] =

[    7.098592] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    7.098881] WARNING: suspicious RCU usage
[    7.099167] 4.16.0-rc4-00130-g499ac3b #2 Not tainted
[    7.099526] -----------------------------
[    7.099808] lib/test_rhashtable.c:529 suspicious rcu_dereference_protect=
ed() usage!
[    7.100476] =

[    7.100476] other info that might help us debug this:
[    7.100476] =

[    7.101032] =

[    7.101032] rcu_scheduler_active =3D 2, debug_locks =3D 1
[    7.101490] no locks held by swapper/0/1.
[    7.101780] =

[    7.101780] stack backtrace:
[    7.102093] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc4-00130-g=
499ac3b #2
[    7.102622] Call Trace:
[    7.102812]  dump_stack+0xb7/0x107
[    7.103062]  print_ht+0x2bc/0x35d
[    7.103306]  test_insert_dup+0x13b/0x1ce
[    7.103592]  ? ___siphash_aligned+0x2b/0x2b
[    7.103969]  ? jhash+0x1bb/0x1bb
[    7.104204]  ? my_hashfn+0x1a/0x1a
[    7.104454]  ? rhashtable_walk_peek+0x78/0x78
[    7.104454]  test_rht_init+0x6f8/0x1212
[    7.104454]  ? ___siphash_aligned+0x2b/0x2b
[    7.104454]  ? ___siphash_aligned+0x2b/0x2b
[    7.104454]  ? initcall_blacklisted+0xb0/0xd3
[    7.104454]  ? kstrtoll+0x9a/0xbc
[    7.104454]  ? kstrtos8+0x69/0x89
[    7.104454]  ? test_insert_dup+0x1ce/0x1ce
[    7.104454]  ? do_early_param+0xb9/0xb9
[    7.104454]  do_one_initcall+0xaa/0x17d
[    7.104454]  ? do_early_param+0xb9/0xb9
[    7.104454]  kernel_init_freeable+0x124/0x1d9
[    7.104454]  ? rest_init+0xc5/0xc5
[    7.104454]  kernel_init+0xb/0x147
[    7.104454]  ? rest_init+0xc5/0xc5
[    7.104454]  ret_from_fork+0x24/0x30
[    7.109488] =

[    7.109488] ---- ht: ----
[    7.109488] bucket[1] -> [[ val 1 (tid=3D0) ]] -> [[ val 21 (tid=3D1) ]]
[    7.109488] -------------
[    7.110786] =

[    7.110786] ---- ht: ----
[    7.110786] bucket[1] -> [[ val 1 (tid=3D2),  val 1 (tid=3D0) ]] -> [[ v=
al 21 (tid=3D1) ]]
[    7.110786] -------------
[    7.112243] =

[    7.112243] ---- ht: ----
[    7.112243] bucket[1] -> [[ val 21 (tid=3D1) ]] -> [[ val 1 (tid=3D0) ]]
[    7.112243] -------------
[    7.113527] =

[    7.113527] ---- ht: ----
[    7.113527] bucket[1] -> [[ val 21 (tid=3D1) ]] -> [[ val 1 (tid=3D2),  =
val 1 (tid=3D0) ]]
[    7.113527] -------------
[    7.114919] Testing concurrent rhashtable access from 10 threads
[   21.321883] rhashtable_thra (147) used greatest stack depth: 14320 bytes=
 left
[   21.418744] test 3125 add/delete pairs into rhlist
[   21.713306] test 3125 random rhlist add/delete operations
[   22.071501] Started 10 threads, 0 failed, rhltable test returns 0
[   22.072270] test passed
[   22.072841] test_bitmap: test 13: input is '0-2047:128/256' OK, Time: 20=
11
[   22.078434] test_bitmap: all 1524 tests passed
[   22.078774] test_uuid: all 18 tests passed
[   22.079847] xz_dec_test: module loaded
[   22.080152] xz_dec_test: Create a device node with 'mknod xz_dec_test c =
243 0' and write .xz files to it.
[   22.080852] rbtree testing
[   22.089627]  -> test 1 (latency of nnodes insert+delete): 22741 cycles
[   22.098162]  -> test 2 (latency of nnodes cached insert+delete): 20428 c=
ycles
[   22.099378]  -> test 3 (latency of inorder traversal): 1806 cycles
[   22.099817]  -> test 4 (latency to fetch first node)
[   22.100180]         non-cached: 27 cycles
[   22.100463]         cached: 10 cycles
[   22.178234] augmented rbtree testing
[   22.197339]  -> test 1 (latency of nnodes insert+delete): 49524 cycles
[   22.215814]  -> test 2 (latency of nnodes cached insert+delete): 46004 c=
ycles
[   22.338745] gpio_it87: no device
[   22.339351] no IO addresses supplied
[   22.339809] hgafb: HGA card not detected.
[   22.340158] hgafb: probe of hgafb.0 failed with error -22
[   22.340669] usbcore: registered new interface driver udlfb
[   22.341090] intel_idle: does not run on family 6 model 6
[   22.341496] ipmi message handler version 39.2
[   22.341809] ipmi device interface
[   22.342415] IPMI System Interface driver.
[   22.342888] ipmi_si: Unable to find any System Interface(s)
[   22.343276] IPMI SSIF Interface driver
[   22.343603] IPMI Watchdog: driver initialized
[   22.343917] Copyright (C) 2004 MontaVista Software - IPMI Powerdown via =
sys_reboot.
[   22.345332] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input0
[   22.346026] ACPI: Power Button [PWRF]
[   22.404374] HDLC line discipline maxframe=3D4096
[   22.404915] N_HDLC line discipline registered.
[   22.405400] r3964: Philips r3964 Driver $Revision: 1.10 $
[   22.406061] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[   22.430211] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a 16550A
[   22.455410] 00:06: ttyS1 at I/O 0x2f8 (irq =3D 3, base_baud =3D 115200) =
is a 16550A
[   22.461506] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 secon=
ds, margin is 60 seconds).
[   22.481449] brd: module loaded
[   22.482517] dummy-irq: no IRQ given.  Use irq=3DN
[   22.483275] lkdtm: No crash points registered, enable through debugfs
[   22.484204] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo Gi=
ometti
[   22.485309] c2port c2port0: C2 port uc added
[   22.485807] c2port c2port0: uc flash has 30 blocks x 512 bytes (15360 by=
tes total)


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> job-script  # job-script is attached in t=
his email



Thanks,
lkp

--===============2153979379602290448==--

