Content-Type: multipart/mixed; boundary="===============1375886136548262355=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@kernel.org>
To: lkp@lists.01.org
Subject: Re: [rcutorture] fbf28ca980: WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog_cr
Date: Mon, 06 Dec 2021 13:54:23 -0800
Message-ID: <20211206215423.GJ641268@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211205150214.GA34140@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1375886136548262355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 05, 2021 at 11:02:14PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: fbf28ca980766d3182971851340d9e89acd3c8c9 ("rcutorture: Combine n_=
max_cbs from all kthreads in a callback flood")
> https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git dev.20=
21.11.30a
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------------------------+--------=
----+------------+
> |                                                               | 594c17c=
381 | fbf28ca980 |
> +---------------------------------------------------------------+--------=
----+------------+
> | boot_successes                                                | 46     =
    | 69         |
> | boot_failures                                                 | 6      =
    | 7          |
> | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog.cold | 6      =
    | 0          |
> | RIP:rcu_torture_fwd_prog.cold                                 | 6      =
    | 0          |
> | WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_fwd_prog_cr   | 0      =
    | 6          |
> | RIP:rcu_torture_fwd_prog_cr                                   | 0      =
    | 6          |
> | BUG:workqueue_lockup-pool                                     | 0      =
    | 1          |
> +---------------------------------------------------------------+--------=
----+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [ 107.982759][ T108] WARNING: CPU: 1 PID: 108 at kernel/rcu/rcutorture.c:=
2425 rcu_torture_fwd_prog_cr (rcutorture.c:?) =


This commit is obsolete and replaced by fbf28ca98076 ("rcutorture:
Combine n_max_cbs from all kthreads in a callback flood").  I saw this
same error last week, but fixed it elsewhere.  I believe that this commit
was simply in the wrong place at the wrong time.

							Thanx, Paul

> [  107.984375][  T108] Modules linked in:
> [  107.985183][  T108] CPU: 1 PID: 108 Comm: rcu_torture_fwd Not tainted =
5.16.0-rc1-00108-gfbf28ca98076 #1
> [ 107.986548][ T108] RIP: 0010:rcu_torture_fwd_prog_cr (rcutorture.c:?) =

> [ 107.987435][ T108] Code: 9f f0 02 00 48 8b 75 d0 74 19 48 8b 05 30 88 e=
f 02 48 8b 15 d9 de 53 01 48 2d b8 0b 00 00 48 39 d0 78 5f 49 83 fd 63 7f 0=
4 90 <0f> 0b 90 48 8b 45 b0 48 2b 45 c0 4d 8d 04 1e 4d 89 f1 48 8b 55 c8
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	9f                   	lahf   =

>    1:	f0 02 00             	lock add (%rax),%al
>    4:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
>    8:	74 19                	je     0x23
>    a:	48 8b 05 30 88 ef 02 	mov    0x2ef8830(%rip),%rax        # 0x2ef8841
>   11:	48 8b 15 d9 de 53 01 	mov    0x153ded9(%rip),%rdx        # 0x153def1
>   18:	48 2d b8 0b 00 00    	sub    $0xbb8,%rax
>   1e:	48 39 d0             	cmp    %rdx,%rax
>   21:	78 5f                	js     0x82
>   23:	49 83 fd 63          	cmp    $0x63,%r13
>   27:	7f 04                	jg     0x2d
>   29:	90                   	nop
>   2a:*	0f 0b                	ud2    		<-- trapping instruction
>   2c:	90                   	nop
>   2d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
>   31:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
>   35:	4d 8d 04 1e          	lea    (%r14,%rbx,1),%r8
>   39:	4d 89 f1             	mov    %r14,%r9
>   3c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	0f 0b                	ud2    =

>    2:	90                   	nop
>    3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
>    7:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
>    b:	4d 8d 04 1e          	lea    (%r14,%rbx,1),%r8
>    f:	4d 89 f1             	mov    %r14,%r9
>   12:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
> [  107.990053][  T108] RSP: 0018:ffff9af74679be70 EFLAGS: 00010293
> [  107.990896][  T108] RAX: 0000000000000000 RBX: 00000000000155ea RCX: f=
fff9af742880000
> [  107.991979][  T108] RDX: 0000000000000000 RSI: 000000000000000a RDI: 0=
000000000000002
> [  107.993064][  T108] RBP: ffff9af74679bec0 R08: ffffffffa9779de4 R09: 0=
000000000000000
> [  107.994168][  T108] R10: 0000000000000005 R11: 0000000000000000 R12: f=
fff9af746730500
> [  107.995421][  T108] R13: 0000000000000000 R14: 00000000000013fe R15: 0=
000000000000000
> [  107.999378][  T108] FS:  0000000000000000(0000) GS:ffff9afa6fc00000(00=
00) knlGS:0000000000000000
> [  108.002563][  T108] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  108.004724][  T108] CR2: 0000000000451c00 CR3: 0000000109931000 CR4: 0=
0000000000406a0
> [  108.006439][  T108] Call Trace:
> [  108.007415][  T108]  <TASK>
> [ 108.008482][ T108] rcu_torture_fwd_prog.cold (rcutorture.c:?) =

> [ 108.010379][ T108] kthread (kthread.c:?) =

> [ 108.011731][ T108] ? rcu_torture_fwd_prog_cbfree (rcutorture.c:?) =

> [ 108.013117][ T108] ? set_kthread_struct (kthread.c:?) =

> [  108.013609][    C0] random: fast init done
> [ 108.014017][ T108] ret_from_fork (??:?) =

> [  108.015690][  T108]  </TASK>
> [  108.016159][  T108] irq event stamp: 719939
> [ 108.017431][ T108] hardirqs last enabled at (719947): __up_console_sem =
(printk.c:?) =

> [ 108.019885][ T108] hardirqs last disabled at (719954): __up_console_sem=
 (printk.c:?) =

> [ 108.022495][ T108] softirqs last enabled at (719928): __do_softirq (??:=
?) =

> [ 108.025442][ T108] softirqs last disabled at (719919): irq_exit_rcu (??=
:?) =

> [  108.026864][  T108] ---[ end trace 3cd8b0ae518c7d60 ]---
> [  108.027603][  T108] rcu_torture_fwd_prog_cr Duration 1012 barrier: 71 =
pending 80726 n_launders: 5118 n_launders_sa: 0 n_max_gps: 0 n_max_cbs: 875=
30 cver 4 gps 10
> [  108.068325][  T108] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 1087 jiffies): 1s/10: 5070:7 2s/10: 49:1 3s/10: 0:1 4s/10:=
 0:0 5s/10: 0:0 6s/10: 0:0 7s/10: 0:0 8s/10: 0:0 9s/10: 0:0 10s/10: 0:0 11s=
/10: 0:0 12s/10: 0:0 13s/10: 0:0 14s/10: 0:0 15s/10: 0:0 16s/10: 0:0 17s/10=
: 0:0 18s/10: 0:0 19s/10: 0:0 20s/10: 0:0 21s/10: 0:0 22s/10: 0:0 23s/10: 0=
:0 24s/10: 0:0 25s/10: 0:0 26s/10: 0:0 27s/10: 0:0 28s/10: 0:0 29s/10: 0:0 =
30s/10: 0:0 31s/10: 0:0 32s/10: 0:0 33s/10: 0:0 34s/10: 0:0 35s/10: 0:0 36s=
/10: 0:0 37s/10: 0:0 38s/10: 0:0 39s/10: 0:0 40s/10: 0:0 41s/10: 0:0 42s/10=
: 0:0 43s/10: 0:0 44s/10: 0:0 45s/10: 0:0 46s/10: 0:0 47s/10: 0:0 48s/10: 0=
:0 49s/10: 0:0 50s/10: 0:0 51s/10: 0:0 52s/10: 0:0 53s/10: 0:0 54s/10: 0:0 =
55s/10: 0:0 56s/10: 0:0 57s/10: 0:0 58s/10: 0:0 59s/10: 0:0 60s/10: 0:0 61s=
/10: 0:0 62s/10: 0:0 63s/10: 0:0 64s/10: 0:0 65s/10: 0:0 66s/10: 0:0 67s/10=
: 0:0 68s/10: 0:0 69s/10: 0:0 70s/10: 0:0 71s/10: 0:0 72s/10: 0:0 73s/10: 0=
:0 74s/10: 0:0
> [  108.070312][  T108]  75s/10: 0:0 76s/10: 0:0 77s/10: 0:0 78s/10: 0:0 7=
9s/10: 0:0 80s/10: 0:0 81s/10: 0:0 82s/10: 0:0 83s/10: 0:0 84s/10: 0:0 85s/=
10: 0:0 86s/10: 0:0 87s/10: 0:0 88s/10: 0:0 89s/10: 0:0 90s/10: 0:0 91s/10:=
 0:0 92s/10: 0:0 93s/10: 0:0 94s/10: 0:0 95s/10: 0:0 96s/10: 0:0 97s/10: 0:=
0 98s/10: 0:0 99s/10: 0:0 100s/10: 0:0 101s/10: 0:0 102s/10: 41840:599 103s=
/10: 45689:5
> [  110.425161][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  110.606557][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  134.105192][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  134.266983][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  157.865219][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  158.221327][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  158.495970][  T105] rcu-torture: rtc: (____ptrval____) ver: 668 tfle: =
0 rta: 668 rtaf: 0 rtf: 658 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre: 0 =
rtbf: 0 rtb: 0 nt: 2713 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D100) barrier: 0/=
0:0 read-exits: 84 nocb-toggles: 0:0
> [  158.499302][  T105] rcu-torture: Reader Pipe:  3823507 184 0 0 0 0 0 0=
 0 0 0
> [  158.500499][  T105] rcu-torture: Reader Batch:  3822968 723 0 0 0 0 0 =
0 0 0 0
> [  158.501692][  T105] rcu-torture: Free-Block Circulation:  667 666 665 =
664 663 662 661 660 659 658 0
> [  191.083079][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  191.099494][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  211.435818][  T108] rcu_torture_fwd_prog_nr: 0 Duration 10072 cver 731=
 gps 2000
> [  215.072090][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  215.199784][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  219.935137][  T105] rcu-torture: rtc: (____ptrval____) ver: 1147 tfle:=
 0 rta: 1148 rtaf: 0 rtf: 1135 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre:=
 0 rtbf: 0 rtb: 0 nt: 4019 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D100) barrier:=
 0/0:0 read-exits: 118 nocb-toggles: 0:0
> [  219.938575][  T105] rcu-torture: Reader Pipe:  5481892 363 0 0 0 0 0 0=
 0 0 0
> [  219.939738][  T105] rcu-torture: Reader Batch:  5480880 1375 0 0 0 0 0=
 0 0 0 0
> [  219.940916][  T105] rcu-torture: Free-Block Circulation:  1147 1146 11=
45 1144 1143 1140 1138 1137 1136 1135 0
> [  238.175205][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  238.251671][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  261.135147][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  264.513342][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  276.256194][  T108] rcu_torture_fwd_prog n_max_cbs: 87530
> [  276.257229][  T108] rcu_torture_fwd_prog: Starting forward-progress te=
st 0
> [  276.664408][  T108] rcu_torture_fwd_prog_cr Duration 21 barrier: 13 pe=
nding 207 n_launders: 18179 n_launders_sa: 103 n_max_gps: 100 n_max_cbs: 11=
546 cver 7 gps 10
> [  276.666736][  T108] rcu_torture_fwd_cb_hist: Callback-invocation histo=
gram 0 (duration 35 jiffies): 1s/10: 7297:4 2s/10: 15930:5 3s/10: 6498:4
> [  281.375125][  T105] rcu-torture: rtc: (____ptrval____) ver: 1654 tfle:=
 0 rta: 1655 rtaf: 0 rtf: 1642 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre:=
 0 rtbf: 0 rtb: 0 nt: 5642 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D100) barrier:=
 0/0:0 read-exits: 152 nocb-toggles: 0:0
> [  281.378352][  T105] rcu-torture: Reader Pipe:  7999219 468 0 0 0 0 0 0=
 0 0 0
> [  281.379560][  T105] rcu-torture: Reader Batch:  7997641 2046 0 0 0 0 0=
 0 0 0 0
> [  281.380780][  T105] rcu-torture: Free-Block Circulation:  1654 1652 16=
51 1650 1649 1648 1646 1645 1644 1642 0
> [  295.695160][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  296.025150][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  319.475119][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  319.755088][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  342.655116][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  342.710711][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  342.815037][  T105] rcu-torture: rtc: (____ptrval____) ver: 2147 tfle:=
 0 rta: 2148 rtaf: 0 rtf: 2138 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre:=
 0 rtbf: 0 rtb: 0 nt: 6956 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D100) barrier:=
 0/0:0 read-exits: 203 nocb-toggles: 0:0
> [  342.818444][  T105] rcu-torture: Reader Pipe:  9582691 649 0 0 0 0 0 0=
 0 0 0
> [  342.819666][  T105] rcu-torture: Reader Batch:  9580709 2631 0 0 0 0 0=
 0 0 0 0
> [  342.820848][  T105] rcu-torture: Free-Block Circulation:  2147 2146 21=
45 2144 2143 2142 2141 2140 2139 2138 0
> [  358.395405][  T108] rcu_torture_fwd_prog_nr: 0 Duration 8066 cver 632 =
gps 1623
> [  364.175549][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  364.205147][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  395.805395][  T109] rcu-torture: rcu_torture_read_exit: Start of episo=
de
> [  395.904826][  T109] rcu-torture: rcu_torture_read_exit: End of episode
> [  404.255063][  T105] rcu-torture: rtc: (____ptrval____) ver: 2559 tfle:=
 0 rta: 2560 rtaf: 0 rtf: 2547 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbre:=
 0 rtbf: 0 rtb: 0 nt: 8561 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=3D100) barrier:=
 0/0:0 read-exits: 237 nocb-toggles: 0:0
> [  404.258480][  T105] rcu-torture: Reader Pipe:  11924782 763 0 0 0 0 0 =
0 0 0 0
> [  404.259552][  T105] rcu-torture: Reader Batch:  11922342 3203 0 0 0 0 =
0 0 0 0 0
> [  404.260628][  T105] rcu-torture: Free-Block Circulation:  2559 2558 25=
57 2556 2553 2551 2550 2549 2548 2547 0
> [  417.144155][  T579] sysrq: Emergency Sync
> [  417.145946][   T20] Emergency Sync complete
> [  417.156158][  T579] sysrq: Resetting
> =

> Kboot worker: lkp-worker06
> Elapsed time: 480
> =

> kvm=3D(
> qemu-system-x86_64
> -enable-kvm
> -cpu SandyBridge
> -kernel $kernel
> -initrd initrd-vm-snb-159.cgz
> -m 16384
> -smp 2
> -device e1000,netdev=3Dnet0
> -netdev user,id=3Dnet0,hostfwd=3Dtcp::32032-:22
> -boot order=3Dnc
> -no-reboot
> -watchdog i6300esb
> -watchdog-action debug
> -rtc base=3Dlocaltime
> -serial stdio
> -display none
> -monitor null
> )
> =

