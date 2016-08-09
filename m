Content-Type: multipart/mixed; boundary="===============5082888766476040800=="
MIME-Version: 1.0
From: Thomas Garnier <thgarnie@google.com>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] 20067c4c13: kernel BUG at arch/x86/mm/physaddr.c:26!
Date: Tue, 09 Aug 2016 09:22:57 -0700
Message-ID: <CAJcbSZFHj9tcJXCy3KLpeaET2An0bAkpZaQutnNchDd0M8ChMw@mail.gmail.com>
In-Reply-To: <57a9cf57.vVzX3QLnPJfUuZbV%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5082888766476040800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2016 at 5:40 AM, kernel test robot
<fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux Thomas-Garnier/x86-KASLR-Fix-physical-me=
mory-calculation-on-KASLR-memory-randomization/20160809-024226
>
> commit 20067c4c139c7213205acd1c4b6f3e6d68327267
> Author:     Thomas Garnier <thgarnie@google.com>
> AuthorDate: Mon Aug 8 11:40:06 2016 -0700
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Tue Aug 9 02:42:31 2016 +0800
>
>     x86/KASLR: Fix physical memory calculation on KASLR memory randomizat=
ion
>
>     Initialize KASLR memory randomization after max_pfn is initialized. A=
lso
>     ensure the size is rounded up. Could have create problems on machines
>     with more than 1Tb of memory on certain random addresses.
>
>     Signed-off-by: Thomas Garnier <thgarnie@google.com>
>
> +------------------------------------------------------------------+-----=
-------+------------+-----------------+
> |                                                                  | a064=
fd509d | 20067c4c13 | v4.8-rc1_080903 |
> +------------------------------------------------------------------+-----=
-------+------------+-----------------+
> | boot_successes                                                   | 90  =
       | 0          | 0               |
> | boot_failures                                                    | 8   =
       | 32         | 13              |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 8 =
         |            |                 |
> | Mem-Info                                                         | 8   =
       |            |                 |
> | Out_of_memory:Kill_process                                       | 8   =
       |            |                 |
> | IP-Config:Auto-configuration_of_network_failed                   | 3   =
       |            |                 |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 3   =
       |            |                 |
> | kernel_BUG_at_arch/x86/mm/physaddr.c                             | 0   =
       | 32         | 13              |
> | invalid_opcode:#[##]SMP_DEBUG_PAGEALLOC                          | 0   =
       | 32         | 13              |
> | RIP:__phys_addr                                                  | 0   =
       | 32         | 13              |
> | Kernel_panic-not_syncing:Fatal_exception                         | 0   =
       | 32         | 13              |
> | backtrace:hpet_enable                                            | 0   =
       | 32         | 13              |
> | backtrace:hpet_time_init                                         | 0   =
       | 32         | 13              |
> | backtrace:x86_late_time_init                                     | 0   =
       | 32         | 13              |
