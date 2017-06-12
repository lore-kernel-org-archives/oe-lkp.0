Content-Type: multipart/mixed; boundary="===============2792569386497763535=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm] 13b9798e1f: kernel_BUG_at_arch/x86/mm/tlb.c
Date: Mon, 12 Jun 2017 08:33:28 -0700
Message-ID: <CALCETrXi4CPjiwKY=ch6K5dH7GdwBYLSKPqr8ZdqnNUhVVxY=w@mail.gmail.com>
In-Reply-To: <20170612070008.GG21477@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2792569386497763535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Jun 12, 2017 12:00 AM, "kernel test robot" <xiaolong.ye@intel.com> wro=
te:


FYI, we noticed the following commit:

commit: 13b9798e1f7b2ce3b0aa22fddfc65d8815ed2b53 ("x86/mm: Try to preserve
old TLB entries using PCID")
git://internal_merge_and_test_tree revert-489426b4a5ab100513e19e866cab13
307e5a7acc-13b9798e1f7b2ce3b0aa22fddfc65d8815ed2b53


This should be fixed in the current version of the branch.


in testcase: boot

on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 2G

caused below changes (please refer to attached dmesg/kmsg for entire
log/backtrace):


+------------------------------------------+------------+------------+
|                                          | cabbcfc0b9 | 13b9798e1f |
+------------------------------------------+------------+------------+
| boot_successes                           | 5          | 2          |
| boot_failures                            | 2          | 4          |
| BUG:kernel_hang_in_test_stage            | 2          |            |
| kernel_BUG_at_arch/x86/mm/tlb.c          | 0          | 4          |
| invalid_opcode:#[##]                     | 0          | 4          |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 4          |
+------------------------------------------+------------+------------+



[  241.361442] kernel BUG at arch/x86/mm/tlb.c:119!
[  241.371003] invalid opcode: 0000 [#1] SMP
[  241.376473] Modules linked in:
[  241.381105] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
4.12.0-rc4-00023-g13b9798 #1
[  241.392130] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.9.3-20161025_171302-gandalf 04/01/2014
[  241.406650] task: ffff880072452f00 task.stack: ffffc9000037c000
[  241.415529] RIP: 0010:switch_mm_irqs_off+0x57/0x2d0
[  241.422658] RSP: 0018:ffffc9000037fe40 EFLAGS: 00010006
[  241.430241] RAX: 000000007efe7005 RBX: ffff88007ec9df80 RCX:
0000000000000028
[  241.440543] RDX: 0000000000000005 RSI: ffff88007ec9df80 RDI:
ffff88007efe7000
[  241.451140] RBP: ffffc9000037fe68 R08: 0000003516c3d800 R09:
0000000000000000
[  241.460700] R10: ffffc9000037fe10 R11: ffffffff818bd263 R12:
ffff88007ec9df80
[  241.471322] R13: ffff880072450005 R14: 0000000000000001 R15:
000000007efe7000
[  241.481637] FS:  0000000000000000(0000) GS:ffff880075200000(0000)
knlGS:0000000000000000
[  241.493531] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  241.502150] CR2: 000055f2fa550940 CR3: 000000007efe7000 CR4:
00000000000206e0
[  241.512516] Call Trace:
[  241.516371]  __schedule+0x486/0x640
[  241.521454]  ? native_safe_halt+0x6/0x10
[  241.527579]  schedule_idle+0x29/0x40
[  241.532964]  do_idle+0x63/0x180
[  241.537665]  cpu_startup_entry+0x18/0x20
[  241.543463]  start_secondary+0xfa/0x100
[  241.549136]  secondary_startup_64+0x9f/0x9f
[  241.555389] Code: 66 90 66 90 f6 c4 02 74 02 0f ff 0f 20 d8 66 66 66 90
49 8b 7c 24 50 49 89 c7 e8 c5 ea ff ff 41 0f b7 d5 48 09 d0 4c 39 f8 74 02
<0f> 0b 49 39 dc 75 78 49 8d 84 24 a8 03 00 00 45 89 f6 4c 0f a3
[  241.583649] RIP: switch_mm_irqs_off+0x57/0x2d0 RSP: ffffc9000037fe40
[  241.593270]
[  241.593302] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  241.593333] WARNING: possible circular locking dependency detected
[  241.593361] 4.12.0-rc4-00023-g13b9798 #1 Not tainted
[  241.593372] ------------------------------------------------------
[  241.593400] swapper/1/0 is trying to acquire lock:
[  241.593403]  (&port_lock_key){-.-...}, at: [<ffffffff814762cf>]
serial8250_console_write+0xdf/0x2b0
[  241.593467]
[  241.593495] but task is already holding lock:
[  241.593498]  (&rq->lock){-.-.-.}, at: [<ffffffff818bd263>]
__schedule+0x193/0x640
[  241.593559]
[  241.593587] which lock already depends on the new lock.
[  241.593590]
[  241.593593]
[  241.593623] the existing dependency chain (in reverse order) is:
[  241.593625]
[  241.593628] -> #3 (&rq->lock){-.-.-.}:
[  241.593688]        lock_acquire+0x59/0x80
[  241.593694]        _raw_spin_lock+0x2f/0x70
[  241.593756]        task_fork_fair+0x31/0x120
[  241.593784]        sched_fork+0x109/0x240
[  241.593791]        copy_process+0xe88/0x2c10
[  241.593817]        _do_fork+0xca/0x660
[  241.593823]        kernel_thread+0x34/0x40
[  241.593849]        rest_init+0x22/0x170
[  241.593857]        start_kernel+0x71e/0x742
[  241.593885]        x86_64_start_reservations+0x55/0x76
[  241.593912]        x86_64_start_kernel+0x10e/0x139
[  241.593917]        verify_cpu+0x0/0xf1
[  241.593920]
[  241.593923] -> #2 (&p->pi_lock){-.-.-.}:
[  241.593984]        lock_acquire+0x59/0x80
[  241.594012]        _raw_spin_lock_irqsave+0x48/0x90
[  241.594018]        try_to_wake_up+0x2c/0x3a0
[  241.594046]        default_wake_function+0xd/0x10
[  241.594053]        woken_wake_function+0xc/0x10
[  241.594080]        __wake_up_common+0x48/0x80
[  241.594106]        __wake_up+0x34/0x50
[  241.594112]        tty_wakeup+0x7b/0x90
[  241.594141]        tty_port_default_wakeup+0x2a/0x40
[  241.594148]        tty_port_tty_wakeup+0x1a/0x20
[  241.594176]        uart_write_wakeup+0x2d/0x30
[  241.594204]        serial8250_tx_chars+0x163/0x260
[  241.594211]        serial8250_handle_irq+0xfd/0x130
[  241.594240]        serial8250_default_handle_irq+0x48/0x60
[  241.594268]        serial8250_interrupt+0x4b/0xf0
[  241.594276]        __handle_irq_event_percpu+0x47/0x140
[  241.594305]        handle_irq_event_percpu+0x26/0x60
[  241.594311]        handle_irq_event+0x39/0x60
[  241.594339]        handle_edge_irq+0x179/0x1b0
[  241.594366]        handle_irq+0xf1/0x100
[  241.594371]        do_IRQ+0x7b/0x100
[  241.594398]        ret_from_intr+0x0/0x1e
[  241.594406]        _raw_spin_unlock_irqrestore+0x47/0x60
[  241.594433]        uart_write+0x1b7/0x230
[  241.594440]        do_output_char+0xdf/0x2e0
[  241.594467]        n_tty_write+0x3a7/0x620
[  241.594473]        tty_write+0x283/0x3b0
[  241.594501]        redirected_tty_write+0x90/0xb0
[  241.594529]        __do_readv_writev+0x30e/0x550
[  241.594535]        do_readv_writev+0x96/0xd0
[  241.594562]        vfs_writev+0x67/0x90
[  241.594568]        do_writev+0x5f/0xe0
[  241.594594]        SyS_writev+0x27/0x30
[  241.594602]        entry_SYSCALL_64_fastpath+0x1f/0xbe
[  241.594626]
[  241.594629] -> #1 (&tty->write_wait){-.-...}:
[  241.594691]        lock_acquire+0x59/0x80
[  241.594698]        _raw_spin_lock_irqsave+0x48/0x90
[  241.594828]        __wake_up+0x1e/0x50
[  241.594856]        tty_wakeup+0x7b/0x90
[  241.594885]        tty_port_default_wakeup+0x2a/0x40
[  241.594892]        tty_port_tty_wakeup+0x1a/0x20
[  241.594920]        uart_write_wakeup+0x2d/0x30
[  241.594927]        serial8250_tx_chars+0x163/0x260
[  241.594956]        serial8250_handle_irq+0xfd/0x130
[  241.594985]        serial8250_default_handle_irq+0x48/0x60
[  241.594992]        serial8250_interrupt+0x4b/0xf0
[  241.595021]        __handle_irq_event_percpu+0x47/0x140
[  241.595049]        handle_irq_event_percpu+0x26/0x60
[  241.595056]        handle_irq_event+0x39/0x60
[  241.595083]        handle_edge_irq+0x179/0x1b0
[  241.595090]        handle_irq+0xf1/0x100
[  241.595116]        do_IRQ+0x7b/0x100
[  241.595122]        ret_from_intr+0x0/0x1e
[  241.595151]        _raw_spin_unlock_irqrestore+0x47/0x60
[  241.595178]        uart_write+0x1b7/0x230
[  241.595184]        do_output_char+0xdf/0x2e0
[  241.595211]        n_tty_write+0x3a7/0x620
[  241.595218]        tty_write+0x283/0x3b0
[  241.595245]        redirected_tty_write+0x90/0xb0
[  241.595273]        __do_readv_writev+0x30e/0x550
[  241.595280]        do_readv_writev+0x96/0xd0
[  241.595307]        vfs_writev+0x67/0x90
[  241.595313]        do_writev+0x5f/0xe0
[  241.595339]        SyS_writev+0x27/0x30
[  241.595347]        entry_SYSCALL_64_fastpath+0x1f/0xbe
[  241.595370]
[  241.595373] -> #0 (&port_lock_key){-.-...}:
[  241.595436]        __lock_acquire+0xf40/0x17d0
[  241.595442]        lock_acquire+0x59/0x80
[  241.595470]        _raw_spin_lock_irqsave+0x48/0x90
[  241.595478]        serial8250_console_write+0xdf/0x2b0


