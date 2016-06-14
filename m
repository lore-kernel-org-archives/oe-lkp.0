Content-Type: multipart/mixed; boundary="===============7325210222949779628=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 6ce52d535e: BUG: uaccess fault at 0xffff880010d88000 with KERNEL_DS
Date: Tue, 14 Jun 2016 09:54:09 -0700
Message-ID: <CAGXu5jKzybbZ6jZF2ooiw0QOOC4nSy+oi9Zm4zvFj7Q_F0UrWA@mail.gmail.com>
In-Reply-To: <CALCETrWTw96Q+atKyL26Sz50H9b4YGR+Cqopy9aB2Bfvn5PwKA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7325210222949779628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 9:51 PM, Andy Lutomirski <luto@amacapital.net> wr=
ote:
>
> On Jun 13, 2016 8:36 PM, "kernel test robot" <fengguang.wu@intel.com> w=
rote:
>>
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git x86/uacce=
ss
>>
>> commit 6ce52d535e1adcfb44ffd9e5503081805d33aa87
>
> Kees, this should be fixed in my version of this branch.

Okay, cool. I've dropped my branch -- I just had it around for some testing.

-Kees

>
>> Author:     Andrew Lutomirski <luto@kernel.org>
>> AuthorDate: Tue May 24 15:48:44 2016 -0700
>> Commit:     Kees Cook <keescook@chromium.org>
>> CommitDate: Mon Jun 13 13:30:53 2016 -0700
>>
>>     x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
>> !pagefault_disabled()
>>
>>     If someone calls set_fs(KERNEL_DS), then they are responsible for
>>     making sure that whatever addresses are accessed are safe.  If they
>>     get it wrong on a kernel address, OOPS.  If they get it wrong on a
>> user
>>     address, warn.
>>
>>     This will make it harder to exploit bugs in which user code controls
>>     a pointer accessed with KERNEL_DS: an attacker will OOPS if they
>>     access an unmapped page, and they'll therefore need luck or a kASLR
>>     bypass in addition.
>>
>>     To keep probe_kernel_read(), probe_kernel_write(), and
>>     probe_kernel_address() working, skip this check if
>>     pagefault_disabled().
>>
>>     Signed-off-by: Andy Lutomirski <luto@kernel.org>
>>
>>
>> +------------------------------------------+------------+------------+--=
----------+
>> |                                          | 0390fec2cd | 6ce52d535e |
>> 900bf5ce72 |
>>
>> +------------------------------------------+------------+------------+--=
----------+
>> | boot_successes                           | 63         | 0          | 0
>> |
>> | boot_failures                            | 0          | 48         | 21
>> |
>> | BUG:uaccess_fault_at#with_KERNEL_DS      | 0          | 48         | 21
>> |
>> | BUG:unable_to_handle_kernel              | 0          | 48         | 21
>> |
>> | Oops                                     | 0          | 48         | 21
>> |
>> | RIP:copy_mount_options                   | 0          | 48         | 21
>> |
>> | Kernel_panic-not_syncing:Fatal_exception | 0          | 48         | 21
>> |
>> | backtrace:SyS_mount                      | 0          | 48         | 21
>> |
>> | backtrace:devtmpfsd                      | 0          | 48         | 21
>> |
>>
>> +------------------------------------------+------------+------------+--=
----------+
>>
>> [    0.673494] ..... calibration result: 3999913
>> [    0.673982] ..... CPU clock speed is 2693.1491 MHz.
>> [    0.674518] ..... host bus clock speed is 999.3913 MHz.
>> [    0.675362] BUG: uaccess fault at 0xffff880010d88000 with KERNEL_DS
>> [    0.676050] BUG: unable to handle kernel paging request at
>> ffff880010d88000
>> [    0.676929] IP: [<ffffffff811b1448>] copy_mount_options+0xde/0x18b
>> [    0.677766] PGD 42d3067 PUD 42d4067 PMD 1137a067 PTE 8000000010d88060
>> [    0.678841] Oops: 0000 [#1] DEBUG_PAGEALLOC
>> [    0.679318] CPU: 0 PID: 9 Comm: kdevtmpfs Not tainted
>> 4.7.0-rc3-00007-g6ce52d5 #2
>> [    0.680103] task: ffff880010d80000 ti: ffff880010d84000 task.ti:
>> ffff880010d84000
>> [    0.680919] task.addr_limit: 0xffffffffffffffff
>> [    0.681416] RIP: 0010:[<ffffffff811b1448>]  [<ffffffff811b1448>]
>> copy_mount_options+0xde/0x18b
>> [    0.682308] RSP: 0000:ffff880010d87d70  EFLAGS: 00010246
>> [    0.682877] RAX: 0000000000000000 RBX: 0000000000001000 RCX:
>> ffff880010d87a50
>> [    0.683661] RDX: ffff880010d80000 RSI: 8000000010d73163 RDI:
>> 0000000000000282
>> [    0.684459] RBP: ffff880010d87da0 R08: 0000000000001000 R09:
>> 0000000000000000
>> [    0.685262] R10: ffff880010d87b20 R11: 000000000000066c R12:
>> 0000000000000e06
>> [    0.686017] R13: ffff880010d73000 R14: ffff880010d87e06 R15:
>> ffff880010d88000
>> [    0.686799] FS:  0000000000000000(0000) GS:ffffffff82223000(0000)
>> knlGS:0000000000000000
>> [    0.687687] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    0.688304] CR2: ffff880010d88000 CR3: 000000000220d000 CR4:
>> 00000000000006b0
>> [    0.688979] Stack:
>> [    0.689218]  ffff880010d731fa ffffffff81f7e280 ffff880010d4f7f0
>> ffff880010d4f918
>> [    0.690086]  ffff880010d87e06 0000000000008000 ffff880010d87dd8
>> ffffffff811b24cb
>> [    0.690955]  ffff880010d1bee4 ffff880010d1bdb0 ffff880010d1bee4
>> ffffffff815c512d
>> [    0.691829] Call Trace:
>> [    0.692110]  [<ffffffff811b24cb>] SyS_mount+0x70/0xd5
>> [    0.692680]  [<ffffffff815c512d>] ? handle_create+0x237/0x237
>> [    0.693313]  [<ffffffff815c5192>] devtmpfsd+0x65/0x1d2
>> [    0.693878]  [<ffffffff81b61451>] ? __schedule+0x541/0x615
>> [    0.694494]  [<ffffffff815c512d>] ? handle_create+0x237/0x237
>> [    0.695131]  [<ffffffff810ce680>] kthread+0xdd/0xec
>> [    0.695672]  [<ffffffff81014a13>] ? sched_clock+0x9/0xb
>> [    0.696256]  [<ffffffff810d3600>] ? finish_task_switch+0xf4/0x18b
>> [    0.696925]  [<ffffffff81b65b8f>] ret_from_fork+0x1f/0x40
>> [    0.697528]  [<ffffffff810ce5a3>] ? init_completion+0x2d/0x2d
>> [    0.698136] Code: ff ff 72 0a e8 02 bd f6 ff 4d 39 e7 73 0a e8 f8 bc =
f6
>> ff 49 89 dc eb 5b 4c 89 6d d0 49 89 dc eb 3a e8 e5 bc f6 ff 66 66 90 31 =
c0
>> <45> 8a 3f 66 66 90 85 c0 74 12 e8 d1 bc f6 ff 48 8b 7d d0 44 89
>> [    0.701103] RIP  [<ffffffff811b1448>] copy_mount_options+0xde/0x18b
>> [    0.701808]  RSP <ffff880010d87d70>
>> [    0.702200] CR2: ffff880010d88000
>> [    0.702577] ---[ end trace 956b05d5d88712cd ]---
>> [    0.703087] Kernel panic - not syncing: Fatal exception
>>
>> git bisect start 900bf5ce72779f2c214a11ae92c98c25d8f552fa
>> 5edb56491d4812c42175980759da53388e5d86f5 --
>> git bisect  bad 98d47fa03585a7711f22a96aa58b2b6b810966d8  # 08:10      0-
>> 23  Merge
>> 'linux-review/Cyrille-Pitchen/mtd-spi-nor-add-driver-for-Atmel-QSPI-cont=
roller/20160613-232844'
>> into devel-spot-201606140509
>> git bisect  bad 9aae6c7ee5821fa7d2add46538bdbabde2742018  # 08:18      0-
>> 24  Merge 't-kristo-pm/4.7-rc1-hwmod-clks' into devel-spot-201606140509
>> git bisect  bad 8494ea2c303f463ab46f2814841afa724527b5ca  # 08:32      0-
>> 24  Merge 'kees/lkdtm/tip' into devel-spot-201606140509
>> git bisect  bad c68e7d756669e9df5713e74178c992ddaee63f8b  # 08:51      0-
>> 22  Merge 'kees/sysctl/writes_strict' into devel-spot-201606140509
>> git bisect good 4f479f74fac8eb689316cb060c61187487e4bbb6  # 09:05     22+
>> 0  Merge 'linux-review/Tejun-Heo/percpu-fixes-for-v4-7-rc3/20160614-0501=
28'
>> into devel-spot-201606140509
>> git bisect good 1bcbfedb65920c7a01272652374f0c000c3da604  # 09:19     22+
>> 2  Merge
>> 'linux-review/Arnd-Bergmann/lustre-hide-call-to-Posix-ACL-in-ifdef/20160=
614-044454'
>> into devel-spot-201606140509
>> git bisect good 547c116dd928ce9cd83f3e8daf75290130374ec8  # 09:34     22+
>> 1  Merge
>> 'linux-review/Arnd-Bergmann/clocksource-nps-fix-nps_timer_init-return-va=
lue/20160614-044325'
>> into devel-spot-201606140509
>> git bisect  bad dc8b9cb37ebbba72aa824840e9b4266f0bebf8be  # 09:39      0-
>> 22  Merge 'kees/x86/uaccess' into devel-spot-201606140509
>> git bisect good 646eaeee64acf38566bbce4e812cf66f798b813c  # 09:47     22+
>> 1  x86/dumpstack: If addr_limit is non-default, display it
>> git bisect good 0390fec2cd5dce3f813f5752fe51538aaa94ce14  # 10:01     22+
>> 0  x86/uaccess: Don't fix up USER_DS uaccess faults to kernel addresses
>> git bisect  bad 6ce52d535e1adcfb44ffd9e5503081805d33aa87  # 10:06      0-
>> 4  x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
>> !pagefault_disabled()
>> # first bad commit: [6ce52d535e1adcfb44ffd9e5503081805d33aa87]
>> x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
>> !pagefault_disabled()
>> git bisect good 0390fec2cd5dce3f813f5752fe51538aaa94ce14  # 10:08     63+
>> 0  x86/uaccess: Don't fix up USER_DS uaccess faults to kernel addresses
>> # extra tests with CONFIG_DEBUG_INFO_REDUCED
>> git bisect  bad 6ce52d535e1adcfb44ffd9e5503081805d33aa87  # 10:19      0-
>> 66  x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
>> !pagefault_disabled()
>> # extra tests on HEAD of linux-devel/devel-spot-201606140509
>> git bisect  bad 900bf5ce72779f2c214a11ae92c98c25d8f552fa  # 10:19      0-
>> 21  0day head guard for 'devel-spot-201606140509'
>> # extra tests on tree/branch kees/x86/uaccess
>> git bisect  bad 6ce52d535e1adcfb44ffd9e5503081805d33aa87  # 10:20      0-
>> 26  x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
>> !pagefault_disabled()
>> # extra tests with first bad commit reverted
>> git bisect good fa0d9a487704c781a00726f6405f35103977c3f4  # 10:30     66+
>> 0  Revert "x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
>> !pagefault_disabled()"
>> # extra tests on tree/branch linus/master
>> git bisect good 5edb56491d4812c42175980759da53388e5d86f5  # 10:33     66+
>> 19  Linux 4.7-rc3
>> # extra tests on tree/branch linux-next/master
>> git bisect good 8f6027f7e808ed7c1fd8c8d37fc7a5076c683c4f  # 11:34     60+
>> 0  Add linux-next specific files for 20160609
>>
>>
>> This script may reproduce the error.
>>
>>
>> ------------------------------------------------------------------------=
----
>> #!/bin/bash
>>
>> kernel=3D$1
>>
>> kvm=3D(
>>         qemu-system-x86_64
>>         -enable-kvm
>>         -cpu kvm64
>>         -kernel $kernel
>>         -m 300
>>         -smp 2
>>         -device e1000,netdev=3Dnet0
>>         -netdev user,id=3Dnet0
>>         -boot order=3Dnc
>>         -no-reboot
>>         -watchdog i6300esb
>>         -rtc base=3Dlocaltime
>>         -serial stdio
>>         -display none
>>         -monitor null
>> )
>>
>> append=3D(
>>         hung_task_panic=3D1
>>         earlyprintk=3DttyS0,115200
>>         systemd.log_level=3Derr
>>         debug
>>         apic=3Ddebug
>>         sysrq_always_enabled
>>         rcupdate.rcu_cpu_stall_timeout=3D100
>>         panic=3D-1
>>         softlockup_panic=3D1
>>         nmi_watchdog=3Dpanic
>>         oops=3Dpanic
>>         load_ramdisk=3D2
>>         prompt_ramdisk=3D0
>>         console=3DttyS0,115200
>>         console=3Dtty0
>>         vga=3Dnormal
>>         root=3D/dev/ram0
>>         rw
>>         drbd.minor_count=3D8
>> )
>>
>> "${kvm[@]}" --append "${append[*]}"
>>
>> ------------------------------------------------------------------------=
----
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology
>> Center
>> https://lists.01.org/pipermail/lkp                          Intel
>> Corporation



-- =

Kees Cook
Chrome OS & Brillo Security

--===============7325210222949779628==--

