Content-Type: multipart/mixed; boundary="===============3204206466168515776=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 6ce52d535e: BUG: uaccess fault at 0xffff880010d88000 with KERNEL_DS
Date: Mon, 13 Jun 2016 21:51:08 -0700
Message-ID: <CALCETrWTw96Q+atKyL26Sz50H9b4YGR+Cqopy9aB2Bfvn5PwKA@mail.gmail.com>
In-Reply-To: <575f7b45.+RmKk1G/mKYUSQzU%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3204206466168515776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Jun 13, 2016 8:36 PM, "kernel test robot" <fengguang.wu@intel.com> wro=
te:
>
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git x86/uaccess
>
> commit 6ce52d535e1adcfb44ffd9e5503081805d33aa87

Kees, this should be fixed in my version of this branch.

> Author:     Andrew Lutomirski <luto@kernel.org>
> AuthorDate: Tue May 24 15:48:44 2016 -0700
> Commit:     Kees Cook <keescook@chromium.org>
> CommitDate: Mon Jun 13 13:30:53 2016 -0700
>
>     x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
!pagefault_disabled()
>
>     If someone calls set_fs(KERNEL_DS), then they are responsible for
>     making sure that whatever addresses are accessed are safe.  If they
>     get it wrong on a kernel address, OOPS.  If they get it wrong on a
user
>     address, warn.
>
>     This will make it harder to exploit bugs in which user code controls
>     a pointer accessed with KERNEL_DS: an attacker will OOPS if they
>     access an unmapped page, and they'll therefore need luck or a kASLR
>     bypass in addition.
>
>     To keep probe_kernel_read(), probe_kernel_write(), and
>     probe_kernel_address() working, skip this check if
>     pagefault_disabled().
>
>     Signed-off-by: Andy Lutomirski <luto@kernel.org>
>
>
+------------------------------------------+------------+------------+-----=
-------+
> |                                          | 0390fec2cd | 6ce52d535e |
900bf5ce72 |
>
+------------------------------------------+------------+------------+-----=
-------+
> | boot_successes                           | 63         | 0          | 0
        |
> | boot_failures                            | 0          | 48         |
21         |
> | BUG:uaccess_fault_at#with_KERNEL_DS      | 0          | 48         |
21         |
> | BUG:unable_to_handle_kernel              | 0          | 48         |
21         |
> | Oops                                     | 0          | 48         |
21         |
> | RIP:copy_mount_options                   | 0          | 48         |
21         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 48         |
21         |
> | backtrace:SyS_mount                      | 0          | 48         |
21         |
> | backtrace:devtmpfsd                      | 0          | 48         |
21         |
>
+------------------------------------------+------------+------------+-----=
-------+
>
> [    0.673494] ..... calibration result: 3999913
> [    0.673982] ..... CPU clock speed is 2693.1491 MHz.
> [    0.674518] ..... host bus clock speed is 999.3913 MHz.
> [    0.675362] BUG: uaccess fault at 0xffff880010d88000 with KERNEL_DS
> [    0.676050] BUG: unable to handle kernel paging request at
ffff880010d88000
> [    0.676929] IP: [<ffffffff811b1448>] copy_mount_options+0xde/0x18b
> [    0.677766] PGD 42d3067 PUD 42d4067 PMD 1137a067 PTE 8000000010d88060
> [    0.678841] Oops: 0000 [#1] DEBUG_PAGEALLOC
> [    0.679318] CPU: 0 PID: 9 Comm: kdevtmpfs Not tainted
4.7.0-rc3-00007-g6ce52d5 #2
> [    0.680103] task: ffff880010d80000 ti: ffff880010d84000 task.ti:
ffff880010d84000
> [    0.680919] task.addr_limit: 0xffffffffffffffff
> [    0.681416] RIP: 0010:[<ffffffff811b1448>]  [<ffffffff811b1448>]
copy_mount_options+0xde/0x18b
> [    0.682308] RSP: 0000:ffff880010d87d70  EFLAGS: 00010246
> [    0.682877] RAX: 0000000000000000 RBX: 0000000000001000 RCX:
ffff880010d87a50
> [    0.683661] RDX: ffff880010d80000 RSI: 8000000010d73163 RDI:
0000000000000282
> [    0.684459] RBP: ffff880010d87da0 R08: 0000000000001000 R09:
0000000000000000
> [    0.685262] R10: ffff880010d87b20 R11: 000000000000066c R12:
0000000000000e06
> [    0.686017] R13: ffff880010d73000 R14: ffff880010d87e06 R15:
ffff880010d88000
> [    0.686799] FS:  0000000000000000(0000) GS:ffffffff82223000(0000)
knlGS:0000000000000000
> [    0.687687] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.688304] CR2: ffff880010d88000 CR3: 000000000220d000 CR4:
00000000000006b0
> [    0.688979] Stack:
> [    0.689218]  ffff880010d731fa ffffffff81f7e280 ffff880010d4f7f0
ffff880010d4f918
> [    0.690086]  ffff880010d87e06 0000000000008000 ffff880010d87dd8
ffffffff811b24cb
> [    0.690955]  ffff880010d1bee4 ffff880010d1bdb0 ffff880010d1bee4
ffffffff815c512d
> [    0.691829] Call Trace:
> [    0.692110]  [<ffffffff811b24cb>] SyS_mount+0x70/0xd5
> [    0.692680]  [<ffffffff815c512d>] ? handle_create+0x237/0x237
> [    0.693313]  [<ffffffff815c5192>] devtmpfsd+0x65/0x1d2
> [    0.693878]  [<ffffffff81b61451>] ? __schedule+0x541/0x615
> [    0.694494]  [<ffffffff815c512d>] ? handle_create+0x237/0x237
> [    0.695131]  [<ffffffff810ce680>] kthread+0xdd/0xec
> [    0.695672]  [<ffffffff81014a13>] ? sched_clock+0x9/0xb
> [    0.696256]  [<ffffffff810d3600>] ? finish_task_switch+0xf4/0x18b
> [    0.696925]  [<ffffffff81b65b8f>] ret_from_fork+0x1f/0x40
> [    0.697528]  [<ffffffff810ce5a3>] ? init_completion+0x2d/0x2d
> [    0.698136] Code: ff ff 72 0a e8 02 bd f6 ff 4d 39 e7 73 0a e8 f8 bc
f6 ff 49 89 dc eb 5b 4c 89 6d d0 49 89 dc eb 3a e8 e5 bc f6 ff 66 66 90 31
c0 <45> 8a 3f 66 66 90 85 c0 74 12 e8 d1 bc f6 ff 48 8b 7d d0 44 89
> [    0.701103] RIP  [<ffffffff811b1448>] copy_mount_options+0xde/0x18b
> [    0.701808]  RSP <ffff880010d87d70>
> [    0.702200] CR2: ffff880010d88000
> [    0.702577] ---[ end trace 956b05d5d88712cd ]---
> [    0.703087] Kernel panic - not syncing: Fatal exception
>
> git bisect start 900bf5ce72779f2c214a11ae92c98c25d8f552fa
5edb56491d4812c42175980759da53388e5d86f5 --
> git bisect  bad 98d47fa03585a7711f22a96aa58b2b6b810966d8  # 08:10
0-     23  Merge
'linux-review/Cyrille-Pitchen/mtd-spi-nor-add-driver-for-Atmel-QSPI-control=
ler/20160613-232844'
into devel-spot-201606140509
> git bisect  bad 9aae6c7ee5821fa7d2add46538bdbabde2742018  # 08:18
0-     24  Merge 't-kristo-pm/4.7-rc1-hwmod-clks' into
devel-spot-201606140509
> git bisect  bad 8494ea2c303f463ab46f2814841afa724527b5ca  # 08:32
0-     24  Merge 'kees/lkdtm/tip' into devel-spot-201606140509
> git bisect  bad c68e7d756669e9df5713e74178c992ddaee63f8b  # 08:51
0-     22  Merge 'kees/sysctl/writes_strict' into devel-spot-201606140509
> git bisect good 4f479f74fac8eb689316cb060c61187487e4bbb6  # 09:05
 22+      0  Merge
