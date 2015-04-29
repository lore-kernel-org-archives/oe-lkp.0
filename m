Content-Type: multipart/mixed; boundary="===============2550201018846507571=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [mm/meminit] PANIC: early exception 06 rip 10:ffffffff811bfa9a error 0 cr2 ffff88000fbff000
Date: Wed, 29 Apr 2015 21:28:17 +0800
Message-ID: <20150429132817.GA10479@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2550201018846507571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Greetings,

0day kernel testing robot got the below dmesg and the first bad commit is

git://git.kernel.org/pub/scm/linux/kernel/git/mel/linux-balancenuma mm-defe=
rred-meminit-v6r1

commit 285c36ab5b3e59865a0f4d79f4c1758455e684f7
Author:     Mel Gorman <mgorman@suse.de>
AuthorDate: Mon Sep 29 14:54:01 2014 +0100
Commit:     Mel Gorman <mgorman@suse.de>
CommitDate: Wed Apr 22 19:48:15 2015 +0100

    mm: meminit: Reduce number of times pageblocks are set during struct pa=
ge init
    =

    During parallel sturct page initialisation, ranges are checked for every
    PFN unnecessarily which increases boot times. This patch alters when the
    ranges are checked.
    =

    Signed-off-by: Mel Gorman <mgorman@suse.de>

+------------------------------------------------+------------+------------=
+------------+
|                                                | 47391c7fae | 285c36ab5b =
| 87531bc9b8 |
+------------------------------------------------+------------+------------=
+------------+
| boot_successes                                 | 80         | 0          =
| 0          |
| boot_failures                                  | 2          | 20         =
| 12         |
| IP-Config:Auto-configuration_of_network_failed | 2          |            =
|            |
| PANIC:early_exception                          | 0          | 20         =
| 12         |
| BUG:kernel_boot_hang                           | 0          | 20         =
| 12         |
| backtrace:set_pageblock_migratetype            | 0          | 20         =
| 12         |
| backtrace:memmap_init_zone                     | 0          | 20         =
| 12         |
| backtrace:free_area_init_node                  | 0          | 20         =
| 12         |
| backtrace:free_area_init_nodes                 | 0          | 20         =
| 12         |
| backtrace:zone_sizes_init                      | 0          | 20         =
| 12         |
| backtrace:paging_init                          | 0          | 20         =
| 12         |
+------------------------------------------------+------------+------------=
+------------+

[    0.000000] page:ffffea0000040000 count:0 mapcount:1 mapping:          (=
null) index:0x0
[    0.000000] flags: 0x0()
[    0.000000] page dumped because: VM_BUG_ON_PAGE(!zone_spans_pfn(zone, pf=
n))
PANIC: early exception 06 rip 10:ffffffff811bfa9a error 0 cr2 ffff88000fbff=
000
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.0.0-00012-g285c36a=
 #5