> +------------------------------------------------------------------+-----=
-------+------------+-----------------+
>
> [    0.000000] ---------------------------------
> [    0.000000] allocated 786432 bytes of page_ext
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] kernel BUG at arch/x86/mm/physaddr.c:26!
> [    0.000000] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.8.0-rc1-00007-=
g20067c4 #1
> [    0.000000] task: ffffffffa3815540 task.stack: ffffffffa3800000
> [    0.000000] RIP: 0010:[<ffffffffa2e36d74>]  [<ffffffffa2e36d74>] __phy=
s_addr+0x49/0x4d
> [    0.000000] RSP: 0000:ffffffffa3803e50  EFLAGS: 00010287
> [    0.000000] RAX: fffffcef170dffff RBX: 00000000fed00000 RCX: ffffffff0=
24000c0
> [    0.000000] RDX: 0000000000000002 RSI: 0000000000001000 RDI: ffff88009=
70dffff
> [    0.000000] RBP: ffffffffa3803e50 R08: 0000000000000000 R09: 000000000=
0000000
> [    0.000000] R10: 0000000000000000 R11: ffffffffa3816050 R12: 000000000=
0000002
> [    0.000000] R13: 0000000000001000 R14: ffffba7180000000 R15: 000000000=
0000002
> [    0.000000] FS:  0000000000000000(0000) GS:ffff8b1115400000(0000) knlG=
S:0000000000000000
> [    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.000000] CR2: 00000000ffffffff CR3: 0000000007a10000 CR4: 000000000=
00006b0
> [    0.000000] Stack:
> [    0.000000]  ffffffffa3803e80 ffffffffa2e35f8b ffff8b11150098c0 000000=
00fed00000
> [    0.000000]  0000000000001000 ffffba7180000000 ffffffffa3803ef0 ffffff=
ffa2e32b0a
> [    0.000000]  8000000000000173 0000000000000400 ffffffffa3c2fdb2 000000=
00fed00000
> [    0.000000] Call Trace:
> [    0.000000]  [<ffffffffa2e35f8b>] kernel_map_sync_memtype+0x24/0xd0
> [    0.000000]  [<ffffffffa2e32b0a>] __ioremap_caller+0x222/0x2b5
> [    0.000000]  [<ffffffffa3c2fdb2>] ? hpet_enable+0x2b/0x280
> [    0.000000]  [<ffffffffa2e32baf>] ioremap_nocache+0x12/0x14
> [    0.000000]  [<ffffffffa3c2fdb2>] hpet_enable+0x2b/0x280
> [    0.000000]  [<ffffffffa3c256bb>] hpet_time_init+0x9/0x19
> [    0.000000]  [<ffffffffa3c2568b>] x86_late_time_init+0xa/0x11
> [    0.000000]  [<ffffffffa3c20e38>] start_kernel+0x37a/0x3f0
> [    0.000000]  [<ffffffffa3c20120>] ? early_idt_handler_array+0x120/0x120
> [    0.000000]  [<ffffffffa3c2029e>] x86_64_start_reservations+0x29/0x2b
> [    0.000000]  [<ffffffffa3c203a7>] x86_64_start_kernel+0x107/0x114
> [    0.000000] Code: 48 39 c7 73 14 eb 24 48 03 05 b9 e2 9d 00 48 81 ff f=
f ff ff 3f 76 16 0f 0b 0f b6 0d 80 bb da 00 48 89 c2 48 d3 ea 48 85 d2 74 0=
2 <0f> 0b 5d c3 b8 00 00 00 80 55 48 01 f8 48 3d ff ff ff 3f 48 89
> [    0.000000] RIP  [<ffffffffa2e36d74>] __phys_addr+0x49/0x4d
> [    0.000000]  RSP <ffffffffa3803e50>
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Fatal exception
>
> git bisect start 092e38839e23a6b98a662de93a2a8cc64e6a0238 29b4817d4018df7=
8086157ea3a55c1d9424a7cfc --
> git bisect  bad d70538f7f8fb8480bf8a5d730d34154250c670b6  # 06:07      0-=
     26  Merge 'linux-review/Johannes-Thumshirn/mpt3sas-Don-t-spam-logs-if-=
logging-level-is-0/20160803-212128' into devel-hourly-2016080903
> git bisect  bad a8d20db4b316c4e3d759d3191f3f8b35948fdec5  # 06:18      0-=
     22  Merge 'linux-review/Ivan-Khoronzhuk/net-ethernet-ti-cpsw-simplify-=
submit-routine/20160807-064222' into devel-hourly-2016080903
> git bisect  bad 593c4a4d4afa28f2ea764cfc83e2ecdaab0c420a  # 06:23      0-=
     22  Merge 'linux-review/Steve-Twiss/MAINTAINERS-Add-Dialog-ONKEY-searc=
h-term-for-missing-documentation/20160809-001958' into devel-hourly-2016080=
903
> git bisect  bad 207fd79488b10c75eebf70ab6ffe96059e3ea3d7  # 06:30      0-=
     26  Merge 'wsa/strings/i2c' into devel-hourly-2016080903
> git bisect good 0175782239e1e0a18b49526608f73190765fdfc2  # 06:43     22+=
      0  Merge 'mvebu/mvebu/dt64' into devel-hourly-2016080903
> git bisect  bad c6f199c314c265339113bc37d1ca79c1c042c632  # 07:11      0-=
     26  Merge 'linux-review/Robert-Jarzmik/dmaengine-pxa_dma-fix-hotchain-=
corner-case/20160808-031033' into devel-hourly-2016080903
> git bisect good 12ab73167282c8d4bb78c5f5f45be6118103af27  # 17:18     22+=
      8  Merge 'linux-review/Hans-de-Goede/mmc-pwrseq-simple-Add-an-optiona=