'linux-review/Tejun-Heo/percpu-fixes-for-v4-7-rc3/20160614-050128' into
devel-spot-201606140509
> git bisect good 1bcbfedb65920c7a01272652374f0c000c3da604  # 09:19
 22+      2  Merge
'linux-review/Arnd-Bergmann/lustre-hide-call-to-Posix-ACL-in-ifdef/20160614=
-044454'
into devel-spot-201606140509
> git bisect good 547c116dd928ce9cd83f3e8daf75290130374ec8  # 09:34
 22+      1  Merge
'linux-review/Arnd-Bergmann/clocksource-nps-fix-nps_timer_init-return-value=
/20160614-044325'
into devel-spot-201606140509
> git bisect  bad dc8b9cb37ebbba72aa824840e9b4266f0bebf8be  # 09:39
0-     22  Merge 'kees/x86/uaccess' into devel-spot-201606140509
> git bisect good 646eaeee64acf38566bbce4e812cf66f798b813c  # 09:47
 22+      1  x86/dumpstack: If addr_limit is non-default, display it
> git bisect good 0390fec2cd5dce3f813f5752fe51538aaa94ce14  # 10:01
 22+      0  x86/uaccess: Don't fix up USER_DS uaccess faults to kernel
addresses
> git bisect  bad 6ce52d535e1adcfb44ffd9e5503081805d33aa87  # 10:06
0-      4  x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
!pagefault_disabled()
> # first bad commit: [6ce52d535e1adcfb44ffd9e5503081805d33aa87]
x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
!pagefault_disabled()
> git bisect good 0390fec2cd5dce3f813f5752fe51538aaa94ce14  # 10:08
 63+      0  x86/uaccess: Don't fix up USER_DS uaccess faults to kernel
addresses
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 6ce52d535e1adcfb44ffd9e5503081805d33aa87  # 10:19
0-     66  x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
!pagefault_disabled()
> # extra tests on HEAD of linux-devel/devel-spot-201606140509
> git bisect  bad 900bf5ce72779f2c214a11ae92c98c25d8f552fa  # 10:19
0-     21  0day head guard for 'devel-spot-201606140509'
> # extra tests on tree/branch kees/x86/uaccess
> git bisect  bad 6ce52d535e1adcfb44ffd9e5503081805d33aa87  # 10:20
0-     26  x86/uaccess: OOPS or warn on a fault with KERNEL_DS and
!pagefault_disabled()
> # extra tests with first bad commit reverted
> git bisect good fa0d9a487704c781a00726f6405f35103977c3f4  # 10:30
 66+      0  Revert "x86/uaccess: OOPS or warn on a fault with KERNEL_DS
and !pagefault_disabled()"
> # extra tests on tree/branch linus/master
> git bisect good 5edb56491d4812c42175980759da53388e5d86f5  # 10:33
 66+     19  Linux 4.7-rc3
> # extra tests on tree/branch linux-next/master
> git bisect good 8f6027f7e808ed7c1fd8c8d37fc7a5076c683c4f  # 11:34
 60+      0  Add linux-next specific files for 20160609
>
>
> This script may reproduce the error.
>
>
----------------------------------------------------------------------------
> #!/bin/bash
>
> kernel=3D$1
>
> kvm=3D(
>         qemu-system-x86_64
>         -enable-kvm
>         -cpu kvm64
>         -kernel $kernel
>         -m 300
>         -smp 2
>         -device e1000,netdev=3Dnet0
>         -netdev user,id=3Dnet0
>         -boot order=3Dnc
>         -no-reboot
>         -watchdog i6300esb
>         -rtc base=3Dlocaltime
>         -serial stdio
>         -display none
>         -monitor null
> )
>
> append=3D(
>         hung_task_panic=3D1
>         earlyprintk=3DttyS0,115200
>         systemd.log_level=3Derr
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
>         console=3DttyS0,115200
>         console=3Dtty0
>         vga=3Dnormal
>         root=3D/dev/ram0
>         rw
>         drbd.minor_count=3D8
> )
>
> "${kvm[@]}" --append "${append[*]}"
>
----------------------------------------------------------------------------
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
Center
> https://lists.01.org/pipermail/lkp                          Intel
Corporation