> append=3D(
> ip=3D::::vm-snb-159::dhcp
> root=3D/dev/ram0
> user=3Dlkp
> job=3D/job-script
> ARCH=3Dx86_64
> kconfig=3Dx86_64-randconfig-r012-20211128
> branch=3Dpaulmck-rcu/dev.2021.11.30a
> commit=3Dfbf28ca980766d3182971851340d9e89acd3c8c9
> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-r012-20211128/gcc-9/fbf28ca9807=
66d3182971851340d9e89acd3c8c9/vmlinuz-5.16.0-rc1-00108-gfbf28ca98076
> vmalloc=3D128M
> initramfs_async=3D0
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.16.0-rc1-00108-gfbf28ca98076 .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage modules
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> =

> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
> =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.16.0-rc1 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_CLANG_VERSION=3D0
> CONFIG_AS_IS_GNU=3Dy
> CONFIG_AS_VERSION=3D23502
> CONFIG_LD_IS_BFD=3Dy
> CONFIG_LD_VERSION=3D23502
> CONFIG_LLD_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_CAN_LINK_STATIC=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> # CONFIG_WERROR is not set
> CONFIG_UAPI_HEADER_TEST=3Dy
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> CONFIG_HAVE_KERNEL_ZSTD=3Dy
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> CONFIG_KERNEL_LZ4=3Dy
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> CONFIG_WATCH_QUEUE=3Dy
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> # CONFIG_USELIB is not set
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_MSI_IOMMU=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> CONFIG_TIME_KUNIT_TEST=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=3Dy
> # CONFIG_NO_HZ_FULL is not set
> CONFIG_CONTEXT_TRACKING=3Dy
> CONFIG_CONTEXT_TRACKING_FORCE=3Dy
> # CONFIG_NO_HZ is not set
> # CONFIG_HIGH_RES_TIMERS is not set
> # end of Timers subsystem
> =

> CONFIG_BPF=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> =

> #
> # BPF subsystem
> #
> CONFIG_BPF_SYSCALL=3Dy
> # CONFIG_BPF_JIT is not set
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dy
> CONFIG_USERMODE_DRIVER=3Dy
> # CONFIG_BPF_PRELOAD is not set
> # end of BPF subsystem
> =

> CONFIG_PREEMPT_BUILD=3Dy
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_PREEMPTION=3Dy
> CONFIG_PREEMPT_DYNAMIC=3Dy
> CONFIG_SCHED_CORE=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> # CONFIG_TICK_CPU_ACCOUNTING is not set
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> CONFIG_PREEMPT_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_FANOUT=3D64
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_BOOST is not set
> CONFIG_RCU_NOCB_CPU=3Dy
> CONFIG_TASKS_TRACE_RCU_READ_MB=3Dy
> # end of RCU Subsystem
> =

> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> # CONFIG_IKHEADERS is not set
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_PRINTK_INDEX=3Dy
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # end of Scheduler features
> =

> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CC_HAS_INT128=3Dy
> CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> # CONFIG_RT_GROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CPUSETS=3Dy
> # CONFIG_PROC_PID_CPUSET is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_BPF=3Dy
> CONFIG_CGROUP_MISC=3Dy
> CONFIG_CGROUP_DEBUG=3Dy
> CONFIG_SOCK_CGROUP_DATA=3Dy
> # CONFIG_NAMESPACES is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> CONFIG_RD_ZSTD=3Dy
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_LD_ORPHAN_WARN=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> # CONFIG_SGETMASK_SYSCALL is not set
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_FHANDLE=3Dy
> # CONFIG_POSIX_TIMERS is not set
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> # CONFIG_AIO is not set
> # CONFIG_IO_URING is not set
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_KCMP=3Dy
> CONFIG_RSEQ=3Dy
> CONFIG_DEBUG_RSEQ=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PERF_USE_VMALLOC=3Dy
> CONFIG_PC104=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> # end of Kernel Performance Events And Counters
> =

> # CONFIG_VM_EVENT_COUNTERS is not set
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB=3Dy
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_NR_GPIO=3D1024
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_X2APIC is not set
> # CONFIG_X86_MPPARSE is not set
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> # CONFIG_X86_CPU_RESCTRL is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_VSMP is not set
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_MID is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> CONFIG_PVH=3Dy
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_JAILHOUSE_GUEST=3Dy
> # CONFIG_ACRN_GUEST is not set
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> # CONFIG_CPU_SUP_CENTAUR is not set
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> # CONFIG_GART_IOMMU is not set
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
> CONFIG_NR_CPUS_RANGE_END=3D8192
> CONFIG_NR_CPUS_DEFAULT=3D8192
> CONFIG_NR_CPUS=3D8192
> CONFIG_SCHED_CLUSTER=3Dy
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> # CONFIG_SCHED_MC_PRIO is not set
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> # CONFIG_X86_MCE is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> # CONFIG_PERF_EVENTS_INTEL_RAPL is not set
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> # CONFIG_PERF_EVENTS_AMD_UNCORE is not set
> # end of Performance monitoring
> =

> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> # CONFIG_X86_IOPL_IOPERM is not set
> # CONFIG_I8K is not set
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_X86_5LEVEL=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> # CONFIG_AMD_MEM_ENCRYPT is not set
> # CONFIG_NUMA is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> # CONFIG_X86_SMAP is not set
> # CONFIG_X86_UMIP is not set
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_OFF is not set
> CONFIG_X86_INTEL_TSX_MODE_ON=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> # CONFIG_X86_SGX is not set
> CONFIG_EFI=3Dy
> # CONFIG_EFI_STUB is not set
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> CONFIG_KEXEC=3Dy
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> # CONFIG_KEXEC_SIG is not set
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> CONFIG_RANDOMIZE_MEMORY=3Dy
> CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0x0
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> # CONFIG_STRICT_SIGALTSTACK_SIZE is not set
> CONFIG_HAVE_LIVEPATCH=3Dy
> # end of Processor type and features
> =

> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_SUSPEND_SKIP_SYNC=3Dy
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> # CONFIG_PM_WAKELOCKS_GC is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> CONFIG_ACPI_FPDT=3Dy
> CONFIG_ACPI_LPIT=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> # CONFIG_ACPI_BUTTON is not set
> # CONFIG_ACPI_TINY_POWER_BUTTON is not set
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_TAD=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dy
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_PLATFORM_PROFILE=3Dy
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> CONFIG_ACPI_HED=3Dy
> CONFIG_ACPI_CUSTOM_METHOD=3Dy
> CONFIG_ACPI_BGRT=3Dy
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_ACPI_DPTF is not set
> CONFIG_ACPI_WATCHDOG=3Dy
> CONFIG_ACPI_CONFIGFS=3Dy
> # CONFIG_PMIC_OPREGION is not set
> CONFIG_ACPI_VIOT=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> # CONFIG_ACPI_PRMT is not set
> =

> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> # CONFIG_INTEL_IDLE is not set
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> # CONFIG_ISA_BUS is not set
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> # CONFIG_IA32_EMULATION is not set
> # CONFIG_X86_X32 is not set
> # end of Binary Emulations
> =

> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_GENERIC_ENTRY=3Dy
> # CONFIG_KPROBES is not set
> # CONFIG_JUMP_LABEL is not set
> CONFIG_STATIC_CALL_SELFTEST=3Dy
> CONFIG_UPROBES=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_ARCH_WANTS_NO_INSTR=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> # CONFIG_SECCOMP_CACHE_DEBUG is not set
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> # CONFIG_STACKPROTECTOR is not set
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> CONFIG_LTO_NONE=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PUD=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> # CONFIG_VMAP_STACK is not set
> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> CONFIG_LOCK_EVENT_COUNTS=3Dy
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_HAVE_STATIC_CALL=3Dy
> CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
> CONFIG_DYNAMIC_SIGFRAME=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> # CONFIG_MODULE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> CONFIG_MODULE_COMPRESS_NONE=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> # CONFIG_MODULE_COMPRESS_XZ is not set
> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> # CONFIG_TRIM_UNUSED_KSYMS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_EXCLUSIVE_SYSTEM_RAM=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_COMPACTION=3Dy
> # CONFIG_PAGE_REPORTING is not set
> CONFIG_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> # CONFIG_CLEANCACHE is not set
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> CONFIG_CMA_DEBUGFS=3Dy
> CONFIG_CMA_SYSFS=3Dy
> CONFIG_CMA_AREAS=3D7
> # CONFIG_MEM_SOFT_DIRTY is not set
> CONFIG_ZPOOL=3Dy
> # CONFIG_ZBUD is not set
> # CONFIG_Z3FOLD is not set
> CONFIG_ZSMALLOC=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> CONFIG_PAGE_IDLE_FLAG=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> CONFIG_ARCH_HAS_ZONE_DMA_SET=3Dy
> # CONFIG_ZONE_DMA is not set
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_HMM_MIRROR=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> CONFIG_PERCPU_STATS=3Dy
> # CONFIG_GUP_TEST is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> =

> #
> # Data Access Monitoring
> #
> # CONFIG_DAMON is not set
> # end of Data Access Monitoring
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_SKB_EXTENSIONS=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> # CONFIG_PACKET_DIAG is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_AF_UNIX_OOB=3Dy
> # CONFIG_UNIX_DIAG is not set
> CONFIG_TLS=3Dy
> # CONFIG_TLS_DEVICE is not set
> CONFIG_TLS_TOE=3Dy
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_OFFLOAD=3Dy
> CONFIG_XFRM_ALGO=3Dy
> CONFIG_XFRM_USER=3Dy
> CONFIG_XFRM_INTERFACE=3Dy
> # CONFIG_XFRM_SUB_POLICY is not set
> # CONFIG_XFRM_MIGRATE is not set
> # CONFIG_XFRM_STATISTICS is not set
> CONFIG_XFRM_AH=3Dy
> CONFIG_XFRM_ESP=3Dy
> CONFIG_XFRM_IPCOMP=3Dy
> # CONFIG_NET_KEY is not set
> CONFIG_XFRM_ESPINTCP=3Dy
> CONFIG_SMC=3Dy
> CONFIG_SMC_DIAG=3Dy
> CONFIG_XDP_SOCKETS=3Dy
> CONFIG_XDP_SOCKETS_DIAG=3Dy
> CONFIG_INET=3Dy
> # CONFIG_IP_MULTICAST is not set
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> CONFIG_IP_FIB_TRIE_STATS=3Dy
> # CONFIG_IP_MULTIPLE_TABLES is not set
> CONFIG_IP_ROUTE_MULTIPATH=3Dy
> # CONFIG_IP_ROUTE_VERBOSE is not set
> CONFIG_IP_ROUTE_CLASSID=3Dy
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> CONFIG_IP_PNP_RARP=3Dy
> CONFIG_NET_IPIP=3Dy
> # CONFIG_NET_IPGRE_DEMUX is not set
> CONFIG_NET_IP_TUNNEL=3Dy
> # CONFIG_SYN_COOKIES is not set
> CONFIG_NET_IPVTI=3Dy
> CONFIG_NET_UDP_TUNNEL=3Dy
> CONFIG_NET_FOU=3Dy
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> CONFIG_INET_AH=3Dy
> CONFIG_INET_ESP=3Dy
> CONFIG_INET_ESP_OFFLOAD=3Dy
> # CONFIG_INET_ESPINTCP is not set
> CONFIG_INET_IPCOMP=3Dy
> CONFIG_INET_XFRM_TUNNEL=3Dy
> CONFIG_INET_TUNNEL=3Dy
> CONFIG_INET_DIAG=3Dy
> CONFIG_INET_TCP_DIAG=3Dy
> CONFIG_INET_UDP_DIAG=3Dy
> CONFIG_INET_RAW_DIAG=3Dy
> # CONFIG_INET_DIAG_DESTROY is not set
> CONFIG_TCP_CONG_ADVANCED=3Dy
> # CONFIG_TCP_CONG_BIC is not set
> # CONFIG_TCP_CONG_CUBIC is not set
> # CONFIG_TCP_CONG_WESTWOOD is not set
> CONFIG_TCP_CONG_HTCP=3Dy
> # CONFIG_TCP_CONG_HSTCP is not set
> CONFIG_TCP_CONG_HYBLA=3Dy
> CONFIG_TCP_CONG_VEGAS=3Dy
> CONFIG_TCP_CONG_NV=3Dy
> CONFIG_TCP_CONG_SCALABLE=3Dy
> CONFIG_TCP_CONG_LP=3Dy
> # CONFIG_TCP_CONG_VENO is not set
> CONFIG_TCP_CONG_YEAH=3Dy
> # CONFIG_TCP_CONG_ILLINOIS is not set
> CONFIG_TCP_CONG_DCTCP=3Dy
> CONFIG_TCP_CONG_CDG=3Dy
> # CONFIG_TCP_CONG_BBR is not set
> CONFIG_DEFAULT_HTCP=3Dy
> # CONFIG_DEFAULT_HYBLA is not set
> # CONFIG_DEFAULT_VEGAS is not set
> # CONFIG_DEFAULT_DCTCP is not set
> # CONFIG_DEFAULT_CDG is not set
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG=3D"htcp"
> # CONFIG_TCP_MD5SIG is not set
> CONFIG_IPV6=3Dy
> CONFIG_IPV6_ROUTER_PREF=3Dy
> # CONFIG_IPV6_ROUTE_INFO is not set
> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> # CONFIG_INET6_AH is not set
> CONFIG_INET6_ESP=3Dy
> CONFIG_INET6_ESP_OFFLOAD=3Dy
> CONFIG_INET6_ESPINTCP=3Dy
> CONFIG_INET6_IPCOMP=3Dy
> CONFIG_IPV6_MIP6=3Dy
> CONFIG_INET6_XFRM_TUNNEL=3Dy
> CONFIG_INET6_TUNNEL=3Dy
> CONFIG_IPV6_VTI=3Dy
> CONFIG_IPV6_SIT=3Dy
> # CONFIG_IPV6_SIT_6RD is not set
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> CONFIG_IPV6_TUNNEL=3Dy
> CONFIG_IPV6_FOU=3Dy
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> # CONFIG_IPV6_MROUTE is not set
> CONFIG_IPV6_SEG6_LWTUNNEL=3Dy
> # CONFIG_IPV6_SEG6_HMAC is not set
> CONFIG_IPV6_SEG6_BPF=3Dy
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> CONFIG_IPV6_IOAM6_LWTUNNEL=3Dy
> # CONFIG_NETLABEL is not set
> # CONFIG_MPTCP is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> # CONFIG_NETFILTER is not set
> CONFIG_BPFILTER=3Dy
> CONFIG_BPFILTER_UMH=3Dy
> CONFIG_IP_DCCP=3Dy
> CONFIG_INET_DCCP_DIAG=3Dy
> =

> #
> # DCCP CCIDs Configuration
> #
> # CONFIG_IP_DCCP_CCID2_DEBUG is not set
> CONFIG_IP_DCCP_CCID3=3Dy
> CONFIG_IP_DCCP_CCID3_DEBUG=3Dy
> CONFIG_IP_DCCP_TFRC_LIB=3Dy
> CONFIG_IP_DCCP_TFRC_DEBUG=3Dy
> # end of DCCP CCIDs Configuration
> =

> #
> # DCCP Kernel Hacking
> #
> # CONFIG_IP_DCCP_DEBUG is not set
> # end of DCCP Kernel Hacking
> =

> CONFIG_IP_SCTP=3Dy
> # CONFIG_SCTP_DBG_OBJCNT is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> CONFIG_INET_SCTP_DIAG=3Dy
> # CONFIG_RDS is not set
> CONFIG_TIPC=3Dy
> # CONFIG_TIPC_MEDIA_UDP is not set
> # CONFIG_TIPC_CRYPTO is not set
> # CONFIG_TIPC_DIAG is not set
> CONFIG_ATM=3Dy
> CONFIG_ATM_CLIP=3Dy
> CONFIG_ATM_CLIP_NO_ICMP=3Dy
> CONFIG_ATM_LANE=3Dy
> # CONFIG_ATM_MPOA is not set
> CONFIG_ATM_BR2684=3Dy
> # CONFIG_ATM_BR2684_IPFILTER is not set
> CONFIG_L2TP=3Dy
> CONFIG_L2TP_DEBUGFS=3Dy
> # CONFIG_L2TP_V3 is not set
> CONFIG_STP=3Dy
> CONFIG_GARP=3Dy
> CONFIG_BRIDGE=3Dy
> # CONFIG_BRIDGE_IGMP_SNOOPING is not set
> # CONFIG_BRIDGE_VLAN_FILTERING is not set
> CONFIG_BRIDGE_MRP=3Dy
> CONFIG_BRIDGE_CFM=3Dy
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dy
> CONFIG_VLAN_8021Q_GVRP=3Dy
> # CONFIG_VLAN_8021Q_MVRP is not set
> CONFIG_DECNET=3Dy
> CONFIG_DECNET_ROUTER=3Dy
> CONFIG_LLC=3Dy
> CONFIG_LLC2=3Dy
> # CONFIG_ATALK is not set
> CONFIG_X25=3Dy
> # CONFIG_LAPB is not set
> CONFIG_PHONET=3Dy
> CONFIG_6LOWPAN=3Dy
> # CONFIG_6LOWPAN_DEBUGFS is not set
> # CONFIG_6LOWPAN_NHC is not set
> CONFIG_IEEE802154=3Dy
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> # CONFIG_IEEE802154_SOCKET is not set
> # CONFIG_IEEE802154_6LOWPAN is not set
> CONFIG_MAC802154=3Dy
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dy
> CONFIG_NET_SCH_HTB=3Dy
> CONFIG_NET_SCH_HFSC=3Dy
> CONFIG_NET_SCH_ATM=3Dy
> CONFIG_NET_SCH_PRIO=3Dy
> CONFIG_NET_SCH_MULTIQ=3Dy
> CONFIG_NET_SCH_RED=3Dy
> # CONFIG_NET_SCH_SFB is not set
> CONFIG_NET_SCH_SFQ=3Dy
> # CONFIG_NET_SCH_TEQL is not set
> CONFIG_NET_SCH_TBF=3Dy
> CONFIG_NET_SCH_CBS=3Dy
> CONFIG_NET_SCH_ETF=3Dy
> # CONFIG_NET_SCH_TAPRIO is not set
> # CONFIG_NET_SCH_GRED is not set
> CONFIG_NET_SCH_DSMARK=3Dy
> CONFIG_NET_SCH_NETEM=3Dy
> # CONFIG_NET_SCH_DRR is not set
> CONFIG_NET_SCH_MQPRIO=3Dy
> CONFIG_NET_SCH_SKBPRIO=3Dy
> CONFIG_NET_SCH_CHOKE=3Dy
> CONFIG_NET_SCH_QFQ=3Dy
> # CONFIG_NET_SCH_CODEL is not set
> CONFIG_NET_SCH_FQ_CODEL=3Dy
> # CONFIG_NET_SCH_CAKE is not set
> CONFIG_NET_SCH_FQ=3Dy
> # CONFIG_NET_SCH_HHF is not set
> # CONFIG_NET_SCH_PIE is not set
> CONFIG_NET_SCH_PLUG=3Dy
> # CONFIG_NET_SCH_ETS is not set
> # CONFIG_NET_SCH_DEFAULT is not set
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> # CONFIG_NET_CLS_BASIC is not set
> # CONFIG_NET_CLS_TCINDEX is not set
> CONFIG_NET_CLS_ROUTE4=3Dy
> # CONFIG_NET_CLS_FW is not set
> CONFIG_NET_CLS_U32=3Dy
> # CONFIG_CLS_U32_PERF is not set
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dy
> # CONFIG_NET_CLS_RSVP6 is not set
> CONFIG_NET_CLS_FLOW=3Dy
> # CONFIG_NET_CLS_CGROUP is not set
> # CONFIG_NET_CLS_BPF is not set
> CONFIG_NET_CLS_FLOWER=3Dy
> # CONFIG_NET_CLS_MATCHALL is not set
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dy
> # CONFIG_NET_EMATCH_NBYTE is not set
> # CONFIG_NET_EMATCH_U32 is not set
> CONFIG_NET_EMATCH_META=3Dy
> # CONFIG_NET_EMATCH_TEXT is not set
> CONFIG_NET_EMATCH_CANID=3Dy
> # CONFIG_NET_CLS_ACT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dy
> CONFIG_BATMAN_ADV=3Dy
> # CONFIG_BATMAN_ADV_BATMAN_V is not set
> CONFIG_BATMAN_ADV_BLA=3Dy
> # CONFIG_BATMAN_ADV_DAT is not set
> # CONFIG_BATMAN_ADV_NC is not set
> # CONFIG_BATMAN_ADV_MCAST is not set
> # CONFIG_BATMAN_ADV_DEBUG is not set
> CONFIG_BATMAN_ADV_TRACING=3Dy
> CONFIG_OPENVSWITCH=3Dy
> CONFIG_VSOCKETS=3Dy
> CONFIG_VSOCKETS_DIAG=3Dy
> CONFIG_VSOCKETS_LOOPBACK=3Dy
> CONFIG_VIRTIO_VSOCKETS=3Dy
> CONFIG_VIRTIO_VSOCKETS_COMMON=3Dy
> CONFIG_NETLINK_DIAG=3Dy
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> # CONFIG_MPLS_ROUTING is not set
> CONFIG_NET_NSH=3Dy
> CONFIG_HSR=3Dy
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> CONFIG_QRTR=3Dy
> CONFIG_QRTR_SMD=3Dy
> CONFIG_QRTR_TUN=3Dy
> CONFIG_QRTR_MHI=3Dy
> # CONFIG_NET_NCSI is not set
> CONFIG_PCPU_DEV_REFCNT=3Dy
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
> CONFIG_XPS=3Dy
> CONFIG_CGROUP_NET_PRIO=3Dy
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> # CONFIG_BPF_STREAM_PARSER is not set
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_NET_DROP_MONITOR is not set
> # end of Network testing
> # end of Networking options
> =

> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> CONFIG_AX25=3Dy
> CONFIG_AX25_DAMA_SLAVE=3Dy
> CONFIG_NETROM=3Dy
> CONFIG_ROSE=3Dy
> =

> #
> # AX.25 network device drivers
> #
> # CONFIG_MKISS is not set
> # CONFIG_6PACK is not set
> CONFIG_BPQETHER=3Dy
> # CONFIG_BAYCOM_SER_FDX is not set
> CONFIG_BAYCOM_SER_HDX=3Dy
> # CONFIG_BAYCOM_PAR is not set
> CONFIG_YAM=3Dy
> # end of AX.25 network device drivers
> =

> CONFIG_CAN=3Dy
> # CONFIG_CAN_RAW is not set
> # CONFIG_CAN_BCM is not set
> # CONFIG_CAN_GW is not set
> # CONFIG_CAN_J1939 is not set
> # CONFIG_CAN_ISOTP is not set
> =

> #
> # CAN Device Drivers
> #
> CONFIG_CAN_VCAN=3Dy
> # CONFIG_CAN_VXCAN is not set
> # CONFIG_CAN_SLCAN is not set
> # CONFIG_CAN_DEV is not set
> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> # CONFIG_BT is not set
> CONFIG_AF_RXRPC=3Dy
> # CONFIG_AF_RXRPC_IPV6 is not set
> # CONFIG_AF_RXRPC_INJECT_LOSS is not set
> # CONFIG_AF_RXRPC_DEBUG is not set
> CONFIG_RXKAD=3Dy
> CONFIG_AF_KCM=3Dy
> CONFIG_STREAM_PARSER=3Dy
> CONFIG_MCTP=3Dy
> CONFIG_MCTP_TEST=3Dy
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_RFKILL=3Dy
> CONFIG_RFKILL_LEDS=3Dy
> CONFIG_RFKILL_INPUT=3Dy
> CONFIG_RFKILL_GPIO=3Dy
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_DEBUG is not set
> # CONFIG_CAIF is not set
> CONFIG_CEPH_LIB=3Dy
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> # CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
> CONFIG_NFC=3Dy
> CONFIG_NFC_DIGITAL=3Dy
> CONFIG_NFC_NCI=3Dy
> # CONFIG_NFC_NCI_UART is not set
> CONFIG_NFC_HCI=3Dy
> CONFIG_NFC_SHDLC=3Dy
> =

> #
> # Near Field Communication (NFC) devices
> #
> CONFIG_NFC_MEI_PHY=3Dy
> CONFIG_NFC_SIM=3Dy
> # CONFIG_NFC_VIRTUAL_NCI is not set
> CONFIG_NFC_FDP=3Dy
> CONFIG_NFC_FDP_I2C=3Dy
> CONFIG_NFC_PN544=3Dy
> CONFIG_NFC_PN544_I2C=3Dy
> # CONFIG_NFC_PN544_MEI is not set
> CONFIG_NFC_PN533=3Dy
> CONFIG_NFC_PN533_I2C=3Dy
> # CONFIG_NFC_PN532_UART is not set
> CONFIG_NFC_MICROREAD=3Dy
> CONFIG_NFC_MICROREAD_I2C=3Dy
> # CONFIG_NFC_MICROREAD_MEI is not set
> # CONFIG_NFC_ST21NFCA_I2C is not set
> # CONFIG_NFC_ST_NCI_I2C is not set
> CONFIG_NFC_NXP_NCI=3Dy
> # CONFIG_NFC_NXP_NCI_I2C is not set
> CONFIG_NFC_S3FWRN5=3Dy
> CONFIG_NFC_S3FWRN5_I2C=3Dy
> CONFIG_NFC_S3FWRN82_UART=3Dy
> # end of Near Field Communication (NFC) devices
> =

> CONFIG_PSAMPLE=3Dy
> CONFIG_NET_IFE=3Dy
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> CONFIG_FAILOVER=3Dy
> CONFIG_ETHTOOL_NETLINK=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> CONFIG_EISA=3Dy
> # CONFIG_EISA_VLB_PRIMING is not set
> CONFIG_EISA_PCI_EISA=3Dy
> # CONFIG_EISA_VIRTUAL_ROOT is not set
> # CONFIG_EISA_NAMES is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> # CONFIG_PCIEASPM is not set
> CONFIG_PCIE_PTM=3Dy
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
> # CONFIG_PCI_STUB is not set
> CONFIG_PCI_PF_STUB=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_ECAM=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> CONFIG_PCI_PRI=3Dy
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_PCIE_BUS_TUNE_OFF is not set
> # CONFIG_PCIE_BUS_DEFAULT is not set
> # CONFIG_PCIE_BUS_SAFE is not set
> CONFIG_PCIE_BUS_PERFORMANCE=3Dy
> # CONFIG_PCIE_BUS_PEER2PEER is not set
> CONFIG_HOTPLUG_PCI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI=3Dy
> # CONFIG_HOTPLUG_PCI_ACPI_IBM is not set
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> CONFIG_HOTPLUG_PCI_SHPC=3Dy
> =

> #
> # PCI controller drivers
> #
> CONFIG_PCI_FTPCI100=3Dy
> CONFIG_PCI_HOST_COMMON=3Dy
> CONFIG_PCI_HOST_GENERIC=3Dy
> # CONFIG_PCIE_XILINX is not set
> # CONFIG_VMD is not set
> CONFIG_PCIE_MICROCHIP_HOST=3Dy
> =

> #
> # DesignWare PCI Core Support
> #
> CONFIG_PCIE_DW=3Dy
> CONFIG_PCIE_DW_HOST=3Dy
> CONFIG_PCIE_DW_EP=3Dy
> CONFIG_PCIE_DW_PLAT=3Dy
> CONFIG_PCIE_DW_PLAT_HOST=3Dy
> CONFIG_PCIE_DW_PLAT_EP=3Dy
> # CONFIG_PCIE_INTEL_GW is not set
> CONFIG_PCI_MESON=3Dy
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> CONFIG_PCIE_CADENCE=3Dy
> CONFIG_PCIE_CADENCE_HOST=3Dy
> CONFIG_PCIE_CADENCE_EP=3Dy
> CONFIG_PCIE_CADENCE_PLAT=3Dy
> CONFIG_PCIE_CADENCE_PLAT_HOST=3Dy
> CONFIG_PCIE_CADENCE_PLAT_EP=3Dy
> CONFIG_PCI_J721E=3Dy
> CONFIG_PCI_J721E_HOST=3Dy
> # CONFIG_PCI_J721E_EP is not set
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> CONFIG_PCI_ENDPOINT=3Dy
> CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
> CONFIG_PCI_EPF_TEST=3Dy
> CONFIG_PCI_EPF_NTB=3Dy
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=3Dy
> # end of PCI switch controller drivers
> =

> CONFIG_CXL_BUS=3Dy
> # CONFIG_CXL_MEM is not set
> CONFIG_CXL_ACPI=3Dy
> # CONFIG_PCCARD is not set
> CONFIG_RAPIDIO=3Dy
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
> CONFIG_RAPIDIO_DEBUG=3Dy
> CONFIG_RAPIDIO_ENUM_BASIC=3Dy
> # CONFIG_RAPIDIO_CHMAN is not set
> CONFIG_RAPIDIO_MPORT_CDEV=3Dy
> =

> #
> # RapidIO Switch drivers
> #
> CONFIG_RAPIDIO_TSI57X=3Dy
> CONFIG_RAPIDIO_CPS_XX=3Dy
> CONFIG_RAPIDIO_TSI568=3Dy
> CONFIG_RAPIDIO_CPS_GEN2=3Dy
> # CONFIG_RAPIDIO_RXS_GEN3 is not set
> # end of RapidIO Switch drivers
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> # CONFIG_STANDALONE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> # CONFIG_FW_LOADER_COMPRESS is not set
> # CONFIG_FW_CACHE is not set
> # end of Firmware loader
> =

> CONFIG_WANT_DEV_COREDUMP=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_PM_QOS_KUNIT_TEST=3Dy
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_DRIVER_PE_KUNIT_TEST=3Dy
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SLIMBUS=3Dy
> CONFIG_REGMAP_SPMI=3Dy
> CONFIG_REGMAP_W1=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> CONFIG_MHI_BUS=3Dy
> CONFIG_MHI_BUS_DEBUG=3Dy
> CONFIG_MHI_BUS_PCI_GENERIC=3Dy
> # end of Bus devices
> =

> CONFIG_CONNECTOR=3Dy
> # CONFIG_PROC_EVENTS is not set
> =

> #
> # Firmware Drivers
> #
> =

> #
> # ARM System Control and Management Interface Protocol
> #
> # end of ARM System Control and Management Interface Protocol
> =

> CONFIG_EDD=3Dy
> # CONFIG_EDD_OFF is not set
> # CONFIG_FIRMWARE_MEMMAP is not set
> CONFIG_FW_CFG_SYSFS=3Dy
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> CONFIG_SYSFB=3Dy
> # CONFIG_SYSFB_SIMPLEFB is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> # CONFIG_GOOGLE_COREBOOT_TABLE is not set
> =

> #
> # EFI (Extensible Firmware Interface) Support
> #
> # CONFIG_EFI_VARS is not set
> CONFIG_EFI_ESRT=3Dy
> # CONFIG_EFI_RUNTIME_MAP is not set
> # CONFIG_EFI_FAKE_MEMMAP is not set
> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> CONFIG_EFI_BOOTLOADER_CONTROL=3Dy
> CONFIG_EFI_CAPSULE_LOADER=3Dy
> CONFIG_EFI_TEST=3Dy
> CONFIG_EFI_RCI2_TABLE=3Dy
> CONFIG_EFI_DISABLE_PCI_DMA=3Dy
> # end of EFI (Extensible Firmware Interface) Support
> =

> CONFIG_EFI_EARLYCON=3Dy
> CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> CONFIG_GNSS=3Dy
> CONFIG_GNSS_SERIAL=3Dy
> CONFIG_GNSS_MTK_SERIAL=3Dy
> # CONFIG_GNSS_SIRF_SERIAL is not set
> CONFIG_GNSS_UBX_SERIAL=3Dy
> CONFIG_MTD=3Dy
> # CONFIG_MTD_TESTS is not set
> =

> #
> # Partition parsers
> #
> CONFIG_MTD_AR7_PARTS=3Dy
> # CONFIG_MTD_CMDLINE_PARTS is not set
> # CONFIG_MTD_OF_PARTS is not set
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # end of Partition parsers
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_OOPS=3Dy
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> # CONFIG_MTD_CFI is not set
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dy
> CONFIG_MTD_ABSENT=3Dy
> # end of RAM/ROM/Flash chip drivers
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> CONFIG_MTD_PHYSMAP=3Dy
> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
> CONFIG_MTD_PHYSMAP_START=3D0x8000000
> CONFIG_MTD_PHYSMAP_LEN=3D0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
> CONFIG_MTD_PHYSMAP_OF=3Dy
> # CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
> CONFIG_MTD_PCI=3Dy
> CONFIG_MTD_INTEL_VR_NOR=3Dy
> CONFIG_MTD_PLATRAM=3Dy
> # end of Mapping drivers for chip access
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> # CONFIG_MTD_SLRAM is not set
> CONFIG_MTD_PHRAM=3Dy
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dy
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> # end of Self-contained MTD device drivers
> =

> #
> # NAND
> #
> CONFIG_MTD_NAND_CORE=3Dy
> # CONFIG_MTD_ONENAND is not set
> # CONFIG_MTD_RAW_NAND is not set
> =

> #
> # ECC engine support
> #
> CONFIG_MTD_NAND_ECC=3Dy
> CONFIG_MTD_NAND_ECC_SW_HAMMING=3Dy
> # CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
> CONFIG_MTD_NAND_ECC_SW_BCH=3Dy
> # end of ECC engine support
> # end of NAND
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> # end of LPDDR & LPDDR2 PCM memory drivers
> =

> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
> # CONFIG_MTD_HYPERBUS is not set
> CONFIG_OF=3Dy
> # CONFIG_OF_UNITTEST is not set
> CONFIG_OF_KOBJ=3Dy
> CONFIG_OF_DYNAMIC=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_IRQ=3Dy
> # CONFIG_OF_OVERLAY is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> # CONFIG_PARPORT_PC is not set
> # CONFIG_PARPORT_AX88796 is not set
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> =

> #
> # NVME Support
> #
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=3Dy
> CONFIG_IBM_ASM=3Dy
> CONFIG_PHANTOM=3Dy
> CONFIG_TIFM_CORE=3Dy
> CONFIG_TIFM_7XX1=3Dy
> CONFIG_ICS932S401=3Dy
> CONFIG_ENCLOSURE_SERVICES=3Dy
> CONFIG_HI6421V600_IRQ=3Dy
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dy
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> # CONFIG_HMC6352 is not set
> # CONFIG_DS1682 is not set
> # CONFIG_SRAM is not set
> CONFIG_DW_XDATA_PCIE=3Dy
> CONFIG_PCI_ENDPOINT_TEST=3Dy
> CONFIG_XILINX_SDFEC=3Dy
> CONFIG_MISC_RTSX=3Dy
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> # CONFIG_EEPROM_LEGACY is not set
> # CONFIG_EEPROM_MAX6875 is not set
> # CONFIG_EEPROM_93CX6 is not set
> CONFIG_EEPROM_IDT_89HPESX=3Dy
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dy
> CONFIG_CB710_DEBUG=3Dy
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> CONFIG_SENSORS_LIS3_I2C=3Dy
> CONFIG_ALTERA_STAPL=3Dy
> CONFIG_INTEL_MEI=3Dy
> CONFIG_INTEL_MEI_ME=3Dy
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_VMWARE_VMCI is not set
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> CONFIG_BCM_VK=3Dy
> # CONFIG_BCM_VK_TTY is not set
> # CONFIG_MISC_ALCOR_PCI is not set
> CONFIG_MISC_RTSX_PCI=3Dy
> # CONFIG_HABANA_AI is not set
> CONFIG_UACCE=3Dy
> # CONFIG_PVPANIC is not set
> # end of Misc devices
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # end of SCSI device support
> =

> CONFIG_FUSION=3Dy
> CONFIG_FUSION_MAX_SGE=3D128
> # CONFIG_FUSION_LOGGING is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> CONFIG_FIREWIRE_OHCI=3Dy
> CONFIG_FIREWIRE_NET=3Dy
> CONFIG_FIREWIRE_NOSY=3Dy
> # end of IEEE 1394 (FireWire) support
> =

> # CONFIG_MACINTOSH_DRIVERS is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_NTB_NETDEV is not set
> # CONFIG_RIONET is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> CONFIG_VIRTIO_NET=3Dm
> # CONFIG_NLMON is not set
> # CONFIG_MHI_NET is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> CONFIG_ETHERNET=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_EL3 is not set
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> # CONFIG_ENA_ETHERNET is not set
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ASIX=3Dy
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> # CONFIG_LIQUIDIO is not set
> # CONFIG_LIQUIDIO_VF is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CIRRUS=3Dy
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> # CONFIG_GEMINI_ETHERNET is not set
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> # CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> # CONFIG_GVE is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> # CONFIG_HINIC is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> # CONFIG_E1000E is not set
> # CONFIG_IGB is not set
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> # CONFIG_IXGBE is not set
> # CONFIG_IXGBEVF is not set
> # CONFIG_I40E is not set
> # CONFIG_I40EVF is not set
> # CONFIG_ICE is not set
> # CONFIG_FM10K is not set
> # CONFIG_IGC is not set
> CONFIG_NET_VENDOR_MICROSOFT=3Dy
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_LITEX=3Dy
> # CONFIG_LITEX_LITEETH is not set
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> # CONFIG_NFP is not set
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCA7000_UART is not set
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_EMACLITE is not set
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_PHYLIB is not set
> =

> #
> # MCTP Device Drivers
> #
> # CONFIG_MDIO_DEVICE is not set
> =

> #
> # PCS device drivers
> #
> # end of PCS device drivers
> =

> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> =

> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> CONFIG_WLAN=3Dy
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K_PCI is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> CONFIG_WLAN_VENDOR_RSI=3Dy
> CONFIG_WLAN_VENDOR_ST=3Dy
> CONFIG_WLAN_VENDOR_TI=3Dy
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dy
> # CONFIG_IEEE802154_FAKELB is not set
> # CONFIG_IEEE802154_HWSIM is not set
> =

> #
> # Wireless WAN
> #
> # CONFIG_WWAN is not set
> # end of Wireless WAN
> =

> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_USB4_NET is not set
> # CONFIG_NETDEVSIM is not set
> CONFIG_NET_FAILOVER=3Dm
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dy
> CONFIG_INPUT_EVDEV=3Dy
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADC is not set
> CONFIG_KEYBOARD_ADP5520=3Dy
> CONFIG_KEYBOARD_ADP5588=3Dy
> CONFIG_KEYBOARD_ADP5589=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> CONFIG_KEYBOARD_DLINK_DIR685=3Dy
> CONFIG_KEYBOARD_LKKBD=3Dy
> # CONFIG_KEYBOARD_GPIO is not set
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> CONFIG_KEYBOARD_TCA6416=3Dy
> # CONFIG_KEYBOARD_TCA8418 is not set
> CONFIG_KEYBOARD_MATRIX=3Dy
> CONFIG_KEYBOARD_LM8323=3Dy
> CONFIG_KEYBOARD_LM8333=3Dy
> # CONFIG_KEYBOARD_MAX7359 is not set
> CONFIG_KEYBOARD_MCS=3Dy
> CONFIG_KEYBOARD_MPR121=3Dy
> CONFIG_KEYBOARD_NEWTON=3Dy
> CONFIG_KEYBOARD_OPENCORES=3Dy
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> CONFIG_KEYBOARD_SUNKBD=3Dy
> CONFIG_KEYBOARD_IQS62X=3Dy
> CONFIG_KEYBOARD_OMAP4=3Dy
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> CONFIG_KEYBOARD_BCM=3Dy
> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> # CONFIG_INPUT_MOUSE is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> # CONFIG_JOYSTICK_ANALOG is not set
> CONFIG_JOYSTICK_A3D=3Dy
> CONFIG_JOYSTICK_ADC=3Dy
> CONFIG_JOYSTICK_ADI=3Dy
> # CONFIG_JOYSTICK_COBRA is not set
> # CONFIG_JOYSTICK_GF2K is not set
> # CONFIG_JOYSTICK_GRIP is not set
> CONFIG_JOYSTICK_GRIP_MP=3Dy
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> CONFIG_JOYSTICK_TMDC=3Dy
> CONFIG_JOYSTICK_IFORCE=3Dy
> CONFIG_JOYSTICK_IFORCE_232=3Dy
> CONFIG_JOYSTICK_WARRIOR=3Dy
> CONFIG_JOYSTICK_MAGELLAN=3Dy
> CONFIG_JOYSTICK_SPACEORB=3Dy
> # CONFIG_JOYSTICK_SPACEBALL is not set
> # CONFIG_JOYSTICK_STINGER is not set
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> CONFIG_JOYSTICK_DB9=3Dy
> CONFIG_JOYSTICK_GAMECON=3Dy
> CONFIG_JOYSTICK_TURBOGRAFX=3Dy
> # CONFIG_JOYSTICK_AS5011 is not set
> CONFIG_JOYSTICK_JOYDUMP=3Dy
> # CONFIG_JOYSTICK_XPAD is not set
> # CONFIG_JOYSTICK_PXRC is not set
> CONFIG_JOYSTICK_QWIIC=3Dy
> # CONFIG_JOYSTICK_FSIA6B is not set
> # CONFIG_INPUT_TABLET is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> # CONFIG_TOUCHSCREEN_88PM860X is not set
> CONFIG_TOUCHSCREEN_AD7879=3Dy
> CONFIG_TOUCHSCREEN_AD7879_I2C=3Dy
> CONFIG_TOUCHSCREEN_ADC=3Dy
> CONFIG_TOUCHSCREEN_AR1021_I2C=3Dy
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> # CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
> CONFIG_TOUCHSCREEN_BU21013=3Dy
> # CONFIG_TOUCHSCREEN_BU21029 is not set
> CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=3Dy
> CONFIG_TOUCHSCREEN_CHIPONE_ICN8505=3Dy
> CONFIG_TOUCHSCREEN_CY8CTMA140=3Dy
> # CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dy
> CONFIG_TOUCHSCREEN_DA9034=3Dy
> CONFIG_TOUCHSCREEN_DA9052=3Dy
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> # CONFIG_TOUCHSCREEN_EETI is not set
> CONFIG_TOUCHSCREEN_EGALAX=3Dy
> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
> CONFIG_TOUCHSCREEN_EXC3000=3Dy
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> CONFIG_TOUCHSCREEN_GOODIX=3Dy
> CONFIG_TOUCHSCREEN_HIDEEP=3Dy
> CONFIG_TOUCHSCREEN_HYCON_HY46XX=3Dy
> CONFIG_TOUCHSCREEN_ILI210X=3Dy
> # CONFIG_TOUCHSCREEN_ILITEK is not set
> CONFIG_TOUCHSCREEN_S6SY761=3Dy
> CONFIG_TOUCHSCREEN_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_EKTF2127=3Dy
> # CONFIG_TOUCHSCREEN_ELAN is not set
> CONFIG_TOUCHSCREEN_ELO=3Dy
> CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> CONFIG_TOUCHSCREEN_MAX11801=3Dy
> CONFIG_TOUCHSCREEN_MCS5000=3Dy
> # CONFIG_TOUCHSCREEN_MMS114 is not set
> # CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
> CONFIG_TOUCHSCREEN_MSG2638=3Dy
> CONFIG_TOUCHSCREEN_MTOUCH=3Dy
> CONFIG_TOUCHSCREEN_IMX6UL_TSC=3Dy
> CONFIG_TOUCHSCREEN_INEXIO=3Dy
> CONFIG_TOUCHSCREEN_MK712=3Dy
> CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
> # CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> CONFIG_TOUCHSCREEN_WDT87XX_I2C=3Dy
> CONFIG_TOUCHSCREEN_WM831X=3Dy
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
> # CONFIG_TOUCHSCREEN_TSC2004 is not set
> CONFIG_TOUCHSCREEN_TSC2007=3Dy
> CONFIG_TOUCHSCREEN_TSC2007_IIO=3Dy
> CONFIG_TOUCHSCREEN_RM_TS=3Dy
> # CONFIG_TOUCHSCREEN_SILEAD is not set
> # CONFIG_TOUCHSCREEN_SIS_I2C is not set
> CONFIG_TOUCHSCREEN_ST1232=3Dy
> CONFIG_TOUCHSCREEN_STMFTS=3Dy
> CONFIG_TOUCHSCREEN_SX8654=3Dy
> # CONFIG_TOUCHSCREEN_TPS6507X is not set
> CONFIG_TOUCHSCREEN_ZET6223=3Dy
> CONFIG_TOUCHSCREEN_ZFORCE=3Dy
> # CONFIG_TOUCHSCREEN_COLIBRI_VF50 is not set
> CONFIG_TOUCHSCREEN_ROHM_BU21023=3Dy
> # CONFIG_TOUCHSCREEN_IQS5XX is not set
> # CONFIG_TOUCHSCREEN_ZINITIX is not set
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_88PM860X_ONKEY=3Dy
> CONFIG_INPUT_88PM80X_ONKEY=3Dy
> CONFIG_INPUT_AD714X=3Dy
> CONFIG_INPUT_AD714X_I2C=3Dy
> CONFIG_INPUT_ATC260X_ONKEY=3Dy
> CONFIG_INPUT_ATMEL_CAPTOUCH=3Dy
> CONFIG_INPUT_BMA150=3Dy
> CONFIG_INPUT_E3X0_BUTTON=3Dy
> # CONFIG_INPUT_PCSPKR is not set
> # CONFIG_INPUT_MAX77650_ONKEY is not set
> # CONFIG_INPUT_MAX8925_ONKEY is not set
> CONFIG_INPUT_MMA8450=3Dy
> # CONFIG_INPUT_APANEL is not set
> # CONFIG_INPUT_GPIO_BEEPER is not set
> CONFIG_INPUT_GPIO_DECODER=3Dy
> # CONFIG_INPUT_GPIO_VIBRA is not set
> CONFIG_INPUT_ATLAS_BTNS=3Dy
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dy
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> CONFIG_INPUT_REGULATOR_HAPTIC=3Dy
> # CONFIG_INPUT_RETU_PWRBUTTON is not set
> # CONFIG_INPUT_TPS65218_PWRBUTTON is not set
> CONFIG_INPUT_AXP20X_PEK=3Dy
> CONFIG_INPUT_UINPUT=3Dy
> CONFIG_INPUT_PCF8574=3Dy
> # CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
> CONFIG_INPUT_DA7280_HAPTICS=3Dy
> # CONFIG_INPUT_DA9052_ONKEY is not set
> CONFIG_INPUT_DA9055_ONKEY=3Dy
> CONFIG_INPUT_DA9063_ONKEY=3Dy
> # CONFIG_INPUT_WM831X_ON is not set
> CONFIG_INPUT_ADXL34X=3Dy
> # CONFIG_INPUT_ADXL34X_I2C is not set
> CONFIG_INPUT_IQS269A=3Dy
> CONFIG_INPUT_IQS626A=3Dy
> # CONFIG_INPUT_CMA3000 is not set
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dy
> CONFIG_INPUT_DRV260X_HAPTICS=3Dy
> CONFIG_INPUT_DRV2665_HAPTICS=3Dy
> CONFIG_INPUT_DRV2667_HAPTICS=3Dy
> CONFIG_INPUT_STPMIC1_ONKEY=3Dy
> CONFIG_RMI4_CORE=3Dy
> CONFIG_RMI4_I2C=3Dy
> CONFIG_RMI4_SMB=3Dy
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dy
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> CONFIG_RMI4_F34=3Dy
> # CONFIG_RMI4_F3A is not set
> CONFIG_RMI4_F54=3Dy
> CONFIG_RMI4_F55=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> # CONFIG_SERIO_PARKBD is not set
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dy
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_SERIO_APBPS2=3Dy
> CONFIG_SERIO_GPIO_PS2=3Dy
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> CONFIG_GAMEPORT_L4=3Dy
> # CONFIG_GAMEPORT_EMU10K1 is not set
> CONFIG_GAMEPORT_FM801=3Dy
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> CONFIG_SERIAL_8250_DWLIB=3Dy
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> # CONFIG_SERIAL_OF_PLATFORM is not set
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SIFIVE is not set
> # CONFIG_SERIAL_LANTIQ is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_BCM63XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_SPRD is not set
> # CONFIG_SERIAL_LITEUART is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_N_GSM is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_NULL_TTY is not set
> # CONFIG_RPMSG_TTY is not set
> CONFIG_SERIAL_DEV_BUS=3Dy
> CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_PRINTER is not set
> CONFIG_PPDEV=3Dy
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PLAT_DATA=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> # CONFIG_IPMI_PANIC_STRING is not set
> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SSIF=3Dy
> CONFIG_IPMI_IPMB=3Dy
> # CONFIG_IPMI_WATCHDOG is not set
> # CONFIG_IPMI_POWEROFF is not set
> CONFIG_IPMB_DEVICE_INTERFACE=3Dy
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> # CONFIG_HW_RANDOM_INTEL is not set
> CONFIG_HW_RANDOM_AMD=3Dy
> # CONFIG_HW_RANDOM_BA431 is not set
> CONFIG_HW_RANDOM_VIA=3Dy
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> # CONFIG_HW_RANDOM_CCTRNG is not set
> # CONFIG_HW_RANDOM_XIPHERA is not set
> CONFIG_APPLICOM=3Dy
> # CONFIG_MWAVE is not set
> # CONFIG_DEVMEM is not set
> CONFIG_NVRAM=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_HPET=3Dy
> CONFIG_HPET_MMAP=3Dy
> CONFIG_HPET_MMAP_DEFAULT=3Dy
> CONFIG_HANGCHECK_TIMER=3Dy
> # CONFIG_TCG_TPM is not set
> CONFIG_TELCLOCK=3Dy
> # CONFIG_XILLYBUS is not set
> CONFIG_RANDOM_TRUST_CPU=3Dy
> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> # end of Character devices
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> # CONFIG_ACPI_I2C_OPREGION is not set
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_GPMUX=3Dy
> # CONFIG_I2C_MUX_LTC4306 is not set
> # CONFIG_I2C_MUX_PCA9541 is not set
> CONFIG_I2C_MUX_PCA954x=3Dy
> # CONFIG_I2C_MUX_PINCTRL is not set
> # CONFIG_I2C_MUX_REG is not set
> CONFIG_I2C_DEMUX_PINCTRL=3Dy
> # CONFIG_I2C_MUX_MLXCPLD is not set
> # end of Multiplexer I2C Chip support
> =

> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dy
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
> # CONFIG_I2C_ALGOPCF is not set
> CONFIG_I2C_ALGOPCA=3Dy
> # end of I2C Algorithms
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dy
> CONFIG_I2C_ALI1563=3Dy
> # CONFIG_I2C_ALI15X3 is not set
> CONFIG_I2C_AMD756=3Dy
> CONFIG_I2C_AMD756_S4882=3Dy
> # CONFIG_I2C_AMD8111 is not set
> # CONFIG_I2C_AMD_MP2 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dy
> CONFIG_I2C_ISMT=3Dy
> CONFIG_I2C_PIIX4=3Dy
> CONFIG_I2C_NFORCE2=3Dy
> CONFIG_I2C_NFORCE2_S4985=3Dy
> CONFIG_I2C_NVIDIA_GPU=3Dy
> CONFIG_I2C_SIS5595=3Dy
> CONFIG_I2C_SIS630=3Dy
> CONFIG_I2C_SIS96X=3Dy
> # CONFIG_I2C_VIA is not set
> CONFIG_I2C_VIAPRO=3Dy
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dy
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> CONFIG_I2C_EMEV2=3Dy
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dy
> CONFIG_I2C_RK3X=3Dy
> # CONFIG_I2C_SIMTEC is not set
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT=3Dy
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dy
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> =

> # CONFIG_I2C_STUB is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_SLAVE_TESTUNIT is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> CONFIG_I3C=3Dy
> # CONFIG_CDNS_I3C_MASTER is not set
> CONFIG_DW_I3C_MASTER=3Dy
> CONFIG_SVC_I3C_MASTER=3Dy
> # CONFIG_MIPI_I3C_HCI is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dy
> # CONFIG_SPMI_HISI3670 is not set
> CONFIG_HSI=3Dy
> CONFIG_HSI_BOARDINFO=3Dy
> =

> #
> # HSI controllers
> #
> =

> #
> # HSI clients
> #
> CONFIG_HSI_CHAR=3Dy
> # CONFIG_PPS is not set
> =

> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> CONFIG_PINCTRL_AS3722=3Dy
> # CONFIG_PINCTRL_AXP209 is not set
> # CONFIG_PINCTRL_AMD is not set
> CONFIG_PINCTRL_DA9062=3Dy
> CONFIG_PINCTRL_MCP23S08_I2C=3Dy
> CONFIG_PINCTRL_MCP23S08=3Dy
> # CONFIG_PINCTRL_SINGLE is not set
> CONFIG_PINCTRL_SX150X=3Dy
> CONFIG_PINCTRL_STMFX=3Dy
> CONFIG_PINCTRL_MAX77620=3Dy
> CONFIG_PINCTRL_OCELOT=3Dy
> CONFIG_PINCTRL_MICROCHIP_SGPIO=3Dy
> =

> #
> # Intel pinctrl drivers
> #
> CONFIG_PINCTRL_BAYTRAIL=3Dy
> CONFIG_PINCTRL_CHERRYVIEW=3Dy
> CONFIG_PINCTRL_LYNXPOINT=3Dy
> CONFIG_PINCTRL_INTEL=3Dy
> # CONFIG_PINCTRL_ALDERLAKE is not set
> CONFIG_PINCTRL_BROXTON=3Dy
> # CONFIG_PINCTRL_CANNONLAKE is not set
> CONFIG_PINCTRL_CEDARFORK=3Dy
> CONFIG_PINCTRL_DENVERTON=3Dy
> # CONFIG_PINCTRL_ELKHARTLAKE is not set
> # CONFIG_PINCTRL_EMMITSBURG is not set
> # CONFIG_PINCTRL_GEMINILAKE is not set
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_JASPERLAKE is not set
> CONFIG_PINCTRL_LAKEFIELD=3Dy
> CONFIG_PINCTRL_LEWISBURG=3Dy
> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> CONFIG_PINCTRL_TIGERLAKE=3Dy
> # end of Intel pinctrl drivers
> =

> #
> # Renesas pinctrl drivers
> #
> # end of Renesas pinctrl drivers
> =

> CONFIG_PINCTRL_LOCHNAGAR=3Dy
> CONFIG_PINCTRL_EQUILIBRIUM=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_CDEV=3Dy
> CONFIG_GPIO_CDEV_V1=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_74XX_MMIO is not set
> CONFIG_GPIO_ALTERA=3Dy
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_CADENCE=3Dy
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_FTGPIO010 is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_GRGPIO=3Dy
> CONFIG_GPIO_HLWD=3Dy
> CONFIG_GPIO_ICH=3Dy
> CONFIG_GPIO_MB86S7X=3Dy
> CONFIG_GPIO_SIFIVE=3Dy
> CONFIG_GPIO_SIOX=3Dy
> CONFIG_GPIO_VX855=3Dy
> CONFIG_GPIO_WCD934X=3Dy
> CONFIG_GPIO_XILINX=3Dy
> CONFIG_GPIO_AMD_FCH=3Dy
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_104_DIO_48E=3Dy
> CONFIG_GPIO_104_IDIO_16=3Dy
> # CONFIG_GPIO_104_IDI_48 is not set
> # CONFIG_GPIO_F7188X is not set
> CONFIG_GPIO_GPIO_MM=3Dy
> CONFIG_GPIO_IT87=3Dy
> CONFIG_GPIO_SCH=3Dy
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_WINBOND=3Dy
> CONFIG_GPIO_WS16C48=3Dy
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> CONFIG_GPIO_ADNP=3Dy
> CONFIG_GPIO_GW_PLD=3Dy
> CONFIG_GPIO_MAX7300=3Dy
> CONFIG_GPIO_MAX732X=3Dy
> CONFIG_GPIO_MAX732X_IRQ=3Dy
> # CONFIG_GPIO_PCA953X is not set
> CONFIG_GPIO_PCA9570=3Dy
> CONFIG_GPIO_PCF857X=3Dy
> CONFIG_GPIO_TPIC2810=3Dy
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ADP5520=3Dy
> CONFIG_GPIO_ARIZONA=3Dy
> CONFIG_GPIO_BD70528=3Dy
> # CONFIG_GPIO_BD9571MWV is not set
> CONFIG_GPIO_DA9052=3Dy
> CONFIG_GPIO_DA9055=3Dy
> # CONFIG_GPIO_JANZ_TTL is not set
> CONFIG_GPIO_LP3943=3Dy
> # CONFIG_GPIO_LP873X is not set
> CONFIG_GPIO_LP87565=3Dy
> # CONFIG_GPIO_MAX77620 is not set
> # CONFIG_GPIO_MAX77650 is not set
> # CONFIG_GPIO_RC5T583 is not set
> CONFIG_GPIO_TPS65086=3Dy
> CONFIG_GPIO_WHISKEY_COVE=3Dy
> # CONFIG_GPIO_WM831X is not set
> # CONFIG_GPIO_WM8350 is not set
> CONFIG_GPIO_WM8994=3Dy
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> CONFIG_GPIO_ML_IOH=3Dy
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> CONFIG_GPIO_RDC321X=3Dy
> # CONFIG_GPIO_SODAVILLE is not set
> # end of PCI GPIO expanders
> =

> #
> # Virtual GPIO drivers
> #
> CONFIG_GPIO_AGGREGATOR=3Dy
> # CONFIG_GPIO_MOCKUP is not set
> CONFIG_GPIO_VIRTIO=3Dy
> # end of Virtual GPIO drivers
> =

> CONFIG_W1=3Dy
> # CONFIG_W1_CON is not set
> =

> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=3Dy
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> # CONFIG_W1_MASTER_GPIO is not set
> CONFIG_W1_MASTER_SGI=3Dy
> # end of 1-wire Bus Masters
> =

> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> CONFIG_W1_SLAVE_SMEM=3Dy
> # CONFIG_W1_SLAVE_DS2405 is not set
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> # CONFIG_W1_SLAVE_DS2406 is not set
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2805=3Dy
> CONFIG_W1_SLAVE_DS2430=3Dy
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=3Dy
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> # CONFIG_W1_SLAVE_DS2438 is not set
> CONFIG_W1_SLAVE_DS250X=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_W1_SLAVE_DS28E17=3Dy
> # end of 1-wire Slaves
> =

> # CONFIG_POWER_RESET is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> CONFIG_PDA_POWER=3Dy
> # CONFIG_GENERIC_ADC_BATTERY is not set
> CONFIG_MAX8925_POWER=3Dy
> # CONFIG_WM831X_BACKUP is not set
> CONFIG_WM831X_POWER=3Dy
> # CONFIG_WM8350_POWER is not set
> CONFIG_TEST_POWER=3Dy
> # CONFIG_BATTERY_88PM860X is not set
> # CONFIG_CHARGER_ADP5061 is not set
> CONFIG_BATTERY_ACT8945A=3Dy
> CONFIG_BATTERY_CW2015=3Dy
> CONFIG_BATTERY_DS2760=3Dy
> # CONFIG_BATTERY_DS2780 is not set
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_CHARGER_SBS=3Dy
> CONFIG_MANAGER_SBS=3Dy
> # CONFIG_BATTERY_BQ27XXX is not set
> CONFIG_BATTERY_DA9030=3Dy
> CONFIG_BATTERY_DA9052=3Dy
> # CONFIG_CHARGER_DA9150 is not set
> # CONFIG_BATTERY_DA9150 is not set
> CONFIG_CHARGER_AXP20X=3Dy
> CONFIG_BATTERY_AXP20X=3Dy
> CONFIG_AXP20X_POWER=3Dy
> CONFIG_AXP288_FUEL_GAUGE=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_BATTERY_MAX1721X=3Dy
> CONFIG_CHARGER_MAX8903=3Dy
> # CONFIG_CHARGER_LP8727 is not set
> CONFIG_CHARGER_GPIO=3Dy
> # CONFIG_CHARGER_MANAGER is not set
> CONFIG_CHARGER_LT3651=3Dy
> CONFIG_CHARGER_LTC4162L=3Dy
> CONFIG_CHARGER_MAX14577=3Dy
> # CONFIG_CHARGER_DETECTOR_MAX14656 is not set
> CONFIG_CHARGER_MAX77650=3Dy
> CONFIG_CHARGER_MT6360=3Dy
> CONFIG_CHARGER_BQ2415X=3Dy
> CONFIG_CHARGER_BQ24257=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> CONFIG_CHARGER_BQ2515X=3Dy
> CONFIG_CHARGER_BQ25890=3Dy
> CONFIG_CHARGER_BQ25980=3Dy
> CONFIG_CHARGER_BQ256XX=3Dy
> CONFIG_CHARGER_SMB347=3Dy
> CONFIG_CHARGER_TPS65217=3Dy
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> CONFIG_BATTERY_GOLDFISH=3Dy
> CONFIG_BATTERY_RT5033=3Dy
> CONFIG_CHARGER_RT9455=3Dy
> CONFIG_CHARGER_UCS1002=3Dy
> # CONFIG_CHARGER_BD99954 is not set
> CONFIG_RN5T618_POWER=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7414 is not set
> # CONFIG_SENSORS_AD7418 is not set
> # CONFIG_SENSORS_ADM1021 is not set
> # CONFIG_SENSORS_ADM1025 is not set
> # CONFIG_SENSORS_ADM1026 is not set
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dy
> # CONFIG_SENSORS_ADM1177 is not set
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dy
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_AHT10=3Dy
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> CONFIG_SENSORS_K8TEMP=3Dy
> CONFIG_SENSORS_K10TEMP=3Dy
> CONFIG_SENSORS_FAM15H_POWER=3Dy
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dy
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_CORSAIR_CPRO=3Dy
> CONFIG_SENSORS_CORSAIR_PSU=3Dy
> CONFIG_SENSORS_DS620=3Dy
> # CONFIG_SENSORS_DS1621 is not set
> # CONFIG_SENSORS_DELL_SMM is not set
> CONFIG_SENSORS_DA9052_ADC=3Dy
> # CONFIG_SENSORS_DA9055 is not set
> CONFIG_SENSORS_I5K_AMB=3Dy
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_GSC=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_FTSTEUTATES=3Dy
> # CONFIG_SENSORS_GL518SM is not set
> # CONFIG_SENSORS_GL520SM is not set
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> # CONFIG_SENSORS_GPIO_FAN is not set
> CONFIG_SENSORS_HIH6130=3Dy
> # CONFIG_SENSORS_IBMAEM is not set
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_IIO_HWMON=3Dy
> CONFIG_SENSORS_I5500=3Dy
> # CONFIG_SENSORS_CORETEMP is not set
> CONFIG_SENSORS_IT87=3Dy
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dy
> # CONFIG_SENSORS_LINEAGE is not set
> # CONFIG_SENSORS_LOCHNAGAR is not set
> # CONFIG_SENSORS_LTC2945 is not set
> CONFIG_SENSORS_LTC2947=3Dy
> CONFIG_SENSORS_LTC2947_I2C=3Dy
> CONFIG_SENSORS_LTC2990=3Dy
> # CONFIG_SENSORS_LTC2992 is not set
> CONFIG_SENSORS_LTC4151=3Dy
> CONFIG_SENSORS_LTC4215=3Dy
> # CONFIG_SENSORS_LTC4222 is not set
> # CONFIG_SENSORS_LTC4245 is not set
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> # CONFIG_SENSORS_MAX127 is not set
> CONFIG_SENSORS_MAX16065=3Dy
> CONFIG_SENSORS_MAX1619=3Dy
> # CONFIG_SENSORS_MAX1668 is not set
> # CONFIG_SENSORS_MAX197 is not set
> CONFIG_SENSORS_MAX31730=3Dy
> CONFIG_SENSORS_MAX6620=3Dy
> CONFIG_SENSORS_MAX6621=3Dy
> # CONFIG_SENSORS_MAX6639 is not set
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_MAX31790=3Dy
> # CONFIG_SENSORS_MCP3021 is not set
> CONFIG_SENSORS_TC654=3Dy
> CONFIG_SENSORS_TPS23861=3Dy
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_MR75203=3Dy
> CONFIG_SENSORS_LM63=3Dy
> # CONFIG_SENSORS_LM73 is not set
> # CONFIG_SENSORS_LM75 is not set
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
> CONFIG_SENSORS_LM95234=3Dy
> # CONFIG_SENSORS_LM95241 is not set
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=3Dy
> # CONFIG_SENSORS_PC87427 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dy
> CONFIG_SENSORS_NCT6775=3Dy
> # CONFIG_SENSORS_NCT7802 is not set
> CONFIG_SENSORS_NCT7904=3Dy
> CONFIG_SENSORS_NPCM7XX=3Dy
> # CONFIG_SENSORS_PCF8591 is not set
> # CONFIG_PMBUS is not set
> CONFIG_SENSORS_SBTSI=3Dy
> # CONFIG_SENSORS_SBRMI is not set
> CONFIG_SENSORS_SHT15=3Dy
> # CONFIG_SENSORS_SHT21 is not set
> # CONFIG_SENSORS_SHT3x is not set
> CONFIG_SENSORS_SHT4x=3Dy
> # CONFIG_SENSORS_SHTC1 is not set
> # CONFIG_SENSORS_SIS5595 is not set
> # CONFIG_SENSORS_DME1737 is not set
> CONFIG_SENSORS_EMC1403=3Dy
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> # CONFIG_SENSORS_SMSC47M192 is not set
> CONFIG_SENSORS_SMSC47B397=3Dy
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dy
> # CONFIG_SENSORS_SCH5636 is not set
> # CONFIG_SENSORS_STTS751 is not set
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dy
> CONFIG_SENSORS_ADS7828=3Dy
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> # CONFIG_SENSORS_INA3221 is not set
> CONFIG_SENSORS_TC74=3Dy
> # CONFIG_SENSORS_THMC50 is not set
> # CONFIG_SENSORS_TMP102 is not set
> CONFIG_SENSORS_TMP103=3Dy
> CONFIG_SENSORS_TMP108=3Dy
> # CONFIG_SENSORS_TMP401 is not set
> CONFIG_SENSORS_TMP421=3Dy
> # CONFIG_SENSORS_TMP513 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> # CONFIG_SENSORS_VT8231 is not set
> # CONFIG_SENSORS_W83773G is not set
> CONFIG_SENSORS_W83781D=3Dy
> # CONFIG_SENSORS_W83791D is not set
> CONFIG_SENSORS_W83792D=3Dy
> CONFIG_SENSORS_W83793=3Dy
> # CONFIG_SENSORS_W83795 is not set
> # CONFIG_SENSORS_W83L785TS is not set
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> # CONFIG_SENSORS_W83627EHF is not set
> CONFIG_SENSORS_WM831X=3Dy
> # CONFIG_SENSORS_WM8350 is not set
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dy
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_NETLINK is not set
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> # CONFIG_THERMAL_HWMON is not set
> # CONFIG_THERMAL_OF is not set
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_DEVFREQ_THERMAL is not set
> CONFIG_THERMAL_EMULATION=3Dy
> CONFIG_THERMAL_MMIO=3Dy
> # CONFIG_MAX77620_THERMAL is not set
> # CONFIG_DA9062_THERMAL is not set
> =

> #
> # Intel thermal drivers
> #
> CONFIG_INTEL_POWERCLAMP=3Dy
> CONFIG_X86_THERMAL_VECTOR=3Dy
> CONFIG_X86_PKG_TEMP_THERMAL=3Dy
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dy
> CONFIG_ACPI_THERMAL_REL=3Dy
> CONFIG_INT3406_THERMAL=3Dy
> # end of ACPI INT340X thermal drivers
> =

> CONFIG_INTEL_BXT_PMIC_THERMAL=3Dy
> # CONFIG_INTEL_PCH_THERMAL is not set
> # CONFIG_INTEL_TCC_COOLING is not set
> # CONFIG_INTEL_MENLOW is not set
> # end of Intel thermal drivers
> =

> CONFIG_GENERIC_ADC_THERMAL=3Dy
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> CONFIG_WATCHDOG_NOWAYOUT=3Dy
> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
> CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> # CONFIG_WATCHDOG_SYSFS is not set
> # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
> =

> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dy
> CONFIG_BD957XMUF_WATCHDOG=3Dy
> # CONFIG_DA9052_WATCHDOG is not set
> # CONFIG_DA9055_WATCHDOG is not set
> # CONFIG_DA9062_WATCHDOG is not set
> CONFIG_GPIO_WATCHDOG=3Dy
> CONFIG_GPIO_WATCHDOG_ARCH_INITCALL=3Dy
> # CONFIG_MENF21BMC_WATCHDOG is not set
> CONFIG_WDAT_WDT=3Dy
> CONFIG_WM831X_WATCHDOG=3Dy
> CONFIG_WM8350_WATCHDOG=3Dy
> CONFIG_XILINX_WATCHDOG=3Dy
> CONFIG_ZIIRAVE_WATCHDOG=3Dy
> CONFIG_CADENCE_WATCHDOG=3Dy
> CONFIG_DW_WATCHDOG=3Dy
> CONFIG_RN5T618_WATCHDOG=3Dy
> CONFIG_MAX63XX_WATCHDOG=3Dy
> CONFIG_MAX77620_WATCHDOG=3Dy
> # CONFIG_RETU_WATCHDOG is not set
> # CONFIG_STPMIC1_WATCHDOG is not set
> # CONFIG_ACQUIRE_WDT is not set
> # CONFIG_ADVANTECH_WDT is not set
> CONFIG_ALIM1535_WDT=3Dy
> CONFIG_ALIM7101_WDT=3Dy
> CONFIG_EBC_C384_WDT=3Dy
> CONFIG_F71808E_WDT=3Dy
> # CONFIG_SP5100_TCO is not set
> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
> # CONFIG_EUROTECH_WDT is not set
> # CONFIG_IB700_WDT is not set
> CONFIG_IBMASR=3Dy
> # CONFIG_WAFER_WDT is not set
> CONFIG_I6300ESB_WDT=3Dy
> CONFIG_IE6XX_WDT=3Dy
> CONFIG_ITCO_WDT=3Dy
> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> CONFIG_IT8712F_WDT=3Dy
> CONFIG_IT87_WDT=3Dy
> CONFIG_HP_WATCHDOG=3Dy
> CONFIG_HPWDT_NMI_DECODING=3Dy
> CONFIG_SC1200_WDT=3Dy
> # CONFIG_PC87413_WDT is not set
> # CONFIG_NV_TCO is not set
> # CONFIG_60XX_WDT is not set
> # CONFIG_CPU5_WDT is not set
> # CONFIG_SMSC_SCH311X_WDT is not set
> # CONFIG_SMSC37B787_WDT is not set
> CONFIG_TQMX86_WDT=3Dy
> CONFIG_VIA_WDT=3Dy
> CONFIG_W83627HF_WDT=3Dy
> CONFIG_W83877F_WDT=3Dy
> CONFIG_W83977F_WDT=3Dy
> CONFIG_MACHZ_WDT=3Dy
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> # CONFIG_INTEL_MEI_WDT is not set
> # CONFIG_NI903X_WDT is not set
> CONFIG_NIC7018_WDT=3Dy
> CONFIG_MEN_A21_WDT=3Dy
> =

> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> # CONFIG_WDTPCI is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> # CONFIG_BCMA is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_ACT8945A=3Dy
> # CONFIG_MFD_AS3711 is not set
> CONFIG_MFD_AS3722=3Dy
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_ATMEL_FLEXCOM is not set
> CONFIG_MFD_ATMEL_HLCDC=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dy
> CONFIG_MFD_AXP20X=3Dy
> CONFIG_MFD_AXP20X_I2C=3Dy
> # CONFIG_MFD_MADERA is not set
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> CONFIG_MFD_DA9055=3Dy
> CONFIG_MFD_DA9062=3Dy
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_GATEWORKS_GSC=3Dy
> # CONFIG_MFD_MC13XXX_I2C is not set
> CONFIG_MFD_MP2629=3Dy
> # CONFIG_MFD_HI6421_PMIC is not set
> # CONFIG_MFD_HI6421_SPMI is not set
> CONFIG_HTC_PASIC3=3Dy
> CONFIG_HTC_I2CPLD=3Dy
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_INTEL_SOC_PMIC_BXTWC=3Dy
> CONFIG_INTEL_SOC_PMIC_CHTDC_TI=3Dy
> # CONFIG_INTEL_SOC_PMIC_MRFLD is not set
> CONFIG_MFD_INTEL_LPSS=3Dy
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> CONFIG_MFD_INTEL_PMC_BXT=3Dy
> # CONFIG_MFD_INTEL_PMT is not set
> CONFIG_MFD_IQS62X=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> # CONFIG_MFD_KEMPLD is not set
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_MAX14577=3Dy
> CONFIG_MFD_MAX77620=3Dy
> CONFIG_MFD_MAX77650=3Dy
> CONFIG_MFD_MAX77686=3Dy
> # CONFIG_MFD_MAX77693 is not set
> CONFIG_MFD_MAX77843=3Dy
> # CONFIG_MFD_MAX8907 is not set
> CONFIG_MFD_MAX8925=3Dy
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6360=3Dy
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_MFD_NTXEC=3Dy
> CONFIG_MFD_RETU=3Dy
> # CONFIG_MFD_PCF50633 is not set
> CONFIG_MFD_RDC321X=3Dy
> CONFIG_MFD_RT4831=3Dy
> # CONFIG_MFD_RT5033 is not set
> CONFIG_MFD_RC5T583=3Dy
> # CONFIG_MFD_RK808 is not set
> CONFIG_MFD_RN5T618=3Dy
> CONFIG_MFD_SEC_CORE=3Dy
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dy
> CONFIG_MFD_SM501_GPIO=3Dy
> CONFIG_MFD_SKY81452=3Dy
> # CONFIG_MFD_STMPE is not set
> # CONFIG_MFD_SYSCON is not set
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> CONFIG_MFD_LP3943=3Dy
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> CONFIG_MFD_TPS65086=3Dy
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=3Dy
> CONFIG_MFD_TI_LP873X=3Dy
> CONFIG_MFD_TI_LP87565=3Dy
> # CONFIG_MFD_TPS65218 is not set
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=3Dy
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TC3589X is not set
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_LOCHNAGAR=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> # CONFIG_MFD_CS47L24 is not set
> CONFIG_MFD_WM5102=3Dy
> # CONFIG_MFD_WM5110 is not set
> CONFIG_MFD_WM8997=3Dy
> CONFIG_MFD_WM8998=3Dy
> # CONFIG_MFD_WM8400 is not set
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dy
> # CONFIG_MFD_ROHM_BD718XX is not set
> CONFIG_MFD_ROHM_BD70528=3Dy
> # CONFIG_MFD_ROHM_BD71828 is not set
> CONFIG_MFD_ROHM_BD957XMUF=3Dy
> CONFIG_MFD_STPMIC1=3Dy
> CONFIG_MFD_STMFX=3Dy
> CONFIG_MFD_WCD934X=3Dy
> CONFIG_MFD_ATC260X=3Dy
> CONFIG_MFD_ATC260X_I2C=3Dy
> CONFIG_MFD_QCOM_PM8008=3Dy
> # CONFIG_RAVE_SP_CORE is not set
> CONFIG_MFD_RSMU_I2C=3Dy
> # end of Multifunction device drivers
> =

> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PG86X=3Dy
> CONFIG_REGULATOR_88PM800=3Dy
> CONFIG_REGULATOR_88PM8607=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> # CONFIG_REGULATOR_ACT8945A is not set
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_AS3722=3Dy
> CONFIG_REGULATOR_ATC260X=3Dy
> CONFIG_REGULATOR_AXP20X=3Dy
> CONFIG_REGULATOR_BCM590XX=3Dy
> CONFIG_REGULATOR_BD9571MWV=3Dy
> CONFIG_REGULATOR_BD957XMUF=3Dy
> CONFIG_REGULATOR_DA903X=3Dy
> CONFIG_REGULATOR_DA9052=3Dy
> CONFIG_REGULATOR_DA9055=3Dy
> CONFIG_REGULATOR_DA9062=3Dy
> CONFIG_REGULATOR_DA9121=3Dy
> # CONFIG_REGULATOR_DA9210 is not set
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> CONFIG_REGULATOR_FAN53880=3Dy
> CONFIG_REGULATOR_GPIO=3Dy
> # CONFIG_REGULATOR_ISL9305 is not set
> CONFIG_REGULATOR_ISL6271A=3Dy
> CONFIG_REGULATOR_LOCHNAGAR=3Dy
> # CONFIG_REGULATOR_LP3971 is not set
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dy
> CONFIG_REGULATOR_LP873X=3Dy
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LP87565=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> # CONFIG_REGULATOR_LTC3676 is not set
> CONFIG_REGULATOR_MAX14577=3Dy
> # CONFIG_REGULATOR_MAX1586 is not set
> # CONFIG_REGULATOR_MAX77620 is not set
> CONFIG_REGULATOR_MAX77650=3Dy
> # CONFIG_REGULATOR_MAX8649 is not set
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8893=3Dy
> CONFIG_REGULATOR_MAX8925=3Dy
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX77686=3Dy
> CONFIG_REGULATOR_MAX77693=3Dy
> CONFIG_REGULATOR_MAX77802=3Dy
> CONFIG_REGULATOR_MAX77826=3Dy
> # CONFIG_REGULATOR_MCP16502 is not set
> CONFIG_REGULATOR_MP5416=3Dy
> # CONFIG_REGULATOR_MP8859 is not set
> CONFIG_REGULATOR_MP886X=3Dy
> CONFIG_REGULATOR_MPQ7920=3Dy
> CONFIG_REGULATOR_MT6311=3Dy
> CONFIG_REGULATOR_MT6315=3Dy
> CONFIG_REGULATOR_MT6360=3Dy
> CONFIG_REGULATOR_PCA9450=3Dy
> CONFIG_REGULATOR_PF8X00=3Dy
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> # CONFIG_REGULATOR_PV88090 is not set
> # CONFIG_REGULATOR_QCOM_SPMI is not set
> CONFIG_REGULATOR_QCOM_USB_VBUS=3Dy
> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=3Dy
> CONFIG_REGULATOR_RC5T583=3Dy
> CONFIG_REGULATOR_RN5T618=3Dy
> CONFIG_REGULATOR_RT4801=3Dy
> CONFIG_REGULATOR_RT4831=3Dy
> # CONFIG_REGULATOR_RT6160 is not set
> CONFIG_REGULATOR_RT6245=3Dy
> CONFIG_REGULATOR_RTQ2134=3Dy
> CONFIG_REGULATOR_RTMV20=3Dy
> CONFIG_REGULATOR_RTQ6752=3Dy
> # CONFIG_REGULATOR_S2MPA01 is not set
> CONFIG_REGULATOR_S2MPS11=3Dy
> # CONFIG_REGULATOR_S5M8767 is not set
> CONFIG_REGULATOR_SKY81452=3Dy
> CONFIG_REGULATOR_SLG51000=3Dy
> CONFIG_REGULATOR_STPMIC1=3Dy
> CONFIG_REGULATOR_SY8106A=3Dy
> # CONFIG_REGULATOR_SY8824X is not set
> # CONFIG_REGULATOR_SY8827N is not set
> CONFIG_REGULATOR_TPS51632=3Dy
> CONFIG_REGULATOR_TPS6105X=3Dy
> CONFIG_REGULATOR_TPS62360=3Dy
> # CONFIG_REGULATOR_TPS65023 is not set
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=3Dy
> # CONFIG_REGULATOR_TPS65132 is not set
> CONFIG_REGULATOR_TPS65217=3Dy
> CONFIG_REGULATOR_VCTRL=3Dy
> CONFIG_REGULATOR_WM831X=3Dy
> CONFIG_REGULATOR_WM8350=3Dy
> CONFIG_REGULATOR_WM8994=3Dy
> CONFIG_REGULATOR_QCOM_LABIBB=3Dy
> CONFIG_RC_CORE=3Dy
> CONFIG_RC_MAP=3Dy
> CONFIG_LIRC=3Dy
> CONFIG_BPF_LIRC_MODE2=3Dy
> # CONFIG_RC_DECODERS is not set
> # CONFIG_RC_DEVICES is not set
> CONFIG_CEC_CORE=3Dy
> =

> #
> # CEC support
> #
> CONFIG_MEDIA_CEC_RC=3Dy
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> CONFIG_CEC_CH7322=3Dy
> # CONFIG_CEC_GPIO is not set
> # CONFIG_USB_PULSE8_CEC is not set
> # CONFIG_USB_RAINSHADOW_CEC is not set
> # end of CEC support
> =

> CONFIG_MEDIA_SUPPORT=3Dy
> # CONFIG_MEDIA_SUPPORT_FILTER is not set
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> =

> #
> # Media device types
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
> CONFIG_MEDIA_TEST_SUPPORT=3Dy
> # end of Media device types
> =

> #
> # Media core support
> #
> CONFIG_VIDEO_DEV=3Dy
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_DVB_CORE=3Dy
> # end of Media core support
> =

> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2=3Dy
> CONFIG_VIDEO_V4L2_I2C=3Dy
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> CONFIG_VIDEO_ADV_DEBUG=3Dy
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> CONFIG_V4L2_FWNODE=3Dy
> CONFIG_V4L2_ASYNC=3Dy
> # end of Video4Linux options
> =

> #
> # Media controller options
> #
> CONFIG_MEDIA_CONTROLLER_DVB=3Dy
> # end of Media controller options
> =

> #
> # Digital TV options
> #
> # CONFIG_DVB_MMAP is not set
> # CONFIG_DVB_NET is not set
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> CONFIG_DVB_ULE_DEBUG=3Dy
> # end of Digital TV options
> =

> #
> # Media drivers
> #
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> # CONFIG_RADIO_ADAPTERS is not set
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_V4L2=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_DMA_CONTIG=3Dy
> CONFIG_VIDEOBUF2_VMALLOC=3Dy
> CONFIG_VIDEOBUF2_DMA_SG=3Dy
> CONFIG_V4L_PLATFORM_DRIVERS=3Dy
> CONFIG_VIDEO_CAFE_CCIC=3Dy
> CONFIG_VIDEO_CADENCE=3Dy
> # CONFIG_VIDEO_CADENCE_CSI2RX is not set
> CONFIG_VIDEO_CADENCE_CSI2TX=3Dy
> CONFIG_VIDEO_ASPEED=3Dy
> CONFIG_VIDEO_MUX=3Dy
> # CONFIG_VIDEO_XILINX is not set
> CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> # CONFIG_VIDEO_MEM2MEM_DEINTERLACE is not set
> CONFIG_DVB_PLATFORM_DRIVERS=3Dy
> # CONFIG_SDR_PLATFORM_DRIVERS is not set
> # CONFIG_V4L_TEST_DRIVERS is not set
> CONFIG_DVB_TEST_DRIVERS=3Dy
> # CONFIG_DVB_VIDTV is not set
> =

> #
> # FireWire (IEEE 1394) Adapters
> #
> CONFIG_DVB_FIREDTV=3Dy
> CONFIG_DVB_FIREDTV_INPUT=3Dy
> # end of Media drivers
> =

> #
> # Media ancillary drivers
> #
> CONFIG_MEDIA_ATTACH=3Dy
> =

> #
> # IR I2C driver auto-selected by 'Autoselect ancillary drivers'
> #
> CONFIG_VIDEO_IR_I2C=3Dy
> =

> #
> # Audio decoders, processors and mixers
> #
> # CONFIG_VIDEO_TVAUDIO is not set
> # CONFIG_VIDEO_TDA7432 is not set
> # CONFIG_VIDEO_TDA9840 is not set
> CONFIG_VIDEO_TEA6415C=3Dy
> CONFIG_VIDEO_TEA6420=3Dy
> CONFIG_VIDEO_MSP3400=3Dy
> # CONFIG_VIDEO_CS3308 is not set
> CONFIG_VIDEO_CS5345=3Dy
> CONFIG_VIDEO_CS53L32A=3Dy
> # CONFIG_VIDEO_TLV320AIC23B is not set
> CONFIG_VIDEO_UDA1342=3Dy
> # CONFIG_VIDEO_WM8775 is not set
> # CONFIG_VIDEO_WM8739 is not set
> CONFIG_VIDEO_VP27SMPX=3Dy
> CONFIG_VIDEO_SONY_BTF_MPX=3Dy
> # end of Audio decoders, processors and mixers
> =

> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=3Dy
> # end of RDS decoders
> =

> #
> # Video decoders
> #
> CONFIG_VIDEO_ADV7180=3Dy
> CONFIG_VIDEO_ADV7183=3Dy
> CONFIG_VIDEO_ADV748X=3Dy
> CONFIG_VIDEO_ADV7604=3Dy
> CONFIG_VIDEO_ADV7604_CEC=3Dy
> # CONFIG_VIDEO_ADV7842 is not set
> CONFIG_VIDEO_BT819=3Dy
> CONFIG_VIDEO_BT856=3Dy
> CONFIG_VIDEO_BT866=3Dy
> CONFIG_VIDEO_KS0127=3Dy
> CONFIG_VIDEO_ML86V7667=3Dy
> CONFIG_VIDEO_SAA7110=3Dy
> CONFIG_VIDEO_SAA711X=3Dy
> # CONFIG_VIDEO_TC358743 is not set
> # CONFIG_VIDEO_TVP514X is not set
> CONFIG_VIDEO_TVP5150=3Dy
> CONFIG_VIDEO_TVP7002=3Dy
> CONFIG_VIDEO_TW2804=3Dy
> CONFIG_VIDEO_TW9903=3Dy
> CONFIG_VIDEO_TW9906=3Dy
> CONFIG_VIDEO_TW9910=3Dy
> # CONFIG_VIDEO_VPX3220 is not set
> CONFIG_VIDEO_MAX9286=3Dy
> =

> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=3Dy
> # CONFIG_VIDEO_CX25840 is not set
> # end of Video decoders
> =

> #
> # Video encoders
> #
> CONFIG_VIDEO_SAA7127=3Dy
> # CONFIG_VIDEO_SAA7185 is not set
> CONFIG_VIDEO_ADV7170=3Dy
> CONFIG_VIDEO_ADV7175=3Dy
> CONFIG_VIDEO_ADV7343=3Dy
> CONFIG_VIDEO_ADV7393=3Dy
> CONFIG_VIDEO_ADV7511=3Dy
> # CONFIG_VIDEO_ADV7511_CEC is not set
> CONFIG_VIDEO_AD9389B=3Dy
> # CONFIG_VIDEO_AK881X is not set
> # CONFIG_VIDEO_THS8200 is not set
> # end of Video encoders
> =

> #
> # Video improvement chips
> #
> CONFIG_VIDEO_UPD64031A=3Dy
> CONFIG_VIDEO_UPD64083=3Dy
> # end of Video improvement chips
> =

> #
> # Audio/Video compression chips
> #
> CONFIG_VIDEO_SAA6752HS=3Dy
> # end of Audio/Video compression chips
> =

> #
> # SDR tuner chips
> #
> CONFIG_SDR_MAX2175=3Dy
> # end of SDR tuner chips
> =

> #
> # Miscellaneous helper chips
> #
> CONFIG_VIDEO_THS7303=3Dy
> # CONFIG_VIDEO_M52790 is not set
> CONFIG_VIDEO_I2C=3Dy
> CONFIG_VIDEO_ST_MIPID02=3Dy
> # end of Miscellaneous helper chips
> =

> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_APTINA_PLL=3Dy
> CONFIG_VIDEO_HI556=3Dy
> CONFIG_VIDEO_HI846=3Dy
> # CONFIG_VIDEO_IMX208 is not set
> CONFIG_VIDEO_IMX214=3Dy
> CONFIG_VIDEO_IMX219=3Dy
> # CONFIG_VIDEO_IMX258 is not set
> # CONFIG_VIDEO_IMX274 is not set
> CONFIG_VIDEO_IMX290=3Dy
> # CONFIG_VIDEO_IMX319 is not set
> CONFIG_VIDEO_IMX334=3Dy
> # CONFIG_VIDEO_IMX335 is not set
> # CONFIG_VIDEO_IMX355 is not set
> # CONFIG_VIDEO_IMX412 is not set
> CONFIG_VIDEO_OV02A10=3Dy
> CONFIG_VIDEO_OV2640=3Dy
> CONFIG_VIDEO_OV2659=3Dy
> CONFIG_VIDEO_OV2680=3Dy
> # CONFIG_VIDEO_OV2685 is not set
> # CONFIG_VIDEO_OV2740 is not set
> # CONFIG_VIDEO_OV5640 is not set
> # CONFIG_VIDEO_OV5645 is not set
> CONFIG_VIDEO_OV5647=3Dy
> CONFIG_VIDEO_OV5648=3Dy
> CONFIG_VIDEO_OV6650=3Dy
> CONFIG_VIDEO_OV5670=3Dy
> CONFIG_VIDEO_OV5675=3Dy
> CONFIG_VIDEO_OV5695=3Dy
> # CONFIG_VIDEO_OV7251 is not set
> # CONFIG_VIDEO_OV772X is not set
> CONFIG_VIDEO_OV7640=3Dy
> CONFIG_VIDEO_OV7670=3Dy
> # CONFIG_VIDEO_OV7740 is not set
> CONFIG_VIDEO_OV8856=3Dy
> # CONFIG_VIDEO_OV8865 is not set
> CONFIG_VIDEO_OV9282=3Dy
> CONFIG_VIDEO_OV9640=3Dy
> # CONFIG_VIDEO_OV9650 is not set
> CONFIG_VIDEO_OV9734=3Dy
> CONFIG_VIDEO_OV13858=3Dy
> CONFIG_VIDEO_OV13B10=3Dy
> CONFIG_VIDEO_VS6624=3Dy
> # CONFIG_VIDEO_MT9M001 is not set
> CONFIG_VIDEO_MT9M032=3Dy
> # CONFIG_VIDEO_MT9M111 is not set
> # CONFIG_VIDEO_MT9P031 is not set
> CONFIG_VIDEO_MT9T001=3Dy
> CONFIG_VIDEO_MT9T112=3Dy
> CONFIG_VIDEO_MT9V011=3Dy
> CONFIG_VIDEO_MT9V032=3Dy
> CONFIG_VIDEO_MT9V111=3Dy
> CONFIG_VIDEO_SR030PC30=3Dy
> CONFIG_VIDEO_NOON010PC30=3Dy
> CONFIG_VIDEO_M5MOLS=3Dy
> CONFIG_VIDEO_MAX9271_LIB=3Dy
> CONFIG_VIDEO_RDACM20=3Dy
> # CONFIG_VIDEO_RDACM21 is not set
> CONFIG_VIDEO_RJ54N1=3Dy
> CONFIG_VIDEO_S5K6AA=3Dy
> # CONFIG_VIDEO_S5K6A3 is not set
> CONFIG_VIDEO_S5K4ECGX=3Dy
> CONFIG_VIDEO_S5K5BAF=3Dy
> # CONFIG_VIDEO_CCS is not set
> # CONFIG_VIDEO_ET8EK8 is not set
> # end of Camera sensor devices
> =

> #
> # Lens drivers
> #
> CONFIG_VIDEO_AD5820=3Dy
> # CONFIG_VIDEO_AK7375 is not set
> CONFIG_VIDEO_DW9714=3Dy
> CONFIG_VIDEO_DW9768=3Dy
> CONFIG_VIDEO_DW9807_VCM=3Dy
> # end of Lens drivers
> =

> #
> # Flash devices
> #
> CONFIG_VIDEO_ADP1653=3Dy
> CONFIG_VIDEO_LM3560=3Dy
> CONFIG_VIDEO_LM3646=3Dy
> # end of Flash devices
> =

> #
> # SPI helper chips
> #
> # end of SPI helper chips
> =

> CONFIG_MEDIA_TUNER=3Dy
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA18250=3Dy
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> CONFIG_MEDIA_TUNER_TEA5761=3Dy
> CONFIG_MEDIA_TUNER_TEA5767=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_MT2060=3Dy
> CONFIG_MEDIA_TUNER_MT2063=3Dy
> CONFIG_MEDIA_TUNER_MT2266=3Dy
> CONFIG_MEDIA_TUNER_MT2131=3Dy
> CONFIG_MEDIA_TUNER_QT1010=3Dy
> CONFIG_MEDIA_TUNER_XC2028=3Dy
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dy
> CONFIG_MEDIA_TUNER_MXL5005S=3Dy
> # CONFIG_MEDIA_TUNER_MXL5007T is not set
> CONFIG_MEDIA_TUNER_MC44S803=3Dy
> # CONFIG_MEDIA_TUNER_MAX2165 is not set
> # CONFIG_MEDIA_TUNER_TDA18218 is not set
> CONFIG_MEDIA_TUNER_FC0011=3Dy
> # CONFIG_MEDIA_TUNER_FC0012 is not set
> CONFIG_MEDIA_TUNER_FC0013=3Dy
> CONFIG_MEDIA_TUNER_TDA18212=3Dy
> CONFIG_MEDIA_TUNER_E4000=3Dy
> CONFIG_MEDIA_TUNER_FC2580=3Dy
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dy
> CONFIG_MEDIA_TUNER_TUA9001=3Dy
> CONFIG_MEDIA_TUNER_SI2157=3Dy
> CONFIG_MEDIA_TUNER_IT913X=3Dy
> CONFIG_MEDIA_TUNER_R820T=3Dy
> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
> # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
> # CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
> # end of Customize TV tuners
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dy
> # CONFIG_DVB_STB6100 is not set
> # CONFIG_DVB_STV090x is not set
> # CONFIG_DVB_STV0910 is not set
> CONFIG_DVB_STV6110x=3Dy
> # CONFIG_DVB_STV6111 is not set
> # CONFIG_DVB_MXL5XX is not set
> # CONFIG_DVB_M88DS3103 is not set
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dy
> CONFIG_DVB_TDA18271C2DD=3Dy
> CONFIG_DVB_SI2165=3Dy
> CONFIG_DVB_MN88472=3Dy
> # CONFIG_DVB_MN88473 is not set
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=3Dy
> CONFIG_DVB_CX24123=3Dy
> # CONFIG_DVB_MT312 is not set
> # CONFIG_DVB_ZL10036 is not set
> # CONFIG_DVB_ZL10039 is not set
> CONFIG_DVB_S5H1420=3Dy
> # CONFIG_DVB_STV0288 is not set
> # CONFIG_DVB_STB6000 is not set
> CONFIG_DVB_STV0299=3Dy
> CONFIG_DVB_STV6110=3Dy
> CONFIG_DVB_STV0900=3Dy
> CONFIG_DVB_TDA8083=3Dy
> CONFIG_DVB_TDA10086=3Dy
> # CONFIG_DVB_TDA8261 is not set
> # CONFIG_DVB_VES1X93 is not set
> # CONFIG_DVB_TUNER_ITD1000 is not set
> CONFIG_DVB_TUNER_CX24113=3Dy
> CONFIG_DVB_TDA826X=3Dy
> CONFIG_DVB_TUA6100=3Dy
> CONFIG_DVB_CX24116=3Dy
> CONFIG_DVB_CX24117=3Dy
> CONFIG_DVB_CX24120=3Dy
> CONFIG_DVB_SI21XX=3Dy
> CONFIG_DVB_TS2020=3Dy
> # CONFIG_DVB_DS3000 is not set
> # CONFIG_DVB_MB86A16 is not set
> CONFIG_DVB_TDA10071=3Dy
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP887X=3Dy
> # CONFIG_DVB_CX22700 is not set
> CONFIG_DVB_CX22702=3Dy
> CONFIG_DVB_S5H1432=3Dy
> # CONFIG_DVB_DRXD is not set
> CONFIG_DVB_L64781=3Dy
> # CONFIG_DVB_TDA1004X is not set
> CONFIG_DVB_NXT6000=3Dy
> CONFIG_DVB_MT352=3Dy
> CONFIG_DVB_ZL10353=3Dy
> CONFIG_DVB_DIB3000MB=3Dy
> # CONFIG_DVB_DIB3000MC is not set
> # CONFIG_DVB_DIB7000M is not set
> CONFIG_DVB_DIB7000P=3Dy
> # CONFIG_DVB_DIB9000 is not set
> # CONFIG_DVB_TDA10048 is not set
> # CONFIG_DVB_AF9013 is not set
> CONFIG_DVB_EC100=3Dy
> CONFIG_DVB_STV0367=3Dy
> # CONFIG_DVB_CXD2820R is not set
> CONFIG_DVB_CXD2841ER=3Dy
> CONFIG_DVB_RTL2830=3Dy
> CONFIG_DVB_RTL2832=3Dy
> CONFIG_DVB_SI2168=3Dy
> CONFIG_DVB_ZD1301_DEMOD=3Dy
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dy
> CONFIG_DVB_TDA10021=3Dy
> CONFIG_DVB_TDA10023=3Dy
> CONFIG_DVB_STV0297=3Dy
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dy
> # CONFIG_DVB_OR51211 is not set
> CONFIG_DVB_OR51132=3Dy
> CONFIG_DVB_BCM3510=3Dy
> CONFIG_DVB_LGDT330X=3Dy
> CONFIG_DVB_LGDT3305=3Dy
> # CONFIG_DVB_LGDT3306A is not set
> CONFIG_DVB_LG2160=3Dy
> CONFIG_DVB_S5H1409=3Dy
> CONFIG_DVB_AU8522=3Dy
> # CONFIG_DVB_AU8522_DTV is not set
> CONFIG_DVB_AU8522_V4L=3Dy
> CONFIG_DVB_S5H1411=3Dy
> CONFIG_DVB_MXL692=3Dy
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_S921 is not set
> CONFIG_DVB_DIB8000=3Dy
> CONFIG_DVB_MB86A20S=3Dy
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_TC90522 is not set
> CONFIG_DVB_MN88443X=3Dy
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dy
> CONFIG_DVB_TUNER_DIB0070=3Dy
> # CONFIG_DVB_TUNER_DIB0090 is not set
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dy
> # CONFIG_DVB_LNBH25 is not set
> CONFIG_DVB_LNBH29=3Dy
> # CONFIG_DVB_LNBP21 is not set
> # CONFIG_DVB_LNBP22 is not set
> CONFIG_DVB_ISL6405=3Dy
> # CONFIG_DVB_ISL6421 is not set
> CONFIG_DVB_ISL6423=3Dy
> CONFIG_DVB_A8293=3Dy
> CONFIG_DVB_LGS8GL5=3Dy
> CONFIG_DVB_LGS8GXX=3Dy
> CONFIG_DVB_ATBM8830=3Dy
> # CONFIG_DVB_TDA665x is not set
> CONFIG_DVB_IX2505V=3Dy
> CONFIG_DVB_M88RS2000=3Dy
> # CONFIG_DVB_AF9033 is not set
> CONFIG_DVB_HORUS3A=3Dy
> # CONFIG_DVB_ASCOT2E is not set
> # CONFIG_DVB_HELENE is not set
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=3Dy
> # CONFIG_DVB_SP2 is not set
> # end of Customise DVB Frontends
> =

> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=3Dy
> # end of Media ancillary drivers
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> CONFIG_AGP_AMD64=3Dy
> CONFIG_AGP_INTEL=3Dy
> # CONFIG_AGP_SIS is not set
> # CONFIG_AGP_VIA is not set
> CONFIG_INTEL_GTT=3Dy
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> CONFIG_VGA_SWITCHEROO=3Dy
> # CONFIG_DRM is not set
> # CONFIG_DRM_DEBUG_MODESET_LOCK is not set
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> #
> # Frame buffer Devices
> #
> # CONFIG_FB is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_KTD253=3Dy
> # CONFIG_BACKLIGHT_DA903X is not set
> # CONFIG_BACKLIGHT_DA9052 is not set
> CONFIG_BACKLIGHT_MAX8925=3Dy
> CONFIG_BACKLIGHT_APPLE=3Dy
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> # CONFIG_BACKLIGHT_RT4831 is not set
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_WM831X=3Dy
> # CONFIG_BACKLIGHT_ADP5520 is not set
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_88PM860X=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> # CONFIG_BACKLIGHT_SKY81452 is not set
> # CONFIG_BACKLIGHT_TPS65217 is not set
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_BACKLIGHT_ARCXCNN=3Dy
> # CONFIG_BACKLIGHT_LED is not set
> # end of Backlight & LCD device support
> =

> CONFIG_HDMI=3Dy
> # end of Graphics support
> =

> CONFIG_SOUND=3Dy
> # CONFIG_SND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dy
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> CONFIG_HID_ACRUX=3Dy
> CONFIG_HID_ACRUX_FF=3Dy
> # CONFIG_HID_APPLE is not set
> CONFIG_HID_AUREAL=3Dy
> CONFIG_HID_BELKIN=3Dy
> # CONFIG_HID_CHERRY is not set
> CONFIG_HID_CHICONY=3Dy
> # CONFIG_HID_COUGAR is not set
> CONFIG_HID_MACALLY=3Dy
> # CONFIG_HID_CMEDIA is not set
> CONFIG_HID_CYPRESS=3Dy
> # CONFIG_HID_DRAGONRISE is not set
> CONFIG_HID_EMS_FF=3Dy
> CONFIG_HID_ELECOM=3Dy
> CONFIG_HID_EZKEY=3Dy
> CONFIG_HID_GEMBIRD=3Dy
> CONFIG_HID_GFRM=3Dy
> CONFIG_HID_GLORIOUS=3Dy
> CONFIG_HID_VIVALDI=3Dy
> CONFIG_HID_KEYTOUCH=3Dy
> CONFIG_HID_KYE=3Dy
> CONFIG_HID_WALTOP=3Dy
> # CONFIG_HID_VIEWSONIC is not set
> CONFIG_HID_XIAOMI=3Dy
> CONFIG_HID_GYRATION=3Dy
> # CONFIG_HID_ICADE is not set
> CONFIG_HID_ITE=3Dy
> CONFIG_HID_JABRA=3Dy
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> CONFIG_HID_LCPOWER=3Dy
> CONFIG_HID_LED=3Dy
> # CONFIG_HID_LENOVO is not set
> CONFIG_HID_LOGITECH=3Dy
> CONFIG_HID_LOGITECH_HIDPP=3Dy
> # CONFIG_LOGITECH_FF is not set
> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> # CONFIG_LOGIG940_FF is not set
> # CONFIG_LOGIWHEELS_FF is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MALTRON is not set
> CONFIG_HID_MAYFLASH=3Dy
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=3Dy
> # CONFIG_HID_MONTEREY is not set
> CONFIG_HID_MULTITOUCH=3Dy
> CONFIG_HID_NINTENDO=3Dy
> CONFIG_NINTENDO_FF=3Dy
> CONFIG_HID_NTI=3Dy
> # CONFIG_HID_ORTEK is not set
> # CONFIG_HID_PANTHERLORD is not set
> CONFIG_HID_PETALYNX=3Dy
> # CONFIG_HID_PICOLCD is not set
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PLAYSTATION=3Dy
> CONFIG_PLAYSTATION_FF=3Dy
> # CONFIG_HID_PRIMAX is not set
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> # CONFIG_HID_SEMITEK is not set
> CONFIG_HID_SPEEDLINK=3Dy
> CONFIG_HID_STEAM=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> CONFIG_HID_RMI=3Dy
> CONFIG_HID_GREENASIA=3Dy
> CONFIG_GREENASIA_FF=3Dy
> CONFIG_HID_SMARTJOYPLUS=3Dy
> # CONFIG_SMARTJOYPLUS_FF is not set
> CONFIG_HID_TIVO=3Dy
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_UDRAW_PS3=3Dy
> CONFIG_HID_WIIMOTE=3Dy
> # CONFIG_HID_XINMO is not set
> CONFIG_HID_ZEROPLUS=3Dy
> # CONFIG_ZEROPLUS_FF is not set
> # CONFIG_HID_ZYDACRON is not set
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dy
> # CONFIG_HID_ALPS is not set
> # end of Special HID drivers
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID_ACPI=3Dy
> CONFIG_I2C_HID_OF=3Dy
> # CONFIG_I2C_HID_OF_GOODIX is not set
> # end of I2C HID support
> =

> CONFIG_I2C_HID_CORE=3Dy
> =

> #
> # Intel ISH HID support
> #
> # CONFIG_INTEL_ISH_HID is not set
> # end of Intel ISH HID support
> =

> #
> # AMD SFH HID Support
> #
> CONFIG_AMD_SFH_HID=3Dy
> # end of AMD SFH HID Support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> CONFIG_USB_PCI=3Dy
> =

> #
> # USB port drivers
> #
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> # CONFIG_TYPEC is not set
> # CONFIG_USB_ROLE_SWITCH is not set
> # CONFIG_MMC is not set
> CONFIG_MEMSTICK=3Dy
> # CONFIG_MEMSTICK_DEBUG is not set
> =

> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> =

> #
> # MemoryStick Host Controller Drivers
> #
> CONFIG_MEMSTICK_TIFM_MS=3Dy
> CONFIG_MEMSTICK_JMICRON_38X=3Dy
> CONFIG_MEMSTICK_R592=3Dy
> CONFIG_MEMSTICK_REALTEK_PCI=3Dy
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> CONFIG_LEDS_CLASS_MULTICOLOR=3Dy
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dy
> CONFIG_LEDS_AN30259A=3Dy
> CONFIG_LEDS_AW2013=3Dy
> # CONFIG_LEDS_BCM6328 is not set
> CONFIG_LEDS_BCM6358=3Dy
> # CONFIG_LEDS_LM3530 is not set
> CONFIG_LEDS_LM3532=3Dy
> CONFIG_LEDS_LM3642=3Dy
> CONFIG_LEDS_LM3692X=3Dy
> CONFIG_LEDS_PCA9532=3Dy
> CONFIG_LEDS_PCA9532_GPIO=3Dy
> CONFIG_LEDS_GPIO=3Dy
> # CONFIG_LEDS_LP3944 is not set
> CONFIG_LEDS_LP3952=3Dy
> CONFIG_LEDS_LP50XX=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> CONFIG_LEDS_LP5523=3Dy
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dy
> # CONFIG_LEDS_LP8860 is not set
> # CONFIG_LEDS_PCA955X is not set
> CONFIG_LEDS_PCA963X=3Dy
> # CONFIG_LEDS_WM831X_STATUS is not set
> CONFIG_LEDS_WM8350=3Dy
> CONFIG_LEDS_DA903X=3Dy
> # CONFIG_LEDS_DA9052 is not set
> CONFIG_LEDS_REGULATOR=3Dy
> # CONFIG_LEDS_BD2802 is not set
> # CONFIG_LEDS_LT3593 is not set
> # CONFIG_LEDS_ADP5520 is not set
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> CONFIG_LEDS_MAX77650=3Dy
> # CONFIG_LEDS_LM355x is not set
> CONFIG_LEDS_MENF21BMC=3Dy
> # CONFIG_LEDS_IS31FL319X is not set
> # CONFIG_LEDS_IS31FL32XX is not set
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> # CONFIG_LEDS_MLXREG is not set
> CONFIG_LEDS_USER=3Dy
> # CONFIG_LEDS_NIC78BX is not set
> CONFIG_LEDS_TI_LMU_COMMON=3Dy
> CONFIG_LEDS_LM3697=3Dy
> CONFIG_LEDS_TPS6105X=3Dy
> =

> #
> # Flash and Torch LED drivers
> #
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dy
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> # CONFIG_LEDS_TRIGGER_MTD is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> CONFIG_LEDS_TRIGGER_CPU=3Dy
> CONFIG_LEDS_TRIGGER_ACTIVITY=3Dy
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> CONFIG_LEDS_TRIGGER_NETDEV=3Dy
> # CONFIG_LEDS_TRIGGER_PATTERN is not set
> CONFIG_LEDS_TRIGGER_AUDIO=3Dy
> # CONFIG_LEDS_TRIGGER_TTY is not set
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_INFINIBAND=3Dy
> # CONFIG_INFINIBAND_USER_MAD is not set
> CONFIG_INFINIBAND_USER_ACCESS=3Dy
> CONFIG_INFINIBAND_USER_MEM=3Dy
> CONFIG_INFINIBAND_ON_DEMAND_PAGING=3Dy
> # CONFIG_INFINIBAND_ADDR_TRANS is not set
> CONFIG_INFINIBAND_VIRT_DMA=3Dy
> CONFIG_INFINIBAND_MTHCA=3Dy
> CONFIG_INFINIBAND_MTHCA_DEBUG=3Dy
> # CONFIG_INFINIBAND_EFA is not set
> # CONFIG_MLX4_INFINIBAND is not set
> # CONFIG_INFINIBAND_OCRDMA is not set
> # CONFIG_INFINIBAND_RDMAVT is not set
> CONFIG_RDMA_RXE=3Dy
> # CONFIG_RDMA_SIW is not set
> # CONFIG_INFINIBAND_IPOIB is not set
> CONFIG_INFINIBAND_OPA_VNIC=3Dy
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
> # CONFIG_DMADEVICES is not set
> =

> #
> # DMABUF options
> #
> # CONFIG_SYNC_FILE is not set
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # CONFIG_DMABUF_SYSFS_STATS is not set
> # end of DMABUF options
> =

> CONFIG_AUXDISPLAY=3Dy
> CONFIG_CHARLCD=3Dy
> CONFIG_HD44780_COMMON=3Dy
> CONFIG_HD44780=3Dy
> # CONFIG_IMG_ASCII_LCD is not set
> CONFIG_LCD2S=3Dy
> CONFIG_PARPORT_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> # CONFIG_CHARLCD_BL_OFF is not set
> # CONFIG_CHARLCD_BL_ON is not set
> CONFIG_CHARLCD_BL_FLASH=3Dy
> CONFIG_PANEL=3Dy
> CONFIG_UIO=3Dy
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> CONFIG_UIO_AEC=3Dy
> CONFIG_UIO_SERCOS3=3Dy
> CONFIG_UIO_PCI_GENERIC=3Dy
> CONFIG_UIO_NETX=3Dy
> CONFIG_UIO_PRUSS=3Dy
> CONFIG_UIO_MF624=3Dy
> CONFIG_VFIO=3Dy
> CONFIG_VFIO_IOMMU_TYPE1=3Dy
> CONFIG_VFIO_VIRQFD=3Dy
> CONFIG_VFIO_NOIOMMU=3Dy
> CONFIG_VFIO_PCI_CORE=3Dy
> CONFIG_VFIO_PCI_MMAP=3Dy
> CONFIG_VFIO_PCI_INTX=3Dy
> CONFIG_VFIO_PCI=3Dy
> CONFIG_VFIO_PCI_VGA=3Dy
> # CONFIG_VFIO_PCI_IGD is not set
> CONFIG_VFIO_MDEV=3Dy
> CONFIG_IRQ_BYPASS_MANAGER=3Dy
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> # CONFIG_VIRTIO_MENU is not set
> CONFIG_VDPA=3Dy
> # CONFIG_VDPA_USER is not set
> # CONFIG_IFCVF is not set
> # CONFIG_VP_VDPA is not set
> # CONFIG_ALIBABA_ENI_VDPA is not set
> CONFIG_VHOST_MENU=3Dy
> # CONFIG_VHOST_NET is not set
> # CONFIG_VHOST_VSOCK is not set
> # CONFIG_VHOST_VDPA is not set
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # end of Microsoft Hyper-V guest support
> =

> CONFIG_GREYBUS=3Dy
> CONFIG_COMEDI=3Dy
> # CONFIG_COMEDI_DEBUG is not set
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> # CONFIG_COMEDI_MISC_DRIVERS is not set
> CONFIG_COMEDI_ISA_DRIVERS=3Dy
> CONFIG_COMEDI_PCL711=3Dy
> CONFIG_COMEDI_PCL724=3Dy
> # CONFIG_COMEDI_PCL726 is not set
> CONFIG_COMEDI_PCL730=3Dy
> # CONFIG_COMEDI_PCL812 is not set
> # CONFIG_COMEDI_PCL816 is not set
> CONFIG_COMEDI_PCL818=3Dy
> # CONFIG_COMEDI_PCM3724 is not set
> CONFIG_COMEDI_AMPLC_DIO200_ISA=3Dy
> CONFIG_COMEDI_AMPLC_PC236_ISA=3Dy
> CONFIG_COMEDI_AMPLC_PC263_ISA=3Dy
> # CONFIG_COMEDI_RTI800 is not set
> CONFIG_COMEDI_RTI802=3Dy
> # CONFIG_COMEDI_DAC02 is not set
> # CONFIG_COMEDI_DAS16M1 is not set
> # CONFIG_COMEDI_DAS08_ISA is not set
> # CONFIG_COMEDI_DAS16 is not set
> # CONFIG_COMEDI_DAS800 is not set
> CONFIG_COMEDI_DAS1800=3Dy
> CONFIG_COMEDI_DAS6402=3Dy
> CONFIG_COMEDI_DT2801=3Dy
> CONFIG_COMEDI_DT2811=3Dy
> CONFIG_COMEDI_DT2814=3Dy
> # CONFIG_COMEDI_DT2815 is not set
> # CONFIG_COMEDI_DT2817 is not set
> CONFIG_COMEDI_DT282X=3Dy
> CONFIG_COMEDI_DMM32AT=3Dy
> # CONFIG_COMEDI_FL512 is not set
> CONFIG_COMEDI_AIO_AIO12_8=3Dy
> CONFIG_COMEDI_AIO_IIRO_16=3Dy
> CONFIG_COMEDI_II_PCI20KC=3Dy
> # CONFIG_COMEDI_C6XDIGIO is not set
> CONFIG_COMEDI_MPC624=3Dy
> CONFIG_COMEDI_ADQ12B=3Dy
> CONFIG_COMEDI_NI_AT_A2150=3Dy
> # CONFIG_COMEDI_NI_AT_AO is not set
> # CONFIG_COMEDI_NI_ATMIO is not set
> CONFIG_COMEDI_NI_ATMIO16D=3Dy
> # CONFIG_COMEDI_NI_LABPC_ISA is not set
> CONFIG_COMEDI_PCMAD=3Dy
> CONFIG_COMEDI_PCMDA12=3Dy
> CONFIG_COMEDI_PCMMIO=3Dy
> # CONFIG_COMEDI_PCMUIO is not set
> CONFIG_COMEDI_MULTIQ3=3Dy
> # CONFIG_COMEDI_S526 is not set
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> CONFIG_COMEDI_8255_SA=3Dy
> CONFIG_COMEDI_KCOMEDILIB=3Dy
> CONFIG_COMEDI_AMPLC_DIO200=3Dy
> CONFIG_COMEDI_AMPLC_PC236=3Dy
> CONFIG_COMEDI_ISADMA=3Dy
> CONFIG_COMEDI_NI_ROUTING=3Dy
> CONFIG_COMEDI_TESTS=3Dy
> CONFIG_COMEDI_TESTS_EXAMPLE=3Dy
> CONFIG_COMEDI_TESTS_NI_ROUTES=3Dy
> CONFIG_STAGING=3Dy
> # CONFIG_RTLLIB is not set
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> # end of Accelerometers
> =

> #
> # Analog to digital converters
> #
> # end of Analog to digital converters
> =

> #
> # Analog digital bi-direction converters
> #
> # CONFIG_ADT7316 is not set
> # end of Analog digital bi-direction converters
> =

> #
> # Capacitance to digital converters
> #
> # CONFIG_AD7746 is not set
> # end of Capacitance to digital converters
> =

> #
> # Direct Digital Synthesis
> #
> # end of Direct Digital Synthesis
> =

> #
> # Network Analyzer, Impedance Converters
> #
> CONFIG_AD5933=3Dy
> # end of Network Analyzer, Impedance Converters
> =

> #
> # Active energy metering IC
> #
> CONFIG_ADE7854=3Dy
> # CONFIG_ADE7854_I2C is not set
> # end of Active energy metering IC
> =

> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> # end of IIO staging drivers
> =

> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> # end of Android
> =

> CONFIG_STAGING_BOARD=3Dy
> # CONFIG_FIREWIRE_SERIAL is not set
> CONFIG_GS_FPGABOOT=3Dy
> CONFIG_UNISYSSPAR=3Dy
> CONFIG_UNISYS_VISORNIC=3Dy
> CONFIG_UNISYS_VISORINPUT=3Dy
> CONFIG_COMMON_CLK_XLNX_CLKWZRD=3Dy
> CONFIG_GREYBUS_BOOTROM=3Dy
> CONFIG_GREYBUS_HID=3Dy
> CONFIG_GREYBUS_LIGHT=3Dy
> CONFIG_GREYBUS_LOG=3Dy
> CONFIG_GREYBUS_LOOPBACK=3Dy
> CONFIG_GREYBUS_POWER=3Dy
> # CONFIG_GREYBUS_RAW is not set
> # CONFIG_GREYBUS_VIBRATOR is not set
> CONFIG_GREYBUS_BRIDGED_PHY=3Dy
> # CONFIG_GREYBUS_GPIO is not set
> CONFIG_GREYBUS_I2C=3Dy
> # CONFIG_GREYBUS_UART is not set
> # CONFIG_XIL_AXIS_FIFO is not set
> # CONFIG_FIELDBUS_DEV is not set
> # CONFIG_QLGE is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> CONFIG_ACPI_WMI=3Dy
> # CONFIG_WMI_BMOF is not set
> CONFIG_HUAWEI_WMI=3Dy
> CONFIG_MXM_WMI=3Dy
> # CONFIG_PEAQ_WMI is not set
> # CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
> # CONFIG_XIAOMI_WMI is not set
> CONFIG_GIGABYTE_WMI=3Dy
> CONFIG_ACERHDF=3Dy
> CONFIG_ACER_WIRELESS=3Dy
> CONFIG_ACER_WMI=3Dy
> # CONFIG_AMD_PMC is not set
> CONFIG_ADV_SWBUTTON=3Dy
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_ASUS_LAPTOP is not set
> CONFIG_ASUS_WIRELESS=3Dy
> CONFIG_ASUS_WMI=3Dy
> CONFIG_ASUS_NB_WMI=3Dy
> CONFIG_MERAKI_MX100=3Dy
> CONFIG_EEEPC_LAPTOP=3Dy
> CONFIG_EEEPC_WMI=3Dy
> CONFIG_X86_PLATFORM_DRIVERS_DELL=3Dy
> # CONFIG_ALIENWARE_WMI is not set
> CONFIG_DCDBAS=3Dy
> # CONFIG_DELL_RBU is not set
> # CONFIG_DELL_RBTN is not set
> # CONFIG_DELL_SMBIOS is not set
> CONFIG_DELL_SMO8800=3Dy
> # CONFIG_DELL_WMI_AIO is not set
> CONFIG_DELL_WMI_DESCRIPTOR=3Dm
> # CONFIG_DELL_WMI_LED is not set
> # CONFIG_AMILO_RFKILL is not set
> CONFIG_FUJITSU_LAPTOP=3Dy
> CONFIG_FUJITSU_TABLET=3Dy
> CONFIG_GPD_POCKET_FAN=3Dy
> CONFIG_HP_ACCEL=3Dy
> # CONFIG_WIRELESS_HOTKEY is not set
> # CONFIG_HP_WMI is not set
> CONFIG_IBM_RTL=3Dy
> CONFIG_IDEAPAD_LAPTOP=3Dy
> CONFIG_SENSORS_HDAPS=3Dy
> # CONFIG_THINKPAD_ACPI is not set
> CONFIG_THINKPAD_LMI=3Dy
> # CONFIG_X86_PLATFORM_DRIVERS_INTEL is not set
> CONFIG_MSI_LAPTOP=3Dy
> # CONFIG_MSI_WMI is not set
> # CONFIG_PCENGINES_APU2 is not set
> CONFIG_BARCO_P50_GPIO=3Dy
> CONFIG_SAMSUNG_LAPTOP=3Dy
> CONFIG_SAMSUNG_Q10=3Dy
> CONFIG_ACPI_TOSHIBA=3Dy
> CONFIG_TOSHIBA_BT_RFKILL=3Dy
> CONFIG_TOSHIBA_HAPS=3Dy
> CONFIG_TOSHIBA_WMI=3Dy
> # CONFIG_ACPI_CMPC is not set
> CONFIG_COMPAL_LAPTOP=3Dy
> # CONFIG_LG_LAPTOP is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_SONY_LAPTOP is not set
> # CONFIG_SYSTEM76_ACPI is not set
> CONFIG_TOPSTAR_LAPTOP=3Dy
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> CONFIG_MLX_PLATFORM=3Dy
> CONFIG_FW_ATTR_CLASS=3Dy
> # CONFIG_INTEL_IPS is not set
> CONFIG_INTEL_SCU_IPC=3Dy
> CONFIG_INTEL_SCU=3Dy
> CONFIG_INTEL_SCU_PCI=3Dy
> # CONFIG_INTEL_SCU_PLATFORM is not set
> CONFIG_INTEL_SCU_IPC_UTIL=3Dy
> CONFIG_PMC_ATOM=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> # CONFIG_CHROMEOS_PSTORE is not set
> # CONFIG_CHROMEOS_TBMC is not set
> # CONFIG_CROS_EC is not set
> CONFIG_CROS_KBD_LED_BACKLIGHT=3Dy
> # CONFIG_MELLANOX_PLATFORM is not set
> # CONFIG_SURFACE_PLATFORMS is not set
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> CONFIG_COMMON_CLK_WM831X=3Dy
> CONFIG_COMMON_CLK_MAX77686=3Dy
> CONFIG_COMMON_CLK_MAX9485=3Dy
> CONFIG_COMMON_CLK_SI5341=3Dy
> CONFIG_COMMON_CLK_SI5351=3Dy
> CONFIG_COMMON_CLK_SI514=3Dy
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_SI570 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> CONFIG_COMMON_CLK_CDCE925=3Dy
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_S2MPS11 is not set
> CONFIG_COMMON_CLK_AXI_CLKGEN=3Dy
> CONFIG_COMMON_CLK_LOCHNAGAR=3Dy
> CONFIG_COMMON_CLK_VC5=3Dy
> # CONFIG_COMMON_CLK_FIXED_MMIO is not set
> # CONFIG_CLK_LGM_CGU is not set
> # CONFIG_XILINX_VCU is not set
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_MICROCHIP_PIT64B is not set
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> # CONFIG_PLATFORM_MHU is not set
> # CONFIG_PCC is not set
> # CONFIG_ALTERA_MBOX is not set
> # CONFIG_MAILBOX_TEST is not set
> CONFIG_IOMMU_IOVA=3Dy
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
> =

> # CONFIG_IOMMU_DEBUGFS is not set
> # CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
> # CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
> CONFIG_IOMMU_DEFAULT_PASSTHROUGH=3Dy
> CONFIG_OF_IOMMU=3Dy
> CONFIG_IOMMU_DMA=3Dy
> # CONFIG_AMD_IOMMU is not set
> CONFIG_DMAR_TABLE=3Dy
> # CONFIG_INTEL_IOMMU is not set
> CONFIG_IRQ_REMAP=3Dy
> CONFIG_VIRTIO_IOMMU=3Dy
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dy
> CONFIG_REMOTEPROC_CDEV=3Dy
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=3Dy
> CONFIG_RPMSG_CHAR=3Dy
> CONFIG_RPMSG_NS=3Dy
> CONFIG_RPMSG_QCOM_GLINK=3Dy
> CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
> CONFIG_RPMSG_VIRTIO=3Dy
> # end of Rpmsg drivers
> =

> CONFIG_SOUNDWIRE=3Dy
> =

> #
> # SoundWire Devices
> #
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Enable LiteX SoC Builder specific drivers
> #
> CONFIG_LITEX=3Dy
> CONFIG_LITEX_SOC_CONTROLLER=3Dy
> # end of Enable LiteX SoC Builder specific drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> # CONFIG_DEVFREQ_GOV_USERSPACE is not set
> # CONFIG_DEVFREQ_GOV_PASSIVE is not set
> =

> #
> # DEVFREQ Drivers
> #
> # CONFIG_PM_DEVFREQ_EVENT is not set
> # CONFIG_EXTCON is not set
> CONFIG_MEMORY=3Dy
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_BUFFER_DMA=3Dy
> CONFIG_IIO_BUFFER_DMAENGINE=3Dy
> CONFIG_IIO_BUFFER_HW_CONSUMER=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> CONFIG_IIO_SW_DEVICE=3Dy
> CONFIG_IIO_SW_TRIGGER=3Dy
> CONFIG_IIO_TRIGGERED_EVENT=3Dy
> =

> #
> # Accelerometers
> #
> # CONFIG_ADXL313_I2C is not set
> CONFIG_ADXL355=3Dy
> CONFIG_ADXL355_I2C=3Dy
> CONFIG_ADXL372=3Dy
> CONFIG_ADXL372_I2C=3Dy
> CONFIG_BMA400=3Dy
> CONFIG_BMA400_I2C=3Dy
> CONFIG_BMC150_ACCEL=3Dy
> CONFIG_BMC150_ACCEL_I2C=3Dy
> # CONFIG_DA280 is not set
> CONFIG_DA311=3Dy
> CONFIG_DMARD06=3Dy
> CONFIG_DMARD09=3Dy
> # CONFIG_DMARD10 is not set
> CONFIG_FXLS8962AF=3Dy
> CONFIG_FXLS8962AF_I2C=3Dy
> CONFIG_HID_SENSOR_ACCEL_3D=3Dy
> # CONFIG_KXSD9 is not set
> # CONFIG_KXCJK1013 is not set
> CONFIG_MC3230=3Dy
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7660=3Dy
> # CONFIG_MMA8452 is not set
> CONFIG_MMA9551_CORE=3Dy
> CONFIG_MMA9551=3Dy
> CONFIG_MMA9553=3Dy
> CONFIG_MXC4005=3Dy
> CONFIG_MXC6255=3Dy
> CONFIG_STK8312=3Dy
> # CONFIG_STK8BA50 is not set
> # end of Accelerometers
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD7091R5=3Dy
> # CONFIG_AD7291 is not set
> CONFIG_AD7606=3Dy
> CONFIG_AD7606_IFACE_PARALLEL=3Dy
> CONFIG_AD799X=3Dy
> CONFIG_ADI_AXI_ADC=3Dy
> CONFIG_AXP20X_ADC=3Dy
> CONFIG_AXP288_ADC=3Dy
> CONFIG_CC10001_ADC=3Dy
> CONFIG_DA9150_GPADC=3Dy
> CONFIG_ENVELOPE_DETECTOR=3Dy
> CONFIG_HX711=3Dy
> CONFIG_LTC2471=3Dy
> CONFIG_LTC2485=3Dy
> CONFIG_LTC2497=3Dy
> CONFIG_MAX1363=3Dy
> CONFIG_MAX9611=3Dy
> CONFIG_MCP3422=3Dy
> # CONFIG_MEDIATEK_MT6360_ADC is not set
> # CONFIG_MP2629_ADC is not set
> # CONFIG_NAU7802 is not set
> CONFIG_QCOM_VADC_COMMON=3Dy
> CONFIG_QCOM_SPMI_IADC=3Dy
> # CONFIG_QCOM_SPMI_VADC is not set
> CONFIG_QCOM_SPMI_ADC5=3Dy
> CONFIG_RN5T618_ADC=3Dy
> CONFIG_SD_ADC_MODULATOR=3Dy
> CONFIG_STX104=3Dy
> CONFIG_TI_ADC081C=3Dy
> CONFIG_TI_ADS1015=3Dy
> CONFIG_VF610_ADC=3Dy
> CONFIG_XILINX_XADC=3Dy
> # end of Analog to digital converters
> =

> #
> # Analog Front Ends
> #
> # CONFIG_IIO_RESCALE is not set
> # end of Analog Front Ends
> =

> #
> # Amplifiers
> #
> # CONFIG_HMC425 is not set
> # end of Amplifiers
> =

> #
> # Capacitance to digital converters
> #
> # CONFIG_AD7150 is not set
> # end of Capacitance to digital converters
> =

> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=3Dy
> CONFIG_ATLAS_EZO_SENSOR=3Dy
> CONFIG_BME680=3Dy
> CONFIG_BME680_I2C=3Dy
> # CONFIG_CCS811 is not set
> CONFIG_IAQCORE=3Dy
> CONFIG_PMS7003=3Dy
> CONFIG_SCD30_CORE=3Dy
> CONFIG_SCD30_I2C=3Dy
> CONFIG_SCD30_SERIAL=3Dy
> CONFIG_SCD4X=3Dy
> # CONFIG_SENSIRION_SGP30 is not set
> CONFIG_SENSIRION_SGP40=3Dy
> CONFIG_SPS30=3Dy
> CONFIG_SPS30_I2C=3Dy
> # CONFIG_SPS30_SERIAL is not set
> CONFIG_SENSEAIR_SUNRISE_CO2=3Dy
> # CONFIG_VZ89X is not set
> # end of Chemical Sensors
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=3Dy
> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
> # end of Hid Sensor IIO Common
> =

> CONFIG_IIO_MS_SENSORS_I2C=3Dy
> =

> #
> # IIO SCMI Sensors
> #
> # end of IIO SCMI Sensors
> =

> #
> # SSP Sensor Common
> #
> # end of SSP Sensor Common
> =

> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dy
> CONFIG_AD5380=3Dy
> # CONFIG_AD5446 is not set
> # CONFIG_AD5593R is not set
> # CONFIG_AD5696_I2C is not set
> CONFIG_CIO_DAC=3Dy
> # CONFIG_DPOT_DAC is not set
> CONFIG_DS4424=3Dy
> # CONFIG_M62332 is not set
> # CONFIG_MAX517 is not set
> CONFIG_MAX5821=3Dy
> CONFIG_MCP4725=3Dy
> CONFIG_TI_DAC5571=3Dy
> CONFIG_VF610_DAC=3Dy
> # end of Digital to analog converters
> =

> #
> # IIO dummy driver
> #
> CONFIG_IIO_SIMPLE_DUMMY=3Dy
> # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> CONFIG_IIO_SIMPLE_DUMMY_BUFFER=3Dy
> # end of IIO dummy driver
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> # end of Clock Generator/Distribution
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
> =

> #
> # Digital gyroscope sensors
> #
> # CONFIG_BMG160 is not set
> CONFIG_FXAS21002C=3Dy
> CONFIG_FXAS21002C_I2C=3Dy
> # CONFIG_HID_SENSOR_GYRO_3D is not set
> # CONFIG_MPU3050_I2C is not set
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_ITG3200=3Dy
> # end of Digital gyroscope sensors
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4404=3Dy
> CONFIG_MAX30100=3Dy
> # CONFIG_MAX30102 is not set
> # end of Heart Rate Monitors
> # end of Health Sensors
> =

> #
> # Humidity sensors
> #
> # CONFIG_AM2315 is not set
> CONFIG_DHT11=3Dy
> # CONFIG_HDC100X is not set
> CONFIG_HDC2010=3Dy
> # CONFIG_HID_SENSOR_HUMIDITY is not set
> # CONFIG_HTS221 is not set
> CONFIG_HTU21=3Dy
> CONFIG_SI7005=3Dy
> CONFIG_SI7020=3Dy
> # end of Humidity sensors
> =

> #
> # Inertial measurement units
> #
> CONFIG_BMI160=3Dy
> CONFIG_BMI160_I2C=3Dy
> CONFIG_FXOS8700=3Dy
> CONFIG_FXOS8700_I2C=3Dy
> # CONFIG_KMX61 is not set
> CONFIG_INV_ICM42600=3Dy
> CONFIG_INV_ICM42600_I2C=3Dy
> CONFIG_INV_MPU6050_IIO=3Dy
> CONFIG_INV_MPU6050_I2C=3Dy
> # CONFIG_IIO_ST_LSM6DSX is not set
> # end of Inertial measurement units
> =

> #
> # Light sensors
> #
> CONFIG_ACPI_ALS=3Dy
> CONFIG_ADJD_S311=3Dy
> # CONFIG_ADUX1020 is not set
> CONFIG_AL3010=3Dy
> CONFIG_AL3320A=3Dy
> # CONFIG_APDS9300 is not set
> CONFIG_APDS9960=3Dy
> CONFIG_AS73211=3Dy
> CONFIG_BH1750=3Dy
> CONFIG_BH1780=3Dy
> CONFIG_CM32181=3Dy
> # CONFIG_CM3232 is not set
> CONFIG_CM3323=3Dy
> CONFIG_CM3605=3Dy
> # CONFIG_CM36651 is not set
> CONFIG_GP2AP002=3Dy
> # CONFIG_GP2AP020A00F is not set
> CONFIG_IQS621_ALS=3Dy
> CONFIG_SENSORS_ISL29018=3Dy
> CONFIG_SENSORS_ISL29028=3Dy
> CONFIG_ISL29125=3Dy
> # CONFIG_HID_SENSOR_ALS is not set
> # CONFIG_HID_SENSOR_PROX is not set
> CONFIG_JSA1212=3Dy
> # CONFIG_RPR0521 is not set
> CONFIG_LTR501=3Dy
> CONFIG_LV0104CS=3Dy
> CONFIG_MAX44000=3Dy
> CONFIG_MAX44009=3Dy
> CONFIG_NOA1305=3Dy
> CONFIG_OPT3001=3Dy
> # CONFIG_PA12203001 is not set
> CONFIG_SI1133=3Dy
> # CONFIG_SI1145 is not set
> CONFIG_STK3310=3Dy
> CONFIG_ST_UVIS25=3Dy
> CONFIG_ST_UVIS25_I2C=3Dy
> # CONFIG_TCS3414 is not set
> CONFIG_TCS3472=3Dy
> CONFIG_SENSORS_TSL2563=3Dy
> CONFIG_TSL2583=3Dy
> CONFIG_TSL2591=3Dy
> CONFIG_TSL2772=3Dy
> # CONFIG_TSL4531 is not set
> # CONFIG_US5182D is not set
> # CONFIG_VCNL4000 is not set
> # CONFIG_VCNL4035 is not set
> CONFIG_VEML6030=3Dy
> CONFIG_VEML6070=3Dy
> CONFIG_VL6180=3Dy
> # CONFIG_ZOPT2201 is not set
> # end of Light sensors
> =

> #
> # Magnetometer sensors
> #
> # CONFIG_AK8974 is not set
> # CONFIG_AK8975 is not set
> # CONFIG_AK09911 is not set
> CONFIG_BMC150_MAGN=3Dy
> CONFIG_BMC150_MAGN_I2C=3Dy
> # CONFIG_MAG3110 is not set
> CONFIG_HID_SENSOR_MAGNETOMETER_3D=3Dy
> CONFIG_MMC35240=3Dy
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_SENSORS_HMC5843=3Dy
> CONFIG_SENSORS_HMC5843_I2C=3Dy
> # CONFIG_SENSORS_RM3100_I2C is not set
> CONFIG_YAMAHA_YAS530=3Dy
> # end of Magnetometer sensors
> =

> #
> # Multiplexers
> #
> # CONFIG_IIO_MUX is not set
> # end of Multiplexers
> =

> #
> # Inclinometer sensors
> #
> CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dy
> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dy
> # end of Inclinometer sensors
> =

> CONFIG_IIO_TEST_FORMAT=3Dy
> =

> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dy
> CONFIG_IIO_SYSFS_TRIGGER=3Dy
> # end of Triggers - standalone
> =

> #
> # Linear and angular position sensors
> #
> # CONFIG_IQS624_POS is not set
> CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=3Dy
> # end of Linear and angular position sensors
> =

> #
> # Digital potentiometers
> #
> # CONFIG_AD5110 is not set
> # CONFIG_AD5272 is not set
> CONFIG_DS1803=3Dy
> CONFIG_MAX5432=3Dy
> CONFIG_MCP4018=3Dy
> CONFIG_MCP4531=3Dy
> # CONFIG_TPL0102 is not set
> # end of Digital potentiometers
> =

> #
> # Digital potentiostats
> #
> # CONFIG_LMP91000 is not set
> # end of Digital potentiostats
> =

> #
> # Pressure sensors
> #
> # CONFIG_ABP060MG is not set
> CONFIG_BMP280=3Dy
> CONFIG_BMP280_I2C=3Dy
> # CONFIG_DLHL60D is not set
> # CONFIG_DPS310 is not set
> CONFIG_HID_SENSOR_PRESS=3Dy
> # CONFIG_HP03 is not set
> CONFIG_ICP10100=3Dy
> # CONFIG_MPL115_I2C is not set
> CONFIG_MPL3115=3Dy
> CONFIG_MS5611=3Dy
> # CONFIG_MS5611_I2C is not set
> CONFIG_MS5637=3Dy
> # CONFIG_IIO_ST_PRESS is not set
> # CONFIG_T5403 is not set
> # CONFIG_HP206C is not set
> CONFIG_ZPA2326=3Dy
> CONFIG_ZPA2326_I2C=3Dy
> # end of Pressure sensors
> =

> #
> # Lightning sensors
> #
> # end of Lightning sensors
> =

> #
> # Proximity and distance sensors
> #
> CONFIG_ISL29501=3Dy
> CONFIG_LIDAR_LITE_V2=3Dy
> CONFIG_MB1232=3Dy
> # CONFIG_PING is not set
> CONFIG_RFD77402=3Dy
> CONFIG_SRF04=3Dy
> CONFIG_SX9310=3Dy
> CONFIG_SX9500=3Dy
> # CONFIG_SRF08 is not set
> CONFIG_VCNL3020=3Dy
> CONFIG_VL53L0X_I2C=3Dy
> # end of Proximity and distance sensors
> =

> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> =

> #
> # Temperature sensors
> #
> # CONFIG_IQS620AT_TEMP is not set
> # CONFIG_HID_SENSOR_TEMP is not set
> # CONFIG_MLX90614 is not set
> # CONFIG_MLX90632 is not set
> # CONFIG_TMP006 is not set
> CONFIG_TMP007=3Dy
> CONFIG_TMP117=3Dy
> CONFIG_TSYS01=3Dy
> CONFIG_TSYS02D=3Dy
> # end of Temperature sensors
> =

> CONFIG_NTB=3Dy
> CONFIG_NTB_MSI=3Dy
> CONFIG_NTB_AMD=3Dy
> # CONFIG_NTB_IDT is not set
> CONFIG_NTB_INTEL=3Dy
> # CONFIG_NTB_EPF is not set
> CONFIG_NTB_SWITCHTEC=3Dy
> # CONFIG_NTB_PINGPONG is not set
> CONFIG_NTB_TOOL=3Dy
> CONFIG_NTB_PERF=3Dy
> CONFIG_NTB_MSI_TEST=3Dy
> CONFIG_NTB_TRANSPORT=3Dy
> CONFIG_VME_BUS=3Dy
> =

> #
> # VME Bridge Drivers
> #
> CONFIG_VME_CA91CX42=3Dy
> # CONFIG_VME_TSI148 is not set
> CONFIG_VME_FAKE=3Dy
> =

> #
> # VME Board Drivers
> #
> CONFIG_VMIVME_7805=3Dy
> =

> #
> # VME Device Drivers
> #
> # CONFIG_VME_USER is not set
> # CONFIG_PWM is not set
> =

> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=3Dy
> # CONFIG_AL_FIC is not set
> # end of IRQ chip support
> =

> CONFIG_IPACK_BUS=3Dy
> CONFIG_BOARD_TPCI200=3Dy
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_RESET_INTEL_GW=3Dy
> # CONFIG_RESET_TI_SYSCON is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
> # CONFIG_USB_LGM_PHY is not set
> CONFIG_PHY_CAN_TRANSCEIVER=3Dy
> =

> #
> # PHY drivers for Broadcom platforms
> #
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> # end of PHY drivers for Broadcom platforms
> =

> CONFIG_PHY_CADENCE_TORRENT=3Dy
> # CONFIG_PHY_CADENCE_DPHY is not set
> CONFIG_PHY_CADENCE_SIERRA=3Dy
> # CONFIG_PHY_CADENCE_SALVO is not set
> CONFIG_PHY_FSL_IMX8MQ_USB=3Dy
> CONFIG_PHY_MIXEL_MIPI_DPHY=3Dy
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> # CONFIG_PHY_CPCAP_USB is not set
> # CONFIG_PHY_MAPPHONE_MDM6600 is not set
> # CONFIG_PHY_INTEL_LGM_COMBO is not set
> # CONFIG_PHY_INTEL_LGM_EMMC is not set
> # end of PHY Subsystem
> =

> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> CONFIG_USB4=3Dy
> # CONFIG_USB4_DEBUGFS_WRITE is not set
> CONFIG_USB4_KUNIT_TEST=3Dy
> CONFIG_USB4_DMA_TEST=3Dy
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # end of Android
> =

> CONFIG_DAX=3Dy
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> CONFIG_NVMEM_SPMI_SDAM=3Dy
> CONFIG_NVMEM_RMEM=3Dy
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dy
> CONFIG_STM_PROTO_BASIC=3Dy
> # CONFIG_STM_PROTO_SYS_T is not set
> # CONFIG_STM_DUMMY is not set
> CONFIG_STM_SOURCE_CONSOLE=3Dy
> CONFIG_STM_SOURCE_HEARTBEAT=3Dy
> # CONFIG_STM_SOURCE_FTRACE is not set
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> CONFIG_INTEL_TH_ACPI=3Dy
> CONFIG_INTEL_TH_GTH=3Dy
> CONFIG_INTEL_TH_STH=3Dy
> # CONFIG_INTEL_TH_MSU is not set
> CONFIG_INTEL_TH_PTI=3Dy
> # CONFIG_INTEL_TH_DEBUG is not set
> # end of HW tracing support
> =

> # CONFIG_FPGA is not set
> # CONFIG_FSI is not set
> # CONFIG_TEE is not set
> CONFIG_MULTIPLEXER=3Dy
> =

> #
> # Multiplexer drivers
> #
> CONFIG_MUX_ADG792A=3Dy
> CONFIG_MUX_GPIO=3Dy
> CONFIG_MUX_MMIO=3Dy
> # end of Multiplexer drivers
> =

> CONFIG_PM_OPP=3Dy
> CONFIG_UNISYS_VISORBUS=3Dy
> CONFIG_SIOX=3Dy
> CONFIG_SIOX_BUS_GPIO=3Dy
> CONFIG_SLIMBUS=3Dy
> # CONFIG_SLIM_QCOM_CTRL is not set
> # CONFIG_INTERCONNECT is not set
> CONFIG_COUNTER=3Dy
> # CONFIG_104_QUAD_8 is not set
> CONFIG_INTERRUPT_CNT=3Dy
> CONFIG_FTM_QUADDEC=3Dy
> CONFIG_MICROCHIP_TCB_CAPTURE=3Dy
> CONFIG_INTEL_QEP=3Dy
> # CONFIG_MOST is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FS_VERITY=3Dy
> # CONFIG_FS_VERITY_DEBUG is not set
> # CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> # CONFIG_QUOTA is not set
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dy
> # CONFIG_CUSE is not set
> CONFIG_VIRTIO_FS=3Dy
> # CONFIG_OVERLAY_FS is not set
> =

> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=3Dy
> # CONFIG_NETFS_STATS is not set
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_DEBUG is not set
> # end of Caches
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> # CONFIG_TMPFS_INODE64 is not set
> # CONFIG_HUGETLBFS is not set
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_EFIVAR_FS=3Dy
> # end of Pseudo filesystems
> =

> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NFS_V2=3Dy
> CONFIG_NFS_V3=3Dy
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_V4_1 is not set
> # CONFIG_ROOT_NFS is not set
> # CONFIG_NFS_FSCACHE is not set
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dm
> # CONFIG_SUNRPC_DEBUG is not set
> CONFIG_CEPH_FS=3Dy
> CONFIG_CEPH_FSCACHE=3Dy
> # CONFIG_CEPH_FS_POSIX_ACL is not set
> # CONFIG_CEPH_FS_SECURITY_LABEL is not set
> CONFIG_CIFS=3Dm
> CONFIG_CIFS_STATS2=3Dy
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> # CONFIG_CIFS_UPCALL is not set
> # CONFIG_CIFS_XATTR is not set
> CONFIG_CIFS_DEBUG=3Dy
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> # CONFIG_CIFS_DFS_UPCALL is not set
> # CONFIG_CIFS_SWN_UPCALL is not set
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_SMB_SERVER is not set
> CONFIG_SMBFS_COMMON=3Dm
> # CONFIG_CODA_FS is not set
> CONFIG_AFS_FS=3Dy
> # CONFIG_AFS_DEBUG is not set
> # CONFIG_AFS_FSCACHE is not set
> # CONFIG_AFS_DEBUG_CURSOR is not set
> CONFIG_9P_FS=3Dy
> # CONFIG_9P_FSCACHE is not set
> CONFIG_9P_FS_POSIX_ACL=3Dy
> # CONFIG_9P_FS_SECURITY is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> CONFIG_NLS_CODEPAGE_855=3Dy
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> # CONFIG_NLS_CODEPAGE_861 is not set
> CONFIG_NLS_CODEPAGE_862=3Dy
> CONFIG_NLS_CODEPAGE_863=3Dy
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> # CONFIG_NLS_CODEPAGE_949 is not set
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> CONFIG_NLS_CODEPAGE_1251=3Dy
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dy
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> # CONFIG_NLS_ISO8859_13 is not set
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> # CONFIG_NLS_MAC_CENTEURO is not set
> CONFIG_NLS_MAC_CROATIAN=3Dy
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dy
> CONFIG_NLS_MAC_GREEK=3Dy
> CONFIG_NLS_MAC_ICELAND=3Dy
> CONFIG_NLS_MAC_INUIT=3Dy
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
> # CONFIG_NLS_UTF8 is not set
> CONFIG_DLM=3Dy
> # CONFIG_DLM_DEBUG is not set
> # CONFIG_UNICODE is not set
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_KEYS_REQUEST_CACHE=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> # CONFIG_BIG_KEYS is not set
> # CONFIG_ENCRYPTED_KEYS is not set
> # CONFIG_KEY_DH_OPERATIONS is not set
> CONFIG_KEY_NOTIFICATIONS=3Dy
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> # CONFIG_SECURITY_NETWORK is not set
> # CONFIG_PAGE_TABLE_ISOLATION is not set
> # CONFIG_SECURITY_INFINIBAND is not set
> # CONFIG_SECURITY_PATH is not set
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_YAMA is not set
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> # CONFIG_SECURITY_LANDLOCK is not set
> CONFIG_INTEGRITY=3Dy
> # CONFIG_INTEGRITY_SIGNATURE is not set
> CONFIG_INTEGRITY_AUDIT=3Dy
> # CONFIG_IMA is not set
> # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> # CONFIG_EVM is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_TEST=3Dy
> CONFIG_CRYPTO_SIMD=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECC=3Dy
> CONFIG_CRYPTO_ECDH=3Dy
> CONFIG_CRYPTO_ECDSA=3Dy
> CONFIG_CRYPTO_ECRDSA=3Dy
> # CONFIG_CRYPTO_SM2 is not set
> # CONFIG_CRYPTO_CURVE25519 is not set
> CONFIG_CRYPTO_CURVE25519_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_AEGIS128=3Dy
> CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> # CONFIG_CRYPTO_CFB is not set
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> CONFIG_CRYPTO_OFB=3Dy
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> # CONFIG_CRYPTO_KEYWRAP is not set
> CONFIG_CRYPTO_NHPOLY1305=3Dy
> CONFIG_CRYPTO_NHPOLY1305_SSE2=3Dy
> CONFIG_CRYPTO_NHPOLY1305_AVX2=3Dy
> CONFIG_CRYPTO_ADIANTUM=3Dy
> # CONFIG_CRYPTO_ESSIV is not set
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> # CONFIG_CRYPTO_VMAC is not set
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> CONFIG_CRYPTO_CRC32=3Dy
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> # CONFIG_CRYPTO_XXHASH is not set
> CONFIG_CRYPTO_BLAKE2B=3Dy
> CONFIG_CRYPTO_BLAKE2S=3Dy
> CONFIG_CRYPTO_BLAKE2S_X86=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> # CONFIG_CRYPTO_RMD160 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> CONFIG_CRYPTO_SM3=3Dy
> CONFIG_CRYPTO_STREEBOG=3Dy
> CONFIG_CRYPTO_WP512=3Dy
> # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> # CONFIG_CRYPTO_AES_TI is not set
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_DES is not set
> # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> CONFIG_CRYPTO_SM4=3Dy
> CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=3Dy
> CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=3Dy
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> # CONFIG_CRYPTO_LZO is not set
> # CONFIG_CRYPTO_842 is not set
> CONFIG_CRYPTO_LZ4=3Dy
> # CONFIG_CRYPTO_LZ4HC is not set
> CONFIG_CRYPTO_ZSTD=3Dy
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> # CONFIG_CRYPTO_DRBG_HASH is not set
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> # CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=3Dy
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
> # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CHACHA=3Dy
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_CURVE25519=3Dy
> CONFIG_CRYPTO_LIB_DES=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dy
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dy
> CONFIG_CRYPTO_LIB_POLY1305=3Dy
> CONFIG_CRYPTO_LIB_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_LIB_SM4=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dy
> CONFIG_CRYPTO_DEV_ATMEL_I2C=3Dy
> CONFIG_CRYPTO_DEV_ATMEL_ECC=3Dy
> CONFIG_CRYPTO_DEV_ATMEL_SHA204A=3Dy
> CONFIG_CRYPTO_DEV_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_DD=3Dy
> # CONFIG_CRYPTO_DEV_SP_PSP is not set
> CONFIG_CRYPTO_DEV_QAT=3Dy
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dy
> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dy
> CONFIG_CRYPTO_DEV_QAT_C62X=3Dy
> CONFIG_CRYPTO_DEV_QAT_4XXX=3Dy
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dy
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dy
> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dy
> CONFIG_CRYPTO_DEV_NITROX=3Dy
> CONFIG_CRYPTO_DEV_NITROX_CNN55XX=3Dy
> # CONFIG_CRYPTO_DEV_VIRTIO is not set
> CONFIG_CRYPTO_DEV_SAFEXCEL=3Dy
> CONFIG_CRYPTO_DEV_CCREE=3Dy
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> =

> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_LINEAR_RANGES=3Dy
> CONFIG_PACKING=3Dy
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_CORDIC=3Dy
> # CONFIG_PRIME_NUMBERS is not set
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=3Dy
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC64=3Dy
> # CONFIG_CRC4 is not set
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> # CONFIG_XZ_DEC_IA64 is not set
> # CONFIG_XZ_DEC_ARM is not set
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> # CONFIG_XZ_DEC_SPARC is not set
> # CONFIG_XZ_DEC_MICROLZMA is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_DECOMPRESS_ZSTD=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_BCH=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DMA_OPS=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_DMA_CMA=3Dy
> # CONFIG_DMA_PERNUMA_CMA is not set
> =

> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=3D0
> CONFIG_CMA_SIZE_PERCENTAGE=3D0
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> CONFIG_CMA_SIZE_SEL_MIN=3Dy
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=3D8
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_DMA_MAP_BENCHMARK=3Dy
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_DIMLIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_UCS2_STRING=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_FONT_AUTOSELECT=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_ARCH_HAS_COPY_MC=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> # end of Library routines
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_PRINTK_CALLER=3Dy
> # CONFIG_STACKTRACE_BUILD_ID is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> CONFIG_DYNAMIC_DEBUG=3Dy
> CONFIG_DYNAMIC_DEBUG_CORE=3Dy
> CONFIG_SYMBOLIC_ERRNAME=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> CONFIG_DEBUG_INFO_COMPRESSED=3Dy
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> CONFIG_DEBUG_INFO_DWARF5=3Dy
> CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> CONFIG_GDB_SCRIPTS=3Dy
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> CONFIG_HEADERS_INSTALL=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> # CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
> CONFIG_FRAME_POINTER=3Dy
> CONFIG_STACK_VALIDATION=3Dy
> CONFIG_VMLINUX_VALIDATION=3Dy
> CONFIG_VMLINUX_MAP=3Dy
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> CONFIG_DEBUG_FS=3Dy
> # CONFIG_DEBUG_FS_ALLOW_ALL is not set
> CONFIG_DEBUG_FS_DISALLOW_MOUNT=3Dy
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_TRAP is not set
> CONFIG_CC_HAS_UBSAN_BOUNDS=3Dy
> CONFIG_UBSAN_BOUNDS=3Dy
> CONFIG_UBSAN_ONLY_BOUNDS=3Dy
> CONFIG_UBSAN_SHIFT=3Dy
> # CONFIG_UBSAN_DIV_ZERO is not set
> # CONFIG_UBSAN_BOOL is not set
> # CONFIG_UBSAN_ENUM is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> CONFIG_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_TEST_UBSAN is not set
> CONFIG_HAVE_ARCH_KCSAN=3Dy
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_OWNER is not set
> # CONFIG_PAGE_POISONING is not set
> CONFIG_DEBUG_PAGE_REF=3Dy
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> CONFIG_DEBUG_WX=3Dy
> CONFIG_GENERIC_PTDUMP=3Dy
> CONFIG_PTDUMP_CORE=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> CONFIG_DEBUG_VM=3Dy
> # CONFIG_DEBUG_VM_VMACACHE is not set
> # CONFIG_DEBUG_VM_RB is not set
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_MEMORY_INIT is not set
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> CONFIG_HAVE_ARCH_KFENCE=3Dy
> # end of Memory Debugging
> =

> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHEDSTATS is not set
> # end of Scheduler Debugging
> =

> CONFIG_DEBUG_TIMEKEEPING=3Dy
> # CONFIG_DEBUG_PREEMPT is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> CONFIG_LOCK_STAT=3Dy
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_RWSEMS=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> CONFIG_LOCKDEP_BITS=3D15
> CONFIG_LOCKDEP_CHAINS_BITS=3D16
> CONFIG_LOCKDEP_STACK_TRACE_BITS=3D19
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=3D14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=3D12
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_TRACE_IRQFLAGS_NMI=3Dy
> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_DEBUG_PLIST=3Dy
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> # end of Debug kernel data structures
> =

> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_LIST is not set
> CONFIG_TORTURE_TEST=3Dy
> # CONFIG_RCU_SCALE_TEST is not set
> CONFIG_RCU_TORTURE_TEST=3Dy
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> CONFIG_RCU_EQS_DEBUG=3Dy
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_PREEMPTIRQ_TRACEPOINTS=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_BOOTTIME_TRACING is not set
> # CONFIG_FUNCTION_TRACER is not set
> # CONFIG_STACK_TRACER is not set
> CONFIG_TRACE_PREEMPT_TOGGLE=3Dy
> CONFIG_IRQSOFF_TRACER=3Dy
> CONFIG_PREEMPT_TRACER=3Dy
> # CONFIG_SCHED_TRACER is not set
> # CONFIG_HWLAT_TRACER is not set
> # CONFIG_OSNOISE_TRACER is not set
> # CONFIG_TIMERLAT_TRACER is not set
> # CONFIG_MMIOTRACE is not set
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_UPROBE_EVENTS=3Dy
> CONFIG_BPF_EVENTS=3Dy
> CONFIG_DYNAMIC_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> CONFIG_TRACING_MAP=3Dy
> CONFIG_SYNTH_EVENTS=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> # CONFIG_TRACE_EVENT_INJECT is not set
> CONFIG_TRACEPOINT_BENCHMARK=3Dy
> CONFIG_RING_BUFFER_BENCHMARK=3Dy
> CONFIG_TRACE_EVAL_MAP_FILE=3Dy
> CONFIG_GCOV_PROFILE_FTRACE=3Dy
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> # CONFIG_HIST_TRIGGERS_DEBUG is not set
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> CONFIG_SAMPLES=3Dy
> # CONFIG_SAMPLE_AUXDISPLAY is not set
> # CONFIG_SAMPLE_TRACE_EVENTS is not set
> # CONFIG_SAMPLE_TRACE_PRINTK is not set
> # CONFIG_SAMPLE_TRACE_ARRAY is not set
> # CONFIG_SAMPLE_KOBJECT is not set
> # CONFIG_SAMPLE_HW_BREAKPOINT is not set
> # CONFIG_SAMPLE_KFIFO is not set
> # CONFIG_SAMPLE_RPMSG_CLIENT is not set
> # CONFIG_SAMPLE_CONFIGFS is not set
> # CONFIG_SAMPLE_CONNECTOR is not set
> CONFIG_SAMPLE_HIDRAW=3Dy
> CONFIG_SAMPLE_LANDLOCK=3Dy
> # CONFIG_SAMPLE_PIDFD is not set
> # CONFIG_SAMPLE_SECCOMP is not set
> CONFIG_SAMPLE_TIMER=3Dy
> # CONFIG_SAMPLE_UHID is not set
> # CONFIG_SAMPLE_VFIO_MDEV_MTTY is not set
> # CONFIG_SAMPLE_VFIO_MDEV_MDPY is not set
> # CONFIG_SAMPLE_VFIO_MDEV_MBOCHS is not set
> CONFIG_SAMPLE_ANDROID_BINDERFS=3Dy
> # CONFIG_SAMPLE_VFS is not set
> # CONFIG_SAMPLE_INTEL_MEI is not set
> # CONFIG_SAMPLE_WATCHDOG is not set
> CONFIG_SAMPLE_WATCH_QUEUE=3Dy
> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=3Dy
> CONFIG_HAVE_SAMPLE_FTRACE_MULTI_DIRECT=3Dy
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> CONFIG_EFI_PGT_DUMP=3Dy
> CONFIG_DEBUG_TLBFLUSH=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> CONFIG_DEBUG_ENTRY=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> # CONFIG_UNWINDER_ORC is not set
> CONFIG_UNWINDER_FRAME_POINTER=3Dy
> # CONFIG_UNWINDER_GUESS is not set
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> CONFIG_KUNIT=3Dy
> CONFIG_KUNIT_DEBUGFS=3Dy
> CONFIG_KUNIT_TEST=3Dy
> CONFIG_KUNIT_EXAMPLE_TEST=3Dy
> # CONFIG_KUNIT_ALL_TESTS is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=3Dy
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> CONFIG_KCOV=3Dy
> CONFIG_KCOV_ENABLE_COMPARISONS=3Dy
> CONFIG_KCOV_INSTRUMENT_ALL=3Dy
> CONFIG_KCOV_IRQ_AREA_SIZE=3D0x40000
> # CONFIG_RUNTIME_TESTING_MENU is not set
> CONFIG_ARCH_USE_MEMTEST=3Dy
> CONFIG_MEMTEST=3Dy
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'boot'
> 	export testcase=3D'boot'
> 	export category=3D'functional'
> 	export timeout=3D'10m'
> 	export job_origin=3D'boot-300s.yaml'
> 	export queue_cmdline_keys=3D'branch
> commit
> queue_at_least_once'
> 	export queue=3D'validate'
> 	export testbox=3D'vm-snb-159'
> 	export tbox_group=3D'vm-snb'
> 	export branch=3D'paulmck-rcu/dev.2021.11.30a'
> 	export commit=3D'fbf28ca980766d3182971851340d9e89acd3c8c9'
> 	export kconfig=3D'x86_64-randconfig-r012-20211128'
> 	export repeat_to=3D68
> 	export nr_vm=3D160
> 	export submit_id=3D'61aa53c5c30fce091f19ea6d'
> 	export job_file=3D'/lkp/jobs/scheduled/vm-snb-159/boot-300-yocto-x86_64-=
minimal-20190520.cgz-fbf28ca980766d3182971851340d9e89acd3c8c9-20211204-1334=
07-1bftfbi-52.yaml'
> 	export id=3D'00f5e3f24d028e6ba6f036e9bf21c6a5f00501ca'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
> 	export nr_cpu=3D2
> 	export memory=3D'16G'
> 	export need_kconfig=3D\{\"KVM_GUEST\"\=3D\>\"y\"\}
> 	export ssh_base_port=3D23032
> 	export kernel_cmdline=3D'vmalloc=3D128M initramfs_async=3D0 page_owner=
=3Don'
> 	export rootfs=3D'yocto-x86_64-minimal-20190520.cgz'
> 	export compiler=3D'gcc-9'
> 	export enqueue_time=3D'2021-12-04 01:28:38 +0800'
> 	export _id=3D'61aa53d7c30fce091f19ea90'
> 	export _rt=3D'/result/boot/300/vm-snb/yocto-x86_64-minimal-20190520.cgz/=
x86_64-randconfig-r012-20211128/gcc-9/fbf28ca980766d3182971851340d9e89acd3c=
8c9'
> 	export user=3D'lkp'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export result_root=3D'/result/boot/300/vm-snb/yocto-x86_64-minimal-20190=
520.cgz/x86_64-randconfig-r012-20211128/gcc-9/fbf28ca980766d3182971851340d9=
e89acd3c8c9/65'
> 	export scheduler_version=3D'/lkp/lkp/.src-20211203-114512'
> 	export arch=3D'x86_64'
> 	export max_uptime=3D600
> 	export initrd=3D'/osimage/yocto/yocto-x86_64-minimal-20190520.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/vm-snb-159/boot-300-yocto-x86_64-minimal-201905=
20.cgz-fbf28ca980766d3182971851340d9e89acd3c8c9-20211204-133407-1bftfbi-52.=
yaml
> ARCH=3Dx86_64
> kconfig=3Dx86_64-randconfig-r012-20211128
> branch=3Dpaulmck-rcu/dev.2021.11.30a
> commit=3Dfbf28ca980766d3182971851340d9e89acd3c8c9
> BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-r012-20211128/gcc-9/fbf28ca9807=
66d3182971851340d9e89acd3c8c9/vmlinuz-5.16.0-rc1-00108-gfbf28ca98076
> vmalloc=3D128M initramfs_async=3D0 page_owner=3Don
> max_uptime=3D600
> RESULT_ROOT=3D/result/boot/300/vm-snb/yocto-x86_64-minimal-20190520.cgz/x=
86_64-randconfig-r012-20211128/gcc-9/fbf28ca980766d3182971851340d9e89acd3c8=
c9/65
> LKP_SERVER=3Dinternal-lkp-server
> selinux=3D0
> debug
> apic=3Ddebug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100
> net.ifnames=3D0
> printk.devkmsg=3Don
> panic=3D-1
> softlockup_panic=3D1
> nmi_watchdog=3Dpanic
> oops=3Dpanic
> load_ramdisk=3D2
> prompt_ramdisk=3D0
> drbd.minor_count=3D8
> systemd.log_level=3Derr
> ignore_loglevel
> console=3Dtty0
> earlyprintk=3DttyS0,115200
> console=3DttyS0,115200
> vga=3Dnormal
> rw'
> 	export modules_initrd=3D'/pkg/linux/x86_64-randconfig-r012-20211128/gcc-=
9/fbf28ca980766d3182971851340d9e89acd3c8c9/modules.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-x86_64.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export schedule_notify_address=3D
> 	export queue_at_least_once=3D1
> 	export kernel=3D'/pkg/linux/x86_64-randconfig-r012-20211128/gcc-9/fbf28c=
a980766d3182971851340d9e89acd3c8c9/vmlinuz-5.16.0-rc1-00108-gfbf28ca98076'
> 	export dequeue_time=3D'2021-12-04 01:38:50 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/vm-snb-159/boot-300-yocto-x86_6=
4-minimal-20190520.cgz-fbf28ca980766d3182971851340d9e89acd3c8c9-20211204-13=
3407-1bftfbi-52.cgz'
> =

> 	[ -n "$LKP_SRC" ] ||
> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> }
> =

> run_job()
> {
> 	echo $$ > $TMP/run-job.pid
> =

> 	. $LKP_SRC/lib/http.sh
> 	. $LKP_SRC/lib/job.sh
> 	. $LKP_SRC/lib/env.sh
> =

> 	export_top_env
> =

> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
> 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> =

> 	run_test $LKP_SRC/tests/wrapper sleep 300
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	$LKP_SRC/stats/wrapper boot-slabinfo
> 	$LKP_SRC/stats/wrapper boot-meminfo
> 	$LKP_SRC/stats/wrapper memmap
> 	$LKP_SRC/stats/wrapper boot-memory
> 	$LKP_SRC/stats/wrapper boot-time
> 	$LKP_SRC/stats/wrapper kernel-size
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper sleep
> 	$LKP_SRC/stats/wrapper meminfo
> =

> 	$LKP_SRC/stats/wrapper time sleep.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"


--===============1375886136548262355==--

