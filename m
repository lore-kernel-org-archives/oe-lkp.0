Content-Type: multipart/mixed; boundary="===============0043678654033393537=="
MIME-Version: 1.0
From: Duyck, Alexander H <alexander.h.duyck@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 34fad54c25: kernel BUG at include/linux/skbuff.h:1935!
Date: Tue, 15 Nov 2016 22:44:05 +0000
Message-ID: <1479249843.681.152.camel@intel.com>
In-Reply-To: <582b7c30.nXQXP2V4/6pFiYwt%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0043678654033393537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-16 at 05:20 +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 34fad54c2537f7c99d07375e50cb30aa3c23bd83 ("net: __skb_flow_dissect=
() must cap its return value")
> =

> in testcase: pbzip2
> with following parameters:
> =

> 	nr_threads: 25%
> 	blocksize: 900K
> 	cpufreq_governor: performance
> =

> =

> =

> on test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2=
.70GHz with 64G memory
> =

> caused below changes:
> =

> =

> +------------------------------------------------------------------+-----=
-------+------------+
> > =

> >                                                                  | 7977=
4d6bfa | 34fad54c25 |
> +------------------------------------------------------------------+-----=
-------+------------+
> > =

> > boot_successes                                                   | 0   =
       | 2          |
> > boot_failures                                                    | 2   =
       | 20         |
> > invoked_oom-killer:gfp_mask=3D0x                                   | 2 =
         | 2          |
> > Mem-Info                                                         | 2   =
       | 2          |
> > Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 2   =
       | 2          |
> > kernel_BUG_at_include/linux/skbuff.h                             | 0   =
       | 16         |
> > invalid_opcode:#[##]SMP                                          | 0   =
       | 16         |
> > RIP:eth_type_trans                                               | 0   =
       | 16         |
> > Kernel_panic-not_syncing:Fatal_exception_in_interrupt            | 0   =
       | 15         |
> > calltrace:hub_event                                              | 0   =
       | 1          |
> > WARNING:at_fs/sysfs/dir.c:#sysfs_warn_dup                        | 0   =
       | 2          |
> > calltrace:parport_pc_init                                        | 0   =
       | 2          |
> > calltrace:SyS_finit_module                                       | 0   =
       | 2          |
> > WARNING:at_lib/kobject.c:#kobject_add_internal                   | 0   =
       | 2          |
> +------------------------------------------------------------------+-----=
-------+------------+
> =

> =

> =

> [   19.375251] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
> [   19.388892] Sending DHCP requests .
> [   19.388892] ------------[ cut here ]------------
> [   19.388894] kernel BUG at include/linux/skbuff.h:1935!
> [   19.388895] invalid opcode: 0000 [#1] SMP
> [   19.388896] Modules linked in:
> [   19.388897] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.9.0-rc3-00320-=
g34fad54 #1
> [   19.388898] Hardware name: Intel Corporation S2600WP/S2600WP, BIOS SE5=
C600.86B.02.02.0002.122320131210 12/23/2013
> [   19.388899] task: ffffffff81e0e4c0 task.stack: ffffffff81e00000
> [   19.388904] RIP: 0010:[<ffffffff81837c48>]  [<ffffffff81837c48>] eth_t=
ype_trans+0xe8/0x140
> [   19.388904] RSP: 0000:ffff88081e803db8  EFLAGS: 00010297
> [   19.388905] RAX: 0000000000000152 RBX: ffff88080221f200 RCX: 000000000=
0001073
> [   19.388905] RDX: ffff8808013afdc0 RSI: ffff880801114000 RDI: ffff88081=
9407c00
> [   19.388906] RBP: ffff88081e803e20 R08: ffff880801114000 R09: 000000000=
0000800
> [   19.388907] R10: ffff8808013afec0 R11: ffffea003fd5a880 R12: ffff88081=
9407c00
> [   19.388907] R13: ffff881033408000 R14: ffffc9000843e000 R15: 000000000=
0000158
> [   19.388908] FS:  0000000000000000(0000) GS:ffff88081e800000(0000) knlG=
S:0000000000000000
> [   19.388909] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   19.388910] CR2: ffff88103ffff000 CR3: 0000000001e07000 CR4: 000000000=
01406f0
> [   19.388910] Stack:
> [   19.388912]  ffffffff816905a7 ffffea003fd5a880 ffffea0000000008 ffff88=
080221f050
> [   19.388913]  ffff88080221f000 0000004000000160 ffffea003fd5a880 000000=
0000000000
> [   19.388915]  0000000000000040 0000000000000000 ffff88080221f050 ffff88=
100d216000

>From what I can tell it looks like the size of the frame is 0x160 hex,
or 352. =C2=A0For whatever reason we are only pulling 8 bytes into the
header which is giving us an skb->len of 352 (0x160), and a skb-
>data_len of 344 (0x158). =C2=A0When we go to pull the 14 bytes for the
Ethernet header we end up at a skb->len of 338 (0x152) which is
resulting in the panic.

The question is how are we coming up with 8 instead of 14 which is the
lowest limit supported by eth_get_headlen? My first thought was there
is an incorrect sizeof(eth) instead of the sizeof(*eth) somewhere in
the code but I can't find anything like that anywhere.

Is there any way you can provide me with the net/ethernet/eth.o and
drivers/net/ethernet/igb/igb.o files? =C2=A0With that I can look over the
assembler and verify if the proper code is being generated. =C2=A0From what
I can tell it seems like I should have the exact same code being
generated by my compiler as I am able to get the same offsets/registers
using a stock gcc 6.2, but I am not seeing the issue. I don't have a
Debian/Ubuntu install to test with so it would be easier for me to just
compare the object files for your build versus what I have to verify
there isn't any funny business going on in terms of the translation of
"sizeof(*eth)" which might be coming up with the wrong value.

> [   19.388915] Call Trace:
> [   19.388919]  <IRQ> =

> [   19.388919]  [<ffffffff816905a7>] ? igb_clean_rx_irq+0x6a7/0x7d0
> [   19.388921]  [<ffffffff81690a52>] igb_poll+0x382/0x700
> [   19.388922]  [<ffffffff81690a67>] ? igb_poll+0x397/0x700
> [   19.388925]  [<ffffffff8180f2d7>] net_rx_action+0x217/0x360
> [   19.388928]  [<ffffffff81957fb4>] __do_softirq+0x104/0x2ab
> [   19.388931]  [<ffffffff81086961>] irq_exit+0xf1/0x100
> [   19.388932]  [<ffffffff81957cf4>] do_IRQ+0x54/0xd0
> [   19.388935]  [<ffffffff81955b8c>] common_interrupt+0x8c/0x8c
> [   19.388938]  <EOI> he question is how are we coming up with 8 instead =
of 14 which is the lowest limit supported by eth_get_headlen?

> [   19.388938]  [<ffffffff817c1d12>] ? cpuidle_enter_state+0x122/0x2e0
> [   19.388939]  [<ffffffff817c1f07>] cpuidle_enter+0x17/0x20
> [   19.388942]  [<ffffffff810c64c3>] call_cpuidle+0x23/0x40
> [   19.388944]  [<ffffffff810c66f4>] cpu_startup_entry+0x114/0x200
> [   19.388946]  [<ffffffff81947675>] rest_init+0x85/0x90
> [   19.388950]  [<ffffffff81ffbf5c>] start_kernel+0x407/0x414
> [   19.388952]  [<ffffffff81ffb120>] ? early_idt_handler_array+0x120/0x120
> [   19.388953]  [<ffffffff81ffb2d6>] x86_64_start_reservations+0x2a/0x2c
> [   19.388955]  [<ffffffff81ffb415>] x86_64_start_kernel+0x13d/0x14c
> [   19.388968] Code: 00 04 00 00 c9 c3 48 33 86 70 03 00 00 48 c1 e0 10 4=
8 85 c0 0f b6 87 90 00 00 00 75 28 83 e0 f8 83 c8 01 88 87 90 00 00 00 eb 8=
2 <0f> 0b 0f b6 87 90 00 00 00 83 e0 f8 83 c8 03 88 87 90 00 00 00 =

> [   19.388970] RIP  [<ffffffff81837c48>] eth_type_trans+0xe8/0x140
> [   19.388970]  RSP <ffff88081e803db8>
> [   19.388996] ---[ end trace 107996155a43a15c ]---
> [   19.393422] Kernel panic - not syncing: Fatal exception in interrupt
> =

> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Kernel Test Robot

--===============0043678654033393537==--

