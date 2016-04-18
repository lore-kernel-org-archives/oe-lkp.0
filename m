Content-Type: multipart/mixed; boundary="===============1007491215038443414=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [test] 265bbb5704: BUG: unable to handle kernel paging request at e8e04dec
Date: Sun, 17 Apr 2016 19:00:59 -0700
Message-ID: <CAB=NE6Xz8Dp8+ZA2JXOTuhx+HO=H1bDHKm74N+iF_1e1VcBB=g@mail.gmail.com>
In-Reply-To: <CAB=NE6WFCba6K05YG35NtT3drgscu6uRQeS+zGoGHfUMWUqu1A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1007491215038443414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've been making some changes to fix this before posting patches, and
pushed a few branches out to kernel.org a few days ago now but haven't even
heard of a build status which typically has taken about ~3 hours or so.

Now I haven't heard from 0-day for a few days about build / tun time status
of a few branches I've pushed out both on my linux.git and linux-next.git
and starting to wonder if there may be an issue or real long term
maintenance thing going on ? The sysdata branches also had a timout occur
on one build so wondering if perhaps there are rules that put your trees or
branches in a dark corner to avoid delays in 0-day ?

How do I check to make sure I'm OK ?

  Luis
On Apr 14, 2016 3:12 AM, "kernel test robot" <xiaolong.ye@intel.com> wrot=
e:

