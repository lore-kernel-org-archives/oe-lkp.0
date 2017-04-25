Content-Type: multipart/mixed; boundary="===============3326185815191851983=="
MIME-Version: 1.0
From: Benedetto, Salvatore <salvatore.benedetto@intel.com>
To: lkp@lists.01.org
Subject: Re: [Bluetooth] e529d48ac7: BUG: unable to handle kernel paging request at ffffeb04000002e0
Date: Tue, 25 Apr 2017 14:57:34 +0000
Message-ID: <309B30E91F5E2846B79BD9AA9711D031ACA55B@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <58ff4c99.80TQ1BAF3fZLWljL%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3326185815191851983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+Holtmann

Hi Fengguang,

I tried your config file and I was able to reproduce the issue.
Disabling VMAP_STACK fixes the issue as I suspected.
I will provide a patch.

Thanks,
Salvatore

> -----Original Message-----
> From: Wu, Fengguang
> Sent: Tuesday, April 25, 2017 2:18 PM
> To: Benedetto, Salvatore <salvatore.benedetto@intel.com>
> Cc: LKP <lkp@01.org>; Wu, Fengguang <fengguang.wu@intel.com>;
> wfg(a)linux.intel.com
> Subject: [Bluetooth] e529d48ac7: BUG: unable to handle kernel paging
> request at ffffeb04000002e0
> =

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Salvatore-Benedetto/Bluetooth-
> convert-smp-and-selftest-to-crypto-kpp-API/20170424-220249
> =

> commit e529d48ac739b185f80a0a0b616e2e11d9130d1c
> Author:     Salvatore Benedetto <salvatore.benedetto@intel.com>
> AuthorDate: Mon Apr 24 13:13:20 2017 +0100
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Mon Apr 24 22:02:56 2017 +0800
> =

>     Bluetooth: convert smp and selftest to crypto kpp API
> =

>     * Convert both smp and selftest to crypto kpp API
>     * Remove module ecc as no more required
>     * Add ecdh_helper functions for wrapping kpp async calls
> =

>     This patch has been tested *only* with selftest, which is called on
>     module loading.
> =

>     Signed-off-by: Salvatore Benedetto <salvatore.benedetto@intel.com>
> =

> d160b74da8  Bluetooth: hci_ldisc: Add missing clear
> HCI_UART_PROTO_READY
> e529d48ac7  Bluetooth: convert smp and selftest to crypto kpp API
> e529d48ac7  Bluetooth: convert smp and selftest to crypto kpp API
> +------------------------------------------+------------+------------+---=
---------+
> |                                          | d160b74da8 | e529d48ac7 |
> | e529d48ac7 |
> +------------------------------------------+------------+------------+---=
---------+
> | boot_successes                           | 37         | 0          | 0 =
         |
> | boot_failures                            | 0          | 14         | 14=
         |
> | BUG:unable_to_handle_kernel              | 0          | 14         | 14=
         |
> | Oops:#[##]                               | 0          | 14         | 14=
         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 14         | 14=
         |
> +------------------------------------------+------------+------------+---=
---------+
> =