To reproduce:

        git clone https://github.com/01org/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> job-script  # job-script is attached in
this email



Thanks,
Xiaolong

--===============2792569386497763535==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPjxkaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIEp1biAxMiwgMjAxNyAxMjowMCBBTSwgJnF1b3Q7a2Vy
bmVsIHRlc3Qgcm9ib3QmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzp4aWFvbG9uZy55ZUBpbnRl
bC5jb20iPnhpYW9sb25nLnllQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxiciB0eXBlPSJhdHRy
aWJ1dGlvbiI+PGJsb2NrcXVvdGUgY2xhc3M9InF1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44
ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGJyPgpGWUks
IHdlIG5vdGljZWQgdGhlIGZvbGxvd2luZyBjb21taXQ6PGJyPgo8YnI+CmNvbW1pdDogMTNiOTc5
OGUxZjdiMmNlM2IwYWEyMmZkZGZjNjVkPHdicj44ODE1ZWQyYjUzICgmcXVvdDt4ODYvbW06IFRy
eSB0byBwcmVzZXJ2ZSBvbGQgVExCIGVudHJpZXMgdXNpbmcgUENJRCZxdW90Oyk8YnI+CmdpdDov
L2ludGVybmFsX21lcmdlX2FuZF90ZXN0Xzx3YnI+dHJlZSByZXZlcnQtPHdicj40ODk0MjZiNGE1
YWIxMDA1MTNlMTllODY2Y2FiMTM8d2JyPjMwN2U1YTdhY2MtPHdicj4xM2I5Nzk4ZTFmN2IyY2Uz
YjBhYTIyZmRkZmM2NWQ8d2JyPjg4MTVlZDJiNTM8YnI+PC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2
PjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPlRoaXMgc2hv
dWxkIGJlIGZpeGVkIGluIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgdGhlIGJyYW5jaC48L2Rpdj48
ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48ZGl2IGNsYXNzPSJnbWFp
bF9leHRyYSI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxibG9ja3F1b3RlIGNsYXNzPSJxdW90
ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3Bh
ZGRpbmctbGVmdDoxZXgiPgo8YnI+CmluIHRlc3RjYXNlOiBib290PGJyPgo8YnI+Cm9uIHRlc3Qg
bWFjaGluZTogcWVtdS1zeXN0ZW0teDg2XzY0IC1lbmFibGUta3ZtIC1jcHUgaG9zdCAtc21wIDIg
LW0gMkc8YnI+Cjxicj4KY2F1c2VkIGJlbG93IGNoYW5nZXMgKHBsZWFzZSByZWZlciB0byBhdHRh
Y2hlZCBkbWVzZy9rbXNnIGZvciBlbnRpcmUgbG9nL2JhY2t0cmFjZSk6PGJyPgo8YnI+Cjxicj4K
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPHdicj4tLS0tLS0tLS0tLS0tKy0tLS0tLS0t
LS0tLSstLS08d2JyPi0tLS0tLS0tLSs8YnI+CnzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IGNhYmJjZmMwYjkgfCAxM2I5Nzk4
ZTFmIHw8YnI+CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTx3YnI+LS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0rLS0tPHdicj4tLS0tLS0tLS0rPGJyPgp8IGJvb3Rfc3VjY2Vzc2VzwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDXCoCDCoCDCoCDCoCDCoCB8
IDLCoCDCoCDCoCDCoCDCoCB8PGJyPgp8IGJvb3RfZmFpbHVyZXPCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDLCoCDCoCDCoCDCoCDCoCB8IDTCoCDCoCDCoCDCoCDC
oCB8PGJyPgp8IEJVRzprZXJuZWxfaGFuZ19pbl90ZXN0X3N0YWdlwqAgwqAgwqAgwqAgwqAgwqAg
fCAywqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+Cnwga2VybmVsX0JVR19h
dF9hcmNoL3g4Ni9tbS90bGIuPHdicj5jwqAgwqAgwqAgwqAgwqAgfCAwwqAgwqAgwqAgwqAgwqAg
fCA0wqAgwqAgwqAgwqAgwqAgfDxicj4KfCBpbnZhbGlkX29wY29kZTojWyMjXcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAgwqAgfCA0wqAgwqAgwqAgwqAgwqAg
fDxicj4KfCBLZXJuZWxfcGFuaWMtbm90X3N5bmNpbmc6PHdicj5GYXRhbF9leGNlcHRpb24gfCAw
wqAgwqAgwqAgwqAgwqAgfCA0wqAgwqAgwqAgwqAgwqAgfDxicj4KKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tPHdicj4tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS08d2JyPi0tLS0t
LS0tLSs8YnI+Cjxicj4KPGJyPgo8YnI+ClvCoCAyNDEuMzYxNDQyXSBrZXJuZWwgQlVHIGF0IGFy
Y2gveDg2L21tL3RsYi5jOjExOSE8YnI+ClvCoCAyNDEuMzcxMDAzXSBpbnZhbGlkIG9wY29kZTog
MDAwMCBbIzFdIFNNUDxicj4KW8KgIDI0MS4zNzY0NzNdIE1vZHVsZXMgbGlua2VkIGluOjxicj4K
W8KgIDI0MS4zODExMDVdIENQVTogMSBQSUQ6IDAgQ29tbTogc3dhcHBlci8xIE5vdCB0YWludGVk
IDQuMTIuMC1yYzQtMDAwMjMtZzEzYjk3OTggIzE8YnI+ClvCoCAyNDEuMzkyMTMwXSBIYXJkd2Fy
ZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyAxLjku
My0yMDE2MTAyNV8xNzEzMDItZ2FuZGFsZiAwNC8wMS8yMDE0PGJyPgpbwqAgMjQxLjQwNjY1MF0g
dGFzazogZmZmZjg4MDA3MjQ1MmYwMCB0YXNrLnN0YWNrOiBmZmZmYzkwMDAwMzdjMDAwPGJyPgpb
wqAgMjQxLjQxNTUyOV0gUklQOiAwMDEwOnN3aXRjaF9tbV9pcnFzX29mZisweDU3Lzx3YnI+MHgy
ZDA8YnI+ClvCoCAyNDEuNDIyNjU4XSBSU1A6IDAwMTg6ZmZmZmM5MDAwMDM3ZmU0MCBFRkxBR1M6
IDAwMDEwMDA2PGJyPgpbwqAgMjQxLjQzMDI0MV0gUkFYOiAwMDAwMDAwMDdlZmU3MDA1IFJCWDog
ZmZmZjg4MDA3ZWM5ZGY4MCBSQ1g6IDAwMDAwMDAwMDAwMDAwMjg8YnI+ClvCoCAyNDEuNDQwNTQz
XSBSRFg6IDAwMDAwMDAwMDAwMDAwMDUgUlNJOiBmZmZmODgwMDdlYzlkZjgwIFJESTogZmZmZjg4
MDA3ZWZlNzAwMDxicj4KW8KgIDI0MS40NTExNDBdIFJCUDogZmZmZmM5MDAwMDM3ZmU2OCBSMDg6
IDAwMDAwMDM1MTZjM2Q4MDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwPGJyPgpbwqAgMjQxLjQ2MDcw
MF0gUjEwOiBmZmZmYzkwMDAwMzdmZTEwIFIxMTogZmZmZmZmZmY4MThiZDI2MyBSMTI6IGZmZmY4
ODAwN2VjOWRmODA8YnI+ClvCoCAyNDEuNDcxMzIyXSBSMTM6IGZmZmY4ODAwNzI0NTAwMDUgUjE0
OiAwMDAwMDAwMDAwMDAwMDAxIFIxNTogMDAwMDAwMDA3ZWZlNzAwMDxicj4KW8KgIDI0MS40ODE2
MzddIEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjg4MDA3NTIwMDAwMCgwMDAw
KSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwPGJyPgpbwqAgMjQxLjQ5MzUzMV0gQ1M6wqAgMDAxMCBE
UzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzM8YnI+ClvCoCAyNDEuNTAyMTUw
XSBDUjI6IDAwMDA1NWYyZmE1NTA5NDAgQ1IzOiAwMDAwMDAwMDdlZmU3MDAwIENSNDogMDAwMDAw
MDAwMDAyMDZlMDxicj4KW8KgIDI0MS41MTI1MTZdIENhbGwgVHJhY2U6PGJyPgpbwqAgMjQxLjUx
NjM3MV3CoCBfX3NjaGVkdWxlKzB4NDg2LzB4NjQwPGJyPgpbwqAgMjQxLjUyMTQ1NF3CoCA/IG5h
dGl2ZV9zYWZlX2hhbHQrMHg2LzB4MTA8YnI+ClvCoCAyNDEuNTI3NTc5XcKgIHNjaGVkdWxlX2lk
bGUrMHgyOS8weDQwPGJyPgpbwqAgMjQxLjUzMjk2NF3CoCBkb19pZGxlKzB4NjMvMHgxODA8YnI+
ClvCoCAyNDEuNTM3NjY1XcKgIGNwdV9zdGFydHVwX2VudHJ5KzB4MTgvMHgyMDxicj4KW8KgIDI0
MS41NDM0NjNdwqAgc3RhcnRfc2Vjb25kYXJ5KzB4ZmEvMHgxMDA8YnI+ClvCoCAyNDEuNTQ5MTM2
XcKgIHNlY29uZGFyeV9zdGFydHVwXzY0KzB4OWYvMHg5Zjxicj4KW8KgIDI0MS41NTUzODldIENv
ZGU6IDY2IDkwIDY2IDkwIGY2IGM0IDAyIDc0IDAyIDBmIGZmIDBmIDIwIGQ4IDY2IDY2IDY2IDkw
IDQ5IDhiIDdjIDI0IDUwIDQ5IDg5IGM3IGU4IGM1IGVhIGZmIGZmIDQxIDBmIGI3IGQ1IDQ4IDA5
IGQwIDRjIDM5IGY4IDc0IDAyICZsdDswZiZndDsgMGIgNDkgMzkgZGMgNzUgNzggNDkgOGQgODQg
MjQgYTggMDMgMDAgMDAgNDUgODkgZjYgNGMgMGYgYTM8YnI+ClvCoCAyNDEuNTgzNjQ5XSBSSVA6
IHN3aXRjaF9tbV9pcnFzX29mZisweDU3LzB4MmQwIFJTUDogZmZmZmM5MDAwMDM3ZmU0MDxicj4K
W8KgIDI0MS41OTMyNzBdPGJyPgpbwqAgMjQxLjU5MzMwMl0gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PHdicj49PT09PT09PT09PT09PT09PT09PT09PT08YnI+ClvCoCAyNDEuNTkzMzMz
XSBXQVJOSU5HOiBwb3NzaWJsZSBjaXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY3kgZGV0ZWN0ZWQ8
YnI+ClvCoCAyNDEuNTkzMzYxXSA0LjEyLjAtcmM0LTAwMDIzLWcxM2I5Nzk4ICMxIE5vdCB0YWlu
dGVkPGJyPgpbwqAgMjQxLjU5MzM3Ml0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPHdi
cj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08YnI+ClvCoCAyNDEuNTkzNDAwXSBzd2FwcGVyLzEv
MCBpcyB0cnlpbmcgdG8gYWNxdWlyZSBsb2NrOjxicj4KW8KgIDI0MS41OTM0MDNdwqAgKCZhbXA7
cG9ydF9sb2NrX2tleSl7LS4tLi4ufSwgYXQ6IFsmbHQ7ZmZmZmZmZmY4MTQ3NjJjZiZndDtdIHNl
cmlhbDgyNTBfY29uc29sZV93cml0ZSsweGRmLzx3YnI+MHgyYjA8YnI+ClvCoCAyNDEuNTkzNDY3
XTxicj4KW8KgIDI0MS41OTM0OTVdIGJ1dCB0YXNrIGlzIGFscmVhZHkgaG9sZGluZyBsb2NrOjxi
cj4KW8KgIDI0MS41OTM0OThdwqAgKCZhbXA7cnEtJmd0O2xvY2spey0uLS4tLn0sIGF0OiBbJmx0
O2ZmZmZmZmZmODE4YmQyNjMmZ3Q7XSBfX3NjaGVkdWxlKzB4MTkzLzB4NjQwPGJyPgpbwqAgMjQx
LjU5MzU1OV08YnI+ClvCoCAyNDEuNTkzNTg3XSB3aGljaCBsb2NrIGFscmVhZHkgZGVwZW5kcyBv
biB0aGUgbmV3IGxvY2suPGJyPgpbwqAgMjQxLjU5MzU5MF08YnI+ClvCoCAyNDEuNTkzNTkzXTxi
cj4KW8KgIDI0MS41OTM2MjNdIHRoZSBleGlzdGluZyBkZXBlbmRlbmN5IGNoYWluIChpbiByZXZl
cnNlIG9yZGVyKSBpczo8YnI+ClvCoCAyNDEuNTkzNjI1XTxicj4KW8KgIDI0MS41OTM2MjhdIC0m
Z3Q7ICMzICgmYW1wO3JxLSZndDtsb2NrKXstLi0uLS59Ojxicj4KW8KgIDI0MS41OTM2ODhdwqAg
wqAgwqAgwqAgbG9ja19hY3F1aXJlKzB4NTkvMHg4MDxicj4KW8KgIDI0MS41OTM2OTRdwqAgwqAg
wqAgwqAgX3Jhd19zcGluX2xvY2srMHgyZi8weDcwPGJyPgpbwqAgMjQxLjU5Mzc1Nl3CoCDCoCDC
oCDCoCB0YXNrX2ZvcmtfZmFpcisweDMxLzB4MTIwPGJyPgpbwqAgMjQxLjU5Mzc4NF3CoCDCoCDC
oCDCoCBzY2hlZF9mb3JrKzB4MTA5LzB4MjQwPGJyPgpbwqAgMjQxLjU5Mzc5MV3CoCDCoCDCoCDC
oCBjb3B5X3Byb2Nlc3MrMHhlODgvMHgyYzEwPGJyPgpbwqAgMjQxLjU5MzgxN13CoCDCoCDCoCDC
oCBfZG9fZm9yaysweGNhLzB4NjYwPGJyPgpbwqAgMjQxLjU5MzgyM13CoCDCoCDCoCDCoCBrZXJu
ZWxfdGhyZWFkKzB4MzQvMHg0MDxicj4KW8KgIDI0MS41OTM4NDldwqAgwqAgwqAgwqAgcmVzdF9p
bml0KzB4MjIvMHgxNzA8YnI+ClvCoCAyNDEuNTkzODU3XcKgIMKgIMKgIMKgIHN0YXJ0X2tlcm5l
bCsweDcxZS8weDc0Mjxicj4KW8KgIDI0MS41OTM4ODVdwqAgwqAgwqAgwqAgeDg2XzY0X3N0YXJ0
X3Jlc2VydmF0aW9ucys8d2JyPjB4NTUvMHg3Njxicj4KW8KgIDI0MS41OTM5MTJdwqAgwqAgwqAg
wqAgeDg2XzY0X3N0YXJ0X2tlcm5lbCsweDEwZS88d2JyPjB4MTM5PGJyPgpbwqAgMjQxLjU5Mzkx
N13CoCDCoCDCoCDCoCB2ZXJpZnlfY3B1KzB4MC8weGYxPGJyPgpbwqAgMjQxLjU5MzkyMF08YnI+
ClvCoCAyNDEuNTkzOTIzXSAtJmd0OyAjMiAoJmFtcDtwLSZndDtwaV9sb2NrKXstLi0uLS59Ojxi
cj4KW8KgIDI0MS41OTM5ODRdwqAgwqAgwqAgwqAgbG9ja19hY3F1aXJlKzB4NTkvMHg4MDxicj4K
W8KgIDI0MS41OTQwMTJdwqAgwqAgwqAgwqAgX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSsweDQ4Lzx3
YnI+MHg5MDxicj4KW8KgIDI0MS41OTQwMThdwqAgwqAgwqAgwqAgdHJ5X3RvX3dha2VfdXArMHgy
Yy8weDNhMDxicj4KW8KgIDI0MS41OTQwNDZdwqAgwqAgwqAgwqAgZGVmYXVsdF93YWtlX2Z1bmN0
aW9uKzB4ZC8weDEwPGJyPgpbwqAgMjQxLjU5NDA1M13CoCDCoCDCoCDCoCB3b2tlbl93YWtlX2Z1
bmN0aW9uKzB4Yy8weDEwPGJyPgpbwqAgMjQxLjU5NDA4MF3CoCDCoCDCoCDCoCBfX3dha2VfdXBf
Y29tbW9uKzB4NDgvMHg4MDxicj4KW8KgIDI0MS41OTQxMDZdwqAgwqAgwqAgwqAgX193YWtlX3Vw
KzB4MzQvMHg1MDxicj4KW8KgIDI0MS41OTQxMTJdwqAgwqAgwqAgwqAgdHR5X3dha2V1cCsweDdi
LzB4OTA8YnI+ClvCoCAyNDEuNTk0MTQxXcKgIMKgIMKgIMKgIHR0eV9wb3J0X2RlZmF1bHRfd2Fr
ZXVwKzB4MmEvPHdicj4weDQwPGJyPgpbwqAgMjQxLjU5NDE0OF3CoCDCoCDCoCDCoCB0dHlfcG9y
dF90dHlfd2FrZXVwKzB4MWEvMHgyMDxicj4KW8KgIDI0MS41OTQxNzZdwqAgwqAgwqAgwqAgdWFy
dF93cml0ZV93YWtldXArMHgyZC8weDMwPGJyPgpbwqAgMjQxLjU5NDIwNF3CoCDCoCDCoCDCoCBz
ZXJpYWw4MjUwX3R4X2NoYXJzKzB4MTYzLzx3YnI+MHgyNjA8YnI+ClvCoCAyNDEuNTk0MjExXcKg
IMKgIMKgIMKgIHNlcmlhbDgyNTBfaGFuZGxlX2lycSsweGZkLzx3YnI+MHgxMzA8YnI+ClvCoCAy
NDEuNTk0MjQwXcKgIMKgIMKgIMKgIHNlcmlhbDgyNTBfZGVmYXVsdF9oYW5kbGVfaXJxKzx3YnI+
MHg0OC8weDYwPGJyPgpbwqAgMjQxLjU5NDI2OF3CoCDCoCDCoCDCoCBzZXJpYWw4MjUwX2ludGVy
cnVwdCsweDRiLzB4ZjA8YnI+ClvCoCAyNDEuNTk0Mjc2XcKgIMKgIMKgIMKgIF9faGFuZGxlX2ly
cV9ldmVudF9wZXJjcHUrPHdicj4weDQ3LzB4MTQwPGJyPgpbwqAgMjQxLjU5NDMwNV3CoCDCoCDC
oCDCoCBoYW5kbGVfaXJxX2V2ZW50X3BlcmNwdSsweDI2Lzx3YnI+MHg2MDxicj4KW8KgIDI0MS41
OTQzMTFdwqAgwqAgwqAgwqAgaGFuZGxlX2lycV9ldmVudCsweDM5LzB4NjA8YnI+ClvCoCAyNDEu
NTk0MzM5XcKgIMKgIMKgIMKgIGhhbmRsZV9lZGdlX2lycSsweDE3OS8weDFiMDxicj4KW8KgIDI0
MS41OTQzNjZdwqAgwqAgwqAgwqAgaGFuZGxlX2lycSsweGYxLzB4MTAwPGJyPgpbwqAgMjQxLjU5
NDM3MV3CoCDCoCDCoCDCoCBkb19JUlErMHg3Yi8weDEwMDxicj4KW8KgIDI0MS41OTQzOThdwqAg
wqAgwqAgwqAgcmV0X2Zyb21faW50cisweDAvMHgxZTxicj4KW8KgIDI0MS41OTQ0MDZdwqAgwqAg
wqAgwqAgX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKzx3YnI+MHg0Ny8weDYwPGJyPgpbwqAg
MjQxLjU5NDQzM13CoCDCoCDCoCDCoCB1YXJ0X3dyaXRlKzB4MWI3LzB4MjMwPGJyPgpbwqAgMjQx
LjU5NDQ0MF3CoCDCoCDCoCDCoCBkb19vdXRwdXRfY2hhcisweGRmLzB4MmUwPGJyPgpbwqAgMjQx
LjU5NDQ2N13CoCDCoCDCoCDCoCBuX3R0eV93cml0ZSsweDNhNy8weDYyMDxicj4KW8KgIDI0MS41
OTQ0NzNdwqAgwqAgwqAgwqAgdHR5X3dyaXRlKzB4MjgzLzB4M2IwPGJyPgpbwqAgMjQxLjU5NDUw
MV3CoCDCoCDCoCDCoCByZWRpcmVjdGVkX3R0eV93cml0ZSsweDkwLzB4YjA8YnI+ClvCoCAyNDEu
NTk0NTI5XcKgIMKgIMKgIMKgIF9fZG9fcmVhZHZfd3JpdGV2KzB4MzBlLzB4NTUwPGJyPgpbwqAg
MjQxLjU5NDUzNV3CoCDCoCDCoCDCoCBkb19yZWFkdl93cml0ZXYrMHg5Ni8weGQwPGJyPgpbwqAg
MjQxLjU5NDU2Ml3CoCDCoCDCoCDCoCB2ZnNfd3JpdGV2KzB4NjcvMHg5MDxicj4KW8KgIDI0MS41
OTQ1NjhdwqAgwqAgwqAgwqAgZG9fd3JpdGV2KzB4NWYvMHhlMDxicj4KW8KgIDI0MS41OTQ1OTRd
wqAgwqAgwqAgwqAgU3lTX3dyaXRldisweDI3LzB4MzA8YnI+ClvCoCAyNDEuNTk0NjAyXcKgIMKg
IMKgIMKgIGVudHJ5X1NZU0NBTExfNjRfZmFzdHBhdGgrPHdicj4weDFmLzB4YmU8YnI+ClvCoCAy
NDEuNTk0NjI2XTxicj4KW8KgIDI0MS41OTQ2MjldIC0mZ3Q7ICMxICgmYW1wO3R0eS0mZ3Q7d3Jp
dGVfd2FpdCl7LS4tLi4ufTo8YnI+ClvCoCAyNDEuNTk0NjkxXcKgIMKgIMKgIMKgIGxvY2tfYWNx
dWlyZSsweDU5LzB4ODA8YnI+ClvCoCAyNDEuNTk0Njk4XcKgIMKgIMKgIMKgIF9yYXdfc3Bpbl9s
b2NrX2lycXNhdmUrMHg0OC88d2JyPjB4OTA8YnI+ClvCoCAyNDEuNTk0ODI4XcKgIMKgIMKgIMKg
IF9fd2FrZV91cCsweDFlLzB4NTA8YnI+ClvCoCAyNDEuNTk0ODU2XcKgIMKgIMKgIMKgIHR0eV93
YWtldXArMHg3Yi8weDkwPGJyPgpbwqAgMjQxLjU5NDg4NV3CoCDCoCDCoCDCoCB0dHlfcG9ydF9k
ZWZhdWx0X3dha2V1cCsweDJhLzx3YnI+MHg0MDxicj4KW8KgIDI0MS41OTQ4OTJdwqAgwqAgwqAg
wqAgdHR5X3BvcnRfdHR5X3dha2V1cCsweDFhLzB4MjA8YnI+ClvCoCAyNDEuNTk0OTIwXcKgIMKg
IMKgIMKgIHVhcnRfd3JpdGVfd2FrZXVwKzB4MmQvMHgzMDxicj4KW8KgIDI0MS41OTQ5MjddwqAg
wqAgwqAgwqAgc2VyaWFsODI1MF90eF9jaGFycysweDE2My88d2JyPjB4MjYwPGJyPgpbwqAgMjQx
LjU5NDk1Nl3CoCDCoCDCoCDCoCBzZXJpYWw4MjUwX2hhbmRsZV9pcnErMHhmZC88d2JyPjB4MTMw
PGJyPgpbwqAgMjQxLjU5NDk4NV3CoCDCoCDCoCDCoCBzZXJpYWw4MjUwX2RlZmF1bHRfaGFuZGxl
X2lycSs8d2JyPjB4NDgvMHg2MDxicj4KW8KgIDI0MS41OTQ5OTJdwqAgwqAgwqAgwqAgc2VyaWFs
ODI1MF9pbnRlcnJ1cHQrMHg0Yi8weGYwPGJyPgpbwqAgMjQxLjU5NTAyMV3CoCDCoCDCoCDCoCBf
X2hhbmRsZV9pcnFfZXZlbnRfcGVyY3B1Kzx3YnI+MHg0Ny8weDE0MDxicj4KW8KgIDI0MS41OTUw
NDldwqAgwqAgwqAgwqAgaGFuZGxlX2lycV9ldmVudF9wZXJjcHUrMHgyNi88d2JyPjB4NjA8YnI+
ClvCoCAyNDEuNTk1MDU2XcKgIMKgIMKgIMKgIGhhbmRsZV9pcnFfZXZlbnQrMHgzOS8weDYwPGJy
PgpbwqAgMjQxLjU5NTA4M13CoCDCoCDCoCDCoCBoYW5kbGVfZWRnZV9pcnErMHgxNzkvMHgxYjA8
YnI+ClvCoCAyNDEuNTk1MDkwXcKgIMKgIMKgIMKgIGhhbmRsZV9pcnErMHhmMS8weDEwMDxicj4K
W8KgIDI0MS41OTUxMTZdwqAgwqAgwqAgwqAgZG9fSVJRKzB4N2IvMHgxMDA8YnI+ClvCoCAyNDEu
NTk1MTIyXcKgIMKgIMKgIMKgIHJldF9mcm9tX2ludHIrMHgwLzB4MWU8YnI+ClvCoCAyNDEuNTk1
MTUxXcKgIMKgIMKgIMKgIF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSs8d2JyPjB4NDcvMHg2
MDxicj4KW8KgIDI0MS41OTUxNzhdwqAgwqAgwqAgwqAgdWFydF93cml0ZSsweDFiNy8weDIzMDxi
cj4KW8KgIDI0MS41OTUxODRdwqAgwqAgwqAgwqAgZG9fb3V0cHV0X2NoYXIrMHhkZi8weDJlMDxi
cj4KW8KgIDI0MS41OTUyMTFdwqAgwqAgwqAgwqAgbl90dHlfd3JpdGUrMHgzYTcvMHg2MjA8YnI+
ClvCoCAyNDEuNTk1MjE4XcKgIMKgIMKgIMKgIHR0eV93cml0ZSsweDI4My8weDNiMDxicj4KW8Kg
IDI0MS41OTUyNDVdwqAgwqAgwqAgwqAgcmVkaXJlY3RlZF90dHlfd3JpdGUrMHg5MC8weGIwPGJy
PgpbwqAgMjQxLjU5NTI3M13CoCDCoCDCoCDCoCBfX2RvX3JlYWR2X3dyaXRldisweDMwZS8weDU1
MDxicj4KW8KgIDI0MS41OTUyODBdwqAgwqAgwqAgwqAgZG9fcmVhZHZfd3JpdGV2KzB4OTYvMHhk
MDxicj4KW8KgIDI0MS41OTUzMDddwqAgwqAgwqAgwqAgdmZzX3dyaXRldisweDY3LzB4OTA8YnI+
ClvCoCAyNDEuNTk1MzEzXcKgIMKgIMKgIMKgIGRvX3dyaXRldisweDVmLzB4ZTA8YnI+ClvCoCAy
NDEuNTk1MzM5XcKgIMKgIMKgIMKgIFN5U193cml0ZXYrMHgyNy8weDMwPGJyPgpbwqAgMjQxLjU5
NTM0N13CoCDCoCDCoCDCoCBlbnRyeV9TWVNDQUxMXzY0X2Zhc3RwYXRoKzx3YnI+MHgxZi8weGJl
PGJyPgpbwqAgMjQxLjU5NTM3MF08YnI+ClvCoCAyNDEuNTk1MzczXSAtJmd0OyAjMCAoJmFtcDtw
b3J0X2xvY2tfa2V5KXstLi0uLi59Ojxicj4KW8KgIDI0MS41OTU0MzZdwqAgwqAgwqAgwqAgX19s
b2NrX2FjcXVpcmUrMHhmNDAvMHgxN2QwPGJyPgpbwqAgMjQxLjU5NTQ0Ml3CoCDCoCDCoCDCoCBs
b2NrX2FjcXVpcmUrMHg1OS8weDgwPGJyPgpbwqAgMjQxLjU5NTQ3MF3CoCDCoCDCoCDCoCBfcmF3
X3NwaW5fbG9ja19pcnFzYXZlKzB4NDgvPHdicj4weDkwPGJyPgpbwqAgMjQxLjU5NTQ3OF3CoCDC
oCDCoCDCoCBzZXJpYWw4MjUwX2NvbnNvbGVfd3JpdGUrMHhkZi88d2JyPjB4MmIwPGJyPgo8YnI+
Cjxicj4KVG8gcmVwcm9kdWNlOjxicj4KPGJyPgrCoCDCoCDCoCDCoCBnaXQgY2xvbmUgPGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tLzAxb3JnL2xrcC10ZXN0cy5naXQiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS8wMW9yZy9sa3AtPHdicj50ZXN0
cy5naXQ8L2E+PGJyPgrCoCDCoCDCoCDCoCBjZCBsa3AtdGVzdHM8YnI+CsKgIMKgIMKgIMKgIGJp
bi9sa3AgcWVtdSAtayAmbHQ7YnpJbWFnZSZndDsgam9iLXNjcmlwdMKgICMgam9iLXNjcmlwdCBp
cyBhdHRhY2hlZCBpbiB0aGlzIGVtYWlsPGJyPgo8YnI+Cjxicj4KPGJyPgpUaGFua3MsPGJyPgpY
aWFvbG9uZzxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============2792569386497763535==--