FYI, we noticed that kernel panic due to "BUG: unable to handle kernel
paging request at e8e04dec"
with your commit.

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
20160412-sysdata-v1
commit 265bbb5704d63eac3bdf81fe28b566b572a10d89 ("test: add sysdata loader
tester")


[    4.716154] Driver for 1-wire Dallas network protocol.
[    5.108702] f71882fg: Not a Fintek device
[    5.109238] f71882fg: Not a Fintek device
[    5.496811] BUG: unable to handle kernel paging request at e8e04dec
[    5.497564] IP: [<c13bff9e>] kobject_get+0xe/0xb0
[    5.498132] *pdpt =3D 000000000209c001 *pde =3D 0000000000000000
[    5.498782] Oops: 0000 [#1] PREEMPT SMP
[    5.499216] Modules linked in:
[    5.499587] CPU: 0 PID: 25 Comm: kworker/0:1 Not tainted
4.6.0-rc3-next-20160412-00002-g265bbb5 #261
[    5.500565] Workqueue: events do_init_work
[    5.501030] task: ca034000 ti: ca036000 task.ti: ca036000
[    5.501608] EIP: 0060:[<c13bff9e>] EFLAGS: 00010286 CPU: 0
[    5.502232] EIP is at kobject_get+0xe/0xb0
[    5.502677] EAX: e8e04dcc EBX: e8e04dcc ECX: 00000000 EDX: 00000000
[    5.503363] ESI: cb8365c0 EDI: 00000000 EBP: ca037de8 ESP: ca037dcc
[    5.504050]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
[    5.504636] CR0: 80050033 CR2: e8e04dec CR3: 0209f000 CR4: 000006b0
[    5.505314] Stack:
[    5.505550]  c193f43f cb8365b8 cb8365c0 00000000 00000000 e8e04dc4
cb8365c0 ca037e2c
[    5.506507]  c14d311d ffffffff 00000000 ca037e10 c11c2673 c118fc9d
c013cd40 cb8365c0
[    5.507450]  cb8365b8 ca037e18 c118fc9d ca037e2c c13c08ba 00000000
cb8365c0 cb8365b8
[    5.508400] Call Trace:
[    5.508704]  [<c193f43f>] ? klist_init+0x2f/0x50
[    5.509220]  [<c14d311d>] device_add+0xdd/0x650
[    5.509738]  [<c11c2673>] ? kfree+0x93/0x280
[    5.510232]  [<c118fc9d>] ? kfree_const+0x1d/0x30
[    5.510740]  [<c118fc9d>] ? kfree_const+0x1d/0x30
[    5.511252]  [<c13c08ba>] ? kobject_set_name_vargs+0x6a/0xa0
[    5.511865]  [<c14d3897>] device_create_groups_vargs+0xe7/0x100
[    5.512504]  [<c14d393f>] device_create_with_groups+0x2f/0x40
[    5.513146]  [<c14c5e23>] misc_register+0x163/0x1b0
[    5.513685]  [<c13dc44d>] do_init_work+0x4d/0xd0
[    5.514214]  [<c1085994>] process_one_work+0x2c4/0x950
[    5.514768]  [<c10858a7>] ? process_one_work+0x1d7/0x950
[    5.515359]  [<c108639a>] worker_thread+0x37a/0x640
[    5.515908]  [<c1086020>] ? process_one_work+0x950/0x950
[    5.516477]  [<c108c011>] kthread+0xa1/0xc0
[    5.516951]  [<c194af09>] ret_from_kernel_thread+0x21/0x38
[    5.517546]  [<c108bf70>] ? kthread_unpark+0x50/0x50
[    5.518112] Code: 54 cd c1 89 55 f8 e8 2e 79 da ff e8 ba d2 ff ff 8b 55
f8 eb 9f b8 08 54 cd c1 eb c1 90 55 89 e5 56 53 89 c3 83 ec 14 85 c0 74 38
<f6> 40 20 01 74 6c b8 01 00 00 00 3e 0f c1 43 1c 8d 70 01 31 c9
[    5.521217] EIP: [<c13bff9e>] kobject_get+0xe/0xb0 SS:ESP 0068:ca037dcc
[    5.522006] CR2: 00000000e8e04dec
[    5.522383] ---[ end trace e8742962ac65bac4 ]---
[    5.522897] Kernel panic - not syncing: Fatal exception


FYI, raw QEMU command line is:

        qemu-system-i386 -enable-kvm -kernel
/pkg/linux/i386-randconfig-i0-201615/gcc-5/265bbb5704d63eac3bdf81fe28b566b5=
72a10d89/vmlinuz-4.6.0-rc3-next-20160412-00002-g265bbb5
-append 'root=3D/dev/ram0 user=3Dlkp
job=3D/lkp/scheduled/vm-lkp-wsx03-openwrt-i386-20/rand_boot-1-openwrt-i386.=
cgz-i386-randconfig-i0-201615-265bbb5704d63eac3bdf81fe28b566b572a10d89-2016=
0413-23967-gfd6wz-0.yaml
ARCH=3Di386 kconfig=3Di386-randconfig-i0-201615
branch=3Dmcgrof-next/20160412-sysdata-v1
commit=3D265bbb5704d63eac3bdf81fe28b566b572a10d89
BOOT_IMAGE=3D/pkg/linux/i386-randconfig-i0-201615/gcc-5/265bbb5704d63eac3bd=
f81fe28b566b572a10d89/vmlinuz-4.6.0-rc3-next-20160412-00002-g265bbb5
max_uptime=3D600
RESULT_ROOT=3D/result/boot/1/vm-lkp-wsx03-openwrt-i386/openwrt-i386.cgz/i38=
6-randconfig-i0-201615/gcc-5/265bbb5704d63eac3bdf81fe28b566b572a10d89/0
LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug
apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 pani=
c=3D-1
softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2
prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw
ip=3D::::vm-lkp-wsx03-openwrt-i386-20::dhcp drbd.minor_count=3D8'  -initrd
/fs/sdc1/initrd-vm-lkp-wsx03-openwrt-i386-20 -m 192 -smp 1 -device
e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -wat=
chdog
i6300esb -rtc base=3Dlocaltime -drive
file=3D/fs/sdc1/disk0-vm-lkp-wsx03-openwrt-i386-20,media=3Ddisk,if=3Dvirtio
-drive
file=3D/fs/sdc1/disk1-vm-lkp-wsx03-openwrt-i386-20,media=3Ddisk,if=3Dvirtio
-pidfile /dev/shm/kboot/pid-vm-lkp-wsx03-openwrt-i386-20 -serial
file:/dev/shm/kboot/serial-vm-lkp-wsx03-openwrt-i386-20 -daemonize -display
none -monitor null





Thanks,
Xiaolong Ye

--===============1007491215038443414==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PHAgZGlyPSJsdHIiPkkmIzM5O3ZlIGJlZW4gbWFraW5nIHNvbWUgY2hhbmdlcyB0byBmaXggdGhp
cyBiZWZvcmUgcG9zdGluZyBwYXRjaGVzLCBhbmQgcHVzaGVkIGEgZmV3IGJyYW5jaGVzIG91dCB0
byA8YSBocmVmPSJodHRwOi8va2VybmVsLm9yZyI+a2VybmVsLm9yZzwvYT4gYSBmZXcgZGF5cyBh
Z28gbm93IGJ1dCBoYXZlbiYjMzk7dCBldmVuIGhlYXJkIG9mIGEgYnVpbGQgc3RhdHVzIHdoaWNo
IHR5cGljYWxseSBoYXMgdGFrZW4gYWJvdXQgfjMgaG91cnMgb3Igc28uPC9wPgo8cCBkaXI9Imx0
ciI+Tm93IEkgaGF2ZW4mIzM5O3QgaGVhcmQgZnJvbSAwLWRheSBmb3IgYSBmZXcgZGF5cyBhYm91
dCBidWlsZCAvIHR1biB0aW1lIHN0YXR1cyBvZiBhIGZldyBicmFuY2hlcyBJJiMzOTt2ZSBwdXNo
ZWQgb3V0IGJvdGggb24gbXkgbGludXguZ2l0IGFuZCBsaW51eC1uZXh0LmdpdCBhbmQgc3RhcnRp
bmcgdG8gd29uZGVyIGlmIHRoZXJlIG1heSBiZSBhbiBpc3N1ZSBvciByZWFsIGxvbmcgdGVybSBt
YWludGVuYW5jZSB0aGluZyBnb2luZyBvbiA/IFRoZSBzeXNkYXRhIGJyYW5jaGVzIGFsc28gaGFk
IGEgdGltb3V0IG9jY3VyIG9uIG9uZSBidWlsZCBzbyB3b25kZXJpbmcgaWYgcGVyaGFwcyB0aGVy
ZSBhcmUgcnVsZXMgdGhhdCBwdXQgeW91ciB0cmVlcyBvciBicmFuY2hlcyBpbiBhIGRhcmsgY29y
bmVyIHRvIGF2b2lkIGRlbGF5cyBpbiAwLWRheSA/PC9wPgo8cCBkaXI9Imx0ciI+SG93IGRvIEkg
Y2hlY2sgdG8gbWFrZSBzdXJlIEkmIzM5O20gT0sgPzwvcD4KPHAgZGlyPSJsdHIiPsKgIEx1aXM8
L3A+CjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBBcHIgMTQsIDIwMTYgMzoxMiBBTSwgJnF1
b3Q7a2VybmVsIHRlc3Qgcm9ib3QmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzp4aWFvbG9uZy55
ZUBpbnRlbC5jb20iPnhpYW9sb25nLnllQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxiciB0eXBl
PSJhdHRyaWJ1dGlvbiI+PGJsb2NrcXVvdGUgY2xhc3M9InF1b3RlIiBzdHlsZT0ibWFyZ2luOjAg
MCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+RllJ
LCB3ZSBub3RpY2VkIHRoYXQga2VybmVsIHBhbmljIGR1ZSB0byAmcXVvdDtCVUc6IHVuYWJsZSB0
byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IGU4ZTA0ZGVjJnF1b3Q7PGJyPgp3aXRo
IHlvdXIgY29tbWl0Ljxicj4KPGJyPgo8YSBocmVmPSJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9tY2dyb2YvbGludXgtbmV4dC5naXQiIHJlbD0ibm9yZWZl
cnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L21jZ3JvZi9saW51eC1uZXh0LmdpdDwvYT4gMjAxNjA0MTItc3lzZGF0YS12
MTxicj4KY29tbWl0IDI2NWJiYjU3MDRkNjNlYWMzYmRmODFmZTI4YjU2NmI1NzJhMTBkODkgKCZx
dW90O3Rlc3Q6IGFkZCBzeXNkYXRhIGxvYWRlciB0ZXN0ZXImcXVvdDspPGJyPgo8YnI+Cjxicj4K
W8KgIMKgIDQuNzE2MTU0XSBEcml2ZXIgZm9yIDEtd2lyZSBEYWxsYXMgbmV0d29yayBwcm90b2Nv
bC48YnI+ClvCoCDCoCA1LjEwODcwMl0gZjcxODgyZmc6IE5vdCBhIEZpbnRlayBkZXZpY2U8YnI+
ClvCoCDCoCA1LjEwOTIzOF0gZjcxODgyZmc6IE5vdCBhIEZpbnRlayBkZXZpY2U8YnI+ClvCoCDC
oCA1LjQ5NjgxMV0gQlVHOiB1bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBh
dCBlOGUwNGRlYzxicj4KW8KgIMKgIDUuNDk3NTY0XSBJUDogWyZsdDtjMTNiZmY5ZSZndDtdIGtv
YmplY3RfZ2V0KzB4ZS8weGIwPGJyPgpbwqAgwqAgNS40OTgxMzJdICpwZHB0ID0gMDAwMDAwMDAw
MjA5YzAwMSAqcGRlID0gMDAwMDAwMDAwMDAwMDAwMDxicj4KW8KgIMKgIDUuNDk4NzgyXSBPb3Bz
OiAwMDAwIFsjMV0gUFJFRU1QVCBTTVA8YnI+ClvCoCDCoCA1LjQ5OTIxNl0gTW9kdWxlcyBsaW5r
ZWQgaW46PGJyPgpbwqAgwqAgNS40OTk1ODddIENQVTogMCBQSUQ6IDI1IENvbW06IGt3b3JrZXIv
MDoxIE5vdCB0YWludGVkIDQuNi4wLXJjMy1uZXh0LTIwMTYwNDEyLTAwMDAyLWcyNjViYmI1ICMy
NjE8YnI+ClvCoCDCoCA1LjUwMDU2NV0gV29ya3F1ZXVlOiBldmVudHMgZG9faW5pdF93b3JrPGJy
PgpbwqAgwqAgNS41MDEwMzBdIHRhc2s6IGNhMDM0MDAwIHRpOiBjYTAzNjAwMCB0YXNrLnRpOiBj
YTAzNjAwMDxicj4KW8KgIMKgIDUuNTAxNjA4XSBFSVA6IDAwNjA6WyZsdDtjMTNiZmY5ZSZndDtd
IEVGTEFHUzogMDAwMTAyODYgQ1BVOiAwPGJyPgpbwqAgwqAgNS41MDIyMzJdIEVJUCBpcyBhdCBr
b2JqZWN0X2dldCsweGUvMHhiMDxicj4KW8KgIMKgIDUuNTAyNjc3XSBFQVg6IGU4ZTA0ZGNjIEVC
WDogZThlMDRkY2MgRUNYOiAwMDAwMDAwMCBFRFg6IDAwMDAwMDAwPGJyPgpbwqAgwqAgNS41MDMz
NjNdIEVTSTogY2I4MzY1YzAgRURJOiAwMDAwMDAwMCBFQlA6IGNhMDM3ZGU4IEVTUDogY2EwMzdk
Y2M8YnI+ClvCoCDCoCA1LjUwNDA1MF3CoCBEUzogMDA3YiBFUzogMDA3YiBGUzogMDBkOCBHUzog
MDAwMCBTUzogMDA2ODxicj4KW8KgIMKgIDUuNTA0NjM2XSBDUjA6IDgwMDUwMDMzIENSMjogZThl
MDRkZWMgQ1IzOiAwMjA5ZjAwMCBDUjQ6IDAwMDAwNmIwPGJyPgpbwqAgwqAgNS41MDUzMTRdIFN0
YWNrOjxicj4KW8KgIMKgIDUuNTA1NTUwXcKgIGMxOTNmNDNmIGNiODM2NWI4IGNiODM2NWMwIDAw
MDAwMDAwIDAwMDAwMDAwIGU4ZTA0ZGM0IGNiODM2NWMwIGNhMDM3ZTJjPGJyPgpbwqAgwqAgNS41
MDY1MDddwqAgYzE0ZDMxMWQgZmZmZmZmZmYgMDAwMDAwMDAgY2EwMzdlMTAgYzExYzI2NzMgYzEx
OGZjOWQgYzAxM2NkNDAgY2I4MzY1YzA8YnI+ClvCoCDCoCA1LjUwNzQ1MF3CoCBjYjgzNjViOCBj
YTAzN2UxOCBjMTE4ZmM5ZCBjYTAzN2UyYyBjMTNjMDhiYSAwMDAwMDAwMCBjYjgzNjVjMCBjYjgz
NjViODxicj4KW8KgIMKgIDUuNTA4NDAwXSBDYWxsIFRyYWNlOjxicj4KW8KgIMKgIDUuNTA4NzA0
XcKgIFsmbHQ7YzE5M2Y0M2YmZ3Q7XSA/IGtsaXN0X2luaXQrMHgyZi8weDUwPGJyPgpbwqAgwqAg
NS41MDkyMjBdwqAgWyZsdDtjMTRkMzExZCZndDtdIGRldmljZV9hZGQrMHhkZC8weDY1MDxicj4K
W8KgIMKgIDUuNTA5NzM4XcKgIFsmbHQ7YzExYzI2NzMmZ3Q7XSA/IGtmcmVlKzB4OTMvMHgyODA8
YnI+ClvCoCDCoCA1LjUxMDIzMl3CoCBbJmx0O2MxMThmYzlkJmd0O10gPyBrZnJlZV9jb25zdCsw
eDFkLzB4MzA8YnI+ClvCoCDCoCA1LjUxMDc0MF3CoCBbJmx0O2MxMThmYzlkJmd0O10gPyBrZnJl
ZV9jb25zdCsweDFkLzB4MzA8YnI+ClvCoCDCoCA1LjUxMTI1Ml3CoCBbJmx0O2MxM2MwOGJhJmd0
O10gPyBrb2JqZWN0X3NldF9uYW1lX3ZhcmdzKzB4NmEvMHhhMDxicj4KW8KgIMKgIDUuNTExODY1
XcKgIFsmbHQ7YzE0ZDM4OTcmZ3Q7XSBkZXZpY2VfY3JlYXRlX2dyb3Vwc192YXJncysweGU3LzB4
MTAwPGJyPgpbwqAgwqAgNS41MTI1MDRdwqAgWyZsdDtjMTRkMzkzZiZndDtdIGRldmljZV9jcmVh
dGVfd2l0aF9ncm91cHMrMHgyZi8weDQwPGJyPgpbwqAgwqAgNS41MTMxNDZdwqAgWyZsdDtjMTRj
NWUyMyZndDtdIG1pc2NfcmVnaXN0ZXIrMHgxNjMvMHgxYjA8YnI+ClvCoCDCoCA1LjUxMzY4NV3C
oCBbJmx0O2MxM2RjNDRkJmd0O10gZG9faW5pdF93b3JrKzB4NGQvMHhkMDxicj4KW8KgIMKgIDUu
NTE0MjE0XcKgIFsmbHQ7YzEwODU5OTQmZ3Q7XSBwcm9jZXNzX29uZV93b3JrKzB4MmM0LzB4OTUw
PGJyPgpbwqAgwqAgNS41MTQ3NjhdwqAgWyZsdDtjMTA4NThhNyZndDtdID8gcHJvY2Vzc19vbmVf
d29yaysweDFkNy8weDk1MDxicj4KW8KgIMKgIDUuNTE1MzU5XcKgIFsmbHQ7YzEwODYzOWEmZ3Q7
XSB3b3JrZXJfdGhyZWFkKzB4MzdhLzB4NjQwPGJyPgpbwqAgwqAgNS41MTU5MDhdwqAgWyZsdDtj
MTA4NjAyMCZndDtdID8gcHJvY2Vzc19vbmVfd29yaysweDk1MC8weDk1MDxicj4KW8KgIMKgIDUu
NTE2NDc3XcKgIFsmbHQ7YzEwOGMwMTEmZ3Q7XSBrdGhyZWFkKzB4YTEvMHhjMDxicj4KW8KgIMKg
IDUuNTE2OTUxXcKgIFsmbHQ7YzE5NGFmMDkmZ3Q7XSByZXRfZnJvbV9rZXJuZWxfdGhyZWFkKzB4
MjEvMHgzODxicj4KW8KgIMKgIDUuNTE3NTQ2XcKgIFsmbHQ7YzEwOGJmNzAmZ3Q7XSA/IGt0aHJl
YWRfdW5wYXJrKzB4NTAvMHg1MDxicj4KW8KgIMKgIDUuNTE4MTEyXSBDb2RlOiA1NCBjZCBjMSA4
OSA1NSBmOCBlOCAyZSA3OSBkYSBmZiBlOCBiYSBkMiBmZiBmZiA4YiA1NSBmOCBlYiA5ZiBiOCAw
OCA1NCBjZCBjMSBlYiBjMSA5MCA1NSA4OSBlNSA1NiA1MyA4OSBjMyA4MyBlYyAxNCA4NSBjMCA3
NCAzOCAmbHQ7ZjYmZ3Q7IDQwIDIwIDAxIDc0IDZjIGI4IDAxIDAwIDAwIDAwIDNlIDBmIGMxIDQz
IDFjIDhkIDcwIDAxIDMxIGM5PGJyPgpbwqAgwqAgNS41MjEyMTddIEVJUDogWyZsdDtjMTNiZmY5
ZSZndDtdIGtvYmplY3RfZ2V0KzB4ZS8weGIwIFNTOkVTUCAwMDY4OmNhMDM3ZGNjPGJyPgpbwqAg
wqAgNS41MjIwMDZdIENSMjogMDAwMDAwMDBlOGUwNGRlYzxicj4KW8KgIMKgIDUuNTIyMzgzXSAt
LS1bIGVuZCB0cmFjZSBlODc0Mjk2MmFjNjViYWM0IF0tLS08YnI+ClvCoCDCoCA1LjUyMjg5N10g
S2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbjxicj4KPGJyPgo8YnI+
CkZZSSwgcmF3IFFFTVUgY29tbWFuZCBsaW5lIGlzOjxicj4KPGJyPgrCoCDCoCDCoCDCoCBxZW11
LXN5c3RlbS1pMzg2IC1lbmFibGUta3ZtIC1rZXJuZWwgL3BrZy9saW51eC9pMzg2LXJhbmRjb25m
aWctaTAtMjAxNjE1L2djYy01LzI2NWJiYjU3MDRkNjNlYWMzYmRmODFmZTI4YjU2NmI1NzJhMTBk
ODkvdm1saW51ei00LjYuMC1yYzMtbmV4dC0yMDE2MDQxMi0wMDAwMi1nMjY1YmJiNSAtYXBwZW5k
ICYjMzk7cm9vdD0vZGV2L3JhbTAgdXNlcj1sa3Agam9iPS9sa3Avc2NoZWR1bGVkL3ZtLWxrcC13
c3gwMy1vcGVud3J0LWkzODYtMjAvcmFuZF9ib290LTEtb3BlbndydC1pMzg2LmNnei1pMzg2LXJh
bmRjb25maWctaTAtMjAxNjE1LTI2NWJiYjU3MDRkNjNlYWMzYmRmODFmZTI4YjU2NmI1NzJhMTBk
ODktMjAxNjA0MTMtMjM5NjctZ2ZkNnd6LTAueWFtbCBBUkNIPWkzODYga2NvbmZpZz1pMzg2LXJh
bmRjb25maWctaTAtMjAxNjE1IGJyYW5jaD1tY2dyb2YtbmV4dC8yMDE2MDQxMi1zeXNkYXRhLXYx
IGNvbW1pdD0yNjViYmI1NzA0ZDYzZWFjM2JkZjgxZmUyOGI1NjZiNTcyYTEwZDg5IEJPT1RfSU1B
R0U9L3BrZy9saW51eC9pMzg2LXJhbmRjb25maWctaTAtMjAxNjE1L2djYy01LzI2NWJiYjU3MDRk
NjNlYWMzYmRmODFmZTI4YjU2NmI1NzJhMTBkODkvdm1saW51ei00LjYuMC1yYzMtbmV4dC0yMDE2
MDQxMi0wMDAwMi1nMjY1YmJiNSBtYXhfdXB0aW1lPTYwMCBSRVNVTFRfUk9PVD0vcmVzdWx0L2Jv
b3QvMS92bS1sa3Atd3N4MDMtb3BlbndydC1pMzg2L29wZW53cnQtaTM4Ni5jZ3ovaTM4Ni1yYW5k
Y29uZmlnLWkwLTIwMTYxNS9nY2MtNS8yNjViYmI1NzA0ZDYzZWFjM2JkZjgxZmUyOGI1NjZiNTcy
YTEwZDg5LzAgTEtQX1NFUlZFUj1pbm4gZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIHN5c3RlbWQu
bG9nX2xldmVsPWVyciBkZWJ1ZyBhcGljPWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBk
YXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0x
IG5taV93YXRjaGRvZz1wYW5pYyBvb3BzPXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1k
aXNrPTAgY29uc29sZT10dHlTMCwxMTUyMDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwgcncgaXA9
Ojo6OnZtLWxrcC13c3gwMy1vcGVud3J0LWkzODYtMjA6OmRoY3AgZHJiZC5taW5vcl9jb3VudD04
JiMzOTvCoCAtaW5pdHJkIC9mcy9zZGMxL2luaXRyZC12bS1sa3Atd3N4MDMtb3BlbndydC1pMzg2
LTIwIC1tIDE5MiAtc21wIDEgLWRldmljZSBlMTAwMCxuZXRkZXY9bmV0MCAtbmV0ZGV2IHVzZXIs
aWQ9bmV0MCAtYm9vdCBvcmRlcj1uYyAtbm8tcmVib290IC13YXRjaGRvZyBpNjMwMGVzYiAtcnRj
IGJhc2U9bG9jYWx0aW1lIC1kcml2ZSBmaWxlPS9mcy9zZGMxL2Rpc2swLXZtLWxrcC13c3gwMy1v
cGVud3J0LWkzODYtMjAsbWVkaWE9ZGlzayxpZj12aXJ0aW8gLWRyaXZlIGZpbGU9L2ZzL3NkYzEv
ZGlzazEtdm0tbGtwLXdzeDAzLW9wZW53cnQtaTM4Ni0yMCxtZWRpYT1kaXNrLGlmPXZpcnRpbyAt
cGlkZmlsZSAvZGV2L3NobS9rYm9vdC9waWQtdm0tbGtwLXdzeDAzLW9wZW53cnQtaTM4Ni0yMCAt
c2VyaWFsIGZpbGU6L2Rldi9zaG0va2Jvb3Qvc2VyaWFsLXZtLWxrcC13c3gwMy1vcGVud3J0LWkz
ODYtMjAgLWRhZW1vbml6ZSAtZGlzcGxheSBub25lIC1tb25pdG9yIG51bGw8YnI+Cjxicj4KPGJy
Pgo8YnI+Cjxicj4KPGJyPgpUaGFua3MsPGJyPgpYaWFvbG9uZyBZZTxicj4KPC9ibG9ja3F1b3Rl
PjwvZGl2Pgo=

--===============1007491215038443414==--