[    0.000000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[    0.000000]  0000000000000002 ffffffff82003c40 ffffffff81937569 00000000=
000003f8
[    0.000000]  ffffea0000040000 ffffffff82003d08 ffffffff821ca1b0 5f4e4f5f=
4755425f
[    0.000000]  0000000000000001 0000000000000000 0000000000000001 00000000=
00000001
[    0.000000] Call Trace:
[    0.000000]  [<ffffffff81937569>] dump_stack+0x4c/0x65
[    0.000000]  [<ffffffff821ca1b0>] early_idt_handler+0x90/0xb7
[    0.000000]  [<ffffffff811bfa9a>] ? set_pfnblock_flags_mask+0x12a/0x130
[    0.000000]  [<ffffffff811bfa9a>] ? set_pfnblock_flags_mask+0x12a/0x130
[    0.000000]  [<ffffffff811bfb0f>] set_pageblock_migratetype+0x6f/0x80
[    0.000000]  [<ffffffff82222386>] memmap_init_zone+0x97/0x160
[    0.000000]  [<ffffffff82222826>] free_area_init_node+0x3d7/0x3fe
[    0.000000]  [<ffffffff821ecc4f>] free_area_init_nodes+0x586/0x603
[    0.000000]  [<ffffffff821dd96d>] zone_sizes_init+0x50/0x52
[    0.000000]  [<ffffffff821dde05>] paging_init+0x28/0x2a
[    0.000000]  [<ffffffff821ce73c>] setup_arch+0x84b/0x8f8
[    0.000000]  [<ffffffff821ca120>] ? early_idt_handlers+0x120/0x120
[    0.000000]  [<ffffffff821cabb9>] start_kernel+0xa5/0x4c0
[    0.000000]  [<ffffffff821ca120>] ? early_idt_handlers+0x120/0x120
[    0.000000]  [<ffffffff821ca4b3>] x86_64_start_reservations+0x2a/0x2c
[    0.000000]  [<ffffffff821ca602>] x86_64_start_kernel+0x14d/0x15c
[    0.000000] RIP 0x1

BUG: kernel boot hang
Elapsed time: 305
qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap -kernel /kernel/x86=
_64-randconfig-ib0-04102124/285c36ab5b3e59865a0f4d79f4c1758455e684f7/vmlinu=
z-4.0.0-00012-g285c36a -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,115=
200 rd.udev.log-priority=3Derr systemd.log_target=3Djournal systemd.log_lev=
el=3Dwarning debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall=
_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3D=
panic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3D=
tty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests/run-queue/kvm/x=
86_64-randconfig-ib0-04102124/linux-devel:devel-lkp-ib04-smoke-201504230337=
:285c36ab5b3e59865a0f4d79f4c1758455e684f7:bisect-linux/.vmlinuz-285c36ab5b3=
e59865a0f4d79f4c1758455e684f7-20150428075714-16-kbuild branch=3Dlinux-devel=
/devel-lkp-ib04-smoke-201504230337 BOOT_IMAGE=3D/kernel/x86_64-randconfig-i=
b0-04102124/285c36ab5b3e59865a0f4d79f4c1758455e684f7/vmlinuz-4.0.0-00012-g2=
85c36a drbd.minor_count=3D8'  -initrd /kernel-tests/initrd/yocto-minimal-x8=
6_64.cgz -m 256 -smp 1 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -=
boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive =
file=3D/fs/sdd1/disk0-yocto-kbuild-1,media=3Ddisk,if=3Dvirtio -drive file=
=3D/fs/sdd1/disk1-yocto-kbuild-1,media=3Ddisk,if=3Dvirtio -drive file=3D/fs=
/sdd1/disk2-yocto-kbuild-1,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdd1/=
disk3-yocto-kbuild-1,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdd1/disk4-=
yocto-kbuild-1,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdd1/disk5-yocto-=
kbuild-1,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdd1/disk6-yocto-kbuild=
-1,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-yocto-kbuild-1 -ser=
ial file:/dev/shm/kboot/serial-yocto-kbuild-1 -daemonize -display none -mon=
itor null =


git bisect start 87531bc9b8e14e27cafc72113e23a3dd8e329599 39a8804455fb23f09=
157341d3ba7db6d7ae6ee76 --
git bisect good ea9ffe871553dced04d763bf2c9495e9ff1aac94  # 03:50     20+  =
    2  Merge 'x86-mpx/mpx-v20' into devel-lkp-ib04-smoke-201504230337
git bisect  bad 89182f2be5924cad5707d8210c574c6857d4140c  # 04:07      0-  =
    3  Merge 'balancenuma/mm-deferred-meminit-v6r1' into devel-lkp-ib04-smo=
ke-201504230337
git bisect good 3a7731f195d77f95fa36918225bcd5823944923a  # 06:58     20+  =
    1  mm: meminit: Only a subset of struct pages if CONFIG_DEFERRED_STRUCT=
_PAGE_INIT is set
git bisect good 13c2e6e0490b55f5e2bda3a0461d112eade2d87a  # 07:51     20+  =
    0  x86: mm: Enable deferred struct page initialisation on x86-64
git bisect  bad 285c36ab5b3e59865a0f4d79f4c1758455e684f7  # 08:03      0-  =
    2  mm: meminit: Reduce number of times pageblocks are set during struct=
 page init
git bisect good 47391c7fae3df9cb332311c9fdd27917784496c5  # 09:05     20+  =
    2  mm: meminit: Free pages in large chunks where possible
# first bad commit: [285c36ab5b3e59865a0f4d79f4c1758455e684f7] mm: meminit:=
 Reduce number of times pageblocks are set during struct page init
git bisect good 47391c7fae3df9cb332311c9fdd27917784496c5  # 12:37     60+  =
    2  mm: meminit: Free pages in large chunks where possible
# extra tests with DEBUG_INFO
# extra tests on HEAD of linux-devel/devel-lkp-ib04-smoke-201504230337
git bisect  bad 87531bc9b8e14e27cafc72113e23a3dd8e329599  # 13:33      0-  =
   12  0day head guard for 'devel-lkp-ib04-smoke-201504230337'
# extra tests on tree/branch balancenuma/mm-deferred-meminit-v6r1
git bisect  bad 00f83fc5a6488216e3eabdb8fb34f72177c89beb  # 15:12      0-  =
    1  mm: meminit: Remove mminit_verify_page_links
# extra tests with first bad commit reverted
# extra tests on tree/branch linus/master
git bisect good 2decb2682f80759f631c8332f9a2a34a02150a03  # 23:44     60+  =
    0  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
# extra tests on tree/branch next/master
git bisect good 63382678150626a85e694031769496d58245d430  # 02:20     60+  =
    0  Add linux-next specific files for 20150428


This script may reproduce the error.

----------------------------------------------------------------------------
#!/bin/bash

kernel=3D$1

kvm=3D(
	qemu-system-x86_64
	-enable-kvm
	-cpu Haswell,+smep,+smap
	-kernel $kernel
	-m 256
	-smp 1
	-device e1000,netdev=3Dnet0
	-netdev user,id=3Dnet0
	-boot order=3Dnc
	-no-reboot
	-watchdog i6300esb
	-rtc base=3Dlocaltime
	-serial stdio
	-display none
	-monitor null =

)

append=3D(
	hung_task_panic=3D1
	earlyprintk=3DttyS0,115200
	rd.udev.log-priority=3Derr
	systemd.log_target=3Djournal
	systemd.log_level=3Dwarning
	debug
	apic=3Ddebug
	sysrq_always_enabled
	rcupdate.rcu_cpu_stall_timeout=3D100
	panic=3D-1
	softlockup_panic=3D1
	nmi_watchdog=3Dpanic
	oops=3Dpanic
	load_ramdisk=3D2
	prompt_ramdisk=3D0
	console=3DttyS0,115200
	console=3Dtty0
	vga=3Dnormal
	root=3D/dev/ram0
	rw
	drbd.minor_count=3D8
)

"${kvm[@]}" --append "${append[*]}"
----------------------------------------------------------------------------

Thanks,
Fengguang

--===============2550201018846507571==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="4.0.0-00012-g285c36a5"

ZWFybHkgY29uc29sZSBpbiBzZXR1cCBjb2RlCmVhcmx5IGNvbnNvbGUgaW4gZGVjb21wcmVzc19r
ZXJuZWwKCkRlY29tcHJlc3NpbmcgTGludXguLi4gUGFyc2luZyBFTEYuLi4gZG9uZS4KQm9vdGlu
ZyB0aGUga2VybmVsLgpbICAgIDAuMDAwMDAwXSBJbml0aWFsaXppbmcgY2dyb3VwIHN1YnN5cyBj
cHUKWyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA0LjAuMC0wMDAxMi1nMjg1YzM2YSAoa2J1
aWxkQGxrcC1pYjA0KSAoZ2NjIHZlcnNpb24gNC45LjIgKERlYmlhbiA0LjkuMi0xMCkgKSAjNSBT
TVAgVHVlIEFwciAyOCAwNzo1NTo1MSBDU1QgMjAxNQpbICAgIDAuMDAwMDAwXSBDb21tYW5kIGxp
bmU6IGh1bmdfdGFza19wYW5pYz0xIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCByZC51ZGV2Lmxv
Zy1wcmlvcml0eT1lcnIgc3lzdGVtZC5sb2dfdGFyZ2V0PWpvdXJuYWwgc3lzdGVtZC5sb2dfbGV2
ZWw9d2FybmluZyBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRl
LnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5t
aV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNr
PTAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwgIHJvb3Q9L2Rl
di9yYW0wIHJ3IGxpbms9L2tidWlsZC10ZXN0cy9ydW4tcXVldWUva3ZtL3g4Nl82NC1yYW5kY29u
ZmlnLWliMC0wNDEwMjEyNC9saW51eC1kZXZlbDpkZXZlbC1sa3AtaWIwNC1zbW9rZS0yMDE1MDQy
MzAzMzc6Mjg1YzM2YWI1YjNlNTk4NjVhMGY0ZDc5ZjRjMTc1ODQ1NWU2ODRmNzpiaXNlY3QtbGlu
dXgvLnZtbGludXotMjg1YzM2YWI1YjNlNTk4NjVhMGY0ZDc5ZjRjMTc1ODQ1NWU2ODRmNy0yMDE1
MDQyODA3NTcxNC0xNi1rYnVpbGQgYnJhbmNoPWxpbnV4LWRldmVsL2RldmVsLWxrcC1pYjA0LXNt
b2tlLTIwMTUwNDIzMDMzNyBCT09UX0lNQUdFPS9rZXJuZWwveDg2XzY0LXJhbmRjb25maWctaWIw
LTA0MTAyMTI0LzI4NWMzNmFiNWIzZTU5ODY1YTBmNGQ3OWY0YzE3NTg0NTVlNjg0Zjcvdm1saW51
ei00LjAuMC0wMDAxMi1nMjg1YzM2YSBkcmJkLm1pbm9yX2NvdW50PTgKWyAgICAwLjAwMDAwMF0g
ZTgyMDogQklPUy1wcm92aWRlZCBwaHlzaWNhbCBSQU0gbWFwOgpbICAgIDAuMDAwMDAwXSBCSU9T
LWU4MjA6IFttZW0gMHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAwMDAwMDAwMDA5ZmJmZl0gdXNhYmxl
ClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwOWZjMDAtMHgwMDAw
MDAwMDAwMDlmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgw
MDAwMDAwMDAwMGYwMDAwLTB4MDAwMDAwMDAwMDBmZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAw
MF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDAwMDEwMDAwMC0weDAwMDAwMDAwMGZmZGZmZmZd
IHVzYWJsZQpbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMDBmZmUwMDAw
LTB4MDAwMDAwMDAwZmZmZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBb
bWVtIDB4MDAwMDAwMDBmZWZmYzAwMC0weDAwMDAwMDAwZmVmZmZmZmZdIHJlc2VydmVkClsgICAg
MC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwZmZmYzAwMDAtMHgwMDAwMDAwMGZm
ZmZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBib290Y29uc29sZSBbZWFybHlzZXIwXSBl
bmFibGVkClsgICAgMC4wMDAwMDBdIE5YIChFeGVjdXRlIERpc2FibGUpIHByb3RlY3Rpb246IGFj
dGl2ZQpbICAgIDAuMDAwMDAwXSBTTUJJT1MgMi44IHByZXNlbnQuClsgICAgMC4wMDAwMDBdIERN
STogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgMS43LjUtMjAx
NDA1MzFfMDgzMDMwLWdhbmRhbGYgMDQvMDEvMjAxNApbICAgIDAuMDAwMDAwXSBIeXBlcnZpc29y
IGRldGVjdGVkOiBLVk0KWyAgICAwLjAwMDAwMF0gZTgyMDogdXBkYXRlIFttZW0gMHgwMDAwMDAw
MC0weDAwMDAwZmZmXSB1c2FibGUgPT0+IHJlc2VydmVkClsgICAgMC4wMDAwMDBdIGU4MjA6IHJl
bW92ZSBbbWVtIDB4MDAwYTAwMDAtMHgwMDBmZmZmZl0gdXNhYmxlClsgICAgMC4wMDAwMDBdIEFH
UDogTm8gQUdQIGJyaWRnZSBmb3VuZApbICAgIDAuMDAwMDAwXSBlODIwOiBsYXN0X3BmbiA9IDB4
ZmZlMCBtYXhfYXJjaF9wZm4gPSAweDQwMDAwMDAwMApbICAgIDAuMDAwMDAwXSBTY2FuIGZvciBT
TVAgaW4gW21lbSAweDAwMDAwMDAwLTB4MDAwMDAzZmZdClsgICAgMC4wMDAwMDBdIFNjYW4gZm9y
IFNNUCBpbiBbbWVtIDB4MDAwOWZjMDAtMHgwMDA5ZmZmZl0KWyAgICAwLjAwMDAwMF0gU2NhbiBm
b3IgU01QIGluIFttZW0gMHgwMDBmMDAwMC0weDAwMGZmZmZmXQpbICAgIDAuMDAwMDAwXSBmb3Vu
ZCBTTVAgTVAtdGFibGUgYXQgW21lbSAweDAwMGYwZTkwLTB4MDAwZjBlOWZdIG1hcHBlZCBhdCBb
ZmZmZjg4MDAwMDBmMGU5MF0KWyAgICAwLjAwMDAwMF0gICBtcGM6IGYwZWEwLWYwZmE4ClsgICAg
MC4wMDAwMDBdIEJhc2UgbWVtb3J5IHRyYW1wb2xpbmUgYXQgW2ZmZmY4ODAwMDAwOTkwMDBdIDk5
MDAwIHNpemUgMjQ1NzYKWyAgICAwLjAwMDAwMF0gaW5pdF9tZW1vcnlfbWFwcGluZzogW21lbSAw
eDAwMDAwMDAwLTB4MDAwZmZmZmZdClsgICAgMC4wMDAwMDBdICBbbWVtIDB4MDAwMDAwMDAtMHgw
MDBmZmZmZl0gcGFnZSA0awpbICAgIDAuMDAwMDAwXSBCUksgWzB4MDMxYWIwMDAsIDB4MDMxYWJm
ZmZdIFBHVEFCTEUKWyAgICAwLjAwMDAwMF0gQlJLIFsweDAzMWFjMDAwLCAweDAzMWFjZmZmXSBQ
R1RBQkxFClsgICAgMC4wMDAwMDBdIEJSSyBbMHgwMzFhZDAwMCwgMHgwMzFhZGZmZl0gUEdUQUJM
RQpbICAgIDAuMDAwMDAwXSBpbml0X21lbW9yeV9tYXBwaW5nOiBbbWVtIDB4MGZhMDAwMDAtMHgw
ZmJmZmZmZl0KWyAgICAwLjAwMDAwMF0gIFttZW0gMHgwZmEwMDAwMC0weDBmYmZmZmZmXSBwYWdl
IDRrClsgICAgMC4wMDAwMDBdIEJSSyBbMHgwMzFhZTAwMCwgMHgwMzFhZWZmZl0gUEdUQUJMRQpb
ICAgIDAuMDAwMDAwXSBpbml0X21lbW9yeV9tYXBwaW5nOiBbbWVtIDB4MDAxMDAwMDAtMHgwZjlm
ZmZmZl0KWyAgICAwLjAwMDAwMF0gIFttZW0gMHgwMDEwMDAwMC0weDBmOWZmZmZmXSBwYWdlIDRr
ClsgICAgMC4wMDAwMDBdIGluaXRfbWVtb3J5X21hcHBpbmc6IFttZW0gMHgwZmMwMDAwMC0weDBm
ZmRmZmZmXQpbICAgIDAuMDAwMDAwXSAgW21lbSAweDBmYzAwMDAwLTB4MGZmZGZmZmZdIHBhZ2Ug
NGsKWyAgICAwLjAwMDAwMF0gQlJLIFsweDAzMWFmMDAwLCAweDAzMWFmZmZmXSBQR1RBQkxFClsg
ICAgMC4wMDAwMDBdIEJSSyBbMHgwMzFiMDAwMCwgMHgwMzFiMGZmZl0gUEdUQUJMRQpbICAgIDAu
MDAwMDAwXSBSQU1ESVNLOiBbbWVtIDB4MGZjY2UwMDAtMHgwZmZkN2ZmZl0KWyAgICAwLjAwMDAw
MF0gQUNQSTogRWFybHkgdGFibGUgY2hlY2tzdW0gdmVyaWZpY2F0aW9uIGRpc2FibGVkClsgICAg
MC4wMDAwMDBdIEFDUEk6IFJTRFAgMHgwMDAwMDAwMDAwMEYwQ0IwIDAwMDAxNCAodjAwIEJPQ0hT
ICkKWyAgICAwLjAwMDAwMF0gQUNQSTogUlNEVCAweDAwMDAwMDAwMEZGRTE4NTQgMDAwMDM0ICh2
MDEgQk9DSFMgIEJYUENSU0RUIDAwMDAwMDAxIEJYUEMgMDAwMDAwMDEpClsgICAgMC4wMDAwMDBd
IEFDUEk6IEZBQ1AgMHgwMDAwMDAwMDBGRkUwQjM3IDAwMDA3NCAodjAxIEJPQ0hTICBCWFBDRkFD
UCAwMDAwMDAwMSBCWFBDIDAwMDAwMDAxKQpbICAgIDAuMDAwMDAwXSBBQ1BJOiBEU0RUIDB4MDAw
MDAwMDAwRkZFMDA0MCAwMDBBRjcgKHYwMSBCT0NIUyAgQlhQQ0RTRFQgMDAwMDAwMDEgQlhQQyAw
MDAwMDAwMSkKWyAgICAwLjAwMDAwMF0gQUNQSTogRkFDUyAweDAwMDAwMDAwMEZGRTAwMDAgMDAw
MDQwClsgICAgMC4wMDAwMDBdIEFDUEk6IFNTRFQgMHgwMDAwMDAwMDBGRkUwQkFCIDAwMEJGOSAo
djAxIEJPQ0hTICBCWFBDU1NEVCAwMDAwMDAwMSBCWFBDIDAwMDAwMDAxKQpbICAgIDAuMDAwMDAw
XSBBQ1BJOiBBUElDIDB4MDAwMDAwMDAwRkZFMTdBNCAwMDAwNzggKHYwMSBCT0NIUyAgQlhQQ0FQ
SUMgMDAwMDAwMDEgQlhQQyAwMDAwMDAwMSkKWyAgICAwLjAwMDAwMF0gQUNQSTogSFBFVCAweDAw
MDAwMDAwMEZGRTE4MUMgMDAwMDM4ICh2MDEgQk9DSFMgIEJYUENIUEVUIDAwMDAwMDAxIEJYUEMg
MDAwMDAwMDEpClsgICAgMC4wMDAwMDBdIEFDUEk6IExvY2FsIEFQSUMgYWRkcmVzcyAweGZlZTAw
MDAwClsgICAgMC4wMDAwMDBdIG1hcHBlZCBBUElDIHRvIGZmZmZmZmZmZmY1ZmMwMDAgKCAgICAg
ICAgZmVlMDAwMDApClsgICAgMC4wMDAwMDBdIE5vIE5VTUEgY29uZmlndXJhdGlvbiBmb3VuZApb
ICAgIDAuMDAwMDAwXSBGYWtpbmcgYSBub2RlIGF0IFttZW0gMHgwMDAwMDAwMDAwMDAwMDAwLTB4
MDAwMDAwMDAwZmZkZmZmZl0KWyAgICAwLjAwMDAwMF0gTk9ERV9EQVRBKDApIGFsbG9jYXRlZCBb
bWVtIDB4MGZmZGIwMDAtMHgwZmZkZmZmZl0KWyAgICAwLjAwMDAwMF0gY21hOiBkbWFfY29udGln
dW91c19yZXNlcnZlKGxpbWl0IDBmZmUwMDAwKQpbICAgIDAuMDAwMDAwXSBrdm0tY2xvY2s6IFVz
aW5nIG1zcnMgNGI1NjRkMDEgYW5kIDRiNTY0ZDAwClsgICAgMC4wMDAwMDBdIGt2bS1jbG9jazog
Y3B1IDAsIG1zciAwOmZmZGEwMDEsIHByaW1hcnkgY3B1IGNsb2NrClsgICAgMC4wMDAwMDBdICBb
ZmZmZmVhMDAwMDAwMDAwMC1mZmZmZWEwMDAwM2ZmZmZmXSBQTUQgLT4gW2ZmZmY4ODAwMGVlMDAw
MDAtZmZmZjg4MDAwZjFmZmZmZl0gb24gbm9kZSAwClsgICAgMC4wMDAwMDBdIFpvbmUgcmFuZ2Vz
OgpbICAgIDAuMDAwMDAwXSAgIERNQSAgICAgIFttZW0gMHgwMDAwMDAwMDAwMDAxMDAwLTB4MDAw
MDAwMDAwMGZmZmZmZl0KWyAgICAwLjAwMDAwMF0gICBETUEzMiAgICBbbWVtIDB4MDAwMDAwMDAw
MTAwMDAwMC0weDAwMDAwMDAwMGZmZGZmZmZdClsgICAgMC4wMDAwMDBdICAgTm9ybWFsICAgZW1w
dHkKWyAgICAwLjAwMDAwMF0gTW92YWJsZSB6b25lIHN0YXJ0IGZvciBlYWNoIG5vZGUKWyAgICAw
LjAwMDAwMF0gRWFybHkgbWVtb3J5IG5vZGUgcmFuZ2VzClsgICAgMC4wMDAwMDBdICAgbm9kZSAg
IDA6IFttZW0gMHgwMDAwMDAwMDAwMDAxMDAwLTB4MDAwMDAwMDAwMDA5ZWZmZl0KWyAgICAwLjAw
MDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwMDAxMDAwMDAtMHgwMDAwMDAwMDBmZmRm
ZmZmXQpbICAgIDAuMDAwMDAwXSBJbml0bWVtIHNldHVwIG5vZGUgMCBbbWVtIDB4MDAwMDAwMDAw
MDAwMTAwMC0weDAwMDAwMDAwMGZmZGZmZmZdClsgICAgMC4wMDAwMDBdIE9uIG5vZGUgMCB0b3Rh
bHBhZ2VzOiA2NTQwNgpbICAgIDAuMDAwMDAwXSAgIERNQSB6b25lOiA2NCBwYWdlcyB1c2VkIGZv
ciBtZW1tYXAKWyAgICAwLjAwMDAwMF0gICBETUEgem9uZTogMjEgcGFnZXMgcmVzZXJ2ZWQKWyAg
ICAwLjAwMDAwMF0gICBETUEgem9uZTogMzk5OCBwYWdlcywgTElGTyBiYXRjaDowClsgICAgMC4w
MDAwMDBdICAgRE1BMzIgem9uZTogOTYwIHBhZ2VzIHVzZWQgZm9yIG1lbW1hcApbICAgIDAuMDAw
MDAwXSAgIERNQTMyIHpvbmU6IDYxNDA4IHBhZ2VzLCBMSUZPIGJhdGNoOjE1ClsgICAgMC4wMDAw
MDBdIHBhZ2U6ZmZmZmVhMDAwMDA0MDAwMCBjb3VudDowIG1hcGNvdW50OjEgbWFwcGluZzogICAg
ICAgICAgKG51bGwpIGluZGV4OjB4MApbICAgIDAuMDAwMDAwXSBmbGFnczogMHgwKCkKWyAgICAw
LjAwMDAwMF0gcGFnZSBkdW1wZWQgYmVjYXVzZTogVk1fQlVHX09OX1BBR0UoIXpvbmVfc3BhbnNf
cGZuKHpvbmUsIHBmbikpClBBTklDOiBlYXJseSBleGNlcHRpb24gMDYgcmlwIDEwOmZmZmZmZmZm
ODExYmZhOWEgZXJyb3IgMCBjcjIgZmZmZjg4MDAwZmJmZjAwMApbICAgIDAuMDAwMDAwXSBDUFU6
IDAgUElEOiAwIENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQgNC4wLjAtMDAwMTItZzI4NWMzNmEg
IzUKWyAgICAwLjAwMDAwMF0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZY
ICsgUElJWCwgMTk5NiksIEJJT1MgMS43LjUtMjAxNDA1MzFfMDgzMDMwLWdhbmRhbGYgMDQvMDEv
MjAxNApbICAgIDAuMDAwMDAwXSAgMDAwMDAwMDAwMDAwMDAwMiBmZmZmZmZmZjgyMDAzYzQwIGZm
ZmZmZmZmODE5Mzc1NjkgMDAwMDAwMDAwMDAwMDNmOApbICAgIDAuMDAwMDAwXSAgZmZmZmVhMDAw
MDA0MDAwMCBmZmZmZmZmZjgyMDAzZDA4IGZmZmZmZmZmODIxY2ExYjAgNWY0ZTRmNWY0NzU1NDI1
ZgpbICAgIDAuMDAwMDAwXSAgMDAwMDAwMDAwMDAwMDAwMSAwMDAwMDAwMDAwMDAwMDAwIDAwMDAw
MDAwMDAwMDAwMDEgMDAwMDAwMDAwMDAwMDAwMQpbICAgIDAuMDAwMDAwXSBDYWxsIFRyYWNlOgpb
ICAgIDAuMDAwMDAwXSAgWzxmZmZmZmZmZjgxOTM3NTY5Pl0gZHVtcF9zdGFjaysweDRjLzB4NjUK
WyAgICAwLjAwMDAwMF0gIFs8ZmZmZmZmZmY4MjFjYTFiMD5dIGVhcmx5X2lkdF9oYW5kbGVyKzB4
OTAvMHhiNwpbICAgIDAuMDAwMDAwXSAgWzxmZmZmZmZmZjgxMWJmYTlhPl0gPyBzZXRfcGZuYmxv
Y2tfZmxhZ3NfbWFzaysweDEyYS8weDEzMApbICAgIDAuMDAwMDAwXSAgWzxmZmZmZmZmZjgxMWJm
YTlhPl0gPyBzZXRfcGZuYmxvY2tfZmxhZ3NfbWFzaysweDEyYS8weDEzMApbICAgIDAuMDAwMDAw
XSAgWzxmZmZmZmZmZjgxMWJmYjBmPl0gc2V0X3BhZ2VibG9ja19taWdyYXRldHlwZSsweDZmLzB4
ODAKWyAgICAwLjAwMDAwMF0gIFs8ZmZmZmZmZmY4MjIyMjM4Nj5dIG1lbW1hcF9pbml0X3pvbmUr
MHg5Ny8weDE2MApbICAgIDAuMDAwMDAwXSAgWzxmZmZmZmZmZjgyMjIyODI2Pl0gZnJlZV9hcmVh
X2luaXRfbm9kZSsweDNkNy8weDNmZQpbICAgIDAuMDAwMDAwXSAgWzxmZmZmZmZmZjgyMWVjYzRm
Pl0gZnJlZV9hcmVhX2luaXRfbm9kZXMrMHg1ODYvMHg2MDMKWyAgICAwLjAwMDAwMF0gIFs8ZmZm
ZmZmZmY4MjFkZDk2ZD5dIHpvbmVfc2l6ZXNfaW5pdCsweDUwLzB4NTIKWyAgICAwLjAwMDAwMF0g
IFs8ZmZmZmZmZmY4MjFkZGUwNT5dIHBhZ2luZ19pbml0KzB4MjgvMHgyYQpbICAgIDAuMDAwMDAw
XSAgWzxmZmZmZmZmZjgyMWNlNzNjPl0gc2V0dXBfYXJjaCsweDg0Yi8weDhmOApbICAgIDAuMDAw
MDAwXSAgWzxmZmZmZmZmZjgyMWNhMTIwPl0gPyBlYXJseV9pZHRfaGFuZGxlcnMrMHgxMjAvMHgx
MjAKWyAgICAwLjAwMDAwMF0gIFs8ZmZmZmZmZmY4MjFjYWJiOT5dIHN0YXJ0X2tlcm5lbCsweGE1
LzB4NGMwClsgICAgMC4wMDAwMDBdICBbPGZmZmZmZmZmODIxY2ExMjA+XSA/IGVhcmx5X2lkdF9o
YW5kbGVycysweDEyMC8weDEyMApbICAgIDAuMDAwMDAwXSAgWzxmZmZmZmZmZjgyMWNhNGIzPl0g
eDg2XzY0X3N0YXJ0X3Jlc2VydmF0aW9ucysweDJhLzB4MmMKWyAgICAwLjAwMDAwMF0gIFs8ZmZm
ZmZmZmY4MjFjYTYwMj5dIHg4Nl82NF9zdGFydF9rZXJuZWwrMHgxNGQvMHgxNWMKWyAgICAwLjAw
MDAwMF0gUklQIDB4MQoKQlVHOiBrZXJuZWwgYm9vdCBoYW5nCkVsYXBzZWQgdGltZTogMzA1CnFl
bXUtc3lzdGVtLXg4Nl82NCAtZW5hYmxlLWt2bSAtY3B1IEhhc3dlbGwsK3NtZXAsK3NtYXAgLWtl
cm5lbCAva2VybmVsL3g4Nl82NC1yYW5kY29uZmlnLWliMC0wNDEwMjEyNC8yODVjMzZhYjViM2U1
OTg2NWEwZjRkNzlmNGMxNzU4NDU1ZTY4NGY3L3ZtbGludXotNC4wLjAtMDAwMTItZzI4NWMzNmEg
LWFwcGVuZCAnaHVuZ190YXNrX3BhbmljPTEgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHJkLnVk
ZXYubG9nLXByaW9yaXR5PWVyciBzeXN0ZW1kLmxvZ190YXJnZXQ9am91cm5hbCBzeXN0ZW1kLmxv
Z19sZXZlbD13YXJuaW5nIGRlYnVnIGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1
cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMCBwYW5pYz0tMSBzb2Z0bG9ja3VwX3Bhbmlj
PTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3Jh
bWRpc2s9MCBjb25zb2xlPXR0eVMwLDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbCAgcm9v
dD0vZGV2L3JhbTAgcncgbGluaz0va2J1aWxkLXRlc3RzL3J1bi1xdWV1ZS9rdm0veDg2XzY0LXJh
bmRjb25maWctaWIwLTA0MTAyMTI0L2xpbnV4LWRldmVsOmRldmVsLWxrcC1pYjA0LXNtb2tlLTIw
MTUwNDIzMDMzNzoyODVjMzZhYjViM2U1OTg2NWEwZjRkNzlmNGMxNzU4NDU1ZTY4NGY3OmJpc2Vj
dC1saW51eC8udm1saW51ei0yODVjMzZhYjViM2U1OTg2NWEwZjRkNzlmNGMxNzU4NDU1ZTY4NGY3
LTIwMTUwNDI4MDc1NzE0LTE2LWtidWlsZCBicmFuY2g9bGludXgtZGV2ZWwvZGV2ZWwtbGtwLWli
MDQtc21va2UtMjAxNTA0MjMwMzM3IEJPT1RfSU1BR0U9L2tlcm5lbC94ODZfNjQtcmFuZGNvbmZp
Zy1pYjAtMDQxMDIxMjQvMjg1YzM2YWI1YjNlNTk4NjVhMGY0ZDc5ZjRjMTc1ODQ1NWU2ODRmNy92
bWxpbnV6LTQuMC4wLTAwMDEyLWcyODVjMzZhIGRyYmQubWlub3JfY291bnQ9OCcgIC1pbml0cmQg
L2tlcm5lbC10ZXN0cy9pbml0cmQveW9jdG8tbWluaW1hbC14ODZfNjQuY2d6IC1tIDI1NiAtc21w
IDEgLWRldmljZSBlMTAwMCxuZXRkZXY9bmV0MCAtbmV0ZGV2IHVzZXIsaWQ9bmV0MCAtYm9vdCBv
cmRlcj1uYyAtbm8tcmVib290IC13YXRjaGRvZyBpNjMwMGVzYiAtcnRjIGJhc2U9bG9jYWx0aW1l
IC1kcml2ZSBmaWxlPS9mcy9zZGQxL2Rpc2swLXlvY3RvLWtidWlsZC0xLG1lZGlhPWRpc2ssaWY9
dmlydGlvIC1kcml2ZSBmaWxlPS9mcy9zZGQxL2Rpc2sxLXlvY3RvLWtidWlsZC0xLG1lZGlhPWRp
c2ssaWY9dmlydGlvIC1kcml2ZSBmaWxlPS9mcy9zZGQxL2Rpc2syLXlvY3RvLWtidWlsZC0xLG1l
ZGlhPWRpc2ssaWY9dmlydGlvIC1kcml2ZSBmaWxlPS9mcy9zZGQxL2Rpc2szLXlvY3RvLWtidWls
ZC0xLG1lZGlhPWRpc2ssaWY9dmlydGlvIC1kcml2ZSBmaWxlPS9mcy9zZGQxL2Rpc2s0LXlvY3Rv
LWtidWlsZC0xLG1lZGlhPWRpc2ssaWY9dmlydGlvIC1kcml2ZSBmaWxlPS9mcy9zZGQxL2Rpc2s1
LXlvY3RvLWtidWlsZC0xLG1lZGlhPWRpc2ssaWY9dmlydGlvIC1kcml2ZSBmaWxlPS9mcy9zZGQx
L2Rpc2s2LXlvY3RvLWtidWlsZC0xLG1lZGlhPWRpc2ssaWY9dmlydGlvIC1waWRmaWxlIC9kZXYv
c2htL2tib290L3BpZC15b2N0by1rYnVpbGQtMSAtc2VyaWFsIGZpbGU6L2Rldi9zaG0va2Jvb3Qv
c2VyaWFsLXlvY3RvLWtidWlsZC0xIC1kYWVtb25pemUgLWRpc3BsYXkgbm9uZSAtbW9uaXRvciBu
dWxsIAo=

--===============2550201018846507571==--

