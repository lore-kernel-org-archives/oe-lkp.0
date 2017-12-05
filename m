Content-Type: multipart/mixed; boundary="===============7122947129677027787=="
MIME-Version: 1.0
From: Roger Quadros <rogerq@ti.com>
To: lkp@lists.01.org
Subject: Re: 4949788ddb ("USB: dummy-hcd: Adapt dummy_udc_set_speed()"): BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 05 Dec 2017 12:52:28 +0200
Message-ID: <e3c8c471-03ae-565f-f573-6beaa500b829@ti.com>
In-Reply-To: <5a256a02.L4LK/M14W+mJ3Yb2%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7122947129677027787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Felipe,

Are you missing this patch?
https://lkml.org/lkml/2017/10/31/485

-- =

cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 04/12/17 17:30, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
> =

> commit 4949788ddb3e43c453f6d388b69dee01fad6c1b5
> Author:     Roger Quadros <rogerq@ti.com>
> AuthorDate: Thu Nov 2 11:09:17 2017 +0200
> Commit:     Felipe Balbi <felipe.balbi@linux.intel.com>
> CommitDate: Mon Dec 4 13:39:03 2017 +0200
> =

>     USB: dummy-hcd: Adapt dummy_udc_set_speed()
>     =

>     The UDC core ensures that .udc_set_speed() is called with
>     a speed that is a minimum of the max speeds supported
>     by the gadget function driver and the UDC driver.
>     =

>     We can now use the speed argument as is.
>     =

>     Get rid of the debug print as that condition will never happen.
>     =

>     Acked-by: Alan Stern <stern@rowland.harvard.edu>
>     Signed-off-by: Roger Quadros <rogerq@ti.com>
>     Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> =

> 2344aa09eb  USB: dummy-hcd: don't set gadget.speed in dummy_hub_control()
> 4949788ddb  USB: dummy-hcd: Adapt dummy_udc_set_speed()
> 3ed9bbf28b  usb: dwc3: Allow disabling of metastability workaround
> +------------------------------------------------+------------+----------=
--+------------+
> |                                                | 2344aa09eb | 4949788dd=
b | 3ed9bbf28b |
> +------------------------------------------------+------------+----------=
--+------------+
> | boot_successes                                 | 37         | 0        =
  | 0          |
> | boot_failures                                  | 1          | 15       =
  | 23         |
> | RIP:_raw_spin_unlock_irq                       | 1          |          =
  |            |
> | RIP:schedule                                   | 1          |          =
  |            |
> | INFO:rcu_preempt_detected_stalls_on_CPUs/tasks | 1          |          =
  |            |
> | BUG:unable_to_handle_kernel                    | 0          | 15       =
  | 23         |
> | Oops:#[##]                                     | 0          | 15       =
  | 23         |
> | RIP:dummy_set_selfpowered                      | 0          | 15       =
  | 23         |
> | Kernel_panic-not_syncing:Fatal_exception       | 0          | 15       =
  | 23         |
> +------------------------------------------------+------------+----------=
--+------------+
> =

> [    5.566746] usb usb1: Product: Dummy host controller
> [    5.567287] usb usb1: Manufacturer: Linux 4.15.0-rc2-00015-g4949788 du=
mmy_hcd
> [    5.568049] usb usb1: SerialNumber: dummy_hcd.0
> [    5.568753] hub 1-0:1.0: USB hub found
> [    5.569211] hub 1-0:1.0: 1 port detected
> [    5.570061] BUG: unable to handle kernel NULL pointer dereference at  =
         (null)
> [    5.570872] IP: dummy_set_selfpowered+0x2e/0x4e
> [    5.571364] PGD 0 P4D 0 =

> [    5.571633] Oops: 0000 [#1] PREEMPT SMP
> [    5.572042] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.15.0-rc2-00015=
-g4949788 #2
> [    5.572042] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    5.572042] task: 00000000ed1ac91d task.stack: 00000000f5d9bf55
> [    5.572042] RIP: 0010:dummy_set_selfpowered+0x2e/0x4e
> [    5.572042] RSP: 0000:ffffa54a4000be08 EFLAGS: 00010246
> [    5.572042] RAX: 0000000000000000 RBX: ffff9d2adb64ea00 RCX: 949b73470=
0000000
> [    5.572042] RDX: ffffffffae4de920 RSI: 0000000000000001 RDI: ffff9d2ad=
b668c08
> [    5.572042] RBP: ffff9d2adb668c08 R08: ffff9d2ac00507c0 R09: 00000000c=
9b18644
> [    5.572042] R10: ffff9d2ade60d5c1 R11: 0000000000000000 R12: 000000000=
0000000
> [    5.572042] R13: ffff9d2adb9bc610 R14: ffffffffae4e0640 R15: 000000000=
0000000
> [    5.572042] FS:  0000000000000000(0000) GS:ffff9d2adf800000(0000) knlG=
S:0000000000000000
> [    5.572042] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    5.572042] CR2: 0000000000000000 CR3: 000000000b416001 CR4: 000000000=
01606f0
> [    5.572042] Call Trace:
> [    5.572042]  composite_dev_prepare+0x95/0xd0
> [    5.572042]  composite_bind+0x7c/0x178
> [    5.572042]  ? set_debug_rodata+0xc/0xc
> [    5.572042]  udc_bind_to_driver+0x45/0xd4
> [    5.572042]  usb_gadget_probe_driver+0x10d/0x124
> [    5.572042]  ? mass_storagemod_init+0xc/0xc
> [    5.572042]  do_one_initcall+0x83/0x118
> [    5.572042]  ? set_debug_rodata+0xc/0xc
> [    5.572042]  kernel_init_freeable+0x19a/0x218
> [    5.572042]  ? rest_init+0x134/0x134
> [    5.572042]  kernel_init+0x5/0xe1
> [    5.572042]  ret_from_fork+0x1f/0x30
> [    5.572042] Code: 95 c0 c1 e0 05 88 c2 8a 87 51 05 00 00 83 e0 df 09 d=
0 83 7f 78 05 88 87 51 05 00 00 48 8b 87 18 06 00 00 48 0f 45 87 10 06 00 0=
0 <48> 8b 10 8b 82 10 12 00 00 89 c1 83 c8 01 83 e1 fe 85 f6 0f 44 =

