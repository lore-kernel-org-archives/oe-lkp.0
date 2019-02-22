Content-Type: multipart/mixed; boundary="===============6551485897165682861=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, memory_hotplug] efad4e475c: BUG:unable_to_handle_kernel
Date: Fri, 22 Feb 2019 09:02:11 +0800
Message-ID: <3570d763-7128-18ed-6ca8-0f0450a5bf26@intel.com>
In-Reply-To: <20190222005433.ipizjh2a5vaxyi73@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6551485897165682861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Please ignore the duplicate report. previous report is at =

https://lists.01.org/pipermail/lkp/2019-February/009805.html

and the issue should have been fixed =

https://lists.01.org/pipermail/lkp/2019-February/009821.html

Best Regards,
Rong Chen

On 2/22/19 8:54 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-8):
>
> commit: efad4e475c312456edb3c789d0996d12ed744c13 ("mm, memory_hotplug: is=
_mem_section_removable do not pass the end of a zone")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: trinity
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 1G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +---------------------------------------------------------+------------+-=
-----------+
> |                                                         | 9bcdeb51bd | =
efad4e475c |
> +---------------------------------------------------------+------------+-=
-----------+
> | boot_successes                                          | 0          | =
0          |
> | boot_failures                                           | 6          | =
4          |
> | WARNING:at_mm/page_alloc.c:#__alloc_pages_nodemask      | 6          | =
4          |
> | RIP:__alloc_pages_nodemask                              | 6          | =
4          |
> | Mem-Info                                                | 6          | =
4          |
> | WARNING:at_lib/debugobjects.c:#__debug_object_init.cold | 6          | =
4          |
> | RIP:__debug_object_init.cold                            | 6          | =
4          |
> | BUG:unable_to_handle_kernel                             | 0          | =
4          |
> | Oops:#[##]                                              | 0          | =
4          |
> | RIP:page_mapping                                        | 0          | =
4          |
> | Kernel_panic-not_syncing:Fatal_exception                | 0          | =
4          |
> | WARNING:at_kernel/locking/lockdep.c:#lock_downgrade     | 0          | =
1          |
> | RIP:lock_downgrade                                      | 0          | =
1          |
> +---------------------------------------------------------+------------+-=
-----------+
>
>
>
> [   50.067610] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000006
> [   50.069651] #PF error: [normal kernel read fault]
> [   50.070222] PGD 800000003549b067 P4D 800000003549b067 PUD 0
> [   50.070899] Oops: 0000 [#1] SMP PTI
> [   50.071353] CPU: 1 PID: 410 Comm: udevd Tainted: G        W         5.=
0.0-rc4-00149-gefad4e4 #1
> [   50.072399] RIP: 0010:page_mapping+0xe/0x70
> [   50.072905] Code: c2 48 83 e0 fc 83 e2 03 48 83 fa 01 ba 00 00 00 00 4=
8 0f 45 c2 c3 66 0f 1f 44 00 00 48 8b 47 08 48 8d 50 ff a8 01 48 0f 45 fa <=
48> 8b 57 08 48 8d 42 ff 83 e2 01 48 0f 44 c7 48 83 38 ff 74 2e 48
> [   50.075101] RSP: 0000:ffffc90000477d40 EFLAGS: 00010202
> [   50.075726] RAX: ffffffffffffffff RBX: ffff88803dfc0000 RCX: 000000000=
0000080
> [   50.076581] RDX: fffffffffffffffe RSI: ffffffffa29e34e8 RDI: fffffffff=
ffffffe
> [   50.077448] RBP: 6db6db6db6db6db7 R08: 0000000000000001 R09: 000000000=
0000400
> [   50.078310] R10: ffff88803ffd4000 R11: ffff88803e3fd000 R12: ffffffffa=
29e34e8
> [   50.079143] R13: 0000000000000001 R14: ffff888033e74d40 R15: ffff88803=
5abd1c8
> [   50.080002] FS:  0000000000000000(0000) GS:ffff88803d300000(0063) knlG=
S:00000000f7d23b00
> [   50.080984] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [   50.081704] CR2: 0000000000000006 CR3: 0000000035ee6000 CR4: 000000000=
00406a0
> [   50.082544] Call Trace:
> [   50.082861]  __dump_page+0xf/0x120
> [   50.083286]  dump_page+0x9/0x20
> [   50.083683]  is_mem_section_removable+0x210/0x240
> [   50.084258]  removable_show+0x6b/0xa0
> [   50.084718]  dev_attr_show+0x14/0x40
> [   50.085174]  sysfs_kf_seq_show+0xa8/0xf0
> [   50.085629]  seq_read+0x141/0x3d0
> [   50.086017]  __vfs_read+0x1e/0x170
> [   50.086438]  ? free_unref_page_prepare+0xd1/0x180
> [   50.087002]  vfs_read+0x9e/0x130
> [   50.087420]  ksys_read+0x3d/0xa0
> [   50.087837]  do_int80_syscall_32+0x45/0xf0
> [   50.088345]  entry_INT80_compat+0x82/0x87
> [   50.088844] CR2: 0000000000000006
> [   50.089276] ---[ end trace d2d035d77c3b428d ]---
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
>
>
>
> Thanks,
> Rong Chen
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============6551485897165682861==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsKICAgICAgY2hhcnNldD13aW5kb3dzLTEyNTIiPgogIDwvaGVhZD4KICA8
Ym9keSB0ZXh0PSIjMDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4KICAgIDxwPlBsZWFzZSBpZ25v
cmUgdGhlIDxzcGFuIGlkPSJ3XzE3OCIgY2xhc3M9IiI+ZHVwbGljYXRlPC9zcGFuPgogICAgICBy
ZXBvcnQuIHByZXZpb3VzIHJlcG9ydCBpcyBhdAogICAgICA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwvbGtwLzIwMTkt
RmVicnVhcnkvMDA5ODA1Lmh0bWwiPmh0dHBzOi8vbGlzdHMuMDEub3JnL3BpcGVybWFpbC9sa3Av
MjAxOS1GZWJydWFyeS8wMDk4MDUuaHRtbDwvYT48L3A+CiAgICA8cD5hbmQgdGhlIGlzc3VlIHNo
b3VsZCBoYXZlIGJlZW4gZml4ZWQKICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4
dCIgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL2xrcC8yMDE5LUZlYnJ1YXJ5
LzAwOTgyMS5odG1sIj5odHRwczovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwvbGtwLzIwMTktRmVi
cnVhcnkvMDA5ODIxLmh0bWw8L2E+PGJyPgogICAgPC9wPgogICAgPHA+QmVzdCBSZWdhcmRzLDxi
cj4KICAgICAgUm9uZyBDaGVuPGJyPgogICAgICA8c3BhbiBpZD0id18xNzgiIGNsYXNzPSIiPjwv
c3Bhbj48L3A+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDIvMjIvMTkgODo1
NCBBTSwga2VybmVsIHRlc3Qgcm9ib3QKICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8
YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MjAxOTAyMjIwMDU0MzMuaXBp
empoMmE1dmF4eWk3M0Bpbm4yLmxrcC5pbnRlbC5jb20iPgogICAgICA8cHJlIGNsYXNzPSJtb3ot
cXVvdGUtcHJlIiB3cmFwPSIiPgpGWUksIHdlIG5vdGljZWQgdGhlIGZvbGxvd2luZyBjb21taXQg
KGJ1aWx0IHdpdGggZ2NjLTgpOgoKY29tbWl0OiBlZmFkNGU0NzVjMzEyNDU2ZWRiM2M3ODlkMDk5
NmQxMmVkNzQ0YzEzICgibW0sIG1lbW9yeV9ob3RwbHVnOiBpc19tZW1fc2VjdGlvbl9yZW1vdmFi
bGUgZG8gbm90IHBhc3MgdGhlIGVuZCBvZiBhIHpvbmUiKQo8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVs
L2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0Ij5odHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGlu
dXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0PC9hPiBtYXN0ZXIKCmluIHRlc3RjYXNl
OiB0cmluaXR5CndpdGggZm9sbG93aW5nIHBhcmFtZXRlcnM6CgoJcnVudGltZTogMzAwcwoKdGVz
dC1kZXNjcmlwdGlvbjogVHJpbml0eSBpcyBhIGxpbnV4IHN5c3RlbSBjYWxsIGZ1enogdGVzdGVy
Lgp0ZXN0LXVybDogPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cDov
L2NvZGVtb25rZXkub3JnLnVrL3Byb2plY3RzL3RyaW5pdHkvIj5odHRwOi8vY29kZW1vbmtleS5v
cmcudWsvcHJvamVjdHMvdHJpbml0eS88L2E+CgoKb24gdGVzdCBtYWNoaW5lOiBxZW11LXN5c3Rl
bS14ODZfNjQgLWVuYWJsZS1rdm0gLWNwdSBTYW5keUJyaWRnZSAtc21wIDIgLW0gMUcKCmNhdXNl
ZCBiZWxvdyBjaGFuZ2VzIChwbGVhc2UgcmVmZXIgdG8gYXR0YWNoZWQgZG1lc2cva21zZyBmb3Ig
ZW50aXJlIGxvZy9iYWNrdHJhY2UpOgoKCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
OWJjZGViNTFiZCB8IGVmYWQ0ZTQ3NWMgfAorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rCnwg
Ym9vdF9zdWNjZXNzZXMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDAgICAgICAgICAgfCAwICAgICAgICAgIHwKfCBib290X2ZhaWx1cmVzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNiAgICAgICAgICB8IDQgICAgICAgICAgfAp8
IFdBUk5JTkc6YXRfbW0vcGFnZV9hbGxvYy5jOiNfX2FsbG9jX3BhZ2VzX25vZGVtYXNrICAgICAg
fCA2ICAgICAgICAgIHwgNCAgICAgICAgICB8CnwgUklQOl9fYWxsb2NfcGFnZXNfbm9kZW1hc2sg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgICAgICAgICAgfCA0ICAgICAgICAgIHwK
fCBNZW0tSW5mbyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNiAgICAgICAgICB8IDQgICAgICAgICAgfAp8IFdBUk5JTkc6YXRfbGliL2RlYnVnb2JqZWN0
cy5jOiNfX2RlYnVnX29iamVjdF9pbml0LmNvbGQgfCA2ICAgICAgICAgIHwgNCAgICAgICAgICB8
CnwgUklQOl9fZGVidWdfb2JqZWN0X2luaXQuY29sZCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDYgICAgICAgICAgfCA0ICAgICAgICAgIHwKfCBCVUc6dW5hYmxlX3RvX2hhbmRsZV9rZXJu
ZWwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMCAgICAgICAgICB8IDQgICAgICAgICAg
fAp8IE9vcHM6I1sjI10gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAwICAgICAgICAgIHwgNCAgICAgICAgICB8CnwgUklQOnBhZ2VfbWFwcGluZyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDAgICAgICAgICAgfCA0ICAgICAgICAg
IHwKfCBLZXJuZWxfcGFuaWMtbm90X3N5bmNpbmc6RmF0YWxfZXhjZXB0aW9uICAgICAgICAgICAg
ICAgIHwgMCAgICAgICAgICB8IDQgICAgICAgICAgfAp8IFdBUk5JTkc6YXRfa2VybmVsL2xvY2tp
bmcvbG9ja2RlcC5jOiNsb2NrX2Rvd25ncmFkZSAgICAgfCAwICAgICAgICAgIHwgMSAgICAgICAg
ICB8CnwgUklQOmxvY2tfZG93bmdyYWRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDAgICAgICAgICAgfCAxICAgICAgICAgIHwKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tKwoKCgpbICAgNTAuMDY3NjEwXSBCVUc6IHVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZSBhdCAwMDAwMDAwMDAwMDAwMDA2ClsgICA1MC4wNjk2NTFdICNQ
RiBlcnJvcjogW25vcm1hbCBrZXJuZWwgcmVhZCBmYXVsdF0KWyAgIDUwLjA3MDIyMl0gUEdEIDgw
MDAwMDAwMzU0OWIwNjcgUDREIDgwMDAwMDAwMzU0OWIwNjcgUFVEIDAgClsgICA1MC4wNzA4OTld
IE9vcHM6IDAwMDAgWyMxXSBTTVAgUFRJClsgICA1MC4wNzEzNTNdIENQVTogMSBQSUQ6IDQxMCBD
b21tOiB1ZGV2ZCBUYWludGVkOiBHICAgICAgICBXICAgICAgICAgNS4wLjAtcmM0LTAwMTQ5LWdl
ZmFkNGU0ICMxClsgICA1MC4wNzIzOTldIFJJUDogMDAxMDpwYWdlX21hcHBpbmcrMHhlLzB4NzAK
WyAgIDUwLjA3MjkwNV0gQ29kZTogYzIgNDggODMgZTAgZmMgODMgZTIgMDMgNDggODMgZmEgMDEg
YmEgMDAgMDAgMDAgMDAgNDggMGYgNDUgYzIgYzMgNjYgMGYgMWYgNDQgMDAgMDAgNDggOGIgNDcg
MDggNDggOGQgNTAgZmYgYTggMDEgNDggMGYgNDUgZmEgJmx0OzQ4Jmd0OyA4YiA1NyAwOCA0OCA4
ZCA0MiBmZiA4MyBlMiAwMSA0OCAwZiA0NCBjNyA0OCA4MyAzOCBmZiA3NCAyZSA0OApbICAgNTAu
MDc1MTAxXSBSU1A6IDAwMDA6ZmZmZmM5MDAwMDQ3N2Q0MCBFRkxBR1M6IDAwMDEwMjAyClsgICA1
MC4wNzU3MjZdIFJBWDogZmZmZmZmZmZmZmZmZmZmZiBSQlg6IGZmZmY4ODgwM2RmYzAwMDAgUkNY
OiAwMDAwMDAwMDAwMDAwMDgwClsgICA1MC4wNzY1ODFdIFJEWDogZmZmZmZmZmZmZmZmZmZmZSBS
U0k6IGZmZmZmZmZmYTI5ZTM0ZTggUkRJOiBmZmZmZmZmZmZmZmZmZmZlClsgICA1MC4wNzc0NDhd
IFJCUDogNmRiNmRiNmRiNmRiNmRiNyBSMDg6IDAwMDAwMDAwMDAwMDAwMDEgUjA5OiAwMDAwMDAw
MDAwMDAwNDAwClsgICA1MC4wNzgzMTBdIFIxMDogZmZmZjg4ODAzZmZkNDAwMCBSMTE6IGZmZmY4
ODgwM2UzZmQwMDAgUjEyOiBmZmZmZmZmZmEyOWUzNGU4ClsgICA1MC4wNzkxNDNdIFIxMzogMDAw
MDAwMDAwMDAwMDAwMSBSMTQ6IGZmZmY4ODgwMzNlNzRkNDAgUjE1OiBmZmZmODg4MDM1YWJkMWM4
ClsgICA1MC4wODAwMDJdIEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmODg4MDNk
MzAwMDAwKDAwNjMpIGtubEdTOjAwMDAwMDAwZjdkMjNiMDAKWyAgIDUwLjA4MDk4NF0gQ1M6ICAw
MDEwIERTOiAwMDJiIEVTOiAwMDJiIENSMDogMDAwMDAwMDA4MDA1MDAzMwpbICAgNTAuMDgxNzA0
XSBDUjI6IDAwMDAwMDAwMDAwMDAwMDYgQ1IzOiAwMDAwMDAwMDM1ZWU2MDAwIENSNDogMDAwMDAw
MDAwMDA0MDZhMApbICAgNTAuMDgyNTQ0XSBDYWxsIFRyYWNlOgpbICAgNTAuMDgyODYxXSAgX19k
dW1wX3BhZ2UrMHhmLzB4MTIwClsgICA1MC4wODMyODZdICBkdW1wX3BhZ2UrMHg5LzB4MjAKWyAg
IDUwLjA4MzY4M10gIGlzX21lbV9zZWN0aW9uX3JlbW92YWJsZSsweDIxMC8weDI0MApbICAgNTAu
MDg0MjU4XSAgcmVtb3ZhYmxlX3Nob3crMHg2Yi8weGEwClsgICA1MC4wODQ3MThdICBkZXZfYXR0
cl9zaG93KzB4MTQvMHg0MApbICAgNTAuMDg1MTc0XSAgc3lzZnNfa2Zfc2VxX3Nob3crMHhhOC8w
eGYwClsgICA1MC4wODU2MjldICBzZXFfcmVhZCsweDE0MS8weDNkMApbICAgNTAuMDg2MDE3XSAg
X192ZnNfcmVhZCsweDFlLzB4MTcwClsgICA1MC4wODY0MzhdICA/IGZyZWVfdW5yZWZfcGFnZV9w
cmVwYXJlKzB4ZDEvMHgxODAKWyAgIDUwLjA4NzAwMl0gIHZmc19yZWFkKzB4OWUvMHgxMzAKWyAg
IDUwLjA4NzQyMF0gIGtzeXNfcmVhZCsweDNkLzB4YTAKWyAgIDUwLjA4NzgzN10gIGRvX2ludDgw
X3N5c2NhbGxfMzIrMHg0NS8weGYwClsgICA1MC4wODgzNDVdICBlbnRyeV9JTlQ4MF9jb21wYXQr
MHg4Mi8weDg3ClsgICA1MC4wODg4NDRdIENSMjogMDAwMDAwMDAwMDAwMDAwNgpbICAgNTAuMDg5
Mjc2XSAtLS1bIGVuZCB0cmFjZSBkMmQwMzVkNzdjM2I0MjhkIF0tLS0KCgpUbyByZXByb2R1Y2U6
CgogICAgICAgIGdpdCBjbG9uZSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzLmdpdCI+aHR0cHM6Ly9naXRodWIu
Y29tL2ludGVsL2xrcC10ZXN0cy5naXQ8L2E+CiAgICAgICAgY2QgbGtwLXRlc3RzCiAgICAgICAg
YmluL2xrcCBxZW11IC1rICZsdDtiekltYWdlJmd0OyBqb2Itc2NyaXB0ICMgam9iLXNjcmlwdCBp
cyBhdHRhY2hlZCBpbiB0aGlzIGVtYWlsCgoKClRoYW5rcywKUm9uZyBDaGVuCjwvcHJlPgogICAg
ICA8YnI+CiAgICAgIDxmaWVsZHNldCBjbGFzcz0ibWltZUF0dGFjaG1lbnRIZWFkZXIiPjwvZmll
bGRzZXQ+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+X19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTEtQIG1haWxpbmcgbGlzdAo8
YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86TEtQQGxpc3Rz
LjAxLm9yZyI+TEtQQGxpc3RzLjAxLm9yZzwvYT4KPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVl
dGV4dCIgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9sa3AiPmh0
dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vbGtwPC9hPgo8L3ByZT4KICAgIDwv
YmxvY2txdW90ZT4KICA8L2JvZHk+CjwvaHRtbD4K

--===============6551485897165682861==--