> [    9.558744] power_supply test_ac: uevent
> [    9.559124] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac
> [    9.559666] power_supply test_ac: prop ONLINE=3D1
> [    9.560042] rtc-test rtc-test.0: setting system clock to 2017-04-25 12=
:31:38
> UTC (1493123498)
> [    9.560766] Bluetooth: Starting self testing
> [    9.561886] BUG: unable to handle kernel paging request at
> ffffeb04000002e0
> [    9.562347] IP: sg_miter_stop+0x43/0xf4
> [    9.562597] PGD 0
> [    9.562598]
> [    9.562840] Oops: 0000 [#1] SMP
> [    9.563049] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.11.0-rc7-01718-
> ge529d48 #1
> [    9.563534] task: ffff88001284c000 task.stack: ffffc90000008000
> [    9.563924] RIP: 0010:sg_miter_stop+0x43/0xf4
> [    9.564209] RSP: 0000:ffffc9000000bbe8 EFLAGS: 00010202
> [    9.564548] RAX: ffffeb04000002c0 RBX: ffffc9000000bc08 RCX:
> 0000000000000000
> [    9.565011] RDX: 0000000000000003 RSI: ffff88000c300bd0 RDI:
> ffffc9000000bc08
> [    9.565470] RBP: ffffc9000000bbf0 R08: ffff88000c300bb0 R09:
> 0000000000000000
> [    9.565934] R10: ffffc9000000baa0 R11: 9a457d0d6d6e79b6 R12:
> ffff88000c300bb0
> [    9.566392] R13: 0000000000000000 R14: 0000000000000020 R15:
> 0000000000000020
> [    9.566856] FS:  0000000000000000(0000) GS:ffff880013200000(0000)
> knlGS:0000000000000000
> [    9.567375] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.567749] CR2: ffffeb04000002e0 CR3: 000000001020f000 CR4:
> 00000000001406f0
> [    9.568211] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [    9.568671] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [    9.569133] Call Trace:
> [    9.569298]  sg_copy_buffer+0x60/0xb7
> [    9.569539]  sg_copy_from_buffer+0xf/0x11
> [    9.569806]  ecdh_compute_value+0xbd/0xd3
> [    9.570071]  compute_ecdh_secret+0x225/0x2bf
> [    9.570352]  ? set_debug_rodata+0x12/0x12
> [    9.570617]  test_ecdh_sample+0x25/0x76
> [    9.570874]  ? kvm_clock_get_cycles+0x9/0xb
> [    9.571150]  ? ktime_get+0xf4/0x151
> [    9.571381]  ? test_ecdh_sample+0x76/0x76
> [    9.571645]  bt_selftest_init+0x45/0x148
> [    9.571907]  ? test_ecdh_sample+0x76/0x76
> [    9.572170]  do_one_initcall+0x87/0x159
> [    9.572422]  ? set_debug_rodata+0x12/0x12
> [    9.572685]  kernel_init_freeable+0x13b/0x1be
> [    9.572973]  ? rest_init+0x136/0x136
> [    9.573209]  kernel_init+0xe/0xeb
> [    9.573429]  ret_from_fork+0x31/0x40
> [    9.573665] Code: c7 c7 ec 79 bb bd e8 33 3a cf ff 48 83 7b 08 00 0f 8=
4 c3 00 00
> 00 8b 53 40 48 8b 43 18 01 43 38 29 43 3c f6 c2 02 74 15 48 8b 03 <48> 8b=
 48 20
> 48 8d 71 ff 80 e1 01 48 0f 45 c6 48 8b 00 80 e2 01
> [    9.574912] RIP: sg_miter_stop+0x43/0xf4 RSP: ffffc9000000bbe8
> [    9.575290] CR2: ffffeb04000002e0
> [    9.575510] ---[ end trace e52ae251fe26650f ]---
> [    9.575814] Kernel panic - not syncing: Fatal exception
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY
> DIRTY_NOT_BAD git bisect start d37f67fb4fa2271d8384ae75c81f273f67f29d76
> 5a7ad1146caa895ad718a534399e38bd2ba721b7 --
> git bisect  bad d4821087053992ecde759bd27999b1eeee225a44  # 18:57  B     =
 0
> 11   32  11  Merge 'linux-review/Kuninori-Morimoto/ASoC-rsnd-control-kctr=
l-
> items-acceptance-anytime-runtime/20170419-092526' into devel-hourly-
> 2017042512
> git bisect  bad 0852b2873f128705a28d679b6fdfd71396d43293  # 19:10  B     =
 0
> 11   21   0  Merge 'linux-review/Colin-King/net-netcp-fix-spelling-mistak=
e-
> memomry-memory/20170422-202602' into devel-hourly-2017042512
> git bisect  bad db33d7e6be7387a3f30c00f1d122d681eed57e39  # 19:18  B     =
 0