> [    5.572042] RIP: dummy_set_selfpowered+0x2e/0x4e RSP: ffffa54a4000be08
> [    5.572042] CR2: 0000000000000000
> [    5.572042] ---[ end trace 9443ecd8bcbd80a9 ]---
> [    5.572042] Kernel panic - not syncing: Fatal exception
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 72ca944efb1c5a4f5bd2695f5ed20830944eb09b ae64f9bd1d3621b=
5e60d7363bc20afb46aede215 --
> git bisect  bad 57e0f1a3f1947bb7b3cd872a4e5d2b11398fc4b5  # 21:25  B     =
 0     7   22   2  Merge 'm68knommu/for-next' into devel-catchup-2017120420=
04
> git bisect  bad 516f5d687ba0977b78ca9ec3825d5012a4a93877  # 21:37  B     =
 0     1   14   0  Merge 'wsa/renesas/topic/rcar-i2c-recovery' into devel-c=
atchup-201712042004
> git bisect  bad a50a0986ce437ade12cc0c0d48b2a5f0796016b5  # 21:47  B     =
 0     3   23   7  Merge 'balbi-usb/testing/next' into devel-catchup-201712=
042004
> git bisect good 8de54064e6b241bcdd13effb759c60cb52e73a38  # 22:03  G     =
11     0    0   0  0day base guard for 'devel-catchup-201712042004'
> git bisect good 528bfa25bf1723c9996d6cc961d25990386cd1a9  # 22:12  G     =
11     0    0   0  Merge 'l1k/hci_bcm_v1' into devel-catchup-201712042004
> git bisect good aba201c80d895ab789dd804ecedcf33aae842780  # 22:17  G     =
11     0    0   0  usb: gadget: ffs: Make sparse happier
> git bisect good d73f864c87670cccb87f883369c61e4152d18f41  # 22:31  G     =
11     0    1   1  usb: gadget: pxa27x: Remove redundant assignment to is_s=
hort and dev
> git bisect good 2344aa09ebb223a1fdb49e2c4f74f271d17040c6  # 22:49  G     =
11     0    0   0  USB: dummy-hcd: don't set gadget.speed in dummy_hub_cont=
rol()
> git bisect  bad 4929fb631d4cedc385910fd998518e22bd71d680  # 22:57  B     =
 0    11   53  14  usb: dwc3: Allow disabling of metastability workaround
> git bisect  bad 4949788ddb3e43c453f6d388b69dee01fad6c1b5  # 23:02  B     =
 0    11   24   0  USB: dummy-hcd: Adapt dummy_udc_set_speed()
> # first bad commit: [4949788ddb3e43c453f6d388b69dee01fad6c1b5] USB: dummy=
-hcd: Adapt dummy_udc_set_speed()
> git bisect good 2344aa09ebb223a1fdb49e2c4f74f271d17040c6  # 23:05  G     =
30     0    0   0  USB: dummy-hcd: don't set gadget.speed in dummy_hub_cont=
rol()
> # extra tests on HEAD of linux-devel/devel-catchup-201712042004
> git bisect  bad 72ca944efb1c5a4f5bd2695f5ed20830944eb09b  # 23:05  B     =
 0    57  128   0  0day head guard for 'devel-catchup-201712042004'
> # extra tests on tree/branch balbi-usb/testing/next
> git bisect  bad 3ed9bbf28b6bc494606b4c1847073343f96d85db  # 23:15  B     =
 0     2   26   5  usb: dwc3: Allow disabling of metastability workaround
> # extra tests with first bad commit reverted
> git bisect good e3220bb79e426a1717cc58c5bed7af54bb922da9  # 23:29  G     =
11     0    0   0  Revert "USB: dummy-hcd: Adapt dummy_udc_set_speed()"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
> =



--===============7122947129677027787==--

