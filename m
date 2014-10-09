Content-Type: multipart/mixed; boundary="===============0524936713650361840=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [mm] BUG: Int 6: CR2 (null)
Date: Thu, 09 Oct 2014 10:04:10 +0800
Message-ID: <20141009020410.GA7968@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0524936713650361840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Marek,

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit 478e86d7c8c5f41e29abb81b05b459d24bdc71a2 ("mm: cma: adjust address l=
imit to avoid hitting low/high memory boundary")


+------------------------------------------+------------+------------+
|                                          | 81febe58a8 | 478e86d7c8 |
+------------------------------------------+------------+------------+
| boot_successes                           | 10         | 0          |
| boot_failures                            | 5          | 10         |
| kernel_BUG_at_arch/x86/mm/physaddr.c     | 5          |            |
| invalid_opcode                           | 5          |            |
| EIP_is_at__phys_addr                     | 5          |            |
| Kernel_panic-not_syncing:Fatal_exception | 5          |            |
| backtrace:vm_mmap_pgoff                  | 5          |            |
| backtrace:SyS_mmap_pgoff                 | 5          |            |
| BUG:Int_CR2(null)                        | 0          | 10         |
+------------------------------------------+------------+------------+

[    0.000000] BRK [0x025ee000, 0x025eefff] PGTABLE
[    0.000000] cma: dma_contiguous_reserve(limit 13ffe000)
[    0.000000] cma: dma_contiguous_reserve: reserving 31 MiB for global area
[    0.000000] BUG: Int 6: CR2   (null)
[    0.000000]      EDI c0000000  ESI   (null)  EBP 41c11ea4  EBX 425cc101
[    0.000000]      ESP 41c11e98   ES 0000007b   DS 0000007b
[    0.000000]      EDX 00000001  ECX   (null)  EAX 41cd8150
[    0.000000]      vec 00000006  err   (null)  EIP 41072227   CS 00000060 =
 flg 00210002
[    0.000000] Stack: 425cc150   (null)   (null) 41c11ef4 41d4ee4d   (null)=
 13ffe000 41c11ec4
[    0.000000]        41c2d900   (null) 13ffe000   (null) 4185793e 0000002e=
 410c2982 41c11f00
[    0.000000]        410c2df5   (null)   (null)   (null) 425cc150 00013efe=
   (null) 41c11f28
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.17.0-next-20141008=
 #815
[    0.000000]  00000000 425cc101 41c11e48 41850786 41c11ea4 41d2b1db 41d95=
f71 00000006
[    0.000000]  00000000 c0000000 00000000 41c11ea4 425cc101 41c11e98 00000=
07b 0000007b
[    0.000000]  00000001 00000000 41cd8150 00000006 00000000 41072227 00000=
060 00210002
[    0.000000] Call Trace:
[    0.000000]  [<41850786>] dump_stack+0x16/0x18
[    0.000000]  [<41d2b1db>] early_idt_handler+0x6b/0x6b
[    0.000000]  [<41072227>] ? __phys_addr+0x2e/0xca
[    0.000000]  [<41d4ee4d>] cma_declare_contiguous+0x3c/0x2d7
[    0.000000]  [<4185793e>] ? _raw_spin_unlock_irqrestore+0x59/0x91
[    0.000000]  [<410c2982>] ? wake_up_klogd+0x8/0x33
[    0.000000]  [<410c2df5>] ? console_unlock+0x448/0x461
[    0.000000]  [<41d6d359>] dma_contiguous_reserve_area+0x27/0x47
[    0.000000]  [<41d6d4d1>] dma_contiguous_reserve+0x158/0x163
[    0.000000]  [<41d33e0f>] setup_arch+0x79b/0xc68
[    0.000000]  [<4184c0b4>] ? printk+0x1c/0x1e
[    0.000000]  [<41d2b7cf>] start_kernel+0x9c/0x456
[    0.000000]  [<41d2b2ca>] i386_start_kernel+0x79/0x7d

Elapsed time: 5
qemu-system-i386 -enable-kvm -kernel /kernel/i386-randconfig-hxb2-1008/0996=
69ed953121e1b00248f65326b6b092fa47c8/vmlinuz-3.17.0-next-20141008 -append '=
user=3Dlkp job=3D/lkp/scheduled/vm-kbuild-yocto-i386-58/rand_boot-1-yocto-m=
inimal-i386.cgz-i386-randconfig-hxb2-1008-099669ed953121e1b00248f65326b6b09=
2fa47c8-0.yaml ARCH=3Di386 BOOT_IMAGE=3D/kernel/i386-randconfig-hxb2-1008/0=
99669ed953121e1b00248f65326b6b092fa47c8/vmlinuz-3.17.0-next-20141008 kconfi=
g=3Di386-randconfig-hxb2-1008 commit=3D099669ed953121e1b00248f65326b6b092fa=
47c8 branch=3Dnext/master root=3D/dev/ram0 max_uptime=3D3600 RESULT_ROOT=3D=
/result/vm-kbuild-yocto-i386/boot/1/yocto-minimal-i386.cgz/i386-randconfig-=
hxb2-1008/099669ed953121e1b00248f65326b6b092fa47c8/0 ip=3D::::vm-kbuild-yoc=
to-i386-58::dhcp earlyprintk=3DttyS0,115200 debug apic=3Ddebug sysrq_always=
_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=
=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 =
console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw drbd.minor_count=3D8'=
  -initrd /fs/sdf1/initrd-vm-kbuild-yocto-i386-58 -m 320 -smp 2 -net nic,vl=
an=3D1,model=3De1000 -net user,vlan=3D1 -boot order=3Dnc -no-reboot -watchd=
og i6300esb -rtc base=3Dlocaltime -drive file=3D/fs/sdf1/disk0-vm-kbuild-yo=
cto-i386-58,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdf1/disk1-vm-kbuild=
-yocto-i386-58,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdf1/disk2-vm-kbu=
ild-yocto-i386-58,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdf1/disk3-vm-=
kbuild-yocto-i386-58,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdf1/disk4-=
vm-kbuild-yocto-i386-58,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdf1/dis=
k5-vm-kbuild-yocto-i386-58,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot=
/pid-vm-kbuild-yocto-i386-58 -serial file:/dev/shm/kboot/serial-vm-kbuild-y=
octo-i386-58 -daemonize -display none -monitor null =




Thanks,
Fengguang

--===============0524936713650361840==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.ksh"

TGludXggdmVyc2lvbiAzLjE3LjAtbmV4dC0yMDE0MTAwOCAjODE1CkNvbW1hbmQgbGluZTogdXNl
cj1sa3Agam9iPS9sa3Avc2NoZWR1bGVkL3ZtLWtidWlsZC15b2N0by1pMzg2LTU4L3JhbmRfYm9v
dC0xLXlvY3RvLW1pbmltYWwtaTM4Ni5jZ3otaTM4Ni1yYW5kY29uZmlnLWh4YjItMTAwOC0wOTk2
NjllZDk1MzEyMWUxYjAwMjQ4ZjY1MzI2YjZiMDkyZmE0N2M4LTAueWFtbCBBUkNIPWkzODYgQk9P
VF9JTUFHRT0va2VybmVsL2kzODYtcmFuZGNvbmZpZy1oeGIyLTEwMDgvMDk5NjY5ZWQ5NTMxMjFl
MWIwMDI0OGY2NTMyNmI2YjA5MmZhNDdjOC92bWxpbnV6LTMuMTcuMC1uZXh0LTIwMTQxMDA4IGtj
b25maWc9aTM4Ni1yYW5kY29uZmlnLWh4YjItMTAwOCBjb21taXQ9MDk5NjY5ZWQ5NTMxMjFlMWIw
MDI0OGY2NTMyNmI2YjA5MmZhNDdjOCBicmFuY2g9bmV4dC9tYXN0ZXIgcm9vdD0vZGV2L3JhbTAg
bWF4X3VwdGltZT0zNjAwIFJFU1VMVF9ST09UPS9yZXN1bHQvdm0ta2J1aWxkLXlvY3RvLWkzODYv
Ym9vdC8xL3lvY3RvLW1pbmltYWwtaTM4Ni5jZ3ovaTM4Ni1yYW5kY29uZmlnLWh4YjItMTAwOC8w
OTk2NjllZDk1MzEyMWUxYjAwMjQ4ZjY1MzI2YjZiMDkyZmE0N2M4LzAgaXA9Ojo6OnZtLWtidWls
ZC15b2N0by1pMzg2LTU4OjpkaGNwIGVhcmx5cHJpbnRrPXR0eVMwLDExNTIwMCBkZWJ1ZyBhcGlj
PWRlYnVnIHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91
dD0xMDAgcGFuaWM9LTEgc29mdGxvY2t1cF9wYW5pYz0xIG5taV93YXRjaGRvZz1wYW5pYyBvb3Bz
PXBhbmljIGxvYWRfcmFtZGlzaz0yIHByb21wdF9yYW1kaXNrPTAgY29uc29sZT10dHlTMCwxMTUy
MDAgY29uc29sZT10dHkwIHZnYT1ub3JtYWwgcncgZHJiZC5taW5vcl9jb3VudD04CgplYXJseSBj
b25zb2xlIGluIHNldHVwIGNvZGUKUHJvYmluZyBFREQgKGVkZD1vZmYgdG8gZGlzYWJsZSkuLi4g
b2sKZWFybHkgY29uc29sZSBpbiBkZWNvbXByZXNzX2tlcm5lbAoKRGVjb21wcmVzc2luZyBMaW51
eC4uLiBQYXJzaW5nIEVMRi4uLiBkb25lLgpCb290aW5nIHRoZSBrZXJuZWwuClsgICAgMC4wMDAw
MDBdIEluaXRpYWxpemluZyBjZ3JvdXAgc3Vic3lzIGNwdQpbICAgIDAuMDAwMDAwXSBMaW51eCB2
ZXJzaW9uIDMuMTcuMC1uZXh0LTIwMTQxMDA4IChrYnVpbGRAbGtwLWhzeDAyKSAoZ2NjIHZlcnNp
b24gNC45LjEgKERlYmlhbiA0LjkuMS0xMSkgKSAjODE1IFdlZCBPY3QgOCAxNjowMzowNyBDU1Qg
MjAxNApbICAgIDAuMDAwMDAwXSBLRVJORUwgc3VwcG9ydGVkIGNwdXM6ClsgICAgMC4wMDAwMDBd
ICAgQU1EIEF1dGhlbnRpY0FNRApbICAgIDAuMDAwMDAwXSAgIE5TQyBHZW9kZSBieSBOU0MKWyAg
ICAwLjAwMDAwMF0gICBDeXJpeCBDeXJpeEluc3RlYWQKWyAgICAwLjAwMDAwMF0gICBUcmFuc21l
dGEgR2VudWluZVRNeDg2ClsgICAgMC4wMDAwMDBdICAgVHJhbnNtZXRhIFRyYW5zbWV0YUNQVQpb
ICAgIDAuMDAwMDAwXSBDUFU6IHZlbmRvcl9pZCAnR2VudWluZUludGVsJyB1bmtub3duLCB1c2lu
ZyBnZW5lcmljIGluaXQuClsgICAgMC4wMDAwMDBdIENQVTogWW91ciBzeXN0ZW0gbWF5IGJlIHVu
c3RhYmxlLgpbICAgIDAuMDAwMDAwXSBlODIwOiBCSU9TLXByb3ZpZGVkIHBoeXNpY2FsIFJBTSBt
YXA6ClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwMDAwMDAtMHgw
MDAwMDAwMDAwMDlmYmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4
MDAwMDAwMDAwMDA5ZmMwMC0weDAwMDAwMDAwMDAwOWZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAw
MDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwZjAwMDAtMHgwMDAwMDAwMDAwMGZmZmZm
XSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMDAwMTAw
MDAwLTB4MDAwMDAwMDAxM2ZmZGZmZl0gdXNhYmxlClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDog
W21lbSAweDAwMDAwMDAwMTNmZmUwMDAtMHgwMDAwMDAwMDEzZmZmZmZmXSByZXNlcnZlZApbICAg
IDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMGZlZmZjMDAwLTB4MDAwMDAwMDBm
ZWZmZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAw
MDBmZmZjMDAwMC0weDAwMDAwMDAwZmZmZmZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIGJv
b3Rjb25zb2xlIFtlYXJseXNlcjBdIGVuYWJsZWQKWyAgICAwLjAwMDAwMF0gTm90aWNlOiBOWCAo
RXhlY3V0ZSBEaXNhYmxlKSBwcm90ZWN0aW9uIG1pc3NpbmcgaW4gQ1BVIQpbICAgIDAuMDAwMDAw
XSBIeXBlcnZpc29yIGRldGVjdGVkOiBLVk0KWyAgICAwLjAwMDAwMF0gZTgyMDogdXBkYXRlIFtt
ZW0gMHgwMDAwMDAwMC0weDAwMDAwZmZmXSB1c2FibGUgPT0+IHJlc2VydmVkClsgICAgMC4wMDAw
MDBdIGU4MjA6IHJlbW92ZSBbbWVtIDB4MDAwYTAwMDAtMHgwMDBmZmZmZl0gdXNhYmxlClsgICAg
MC4wMDAwMDBdIGU4MjA6IGxhc3RfcGZuID0gMHgxM2ZmZSBtYXhfYXJjaF9wZm4gPSAweDEwMDAw
MDAKWyAgICAwLjAwMDAwMF0gU2NhbiBmb3IgU01QIGluIFttZW0gMHgwMDAwMDAwMC0weDAwMDAw
M2ZmXQpbICAgIDAuMDAwMDAwXSBTY2FuIGZvciBTTVAgaW4gW21lbSAweDAwMDlmYzAwLTB4MDAw
OWZmZmZdClsgICAgMC4wMDAwMDBdIFNjYW4gZm9yIFNNUCBpbiBbbWVtIDB4MDAwZjAwMDAtMHgw
MDBmZmZmZl0KWyAgICAwLjAwMDAwMF0gZm91bmQgU01QIE1QLXRhYmxlIGF0IFttZW0gMHgwMDBm
ZGFjMC0weDAwMGZkYWNmXSBtYXBwZWQgYXQgWzQwMGZkYWMwXQpbICAgIDAuMDAwMDAwXSAgIG1w
YzogZmRhZDAtZmRiZWMKWyAgICAwLjAwMDAwMF0gaW5pdGlhbCBtZW1vcnkgbWFwcGVkOiBbbWVt
IDB4MDAwMDAwMDAtMHgwMzNmZmZmZl0KWyAgICAwLjAwMDAwMF0gQmFzZSBtZW1vcnkgdHJhbXBv
bGluZSBhdCBbNDAwOWIwMDBdIDliMDAwIHNpemUgMTYzODQKWyAgICAwLjAwMDAwMF0gaW5pdF9t
ZW1vcnlfbWFwcGluZzogW21lbSAweDAwMDAwMDAwLTB4MDAwZmZmZmZdClsgICAgMC4wMDAwMDBd
ICBbbWVtIDB4MDAwMDAwMDAtMHgwMDBmZmZmZl0gcGFnZSA0awpbICAgIDAuMDAwMDAwXSBpbml0
X21lbW9yeV9tYXBwaW5nOiBbbWVtIDB4MTNhMDAwMDAtMHgxM2JmZmZmZl0KWyAgICAwLjAwMDAw
MF0gIFttZW0gMHgxM2EwMDAwMC0weDEzYmZmZmZmXSBwYWdlIDJNClsgICAgMC4wMDAwMDBdIGlu
aXRfbWVtb3J5X21hcHBpbmc6IFttZW0gMHgxMDAwMDAwMC0weDEzOWZmZmZmXQpbICAgIDAuMDAw
MDAwXSAgW21lbSAweDEwMDAwMDAwLTB4MTM5ZmZmZmZdIHBhZ2UgMk0KWyAgICAwLjAwMDAwMF0g
aW5pdF9tZW1vcnlfbWFwcGluZzogW21lbSAweDAwMTAwMDAwLTB4MGZmZmZmZmZdClsgICAgMC4w
MDAwMDBdICBbbWVtIDB4MDAxMDAwMDAtMHgwMDFmZmZmZl0gcGFnZSA0awpbICAgIDAuMDAwMDAw
XSAgW21lbSAweDAwMjAwMDAwLTB4MGZmZmZmZmZdIHBhZ2UgMk0KWyAgICAwLjAwMDAwMF0gaW5p
dF9tZW1vcnlfbWFwcGluZzogW21lbSAweDEzYzAwMDAwLTB4MTNmZmRmZmZdClsgICAgMC4wMDAw
MDBdICBbbWVtIDB4MTNjMDAwMDAtMHgxM2RmZmZmZl0gcGFnZSAyTQpbICAgIDAuMDAwMDAwXSAg
W21lbSAweDEzZTAwMDAwLTB4MTNmZmRmZmZdIHBhZ2UgNGsKWyAgICAwLjAwMDAwMF0gQlJLIFsw
eDAyNWVkMDAwLCAweDAyNWVkZmZmXSBQR1RBQkxFClsgICAgMC4wMDAwMDBdIEJSSyBbMHgwMjVl
ZTAwMCwgMHgwMjVlZWZmZl0gUEdUQUJMRQpbICAgIDAuMDAwMDAwXSBjbWE6IGRtYV9jb250aWd1
b3VzX3Jlc2VydmUobGltaXQgMTNmZmUwMDApClsgICAgMC4wMDAwMDBdIGNtYTogZG1hX2NvbnRp
Z3VvdXNfcmVzZXJ2ZTogcmVzZXJ2aW5nIDMxIE1pQiBmb3IgZ2xvYmFsIGFyZWEKWyAgICAwLjAw
MDAwMF0gQlVHOiBJbnQgNjogQ1IyICAgKG51bGwpClsgICAgMC4wMDAwMDBdICAgICAgRURJIGMw
MDAwMDAwICBFU0kgICAobnVsbCkgIEVCUCA0MWMxMWVhNCAgRUJYIDQyNWNjMTAxClsgICAgMC4w
MDAwMDBdICAgICAgRVNQIDQxYzExZTk4ICAgRVMgMDAwMDAwN2IgICBEUyAwMDAwMDA3YgpbICAg
IDAuMDAwMDAwXSAgICAgIEVEWCAwMDAwMDAwMSAgRUNYICAgKG51bGwpICBFQVggNDFjZDgxNTAK
WyAgICAwLjAwMDAwMF0gICAgICB2ZWMgMDAwMDAwMDYgIGVyciAgIChudWxsKSAgRUlQIDQxMDcy
MjI3ICAgQ1MgMDAwMDAwNjAgIGZsZyAwMDIxMDAwMgpbICAgIDAuMDAwMDAwXSBTdGFjazogNDI1
Y2MxNTAgICAobnVsbCkgICAobnVsbCkgNDFjMTFlZjQgNDFkNGVlNGQgICAobnVsbCkgMTNmZmUw
MDAgNDFjMTFlYzQKWyAgICAwLjAwMDAwMF0gICAgICAgIDQxYzJkOTAwICAgKG51bGwpIDEzZmZl
MDAwICAgKG51bGwpIDQxODU3OTNlIDAwMDAwMDJlIDQxMGMyOTgyIDQxYzExZjAwClsgICAgMC4w
MDAwMDBdICAgICAgICA0MTBjMmRmNSAgIChudWxsKSAgIChudWxsKSAgIChudWxsKSA0MjVjYzE1
MCAwMDAxM2VmZSAgIChudWxsKSA0MWMxMWYyOApbICAgIDAuMDAwMDAwXSBDUFU6IDAgUElEOiAw
IENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQgMy4xNy4wLW5leHQtMjAxNDEwMDggIzgxNQpbICAg
IDAuMDAwMDAwXSAgMDAwMDAwMDAgNDI1Y2MxMDEgNDFjMTFlNDggNDE4NTA3ODYgNDFjMTFlYTQg
NDFkMmIxZGIgNDFkOTVmNzEgMDAwMDAwMDYKWyAgICAwLjAwMDAwMF0gIDAwMDAwMDAwIGMwMDAw
MDAwIDAwMDAwMDAwIDQxYzExZWE0IDQyNWNjMTAxIDQxYzExZTk4IDAwMDAwMDdiIDAwMDAwMDdi
ClsgICAgMC4wMDAwMDBdICAwMDAwMDAwMSAwMDAwMDAwMCA0MWNkODE1MCAwMDAwMDAwNiAwMDAw
MDAwMCA0MTA3MjIyNyAwMDAwMDA2MCAwMDIxMDAwMgpbICAgIDAuMDAwMDAwXSBDYWxsIFRyYWNl
OgpbICAgIDAuMDAwMDAwXSAgWzw0MTg1MDc4Nj5dIGR1bXBfc3RhY2srMHgxNi8weDE4ClsgICAg
MC4wMDAwMDBdICBbPDQxZDJiMWRiPl0gZWFybHlfaWR0X2hhbmRsZXIrMHg2Yi8weDZiClsgICAg
MC4wMDAwMDBdICBbPDQxMDcyMjI3Pl0gPyBfX3BoeXNfYWRkcisweDJlLzB4Y2EKWyAgICAwLjAw
MDAwMF0gIFs8NDFkNGVlNGQ+XSBjbWFfZGVjbGFyZV9jb250aWd1b3VzKzB4M2MvMHgyZDcKWyAg
ICAwLjAwMDAwMF0gIFs8NDE4NTc5M2U+XSA/IF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSsw
eDU5LzB4OTEKWyAgICAwLjAwMDAwMF0gIFs8NDEwYzI5ODI+XSA/IHdha2VfdXBfa2xvZ2QrMHg4
LzB4MzMKWyAgICAwLjAwMDAwMF0gIFs8NDEwYzJkZjU+XSA/IGNvbnNvbGVfdW5sb2NrKzB4NDQ4
LzB4NDYxClsgICAgMC4wMDAwMDBdICBbPDQxZDZkMzU5Pl0gZG1hX2NvbnRpZ3VvdXNfcmVzZXJ2
ZV9hcmVhKzB4MjcvMHg0NwpbICAgIDAuMDAwMDAwXSAgWzw0MWQ2ZDRkMT5dIGRtYV9jb250aWd1
b3VzX3Jlc2VydmUrMHgxNTgvMHgxNjMKWyAgICAwLjAwMDAwMF0gIFs8NDFkMzNlMGY+XSBzZXR1
cF9hcmNoKzB4NzliLzB4YzY4ClsgICAgMC4wMDAwMDBdICBbPDQxODRjMGI0Pl0gPyBwcmludGsr
MHgxYy8weDFlClsgICAgMC4wMDAwMDBdICBbPDQxZDJiN2NmPl0gc3RhcnRfa2VybmVsKzB4OWMv
MHg0NTYKWyAgICAwLjAwMDAwMF0gIFs8NDFkMmIyY2E+XSBpMzg2X3N0YXJ0X2tlcm5lbCsweDc5
LzB4N2QKCkVsYXBzZWQgdGltZTogNQpxZW11LXN5c3RlbS1pMzg2IC1lbmFibGUta3ZtIC1rZXJu
ZWwgL2tlcm5lbC9pMzg2LXJhbmRjb25maWctaHhiMi0xMDA4LzA5OTY2OWVkOTUzMTIxZTFiMDAy
NDhmNjUzMjZiNmIwOTJmYTQ3Yzgvdm1saW51ei0zLjE3LjAtbmV4dC0yMDE0MTAwOCAtYXBwZW5k
ICd1c2VyPWxrcCBqb2I9L2xrcC9zY2hlZHVsZWQvdm0ta2J1aWxkLXlvY3RvLWkzODYtNTgvcmFu
ZF9ib290LTEteW9jdG8tbWluaW1hbC1pMzg2LmNnei1pMzg2LXJhbmRjb25maWctaHhiMi0xMDA4
LTA5OTY2OWVkOTUzMTIxZTFiMDAyNDhmNjUzMjZiNmIwOTJmYTQ3YzgtMC55YW1sIEFSQ0g9aTM4
NiBCT09UX0lNQUdFPS9rZXJuZWwvaTM4Ni1yYW5kY29uZmlnLWh4YjItMTAwOC8wOTk2NjllZDk1
MzEyMWUxYjAwMjQ4ZjY1MzI2YjZiMDkyZmE0N2M4L3ZtbGludXotMy4xNy4wLW5leHQtMjAxNDEw
MDgga2NvbmZpZz1pMzg2LXJhbmRjb25maWctaHhiMi0xMDA4IGNvbW1pdD0wOTk2NjllZDk1MzEy
MWUxYjAwMjQ4ZjY1MzI2YjZiMDkyZmE0N2M4IGJyYW5jaD1uZXh0L21hc3RlciByb290PS9kZXYv
cmFtMCBtYXhfdXB0aW1lPTM2MDAgUkVTVUxUX1JPT1Q9L3Jlc3VsdC92bS1rYnVpbGQteW9jdG8t
aTM4Ni9ib290LzEveW9jdG8tbWluaW1hbC1pMzg2LmNnei9pMzg2LXJhbmRjb25maWctaHhiMi0x
MDA4LzA5OTY2OWVkOTUzMTIxZTFiMDAyNDhmNjUzMjZiNmIwOTJmYTQ3YzgvMCBpcD06Ojo6dm0t
a2J1aWxkLXlvY3RvLWkzODYtNTg6OmRoY3AgZWFybHlwcmludGs9dHR5UzAsMTE1MjAwIGRlYnVn
IGFwaWM9ZGVidWcgc3lzcnFfYWx3YXlzX2VuYWJsZWQgcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90
aW1lb3V0PTEwMCBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmlj
IG9vcHM9cGFuaWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MCBjb25zb2xlPXR0eVMw
LDExNTIwMCBjb25zb2xlPXR0eTAgdmdhPW5vcm1hbCBydyBkcmJkLm1pbm9yX2NvdW50PTgnICAt
aW5pdHJkIC9mcy9zZGYxL2luaXRyZC12bS1rYnVpbGQteW9jdG8taTM4Ni01OCAtbSAzMjAgLXNt
cCAyIC1uZXQgbmljLHZsYW49MSxtb2RlbD1lMTAwMCAtbmV0IHVzZXIsdmxhbj0xIC1ib290IG9y
ZGVyPW5jIC1uby1yZWJvb3QgLXdhdGNoZG9nIGk2MzAwZXNiIC1ydGMgYmFzZT1sb2NhbHRpbWUg
LWRyaXZlIGZpbGU9L2ZzL3NkZjEvZGlzazAtdm0ta2J1aWxkLXlvY3RvLWkzODYtNTgsbWVkaWE9
ZGlzayxpZj12aXJ0aW8gLWRyaXZlIGZpbGU9L2ZzL3NkZjEvZGlzazEtdm0ta2J1aWxkLXlvY3Rv
LWkzODYtNTgsbWVkaWE9ZGlzayxpZj12aXJ0aW8gLWRyaXZlIGZpbGU9L2ZzL3NkZjEvZGlzazIt
dm0ta2J1aWxkLXlvY3RvLWkzODYtNTgsbWVkaWE9ZGlzayxpZj12aXJ0aW8gLWRyaXZlIGZpbGU9
L2ZzL3NkZjEvZGlzazMtdm0ta2J1aWxkLXlvY3RvLWkzODYtNTgsbWVkaWE9ZGlzayxpZj12aXJ0
aW8gLWRyaXZlIGZpbGU9L2ZzL3NkZjEvZGlzazQtdm0ta2J1aWxkLXlvY3RvLWkzODYtNTgsbWVk
aWE9ZGlzayxpZj12aXJ0aW8gLWRyaXZlIGZpbGU9L2ZzL3NkZjEvZGlzazUtdm0ta2J1aWxkLXlv
Y3RvLWkzODYtNTgsbWVkaWE9ZGlzayxpZj12aXJ0aW8gLXBpZGZpbGUgL2Rldi9zaG0va2Jvb3Qv
cGlkLXZtLWtidWlsZC15b2N0by1pMzg2LTU4IC1zZXJpYWwgZmlsZTovZGV2L3NobS9rYm9vdC9z
ZXJpYWwtdm0ta2J1aWxkLXlvY3RvLWkzODYtNTggLWRhZW1vbml6ZSAtZGlzcGxheSBub25lIC1t
b25pdG9yIG51bGwgCg==

--===============0524936713650361840==--