--===============3204206466168515776==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHAgZGlyPSJsdHIiPjxicj4KT24gSnVuIDEzLCAyMDE2IDg6MzYgUE0sICZxdW90O2tlcm5lbCB0
ZXN0IHJvYm90JnF1b3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86ZmVuZ2d1YW5nLnd1QGludGVsLmNv
bSI+ZmVuZ2d1YW5nLnd1QGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KJmd0Ozxicj4KJmd0
OyBHcmVldGluZ3MsPGJyPgomZ3Q7PGJyPgomZ3Q7IDBkYXkga2VybmVsIHRlc3Rpbmcgcm9ib3Qg
Z290IHRoZSBiZWxvdyBkbWVzZyBhbmQgdGhlIGZpcnN0IGJhZCBjb21taXQgaXM8YnI+CiZndDs8
YnI+CiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQva2Vlcy9saW51eC5naXQiPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2tlZXMvbGludXguZ2l0PC9hPiB4ODYvdWFjY2Vzczxicj4KJmd0Ozxi
cj4KJmd0OyBjb21taXQgNmNlNTJkNTM1ZTFhZGNmYjQ0ZmZkOWU1NTAzMDgxODA1ZDMzYWE4Nzwv
cD4KPHAgZGlyPSJsdHIiPktlZXMsIHRoaXMgc2hvdWxkIGJlIGZpeGVkIGluIG15IHZlcnNpb24g
b2YgdGhpcyBicmFuY2guPC9wPgo8cCBkaXI9Imx0ciI+Jmd0OyBBdXRob3I6wqAgwqAgwqBBbmRy
ZXcgTHV0b21pcnNraSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmx1dG9Aa2VybmVsLm9yZyI+bHV0b0Br
ZXJuZWwub3JnPC9hPiZndDs8YnI+CiZndDsgQXV0aG9yRGF0ZTogVHVlIE1heSAyNCAxNTo0ODo0
NCAyMDE2IC0wNzAwPGJyPgomZ3Q7IENvbW1pdDrCoCDCoCDCoEtlZXMgQ29vayAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmtlZXNjb29rQGNocm9taXVtLm9yZyI+a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPC9h
PiZndDs8YnI+CiZndDsgQ29tbWl0RGF0ZTogTW9uIEp1biAxMyAxMzozMDo1MyAyMDE2IC0wNzAw
PGJyPgomZ3Q7PGJyPgomZ3Q7IMKgIMKgIHg4Ni91YWNjZXNzOiBPT1BTIG9yIHdhcm4gb24gYSBm
YXVsdCB3aXRoIEtFUk5FTF9EUyBhbmQgIXBhZ2VmYXVsdF9kaXNhYmxlZCgpPGJyPgomZ3Q7PGJy
PgomZ3Q7IMKgIMKgIElmIHNvbWVvbmUgY2FsbHMgc2V0X2ZzKEtFUk5FTF9EUyksIHRoZW4gdGhl
eSBhcmUgcmVzcG9uc2libGUgZm9yPGJyPgomZ3Q7IMKgIMKgIG1ha2luZyBzdXJlIHRoYXQgd2hh
dGV2ZXIgYWRkcmVzc2VzIGFyZSBhY2Nlc3NlZCBhcmUgc2FmZS7CoCBJZiB0aGV5PGJyPgomZ3Q7
IMKgIMKgIGdldCBpdCB3cm9uZyBvbiBhIGtlcm5lbCBhZGRyZXNzLCBPT1BTLsKgIElmIHRoZXkg
Z2V0IGl0IHdyb25nIG9uIGEgdXNlcjxicj4KJmd0OyDCoCDCoCBhZGRyZXNzLCB3YXJuLjxicj4K
Jmd0Ozxicj4KJmd0OyDCoCDCoCBUaGlzIHdpbGwgbWFrZSBpdCBoYXJkZXIgdG8gZXhwbG9pdCBi
dWdzIGluIHdoaWNoIHVzZXIgY29kZSBjb250cm9sczxicj4KJmd0OyDCoCDCoCBhIHBvaW50ZXIg
YWNjZXNzZWQgd2l0aCBLRVJORUxfRFM6IGFuIGF0dGFja2VyIHdpbGwgT09QUyBpZiB0aGV5PGJy
PgomZ3Q7IMKgIMKgIGFjY2VzcyBhbiB1bm1hcHBlZCBwYWdlLCBhbmQgdGhleSYjMzk7bGwgdGhl
cmVmb3JlIG5lZWQgbHVjayBvciBhIGtBU0xSPGJyPgomZ3Q7IMKgIMKgIGJ5cGFzcyBpbiBhZGRp
dGlvbi48YnI+CiZndDs8YnI+CiZndDsgwqAgwqAgVG8ga2VlcCBwcm9iZV9rZXJuZWxfcmVhZCgp
LCBwcm9iZV9rZXJuZWxfd3JpdGUoKSwgYW5kPGJyPgomZ3Q7IMKgIMKgIHByb2JlX2tlcm5lbF9h
ZGRyZXNzKCkgd29ya2luZywgc2tpcCB0aGlzIGNoZWNrIGlmPGJyPgomZ3Q7IMKgIMKgIHBhZ2Vm
YXVsdF9kaXNhYmxlZCgpLjxicj4KJmd0Ozxicj4KJmd0OyDCoCDCoCBTaWduZWQtb2ZmLWJ5OiBB
bmR5IEx1dG9taXJza2kgJmx0OzxhIGhyZWY9Im1haWx0bzpsdXRvQGtlcm5lbC5vcmciPmx1dG9A
a2VybmVsLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7ICstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0rPGJyPgomZ3Q7IHzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDAzOTBmZWMyY2QgfCA2Y2U1MmQ1MzVlIHwgOTAwYmY1
Y2U3MiB8PGJyPgomZ3Q7ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rPGJyPgomZ3Q7IHwgYm9v
dF9zdWNjZXNzZXPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgNjPC
oCDCoCDCoCDCoCDCoHwgMMKgIMKgIMKgIMKgIMKgIHwgMMKgIMKgIMKgIMKgIMKgIHw8YnI+CiZn
dDsgfCBib290X2ZhaWx1cmVzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfCAwwqAgwqAgwqAgwqAgwqAgfCA0OMKgIMKgIMKgIMKgIMKgfCAyMcKgIMKgIMKgIMKgIMKg
fDxicj4KJmd0OyB8IEJVRzp1YWNjZXNzX2ZhdWx0X2F0I3dpdGhfS0VSTkVMX0RTwqAgwqAgwqAg
fCAwwqAgwqAgwqAgwqAgwqAgfCA0OMKgIMKgIMKgIMKgIMKgfCAyMcKgIMKgIMKgIMKgIMKgfDxi
cj4KJmd0OyB8IEJVRzp1bmFibGVfdG9faGFuZGxlX2tlcm5lbMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHwgMMKgIMKgIMKgIMKgIMKgIHwgNDjCoCDCoCDCoCDCoCDCoHwgMjHCoCDCoCDCoCDCoCDCoHw8
YnI+CiZndDsgfCBPb3BzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB8IDDCoCDCoCDCoCDCoCDCoCB8IDQ4wqAgwqAgwqAgwqAgwqB8IDIxwqAg
wqAgwqAgwqAgwqB8PGJyPgomZ3Q7IHwgUklQOmNvcHlfbW91bnRfb3B0aW9uc8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAgwqAgfCA0OMKgIMKgIMKgIMKgIMKgfCAy
McKgIMKgIMKgIMKgIMKgfDxicj4KJmd0OyB8IEtlcm5lbF9wYW5pYy1ub3Rfc3luY2luZzpGYXRh
bF9leGNlcHRpb24gfCAwwqAgwqAgwqAgwqAgwqAgfCA0OMKgIMKgIMKgIMKgIMKgfCAyMcKgIMKg
IMKgIMKgIMKgfDxicj4KJmd0OyB8IGJhY2t0cmFjZTpTeVNfbW91bnTCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB8IDDCoCDCoCDCoCDCoCDCoCB8IDQ4wqAgwqAgwqAgwqAgwqB8IDIx
wqAgwqAgwqAgwqAgwqB8PGJyPgomZ3Q7IHwgYmFja3RyYWNlOmRldnRtcGZzZMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgMMKgIMKgIMKgIMKgIMKgIHwgNDjCoCDCoCDCoCDCoCDC
oHwgMjHCoCDCoCDCoCDCoCDCoHw8YnI+CiZndDsgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSs8
YnI+CiZndDs8YnI+CiZndDsgW8KgIMKgIDAuNjczNDk0XSAuLi4uLiBjYWxpYnJhdGlvbiByZXN1
bHQ6IDM5OTk5MTM8YnI+CiZndDsgW8KgIMKgIDAuNjczOTgyXSAuLi4uLiBDUFUgY2xvY2sgc3Bl
ZWQgaXMgMjY5My4xNDkxIE1Iei48YnI+CiZndDsgW8KgIMKgIDAuNjc0NTE4XSAuLi4uLiBob3N0
IGJ1cyBjbG9jayBzcGVlZCBpcyA5OTkuMzkxMyBNSHouPGJyPgomZ3Q7IFvCoCDCoCAwLjY3NTM2
Ml0gQlVHOiB1YWNjZXNzIGZhdWx0IGF0IDB4ZmZmZjg4MDAxMGQ4ODAwMCB3aXRoIEtFUk5FTF9E
Uzxicj4KJmd0OyBbwqAgwqAgMC42NzYwNTBdIEJVRzogdW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwg
cGFnaW5nIHJlcXVlc3QgYXQgZmZmZjg4MDAxMGQ4ODAwMDxicj4KJmd0OyBbwqAgwqAgMC42NzY5
MjldIElQOiBbJmx0O2ZmZmZmZmZmODExYjE0NDgmZ3Q7XSBjb3B5X21vdW50X29wdGlvbnMrMHhk
ZS8weDE4Yjxicj4KJmd0OyBbwqAgwqAgMC42Nzc3NjZdIFBHRCA0MmQzMDY3IFBVRCA0MmQ0MDY3
IFBNRCAxMTM3YTA2NyBQVEUgODAwMDAwMDAxMGQ4ODA2MDxicj4KJmd0OyBbwqAgwqAgMC42Nzg4
NDFdIE9vcHM6IDAwMDAgWyMxXSBERUJVR19QQUdFQUxMT0M8YnI+CiZndDsgW8KgIMKgIDAuNjc5
MzE4XSBDUFU6IDAgUElEOiA5IENvbW06IGtkZXZ0bXBmcyBOb3QgdGFpbnRlZCA0LjcuMC1yYzMt
MDAwMDctZzZjZTUyZDUgIzI8YnI+CiZndDsgW8KgIMKgIDAuNjgwMTAzXSB0YXNrOiBmZmZmODgw
MDEwZDgwMDAwIHRpOiBmZmZmODgwMDEwZDg0MDAwIHRhc2sudGk6IGZmZmY4ODAwMTBkODQwMDA8
YnI+CiZndDsgW8KgIMKgIDAuNjgwOTE5XSB0YXNrLmFkZHJfbGltaXQ6IDB4ZmZmZmZmZmZmZmZm
ZmZmZjxicj4KJmd0OyBbwqAgwqAgMC42ODE0MTZdIFJJUDogMDAxMDpbJmx0O2ZmZmZmZmZmODEx
YjE0NDgmZ3Q7XcKgIFsmbHQ7ZmZmZmZmZmY4MTFiMTQ0OCZndDtdIGNvcHlfbW91bnRfb3B0aW9u
cysweGRlLzB4MThiPGJyPgomZ3Q7IFvCoCDCoCAwLjY4MjMwOF0gUlNQOiAwMDAwOmZmZmY4ODAw
MTBkODdkNzDCoCBFRkxBR1M6IDAwMDEwMjQ2PGJyPgomZ3Q7IFvCoCDCoCAwLjY4Mjg3N10gUkFY
OiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogMDAwMDAwMDAwMDAwMTAwMCBSQ1g6IGZmZmY4ODAwMTBk
ODdhNTA8YnI+CiZndDsgW8KgIMKgIDAuNjgzNjYxXSBSRFg6IGZmZmY4ODAwMTBkODAwMDAgUlNJ
OiA4MDAwMDAwMDEwZDczMTYzIFJESTogMDAwMDAwMDAwMDAwMDI4Mjxicj4KJmd0OyBbwqAgwqAg
MC42ODQ0NTldIFJCUDogZmZmZjg4MDAxMGQ4N2RhMCBSMDg6IDAwMDAwMDAwMDAwMDEwMDAgUjA5
OiAwMDAwMDAwMDAwMDAwMDAwPGJyPgomZ3Q7IFvCoCDCoCAwLjY4NTI2Ml0gUjEwOiBmZmZmODgw
MDEwZDg3YjIwIFIxMTogMDAwMDAwMDAwMDAwMDY2YyBSMTI6IDAwMDAwMDAwMDAwMDBlMDY8YnI+
CiZndDsgW8KgIMKgIDAuNjg2MDE3XSBSMTM6IGZmZmY4ODAwMTBkNzMwMDAgUjE0OiBmZmZmODgw
MDEwZDg3ZTA2IFIxNTogZmZmZjg4MDAxMGQ4ODAwMDxicj4KJmd0OyBbwqAgwqAgMC42ODY3OTld
IEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZmZmZmY4MjIyMzAwMCgwMDAwKSBr
bmxHUzowMDAwMDAwMDAwMDAwMDAwPGJyPgomZ3Q7IFvCoCDCoCAwLjY4NzY4N10gQ1M6wqAgMDAx
MCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzM8YnI+CiZndDsgW8KgIMKg
IDAuNjg4MzA0XSBDUjI6IGZmZmY4ODAwMTBkODgwMDAgQ1IzOiAwMDAwMDAwMDAyMjBkMDAwIENS
NDogMDAwMDAwMDAwMDAwMDZiMDxicj4KJmd0OyBbwqAgwqAgMC42ODg5NzldIFN0YWNrOjxicj4K
Jmd0OyBbwqAgwqAgMC42ODkyMThdwqAgZmZmZjg4MDAxMGQ3MzFmYSBmZmZmZmZmZjgxZjdlMjgw
IGZmZmY4ODAwMTBkNGY3ZjAgZmZmZjg4MDAxMGQ0ZjkxODxicj4KJmd0OyBbwqAgwqAgMC42OTAw
ODZdwqAgZmZmZjg4MDAxMGQ4N2UwNiAwMDAwMDAwMDAwMDA4MDAwIGZmZmY4ODAwMTBkODdkZDgg
ZmZmZmZmZmY4MTFiMjRjYjxicj4KJmd0OyBbwqAgwqAgMC42OTA5NTVdwqAgZmZmZjg4MDAxMGQx
YmVlNCBmZmZmODgwMDEwZDFiZGIwIGZmZmY4ODAwMTBkMWJlZTQgZmZmZmZmZmY4MTVjNTEyZDxi
cj4KJmd0OyBbwqAgwqAgMC42OTE4MjldIENhbGwgVHJhY2U6PGJyPgomZ3Q7IFvCoCDCoCAwLjY5
MjExMF3CoCBbJmx0O2ZmZmZmZmZmODExYjI0Y2ImZ3Q7XSBTeVNfbW91bnQrMHg3MC8weGQ1PGJy
PgomZ3Q7IFvCoCDCoCAwLjY5MjY4MF3CoCBbJmx0O2ZmZmZmZmZmODE1YzUxMmQmZ3Q7XSA/IGhh
bmRsZV9jcmVhdGUrMHgyMzcvMHgyMzc8YnI+CiZndDsgW8KgIMKgIDAuNjkzMzEzXcKgIFsmbHQ7
ZmZmZmZmZmY4MTVjNTE5MiZndDtdIGRldnRtcGZzZCsweDY1LzB4MWQyPGJyPgomZ3Q7IFvCoCDC
oCAwLjY5Mzg3OF3CoCBbJmx0O2ZmZmZmZmZmODFiNjE0NTEmZ3Q7XSA/IF9fc2NoZWR1bGUrMHg1
NDEvMHg2MTU8YnI+CiZndDsgW8KgIMKgIDAuNjk0NDk0XcKgIFsmbHQ7ZmZmZmZmZmY4MTVjNTEy
ZCZndDtdID8gaGFuZGxlX2NyZWF0ZSsweDIzNy8weDIzNzxicj4KJmd0OyBbwqAgwqAgMC42OTUx
MzFdwqAgWyZsdDtmZmZmZmZmZjgxMGNlNjgwJmd0O10ga3RocmVhZCsweGRkLzB4ZWM8YnI+CiZn
dDsgW8KgIMKgIDAuNjk1NjcyXcKgIFsmbHQ7ZmZmZmZmZmY4MTAxNGExMyZndDtdID8gc2NoZWRf
Y2xvY2srMHg5LzB4Yjxicj4KJmd0OyBbwqAgwqAgMC42OTYyNTZdwqAgWyZsdDtmZmZmZmZmZjgx
MGQzNjAwJmd0O10gPyBmaW5pc2hfdGFza19zd2l0Y2grMHhmNC8weDE4Yjxicj4KJmd0OyBbwqAg
wqAgMC42OTY5MjVdwqAgWyZsdDtmZmZmZmZmZjgxYjY1YjhmJmd0O10gcmV0X2Zyb21fZm9yaysw
eDFmLzB4NDA8YnI+CiZndDsgW8KgIMKgIDAuNjk3NTI4XcKgIFsmbHQ7ZmZmZmZmZmY4MTBjZTVh
MyZndDtdID8gaW5pdF9jb21wbGV0aW9uKzB4MmQvMHgyZDxicj4KJmd0OyBbwqAgwqAgMC42OTgx
MzZdIENvZGU6IGZmIGZmIDcyIDBhIGU4IDAyIGJkIGY2IGZmIDRkIDM5IGU3IDczIDBhIGU4IGY4
IGJjIGY2IGZmIDQ5IDg5IGRjIGViIDViIDRjIDg5IDZkIGQwIDQ5IDg5IGRjIGViIDNhIGU4IGU1
IGJjIGY2IGZmIDY2IDY2IDkwIDMxIGMwICZsdDs0NSZndDsgOGEgM2YgNjYgNjYgOTAgODUgYzAg
NzQgMTIgZTggZDEgYmMgZjYgZmYgNDggOGIgN2QgZDAgNDQgODk8YnI+CiZndDsgW8KgIMKgIDAu
NzAxMTAzXSBSSVDCoCBbJmx0O2ZmZmZmZmZmODExYjE0NDgmZ3Q7XSBjb3B5X21vdW50X29wdGlv
bnMrMHhkZS8weDE4Yjxicj4KJmd0OyBbwqAgwqAgMC43MDE4MDhdwqAgUlNQICZsdDtmZmZmODgw
MDEwZDg3ZDcwJmd0Ozxicj4KJmd0OyBbwqAgwqAgMC43MDIyMDBdIENSMjogZmZmZjg4MDAxMGQ4
ODAwMDxicj4KJmd0OyBbwqAgwqAgMC43MDI1NzddIC0tLVsgZW5kIHRyYWNlIDk1NmIwNWQ1ZDg4
NzEyY2QgXS0tLTxicj4KJmd0OyBbwqAgwqAgMC43MDMwODddIEtlcm5lbCBwYW5pYyAtIG5vdCBz
eW5jaW5nOiBGYXRhbCBleGNlcHRpb248YnI+CiZndDs8YnI+CiZndDsgZ2l0IGJpc2VjdCBzdGFy
dCA5MDBiZjVjZTcyNzc5ZjJjMjE0YTExYWU5MmM5OGMyNWQ4ZjU1MmZhIDVlZGI1NjQ5MWQ0ODEy
YzQyMTc1OTgwNzU5ZGE1MzM4OGU1ZDg2ZjUgLS08YnI+CiZndDsgZ2l0IGJpc2VjdMKgIGJhZCA5
OGQ0N2ZhMDM1ODVhNzcxMWYyMmE5NmFhNThiMmI2YjgxMDk2NmQ4wqAgIyAwODoxMMKgIMKgIMKg
IDAtwqAgwqAgwqAyM8KgIE1lcmdlICYjMzk7bGludXgtcmV2aWV3L0N5cmlsbGUtUGl0Y2hlbi9t
dGQtc3BpLW5vci1hZGQtZHJpdmVyLWZvci1BdG1lbC1RU1BJLWNvbnRyb2xsZXIvMjAxNjA2MTMt
MjMyODQ0JiMzOTsgaW50byBkZXZlbC1zcG90LTIwMTYwNjE0MDUwOTxicj4KJmd0OyBnaXQgYmlz
ZWN0wqAgYmFkIDlhYWU2YzdlZTU4MjFmYTdkMmFkZDQ2NTM4YmRiYWJkZTI3NDIwMTjCoCAjIDA4
OjE4wqAgwqAgwqAgMC3CoCDCoCDCoDI0wqAgTWVyZ2UgJiMzOTt0LWtyaXN0by1wbS80LjctcmMx
LWh3bW9kLWNsa3MmIzM5OyBpbnRvIGRldmVsLXNwb3QtMjAxNjA2MTQwNTA5PGJyPgomZ3Q7IGdp
dCBiaXNlY3TCoCBiYWQgODQ5NGVhMmMzMDNmNDYzYWI0NmYyODE0ODQxYWZhNzI0NTI3YjVjYcKg
ICMgMDg6MzLCoCDCoCDCoCAwLcKgIMKgIMKgMjTCoCBNZXJnZSAmIzM5O2tlZXMvbGtkdG0vdGlw
JiMzOTsgaW50byBkZXZlbC1zcG90LTIwMTYwNjE0MDUwOTxicj4KJmd0OyBnaXQgYmlzZWN0wqAg
YmFkIGM2OGU3ZDc1NjY2OWU5ZGY1NzEzZTc0MTc4Yzk5MmRkYWVlNjNmOGLCoCAjIDA4OjUxwqAg
wqAgwqAgMC3CoCDCoCDCoDIywqAgTWVyZ2UgJiMzOTtrZWVzL3N5c2N0bC93cml0ZXNfc3RyaWN0
JiMzOTsgaW50byBkZXZlbC1zcG90LTIwMTYwNjE0MDUwOTxicj4KJmd0OyBnaXQgYmlzZWN0IGdv
b2QgNGY0NzlmNzRmYWM4ZWI2ODkzMTZjYjA2MGM2MTE4NzQ4N2U0YmJiNsKgICMgMDk6MDXCoCDC
oCDCoDIyK8KgIMKgIMKgIDDCoCBNZXJnZSAmIzM5O2xpbnV4LXJldmlldy9UZWp1bi1IZW8vcGVy
Y3B1LWZpeGVzLWZvci12NC03LXJjMy8yMDE2MDYxNC0wNTAxMjgmIzM5OyBpbnRvIGRldmVsLXNw
b3QtMjAxNjA2MTQwNTA5PGJyPgomZ3Q7IGdpdCBiaXNlY3QgZ29vZCAxYmNiZmVkYjY1OTIwYzdh
MDEyNzI2NTIzNzRmMGMwMDBjM2RhNjA0wqAgIyAwOToxOcKgIMKgIMKgMjIrwqAgwqAgwqAgMsKg
IE1lcmdlICYjMzk7bGludXgtcmV2aWV3L0FybmQtQmVyZ21hbm4vbHVzdHJlLWhpZGUtY2FsbC10
by1Qb3NpeC1BQ0wtaW4taWZkZWYvMjAxNjA2MTQtMDQ0NDU0JiMzOTsgaW50byBkZXZlbC1zcG90
LTIwMTYwNjE0MDUwOTxicj4KJmd0OyBnaXQgYmlzZWN0IGdvb2QgNTQ3YzExNmRkOTI4Y2U5Y2Q4
M2YzZThkYWY3NTI5MDEzMDM3NGVjOMKgICMgMDk6MzTCoCDCoCDCoDIyK8KgIMKgIMKgIDHCoCBN
ZXJnZSAmIzM5O2xpbnV4LXJldmlldy9Bcm5kLUJlcmdtYW5uL2Nsb2Nrc291cmNlLW5wcy1maXgt
bnBzX3RpbWVyX2luaXQtcmV0dXJuLXZhbHVlLzIwMTYwNjE0LTA0NDMyNSYjMzk7IGludG8gZGV2
ZWwtc3BvdC0yMDE2MDYxNDA1MDk8YnI+CiZndDsgZ2l0IGJpc2VjdMKgIGJhZCBkYzhiOWNiMzdl
YmJiYTcyYWE4MjQ4NDBlOWI0MjY2ZjBiZWJmOGJlwqAgIyAwOTozOcKgIMKgIMKgIDAtwqAgwqAg
wqAyMsKgIE1lcmdlICYjMzk7a2Vlcy94ODYvdWFjY2VzcyYjMzk7IGludG8gZGV2ZWwtc3BvdC0y
MDE2MDYxNDA1MDk8YnI+CiZndDsgZ2l0IGJpc2VjdCBnb29kIDY0NmVhZWVlNjRhY2YzODU2NmJi
Y2U0ZTgxMmNmNjZmNzk4YjgxM2PCoCAjIDA5OjQ3wqAgwqAgwqAyMivCoCDCoCDCoCAxwqAgeDg2
L2R1bXBzdGFjazogSWYgYWRkcl9saW1pdCBpcyBub24tZGVmYXVsdCwgZGlzcGxheSBpdDxicj4K
Jmd0OyBnaXQgYmlzZWN0IGdvb2QgMDM5MGZlYzJjZDVkY2UzZjgxM2Y1NzUyZmU1MTUzOGFhYTk0
Y2UxNMKgICMgMTA6MDHCoCDCoCDCoDIyK8KgIMKgIMKgIDDCoCB4ODYvdWFjY2VzczogRG9uJiMz
OTt0IGZpeCB1cCBVU0VSX0RTIHVhY2Nlc3MgZmF1bHRzIHRvIGtlcm5lbCBhZGRyZXNzZXM8YnI+
CiZndDsgZ2l0IGJpc2VjdMKgIGJhZCA2Y2U1MmQ1MzVlMWFkY2ZiNDRmZmQ5ZTU1MDMwODE4MDVk
MzNhYTg3wqAgIyAxMDowNsKgIMKgIMKgIDAtwqAgwqAgwqAgNMKgIHg4Ni91YWNjZXNzOiBPT1BT
IG9yIHdhcm4gb24gYSBmYXVsdCB3aXRoIEtFUk5FTF9EUyBhbmQgIXBhZ2VmYXVsdF9kaXNhYmxl
ZCgpPGJyPgomZ3Q7ICMgZmlyc3QgYmFkIGNvbW1pdDogWzZjZTUyZDUzNWUxYWRjZmI0NGZmZDll
NTUwMzA4MTgwNWQzM2FhODddIHg4Ni91YWNjZXNzOiBPT1BTIG9yIHdhcm4gb24gYSBmYXVsdCB3
aXRoIEtFUk5FTF9EUyBhbmQgIXBhZ2VmYXVsdF9kaXNhYmxlZCgpPGJyPgomZ3Q7IGdpdCBiaXNl
Y3QgZ29vZCAwMzkwZmVjMmNkNWRjZTNmODEzZjU3NTJmZTUxNTM4YWFhOTRjZTE0wqAgIyAxMDow
OMKgIMKgIMKgNjMrwqAgwqAgwqAgMMKgIHg4Ni91YWNjZXNzOiBEb24mIzM5O3QgZml4IHVwIFVT
RVJfRFMgdWFjY2VzcyBmYXVsdHMgdG8ga2VybmVsIGFkZHJlc3Nlczxicj4KJmd0OyAjIGV4dHJh
IHRlc3RzIHdpdGggQ09ORklHX0RFQlVHX0lORk9fUkVEVUNFRDxicj4KJmd0OyBnaXQgYmlzZWN0
wqAgYmFkIDZjZTUyZDUzNWUxYWRjZmI0NGZmZDllNTUwMzA4MTgwNWQzM2FhODfCoCAjIDEwOjE5
wqAgwqAgwqAgMC3CoCDCoCDCoDY2wqAgeDg2L3VhY2Nlc3M6IE9PUFMgb3Igd2FybiBvbiBhIGZh
dWx0IHdpdGggS0VSTkVMX0RTIGFuZCAhcGFnZWZhdWx0X2Rpc2FibGVkKCk8YnI+CiZndDsgIyBl
eHRyYSB0ZXN0cyBvbiBIRUFEIG9mIGxpbnV4LWRldmVsL2RldmVsLXNwb3QtMjAxNjA2MTQwNTA5
PGJyPgomZ3Q7IGdpdCBiaXNlY3TCoCBiYWQgOTAwYmY1Y2U3Mjc3OWYyYzIxNGExMWFlOTJjOThj
MjVkOGY1NTJmYcKgICMgMTA6MTnCoCDCoCDCoCAwLcKgIMKgIMKgMjHCoCAwZGF5IGhlYWQgZ3Vh
cmQgZm9yICYjMzk7ZGV2ZWwtc3BvdC0yMDE2MDYxNDA1MDkmIzM5Ozxicj4KJmd0OyAjIGV4dHJh
IHRlc3RzIG9uIHRyZWUvYnJhbmNoIGtlZXMveDg2L3VhY2Nlc3M8YnI+CiZndDsgZ2l0IGJpc2Vj
dMKgIGJhZCA2Y2U1MmQ1MzVlMWFkY2ZiNDRmZmQ5ZTU1MDMwODE4MDVkMzNhYTg3wqAgIyAxMDoy
MMKgIMKgIMKgIDAtwqAgwqAgwqAyNsKgIHg4Ni91YWNjZXNzOiBPT1BTIG9yIHdhcm4gb24gYSBm
YXVsdCB3aXRoIEtFUk5FTF9EUyBhbmQgIXBhZ2VmYXVsdF9kaXNhYmxlZCgpPGJyPgomZ3Q7ICMg
ZXh0cmEgdGVzdHMgd2l0aCBmaXJzdCBiYWQgY29tbWl0IHJldmVydGVkPGJyPgomZ3Q7IGdpdCBi
aXNlY3QgZ29vZCBmYTBkOWE0ODc3MDRjNzgxYTAwNzI2ZjY0MDVmMzUxMDM5NzdjM2Y0wqAgIyAx
MDozMMKgIMKgIMKgNjYrwqAgwqAgwqAgMMKgIFJldmVydCAmcXVvdDt4ODYvdWFjY2VzczogT09Q
UyBvciB3YXJuIG9uIGEgZmF1bHQgd2l0aCBLRVJORUxfRFMgYW5kICFwYWdlZmF1bHRfZGlzYWJs
ZWQoKSZxdW90Ozxicj4KJmd0OyAjIGV4dHJhIHRlc3RzIG9uIHRyZWUvYnJhbmNoIGxpbnVzL21h
c3Rlcjxicj4KJmd0OyBnaXQgYmlzZWN0IGdvb2QgNWVkYjU2NDkxZDQ4MTJjNDIxNzU5ODA3NTlk
YTUzMzg4ZTVkODZmNcKgICMgMTA6MzPCoCDCoCDCoDY2K8KgIMKgIMKgMTnCoCBMaW51eCA0Ljct
cmMzPGJyPgomZ3Q7ICMgZXh0cmEgdGVzdHMgb24gdHJlZS9icmFuY2ggbGludXgtbmV4dC9tYXN0
ZXI8YnI+CiZndDsgZ2l0IGJpc2VjdCBnb29kIDhmNjAyN2Y3ZTgwOGVkN2MxZmQ4YzhkMzdmYzdh
NTA3NmM2ODNjNGbCoCAjIDExOjM0wqAgwqAgwqA2MCvCoCDCoCDCoCAwwqAgQWRkIGxpbnV4LW5l
eHQgc3BlY2lmaWMgZmlsZXMgZm9yIDIwMTYwNjA5PGJyPgomZ3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7
IFRoaXMgc2NyaXB0IG1heSByZXByb2R1Y2UgdGhlIGVycm9yLjxicj4KJmd0Ozxicj4KJmd0OyAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tPGJyPgomZ3Q7ICMhL2Jpbi9iYXNoPGJyPgomZ3Q7PGJyPgomZ3Q7
IGtlcm5lbD0kMTxicj4KJmd0Ozxicj4KJmd0OyBrdm09KDxicj4KJmd0OyDCoCDCoCDCoCDCoCBx
ZW11LXN5c3RlbS14ODZfNjQ8YnI+CiZndDsgwqAgwqAgwqAgwqAgLWVuYWJsZS1rdm08YnI+CiZn
dDsgwqAgwqAgwqAgwqAgLWNwdSBrdm02NDxicj4KJmd0OyDCoCDCoCDCoCDCoCAta2VybmVsICRr
ZXJuZWw8YnI+CiZndDsgwqAgwqAgwqAgwqAgLW0gMzAwPGJyPgomZ3Q7IMKgIMKgIMKgIMKgIC1z
bXAgMjxicj4KJmd0OyDCoCDCoCDCoCDCoCAtZGV2aWNlIGUxMDAwLG5ldGRldj1uZXQwPGJyPgom
Z3Q7IMKgIMKgIMKgIMKgIC1uZXRkZXYgdXNlcixpZD1uZXQwPGJyPgomZ3Q7IMKgIMKgIMKgIMKg
IC1ib290IG9yZGVyPW5jPGJyPgomZ3Q7IMKgIMKgIMKgIMKgIC1uby1yZWJvb3Q8YnI+CiZndDsg
wqAgwqAgwqAgwqAgLXdhdGNoZG9nIGk2MzAwZXNiPGJyPgomZ3Q7IMKgIMKgIMKgIMKgIC1ydGMg
YmFzZT1sb2NhbHRpbWU8YnI+CiZndDsgwqAgwqAgwqAgwqAgLXNlcmlhbCBzdGRpbzxicj4KJmd0
OyDCoCDCoCDCoCDCoCAtZGlzcGxheSBub25lPGJyPgomZ3Q7IMKgIMKgIMKgIMKgIC1tb25pdG9y
IG51bGw8YnI+CiZndDsgKTxicj4KJmd0Ozxicj4KJmd0OyBhcHBlbmQ9KDxicj4KJmd0OyDCoCDC
oCDCoCDCoCBodW5nX3Rhc2tfcGFuaWM9MTxicj4KJmd0OyDCoCDCoCDCoCDCoCBlYXJseXByaW50
az10dHlTMCwxMTUyMDA8YnI+CiZndDsgwqAgwqAgwqAgwqAgc3lzdGVtZC5sb2dfbGV2ZWw9ZXJy
PGJyPgomZ3Q7IMKgIMKgIMKgIMKgIGRlYnVnPGJyPgomZ3Q7IMKgIMKgIMKgIMKgIGFwaWM9ZGVi
dWc8YnI+CiZndDsgwqAgwqAgwqAgwqAgc3lzcnFfYWx3YXlzX2VuYWJsZWQ8YnI+CiZndDsgwqAg
wqAgwqAgwqAgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMDxicj4KJmd0OyDCoCDC
oCDCoCDCoCBwYW5pYz0tMTxicj4KJmd0OyDCoCDCoCDCoCDCoCBzb2Z0bG9ja3VwX3BhbmljPTE8
YnI+CiZndDsgwqAgwqAgwqAgwqAgbm1pX3dhdGNoZG9nPXBhbmljPGJyPgomZ3Q7IMKgIMKgIMKg
IMKgIG9vcHM9cGFuaWM8YnI+CiZndDsgwqAgwqAgwqAgwqAgbG9hZF9yYW1kaXNrPTI8YnI+CiZn
dDsgwqAgwqAgwqAgwqAgcHJvbXB0X3JhbWRpc2s9MDxicj4KJmd0OyDCoCDCoCDCoCDCoCBjb25z
b2xlPXR0eVMwLDExNTIwMDxicj4KJmd0OyDCoCDCoCDCoCDCoCBjb25zb2xlPXR0eTA8YnI+CiZn
dDsgwqAgwqAgwqAgwqAgdmdhPW5vcm1hbDxicj4KJmd0OyDCoCDCoCDCoCDCoCByb290PS9kZXYv
cmFtMDxicj4KJmd0OyDCoCDCoCDCoCDCoCBydzxicj4KJmd0OyDCoCDCoCDCoCDCoCBkcmJkLm1p
bm9yX2NvdW50PTg8YnI+CiZndDsgKTxicj4KJmd0Ozxicj4KJmd0OyAmcXVvdDske2t2bVtAXX0m
cXVvdDsgLS1hcHBlbmQgJnF1b3Q7JHthcHBlbmRbKl19JnF1b3Q7PGJyPgomZ3Q7IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS08YnI+CiZndDs8YnI+CiZndDsgLS0tPGJyPgomZ3Q7IDAtREFZIGtlcm5lbCB0
ZXN0IGluZnJhc3RydWN0dXJlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgT3BlbiBTb3VyY2UgVGVj
aG5vbG9neSBDZW50ZXI8YnI+CiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvcGlw
ZXJtYWlsL2xrcCI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL2xrcDwvYT7CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBJbnRlbCBDb3Jwb3JhdGlvbjxicj4KPC9w
Pgo=

--===============3204206466168515776==--