> 11   21   0  Merge 'linux-review/Tony-Jones/perf-tools-Guard-
> _GNU_SOURCE-in-pmu-events-jevents-c/20170424-123208' into devel-
> hourly-2017042512
> git bisect good df1a9f172308b632270b6e351b004c36b1bc4506  # 19:32  G     =
11
> 0    0   0  Merge 'linux-review/Jan-Kiszka/iio-adc-Add-support-for-TI-
> ADC1x8s102/20170425-050045' into devel-hourly-2017042512
> git bisect good 414a1ea9dd861beb29990b403018fd6a0ef079f4  # 19:41  G     =
11
> 0    0   0  Merge 'linux-review/David-Ahern/net-ipv6-regenerate-host-rout=
e-
> if-moved-to-gc-list/20170425-021055' into devel-hourly-2017042512
> git bisect good d73242254937140eb733e9669dcb185494542f43  # 19:55  G     =
11
> 0    0   0  Merge 'linux-review/Dave-Johnson/Re-PATCH-netfilter-Wrong-
> icmp6-checksum-for-ICMPV6_TIME_EXCEED-in-reverse-SNATv6-
> path/20170425-003748' into devel-hourly-2017042512
> git bisect  bad abc93900b335a1690d363fa7be223118ff782a0d  # 20:03  B     =
 0
> 4   14   0  Merge 'linux-review/Ander-Conselvan-de-Oliveira/drm-i915-glk-
> Don-t-allow-12-bpc-when-htotal-is-too-big/20170424-223118' into devel-
> hourly-2017042512
> git bisect  bad 6cdea8708a3aa199fa80f99f58c8df805de3704e  # 20:11  B     =
 0
> 11   21   0  Merge 'linux-review/Salvatore-Benedetto/Bluetooth-convert-
> smp-and-selftest-to-crypto-kpp-API/20170424-220249' into devel-hourly-
> 2017042512
> git bisect good 5009af9ea3af852906582e7c8e42a0459b7a31c6  # 20:22  G     =
11
> 0    0   0  Merge 'rcu/dev.2017.04.21a' into devel-hourly-2017042512
> git bisect  bad e529d48ac739b185f80a0a0b616e2e11d9130d1c  # 20:32  B     =
 0
> 3   13   0  Bluetooth: convert smp and selftest to crypto kpp API
> # first bad commit: [e529d48ac739b185f80a0a0b616e2e11d9130d1c]
> Bluetooth: convert smp and selftest to crypto kpp API
> git bisect good d160b74da85a4ec072b076db056e27ba7246eba0  # 20:48  G
> 33     0    0   0  Bluetooth: hci_ldisc: Add missing clear
> HCI_UART_PROTO_READY
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad e529d48ac739b185f80a0a0b616e2e11d9130d1c  # 20:58  B     =
 0
> 11   23   2  Bluetooth: convert smp and selftest to crypto kpp API
> # extra tests on HEAD of linux-devel/devel-hourly-2017042512
> git bisect  bad d37f67fb4fa2271d8384ae75c81f273f67f29d76  # 20:58  B     =
 0
> 55   68   0  0day head guard for 'devel-hourly-2017042512'
> # extra tests on tree/branch linux-review/Salvatore-Benedetto/Bluetooth-
> convert-smp-and-selftest-to-crypto-kpp-API/20170424-220249
> git bisect  bad e529d48ac739b185f80a0a0b616e2e11d9130d1c  # 21:07  B     =
 0
> 14   24   0  Bluetooth: convert smp and selftest to crypto kpp API
> # extra tests with first bad commit reverted
> git bisect good 9e39d3f276e60d4ccc8cb117aca2c34fe82b0b63  # 21:18  G     =
11
> 0    0   0  Revert "Bluetooth: convert smp and selftest to crypto kpp API"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============3326185815191851983==--