l-post-power-on-delay/20160808-032117' into devel-hourly-2016080903
> git bisect good b4a3204b33fe075ed4af3368f3026be9d4049fd0  # 17:30     21+=
      0  Merge 'jolsa-perf/perf/c2c_110' into devel-hourly-2016080903
> git bisect  bad 3059d4d89f6c0ab038db3de0f58455e615acc512  # 17:48      0-=
     22  Merge 'linux-review/Thomas-Garnier/x86-KASLR-Fix-physical-memory-c=
alculation-on-KASLR-memory-randomization/20160809-024226' into devel-hourly=
-2016080903
> git bisect good 44fc49aa1ffa5ca0896492cf8a8017b05373027a  # 18:08     22+=
      2  Merge branch 'timers/urgent'
> git bisect good a064fd509d4b418f329a71325c702f851bab1c0e  # 18:22     22+=
      1  Merge branch 'x86/asm'
> git bisect  bad b102f1641e39626a03a7f99839ad85522db1095d  # 18:22      0-=
      8  x86/KASLR: Increase BRK pages for KASLR memory randomization
> git bisect  bad 20067c4c139c7213205acd1c4b6f3e6d68327267  # 19:18      0-=
     32  x86/KASLR: Fix physical memory calculation on KASLR memory randomi=
zation
> # first bad commit: [20067c4c139c7213205acd1c4b6f3e6d68327267] x86/KASLR:=
 Fix physical memory calculation on KASLR memory randomization
> git bisect good a064fd509d4b418f329a71325c702f851bab1c0e  # 19:21     66+=
      8  Merge branch 'x86/asm'
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 20067c4c139c7213205acd1c4b6f3e6d68327267  # 20:03      0-=
     66  x86/KASLR: Fix physical memory calculation on KASLR memory randomi=
zation
> # extra tests on HEAD of linux-devel/devel-hourly-2016080903
> git bisect  bad 092e38839e23a6b98a662de93a2a8cc64e6a0238  # 20:03      0-=
     13  0day head guard for 'devel-hourly-2016080903'
> # extra tests on tree/branch linux-review/Thomas-Garnier/x86-KASLR-Fix-ph=
ysical-memory-calculation-on-KASLR-memory-randomization/20160809-024226
> git bisect  bad b102f1641e39626a03a7f99839ad85522db1095d  # 20:08      0-=
      8  x86/KASLR: Increase BRK pages for KASLR memory randomization
> # extra tests with first bad commit reverted
> git bisect good cb72362272877f4db3dd462fed5fb21b6a27ff32  # 20:13     66+=
      5  Revert "x86/KASLR: Fix physical memory calculation on KASLR memory=
 randomization"
> # extra tests on tree/branch linus/master
> git bisect good 81abf2525827b29839a78fd55ab0699f033c41a5  # 20:33     63+=
      0  Merge tag 'lkdtm-v4.8-rc1' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/kees/linux
> # extra tests on tree/branch linux-next/master
> git bisect good 09f0834105f7fe315ddaeb77fad15f00565c167e  # 20:40     66+=
      6  Add linux-next specific files for 20160809
>
>
> This script may reproduce the error.
>
> -------------------------------------------------------------------------=
---
> #!/bin/bash
>
> kernel=3D$1
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -cpu kvm64
>         -kernel $kernel
>         -m 369
>         -smp 2
>         -device e1000,netdev=3Dnet0
>         -netdev user,id=3Dnet0
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -watchdog-action debug
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         root=3D/dev/ram0
>         hung_task_panic=3D1
>         debug
>         apic=3Ddebug
>         sysrq_always_enabled
>         rcupdate.rcu_cpu_stall_timeout=3D100
>         panic=3D-1
>         softlockup_panic=3D1
>         nmi_watchdog=3Dpanic
>         oops=3Dpanic
>         load_ramdisk=3D2
>         prompt_ramdisk=3D0
>         systemd.log_level=3Derr
>         ignore_loglevel
>         earlyprintk=3DttyS0,115200
>         console=3DttyS0,115200
>         console=3Dtty0
>         vga=3Dnormal
>         rw
>         drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
>

Thanks a lot, that was super useful. I made a fix and tested it did. I
kept the script and config for future use.

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============5082888766476040800==--

